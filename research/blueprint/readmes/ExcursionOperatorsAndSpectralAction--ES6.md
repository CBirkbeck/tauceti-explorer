# Excursion operators and the spectral action: functoriality and classical comparison

This part specifies the functorial properties of excursion parameters, the stratum and parabolic comparisons, and agreement with the independent classical GL_n parameter. The geometric conclusions are targets for Tau Ceti. All implementation statuses remain unchecked.

The exact target inventory is imported from [ES5](../packets/ExcursionOperatorsAndSpectralAction--ES5.json) and [ES7](../packets/ExcursionOperatorsAndSpectralAction--ES7.json), with the same node IDs. The [coverage packet](../packets/ExcursionOperatorsAndSpectralAction--ES6.json) records each import, its content hash and accepted review, and the realization of every scoped stage. It adds no owned node. Those packets continue to own the statements, prerequisite chains, API, tests and planets; their earlier-stage prerequisites remain imports. This reader gives the targets and the definition interfaces together for the eight stages in this part. Imported proof obligations are retained explicitly.

There are 63 imported targets: 6 definitions, 6 constructions, 6 lemmas, 41 theorems and 4 comparisons, with 58 API entries, 37 definition/construction checks and 29 existing planets. All eight stages are **planned**, none **closed**. The 24 gap records and 45 inherited supplier contracts describe remaining proof/interface work. Two ordinary-centre contracts are supplied by current upstream and recorded as resolutions, rather than renewed requests. The counts refer to reused targets, not new declarations.

## Conventions and endpoints

Let E be a nonarchimedean local field of residue cardinality q=p^f, and ℓ≠p. An integral coefficient ring Λ is a ℤ_ℓ[√q]-algebra with its chosen square root; coefficient maps preserve that choice. Parameter extraction uses an algebraically closed field L of characteristic other than p and the actual condensed scalar-endomorphism condition on a Schur object. The classical GL_n comparison uses Q̄_ℓ. Geometric Frobenius has degree 1, and rec_geom sends a uniformizer to geometric Frobenius; in terms of arithmetic Artin, rec_geom(a)=Art_arith(a⁻¹).

For pinned Ĝ with prescribed Weil action, distinguish the Ĝ-valued crossed cocycle from the homomorphism into its L-group: twisting multiplies only the cocycle, keeping the Weil projection. The spectral-centre formulation requires invertibility of |π₀Z(G)| for each relevant G; the excursion-algebra formulation avoids that restriction. This is the centre of G, not the centre of Ĝ, and is not ES3's separate categorical-action coefficient condition. FS IX.5.2, p. 329 and the introduction to IX.6, p. 330 fix this distinction.

For b∈B(G), put M̂=Ĝ_b and t=(2ρ_Ĝ−2ρ_M̂)(√q). The stratum comparison uses φ(w)↦t^{deg(w)}jφ(w). Normalized induction means i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E. The inverse root twist from δ_P^{1/2} cancels t. The source's unnormalized convention and negative geometric shifts are preserved until that dictionary is proved.

The proof order is by nodes, rather than by the display order of whole stages. Establish the coefficient policy, functoriality and BZ centre comparison first; build stratum/Levi compatibility and parabolic induction next; only then return to general smooth duality and extend supercuspidal GL_n agreement to all irreducibles. The characteristic-zero and equal-characteristic realizations are independent inputs to one common contraction/trace argument. No categorical Langlands conjecture is assumed. The Chapter X statements and definitions routed to ES0–ES4 remain there, outside this part.

## Existing foundations and exact supplier boundaries

At Mathlib 082e2d3, `Representation` is an algebraic monoid homomorphism into linear endomorphisms; `Representation.dual` precomposes with inverses. `coevaluation`, `contractRight` and `LinearMap.trace` supply the finite-dimensional contraction endpoint. `MonoidAlgebra` and its basis-index transport apply to infinite discrete groups as well as finite ones. `CategoryTheory.CatCenter` is the ordinary identity-functor endomorphism type. At Tau Ceti f790474, `TauCeti.IsSmoothDiscrete` requires discrete module topology and open point stabilizers. These facts do not supply the enhanced lisse category, parameter stacks, local Weil-group correspondence or classical towers. The reviewed AUDIT-20 records the scoped excursion targets as absent or partly built and identifies the generic adelic and classical-comparison suppliers. Each of this part's ten baseline citations was checked against its declaration at the exact pin.

Current TauCetiRoadmap main is also a supplier. ReductiveGroupsPartII RG2.1.5 already owns z-extensions, their existence over arbitrary fields and fundamental-group functoriality. Its introduction explicitly excludes z-embeddings and central pushouts. Those additional interfaces extend that direction; they do not authorize a second existence theorem for z-extensions. SmoothRepresentationsOfLocalGroups SR.0 owns the ordinary smooth centre; SR.1.3 owns the pro-p Hecke-corner limit and ℓ-adic separatedness. ES0 owns the enhanced centre and its comparison, with the condensed/domain refinements requested from VS4/VS5. Full equal-characteristic reciprocity exceeds ClassFieldTheory's prime-to-p equal-characteristic endpoint. AdelicAlgebraicGroups AA.0 is general enough for function-field places; its AA.1 algebraic-points construction is stated over number fields, so its function-field extension is a genuine contract. None of these upstream theories is re-planned here.

The named nodes below retain their canonical IDs. API and Check entries are the imported planning interface, carried with their owner; their complete direct prerequisites and proof steps are in the linked packet. Each definition or construction has at least three checks. The other targets give the key proof steps in prose, with locators in the precise source edition recorded by the owner. In particular, the two Kaletha copies use different pagination; no locator is silently transferred between them.


## ES6: Functorial properties: coefficient policy

Coverage: **planned**. The ambient coefficient rule governs every subsequent square. This stage has one imported target and no new definition.


### The coefficient policy for centre and excursion diagrams

`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams` — comparison. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Use ES1's spectral-to-geometric centre map only when the component-group order of the centre of each participating group is a unit in Λ. Carry out the same comparisons on excursion generators when this condition fails. After evaluation on a Schur object with algebraically closed coefficients of characteristic other than p, the resulting parameter comparisons have no extra good-prime condition from the integral categorical action.

Sources: FS-geometrization, IX.6 introduction, p. 330.


**Remaining proof/interface work for this stage.**

- Resolve the requested supplier interfaces used by each excursion/centre comparison.
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES6:functoriality: Isogenies, products, restriction, tori and characters

Coverage: **planned**. The nine functoriality theorems and the p-adic z-embedding definition use the ES1 action before scalar evaluation. The torus calculation is an operator identity on regular modules, so its diagonal-centre conclusion retains arbitrary coefficients.


### Compatibility with maps inducing adjoint isomorphisms

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Let f:G′→G induce an isomorphism on adjoint groups, with dual map Ĝ→Ĝ′. Pullback along Bun_G′→Bun_G intertwines the two excursion actions through that dual map. Prove this before taking scalar characters: pushing the pulled-back Hecke kernel forward gives the G-kernel tensored with the pushforward of the constant sheaf. This is a relative-homology pushforward calculation, with Satake change of group and the projection formula. Consequently a Schur constituent inheriting the action has parameter the dual composite. On neutral strata, the representation operation is restriction along G′(E)→G(E); naturality also passes the comparison to irreducible quotients. The hypothesis is an adjoint isomorphism, and does not require f to be a finite isogeny.

Planet: **Adjoint-isomorphism compatibility**.

Sources: FS-geometrization, IX.6.1 proof, pp. 330–331.


### Product compatibility of centres and parameters

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

For G=G₁×G₂, identify Bun_G with the product and compare exterior products of Hecke kernels over their common divisor base. The map from the tensor product of the two spectral centres to the geometric centre agrees with the product of their separate actions. Both factors on the geometric side are required: the second is G₂. On Schur constituents with inherited scalar action the parameter has components φ₁ and φ₂ and one common Weil projection.

Planet: **Product parameters**.

Sources: FS-geometrization, IX.6.2 proof, p. 331.


### Weil restriction and nonabelian Shapiro comparison

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Fix a finite separable E′/E and a compatible embedding of Weil groups. For G=Res_{E′/E}G′, the bundle-stack equivalence, nonabelian Shapiro equivalence for cocycles modulo conjugacy, and excursion-algebra equivalence identify the two actions. Use a wild subgroup normal in W_E contained in W_E′. The relevant intersections of finite free groups with the finite-index subgroup are again finitely generated and free; this is what makes the excursion colimit comparison work. The G′ parameter is restriction to W_E′ followed by the chosen dual-factor projection. Abelian cohomological Shapiro by itself is insufficient.

Planet: **Weil restriction of parameters**.

Sources: FS-geometrization, IX.6.3 proof, p. 332; FS-geometrization, IX.6.3 proof, p. 332.


### The spectral centre of a torus

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

For an E-torus T put R_T=lim_K Λ[T(E)/K], with the quotient transition homomorphisms and open subgroup levels. Reciprocity identifies Z_spec(T,Λ) with R_T. The geometric centre is the product of R_T over B(T)=π₁(T)_Γ, using the stratum equivalences and the ordinary abelian smooth-centre theorem. No quotient T(E)/K is assumed finite. The coefficient-point form is the functorial torus correspondence between continuous dual-torus cocycles modulo coboundaries and smooth characters.

