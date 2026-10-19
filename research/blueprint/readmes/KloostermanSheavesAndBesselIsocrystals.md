# Kloosterman sheaves and Bessel F-isocrystals for reductive groups

This roadmap constructs the normalized Kloosterman Hecke eigenobject for a split reductive group and identifies its algebraic connection with the pinned Frenkel–Gross connection. It transports Frobenius to that explicit connection, then uses the resulting Bessel F-isocrystal to determine functoriality, local and global monodromy, and Newton polygons. The characteristic-two comparison is a separate proof branch: it completes even-A monodromy and the everywhere-ordinary theorem for classical groups and G₂.

The scope is the reductive-group construction and its comparisons. The all-rank scalar Kloosterman sum, sheaf, Bessel equation and rigid realization belong to **Kloosterman moments and potential automorphy**. Generic Satake geometry, rigid cohomology and slope theory are inputs from their existing owners. Each layer below gives exact targets, proof routes and Checks; each new definition or construction has its own API and at least three discriminatory unit tests. These are proposed mathematical interfaces, and every packet node has implementation status `unchecked`.

This is a **complete target-level planning pass**, with 54 nodes and 12 planned layers. It is not a gap-free closure: the twelve gaps and fifteen supplier requests at the end are part of the plan, and no layer is marked closed. In particular, the quasi-minuscule middle-image argument, the embedded companion-monodromy comparison and the normalized maximal-slope quotient need the stated repairs before their target theorems can be regarded as established along this proof route.

## Standing datum and convention dictionary

Write G for the split pinned automorphic group and H for its split Langlands dual. Set k=F_q, q=p^s with p prime and s≥1, and X=G_{m,k}. Fix a complete mixed-characteristic DVR R with residue k and fraction field K, enlarged finitely when necessary so it contains a Dwork parameter π with π^(p−1)=−p and a chosen square root c_p of p. Set c_q=c_p^s. Fix the compatible nontrivial ψ:F_p→K× and use ψ composed with field trace over every finite constant extension. Except for the explicitly specified tame-character variant, the tame torus character is trivial. Root subgroups and central maps use the existing pinned group schemes, with the actual central form retained.

| Item | Fixed convention and Check |
| --- | --- |
| Column connection | ∇=d+A(x)dx/x. A horizontal Frobenius C:F* M→M satisfies δC+A C=q C A(x^q), with δ=x d/dx and the indicated q-Frobenius lift fixing coefficients. |
| Inverse gauge | Φ=C^{-1} satisfies δΦ+q A(x^q)Φ=ΦA. The source gauge S instead satisfies δS+SA=q A(x^q)S. Inversion alone does not identify them; the transpose/root-basis and trace bridge is G5. |
| Rank-one exponentials | The multiplier exp(π(t−t^p)) belongs with d−πdt. In the notation E_λ=(O,d+λdt), use λ=−π. The scalar supplier’s ϖ is −π. |
| Kummer exponents | For d−a dx/x, the q-Frobenius multiplier is x^{−(q−1)a}. At Teichmüller units it gives the inverse character. Nontrivial finite tame characters need rational exponents modulo integers. |
| Half Tate twist | A twist (1/2) multiplies q^d-Frobenius by c_q^{−d}. A normalized rank-r scalar trace is (−1)^{r−1}c_q^{−d(r−1)}R_r(a), where R_r is the existing raw sum. |
| Closed-point degree | For a point of degree d use q^d-Frobenius and normalize v(q^d)=1. A k_d-valued point of smaller degree uses the repeated product of length d. |
| Principal grading | ρ is the half sum of positive coroots of H, a rational cocharacter. Use the integral 2ρ evaluated at c_q; do not assume ρ is integral. |
| Newton dominance | Use the raw coroot dominance relation imported from BG1. On GL it corresponds to the opposite polygon height order, with equal endpoints. The order on B(H) has the additional Kottwitz-class condition. |
| Appendix coordinate and quotient | The signed scalar series uses x↦−x at p=2. In a column cyclic basis ∇δe_i=e_{i+1}, the maximal rank-one quotient is dual to the solution line E_F=(O,d−ηdx), with multiplier q^n/f_{F,q}, using f_{F,q}=∏_{i=0}^{s−1}f_F(x^{2^i})=F(x)/F(x^q). The comparison on the quotient is multiplication by (F/G)^{-1}. |

The source locators below refer to the specific preprints in the bibliography. Corrections are mathematical statements in our own words; no source excerpt is reproduced. A source-proof dependency that has not been independently verified is a named gap, not an extra theorem hidden in a proof sketch.

## Ownership and build order

| Supplier | What this roadmap imports |
| --- | --- |
| ReductiveGroups, Layers 1, 7 and 9 | Actual representations/comodules, pinned integral groups, root subgroups and structural invariant theory. Further principal-SL₂/classification contracts are requested as Part II rather than redefined. |
| Current OrthogonalSpinGroups and LocalGaloisGroups | Classical and Spin group carriers, their central maps, and local ramification foundations. This roadmap owns only the specialized Bessel matrices and their comparisons. |
| GlobalShtukasAndFunctionFieldLanglands:GS.0–GS.1 | Bun_G and the equal-characteristic finite-field Beilinson–Drinfeld Grassmannian/Satake geometry. Common-DVR relative models and coefficient realizations are the precise extensions G1/G2. |
| PadicDifferentialEquationsAndRigidCohomology:RD.0–RD.6 | Analytic rings, local radii and monodromy, frame-independent isocrystals, absolute comparison, finiteness/duality, trace and Fourier theory. Global/log slopes and arithmetic D-module ULA operations require the distinct extensions stated below. |
| KloostermanMomentsAndPotentialAutomorphy:KM.0, KM.1, KM.2, KM.4 | The unique scalar raw sum, normalized scalar object, monodromy, cyclic connection and rigid realization. The missing full scalar ordinarity input remains in that same direction. |
| BunGAndNewtonStrata:BG1 | Dominant rational Newton-orbit construction and representation detection of dominance; no new generic Newton order is introduced here. |
| FiniteFieldsAndCharacterSums:FF.1 | Gauss-sum absolute values and Hasse–Davenport lifting, including the extension-field sign. |
| MotivesAndAlgebraicCycles:MC.6 | Generic neutral Tannakian reconstruction (MC.6/neutral-tannaka-reconstruction) and fiber-isomorphism torsors; RD.6/coefficient-category-is-neutral-tannakian supplies the overconvergent category with Frobenius forgotten. The retained-Frobenius category needs its own exact faithful fiber functor. |

The current upstream roadmaps and Tau Ceti library were checked beyond the atlas snapshot; exact commits and the four baseline declaration statements are recorded in the packet. In particular, the point-valued `WittVector.Isocrystal` carrier does not supply overconvergent coefficients on a curve. A pending arithmetic D-module or minimal-slope proposal is not cited under an invented stage id.

The mathematical order is KB.0→KB.1→KB.2→KB.3→KB.4. KB.5 proves generic ordinarity independently of the appendix, while KB.6 supplies nonexceptional monodromy. KB.7 combines those inputs for normalized functoriality. KB.8 and KB.9 give the classical and odd-characteristic calculations. KB.10 then proves the characteristic-two comparison using KB.5; KB.11 completes ordinarity, even-A monodromy and raw identities. The central-torsor theorem sits after geometric monodromy, and the characteristic-two raw identities sit after their isocrystal comparison. They are not inputs to their own proofs.

## KB.0. Integral data and normalization

Fix k=F_q, q=p^s, coefficient field K containing the Dwork parameter and a chosen square root of p, split pinned G and its dual H. Define the root-depth Iwahori quotient, generic character datum and the particular level model on P¹. Fix exponential, Kummer, Tate and Frobenius conventions by rank-one and rank-two calculations.

**Layer inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

<a id="kb-0-coefficients"></a>

### coefficients: Normalized coefficient datum

**Target (definition).** A normalized datum consists of p prime, s≥1, k=F_q with q=p^s, a complete mixed-characteristic DVR R with residue k, K=Frac(R), a chosen square root c_p of p in K and c_q=c_p^s, a nontrivial additive character ψ of F_p and its compatible Dwork parameter π with π^(p−1)=−p. Coefficients may be enlarged finitely. Use ψ∘Tr_{k_d/F_p} over k_d, half twists with q-Frobenius scalar c_q^(−1), and v(q)=1. For degree d, the normalized rank-r scalar trace is (−1)^(r−1)c_q^(−d(r−1)) times the raw sum over k_d. A point valued in k_d of smaller degree uses repeated Frobenius, rather than a shorter product.

**Inputs:** `mathlib:AddChar`; `mathlib:FiniteField.algebraMap_trace_eq_sum_pow`; `KloostermanMomentsAndPotentialAutomorphy:KM.1/normalized-sheaf`.

**Proof route.** 1. Import the existing additive-character and finite-field trace operations and the scalar normalized sheaf. 2. Adjoin π and c_p simultaneously, fix their choices and extend scalars through all coefficient categories. 3. Check degrees and half twists before comparing trace functions.

**Uses.** KB.4 Frobenius trace comparison: Fix all signs, degree factors and half twists. KB.9 convolution: The half twist changes the trace by c_q^(−d).

**API.**

- `Bessel.coefficients.scalar_trace` (projection): Extract the scalar normalization (−1)^(r−1)c_q^(−d(r−1)); it is compatible with finite coefficient extension.
- `Bessel.coefficients.extension_character` (compatibility): The additive character on k_d is ψ composed with the field trace, compatible with trace in towers.
- `Bessel.coefficients.half_twist` (structure): The chosen half Tate twist has q^d-Frobenius c_q^(−d); its square is the Tate twist (1).
- `Bessel.coefficients.iterate_half_twist` (compatibility): After a degree-d constant extension the half-twist scalar is c_q^{−d}; successive degree-d and degree-e extensions multiply the exponent to de. The normalized raw trace uses the same character trace tower.

**Unit tests.**

- **rank_two.** (computation) At r=2,d=1 the scalar trace is −RawKl₂/c_q, not RawKl₂ or −RawKl₂/q.
- **nonprimitive_point.** (compatibility) For a∈k× viewed in k_d, the Frobenius product has d repeated factors, not one.
- **coefficient_extension.** (non-example) The field Q₃(μ₃) alone is rejected for the uniform datum unless √3 is adjoined; the normalized rank-two trace can lie outside it.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §1.1.1, pp. 2–3; §1.3.8, p. 9; §4.1 opening, p. 37; §4.4.3, p. 50. Normalized coefficient datum: A normalized datum consists of p prime, s≥1, k=F_q with q=p^s, a complete mixed-characteristic DVR R with residue k, K=Frac(R), a chosen square root c_p of p in K and c_q=c_p^s, a nontrivial additive character ψ of F_p and its compatible Dwork parameter π with π^(p−1)=−p.

<a id="kb-0-rank-one-dictionary"></a>

### rank-one-dictionary: Exponential and Kummer sign dictionary

**Target (theorem).** For column-vector connections and a horizontal Frobenius map F* M→M, the Dwork object with multiplier exp(π(t−t^p)) has connection d−πdt. Write E_λ=(O,d+λdt); then E_{−π} is its algebraic precursor. For a Kummer connection d−a dx/x with (q−1)a integral, the horizontal q-Frobenius multiplier is x^{−(q−1)a}; it realizes the inverse of the Teichmüller character x↦x^{(q−1)a}. To realize that character use the opposite exponent. Algebraic integer exponents alone cannot encode a nontrivial tame finite-field character in the de Rham–rigid comparison.

**Additional hypotheses.** Frobenius is taken relative to the displayed lift and constant coefficient automorphism; use the iterated p-Frobenius for q.

