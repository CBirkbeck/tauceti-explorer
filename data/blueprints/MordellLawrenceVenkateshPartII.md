# Roadmap: the Mordell conjecture after Lawrence and Venkatesh, Part II

**Summary.** Build the higher-dimensional period-map method once, then apply it in two geometric settings. The first application proves non-density of integral parameters for high-dimensional, high-degree projective hypersurfaces. The second proves Shafarevich finiteness up to rational translation for smooth ample hypersurfaces in abelian varieties. Compatible realizations connect complex periods, crystalline Frobenius and arithmetic Galois representations. The central geometric estimate bounds semibalanced filtrations with a prescribed associated graded; torsion-character monodromy supplies enough independent directions in the abelian application.

## Scope and ownership

The parent **MordellLawrenceVenkatesh**, especially LV.0–LV.2, supplies semilinear linear algebra, Faltings’s GL finiteness lemma and the global pure-character Hodge-weight theorem. This continuation owns the coefficient-normalizer specialization, compatible systems assembled from existing realizations, strong monodromy balance, the balanced-type incidence estimates, and the two higher-dimensional applications. Its layers M2.0–M2.10 merge all 39 Lawrence–Sawin and 22 Lawrence–Venkatesh routed targets. No second Part II is needed for the projective application.

**SheafConvolutionOnAbelianVarieties** owns character sheaves, convolution, classical hypersurface monodromy, the exceptional-degree recurrence and conjugate-uniform torsion-orbit selection. In particular SC.5’s recurrence is imported unchanged: pairs start at (1,5), (5,20), (20,76), and D_j=binomial(a_j+b_j,a_j)/6 for j≥1; D_1=8855. This document uses that sequence and does not construct another one. **ClassicalArithmeticCompletion CA.2** owns the generic Eulerian sequence. **AbelianSchemesAndArithmeticModuli A6** owns finite-rank Hom groups, Rosati positivity and Weil restriction. **ReductiveGroups**, including its current dynamic functors and root/Bruhat theory, owns the general group foundations. The nine newer upstream roadmap directions named in WORKERS were screened; no vector-bundle, topology or general algebraic-group foundation is reconstructed here.

The statements below are proof targets. External contracts and unresolved extensions are stated explicitly. In particular a completed mathematical specification is not a claim that the dependency graph is closed or that the theorems are implemented.

## Conventions

A number-field model is fixed over O_K[S⁻¹]. Rational-base non-density theorems use a smooth geometrically connected X/Q of positive dimension. Enlarge S only by a stated finite set, and distinguish this harmless reduction of the arithmetic problem from changing the base field. A p-adic residue disk is taken at a smooth good-reduction point. A field isomorphism Q̄_p≅C is used on formal coefficients, never as a continuous map.

Filtrations F are decreasing and gr^a_F=F^a/F^(a+1). Auxiliary increasing flags f have gr_k^f=f_k/f_(k−1). A cocharacter μ gives F^a=⊕_(j≥a)V_j. The adjoint profile is h^a=dim gr^a Lie(H); D=Σh^a, A=Σ_(a>0)h^a and B=Σ_(a>0)a h^a. The function T sums the largest weights **with multiplicity**, with linear interpolation on [0,D]. In the coefficient theorem h and T always belong to a single classical factor H; restriction of scalars of degree d scales them by h_Res=d h and T_Res(dx)=dT(x).

For Hodge–Tate signs, distinguish the arithmetic convention HT(χ_cyc)=+1 from the de Rham filtration of Q_p(1), whose jump is −1. Geometric Frobenius on Q_p(−1) is q and its de Rham jump is +1. The SC.3 torsion-twist multiplicities d·A(n,q) occur at HT weight −q in the arithmetic convention and at descending de Rham degree q. Global pure Weil weight w gives average de Rham weight w/2 over Q. This conclusion is not embeddingwise valid over an arbitrary CM field.

The modular character is δ_P⁻¹=det(Ad|Lie P)⁻¹. For upper triangular GL₂ it is diag(a,b)↦a⁻¹b; semibalance means its cocharacter pairing is ≤0. For a hypersurface in an n-dimensional abelian variety the middle degree is n−1: an inversion pairing is alternating when n is even and symmetric when n is odd. N=n!d, where d=φ^n/n! is normalized degree. In the projective application n denotes ambient dimension, again giving middle degree n−1. Its parameter dimension is binomial(n+d,d)−1.

## Exact supplier contracts


The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The current Tau Ceti checkout was also screened at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current availability was not substituted for the pinned elaboration baseline.

From the pinned libraries, `mathlib:Finsupp` in `Mathlib/Data/Finsupp/Defs.lean` supplies Finitely supported functions, with explicit finite support and membership equivalence; used for integer-indexed natural Hodge multiplicities.

From the pinned libraries, `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing` in `Mathlib/RingTheory/Filtration.lean` supplies In a Noetherian local ring, the intersection of powers of a proper ideal is zero; apply in localized Tate-algebra quotients in the transfer argument.

From the pinned libraries, `tauceti:TauCeti.Cocharacter.parabolic` in `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` supplies The dynamic parabolic subgroup functor defined by the conjugation limit condition on Hopf-algebra points; no second construction is planned.

From the pinned libraries, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv` in `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean` supplies For a commutative Hopf algebra over a field, points identify as a group with tensor automorphisms of the finite-generated comodule scalar-extension functor. This is not the arbitrary fibre-functor torsor theorem.

The existing exact-node imports include the parent GL finiteness and pure-character weight nodes; SC.0 rank-one characters, SC.2 base extension, SC.3 Eulerian/HT calculations, SC.4 inversion duality, SC.5 exceptional degrees, SC.6 classical monodromy and SC.8 orbit-uniform monodromy; A6 quasi-projective and finite-étale abelian Weil restriction, finite Hom rank and Rosati positivity; RP.1 weak Mordell–Weil; and R06.2 admissible tensor exactness plus R06.4’s shifted Fontaine–Laffaille consequences. These carry their written hypotheses, including all supplier gaps.

Geometric weights come from **DWP.4/smooth-projective-purity**; integer degree factors come from **WC.3/integral-factors-and-ell-independence-from-purity**. **WC.5/complete-intersection-point-count** and **EDC.4/complete-intersection-cohomology** supply the ambient-Tate trace cancellation and rational primitive summand. Definitions of Weil weights are imported from the exact DWP.0 nodes. Hodge **H.2/geometric-pure**, **H.2/gauss-manin**, the compact-dual/orbit/holomorphic-map nodes of **H.3**, and the three proper-comparison/compatibility nodes of **R06.5** are used directly. The exact CA.2 Eulerian nodes, Hilbert scheme, resolution, abelian Néron–Severi/degree and finite-quotient nodes, A6 restriction functor and separable splitting, and LPV.2–5 nodes are dependencies below. Their recorded supplier gaps continue to apply.

From **ComplexComparisonPartII:C0**, use the following precise contract. For convergent complex power-series germs, the ideal of the zero-set germ is the radical; combine this local analytic Nullstellensatz with the existing Weierstrass preparation/division and Noetherianity. No algebraic or rigid-analytic Nullstellensatz is substituted.

From **HodgeStructuresPartII:H.2**, use the following precise contract. Compatible pure/mixed variations and fibrewise strict Hodge morphisms for the system category; additionally André normality of connected geometric monodromy in the derived generic Mumford–Tate group for pure polarizable integral variations on the stated connected algebraic base. Existing H.2/geometric-pure and /gauss-manin are imported directly. H.2/connected-semisimple alone proves semisimplicity, not this normality theorem.

From **PadicHodgeTheory:P8**, use the following precise contract. Use the existing early local/rational period and Poincaré inputs before CohomologyComparisons CP.3, and its proper-comparison suffix after CP.3/CP.4. Supply the relative structural O B_cris comparison with connection and the filtered F-isocrystal for the good-reduction finite-cover cohomology systems here. The current B_dR and Shimizu horizontal nodes do not alone state the required general relative crystalline comparison; coalesce the pending RelativeCrystallineLocalSystems route rather than duplicate it.

From **PadicHodgeTheory:R06.2**, use the following precise contract. A tensor-compatible Sen/Wintenberger splitting placing the Hodge cocharacter in the algebraic local Galois image. Import the existing admissible-category tensor theorem directly for exact D_cris/D_dR and coefficient operations; it does not by itself prove the cocharacter-image theorem.

From **MotivesAndAlgebraicCycles:MC.6**, use the following precise contract. For any neutral Tannakian category over a field and two fibre functors, Iso^⊗(ω,η) is represented by a faithfully flat torsor under Aut^⊗(ω); for a finite tensor generator it is finite type and has a point over an algebraic closure. Existing MC.6/tensor-iso-scheme and /iso-torsor are for a particular graded diagram and are not this general theorem.

From **ClassicalArithmeticCompletion:CA.2**, use the following precise contract. Extend the existing exact Eulerian-number and basic-identity nodes by the one-copy centered variance (n+1)/12 and finite-sequence log-concavity on contiguous support, including preservation under reflection and convolution. The written unimodality node is weaker than log-concavity. Inclusion–exclusion follows from the imported recurrence/Worpitzky identity. The central-limit theorem remains a separately recorded Part II gap.

From **AlgebraicModuliForArithmeticGeometry:R09.2**, use the following precise contract. Beyond the imported fixed-polynomial Hilbert scheme, supply its smooth effective Cartier-divisor open, the specified numerical-class components and universal families spread over finite localizations. Also route the graded regular-sequence Hilbert-series calculation for the projective Jacobian formula to its general commutative-algebra owner.

From **AlgebraicModuliForArithmeticGeometry:R09.7**, use the following precise contract. Spread the proper characteristic-zero resolution from the imported local-isomorphism-resolution node over a finite localization, retaining its isomorphism on the chosen dense smooth open. Rational lifts are used only on that open.

From **AbelianSchemesAndArithmeticModuli:A1**, use the following precise contract. Abelian scheme models, proper translations extending rational sections, rigidity and decomposition of maps as translation plus a homomorphism, with their base hypotheses.

From **AbelianSchemesAndArithmeticModuli:A2**, use the following precise contract. Polarizations, numerical divisor classes, Picard components, intersection theory and ampleness; use the degree and translation-invariance formulas on smooth ample divisors.

From **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory**, use the following precise contract. Use the existing absolute root, Weyl, dynamic parabolic/Levi, common torus and Bruhat structure theory in characteristic zero. The coefficient-normalizer specialization and its filtered objects are targets here. The disconnected complete-reducibility/rational-conjugacy extension is a recorded gap, not supplied by connected root theory.

From **tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras**, use the following precise contract. Use current AdicSpaces §0.5 restricted-series substitution/evaluation, Weierstrass division/preparation and Noetherianity of K⟨T₁,…,T_m⟩ over a complete rank-one nonarchimedean field; quotients and localizations are Noetherian. These are the affinoid algebra inputs to finite minimal-prime decomposition and localized Krull intersection.

### Supplier extensions that remain necessary

**Relative crystalline coefficient comparison.** P8 does not yet state a general structural O B_cris comparison for the relative coefficient systems of LS 5.2 and arbitrary coefficient pushforward in Example 5.10. The finite-cover projector route reduces the actual application to constant proper cohomology, but its relative connection/Frobenius comparison still needs the exact P8 suffix theorem. Preserve the CP.3/CP.4 dependency direction.

**General tensor-isomorphism torsor.** MC.6 supplies neutral reconstruction, but its written tensor-isomorphism nodes concern a particular graded diagram. Add the general neutral-fibre-functor torsor and its algebraically closed trivialization, then the crystalline specialization is M2.7.

**Disconnected complete reducibility and rational global types.** The coefficient normalizer can have disconnected GO factors. Prove minimal Richardson-parabolic semisimplification with rational conjugacy/continuity, and finite rational orbit splitting for p-adic centralizers. The parent GL finiteness result and the Langlands Weil-parameter stages do not establish these statements. LS 5.49 repairs the old connected-image reduction but treats its symbol G⁰ as connected even in an even orthogonal similitude case; retain the component correction.

**Pure integral period-map Ax–Schanuel supplier.** The paper route proposes LogicAndDefinabilityPartII, not yet an actual roadmap or reserved stage. Route the pure polarized integral Bakker–Tsimerman theorem there, with the monodromy-orbit form used in M2.3. Hodge H.7 definability and LD.6 counting do not state this theorem. This roadmap owns only its codimension consequence and p-adic transfer.

**Eulerian central limit supplier.** CA.2 owns the common Eulerian sequence and exact algebraic formulas; its current stage does not state a central limit theorem. Extend that direction in ClassicalArithmeticCompletion, Part II, coordinated with its probability supplier, to provide centered ascent CLT and uniform second moments. M2.8 owns the adjoint/tail adapter, not a second general convergence-in-law development.

**Katz–Messing and correspondence rationality.** Supply characteristic-polynomial agreement for crystalline and auxiliary-prime étale cohomology of smooth proper finite-field varieties, compatible with primitive projectors, and the fixed-point trace formula for deck correspondences composed with Frobenius. Degree-one A4 exports do not cover primitive hypersurface middle cohomology. Route the full higher-degree input with the cohomology/weight owners.

**Orthogonal universal-hypersurface monodromy.** LPV.5 already has open symplectic monodromy and a conditional orthogonal open-or-finite node. Reuse those nodes; the extension still needed is to exclude finite orthogonal monodromy for universal hypersurfaces and provide Beauville’s arithmetic finite-index theorem with its exceptions. Route only that extension to LefschetzPencilsAndVanishingCycles, Part II. M2.9 applies it in the safe n≥4,d≥4 range.

**Curve Shafarevich consequence.** R28.5 gives polarized abelian-variety Shafarevich finiteness. To use it for curves, supply Torelli with field descent and good-reduction comparison for their canonical principally polarized Jacobians. JacobianChallenge constructs Jacobians and their universal property, not Torelli; RP.4 explicitly leaves its curve Shafarevich assumption conditional. Route this consequence with the curve/arithmetic-moduli owner, rather than import rational-point finiteness as if it were curve-isomorphism finiteness.

**Number-field subvarieties in the stronger finiteness clause.** The original LV all-subvarieties clause needs the non-density theorem over fields of definition of closure components, or a restriction-of-scalars formulation preserving the required monodromy and numerical bound. This clause is stated with that arithmetic comparison as a hypothesis; generic monodromy alone proves only non-density.

**Further extensions of written supplier contracts.** ComplexComparisonPartII C0 states Weierstrass division/preparation and Noetherianity but not the local analytic Nullstellensatz requested here. PadicHodgeTheory R06.2 supplies admissible tensor categories but not the requested tensor-compatible Sen/Wintenberger cocharacter-image theorem. AlgebraicModuliForArithmeticGeometry R09.2 supplies Hilbert/Quot representability but not the graded regular-sequence Hilbert-series calculation. These are explicit requested extensions at their owners, not consequences of the currently written supplier statements. HodgeStructuresPartII H.2/connected-semisimple does not supply André normality in the generic Mumford–Tate group. CA.2/eulerian-unimodal supplies only unimodality; exact centered variance, Eulerian log-concavity and reflection/convolution closure remain requested extensions. Keep these extensions in the corresponding precise requests.

## How to read the build

Layers 0–2 assemble realizations and coefficients and identify the groups whose filtrations are relevant. Layer 3 proves the shared period-codimension transfer. Layer 4 proves the semisimple case and isolates strong balance; Layer 5 handles the associated graded of nonsplit representations, leading to the all-points theorem in Layer 6. Layer 7 recovers the published higher-dimensional LV theorem through its distinct small-prime argument. Layer 8 supplies both numerical applications, and Layers 9–10 finish the projective and abelian-hypersurface arguments. The numerical layer can be developed alongside the group theory once its supplier contracts are fixed.

## Layer 0: Compatible Hodge–Deligne realizations

Assemble the four compatible realizations, their tensor category, geometric projector systems, differential monodromy and fixed Frobenius data on residue disks.

### 0.1 Hodge–Deligne systems

Fix a number field K, an embedding K→C, a smooth geometrically connected K-variety X with smooth model 𝓧/O_K[S⁻¹], and a rational prime p below no place of S, unramified in K, with v|p. A Hodge–Deligne system consists of a finite-rank Q local system on X(C), a continuous Q_p local system on 𝓧[1/p], a filtered finite locally free bundle with integrable connection on X, and a filtered F-isocrystal on the v-adic tube, with Betti–étale, Betti–de Rham, crystalline–de Rham and structural O B_cris comparisons. These preserve tensor operations, connection, filtrations and a finite weight filtration W. Require regular singularities, Griffiths transversality and fibrewise pure Hodge and Weil-weight conditions on gr_W. Rational Weil numbers need not be integral; polarization and a Z-lattice are additional conditions.

(LS: Definition 5.2, pp. 40–42.)

Use the supplied local systems, connections and F-isocrystals; form the category of tuples with the four actual comparison isomorphisms. Impose finite filtrations, transversality, regularity and purity fibrewise; identify all comparison diagrams, including the structural period-sheaf connection.

The working interface consists of the following named declarations.

- `HodgeDeligneSystem.mk`: Construct a tuple from the four realizations and compatible comparison data.
- `HodgeDeligneSystem.realization`: Expose each realization with its connection, Frobenius and finite filtrations.
- `HodgeDeligneSystem.comparison_naturality`: Every comparison commutes with specified pullback and tensor maps of the supplied realization categories.

Use in LS Theorems 6.4 and 8.17: Relates complex periods, p-adic periods and arithmetic fibre representations.

**Checks.**

- `hodge-deligne-system.1`: The rational constant unit has rank one and only Hodge and weight index zero.
- `hodge-deligne-system.2`: The dual Tate system is permitted even when its Frobenius eigenvalues have denominators.
- `hodge-deligne-system.3`: A filtered connection violating ∇F^a⊆F^(a−1)⊗Ω¹ is rejected despite matching fibre dimensions.

The acceptance check is: All four realizations have the same rank. Do not infer a polarization or an integral lattice from the basic definition.

*Needs:* `ComplexComparisonPartII:C5/regular-singular-connection`, `ComplexComparisonPartII:C5/deligne-regular-singular-equivalence`, `HodgeStructuresPartII:H.2`, `PadicHodgeTheory:P8`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`.

### 0.2 Integral and polarized systems