Sources: FS-geometrization, IX.6.4 proof, p. 333.


### The universal-coefficient two-leg torus operator

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Take T=G_m, a compact open pro-p level K, and the regular smooth module Λ[E×/K]. Write u:W_E→E× for abelianization followed by inverse geometric reciprocity, where rec_geom(a)=Art_arith(a⁻¹). In every line-bundle degree, the standard/dual-standard excursion at (γ₁,γ₂) sends [x] to [u(γ₁)u(γ₂)⁻¹x]. Prove an equality of operators over arbitrary Λ, compatible with changing coefficients and quotient levels. The universal-cover torsor is interpreted as frames O(−1)→O(−D); this fixes the inverse in the second leg. Specializing to a character χ gives χ(u(γ₁)u(γ₂)⁻¹).

Sources: FS-geometrization, II.2.2–II.2.4, pp. 60–61; III.2, p. 91; VI.1.6–VI.1.9, pp. 193–194; VI.2.2–VI.2.4, pp. 197–198; IX.6.5 proof, p. 333; Fargues-AbelJacobi, Proposition 2.16, pp. 9–10; Remark 2.17, pp. 10–11; Proposition 3.3 proof, p. 13.


### The diagonal torus centre map

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Under the preceding descriptions, a spectral element r acts by r in every torus Newton component: R_T→∏_{b∈B(T)}R_T is the constant-tuple map. Reduce by torus resolutions to the explicit G_m operator. At each level, equality on the identity vector of the regular module detects the group-ring element, including nilpotent coefficients. Agreement merely on field-valued characters would not prove this centre statement.

Planet: **Diagonal torus centre map**.

Sources: FS-geometrization, IX.6.5, p. 333.


### Central characters for a connected centre

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

When Z(G) is a smooth connected torus, the parameter of the central character of an irreducible π is the projection of φ_π to the dual of Z(G). Apply the adjoint-isomorphism comparison to multiplication Z(G)×G→G, then use the product and torus comparisons. This uses the actual scheme-theoretic centre and its rational-point character.

Planet: **Central-character compatibility**.

Sources: FS-geometrization, IX.6 closing paragraph, p. 333.


### Twisting by characters of the abelianization

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

For a:G→D=G/G_der and a smooth character χ of D(E), twisting π by χ∘a multiplies the Ĝ-valued cocycle of φ_π by the central image of φ_χ. Keep the Weil projection fixed. The graph map G→G×D and the product/torus calculations prove the assertion, with its specified crossed-cocycle convention.

Sources: FS-geometrization, IX.6 closing paragraph, p. 333.


### Pseudo-z-embeddings and z-embeddings

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

Over a p-adic field F, retain Kaletha's full pseudo-z-embedding data: an injection G↪G_z, torus quotient C, H¹(F,C)=1, and a bijection on H¹ of the scheme-theoretic centres. A z-embedding further has connected centre Z(G_z) and induced quotient C. Its construction embeds the multiplicative-type centre in a torus and forms a central pushout. Central lifting then gives G_z(F)=Z(G_z)(F)G(F). These injective morphisms are distinct from the surjective z-extensions already owned by current upstream RG2.1.5.

Planet: **Z-embeddings**.

**API.**

- `ZEmbedding.ofMaps` (constructor): Bundle the injection and torus quotient with the full scheme and cohomological conditions; the prototype bundles only its rational exactness and central lifting.
- `ZEmbedding.quotient_inclusion` (simp): The quotient is one on the included G.
- `ZEmbedding.central_lift` (data): Each c in C(F) has a lift in Z(Gz)(F).
- `ZEmbedding.rational_factorization` (characterisation): Every x in Gz(F) can be written z times i(g) with central z and g in G(F).
- `ZEmbedding.extend_representation` (compatibility): A chosen smooth central-character extension agreeing on the intersection gives a smooth representation of Gz(F) restricting to pi; its formula on z i(g) is the central scalar times pi(g).

**Checks.**

- `zembedding_identity`: For a connected-centre reductive group, its identity with quotient one is a z-embedding; its rational-point inclusion is the identity.
- `zembedding_product`: For connected-centre G and induced torus C, the inclusion G to G times C and projection to C give a z-embedding and central lifts (1,c).
- `zembedding_requires_central_lifting`: A proposed rational quotient not surjective on the centre cannot be the rational-point data of a pseudo-z-embedding.

Sources: Kaletha-2018, Definition 5.1 and Proposition 5.2, p. 17; Kaletha-2018, Fact 5.5, p. 19.


### Rational central characters over every local field

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding-central-character-comparison` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

For an arbitrary local E and algebraically closed coefficient field L of characteristic different from p, recover the rational central character of π from its parameter without imposing a false flat-H¹ bijection on Z(G). Embed Z(G) in a torus T and form G⁺=(G×T)/Z(G), with torus centre T and torus quotient C. Its rational image H=i(G(E))T(E) is closed normal with compact abelian quotient; it need not be open. Extend the central character smoothly using a compact-open quotient and divisibility of L×. Smooth induction from H, finite generation and admissible finite length give an irreducible Π whose restriction has π as a quotient. The adjoint-isomorphism comparison identifies the projected parameter of Π with φ_π. Align lifts using a common pushout; their ratio is a continuous central crossed cocycle, corresponding to a torus character trivial on the original rational centre. This proves independence of choices. The topology, early finite-length lift and central-cocycle interfaces remain supplier contracts. Kaletha supplies the stronger p-adic special case, not an all-field theorem with unchanged H¹ hypotheses.

Sources: FS-geometrization, IX.6.1, pp. 330–331 and IX.6 closing paragraph, p. 333; Henniart-Vigneras-2025, Section 2.2.4(2), p. 236; section 3 and Lemma 3.1, pp. 238–239; Proposition 3.3 and proof, pp. 239–240; Vigneras-2023, Sections 4–5, pp. 337–340; finite-length paragraph on p. 340; Kaletha-2018, Definition 5.1, Proposition 5.2, pp. 17–18; Facts 5.4–5.6 and representation-extension paragraph, pp. 19–20; Conrad-finiteness, Remark 1.2.1, pp. 3–4; Lemma 4.1.2(i), p. 19; Proposition 4.1.7(i), p. 22.


**Remaining proof/interface work for this stage.**

- Current HS4 pre-evaluation diagrams and VS5 lisse Kunneth are imported directly; implement their supplier plans with their stated coefficient/enrichment conventions.
- Supply the residual central-pushout/torus-resolution and period-geometry extensions beyond current upstream RG2.1.5; supply BG1 all-E torus classification and full equal-characteristic reciprocity.
- Implement the coefficient-free Lubin–Tate owner interface used by the explicit universal-coefficient operator/sign proof.
- Implement the exact RG2.6 all-field central pushout and rational-image topology, early SR.3b quotient-lift and LP0 central-cocycle interfaces used by the explicit rational-central-character proof; keep the p-adic z-embedding as a stronger special case.
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES6:duality: Duality and the late proof return

Coverage: **planned**. The BZ centre involution is early input. The smooth-contragredient conclusion is a later endpoint after parabolic induction. Their separation prevents a circular proof through the whole ES6/ES7 stages.


### Chevalley compatibility for Bernstein–Zelevinsky duals

`ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

The BZ involution of the enhanced geometric centre intertwines the spectral Chevalley involution. Transport creation and annihilation through Satake duality; the extra inner conjugation by ρ̂(−1) disappears only after passing to conjugacy classes. Extract parameter identities for Schur objects or irreducible constituents in the domain of the supplied duality interface. Keep the noncompact/enriched domain as an explicit obligation. No t-exactness assertion is made for every BZ dual.

Planet: **Chevalley duality of parameters**.

Sources: FS-geometrization, IX.5.3 proof, p. 330; FS-geometrization, VI.12.1 proof, p. 241.


### Chevalley compatibility for smooth contragredients

`ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json).

For irreducible smooth π over the admitted algebraically closed coefficients, the smooth contragredient has parameter the Chevalley transform of φ_π. First prove the supercuspidal case by identifying smooth and BZ duality. Return to the general case only after ES7's parabolic compatibility and the supplied support/duality dictionary. The early BZ centre calculation does not depend on this late return.

Planet: **Smooth contragredient parameters**.

Sources: FS-geometrization, IX.5.3 proof, p. 330.


**Remaining proof/interface work for this stage.**

- Supply the all-coefficient admissibility and contragredient/induction dictionary, respecting the late ES7 return.
- Replace the prototype duality character equations by the actual enhanced duality interfaces.
- Refine the supplied compact lisse BZ theorem with condensed mapping compatibility, the enhanced-centre involution and the precise noncompact domain.
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES7:parabolic: Strata, twisted Levi maps and parabolic induction

Coverage: **planned**. The two constructions and six subsequent targets give the full proof route of FS IX.7.2–IX.7.3, pp. 334–338. Its unresolved all-field reduction and normalization interfaces are visible obligations, not consequences of formal centre restriction alone.


### Bernstein maps from strata

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For b∈B(G), use the supplied fully faithful functor from D(G_b(E),Λ) into D_lis(Bun_G,Λ), obtained from the stratum pullback's left adjoint. Restrict the enhanced geometric centre through that functor and compose with the ES1 action to obtain Ψ_G^b; at b=1 this is Ψ_G from j_!. The result agrees for eligible embeddings by ES5's stratum-centre comparison. Use excursion algebras in place of spectral functions outside the centre-order hypothesis. This does not posit a shriek functor for every lisse morphism.

Planet: **Bernstein stratum maps**.

**API.**

- `PsiG` (constructor): The composite of the spectral-to-geometric map with restriction to the trivial stratum.
- `PsiGb` (constructor): The same composite using the b-stratum and its group G_b(E).
- `restrictCentre` (constructor): For a fully faithful additive functor F : A → B of preadditive categories, the ring map Z(B) → Z(A), z ↦ (X ↦ F⁻¹(z_{F X})); Ψ_G^b is restrictCentre of the stratum embedding composed with ES1’s map.
- `restrictCentre_app` (simp): F((restrictCentre z)_X) = z_{F X} for every object X.
- `PsiGb.basepoint` (compatibility): Ψ_G^1=Ψ_G.
- `PsiGb.embedding_independent` (characterisation): Eligible fully faithful stratum embeddings with the specified adjunction induce the same central action.
- `PsiGb.excursion` (compatibility): Restriction of the excursion action defines the analogous map even when ℓ divides |π₀Z(G)|.

**Checks.**

- `PsiGb.basepoint_test`: At b=1, evaluate Ψ_G^b on any spectral function and obtain Ψ_G.
- `PsiG.one_test`: The spectral constant 1 acts as the identity on every smooth representation.
- `PsiGb.excursion_test`: For a group with ℓ dividing |π₀Z(G)|, the excursion construction still gives a central action; the spectral-centre identification is not invoked.

Sources: FS-geometrization, Definition IX.7.1, p. 334; FS-geometrization, Theorem IX.5.2, p. 329; Theorem VIII.3.6, p. 288.


### Twisted inclusion of Levi cocycles

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

With j:M̂=Ĝ_b↪Ĝ, geometric Weil degree deg, and t=(2ρ_Ĝ−2ρ_M̂)(√q), send a cocycle φ to w↦t^{deg(w)}j(φ(w)). Weil invariance of the root difference, equivariance of j, and centrality of t in M̂ prove the crossed-cocycle identity. Conjugation equivariance gives the corresponding pullback on invariant functions. Negative degrees use the chosen square root as a unit.

Planet: **Twisted Levi inclusion**.

**API.**

- `cocycleMap` (constructor): On A-points, φ ↦ (w ↦ t^{deg(w)}j(φ(w))).
- `cocycleMap.isCocycle` (characterisation): cφ(wv)=cφ(w)·w(cφ(v)), and cφ(1)=1.
- `cocycleMap.degree_zero` (simp): If deg(w)=0, cφ(w)=j(φ(w)).
- `cocycleMap.basicCase` (compatibility): If M̂=Ĝ then cφ=jφ.
- `cocycleMap.conjugation` (functoriality): Conjugating φ by m conjugates cφ by j(m); base change of A commutes with this map.

**Checks.**

- `cocycleMap.basic_test`: For M̂=Ĝ the cocharacter difference is zero, so the map is the identity inclusion.
- `cocycleMap.GL2_test`: For the upper Borel of GL₂, trivial φ evaluates at geometric Frobenius to diag(√q,1/√q).
- `cocycleMap.inertia_test`: On inertia (degree zero) the twisting factor is 1.

Sources: FS-geometrization, §IX.7.1 (Compatibility with G_b), p. 334.


### Reduction to torsion coefficients

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Prove the universal action comparison over ℤ_ℓ[√q] through its reductions modulo ℓ^r, then use separatedness of the integral ordinary Bernstein centre. Its pro-p Hecke-corner description is imported from SR.1. Extend to a general coefficient algebra using the separately requested derived scalar-extension identity for excursion actions. Separatedness of the universal centre is insufficient by itself to prove arbitrary, possibly nonflat, coefficient change.

Sources: FS-geometrization, Proof of IX.7.2, p. 335.


### Reduction to a quasi-split group

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For basic b use the Hecke-equivariant pure-inner-twist equivalence of Bun stacks. For p-adic E use the full z-embedding to identify Bun_G as the fibre of Bun_G′→Bun_C, inject B(G) into B(G′), and detect central actions by restricting representations through G′_{b′}(E)=Z(G′)(E)G_b(E). With connected centre, BG1 supplies the basic-class/inner-form bridge allowing a quasi-split inner form. Kottwitz Proposition 10.4 is a central-extension B-map result; the identification with H¹(E,G_ad) is an additional required step. For non-smooth centres in equal characteristic the same central-surjectivity argument fails, so the general reduction remains a named gap.

Sources: FS-geometrization, Proof of Theorem IX.7.2, p. 335; Kaletha-2018, §5.1, Definition 5.1 (p. 78) and Fact 5.5 (p. 80); Kottwitz-2014, Proposition 10.4, p. 50.


### Increasing instability at a fixed parabolic

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For quasi-split G choose the canonical parabolic P_b and a cocharacter μ central in its Levi with that dynamical parabolic. The classes b_N=bμ(ϖ)^N have the same group G_b and the same centre restriction. For each fixed bounded Hecke type, a sufficiently large N forces self-modifications of the corresponding bundle to preserve its HN reduction. The bound depends on the fixed Hecke type; it is not one bound for every excursion.

Sources: FS-geometrization, Proof of Theorem IX.7.2, pp. 335–336.


### Factorization of the stratum centre map

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

The target is Ψ_G^b=Ψ_{G_b}∘c_b^*, for the twisted inclusion c_b. On the increasingly unstable strata, factor the self-modification correspondence through P and then its Levi M, where G_b=M_{b_M} with b_M basic. Constant-term Satake produces dual-Levi restriction together with the root twist and a degree shift. Creation and annihilation select degree zero, removing that shift. Reconcile HS4's switched-kernel convention and the compact-support character in Rπ_!A′ before identifying the original representation's action; vanishing of a shift alone does not determine the twist.

Planet: **Parabolic stratum factorization**.

Sources: FS-geometrization, Theorem IX.7.2 and proof, pp. 335–337.


### Unnormalized parabolic induction

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For P=MU and a smooth M(E)-representation σ, the excursion action on unnormalized Ind_P^Gσ is pulled back by the twisted dual-Levi inclusion from the action on σ. Every irreducible subquotient for algebraically closed L therefore has the induced parameter. In the geometric proof use b=μ(ϖ⁻¹) and T_{μ⁻¹}; on the neutral stratum the resulting sheaf is Ind_P^Gσ(−d/2)[−d], d=⟨2ρ,μ⟩. Prove first on compactly induced generators and then pass to all σ with the required coefficient comparison.

Planet: **Parabolic induction compatibility**.

Sources: FS-geometrization, Corollary IX.7.3 and proof, pp. 337–338.


### Normalized induction and the cyclotomic twist

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Set i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U)|_E. Under geometric reciprocity the parameter of δ_P^{1/2} is the inverse of the root-twist cocycle. Thus the unnormalized twisted inclusion becomes the ordinary pinned Levi inclusion for normalized induction. Prove the relative-root identity with SR.2's modulus convention; the geometric Satake shift is already accounted for and introduces no second arbitrary normalization.

Planet: **Normalized induction dictionary**.

Sources: FS-geometrization, Corollary IX.7.3, p. 337 (with the twisted formula of §IX.7.1, p. 334).


**Remaining proof/interface work for this stage.**

- normalization: Root/modulus convention comparison
- z-embedding: Equal-characteristic quasi-split reduction; SL_p obstructs the torus-centre surjectivity route, requiring a different argument for non-smooth centres; GL_n does not use this reduction
- HN: Quantitative modification and constant-term closure
- prototypes: Materialize supplier carriers and omitted geometric conditions
- ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES7:GLn-comparison: Characteristic-zero GL_n comparison and the shared trace calculation

Coverage: **planned**. ET.6 supplies the independent classical LLC and JL; ET.6a supplies the towers and their diamond comparison downstream of HS2. The contraction and arbitrary-group trace determination are reused by the equal-characteristic realization.


### Two tower Hecke realization

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For E/Q_p, a supercuspidal π of GL_n(E), σ=JL(π), and the basic bundle O(−1/n), let B be the stratum sheaf of σ. The first minuscule operation yields π⊗ρ_π on the neutral stratum and the second yields σ⊗ρ_π^∨ on the basic stratum, hence together σ⊗ρ_π⊗ρ_π^∨ with two Weil actions. ET.6a owns both the independent classical towers and their diamond-to-Hecke-fibre comparison. SW20 Theorem 24.2.5 covers E=Q_p; for general p-adic E use Corollary 24.3.5 for the EL restriction-of-scalars data and check the passage back to GL_n/E shtukas. Preserve levels and all actions. The shift [n−1] and half Tate twist belong to the chosen Satake normalization.

Planet: **Two tower realization**.

Sources: FS-geometrization, Proof of IX.7.4, p. 338.


### Two-leg excursions compute traces

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Let ρ have positive finite dimension n over characteristic-zero k, and suppose the geometric two-operation realization is σ⊗ρ⊗ρ^∨. Scalar endomorphisms of σ and ρ, with diagonal Weil equivariance of fusion, identify creation and annihilation with a·coev and b·ev. Inserting (γ₁,γ₂) gives ab·tr ρ(γ₁γ₂⁻¹). The identity tuple is the constant excursion n, so abn=n; as n is nonzero in k, ab=1. The same algebraic theorem serves both characteristics of E once their separate geometric realizations are provided.

Planet: **Two-leg excursion trace**.

Sources: FS-geometrization, Proof of IX.7.4, p. 338.


### Semisimple determination for GL_n

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Two finite-dimensional semisimple characteristic-zero Weil representations with the same trace on every element are isomorphic. Import the arbitrary-group Brauer–Nesbitt result from ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces. Use the two-leg tuples (γ,1) to get its hypothesis. W_E is not treated as a finite group, and continuity is inherited from the representations rather than supplied by an algebraic trace identity.

Sources: FS-geometrization, Proof of IX.7.4, p. 338.


### Supercuspidal classical agreement

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Apply the common trace calculation to B and the independent tower realization to identify the parameter of the division-algebra representation σ with ρ_π. The sheaf of π is a summand after the standard Hecke operation and forgetting the Weil action. Hecke/excursion commutation and the Schur characterization carry the same parameter to π. This proves agreement on supercuspidals using neither a categorical Langlands equivalence nor an assumed equality of the two parameters.

Sources: FS-geometrization, Proof of IX.7.4, p. 338.


### Classical agreement for every irreducible

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For every irreducible smooth Q̄_ℓ-representation of GL_n(E) with E/Q_p, choose supercuspidal support and use the characteristic-zero segment/normalized-induction rules from the classical supplier. Combine supercuspidal agreement with the normalized ES7 induction theorem to obtain equality of the excursion parameter and the semisimplified classical Weil parameter. This endpoint does not recover a monodromy operator N.

Planet: **Classical GLn agreement**.

Sources: FS-geometrization, Theorem IX.7.4 and first line of its proof, p. 338.


**Remaining proof/interface work for this stage.**

- mixed-tower: O_E classical tower diamond comparison
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES7:function-field-automorphic: Division-algebra automorphic supplier

Coverage: **planned**. Generic adeles, diagonal embeddings, compatible Haar measures and central/degree quotients are FA.2, FA.6 and AA.0/AA.1 inputs. Only the D-specific order, compact-quotient, spectrum, EP, selected trace/transfer and globalization targets live here. Use a smooth projective geometrically connected curve X/F_q, F=F_q(X), a central division D of degree d≥1 and a rational split ∞ when called for.


### Maximal-order data for the division algebra

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Let X/F_q be smooth projective geometrically connected, F=F_q(X), and D/F central simple of degree d≥1. Choose a coherent O_X-order 𝒟, locally free of rank d², whose stalks are maximal local orders. At every unramified split place choose an identification with M_d(O_x). Existence and changes of these choices are separate proof obligations; split orders are not canonical. The later D-elliptic consumer additionally fixes a rational split place ∞, while the order target itself has no split-place assumption.

Planet: **Maximal orders of the division algebra**.

**API.**

- `DOrder.local` (projection): The completed local order 𝒟_x⊂D_x and its unit group.
- `DOrder.split_equiv` (compatibility): At x∉R the chosen pair is isomorphic to (M_d(F_x),M_d(O_x)).
- `DOrder.change_lattice` (functoriality): A change of split lattice by g conjugates the endomorphism order by g.
- `DOrder.ramification` (data): The finite set R of nonsplit places; a split pole is chosen outside R in the D-elliptic setup.
- `DOrder.units_isCompactOpen` (structure): Each 𝒟_x^× is a compact open subgroup of D_x^×, equal to GL_d(O_x) under the split identification at x ∉ R.

**Checks.**

- `DOrder.rank_one_test`: For D=F, 𝒟=O_X and every local maximal order is O_x.
- `DOrder.matrix_test`: For the standard lattice O_x^d the order is M_d(O_x), whose units are GL_d(O_x).
- `DOrder.integral_nonunit_test`: diag(π_x,1,…,1) belongs to the split order and is invertible over F_x but is not a unit of that order.

Sources: Hausberger-2005, §1.1, p. 1291.


### Compact division-algebra automorphic quotient

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For division D, including the auxiliary inner form D̄, specialize the generic function-field adelic infrastructure to D×. Its rational diagonal is discrete and its adelic quotient is compact modulo the centre. Quotient by the compatible central degree lattice ϖ_∞^ℤ to get the compact central-character quotient used for traces. At finite level stabilizers are finite; compactness is not a claim that the full quotient is a finite set.

Planet: **Compact division-algebra quotient**.

Sources: LRS-1993, §13.3, p. 291.


### Discrete division-algebra spectrum

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For a unitary central character trivial on the chosen degree lattice, the compact quotient has a discrete L² decomposition with finite automorphic multiplicities. Its smooth vectors factor into restricted tensor products, spherical at almost every place, with algebraic coefficient descent supplied separately. At any one compact open level the relevant automorphic space is finite dimensional. Do not transfer that finiteness to the entire tower.

Sources: LRS-1993, §13.3, p. 291.


### Kernel trace formula for the compact quotient

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For a locally constant compactly supported level-biinvariant test f on the fixed central quotient, the sum K_f(x,y)=Σ_{γ∈D×(F)}f(x⁻¹γy) is locally finite. Integrate its diagonal to equate the finite-level spectral trace Σ_Πm(Π)tr Π(f) with the sum over rational conjugacy classes of orbital integrals weighted by centralizer quotient volumes. Fix matching Haar and quotient measures before the identity; compactness and local finiteness justify the integrations.

Planet: **Kernel trace formula**.

Sources: LRS-1993, §13.5, p. 291.


### Weakly cuspidal Euler–Poincaré function

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

At the split rational place ∞, let Δ be the simple roots of GL_d, P_I the facet normalizer, P_I⁰ its compact parahoric, and χ_I its orientation character extended by zero. Set f_∞=Σ_{I⊂Δ}(−1)^{|Δ∖I|}χ_I/((|Δ∖I|+1)vol(P_I⁰)). It is a compactly supported function on PGL_d(F_∞), with the central/degree convention pulled back to GL_d. Full normalizers, their orientations and the displayed denominators are part of the definition.

Planet: **Euler–Poincaré function**.

**API.**

- `EulerPoincareFunction` (constructor): The finite facet sum with the specified coefficients and Haar normalization.
- `EulerPoincareFunction.central` (compatibility): Translation by F_∞^× leaves f_∞ unchanged.
- `EulerPoincareFunction.haar_rescale` (functoriality): Replacing dh by a·dh replaces f_∞ by a^{-1}f_∞.
- `EulerPoincareFunction.support` (characterisation): The support modulo centre is contained in the finite union of facet normalizers.

**Checks.**

- `EulerPoincareFunction.rank_one_test`: For d=1 the building is a point and the resulting function is the normalized constant on GL₁(F_∞)/F_∞^×.
- `EulerPoincareFunction.haar_test`: Doubling the Haar measure halves the EP function and leaves its integrated character trace unchanged.
- `EulerPoincareFunction.orientation_test`: In the GL₂ tree, a facet-normalizer element interchanging an edge’s two vertices has orientation sign −1, not +1.

Sources: LRS-1993, §13.1, p. 290.


### Euler–Poincaré orbital identities

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

The EP test has zero regular nonelliptic orbital integrals. For a regular elliptic element matching the division inner form at ∞, compare its orbital integral with that of the normalized constant function on D̄_∞×/ϖ_∞^ℤ, using the Kottwitz sign and transferred centralizer measures. The result is an elliptic matching identity with these measures, not a formula for every conjugacy class.

Sources: LRS-1993, Theorem 13.2(i), p. 290.


### Euler–Poincaré character identities

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

On unitary irreducibles of GL_d(F_∞)/ϖ_∞^ℤ, the EP trace is 1 on the trivial representation, (−1)^{d−1} on Steinberg and zero otherwise. Central invariance also kills incompatible nontrivial central characters. The characteristic-p applicability of the underlying building proof remains a source-expansion obligation; it is not supplied merely by quoting a theorem with stronger standing hypotheses.

Sources: LRS-1993, Theorem 13.2(ii), p. 290.


### Simple trace comparison in the selected range

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Choose factorizable tests with an auxiliary split supercuspidal selector, an elliptic-regular condition at another place, the EP test at ∞ and matching ramified local functions. The compact D trace formula then matches the simple cuspidal GL_d trace formula. The auxiliary supercuspidal place kills proper-parabolic contributions. Use only the selected constituents isolated in this comparison, without introducing a general invariant trace formula or general global transfer.

Planet: **Simple trace comparison**.

Sources: LRS-1993, Proof of Lemma 15.10, p. 315.


### Globalization with prescribed cuspidal places

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For supercuspidal π at o with finite-order central character, fix distinct o,o′,∞ and choose an auxiliary x₂ outside them. Construct a cuspidal GL_d automorphic representation with component π at o, Steinberg at ∞ and supercuspidal components at o′ and x₂, with compatible central character. A further x₃ can impose elliptic-regular test support. This is the selected LRS globalization range, with the original global setup kept fixed.

Planet: **Cuspidal globalization**.

Sources: LRS-1993, Lemma 15.10 and proof, pp. 314–316.


### Selected global inner-form transfer

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For D ramified with invariants 1/d at o and −1/d at o′, the selected globalizations transfer to unique automorphic D× constituents with matching split components and local JL at o,o′, of multiplicity one. In the quoted broader sufficient hypothesis the auxiliary supercuspidal place lies outside a finite set S containing all ramified places. The cohomological argument uses the selected proven transfer image; it does not grant multiplicity one to arbitrary D× isotypes.

Sources: Hausberger-2005, Lemmas 10.2–10.3 and Theorem 10.4(2), p. 1340; LRS-1993, Lemma 15.11, p. 316.


### Equal-characteristic local transfer identity

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For supercuspidal π of GL_d(K) and its local JL transfer to the division algebra of invariant 1/d, matching regular elliptic elements satisfy Θ_π(g)=(−1)^{d−1}Θ_JL(π)(h). This equal-characteristic local input is independent of the global Galois construction. Check the measures when passing from characters to orbital/test-function identities.

Sources: Hausberger-2005, Theorem 9.1, pp. 1333–1334.


### Local supercuspidal selectors

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Given a supercuspidal π with fixed unitary central character and nonzero K₀-fixed vectors, use its matrix coefficients to construct a test f_π acting by the K₀-projector on π and by zero on other irreducible admissibles in that central-character setting. Its trace on π is dim π^{K₀} and f_π(1) is nonzero. The construction is normalized by the nonzero scalar in the matrix-coefficient/representation composite, then averaged on both sides by K₀. An indicator of K₀ alone does not have this selectivity.

**API.**

- `CuspidalSelector` (constructor): The normalized bi-K₀-invariant central-character test.
- `CuspidalSelector.value_one` (characterisation): f_π(1)=c^{-1}dimπ^{K₀}≠0 in the source normalization.
- `CuspidalSelector.trace` (compatibility): trπ(f_π) is nonzero, and every other irreducible admissible representation with the same central character has zero trace.
- `CuspidalSelector.support` (data): Its support is compact modulo the centre.

**Checks.**

- `CuspidalSelector.value_test`: For dimπ^{K₀}=1 and normalization c=1, f_π(1)=1.
- `CuspidalSelector.central_test`: Its central translation law is the inverse of the fixed central character in the convolution convention.
- `CuspidalSelector.indicator_test`: The characteristic function of K₀ acts on every representation with K₀-invariants, whereas f_π kills incompatible supercuspidals.

Sources: LRS-1993, Proof of Lemma 15.10, pp. 314–315.


**Remaining proof/interface work for this stage.**

- orders: Order existence and division compactness proof
- EP: Building EP orbital/character proof sources
- simple-transfer: Simple trace formula and selected transfer proofs
- classical-local: Badulescu’s equal-characteristic local character identity
- prototypes: Materialize supplier carriers and omitted geometric conditions
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES7:equal-characteristic: D-elliptic geometry and equal-characteristic realization

Coverage: **planned**. Use the right-order-module convention and keep the auxiliary global D̄ distinct from D. These 23 targets give definitions, moduli, uniformization, corrected duality, selected cohomology and the separate Hecke-fibre transport. They do not import a mixed-characteristic tower identity as an equal-characteristic proof.


### D-elliptic sheaves

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Fix the order 𝒟 and rational split ∞ above. Over S/F_q, take right-𝒟 vector bundles E_i of O-rank d² on X×S, with injections j_i:E_i→E_{i+1} and t_i:τE_i→E_{i+1}, τ=(id_X×Frob_S)^*. Require commuting squares and period E_{i+d}=E_i(∞×S), with the composite j map the standard inclusion. The successive j and t cokernels are pushforwards of rank-d locally free O_S modules along ∞ and the characteristic graph z respectively; z avoids ∞ and the ramification set. Normalize by 0≤χ(E_0|_s)<d. Morphisms are right-𝒟-linear chain isomorphisms respecting both maps. This is the index-shift normalization of the unnormalized moduli problem.

Planet: **D-elliptic sheaves**.

**API.**

- `DEllipticSheaf` (constructor): The periodic chain with the specified j,t maps and cokernels.
- `DEllipticSheaf.zero` (projection): The zero morphism z:S→X\({∞}∪R).
- `DEllipticSheaf.period` (simp): E_{i+d}=E_i(∞×S), compatibly with j and t.
- `DEllipticSheaf.ext` (extensionality): A chain isomorphism commuting with j,t is exactly an isomorphism of D-elliptic sheaves.
- `DEllipticSheaf.pullback` (functoriality): Pullback along S′→S commutes with τ, j,t, zero and the periodicity data.
- `DEllipticSheaf.matrix_case` (equivalence): Morita equivalence identifies D=M_d(F) with rank-d Drinfeld elliptic sheaves of DM.7.

**Checks.**

- `DEllipticSheaf.rank_test`: For d=2 each E_i has O-rank 4, while the pole and zero cokernels have rank 2 on S.
- `DEllipticSheaf.frobenius_test`: Over S=Spec F_{q²}, τ twists the S coefficients by q-Frobenius and leaves the curve X fixed.
- `DEllipticSheaf.matrix_test`: For D=M_d(F), the idempotent Morita functor gives DM.7’s rank-d elliptic sheaf, including j,t and its zero.

Sources: Hausberger-2005, Definition 1.1, pp. 1292–1293.


### Level structures on D-elliptic sheaves

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Let I be a nonempty finite closed subscheme away from ∞ and the characteristic graph. The j maps identify the restrictions of all E_i to I×S. A level structure is a right-𝒟_I-linear trivialization of this restriction for which t after Frobenius pullback agrees with that trivialization. For I′⊃I, restriction is reduction modulo I. The Frobenius equation is part of the level structure, not an arbitrary bundle framing.

**API.**

- `DEllipticLevel` (constructor): A D_I-linear trivialization satisfying t∘τι=ι.
- `DEllipticLevel.restrict` (functoriality): Reduction along I⊂I′ gives the smaller level, with identity and composition laws.
- `DEllipticLevel.pullback` (functoriality): Base change on S transports the trivialization and the Frobenius square.
- `DEllipticLevel.unitAction` (structure): The finite group 𝒟_I^× = (𝒟 ⊗ O_I)^× acts on the right by ι·g = ι ∘ L_g, where L_g(x)=gx is an automorphism of the right regular module. Its elements are τ-fixed, so t∘τι=ι is preserved; a general unit after extension to O_S need not preserve it. Forgetting the level gives the corresponding torsor. Right multiplication is not right-𝒟_I-linear for a noncentral g.

**Checks.**

- `DEllipticLevel.frobenius_test`: In rank one over a field, replacing a compatible trivialization by a scalar a preserves compatibility exactly when a^q=a.
- `DEllipticLevel.nested_test`: For I⊂I′⊂I″, restricting from I″ to I agrees with the two successive restrictions.
- `DEllipticLevel.zero_test`: If the zero meets I the t map need not be invertible on I, so the level functor’s stated domain excludes that case.
- `DEllipticLevel.right_module_test`: In M₂(F₃), g=diag(1,2) is a unit. For x=E₁₂, right multiplication gives xg=2E₁₂ while g x=E₁₂, so it is not a right-module map. Left multiplication satisfies L_g(xa)=L_g(x)a and is the operation used on levels.

Sources: Hausberger-2005, §1.3, p. 1293.


### D-elliptic level moduli

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

At nonempty level I the normalized moduli over U=X∖(∞∪I∪Ram(D)) is represented by a smooth quasi-projective scheme of relative dimension d−1; it is projective for division D. Build its parameter spaces and transversality using the separate Quot/chain-moduli suppliers. At the distinguished ramified o, Hausberger's special-sheaf extension for levels away from o is projective but need not be smooth. Additional o-level covers are only asserted on generic analytic fibres.

Planet: **D-elliptic level moduli**.

**API.**

- `DEllipticModuli` (constructor): The representing level scheme over U.
- `DEllipticModuli.points` (universal-property): For S/U its S-points are level D-elliptic sheaves, functorially in S.
- `DEllipticModuli.level_map` (functoriality): Nested levels give the forgetful morphism with identity/composition laws.
- `DEllipticModuli.dimension` (characterisation): The zero morphism is smooth of relative dimension d−1.
- `DEllipticModuli.projective` (compatibility): For division D it is projective; the distinguished-place extension requires I∩{o}=∅.

**Checks.**

- `DEllipticModuli.rank_one_test`: At d=1 the zero morphism is smooth of relative dimension 0.
- `DEllipticModuli.shift_test`: Choosing χ(E_0) in [0,d) gives the same moduli as dividing the unnormalized chain stack by index shift.
- `DEllipticModuli.level_at_o_test`: A level including o is not assigned the formal extension asserted for levels away from o.

Sources: Hausberger-2005, Theorem 6.1, proof and Theorem 6.4, pp. 1311–1313; LRS-1993, Theorems 4.1, 5.1, 6.1 and Corollary 6.2, pp. 236, 241, 246.


### Frobenius and Hecke correspondences

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences` — construction. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Represent the right D×(A_F^∞) action by finite-level correspondences after suitable level refinements. It is not an action by automorphisms on every fixed level. At a good place, the Frobenius and spherical-Hecke correspondences commute. Define the cohomological left actions by pull-push with the specified inverse convention, and check level compatibility.