**Inputs:** [KB.0/coefficients](#kb-0-coefficients); `PadicDifferentialEquationsAndRigidCohomology:RD.2/dwork-exponential-artin-schreier-example`.

**Proof route.** 1. Differentiate the multipliers and use C′+A C=C A_F for the column connection. 2. Evaluate the Kummer multiplier on Teichmüller units and compare the character. 3. Take the dual of the existing all-prime Dwork object with connection d+πdt to obtain E_{−π}; the RD.1 local example by itself assumes p odd. Match rational Kummer exponents modulo integers rather than differentiating an algebraic character.

**Checks.**

- Differentiate exp(π(t−t^p)): its logarithmic derivative is π(1−pt^{p−1}), which is horizontal for d−πdt with the displayed F*→object direction.
- At a Teichmüller unit, x^{−(q−1)a} gives the inverse character; an integral exponent cannot realize a nontrivial tame character.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §2.1.5, p. 10; §4.1.13–§4.2.1, pp. 42–43 (with sign corrections recorded below). Exponential and Kummer sign dictionary: For column-vector connections and a horizontal Frobenius map F* M→M, the Dwork object with multiplier exp(π(t−t^p)) has connection d−πdt.

<a id="kb-0-affine-depth"></a>

### affine-depth: Affine generic level quotient

**Target (definition).** For split pinned G and the alcove determined by B⊃T at ∞, let I₀ be the Iwahori and I₁ its pro-unipotent radical. Define I₂ by the root-depth filtration: it contains T(1) and all nonsimple positive affine-root groups. Then V=I₁/I₂ is the direct sum of the affine-simple root lines of the derived root system. A linear functional φ:V→G_a is generic when each such coordinate is nonzero; over R require nonzero reduction in every line. For a torus V=0. Do not replace I₂ by the product of the congruence center and the commutator subgroup in residue characteristics dividing an isogeny degree.

**Inputs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; [KB.0/coefficients](#kb-0-coefficients).

**Proof route.** 1. Take the root-group level filtration on the pinned split group scheme. 2. Project to affine-simple root coordinates; verify the kernel includes the toral congruence subgroup. 3. Define genericity as the complement of the union of coordinate hyperplanes.

**Uses.** KB.1 cleanness: Boundary stabilizers carry a root group with nontrivial character. KB.2 parameter matching: The torus quotient of V* supplies the Hitchin parameter.

**API.**

- `Bessel.affine_depth.quotient_coordinates` (equivalence): V is identified with the direct sum of affine-simple root lines, naturally for pinned automorphisms.
- `Bessel.affine_depth.generic_iff` (characterisation): A functional is generic exactly when every affine-simple coefficient is a unit over R, or nonzero over a field.
- `Bessel.affine_depth.torus_action` (functoriality): T_ad acts on the functional coordinates by their root characters; the action preserves genericity.
- `Bessel.affine_depth.functional_ext` (extensionality): Two linear functionals on V are equal if their restrictions to every affine-simple root line agree, including the empty torus case.

**Unit tests.**

- **sl_two.** (computation) For SL₂, the quotient has exactly the finite simple-root coordinate and the affine lowest-root coordinate.
- **torus.** (degenerate) For G=G_m the quotient is zero and its zero functional is generic by the empty condition.
- **gl_two_char_two.** (non-example) For GL₂ over F₂, diag(1+y,1) lies in the root-depth kernel. Its determinant shows that a commutator-plus-scalar kernel would fail this test.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [HNY](https://math.mit.edu/~zyun/Kloosterman_published.pdf), HNY §1.2–1.3, pp. 250–252; XZ §4.1.1, p. 37 (the commutator description is not used). Affine generic level quotient: For split pinned G and the alcove determined by B⊃T at ∞, let I₀ be the Iwahori and I₁ its pro-unipotent radical.

<a id="kb-0-level-model"></a>

### level-model: The two-point level model

**Target (construction).** Apply the existing smooth-model Bun_G construction to the split group on X=P¹−{0,∞}, with opposite Iwahori level I₀^op at 0 and I₂ at ∞, obtaining G(0,2). The length-zero affine Weyl subgroup Ω indexes components and gives Hecke translations Hk_γ. The orbit of the trivial bundle gives affine open maps j_γ:V→Bun_G(0,2)^γ. The (1,2) variant has big cell (T⋊Ω)×V after choosing a splitting of the normalizer extension. These are the particular level models, not a new general moduli-stack definition.

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`; `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`; [KB.0/affine-depth](#kb-0-affine-depth).

**Proof route.** 1. Construct the specified Bruhat–Tits dilatation model using root-depth groups. 2. Use the affine Weyl decomposition to identify Ω and the open orbit in each component. 3. Use the level-change torsor to obtain the (1,2) chart and record its splitting.

**Uses.** KB.1 clean automorphic datum: Provides the actual open map whose extension is constructed. KB.3 integral comparison: The same specified model is required over R, K and k.

**API.**

- `Bessel.level_model.big_cell` (projection): For every γ∈Ω, j_γ is an affine open immersion, with origin the Hecke translate of the trivial bundle.
- `Bessel.level_model.translation` (functoriality): Hk_γ transports the neutral chart to the γ chart and respects composition in Ω.
- `Bessel.level_model.level_change` (compatibility): Bun_G(1,2)→Bun_G(0,2) is the torus-level change; its big cell is the specified torus extension times V.
- `Bessel.level_model.base_change` (compatibility): Pullback of the specified level model, its neutral bundle and each indexed big-cell immersion along a finite residue-field extension agrees with the construction over that field; the common-DVR version requires G1.

**Unit tests.**

- **neutral_point.** (characterisation) j₀(0) is the trivial bundle with the prescribed levels, rather than its classifying stack BT.
- **sl_two_chart.** (computation) For SL₂ the neutral big cell is A², whose dimension agrees with the two affine-root lines.
- **component_translation.** (compatibility) A nonidentity γ sends the neutral point to its own component; a chart confined to the neutral component cannot pass.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [HNY](https://math.mit.edu/~zyun/Kloosterman_published.pdf), HNY Proposition 1.1, Corollaries 1.2–1.3, pp. 253–255; XZ §4.1.1, pp. 37–38. The two-point level model: Apply the existing smooth-model Bun_G construction to the split group on X=P¹−{0,∞}, with opposite Iwahori level I₀^op at 0 and I₂ at ∞, obtaining G(0,2).

**Coverage:** planned. Remaining contracts: G1: Relative integral Hecke geometry; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ, GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian.

## KB.1. Rigid automorphic data and Hecke eigenobjects

Construct clean generic automorphic data and their Hecke eigenobjects in étale, algebraic de Rham and arithmetic coefficient categories. Establish the smooth weight-zero rigid eigenobject, the multiplicative-character variant and its closed-point trace comparison. Use the existing Satake geometry and request the missing coefficient realization.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.0`; `GlobalShtukasAndFunctionFieldLanglands:GS.1`; `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

<a id="kb-1-clean-datum"></a>

### clean-datum: Clean automorphic datum

**Target (construction).** For generic φ on V, define A on the γ component of Bun_G(0,2) as the shifted extension of φ*AS_ψ along j_γ, with the shift prescribed by the holonomic heart. The natural map j_!φ*AS_ψ→j_+φ*AS_ψ is an isomorphism. Restriction to the base point induces an equivalence from (V,φ*AS_ψ)-equivariant holonomic objects on that component to coefficient objects on a point. Construct the analogous exponential de Rham and arithmetic D-module objects with their own coefficient conventions.

**Inputs:** [KB.0/level-model](#kb-0-level-model); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary).

**Proof route.** 1. Use the affine Weyl stratification of the level stack. 2. At each boundary orbit, find a connected stabilizer root group on which φ is nontrivial; equivariance forces the restriction to vanish. 3. Both extensions are therefore the same clean object; translation and base-point restriction give the categorical equivalence.

**Uses.** KB.1 eigenobject: The equivalence extracts the unique Hecke eigenvalue. KB.3 comparison: Cleanness identifies compact and ordinary cohomology.

**API.**

- `Bessel.clean_datum.restriction` (simp): j_γ* A recovers φ*AS_ψ with the stated shift.
- `Bessel.clean_datum.clean_map` (equivalence): The canonical support-to-ordinary extension map is invertible, naturally in coefficient objects.
- `Bessel.clean_datum.evaluation_equivalence` (universal-property): Every generic-equivariant holonomic object is A tensored with its fiber at the chosen base point; this description is fully faithful.
- `Bessel.clean_datum.morphism_ext` (extensionality): A morphism of generic-equivariant clean objects is determined by its coefficient-fiber map at the fixed chart origin, as follows from the evaluation equivalence.

**Unit tests.**

- **base_fiber.** (computation) The coefficient fiber of A at the chart origin is the unit rank-one object.
- **boundary_vanishing.** (characterisation) Every ! and ordinary stalk on the complement of the big cell is zero.
- **nongeneric_rejected.** (non-example) For SL₂ with φ=0, the boundary-stabilizer proof fails and the generic cleanness theorem is not applicable.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), XZ Lemma 4.1.4 and (4.1.3.2), pp. 38–39; HNY Lemma 2.3 and Definition 2.4, pp. 256–257. Clean automorphic datum: For generic φ on V, define A on the γ component of Bun_G(0,2) as the shifted extension of φ*AS_ψ along j_γ, with the shift prescribed by the holonomic heart.

<a id="kb-1-hecke-action"></a>

### hecke-action: Normalized Hecke action

**Target (construction).** For W∈Rep(H), use the bounded Hecke correspondence away from {0,∞} and the normalized Satake kernel IC_W to define Hk_W(M)=pr₂! (pr₁+ M ⊗ IC_W), with its canonical !→+ map. The relative shifts and half twists are those of the weight-zero Satake fiber functor. Fusion identifies Hk_{W⊗W′} with successive Hecke operations after collision; Hk_1 is M⊠1. Over the base point, the eigenvalue is the pushforward from GR_W^o with the exponential character coefficient.

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`; `GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor`; [KB.1/clean-datum](#kb-1-clean-datum).

**Proof route.** 1. Import the bounded global Grassmannian and its convolution/fusion geometry. 2. Apply the normalized Satake coefficient realization, then the six operations on the bounded correspondence. 3. Pull back to the trivial-bundle base point to obtain the explicit exponential pushforward diagram.

**Uses.** KB.1 Hecke eigensystem: The fusion constraints become its tensor constraints. KB.8 quadric realization: The standard representation is computed by the base-point diagram.

**API.**

- `Bessel.hecke_action.unit` (simp): The trivial representation acts by exterior product with the coefficient unit on X.
- `Bessel.hecke_action.fusion` (structure): The collision comparison gives the associativity-compatible tensor constraint; all representation intertwiners act naturally.
- `Bessel.hecke_action.base_point_formula` (compatibility): Restriction to the chosen bundle equals the exponential direct image on GR_W^o, with the Satake shift and half twist.
- `Bessel.hecke_action.intertwiner_composition` (simp): The Hecke maps induced by identity intertwiners are identities, and a composite of intertwiners induces the composite map; these identities commute with fusion.

**Unit tests.**

- **unit_shift.** (degenerate) W=1 gives rank one in degree zero and no Tate twist.
- **tensor_rank.** (computation) For a rank-two standard W, the W⊗W dual coefficient has rank four, rather than the rank of W.
- **minuscule_shift.** (compatibility) For a minuscule coweight of dimension d, IC_W is the constant coefficient shifted by d and twisted by d/2 in the normalized arithmetic realization.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.1.2, (4.1.2.1)–(4.1.2.3), pp. 38–39; §4.1.8, (4.1.8.1)–(4.1.8.4), p. 40. Normalized Hecke action: For W∈Rep(H), use the bounded Hecke correspondence away from {0,∞} and the normalized Satake kernel IC_W to define Hk_W(M)=pr₂! (pr₁+ M ⊗ IC_W), with its canonical !→+ map.

<a id="kb-1-eigenobject"></a>

### eigenobject: Kloosterman Hecke eigenobject

**Target (theorem).** There is an exact tensor functor Kl_H^rig(ψφ):Rep(H)→F-Isoc†(X/K) and a Hecke eigenisomorphism Hk_W(A)≅A⊠Kl_W, compatible with fusion and all intertwiners. The W coefficient has rank dim W and is pure of weight zero. In the explicit base-point formula the canonical !→+ pushforward is invertible. The étale and algebraic de Rham constructions give their corresponding H-valued local systems with the same tensor normalization.

**Inputs:** [KB.1/hecke-action](#kb-1-hecke-action); [KB.1/clean-datum](#kb-1-clean-datum).

**Proof route.** 1. Extract the eigenvalue by the clean-equivariant equivalence and show degree-zero concentration using affine Hecke bounds in the relevant heart. 2. Use ULA of IC_W, vanishing cycles and the external-product smoothness criterion to show the coefficient is an overconvergent isocrystal. 3. Use fusion for exact tensor compatibility; duality, !→+ cleanness and the normalized weights give purity zero.

**Checks.**

- The unit representation has eigenvalue the constant rank-one object, and W⊗W dual respects the evaluation morphism, not just ranks.
- Smoothness must use ULA of the Satake coefficient and the external-product criterion with the actual nonsmooth automorphic factor.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.1.5, §§4.1.6–4.1.8, pp. 39–40; HNY Theorem 1, p. 261. Kloosterman Hecke eigenobject: There is an exact tensor functor Kl_H^rig(ψφ):Rep(H)→F-Isoc†(X/K) and a Hecke eigenisomorphism Hk_W(A)≅A⊠Kl_W, compatible with fusion and all intertwiners.

<a id="kb-1-character-variant"></a>

### character-variant: Tame-character eigenobject

**Target (construction).** For a character χ:T(k)→K× and a splitting s:T⋊Ω≅T̃, use on the γ chart K_{χγ}⊠φ*AS_ψ, with χγ=χ∘Adγ. Its clean extension on Bun_G(1,2) has an H-valued weight-zero rigid and étale Hecke eigenobject Kl_H(ψφ,χ,s). The algebraic de Rham variant is separately defined for a Lie-torus exponent η; a comparison requires rational exponents lifting χ with the sign dictionary, not an arbitrary differential of an algebraic character. At χ=1 and η=0, the main eigenobject is independent of s.

**Inputs:** [KB.0/level-model](#kb-0-level-model); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary); [KB.1/eigenobject](#kb-1-eigenobject).

**Proof route.** 1. Use the torus-level change chart and choose the actual splitting. 2. Apply clean extension with the γ-conjugated character; retain this conjugation throughout Hecke transport. 3. Construct the de Rham exponent variant independently and only identify it when its Kummer parameter matches the finite-field trace.

**Uses.** KB.1 coefficient comparison: Includes the tame-character companions. KB.3 main comparison boundary: Explains why the unconditional theorem is stated at χ=1.

**API.**

- `Bessel.character_variant.trivial_character` (compatibility): Kl(ψφ,1,s)=Kl(ψφ) with the trivial exponent, independently of the splitting.
- `Bessel.character_variant.chart_character` (projection): The γ chart restriction is K_{χ∘Adγ}⊠φ*AS_ψ with the fixed shift.
- `Bessel.character_variant.splitting_change` (functoriality): Transport along a new splitting is described by the resulting torus-character cocycle; no unconditional independence is asserted for nontrivial χ.
- `Bessel.character_variant.exponent_mod_integers` (compatibility): Changing a rational Kummer exponent by an integral character gives an algebraic gauge isomorphism; a Frobenius comparison must transport that gauge as well. The induced tame character depends on the rational class modulo integers.

**Unit tests.**

- **trivial_exponent.** (degenerate) For χ=1 the rational exponent 0 gives the base construction.
- **finite_order_test.** (non-example) For k=F₅, the nontrivial Teichmüller character must use an exponent with denominator 4; exponent 1 gives a trivial algebraic monodromy instead.
- **conjugation_test.** (compatibility) A component γ with nontrivial action on T changes χ by Adγ; replacing every χγ by χ fails on that component.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§4.1.11–4.1.13, pp. 41–42; HNY Remark 2.5 and Definition 2.6, p. 257; Definition 2.11, p. 260. Tame-character eigenobject: For a character χ:T(k)→K× and a splitting s:T⋊Ω≅T̃, use on the γ chart K_{χγ}⊠φ*AS_ψ, with χγ=χ∘Adγ.

<a id="kb-1-trace-companions"></a>

### trace-companions: Closed-point coefficient comparison

**Target (theorem).** Under a fixed identification of algebraic coefficient fields inside p-adic and ℓ-adic closures, ℓ≠p, the Frobenius characteristic polynomials of Kl_H^rig(ψφ,χ,s)_W and Kl_H^{ét,ℓ}(ψφ,χ,s)_W agree at every closed point, for every W. Trace agreement is over every finite extension, not only k-points. The algebraic de Rham eigenobject has the exponential convention E_{−π} in the untwisted comparison.

**Inputs:** [KB.1/character-variant](#kb-1-character-variant); [KB.1/eigenobject](#kb-1-eigenobject); [KB.0/coefficients](#kb-0-coefficients); `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

**Proof route.** 1. Compute both trace functions using the same bounded geometric correspondence and support-to-ordinary coefficient. 2. Import arithmetic D-module trace and ℓ-independence with shifts, twists and exponential characters fixed. 3. Apply trace equality to all powers of Frobenius to recover characteristic polynomials.

**Checks.**

- Agreement at k-points alone is insufficient: test all finite extension fields and all powers of each closed-point Frobenius.
- Recover characteristic polynomials from those traces in characteristic-zero coefficients.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.1.12–4.1.13, p. 42; arithmetic trace/independence inputs cited there. Closed-point coefficient comparison: Under a fixed identification of algebraic coefficient fields inside p-adic and ℓ-adic closures, ℓ≠p, the Frobenius characteristic polynomials of Kl_H^rig(ψφ,χ,s)_W and Kl_H^{ét,ℓ}(ψφ,χ,s)_W agree at every closed point, for every W.

**Coverage:** planned. Remaining contracts: G1: Relative integral Hecke geometry; G2: Coefficient operations and smooth Satake eigenvalues; Fulfil the exact requested contracts: PadicDifferentialEquationsAndRigidCohomology:RD.6, GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian, GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor.

## KB.2. The Frenkel–Gross connection

Define the group-valued irregular connection from the pinning. Match its invariant parameter with the affine generic character, identify the relevant oper slice and quantized Hitchin action, and prove Zhu’s comparison, including finite central descent. Determine its characteristic-zero differential monodromy without reconstructing scalar Kloosterman connections.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.1`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `KloostermanMomentsAndPotentialAutomorphy:KM.2`.

<a id="kb-2-fg-connection"></a>

### fg-connection: Frenkel–Gross connection

**Target (definition).** Let H be split reductive in characteristic zero with a fixed pinning. Put N=Σ simple-root vectors, and choose a nonzero lowest-root vector E_i in each simple derived factor. The H-connection on the trivial bundle over X is ∇=d+(N+xΣE_i)dx/x, interpreted through every algebraic representation as a tensor functor. For the parameter λ use A_λ=N+xΣλ^{h_i}E_i, with the Coxeter number h_i of that factor. The torus factor has zero connection. Pinning changes act by gauge transformations and coordinate rescaling; a single common exponent is not used for unequal factors.

**Inputs:** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `KloostermanMomentsAndPotentialAutomorphy:KM.2/bessel-dictionary`.

**Proof route.** 1. Use the existing pinned reductive group and Lie representation API. 2. Build the trivial principal bundle connection from the indicated Lie-algebra-valued form. 3. Apply representations and their intertwiners; compute the principal grading separately in each factor.

**Uses.** KB.3 and KB.4 comparison: Supplies the explicit connection which receives Frobenius. KB.8 classical matrices: Determines the scalar operators and invariant line.

**API.**

- `Bessel.fg_connection.representation` (projection): In W the connection matrix is dρ_W(A_λ)dx/x and naturality holds for every H-intertwiner.
- `Bessel.fg_connection.tensor` (structure): The connection on W⊗W′ is the sum of the two tensor-factor connection operators; the unit is (O,d).
- `Bessel.fg_connection.parameter_scale` (compatibility): In an almost-simple factor, λ scales the affine invariant by λ^h; its standard A-type cyclic operator agrees with the imported scalar Bessel dictionary.
- `Bessel.fg_connection.dual` (structure): On W dual the connection matrix is the negative transpose of the matrix on W; evaluation W dual⊗W→1 is horizontal, naturally in H-intertwiners.

**Unit tests.**

- **torus.** (degenerate) For H=G_m and any character W, the resulting connection is d.
- **sl_two.** (computation) For H=SL₂ with N=E₁₂,E=E₂₁, A_λ=[[0,1],[λ²x,0]].
- **product_exponents.** (computation) For SL₂×SL₃ the affine terms are λ²xE₂₁ and λ³xE₃₁; using λ² in both factors fails.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.3.1–4.3.2, pp. 46–47; FG §§5–6, pp. 9–14. Frenkel–Gross connection: Let H be split reductive in characteristic zero with a fixed pinning. [FG](https://arxiv.org/pdf/0901.2163v3), FG §§5–6, pp. 9–14. The principal-graded irregular connection and its basic local form.

<a id="kb-2-invariant-parameter"></a>

### invariant-parameter: Dual affine invariant parameter

**Target (comparison).** The two invariant quotients V*//T and h_aff(1)//T_H are canonically identified through their equal images in the dual Hitchin base. After fixing a pinning this identifies the quotient with the product of lowest-root parameter lines x⊕_i h_{−θ_i}. For almost-simple G, matching φ and E means P_h(λφ)=λ^hP_h(φ)=P̌_h(N+xE) in the corresponding degree-h invariant. All invariant generators must be matched through the Cartan duality; arbitrary independent scalar normalizations are not allowed.

**Inputs:** [KB.0/affine-depth](#kb-0-affine-depth); [KB.2/fg-connection](#kb-2-fg-connection); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Proof route.** 1. Use Chevalley invariant restriction and the identification (Lie T)*=Lie T_H. 2. Compare both Hitchin maps under this identification. 3. Choose the pinned normal form N+xΣE_i and read its factorwise homogeneous invariant.

**Checks.**

- For a product SL₂×SL₃, rescaling φ by λ scales the two invariant coordinates by λ² and λ³.
- Match the invariant generators through the dual Hitchin base before choosing a scalar lowest-root coordinate.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.3.3 and §4.3.4, (4.3.3.1)–(4.3.4.2), pp. 47–48. Dual affine invariant parameter: The two invariant quotients V*//T and h_aff(1)//T_H are canonically identified through their equal images in the dual Hitchin base.

<a id="kb-2-oper-slice"></a>

### oper-slice: The Bessel oper slice

**Target (construction).** In characteristic zero, take H_ad-opers on G_m with regular-singular residue class ϖ(0) at 0 and formal slope at most 1/h_i at ∞ in each simple factor, in the specific principal-graded oper normal form. This bounded oper slice has a distinguished tame point and is an affine torsor for x⊕_i h_{−θ_i}; its point xE corresponds to the oper d+(N+xE)dx/x. The local residue condition is part of the definition, and cannot be replaced merely by a claim about arbitrary connections with unipotent monodromy.

**Inputs:** [KB.2/fg-connection](#kb-2-fg-connection); [KB.2/invariant-parameter](#kb-2-invariant-parameter).

**Proof route.** 1. Import the generic oper definition, gauge quotient and principal normal form (gap G3). 2. Impose the precise residue and principal slope bounds in that normal form. 3. Use the coordinate and tame origin to identify the remaining coefficients with the lowest-root lines.

**Uses.** KB.2 quantized action: Its function algebra acts by global differential operators. KB.2 Zhu comparison: Its Hecke eigenvalue is the Frenkel–Gross connection.

**API.**

- `Bessel.oper_slice.normal_form` (equivalence): The slice point xE gives the principal-graded oper d+(N+xE)dx/x and exhausts the slice.
- `Bessel.oper_slice.tame_origin` (simp): At E=0 the distinguished point is regular singular at both ends.
- `Bessel.oper_slice.filtered_functions` (structure): Functions on the slice carry the oper filtration with associated graded the invariant polynomial algebra of affine-generic parameters.
- `Bessel.oper_slice.parameter_ext` (extensionality): Two points in the stated principal-graded slice have the same oper normal form exactly when their affine invariant parameter is equal; use the pinned coordinate identification.

**Unit tests.**

- **adjoint_rank_one.** (computation) For H=PGL₂ the slice has one parameter; it is A¹ after fixing the root vector.
- **zero_parameter.** (degenerate) The origin is in the bounded slice but is not generic; its irregularity at ∞ drops.
- **residue_condition.** (non-example) An oper with a different regular-singular residue at zero is not admitted even when its maximal slope at ∞ is ≤1/h.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.3.5, pp. 48–49; Zhu §5, Lemma 20, pp. 21–22. The Bessel oper slice: In characteristic zero, take H_ad-opers on G_m with regular-singular residue class ϖ(0) at 0 and formal slope at most 1/h_i at ∞ in each simple factor, in the specific principal-graded oper normal form. [Zhu](https://arxiv.org/pdf/1603.05796v2), Zhu Lemma 20, pp. 21–22. The bounded oper normal form is a one-parameter slice for a simple group.

<a id="kb-2-quantized-hitchin"></a>

### quantized-hitchin: Quantized Hitchin identification

**Target (theorem).** For the specified (0,2) level model in characteristic zero, the invariant algebra U(Lie V)^T is canonically identified with functions on the Bessel oper slice, compatibly with filtrations and with the action by global twisted differential operators on Bun_G(0,2). The associated graded recovers the affine invariant-parameter comparison. Localization at a generic character gives a nonzero holonomic eigenobject whose big-cell restriction is the exponential character.

**Inputs:** [KB.2/oper-slice](#kb-2-oper-slice); [KB.2/invariant-parameter](#kb-2-invariant-parameter); [KB.1/clean-datum](#kb-1-clean-datum).

**Proof route.** 1. Use the critical-level center and its local vacuum-module supports, then the global localization action. 2. Use the enhanced Hitchin moment-map flatness to retain holonomicity and nonvanishing. 3. Compare associated graded maps and the tame origin to identify the filtered invariant algebra; keep half-canonical line data explicit.

**Checks.**

- The associated graded map agrees with the specified classical Hitchin invariant map.
- Check the enhanced commutative-algebra flatness hypothesis in Zhu Corollary 9; a generic localization eigenobject alone need not be holonomic or nonzero.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.3.5, (4.3.5.1), pp. 48–49; Zhu Theorem 8, Corollary 9, pp. 8–10 and Lemmas 18–21, pp. 20–23. Quantized Hitchin identification: For the specified (0,2) level model in characteristic zero, the invariant algebra U(Lie V)^T is canonically identified with functions on the Bessel oper slice, compatibly with filtrations and with the action by global twisted differential operators on Bun_G(0,2). [Zhu](https://arxiv.org/pdf/1603.05796v2), Zhu Lemma 21 and final localization argument, p. 23. The invariant algebra comparison constructs the generic clean eigensheaf.

<a id="kb-2-zhu-identification"></a>

### zhu-identification: Zhu’s connection comparison

**Target (theorem).** For matching generic parameters, Kl_H^dR(λφ)≅Be_H(N+xΣλ^{h_i}E_i) as tensor functors to algebraic connections, with trivial tame character. For adjoint H this is obtained from quantized localization and uniqueness of clean automorphic data. For semisimple H, the adjoint comparison lifts uniquely subject to unipotent monodromy at zero: the difference is a finite central local system extending to A¹ and hence trivial. The split torus part is the trivial connection; passage through the reductive central quotient requires compatible level/root data, not the assertion that every central kernel is finite.

**Inputs:** [KB.2/quantized-hitchin](#kb-2-quantized-hitchin); [KB.1/eigenobject](#kb-1-eigenobject); [KB.2/invariant-parameter](#kb-2-invariant-parameter).

**Proof route.** 1. Identify the localized automorphic object with the clean extension from its generic character on the big cell. 2. Compare Hecke eigenvalues, preserving all tensor intertwiners. 3. Lift from adjoint to semisimple using finite central descent, then treat a central torus separately and descend the split reductive presentation (G3 records this input).

**Checks.**

- The big-cell restriction of the localized object is the same generic exponential coefficient used in the clean construction.
- For a nonsemisimple reductive group, treat its torus before using a finite central kernel; the whole kernel of H→H_ad is not finite.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.3.3 and §§4.3.5–4.3.6, pp. 47–49; Zhu §5, p. 23. Zhu’s connection comparison: For matching generic parameters, Kl_H^dR(λφ)≅Be_H(N+xΣλ^{h_i}E_i) as tensor functors to algebraic connections, with trivial tame character.

<a id="kb-2-differential-monodromy"></a>

### differential-monodromy: Frenkel–Gross monodromy

**Target (theorem).** For almost-simple H over an algebraically closed characteristic-zero field, the differential Galois group of the generic Frenkel–Gross connection is connected. Up to central isogeny its type is A_{2n}→A_{2n}; A_{2n−1},C_n→C_n; B_n,D_{n+1}→B_n for n≥4; B₃,D₄,G₂→G₂; E₆,F₄→F₄; E₇→E₇; E₈→E₈. The subgroup is the pinning-fixed subgroup where that description applies, and its actual central form is the image of the corresponding simply-connected subgroup in H; type data alone do not identify Spin with SO. The connection is principal unipotent at zero and its adjoint intermediate-extension cohomology on P¹ vanishes in every degree.

**Inputs:** [KB.2/fg-connection](#kb-2-fg-connection); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `KloostermanMomentsAndPotentialAutomorphy:KM.2/differential-galois`.

**Proof route.** 1. Use the formal Coxeter description at ∞ and principal unipotence at zero to force a connected reductive subgroup containing principal SL₂. 2. Apply the classification of principal-SL₂-containing subgroups; pinned outer symmetries force the smaller rows. 3. Determine the central kernel in the given H rather than only its Lie algebra, and use the adjoint Euler characteristic computation for rigidity.

**Checks.**

- SL₃ has characteristic-zero SL₃ monodromy; the SO₃ result at p=2 must not be substituted into this algebraic theorem.
- G₂ and SO₇ have the same seven-dimensional connection but are different ambient group carriers; retain the image of the actual central map.
- Use the D_{n+1}→B_n row for n≥4, not the misindexed D_{2n+1} row in FG Corollary 10; D₄ remains the separate G₂ case.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §1.2.6, table (1.2.6.1), p. 6; §4.5.1, p. 51; FG Corollaries 9–10, pp. 28–29. Frenkel–Gross monodromy: For almost-simple H over an algebraically closed characteristic-zero field, the differential Galois group of the generic Frenkel–Gross connection is connected. [FG](https://arxiv.org/pdf/0901.2163v3), FG Theorem 1, p. 16, Proposition 8 and Corollaries 9–10, pp. 27–29. The local-to-global subgroup argument and the adjoint rigidity computation.

**Coverage:** planned. Remaining contracts: G3: Oper localization and reductive central descent; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

## KB.3. Relative de Rham–rigid comparison

Prove the comparison for minuscule and quasi-minuscule Hecke kernels over a common integral lift, extend across the quasi-minuscule vertex by intermediate extension, and pass through tensor generators. The unconditional main comparison has trivial multiplicative character; rational Kummer data require a separately checked convention.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.1`; `KloostermanSheavesAndBesselIsocrystals:KB.2`; `PadicDifferentialEquationsAndRigidCohomology:RD.4`.

<a id="kb-3-minuscule-comparison"></a>

### minuscule-comparison: Minuscule comparison

**Target (comparison).** For an integral generic φ and a minuscule representation W, the canonical relative specialization map (Kl_W^dR(−πφ))†→Kl_W^rig(ψφ) is an isomorphism of connections. In each lifted closed-point fiber the compact/ordinary comparison square and cleanness identify its degree-zero cohomology, all other shifted degrees vanish and the common dimension is dim W. Extend residue/coefficient fields to test every rigid closed point; R-valued points alone do not suffice.

**Inputs:** [KB.1/eigenobject](#kb-1-eigenobject); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary); `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`; `PadicDifferentialEquationsAndRigidCohomology:RD.0`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/specialization-forget-supports-square`.

**Proof route.** 1. Use the minuscule flag variety as a smooth projective compactification of the Hecke fiber over R. 2. Apply the imported absolute support/cosupport specialization square and the clean middle-cohomology calculation. 3. Construct the relative horizontal map. Complete the dagger ring faithfully flatly and test fibers after all finite residue extensions, then descend the isomorphism.

**Checks.**

- The shifted fiber cohomology is zero off degree zero and has dimension dim W in degree zero.
- Test a rigid point not rational over K after its finite coefficient/residue extension; the conclusion must descend from completion.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§4.2.2–4.2.4, Lemma 4.2.3 and (4.2.4.1)–(4.2.4.2), pp. 43–44. Minuscule comparison: For an integral generic φ and a minuscule representation W, the canonical relative specialization map (Kl_W^dR(−πφ))†→Kl_W^rig(ψφ) is an isomorphism of connections.

<a id="kb-3-quasi-minuscule-comparison"></a>

### quasi-minuscule-comparison: Quasi-minuscule comparison

**Target (comparison).** For a quasi-minuscule W, the comparison isomorphism is obtained for the intermediate-extension coefficient on the quasi-minuscule Schubert variety, not by asserting affine direct-image exactness for its punctured smooth stratum. The vertex correction identifies the image of compact-to-ordinary cohomology in degree zero on each fiber. On a dense open of X this yields the relative comparison, which extends uniquely to X after establishing convergence and overconvergence of the algebraic-side coefficient.

**Inputs:** [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.1/clean-datum](#kb-1-clean-datum); `PadicDifferentialEquationsAndRigidCohomology:RD.3`; `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`; `PadicDifferentialEquationsAndRigidCohomology:RD.0`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps`; `PadicDifferentialEquationsAndRigidCohomology:RD.4/specialization-forget-supports-square`.

**Proof route.** 1. Use the quasi-minuscule resolution and the localization triangle at its closed vertex. 2. Replace the false affineness step for τ by a proved perverse-truncation/intermediate-extension image calculation; this exact missing lemma is gap G4. 3. Apply the support/cosupport comparison to the middle image, construct the relative map on a dense smooth open, and extend using convergence detection and full faithfulness.

**Checks.**

- The required object is the intermediate-extension middle image; no assertion that the punctured projection τ is affine is used.
- The comparison must extend horizontally from the dense open only after the stated convergence/full-faithfulness theorem applies.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§4.2.5–4.2.7, Lemma 4.2.6 and (4.2.6.3), pp. 44–45. Quasi-minuscule comparison: For a quasi-minuscule W, the comparison isomorphism is obtained for the intermediate-extension coefficient on the quasi-minuscule Schubert variety, not by asserting affine direct-image exactness for its punctured smooth stratum.

<a id="kb-3-tensor-comparison"></a>

### tensor-comparison: Tensor de Rham–rigid comparison

**Target (theorem).** For χ=1 and a generic integral φ, the minuscule and quasi-minuscule comparisons extend to a natural tensor isomorphism (Kl_H^dR(−πφ))†≅Kl_H^rig(ψφ), including central characters for a reductive H. Choose tensor generators and their duals; comparison must commute with every intertwiner on their tensor powers before passing to idempotent images. Equality of the two abstract fiber functors without an identified comparison is not a proof of this commutation. Nontrivial tame characters have only the rational-Kummer extension contract, not an unconditional theorem with integral algebraic exponents.

**Inputs:** [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison); [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; [KB.1/character-variant](#kb-1-character-variant).

**Proof route.** 1. Use the root-datum tensor-generation theorem, including the finite central-character generating set and its duals. 2. Prove compatibility of specialization with convolution, fusion and all generator intertwiners, using a common normalized fiber identification (gap G4). 3. Descend through idempotents in characteristic zero and show independence of tensor presentations.

**Checks.**

- The comparison preserves generator evaluation/coevaluation, all intertwiners on tensor powers and idempotent images.
- For a nontrivial Teichmüller character over F₅, an integral algebraic exponent cannot pass the tame-character extension check.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.2.1 and §4.2.8, pp. 42–46. Tensor de Rham–rigid comparison: For χ=1 and a generic integral φ, the minuscule and quasi-minuscule comparisons extend to a natural tensor isomorphism (Kl_H^dR(−πφ))†≅Kl_H^rig(ψφ), including central characters for a reductive H.

**Coverage:** planned. Remaining contracts: G1: Relative integral Hecke geometry; G2: Coefficient operations and smooth Satake eigenvalues; G4: Quasi-minuscule middle-image and tensor comparison; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules, PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.3, PadicDifferentialEquationsAndRigidCohomology:RD.4, GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian.

## KB.4. Bessel Frobenius structures

Transport the rigid Hecke Frobenius to the Frenkel–Gross connection. Extend logarithmically at zero, compute its semisimple Frobenius class, give a convention-correct horizontal matrix equation and closed-point traces, with a separate central-torsor theorem after geometric monodromy is known.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.3`; `PadicDifferentialEquationsAndRigidCohomology:RD.2`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

<a id="kb-4-bessel-isocrystal"></a>

### bessel-isocrystal: Bessel F-isocrystal

**Target (construction).** Let φ be generic over R, with trivial tame character, and let E_i be its matched pinned parameters. The connection Be_H=d+(N+xΣ(−π)^{h_i}E_i)dx/x underlies an H-valued overconvergent F-isocrystal Be_H† on G_{m,k}: the exact tensor functor Rep(H)→F-Isoc† is transported from Kl_H^rig through the two comparison isomorphisms. Its W coefficient is pure of weight zero and its companion is Kl_H^{ét,ℓ}(ψφ)_W. The construction is independent of the chosen algebraic comparison once its central automorphisms and their Frobenius action have been checked.

**Inputs:** [KB.2/zhu-identification](#kb-2-zhu-identification); [KB.3/tensor-comparison](#kb-3-tensor-comparison); [KB.1/trace-companions](#kb-1-trace-companions).

**Proof route.** 1. Compose the algebraic and relative comparisons and transport the full tensor Frobenius, not just each representation separately. 2. Identify comparison automorphisms with constant central elements, whose action cancels in transport for the fixed coefficient Frobenius. 3. Preserve purity, coefficient extension and companion traces.

**Uses.** KB.6 monodromy: Defines the generated tensor categories. KB.8 through KB.11 applications: Frobenius turns the explicit connection computations into finite-sum and slope theorems.

**API.**

- `Bessel.bessel_isocrystal.underlying_connection` (compatibility): For every W the underlying dagger connection is the representation of d+(N+xΣ(−π)^{h_i}E_i)dx/x.
- `Bessel.bessel_isocrystal.tensor_frobenius` (structure): The Frobenius commutes with all intertwiners and the tensor unit, dual and product constraints.
- `Bessel.bessel_isocrystal.companion` (compatibility): For every closed point and W, its characteristic polynomial equals that of the normalized étale Hecke eigenobject.
- `Bessel.bessel_isocrystal.coefficient_extension` (compatibility): Finite extension of K carrying the chosen π and c_p to their fixed images commutes with the Bessel tensor functor, its Frobenius, and its closed-point characteristic polynomials.

**Unit tests.**

- **unit_representation.** (degenerate) The trivial H representation gives the constant rank-one F-isocrystal with Frobenius 1.
- **rank_two_normalization.** (computation) For H=SL₂, the degree-one standard trace is −RawKl₂/c_q.
- **torus_factor.** (degenerate) For a split torus with trivial tame character, every character yields the constant rank-one F-isocrystal, consistent with 2ρ=0.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.4.1, (4.4.1.1)–(4.4.1.3), pp. 49–50. Bessel F-isocrystal: Let φ be generic over R, with trivial tame character, and let E_i be its matched pinned parameters.

<a id="kb-4-log-extension"></a>

### log-extension: Nilpotent logarithmic extension

**Target (construction).** Be_H† extends uniquely to a tensor functor of log-convergent F-isocrystals on (A¹_k,0), nilpotent at the logarithmic point and overconvergent along ∞. Its residue in W is dρ_W(N) in the column-connection convention. The local Robba object at zero is unipotent with this principal nilpotent residue. This extension does not assert regularity at infinity.

**Inputs:** [KB.4/bessel-isocrystal](#kb-4-bessel-isocrystal); `PadicDifferentialEquationsAndRigidCohomology:RD.2`; `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

**Proof route.** 1. The explicit regular-singular connection has all p-adic exponents zero. 2. Use the Robba unipotent/log-nilpotent equivalence and its full faithfulness to extend Frobenius and tensor maps. 3. Identify the residue from the logarithmic matrix and fix its sign against the abstract local nilpotent category.

**Uses.** KB.4 zero Frobenius: The log fiber gives the semisimple Frobenius normalization. KB.5 ordinarity: Newton specialization uses this log extension at zero.

**API.**

- `Bessel.log_extension.restriction` (compatibility): Restriction to G_m recovers Be_H† as an F-isocrystal.
- `Bessel.log_extension.residue` (projection): The logarithmic residue in representation W is dρ_W(N); tensor residues add.
- `Bessel.log_extension.unique_extension` (universal-property): Every morphism between these unipotent objects extends uniquely to the nilpotent log extension.
- `Bessel.log_extension.tensor_dual` (compatibility): The canonical nilpotent-log extension preserves tensor products and duals; its residues are N⊗1+1⊗N′ and −N transpose, respectively, with the induced logarithmic Frobenius.

**Unit tests.**

- **sl_two_residue.** (computation) For SL₂ the standard residue has rank one and square zero; it is not the zero residue.
- **trivial_representation.** (degenerate) The unit representation has residue zero and log Frobenius 1.
- **infinity_boundary.** (non-example) A generic nonzero affine parameter has positive irregularity at infinity and cannot be extended there by the same nilpotent-log rule.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.4.2, (4.4.2.1), p. 50; §2.9.3, pp. 23–24. Nilpotent logarithmic extension: Be_H† extends uniquely to a tensor functor of log-convergent F-isocrystals on (A¹_k,0), nilpotent at the logarithmic point and overconvergent along ∞.

<a id="kb-4-zero-frobenius"></a>

### zero-frobenius: Frobenius at zero

**Target (theorem).** In the log fiber of Be_H†, the semisimple Frobenius class is the class of (2ρ)(c_q), where 2ρ is the integral sum of positive coroots of H; ρ itself need not be integral. In the column convention the horizontal matrix C satisfies N C(0)=q C(0)N, so C(0)^{−1}N C(0)=qN. This semisimple class agrees with (2ρ)(c_q) because a Weyl element exchanges ρ and −ρ. For the actual inverse Φ=C^{−1}, Ad_{Φ(0)}N=qN. This does not identify Φ with the source’s displayed gauge S; its equation has different derivative signs. For SL_r the eigenvalues are q^{−(r−1)/2},…,q^{(r−1)/2}.

**Inputs:** [KB.4/log-extension](#kb-4-log-extension); [KB.1/trace-companions](#kb-1-trace-companions); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Proof route.** 1. Use horizontal compatibility with the logarithmic residue to constrain Frobenius to a principal grading coset. 2. The normalized Satake nearby-cycle weights determine the central scalar in every irreducible representation. 3. Express the class using the integral cocharacter 2ρ and c_q; translate the two inverse matrix conventions rather than mixing their conjugation equations.

**Checks.**

- For H=SL₂ and c_q²=q, the column Frobenius diag(c_q^{−1},c_q) satisfies N C=q C N.
- At H=PGL₂, write the class as (2ρ)(c_q), not an undefined integral cocharacter ρ evaluated at q.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Proposition 4.4.5 and its proof, p. 50; §2.9.3, pp. 23–24 (convention reconciliation required). Frobenius at zero: In the log fiber of Be_H†, the semisimple Frobenius class is the class of (2ρ)(c_q), where 2ρ is the integral sum of positive coroots of H; ρ itself need not be integral.

<a id="kb-4-frobenius-matrix"></a>

### frobenius-matrix: Horizontal Frobenius matrix

**Target (theorem).** Set A(x)=N+xΣ(−π)^{h_i}E_i. In a column basis with ∇=d+A(x)dx/x, a horizontal Frobenius C:F*Be→Be has entries in the dagger ring on A¹ overconvergent at ∞ and satisfies δC+A(x)C=q C A(x^q), δ=x d/dx. At a closed point a of degree d, the Frobenius endomorphism is the ordered product C(ã)C(ã^q)⋯C(ã^{q^{d−1}}), with ã in the appropriate unramified coefficient extension; its trace is the normalized companion trace in every W. Its inverse Φ satisfies δΦ+q A(x^q)Φ=Φ A(x). The source instead displays δS+S A(x)=q A(x^q)S. These are not the same equation: inversion alone does not bridge them. Transposition gives the source-shaped equation for S=C^t with A replaced by A^t; identifying the actual group representations and root-basis conventions remains G5. Traces must use C in this fixed column convention until that bridge is proved.

**Inputs:** [KB.4/bessel-isocrystal](#kb-4-bessel-isocrystal); [KB.4/log-extension](#kb-4-log-extension); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary); `mathlib:Matrix.trace`.

**Proof route.** 1. Represent the abstract tensor Frobenius on the free trivial bundle; the log extension removes a pole at zero. 2. Derive the matrix equation directly from horizontal F*→object compatibility, then differentiate C^{−1} and transpose C separately; only the transpose gives a source-shaped equation with A^t. 3. Iterate the q-Frobenius pullback in the prescribed order and compute traces after residue-field extension; retain G5 for the source gauge, representation convention and trace identification.

**Checks.**

- Differentiate CΦ=1 to obtain δΦ=Φ A−q A(x^q)Φ; the sign distinguishes it from the source equation. Transpose the C equation to obtain the source-shaped equation with A^t, and specify the missing representation identification.
- At a nonprimitive point valued in k_d, use all d factors and the degree-d normalization, rather than the smaller closed-point degree.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.4.3–Theorem 4.4.4, (4.4.3.1)–(4.4.4.1), p. 50. Horizontal Frobenius matrix: Set A(x)=N+xΣ(−π)^{h_i}E_i.

**Coverage:** planned. Remaining contracts: G2: Coefficient operations and smooth Satake eigenvalues; G5: Published gauge versus column trace convention; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, PadicDifferentialEquationsAndRigidCohomology:RD.2, PadicDifferentialEquationsAndRigidCohomology:RD.3.

## KB.5. Newton bounds and generic ordinarity

Specialize the existing rational dominant Newton construction to semisimple Bessel Frobenius classes, normalized by v(q^degree)=1. Use the cuspidal eigenfunction bound and the log fiber at zero to prove generic ordinarity independently of the characteristic-two comparison.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.4`; `BunGAndNewtonStrata:BG1`.

<a id="kb-5-newton-specialization"></a>

### newton-specialization: Bessel Newton class

**Target (comparison).** For a semisimple Frobenius class b_a∈H at a closed point of degree d, after a finite coefficient extension splitting a torus containing b_a, take the dominant rational cocharacter ν_a defined by valuations of torus characters, normalized by v(q^d)=1. This is the existing Newton-orbit construction specialized to a linear q^d-Frobenius class; it is independent of torus conjugation. In GL_r it gives the nondecreasing slopes, and dominance μ≤λ means polygon(μ) lies above polygon(λ) with equal endpoints. Use the raw coroot dominance relation; the partial order on B(H), which additionally fixes κ, is not identified with this raw relation.

**Inputs:** `BunGAndNewtonStrata:BG1/newton-orbit-space`; `BunGAndNewtonStrata:BG1/representation-detects-dominance`; [KB.4/frobenius-matrix](#kb-4-frobenius-matrix).

**Proof route.** 1. Import rational cocharacters modulo Weyl and their dominant representatives from the existing Newton owner. 2. Use the valuation homomorphism on a maximal torus containing the semisimple class; prove compatibility with tensor representations. 3. Divide degree-d valuations by d and compare the GL polygon convention explicitly.

**Checks.**

- For GL₂ the slope pair (0,0) is below (−1/2,1/2) in coroot dominance, and its polygon is above it.
- Changing the degree-d valuation normalization by a factor d must change the unnormalized slopes, so normalization is explicit.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §5.4.1, (5.4.1.1), p. 62. Bessel Newton class: For a semisimple Frobenius class b_a∈H at a closed point of degree d, after a finite coefficient extension splitting a torus containing b_a, take the dominant rational cocharacter ν_a defined by valuations of torus characters, normalized by v(q^d)=1.

<a id="kb-5-cuspidal-newton-bound"></a>

### cuspidal-newton-bound: Cuspidal Newton bound

**Target (theorem).** For the normalized Bessel Hecke eigenobject of a split almost-simple group, every closed-point Newton class satisfies ν_a≤ρ, with ρ one half the sum of positive coroots of H and the normalization above. The needed automorphic input is the Newton bound for the unique cuspidal eigenfunction attached to the generic two-point datum over the function field; it is stronger than purity alone. The bound is retained under products and the compatible central quotients for split reductive H.

**Inputs:** [KB.1/eigenobject](#kb-1-eigenobject); [KB.5/newton-specialization](#kb-5-newton-specialization); `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`.

**Proof route.** 1. Identify the normalized Hecke eigenvalues with those of the generic cuspidal eigenfunction. 2. Apply the group-valued function-field automorphic Newton bound with the exact normalization (gap G8). 3. Transfer the bound to the rigid coefficients by closed-point polynomial comparison.

**Checks.**

- A pure weight-zero coefficient need not have ν≤ρ by purity alone; identify the cuspidal eigenfunction input.
- The split-torus factor has ρ=0 and the trivial normalized coefficient, consistent with central products.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 5.4.2(i), proof, p. 62; §1.3.4, pp. 7–8. Cuspidal Newton bound: For the normalized Bessel Hecke eigenobject of a split almost-simple group, every closed-point Newton class satisfies ν_a≤ρ, with ρ one half the sum of positive coroots of H and the normalization above.

<a id="kb-5-generic-ordinarity"></a>

### generic-ordinarity: Generic ordinarity

**Target (theorem).** There is a dense open U⊂G_m such that ν_a=ρ for every closed point a∈U. Equivalently the exceptional closed points form a finite set. This holds for every split reductive H with the normalized trivial-tame-character datum. It is proved before using the characteristic-two appendix: the log fiber at zero has Newton class ρ, semicontinuity compares it to the generic class, and the cuspidal bound supplies the opposite inequality.

**Inputs:** [KB.5/cuspidal-newton-bound](#kb-5-cuspidal-newton-bound); [KB.4/zero-frobenius](#kb-4-zero-frobenius); `PadicDifferentialEquationsAndRigidCohomology:RD.3`; `PadicDifferentialEquationsAndRigidCohomology:RD.1`.

**Proof route.** 1. Use log-convergent Newton specialization on a connected neighborhood of zero to bound the generic polygon by that at zero. 2. Combine with ν≤ρ to get equality at the generic point. 3. Use constructibility/semicontinuity and finite type of the curve to find the common open with constant Newton class; no everywhere-ordinary theorem enters.

**Checks.**

- Prove this theorem without invoking the appendix comparison or everywhere ordinarity.
- Use finitely many tensor generators to choose one common ordinary open, whose complement is finite on the curve.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 5.4.2(i) and proof, p. 62; Appendix A.2, p. 64. Generic ordinarity: There is a dense open U⊂G_m such that ν_a=ρ for every closed point a∈U.

**Coverage:** planned. Remaining contracts: G8: Automorphic Newton bound and log specialization; Fulfil the exact requested contracts: PadicDifferentialEquationsAndRigidCohomology:RD.1, PadicDifferentialEquationsAndRigidCohomology:RD.3.

## KB.6. Local and global monodromy

Construct the three Bessel-generated Tannakian groups by specialization of existing Tannakian theory. Prove nontrivial wild inertia, exclude principal PGL₂ using the adjoint irregularity bound, identify geometric and arithmetic monodromy away from the even-A characteristic-two exception, and prove adjoint cohomological rigidity and the prime-to-Weyl-order simple-wild description.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.4`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `PadicDifferentialEquationsAndRigidCohomology:RD.1`; `PadicDifferentialEquationsAndRigidCohomology:RD.2`; `MotivesAndAlgebraicCycles:MC.6`.

<a id="kb-6-generated-groups"></a>

### generated-groups: Bessel monodromy groups

**Target (construction).** Specialize neutral Tannakian subcategory generation to the images of Rep(H) under Be_H, Be_H† with Frobenius forgotten, and Be_H† with Frobenius retained. Their tensor automorphism groups are respectively G_alg, G_geo and G_arith. They are defined using all subquotients of finite tensor constructions, not merely the original image. Compatible fiber choices give closed embeddings G_geo→G_alg→H and G_geo→G_arith→H. Cross-coefficient monodromy comparison is a different theorem, not a formal arrow between these three categories.

**Inputs:** [KB.4/bessel-isocrystal](#kb-4-bessel-isocrystal); [KB.2/fg-connection](#kb-2-fg-connection); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `PadicDifferentialEquationsAndRigidCohomology:RD.6/coefficient-category-is-neutral-tannakian`.

**Proof route.** 1. Use the existing neutral Tannaka carrier and exact tensor subcategory generation. 2. Specify the fiber functors and the analytic/forget-Frobenius functors which induce each arrow. 3. Use the quotient universal property of tensor generation to obtain the closed embeddings.

**Uses.** KB.6 monodromy theorem: Provides actual embedded groups, not only abstract isomorphism types. KB.7 functoriality: Centralizers and compatible monodromy determine Frobenius ratios.

**API.**

- `Bessel.generated_groups.image_factorization` (universal-property): Each original Rep(H) functor factors through its generated tensor category; the associated group embeds into H.
- `Bessel.generated_groups.forget_frobenius` (functoriality): Forgetting Frobenius gives the indicated G_geo→G_arith embedding with compatible fibers.
- `Bessel.generated_groups.fiber_change` (compatibility): Changing a fiber functor changes the embedded group by its tensor-isomorphism torsor; statements are made up to the corresponding conjugation.
- `Bessel.generated_groups.tensor_invariants` (characterisation): In the generated category with Frobenius forgotten, a tensor is geometrically invariant exactly when it comes from the corresponding constant subobject. This is the specialized coefficient-category invariant criterion, not a reconstruction of the generic Tannakian carrier.

**Unit tests.**

- **trivial_object.** (degenerate) For the trivial tensor functor on Rep(G_m), generation has trivial monodromy, not G_m.
- **scalar_rank_two.** (compatibility) The normalized SL₂ standard object generates geometric SL₂, agreeing with the scalar supplier at every p.
- **include_subquotients.** (characterisation) A reducible tensor construction contributes its invariant line as a subobject; restricting to the literal image instead of subquotient closure fails this test.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §4.5.1, (4.5.1.1), p. 51. Bessel monodromy groups: Specialize neutral Tannakian subcategory generation to the images of Rep(H) under Be_H, Be_H† with Frobenius forgotten, and Be_H† with Frobenius retained.

<a id="kb-6-wild-nontrivial"></a>

### wild-nontrivial: Nontrivial wild monodromy

**Target (theorem).** For almost-simple H, the geometric Bessel group contains exp(tN) from the unipotent local object at zero, and the wild local inertia at infinity has nontrivial image. Purity gives semisimplicity of the neutral geometric group. If wild inertia were trivial, the étale companion would be tame at both boundary points; the tame geometric fundamental group of G_m is procyclic, incompatible with a semisimple group containing a nontrivial principal unipotent.

**Inputs:** [KB.6/generated-groups](#kb-6-generated-groups); [KB.4/log-extension](#kb-4-log-extension); [KB.1/trace-companions](#kb-1-trace-companions); `PadicDifferentialEquationsAndRigidCohomology:RD.2`.

**Proof route.** 1. Use the nilpotent Robba fiber to embed its one-parameter unipotent group. 2. Use GOS and companions to transfer the tame consequence of trivial wild inertia. 3. Combine geometric semisimplicity with the procyclic tame quotient to contradict the principal unipotent.

**Checks.**

- The principal nilpotent at zero must give a nontrivial one-parameter unipotent subgroup for an almost-simple H.
- The tame contradiction uses geometric semisimplicity, not only purity of a numerical trace function.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Lemma 4.5.3 and §4.5.4, pp. 51–52. Nontrivial wild monodromy: For almost-simple H, the geometric Bessel group contains exp(tN) from the unipotent local object at zero, and the wild local inertia at infinity has nontrivial image.

<a id="kb-6-principal-exclusion"></a>

### principal-exclusion: Principal PGL₂ exclusion

**Target (theorem).** For almost-simple H of rank r and Coxeter number h, the adjoint rigid irregularity at infinity is at most r. Unless the type is A₁, or A₂ at p=2, the image in H_ad is not contained in its principal PGL₂. The principal restriction is ⊕_i Sym^{2e_i} of the two-dimensional SL₂ module, where e_i are the exponents. Nontrivial wild inertia and the finite solvable subgroups of PGL₂ force an irregularity strictly exceeding r in the excluded containment.

**Inputs:** [KB.6/wild-nontrivial](#kb-6-wild-nontrivial); [KB.2/differential-monodromy](#kb-2-differential-monodromy); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `PadicDifferentialEquationsAndRigidCohomology:RD.1`.

**Proof route.** 1. Apply Baldassarri’s algebraic-to-p-adic maximal-slope bound 1/h to the adjoint representation and use integrality of irregularity: dim(h)/h=r+r/h<r+1. 2. Use the principal-SL₂ exponent decomposition, correcting the shifted exponent typo. 3. Analyze the cyclic/dihedral wild case and the p=2 A₄/V₄ case; the listed low-rank exceptions are essential.

**Checks.**

- Use Sym^{2e_i}; the sum of its dimensions must equal dim Lie(H).
- Retain A₁ and the A₂,p=2 exceptions and derive the integer bound Irr≤r from the precise formal-slope comparison.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Lemma 4.5.5, (4.5.5.1), pp. 52–53. Principal PGL₂ exclusion: For almost-simple H of rank r and Coxeter number h, the adjoint rigid irregularity at infinity is at most r.

<a id="kb-6-global-monodromy"></a>

### global-monodromy: Bessel monodromy classification

**Target (theorem).** If H is almost simple and either p>2 or H is not of type A_{2n} (n≥1), then G_geo=G_alg and G_arith=G_geo as embedded subgroups up to the chosen fiber conjugation. The group types and central forms are those of the Frenkel–Gross table. In odd characteristic, exclude a proper SO_{2n+1} image in SL_{2n+1} using the x↦−x duality and genuine μ₂ descent; nonzero standard Swan would then be divisible by 2, contradicting Swan 1. The even-A p=2 branch is supplied by KB.11, not this theorem.

**Inputs:** [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.6/generated-groups](#kb-6-generated-groups); [KB.2/differential-monodromy](#kb-2-differential-monodromy); [KB.4/zero-frobenius](#kb-4-zero-frobenius); `KloostermanMomentsAndPotentialAutomorphy:KM.1/monodromy`.

**Proof route.** 1. Use principal-SL₂ subgroup classification and the algebraic upper subgroup to force equality outside even A. 2. For even A in odd characteristic, normalize the self-duality isomorphism to a μ₂ descent cocycle before multiplying Swan under the cover; the scalar type-A supplier supplies an independent check. 3. Use pinned symmetries and the normalized log Frobenius to exclude remaining central arithmetic components; descend along the actual central isogeny.

**Checks.**

- For type A₂ in odd characteristic obtain SL₃, and reserve p=2 for the final branch.
- The odd-characteristic μ₂ descent needs an actual involutive cocycle before Swan multiplicativity is used.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.5.2(i),(iii), pp. 51–53. Bessel monodromy classification: If H is almost simple and either p>2 or H is not of type A_{2n} (n≥1), then G_geo=G_alg and G_arith=G_geo as embedded subgroups up to the chosen fiber conjugation.

<a id="kb-6-rigidity-local"></a>

### rigidity-local: Adjoint rigidity and simple wildness

**Target (theorem).** For almost-simple H outside the even-A p=2 branch already reserved for KB.11, put E=Be_H†,Ad. Then H^i(P¹,j_!+E)=0 for every i, Irr_∞E=rank H, the adjoint inertia invariants at ∞ vanish and the local nilpotent operator N_∞ is zero. The local Weil datum obtained from the Frobenius object is discrete with minimal adjoint Swan, hence has the simple-wild property in the Gross–Reeder sense. If p∤|W_H|, its nonzero adjoint upper breaks are all 1/h; retain this stronger hypothesis. Merely specifying a bare inertia map is not the full Weil-parameter definition.

**Inputs:** [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.4/log-extension](#kb-4-log-extension); `PadicDifferentialEquationsAndRigidCohomology:RD.2`; `PadicDifferentialEquationsAndRigidCohomology:RD.5`; `PadicDifferentialEquationsAndRigidCohomology:RD.6/grothendieck-ogg-shafarevich-formula`.

**Proof route.** 1. Apply duality and the GOS Euler characteristic to the localization sequence for j_!+E. 2. The zero fiber contributes r invariant residue vectors; combine the upper bound r with exactness to force all middle cohomology and infinity invariants to vanish. 3. A nonzero adjoint N_∞ would lie in the inertia-invariant adjoint subspace, so vanishing forces N_∞=0. Apply the simple-wild structure theorem only for p∤|W_H|; the generic Weil-parameter supplier is gap G7. 4. In the characteristic-zero middle-cohomology check, subtract one inertia-invariant dimension at zero and one at infinity. FG (14.1), p. 29, repeats I₀ typographically; its preceding boundary sequence gives the correct I₀⊕I∞.

**Checks.**

- The adjoint zero-invariant space contributes rank H, and the localization sequence with Irr≤rank H forces the infinity invariants to vanish.
- Only apply the 1/h upper-break theorem under p∤|W_H|, with a discrete Weil datum rather than just an inertia homomorphism.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Corollary 4.5.7 and Remark 4.5.8, p. 54; HNY Corollary 2.15, p. 262. Adjoint rigidity and simple wildness: For almost-simple H outside the even-A p=2 branch already reserved for KB.11, put E=Be_H†,Ad. [GR](https://people.math.harvard.edu/~gross/preprints/AdjointGamma5.pdf), §5.3, Proposition 5.6, pp. 34–35; §6 definition, p. 35. Discrete Weil parameters with vanishing adjoint inertia invariants and minimal Swan have the stated prime-to-Weyl-order ramification description.

**Coverage:** planned. Remaining contracts: G6: Slope comparison and exact-radius inputs; G7: Generic monodromy and Lie-theoretic proof inputs; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, PadicDifferentialEquationsAndRigidCohomology:RD.1, PadicDifferentialEquationsAndRigidCohomology:RD.2, PadicDifferentialEquationsAndRigidCohomology:RD.5, MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction, KloostermanMomentsAndPotentialAutomorphy:KM.1/monodromy.

## KB.7. Functoriality and companions

Prove pinning-compatible functoriality between the groups in one Frenkel–Gross monodromy row, including integral parameters, the central torsor of Frobenius structures and the normalized central Frobenius. Transfer the tensor statement to étale companions by traces and representation-ring restriction. Compare monodromy through compatible systems without asserting an unsupported surjection between coefficient groups.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.6`; `KloostermanSheavesAndBesselIsocrystals:KB.5`.

<a id="kb-7-central-torsor"></a>

### central-torsor: Central freedom of Frobenius

**Target (theorem).** For almost-simple H with the computed geometric Bessel subgroup and fixed coefficient Frobenius, the set of tensor Frobenius structures on its underlying overconvergent connection is a torsor under Z(H)(K). The ratio of two such structures is a horizontal tensor automorphism, hence lies in the centralizer of geometric monodromy, which is Z(H). Normalized Frobenius eigenvalues at zero in every representation determine the unique central choice. This is not uniqueness from the differential equation alone.

**Additional hypotheses.** For the characteristic-two even-A branch, use the final KB.11 monodromy theorem when applying this torsor statement; the earlier functoriality application uses the non-even-A rows.

**Inputs:** [KB.4/bessel-isocrystal](#kb-4-bessel-isocrystal); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.4/zero-frobenius](#kb-4-zero-frobenius); `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

**Proof route.** 1. Apply neutral Tannaka to a horizontal tensor automorphism of the underlying connection. 2. Use the centralizer calculation for the Bessel monodromy subgroup; record the characteristic-two even-A use after KB.11. 3. Compare the scalar on the highest/lowest residue lines in every irreducible representation to remove the central ratio.

**Checks.**

- The differential equation alone admits central Frobenius multiples; normalized log eigenvalues remove that freedom.
- Use the centralizer of the actual geometric group, and postpone the even-A,p=2 application until its monodromy is known.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Lemma 5.1.1, p. 55; §4.4.1 and Theorem 4.4.4, pp. 49–50. Central freedom of Frobenius: For almost-simple H with the computed geometric Bessel subgroup and fixed coefficient Frobenius, the set of tensor Frobenius structures on its underlying overconvergent connection is a torsor under Z(H)(K).

<a id="kb-7-symmetry-central"></a>

### symmetry-central: Central and pinned symmetries

**Target (theorem).** For a homomorphism G′→G inducing the same adjoint root data and the compatible root-depth quotients, the dual map H→H′ pushes Kl_H to Kl_H′; the direction reverses on dual groups. Pinned automorphisms and x-rescaling give their tensor-compatible transformations of φ. For almost-simple H not of even-A type, pinned outer automorphisms preserve the generic normalized object; for even A in odd characteristic the outer involution produces x↦−x together with duality. The exceptional representation identities include Sym²(SL₂)=Std(SO₃), the primitive Λ² of Sp₄=Std(SO₅), Std(SO₄)=Std(SL₂)⊗Std(SL₂), and Λ²Std(SL₄)=Std(SO₆).

**Inputs:** [KB.1/eigenobject](#kb-1-eigenobject); [KB.0/affine-depth](#kb-0-affine-depth); [KB.2/zhu-identification](#kb-2-zhu-identification).

**Proof route.** 1. Transport the level charts and Hecke kernels under the specified group maps. 2. Track the inverse pinned automorphism on representation restriction and the affine-root scaling under x-rescaling. 3. Check the exceptional isogenies through their representations; do not infer equality of arbitrary bad-prime commutator quotients.

**Checks.**

- A map of automorphic groups G′→G induces the reversed dual map H→H′.
- For SO₄ use the SL₂×SL₂ standard tensor product; a fictitious almost-simple D₂ case is rejected.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§4.1.9–4.1.10, (4.1.9.1)–(4.1.10.5), pp. 40–41. Central and pinned symmetries: For a homomorphism G′→G inducing the same adjoint root data and the compatible root-depth quotients, the dual map H→H′ pushes Kl_H to Kl_H′; the direction reverses on dual groups.

<a id="kb-7-integral-functoriality"></a>

### integral-functoriality: Integral Bessel functoriality

**Target (theorem).** Let H′⊂H be a pinning-compatible inclusion in one row of the Frenkel–Gross table. For generic integral φ′ for the dual of H′, the matched Frenkel–Gross parameter ξ also comes from a generic integral φ for the dual of H. The normalized H-valued Bessel F-isocrystal is the pushout of the H′-valued object. Integrality means that the affine invariant has unit scale relative to a generic integral parameter, not merely that ξ is nonzero over K.

**Inputs:** [KB.7/symmetry-central](#kb-7-symmetry-central); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.7/central-torsor](#kb-7-central-torsor); [KB.2/invariant-parameter](#kb-2-invariant-parameter); `PadicDifferentialEquationsAndRigidCohomology:RD.1`.

**Proof route.** 1. The algebraic pushout is immediate from the pinned connection matrices. 2. For a nontrivial irreducible adjoint constituent, use a solution with exact convergence radius 1: a nonunit relative scale would make one rescaled solution yield a forbidden constant quotient. This precise radius statement is a requested input. 3. The resulting Frobenius structures differ centrally; their log eigenvalues at zero agree, so the ratio is 1.

**Checks.**

- A nonzero K-parameter alone is insufficient: its affine invariant must have unit scale relative to the generic integral parameter.
- The residual central Frobenius ratio must be 1 after matching every normalized log eigenvalue at zero.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Proposition 5.1.3 and §5.1.2, p. 55. Integral Bessel functoriality: Let H′⊂H be a pinning-compatible inclusion in one row of the Frenkel–Gross table.

<a id="kb-7-etale-functoriality"></a>

### etale-functoriality: HNY functoriality

**Target (theorem).** For the same inclusion H′⊂H and any generic φ′ over k, there is a generic φ over k such that Kl_H^{ét,ℓ}(ψφ) is isomorphic to the pushout of Kl_H′^{ét,ℓ}(ψφ′) as tensor local systems, ℓ≠p. The proof needs restriction of representation rings onto the common geometric monodromy group after rationalization, plus Chebotarev and the class-preserving automorphism theorem. In the Spin₇/G₂ case use V₇|G₂=Std₇ and V₁₄=Λ²V₇−V₇ to generate the G₂ ring; the spin representation alone is insufficient.

**Inputs:** [KB.7/integral-functoriality](#kb-7-integral-functoriality); [KB.1/trace-companions](#kb-1-trace-companions); [KB.6/global-monodromy](#kb-6-global-monodromy); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Proof route.** 1. Lift φ′ first, construct φ by the integral parameter theorem, and reduce it. 2. Use the companion trace equality and representation-ring restriction to get equality for every representation of the common monodromy group. 3. Apply semisimple Chebotarev in a faithful representation, then show its conjugating automorphism is inner from preservation of all semisimple conjugacy classes.

**Checks.**

- Lift φ′ over R first; then match the larger-group invariant parameter and reduce it.
- For Spin₇/G₂, V₇ and Λ²V₇−V₇ recover the G₂ standard and adjoint generators; spin restriction alone does not justify representation-ring surjectivity.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 5.1.4, pp. 55–56. HNY functoriality: For the same inclusion H′⊂H and any generic φ′ over k, there is a generic φ over k such that Kl_H^{ét,ℓ}(ψφ) is isomorphic to the pushout of Kl_H′^{ét,ℓ}(ψφ′) as tensor local systems, ℓ≠p.

<a id="kb-7-etale-monodromy"></a>

### etale-monodromy: Companion monodromy comparison

**Target (theorem).** The normalized étale companions have the same geometric and arithmetic monodromy types, component groups and compatible embedded H-subgroups as the p-adic Bessel classification, outside even-A at p=2. The final layer supplies that branch. Use a common algebraic coefficient system and the compatible-system neutral monodromy theorem, then the separate representation/tensor identification inside H. Equality of dimensions of two subgroups of H, or an unsupported surjective homomorphism between groups over different coefficient fields, is not enough.

**Inputs:** [KB.1/trace-companions](#kb-1-trace-companions); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.7/etale-functoriality](#kb-7-etale-functoriality).

**Proof route.** 1. Use purity and semisimplicity to place the companions in the hypotheses of the common-neutral-group compatible-system theorem. 2. Compare components and the neutral group over an algebraic coefficient field. 3. Identify the embedding in H using tensor invariants and the pinning-compatible representation identifications; G7 records the still-unverified supplier statement.

**Checks.**

- Use the common coefficient neutral group and compare components and H-embeddings separately.
- A surjective map between two groups embedded in H is not accepted as an isomorphism without kernel/dimension control.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Corollary 4.5.6, p. 53 (the cited cross-coefficient group-map argument requires replacement). Companion monodromy comparison: The normalized étale companions have the same geometric and arithmetic monodromy types, component groups and compatible embedded H-subgroups as the p-adic Bessel classification, outside even-A at p=2.

**Coverage:** planned. Remaining contracts: G6: Slope comparison and exact-radius inputs; G7: Generic monodromy and Lie-theoretic proof inputs; Fulfil the exact requested contracts: tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, PadicDifferentialEquationsAndRigidCohomology:RD.1, MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction.

## KB.8. Classical realizations and orthogonal sums

Identify special-linear and symplectic standard objects with the all-rank scalar supplier. Compute the orthogonal matrices and the invariant line, the quadric Landau–Ginzburg realization for n≥3, and the corrected even-orthogonal toric trace formula; treat SO₄ by its product realization.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.7`; `KloostermanMomentsAndPotentialAutomorphy:KM.1`; `KloostermanMomentsAndPotentialAutomorphy:KM.2`; `KloostermanMomentsAndPotentialAutomorphy:KM.4`.

<a id="kb-8-classical-scalar"></a>

### classical-scalar: Classical scalar realizations

**Target (comparison).** For the standard summed affine-generic character, Be_SLr,Std† agrees with the existing normalized scalar rank-r Bessel object for r≥2, with the imported cyclic sign dictionary. Likewise Be_Sp2n,Std† agrees with the scalar rank-2n object. The GL_r object is the corresponding central extension with trivial normalized determinant. These are comparison maps with the scalar supplier; no second definition of the all-rank Kloosterman sum, sheaf, connection or rigid realization is introduced.

**Inputs:** [KB.7/integral-functoriality](#kb-7-integral-functoriality); `KloostermanMomentsAndPotentialAutomorphy:KM.1/normalized-sheaf`; `KloostermanMomentsAndPotentialAutomorphy:KM.2/bessel-dictionary`; `KloostermanMomentsAndPotentialAutomorphy:KM.4/rigid-realization`.

**Proof route.** 1. Identify the standard-representation Hecke diagram with the scalar exponential torus diagram. 2. Use the superdiagonal/last-row matrix to match the scalar cyclic generator and λ parameter. 3. The even-dimensional anti-diagonal alternating form is preserved, so use integral pinning functoriality to identify the symplectic object.

**Checks.**

- The rank-two standard trace is minus the raw scalar sum divided by c_q.
- The scalar cyclic module and its horizontal solution dual must use the imported sign dictionary; do not define another scalar object.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§5.3.1–5.3.2, (5.3.1.1)–(5.3.1.3), pp. 57–58. Classical scalar realizations: For the standard summed affine-generic character, Be_SLr,Std† agrees with the existing normalized scalar rank-r Bessel object for r≥2, with the imported cyclic sign dictionary.

<a id="kb-8-orthogonal-matrices"></a>

### orthogonal-matrices: Orthogonal Bessel matrices

**Target (definition).** Use one-based matrix units. In SO_{2n}, n≥3, set N=Σ_{1≤i≤2n−1,i≠n}E_{i,i+1}+E_{n−1,n+1}+E_{n,n+2} and E=E_{2n−1,1}+E_{2n,2}; the preserved anti-diagonal form has entries (−1)^max(i,j) at i+j=2n+1. The connection is d+(N+λ^{2n−2}xE)dx/x. In SO_{2n+1}, n≥1, take N=Σ_{i=1}^{2n}E_{i,i+1}, E=2E_{2n,1}+2E_{2n+1,2}, and the alternating-sign symmetric anti-diagonal form; the connection is d+(N+λ^{2n}xE)dx/x. Its scalar equation in the source cyclic convention is δ^{2n+1}−λ^{2n}x(4δ+2). The primal group for this odd orthogonal construction is Sp_{2n}; its middle simple-root coordinate is E_{n,n+1}, with each affine-root coefficient retained.

**Inputs:** [KB.2/fg-connection](#kb-2-fg-connection); [KB.2/invariant-parameter](#kb-2-invariant-parameter); `mathlib:Matrix.trace`.

**Proof route.** 1. Take the standard split orthogonal and symplectic carriers from their existing roadmap, not a new group definition. 2. Check the Lie-algebra form equation entry by entry and match the degree-h invariant polynomial. 3. Use the displayed cyclic gauge to obtain the odd operator, retaining the coefficient 2 in each lowest-root entry.

**Uses.** KB.8 even decomposition: Computes the trivial orthogonal summand. KB.9 odd hypergeometric comparison: The scalar operator determines the pullback factor 4.

**API.**

- `Bessel.orthogonal_matrices.lie_form` (characterisation): Both N and E satisfy the infinitesimal form-preservation equation in the specified anti-diagonal form.
- `Bessel.orthogonal_matrices.invariant_line` (simp): For the even matrix, (N+λ^{2n−2}xE)(e_n−e_{n+1})=0.
- `Bessel.orthogonal_matrices.odd_operator` (compatibility): The cyclic presentation is the specified odd scalar operator; its normalized holomorphic solution at zero has coefficients (2r−1)!!(2λ^{2n})^r/(r!)^{2n+1}.
- `Bessel.orthogonal_matrices.coefficient_base_change` (compatibility): The integral matrix entries commute with characteristic-zero coefficient extension; the form and invariant-line identities hold under the same scalar map. A coefficient field of residue characteristic two still has characteristic zero.

**Unit tests.**

- **odd_rank_three.** (computation) For n=1, N=E₁₂+E₂₃, E=2E₂₁+2E₃₂ and the operator is δ³−λ²x(4δ+2).
- **even_rank_six.** (computation) For n=3, N has E₁₂,E₂₃,E₄₅,E₅₆,E₂₄,E₃₅ and kills e₃−e₄; adding E₃₄ would fail.
- **factor_two.** (non-example) Replacing E by E/2 changes the coefficient of x in the normalized odd formal solution from 2λ^{2n} to λ^{2n}; it fails the parameter/Frobenius normalization.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §5.3.3, (5.3.3.1)–(5.3.3.2), p. 58; §5.3.6, (5.3.6.1)–(5.3.6.4), pp. 60–61 (root-coordinate misprints corrected). Orthogonal Bessel matrices: Use one-based matrix units.

<a id="kb-8-orthogonal-decomposition"></a>

### orthogonal-decomposition: Orthogonal invariant-line decomposition

**Target (theorem).** For n≥2, the even standard object of dimension 2n+2 decomposes as Be_SO2n+1,Std†⊕1, with trivial summand spanned by the corresponding e_{n+1}−e_{n+2}. Its Frobenius on that line is 1, not a nontrivial constant character. The n=1 case SO₄ is given by SL₂×SL₂ and the standard tensor product; its restriction to the diagonal is Sym²Std⊕1, giving the same SO₃⊕1 formula. Thus the trace identity T_SO2n+2(a)−1=T_SO2n+1(a) holds for every n≥1.

**Inputs:** [KB.8/orthogonal-matrices](#kb-8-orthogonal-matrices); [KB.7/symmetry-central](#kb-7-symmetry-central); [KB.7/integral-functoriality](#kb-7-integral-functoriality).

**Proof route.** 1. Separate the invariant line and its orthogonal complement in the explicit even matrix; after adjoining √2 identify the complementary odd pinning. 2. Use integral functoriality and the zero-fiber Frobenius to determine the trivial-line Frobenius. 3. Handle SO₄ through its product representation, including the diagonal symmetric-square decomposition.

**Checks.**

- The invariant line has Frobenius 1, so the two normalized standard traces differ by exactly 1.
- The SO₄ diagonal restriction gives Sym²Std⊕1, providing the n=1 boundary check.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §5.3.3, p. 58; (5.3.6.5), p. 60; Corollary 5.3.11(ii), p. 61. Orthogonal invariant-line decomposition: For n≥2, the even standard object of dimension 2n+2 decomposes as Be_SO2n+1,Std†⊕1, with trivial summand spanned by the corresponding e_{n+1}−e_{n+2}.

<a id="kb-8-quadric-potential"></a>

### quadric-potential: Quadric Landau–Ginzburg realization

**Target (construction).** For n≥3 let Q⊂P^{2n−1} have coordinates (p₀,…,p_{n−1},p′_{n−1},p_n,…,p_{2n−2}) and equation p_{n−1}p′_{n−1}+Σ_{j=0}^{n−2}(−1)^{n−1−j}p_jp_{2n−2−j}=0. Set δ_l=Σ_{j=0}^l(−1)^j p_{l−j}p_{2n−2−l+j}. Remove the zeros of p₀,p_{2n−2},p_{n−1},p′_{n−1} and δ_l for 1≤l≤n−3. On this open Q° define W=p₁/p₀+Σ_{l=1}^{n−3}p_{l+1}p_{2n−2−l}/δ_l+p_n/p_{n−1}+p_n/p′_{n−1}+x p₁/p_{2n−2}. Then the even-orthogonal rigid standard object is pr₂!(W*AS_ψ)[2(n−1)](n−1); its de Rham version uses E_λ and the shift without a Frobenius twist. This formula is not defined by overlapping n=2 divisor labels.

**Inputs:** [KB.1/hecke-action](#kb-1-hecke-action); [KB.8/orthogonal-matrices](#kb-8-orthogonal-matrices); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary).

**Proof route.** 1. Construct the quadric on the existing algebraic-geometry carriers and the explicitly defined divisor complement. 2. Identify this open Hecke chart and its character map with the Landau–Ginzburg potential (the original Lam–Templier identification remains supplier/source gap G9). 3. Apply the base-point eigenvalue formula, preserving its even dimension shift and integer Tate twist.

**Uses.** KB.8 toric formula: Stratify Q° to calculate the finite-field trace. KB.3 comparison tests: A specific smooth minuscule geometry with its exponential coefficient.

**API.**

- `Bessel.quadric_potential.regular_potential` (characterisation): Every denominator of W is invertible on Q°, and its homogeneous degree is zero in the projective coordinates.
- `Bessel.quadric_potential.trace` (projection): At degree d the trace is q^{−d(n−1)}Σ_{z∈Q°(k_d)}ψ(Tr W(z,a)); the even cohomological shift introduces no sign.
- `Bessel.quadric_potential.hecke_chart` (compatibility): The standard orthogonal Hecke chart is Q°×G_m with character W, respecting the chosen invariant parameter.
- `Bessel.quadric_potential.constant_extension` (compatibility): Finite constant-field extension commutes with the open quadric, its potential and its exponential direct image. Its degree-d trace uses ψ composed with Tr_{k_d/k} and q^{−d(n−1)}.

**Unit tests.**

- **n_three.** (computation) For n=3 the δ_l sum is empty and W=p₁/p₀+p₃/p₂+p₃/p′₂+x p₁/p₄ on p₂p′₂−p₁p₃+p₀p₄=0.
- **projective_scaling.** (compatibility) Rescaling every p coordinate by a nonzero scalar leaves W unchanged; scaling x changes only the final term.
- **n_two_excluded.** (non-example) n=2 is rejected for this chart formula and is computed instead by the SO₄ product realization.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §5.3.4, (5.3.4.1)–(5.3.4.6), pp. 58–59. Quadric Landau–Ginzburg realization: For n≥3 let Q⊂P^{2n−1} have coordinates (p₀,…,p_{n−1},p′_{n−1},p_n,…,p_{2n−2}) and equation p_{n−1}p′_{n−1}+Σ_{j=0}^{n−2}(−1)^{n−1−j}p_jp_{2n−2−j}=0.

<a id="kb-8-even-toric-trace"></a>

### even-toric-trace: Even orthogonal toric trace

**Target (theorem).** Let Q=q^d and ψ_d=ψ∘Tr_{F_Q/F_p}. For n≥3, a∈F_Q×, put S_n(a)=Σ_{x₁,…,x_{2n−2}∈F_Q×}ψ_d(Σ_i x_i+a(x₁+x₂)/(∏_i x_i)). The normalized SO_{2n} standard trace is Q^{−(n−1)}(S_n(a)+Q^{n−1}−Q). For n=2 it is the square of the normalized rank-two Kloosterman trace. The constant is Q^{n−1}−Q, not (Q−1)Q^{n−2}.

**Additional hypotheses.** G9 records the direct boundary-count verification; do not use the later raw identities to prove their own trace input.

**Inputs:** [KB.8/quadric-potential](#kb-8-quadric-potential); [KB.8/orthogonal-decomposition](#kb-8-orthogonal-decomposition); `KloostermanMomentsAndPotentialAutomorphy:KM.0/raw-sum`; `mathlib:AddChar.sum_eq_ite`.

**Proof route.** 1. Stratify the quadric chart by its vanishing Plücker coordinates and evaluate free additive variables by orthogonality. 2. Compute the remaining boundary stratum in all dimensions directly, independently of the subsequent convolution formula. The printed boundary shortcut is insufficient (G9). 3. Treat SO₄ using the exceptional product and the scalar normalization.

**Checks.**

- At n=3 the two proposed constants coincide. Use n≥4 and the direct boundary count to distinguish them.
- At p=2 the corrected expression and invariant-line decomposition imply U_n−Q=R_{2n+1}, matching the exact small-field computations.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Proposition 5.3.5, (5.3.5.1)–(5.3.5.2), pp. 59–60 (corrected constant); extraction source issue PAPER-XU-ZHU-22/E4. Even orthogonal toric trace: Let Q=q^d and ψ_d=ψ∘Tr_{F_Q/F_p}.

**Coverage:** planned. Remaining contracts: G5: Published gauge versus column trace convention; G9: Original Landau–Ginzburg and boundary-count proofs; Fulfil the exact requested contracts: KloostermanMomentsAndPotentialAutomorphy:KM.4/rigid-realization.

## KB.9. Hypergeometric realizations and convolution

Use the generic hypergeometric coefficient supplier to normalize the (2n+1; quadratic) object. Identify odd orthogonal Bessel objects for odd p, prove their multiplicative convolution formula with the correct half twist in odd characteristic; the final layer completes the all-prime identities.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.8`; `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

<a id="kb-9-hypergeometric-normalization"></a>

### hypergeometric-normalization: Normalized Bessel hypergeometric object

**Target (construction).** Use the existing/proposed generic hypergeometric supplier with n>m≥0 and β_j∈(q−1)^{−1}Z with β_j nonintegral, ρ_j the associated nontrivial multiplicative characters. Its cyclic operator is δ^n−(−1)^{n+mp}π^{n−m}x∏_j(δ−β_j); its trace is (−1)^{n+m−1}H_ψ(n;ρ), where H sums ψ(Tr(Σx_i−Σy_j))∏ρ_j^{−1}(Norm y_j) over ∏x_i=a∏y_j. In the Bessel normalization set g_j=G(ψ^{−1},ρ_j^{−1}), α=(−1)^m∏g_j and multiply Frobenius by q^{−(n−1)/2}/α. At zero its eigenvalues are q^{−(n−1)/2+j}, 0≤j<n. At degree d its trace is ((q^{−(n−1)/2}/α)^d)(−1)^{n+m−1}H_{ψ,d}; use the fixed base-field Gauss sums to this power. This node owns the normalization/comparison, not generic hypergeometric sheaf theory.

**Inputs:** [KB.0/coefficients](#kb-0-coefficients); [KB.0/rank-one-dictionary](#kb-0-rank-one-dictionary); `FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value`; `FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-lifting`.

**Proof route.** 1. Import Miyatani’s arithmetic convolution realization, rank n, weight n+m−1 and scalar uniqueness with nontrivial denominator characters. 2. Import the Katz zero-fiber eigenvalues αq^j for j=0,…,n−1, rather than the printed fixed 2n endpoint. 3. Define only the geometric-constant normalization and derive its degree-d trace and zero-fiber spectrum.

**Uses.** KB.9 odd orthogonal comparison: The same zero Frobenius removes its scalar ambiguity. KB.11 slopes: The Gauss-sum and weight shifts determine normalized Newton slopes.

**API.**

- `Bessel.hypergeometric_normalization.zero_spectrum` (simp): The n eigenvalues are q^{−(n−1)/2},…,q^{(n−1)/2}; the middle one in odd rank is 1.
- `Bessel.hypergeometric_normalization.degree_one_trace` (projection): At a k-point the trace is H_ψ(n;ρ)/((−c_q)^{n−1}∏_j g_j).
- `Bessel.hypergeometric_normalization.empty_denominators` (compatibility): For m=0 the normalized object is the scalar Bessel F-isocrystal already supplied by KM, including its sign.
- `Bessel.hypergeometric_normalization.gauss_extension` (compatibility): Under degree-d constant extension, Hasse–Davenport gives g_{j,d}=(−1)^{d−1}g_j^d; the hypergeometric trace sign and the d-th power of the fixed normalizing scalar must be transported together.

**Unit tests.**

- **odd_rank_three.** (computation) For n=3,m=1 the zero spectrum is q^{−1},1,q, not a set containing 0.
- **rank_two_empty.** (compatibility) For n=2,m=0 the trace is −RawKl₂/c_q and the spectrum is c_q^{−1},c_q.
- **extension_field.** (compatibility) For d=2 the normalizing scalar is the square of the base scalar; substituting an extension-field Gauss sum without the Hasse–Davenport sign is rejected.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §§5.2.1–5.2.3, (5.2.1.1)–(5.2.3.1), pp. 56–57; Theorem 5.2.2. Normalized Bessel hypergeometric object: Use the existing/proposed generic hypergeometric supplier with n>m≥0 and β_j∈(q−1)^{−1}Z with β_j nonintegral, ρ_j the associated nontrivial multiplicative characters. [Miy](https://arxiv.org/pdf/1607.04852v2), Main theorem, pp. 2–3; Theorems 3.2.5, p. 23 and 4.1.3, pp. 27–28; Proposition 3.3.3, p. 26. Rational nonresonant parameters give overconvergent Frobenius objects, a multiplicative-convolution realization and companion trace functions. The Bessel scalar normalization is an additional step.

<a id="kb-9-odd-hypergeometric"></a>

### odd-hypergeometric: Odd orthogonal hypergeometric comparison

**Target (theorem).** For p>2 and n≥1, the standard SO_{2n+1} Bessel F-isocrystal is the pullback under x↦4x of the normalized hypergeometric object with numerator length 2n+1 and one quadratic denominator character ρ. Both sides have zero-fiber eigenvalues q^{−n},…,1,…,q^n. Match the scalar operator first, then use irreducibility and this full zero spectrum to identify Frobenius. The p=2 branch uses KB.10 and has no quadratic-character substitute.

**Inputs:** [KB.8/orthogonal-matrices](#kb-8-orthogonal-matrices); [KB.9/hypergeometric-normalization](#kb-9-hypergeometric-normalization); [KB.4/zero-frobenius](#kb-4-zero-frobenius).

**Proof route.** 1. Rescale the cyclic operator by x↦x/4 and compare it with the quadratic hypergeometric operator, allowing the integral exponent shift β↦β+1. 2. Use scalar uniqueness of Frobenius on the irreducible object. 3. Match the log Frobenius at zero to eliminate the scalar; the central eigenvalue is 1.

**Checks.**

- In rank 2n+1 the normalized zero spectrum contains 1 and has exactly 2n+1 eigenvalues.
- Match the pullback x↦4x and the integral exponent shift before removing the Frobenius scalar.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Proposition 5.3.8(i), (5.3.8.1), p. 61. Odd orthogonal hypergeometric comparison: For p>2 and n≥1, the standard SO_{2n+1} Bessel F-isocrystal is the pullback under x↦4x of the normalized hypergeometric object with numerator length 2n+1 and one quadratic denominator character ρ.

<a id="kb-9-convolution"></a>

### convolution: Normalized Bessel convolution

**Target (theorem).** For p>2 and n≥2 the identity of overconvergent F-isocrystals is Be_SO2n+1,Std†≅(Be_SO3,Std† ⋆ Be_{2n−2}†)(1/2), with ⋆=Rμ_! of the exterior product in the arithmetic D-module convention. On trace functions over F_Q this reads T_SO2n+1(a)=−Q^{−1/2}Σ_{uv=a}T_SO3(u)K_{2n−2}(v), where K_r is the normalized scalar trace. The sign is the cohomological convolution sign and the factor Q^{−1/2} is the half twist. The characteristic-two extension is a target of KB.11 after the standard-object comparison; it is not assumed in proving KB.10.

**Inputs:** [KB.9/hypergeometric-normalization](#kb-9-hypergeometric-normalization); [KB.9/odd-hypergeometric](#kb-9-odd-hypergeometric); [KB.8/classical-scalar](#kb-8-classical-scalar); `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

**Proof route.** 1. Use multiplicative convolution of the generic hypergeometric arithmetic D-modules with all shifts explicit. 2. Compare the quadratic hypergeometric objects in odd characteristic; the characteristic-two extension is not used here. 3. Compute the zero-fiber scalar or a nonzero finite-field trace to fix the additional half twist and sign; no rank-zero Bessel object is used at n=1.

**Checks.**

- The trace formula has both the cohomological minus sign and Q^{-1/2}.
- n=1 is handled by Sym²SL₂ and never invokes an undefined rank-zero Bessel factor.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §5.3.9 and Corollary 5.3.11(i), p. 61, corrected by PAPER-XU-ZHU-22/E3; Miyatani Main theorem(ii) and §3.3.3 as cited there. Normalized Bessel convolution: For p>2 and n≥2 the identity of overconvergent F-isocrystals is Be_SO2n+1,Std†≅(Be_SO3,Std† ⋆ Be_{2n−2}†)(1/2), with ⋆=Rμ_! of the exterior product in the arithmetic D-module convention. [Miy](https://arxiv.org/pdf/1607.04852v2), Main theorem(ii), p. 3; Proposition 3.3.3, p. 26. Multiplicative convolution and the support-to-ordinary isomorphism are separate arithmetic D-module inputs.

**Coverage:** planned. Remaining contracts: G11: Generic hypergeometric supplier and zero spectrum; Fulfil the exact requested contracts: PadicDifferentialEquationsAndRigidCohomology:RD.6.

## KB.10. The characteristic-two comparison

Specify Dwork congruence data, prove the signed 2-adic refinement, and compare the two explicit Bessel solution series. Identify maximal-slope quotients on a common constant-Newton locus with the full q=2^s iterated Frobenius multipliers and their shared q^n scale, then apply the imported curve minimal-slope theorem. Transport the appendix coordinate x↦−x by convergent Taylor isomorphisms.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.9`; `KloostermanSheavesAndBesselIsocrystals:KB.5`; `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

<a id="kb-10-dwork-data"></a>

### dwork-data: Dwork congruence data

**Target (definition).** Let R be a complete mixed-characteristic DVR and B^{(i)}:N→K×, i≥0. Require (a) B^{(i)}(0)∈R×; (b) B^{(i)}(a+pn)/B^{(i+1)}(n)∈R for 0≤a<p; (c) the difference of that quotient with n replaced by n+mp^s belongs to p^{s+1}R for every a,n,m,s. Writing R_i(a,n)=B^{(i)}(a+pn)/B^{(i+1)}(n), the signed p=2 version requires R_i(a,n+m2^s)−u(i,s,m)R_i(a,n)∈2^{s+1}R, with u∈{±1} independent of a,n and u=1 unless s=1. Define F^{(i)}=Σ_j B^{(i)}(j)x^j and F^{(i)}_{m,s}=Σ_{mp^s≤j<(m+1)p^s}B^{(i)}(j)x^j. The normalized periodic version adds B^{(i)}(0)=1 and B^{(i+r)}=B^{(i)} for a fixed r≥1.

**Inputs:** [KB.0/coefficients](#kb-0-coefficients); `PadicDifferentialEquationsAndRigidCohomology:RD.0`.

**Proof route.** 1. Use ordinary power-series and finite truncation carriers over R and K. 2. Record the nonzero denominator and uniform quantifiers for quotient congruences. 3. Separate the full modulus p^{s+1} from the signed 2-adic modulus and retain periodicity only for the convergence statement.

**Uses.** KB.10 signed refinement: These are the exact hypotheses of its block congruence. KB.10 Bessel series: The alternating two-periodic pair F,G uses the exceptional s=1 sign.

**API.**

- `Bessel.dwork_data.block` (projection): The block F_{m,s} starts at mp^s and ends before (m+1)p^s; F_s means F_{0,s}.
- `Bessel.dwork_data.integral_coefficients` (characterisation): Conditions (a),(b) force B^{(i)}(j)∈R for all i,j by induction on j.
- `Bessel.dwork_data.periodic_normalized` (structure): A normalized periodic datum has F^{(i)}(0)=1 and is unchanged after r shifts of i; this is extra structure, not a consequence of (a)–(c).
- `Bessel.dwork_data.shift` (structure): Deleting the first sequence yields the shifted datum B^{(i+1)} with inherited congruences and signs u(i+1,s,m); a normalized period-r datum retains its period. This is the shift used in every block identity.

**Unit tests.**

- **constant_sequence.** (degenerate) B^{(i)}(j)=1 for all i,j satisfies the ordinary conditions and has period 1.
- **block_endpoints.** (computation) For p=2,m=1,s=2 the block has exactly j=4,5,6,7; an inclusive upper endpoint gives the wrong polynomial.
- **signed_exception.** (non-example) For the rank-three sequence B(j)=(−2)^{3j}/(j!)³, B(4)/B(2)=1/27≡−1 mod4, whereas B(0)/B(0)=1: the ordinary s=1 congruence fails, and the signed one succeeds.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Appendix A.4–A.6, (A.5.1)–(A.5.4), pp. 64–65. Dwork congruence data: Let R be a complete mixed-characteristic DVR and B^{(i)}:N→K×, i≥0.

<a id="kb-10-signed-refinement"></a>

### signed-refinement: Signed 2-adic Dwork congruences

**Target (theorem).** For ordinary Dwork data, F^{(0)}(x)F^{(1)}_{m,s}(x^p)−F^{(0)}_{m,s+1}(x)F^{(1)}(x^p) lies in p^{s+1}B^{(s+1)}(m)R[[x]]. For signed 2-adic data the same difference lies in 2^sB^{(s+1)}(m)R[[x]]. Under normalization and period r, F^{(0)}_{s+1}(x)/F^{(1)}_s(x^p) converges on the formal open with all reductions F^{(i)}_1 nonzero, i<r, to a unit function. Every rigid point after finite coefficient extension has unit value.

**Inputs:** [KB.10/dwork-data](#kb-10-dwork-data); `PadicDifferentialEquationsAndRigidCohomology:RD.0`.

**Proof route.** 1. Use the antisymmetric block sums and the induction on block length in Dwork’s argument. 2. In the p=2 argument propagate the common signs u(i,s,m); use the corrected indices for the parity splitting, not the printed m2^{s−i} expression. 3. Use the resulting modulus 2^s to show the normalized ratios form a compatible Cauchy system on the specified formal open.

**Checks.**

- The signed bound is 2^s, while the ordinary bound is p^{s+1}; neither modulus is silently strengthened.
- The formal open tests all periods i<r and all rigid points after finite coefficient extension.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem A.5, pp. 64–65; proof A.13, pp. 67–69. Signed 2-adic Dwork congruences: For ordinary Dwork data, F^{(0)}(x)F^{(1)}_{m,s}(x^p)−F^{(0)}_{m,s+1}(x)F^{(1)}(x^p) lies in p^{s+1}B^{(s+1)}(m)R[[x]].

<a id="kb-10-dwork-line"></a>

### dwork-line: Dwork unit-root line

**Target (construction).** Work first over k=F_p with p-Frobenius fixing K. For a period-one normalized Dwork series F, let U be the formal open where its first p-truncation is nonzero modulo p. The functions f=F(x)/F(x^p) and η=F′(x)/F(x) extend to U, f is invertible and f′/f+px^{p−1}η(x^p)=η(x). Define E_F=(O,d−η dx) with F*→E_F multiplier f. It is a convergent unit-root F-isocrystal on U, with value f(0)=1 when 0∈U. This construction alone does not make E_F the maximal-slope F-quotient of an arbitrary Bessel object. After constant extension to F_q, q=p^s, for a series whose coefficients are fixed by the chosen p-Frobenius, set f_{F,q}(x)=∏_{i=0}^{s−1}f(x^{p^i})=F(x)/F(x^q). This is the q-Frobenius multiplier; it still has value 1 at zero and unit values on U.

**Inputs:** [KB.10/signed-refinement](#kb-10-signed-refinement); `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

**Proof route.** 1. Construct f and η from the congruent truncation ratios and logarithmic derivatives. 2. Differentiate the formal ratio on the unit disc and extend the identity by analytic continuation. 3. Use the displayed horizontal equation and the unit-valued Frobenius to construct the rank-one convergent object.

**Uses.** KB.10 quotient comparison: Identifies the underlying horizontal rank-one quotient. KB.10 series ratio: The ratio F/G provides a normalized horizontal isomorphism of these lines.

**API.**

- `Bessel.dwork_line.connection` (projection): The logarithmic derivative is η and the connection is d−η dx; F is its local horizontal solution.
- `Bessel.dwork_line.frobenius` (compatibility): The multiplier f satisfies the F*→object horizontal equation and has all Newton slopes zero.
- `Bessel.dwork_line.normalized_value` (simp): F(0)=1 implies f(0)=1; multiplying F by a nonzero constant leaves η and f unchanged in period 1.
- `Bessel.dwork_line.iterate_frobenius` (compatibility): For q=p^s and coefficients fixed by p-Frobenius, composition of the s pullback maps gives f_{F,q}(x)=∏_{i=0}^{s−1}f(x^{p^i})=F(x)/F(x^q), with f_{F,q}(0)=1. A single p-step multiplier is insufficient when s>1.

**Unit tests.**

- **geometric_series.** (computation) For B(j)=1, F=(1−x)^{−1}, U is x≠1, η=(1−x)^{−1} and f=(1−x^p)/(1−x).
- **orientation.** (non-example) The inverse multiplier would give the opposite derivative of log f and does not satisfy the same horizontal equation unless η is Frobenius-invariant in that way.
- **nonunit_excluded.** (non-example) On x=1 for the geometric series, the reduction of the first truncation vanishes; a global unit-root line on that larger formal open is not asserted.
- **degree_two_frobenius.** (compatibility) For the geometric series at p=2,q=4, f_{F,4}=(1+x)(1+x²)=(1−x⁴)/(1−x), whereas the single-step multiplier is only 1+x.

**Checks.**

- Check naturality of every API map at the actual uses listed below; all generic supplier contracts must be fulfilled.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), A.6–Corollary A.7, p. 65. Dwork unit-root line: Work first over k=F_p with p-Frobenius fixing K.

<a id="kb-10-series-ratio"></a>

### series-ratio: The two Bessel solution series

**Target (theorem).** For n≥1 at p=2 put r=2n+1, F(x)=Σ_{j≥0}(−2)^{rj}x^j/(j!)^r and G(x)=Σ_{j≥0}2^{rj}(2j−1)!!x^j/(j!)^r, with (−1)!!=1. F satisfies the signed conditions, G the ordinary conditions. Their two-periodic alternating datum also satisfies the signed conditions; the exceptional signs at s=1 are u(0,1,m)=1, u(1,1,m)=(−1)^m. Both first truncations reduce to 1, and h=F/G extends as an invertible function on the completed affine line, h(0)=1. Multiplication by h intertwines E_G and E_F, including their unit-root Frobenius. F is written in the appendix coordinate x↦−x relative to the preceding odd-rank Bessel operator.

**Inputs:** [KB.10/dwork-data](#kb-10-dwork-data); [KB.10/signed-refinement](#kb-10-signed-refinement); [KB.10/dwork-line](#kb-10-dwork-line); [KB.8/orthogonal-matrices](#kb-8-orthogonal-matrices).

**Proof route.** 1. Check factorial valuations and unit parts in each quotient congruence, keeping the single exceptional s=1 sign. 2. Apply the alternating period-two congruence theorem to extend F(x)/G(x²), and divide by the period-one unit for G to extend F/G as a unit. 3. Use h′/h=η_F−η_G and h(x)f_G(x)=f_F(x)h(x²) to verify horizontal and Frobenius compatibility. 4. Iterate the squaring identity s times for q=2^s to obtain h(x)f_{G,q}(x)=f_{F,q}(x)h(x^q); both series have rational coefficients, fixed by the coefficient Frobenius.

**Checks.**

- At p=2 both first truncations are 1 modulo 2, so the formal domain is the completed affine line.
- Check both h′/h=η_F−η_G and h f_G=f_F h(x²); a horizontal map alone is insufficient.
- For a constant extension of degree s use the s-fold products f_{F,q} and f_{G,q}, rather than relabeling the squaring multiplier as q-Frobenius.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Lemma A.12, pp. 66–67; Proposition A.1, p. 63; compare §5.3.8, p. 61. The two Bessel solution series: For n≥1 at p=2 put r=2n+1, F(x)=Σ_{j≥0}(−2)^{rj}x^j/(j!)^r and G(x)=Σ_{j≥0}2^{rj}(2j−1)!!x^j/(j!)^r, with (−1)!!=1.

<a id="kb-10-maximal-quotient-bridge"></a>

### maximal-quotient-bridge: Frobenius on the maximal-slope quotient

**Target (theorem).** On a common connected constant-Newton locus for the two normalized rank-(2n+1) Bessel objects, adjoining the log point zero with its ordinary polygon, their maximal-slope quotients are rank one of slope n. For the column cyclic module with ∇δe_i=e_{i+1}, Ore division by δ−xF′/F gives the quotient connection d+η_F dx, hence E_F dual, and likewise for G. Its quotient Frobenius is q^n/f_{F,q}, respectively q^n/f_{G,q}, where q=2^s and f_{F,q}=∏_{i=0}^{s−1}f_F(x^{2^i})=F(x)/F(x^q) (and likewise for G), fixed by the common zero-fiber eigenvalue q^n. Thus multiplication by h^{-1}, h=F/G, is a Frobenius-compatible map from the G quotient to the F quotient. The dual sign is part of the cyclic-module dictionary; one cannot use the solution-line connection d−η as the same quotient in this convention. All these identifications must be proved on that common locus; A.9 only supplies an underlying log-isocrystal comparison.

**Inputs:** [KB.10/series-ratio](#kb-10-series-ratio); [KB.5/generic-ordinarity](#kb-5-generic-ordinarity); [KB.4/zero-frobenius](#kb-4-zero-frobenius); `PadicDifferentialEquationsAndRigidCohomology:RD.3`; `PadicDifferentialEquationsAndRigidCohomology:RD.2`.

**Proof route.** 1. Use generic ordinarity independently of A.1 to choose a common ordinary locus whose log extension contains zero. 2. Factor the Ore operators and prove the horizontal quotient identifies the maximal-slope quotient; use the global slope filtration supplier, not only local Robba slope theory. 3. Dualize the solution line as dictated by the cyclic basis; check c′+η(x)c=q x^{q−1}cη(x^q) for c=q^n/f_{F,q}. The Frobenius ratio to this multiplier is horizontal and hence constant on the connected locus. Evaluate at zero to obtain q^n, using f_{F,q}(0)=1. The global slope/continuation hypotheses and full proof are G10.

**Checks.**

- In the column cyclic basis, the relation e₂=xηe₁ makes the quotient connection d+η dx; it is the dual of the d−η solution line.
- The quotient multiplier q^n/f_{F,q} has slope n, is horizontal for d+η dx and has value q^n at zero. Using f_F itself would give the wrong slope and horizontal equation.
- Multiplication by h^{-1} intertwines the two quotient multipliers because h f_{G,q}=f_{F,q} h(x^q); prove the ratio is constant on the common connected log locus before evaluating it at zero.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), A.8–Proposition A.9 and A.11, pp. 65–66, with the missing Frobenius step made explicit. Frobenius on the maximal-slope quotient: On a common connected constant-Newton locus for the two normalized rank-(2n+1) Bessel objects, adjoining the log point zero with its ordinary polygon, their maximal-slope quotients are rank one of slope n.

<a id="kb-10-characteristic-two-comparison"></a>

### characteristic-two-comparison: The characteristic-two Bessel comparison

**Target (theorem).** For p=2 and n≥1, Be_SO2n+1,Std†≅Be_{2n+1}† as normalized overconvergent F-isocrystals on G_m, compatibly with all finite constant-field extensions. Compare irreducible objects on the common constant-Newton open via their maximal-slope quotients and the curve minimal-slope theorem; then extend by full faithfulness. The appendix sign of the scalar operator is transported by the convergent Taylor isomorphism for the two lifts x and −x of the same characteristic-two map, with the Frobenius transported at the same time.

**Inputs:** [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge); [KB.8/classical-scalar](#kb-8-classical-scalar); `PadicDifferentialEquationsAndRigidCohomology:RD.3`; [KB.6/global-monodromy](#kb-6-global-monodromy); `PadicDifferentialEquationsAndRigidCohomology:RD.3/taylor-comparison-of-pullbacks`.

**Proof route.** 1. Use geometric irreducibility of the scalar and odd orthogonal standard objects, already available outside even A. 2. Apply the dual curve minimal-slope theorem to the Frobenius-compatible maximal quotients on the common smooth connected open. 3. Extend uniquely to the whole curve by overconvergent full faithfulness and explicitly transport the coordinate-lift Taylor isomorphism; gap G10 names the pending minimal-slope owner.

**Checks.**

- Apply the minimal-slope theorem only after an isomorphism of Frobenius-compatible maximal quotients on a common constant-Newton open.
- Transport x and −x as Frobenius lifts by the convergent Taylor isomorphism before extending to G_m and constant extensions.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Proposition A.1 and Theorem A.3, pp. 63–64; proof A.11–A.12, pp. 66–67; Proposition 5.3.8(ii), p. 61. The characteristic-two Bessel comparison: For p=2 and n≥1, Be_SO2n+1,Std†≅Be_{2n+1}† as normalized overconvergent F-isocrystals on G_m, compatibly with all finite constant-field extensions.

**Coverage:** planned. Remaining contracts: G5: Published gauge versus column trace convention; G8: Automorphic Newton bound and log specialization; G10: Global slope filtration and normalized maximal quotient; Fulfil the exact requested contracts: PadicDifferentialEquationsAndRigidCohomology:RD.0, PadicDifferentialEquationsAndRigidCohomology:RD.2, PadicDifferentialEquationsAndRigidCohomology:RD.3.

## KB.11. Everywhere ordinarity and the exceptional branch

Compute the toric hypergeometric slopes by nondegeneracy and boundary decomposition. Deduce everywhere ordinarity for all classical groups and G₂, all ranks and all primes, using the characteristic-two comparison. Complete the even-A characteristic-two monodromy table by central pushout.

**Layer inputs:** `KloostermanSheavesAndBesselIsocrystals:KB.10`; `KloostermanSheavesAndBesselIsocrystals:KB.6`; `KloostermanSheavesAndBesselIsocrystals:KB.5`.

<a id="kb-11-sum-identities"></a>

### sum-identities: Kloosterman and orthogonal identities

**Target (theorem).** Write R_r(a) for the raw rank-r scalar sum over F_Q and g=G(ψ_Q^{−1},ρ^{−1}) when p>2. The rank-three identity is R₂(a)²−Q=R₃(a) at p=2 and R₂(a)²−Q=H_ψ(3;ρ)(4a)/g at odd p. More generally, for n≥2, let U_n(a)=Σ_{x₁,…,x_{2n}≠0}ψ_Q(Σ_i x_i+a(x₁+x₂)/∏x_i). Then U_n(a)−Q=R_{2n+1}(a) at p=2 and U_n(a)−Q=H_ψ(2n+1;ρ)(4a)/g at odd p. The normalized identities are obtained by division by Q^n. In odd characteristic g here is the Gauss sum for the field F_Q; extension from a fixed base field must use Hasse–Davenport consistently.

**Additional hypotheses.** For the p=2 branch of the stated identity, invoke KB.10/characteristic-two-comparison; no numerical identity is used as a substitute for that proof.

**Inputs:** [KB.8/even-toric-trace](#kb-8-even-toric-trace); [KB.8/orthogonal-decomposition](#kb-8-orthogonal-decomposition); [KB.9/odd-hypergeometric](#kb-9-odd-hypergeometric); [KB.9/convolution](#kb-9-convolution); [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison); `KloostermanMomentsAndPotentialAutomorphy:KM.0/raw-sum`.

**Proof route.** 1. Use SO₃=Sym²SL₂ to obtain the rank-three trace identity. 2. For higher n use the invariant-line decomposition and the corrected even-orthogonal trace constant; write raw and normalized equations separately. 3. The p=2 branch follows upon inserting KB.10’s comparison; record this dependency for that branch rather than using the identities in its proof.

**Checks.**

- Over F₂, a=1: R₂=1, R₃=−1 and R₂²−2=−1, without a factor of 2.
- For n=2 over F₂, U₂=1 and R₅=−1, so U₂−2=R₅.
- Over F₃, a=1: R₂=−1 and R₂²−3=−2. The quadratic hypergeometric side, with its own Gauss sum, must be −2.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), §1.2.9, pp. 6–7 and Corollary 5.3.11, p. 61 (PAPER-XU-ZHU-22/E1–E4 corrections). Kloosterman and orthogonal identities: Write R_r(a) for the raw rank-r scalar sum over F_Q and g=G(ψ_Q^{−1},ρ^{−1}) when p>2.

<a id="kb-11-toric-slopes"></a>

### toric-slopes: Toric hypergeometric slopes

**Target (theorem).** For odd p, n≥1, d|p−1 and a≠0, let f_d=Σ_{i=1}^{2n}x_i−z^d+a z^d/(∏_{i=1}^{2n}x_i) on G_m^{2n+1}. It is nondegenerate; its Newton polytope has dimension 2n+1 and volume d/(2n)!, and its L-polynomial has degree d(2n+1). Its Hodge and Newton slopes are j/d for 0≤j<d(2n+1), each once. For d=1,2 the exact identity S_m(f₂)−S_m(f₁)=H_{ψ,m}(2n+1;ρ)(a) equals minus the trace of the unnormalized hypergeometric object. Dividing L-polynomials therefore leaves the unnormalized hypergeometric slopes 1/2,3/2,…,2n+1/2 at every a.

**Inputs:** [KB.9/hypergeometric-normalization](#kb-9-hypergeometric-normalization); `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

**Proof route.** 1. Check every face not containing the origin for nondegeneracy and compute its diagonal lattice quotient of order d. 2. Use the generic Adolphson–Sperber degree/Hodge bound and Wan boundary decomposition: d|p−1 makes each diagonal face ordinary. 3. For d=2 separate the square/nonsquare character contributions. Track the minus trace sign so that L(f₂)/L(f₁) is the hypergeometric determinant, then remove the integer slopes.

**Checks.**

- For d=1 the slopes are 0,1,…,2n; for d=2 they are 0,1/2,…,2n+1/2.
- S_m(f₂)−S_m(f₁) is the raw hypergeometric sum, hence minus its unnormalized Frobenius trace; track this sign in the quotient determinant.
- The unnormalized trace of the (2n+1; one quadratic) object is minus the raw hypergeometric sum. This sign has valuation zero and leaves the Newton polygon unchanged.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Lemma 5.4.3, (5.4.3.1)–(5.4.3.2), pp. 62–63. Toric hypergeometric slopes: For odd p, n≥1, d|p−1 and a≠0, let f_d=Σ_{i=1}^{2n}x_i−z^d+a z^d/(∏_{i=1}^{2n}x_i) on G_m^{2n+1}.

<a id="kb-11-everywhere-ordinary"></a>

### everywhere-ordinary: Everywhere classical ordinarity

**Target (theorem).** For split H of type A_n,B_n,C_n,D_n or G₂, every closed point of A¹, using the nilpotent log fiber at zero, has ν_a=ρ. For scalar rank r the normalized slopes are −(r−1)/2,−(r−3)/2,…,(r−1)/2 for all primes and all r≥2; no coprimality hypothesis (r,p)=1 is imposed. For odd orthogonal standard rank 2n+1 they are −n,−n+1,…,n. The all-rank scalar assertion is imported as the full Sperber–Wan contract, not inferred from an earlier restricted Dwork theorem.

**Inputs:** [KB.11/toric-slopes](#kb-11-toric-slopes); [KB.9/odd-hypergeometric](#kb-9-odd-hypergeometric); [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison); [KB.8/classical-scalar](#kb-8-classical-scalar); [KB.7/integral-functoriality](#kb-7-integral-functoriality); [KB.4/zero-frobenius](#kb-4-zero-frobenius); `KloostermanMomentsAndPotentialAutomorphy:KM.1/monodromy`.

**Proof route.** 1. Apply the scalar all-prime/all-rank ordinarity theorem to types A and C. 2. For B and D use the odd hypergeometric slopes at odd p, subtracting the Gauss-sum and q^n normalization; use the characteristic-two comparison at p=2. 3. Use the faithful standard representation and the G₂⊂SO₇ inclusion to recover the group-valued Newton class, then central pushout.

**Checks.**

- Include scalar rank r divisible by p, for example rank 2 at p=2.
- The odd standard slopes are −n,…,n and its invariant-line extension adds one slope zero; they detect the group-valued Newton point.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 5.4.2(ii), p. 62; Lemma 5.4.3, pp. 62–63. Everywhere classical ordinarity: For split H of type A_n,B_n,C_n,D_n or G₂, every closed point of A¹, using the nilpotent log fiber at zero, has ν_a=ρ.

<a id="kb-11-even-a-char-two-monodromy"></a>

### even-a-char-two-monodromy: Even-A monodromy at p=2

**Target (theorem).** For H=SL_{2n+1}, n≥1 and p=2, the group-valued normalized Bessel F-isocrystal is the pushout of the SO_{2n+1} object. Its geometric and arithmetic monodromy is SO_{2n+1} when n≠3 and G₂ when n=3, embedded in SL_{2n+1} through the standard representation. For another central form of type A_{2n}, the monodromy is the image under that central quotient. This includes A₂ at p=2 and is different from the characteristic-zero SL_{2n+1} differential Galois group.

**Inputs:** [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.7/symmetry-central](#kb-7-symmetry-central).

**Proof route.** 1. Use the normalized standard-object comparison to identify its determinant-one tensor representation. 2. Recover the group-valued pushout through the faithful standard representation and its preserved quadratic tensor. 3. Import the non-even-A SO monodromy classification, then pass through the actual central kernel to every other form.

**Checks.**

- Include SL₃ and its central quotients at p=2; their group is the image of SO₃.
- At rank seven use G₂ inside SO₇ inside SL₇; do not replace the ambient adjoint representation by the standard comparison.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Theorem 4.5.2(ii),(iii), pp. 51–53; Corollary 5.3.10, p. 61. Even-A monodromy at p=2: For H=SL_{2n+1}, n≥1 and p=2, the group-valued normalized Bessel F-isocrystal is the pushout of the SO_{2n+1} object.

<a id="kb-11-all-prime-corollaries"></a>

### all-prime-corollaries: All-prime companion and local corollaries

**Target (theorem).** After the even-A characteristic-two calculation, the companion monodromy classification, central Frobenius torsor statement, adjoint rigidity and minimal-Swan local theorem hold in that branch as well. In particular H^i(P¹,j_!+Be_H†,Ad)=0 and Irr_∞=rank H for every almost-simple H at every p; if p∤|W_H|, the sole nonzero adjoint upper break is 1/h. At p=2 in SO₃, the local finite inertia image is A₄, consistent with Sym² of the rank-two Bessel object. The all-characteristic normalized convolution formula for n≥2 and the raw identities use the same half twist as the odd-p theorem.

**Inputs:** [KB.11/even-a-char-two-monodromy](#kb-11-even-a-char-two-monodromy); [KB.7/etale-monodromy](#kb-7-etale-monodromy); [KB.6/rigidity-local](#kb-6-rigidity-local); [KB.9/convolution](#kb-9-convolution); [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison).

**Proof route.** 1. Repeat the adjoint localization/irregularity computation with the now known characteristic-two geometric group; do not identify the different adjoint representations by the standard-object comparison. 2. Apply the compatible-system embedding comparison, retaining its supplier gap. 3. Use the characteristic-two scalar realization to transport the convolution normalization; for n=1 use Sym² directly.

**Checks.**

- Repeat the adjoint rigidity argument in the even-A,p=2 ambient group; equality of standard objects does not identify two different adjoint functors.
- For SO₃ at p=2, the finite inertia image A₄ is compatible with Sym² of the rank-two object.

**Sources.** [XZ](https://arxiv.org/pdf/1910.13391v2), Corollaries 4.5.6–4.5.7 and Remark 4.5.8(iv), pp. 53–54; §§5.3.9–5.3.11, p. 61. All-prime companion and local corollaries: After the even-A characteristic-two calculation, the companion monodromy classification, central Frobenius torsor statement, adjoint rigidity and minimal-Swan local theorem hold in that branch as well.

**Coverage:** planned. Remaining contracts: G7: Generic monodromy and Lie-theoretic proof inputs; G9: Original Landau–Ginzburg and boundary-count proofs; G11: Generic hypergeometric supplier and zero spectrum; G12: All-rank scalar and toric ordinarity proof leaves; Fulfil the exact requested contracts: PadicDifferentialEquationsAndRigidCohomology:RD.6, KloostermanMomentsAndPotentialAutomorphy:KM.1/monodromy.

## Worked normalization checks

Over F₂, the unique nonzero a is 1 and ψ(1)=−1. The raw values are R₂(1)=1 and R₃(1)=−1, so the raw Carlitz identity reads 1−2=−1. The normalized rank-two trace is −1/√2 and the normalized rank-three trace is −1/2. Thus T₂²−1=T₃, whereas adding another factor of 2 to the raw identity fails. For U₂, all four coordinates are 1, the character argument is zero, and U₂(1)−2=1−2=R₅(1).

Over F₃ at a=1, the two raw rank-two summands are ψ(2) and ψ(1), so R₂(1)=−1. The normalized trace is 1/√3, explaining why the uniform coefficient field must contain √3. Its raw square minus 3 is −2. The odd-characteristic identity has the same value only after dividing the quadratic hypergeometric sum at 4a by its quadratic Gauss sum. Over extension fields the Gauss sum obeys Hasse–Davenport, so it cannot be substituted for a power of the base Gauss sum without the sign correction.

The even toric constant is discriminated first at n≥4, since the two candidates coincide at n=3. Over F₂ for SO₈ (n=4), its six-variable toric sum is 1. The corrected constant 2³−2=6 gives normalized trace 7/8, which is 1 plus the SO₇ trace −1/8. The old constant (2−1)2²=4 instead gives 5/8 and fails the invariant-line identity.

For the residue convention take N=E₁₂ and C₀=diag(t^{-1},t) with t²=q. Then N C₀ has upper-right entry t and q C₀ N has upper-right entry q/t=t. The inverse matrix satisfies the opposite conjugation equation. The two diagonal spectra are Weyl conjugate; their equality as classes does not by itself prove equality of global traces in an arbitrary representation.

For the cyclic quotient, ∇δe₁=e₂ and e₂=xηe₁ give ∇e₁=ηe₁dx. Its connection is d+ηdx, while the horizontal solution F belongs to d−ηdx. If f=F(x)/F(x^q), the quotient multiplier c=q^n/f satisfies c′+η(x)c=q x^{q−1}cη(x^q), the horizontal equation in dx coordinates. The constant q^n is detected at zero. For two series h=F/G, the equation h f_G=f_F h(x^q) makes h^{-1} the quotient isomorphism. These calculations are Checks on G10, not a replacement for its global slope-filtration proof.

For rank three in the signed appendix sequence, B(j)=(−2)^{3j}/(j!)³ gives B(4)/B(2)=1/27≡−1 modulo 4, whereas B(0)/B(0)=1. The ordinary congruence fails at the exceptional s=1 step. Allowing the common sign there gives the intended signed refinement. The first truncations of both Bessel solution series still reduce to 1.

Exact character calculations on scratch data checked 50 finite-field equalities: the characteristic-two raw identities over F₂, F₄ and F₈, and the odd-characteristic rank-three/higher hypergeometric identities over F₃, F₅ and F₇. They used exact coefficient vectors modulo the prime cyclotomic relation, not floating-point agreement. The matrix invariant-line and 1/27 tests were also checked. These finite examples discriminate the normalizations; they do not establish their all-rank or analytic proof leaves.

## Open contracts and required follow-up

### G1. Relative integral Hecke geometry

GS.0 and GS.1 supply the finite-field curve stack and Beilinson–Drinfeld geometry. They do not yet supply the specified G(0,2), bounded Grassmannian kernels and support/cosupport comparison over a common mixed-characteristic DVR R, its characteristic-zero fraction field, and k, with compatible root-depth levels and all finite residue-field base changes. Construct the integral model once as an extension of that geometry; it is not the mixed-characteristic Witt Grassmannian of GeometricSatakeAndFusion. Establish the affine chart and quasi-minuscule vertex resolution over this model.

**Owner/direction:** GlobalShtukasAndFunctionFieldLanglands, Part II (relative integral geometry).

**Consumers:** [KB.0/level-model](#kb-0-level-model); [KB.1/hecke-action](#kb-1-hecke-action); [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison).

### G2. Coefficient operations and smooth Satake eigenvalues

The extraction proposes PadicDifferentialEquationsPartIIArithmeticDModules, but no submitted roadmap/stage with that id exists in this clone. Its needed contract is six operations and duality on realizable stacks, normalized holonomic hearts, affine right/left exactness, ULA external-product vanishing cycles with a possibly nonsmooth automorphic factor, Abe’s smoothness criterion, arithmetic trace/ℓ-independence and Abe–Caro weights. Algebraic holonomic D-modules and de Rham Satake over K are a separate coefficient realization. Finite-field ℓ-adic Satake and local Robba theory do not supply either one. Correct dual weight bounds to −w, distinguish all-morphism f_! base change from proper f_+ base change and keep full coefficient-field invariance.

**Owner/direction:** Routed arithmetic D-module Part II plus the algebraic D-module owner; pending exact ids.

**Consumers:** [KB.1/clean-datum](#kb-1-clean-datum); [KB.1/hecke-action](#kb-1-hecke-action); [KB.1/eigenobject](#kb-1-eigenobject); [KB.1/character-variant](#kb-1-character-variant); [KB.1/trace-companions](#kb-1-trace-companions); [KB.3/tensor-comparison](#kb-3-tensor-comparison); [KB.4/bessel-isocrystal](#kb-4-bessel-isocrystal).

### G3. Oper localization and reductive central descent

Zhu’s Theorem 8, Corollary 9 and Lemmas 18–21 use the critical-level center, vacuum supports, enhanced moment-map flatness and localization compatible with Hecke kernels; they are not consequences of an abstract Satake tensor functor. The generic oper and localization library has no verified supplier node here. In addition, the extension from an adjoint simple group needs finite central-local-system descent for semisimple groups, and a distinct central-torus treatment before descent to a reductive group. It is false to assume every reductive-to-adjoint kernel finite. The roadmap owns the Bessel slice and its comparison only.

**Owner/direction:** Generic algebraic geometric Langlands/opers extension; source Zhu §2.2 and §5.

**Consumers:** [KB.2/oper-slice](#kb-2-oper-slice); [KB.2/quantized-hitchin](#kb-2-quantized-hitchin); [KB.2/zhu-identification](#kb-2-zhu-identification).

### G4. Quasi-minuscule middle-image and tensor comparison

XZ Lemma 4.2.6(i) uses affineness of the punctured quasi-minuscule Hecke map τ, which fails in codimension at least two. Supply a perverse-truncation/intermediate-extension calculation giving the required degree-zero compact-to-ordinary image instead of concentration of τ_+ itself. Construct the relative horizontal map, prove convergence and overconvergence, and prove compatibility with every tensor-generator intertwiner. Test all rigid closed fibers after finite residue extensions and use faithful flatness of dagger completion. These precise repairs, beyond the source’s fiberwise argument, have not been established in this design pass.

**Owner/direction:** This roadmap, KB.3, with the relative arithmetic D-module supplier.

**Consumers:** [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison); [KB.3/tensor-comparison](#kb-3-tensor-comparison).

### G5. Published gauge versus column trace convention

The packet fixes ∇=d+A dx/x and C:F*→object. Then δC+A C=q C A(x^q), and its actual inverse satisfies δΦ+q A(x^q)Φ=Φ A(x). XZ instead displays δS+S A(x)=q A(x^q)S, so inversion alone does not give its equation. The transpose C^t satisfies that source-shaped equation with A replaced by A^t; an actual representation/root-basis equivalence must be specified. The column trace theorem is stated using C, and the residue relation is N C₀=q C₀ N. Supply the full covariant/contravariant coefficient and duality dictionary before identifying the source’s trace of S with that column trace. The fact that ρ and −ρ are Weyl conjugate only repairs the semisimple zero class, not the full trace formula in every representation. The column cyclic quotient is also dual to the solution line, as specified in KB.10.

**Owner/direction:** This roadmap’s normalization dictionary, KB.0/KB.4/KB.10.

**Consumers:** [KB.4/frobenius-matrix](#kb-4-frobenius-matrix); [KB.4/zero-frobenius](#kb-4-zero-frobenius); [KB.8/classical-scalar](#kb-8-classical-scalar); [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge).

### G6. Slope comparison and exact-radius inputs

Read and locate the precise Baldassarri comparison bounding each p-adic generic/formal slope of an algebraic representation by its characteristic-zero formal slope, with conventions sufficient to give Irr_∞(Ad)≤rank H. The functoriality argument additionally needs an exact-radius-1 nonzero horizontal solution for the appropriate nontrivial adjoint constituent and its behavior under rescaling, not just a radius lower bound. RD.1 is the right direction but its current targets do not assert this contract. Do not silently use these as routine analytic manipulations.

**Owner/direction:** PadicDifferentialEquationsAndRigidCohomology, Part II (slope and radius comparison).

**Consumers:** [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.7/integral-functoriality](#kb-7-integral-functoriality).

### G7. Generic monodromy and Lie-theoretic proof inputs

Consume neutral Tannakian reconstruction and subquotient-generated categories, not a new generic monodromy definition. The compatible-system step needs a common algebraic coefficient field, equality of neutral groups and components, and then a separate tensor-invariant comparison of their embeddings in H; a surjection between two abstract subgroups of H is insufficient. D’Addezio’s full theorem and hypotheses have not been verified here. Also locate the exact principal-SL₂ subgroup classification, Sym^{2e_i} exponent decomposition, centralizers, rational representation-ring restriction and class-preserving automorphism theorem used in the proof. Gross–Reeder’s Proposition 5.6 has been read; its application requires the full discrete Weil datum, including Frobenius, and p∤|W| for the 1/h-break conclusion. LocalGaloisGroups plans local ramification foundations, not this whole classification.

**Owner/direction:** Existing Tannakian/ReductiveGroups inputs plus generic coefficient-monodromy Part II.

**Consumers:** [KB.6/generated-groups](#kb-6-generated-groups); [KB.6/wild-nontrivial](#kb-6-wild-nontrivial); [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.6/rigidity-local](#kb-6-rigidity-local); [KB.7/central-torsor](#kb-7-central-torsor); [KB.7/etale-functoriality](#kb-7-etale-functoriality); [KB.7/etale-monodromy](#kb-7-etale-monodromy); [KB.11/all-prime-corollaries](#kb-11-all-prime-corollaries).

### G8. Automorphic Newton bound and log specialization

Verify the unique cuspidal function for the root-depth automorphic datum, the exact group-valued V. Lafforgue/Drinfeld–Kedlaya Newton bound ν≤ρ for its normalized Hecke eigenvalues, and the generic/log Newton semicontinuity comparison through the nilpotent log point zero. Purity zero alone implies neither the bound nor generic ordinarity. The generic ordinary open must be obtained independently of the characteristic-two appendix to avoid circularity. RD.3 supplies coefficient carriers but not yet this global slope theorem.

**Owner/direction:** GlobalShtukasAndFunctionFieldLanglands and the global isocrystal slope Part II.

**Consumers:** [KB.5/cuspidal-newton-bound](#kb-5-cuspidal-newton-bound); [KB.5/generic-ordinarity](#kb-5-generic-ordinarity); [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge).

### G9. Original Landau–Ginzburg and boundary-count proofs

XZ cites Lam–Templier’s geometric identification of the standard even-orthogonal Hecke chart with the quadric potential; the original theorem has not been read here. The displayed chart is used only for n≥3; n=2 is supplied by SO₄=(SL₂×SL₂)/μ₂. Give a direct all-n boundary-stratum count yielding Q^{n−1}−Q in the toric formula. The old printed constant (Q−1)Q^{n−2} fails finite-field checks and is incompatible with the invariant-line identity. Do not prove that correction by an identity whose proof already uses it.

**Owner/direction:** This roadmap, KB.8, using the original Lam–Templier chart theorem.

**Consumers:** [KB.8/quadric-potential](#kb-8-quadric-potential); [KB.8/even-toric-trace](#kb-8-even-toric-trace); [KB.11/sum-identities](#kb-11-sum-identities).

### G10. Global slope filtration and normalized maximal quotient

The routed PadicDifferentialEquationsPartIIMinimalSlope proposal has no actual supplier stage in this clone. Require the convergent and nilpotent-log constant-Newton slope filtration, generic constancy, the curve dual minimal-slope theorem for irreducible overconvergent F-isocrystals, and full-faithful extension. For the appendix, prove the Ore quotient is the maximal-slope line on a common connected ordinary/log locus containing zero. In this packet’s column cyclic convention it is E_F dual with Frobenius q^n/f_{F,q} (and E_G dual with q^n/f_{G,q}), using the full q=2^s iterate f_{F,q}=∏_{i=0}^{s−1}f_F(x^{2^i}), not the unit-root object with multiplier f_F. Show the Frobenius ratio constant and evaluate at zero, then use h^{-1}. Use the existing RD.3/taylor-comparison-of-pullbacks for x and −x, checking the induced Frobenius square, and constant-field descent from F₂ to F_q. This is a precise unresolved proof repair, not an assertion that A.9 proved Frobenius compatibility.

**Owner/direction:** Proposed global minimal-slope Part II plus the Bessel-specific KB.10 bridge.

**Consumers:** [KB.10/dwork-line](#kb-10-dwork-line); [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge); [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison).

### G11. Generic hypergeometric supplier and zero spectrum

Miyatani’s Main theorem and Proposition 3.3.3 have been read and are separate inputs to the comparison and convolution. Generic ℓ-adic/arithmetic hypergeometric sheaves are also routed by the Boxer–Calegari–Gee et al. extraction to PotentialAutomorphyDworkMotives (proposed), so this roadmap owns only the normalized Bessel specialization. Establish one generic owner, including Katz’s exact zero spectrum αq^j, scalar uniqueness, rational nonresonant parameters and the convolution shifts. Katz ESDE is not cleared in the private library and was not read from another copy. The all-prime convolution extension needs a normalization-preserving transport through KB.10; ordinary scalar isocrystal existence alone is insufficient.

**Owner/direction:** Shared generic hypergeometric owner; reconcile the existing paper routes before assigning ids.

**Consumers:** [KB.9/hypergeometric-normalization](#kb-9-hypergeometric-normalization); [KB.9/odd-hypergeometric](#kb-9-odd-hypergeometric); [KB.9/convolution](#kb-9-convolution); [KB.11/all-prime-corollaries](#kb-11-all-prime-corollaries).

### G12. All-rank scalar and toric ordinarity proof leaves

KM owns the scalar objects for all ranks. Its current nodes do not yet supply the full every-rank/every-prime Sperber–Wan ordinarity contract needed when p divides the scalar rank. Locate and prove that precise supplier statement without imposing (r,p)=1. The toric hypergeometric calculation further needs the original Adolphson–Sperber degree/Hodge theorem and Wan face/boundary ordinarity criterion for f_d under d|p−1. Verify their hypotheses and the quotient L-polynomial sign; XZ’s proof sketch is the present source, not a verified proof of those generic results.

**Owner/direction:** KloostermanMomentsAndPotentialAutomorphy, Part II for scalar ordinarity; RD.6, Part II for toric slopes.

**Consumers:** [KB.11/toric-slopes](#kb-11-toric-slopes); [KB.11/everywhere-ordinary](#kb-11-everywhere-ordinary).

### Supplier requests

1. **tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.** Use finite-dimensional algebraic representations/comodules, tensor products, duals, faithful representations and all intertwiners on the actual group carrier. Root-data tensor generation needs a finite central-character generating set as well as minuscule/quasi-minuscule generators; neutral Tannakian reconstruction beyond Rep(H) is imported from MC.6, not presumed from representation reconstruction. Consumers: [KB.2/fg-connection](#kb-2-fg-connection); [KB.3/tensor-comparison](#kb-3-tensor-comparison); [KB.6/generated-groups](#kb-6-generated-groups); [KB.7/etale-functoriality](#kb-7-etale-functoriality).

2. **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.** Use Chevalley invariant restriction and pinned automorphisms. An additional Part II contract is the exact principal-SL₂/Kostant exponent decomposition, classification of semisimple subgroups containing it, centralizer calculation, rational representation-ring restriction (including Spin₇/G₂) and class-preserving automorphism theorem used by the Frenkel–Gross/Xu–Zhu arguments. See G7; the current library is not claimed to implement these. Consumers: [KB.2/invariant-parameter](#kb-2-invariant-parameter); [KB.2/differential-monodromy](#kb-2-differential-monodromy); [KB.4/zero-frobenius](#kb-4-zero-frobenius); [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.7/etale-functoriality](#kb-7-etale-functoriality).

3. **tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.** Use split pinned Chevalley–Demazure group schemes over Z, root subgroups, their numbered coordinates and compatible central isogenies. Form the affine root-depth I₂ kernel with T(1), not the bad-prime commutator surrogate. The explicit orthogonal and spin group carriers already belong to current OrthogonalSpinGroups and are not redefined here. Consumers: [KB.0/affine-depth](#kb-0-affine-depth); [KB.2/fg-connection](#kb-2-fg-connection).

4. **PadicDifferentialEquationsAndRigidCohomology:RD.0.** Use dagger and completed affinoid rings and analytic continuation on connected curve domains for the stated scalar functions. The periodic Dwork convergence is a Bessel-specific arithmetic result here; no generic analytic carrier is duplicated. Consumers: [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison); [KB.10/dwork-data](#kb-10-dwork-data); [KB.10/signed-refinement](#kb-10-signed-refinement).

5. **PadicDifferentialEquationsAndRigidCohomology:RD.1.** Use the existing radii/slope machinery; extend as Part II by the algebraic-to-p-adic formal-slope bound and exact-radius-1/rescaling statement in G6. Local Robba slopes do not supply a global convergent slope filtration. Consumers: [KB.5/generic-ordinarity](#kb-5-generic-ordinarity); [KB.6/principal-exclusion](#kb-6-principal-exclusion); [KB.7/integral-functoriality](#kb-7-integral-functoriality).

6. **PadicDifferentialEquationsAndRigidCohomology:RD.2.** Use the p-adic local monodromy theorem, nilpotent logarithmic/Robba equivalence, Tannakian inertia realization and irregularity/Swan comparison for Bessel coefficients. Keep local Weil data including Frobenius and the exact Gross–Reeder hypotheses distinct from bare inertia. Consumers: [KB.4/log-extension](#kb-4-log-extension); [KB.6/wild-nontrivial](#kb-6-wild-nontrivial); [KB.6/rigidity-local](#kb-6-rigidity-local); [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge).

7. **PadicDifferentialEquationsAndRigidCohomology:RD.3.** Use frame-independent overconvergent/convergent F-isocrystals, finite coefficient extension, restriction and full faithfulness in their stated scopes. RD.3/taylor-comparison-of-pullbacks already supplies lift transport and its cocycle; check its Frobenius compatibility in this application. Only the global/log constant-Newton slope filtration and curve minimal-slope theorem in G10 require an additional contract. Consumers: [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison); [KB.4/log-extension](#kb-4-log-extension); [KB.5/generic-ordinarity](#kb-5-generic-ordinarity); [KB.10/dwork-line](#kb-10-dwork-line); [KB.10/maximal-quotient-bridge](#kb-10-maximal-quotient-bridge); [KB.10/characteristic-two-comparison](#kb-10-characteristic-two-comparison).

8. **PadicDifferentialEquationsAndRigidCohomology:RD.4.** Import RD.4/algebraic-rigid-specialization-maps and RD.4/specialization-forget-supports-square with their smooth proper compactification and overconvergent-coefficient hypotheses. The support map has the opposite direction to the ordinary map; they are maps, not unconditional comparison isomorphisms. The relative horizontal version for the bounded Hecke family remains an extension, with all finite-residue-extension fiber tests. Consumers: [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison).

9. **PadicDifferentialEquationsAndRigidCohomology:RD.5.** Use coefficient finiteness, Poincaré duality and localization. The GOS formula is supplied separately by RD.6/grothendieck-ogg-shafarevich-formula; keep local invariant and logarithmic boundary terms explicit in the adjoint rigidity calculation. Consumers: [KB.6/rigidity-local](#kb-6-rigidity-local).

10. **PadicDifferentialEquationsAndRigidCohomology:RD.6.** Use trace, Fourier, weights and exponential coefficients in their established scope. The arithmetic D-module six operations/ULA smoothness of G2, Miyatani multiplicative convolution of G11 and toric ordinarity of G12 require explicit additional contracts, not a blanket interpretation of Fourier transform as all three. Consumers: [KB.1/trace-companions](#kb-1-trace-companions); [KB.9/convolution](#kb-9-convolution); [KB.11/toric-slopes](#kb-11-toric-slopes).

11. **MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction.** Import generic neutral Tannakian reconstruction and the tensor-isomorphism torsor for a rigid abelian category with an exact faithful fiber functor. RD.6/coefficient-category-is-neutral-tannakian already supplies the overconvergent category with Frobenius forgotten and its invariant criterion. Specialize these to Bessel generation; the retained-Frobenius category needs its own exact faithful fiber functor (enlarge coefficients and choose a rational base point). No motivic structure is asserted. Consumers: [KB.6/generated-groups](#kb-6-generated-groups); [KB.7/central-torsor](#kb-7-central-torsor).

12. **GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian.** Use the equal-characteristic finite-field Beilinson–Drinfeld Grassmannian and bounded Hecke geometry; G1 requests its common-DVR relative extension, not the Witt-vector affine Grassmannian. Consumers: [KB.0/level-model](#kb-0-level-model); [KB.1/hecke-action](#kb-1-hecke-action); [KB.3/minuscule-comparison](#kb-3-minuscule-comparison); [KB.3/quasi-minuscule-comparison](#kb-3-quasi-minuscule-comparison).

13. **GlobalShtukasAndFunctionFieldLanglands:GS.1/geometric-satake-functor.** Use the normalized rational ℓ-adic geometric Satake/fusion functor in its finite-field curve setting. Arithmetic and characteristic-zero holonomic coefficient realizations, and their compatible integral specialization, are G2/G4 extensions. The chosen half twist is part of the coefficient datum. Consumers: [KB.1/hecke-action](#kb-1-hecke-action).

14. **KloostermanMomentsAndPotentialAutomorphy:KM.4/rigid-realization.** Import the scalar all-rank rigid object. Identify its d+ϖdt, exp(ϖ(t^p−t)) convention with this packet’s d−πdt through ϖ=−π; match the cyclic-module/solution-dual dictionary before comparing Frobenius. Consumers: [KB.8/classical-scalar](#kb-8-classical-scalar).

15. **KloostermanMomentsAndPotentialAutomorphy:KM.1/monodromy.** Import the scalar monodromy classification for r≥2 only. The full all-rank/all-prime scalar ordinarity theorem needed in KB.11 is a new Part II request in the same scalar direction, G12, rather than a second scalar construction. Consumers: [KB.6/global-monodromy](#kb-6-global-monodromy); [KB.11/everywhere-ordinary](#kb-11-everywhere-ordinary).

### Source corrections

All nineteen findings have an independent confirmed verdict in the packet. E9 concerns the exponent misprint only: extending an explicitly SL-only theorem to central forms is an additional consequence, not an erratum. E15 is relative to the fixed column cyclic convention. E17–E18 concern the FG v3 preprint; E19 concerns the XZ v2 preprint. No claim is made about uninspected versions or a published erratum. Source-proof repairs remain explicit gaps.

| Finding | Source and locator | Corrected statement or required repair |
| --- | --- | --- |
| E1 | XZ: arXiv:1910.13391v2: Theorems 1.1.4 and 1.2.4, pp. 3–5 | Use K containing π and √p, as in the body’s §4 standing hypothesis. |
| E2 | XZ: arXiv:1910.13391v2: §4.1.1, (4.1.1.1), pp. 37–38 | Use the root-depth/Moy–Prasad kernel containing T(1) and the nonsimple positive affine root groups. |
| E3 | XZ: arXiv:1910.13391v2: Theorem 4.2.1 and §4.1.13, pp. 42–43 | The main comparison has χ=1. A tame-character extension must use sign-compatible rational Kummer exponents. |
| E4 | XZ: arXiv:1910.13391v2: Lemma 4.2.6(i), pp. 44–45 | Replace that concentration assertion by the required perverse middle-image calculation and prove it; G4 remains open. |
| E5 | XZ: arXiv:1910.13391v2: §4.2.4 and §4.2.8, pp. 44, 46 | Test every rigid closed fiber after finite residue extensions and prove the comparison commutes with generator intertwiners, convolution and idempotent images. |
| E6 | XZ: arXiv:1910.13391v2: §2.1.5 and §4.1.13, pp. 10, 42 | Use d−πdt with exp(π(t−t^p)); use d−a dx/x with multiplier x^{−(q−1)a}, giving the inverse Teichmüller character. |
| E7 | XZ: arXiv:1910.13391v2: Proposition 4.4.5 proof and §4.4.3, p. 50 | For the source displayed gauge S use Ad_{S₀}N=qN. In the column convention use N C₀=q C₀N; its inverse has Ad_{C₀^{-1}}N=qN but a different differential equation from S. State the class as (2ρ)(√q). |
| E8 | XZ: arXiv:1910.13391v2: Corollary 4.5.6, p. 53 | Use a verified compatible-system neutral-group/component theorem and then identify the embeddings by tensor invariants. |
| E9 | XZ: arXiv:1910.13391v2: Lemma 4.5.5, p. 53 | Use Sym^{2e_i}, where e_i are the exponents, for the principal-SL₂ decomposition. |
| E10 | XZ: arXiv:1910.13391v2: Proposition 5.3.5, pp. 59–60; Corollary 5.3.11, p. 61 | Use Q^{n−1}−Q in the even toric trace, raw U_n−Q=R_{2n+1} at p=2, and (Be_SO3⋆Be_{2n−2})(1/2). Require n≥2 for convolution. |
| E11 | XZ: arXiv:1910.13391v2: §5.3.4, pp. 58–59 | Use that chart for n≥3 and compute SO₄ through SL₂×SL₂. |
| E12 | XZ: arXiv:1910.13391v2: §5.2.3 and Proposition 5.3.8(i), pp. 57, 61 | For hypergeometric rank r use αq^j for 0≤j<r; after odd-rank normalization the middle eigenvalue is 1. |
| E13 | XZ: arXiv:1910.13391v2: §§5.3.3 and 5.3.6, pp. 58–61 | Use the specified lowest-root matrices, the Sp_{2n} middle root E_{n,n+1}, and every affine-simple coefficient; the dual odd E entries both have factor 2. |
| E14 | XZ: arXiv:1910.13391v2: Proposition A.9 and proof A.11, pp. 66–67 | Use a common connected ordinary/log locus, prove the quotient identification, determine its multiplier at zero and then apply the minimal-slope theorem. |
| E15 | XZ: arXiv:1910.13391v2: Proposition A.9(i), cyclic-basis proof, p. 66 | In the fixed column convention, ∇δe₁=e₂ and e₂=xηe₁ give quotient d+ηdx, the dual of E_F=(O,d−ηdx). Its multiplier is q^n/f_{F,q}, where f_{F,q}=F(x)/F(x^q) is the full q-Frobenius iterate. Use h^{-1} on the quotient comparison. |
| E16 | XZ: arXiv:1910.13391v2: Appendix A.1 and A.13, pp. 63, 68–69 | Transport x↦−x by the convergent Taylor isomorphism at p=2, including Frobenius; use the corrected block indices in the signed induction. |
| E17 | FG: arXiv:0901.2163v3: Corollary 10, p. 28 | The row is D_{n+1}→B_n for n≥4; D₄ has its separate G₂ row. |
| E18 | FG: arXiv:0901.2163v3: Proposition 11, (14.1), and the following general formula, p. 29 | Subtract dim V^{I₀}+dim V^{I∞}; in the general formula also add 2 dim V^{G∇}. |
| E19 | XZ: arXiv:1910.13391v2: proof of Lemma 5.4.3, after (5.4.3.1), p. 63 | For upper rank 2n+1 and lower rank 1, the unnormalized trace is minus the raw H sum by Theorem 5.2.2(iii), p. 57. |

### Definition/API and suggested-file boundary

The packet has five definitions and eleven constructions, with 64 named API items and 49 unit tests, plus 33 theorem targets and five comparison targets. Forty-nine nodes are atlas planets, with at most six in a layer. The README contains the complete interfaces, including the tests of the stack, coefficient and analytic objects whose carriers are absent at the pins. The compact [suggested Lean file](../suggested/KloostermanSheavesAndBesselIsocrystals.lean) contains three light real-bodied formulas, four directly statable milestones/end theorems and six examples. It introduces no replacement coefficient category or formalization claim. Elaborating those signatures checks only their syntax and existing-carrier interfaces; the mathematical gaps remain as stated.

The independent review accepted this complete planning pass on 2026-10-19 after checking all 54 node records, correcting 26, and confirming the four baseline declarations; the detailed report records the remaining proof contracts. Follow-up must fulfill the exact supplier contracts and the source-proof repairs, then reconcile the same convention dictionary in the packet, this reader and the suggested signatures. All twelve layers retain planned status until that work removes their gaps and remaining lists.

## Sources and baseline

- **XZ.** Daxin Xu, Xinwen Zhu, [Bessel F-isocrystals for reductive groups](https://arxiv.org/pdf/1910.13391v2). Inventiones Mathematicae 227 (2022), 997–1092; arXiv:1910.13391v2, 19 December 2019. All XZ locators use the 71-page preprint pagination, not the journal pagination. Read 2026-10-19. SHA-256: `b8d153ef1822a20e8179005d4775e43fc3af7430d840d2b077b45cb8583667cd`.

- **HNY.** Jochen Heinloth, Bao Châu Ngô, Zhiwei Yun, [Kloosterman sheaves for reductive groups](https://math.mit.edu/~zyun/Kloosterman_published.pdf). Annals of Mathematics 177 (2013), 241–310; author-hosted published PDF. Locators below use its printed page numbers, beginning at printed page 241. Read 2026-10-19. SHA-256: `a821a39d6463a8e2d3c206710f2d2b717cd36db5fbee6a8659aa66f763880c7f`.

- **FG.** Edward Frenkel, Benedict Gross, [A rigid irregular connection on the projective line](https://arxiv.org/pdf/0901.2163v3). Annals of Mathematics 170 (2009), 1469–1512; arXiv:0901.2163v3, 29 June 2009. Locators use the 38-page preprint. Read 2026-10-19. SHA-256: `e190b78bbcfb28c7b9830fd23e3e789c46e0782439d27ffb01e2eb3d070e6b5f`.

- **Zhu.** Xinwen Zhu, [Frenkel–Gross’ irregular connection and Heinloth–Ngô–Yun’s are the same](https://arxiv.org/pdf/1603.05796v2). arXiv:1603.05796v2, 4 April 2016; preprint pagination 1–24. Read 2026-10-19. SHA-256: `c9afc9e4216198e73ec5f2fb26c3480aa525a22dd4ca57b951b88622de8143e7`.

- **Miy.** Kazuaki Miyatani, [p-adic Generalized Hypergeometric Equations from the Viewpoint of Arithmetic D-modules](https://arxiv.org/pdf/1607.04852v2). arXiv:1607.04852v2, submitted 22 April 2017, PDF dated 25 April 2017; preprint pagination. Published in American Journal of Mathematics 142 (2020). Read 2026-10-19. SHA-256: `ffc708fbfdc2ff0c68158dbf9151141e3cfe9d88d35f93bfcf66dfc4921f6038`.

- **GR.** Benedict H. Gross, Mark Reeder, [Arithmetic invariants of discrete Langlands parameters](https://people.math.harvard.edu/~gross/preprints/AdjointGamma5.pdf). Author preprint dated 1 March 2010; locators use this PDF, not journal pagination. Read 2026-10-19. SHA-256: `f3a74e45c72ea6b1c59d176097055bf637dffdc0aa471c1e57dbf3ccbd739af1`.

Only the source portions listed in the packet’s `readSections` are certified read. Original Baldassarri, V. Lafforgue/Drinfeld–Kedlaya, D’Addezio, Lam–Templier, Sperber–Wan, Adolphson–Sperber and the relevant generic oper/weight proofs remain the specifically identified source leaves. Katz’s ESDE was not read from an uncleared book copy. Miyatani and Gross–Reeder were read directly; they are not merely inferred from XZ’s citations.

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`; pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. The baseline references were checked in their actual source statements:

- `mathlib:AddChar` in `Mathlib/Algebra/Group/AddChar.lean`: Additive characters into a multiplicative monoid, including the constant-one character denoted 0.
- `mathlib:AddChar.sum_eq_ite` in `Mathlib/Algebra/Group/AddChar.lean`: Over a finite additive group and commutative domain semiring, the full character sum is card for the trivial character and zero otherwise.
- `mathlib:FiniteField.algebraMap_trace_eq_sum_pow` in `Mathlib/FieldTheory/Finite/Trace.lean`: Finite-field trace after the algebra map is the sum of Frobenius powers indexed by the extension finrank.
- `mathlib:Matrix.trace` in `Mathlib/LinearAlgebra/Matrix/Trace.lean`: Trace of a square matrix on a finite index type over an additive commutative monoid is the sum of its diagonal entries. Matrix coefficients, not abstract trace-function placeholders, are used.

The reviewed library audit and the current upstream roadmap/library searches are documented in the packet’s `upstreamNotes`. The two new pending coefficient/slope directions and the shared hypergeometric route are ownership proposals, with no purported supplier implementation. Their resolution is part of the follow-up, not duplicated work in this roadmap.