For a Hodge–Deligne system, integral means a locally constant finite free Z lattice in its Betti realization spanning it over Q. Polarized means pure of a specified weight and equipped with a flat rational bilinear polarization of its variation of Hodge structure. Integral Frobenius means that, at every relevant closed point away from S and p and in the crystalline realization, Frobenius eigenvalues are algebraic integers. These are three separate predicates; integral Frobenius is not preserved by arbitrary duals.

(LS: Definitions 5.3–5.5, p. 42.)

Transport the lattice and pairing through the comparison maps without conflating a rational polarization with integrality of the pairing. State integral Frobenius using the integral Weil predicate supplied by DWP.0.

The working interface consists of the following named declarations.

- `HodgeDeligneSystem.integral_lattice`: Return the chosen lattice and its rational comparison.
- `HodgeDeligneSystem.polarization`: Return the weight and flat bilinear form satisfying the Hodge positivity relations.
- `HodgeDeligneSystem.integral_frobenius_subquotient`: Integral eigenvalues pass to invariant subobjects and quotients through characteristic-polynomial factorization.

Use in LS 6.4: Supplies the integral polarized pure variation required by Ax–Schanuel. Use in LS 5.49 and 8.17: Supplies the arithmetic integrality required for finite global types.

**Checks.**

- `integral-polarized-system.1`: The unit is integral, polarized and integral-Frobenius.
- `integral-polarized-system.2`: The Tate object with geometric Frobenius q has integral eigenvalues, but its dual with eigenvalue q⁻¹ does not.
- `integral-polarized-system.3`: A rational local system with monodromy multiplication by 2 has no finite free Z lattice stable under the full group action.

The acceptance check is: The category of all systems remains dual-closed; its integral-Frobenius subcollection need not be.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/hodge-deligne-system`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`.

### 0.3 Tensor category of compatible systems

Over the fixed connected base of M2.0, morphisms are maps of all four realizations compatible with W, F, connection, Frobenius and all comparisons. With componentwise tensor products, duals, direct sums and the unit, Hodge–Deligne systems form a Q-linear neutral Tannakian category under evaluation of the Betti realization at a chosen complex point. Prove strictness of the filtrations and that the componentwise kernels and cokernels again satisfy the axioms; do not treat arbitrary filtered vector spaces as an abelian category.

(LS: Definition 5.11, p. 43, and Lemma 5.12, p. 44.)

Use strictness of Hodge morphisms and the exact admissible realization functors to construct kernels and cokernels with their comparisons. Use geometric connectedness for faithfulness of fibre evaluation; verify rigidity and End(unit)=Q before invoking MC.6.

The working interface consists of the following named declarations.

- `HodgeDeligneSystem.hom_ext`: Compatible morphisms are equal if their Betti maps are equal.
- `HodgeDeligneSystem.fibre`: Betti fibre is exact faithful Q-linear symmetric monoidal.
- `HodgeDeligneSystem.tensor_realization`: Each realization of a tensor or dual is naturally its supplied tensor or dual.

Use in LS 5.14, 5.22 and 5.38: Makes algebra objects, module objects and tensor G-structures meaningful.

**Checks.**

- `system-tannakian-category.1`: A scalar acts identically under each comparison of the unit.
- `system-tannakian-category.2`: The map of systems zero on one connected component but nonzero on another defeats faithfulness when connectedness is removed.
- `system-tannakian-category.3`: Kernels of morphisms of pure Hodge systems carry the induced strict Hodge filtration, not an arbitrary chosen filtration.

The acceptance check is: On a disconnected base a fibre on one component is not a faithful functor on all components.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/hodge-deligne-system`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `HodgeStructuresPartII:H.2`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`.

### 0.4 Constant arithmetic systems

A constant Hodge–Deligne system on 𝓧 is a pullback of a system over Spec O_K[S⁻¹]. The trivial coefficient system O_E for a finite-dimensional Q-algebra E has constant Betti E, trivial arithmetic Galois action on E⊗Q_p, trivial connection and degree-zero Hodge filtration, and Frobenius 1_E⊗σ_v. A constant arithmetic system may have nontrivial arithmetic Galois action; constancy here means trivial geometric variation.

(LS: Examples 5.8–5.9, p. 43; Definition 5.13, p. 44.)

Pull back the four realizations and the comparison maps from the arithmetic point. Distinguish this pullback construction from the particular trivial coefficient unit.

The working interface consists of the following named declarations.

- `HodgeDeligneSystem.constant_pullback`: Pull back an arithmetic-point system along 𝓧→Spec O_K[S⁻¹].
- `HodgeDeligneSystem.trivial_coefficients`: O_E has the explicitly trivial coefficient Galois action.
- `HodgeDeligneSystem.constant_geometric_monodromy`: Every pullback from the arithmetic point has trivial geometric monodromy, without forcing its arithmetic representation trivial.

Use in LS 5.14 and 5.29: Coefficient algebras are constant arithmetic systems, though their arithmetic descent is nontrivial.

**Checks.**

- `constant-system.1`: O_Q is the tensor unit.
- `constant-system.2`: The H⁰ system of a non-split finite étale K-algebra is constant on X but can have nontrivial arithmetic permutation action.
- `constant-system.3`: A nonconstant polarized variation with nontrivial geometric monodromy is not constant.

The acceptance check is: Geometric monodromy is trivial for every constant system.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`.

### 0.5 Geometric cohomology and projectors

For a smooth projective morphism f:Y→X extending smoothly and projectively over the model, construct the compatible system R^k f_*Q using Betti, étale, algebraic de Rham and crystalline cohomology. A compatible finite-group idempotent in the rational endomorphisms cuts out a direct-summand system; intersect its rational Betti image with an integral cohomology lattice modulo torsion to obtain a spanning lattice. Pure cohomological systems are polarized and have integral Frobenius eigenvalues. The general coefficient pushforward in LS Example 5.10 additionally requires a relative coefficient-comparison theorem, recorded as a gap rather than inferred from constant coefficients.

(LS: Example 5.10, p. 43; proof of Lemma 5.29, pp. 49–51.)

Construct the four usual cohomology objects and use the supplied proper comparison maps, including connection and filtration compatibility. Use the algebraic finite-group action to identify the same projector in each realization; inherit purity and restrict a positive polarization to the summand.

The working interface consists of the following named declarations.

- `GeometricSystem.cohomology`: Return degree-k cohomology with its four comparisons.
- `GeometricSystem.projector`: Take the image of one compatible rational idempotent in all realizations.
- `GeometricSystem.projector_comparison`: Each projector image commutes with realization and scalar extension.

Use in LS 5.29: Constructs twisted hypersurface cohomology from multiplication-cover cohomology.

**Checks.**

- `geometric-cohomology-system.1`: For f=id and k=0 recover the constant unit.
- `geometric-cohomology-system.2`: For a double cover the projector (1−τ)/2 gives the anti-invariant rational summand even though division by 2 does not preserve its original Z lattice.
- `geometric-cohomology-system.3`: The zero projector yields rank zero and the identity projector recovers the original system.

The acceptance check is: A rational projector need not preserve the original integral lattice; intersection, not integral application of the projector, constructs the new lattice.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`, `MordellLawrenceVenkateshPartII:M2.0/integral-polarized-system`, `ComplexComparisonPartII:C5/gauss-manin-connection`, `PadicHodgeTheory:P8`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `HodgeStructuresPartII:H.2/geometric-pure`, `HodgeStructuresPartII:H.2/gauss-manin`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`, `PadicHodgeTheory:R06.5/geometric-period-functoriality-duality-twists`.

### 0.6 Differential monodromy from a tensor generator

Let V be a system on a smooth geometrically connected X/K with chosen K-rational fibre point, or after a stated finite extension supplying one. Define G_mon as the tensor automorphism group of the fibre functor on the rigid abelian tensor category generated by (V_dR,∇). Regular-singular Riemann–Hilbert identifies its base change to C with the Zariski closure of Betti geometric monodromy on V. Transport between fibre choices is by the tensor-isomorphism torsor, so the resulting groups are defined up to inner identification; no unrelated Picard–Vessiot theory is developed.

(LS: Definition 5.6 and following discussion, pp. 42–43.)

Use neutral reconstruction on the tensor category generated by the regular connection. Apply exact tensor Riemann–Hilbert and the tensor-invariant characterization of the Zariski closure; descend the tensor category over K.

The working interface consists of the following named declarations.

- `DifferentialMonodromy.group`: Affine finite-type group with its faithful representation on the chosen fibre.
- `DifferentialMonodromy.change_fibre`: A tensor-isomorphism transports the group by conjugacy.
- `DifferentialMonodromy.betti_comparison`: Over C the faithful representation has group equal to the algebraic closure of geometric Betti monodromy.

Use in LS 6.1, 6.2 and 6.8: Defines the group governing the period orbit and balanced index classes.

**Checks.**

- `differential-monodromy.1`: A constant system has trivial geometric group, even with nontrivial arithmetic Galois action.
- `differential-monodromy.2`: A rank-two system with Zariski-dense SL₂ monodromy has group SL₂ rather than GL₂.
- `differential-monodromy.3`: For a system with finite nontrivial monodromy the whole finite group is retained, not merely its identity component.

The acceptance check is: Specify the finite extension if X(K) is empty; do not silently choose a K-rational base point.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `ComplexComparisonPartII:C5/deligne-regular-singular-equivalence`, `MotivesAndAlgebraicCycles:MC.6`.

### 0.7 Constant Frobenius data on a residue disk

On a smooth v-adic residue disk Ω of a system, parallel transport of its convergent F-isocrystal identifies all underlying crystalline pairs with one finite-dimensional (V,φ), with φ semilinear for the residue Frobenius. Its Hodge filtrations F_x vary analytically, giving Φ_p:Ω→Flag(V). This is a local statement on the tube with compatible Frobenius transport, not a globally constant crystal.

(LS: Remark 5.7, p. 43; Theorem 8.17 proof, pp. 83–84.)

Use crystal transport and its Frobenius compatibility on a fixed residue tube. Use the horizontal crystalline–de Rham comparison to transport the varying filtration into a fixed flag space.

The acceptance check is: For a nonisotrivial abelian family the pair is locally fixed while the Hodge line can vary.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/hodge-deligne-system`, `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`.

### Examples

A constant arithmetic H⁰ system can have nontrivial finite Galois permutation action while geometric monodromy is trivial. The anti-invariant projector (1−τ)/2 on a double cover illustrates why its integral lattice is an intersection with a rational image, rather than the image of the old lattice.

### Dependencies

`ComplexComparisonPartII:C5/deligne-regular-singular-equivalence`, `ComplexComparisonPartII:C5/gauss-manin-connection`, `ComplexComparisonPartII:C5/regular-singular-connection`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.2/gauss-manin`, `HodgeStructuresPartII:H.2/geometric-pure`, `MotivesAndAlgebraicCycles:MC.6`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`, `PadicHodgeTheory:R06.5/geometric-period-functoriality-duality-twists`, `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`.

## Layer 1: Arithmetic coefficient systems

Build H⁰-algebras, module and classical structures, torsion-character orbit cohomology and its polarization. Prove rational Frobenius characteristic polynomials for the geometric orbit system as a separate arithmetic input.

### 1.1 Étale H⁰-algebras

An H⁰-algebra is a commutative unital algebra object E in the system category, pure of weight zero with F⁰E_dR=E_dR and F¹E_dR=0. It is étale when its Betti Q-algebra is finite étale. In the arithmetic argument require E to be constant in the arithmetic-pullback sense. Its étale realization can have a nontrivial finite Galois permutation action.

(LS: Definitions 5.14 and 5.16, p. 45.)

Use the tensor category for multiplication and unit and impose the algebra identities in each realization. Define étaleness through the Betti algebra and transfer it through the comparisons.

The working interface consists of the following named declarations.

- `H0Algebra.unit_mul`: The realization maps preserve the algebra unit and multiplication.
- `H0Algebra.etale_realization`: Every field-valued realization of an étale H⁰-algebra is finite étale.
- `H0Algebra.pullback`: Pullback preserves the algebra structure, Hodge type and étaleness.

Use in LS 5.22, 5.29 and 5.31: Packages the coefficient idempotents and the Frobenius permutation of factors.

**Checks.**

- `h0-algebra.1`: Q×Q with the two idempotents is étale.
- `h0-algebra.2`: Q[ε]/ε² is an H⁰-algebra but is not étale.
- `h0-algebra.3`: A rank-two permutation algebra from a quadratic extension is constant on X but need not be O_(Q×Q) with trivial arithmetic action.

The acceptance check is: Separate finite étale algebras from arbitrary finite-dimensional commutative algebras.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`, `MordellLawrenceVenkateshPartII:M2.0/constant-system`.

### 1.2 Finite étale coefficient operations

Construct H⁰-algebras from the trivial algebra O_E, the rational group algebra Q[B] of a finite abelian group B, the convolution dual of the function algebra on a finite étale commutative group scheme, R⁰ of a proper smooth family, and pushforward along a finite étale base map. In the finite-monodromy case define crystalline realization by D_cris of the actual Galois representation. If K_v/Q_p is unramified of degree f, its semilinear Frobenius satisfies φ^f equal, under the unramified comparison, to the representation action of geometric Frobenius; the naive formula using the same residue-Frobenius action on both factors is not imposed.

(LS: Examples 5.15 and 5.17–5.21, pp. 45–47.)

Use group multiplication for the convolution dual, ordinary multiplication or cup product for the other algebra structures, and finite étale pushforward for descent. Construct the crystalline component through the invariants functor, then compute its f-th iterate rather than prescribing a false semilinear formula.

The working interface consists of the following named declarations.

- `H0Algebra.finite_etale_pushforward`: Finite étale pushforward carries a coefficient algebra and its descent action.
- `H0Algebra.crystalline_frobenius_iterate`: On the unramified degree-f crystalline fibre φ^f matches the specified residue Frobenius action.
- `H0Algebra.group_algebra_realization`: The Betti realization of the group-algebra construction is exactly Q[B], with its usual basis and multiplication.
- `H0Algebra.finite_group_scheme_convolution`: For finite étale commutative B, the coefficient algebra is O(B)∨ with multiplication dual to the group-law comultiplication; for constant B its rational realization is Q[B].

Use in LS 5.29: Supplies the actual descent algebra and its semilinear crystalline action.

**Checks.**

- `h0-algebra-operations.1`: For B cyclic of order two, Q[B] splits as Q×Q over Q.
- `h0-algebra-operations.2`: Over an unramified quadratic p-adic field a rank-two unramified representation whose residue Frobenius swaps factors must retain this swap in φ²; a formula with φ²=id is rejected.
- `h0-algebra-operations.3`: The pushforward of the unit under a split two-sheeted étale cover has rank two, not rank one.
- `h0-algebra-operations.4`: For constant cyclic B of order three, the convolution dual is Q[C₃]≅Q×Q(ζ₃); the pointwise function algebra Q³ is a different Q-algebra.

The acceptance check is: Check geometric versus arithmetic Frobenius once against the conventions of DWP.0 and use the chosen geometric action consistently.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/h0-algebra`, `MordellLawrenceVenkateshPartII:M2.0/geometric-cohomology-system`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`.

### 1.3 Modules over coefficient algebras

An E-module system is a system V with a unital action E⊗V→V compatible with the four realizations. Define E-linear maps and the relative tensor product as the cokernel of the two E-actions on V⊗E⊗W; for finite étale E this is exact in either module argument. A bilinear pairing valued in an invertible rank-one E-module L is E-balanced when B(ev,w)=B(v,ew).

(LS: Definition 5.22 and Remark 5.23, p. 47.)

Define module objects using the existing tensor category; construct the relative tensor via its coequalizer. Verify each comparison descends to the coequalizer and use finite étale semisimplicity for exactness.

The working interface consists of the following named declarations.

- `CoefficientModule.action`: The E action is unital and associative in every realization.
- `CoefficientModule.tensor_lift`: An E-balanced system morphism V⊗W→Z factors uniquely through V⊗_E W.
- `CoefficientModule.realization_tensor`: Realization of V⊗_E W is the ordinary relative tensor product of the corresponding E-modules.

Use in LS 5.27 and 5.30: Provides the linearity convention for classical forms.

**Checks.**

- `coefficient-module.1`: For E=Q recover ordinary tensor products.
- `coefficient-module.2`: For E=Q×Q, (V₁,V₂)⊗_E(W₁,W₂)=(V₁⊗W₁,V₂⊗W₂), with no cross terms.
- `coefficient-module.3`: The pairing B(v,w)=v·ι(w) for a nontrivial involution ι of E is not E-balanced under the displayed definition.

The acceptance check is: Keep E-balanced distinct from sesquilinear pairing with coefficient involution.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/h0-algebra`, `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`.

### 1.4 Equidimensional coefficient modules

For a finite étale E over a field E₀, V is equidimensional of rank N when V⊗_(E,τ)Ē₀ has dimension N for every embedding τ:E→Ē₀. For a system require the same condition on its realizations; equivalently each is a free E-realization module of rank N. This is not constancy of the total E₀-dimension alone.

(LS: Definitions 5.24–5.25 and Lemma 5.26, pp. 47–48.)

Split E into field factors and compare ranks after a common algebraic closure. Use the realization comparisons to transport the common rank.

The working interface consists of the following named declarations.

- `CoefficientModule.rank_at_embedding`: Each geometric coefficient idempotent has rank N.
- `CoefficientModule.equidimensional_iff_free`: For finite étale E the condition is equivalent to E-module freeness of rank N.
- `CoefficientModule.equidimensional_base_change`: Finite scalar extension preserves the common rank.

Use in LS 5.29 and 5.46: Ensures the same standard group and Hodge row on every coefficient factor.

**Checks.**

- `equidimensional-module.1`: For E=Q×Q, ranks (2,2) give rank N=2.
- `equidimensional-module.2`: Ranks (1,3) have the same total dimension four but fail equidimensionality.
- `equidimensional-module.3`: The zero module is equidimensional of rank zero; positivity is an additional hypothesis in the geometric application.