**API.**

- `DEllipticHecke` (constructor): The finite correspondence at refined levels associated to g∈D^×(A^∞).
- `DEllipticHecke.mul` (compatibility): Composition on the tower is the right group action law; cohomology receives the corresponding left action.
- `DEllipticHecke.frobenius` (compatibility): At good places the Hecke action commutes with geometric Frobenius.
- `DEllipticHecke.level` (functoriality): Transition maps of levels commute with the correspondences.

**Checks.**

- `DEllipticHecke.identity_test`: The element 1 gives the identity correspondence at every level.
- `DEllipticHecke.level_test`: An element that does not normalize K_I is a correspondence through a refined level, not an automorphism of E_I.
- `DEllipticHecke.right_left_test`: The product law of the induced left cohomology action agrees with the inversion convention for the right action.

Sources: Hausberger-2005, §6.3, pp. 1315–1316 (right action and Hecke correspondences); §10.1, p. 1338 (induced left action on cohomology).


### Special formal O_D-modules

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For K=F_q((t)), a division algebra D_K of invariant 1/d and its maximal order O_D, a special formal O_D-module over a base killed by a power of the uniformizer is a smooth formal O_K-module with compatible O_D action and Lie module invertible over O_d⊗O_K B. Here O_d is the unramified degree-d subextension. In the height-d² problem its dimension is d and each unramified eigenspace has rank one. Merely imposing total Lie dimension d would give the wrong moduli problem.

Planet: **Special formal modules**.

**API.**

- `SpecialFormalODModule` (constructor): Formal O-module, O_D-action and invertible O_d⊗B tangent module.
- `SpecialFormalODModule.lie` (projection): The tangent module with its O_d action.
- `SpecialFormalODModule.baseChange` (functoriality): Base change transports the action and tangent invertibility.
- `SpecialFormalODModule.dimension` (characterisation): On a splitting base each tangent eigenspace has rank 1, so total dimension is d.

**Checks.**

- `SpecialFormalODModule.rank_one_test`: For d=1 specialness is a one-dimensional formal O-module tangent line.
- `SpecialFormalODModule.eigenspaces_test`: For d=2 on a splitting base the two tangent eigenspaces each have rank one.
- `SpecialFormalODModule.dimension_only_test`: A two-dimensional tangent module with O₂ acting entirely through one embedding is not special.

Sources: Hausberger-2005, Definition 3.1, p. 1302.


### Special-module deformation space

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Over the algebraically closed residue field the framed height-d² special formal modules form one isogeny class, with rational O_D-linear endomorphisms M_d(K). Height-zero quasi-isogeny deformations are represented by the Drinfeld formal half-space over the completed maximal unramified base. GL_d(K) changes the framing and incorporates determinant-controlled descent. On the formal base D_K× acts only by the Frobenius power −v(Nrd); O_D× therefore acts trivially there. Its nontrivial level action occurs on the covers, not on that formal scheme.