The acceptance check is: Total dimension equals N[E:E₀].

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/coefficient-module`.

### 1.5 General linear, symplectic and orthogonal structures

For an equidimensional E-module V of positive rank N, a GL_N structure is its E-linear structure alone. A GSp_N structure is a perfect alternating E-bilinear pairing V⊗_E V→L with L invertible of E-rank one, requiring N even. A GO_N structure uses a perfect symmetric pairing into such an L. Isomorphisms include the compatible similitude on L. Keep the whole orthogonal similitude group, which need not be connected.

(LS: Definition 5.27, p. 48.)

Use rank-one E-module coefficients for the value line, not a line of rank one over E₀. Define isomorphisms of paired modules and identify the split standard automorphism groups after choosing bases.

The working interface consists of the following named declarations.

- `ClassicalCoefficientStructure.pairing`: Expose the perfect E-bilinear pairing and the E-rank-one value line.
- `ClassicalCoefficientStructure.isomorphism`: Isomorphisms are E-linear isometries up to an invertible line map.
- `ClassicalCoefficientStructure.split_standard`: After trivializing V and L the automorphism group is the supplied standard GL, GSp or GO group.

Use in LS 5.31, 5.43 and 8.17: Specifies both the semilinear normalizer and the form constraints on filtered Frobenius data.

**Checks.**

- `classical-coefficient-structure.1`: A symplectic rank-two E-module gives GSp₂=GL₂ with the determinant multiplier.
- `classical-coefficient-structure.2`: No perfect alternating form exists in odd rank in characteristic zero.
- `classical-coefficient-structure.3`: A perfect E-valued symmetric form with E=Q×Q has a value line of Q-dimension two, so a Q-rank-one line is the wrong carrier.

The acceptance check is: A split GO_(2r) group has two components; no connectedness follows from its reductive identity component.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/coefficient-module`, `MordellLawrenceVenkateshPartII:M2.1/equidimensional-module`.

### 1.6 Finite-order character systems

Let A be an abelian scheme over O_K[S⁻¹], r invertible there, and χ a finite-order character of A[r] after a finite étale splitting extension, with values in Q(μ_r). Pulling back the character summand of [r]_*Q gives a rank-one Q(μ_r)-module system L_χ. Descent includes both Galois transport of the torsion character and cyclotomic transport of its values; a primitive character need not define a rank-one Q system.

(LS: Lemma 5.28, p. 49.)

Use the finite étale multiplication cover and its finite-group projectors. Identify its origin-normalized character summands with SC.0, keeping the cyclotomic coefficient action.

The working interface consists of the following named declarations.

- `TorsionCharacterSystem.of_character`: Create the summand attached to χ with cyclotomic coefficients.
- `TorsionCharacterSystem.galois_transport`: Transport sends L_χ to L_(gχ) with the corresponding coefficient automorphism.
- `TorsionCharacterSystem.etale_comparison`: The étale realization is SC.0’s origin-normalized rank-one local system.

Use in LS 5.29: Builds the summands of the Galois-orbit cohomology system.

**Checks.**

- `torsion-character-system.1`: The trivial character yields the constant rank-one system.
- `torsion-character-system.2`: A character of order three has coefficient field Q(μ₃) and Q-rank two, not one.
- `torsion-character-system.3`: Inverting r is necessary: multiplication by r is not finite étale in residue characteristic dividing r.

The acceptance check is: The order prime is invertible on the model and may differ from the cohomological prime p.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/h0-algebra-operations`, `MordellLawrenceVenkateshPartII:M2.1/coefficient-module`, `MordellLawrenceVenkateshPartII:M2.0/geometric-cohomology-system`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`.

### 1.7 Galois-orbit cohomology systems

Let Y⊂X_K×A be a smooth projective family of hypersurfaces, X smooth over Q with suitable integral model and O_K[S⁻¹] finite étale over Z[S′⁻¹]. Let I be a finite orbit of pairs (ι,χ) under Gal(Q̄/Q)×Gal(Q^cyc/Q), with χ of order r prime to p, for which twisted cohomology vanishes outside degree n−1. Construct a constant finite étale H⁰-algebra E_I on X with geometric idempotents indexed by I, and an E_I-module system V_I whose geometric coefficient fibres are R^(n−1)f_(ι)*g_(ι)^*L_χ. Its E_I-rank is N=n!d when d=[H]^n/n!, and its Q-rank is |I|N. It is integral, pure polarized of weight n−1, and integral-Frobenius.

(LS: Lemma 5.29 and proof, pp. 49–51.)

Construct both algebra and cohomology as compatible rational idempotent summands of finite étale multiplication-cover pushforwards. Descend the orbit of idempotents together with the cyclotomic action; compute ranks on the geometric splitting cover. Intersect with a cohomology lattice, restrict the geometric polarization, and inherit integral Frobenius on direct summands.

The working interface consists of the following named declarations.

- `OrbitSystem.split_fibre`: After a splitting extension E_I is the product indexed by I and V_I splits into its stated twisted cohomology fibres.
- `OrbitSystem.rank`: The E-rank is N and the Q-rank is |I|N.
- `OrbitSystem.realization_descent`: The same Galois-equivariant idempotent produces every realization and comparison.

Use in LS 6.8 and proof of 9.2: Supplies the specific system to which the general non-density theorem applies.

**Checks.**

- `orbit-cohomology-system.1`: A singleton rational order-two character satisfying the concentration hypothesis gives E=Q and total rank N.
- `orbit-cohomology-system.2`: For two idempotents and fibre rank N=6, the total rank is 12, not 6 or 24.
- `orbit-cohomology-system.3`: An orbit not stable under cyclotomic transport cannot be descended using only the arithmetic permutation action.

The acceptance check is: The algebra has rank |I|; simply pushing forward the cyclotomic field along K/Q can have the wrong rank.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/torsion-character-system`, `MordellLawrenceVenkateshPartII:M2.1/equidimensional-module`, `MordellLawrenceVenkateshPartII:M2.0/integral-polarized-system`, `MordellLawrenceVenkateshPartII:M2.0/geometric-cohomology-system`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.8/uniform-orbit-monodromy`.

### 1.8 Inversion and the coefficient-linear pairing

For an orbit system whose generic hypersurface is invariant under inversion up to translation, construct the resulting involution i and the pairing (v,w)↦⟨v,iw⟩. It is E-balanced, perfect, and valued in an invertible E-module. For ambient dimension n even it is alternating and gives GSp_N; for n odd it is symmetric and gives GO_N. All translation and coefficient descent data must be carried along; the original pairing that couples χ and χ⁻¹ is not itself asserted E-bilinear.

(LS: Lemma 5.30 and proof, pp. 51–52.)

Use inversion to exchange a character with its inverse and the cup-product pairing to identify the two fibres. Check the translated inversion squares to the identity, the coefficient balancing identity, parity and Galois descent.

The working interface consists of the following named declarations.

- `OrbitSystem.inversion_pairing`: The twisted cup-product form is the E-balanced form B(v,w)=⟨v,iw⟩.
- `OrbitSystem.inversion_pairing_perfect`: The form identifies V with its E-linear dual tensored with the value line.
- `OrbitSystem.inversion_pairing_parity`: Its symmetry is (−1)^(n−1), with the stated GSp/GO alternatives.

Use in LS 9.2 proof: Selects GSp or GO when inversion symmetry prevents the GL monodromy alternative.

**Checks.**

- `inversion-polarization.1`: For ambient dimension four the pairing is alternating.
- `inversion-polarization.2`: For ambient dimension three it is symmetric.
- `inversion-polarization.3`: For χ≠χ⁻¹ the unmodified cup-product pairing joins different character factors and fails the required E-balanced diagonal description.

The acceptance check is: Over a splitting cover pair each coefficient factor with itself only after applying i.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/orbit-cohomology-system`, `MordellLawrenceVenkateshPartII:M2.1/classical-coefficient-structure`, `SheafConvolutionOnAbelianVarieties:SC.4/inversion-duality`.

### 1.9 Rational Frobenius polynomials for geometric orbit systems

For the full arithmetic/cyclotomic orbit system V_I constructed as a rational finite-group projector of multiplication-cover cohomology, its geometric Frobenius characteristic polynomials at good primes of the arithmetic Galois realization have rational coefficients and algebraic-integer roots, hence lie in Z[t]. Prove rationality using traces of powers of Frobenius composed with the rational group-correspondence projector and the fixed-point trace formula. This additional geometric assertion supplies the stronger arithmetic finiteness interface; it is not part of the definition of an arbitrary Hodge–Deligne system.

(LS: Construction in Lemma 5.29, pp. 49–51, and arithmetic use in Lemma 5.49, pp. 61–62.)

Express the orbit projector in Q[Γ] on the finite multiplication cover and check that it commutes with the descended Frobenius. For every positive power of Frobenius, compute the trace of its composition with each deck correspondence by the supplied trace theorem, obtaining a rational number. Newton identities give rational characteristic coefficients; geometric integrality of the eigenvalues then makes the coefficients integers.

The acceptance check is: A single character summand need not have rational Frobenius coefficients; take the entire specified cyclotomic orbit.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/orbit-cohomology-system`, `MordellLawrenceVenkateshPartII:M2.0/geometric-cohomology-system`, `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`.

### Examples

A coefficient orbit of cardinality m with E_I-rank N has rational rank mN. Taking only one character loses the arithmetic/cyclotomic orbit and can lose rational Frobenius coefficients. This is why the full orbit, its idempotent and its descent are retained.

### Dependencies

`DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `MordellLawrenceVenkateshPartII:M2.0`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`, `SheafConvolutionOnAbelianVarieties:SC.0/rank-one-local-system`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.4/inversion-duality`, `SheafConvolutionOnAbelianVarieties:SC.8/uniform-orbit-monodromy`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`.

## Layer 2: Semilinear groups and filtered tensor objects

Specialize the existing algebraic-group theory to coefficient normalizers, semisimplification and crystalline inner forms. Define finite adjoint profiles, top-weight sums and uniformity, and establish the global-type and parabolic/Levi finiteness targets.

### 2.1 Semilinear coefficient normalizers

Let E/E₀ be finite étale in characteristic zero, V free of E-rank N>0, and H=GL_N, GSp_N or GO_N in its standard representation (with a perfect E-valued form after a line trivialization in the paired cases). Set B=Res_(E/E₀)H and G=N_(GL_(E₀)(V))(B). Identify G with invertible E-semilinear maps, respecting the form up to a semilinear similitude in the paired cases. Obtain 1→B→G→Aut_(E₀)(E)→1 as a group-scheme exact sequence, surjective fppf-locally. B is not renamed the identity component when H=GO_(2r).

(LS: Definition 5.31 and Lemma 5.32, pp. 53–54.)

After splitting E, recover its scalar algebra from the centralizer of the standard B action; a normalizing map must permute the coefficient factors. Identify the normalizer of the classical form on each factor and descend; construct local lifts of coefficient permutations.

The working interface consists of the following named declarations.

- `SemilinearNormalizer.coefficient_automorphism`: A normalizer element induces its unique coefficient automorphism σ.
- `SemilinearNormalizer.mem_iff`: Membership is equivalent to invertible σ-semilinearity and the paired-form similitude identity when applicable.
- `SemilinearNormalizer.kernel`: The kernel is the ordinary coefficient-linear restriction-of-scalars group B.

Use in LS 5.33, 5.43 and 8.8: Encodes Frobenius and arithmetic descent in one algebraic group.

**Checks.**

- `semilinear-normalizer.1`: For E=E₀, G=H.
- `semilinear-normalizer.2`: For E=E₀×E₀ the factor swap lies in G but not in B.
- `semilinear-normalizer.3`: For split GO₄, B itself is disconnected, so G° cannot be identified with B.

The acceptance check is: Exactness is a scheme/functor statement, not an unsupported claim that every rational-point sequence is surjective.

*Needs:* `MordellLawrenceVenkateshPartII:M2.1/classical-coefficient-structure`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`.

### 2.2 Semilinear Frobenius centralizer bound

In the preceding setup, if σ∈Aut_(E₀)(E) has fixed algebra E^σ=E₀ and φ∈G is σ-semilinear, then dim Z_G(φ)≤dim H. More generally on each σ-cycle of geometric coefficient factors, projection of Z_B(φ) to any one factor is injective, so the bound is one factor dimension per cycle.

(LS: Lemma 5.33 and proof, pp. 53–54.)

Split E over an algebraic closure; fixed algebra E₀ means one permutation cycle. The commuting equations propagate every component from one component around the cycle; the remaining equation restricts that component. Pass from Z_B to Z_G through the finite component quotient.

The acceptance check is: For σ=id on a split d-factor algebra the fixed-algebra hypothesis fails and a bound independent of d is false.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/semilinear-normalizer`, `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank`.

### 2.3 Semisimplification in the coefficient normalizer

For the specific normalizer G of M2.2 and a subgroup Γ⊂G over a characteristic-zero field, use Richardson parabolics P_λ={g:lim_(t→0)λ(t)gλ(t)⁻¹ exists}, their Levi quotients and unipotent radicals. Γ is G-completely reducible when every such P_λ containing Γ has a Levi containing Γ. Projecting Γ from a minimal containing P_λ to its Levi gives a G-completely reducible subgroup, unique up to G-conjugacy after the source-qualified field extension. For Γ a representation image call this its G-semisimplification. Rational conjugacy and continuity require separate descent, not merely geometric closed-orbit uniqueness.

(LS: Definitions 5.34–5.36 and Lemma 5.37, pp. 55–56; LV: Lemmas 2.4–2.5, pp. 905–906.)

Import the dynamic parabolic and Levi construction, and the common connected complete-reducibility/closed-orbit input. Specialize minimal-parabolic projection to the finite-component coefficient normalizer; prove conjugacy and continuity in the field cases consumed here. Check that an element and its image in a Levi have conjugate semisimple parts and that tori in P are unipotently conjugate into a Levi.

The working interface consists of the following named declarations.

- `CoefficientSemisimplification.minimal_parabolic`: Choose a minimal Richardson parabolic containing the specified image.
- `CoefficientSemisimplification.geometric_unique`: Its completely reducible Levi images form one geometric G-conjugacy class.
- `CoefficientSemisimplification.element_semisimple_part`: Levi projection preserves the ambient conjugacy class of each element’s semisimple part.

Use in LS 5.49 and 8.10; LV 10.4: Controls global types and transports the Hodge torus through Levi projection.

**Checks.**

- `coefficient-semisimplification.1`: A split extension of two distinct characters of GL₂ has the same semisimplification as their direct sum.
- `coefficient-semisimplification.2`: A nontrivial upper-unipotent representation is not declared equal to its trivial semisimplification.
- `coefficient-semisimplification.3`: For (GL₂)²⋊C₂, cocharacters with the same parabolic on the identity component can yield different full parabolics depending on whether the component swap preserves their weights.

The acceptance check is: GL-semisimplification of the standard module agrees with the ordinary representation semisimplification.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/semilinear-normalizer`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### 2.4 Tensor G-structures

For an affine algebraic group G/k and a k-linear tensor category C with a fibre functor ω, a G-object is an exact faithful k-linear symmetric monoidal functor Rep_fd(G)→C together with a tensor trivialization of its composite with ω to the forgetful functor. Changing the trivialization conjugates the resulting homomorphism of Tannaka groups. A faithful representation with defining tensors describes the same structure only after proving the tensor reconstruction comparison.

(LS: Definition 5.38 and Remark 5.39, p. 56.)

Use Rep_fd(G) from the existing group-representation theory; define the structured exact tensor functor and chosen trivialization. Use neutral reconstruction to recover the homomorphism of fibre groups.

The working interface consists of the following named declarations.

- `TensorGObject.standard`: Evaluate on the specified faithful representation of G.
- `TensorGObject.change_trivialization`: A tensor automorphism changes the fibre-group map by conjugation.
- `TensorGObject.reconstruction`: For representations of a represented Hopf group, recover the existing tensor-point equivalence, not a second group of points.

Use in LS 5.40 and 5.43: Makes filtered and crystalline structures tensor-compatible.

**Checks.**

- `tensor-g-structure.1`: For G=GL₁ the value is an invertible tensor object with its chosen fibre trivialization.
- `tensor-g-structure.2`: A functor sending the tensor unit to a two-dimensional vector space is rejected.
- `tensor-g-structure.3`: A map preserving the underlying standard vector space but not its alternating tensor does not define a GSp-structure.

The acceptance check is: The tensor unit, dual and every defining form are respected.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/system-tannakian-category`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`.

### 2.5 Tensor filtrations and cocharacters

For G in characteristic zero with reductive identity component, a G-filtration is an exact tensor-compatible filtration of the forgetful functor Rep_fd(G)→Vect, with the canonical associated-graded tensor structure. A splitting cocharacter μ gives F^aV=⊕_(j≥a)V_j. Two cocharacters define the same filtration precisely when their dynamic parabolics agree and they are conjugate in that parabolic. Restriction to G° identifies G-filtrations with G°-filtrations, but a parabolic alone records a filtration only up to indexing. On descending filtrations gr^a=F^a/F^(a+1).

(LS: Definitions 5.40–5.41 and Lemma 5.42, pp. 56–58.)

Apply tensor-filtration splitting and compare its stabilizer and graded kernel with the existing dynamic parabolic and radical. Use that cocharacters lie in G° and compare their associated filtrations, retaining their weights.

The working interface consists of the following named declarations.

- `GFiltration.of_cocharacter`: A cocharacter induces the descending weight filtration on every representation.
- `GFiltration.equivalent_cocharacters`: Equal filtrations are exactly the stated same-parabolic conjugacy equivalence.
- `GFiltration.associated_graded`: The tensor associated graded uses F^a/F^(a+1) and restriction to G° preserves it.

Use in LS 5.43, 8.3 and 8.8: Supplies Hodge filtrations and the precise induced-Levi and type constructions.

**Checks.**

- `tensor-g-filtration.1`: For GL₂, weights (1,0) and (2,0) have the same upper-triangular parabolic but different indexed filtrations.
- `tensor-g-filtration.2`: For the trivial cocharacter the filtration has only degree zero.
- `tensor-g-filtration.3`: For GL₂²⋊C₂ a cocharacter with unequal component weights need not be stabilized by the component swap.

The acceptance check is: Filtered vector spaces are an exact filtered category here; no claim makes all of them an abelian category.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-structure`, `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`, `tauceti:TauCeti.Cocharacter.parabolic`.

### 2.6 Crystalline tensor structures and inner forms

For a crystalline G-valued local Galois representation over Q_p with G in the preceding class, D_cris applied as an exact tensor functor gives filtered φ-data with an inner form G′ and a G′-filtration. A homomorphism G₁→G₂ induces a homomorphism between the corresponding inner forms, compatible with tensors. In the coefficient-normalizer case identify G′ with the de Rham coefficient normalizer through the actual realization comparison. There is no canonical equality G′=G for an arbitrary G-object.

(LS: Lemma 5.43 and proof, pp. 58–59.)