Sources: Hausberger-2005, Theorems 3.4,7.2,7.4, §§7.2–7.3, pp. 1303,1317–1319.


### D-elliptic uniformization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Choose global D with invariants 1/d at o, −1/d at o′ and zero at ∞. For D̄ move the invariant from o to ∞, keeping the others. The completion of the extended D-elliptic moduli at o is the quotient of the Drinfeld formal space times Z_I by GL_d(F_o), where Z_I=D̄×(F)\D̄×(A^∞)/K_I^{∞,o}. At o-level n, pass to generic analytic fibres to obtain the quotient using the Drinfeld covers Σ_n. Preserve away-o Hecke, D_o× and Weil descent, keeping D distinct from D̄. The covers do not imply a formal model with o-level.

Planet: **D-elliptic uniformization**.

Sources: Hausberger-2005, §8.1 (pp. 1319–1321; D̄ defined p. 1319), Theorem 8.1 (p. 1321), Theorem 8.3 (p. 1323).


### Fundamental local representation

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation` — definition. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Use Res′Σ_n, the disjoint union of the unramified Frobenius twists indexed by integers, with Weil descent. Set U_d^i=colim_n H_c^i((Res′Σ_n)_K̄,Q̄_ℓ), with commuting GL_d(K), D_K× and W_K actions; the fundamental degree is d−1. The component stabilizer consists of triples (g,b,w) for which det(g)Nrd(b)Cl(w)⁻¹ is a unit, with Cl of geometric Frobenius a uniformizer. Recover U_d^i by compact induction from that stabilizer. For a finite-order central ξ take the largest quotient of central character ξ. Res′ is not ordinary restriction of scalars along an infinite extension.

Planet: **Fundamental local representation**.

**API.**

- `FundamentalLocalRepresentation` (constructor): The level colimit of compact-support cohomology of Res′Σ in degree i.
- `FundamentalLocalRepresentation.threeActions` (structure): Commuting GL_d(K), D_K^× and continuous Weil actions on compact-open invariants.
- `FundamentalLocalRepresentation.compactInduction` (equivalence): The induction from P_d identifies the component-colimit description with U_d^i.
- `FundamentalLocalRepresentation.centralQuotient` (constructor): For finite-order ξ the maximal quotient on which the GL_d centre acts by ξ.
- `FundamentalLocalRepresentation.level` (functoriality): Finite-level pullback maps define the direct system and commute with the three actions.

**Checks.**

- `FundamentalLocalRepresentation.degree_test`: For d=2 the fundamental representation has degree 1.
- `FundamentalLocalRepresentation.stabilizer_test`: A g with v(det g)=1 does stabilize a component together with w satisfying v(Cl(w))=1 and b=1; determinant valuation alone is not the stabilizer condition.
- `FundamentalLocalRepresentation.coproduct_test`: A class with compact support in Res′ has finite component support; all ℤ-indexed components are present, rather than a product or all unramified Galois automorphisms.

Sources: Hausberger-2005, §§9.2–9.3, Definition 9.3, pp. 1335–1337.


### Local cohomology finiteness and continuity

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

At each finite cover level, compact-support cohomology in degrees 0 through 2(d−1) is of finite type as a smooth GL_d(K)-module, with D_K× action and continuous Weil action on compact-open invariants. Finite type is not admissibility of the entire central-character tower. The stronger tower-admissibility input mentioned in Hausberger is separate and is not used to justify the supercuspidal identity here.

Sources: Hausberger-2005, Proposition 10.6(i) and Proposition 9.4 caveat, pp. 1341,1337.


### Global tower cohomology and automorphic isotypes

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For division D, finite-level proper smooth moduli have finite-dimensional Q̄_ℓ cohomology with continuous Galois action and a finite coefficient field. Passing through levels gives commuting automorphic and Galois actions with finite-dimensional invariants at each fixed level. Decompose the semisimplification into Π^∞⊗V_Π^i, with the specified trivial/Steinberg types at ∞. At this point only the decomposition and alternating trace are targets; single-degree concentration and multiplicity one require the selected-transfer theorem.

Sources: Hausberger-2005, Theorem 10.1 and its setup, pp. 1338–1339; LRS-1993, §§14.1–14.2 and Theorem 14.9, pp. 294, 297–298.


### Geometric and automorphic trace identity

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

At a good o and r≥1, the alternating Frobenius/Hecke trace equals the automorphic trace of the EP test at ∞, the prescribed local o-test and the away-o test. The trivial and Steinberg types enter with coefficients 1 and (−1)^{d−1}. For the latter, at almost every o the alternating trace is (−1)^{d−1}m(Π)q_o^{r(d−1)/2} times the r-th power sum of the Satake parameters. This precedes any concentration theorem.

Sources: LRS-1993, Proposition 13.6 and Theorem 14.9(ii), pp. 291, 297.


### Pairing dual automorphic isotypes

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

At proper level of dimension d−1, duality pairs the Π-isotype in degree i with the Π^∨-isotype in degree 2(d−1)−i and twist d−1. Include the dual multiplicity space and inverse central character; the adjoint Hecke correspondence is the inverse one. A pairing with the same Π-isotype requires additional self-duality and cannot be assumed.

Sources: Kaiser-erratum, Opening paragraph and Corollary 14.11 correction, p. 1.


### Corrected L-factor duality

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum` — comparison. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

Use the corrected reciprocal factor involving (V_Π^bullet)^∨ and q_x⁻¹T⁻¹ in LRS Corollary 14.11, and the corrected Lemma 14.14′ and Proposition 14.17′. Both the dual and the exponent matter. The selected generic proof of concentration does not rely on the unpublished invariant-ample-class argument. The original and corrected statements remain distinct in the owning packet's source-issue record.

Sources: Kaiser-erratum, Corollary 14.11 correction, p. 1.


### Corrected graded chain lemma

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma` — lemma. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For d≥1, let V^bullet be a pure graded Frobenius-semisimple local representation in degrees 0,…,2d−2. Suppose its reciprocal L-factor ratio has the orders at T=q_∞^n of ((1−q_∞^{−d}T⁻¹)/(1−T))^m, and each inverse graded L-factor is an m′-th power, with m′ dividing m. The amended lemma extracts a direct summand consisting of m′ copies of chains of special representations of positive lengths i₀,…,i_s summing to d, successively twisted by −i₀−⋯−i_{j−1}. A length-i term after accumulated twist −a lies in degree i+2a−1, and the number of chains times m′ equals m. It does not assume the old integrality or self-duality conditions. The full equivalence relation on reciprocal factors is the one stated at the canonical node.

Sources: Kaiser-erratum, Lemma 14.14′ and its proof, pp. 1–2.


### Corrected automorphic graded chain

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For a Steinberg-at-∞ automorphic constituent, the local graded Frobenius semisimplification has the amended chain form with multiplicity m(Π), positive lengths summing to d and degrees i_j+2(i₀+⋯+i_{j−1})−1. Apply the corrected chain lemma to the supplied purity and L-factor inputs. This is a chain classification, not yet a proof that there is only one length or that all cohomology is in the middle degree.

Sources: Kaiser-erratum, Proposition 14.17′, p. 1.


### Selected global middle cohomology

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For the selected transfer image of LRS 15.10–15.11, the Π-isotype is zero away from d−1, has dimension d in that degree and multiplicity one. Its good-place trace is q_o^{r(d−1)/2} times the Satake power sum. Define Σ(Π)=V_Π^{d−1}((d−1)/2). Prove concentration by purity, independent global genericity and the strict unitary-generic Satake bound, rather than claiming it for every division-algebra isotype.

Sources: LRS-1993, Theorem 15.12 (pp. 316–317) and the Remark following it (p. 317); Hausberger-2005, Proposition 10.5, p. 1341.


### Independence of the selected globalization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For a fixed global setup (curve, o,o′,∞,D) and finite-order-central-character supercuspidal π at o, the semisimple restriction Σ(Π)|W_K is independent of the selected globalization and the allowed auxiliary x₂. Match determinants, duals, finite-order twists and pair local L/ε factors with the specified additive character and reciprocity. This statement does not assert independence of the curve or o′. The compact-support functional equation and local ε-product formula remain explicit supplier extensions.

Sources: LRS-1993, Proposition 15.13 and Corollary 15.14, pp. 317–318.


### Independent equal-characteristic classical LLC

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

The selected global construction gives the independent bijection between finite-order-central-character supercuspidals of GL_d(K) and irreducible d-dimensional Weil representations with finite-order determinant, with the prescribed character, twist, dual and pair-factor compatibilities. Surjectivity uses the independent numerical local Langlands theorem. Extend to the full representation range by twisting and segment classification. No excursion parameter is used in its construction, and the later comparison only reads its semisimple Weil part.

Sources: Hausberger-2005, Theorem 9.2, pp. 1334–1335.


### Hochschild–Serre for the geometric quotient

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For the uniformized finite-level quotient, the E₂ page is smooth Ext over GL_d(K) from H_c^{2(d−1)−j}(Res′Σ_n)(d−1) to the automorphic coefficient space of the D̄ double quotient, converging to degree i+j cohomology of the global moduli. Prove the properly discontinuous analytic quotient, finite-stabilizer and compact-support duality hypotheses for this application, preserving levels, D_o×, away-o and Weil actions. The general derived construction is imported; the profinite discrete-module spectral sequence alone is not this analytic theorem.

Sources: Hausberger-2005, Proposition 10.6(ii) (p. 1341), Corollary 10.7 and Remark 10.8 (p. 1342), Proposition A.12 (pp. 1364–1365).


### Cuspidal degeneration of the quotient spectral sequence

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

On a selected global isotype whose o-component is supercuspidal, higher smooth Ext columns vanish, so E₂^{0,j} identifies the selected local multiplicity with the global one. Work first on GL_d(K)^0, use compact matrix coefficients and the characteristic-zero injectivity input, then apply finite-index averaging for Z(K)GL_d(K)^0. Its index is d. Use semisimple-isotypic splitting, rather than the invalid zero-kernel inference in the cited proof. Keep finite-type and finite-level admissibility hypotheses throughout.

Sources: Hausberger-2005, Lemma 10.14, Lemma 10.15, Remark 10.16, Proposition 10.17, pp. 1353–1356.


### Drinfeld–Carayol supercuspidal realization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For finite-order ξ and a supercuspidal π with that central character, Hom_GL_d(K)(π,U_d^i(ξ)) vanishes unless i=d−1. In that degree it is JL(π)⊗(σ_d(π)⊗|·|^{(1−d)/2}), equivariantly for D_K× and W_K. This is Hausberger's finite-order-central-character three-action range. Extension to arbitrary characters uses the separate twisting comparison.

Planet: **Drinfeld–Carayol theorem**.

Sources: Hausberger-2005, §9.3 and Theorem 9.5 (p. 1337); final proof in §10.4 (pp. 1356–1357).


### Equal-characteristic Hecke-fibre realization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport` — comparison. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

In equal characteristic, identify both the special formal O_D/Drinfeld covers and the dual local formal-module spaces with their minuscule local-shtuka Hecke fibres. Transport the Drinfeld–Carayol realization and the second, dual operation with all actions, the shift [d−1] and half Tate twist, obtaining σ⊗ρ_π⊗ρ_π^∨. The equal-characteristic Lubin–Tate input must be sourced separately (the Boyer route); a mixed-characteristic p-divisible-group comparison cannot supply it.

Sources: FS-geometrization, §IX.7.3, p. 338 (cf. §IX.3, pp. 324–325).


### Classical agreement in equal characteristic

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For characteristic-p E and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter equals the semisimplified Weil part of the independent classical parameter. For supercuspidals combine the separately built two-operation realization with the shared contraction/trace and Brauer–Nesbitt arguments, then transport from the basic stratum by the Hecke summand. Extend through normalized induction and the classical segment rule. The transport and local-geometry gaps remain part of this plan.

Sources: FS-geometrization, Theorem IX.7.4 and proof, p. 338.


**Remaining proof/interface work for this stage.**

- moduli: D-elliptic moduli proof expansion
- local-geometry: Equal-characteristic formal-module and uniformization proof
- weights: Corrected graded local chain proof closure (Kaiser)
- classical-local: Independent local correspondence and constants
- analytic-HS: Analytic quotient spectral sequence and Ext degeneration
- equal-transport: Equal-characteristic transport and second operation
- prototypes: Materialize supplier carriers and omitted geometric conditions
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## ES7: Agreement over every local field and the centre endpoint

Coverage: **planned**. These two final targets combine the separate field-characteristic branches. They retain the realization and coefficient obligations of their input nodes.


### Classical agreement over every local field

`ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field` — theorem. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For every nonarchimedean local E, ℓ≠p and irreducible smooth Q̄_ℓ-representation π of GL_n(E), identify φ_π with the semisimplified classical Weil parameter. Prove the characteristic-zero half using ET.6/ET.6a and the characteristic-p half using the independent D-elliptic and selected automorphic route. Both use the same two-leg trace calculation and normalized-induction endpoint. This is a target over both characteristics, without a claim to recover N or to close the recorded realization gaps.

Planet: **Classical agreement over local fields**.

Sources: FS-geometrization, Theorem IX.7.4, p. 338.


### Classical Bernstein-centre comparison

`ExcursionOperatorsAndSpectralAction:ES7/classical-centre-agreement` — comparison. [Owning packet](../packets/ExcursionOperatorsAndSpectralAction--ES7.json).

For GL_n over Q̄_ℓ the spectral-to-ordinary-Bernstein map agrees with the map evaluated via classical parameters: equality on irreducibles and the supplied separation theorem identify the maps. There is also the universal integral Bernstein-centre map over ℤ_ℓ[√q]. Its existence is not an integral or modular full Weil–Deligne correspondence.

Sources: FS-geometrization, After IX.7.4, p. 338.


**Remaining proof/interface work for this stage.**

- equal-transport: Equal-characteristic transport and second operation
- Resolve the applicable inherited gaps and supplier contracts recorded here; planned is target coverage, not proof closure or implementation.


## Dependency closure, proof gaps and source discipline

The imported node graph is the mathematical plan. Follow each exact node's prerequisites in its owner, through ES5's earlier parameter-extraction nodes where needed, until reaching a pinned declaration, an already owned roadmap node, or a stage-level supplier contract with its precise gap. A stage's appearance in a coverage record is not a prerequisite on every node of that stage. In particular, the late smooth-dual return must not become a prerequisite of early functoriality. The packet records the five supplier-ID replacements below. Its same-roadmap prerequisite closure has 86 nodes and no node cycle; this does not assert acyclicity of the atlas's aggregate whole-stage graph.