Use exactness, faithfulness and tensor/dual compatibility of D_cris on crystalline representations. Compare the two fibre functors through their tensor-isomorphism torsor; identify the induced group as the twist by this torsor. In the standard coefficient representation use the given coefficient action and pairing to recognize the de Rham group.

The acceptance check is: Functoriality lands in G₂′, not accidentally in G₂ without a chosen trivialization.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-structure`, `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `MordellLawrenceVenkateshPartII:M2.2/semilinear-normalizer`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `MotivesAndAlgebraicCycles:MC.6`.

### 2.7 Adjoint Hodge profiles and top-weight sums

Given a G-filtration on a characteristic-zero group, define h^a=dim gr^a Lie(G), a finitely supported sequence of natural numbers. In the polarized weight-zero adjoint case h^a=h^(−a). Put D=Σ_a h^a, A=Σ_(a>0)h^a, B=Σ_(a>0)a h^a. Order the D weights with multiplicities nonincreasingly as w₁,…,w_D. For real x∈[0,D], define T(x)=Σ_(j≤floor x)w_j+(x−floor x)w_(floor x+1), with T(D)=Σ_j w_j. Thus T is continuous piecewise linear, with each weight appearing h^a times; it does not sum the multiplicities themselves.

(LS: Definitions 5.44–5.45, p. 60; LV: (10.2)–(10.3), pp. 968–969.)

Take the Lie-algebra filtration, its finite associated graded and multiplicities. Define its decreasing weighted list and interpolate partial sums; retain a finite real domain for T.

The working interface consists of the following named declarations.

- `AdjointProfile.positive_mass`: A counts positive weights with their multiplicities.
- `AdjointProfile.positive_weight_sum`: B is the sum of each positive integer weight multiplied by its natural multiplicity.
- `AdjointProfile.top_sum_integer`: For integer 0≤m≤D, T(m) is the sum of the m largest weights.
- `AdjointProfile.top_sum_scaling`: Repeating the profile d times gives T_repeat(dx)=dT(x).
- `AdjointProfile.top_sum`: On a supplied decreasing list of weights, linearly interpolate sums of initial segments using the natural floor; the geometric domain is 0≤x≤length.
- `AdjointProfile.total_mass_eq_zero_add_twice_positive`: For a symmetric finitely supported profile h, the total mass is h⁰+2A.

Use in LS 7.2, 8.12, 8.16 and 8.17; LV 10.1: Controls flag dimensions and the cost of removing highest adjoint weights.

**Checks.**

- `adjoint-hodge-profile.1`: For weights 2,0,−2, T(1/2)=1, T(1)=2 and T(2)=2.
- `adjoint-hodge-profile.2`: For the zero profile D=A=B=0 and only T(0) is in the natural domain.
- `adjoint-hodge-profile.3`: Replacing weights 2,0,−2 by multiplicities 1,1,1 would give T(1)=1, so that implementation fails.

The acceptance check is: All arguments of T in a numerical criterion must lie in [0,D].

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `mathlib:Finsupp`.

### 2.8 Uniform coefficient filtrations

For a filtration of a coefficient-normalizer object, uniform means that the adjoint Hodge profile on H is the same at every geometric embedding of its finite étale coefficient algebra. If [E:E₀]=d, its restriction-of-scalars profile is d times the single-factor profile; in particular T_Res(dx)=dT_H(x). The numerical inequalities of the non-density theorem always use h_H,T_H, not the scaled restriction-of-scalars profile.

(LS: Definition 5.46 and Lemma 5.48, pp. 60–61.)

Split the coefficient algebra, compare each factor filtration and sum Lie-algebra graded dimensions. Apply repetition of the ordered weight list for the T scaling.

The working interface consists of the following named declarations.

- `UniformFiltration.profile_at_embedding`: Every coefficient embedding has the same sequence h_H.
- `UniformFiltration.restriction_scaling`: h_Res^a=d h_H^a and T_Res(dx)=dT_H(x).
- `UniformFiltration.scalar_extension`: Scalar extension preserves the common single-factor profile.

Use in LS 8.17 and Appendix A: Prevents a wrong factor of [E:E₀] in the numerical criterion.

**Checks.**

- `uniform-hodge-filtration.1`: For E=E₀×E₀ with two identical SL₂ adjoint profiles, the restriction profile doubles each multiplicity.
- `uniform-hodge-filtration.2`: Two rank-two coefficient factors with Hodge types (1,0) and (2,0) are equidimensional but fail uniformity.
- `uniform-hodge-filtration.3`: For E=E₀ the scaling factor is one.

The acceptance check is: Uniformity is a factorwise condition and does not follow just from equidimensionality.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`, `MordellLawrenceVenkateshPartII:M2.1/equidimensional-module`, `MordellLawrenceVenkateshPartII:M2.2/semilinear-normalizer`.

### 2.9 Finiteness of global coefficient-group types

Fix p, a finite T containing p, and the coefficient normalizer G/Q_p of M2.2 with its fixed faithful standard representation and coefficient permutation action. Fix rank and an integer pure Weil weight w≥0. Continuous G-completely reducible representations G_Q→G(Q_p), unramified outside T and having characteristic polynomials in Z[t] with weight-w roots at Frobenius outside T, form finitely many G(Q_p)-conjugacy classes. Rational-orbit descent and the possibly disconnected GO coefficient group require the inputs recorded as gaps. This target extends the parent GL finiteness theorem; it is not inferred from finite GL-conjugacy classes alone.

(LS: Lemma 5.49 and proof, pp. 61–62.)

Use bounded component degree and Hermite–Minkowski to restrict to finitely many extensions killing the component action. Use the connected reductive refinement of the parent GL finiteness argument; conjugacy rigidity for a finite component group follows from vanishing of its characteristic-zero H¹ on the Lie algebra. Account for rational splitting of a geometric orbit using finite local H¹ of the centralizer, not the false assertion that a closed embedding gives finitely many rational subgroup orbits.

The acceptance check is: Keep the parent’s recorded erratum about general reductive conjugacy visible; this theorem is a target with the explicit descent gap.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`.

### 2.10 Finitely many semisimplification geometries

Let G be an algebraic group over a characteristic-zero field E with reductive identity component and H⊂G an E-defined G-completely reducible subgroup. Up to the action of Z_G(H)(E), only finitely many E-defined pairs (P,M) occur with P a Richardson parabolic, M a Levi of P and H⊂M. Consequently a fixed completely reducible image gives finitely many parabolic/Levi semisimplification types. This is a finiteness statement up to centralizer conjugacy, not finiteness of actual parabolics.

(LS: Lemmas 5.50 and 5.52, p. 62.)

Choose a maximal E-split torus in Z_G(H) and use conjugacy of maximal E-split tori under Z_G(H)(E) to express allowable E-defined Levi factors by its E-cocharacters. The finitely many root-weight hyperplanes partition cocharacter space into finitely many faces; use each face to record its parabolic and Levi. Treat the finite component action without identifying its parabolic with the identity-component parabolic.

The acceptance check is: For H=1 there can be infinitely many actual Borels, but finitely many conjugacy types.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`.

### Examples

For the weight list (2,0,−2), T(1/2)=1, T(1)=2 and T(2)=2. For GL₂, cocharacters (1,0) and (2,0) define the same triangular parabolic but different indexed filtrations. The latter example rules out defining a filtration as a parabolic alone.

### Dependencies

`AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`, `MordellLawrenceVenkateshPartII:M2.0`, `MordellLawrenceVenkateshPartII:M2.1`, `MotivesAndAlgebraicCycles:MC.6`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

## Layer 3: Period orbits and transcendence transfer

Identify a monodromy period orbit with parabolic stabilizer, apply the externally supplied pure integral Ax–Schanuel theorem componentwise, and transfer its codimension consequence to p-adic non-density through analytic radicals and Krull intersection.

### 3.1 Periods in a single monodromy orbit

The complex and p-adic period maps of a compatible system, after the stated fibre identifications, lie in one orbit of its differential monodromy group in the relevant compact dual. The orbit is defined by the horizontal tensor relations of the tensor category generated by the connection. Over a nonclosed field use its tensor-isomorphism torsor; do not choose a rational trivialization without an existence argument.

(LS: Lemma 6.1, pp. 63–64.)

Construct the torsor of horizontal tensor identifications between the variable and reference fibres. Apply it to the Hodge filtration and use the supplied tensor-isomorphism theorem after algebraic closure; descend the orbit equations.

The acceptance check is: For a constant system the period map is constant. An arbitrary flag with the right dimensions can violate a horizontal tensor equation.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/differential-monodromy`, `MordellLawrenceVenkateshPartII:M2.0/crystalline-residue-fibres`, `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `MotivesAndAlgebraicCycles:MC.6`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `HodgeStructuresPartII:H.3/period-map-holomorphic`.

### 3.2 Parabolic stabilizers of period orbits

For a polarized pure variation, the stabilizer of its Hodge filtration inside the connected algebraic monodromy group is parabolic; its orbit is consequently projective. Use normality of connected monodromy in the derived generic Mumford–Tate group and the Hodge cocharacter action. Pass to a positive power of the cocharacter if needed to lift the induced inner action; finite disconnected components do not change the connected orbit.

(LS: Lemma 6.2, p. 64.)

Use the supplied normality theorem to make the Hodge cocharacter act on connected monodromy. Lift its inner action after a power; identify the stabilizer with the supplied dynamic parabolic.

The acceptance check is: Projectivity is for the connected monodromy orbit, rather than every orbit of a reductive group in a flag space.

*Needs:* `MordellLawrenceVenkateshPartII:M2.3/period-monodromy-orbit`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `HodgeStructuresPartII:H.3/period-map-holomorphic`.

### 3.3 Analytic radicals for period ideals

Let Φ be a local holomorphic period map in smooth coordinates at x and I the ideal of convergent germs defining Φ⁻¹(Z). If an algebraic function g on the smooth base vanishes on that germ, some power g^m lies in I. Obtain this exact membership statement from the local analytic Nullstellensatz in ComplexComparisonPartII C0; the general theorem I(V(I))=√I is a requested supplier extension, not a second construction here.

(LV: proof of Lemma 9.3, pp. 966–968; LS: proof of Theorem 6.4, pp. 65–67.)

Apply the requested analytic Nullstellensatz to the finitely generated period ideal in C{z₁,…,z_n}. Use radical membership to choose a finite exponent m and convergent coefficient germs; retain those coefficients for the formal transfer.

The acceptance check is: For I=(z²), z vanishes on V(I) but need not belong to I; the radical is essential.

*Needs:* `ComplexComparisonPartII:C0`.

### 3.4 Algebraic degeneracy from period codimension

Let X be smooth irreducible over C of positive dimension d and let its pure polarized integral variation have connected monodromy period orbit D_mon. If an algebraic subset Z⊂D_mon has codimension at least d, every positive-dimensional irreducible analytic component of the inverse image of Z under a local period map is contained in a proper algebraic subvariety of X. Zero-dimensional local components are points and are also proper. The assertion is componentwise or germwise; it does not assert that infinitely many components have one common proper algebraic closure.

(LS: Lemma 6.3, pp. 64–65; LV: Corollary 9.2, pp. 963–965.)

Apply the externally owned pure integral period-map Ax–Schanuel theorem to the graph of the period map and X×Z. The codimension inequality forces each component to be atypical unless its base projection is algebraically degenerate; handle isolated points separately.

The acceptance check is: Require positive dim X. Use integral polarized pure variations, the actual scope of the cited Ax–Schanuel input; no unproved mixed or nonintegral extension is claimed.

*Needs:* `MordellLawrenceVenkateshPartII:M2.3/parabolic-period-stabilizer`.

### 3.5 Transfer to p-adic non-density

Let X/Q be smooth geometrically connected of positive dimension d, with a pure polarized integral compatible system, and fix a smooth p-adic residue disk Ω and its monodromy period orbit. For an algebraic Z in that orbit of codimension at least d, Φ_p⁻¹(Z)∩Ω is not Zariski dense in X. After shrinking to affinoid subdisks the assertion combines finitely many minimal primes; finitely many residue disks combine by taking a product of nonzero algebraic equations.

(LS: Theorem 6.4, pp. 65–67; LV: Lemma 9.3, pp. 965–968.)

Transfer formal Taylor expansions through an abstract field isomorphism Q̄_p≅C; no continuity of this isomorphism is needed or asserted. For each local analytic component, complex degeneracy provides a nonzero algebraic equation; the analytic Nullstellensatz places a power in the period ideal. Descend that equation through a finite coefficient extension using its norm, then descend finite linear systems to the coefficient field. Use Krull intersection in the localized Tate algebra at each prime to pass from every formal order to genuine ideal membership. The Noetherian Tate algebra has finitely many minimal primes; multiply their nonzero algebraic equations and use injectivity of the germ map on irreducible X.

The acceptance check is: Formal vanishing alone is not analytic ideal membership without Krull intersection. An infinite union of separately nondense subsets need not be nondense; only the finite component/disk decomposition is used.

*Needs:* `MordellLawrenceVenkateshPartII:M2.3/complex-period-codimension`, `MordellLawrenceVenkateshPartII:M2.3/local-analytic-nullstellensatz`, `MordellLawrenceVenkateshPartII:M2.0/crystalline-residue-fibres`, `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing`, `MordellLawrenceVenkatesh:LV.2/residue-disk`, `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`, `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

### Examples

For the germ ideal (z²), z vanishes on its zero set but belongs only to its radical. The power supplied by the analytic Nullstellensatz is precisely what survives the transfer to formal p-adic coefficients. In dimension zero, a point is dense in itself, so positive base dimension is essential.

### Dependencies

`ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.3/period-map-holomorphic`, `HodgeStructuresPartII:H.3/polarized-compact-dual`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`, `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`, `MordellLawrenceVenkatesh:LV.2/residue-disk`, `MordellLawrenceVenkateshPartII:M2.0`, `MordellLawrenceVenkateshPartII:M2.2`, `MotivesAndAlgebraicCycles:MC.6`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`.

## Layer 4: Balanced monodromy and semisimple fibres

Describe the subdirect-product index partition, strong balance on every Frobenius orbit and the torsion-orbit comparison. Bound fixed semisimple filtration loci and deduce non-density for semisimple integral fibres.

### 4.1 Index classes of subdirect monodromy

Let H be a connected semisimple characteristic-zero group with simple adjoint quotient and let L⊂H^I be a closed subgroup surjective onto each factor, for finite nonempty I. Put i~j when the projection to factors i,j is not the full product, allowing the equivalent graph-of-an-isogeny formulation after central quotients. This is an equivalence relation. Projection onto one representative of each class is surjective with finite kernel. Apply to SL_N (N≥2), Sp_2r (r≥1), and SO_N (N=3 or N≥5); SO₂ and SO₄ require separate treatment and are excluded.

(LS: Lemma 6.5, pp. 67–68.)

Apply the simple-adjoint Goursat lemma to each two-factor projection. Use a triple projection to prove transitivity, then induct on the number of classes.

The working interface consists of the following named declarations.

- `MonodromyPartition.rel`: Record dependence of two factor projections through the adjoint simple quotient.
- `MonodromyPartition.equivalence`: The dependence relation is reflexive, symmetric and transitive.
- `MonodromyPartition.representatives`: Projection to class representatives is a central isogeny onto the full product.

Use in LS 6.6 and 7.2: Defines the independent directions available for a Frobenius orbit.

**Checks.**

- `monodromy-index-partition.1`: The diagonal H⊂H² has one class and finite-kernel projection onto either factor.
- `monodromy-index-partition.2`: The product H² has two singleton classes.
- `monodromy-index-partition.3`: SO₄ with its two simple adjoint factors fails the simple-adjoint hypothesis, preventing an incorrect single-factor Goursat conclusion.

The acceptance check is: Geometric hypersurface applications have N≥6.

*Needs:* `MordellLawrenceVenkateshPartII:M2.0/differential-monodromy`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### 4.2 Strongly balanced monodromy

For the preceding index partition and integer c≥1, c-balanced means all classes have equal cardinality and there are at least c classes. Given a permutation σ of I, strongly c-balanced additionally means σ preserves the partition and every σ-orbit meets at least c distinct classes. For a subgroup of the coefficient group, apply this condition to its intersection with the product of derived classical factors after algebraic closure. Neither the scalar centres nor the similitude characters supply the independent directions.

(LS: Definition 6.6 and Example 6.7, p. 68.)

Express the partition conditions on a finite set and prove invariance under relabeling. Use the derived-factor interpretation to compare with the coefficient-group formulation.

The working interface consists of the following named declarations.

- `BalancedMonodromy.isBalanced`: Specify equal class sizes and the lower bound c on the number of classes.
- `BalancedMonodromy.isStronglyBalanced`: Add σ-invariance and the orbitwise lower bound on distinct classes.
- `BalancedMonodromy.weaken`: Strong c-balance implies strong c′-balance for 1≤c′≤c, and is invariant under equivariant relabeling.

Use in LS 7.2 and 8.16: Chooses at least c independent factors within a single Frobenius cycle.

**Checks.**

- `strongly-balanced-monodromy.1`: Four paired classes on eight indices with σ=(13)(24)(57)(68) are 4-balanced but only strongly 2-balanced.
- `strongly-balanced-monodromy.2`: A diagonal subgroup on d indices is strongly 1-balanced for every σ, and cannot be strongly 2-balanced.
- `strongly-balanced-monodromy.3`: The full product has singleton classes; if σ fixes one index, it is not strongly 2-balanced despite having many factors.

The acceptance check is: Equal class sizes, orbitwise class count and partition preservation are three independent requirements.

*Needs:* `MordellLawrenceVenkateshPartII:M2.4/monodromy-index-partition`, `MordellLawrenceVenkateshPartII:M2.2/semilinear-normalizer`.

### 4.3 Torsion-orbit monodromy is strongly balanced

For a nonconstant-up-to-translation family of primitive smooth ample hypersurfaces satisfying the supplied classical-monodromy hypotheses, the orbit character supplied by SC.8 can be chosen so that its coefficient cohomology system has strongly c-balanced differential monodromy relative to residue Frobenius, for any prescribed c≥1. Normal containment of c independent derived factors, after the stated Frobenius powers and for every arithmetic/cyclotomic conjugate, supplies the orbitwise condition. Use the algebraically closed extension comparison to return to the de Rham group.

(LS: Lemma 6.8, pp. 68–69.)

Translate the SC.8 independent conjugate-character factors into independent index classes. Galois acts transitively on the coefficient orbit, giving equal class sizes; Frobenius preserves the relation. Apply the same argument to every conjugate so every Frobenius cycle meets c classes.

The acceptance check is: A large group on one selected character is insufficient; the conjugate-uniform assertion is required.

*Needs:* `MordellLawrenceVenkateshPartII:M2.4/strongly-balanced-monodromy`, `MordellLawrenceVenkateshPartII:M2.1/orbit-cohomology-system`, `MordellLawrenceVenkateshPartII:M2.0/differential-monodromy`, `SheafConvolutionOnAbelianVarieties:SC.8/uniform-orbit-monodromy`, `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`.

### 4.4 Codimension of semisimple isomorphism orbits

Let a uniform coefficient filtration have single-factor profile h and strongly c-balanced monodromy relative to σ. Suppose E^σ=E₀ on the chosen Frobenius cycle, e>0 and A≥(e+dim H)/c. In the monodromy flag orbit, the locus whose filtered Frobenius module is isomorphic to a prescribed one has codimension at least e. More generally select one σ-cycle meeting c index classes; one factor dimension dim H is the centralizer cost for that cycle.

(LS: Lemma 7.2, pp. 70–71.)

Project the period orbit to c independent factor flags within one Frobenius cycle. The product flag dimension is cA, while semilinear centralizer orbits have dimension at most dim H. Take the smooth homogeneous projection back to the full monodromy orbit.

The acceptance check is: The codimension estimate is for fixed isomorphism data, not an assertion that the whole filtered-module moduli is finite.

*Needs:* `MordellLawrenceVenkateshPartII:M2.4/strongly-balanced-monodromy`, `MordellLawrenceVenkateshPartII:M2.2/semilinear-centralizer-bound`, `MordellLawrenceVenkateshPartII:M2.2/uniform-hodge-filtration`, `MordellLawrenceVenkateshPartII:M2.3/parabolic-period-stabilizer`.

### 4.5 Non-density for semisimple integral fibres

Let 𝓧 be of finite type over Z[S⁻¹] with smooth geometrically connected generic fibre X of positive dimension. For an integral polarized pure compatible system with integral Frobenius and rational Frobenius characteristic polynomials outside S, uniform coefficient filtration and strongly c-balanced monodromy, assume A≥(dim X+dim H)/c. The integral points whose global coefficient-group representations are G-completely reducible are not Zariski dense in X. Fix the coefficient permutation representation and enlarge S only by finitely many primes.

(LS: Theorem 7.3, pp. 71–72.)

Global finiteness leaves finitely many semisimple G-representations. On each of finitely many residue disks a fixed representation gives a centralizer orbit of filtrations; apply the codimension bound with e=dim X. Apply p-adic transfer and take the finite union.

The acceptance check is: This is restricted to semisimple integral fibres; the all-points assertion requires the balanced associated-graded argument.

*Needs:* `MordellLawrenceVenkateshPartII:M2.4/semisimple-orbit-codimension`, `MordellLawrenceVenkateshPartII:M2.2/finite-global-g-types`, `MordellLawrenceVenkateshPartII:M2.3/padic-period-nondensity`, `MordellLawrenceVenkateshPartII:M2.0/integral-polarized-system`.

### Examples

On eight indices with classes {1,2}, {3,4}, {5,6}, {7,8}, the permutation (13)(24)(57)(68) preserves the partition and every orbit meets two classes. There are four classes, so this is 4-balanced and strongly 2-balanced, but not strongly 4-balanced.

### Dependencies

`MordellLawrenceVenkateshPartII:M2.0`, `MordellLawrenceVenkateshPartII:M2.1`, `MordellLawrenceVenkateshPartII:M2.2`, `MordellLawrenceVenkateshPartII:M2.3`, `SheafConvolutionOnAbelianVarieties:SC.2/algebraically-closed-extension`, `SheafConvolutionOnAbelianVarieties:SC.8/uniform-orbit-monodromy`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

## Layer 5: Balanced associated gradeds and codimension

Define central weights, induced Levi filtrations, balance and bifiltered Frobenius types. Derive balance from global purity over Q, finite graded types, the corrected stable-Levi argument, root-count bounds and the fixed-type codimension theorem.

### 5.1 Central weights of filtrations

For a characteristic-zero algebraic group S with reductive identity component, let a_S=X_*(Z(S°)°)⊗Q, equivalently the Q-dual of X^*(S°)⊗Q via the central pairing. Compute these geometric character spaces after algebraic closure and retain their Galois action for descent; rational cocharacters give invariant classes. The weight w_S(μ) of a rational cocharacter μ is its projection to a_S. For a Levi M⊂G, restriction of rational characters gives a canonical inclusion ι_GM:a_G→a_M and a splitting of the opposite projection. Define the modular character γ_P as the inverse determinant of Ad on Lie(P), with additive pairing against cocharacters.

(LS: Definition 8.4, pp. 74–75; LV: §§11.1–11.2, pp. 985–986.)

Use the root decomposition to split the central and derived rational cocharacter spaces. Check the character pairing and the sign of the modular character against a triangular matrix group.

The working interface consists of the following named declarations.

- `CentralWeight.space`: Rational central cocharacters paired with rational characters.
- `CentralWeight.of_cocharacter`: Project a cocharacter to its central weight.
- `CentralWeight.levi_inclusion`: The canonical map a_G→a_M splits the projection and pairs by character restriction.

Use in LS 8.4 and 8.7; LV 11.4: Defines balance and translates global pure weights into character identities.

**Checks.**

- `central-weight-space.1`: For GL_r the central weight of diagonal exponents a_i is their average times the scalar cocharacter.
- `central-weight-space.2`: For semisimple S, a_S is zero.
- `central-weight-space.3`: For upper triangular GL₂, γ_P(diag(a,b))=a⁻¹b, fixing the modular-character sign.

The acceptance check is: All statements concern rational central spaces, so finite central isogenies cause no false integral-lattice identification.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### 5.2 Filtrations induced on a Levi quotient

Let G be as in M2.2, P a Richardson parabolic with Levi quotient M and F a G-filtration. Choose a splitting cocharacter of F taking values in P; its projection defines a filtration F_M independent of this choice. Put Q=P_μ, the stabilizer of F. On each Q-homogeneous orbit Q·x in a flag variety, its μ-fixed points are conjugate under Z_Q(μ); use this for the Q-orbit of the point representing P to establish independence. For GL(V), F_M is the filtration induced by F on the graded vector space of the P-flag.

(LS: Lemma 8.2 and Definition 8.3, pp. 73–74; LV: Lemmas 11.1–11.2, pp. 986–989.)

Place a maximal torus of the filtration stabilizer in P after conjugacy, giving a splitting in P. Compare two P-valued choices inside the Q-homogeneous orbit Q·P in G/P, using the fixed-point lemma for Q=P_μ. Their Levi projections differ by the subgroup fixing the induced filtration. Identify the construction on each representation with the associated-graded filtration.

The working interface consists of the following named declarations.

- `GFiltration.inducedLevi`: Return the quotient M-filtration from F and P.
- `GFiltration.inducedLevi_independent`: Changing a P-valued splitting leaves the induced filtration unchanged.
- `GFiltration.inducedLevi_standard`: For GL(V), agree with the usual filtration on the graded pieces of the P-flag.

Use in LS 8.4, 8.8 and 8.12; LV 11.4: Makes balance and fixed graded types independent of auxiliary splittings.

**Checks.**

- `induced-levi-filtration.1`: For P=G, inducedLevi returns F.
- `induced-levi-filtration.2`: For GL₂ with a chosen line L, the two induced one-dimensional graded filtrations record the intersection of L with F.
- `induced-levi-filtration.3`: Two upper-unipotently conjugate splittings give the same quotient filtration.
- `induced-levi-filtration.4`: For diagonal μ in SL₂, the two fixed points of the whole flag variety P¹ lie in distinct upper-Borel orbits and are not conjugate under its torus. The fixed-point lemma requires one Q-homogeneous orbit.

The acceptance check is: Independence concerns filtrations, rather than literal equality of chosen cocharacters.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `MordellLawrenceVenkateshPartII:M2.5/central-weight-space`.

### 5.3 Balanced, weakly balanced and semibalanced filtrations

For F and P→M as above, F is balanced when w_M(F_M)=ι_GM(w_G(F)); weakly balanced when ⟨γ_P,F_M⟩=0; and semibalanced when ⟨γ_P,F_M⟩≤0. Balance implies weak balance, which implies semibalance. The latter two test one modular character and are generally weaker than the vector identity defining balance. The restriction to G° preserves all three conditions.

(LS: Definition 8.4, Example 8.6, pp. 74–76; LV: §11.4, pp. 989–990.)

Pair the vector balance identity with γ_P, which vanishes on the centre of G. Verify the modular sign on block triangular matrices and compare with weight averages on each graded block.

The working interface consists of the following named declarations.

- `GFiltration.isBalanced`: Compare central weights in a_M.
- `GFiltration.balanced_implies_semibalanced`: The vector identity implies the modular equality and then the inequality.
- `GFiltration.balance_on_graded_GL`: For GL(V), each nonzero graded block has the same average F-weight as V.

Use in LS 8.7 and 8.12; LV 10.6 and 11.3: Restricts the otherwise excessively large semisimplification fibres.

**Checks.**

- `balanced-filtration.1`: For GL₆ and a three-block 2+2+2 flag, a two-step filtration with three-dimensional F¹ is balanced precisely when its three block dimensions are (1,1,1).
- `balanced-filtration.2`: In the same example weak balance means a₀=a₂, while semibalance means a₀≤a₂.
- `balanced-filtration.3`: The generic intersection pattern (2,1,0) is not semibalanced; thus the condition is not automatic on the flag variety.

The acceptance check is: The sign is ≤0 for the inverse-determinant convention.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/central-weight-space`, `MordellLawrenceVenkateshPartII:M2.5/induced-levi-filtration`.

### 5.4 Global purity forces balance over Q

Let ρ:G_Q→G(Q_p) be crystalline at p, pure of integral Weil weight w on the chosen faithful representation, with image contained in P. The de Rham Hodge filtration induced on the corresponding inner Levi quotient is balanced relative to P. In the GL case this says every global graded subquotient has Hodge–Tate average w/2, using the convention that a Tate object of geometric Frobenius q has de Rham weight 1. This global assertion is over Q; it is false in this form for arbitrary number fields with different embeddings.

(LS: Lemmas 8.1 and 8.7, pp. 73 and 76–77.)

Apply the parent global pure-character weight theorem to all rational characters of the Levi that are trivial on Z(G). Translate the resulting weight-zero identities into the central-weight equality. Track the inner form under D_cris so P and its Levi are transported rather than identified without comparison.

The acceptance check is: A CM character over a number field can have unequal embedding weights; do not extend the Q statement by notation alone.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/balanced-filtration`, `MordellLawrenceVenkateshPartII:M2.2/crystalline-inner-forms`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`.

### 5.5 Bifiltered Frobenius objects and graded types

A bifiltered coefficient Frobenius object is (V,φ,F,f), with Hodge G-filtration F, φ-stable auxiliary G-filtration f and the given semilinear coefficient structure. Its graded type is the G-conjugacy class of (P_f,φ_M,F_M). Forget the numerical indexing of f when defining this type, while retaining the full Hodge indexing of F_M. This forgotten auxiliary indexing is necessary for finiteness; types are not unfiltered characteristic polynomials.

(LS: Definition 8.8 and Remark 8.9, pp. 77–78.)

Use the φ-stable parabolic of f and project φ and F to the Levi quotient. Form conjugacy classes of these quotient data with all defining coefficient tensors.

The working interface consists of the following named declarations.

- `BifilteredFrobenius.mk`: Package two compatible filtrations and φ-stability of the auxiliary one.
- `BifilteredFrobenius.gradedType`: Return the parabolic and filtered Frobenius Levi data up to G-conjugacy.
- `BifilteredFrobenius.reindex_auxiliary`: Strict order-preserving reindexing of f leaves its type unchanged.

Use in LS 8.10 and 8.16: Turns fixed global semisimplification into finitely many local incidence problems.

**Checks.**

- `bifiltered-frobenius-type.1`: Reindex a two-step f from weights (1,0) to (5,0); its type is unchanged.
- `bifiltered-frobenius-type.2`: Changing F from weights (1,0) to (5,0) changes the filtered type.
- `bifiltered-frobenius-type.3`: Two φ-stable flags with identical quotient dimensions but different Frobenius eigenvalues need not have the same type.

The acceptance check is: Auxiliary reindexing changes f as an indexed filtration but does not change its graded type.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/crystalline-inner-forms`, `MordellLawrenceVenkateshPartII:M2.5/induced-levi-filtration`, `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`.

### 5.6 Finite cyclic cocycles in unipotent groups

Let U be a characteristic-zero unipotent algebraic group and ψ an automorphism of finite order dividing r≥1. If uψ(u)⋯ψ^(r−1)(u)=1, there is v∈U with u=v⁻¹ψ(v). Thus H¹(C_r,U)=1 for this action. The finite-order condition on ψ is essential to this argument.

(LS: Lemma 8.13, p. 80.)

Induct along a ψ-stable central series with vector-group quotients. On a vector quotient use the averaging homotopy, dividing by r; lift the correction and continue in the central kernel.

The acceptance check is: For U additive the cocycle relation is the norm-zero relation, which equals the image of ψ−1 in characteristic zero.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`.

### 5.7 Levi factors stable under semisimple Frobenius

If a semisimple element φ of the ambient characteristic-zero group normalizes the connected parabolic P, a unipotent conjugate of a chosen Levi of P is φ-stable. In the norm argument choose r killing the induced finite component action. The relevant cocycle u lies in Z_U(φ^r), where conjugation by φ has order dividing r; do not assume conjugation has finite order on all of U.

(LS: Lemma 8.14, pp. 80–81.)

Write φ relative to a Levi and its unipotent radical and derive the norm relation. Use that φ is semisimple and the norm relation to place the correction in Z_U(φ^r). Apply finite cyclic unipotent cocycle vanishing on this fixed subgroup and conjugate the Levi.

The acceptance check is: A diagonal semisimple matrix can act on a unipotent root group by an eigenvalue of infinite order.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/unipotent-cyclic-cocycle`, `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`.

### 5.8 Finitely many local types from global semisimplification

For fixed global coefficient-group semisimplification ρ^ss and fixed residue Frobenius data, the local bifiltered objects obtained by choosing a global semisimplification flag have only finitely many graded types, and their induced Hodge filtrations are balanced. The assertion concerns the quotient type forgetting auxiliary flag indices. It does not say there are finitely many flags or extensions.

(LS: Lemma 8.10, pp. 78–79.)

Use centralizer-conjugacy finiteness of allowable parabolic/Levi pairs. Apply crystalline comparison to the fixed global quotient representation and global purity to its Hodge weights. Use unipotent conjugacy and the stable-Levi step to compare different splittings without changing the type.

The acceptance check is: Infinitely many auxiliary indexings do not introduce spurious infinitely many types.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/bifiltered-frobenius-type`, `MordellLawrenceVenkateshPartII:M2.5/global-purity-implies-balance`, `MordellLawrenceVenkateshPartII:M2.2/finite-parabolic-levi-types`, `MordellLawrenceVenkateshPartII:M2.5/frobenius-stable-levi`.

### 5.9 Root pairing for opposite flag directions

Fix positive roots Σ⁺ and standard parabolics P,Q containing the positive Borel; let Σ_P,Σ_Q be their full Lie root sets, and Δ_P,Δ_Q the simple roots of their Levis. For w with w⁻¹Δ_P⊂Σ⁺ and wΔ_Q⊂Σ⁺, the map β↦−wβ bijects {β∈Σ\Σ_Q : wβ>0} with {α∈Σ\Σ_P : w⁻¹α>0}; its inverse is α↦−w⁻¹α. Each set has size length(w). The two sign equivalences are β∈Σ\Σ_Q ⇒ (wβ>0 iff −wβ∉Σ_P) and the analogous statement with P,Q,w⁻¹.

(LV: Lemma 11.4 and (11.14), pp. 991–993; LS: proof of Lemma 8.12, pp. 79–80.)

Write tangent dimensions as the root spaces in Lie(U)/(Lie(U)∩Lie(Q)). Use minimality of w to identify the two root sets and check the forward and inverse maps explicitly. Pair the root sums with the Hodge cocharacter, using the inverse-determinant sign fixed earlier.

The acceptance check is: Check rank-one SL₂ directly and a noninvolutive Weyl element of SL₃ so w and w⁻¹ cannot be interchanged.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/tensor-g-filtration`, `MordellLawrenceVenkateshPartII:M2.5/induced-levi-filtration`, `MordellLawrenceVenkateshPartII:M2.5/central-weight-space`.

### 5.10 Semibalanced fixed-graded fibre bound

Let G=H^c over an algebraically closed characteristic-zero field, with H connected reductive of rank t, and let F₀ have uniform single-factor adjoint profile h. Put A=Σ_(a>0)h^a and B=Σ_(a>0)a h^a. For an integer e>0, assume A≥e/c and B>T(e/c)+T((h⁰−t)/2+e/c), with both T arguments in its domain. For every parabolic P and every prescribed induced Levi filtration, its semibalanced fibre inside the orbit G·F₀ has codimension at least e. In the single connected group case, the stronger LV hypotheses A≥e and B>T(e)+T(h⁰/2+e) give codimension strictly greater than e for balanced fibres.

(LS: Lemma 8.12, pp. 79–80, proof pp. 79–80; LV: Proposition 11.3, pp. 990–993.)

Stratify by finitely many P–Q double cosets and compute the dimension of each induced-Levi fibre. Translate semibalance to a nonpositive modular sum; pair its root contributions by the preceding bijection. The largest e/c root weights and the central zero-weight correction cost at most the two displayed top sums. Strict failure of the second inequality would be necessary for a stratum of codimension below e, giving the contradiction.