The inherited ES7 text uses five retired EDC.8 prerequisite labels on six
edges. This part consumes the accepted replacements below, following
[EDC.4's retirement map](../packets/EtaleDualityAndPerverseSheaves--EDC.4.json)
and [EDC.7's current targets](../packets/EtaleDualityAndPerverseSheaves--EDC.7.json).
The original ES7 prerequisite spellings must be repointed in that owner's next
authorized reconciliation; they are not new theorems or missing suppliers.
The packet records exact affected consumer IDs, supplier hashes and scope checks.

| Retired EDC.8 suffix | Current EDC.8 suffix | Consumer and hypotheses |
| --- | --- | --- |
| `correspondence-pushforward` | `cohomological-correspondence-pushforward` | Frobenius/Hecke correspondences: the actual proper or cartesian leg hypotheses. |
| `correspondence-composition` | `cohomological-correspondence-composition` | Frobenius/Hecke correspondences: fibre-product composition and proper-leg compact-support functoriality. |
| `correspondence-trace` | `trace-map-and-local-terms` | Geometric/automorphic trace: a trace class, with numerical integration on proper fixed components. |
| `lefschetz-verdier-formula` | `lefschetz-verdier-trace-formula` | Geometric/automorphic trace: proper finite-level D-elliptic scheme and proper correspondence. |
| `similitude-reciprocal-charpoly` | `similitude-charpoly-reciprocity` | Dual-isotypic pairing and Kaiser correction: equal-dimensional dual spaces and invertible Frobenius similitude; no self-duality assumption. |

The following ledger preserves all 24 inherited gaps. The packet contains their full detail, affected node references and stable origin (packet plus array index). A reference to the original ES7 gap ID is retained when present. No gap is discharged just because its target inventory is complete.

| Origin | Proof/interface obligation |
| --- | --- |
| ES5 gap 0 | All-coefficient admissibility supplier |
| ES5 gap 1 | Enriched noncompact Schur and stratum adjunction interfaces |
| ES5 gap 2 | Induced-torus resolution and central-pushout extension beyond current RG2.1.5 |
| ES5 gap 3 | Full equal-characteristic reciprocity |
| ES5 gap 4 | Reusable Lubin–Tate cover interface |
| ES5 gap 5 | All-field central-pushout and quotient-lift owner interfaces |
| ES5 gap 6 | Prototype geometric conditions unavailable at the pins |
| ES5 gap 7 | Abstract discrete-group supplier generality |
| ES5 gap 8 | Enriched duality and its domain |
| ES7 gap 0 | Root/modulus convention comparison |
| ES7 gap 1 | Equal-characteristic z-embedding reduction |
| ES7 gap 2 | Quantitative modification and constant-term closure |
| ES7 gap 3 | O_E classical tower diamond comparison |
| ES7 gap 4 | Order existence and division compactness proof |
| ES7 gap 5 | Building EP orbital/character proof sources |
| ES7 gap 6 | Simple trace formula and selected transfer proofs |
| ES7 gap 7 | D-elliptic moduli proof expansion |
| ES7 gap 8 | Equal-characteristic formal-module and uniformization proof |
| ES7 gap 9 | Corrected graded local chain proof closure |
| ES7 gap 10 | Independent local correspondence and constants |
| ES7 gap 11 | Analytic quotient spectral sequence and Ext degeneration |
| ES7 gap 12 | Equal-characteristic transport and second operation |
| ES7 gap 13 | Supplier carriers and geometric conditions in prototypes |
| ES7 gap 14 | Universal excursion action under coefficient extension |


There are 45 inherited supplier contracts in the packet, each retaining its original packet and request-array index. They cover the enhanced scalar/stratum/duality interfaces; all-coefficient admissibility and early quotient lifting; torus resolutions, central pushouts and central cocycles; full local reciprocity and period-cover transport; HN/constant-term comparisons; the classical towers and Q̄_ℓ representation dictionary; generic function-field adeles and spectral factorization; chain moduli, deformation and rigid cohomology; weights and the analytic quotient spectral sequence; and universal excursion scalar extension. The two SR.1 ordinary-centre requests are recorded as supplied by current upstream, with the enhanced comparison still separate. Requests are imported interface obligations, not a claim that each supplier has no plan. Their exact formulation must be matched before closing the dependent target.

The highest-risk proof work is specific. The all-E quasi-split reduction cannot carry Kaletha's p-adic flat-H¹ conditions unchanged across non-smooth centres: SL_p in characteristic p gives the Kummer obstruction. The all-field rational-central-character target has a separate pushout/quotient-lift route and does not solve that stratum-reduction problem. The HN proof must calculate the compact-support character and switched-kernel convention together. Equal-characteristic agreement still needs the first Lubin–Tate operation as well as Hausberger's Drinfeld operation, plus the local-shtuka transport. General graded chains use Kaiser's amended statements; selected middle-degree concentration uses the independent generic bound, with its hypotheses. The compact-support functional equation and ε-factor product formula are stronger than the current proper constant-coefficient WC.2 endpoint.

The independently reviewed source-issue records remain in the owning packets. No fresh error verdict is issued here. This pass directly read FS IX.4–IX.7, printed/PDF pp. 327–338, in the author-hosted 356-page version with SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Locators above use each owner's recorded edition. The other papers' detailed readings and corrections are inherited from the accepted source manifests: they are not represented as fresh readings of every cited primary proof. The full catalogue and which proofs remain unacquired are in those manifests and the gap ledger. No source passage or chapter-by-chapter source summary is reproduced.

## Source catalogue

These public editions are the owning packets' source identities. Their complete
hashes, access dates and reading boundaries stay with those manifests; the
present pass's fresh reading is distinguished above. Identical URLs are listed
once. The two Kaletha entries deliberately distinguish the preprint and
published pagination.

| Owner and source ID | Source | Edition and locator convention |
| --- | --- | --- |
| ES5: `FS-geometrization` | [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) — Laurent Fargues, Peter Scholze | Author-hosted 356-page preprint; the cited printed/PDF pages agree. The recorded hash distinguishes this copy from the 2026 published pagination. |
| ES5: `Lafforgue-2018` | [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10) — Vincent Lafforgue | arXiv:1209.5352v10, 10 January 2018; J. Amer. Math. Soc. 31 (2018), 719–891. Locators are preprint pages. |
| ES5: `Kaletha-2018` | [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2) — Tasho Kaletha | arXiv:1502.00650v2; published J. Eur. Math. Soc. 20 (2018), 61–101. Locators are preprint pages. |
| ES5: `Fargues-AbelJacobi` | [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf) — Laurent Fargues | Author-hosted preprint cdc.pdf; published Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124. Proposition numbers and pages below are those of this author copy. |
| ES5: `Conrad-finiteness` | [Finiteness theorems for algebraic groups over function fields](https://math.stanford.edu/~conrad/papers/cosetfinite.pdf) — Brian Conrad | Author-hosted 84-page manuscript cosetfinite.pdf; locators use its printed pages. |
| ES5: `Henniart-Vigneras-2025` | [Representations of SL₂(F)](https://msp.org/pjm/2025/335-2/pjm-v335-n2-p02-s.pdf) — Guy Henniart, Marie-France Vignéras | Published open-access Pacific Journal of Mathematics 335(2) (2025), 229–286; DOI 10.2140/pjm.2025.335.229. Locators use printed journal pages. |
| ES5: `Vigneras-2023` | [Representations of p-adic groups over commutative rings](https://ems.press/content/book-chapter-files/33125) — Marie-France Vignéras | Published ICM 2022 proceedings, volume 1 (2023), pp. 332–374. The title uses p-adic for groups over nonarchimedean local fields, including positive characteristic; locators use printed pages. |
| ES7: `Hausberger-2005` | [Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf) — Thomas Hausberger | Ann. Inst. Fourier 55(4) (2005), 1285–1371; journal PDF with cover. French text layer. |
| ES7: `LRS-1993` | [D-elliptic sheaves and the Langlands correspondence](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf) — Gérard Laumon; Michael Rapoport; Ulrich Stuhler | Invent. Math. 113 (1993), 217–338; published journal scan, 124 PDF pages; printed page = PDF page + 215. The owning packet records its OCR and visual-check boundaries. |
| ES7: `Kaiser-erratum` | [Errata for [LRS]](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf) — Christian Kaiser (as identified by the author-hosted source catalogue) | Undated two-page author-hosted erratum. |
| ES7: `Kaletha-2018` | [Rigid inner forms vs isocrystals](https://ems.press/content/serial-article-files/32267) — Tasho Kaletha | J. Eur. Math. Soc. 20 (2018), 61–101; publisher PDF. |
| ES7: `Kottwitz-2014` | [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728) — Robert E. Kottwitz | arXiv:1401.5728 author text; source identified by URL/hash, not an inferred version number. |
| ES7: `SW20` | [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) — Peter Scholze; Jared Weinstein | Author copy dated 27 March 2020. |

## Suggested Lean boundary and acceptance

The [suggested file](../suggested/ExcursionOperatorsAndSpectralAction--ES6.lean) has one light definition on actual Mathlib representations: coevaluation, two group actions (the second dual) and evaluation. It states the trace endpoint and the nonzero-dimension scalar-normalization endpoint, with eight examples checking equal legs, rank one and inversion, dimension zero, the modular obstruction, regular-module translation, quotient transport, detection at the identity basis vector, and ordinary-centre evaluation. It introduces no opaque geometric carrier and no admitted data definition. The full absent-carrier targets remain in the reader and their owning packets. Packaging must reconcile the older ES5/ES7 prototypes to this compact shape.

Acceptance requires the exact eight-stage coverage and import manifests to resolve; preservation of the 63 canonical IDs with their API/tests and no new duplicate node; at most six existing planets on each stage; the coefficient and field-characteristic boundaries above; and preservation of every inherited gap and applicable supplier contract. The packet checker passes with zero errors and warnings. The suggested file elaborates at the prescribed pins with only the ten expected admitted-proposition warnings. Elaboration validates signatures and carrier use; it does not establish the planned geometric theorems.