The acceptance check is: The zero-weight correction is (h⁰−rank H)/2 in LS, whereas the weaker LV bound uses h⁰/2. Track ≥ in the dimension conclusion separately from the strict numerical inequality.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/balanced-filtration`, `MordellLawrenceVenkateshPartII:M2.5/induced-levi-filtration`, `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`, `MordellLawrenceVenkateshPartII:M2.2/uniform-hodge-filtration`, `MordellLawrenceVenkateshPartII:M2.5/weyl-root-pairing`.

### 5.11 Dimension of Frobenius-stable graded pairs

Fix a semisimple Frobenius φ in the algebraic coefficient normalizer. Pairs (P,F_M) with φ∈P and prescribed conjugacy class of the quotient filtered Frobenius data form finitely many centralizer orbits, hence have dimension at most dim Z_G(φ). For an arbitrary φ replace it by φ^ss and use φ-stable Levi reduction; the resulting dimension bound uses dim Z_G(φ^ss). Apply cyclewise to bound the cost by dim H.

(LS: Lemma 8.15, pp. 81–82; LV: §11.6, pp. 993–995.)

Conjugate to a φ-stable Levi, then fix its quotient conjugacy data. Use the finite parabolic/Levi classification to leave finitely many choices modulo Z_G(φ^ss). Bound each orbit by the dimension of its acting centralizer, not by the number of its rational points.

The acceptance check is: Replacing φ by φ^ss can enlarge the centralizer and therefore gives a valid upper bound.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/frobenius-stable-levi`, `MordellLawrenceVenkateshPartII:M2.2/finite-parabolic-levi-types`, `MordellLawrenceVenkateshPartII:M2.2/semilinear-centralizer-bound`, `MordellLawrenceVenkateshPartII:M2.5/bifiltered-frobenius-type`.

### 5.12 Fixed-type codimension under balanced monodromy

Let the coefficient system have uniform single-factor profile h, rank t for H, strongly c-balanced monodromy and a balanced reference graded type. Given a positive integer e, assume A≥(e+dim H)/c and B>T((e+dim H)/c)+T((h⁰−t)/2+(e+dim H)/c), with valid T arguments. In the monodromy period orbit, the locus admitting a φ-stable auxiliary filtration with that graded type has codimension at least e.

(LS: Lemma 8.16, pp. 81–83.)

Balance makes the total modular weight zero; select a Frobenius cycle with nonpositive average modular weight. Choose c independent index-class representatives in that cycle and project smoothly to their flag product. Apply the semibalanced fixed-graded bound with parameter e+dim H. Allow the graded pairs to vary; their dimension costs at most dim H by the semilinear centralizer bound.

The acceptance check is: Both inequalities use the one-factor T_H, rather than a T for the whole restriction-of-scalars group.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/fixed-graded-semibalanced-codimension`, `MordellLawrenceVenkateshPartII:M2.5/graded-pair-dimension`, `MordellLawrenceVenkateshPartII:M2.4/strongly-balanced-monodromy`, `MordellLawrenceVenkateshPartII:M2.5/bifiltered-frobenius-type`, `MordellLawrenceVenkateshPartII:M2.2/uniform-hodge-filtration`.

### Examples

For a 2+2+2 auxiliary flag in GL₆, let a_i be the dimensions contributed by a three-dimensional F¹ to its graded blocks. Then Σa_i=3. Balance is (1,1,1), weak balance is a₀=a₂, and semibalance is a₀≤a₂. The generic pattern (2,1,0) fails semibalance. Conjugation by diag(2,1) acts on an upper root group by multiplication by 2, illustrating the finite-order gap repaired by restricting the cyclic argument to Z_U(φ^r).

### Dependencies

`MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`, `MordellLawrenceVenkateshPartII:M2.2`, `MordellLawrenceVenkateshPartII:M2.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

## Layer 6: The coefficient non-density theorem

Combine global-type finiteness, balanced local types, strongly balanced monodromy and p-adic transcendence. Deduce non-density of all integral points under the two single-factor adjoint Hodge inequalities.

### 6.1 The coefficient non-density theorem

Let 𝓧 be of finite type over Z[S⁻¹] with smooth geometrically connected generic fibre X of dimension d>0. Let V be a pure polarized integral Hodge–Deligne system with integral Frobenius and rational Frobenius characteristic polynomials outside S, an equidimensional E-module of classical rank N and the required coefficient pairing. Assume a uniform factor profile h, strongly c-balanced differential monodromy relative to residue Frobenius and, writing t=rank H, A≥(d+dim H)/c and B>T((d+dim H)/c)+T((h⁰−t)/2+(d+dim H)/c). All T arguments must be in [0,dim H]. Then 𝓧(Z[S⁻¹]) is not Zariski dense in X. No semisimplicity hypothesis is imposed on the actual fibres.

(LS: Theorem 8.17, pp. 83–84.)

There are finitely many global G-semisimplifications by arithmetic finiteness. For each residue disk and each global type, the finite local graded-type reduction supplies balanced types. Apply the codimension theorem with e=d, followed by p-adic period non-density. The integral point set lies in a finite union of the resulting proper algebraic subsets.

The acceptance check is: Keep separate the finite list of semisimplifications and the possibly infinitely many nonsemisimple representations.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/balanced-type-monodromy-codimension`, `MordellLawrenceVenkateshPartII:M2.5/finite-types-from-global-semisimplification`, `MordellLawrenceVenkateshPartII:M2.2/finite-global-g-types`, `MordellLawrenceVenkateshPartII:M2.3/padic-period-nondensity`.

### Examples

The theorem covers nonsplit integral Galois representations: a fixed semisimplification can have infinitely many extension classes. The finite object is the list of global semisimplifications and, after forgetting auxiliary indices, their local graded types.

### Dependencies

`MordellLawrenceVenkateshPartII:M2.2`, `MordellLawrenceVenkateshPartII:M2.3`, `MordellLawrenceVenkateshPartII:M2.5`.

## Layer 7: Higher-dimensional Lawrence–Venkatesh non-density

Compare crystalline fibre functors, place the Hodge torus in the Galois image, choose a uniformly bounded small-centralizer prime and apply the classical bad-filtration estimate. Prove the published Theorem 10.1 and its stronger conditional finiteness clause, and state the corrected independent point-count bound.

### 7.1 Comparing crystalline and forgetful fibre functors

For the neutral tensor category generated by a crystalline p-adic representation V with its intersection/similitude tensors, the forgetful fibre functor and underlying D_cris fibre functor become tensor-isomorphic over Q̄_p. Such an isomorphism identifies their Tannaka groups by conjugacy and preserves every defining pairing tensor. This is an existence statement over the algebraic closure, not a canonical rational comparison.

(LV: Footnote 10, pp. 977–978; LS: Lemma 5.43, pp. 58–59.)

Apply the generic tensor-isomorphism torsor theorem to this proven neutral category. Finite tensor generation makes the relevant torsor finite type, so it has an algebraically closed point. Transport all intersection and multiplier tensors through the chosen point.

The acceptance check is: An arbitrary linear isomorphism of the two vector spaces need not respect the forms.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/crystalline-inner-forms`, `MotivesAndAlgebraicCycles:MC.6`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`.

### 7.2 The Hodge torus in the Galois image

For primitive middle cohomology of a smooth projective variety over Q_p with good reduction, transport the Hodge cocharacter through the crystalline/forgetful tensor comparison. The Zariski closure of the local p-adic Galois image contains a torus conjugate over Q̄_p to the Hodge torus. Apply the tensor-compatible Sen/Wintenberger splitting supplied by R06.2; its compatibility with defining form tensors upgrades the GL assertion to the full similitude group.

(LV: Proof of Lemma 10.4 and footnote 10, pp. 976–978.)

Use the common tensor-compatible Hodge–Tate splitting to construct the cocharacter in the algebraic Galois group. Use fibre comparison to identify its conjugacy class with the de Rham Hodge cocharacter. Levi projection preserves its torus conjugacy class by the semisimplification torus lemma.

The acceptance check is: Do not infer the similitude-group assertion from equality of underlying GL weight multiplicities alone.

*Needs:* `MordellLawrenceVenkateshPartII:M2.7/crystalline-fibre-functor-comparison`, `PadicHodgeTheory:R06.2`, `MordellLawrenceVenkateshPartII:M2.2/coefficient-semisimplification`.

### 7.3 A bounded prime with small Frobenius centralizer

For a fixed smooth projective family over Z[S⁻¹], with fixed primitive middle-cohomology Hodge type and group GAut of the intersection pairing, there is L such that every integral fibre admits a prime ℓ≤L outside S with dim Z_GAut((φ_crys,ℓ)^ss)≤h⁰. Choose an auxiliary prime p outside S large enough for the common shifted Fontaine–Laffaille interval. The bound is uniform in the integral point, not an effective formula for L.

(LV: Lemma 10.4 and proof, pp. 976–978.)

Finitely many auxiliary-p semisimplifications remain by the parent GL finiteness theorem. In each reductive image choose a very regular open subset avoiding its finitely many nontrivial root-weight equalities; Chebotarev supplies one prime per class. The Hodge torus in the image bounds the centralizer dimension by h⁰. Use the externally supplied Katz–Messing polynomial equality and multiplier ℓ^r for middle degree r to transfer the dimension bound to crystalline cohomology at ℓ.

The acceptance check is: Equal Frobenius characteristic polynomials determine the geometric centralizer dimension in the classical form group; no uniqueness of rational conjugacy is asserted.

*Needs:* `MordellLawrenceVenkateshPartII:M2.7/hodge-torus-image-adapter`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`.

### 7.4 Bad self-dual filtrations have large codimension

For a classical similitude space V, Frobenius φ and prescribed filtered Frobenius graded objects of a φ-stable self-dual auxiliary flag, put z=dim Z_GAut(φ^ss). Require each nonzero graded object to have Hodge-weight average r/2, and set e>0. If A≥z+e and B>T(z+e)+T(h⁰/2+z+e), with valid T arguments, the self-dual Hodge filtrations admitting such a flag have codimension at least e in their fixed Hodge-type flag variety. Self-dual middle pieces retain their pairing tensor.

(LV: Proposition 10.6, pp. 981–982, conclusion §11.6, pp. 993–995.)

Reduce to semisimple φ, which only enlarges the relevant incidence locus. Stratify by finitely many conjugacy types of self-dual flags; graded-pair variation costs at most z. Apply the connected balanced fixed-graded estimate with parameter z+e, then project the incidence locus to the Hodge flag variety.

The acceptance check is: Use A≥z+e as printed in the published article, not the unnecessarily strict inequality in arXiv v3.

*Needs:* `MordellLawrenceVenkateshPartII:M2.5/fixed-graded-semibalanced-codimension`, `MordellLawrenceVenkateshPartII:M2.5/graded-pair-dimension`, `MordellLawrenceVenkateshPartII:M2.5/global-purity-implies-balance`, `MordellLawrenceVenkateshPartII:M2.5/bifiltered-frobenius-type`.

### 7.5 Classical semisimplification fibres are nondense

Under the two numerical inequalities of the following theorem, fix ℓ∉S and a residue point with crystalline semisimple centralizer dimension at most h⁰. Integral points in its residue disk whose global ℓ-adic representations have a prescribed semisimplification form a nondense subset of the base. Global semisimplification flags are self-dual after pairing dual constituents, and each graded Hodge average is r/2 by global purity over Q.

(LV: Lemma 10.5, pp. 979–981.)

Construct paired self-dual semisimplification flags and transport their graded data through D_cris. Use the small centralizer and the bad-filtration bound with e=dim Y. Apply the common p-adic transfer theorem on the disk.

The acceptance check is: Actual representations may be nonsplit; only their global semisimplifications are fixed.

*Needs:* `MordellLawrenceVenkateshPartII:M2.7/classical-bad-filtration-codimension`, `MordellLawrenceVenkateshPartII:M2.3/padic-period-nondensity`, `MordellLawrenceVenkateshPartII:M2.5/global-purity-implies-balance`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`.

### 7.6 Higher-dimensional integral-point non-density

Let 𝓨 be smooth of finite type over Z[S⁻¹], and let π:𝓩→𝓨 be smooth projective with geometrically connected relative dimension r, a relative ample class, and smooth geometrically connected generic base Y/Q of dimension d>0. Let V be primitive degree-r cohomology and assume the Zariski closure of geometric monodromy contains Aut(V,⟨,⟩)°, the identity component of the isometry group. Its adjoint profile is still computed in the similitude group GAut(V,⟨,⟩). For its adjoint profile require A≥h⁰+d and B>T(h⁰+d)+T(3h⁰/2+d), with valid T arguments. Then 𝓨(Z[S⁻¹]) is not Zariski dense in Y. The theorem is the classical first instance of the shared period/codimension mechanism; the bounded-prime step is distinct from the coefficient-orbit construction.

(LV: Theorem 10.1, pp. 969–970, monodromy hypothesis (10.1), p. 968; proofs §§10.3–10.5, pp. 975–982.)

Choose finitely many possible small-centralizer primes using the bounded-prime lemma. For each prime, parent arithmetic finiteness leaves finitely many semisimplifications and finitely many residue disks. Apply the preceding nondensity theorem to each resulting fibre and take their finite union.

The acceptance check is: This theorem gives nondensity without assuming full monodromy on subvarieties. For an elliptic family, geometric monodromy may be Sp₂=SL₂ while the similitude group is GSp₂=GL₂. The monodromy hypothesis must not demand the scalar similitude direction.

*Needs:* `MordellLawrenceVenkateshPartII:M2.7/bounded-small-frobenius-centralizer`, `MordellLawrenceVenkateshPartII:M2.7/classical-semisimplification-fibre`, `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`.

### 7.7 Finiteness under monodromy on every subvariety

In the preceding setup, assume every positive-dimensional geometrically irreducible subvariety of Y retains the full connected primitive isometry monodromy after passage to its smooth locus and finite field of definition, with the required rational arithmetic model or restriction-of-scalars comparison. Then the integral point set is finite. This stronger monodromy condition is an additional hypothesis; it is not established for the universal hypersurface family by large generic monodromy alone.

(LV: Theorem 10.1, final assertion, p. 970.)

Apply nondensity on every positive-dimensional irreducible component of the closure of the integral points, over its field of definition with the specified arithmetic comparison. Use Noetherian induction on the proper closed subsets until only zero-dimensional components remain.

The acceptance check is: A family with a positive-dimensional isotrivial subvariety does not meet this stronger hypothesis.

*Needs:* `MordellLawrenceVenkateshPartII:M2.7/higher-dimensional-nondensity`.

### 7.8 A point-count bound for Frobenius centralizers

For a smooth degree-d hypersurface of dimension n≥2 over F_q, let b>0 be the dimension of primitive middle cohomology. For every integer N≥1 satisfying q^((n/2+1)·2N)<b/3, the GL-centralizer of semisimple Frobenius has dimension at most 3b²/N. Thus the largest such positive N gives the strongest stated estimate whenever one exists. The assertion is independent of the bounded-prime argument and is not used to claim a computable universal prime bound.

(LV: Lemma 12.1 and proof, pp. 995–996, corrected Fourier cutoff.)

Normalize Frobenius eigenvalues onto the unit circle using purity and identify centralizer dimension with the sum of squared eigenvalue multiplicities. Use the squared Dirichlet kernel with frequencies −2N,…,2N and coefficients 2N+1−|j| to bound this sum by its weighted power sums. Use the complete-intersection trace identity to cancel the ambient P^n terms. The elementary bounds 0≤#Y(F_(q^j))≤#P^(n+1)(F_(q^j)) imply |Σ_s(λ_s/q^(n/2))^j|≤q^((n/2+1)j). Apply this through frequency 2N and the displayed cutoff; sum the geometric series to obtain the constant 3.

The acceptance check is: N=0 is excluded. The exponent 2N is required because squaring the kernel doubles its Fourier support.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`, `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `WeilConjectures:WC.5/complete-intersection-point-count`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`.

### Examples

For middle degree r=2, a Frobenius eigenvalue λ is paired with ℓ²/λ. Using ℓ/λ gives the wrong form-group centralizer. In the independent kernel estimate, N=1 already produces frequencies −2,−1,0,1,2; a cutoff at frequency 1 cannot prove the stated bound.

### Dependencies

`DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`, `MordellLawrenceVenkateshPartII:M2.2`, `MordellLawrenceVenkateshPartII:M2.3`, `MordellLawrenceVenkateshPartII:M2.5`, `MotivesAndAlgebraicCycles:MC.6`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.2/plan/admissible-category-tannakian`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `WeilConjectures:WC.5/complete-intersection-point-count`.

## Layer 8: Eulerian profiles and numerical criteria

Compute classical adjoint profiles of twisted abelian hypersurfaces and show that enough independent factors satisfy the coefficient inequalities. Derive projective hypersurface Hodge numbers from residues, their Eulerian asymptotics and the large-dimension/large-degree LV inequalities.

### 8.1 Classical adjoint profiles from Eulerian multiplicities

For smooth ample hypersurfaces in an n-dimensional abelian variety, n≥2 and normalized degree d>0, import m_q=d·A(n,q), 0≤q<n, and N=n!d from SC.3. The adjoint weights of GL_N, GSp_N or GO_N are obtained from End(V), Sym²(V) or ∧²(V), with the scalar multiplier direction in degree zero for the similitude groups. For the geometric parity choices GL in either parity, GSp when n is even and GO when n is odd, 2h⁰<dim H+rank H. In particular (h⁰−rank H)/2<A. The opposite, nongeometric parity choices are not part of this assertion.

(LS: Lemma A.1, pp. 89–90.)

Compute zero-weight multiplicities: for GL use Σm_q²; for GSp use (Σm_q²+m_mid)/2+1; for GO use (Σm_q²−m_mid)/2+1, where m_mid=0 if there is no central index. Combine the Eulerian convolution estimate below with the explicit dimensions and ranks, retaining the strict rank correction.

The acceptance check is: For n=2,d=1, m=(1,1); GL₂ and GSp₂ satisfy the assertion, while arbitrary GO₂ is not the geometric pairing case.

*Needs:* `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`, `SheafConvolutionOnAbelianVarieties:SC.3/torsion-twist-hodge-tate`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `MordellLawrenceVenkateshPartII:M2.8/eulerian-central-mass`.

### 8.2 Difference distribution of Eulerian weights

For n≥2 define α_q=A(n,q)/n!, extended by zero outside 0≤q<n, and β_j=Σ_q α_q α_(q−j), j∈Z. This is the distribution of the difference of two independent ascent counts, not of their sum without recentering. It is a symmetric, finitely supported probability distribution and is the normalized GL adjoint multiplicity profile.

(LS: Lemma A.2, p. 90; LV: §10.2, pp. 972–974.)

Import Eulerian numbers and their permutation-count interpretation from their combinatorial owner. Form the finite convolution with reflected index and prove normalization by a double sum.

The working interface consists of the following named declarations.

- `EulerianDifference.mass`: The finite sum β_j with the stated zero extension.
- `EulerianDifference.total_mass`: β is nonnegative and sums to one.
- `EulerianDifference.symmetric`: β_(−j)=β_j and its multiplicities match End(V) after normalization.

Use in LS A.3–A.6; LV 10.2: Supplies exact second moments, the central mass bound and adjoint asymptotics.

**Checks.**

- `eulerian-difference-law.1`: For n=2, β_0=1/2 and β_1=β_(−1)=1/4.
- `eulerian-difference-law.2`: For n=3 with Eulerian vector (1,4,1), β_0=1/2, β_1=2/9 and β_2=1/36.
- `eulerian-difference-law.3`: Every β_j vanishes for |j|≥n, ruling out an infinite-tailed approximation as the definition.

The acceptance check is: Changing q−j to j−q is harmless only after proving symmetry of the individual Eulerian distribution.

*Needs:* `ClassicalArithmeticCompletion:CA.2/eulerian-numbers`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

### 8.3 Second moment and log-concavity

For n≥2, the Eulerian difference law has mean zero, second moment (n+1)/6 and log-concave masses. Its one-copy centered ascent law has variance (n+1)/12. Log-concavity here is on contiguous integer support, so convolution and reflection preserve it; zeros outside the support are handled explicitly.

(LS: Lemmas A.2–A.3, pp. 90–91; LV: (10.9), pp. 972–973.)

Use the combinatorial owner’s adjacent-ascent indicator computation for the one-copy variance. Independence doubles variance in the difference. Use Eulerian log-concavity and the finite-sequence convolution theorem, both requested from CA.2.

The acceptance check is: At n=2 the difference variance is 1/2, not √(1/2).

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/eulerian-difference-law`, `ClassicalArithmeticCompletion:CA.2`, `ClassicalArithmeticCompletion:CA.2/eulerian-numbers`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

### 8.4 The central Eulerian convolution mass is at most one half

For every n≥2 the difference law satisfies β₀≤1/2. For n≥9, assuming β₀>1/2 and using symmetry and log-concavity forces cumulative tails Σ_(j≥k)β_j<Σ_(j≥k)1/(2·3^j), k≥1, which gives a strict upper bound of 3/2 for its second moment, contradicting (n+1)/6≥5/3. Verify 2≤n≤8 by exact Eulerian integer sums.

(LS: Lemmas A.4–A.6, pp. 91–92.)

Compare cumulative tails with the reference geometric sequence: total positive mass is below 1/4; a first crossing below the reference sequence stays below thereafter by log-concavity, excluding any larger tail. Use summation by tails, Σ_j j²β_j=2Σ_(k≥1)(2k−1)Σ_(j≥k)β_j, to bound the moment by 3/2; compare with the exact variance. Compute the finite small cases without floating-point rounding.

The acceptance check is: Equality occurs at n=2 and n=3. The tail inequality has direction <; reversing it invalidates the contradiction.

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/eulerian-second-moment-logconcavity`.

### 8.5 Enough independent factors satisfy the coefficient inequalities

For the geometric Eulerian profile above and every fixed integer e>0, there is an integer c₀≥1 such that all c≥c₀ satisfy A≥(e+dim H)/c and B>T((e+dim H)/c)+T((h⁰−rank H)/2+(e+dim H)/c), with arguments in the domain. The same choice implies the simpler semisimple numerical inequality. No bound uniform in arbitrary Hodge profiles is asserted.

(LS: Proof of Theorem 9.2, pp. 85–87, and Lemma A.1, pp. 89–90.)

Use (h⁰−rank H)/2<A to obtain T((h⁰−rank H)/2)<T(A)=B. Use continuity and monotonicity of T on the positive-weight interval and (e+dim H)/c→0. Choose c sufficiently large for the first inequality and both domain constraints.

The acceptance check is: The strict gap is needed before taking the continuity limit.

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/eulerian-adjoint-profile`, `MordellLawrenceVenkateshPartII:M2.8/eulerian-central-mass`, `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`.

### 8.6 Primitive hypersurface Hodge numbers from the Jacobian ring

For a smooth degree-d hypersurface in P^n over C with n≥2 and d≥2, the primitive middle Hodge multiplicity h^{p,n−1−p} equals the coefficient of t^((p+1)d−n−1) in (1+t+⋯+t^(d−2))^(n+1), for 0≤p<n. Use the residue/Jacobian identification and the regular-sequence Hilbert series for the n+1 partial derivatives. This supplies the omitted justification of LV (10.6).

(BC: Batyrev–Cox Theorems 10.6 and 10.13, Remark 10.14, PDF pp. 30–34, specialized to projective space; LV: (10.6), pp. 971–972.)

Specialize the toric residue construction to the Cox ring C[x₀,…,x_n], with degree class d and anticanonical degree n+1. Smoothness makes the partial derivatives a homogeneous regular sequence; its Hilbert series is (1−t^(d−1))^(n+1)/(1−t)^(n+1). Use residue Hodge degree and symmetry to obtain the displayed coefficient.

The acceptance check is: For a smooth plane cubic, the primitive Hodge numbers are (1,1). For a quartic surface in P³, primitive h=(1,19,1), not the full h=(1,20,1).

*Needs:* `AlgebraicModuliForArithmeticGeometry:R09.2`, `HodgeStructuresPartII:H.2/geometric-pure`.

### 8.7 Eulerian asymptotics of projective hypersurface cohomology

Fix n≥2. As d→∞, primitive h^{p,n−1−p}(d)∼d^n A(n,p)/n! for 0≤p<n. After adjoint formation, h^a/(d^(2n)/2)→β_a for the orthogonal or symplectic similitude group. The universal parameter space has dimension binomial(n+d,d)−1=O(d^n), hence dim Y/h⁰→0. Here n is ambient dimension; the hypersurface dimension is n−1.

(LV: LV (10.6)–(10.8), pp. 971–972, with corrected parameter dimension.)

Expand the coefficient formula by inclusion–exclusion; its leading d^n coefficient is the Eulerian finite-difference formula. Compute adjoint multiplicities from symmetric/exterior squares; diagonal terms and the scalar direction have lower order. Compare the parameter-space growth O(d^n) with adjoint h⁰ of order d^(2n).

The acceptance check is: The parameter dimension is binomial(n+d,d)−1. For plane quartics it is 14, whereas the published binomial(n+d,d−1)−1 gives 19; plane cubics give 9 under both formulas.

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/projective-jacobian-hodge-formula`, `MordellLawrenceVenkateshPartII:M2.8/eulerian-difference-law`, `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`.

### 8.8 Normal-limit estimates for adjoint Eulerian weights

As n→∞ the centered ascent count divided by √n converges in law to N(0,1/12); its independent difference converges to N(0,1/6). Consequently Σ_(a>0)aβ_a≥C√n for some C>0 and all sufficiently large n. Log-concavity and the variance imply β₀<40/√n for sufficiently large n. For each fixed c>0 the sum of the largest c/√n fraction of difference weights is o(√n).

(LV: Lemma 10.3 and (10.9)–(10.12), pp. 972–974.)

Import the Eulerian central limit theorem from its common combinatorial/probabilistic supplier rather than reproving that theorem here. Use bounded second moments for uniform integrability of the first moment. Combine log-concavity with the variance bound for the central-mass estimate; control the upper-tail partial sum by Cauchy–Schwarz.

The acceptance check is: Convergence in distribution alone does not imply convergence of unbounded first moments; include uniform integrability.

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/eulerian-second-moment-logconcavity`, `ClassicalArithmeticCompletion:CA.2`, `ClassicalArithmeticCompletion:CA.2/eulerian-numbers`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`.

### 8.9 Large ambient dimension and degree satisfy the LV inequalities

There is n₀ such that for every n≥n₀ there exists D₀(n) with the published LV inequalities A≥h⁰+dim Y and B>T(h⁰+dim Y)+T(3h⁰/2+dim Y) for all d≥D₀(n), for the primitive universal degree-d hypersurface profile in P^n. All top-sum arguments lie in their finite domains. Limits are taken first in d for fixed n, then in n; no joint-limit uniformity is claimed.

(LV: Proposition 10.2 and proof, pp. 970–975.)

Normalize adjoint profiles by d^(2n)/2 and pass to β at fixed n. The positive first moment has size √n, while each discarded top fraction of order 1/√n has sum o(√n). Choose n large for a strict numerical margin; then choose d large so the asymptotic errors and dim Y/h⁰ preserve that margin.

The acceptance check is: The final threshold depends on n; exchanging the order of limits requires an additional estimate.

*Needs:* `MordellLawrenceVenkateshPartII:M2.8/projective-eulerian-asymptotics`, `MordellLawrenceVenkateshPartII:M2.8/eulerian-normal-limit-adapter`, `MordellLawrenceVenkateshPartII:M2.2/adjoint-hodge-profile`.

### Examples

For n=2 the Eulerian vector is (1,1) and its normalized difference law is (1/4,1/2,1/4), with variance 1/2. For n=3 it is (1,4,1) and β₀=1/2. A quartic surface has primitive Hodge vector (1,19,1), whereas the full middle cohomology has (1,20,1). These pin the convolution normalization and the primitive projector.

### Dependencies

`AlgebraicModuliForArithmeticGeometry:R09.2`, `ClassicalArithmeticCompletion:CA.2`, `ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities`, `ClassicalArithmeticCompletion:CA.2/eulerian-numbers`, `HodgeStructuresPartII:H.2/geometric-pure`, `MordellLawrenceVenkateshPartII:M2.2`, `SheafConvolutionOnAbelianVarieties:SC.3/hypersurface-euler-characteristics`, `SheafConvolutionOnAbelianVarieties:SC.3/torsion-twist-hodge-tate`.

## Layer 9: Projective hypersurface application

Construct the universal smooth degree-d family with its actual coefficient-space dimension, apply the parity-correct Beauville monodromy input in a safe range, and prove non-density of integral parameters for large ambient dimension and degree.

### 9.1 Universal smooth projective hypersurfaces

For n≥2,d≥2 let Y_nd be the smooth-hypersurface open of P(H⁰(P^n,O(d))) over Z after specifying its discriminant and any required inverted primes. It has dimension binomial(n+d,d)−1 and carries the universal smooth projective degree-d hypersurface with relative O(1). Primitive middle cohomology is the kernel of the Lefschetz pairing map, with its nondegenerate intersection form. This parameter space retains equations up to scalar; it is not the quotient by PGL_(n+1).

(LV: LV Proposition 10.2, pp. 970–971.)

Use the projective space of coefficients, universal equation and open smoothness locus. Use EDC.4/complete-intersection-cohomology and the existing realization comparisons. The ambient middle Tate line in even dimension has nonzero self-pairing equal to the degree, so its orthogonal complement is a rational primitive summand with nondegenerate pairing. LPV.4 alone supplies only a radical quotient; general hard Lefschetz is unnecessary for this hypersurface calculation.

The working interface consists of the following named declarations.

- `ProjectiveHypersurfaceFamily.parameter`: The discriminant complement in the projective coefficient space.
- `ProjectiveHypersurfaceFamily.universal`: Its universal smooth projective family with O(1).
- `ProjectiveHypersurfaceFamily.primitive_comparison`: Primitive projectors agree under Betti, de Rham, étale and crystalline comparisons.

Use in LV Proposition 10.2: Supplies the actual parameter dimension and the family to which non-density applies.

**Checks.**

- `universal-projective-family.1`: For plane cubics the parameter space has dimension 9, whereas the coarse elliptic moduli space has dimension 1.
- `universal-projective-family.2`: The discriminant equation vanishes on a double hyperplane, which is excluded from the open.
- `universal-projective-family.3`: For quartic surfaces, primitive degree-two rank is 21 rather than the full rank 22.

The acceptance check is: The primitive projector need not preserve the original integral lattice; use its rational image intersected with a lattice.

*Needs:* `AlgebraicModuliForArithmeticGeometry:R09.2`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`.

### 9.2 Large connected monodromy for universal hypersurfaces

For universal smooth degree-d hypersurfaces in P^n over C, in the safe range n≥4,d≥4, the Zariski closure of primitive middle-cohomology monodromy contains the identity component of the intersection-form group: symplectic for middle dimension n−1 odd, special orthogonal for n−1 even. Use Beauville’s arithmetic monodromy theorems, with their low-degree finite exceptions excluded by this range. The scalar similitude direction is arithmetic and need not occur in geometric monodromy.

(B: Beauville, Théorèmes 2 and 4, printed pp. 10–12, and §1 pp. 8–9; LV: §10.2, p. 971.)

Use the primitive vanishing-cycle lattice and reflection/transvection formulas supplied by LPV.2–4. Apply Beauville’s finite-index arithmetic monodromy theorem in each parity, excluding quadrics and the cubic-surface case. Use Zariski density of the resulting infinite arithmetic form group in its connected algebraic group.

The acceptance check is: LPV.5 supplies open symplectic monodromy and a conditional orthogonal open-or-finite alternative. Excluding the finite alternative for this universal family and obtaining Beauville’s arithmetic finite-index theorem remain separate supplier work.

*Needs:* `MordellLawrenceVenkateshPartII:M2.9/universal-projective-family`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`.

### 9.3 Non-density of integral hypersurface parameters

There exists n₀≥4 and for each n≥n₀ a bound D₀(n)≥4 such that for all d≥D₀(n), Y_nd(Z[S⁻¹]) is contained in a proper algebraic subset of Y_nd,Q, for every finite set S after the required model primes are included. This is the fixed-integral-model interpretation of projective hypersurfaces with good reduction. It proves non-density in the universal parameter space and makes no finiteness claim for its PGL quotient.

(LV: LV Proposition 10.2, pp. 970–975.)

Use the exact universal family, its primitive full connected monodromy and the large-n,large-d numerical inequalities. Apply the higher-dimensional non-density theorem. Keep the chosen integral parameter model when translating good reduction to integral points.

The acceptance check is: Good reduction after an arbitrary rational change of projective coordinates requires its own integral-moduli comparison; it is not inferred from one parameter chart.

*Needs:* `MordellLawrenceVenkateshPartII:M2.9/universal-projective-family`, `MordellLawrenceVenkateshPartII:M2.9/beauville-monodromy-adapter`, `MordellLawrenceVenkateshPartII:M2.8/large-dimension-degree-criterion`, `MordellLawrenceVenkateshPartII:M2.7/higher-dimensional-nondensity`.

### Examples

Plane cubics give a nine-dimensional coefficient parameter space, although elliptic moduli is one-dimensional. A double hyperplane is excluded by the discriminant open. The theorem concerns integral parameters of the specified model, and does not equate all coordinate changes with integral coordinate changes.

### Dependencies

`AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `MordellLawrenceVenkateshPartII:M2.7`, `MordellLawrenceVenkateshPartII:M2.8`.

## Layer 10: Hypersurface Shafarevich finiteness

Parameterize smooth ample divisors of fixed class, transfer integral points by finite étale restriction of scalars and resolve their dense closure over a smooth open. Apply the coefficient theorem to nontranslation families, obtain primitive finiteness, pass through finite stabilizer quotients and rational translation descent, and treat the abelian-surface case by fixed-genus curve finiteness and a positive Hom lattice.

### 10.1 Good reduction and primitive hypersurfaces

Fix a number field K, finite S, an abelian variety A/K with abelian scheme model 𝓐 over O_K[S⁻¹], and a smooth ample effective divisor H⊂A. Good reduction outside S means its schematic closure in 𝓐 is smooth over O_K[S⁻¹]. The translation stabilizer Stab(H) is the finite group scheme of a with H+a=H; H is primitive when Stab(H)(K̄)={0}. Only nonzero translations are excluded, since translation by zero always fixes H.

(LS: Definition 9.1, p. 85; §1, p. 1.)

Use the abelian scheme and schematic closure with their canonical translation action. Represent the stabilizer as the fibre of the Hilbert orbit map; ampleness implies finiteness, and characteristic zero makes it reduced.

The working interface consists of the following named declarations.

- `AbelianHypersurface.goodReduction`: Smoothness of the closure in the chosen abelian model.
- `AbelianHypersurface.translationStabilizer`: Finite subgroup scheme representing translations preserving H.
- `AbelianHypersurface.primitive_iff`: Primitive exactly when every geometric stabilizing translation is zero.

Use in LS 9.2 and 9.3: Defines the arithmetic set and separates primitive from isogeny-pullback cases.

**Checks.**

- `good-reduction-primitive-hypersurface.1`: Translation by zero fixes every H but does not make every H nonprimitive.
- `good-reduction-primitive-hypersurface.2`: Pulling a divisor back under a nontrivial étale isogeny gives a divisor stabilized by its nonzero kernel points.
- `good-reduction-primitive-hypersurface.3`: A K-rational translation of a smooth closure remains smooth over the same ring.

The acceptance check is: For a∈A(K), properness extends a over O_K[S⁻¹], so its translation preserves good reduction.

*Needs:* `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `AbelianSchemesAndArithmeticModuli:A1/relative-rigidity-comparison`, `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`.

### 10.2 A parameter space for smooth ample divisors

For A/K and fixed ample numerical class φ, construct a finite-type quasi-projective K-scheme parameterizing smooth effective divisors with class φ, together with its universal divisor in A×Y. Use a Hilbert polynomial for a fixed auxiliary ample line bundle, and the union of the corresponding numerical-class components. Over an enlarged S, closures with good reduction give integral points of this parameter space. Translation by A acts algebraically and preserves the numerical class.

(LS: Proof of Theorem 9.2, pp. 85–86.)

Compute the fixed Hilbert polynomial by Riemann–Roch for divisor class φ relative to the chosen auxiliary polarization. Use Hilbert representability and take the smooth Cartier-divisor open with the specified numerical class. Spread the universal family and its translation action over a finite localization of O_K.

The working interface consists of the following named declarations.

- `AbelianDivisorParameter.mk`: Finite-type parameter scheme for smooth divisors in the fixed class.
- `AbelianDivisorParameter.universal`: Universal smooth divisor and its embedding in A×Y.
- `AbelianDivisorParameter.integral_point`: A smooth closure over the model ring determines the corresponding integral Hilbert point.

Use in LS 9.2: Turns the Shafarevich set into a set of integral parameters.

**Checks.**

- `abelian-divisor-parameter-space.1`: Translates of H determine points of the same numerical-class parameter space.
- `abelian-divisor-parameter-space.2`: A divisor of a different intersection degree with the auxiliary polarization is excluded.
- `abelian-divisor-parameter-space.3`: A singular flat divisor lies in the Hilbert scheme but outside this smooth open.

The acceptance check is: The parameter scheme is not a presumed fine quotient by translations.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/good-reduction-primitive-hypersurface`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AbelianSchemesAndArithmeticModuli:A2`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`.

### 10.3 Restriction of scalars and integral parameters

After enlarging a finite set S′ of rational primes so O_K[S⁻¹] is finite étale over Z[S′⁻¹], the quasi-projective divisor parameter scheme admits a scheme-valued Weil restriction X/Q with an integral model. Its integral points identify with the original O_K[S⁻¹]-points. Use the existing A6 restriction-of-scalars functor and its universal property; use A6’s imported quasi-projective representability criterion. The abelian variety restriction is again abelian in this finite étale setting.

(LS: Proof of Theorem 9.2, pp. 85–86.)

Enlarge S′ to include ramified primes and spread the quasi-projective embedding. Apply representability and the functor-of-points adjunction to the integral model. Preserve the original family over K for twisted cohomology while using X/Q as its arithmetic base.

The acceptance check is: Do not claim properness of Weil restriction across a ramified integral extension without a theorem.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/abelian-divisor-parameter-space`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`.

### 10.4 Reducing a dense arithmetic closure to a smooth base

Let a set of integral points in a finite-type characteristic-zero parameter scheme be Zariski dense in an irreducible component C of its closure. Resolve C properly by X→C, isomorphic over a dense smooth open U. The points in U have unique rational lifts, and after spreading out the proper map these lifts are integral by the valuative criterion. They are dense in X. Points outside U are handled through the finitely many closure components or Noetherian induction, rather than by assuming every rational point of C lifts.

(LS: Proof of Theorem 9.2, pp. 85–86.)

Restrict to the dense open where resolution is an isomorphism. Use density to retain a dense subset of the integral points in that open. Apply properness over the model to extend their rational lifts at every prime outside the enlarged set.

The acceptance check is: A rational point lying over a singular exceptional fibre need not lift rationally; the dense-open restriction prevents that error.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/weil-restriction-arithmetic-adapter`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`.

### 10.5 Nonconstant abelian-divisor families are arithmetically nondense

For a smooth positive-dimensional arithmetic base X/Q arising above, suppose its universal family of primitive smooth ample divisors in A is nonconstant up to geometric translation. Assume n=dim A≥4, or n=3 and normalized degree d=φ^n/n! avoids SC.5’s exceptional degrees D_j, j≥1. Then its integral parameter set is not Zariski dense. Choose c using the Eulerian numerical criterion and then use SC.8’s conjugate-uniform torsion orbit to construct the compatible coefficient system.

(LS: Proof of Theorem 9.2, pp. 86–87.)

Choose a good p and a torsion character of order prime to p with all required conjugate monodromy properties. Construct the orbit coefficient system, its integral lattice, polarization, uniform Eulerian profile and strong c-balance. Apply the coefficient non-density theorem to this positive-dimensional base.

The acceptance check is: The monodromy hypothesis applies to a nonconstant-up-to-translation family, not to every positive-dimensional Hilbert family.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/dense-closure-proper-resolution`, `MordellLawrenceVenkateshPartII:M2.4/torsion-orbit-strong-balance`, `MordellLawrenceVenkateshPartII:M2.8/large-c-numerical-criterion`, `MordellLawrenceVenkateshPartII:M2.6/integral-points-nondense`, `SheafConvolutionOnAbelianVarieties:SC.5/exceptional-degree`, `SheafConvolutionOnAbelianVarieties:SC.6/classical-monodromy`, `MordellLawrenceVenkateshPartII:M2.1/rational-orbit-frobenius-polynomials`.

### 10.6 Primitive hypersurface Shafarevich finiteness

For A/K, good reduction outside S and fixed ample class φ, primitive smooth hypersurfaces in class φ with good reduction outside S form finitely many geometric translation classes when n≥4, or when n=3 and d=φ³/6 is not an exceptional D_j, j≥1. Translation orbits in the divisor parameter scheme are closed because A is proper. Hence an irreducible component containing a dense arithmetic set either lies in one orbit or contradicts the nontranslation-family theorem.

(LS: Theorem 9.2, pp. 85–87.)

Take the irreducible components of the arithmetic closure and apply the smooth-base reduction. If the generic family is not translation constant, nondensity contradicts density of its lifted integral parameters. If it is translation constant, the closed translation orbit contains the whole component, including its boundary. There are finitely many components and therefore finitely many geometric translation classes.

The acceptance check is: Closedness of the proper orbit accounts for boundary points without assuming that a dense open exhausts the component.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/nontranslation-family-nondensity`, `MordellLawrenceVenkateshPartII:M2.10/abelian-divisor-parameter-space`.

### 10.7 Finite stabilizers and primitive isogeny quotients

Every smooth ample hypersurface H in A is the inverse image of a primitive smooth ample divisor H′ in A/T, where T=Stab(H) is finite and the quotient isogeny has degree |T|. Its normalized degree satisfies d(H)=|T|d(H′). For fixed numerical class, only finitely many possible kernels T occur: their orders divide d(H), and each lies in the finite torsion subgroup A[m] for a common multiple m. Descent of the quotient and H′ is over K.

(LS: Corollary 9.3 and proof, p. 87.)

Use finite flat quotient and descent of a T-invariant Cartier divisor along the characteristic-zero étale isogeny. Use the projection formula to compare top self-intersections. Bound the group orders by d and embed all kernels into A[m], leaving finitely many subgroup schemes.

The acceptance check is: A fixed order permits finitely many subgroup schemes of the fixed finite torsion group, not finitely many arbitrary finite group schemes.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/good-reduction-primitive-hypersurface`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `AbelianSchemesAndArithmeticModuli:A3/theta-group`.

### 10.8 From geometric translations to A(K)-translations

For a fixed K-defined smooth ample divisor H with finite stabilizer T, K-defined geometric translates are parameterized by (A/T)(K) inside its orbit. Their A(K)-translation classes inject into (A/T)(K)/πA(K), a finite group by weak Mordell–Weil for the isogeny π. For primitive H, T=0 and geometric translation between two K-defined divisors is uniquely K-rational. Thus a finite list of geometric translation classes gives a finite list modulo A(K).

(LS: Arithmetic descent of the translation conclusion in Theorem 9.2 and Corollary 9.3, pp. 85–87.)

Identify the proper orbit with A/T and its K-points. Choose an integer m such that [m] on A/T factors through π; the quotient by πA(K) is a quotient of the finite weak-Mordell–Weil group modulo m. For primitive H use uniqueness of the translating point to descend directly by Galois invariance.

The acceptance check is: For nonprimitive H a rational orbit point need not lift to A(K); finite isogeny cokernel, rather than surjectivity, is the correct statement.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/stabilizer-isogeny-reduction`, `HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`.

### 10.9 Shafarevich finiteness for all smooth ample hypersurfaces

For A/K of dimension n≥4 and fixed ample numerical class φ, smooth hypersurfaces representing φ with good reduction outside S form finitely many A(K)-translation classes. For n=3 the same holds if d=φ³/6 is not divisible by any exceptional D_j, j≥1. Equivalently φ³ is not divisible by the source integer d_i=6D_(i−1) for i≥2. The primitive theorem only excludes equality d=D_j; the all-hypersurface theorem must exclude divisibility.

(LS: Corollary 9.3 and Theorems 9.4–9.5, pp. 87–88.)

Enlarge S uniformly by the finitely many primes dividing d, so all possible bounded-order kernels extend étale and the quotient divisors have smooth reduction. Apply the primitive theorem on the finitely many isogeny quotients. An exceptional quotient degree D_j would force D_j to divide d, excluded by hypothesis. Pull back the finite lists and use rational translation descent.

The acceptance check is: Keep normalized d and unnormalized φ³ separate; the first excluded normalized degree is 8855.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/primitive-shafarevich-finiteness`, `MordellLawrenceVenkateshPartII:M2.10/stabilizer-isogeny-reduction`, `MordellLawrenceVenkateshPartII:M2.10/rational-translation-descent`, `SheafConvolutionOnAbelianVarieties:SC.5/exceptional-degree`.

### 10.10 The abelian-surface case through curves

For an abelian surface A/K, fixed ample class φ and finite S, smooth hypersurfaces with good reduction outside S form finitely many A(K)-translation classes. Adjunction fixes their genus g=1+φ²/2≥2. Shafarevich finiteness for curves gives finitely many curve isomorphism classes. For each curve, pointed maps to A are homomorphisms from its Jacobian, and the fixed divisor class bounds a positive definite Rosati quadratic form on the finitely generated Hom group.

(LS: Theorem 9.6 and proof, p. 88.)

Use the curve Shafarevich consequence of R28.5, requiring the separate Torelli/good-reduction input recorded as a gap, and choose a point after a finite extension for each of the finitely many curves. Write each embedding as a translation plus a Jacobian homomorphism. Use the Rosati-positive form q(f)=f_*[C]·ψ, retaining pushforward multiplicity, to bound the finite-rank Hom lattice. Return from geometric translations to A(K)-translations by rational descent.

The acceptance check is: The unweighted image cycle is not quadratic in f; pushforward multiplicity is necessary. This case does not invoke the n>2 classical hypersurface monodromy theorem.

*Needs:* `MordellLawrenceVenkateshPartII:M2.10/rational-translation-descent`, `FaltingsFinitenessAndIsogenyTheorems:R28.5/shafarevich-finiteness`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`.

### Examples

The exceptional pair (5,20) gives D₁=binomial(25,5)/6=8855. Primitive degree 2D₁ avoids equality with D₁ but can still have an exceptional isogeny quotient, so the all-hypersurface theorem excludes divisibility. For an abelian surface, adjunction gives genus 1+φ²/2≥2. If f is multiplied by m, the pushforward intersection q(mf) scales by m²; the reduced image cycle would not record that scaling.

### Dependencies

`AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A1/relative-rigidity-comparison`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `AbelianSchemesAndArithmeticModuli:A3/theta-group`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`, `FaltingsFinitenessAndIsogenyTheorems:R28.5/shafarevich-finiteness`, `HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`, `MordellLawrenceVenkateshPartII:M2.1`, `MordellLawrenceVenkateshPartII:M2.4`, `MordellLawrenceVenkateshPartII:M2.6`, `MordellLawrenceVenkateshPartII:M2.8`, `SheafConvolutionOnAbelianVarieties:SC.5/exceptional-degree`, `SheafConvolutionOnAbelianVarieties:SC.6/classical-monodromy`.

## Downstream consumers

The two terminal applications consume the same period and balanced-filtration mechanism. The projective application needs Beauville monodromy and the large-n/large-d estimate. The abelian application instead needs SC.8’s arbitrarily many independent character factors and the all-points coefficient theorem. A stronger finiteness claim for the projective parameter space requires the additional all-subvarieties hypothesis stated in Layer 7. No application here proves the missing common supplier extensions.

## Source corrections and version conventions

LS locators refer to arXiv v5, 16 October 2025. The Annals article metadata was accessible, but its full publisher text was not obtained; every LS correction below is scoped to the preprint. LV locators refer to the publisher-formatted Inventiones article, printed pages 893–999. Its non-strict first numerical inequalities govern this document; arXiv v3 is used only for cross-collation. In particular the published assumptions are A≥h⁰+dim Y and A≥z+e.

**E1 (LV, error).** At Published article, p. 971, parameter-space dimension before (10.8), The displayed parameter dimension uses binomial(n+d,d−1)−1, with growth of degree n+1 in d. Use binomial(n+d,d)−1∼d^n/n!. There are binomial(n+d,d) degree-d monomials in n+1 variables. Plane quartics give parameter dimension 14, whereas the printed formula gives 19; plane cubics do not distinguish the formulas. Existing correction: PAPER-LAWRENCE-VENKATESH-20/E1, confirmed in its independent review.

**E2 (LV, error).** At Published article, Lemma 12.1 and proof, pp. 995–996, The cutoff controls powers through N although the squared kernel has frequencies through 2N. Require q^((n/2+1)·2N)<b/3, for positive N; retain the bound 3b²/N. The coefficient of frequency 2N in the squared Dirichlet kernel is nonzero, so the same point-count bound must hold at 2N. Existing correction: PAPER-LAWRENCE-VENKATESH-20/E2, confirmed in its independent review.

**E3 (LV, misprint).** At Published article, proof of Lemma 10.4, p. 978, The Frobenius similitude multiplier is written as ℓ. Use ℓ^r for primitive middle degree r. The pairing has Tate weight r; eigenvalues pair as λ and ℓ^r/λ. For r=2 the multiplier is ℓ². Existing correction: new.

**E4 (LV, misprint).** At Published article, Example 4 after Lemma 11.2, p. 988, For an increasing auxiliary flag, the induced filtration is sent into a quotient by f_(k+1). Use the image of F^j∩f_k in f_k/f_(k−1). An increasing flag has f_(k+1) containing f_k; the printed quotient cannot be the stated graded piece. Existing correction: new.

**E5 (LV, misprint).** At Published article, final sentence of Lemma 11.4 proof, p. 993, The inverse maps are described without their minus signs. The forward map is −w and inverse is −w⁻¹. The displayed root sets lie in complements of positive standard parabolics, hence are negative roots; the sign is necessary. Existing correction: new.

**E6 (LS, misprint).** At arXiv v5 only, Definition 5.44, p. 60, A decreasing associated-graded quotient uses the preceding filtration index. Use gr^a=F^a/F^(a+1). The preceding term contains F^a, while the next term is its subspace. Existing correction: new.

**E7 (LS, misprint).** At arXiv v5 only, Definition 9.1, p. 85, The primitivity sentence excludes any stabilizing translation without explicitly excluding zero. Exclude nonzero geometric translations, or require the stabilizer to be {0}. Translation by zero fixes every divisor. Existing correction: new.

**E8 (LS, gap).** At arXiv v5 only, Lemma 8.14 proof, p. 80, The cyclic-cocycle lemma is applied to conjugation by φ on U without showing its r-th power is identity. Restrict to Z_U(φ^r). The norm relation makes the relevant cocycle lie there, and conjugation by φ then has order dividing r. Conjugation by a diagonal semisimple matrix on an upper root group can have infinite order; the cocycle lemma needs finite order. Existing correction: new.

**E9 (LS, gap).** At arXiv v5 only, proof of Lemma 5.49, pp. 61–62, The coefficient-linear subgroup G⁰ is treated as connected. Track its actual connected component and finite quotient separately in the GO case; include their rational orbit-descent finiteness. For even N, GO_N is disconnected, and its restriction of scalars need not be connected. The connected reductive theorem cannot be applied literally. Existing correction: new.

**E10 (LS, gap).** At arXiv v5 only, Lemma 5.49 proof, p. 61, use of LV Lemma 2.3, The arithmetic hypothesis gives integral Weil eigenvalues, while the invoked LV lemma assumes integer Frobenius polynomials. Supply rational Frobenius-polynomial coefficients for the geometric application, or prove an extension of the arithmetic finiteness theorem under the written weaker hypothesis. This plan uses the stronger interface. Algebraic integrality of eigenvalues only gives algebraic-integer coefficients, not rational coefficients. No counterexample to the source theorem is claimed. Existing correction: new.

**E11 (LS, error).** At arXiv v5 only, Lemma A.5 proof, p. 92, The tail comparison in the displayed second-moment calculation points upward. The comparison is strict <, yielding the desired upper bound 3/2. The preceding lemma bounds every positive cumulative tail above by the corresponding geometric tail; the coefficient 2k−1 is positive. Existing correction: new.

**E12 (LS, misprint).** At arXiv v5 only, Lemma A.4 proof, pp. 91–92, The geometric denominator in the propagated bound retains a fixed earlier index. At the later index i the denominator must be 3^i. Log-concavity propagates the ratio bound with the varying index; a constant bound does not sum to the geometric tail. Existing correction: new.

**E13 (LS, misprint).** At arXiv v5 only, paragraph after the GO computation in Lemma A.1, p. 90, The normal approximation is described with variance √n/12. The centered ascent variance is (n+1)/12; standard deviation is asymptotic to √(n/12). The n=2 ascent law is Bernoulli(1/2), and the exact second-moment calculation in the same appendix gives linear variance. Existing correction: new.

**E14 (LS, error).** At arXiv v5 only, Lemma A.1 stated group choices and GO strictness step, pp. 89–90, The numerical assertion is written for arbitrary GL/GSp/GO choices when n≥2. Use the compatible geometric pairing parity: GSp for n even and GO for n odd; the GL case is unrestricted. For n=2,d=1, a symmetric hyperbolic two-dimensional GO representation with weights 0,1 has h⁰=dim GO₂=rank GO₂=2 and no positive adjoint weights; strictness fails. This is not the geometric alternating pairing case. Existing correction: new.

## References

- Brian Lawrence and Will Sawin, [The Shafarevich conjecture for hypersurfaces in abelian varieties](https://arxiv.org/pdf/2004.09046v5). arXiv:2004.09046v5, 16 October 2025, 121 pages; published Annals of Mathematics 202 (2025), 857–1000. LS locators use preprint pagination. Read 19 October 2026: Definitions 5.1–5.46 and Lemmas 5.12–5.52, pp. 40–62; Sections 6–9, pp. 63–88; Appendix A, pp. 89–92.
- Brian Lawrence and Akshay Venkatesh, [Diophantine problems and p-adic period mappings](https://bimsa.net/doc/publication/2578.pdf). Inventiones mathematicae 221 (2020), 893–999, publisher-formatted article; LV locators use printed journal pages, with arXiv:1807.02721v3 cross-locators where useful. Read 19 October 2026: Section 2.3, pp. 904–907, Lemmas 2.3–2.6 and proofs; Sections 9–12, pp. 963–996.
- Arnaud Beauville, [Le groupe de monodromie des familles universelles d’hypersurfaces et d’intersections complètes](https://math.univ-cotedazur.fr/u/beauvill/pubs/mono.pdf). Complex Analysis and Algebraic Geometry, LNM 1194 (1986), 8–18; author PDF, printed page locators. Read 19 October 2026: Sections 1–3, printed pp. 8–12, especially Théorèmes 2 and 4.
- Victor Batyrev and David Cox, [On the Hodge structure of projective hypersurfaces in toric varieties](https://arxiv.org/pdf/alg-geom/9306011v1). arXiv:alg-geom/9306011v1 (25 June 1993); PDF page locators. Read 19 October 2026: Section 10, PDF pp. 30–34, Theorems 10.6 and 10.13 and Remark 10.14.
