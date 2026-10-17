# Prismatic cohomology, Part II: prismatic Dieudonné theory

The target is the contravariant classification of p-divisible groups over a quasi-syntomic ring R by admissible prismatic Dieudonné crystals: BT(R)^op ≃ DM^adm(R). The coefficient object is ℳ_Δ(G)=ℰxt¹(G,O^pris). Frames and windows make admissibility accessible, the perfectoid case gives the base classification, and the abelian-scheme calculation supplies finiteness and the Lie quotient. The finite-group, display and étale comparisons are additional endpoints. These are proposed targets, with proofs to formalize.

The independent review is **needs_changes**. This is a completed target-level pass: all eight layers are planned, none is closed, and fifteen precise gaps are listed below. In particular the unrestricted Zink–Lau proof has not been read directly, and identification of its construction with the proposed display functor remains unverified. The 2025 erratum withdraws the original prismatic proof of that endpoint while preserving its statement.

## Scope, ownership and conventions

The parent PrismaticCohomology supplies prisms, prismatic cohomology, Nygaard filtrations, twists, syntomic complexes and the PR.7 coefficient vector-bundle comparison. The latter is imported once; its former duplicate in this Part II has been removed. AInfCohomology supplies BKF modules and Fargues linear algebra; this roadmap supplies their admissible prismatic interpretation. DerivedDeRhamCohomology supplies the quasi-syntomic algebra and basis. FiniteFlatGroupsAndIntegralPadicHodgeTheory and AbelianSchemesAndArithmeticModuli supply BT groups, duality and the exact lower-tier statements cited at each target.

The Hodge–Tate map and sequence are planned here so that the tier-13 prismatic bundle has no dependency on HodgeTateAndCanonicalSubgroups in tier 18. General displays are also owned here rather than imported from the separate PELModuli bundle. Witt-vector v-descent is an explicit gap rather than a citation to the out-of-order GeometricSatakeAndFusion roadmap. PerfectoidQuotients supplies integral perfectoid algebra, henselization stability and universal perfectoidization; the additional integral v-site remains a target here.

Current upstream ownership was checked against TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to the prescribed pins. AlgebraicVectorBundles covers scheme-module tensor/internal-Hom constructions. Current Tau Ceti also provides ordinary internal Hom on any small ringed site, through `SheafOfModules.ihomObjEquiv` and `ihomCompForgetIso`; Mathlib at the pin provides `SheafOfModules.pullbackPushforwardAdjunction` and `pullbackIso` under continuity, presheaf-adjunction and sheafification hypotheses. These are reused. The relative-site instances, derived internal Ext and Witt-vector v-descent remain obligations. The current principal-adic projective-lifting result assumes completeness of an endomorphism ring and does not replace the general henselian-pair target. Existing Witt topology/Frobenius lemmas are imported algebra, not replanned.

Other routed directions—crystalline local systems, F-smoothness and integral Riemann–Hilbert—remain separate proposed roadmaps; see the packet’s split proposal.

- p is prime. A quasi-syntomic ring is p-complete, has bounded p∞-torsion, and has the required p-complete cotangent amplitude [−1,0]. The small relative site and the big relative site are distinguished in PD.1.
- ℳ_Δ is contravariant: the constant étale group gives (O^pris,φ), while μ_{p∞} gives O^pris{−1}, locally (O^pris,ξ̃φ). The Hodge quotient is Lie(G*)⊗𝒪.
- For perfectoid R, Δ_R=A_inf(R), ker θ=(ξ), and the prism ideal is (ξ̃), with ξ̃=φ(ξ). Scholze–Weinstein takes the naive dual and uses p⁻¹-normalized covariant crystalline Frobenius. Česnavičius–Scholze instead composes with Cartier duality.
- General frames use Fil A+pA⊆Rad(A), with a separately specified scalar ϖ. Complete topologies are hypotheses of individual deformation results. The source’s complete-frame specialization is distinguished from this general convention.
- A u-morphism satisfies φ′₁α=uαφ₁ and α(ϖ)=uϖ′. For the Nygaard-to-Witt morphism use f(ξ̃)=up, with u=F₁(fξ).
- “Display” here means an all-window/3n-display. The formal-group endpoint uses F-nilpotence in the contravariant convention, and window duality converts it to Zink’s V-nilpotent convention.

## Reading the targets

Each numbered entry below gives a statement, hypotheses, proof route, direct prerequisites, source locators, and the API and discriminating tests of each definition or construction. A proof route that reaches a listed gap remains open. The reference list gives public URLs and distinguishes directly read sources from the unread Lau08 attribution. Mathlib global Ext is not silently used as an internal Ext sheaf.

## Layer PD.0: Frames, windows and minuscule Breuil–Kisin modules

General Cais–Lau frames with Fil A+pA in the radical, windows and normal decompositions over henselian pairs; oriented bounded-prism frames; finite-projective minuscule modules, their projective cokernels and the Cais–Lau equivalence; unit-Frobenius and window deformation with explicit complete topologies. Sources: CL17 §2.1, pp. 4–7; AL23 §4.1, pp. 32–39.

### PD.0.1 Frames and u-morphisms of frames

**Definition.** A frame is (A, Fil A, φ, φ₁, ϖ): A is a commutative ring, Fil A an ideal, φ a Frobenius lift modulo p, φ₁ : Fil A → A a φ-semilinear additive map, and ϖ ∈ A with φ(b) = ϖφ₁(b) for b ∈ Fil A. Require Fil A + pA ⊆ Rad(A); write R = A/Fil A. A u-morphism α to a second frame, for u ∈ A′×, is a ring map commuting with Frobenius, preserving Fil, and satisfying φ′₁α = uαφ₁ and α(ϖ) = uϖ′.

**Hypotheses and conventions.**

- p is prime. This is Cais–Lau Definition 2.1.1, with ϖ bundled. No topology is part of a general frame. Completeness, henselianity and continuity are imposed in the individual results that use them.
- If φ₁(Fil A) generates the unit ideal then ϖ is determined by φ and φ₁. Lau 2010 imposes that generation condition; it is not imposed in the general convention here.
- Anschütz–Le Bras Definition 4.1.16 uses a more specific completeness convention. The prismatic applications below satisfy the radical condition.

**Proof route.**

1. Bundle the ring, ideal, semilinear map and scalar with their equations; use Cais–Lau Definition 2.1.1 for the radical condition. A quotient ring and the category of such structures use the existing ring/ideal carriers.
2. u-morphisms compose: a u-morphism followed by a u′-morphism is a (α′(u)·u′)-morphism; identities are 1-morphisms.

**API.**

- `TauCeti.PrismaticDieudonne.Frame` (structure): The frame data with Fil A + pA ⊆ Rad(A), Frobenius-lift and divided-Frobenius equations.
- `TauCeti.PrismaticDieudonne.Frame.quotient` (data): R = A/Fil A, with its quotient map A → R.
- `TauCeti.PrismaticDieudonne.Frame.frob_eq_mul_frobOne` (simp): For b ∈ Fil A, φ(b) = ϖ·φ₁(b).
- `TauCeti.PrismaticDieudonne.Frame.frobOne_smul` (simp): For a ∈ A and b ∈ Fil A, φ₁(ab) = φ(a)φ₁(b).
- `TauCeti.PrismaticDieudonne.Frame.UMorphism` (structure): A u-morphism α : 𝒜 → 𝒜′ for a unit u of A′, as in the statement.
- `TauCeti.PrismaticDieudonne.Frame.UMorphism.comp` (functoriality): The composite of a u-morphism α and a u′-morphism α′ is an (α′(u)u′)-morphism; the identity is a 1-morphism.
- `TauCeti.PrismaticDieudonne.Frame.UMorphism.map_ϖ` (simp): α(ϖ) = u·ϖ′.
- `TauCeti.PrismaticDieudonne.frame_ext` (extensionality): Two u-morphisms with equal underlying ring homomorphisms are equal.

**Checks.**

- `Frame.witt_perfect_field` (computation): For a perfect field k of characteristic p, (W(k), pW(k), F, F/p, p) is a frame with quotient k, and φ₁(p) = 1.
- `Frame.trivial_fil` (degenerate): With Fil A = 0, φ₁ is zero and the scalar ϖ is unrestricted by the divided-Frobenius relation; the frame still requires pA ⊆ Rad(A). For example A = ℤ_p with φ = id works, whereas A = ℤ does not.
- `Frame.not_without_divided_frobenius` (non-example): The pair (ℤ_p, pℤ_p) with φ = id is not a frame with ϖ = p², because φ(p) = p is not divisible by p² in ℤ_p; the relation φ = ϖφ₁ constrains ϖ.
- `Frame.umorphism_comp_unit` (characterisation): The composite of a u-morphism and a u′-morphism satisfies the defining identity with unit α′(u)u′.
- For an oriented prism (A, (d)) the two structures of node prism-frames are frames, with ϖ = φ(d) and ϖ = d respectively.
- The Witt frame of a p-adically complete ring (node PD.7/witt-frame) is a frame with ϖ = p.

**Sources.** [Bryden Cais, Eike Lau](https://arxiv.org/abs/1412.3174), Definition 2.1.1 and Remark 2.1.2, pp. 4–5: general frames with a separately specified scalar and the radical condition; the unit-image condition is optional; [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.1.16 and Remark 4.1.17, p. 32: the complete prismatic specialization and the u-morphism identities.

**Needs.** `PrismaticCohomology:PR.0/delta-frobenius-dictionary`; Mathlib `Ideal`; Mathlib `IsAdicComplete`; Mathlib `Submodule`.

**Planet:** Frame (Lau–Zink).

### PD.0.2 The d-frame and the Nygaard frame of an oriented prism

**Construction.** Let (A, I = (d)) be an oriented bounded prism (A is d-torsion-free). (1) The d-frame A_d = (A, (d), φ, φ₁, φ(d)) has φ₁(dx) = φ(x) for x ∈ A. (2) If d = φ(d′) for some d′ ∈ A, the Nygaard frame A_Nyg = (A, N^{≥1}A, φ, φ₁, d) has Fil = N^{≥1}A = φ^{-1}(dA) and φ₁ = φ/d on N^{≥1}A. In (1) the divided Frobenius is with respect to φ(d); in (2) with respect to d.

**Hypotheses and conventions.**

- (A, (d)) is an oriented bounded prism: a prism with a chosen generator d of I (PrismaticCohomology PR.0). For (2), d lies in the image of φ; this holds for perfect prisms and for the prisms of quasi-regular semiperfectoid rings over a perfect prism.
- N^{≥1}A = φ^{-1}(IA) is the first Nygaard piece of the prism.

**Proof route.**

1. d-torsion-freeness of A makes φ₁ in (1) well defined; φ(dx) = φ(d)φ(x) gives φ = φ(d)φ₁ on (d).
2. For (2), N^{≥1}A = φ^{-1}(dA) and d-torsion-freeness define φ/d; φ₁ is φ-semilinear since φ(ab) = φ(a)φ(b).
3. For a bounded prism A is classically (p,d)-complete, so (p,d) ⊆ Rad(A). If x ∈ N≥1A, then x^p ∈ (p,d), so N≥1A ⊆ Rad(A) too. This verifies both frame radical conditions. No assertion about completeness of an arbitrary quotient is needed (AL23 Example 4.1.18, p. 32).

**API.**

- `TauCeti.PrismaticDieudonne.Frame.ofOrientedPrism` (constructor): The d-frame A_d of an oriented prism.
- `TauCeti.PrismaticDieudonne.Frame.nygaard` (constructor): The Nygaard frame A_Nyg of an oriented prism whose generator is a Frobenius image.
- `TauCeti.PrismaticDieudonne.Frame.ofOrientedPrism_frobOne` (simp): φ₁(d·x) = φ(x) in A_d.
- `TauCeti.PrismaticDieudonne.Frame.nygaard_fil` (characterisation): Fil A_Nyg = φ^{-1}(dA).
- `TauCeti.PrismaticDieudonne.Frame.nygaard_eq_ofOrientedPrism_perfect` (compatibility): For a perfect prism with ξ̃ = φ(ξ), the Nygaard frame for d = ξ̃ equals the ξ-frame A_ξ.
- `TauCeti.PrismaticDieudonne.Frame.nygaard_map` (functoriality): A map of oriented prisms sending generator to generator induces a 1-morphism of Nygaard frames; a change of generator d ↦ ud induces a φ-twisted unit u-morphism.

**Checks.**

- `prismFrame_crystalline` (computation): For (ℤ_p, (p)) the d-frame is (ℤ_p, pℤ_p, id, φ₁(px) = x, p).
- `prismFrame_perfect_nygaard` (compatibility): For (A_inf(𝒪_C), (ξ̃)) the Nygaard frame has filtration ker θ = (ξ) and φ₁(ξx) = φ(x)·φ(ξ)/ξ̃ = φ(x).
- `prismFrame_nygaard_not_d` (non-example): For a quasi-regular semiperfectoid R that is not perfectoid (e.g. R = 𝒪_C/p), N^{≥1}Δ_R ≠ (ξ)Δ_R, so the Nygaard frame differs from the ξ-frame.
- `prismFrame_quotient` (characterisation): The quotient of the Nygaard frame of Δ_R is R, through θ : Δ_R/N^{≥1}Δ_R ≅ R.
- For the Breuil–Kisin prism (W(k)⟦u⟧, (E(u))) the d-frame is the frame of Breuil windows of Lau 2010.
- For a perfect prism (A_inf(S), (ξ̃)) with ξ̃ = φ(ξ), the Nygaard frame has N^{≥1}A = (ξ), and it coincides with the d-frame for d = ξ.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Example 4.1.18, p. 32: attaches to an oriented prism the frame with filtration (d) and divided Frobenius relative to φ(d), and, when d is a Frobenius image, the Nygaard frame with divided Frobenius φ/d.

**Needs.** §PD.0.1; `PrismaticCohomology:PR.0/prism`; `PrismaticCohomology:PR.0/prism-category`; `PrismaticCohomology:PR.0/bounded-prism-complete-flatness`; `PrismaticCohomology:PR.3/nygaard-filtration-qrsp`.

**Planet:** Nygaard frame of an oriented prism.

### PD.0.3 Windows over a frame

**Definition.** A window over a frame 𝒜 = (A, Fil A, φ, φ₁, ϖ) is a quadruple M = (M, Fil M, φ_M, φ_{M,1}) with M a finite projective A-module, Fil M ⊆ M an A-submodule and φ-semilinear maps φ_M : M → M, φ_{M,1} : Fil M → M such that (i) Fil A·M ⊆ Fil M and M/Fil M is a finite projective R-module, R = A/Fil A; (ii) φ_{M,1}(am) = φ₁(a)φ_M(m) for a ∈ Fil A, m ∈ M; (iii) φ_M(m) = ϖ·φ_{M,1}(m) for m ∈ Fil M; (iv) φ_{M,1}(Fil M) + φ_M(M) generates M as an A-module. Morphisms are A-linear maps preserving the filtrations and commuting with φ_M and φ_{M,1}; the category is Win(𝒜).

**Hypotheses and conventions.**

- When the image of φ₁ generates the unit ideal, (iii) follows from (ii) and (iv) says that φ_{M,1}(Fil M) generates M (Anschütz–Le Bras, Remark 4.1.20).

**Proof route.**

1. Bundle the data and the four axioms; morphisms form an additive category with finite direct sums computed componentwise (Anschütz–Le Bras, Definition 4.1.19, p. 32).

**API.**

- `TauCeti.PrismaticDieudonne.Window` (structure): Windows over a frame, as in the statement.
- `TauCeti.PrismaticDieudonne.Window.Hom` (structure): Morphisms of windows.
- `TauCeti.PrismaticDieudonne.Window.unit` (constructor): The unit window (A, Fil A, φ, φ₁).
- `TauCeti.PrismaticDieudonne.Window.directSum` (instance): Finite direct sums of windows, componentwise.
- `TauCeti.PrismaticDieudonne.Window.hodgeQuotient` (projection): The finite projective R-module M/Fil M.
- `TauCeti.PrismaticDieudonne.Window.frobM_eq_smul_frobOneM` (simp): φ_M(m) = ϖφ_{M,1}(m) for m ∈ Fil M.
- `TauCeti.PrismaticDieudonne.window_ext` (extensionality): Two window morphisms are equal if their A-linear maps M→N agree.

**Checks.**

- `Window.unit_rank` (computation): The unit window over A_d has M/Fil M = A/(d) of rank 1 and Fil M = (d).
- `Window.zero` (degenerate): The zero module with zero maps is a window, and it is the zero object of Win(𝒜).
- `Window.generation_needed` (non-example): Over the Witt frame of ℤ_p, (M, Fil M, φ_M, φ_{M,1}) = (ℤ_p, ℤ_p, 0, 0) satisfies axioms (i)–(iii), with zero Hodge quotient, but fails generation (iv).
- `Window.unit_dual` (characterisation): Over every frame, (A, A, ϖφ, φ) is a window with zero Hodge quotient; the unit window (A, Fil A, φ, φ₁) has Hodge quotient R. These distinguish the two rank-one conventions.
- The unit window (A, Fil A, φ, φ₁) works over every frame in the chosen convention: φ(1) = 1 already gives generation.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.1.19 and Remark 4.1.20, p. 32: defines windows over a frame by the four conditions on Fil M, the divided Frobenius, the relation with ϖ and the generation of M, and notes the simplification when φ₁ has unit image; [Eike Lau](https://arxiv.org/abs/0908.4588), Definition 2.3, p. 3: windows over a frame in Lau's formalism, from which the prismatic definition is taken.

**Needs.** §PD.0.1; Mathlib `Module.Projective`; Mathlib `Module.Finite`.

**Planet:** Window over a frame.

### PD.0.4 α-morphisms of windows and base change along u-morphisms of frames

**Construction.** Let α : 𝒜 → 𝒜′ be a u-morphism of frames. An α-morphism of windows f : M → M′ (M ∈ Win(𝒜), M′ ∈ Win(𝒜′)) is an α-linear map with f ∘ φ_M = φ_{M′} ∘ f, f(Fil M) ⊆ Fil M′ and φ_{M′,1} ∘ f = u·(f ∘ φ_{M,1}). There is a functor α^* : Win(𝒜) → Win(𝒜′) with Hom_{Win(𝒜′)}(α^*M, M′) = {α-morphisms M → M′}; concretely α^*M = A′ ⊗_A M, Fil(α^*M) is generated by Fil A′·α^*M and the image of Fil M, and φ, φ₁ on α^*M are the unique maps making m ↦ 1 ⊗ m an α-morphism.

**Hypotheses and conventions.**

- Frames as in node frame; u ∈ A′^×.
- The source windows admit normal decompositions; in particular this holds when (A, Fil A) is henselian, as in the applications here. This avoids deducing projective lifting merely from the radical condition.

**Proof route.**

1. Choose a normal decomposition M = L ⊕ T, Fil M = L ⊕ Fil A·T. Extend its two Frobenius maps, multiplying the divided map by u as required. Independence of the decomposition follows from the α-morphism universal property (AL23 Remark 4.1.21, pp. 32–33; Cais–Lau §2.1, pp. 4–5).
2. The universal property follows from the uniqueness of the extension of semilinear maps along A → A′.
3. Functoriality: (α′ ∘ α)^* ≅ α′^* ∘ α^* for composable u- and u′-morphisms.

**API.**

- `TauCeti.PrismaticDieudonne.Window.AlphaHom` (structure): α-morphisms of windows over a u-morphism α.
- `TauCeti.PrismaticDieudonne.Window.baseChange` (functoriality): The functor α^* : Win(𝒜) → Win(𝒜′).
- `TauCeti.PrismaticDieudonne.Window.baseChange_homEquiv` (universal-property): Hom(α^*M, M′) ≃ AlphaHom α M M′.
- `TauCeti.PrismaticDieudonne.Window.baseChange_comp` (functoriality): (α′ ∘ α)^* ≅ α′^* ∘ α^*.
- `TauCeti.PrismaticDieudonne.Window.baseChange_id` (functoriality): (id)^* ≅ id.
- `TauCeti.PrismaticDieudonne.Window.baseChange_hodgeQuotient` (compatibility): The Hodge quotient of α^*M is R′ ⊗_R (M/Fil M).
- `TauCeti.PrismaticDieudonne.window_base_change_ext` (extensionality): Two α-morphisms are equal if their α-semilinear underlying maps agree.

**Checks.**

- `Window.baseChange_unit` (computation): α^* sends the unit window of 𝒜 to the unit window of 𝒜′ when α is a 1-morphism.
- `Window.baseChange_id_eq` (degenerate): Base change along the identity frame morphism is naturally isomorphic to the identity functor.
- `Window.baseChange_not_naive_fil` (non-example): Fil(α^*M) is not the image of A′ ⊗ Fil M alone: for M the unit window and α : A_d → A′ a 1-morphism with Fil A′ ⊋ α(Fil A)A′, Fil(α^*M) = Fil A′ is strictly larger.
- For α the identity 1-morphism, α^* is the identity and α-morphisms are window morphisms.
- Base change preserves the rank of M and the rank of the Hodge quotient M/Fil M.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 4.1.21, pp. 32–33: defines α-morphisms of windows over a u-morphism of frames and the base change functor α^* by its universal property, with the explicit description of α^*M, its filtration and its Frobenii; [Eike Lau](https://arxiv.org/abs/0908.4588), Definition 2.6 and the paragraphs on base change of windows that follow it, pp. 4–5: u-homomorphisms of frames and base change of windows along them.

**Needs.** §PD.0.1; §PD.0.3; Mathlib `TensorProduct`.

### PD.0.5 Finite projective modules over a henselian pair

**Theorem.** Let (A, J) be a henselian pair. Then M ↦ M/JM induces a bijection between isomorphism classes of finite projective A-modules and of finite projective A/J-modules; moreover every isomorphism M/JM ≅ N/JN of reductions of finite projective A-modules lifts to an isomorphism M ≅ N.

**Hypotheses and conventions.**

- (A, J) henselian in the sense of Mathlib HenselianRing A J (J in the Jacobson radical, and monic polynomials with a simple root modulo J lift it).

**Proof route.**

1. Injectivity: lift an isomorphism by projectivity of M; it is surjective by Nakayama since J lies in the Jacobson radical, and an isomorphism because its source and target are projective of equal rank at every point (Anschütz–Le Bras, Lemma 4.1.27, p. 35).
2. Surjectivity: every finite projective A/J-module lifts to a finite projective A-module along a henselian pair (Stacks, Tag 0D4A, which reduces to lifting idempotents of finite étale algebras along henselian pairs).

**Checks.**

- For A complete local noetherian and J its maximal ideal, every finite projective module is free, matching the lifting of free modules.
- For J locally nilpotent the statement is the classical lifting of projective modules over nilpotent thickenings.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.27, p. 35: states that reduction along a henselian pair is bijective on isomorphism classes of finite projective modules and proves it by lifting isomorphisms and citing the lifting of projective modules; [The Stacks project authors](https://stacks.math.columbia.edu), Tag 0D4A: finite projective modules lift along henselian pairs.

**Needs.** Mathlib `HenselianRing`; Mathlib `Module.Projective`; Mathlib `Module.Finite`; Mathlib `Ideal.jacobson`.

### PD.0.6 Normal decompositions of windows

**Theorem.** Let 𝒜 = (A, Fil A, φ, φ₁, ϖ) be a frame such that every finite projective A/Fil A-module lifts to a finite projective A-module. (1) Every window M over 𝒜 has a normal decomposition: finite projective A-modules L, T with M = L ⊕ T and Fil M = L ⊕ Fil A·T. (2) Given L and T, window structures on (L ⊕ T, L ⊕ Fil A·T) correspond bijectively to φ-semilinear maps Ψ : L ⊕ T → L ⊕ T whose linearisation is an isomorphism, by Ψ(l + t) = φ_{M,1}(l) + φ_M(t), with inverse φ_M(l + t) = ϖΨ(l) + Ψ(t) and φ_{M,1}(l + at) = Ψ(l) + φ₁(a)Ψ(t) for a ∈ Fil A.

**Hypotheses and conventions.**

- The lifting hypothesis holds when (A, Fil A) is henselian (node henselian-projective-lifting), in particular for the Nygaard frame of Δ_R with R quasi-regular semiperfectoid (node PD.1/qrsp-prism-henselian).

**Proof route.**

1. Write S = A/Fil A; S ⊗_A M ≅ M/Fil M ⊕ Q with Q finite projective since M/Fil M is; lift Q to L and M/Fil M to T and lift the decomposition by projectivity; then Fil M = L ⊕ Fil A·T (Anschütz–Le Bras, Proposition 4.1.22, p. 33, after Lau 2010, Remark 2.4 and Lemma 2.5).
2. Given the window, Ψ defined by the formula is semilinear and its linearisation is surjective by axiom (iv), hence an isomorphism of finite projective modules of equal rank; conversely the displayed formulas satisfy axioms (ii)–(iv).

**Checks.**

- For the unit window of A_d, L = 0 and T = A, with Ψ = φ.
- For a window over a perfect field frame (W(k), p, F, F/p), a normal decomposition is a choice of a complement to the Hodge filtration in the classical Dieudonné module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.22 and its proof, p. 33: proves the existence of a decomposition M = L ⊕ T with Fil M = L ⊕ Fil A·T when projectives lift, and the bijection between window structures on it and φ-semilinear automorphisms Ψ; [Eike Lau](https://arxiv.org/abs/0908.4588), Remark 2.4 and Lemma 2.5, p. 4: normal decompositions and their description by an invertible semilinear map.

**Needs.** §PD.0.1; §PD.0.3; §PD.0.5; Mathlib `Module.Projective`.

### PD.0.7 The filtration of a window is the Frobenius preimage of ϖM

**Theorem.** Let 𝒜 be a frame as in node normal-decomposition with ϖ a nonzerodivisor of A and Fil A = φ^{-1}(ϖA). For every window M over 𝒜: (1) Fil M = φ_M^{-1}(ϖM); (2) φ_M induces an injection M/Fil M → M/ϖM, which extends to an injection (A/ϖ) ⊗_{A/Fil A} (M/Fil M) → M/ϖM onto a locally direct summand. In particular a morphism of A-modules between windows commuting with φ_M is a morphism of windows.

**Hypotheses and conventions.**

- ϖ is a nonzerodivisor and Fil A = φ^{-1}(ϖA); projectives lift along A → A/Fil A.

**Proof route.**

1. Fil M ⊆ φ_M^{-1}(ϖM) by axiom (iii).
2. Choose a normal decomposition M = L ⊕ T with Ψ; for x = l + t, φ_M(x) = ϖΨ(l) + Ψ(t), so φ_M(x) ∈ ϖM iff Ψ(t) ∈ ϖM. Localise so that L, T are free; Ψ(t₁), …, Ψ(t_r), Ψ(l₁), …, Ψ(l_s) is a basis of M, so Σφ(aᵢ)Ψ(tᵢ) ∈ ϖM forces φ(aᵢ) ∈ ϖA, i.e. aᵢ ∈ Fil A, hence t ∈ Fil A·T (Anschütz–Le Bras, Lemma 4.1.23, pp. 33–34).
3. The map M/Fil M ≅ T/Fil A·T → M/ϖM is induced by Ψ on T, whose image is part of a basis modulo ϖ; this gives the injective map onto a direct summand.
4. The last sentence: Fil M is determined by φ_M, and φ_{M,1} = φ_M/ϖ on it because ϖ is a nonzerodivisor.

**Checks.**

- For the Nygaard frame of Δ_R (R quasi-regular semiperfectoid) the hypotheses hold with ϖ = ξ̃ and Fil = N^{≥1}Δ_R = φ^{-1}(ξ̃Δ_R).
- The injectivity in (2) is exactly the admissibility condition of node PD.1/prismatic-dieudonne-module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.23 and its proof, pp. 33–34: shows that for frames with nonzerodivisor ϖ and Fil A the preimage of ϖA, the window filtration is the Frobenius preimage of ϖM and that φ_M induces an injection onto a locally direct summand modulo ϖ.

**Needs.** §PD.0.6; §PD.0.3.

### PD.0.8 Minuscule Breuil–Kisin modules over a prism

**Definition.** Let (A, I) be a prism. A Breuil–Kisin module over (A, I) is an F-crystal over the single prism (A, I) in the sense of PrismaticCohomology PR.7 (a finite projective A-module M with an isomorphism φ_M : (φ^*M)[1/I] ≅ M[1/I]). It is minuscule if φ_M maps φ^*M into M and the cokernel of φ_M : φ^*M → M is killed by I. BK_min(A) is the full subcategory of minuscule objects; morphisms are A-linear maps commuting with φ_M.

**Hypotheses and conventions.**

- (A, I) is a bounded prism. The definition follows Anschütz–Le Bras, Definition 4.1.24, which asks M finite projective; for local statements finite projective and finite projective agree after localisation on Spec A.
- Minuscule means effective in the sense of PR.7 with cokernel killed by I; effective alone (cokernel killed by a power of I) is weaker.
- A principal prism ideal does not imply that every finite projective module is free. Freeness is only asserted locally. Naive duality below uses the chosen generator d; an orientation-independent version requires the rank-one twist.
- AL23 Definition 4.1.24 is phrased for finite free modules. The finite-projective convention here is its Zariski-local extension, justified by Cais–Lau Definition 2.1.13 and descent of the localized Frobenius map. This is an explicit generalization, not a claim that AL23 calls every projective module free.

**Proof route.**

1. Define the predicate on PrismaticCohomology PR.7/f-crystal-over-prism: effectivity plus I·coker(φ_M) = 0.
2. Closure under finite direct sums and base change along maps of prisms: the image condition and the annihilation by I are preserved because I·B = J for a map (A, I) → (B, J) (PrismaticCohomology PR.0, rigidity).
3. Duality: M ↦ M^∨ with Frobenius d·(φ_M^∨)^{-1} (d a local generator of I) preserves minuscule objects (after Anschütz–Le Bras, Remark 4.1.11, and AInfCohomology AI.2.4).

**API.**

- `TauCeti.PrismaticDieudonne.IsMinuscule` (characterisation): The predicate on an F-crystal over a prism: φ_M(φ^*M) ⊆ M and I·(M/φ_M(φ^*M)) = 0.
- `TauCeti.PrismaticDieudonne.MinusculeBK` (structure): The full subcategory BK_min(A).
- `TauCeti.PrismaticDieudonne.MinusculeBK.unit` (constructor): The unit object (A, φ).
- `TauCeti.PrismaticDieudonne.MinusculeBK.twist` (constructor): The object (A, d·φ) for a generator d of I.
- `TauCeti.PrismaticDieudonne.MinusculeBK.baseChange` (functoriality): Base change along a map of prisms preserves minuscule objects.
- `TauCeti.PrismaticDieudonne.MinusculeBK.dual` (other): For a fixed generator d, the dual is (M∨, d·(Φ∨)⁻¹), where Φ : φ*M → M is the Frobenius linearization. Changing d multiplies this Frobenius by the same unit; only the twisted formulation is independent of orientation.
- `TauCeti.PrismaticDieudonne.MinusculeBK.toKisinModule` (compatibility): For the Breuil–Kisin prism (𝔖, (E)), BK_min(𝔖) is the category of Kisin modules of E-height ≤ 1 of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.
- `TauCeti.PrismaticDieudonne.minuscule_breuil_kisin_ext` (extensionality): Two minuscule-module morphisms are equal if their A-linear maps agree.
- `TauCeti.PrismaticDieudonne.HasHeightAtMostOne` (compatibility): The light predicate in Suggested.lean records semilinearity and dM contained in the A-span of the image. It is the integral height condition only, not the full minuscule structure; finite projectivity and the localized isomorphism are separate hypotheses.

**Checks.**

- `MinusculeBK.unit_isMinuscule` (computation): (A, φ) is minuscule with cokernel 0.
- `MinusculeBK.twist_cokernel` (computation): (A, d·φ) is minuscule with cokernel A/I.
- `MinusculeBK.square_not_minuscule` (non-example): Over the nonzero prism (W(k),(p)) of a perfect field, (W(k),p²σ) is effective but not minuscule: W(k)/p² is not killed by p.
- `MinusculeBK.zero` (degenerate): The zero module is minuscule and is the zero object of BK_min(A).
- `MinusculeBK.kisin_height_one` (compatibility): Over (W(k)⟦u⟧, (E(u))) a minuscule Breuil–Kisin module is a Kisin module of E-height ≤ 1 in the sense of R07.4, and conversely.
- The unit (A, φ) is minuscule with zero cokernel; its twist (A, d·φ) is minuscule with cokernel A/I.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.1.24, p. 34 (repeated as Definition 5.2.4, p. 78): defines Breuil–Kisin modules over a prism as finite projective modules with a Frobenius isomorphism away from I, and minuscule ones as those with integral image and cokernel killed by I; [Bryden Cais, Eike Lau](https://arxiv.org/abs/1412.3174), Definition 2.1.13 and Lemma 2.1.16, pp. 6–7: finite-projective BT modules and their equivalence with windows; the projectivity of the cokernel is supplied by the prism-specific result.

**Needs.** `PrismaticCohomology:PR.7/f-crystal-over-prism`; `PrismaticCohomology:PR.0/rigidity-prism-ideal`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`; Mathlib `Module.Free`.

**Planet:** Minuscule Breuil–Kisin module.

### PD.0.9 The cokernel of a minuscule Breuil–Kisin module is finite projective over A/I

**Theorem.** Let (M, φ_M) be a minuscule Breuil–Kisin module over a bounded prism (A, I). Then N = coker(φ_M : φ^*M → M) is a finite projective A/I-module, and φ_M : φ^*M → M is injective.

**Hypotheses and conventions.**

- (A, I) bounded prism; M finite projective.

**Proof route.**

1. Injectivity: φ_M becomes an isomorphism after inverting I and φ^*M is I-torsion-free.
2. N has the two-term resolution 0 → φ^*M → M → N → 0 by finite projective A-modules, so it is pseudocoherent over A, hence over A/I.
3. At a closed point of Spec(A/I) with residue field k, k̄ ⊗^L_{A/I} N ≅ W(k̄) ⊗^L_A N is a perfect W(k̄)-complex, hence bounded; so N has finite Tor dimension over A/I and a finite resolution by finite projectives (Stacks, Tag 068W). Projective dimension ≤ 1 over A then forces N projective over A/I (Anschütz–Le Bras, Remark 4.1.25, p. 34).
4. At a closed geometric residue field k̄ of A/I use the canonical δ-map A→W(k̄). The two-term projective resolution gives a bounded derived fibre. Stacks Tag 068W applied to the pseudocoherent A/I-module N gives finite projective dimension. Since pd_A(N)≤1 and I is a Cartier divisor killing N, the local change-of-rings dimension shift gives pd_(A/I)(N)=0. This is the argument of AL23 Remark 4.1.25, p. 34, and uses derived fibres rather than naive fibre dimensions.

**Checks.**

- For (A, d·φ) the cokernel A/I is free of rank one over A/I.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 4.1.25, p. 34: proves that the cokernel of a minuscule Breuil–Kisin module is finite projective over A/I using pseudocoherence, boundedness of a derived fibre and projective dimension one.

**Needs.** §PD.0.8; `PrismaticCohomology:PR.0/bounded-prism-complete-flatness`.

### PD.0.10 Windows over the d-frame are minuscule Breuil–Kisin modules (Cais–Lau)

**Theorem.** Let (A, (d)) be an oriented bounded prism. The functor (M, Fil M, φ_M, φ_{M,1}) ↦ (Fil M, d·φ_{M,1}) is an equivalence Win(A_d) ≃ BK_min(A), where the Frobenius of the target is the linearisation of d·φ_{M,1}|_{Fil M}.

**Hypotheses and conventions.**

- A is d-torsion-free; the d-frame A_d of node prism-frames.
- The pair (A,(d)) is henselian in the bounded-prism setting, so finite projectives over A/d lift, as required by CL17 Lemma 2.1.16.

**Proof route.**

1. A d-frame window gives the BT module N=Fil M with semilinear Frobenius d·φ_{M,1} : N→N. The factor d is needed to land in Fil M. Normal decomposition makes N finite projective and its linearized Frobenius cokernel finite projective over A/d and killed by d (AL23 Proposition 4.1.26, p. 34; CL17 Lemma 2.1.16, p. 7).
2. Conversely write Φ : φ*N → N for the injective Frobenius linearization. There is a unique ψ : N → φ*N with Φψ = d and ψΦ = d. Set M = φ*N and Fil M = ψ(N), which contains dM. Define φ_{M,1}(ψx) = 1⊗x and φ_M(1⊗x) = 1⊗Φ(1⊗x), extended φ-semilinearly. Injectivity of ψ makes the first formula well defined.
3. Apply the projective-cokernel result also to the dual matrix factorization to show M/ψN is finite projective over A/d. The two constructions satisfy the window equations and undo each other naturally.

**Checks.**

- For the Breuil–Kisin prism over 𝒪_K this is the equivalence between Breuil windows and Kisin modules of E-height ≤ 1 used by Lau 2010.
- The unit window of A_d corresponds to (A, d·φ), the minuscule twist.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.26, p. 34: states the equivalence between windows over the frame attached to (A, (d)) and minuscule Breuil–Kisin modules, by Fil M with d times the divided Frobenius, citing Cais–Lau; [Bryden Cais, Eike Lau](https://arxiv.org/abs/1412.3174), Lemma 2.1.16: the equivalence between Breuil windows and minuscule Breuil–Kisin modules.

**Needs.** §PD.0.2; §PD.0.3; §PD.0.8; §PD.0.9; §PD.0.6.

**Planet:** Cais–Lau equivalence.

### PD.0.11 Unit Frobenius modules deform uniquely along nilpotent surjections

**Theorem.** Let A → B be a surjection of bounded prisms with kernel J such that φ is topologically nilpotent on J for the (p, I)-adic topology and (A, J) is henselian. Then base change (M, φ_M) ↦ (M ⊗_A B, φ_M ⊗ B) is an equivalence from unit φ-modules over A (finite projective M with φ_M : φ^*M ≅ M) to unit φ-modules over B.

**Hypotheses and conventions.**

- φ topologically nilpotent on J: φ^j(a) → 0 for every a ∈ J.

**Proof route.**

1. Full faithfulness reduces, via internal Hom, to M^{φ_M = 1} ≅ (M/JM)^{φ_M = 1}: injectivity since a fixed m ∈ JM equals φ_M^j(m) → 0; surjectivity by the convergent correction m + Σ_j φ_M^j(φ_M(m) − m).
2. Essential surjectivity: lift the module by node henselian-projective-lifting and the linearised Frobenius by projectivity; it is an isomorphism because J lies in the Jacobson radical (Anschütz–Le Bras, Lemma 4.1.31, pp. 36–37).

**Checks.**

- For B = A/J with J = 0 the statement is trivial.
- For A = W(k)⟦u⟧ → W(k) (u ↦ 0) with φ(u) = u^p, φ is topologically nilpotent on (u), and unit φ-modules over the Breuil–Kisin prism are base changed from W(k).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.31 and its proof, pp. 36–37: proves that unit φ-modules over A and over A/J are equivalent when φ is topologically nilpotent on J and (A, J) is henselian, by convergent fixed-point corrections and henselian lifting.

**Needs.** §PD.0.5; `PrismaticCohomology:PR.0/prism-category`; `PrismaticCohomology:PR.0/bounded-prism-complete-flatness`.

### PD.0.12 Windows deform along surjections with topologically nilpotent divided Frobenius

**Theorem.** (1) Let (A, (ξ̃)) → (B, (ξ̃)) be a surjection of oriented bounded prisms with ξ̃ = φ(ξ), kernel J ⊆ N^{≥1}A, (A, J) henselian and φ₁ = φ/ξ̃ pointwise topologically nilpotent on J. Then φ₁(J) ⊆ J, ℬ = (B, N^{≥1}A/J, φ, φ₁, ξ̃) is a frame, and base change Win(A_Nyg) → Win(ℬ) is an equivalence. (2) More generally, if α : 𝒜 → 𝒜′ is a 1-morphism of frames whose kernel J lies in Fil A, is stable under φ₁ and on which φ₁ is topologically nilpotent, then α^* : Win(𝒜) → Win(𝒜′) is faithful.

**Hypotheses and conventions.**

- Completeness is (p, ξ̃)-adic; topological nilpotence is pointwise.
- For the topological faithfulness assertion the ambient rings and finite projective modules carry the separated complete adic topology of the cited prismatic frames, the frame maps and Frobenius are continuous, and the kernel topology is stated explicitly. An abstract radical-condition frame has no default topology.

**Proof route.**

1. φ₁(J) ⊆ J since B is ξ̃-torsion-free and φ(j) = ξ̃φ₁(j) (Anschütz–Le Bras, remark before the proof of Lemma 4.1.32, p. 37).
2. Essential surjectivity: normal decompositions exist over A_Nyg (node normal-decomposition with node henselian-projective-lifting) and the invertible Ψ lifts along the henselian surjection.
3. Full faithfulness: for β : M → JN define U(β) = φ_{N,1}^♯ ∘ (1 ⊗ β) ∘ (φ_{M,1}^♯)^{-1}; topological nilpotence of φ₁ on J makes Uⁿ(β) → 0, so a window map vanishing modulo J vanishes, and a module map that is a window map modulo J is corrected to a window map by the convergent series (Anschütz–Le Bras, Lemma 4.1.32, pp. 37–39, following Lau 2010, Theorem 3.2).
4. Part (2) is the injectivity half of the same argument (Anschütz–Le Bras, Remark 4.1.34, p. 39).
5. Perform the successive correction on normal-decomposition coordinates using the partial inverse of the linearized window Frobenius on its specified image. Do not invert φ₁ : φ*Fil M → M on an arbitrary Nygaard filtration: that source need not be projective and the map need not be an isomorphism. The convergent correction is controlled by iterates of the divided Frobenius on the kernel (AL23 pp. 37–39).

**Checks.**

- Applied in node PD.5/essential-surjectivity to Δ_S → B with S = Ā⟨X_j^{1/p^∞}⟩/(X_j) and in node PD.7/breuil-kisin-comparison to the Breuil–Kisin prism.
- The hypothesis cannot be dropped: for the kernel of A_crys(R) → W(R), R = F_p[x^{1/p^∞}]/(x), the divided Frobenius fixes the nonzero element Σ_k p^k[x^{1/p^k}] (the 2025 erratum), so it is not topologically nilpotent there.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.32 and its proof, pp. 37–39; Remark 4.1.34, p. 39: proves that base change of windows along a surjection of oriented prisms with henselian kernel in the first Nygaard piece, on which φ/ξ̃ is topologically nilpotent, is an equivalence, and that such frame maps induce faithful base change; [Eike Lau](https://arxiv.org/abs/0908.4588), Theorem 3.2, p. 6: the deformation theorem for windows along frame maps whose kernel carries a nilpotent divided Frobenius; [Johannes Anschütz, Arthur-César Le Bras](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf), the erratum, p. 1: gives Senger's element of A_crys(F_p[x^{1/p^∞}]/x) fixed by the divided Frobenius in the kernel to W(R), showing that topological nilpotence is a genuine hypothesis.

**Needs.** §PD.0.1; §PD.0.2; §PD.0.3; §PD.0.4; §PD.0.6; §PD.0.5.

**Planet:** Deformation of windows.

## Layer PD.1: Quasi-syntomic coefficients and prismatic Dieudonné crystals

Relative big and small quasi-syntomic sites, sheafified inverse image, coefficient sheaves and their Nygaard quotient; henselianity; admissible prismatic crystals/modules, their stack and filtered forms, and Nygaard windows. Import the vector-bundle equivalence from the parent PR.7 instead of duplicating it. Ringed-site infrastructure is an explicit gap. Source: AL23 §§3.3 and 4.1, pp. 22–23, 27–39.

### PD.1.1 From the absolute prismatic topos to the quasi-syntomic topoi

**Construction.** Let R be a p-complete ring, (R)_Δ its absolute prismatic site (bounded prisms (B, J) with a map R → B/J, flat topology), (R)_QSYN its big quasi-syntomic site (p-complete R-algebras with bounded p^∞-torsion, quasi-syntomic covers) and (R)_qsyn its small quasi-syntomic site. (1) The functor u : (R)_Δ → (R)_QSYN, (B, J) ↦ (R → B/J), is cocontinuous, hence defines a morphism of topoi u : Shv((R)_Δ) → Shv((R)_QSYN) whose inverse image u^{-1}F is the sheafification of ((B,J) ↦ F(B/J)) for sheaves F. (2) Restriction ε_* : Shv((R)_QSYN) → Shv((R)_qsyn) has a left adjoint ε^♮, which need not preserve finite limits. (3) Put v_* = ε_* ∘ u_* and v^♮ = u^{-1} ∘ ε^♮; then Rv_* ≅ Rε_* ∘ Ru_*.

**Hypotheses and conventions.**

- R p-complete; all prisms bounded; set-theoretic cut-off as in PrismaticCohomology PR.1 (the results are independent of it).
- Cocontinuity uses the lifting of quasi-syntomic covers to prisms (Bhatt–Scholze 7.11, PrismaticCohomology PR.2/quasisyntomic-covers-lift-to-prisms).
- The big relative site (R)_QSYN has all p-complete R-algebras with bounded p∞-torsion as objects, with quasi-syntomic covers. Objects are not required to be absolutely quasi-syntomic over ℤ_p. The small site (R)_qsyn has quasi-syntomic R-algebras. The DD.5 absolute QSyn carrier alone does not identify these two sites.

**Proof route.**

1. A quasi-syntomic cover B/J → S lifts to a flat cover (B, J) → (C, JC) of prisms with S → C/JC (PrismaticCohomology PR.2/quasisyntomic-covers-lift-to-prisms); this is the cocontinuity condition (Anschütz–Le Bras, Proposition 3.3.8 and Corollary 3.3.10, pp. 22–23; Stacks, Tag 00XJ).
2. Apply the cocontinuous-functor theorem for topoi to obtain sheafified restriction as inverse image (Stacks Tags 00XJ and 00XL). Mathlib CategoryTheory.Functor.IsCocontinuous records the covering-sieve condition; instantiate the separate adjunction and sheafification machinery rather than crediting the condition with constructing it.
3. ε_* is exact, which gives Rv_* = Rε_* ∘ Ru_* (Anschütz–Le Bras, §4.1, p. 27).
4. For an arbitrary sheaf F, inverse image is the sheaf associated to the presheaf (B,J) ↦ F(B/J), rather than that presheaf without sheafification; Stacks Tags 00XJ and 00XL supply the site-theoretic argument.
5. Closure gap — Ringed-site and internal derived Hom infrastructure: Construct the relative big/small quasi-syntomic sites and ringed coefficient morphisms used here. Reuse Mathlib SheafOfModules.pullbackPushforwardAdjunction and pullbackIso (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean, read at 082e2d3), checking continuity, the presheaf right-adjoint hypothesis and the sheafification instances for these sites, rather than constructing the generic adjunction again. Current Tau Ceti SheafOfModules.ihomObjEquiv and ihomCompForgetIso (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean, read at a91d3aa) already supply ordinary internal Hom on a small site with the stated commutative-ring and sheafification hypotheses. Import this machinery through its small-site presentation, and supply the size/instance comparison, derived internal Rℋom, ℰxt and their base-change/pushforward compatibilities for the coefficient sheaves here. Mathlib CategoryTheory.Abelian.Ext is a global Ext group, not an internal Ext sheaf, and IsCocontinuous is only a condition. The cited supplier statements do not supply these specializations or derived compatibilities. PD.2 functor statements remain targets pending this infrastructure.

**API.**

- `TauCeti.PrismaticDieudonne.prismToQsyn` (constructor): The cocontinuous functor u : (R)_Δ → (R)_QSYN.
- `TauCeti.PrismaticDieudonne.prismToQsyn_isCocontinuous` (instance): u is cocontinuous.
- `TauCeti.PrismaticDieudonne.prismToQsyn_inverseImage_apply` (simp): u^{-1}F is the sheafification of the presheaf (B,J) ↦ F(B/J). This gives a canonical map F(B/J) → (u^{-1}F)(B,J); a sectionwise equality requires proving that this presheaf is already a sheaf.
- `TauCeti.PrismaticDieudonne.smallPushforward` (constructor): v_* = ε_* ∘ u_* : Shv((R)_Δ) → Shv((R)_qsyn).
- `TauCeti.PrismaticDieudonne.smallPushforward_derived` (compatibility): Rv_* ≅ Rε_* ∘ Ru_*.
- `TauCeti.PrismaticDieudonne.prismToQsyn_baseChange` (functoriality): For R → R′ quasi-syntomic, the slice (R)_Δ/h_{R′} ≅ (R′)_Δ and (R)_qsyn/R′ ≅ (R′)_qsyn are compatible with u and v.
- `TauCeti.PrismaticDieudonne.prism_to_qsyn_topoi_ext` (extensionality): Natural transformations of the specified direct-image functors are equal if their components on all site objects agree.

**Checks.**

- `prismToQsyn_perfectoid_final` (computation): For R perfectoid, u(A_inf(R), ker θ̃) = (R → R).
- `prismToQsyn_inverseImage_structureSheaf` (compatibility): u^{-1}𝒪 ≅ Ō_Δ, the reduced prismatic structure sheaf of PrismaticCohomology PR.1.
- `prismToQsyn_small_not_site_morphism` (non-example): ε^♮ need not preserve finite limits: restriction from the big to the small quasi-syntomic site is not a morphism of sites.
- For R perfectoid, u sends the final object (A_inf(R), ker θ̃) of (R)_Δ to R itself.
- u^{-1} of the structure sheaf 𝒪 of (R)_QSYN is the reduced structure sheaf Ō_Δ : (B, J) ↦ B/J.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 3.3.8, Corollary 3.3.10, pp. 22–23; §4.1, p. 27: shows that sending a prism to its reduction defines a cocontinuous functor to the big quasi-syntomic site, hence a morphism of topoi, and introduces the restriction to the small site and the composite v; [The Stacks project authors](https://stacks.math.columbia.edu), Tags 00XJ and 00XL: cocontinuous functors induce morphisms of topoi with exact inverse image.

**Needs.** `PrismaticCohomology:PR.5/absolute-prismatic-site`; `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`; `PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms`; Mathlib `CategoryTheory.Functor.IsCocontinuous`; Mathlib `CategoryTheory.Sheaf`.

### PD.1.2 Exactness of pullback from the quasi-syntomic site to the prismatic site

**Theorem.** Let R be p-complete and 0 → G₁ → G₂ → G₃ → 0 a short exact sequence of abelian sheaves on (R)_QSYN. Then 0 → u^{-1}G₁ → u^{-1}G₂ → u^{-1}G₃ → 0 is exact on (R)_Δ. This applies to short exact sequences of finite locally free commutative group schemes over R, and of p-divisible groups over R, viewed as quasi-syntomic sheaves.

**Hypotheses and conventions.**

- Finite locally free group schemes are syntomic over R, so their sequences are exact on the big quasi-syntomic site.

**Proof route.**

1. u^{-1} is exact because u is cocontinuous (Stacks, Tag 00XL; Anschütz–Le Bras, Corollary 3.3.11, p. 23).
2. Finite locally free group schemes are syntomic, so an fppf-exact sequence of them is exact for the quasi-syntomic topology; for p-divisible groups pass to the colimit over the levels.
3. Use the sheafified restriction in Stacks Tag 00XL. CategoryTheory.Functor.IsCocontinuous at the pin expresses a covering-sieve condition; it does not by itself supply the adjunction or exact inverse-image functor.
4. Closure gap — Ringed-site and internal derived Hom infrastructure: Construct the relative big/small quasi-syntomic sites and ringed coefficient morphisms used here. Reuse Mathlib SheafOfModules.pullbackPushforwardAdjunction and pullbackIso (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean, read at 082e2d3), checking continuity, the presheaf right-adjoint hypothesis and the sheafification instances for these sites, rather than constructing the generic adjunction again. Current Tau Ceti SheafOfModules.ihomObjEquiv and ihomCompForgetIso (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean, read at a91d3aa) already supply ordinary internal Hom on a small site with the stated commutative-ring and sheafification hypotheses. Import this machinery through its small-site presentation, and supply the size/instance comparison, derived internal Rℋom, ℰxt and their base-change/pushforward compatibilities for the coefficient sheaves here. Mathlib CategoryTheory.Abelian.Ext is a global Ext group, not an internal Ext sheaf, and IsCocontinuous is only a condition. The cited supplier statements do not supply these specializations or derived compatibilities. PD.2 functor statements remain targets pending this infrastructure.

**Checks.**

- For 0 → μ_{p^n} → G_m → G_m → 0 (p^n-th power) the pulled-back sequence on (ℤ_p)_Δ is exact.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Corollary 3.3.11, p. 23: deduces exactness of u^{-1} on short exact sequences of abelian quasi-syntomic sheaves from cocontinuity, and applies it to finite locally free group schemes as they are syntomic.

**Needs.** §PD.1.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-level-exactness`.

### PD.1.3 The quasi-syntomic sheaves O^pris, N^{≥1}O^pris and I^pris

**Construction.** For a p-complete ring R put O^pris := v_*O_Δ, N^{≥1}O^pris := v_*N^{≥1}O_Δ and I^pris := v_*I_Δ on (R)_qsyn, where I_Δ ⊆ O_Δ is the ideal sheaf (B, J) ↦ J and N^{≥1}O_Δ = φ^{-1}(I_Δ) its first Nygaard piece. O^pris is a sheaf of δ-rings with Frobenius φ; I^pris is an invertible ideal of O^pris and N^{≥1}O^pris = φ^{-1}(I^pris). For R quasi-syntomic and R′ ∈ (R)_qsyn quasi-regular semiperfectoid, O^pris(R′) = Δ_{R′}, I^pris(R′) = IΔ_{R′} and N^{≥1}O^pris(R′) = N^{≥1}Δ_{R′}; thus O^pris is the sheaf Δ_• of PrismaticCohomology PR.7/quasisyntomic-crystal-comparison.

**Hypotheses and conventions.**

- R quasi-syntomic for the identifications on quasi-regular semiperfectoid objects; the sheaves are defined for every p-complete R.
- Statements that the zero algebra has zero sections concern the indicated ring or module sheaves. They do not assert that every sheaf of sets has an empty set of sections there.

**Proof route.**

1. Pushforward of sheaves of rings is a sheaf of rings; φ on O_Δ induces φ on O^pris.
2. For R′ quasi-regular semiperfectoid, (R′)_Δ has the final object (Δ_{R′}, I) (PrismaticCohomology PR.2/qrsp-prism), so global sections over the slice compute v_*O_Δ(R′) = Δ_{R′}; same for I and N^{≥1} (Anschütz–Le Bras, Definition 4.1.1, p. 27; Proposition 3.4.1).
3. Quasi-regular semiperfectoid rings form a basis of (R)_qsyn (DerivedDeRhamCohomology DD.5/qrsp-unfolding), which identifies O^pris with the sheaf Δ_• unfolded from R′ ↦ Δ_{R′}.

**API.**

- `TauCeti.PrismaticDieudonne.OPris` (constructor): O^pris = v_*O_Δ as a sheaf of rings on (R)_qsyn.
- `TauCeti.PrismaticDieudonne.OPris.frob` (data): The Frobenius φ of O^pris.
- `TauCeti.PrismaticDieudonne.OPris.ideal` (data): I^pris = v_*I_Δ, an invertible ideal sheaf.
- `TauCeti.PrismaticDieudonne.OPris.nygaard` (data): N^{≥1}O^pris = v_*N^{≥1}O_Δ = φ^{-1}(I^pris).
- `TauCeti.PrismaticDieudonne.OPris.eval_qrsp` (characterisation): O^pris(R′) = Δ_{R′} for R′ quasi-regular semiperfectoid, compatibly with φ, I and N^{≥1}.
- `TauCeti.PrismaticDieudonne.OPris.eq_prismaticUnfolding` (compatibility): O^pris equals the sheaf Δ_• of PrismaticCohomology PR.7 on (R)_qsyn.
- `TauCeti.PrismaticDieudonne.OPris.baseChange` (functoriality): Compatibility with restriction along R → R′ quasi-syntomic.
- `TauCeti.PrismaticDieudonne.opris_sheaves_ext` (extensionality): Morphisms from a coefficient sheaf are equal when their components on all quasi-syntomic algebras agree.

**Checks.**

- `OPris.eval_perfectoid` (computation): For R perfectoid, O^pris(R) = A_inf(R) with I^pris(R) = ker θ̃ and N^{≥1}O^pris(R) = ker θ.
- `OPris.eval_charp` (compatibility): For R′ quasi-regular semiperfect, O^pris(R′) = A_crys(R′) (PrismaticCohomology PR.2/qrsp-char-p-acrys).
- `OPris.nygaard_ne_ideal` (non-example): N^{≥1}O^pris ≠ I^pris: on 𝒪_C, N^{≥1} = (ξ) while I = (ξ̃).
- `OPris.zero_ring` (degenerate): For R=0, every sheaf of modules on the resulting empty site is the zero module sheaf; in particular O^pris, I^pris and N≥1O^pris are zero. This statement is about additive coefficients, not empty sets.
- O^pris/p ≇ O/p in general, but O^pris/N^{≥1}O^pris ≅ O (node opris-mod-nygaard).
- For R = F_p-algebra, O^pris(R′) = A_crys(R′) on quasi-regular semiperfect R′ (node PD.4/opris-ocrys).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.1.1, p. 27; Proposition 3.4.1, p. 23: defines O^pris, N^{≥1}O^pris and I^pris as pushforwards of the prismatic structure sheaf, its first Nygaard piece and its ideal sheaf, and computes them on quasi-regular semiperfectoid rings through the initial prism.

**Needs.** §PD.1.1; `PrismaticCohomology:PR.1/prismatic-structure-sheaf`; `PrismaticCohomology:PR.2/qrsp-prism`; `PrismaticCohomology:PR.3/nygaard-filtration-qrsp`; `DerivedDeRhamCohomology:DD.5/qrsp-unfolding`; `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison`.

**Planet:** Prismatic sheaf O^pris.

### PD.1.4 O^pris modulo its first Nygaard piece is the structure sheaf

**Theorem.** For R quasi-syntomic, the quotient sheaf O^pris/N^{≥1}O^pris is isomorphic to the structure sheaf 𝒪 : R′ ↦ R′ of (R)_qsyn, through θ : Δ_{R′}/N^{≥1}Δ_{R′} ≅ R′ on quasi-regular semiperfectoid R′.

**Hypotheses and conventions.**

- R quasi-syntomic.

**Proof route.**

1. It suffices to give the isomorphism functorially on the basis of quasi-regular semiperfectoid R′ (DerivedDeRhamCohomology DD.5/qrsp-refinement).
2. There Δ_{R′}/N^{≥1}Δ_{R′} ≅ R′ is the degree-zero graded piece of the Nygaard filtration (Anschütz–Le Bras, Theorem 3.4.4 and Proposition 4.1.2, pp. 25, 27; PrismaticCohomology PR.3/nygaard-graded-pieces).

**Checks.**

- For R perfectoid: A_inf(R)/ker θ = R.
- For R′ quasi-regular semiperfect: A_crys(R′)/(PD ideal) = R′.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.2, p. 27: identifies the quotient of O^pris by its first Nygaard piece with the structure sheaf of the small quasi-syntomic site by reducing to quasi-regular semiperfectoid rings.

**Needs.** §PD.1.3; `PrismaticCohomology:PR.3/nygaard-graded-pieces`; `DerivedDeRhamCohomology:DD.5/qrsp-refinement`.

### PD.1.5 The prism of a quasi-regular semiperfectoid ring is henselian along ker θ

**Theorem.** For R quasi-regular semiperfectoid with prism (Δ_R, I), the pair (Δ_R, ker(θ : Δ_R → R)) = (Δ_R, N^{≥1}Δ_R) is henselian.

**Hypotheses and conventions.**

- R quasi-regular semiperfectoid; ξ ∈ Δ_R with ξ̃ = φ(ξ) generating I.

**Proof route.**

1. Use classical (p,ξ̃)-completeness of Δ_R and the nilpotence of the Nygaard ideal modulo (p,ξ̃). Put K = (p,ξ̃) + N≥1Δ_R; the quotient K/(p,ξ̃) is locally nilpotent. Henselianity passes first to K and then to its subideal N≥1Δ_R (Stacks Tag 0DYD). This does not require (p,ξ̃) to lie in N≥1Δ_R.
2. Identify ker θ with N≥1Δ_R by the preceding quotient calculation. This is AL23 Lemma 4.1.28, p. 35.

**Checks.**

- For R perfectoid this is henselianity of (A_inf(R), ker θ), which follows from (p, ξ)-adic completeness.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.28, p. 35: proves that the prism of a quasi-regular semiperfectoid ring is henselian along the kernel of θ by reducing modulo (p, ξ) and using that p-th powers of elements of the kernel lie in (p, ξ̃); [The Stacks project authors](https://stacks.math.columbia.edu), Tag 0DYD: henselianity can be checked modulo an ideal along which the ring is complete.

**Needs.** `PrismaticCohomology:PR.2/qrsp-prism`; `PrismaticCohomology:PR.3/nygaard-filtration-qrsp`; Mathlib `HenselianRing`.

### PD.1.6 Prismatic Dieudonné crystals and admissibility

**Definition.** Let R be quasi-syntomic. A prismatic Dieudonné crystal over R is a finite locally free O^pris-module ℳ with a φ-semilinear map φ_ℳ : ℳ → ℳ whose linearisation φ^*ℳ → ℳ has cokernel killed by I^pris. Put Fil ℳ := φ_ℳ^{-1}(I^pris·ℳ). It is admissible if the image ℱ_ℳ of ℳ → ℳ → ℳ/I^pris·ℳ (first map φ_ℳ) is a finite locally free 𝒪-module and the induced map (O^pris/I^pris) ⊗_𝒪 ℱ_ℳ → ℳ/I^pris·ℳ is a monomorphism; here ℳ/I^pris·ℳ is an 𝒪 = O^pris/N^{≥1}O^pris-module through O^pris →φ O^pris → O^pris/I^pris. DM(R) is the category of prismatic Dieudonné crystals with O^pris-linear Frobenius-compatible maps and DM^adm(R) its full subcategory of admissible objects.

**Hypotheses and conventions.**

- R quasi-syntomic; O^pris, I^pris, N^{≥1}O^pris of node opris-sheaves; 𝒪 ≅ O^pris/N^{≥1}O^pris by node opris-mod-nygaard.

**Proof route.**

1. Bundle (ℳ, φ_ℳ) with the cokernel condition (Anschütz–Le Bras, Definition 4.1.5, p. 28).
2. Linearised Frobenius: φ^*ℳ → ℳ is injective and becomes an isomorphism after inverting a local generator ξ̃ of I^pris, because its cokernel is ξ̃-torsion and φ^*ℳ is ξ̃-torsion-free (Remark 4.1.6, p. 29); so (ℳ, φ_ℳ) is a prismatic F-crystal in the sense of PrismaticCohomology PR.7 after node opris-vector-bundles.
3. Snake-lemma form of admissibility: with Q = coker(φ^*Fil ℳ → I^pris·ℳ) and K = coker(φ^*ℳ → ℳ), the snake lemma gives 0 → Q → (O^pris/I^pris) ⊗_𝒪 (ℳ/Fil ℳ) → ℳ/I^pris·ℳ → K → 0, so admissibility holds iff Q = 0 and ℳ/Fil ℳ is finite locally free (Remark 4.1.7, p. 29).
4. For Frobenius injectivity check equal source/target ranks locally using that Frobenius induces the identity on Spec(A/p); p is in the Jacobson radical. After inverting the prism ideal the map is an isomorphism, and I-torsion-freeness of a finite projective module gives injectivity before localization.

**API.**

- `TauCeti.PrismaticDieudonne.DieudonneCrystal` (structure): Prismatic Dieudonné crystals over a quasi-syntomic ring.
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.IsAdmissible` (characterisation): The admissibility predicate of the statement.
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.fil` (data): Fil ℳ = φ_ℳ^{-1}(I^pris·ℳ).
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.frob_linear_injective` (other): The linearised Frobenius is injective and an isomorphism after inverting a local generator of I^pris.
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.isAdmissible_iff_snake` (characterisation): Admissible iff Q = 0 and ℳ/Fil ℳ is finite locally free over 𝒪.
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.toFCrystal` (compatibility): The underlying prismatic F-crystal of PrismaticCohomology PR.7, through the parent-owned node PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison.
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.unit` (constructor): The unit (O^pris, φ).
- `TauCeti.PrismaticDieudonne.DieudonneCrystal.baseChange` (functoriality): Restriction along R → R′ quasi-syntomic, preserving admissibility.
- `TauCeti.PrismaticDieudonne.prismatic_dieudonne_crystal_ext` (extensionality): Two morphisms of crystals are equal if their underlying O^pris-linear sheaf maps agree.

**Checks.**

- `DieudonneCrystal.unit_admissible` (computation): (O^pris, φ) is admissible with ℳ/Fil ℳ ≅ 𝒪.
- `DieudonneCrystal.twist_admissible` (computation): (O^pris, ξ̃φ) (locally, ξ̃ a generator of I^pris) is admissible with Fil = O^pris and Hodge quotient 0.
- `DieudonneCrystal.zero` (degenerate): The zero module is an admissible crystal and the zero object of DM^adm(R).
- `DieudonneCrystal.square_not_dieudonne` (non-example): Over a perfect field k, (W(k), p²σ) is excluded: its Frobenius linearization has cokernel W(k)/p², which is not killed by p.
- The unit (O^pris, φ) is admissible with Fil = N^{≥1}O^pris and ℱ = 𝒪.
- Admissibility is local on (R)_qsyn.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.1.5, Remarks 4.1.6–4.1.7 and Definition 4.1.8, pp. 28–29: defines prismatic Dieudonné crystals by a Frobenius whose linearisation has cokernel killed by I^pris, admissibility by local freeness of the Frobenius image modulo I^pris and injectivity of the induced map, and reformulates admissibility through the snake lemma.

**Needs.** §PD.1.3; §PD.1.4; `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison`; `PrismaticCohomology:PR.7/prismatic-f-crystal`.

**Planet:** Admissible prismatic Dieudonné crystal.

### PD.1.7 Prismatic Dieudonné crystals form a stack

**Theorem.** The fibred categories R ↦ DM(R) and R ↦ DM^adm(R) over quasi-syntomic rings with the quasi-syntomic topology are stacks.

**Hypotheses and conventions.**

- Quasi-syntomic topology on QSyn^op.

**Proof route.**

1. Modules over O^pris and over 𝒪 form stacks on (R)_qsyn by general properties of topoi; the Frobenius and the admissibility conditions are local (Anschütz–Le Bras, Proposition 4.1.9, p. 29).

**Checks.**

- A crystal over R is determined by its restrictions to a quasi-regular semiperfectoid cover R → R′ with descent data over R′ ⊗̂_R R′.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.9, p. 29: states that usual and admissible prismatic Dieudonné crystals form a stack for the quasi-syntomic topology, from the stack property of modules in a topos.

**Needs.** §PD.1.6; `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`.

### PD.1.8 Prismatic Dieudonné modules over a quasi-regular semiperfectoid ring

**Definition.** Let R be quasi-regular semiperfectoid with prism (Δ_R, I) (I principal) and θ : Δ_R/N^{≥1}Δ_R ≅ R. A prismatic Dieudonné module over R is a finite projective Δ_R-module M with a φ-semilinear φ_M : M → M whose linearisation φ^*M → M has cokernel killed by I. It is admissible if the image F_M of M → M/IM (first φ_M) is a finite projective R-module and Δ_R/I ⊗_R F_M → M/IM is injective. DM(R) (resp. DM^adm(R)) is the category of (admissible) prismatic Dieudonné modules; the notation agrees with that for crystals through node crystals-modules-qrsp.

**Hypotheses and conventions.**

- R quasi-regular semiperfectoid; R is a quotient of a perfectoid ring, so I = (ξ̃) is principal.

**Proof route.**

1. Bundle the data (Anschütz–Le Bras, Definitions 4.1.10 and 4.1.15, pp. 29, 31).
2. φ^*M → M is injective and an isomorphism after inverting ξ̃, and its cokernel is a finite projective Δ_R/I-module (Remark 4.1.11 with node PD.0/minuscule-cokernel-projective).
3. For R perfectoid, (Δ_R, I) = (A_inf(R), (ξ̃)) and DM(R) is the category of minuscule Breuil–Kisin–Fargues modules (AInfCohomology AI.2/minuscule-prismatic-dictionary).

**API.**

- `TauCeti.PrismaticDieudonne.DieudonneModule` (structure): Prismatic Dieudonné modules over a quasi-regular semiperfectoid ring.
- `TauCeti.PrismaticDieudonne.DieudonneModule.IsAdmissible` (characterisation): The admissibility predicate.
- `TauCeti.PrismaticDieudonne.DieudonneModule.fil` (data): Fil M = φ_M^{-1}(IM).
- `TauCeti.PrismaticDieudonne.DieudonneModule.toMinusculeBK` (compatibility): The underlying minuscule Breuil–Kisin module over (Δ_R, I) (node PD.0/minuscule-breuil-kisin).
- `TauCeti.PrismaticDieudonne.DieudonneModule.baseChange` (functoriality): Base change along R → R′ of quasi-regular semiperfectoid rings.
- `TauCeti.PrismaticDieudonne.DieudonneModule.eq_minusculeBKF` (compatibility): For R perfectoid, DM(R) is the category of minuscule BKF modules of AInfCohomology AI.2.
- `TauCeti.PrismaticDieudonne.prismatic_dieudonne_module_ext` (extensionality): Two morphisms of modules are equal if their Δ_R-linear maps agree.

**Checks.**

- `DieudonneModule.unit` (computation): (Δ_R, φ) is admissible with F_M = R.
- `DieudonneModule.perfect_field` (compatibility): For R = k a perfect field, Δ_k = W(k), I = (p), and DM(k) is the category of finite free W(k)-modules M with pM ⊆ φ_M(φ^*M) ⊆ M, i.e. contravariant Dieudonné modules with V = pφ_M^{-1}.
- `DieudonneModule.zero` (degenerate): The zero module is admissible.
- `DieudonneModule.square_not_module` (non-example): Over a perfect field k, (W(k), p²σ) is excluded: its Frobenius linearization has cokernel W(k)/p², which is not killed by p.
- The deliberate overloading of DM(R) for crystals and modules is justified by node crystals-modules-qrsp; statements such as Theorem 4.9.5 of the source speak of crystals where modules are meant (source issue E1).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definitions 4.1.10 and 4.1.15, Remark 4.1.11, pp. 29–31: defines prismatic Dieudonné modules and admissibility over a quasi-regular semiperfectoid ring with its initial prism, and notes that over a perfectoid ring they are minuscule Breuil–Kisin–Fargues modules.

**Needs.** `PrismaticCohomology:PR.2/qrsp-prism`; `PrismaticCohomology:PR.3/nygaard-filtration-qrsp`; §PD.0.9; §PD.0.8; `AInfCohomology:AI.2/bkf-module`.

**Planet:** Prismatic Dieudonné module.

### PD.1.9 Admissible prismatic Dieudonné modules are windows over the Nygaard frame

**Theorem.** Let R be quasi-regular semiperfectoid and ξ̃ = φ(ξ) a generator of I, giving the Nygaard frame Δ_{R,Nyg} = (Δ_R, N^{≥1}Δ_R, φ, φ/ξ̃, ξ̃). (1) The forgetful functor Win(Δ_{R,Nyg}) → DM(R), (M, Fil M, φ_M, φ_{M,1}) ↦ (M, φ_M), is fully faithful with essential image DM^adm(R); its inverse sends (M, φ_M) to (M, φ_M^{-1}(IM), φ_M, φ_M/ξ̃). (2) For a quasi-syntomic map R → R′ of quasi-regular semiperfectoid rings and M′ = Δ_{R′} ⊗_{Δ_R} M, φ_{M′}^{-1}(IM′) = N^{≥1}Δ_{R′}·M′ + image of Δ_{R′} ⊗ φ_M^{-1}(IM).

**Hypotheses and conventions.**

- R, R′ quasi-regular semiperfectoid; the Nygaard frame of node PD.0/prism-frames.

**Proof route.**

1. Δ_{R,Nyg} satisfies the hypotheses of node PD.0/window-filtration-frobenius-preimage: ξ̃ is a nonzerodivisor, N^{≥1}Δ_R = φ^{-1}(ξ̃Δ_R), and projectives lift along Δ_R → R because (Δ_R, N^{≥1}Δ_R) is henselian (node qrsp-prism-henselian).
2. Hence a window has Fil M = φ_M^{-1}(ξ̃M), which gives full faithfulness, and the image of φ_M modulo I is M/Fil M embedded as a direct summand: this is admissibility.
3. Conversely, for admissible (M, φ_M) the quadruple (M, φ_M^{-1}(IM), φ_M, φ_M/ξ̃) is a window; generation of M by φ_{M,1}(Fil M) follows from admissibility and the snake-lemma reformulation (Anschütz–Le Bras, Proposition 4.1.29, p. 35).
4. Part (2) follows from (1) and base change of windows (node PD.0/window-base-change), whose filtration is generated by the image of Fil M and Fil Δ_{R′}·M′ (Anschütz–Le Bras, Lemma 4.1.14, p. 30).

**Checks.**

- For R = k a perfect field, a window over (W(k), pW(k), φ, φ/p) is a Dieudonné module with its Hodge filtration, and every prismatic Dieudonné module over k is admissible.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.29, p. 35; Lemma 4.1.14, p. 30: shows that windows over the Nygaard frame of Δ_R are exactly the admissible prismatic Dieudonné modules, with filtration the Frobenius preimage of IM, and deduces the base-change formula for that filtration.

**Needs.** §PD.1.8; §PD.0.2; §PD.0.3; §PD.0.7; §PD.0.4; §PD.1.5.

**Planet:** Admissible modules as Nygaard windows.

### PD.1.10 Over a perfectoid ring every prismatic Dieudonné module is admissible

**Theorem.** Let R be perfectoid, so (Δ_R, I) = (A_inf(R), (ξ̃)) with ξ̃ = φ(ξ) and N^{≥1}A_inf(R) = (ξ). Then DM^adm(R) = DM(R), and both equal the category of minuscule Breuil–Kisin–Fargues modules over A_inf(R) with respect to ξ̃.

**Hypotheses and conventions.**

- R perfectoid in the sense of Bhatt–Morrow–Scholze (integral perfectoid).

**Proof route.**

1. Since N^{≥1}A_inf(R) = (ξ), the Nygaard frame is the ξ-frame: Δ_{R,Nyg} = Δ_{R,ξ} (node PD.0/prism-frames).
2. By node nygaard-windows, DM^adm(R) ≃ Win(Δ_{R,ξ}); by the Cais–Lau equivalence (node PD.0/cais-lau-equivalence) Win(Δ_{R,ξ}) ≃ BK_min(A_inf(R)) for the ideal (ξ), i.e. DM(R′) for R′ = A_inf(R)/ξ; base change along the bijective φ identifies DM(R′) with DM(R).
3. The composite DM^adm(R) → DM(R) is the inclusion, so it is an equivalence (Anschütz–Le Bras, proof of Proposition 4.1.12, p. 36).

**Checks.**

- For R = 𝒪_C, every minuscule BKF module (M, φ_M) has M/φ_M^{-1}(ξ̃M) finite free over 𝒪_C.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.12, p. 30, with proof on p. 36: proves that every prismatic Dieudonné module over a perfectoid ring is admissible by identifying the Nygaard frame with the ξ-frame and composing the window equivalences.

**Needs.** §PD.1.9; §PD.0.10; §PD.1.8; `PrismaticCohomology:PR.0/ainf-prism`; `AInfCohomology:AI.2/bkf-module`.

### PD.1.11 Crystals and modules agree over a quasi-regular semiperfectoid ring

**Theorem.** For R quasi-regular semiperfectoid, evaluation on the initial prism, (ℳ, φ_ℳ) ↦ ((v^*ℳ)(Δ_R, I), v^*φ_ℳ), is an equivalence from prismatic Dieudonné crystals over R to prismatic Dieudonné modules over R, with quasi-inverse (M, φ_M) ↦ (M ⊗_{Δ_R} O^pris, φ_M ⊗ φ); it restricts to an equivalence between admissible crystals and admissible modules.

**Hypotheses and conventions.**

- R quasi-regular semiperfectoid.

**Proof route.**

1. Without admissibility the equivalence is node opris-vector-bundles composed with evaluation at the final object of (R)_Δ.
2. Admissible modules give admissible crystals: by node nygaard-windows (2), for every quasi-regular semiperfectoid R′ over R the Hodge quotient of the base change is R′ ⊗_R (M/φ_M^{-1}(IM)), so ℳ/Fil ℳ ≅ 𝒪 ⊗_R (M/Fil M) is finite locally free.
3. Admissible crystals give admissible modules: the sequence 0 → Γ(Fil ℳ) → Γ(ℳ) → Γ(ℳ/Fil ℳ) is right exact by Nakayama after base change to perfect fields k, where every prismatic Dieudonné module is admissible (Anschütz–Le Bras, Proposition 4.1.13 and its proof, pp. 30–31).

**Checks.**

- For R perfectoid, a crystal is a minuscule BKF module tensored up to O^pris.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.1.13 and its proof, pp. 30–31: proves that evaluation on the initial prism is an equivalence between prismatic Dieudonné crystals and modules over a quasi-regular semiperfectoid ring, respecting admissibility, using the filtration base-change lemma and reduction to perfect fields.

**Needs.** `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison`; §PD.1.6; §PD.1.8; §PD.1.9; §PD.1.3.

### PD.1.12 Filtered prismatic Dieudonné crystals

**Definition.** A filtered prismatic Dieudonné crystal over a quasi-syntomic ring R is a triple (ℳ, Fil ℳ, φ_ℳ) with ℳ a finite locally free O^pris-module, Fil ℳ ⊆ ℳ an O^pris-submodule and φ_ℳ : ℳ → ℳ φ-semilinear such that (1) φ_ℳ(Fil ℳ) ⊆ I^pris·ℳ; (2) N^{≥1}O^pris·ℳ ⊆ Fil ℳ and ℳ/Fil ℳ is a finite locally free 𝒪-module; (3) φ_ℳ(Fil ℳ) generates I^pris·ℳ as an O^pris-module. DF(R) is their category. The forgetful functor DF(R) → DM(R) is fully faithful with essential image DM^adm(R), and its inverse sets Fil ℳ = φ_ℳ^{-1}(I^pris·ℳ).

**Hypotheses and conventions.**

- R quasi-syntomic. This is the formulation of the earlier versions of the source; it is equivalent to admissibility.

**Proof route.**

1. Locally on (R)_qsyn reduce to R quasi-regular semiperfectoid and modules (node crystals-modules-qrsp).
2. There a filtered object is a window over the Nygaard frame with φ_{M,1} = φ_M/ξ̃: (1) is φ_M(Fil) ⊆ ξ̃M, (2) is the Hodge condition, (3) is the generation axiom; node nygaard-windows identifies windows with admissible modules and shows that Fil is forced to be φ_M^{-1}(IM) (Anschütz–Le Bras, Remark 1.3.3, p. 6; Lemma 4.1.23).

**API.**

- `TauCeti.PrismaticDieudonne.FilteredDieudonneCrystal` (structure): Filtered prismatic Dieudonné crystals.
- `TauCeti.PrismaticDieudonne.FilteredDieudonneCrystal.forget` (projection): The forgetful functor DF(R) → DM(R).
- `TauCeti.PrismaticDieudonne.FilteredDieudonneCrystal.forget_fullyFaithful` (characterisation): The forgetful functor is fully faithful.
- `TauCeti.PrismaticDieudonne.FilteredDieudonneCrystal.forget_essImage` (characterisation): Its essential image is DM^adm(R).
- `TauCeti.PrismaticDieudonne.FilteredDieudonneCrystal.fil_eq` (extensionality): Two filtered-crystal morphisms are equal if their underlying O^pris-linear sheaf maps agree.

**Checks.**

- `FilteredDieudonneCrystal.unit` (computation): (O^pris, N^{≥1}O^pris, φ) is a filtered crystal with Hodge quotient 𝒪.
- `FilteredDieudonneCrystal.zero` (degenerate): The zero object is filtered.
- `FilteredDieudonneCrystal.wrong_fil` (non-example): (O^pris, O^pris, φ) fails (1): φ(1) = 1 ∉ I^pris.
- `FilteredDieudonneCrystal.fil_unique` (characterisation): If (ℳ, Fil, φ) and (ℳ, Fil′, φ) are both filtered then Fil = Fil′.
- The unit (O^pris, N^{≥1}O^pris, φ) is filtered.
- The forgetful functor DF(R) → DM(R) is an equivalence when R is perfectoid or a complete regular local ring with perfect residue field (nodes admissible-over-perfectoid and PD.7/regular-automatic-admissibility).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 1.3.3, p. 6; Definitions 4.1.1–4.1.2, pp. 27–28: filtered Dieudonné data and recovery of the filtration from an admissible Frobenius.

**Needs.** §PD.1.6; §PD.1.9; §PD.1.11.

### PD.1.13 Faithfulness of base change of prismatic Dieudonné modules

**Theorem.** Let R → R′ be a map of quasi-regular semiperfectoid rings such that J = ker(Δ_R → Δ_{R′}) lies in N^{≥1}Δ_R, is stable under φ₁ = φ/ξ̃ and φ₁ is topologically nilpotent on J (for one, equivalently every, generator ξ̃ of I). Then base change DM(R) → DM(R′) and DM^adm(R) → DM^adm(R′) are faithful.

**Hypotheses and conventions.**

- As stated; topological nilpotence for the (p, ξ̃)-adic topology.

**Proof route.**

1. For admissible modules use node nygaard-windows and node PD.0/window-deformation (2).
2. For general modules, the same iteration U(β) = φ_N ∘ (1 ⊗ β) ∘ φ_M^{-1} converges to 0 on maps M → JN, using that φ_M^♯ has cokernel killed by ξ̃ (Anschütz–Le Bras, Lemma 4.1.33, p. 39).

**Checks.**

- Applied to Δ_S → Δ_{S̃} in the essential-surjectivity argument (node PD.5/essential-surjectivity).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.1.33, p. 39: states faithfulness of base change of usual and admissible prismatic Dieudonné modules along maps whose kernel lies in the first Nygaard piece with topologically nilpotent divided Frobenius.

**Needs.** §PD.1.8; §PD.1.9; §PD.0.12.

## Layer PD.2: The prismatic Dieudonné functor

Functorial resolution and derived Yoneda; the contravariant internal-Ext Dieudonné functor and its pushforward and Tate-module descriptions. Construct the needed internal Ext sheaves rather than identify them with Mathlib global Ext. Compatible infinite quasi-syntomic root covers are a recorded gap. Source: AL23 §§4.2 and 4.4, pp. 39–43, 52–53.

### PD.2.1 A functorial resolution of an abelian group object of a topos

**Construction.** Let G be an abelian group object of a topos 𝔛. There is a resolution C(G)_• = (… → ℤ[X₂] → ℤ[X₁] → ℤ[X₀]) → G, functorial in G, in which each X_i is a finite disjoint union of finite products of copies of G and ℤ[X] is the free abelian sheaf on X. Combined with node derived-yoneda, it computes RHom(G, F) by a spectral sequence with E₁-terms RΓ(G^{×n}, F).

**Hypotheses and conventions.**

- 𝔛 a Grothendieck topos (here the prismatic or quasi-syntomic topos).

**Proof route.**

1. Construct it as in Breen's and Deligne's resolutions: the terms of the standard Mac Lane-type resolution of an abelian group are free abelian groups on finite products of the group, natural in the group, and the construction is compatible with sheafification (Anschütz–Le Bras, Theorem 4.4.1, p. 52, citing Scholze's lectures on condensed mathematics and Breen).
2. Use E₁^{a,b} = H^b(X_a,F); since X_a is already a finite coproduct, its cohomology includes the corresponding finite product of component cohomologies. No second unexplained direct sum is needed.

**API.**

- `TauCeti.PrismaticDieudonne.functorialResolution` (constructor): The resolution C(G)_• → G.
- `TauCeti.PrismaticDieudonne.functorialResolution_term` (characterisation): Each term is ℤ[X_i] with X_i a finite coproduct of finite powers of G.
- `TauCeti.PrismaticDieudonne.functorialResolution_natural` (functoriality): Naturality in G and compatibility with pullback of topoi.
- `TauCeti.PrismaticDieudonne.ext_spectralSequence` (other): The spectral sequence E₁^{a,b} = H^b(X_a, F) ⇒ Ext^{a+b}(G, F).

**Checks.**

- `functorialResolution_zero` (degenerate): For the zero group, each finite stage X_a of the functorial resolution is a finite disjoint union of terminal objects, with the number of components prescribed by that stage; it need not be a single terminal object. The augmented complex still resolves zero.
- `functorialResolution_low_terms` (computation): In low degrees X₀ = G and X₁ = G × G, with ℤ[G × G] → ℤ[G] sending [(a, b)] ↦ [a + b] − [a] − [b].
- `functorialResolution_ext0` (characterisation): The resolution recovers Hom(G, F) as the kernel of H⁰(G, F) → H⁰(G × G, F), f ↦ (a, b) ↦ f(a + b) − f(a) − f(b).
- For G = 0 every X_i is a point and the resolution computes Ext(0, F) = 0.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.4.1, p. 52: gives a natural functorial resolution of an abelian group object of a topos by free abelian groups on finite disjoint unions of products of copies of the object.

**Needs.** Mathlib `CategoryTheory.Sheaf`; Mathlib `CategoryTheory.Abelian.Ext`.

### PD.2.2 The derived Yoneda lemma in a topos

**Lemma.** For an object X of a topos 𝔛 and an abelian sheaf F, RΓ(X, F) ≅ RHom_{Ab(𝔛)}(ℤ[X], F).

**Hypotheses and conventions.**

- 𝔛 a topos; ℤ[X] the free abelian sheaf on X.

**Proof route.**

1. Hom(ℤ[X], F) = F(X) is the Yoneda lemma; derive by injective resolutions of F, since ℤ[X] ↦ Hom(ℤ[X], −) is exact on injectives (Anschütz–Le Bras, Lemma 4.4.2, p. 52).

**Checks.**

- X final: RHom(ℤ, F) = RΓ(𝔛, F).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.4.2, p. 52: identifies the cohomology of an object with derived maps out of the free abelian sheaf it generates.

**Needs.** Mathlib `CategoryTheory.Sheaf`; Mathlib `CategoryTheory.Abelian.Ext`.

### PD.2.3 The prismatic Dieudonné functor

**Construction.** Let R be quasi-syntomic and G a p-divisible group over R, viewed as a sheaf on (R)_qsyn. The prismatic Dieudonné crystal of G is ℳ_Δ(G) := ℰxt¹_{(R)_qsyn}(G, O^pris), with φ_{ℳ_Δ(G)} induced by φ on O^pris. For R quasi-regular semiperfectoid, its prismatic Dieudonné module is M_Δ(G) := Ext¹_{(R)_qsyn}(G, O^pris) ≅ Ext¹_{(R)_Δ}(u^{-1}G, O_Δ), with Frobenius induced by φ. Both are contravariant in G; ℳ_Δ is compatible with base change in R. Nodes PD.4/admissibility-and-lie and PD.4/pdiv-locally-free show that they land in DM^adm(R).

**Hypotheses and conventions.**

- p-divisible groups are those of AbelianSchemesAndArithmeticModuli A4.5 (the carrier used by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1); they are syntomic sheaves on (R)_qsyn.

**Proof route.**

1. ℰxt¹ of abelian sheaves on the small quasi-syntomic site; φ acts through the coefficient sheaf (Anschütz–Le Bras, Definitions 4.2.1 and 4.2.8, pp. 39, 42).
2. Base change: ℰxt¹ commutes with restriction to slices (R)_qsyn/R′ ≅ (R′)_qsyn.
3. The module version is the value of ℳ_Δ(G) on R, since R is then final in its own small site and the Ext-sheaf is a crystal (node pushforward-description).
4. Closure gap — Ringed-site and internal derived Hom infrastructure: Construct the relative big/small quasi-syntomic sites and ringed coefficient morphisms used here. Reuse Mathlib SheafOfModules.pullbackPushforwardAdjunction and pullbackIso (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean, read at 082e2d3), checking continuity, the presheaf right-adjoint hypothesis and the sheafification instances for these sites, rather than constructing the generic adjunction again. Current Tau Ceti SheafOfModules.ihomObjEquiv and ihomCompForgetIso (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean, read at a91d3aa) already supply ordinary internal Hom on a small site with the stated commutative-ring and sheafification hypotheses. Import this machinery through its small-site presentation, and supply the size/instance comparison, derived internal Rℋom, ℰxt and their base-change/pushforward compatibilities for the coefficient sheaves here. Mathlib CategoryTheory.Abelian.Ext is a global Ext group, not an internal Ext sheaf, and IsCocontinuous is only a condition. The cited supplier statements do not supply these specializations or derived compatibilities. PD.2 functor statements remain targets pending this infrastructure.

**API.**

- `TauCeti.PrismaticDieudonne.dieudonneCrystal` (constructor): ℳ_Δ(G) = ℰxt¹(G, O^pris) with its Frobenius.
- `TauCeti.PrismaticDieudonne.dieudonneModule` (constructor): M_Δ(G) = Ext¹(G, O^pris) over a quasi-regular semiperfectoid ring.
- `TauCeti.PrismaticDieudonne.dieudonneCrystal_map` (functoriality): A homomorphism f : G → H induces ℳ_Δ(f) : ℳ_Δ(H) → ℳ_Δ(G), with ℳ_Δ(id) = id and ℳ_Δ(g ∘ f) = ℳ_Δ(f) ∘ ℳ_Δ(g).
- `TauCeti.PrismaticDieudonne.dieudonneCrystal_baseChange` (functoriality): ℳ_Δ(G_{R′}) ≅ ℳ_Δ(G)|_{R′} for R → R′ quasi-syntomic.
- `TauCeti.PrismaticDieudonne.dieudonneCrystal_eval_qrsp` (compatibility): For R quasi-regular semiperfectoid, ℳ_Δ(G)(R) = M_Δ(G) and ℳ_Δ(G) ≅ M_Δ(G) ⊗_{Δ_R} O^pris.
- `TauCeti.PrismaticDieudonne.dieudonneCrystal_frob` (simp): φ_{ℳ_Δ(G)} is ℰxt¹(G, φ) composed with the identification of the twisted Ext.
- `TauCeti.PrismaticDieudonne.dieudonne_functor_ext` (extensionality): Natural transformations out of the contravariant Dieudonné functor are determined by their components on every p-divisible group.

**Checks.**

- `dieudonneCrystal_etale` (computation): ℳ_Δ(ℚ_p/ℤ_p) ≅ (O^pris, φ).
- `dieudonneCrystal_mu` (computation): Over a prism (B, (ξ̃)) above (ℤ_p⟦q − 1⟧, ([p]_q)), ℳ_Δ(μ_{p^∞}) is free of rank one with Frobenius ξ̃φ on a basis.
- `dieudonneCrystal_zero` (degenerate): ℳ_Δ(0) = 0.
- `dieudonneCrystal_not_hom` (non-example): ℋom(G, O^pris) = 0 for every p-divisible group G (node hom-vanishing); defining the functor with ℋom instead of ℰxt¹ gives zero.
- `dieudonneCrystal_perfect_field` (compatibility): For R = k perfect, M_Δ(G) is the classical contravariant Dieudonné module (node PD.4/classical-comparison).
- ℳ_Δ(ℚ_p/ℤ_p) ≅ O^pris with φ (node PD.5/etale-dieudonne).
- ℳ_Δ(μ_{p^∞}) ≅ O^pris{−1}, locally (O^pris, ξ̃φ) (node PD.5/bk-twist-trivialisation).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definitions 4.2.1 and 4.2.8, pp. 39 and 42: defines the prismatic Dieudonné crystal of a p-divisible group as the first Ext-sheaf into O^pris on the small quasi-syntomic site, and its global version over a quasi-regular semiperfectoid ring, with the Frobenius induced from O^pris.

**Needs.** §PD.1.3; §PD.1.1; §PD.1.2; `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`; Mathlib `CategoryTheory.Abelian.Ext`.

**Planet:** Prismatic Dieudonné functor.

### PD.2.4 No homomorphisms from a p-divisible group to a derived p-complete sheaf

**Theorem.** Let G be a p-divisible group over a p-complete ring R. Then Hom(G, Q) = 0 for every derived p-complete abelian sheaf Q on (R)_QSYN or (R)_qsyn; in particular Hom(G, O^pris) = 0 and Hom(G, N^{≥1}O^pris) = 0.

**Hypotheses and conventions.**

- G[p^n] finite locally free, hence syntomic; derived p-completeness of Q.

**Proof route.**

1. Multiplication by p is surjective on G in the syntomic topology, so the derived p-completion of G is T_pG[1]; maps from a complex in degrees ≤ −1 to one in degrees ≥ 0 vanish (Anschütz–Le Bras, Remark 4.2.2, p. 40).

**Checks.**

- Hom(ℚ_p/ℤ_p, O^pris) = 0 since O^pris has no nonzero p-divisible elements.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 4.2.2, p. 40: shows that p-divisible groups admit no nonzero maps to derived p-complete quasi-syntomic sheaves, because their derived p-completion is the Tate module in degree −1.

**Needs.** §PD.2.3; §PD.1.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-level-exactness`.

### PD.2.5 The prismatic Dieudonné crystal as a pushforward from the prismatic site

**Theorem.** For R quasi-syntomic and G a p-divisible group, ℳ_Δ(G) ≅ v_*ℰxt¹_{(R)_Δ}(u^{-1}G, O_Δ).

**Hypotheses and conventions.**

- R quasi-syntomic.

**Proof route.**

1. Adjunction for the morphism of topoi u and exactness of u^{-1} (node PD.1/pullback-exactness) give RHom_{(R)_QSYN}(G, Ru_*O_Δ) ≅ RHom_{(R)_Δ}(u^{-1}G, O_Δ); vanishing of Hom(G, −) into derived p-complete sheaves (node hom-vanishing) and of R¹u_*O_Δ on the quasi-regular semiperfectoid basis identify the Ext¹ terms (Anschütz–Le Bras, Lemma 4.2.4, p. 40).
2. Closure gap — Ringed-site and internal derived Hom infrastructure: Construct the relative big/small quasi-syntomic sites and ringed coefficient morphisms used here. Reuse Mathlib SheafOfModules.pullbackPushforwardAdjunction and pullbackIso (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean, read at 082e2d3), checking continuity, the presheaf right-adjoint hypothesis and the sheafification instances for these sites, rather than constructing the generic adjunction again. Current Tau Ceti SheafOfModules.ihomObjEquiv and ihomCompForgetIso (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean, read at a91d3aa) already supply ordinary internal Hom on a small site with the stated commutative-ring and sheafification hypotheses. Import this machinery through its small-site presentation, and supply the size/instance comparison, derived internal Rℋom, ℰxt and their base-change/pushforward compatibilities for the coefficient sheaves here. Mathlib CategoryTheory.Abelian.Ext is a global Ext group, not an internal Ext sheaf, and IsCocontinuous is only a condition. The cited supplier statements do not supply these specializations or derived compatibilities. PD.2 functor statements remain targets pending this infrastructure.

**Checks.**

- For R perfectoid, global sections give M_Δ(G) = Ext¹_{(R)_Δ}(u^{-1}G, O_Δ), an A_inf(R)-module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.2.4, p. 40: identifies the quasi-syntomic Ext-sheaf of G into O^pris with the pushforward of the prismatic Ext-sheaf of u^{-1}G into O_Δ.

**Needs.** §PD.2.3; §PD.2.4; §PD.1.1; §PD.1.2; `PrismaticCohomology:PR.2/qrsp-prism`.

### PD.2.6 The prismatic Dieudonné crystal as maps from the Tate module

**Theorem.** Let G be a p-divisible group over a quasi-syntomic ring R, with Tate module sheaf T_pG and universal cover G̃ = lim_{×p} G. (1) 0 → T_pG → G̃ → G → 0 is exact on (R)_qsyn, and its pullback by u^{-1} is exact on (R)_Δ. (2) ℳ_Δ(G) ≅ ℋom_{(R)_qsyn}(T_pG, O^pris) ≅ v_*ℋom_{(R)_Δ}(u^{-1}T_pG, O_Δ), compatibly with Frobenius.

**Hypotheses and conventions.**

- T_pG and G̃ as in FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/universal-cover, restricted to the quasi-syntomic site.

**Proof route.**

1. (1): p is an epimorphism on G for the syntomic topology, so the limit sequence is exact (Anschütz–Le Bras, Lemma 4.2.5, p. 41; R07.2.25 of the supplier for the fpqc version).
2. (2): apply RHom(−, O^pris) to (1); G̃ is uniquely p-divisible, so RHom(G̃, O^pris) = 0 since O^pris is derived p-complete; the connecting map gives ℋom(T_pG, O^pris) ≅ ℰxt¹(G, O^pris) (Lemma 4.2.6, p. 42).
3. The sequence 0 → T_pG → lim_[p]G → G → 0 on the quasi-syntomic site needs a compatible infinite p-root cover. Finite-level surjectivity of [p] and the fpqc universal-cover supplier alone do not prove this epimorphism on the specified site; use the recorded gap.
4. Closure gap — Compatible infinite p-root covers on the quasi-syntomic site: Plan a compatible tower of p-power-division covers of a p-divisible group whose completed limit is still a cover in the required quasi-syntomic site, and prove exactness of its inverse-limit sequence (AL23 Lemmas 4.2.5–4.2.6, pp. 41–43). Supply the analogous inverse-limit argument for truncated Ext crystals and étale Tate-module local triviality. R07.1/p-divisible-tate-module has a henselian local domain hypothesis and does not supply this sheaf statement.

**Checks.**

- For G = ℚ_p/ℤ_p, T_pG = ℤ_p and ℳ_Δ = O^pris.
- For G = μ_{p^∞}, T_pG = ℤ_p(1) and ℳ_Δ = ℋom(ℤ_p(1), O^pris) = O^pris{−1}.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemmas 4.2.5 and 4.2.6, pp. 41–42: proves exactness of the universal cover sequence on the quasi-syntomic and prismatic sites and identifies the prismatic Dieudonné crystal with maps from the Tate module into O^pris.

**Needs.** §PD.2.3; §PD.2.4; §PD.1.2; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-cover`.

## Layer PD.3: The perfectoid case

Own the p-divisible Hodge–Tate map/sequence; Scholze–Weinstein pairs and BKF classification over 𝒪_C; formal abelian covers and crystalline realization; the integral-perfectoid classification and its prismatic identification. Distinguish the absolute PD envelope and p⁻¹ covariant normalization. The Hodge–Tate proof, period-image/rigid inputs, Witt v-descent and nonnoetherian effectivity remain gaps. Sources: SW13 §5; SW20 Lectures 12, 14, 15 and Appendix 17; AL23 §4.3.

### PD.3.1 Hodge–Tate map and sequence of a p-divisible group

**Construction.** For a p-divisible group G over 𝒪_C, with C algebraically closed and complete over ℚ_p, define α_G : T_pG → (Lie G*)∨ by Cartier duality and the invariant differential dlog on μ_{p∞}. The dual map, after the Tate twist, identifies Lie G ⊗ C(1) with the kernel in the functorial exact sequence 0 → Lie G⊗C(1) → T_pG⊗C → (Lie G*)∨⊗C → 0.

**Hypotheses and conventions.**

- Lie modules are over 𝒪_C; the exact sequence is asserted after extension to C. C(1) = T_pμ_{p∞}⊗C.

**Proof route.**

1. A Tate vector in G pairs with G* into μ_{p∞}; differentiating this character gives α_G. Cartier duality gives the other map.
2. The Hodge–Tate exactness theorem is the key target, proved by the p-divisible-group Hodge–Tate comparison in SW20 Theorem 12.1.1, pp. 98–99; this is not merely dimension counting. The formal/rigid geometry input is included in the PD.3 period-theory gaps.

**API.**

- `TauCeti.PrismaticDieudonne.hodgeTateMap` (constructor): The dlog map α_G : T_pG → (Lie G*)∨.
- `TauCeti.PrismaticDieudonne.hodgeTateMap_natural` (functoriality): For f : G → H the dlog maps commute with T_pf and the dual differential of f*.
- `TauCeti.PrismaticDieudonne.hodgeTateSequence` (universal-property): The displayed exact sequence, natural in G and compatible with Cartier duality.
- `TauCeti.PrismaticDieudonne.hodgeTateMap_directSum` (simp): The map for G⊕H is the direct sum of the two maps.

**Checks.**

- `HodgeTate.multiplicative` (computation): For G = μ_{p∞}, the right term vanishes and the left inclusion is C(1) ≃ T_pμ_{p∞}⊗C.
- `HodgeTate.etale` (computation): For G = ℚ_p/ℤ_p the left term vanishes and α_G⊗C identifies C with (Lie μ_{p∞})∨⊗C.
- `HodgeTate.ordinary` (characterisation): For μ_{p∞}⊕ℚ_p/ℤ_p the kernel is exactly the first Tate summand. Interchanging Lie G and Lie G* gives the wrong two rank-one tests.
- The sequence has left dimension dim G and right dimension dim G*, summing to height G.

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 12.1.1 and construction preceding Theorem 12.1.5, pp. 98–99: dlog construction and exact Hodge–Tate sequence over C.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`.

**Planet:** Hodge–Tate sequence of a p-divisible group.

### PD.3.2 p-divisible groups over 𝒪_C are pairs (T, W) (Scholze–Weinstein Theorem B)

**Theorem.** Let C be an algebraically closed complete extension of ℚ_p. The functor G ↦ (T_pG, Lie G ⊗_{𝒪_C} C(1)) from p-divisible groups over 𝒪_C to pairs (T, W) of a finite free ℤ_p-module T and a C-subspace W ⊆ T ⊗_{ℤ_p} C is an equivalence of categories; W is embedded through the dual of the Hodge–Tate map α_{G^*} (Hodge–Tate sequence 0 → Lie G ⊗ C(1) → T_pG ⊗ C → (Lie G^*)^∨ ⊗ C → 0).

**Hypotheses and conventions.**

- C algebraically closed and complete; Tate twist C(1) = T_pμ_{p^∞} ⊗ C.
- In Example 12.1.6 use i = dim_projective(H)+1, equivalently the dimension of the rational vector-space hull of the line W; see independently checked source issue PrismaticCohomologyPartII/E5.

**Proof route.**

1. Use the Hodge–Tate map and sequence constructed in this roadmap (PD.3/p-divisible-hodge-tate-sequence), not an upward supplier.
2. Full faithfulness (Fargues): embed G into the multiplicative group G′ = T_pG(−1) ⊗ μ_{p^∞}; the generic fibre G^ad_η is the fibre product of G′^ad_η and Lie G ⊗ 𝔾_a over Lie G′ ⊗ 𝔾_a, so G^ad_η and then G = ⨆ Spf H⁰(Y, 𝒪⁺) are recovered from (T, W) (Scholze–Weinstein 2013, proof of Theorem 5.2.1, pp. 51–52).
3. Essential surjectivity for C spherically complete with surjective norm: define G^ad_η as that fibre product, show it is a p-divisible rigid-analytic group whose identity component is an open ball (Fargues, Corollaire 9 and Théorème 15; Scholze–Weinstein 2013, Proposition 5.2.5), and take G = ⨆ Spf H⁰(Y, 𝒪⁺) (pp. 52–53).
4. General C: realise (T, W) inside a Rapoport–Zink space using the description of the image of the period morphism (Scholze–Weinstein 2013, Theorem C, p. 6, and the proof of Theorem 5.2.1 for general C, p. 57).

**Checks.**

- G = μ_{p^∞}: (ℤ_p(1), C(1) = ℤ_p(1) ⊗ C).
- G = ℚ_p/ℤ_p: (ℤ_p, 0).
- For dimension d = 1 and height h, W a line in C^h: G is isogenous to (ℚ_p/ℤ_p)^{h−i} ⊕ G_i with G_i formal of height i, i = dim H + 1 for the smallest ℚ_p-rational projective subspace H containing W; W outside every rational hyperplane gives special fibre of height h (Drinfeld's Ω^h).

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 12, Definition 12.1.4 and Theorem 12.1.5, p. 99; Example 12.1.6, p. 100: states the equivalence between p-divisible groups over 𝒪_C and pairs (T, W) via the Tate module and the Lie algebra, citing the 2013 paper, with the dimension-one example; [Peter Scholze, Jared Weinstein](https://arxiv.org/abs/1211.6357), Theorem B, p. 4; Theorem C, p. 6; Theorem 5.2.1 and its proof, pp. 51–57: proves the classification: full faithfulness by reconstructing the generic fibre inside a multiplicative group, essential surjectivity by Fargues' theory of rigid-analytic p-divisible groups for spherically complete C and by the image of the period morphism in general.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; §PD.3.1.

**Planet:** Scholze–Weinstein classification over 𝒪_C.

### PD.3.3 p-divisible groups over 𝒪_C are minuscule Breuil–Kisin–Fargues modules

**Theorem.** Let C be algebraically closed complete over ℚ_p, A_inf = W(𝒪_C^♭), ξ a generator of ker θ. p-divisible groups over 𝒪_C are equivalent to finite free A_inf-modules M with a φ-linear isomorphism φ_M : M[1/ξ] ≅ M[1/φ(ξ)] such that M ⊆ φ_M(M) ⊆ φ(ξ)^{-1}M; equivalently, under Fargues' equivalence of BKF modules with pairs (T, Ξ) (T finite free over ℤ_p, Ξ a B_dR^+-lattice in T ⊗ B_dR), to the pairs with T ⊗ B_dR^+ ⊆ Ξ ⊆ ξ^{-1}T ⊗ B_dR^+.

**Hypotheses and conventions.**

- Normalisation of the lectures (covariant, φ_M normalised by p^{-1} in characteristic p); node perfectoid-prismatic-classification relates it to the contravariant prismatic functor by the naive dual.

**Proof route.**

1. Lattices Ξ with T ⊗ B_dR^+ ⊆ Ξ ⊆ ξ^{-1}T ⊗ B_dR^+ correspond to C-subspaces W ⊆ T ⊗ C(−1) through Ξ/(T ⊗ B_dR^+) ⊆ ξ^{-1}T ⊗ B_dR^+/T ⊗ B_dR^+ ≅ T ⊗ C(−1); the functor (T, W) ↦ (T, Ξ) is fully faithful (Scholze–Weinstein, Remark 12.4.7).
2. Compose Theorem B (node scholze-weinstein-theorem-b) with Fargues' classification of finite free BKF modules (AInfCohomology AI.2/fargues-classification); the lattice condition is the minuscule condition on M (Scholze–Weinstein, Theorem 14.1.1 and Theorem 14.4.1, pp. 115–121).

**Checks.**

- In the covariant normalisation of the lectures, ℚ_p/ℤ_p ↦ (A_inf, φ) with φ_M(M) = M, and μ_{p^∞} ↦ (A_inf, φ(ξ)^{-1}φ) with φ_M(M) = φ(ξ)^{-1}M: the two extreme cases of the lattice condition.
- After taking the naive dual and the Frobenius-shift dictionary ξ↔ξ̃, these are the effective minuscule modules of this roadmap PD.1/admissible-over-perfectoid. The AInf prismatic dictionary is not used circularly.

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 14, Theorem 14.1.1 and Theorem 14.4.1, pp. 115–121; Remark 12.4.7, p. 106: states Fargues' classification of BKF modules by pairs (T, Ξ) and that p-divisible groups over 𝒪_C are the BKF modules whose lattice lies between T ⊗ B_dR^+ and ξ^{-1} times it, equivalently the minuscule ones.

**Needs.** §PD.3.2; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.2/bkf-module`; `PrismaticCohomology:PR.7/bkf-modules-comparison`.

### PD.3.4 Every p-divisible group over 𝒪_C is a direct factor of that of a formal abelian variety

**Theorem.** For a p-divisible group G over 𝒪_C with Serre dual G^*, there is a formal abelian scheme 𝔄 over 𝒪_C with 𝔄[p^∞] ≅ G × G^*.

**Hypotheses and conventions.**

- C algebraically closed complete over ℚ_p, residue field k.

**Proof route.**

1. The Newton polygon of G_k × G_k^* is symmetric, so there is an abelian variety A_k over k with A_k[p^∞] ≅ G_k × G_k^* (Oort).
2. p-divisible groups over 𝒪_C/p are isotrivial up to quasi-isogeny (Scholze–Weinstein 2013, Theorem 5.1.4(i)); changing A_k by a quasi-isogeny, lift it to A over 𝒪_C/p with A[p^∞] ≅ (G × G^*)_{𝒪_C/p}.
3. Serre–Tate: deforming A to 𝒪_C is equivalent to deforming its p-divisible group, giving 𝔄 (Scholze–Weinstein, Proposition 14.9.4, pp. 129–130).

**Checks.**

- For G = μ_{p^∞}, G × G^* = μ_{p^∞} × ℚ_p/ℤ_p is the p-divisible group of an ordinary elliptic curve over 𝒪_C.

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Appendix to Lecture 14, Proposition 14.9.4 and its proof, pp. 129–130: proves that G × G^* is the p-divisible group of a formal abelian variety over 𝒪_C using Oort's existence theorem over the residue field, isotriviality over 𝒪_C/p and Serre–Tate deformation theory; [Peter Scholze, Jared Weinstein](https://arxiv.org/abs/1211.6357), Theorem 5.1.4, p. 49: every p-divisible group over 𝒪_C is isotrivial: its reduction to 𝒪_C/p is quasi-isogenous to a constant group.

**Needs.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`; `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; `AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence`.

### PD.3.5 The crystalline Dieudonné module of G over 𝒪_C/p is M ⊗_{A_inf} A_crys

**Theorem.** Let G be a p-divisible group over 𝒪_C with Breuil–Kisin–Fargues module (M, φ_M) (node oc-minuscule-bkf). The p⁻¹-normalized covariant crystalline Dieudonné module of G_{𝒪_C/p} evaluated on A_crys(𝒪_C/p) is M ⊗_{A_inf} A_crys with φ_M ⊗ φ; hence the special fibre G_k corresponds under the same p⁻¹-normalized covariant classical Dieudonné theory to (M ⊗_{A_inf} W(k), φ_M ⊗ φ). There is a natural φ-equivariant isomorphism M_crys ⊗_{A_crys} B_crys ≅ T_pG ⊗_{ℤ_p} B_crys under which M_crys ⊗ B_dR^+ is the lattice Ξ (Faltings).

**Hypotheses and conventions.**

- Covariant normalisation of the lectures; A_crys = A_crys(𝒪_C/p), the p-completed PD envelope of A_inf → 𝒪_C/p.
- The Scholze–Weinstein covariant Frobenius is p⁻¹ times the usual covariant crystalline Frobenius. With this normalization the naive dual of the effective contravariant prismatic module matches M_SW; it is different from the Česnavičius–Scholze covariant convention in PD.6.

**Proof route.**

1. Faltings' comparison M_crys ⊗ B_crys ≅ T ⊗ B_crys with M_crys ⊗ B_dR^+ = Ξ (Scholze–Weinstein, Proposition 14.8.1), hence M_crys[1/p] ≅ M ⊗ B_crys^+ (Corollary 14.8.2).
2. Integrality M_crys ≅ M ⊗ A_crys (Proposition 14.8.3): reduce by node formal-abelian-variety-cover to G = 𝔄[p^∞] for a formal abelian variety, where both sides are the A_crys-cohomology H¹ and the comparison is the torsion-free A_crys comparison of Bhatt–Morrow–Scholze (AInfCohomology AI.4/absolute-crystalline-comparison), compatibly (Propositions 14.9.3–14.9.4, Corollary 14.9.2).
3. Base change A_crys → W(k) gives the special-fibre statement (Corollary 14.4.4).
4. Closure gap — Crystalline coefficients over mixed-characteristic p-adic bases: Construct the compatible crystalline Dieudonné evaluations over R/pⁿ and their p-adic limit, including the coefficient comparison and Hodge/Lie sequence on the relevant PD thickenings (AL23 Lemma 4.3.3 and §4.6, pp. 46–48, 58–65). CR.7/dieudonne-evaluation explicitly assumes characteristic p; that declaration alone does not provide this mixed-characteristic coefficient theory.

**Checks.**

- μ_{p^∞}: M ⊗ A_crys = A_crys with the twist matching D(μ_{p^∞}).
- For an ordinary G the special fibre splits into slopes 0 and 1.

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 14.4.3 and Corollary 14.4.4, p. 121; Appendix to Lecture 14, Proposition 14.8.1, Corollary 14.8.2, Proposition 14.8.3, pp. 126–127, Propositions 14.9.3–14.9.4, p. 129: identifies the crystalline Dieudonné module over A_crys with the base change of the BKF module, via Faltings' comparison and a reduction to formal abelian varieties and the A_crys comparison of Bhatt–Morrow–Scholze.

**Needs.** §PD.3.3; §PD.3.4; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `CrystallineCohomology:CR.7/dieudonne-evaluation`; `CrystallineCohomology:CR.0/fontaine-envelope`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`.

### PD.3.6 Dieudonné theory over integral perfectoid rings (Scholze–Weinstein, Lau)

**Theorem.** Let R be an integral perfectoid ring, ξ a generator of ker(θ : A_inf(R) → R). p-divisible groups over R are equivalent, functorially in R, to finite projective A_inf(R)-modules M with a φ-linear isomorphism φ_M : M[1/ξ] ≅ M[1/φ(ξ)] such that M ⊆ φ_M(M) ⊆ φ(ξ)^{-1}M. The equivalence M^SW is characterised by agreeing with (covariant, p^{-1}-normalised) Dieudonné theory when pR = 0 and with node oc-minuscule-bkf when R = 𝒪_C; and M ⊗_{A_inf(R)} A_crys^abs(R) is the Dieudonné module of G on the PD thickening A_crys^abs(R) → R, compatibly with φ_M.

**Hypotheses and conventions.**

- Integral perfectoid in the sense of Bhatt–Morrow–Scholze (Scholze–Weinstein, Definition 17.5.1); PerfectoidQuotients Q0 integral algebra.
- For p odd the theorem is also Lau 2018 (Theorem 9.8), through displays.
- Here A_crys^abs(R) is the p-completed absolute PD envelope of A_inf(R) → R used in SW20 p. 158. In characteristic p it has extra divided powers of p and can have p-torsion; it maps to W(R) by giving p its usual divided powers. It is not the relative (ℤ_p,p)-PD envelope that equals W(R) for perfect R. Do not identify these two carriers using CrystallineCohomology:CR.0/fontaine-envelope.
- Lau18 Theorem 9.8, p. 26, has p≥3. The all-p theorem here is SW20 Theorem 17.5.2; the two source scopes are not interchangeable.

**Proof route.**

1. pR = 0: Gabber's theorem (Lau 2013); the argument needs only perfect valuation rings, which is Berthelot's theorem (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/berthelot-perfect-valuation-rings).
2. R = V a valuation ring with algebraically closed fraction field of mixed characteristic: glue the 𝒪_K-case (node oc-minuscule-bkf) with the characteristic-p valuation ring V̄ along k, on both sides.
3. R = ∏ V_i a product of such valuation rings: categories of finite projective modules of fixed rank are products; compare with the crystalline module using the Faltings comparison of node bkf-crystalline-dieudonne factorwise and test integrality in each A_crys(V_i).
4. General R: both p-divisible groups over R and the module side satisfy v-descent along v-covers Spec S → Spec R^♭ (Bhatt–Scholze 2017), and R^♭ has a v-cover by a product of valuation rings with algebraically closed fraction field (Scholze–Weinstein, proof of Theorem 17.5.2, pp. 158–160).
5. Closure gap — Witt-vector v-descent in the perfectoid classification: Supply v-descent for finite projective W(S)-modules on perfect schemes, including the complete inverse-limit step, and descent of the corresponding p-divisible groups over W(S)/ξ (SW20 proof of Theorem 17.5.2, pp. 159–160, using Bhatt–Scholze 2017). The current AlgebraicVectorBundles roadmap does not contain this Witt-vector result. GeometricSatakeAndFusion is outside the permitted supplier order, so it cannot be used as a placeholder owner.

**Checks.**

- R = 𝒪_C recovers node oc-minuscule-bkf; R = k perfect recovers classical Dieudonné theory up to the p^{-1} normalisation.
- In the covariant normalisation ℚ_p/ℤ_p ↦ (A_inf(R), φ) and μ_{p^∞} ↦ (A_inf(R), φ(ξ)^{-1}φ).

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Appendix to Lecture 17, Definition 17.5.1 and Theorem 17.5.2 with its proof, pp. 158–160: classifies p-divisible groups over integral perfectoid rings by minuscule BKF-type modules over A_inf, characterised by the perfect and 𝒪_C cases, with the A_crys comparison, proved by gluing valuation rings, products and v-descent; [Eike Lau](https://arxiv.org/abs/1603.07831), Theorem 9.8 and §10: the same classification over perfectoid rings for p odd through displays, and its torsion version (Theorem 10.12).

**Needs.** §PD.3.3; §PD.3.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/berthelot-perfect-valuation-rings`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-complete-flat-descent`; `PerfectoidQuotients:Q0:integral-algebra`; `PrismaticCohomology:PR.0/ainf-prism`.

**Planet:** Dieudonné theory over perfectoid rings.

### PD.3.7 Universal covers of p-divisible groups over 𝒪_C through A_crys

**Theorem.** Let G be a p-divisible group over 𝒪_C with Dieudonné module M over A_crys(𝒪_C/p). For a perfectoid pair (R, R^+) over C, the universal cover G̃ = lim_{×p} G satisfies G̃_C(R, R^+) ≅ G̃(R^+/p) = (M ⊗ B_crys^+(R^+/p))^{φ = 1} (with the covariant normalisation), and the logarithm gives 0 → V_pG → G̃_C → Lie G ⊗ 𝔾_a → 0. For G = μ_{p^∞}, G̃_C(R, R^+) ≅ B_crys^+(R^+/p)^{φ = p} via x ↦ log[x].

**Hypotheses and conventions.**

- p-divisible groups over R^+/ϖ (ϖ | p) embed fully faithfully into finite projective A_crys(R^+/ϖ)-modules with Frobenius: this is Scholze–Weinstein Theorem A over f-semiperfect rings, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/sw-dieudonne-semiperfect.

**Proof route.**

1. Rigidity of universal covers along nilpotent thickenings gives G̃(R^+) = G̃(R^+/p) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/universal-cover-rigidity).
2. G̃(R^+/p) = Hom(ℚ_p/ℤ_p, G)[1/p] over R^+/p is computed by full faithfulness of the crystalline Dieudonné functor up to isogeny over the f-semiperfect ring R^+/p (R07.2/sw-dieudonne-semiperfect) as the φ-fixed vectors (Scholze–Weinstein, Theorem 15.2.3 and Example 15.2.4, p. 135).

**Checks.**

- μ_{p^∞}: B_crys^+(𝒪_C/p)^{φ = p} with x ↦ log[x].
- ℚ_p/ℤ_p: G̃ = ℚ_p constant.

**Sources.** [Peter Scholze, Jared Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 15, Theorem 15.2.3 and Example 15.2.4, p. 135; Theorem 14.4.2, p. 121: states full faithfulness of Dieudonné theory over 𝒪_C/p and over R^+/ϖ into A_crys-modules with Frobenius and deduces the description of the universal cover through B_crys^+, with the μ_{p^∞} example.

**Needs.** §PD.3.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/sw-dieudonne-semiperfect`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-cover-rigidity`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-cover`.

### PD.3.8 The prismatic Dieudonné functor over a perfectoid ring

**Theorem.** Let R be perfectoid. (1) M_Δ(G) ≅ Hom_{A_inf(R)}(M^SW(G), A_inf(R)) naturally in G and R, where M^SW is the functor of node scholze-weinstein-perfectoid (transported to the ξ̃-normalisation of the prism (A_inf(R), (ξ̃))). (2) M_Δ takes values in DM^adm(R) = DM(R) and is an antiequivalence BT(R)^op ≃ DM(R). (3) M_Δ is exact and has an exact quasi-inverse.

**Hypotheses and conventions.**

- R perfectoid; (Δ_R, I) = (A_inf(R), ker θ̃).

**Proof route.**

1. For R perfect both sides of (1) are the contravariant crystalline Dieudonné module (node PD.4/crystalline-comparison), compatibly with base change.
2. For R = 𝒪_C and G = 𝔛[p^∞] with 𝔛 a formal abelian scheme, M^SW(G) is dual to H¹_{A_inf}(𝔛) and M_Δ(G) = H¹_Δ by node PD.4/abelian-dieudonne-crystal and the comparison of Bhatt–Scholze Theorem 17.2 (PrismaticCohomology PR.6); naturality for maps of p-divisible groups is checked after base change to A_crys. A general G is a direct factor of such a group (node formal-abelian-variety-cover) (Anschütz–Le Bras, Proposition 4.3.6, pp. 48–50).
3. General perfectoid R: both functors are compatible with base change and the comparison is determined by the perfect and 𝒪_C cases, by the uniqueness clause of node scholze-weinstein-perfectoid.
4. (2) follows from (1), node scholze-weinstein-perfectoid and node PD.1/admissible-over-perfectoid (Corollary 4.3.7, p. 50); (3) is Remark 4.3.8, p. 50, with the argument of node PD.6/finite-group-classification.

**Checks.**

- R = k perfect: the classical contravariant Dieudonné theory.
- R = 𝒪_C: G ↦ dual of its BKF module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.3.6, Corollary 4.3.7 and Remark 4.3.8, pp. 48–50: identifies the prismatic Dieudonné functor over a perfectoid ring with the naive dual of the Scholze–Weinstein functor and deduces the exact antiequivalence with prismatic Dieudonné modules.

**Needs.** §PD.3.6; §PD.3.4; §PD.1.10; §PD.1.8; §PD.2.3; §PD.2.5; `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.0/ainf-prism`.

**Planet:** Classification over perfectoid rings.

## Layer PD.4: Abelian schemes, finiteness, admissibility and crystalline comparison

Exterior Hodge–Tate/prismatic cohomology of abelian schemes, primitive elements, Ext finiteness, admissibility and Lie quotient; finite and truncated BT Ext crystals; crystalline and classical comparisons and exactness. At p=2 retain the precise abelian-lifting gap. Mixed-characteristic crystalline coefficient evaluations require their own compatible construction. Source: AL23 §§4.3, 4.5–4.6, pp. 43–65.

### PD.4.1 Hodge–Tate cohomology of an abelian scheme is an exterior algebra

**Theorem.** Let (A, I) be a bounded prism and X the p-adic completion of an abelian scheme of relative dimension g over Ā = A/I. The conjugate spectral sequence E₂^{ij} = H^i(X, Ω^j_{X/Ā}){−j} ⇒ H^{i+j}(X, Δ̄_{X/A}) degenerates; every term and the abutment are finite locally free and commute with base change in (A, I); and H^*(X, Δ̄_{X/A}) ≅ Λ^* H¹(X, Δ̄_{X/A}) is the exterior Ā-algebra on H¹, of rank 2g.

**Hypotheses and conventions.**

- (A, I) bounded; X proper smooth with the group structure of an abelian scheme.

**Proof route.**

1. Hodge cohomology of an abelian scheme is finite locally free, commutes with base change and is an exterior algebra on H¹ (AbelianSchemesAndArithmeticModuli A4/all-degree-exterior-cohomology, Berthelot–Breen–Messing 2.5.2).
2. The conjugate filtration of Hodge–Tate cohomology has graded pieces Ω^j{−j}[−j] (PrismaticCohomology PR.2/conjugate-filtration, PR.1/hodge-tate-comparison). The Künneth formula (PR.2/kunneth-formula-formal-schemes) and the Hopf-algebra structure from the group law force the cup product Λ^*H¹ → H^* to be an isomorphism by a rank count, hence degeneration (Anschütz–Le Bras, Proposition 4.5.2, pp. 53–54).
3. Closure gap — Abelian lifting for the integral Hodge–Tate splitting at p=2: Give the unpolarized infinitesimal lifting of an abelian scheme needed to split τ≤1 of its Hodge–Tate complex over A/I (AL23 Proposition 3.2.1, Corollary 3.2.3 and the proof of Proposition 4.5.1, pp. 20–21, 53–54). The A4 Hodge/de Rham exterior theorem and its nilpotent-PD Grothendieck–Messing statement do not by themselves supply a lift along a general prism quotient A/I². This input is essential to the p=2 integral exterior-power argument.

**Checks.**

- g = 0: H⁰ = Ā and all higher groups vanish.
- For an elliptic curve, H¹(X, Δ̄_{X/A}) is locally free of rank 2 and H² ≅ Λ²H¹ of rank 1.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Propositions 4.5.1 and 4.5.2, pp. 53–54: recalls the exterior structure of Hodge and de Rham cohomology of abelian schemes and proves that the conjugate spectral sequence of Hodge–Tate cohomology degenerates, with base change, and that Hodge–Tate cohomology is the exterior algebra on H¹.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/all-degree-exterior-cohomology`; `PrismaticCohomology:PR.2/conjugate-filtration`; `PrismaticCohomology:PR.1/hodge-tate-comparison`; `PrismaticCohomology:PR.2/kunneth-formula-formal-schemes`.

### PD.4.2 Primitive elements of an exterior algebra

**Lemma.** Let S be a commutative ring and M a projective S-module. The elements x of the exterior algebra Λ(M) with μ^*(x) = 1 ⊗ x + x ⊗ 1, where μ^* : Λ(M) → Λ(M ⊕ M) ≅ Λ(M) ⊗_S Λ(M) is induced by the diagonal M → M ⊕ M, are exactly Λ¹M = M.

**Hypotheses and conventions.**

- M projective (finitely generated suffices for the use here).

**Proof route.**

1. Reduce to M free by a direct-summand argument; in degree n the component of μ^*(x) in Λ^a M ⊗ Λ^b M with a, b ≥ 1, a + b = n, is the (a, b)-shuffle coproduct of x, which is injective for n ≥ 2 when a = 1 (contracting with basis vectors), so primitives are concentrated in degree 1; degree 0 primitives satisfy x = 2x, so vanish (Anschütz–Le Bras, Lemma 4.5.5, p. 56).

**Checks.**

- M = S: Λ(S) = S ⊕ S·e, and the primitives are S·e.
- Over S = F_2 and M = S², the element e₁ ∧ e₂ is not primitive.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.5.5, p. 56: shows that the primitive elements for the coproduct of an exterior algebra of a projective module are exactly its degree-one part.

**Needs.** Mathlib `ExteriorAlgebra`; Mathlib `ExteriorAlgebra.ι`; Mathlib `Module.Projective`.

### PD.4.3 Reduced prismatic Ext-sheaves of an abelian scheme

**Theorem.** Let R be p-complete and f : X → Spf R the p-adic completion of an abelian scheme of relative dimension g. Then ℰxt^i_{(R)_Δ}(u^{-1}X, Ō_Δ) = 0 for i = 0, 2, and ℰxt¹_{(R)_Δ}(u^{-1}X, Ō_Δ) is a prismatic crystal, isomorphic to R¹f_{Δ,*}Ō_Δ and locally free of rank 2g over Ō_Δ.

**Hypotheses and conventions.**

- R p-complete; f_Δ : Shv((X)_Δ) → Shv((R)_Δ) the induced morphism of topoi.

**Proof route.**

1. Compute RHom(u^{-1}X, Ō_Δ) with the functorial resolution (node PD.2/functorial-resolution) and the derived Yoneda lemma (node PD.2/derived-yoneda): the E₁-terms are Hodge–Tate cohomologies of powers X^n, exterior algebras by node abelian-conjugate-degeneration and Künneth.
2. Ext⁰ and Ext² are cut out by primitive elements (node exterior-primitives) in degrees 0 and 2, which vanish; Ext¹ is the primitive part of H¹, i.e. all of H¹ = R¹f_{Δ,*}Ō_Δ.
3. Check the identification fibrewise at closed points: a map from a finitely generated module to a finite projective module that is an isomorphism on all fibres at closed points is an isomorphism (Anschütz–Le Bras, Lemma 4.5.3 and Theorem 4.5.4, p. 55).

**Checks.**

- g = 0: all Ext-sheaves vanish.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.5.3 and Theorem 4.5.4, p. 55: computes the Ext-sheaves of an abelian scheme into the reduced prismatic structure sheaf through the functorial resolution, the exterior algebra structure and a fibrewise isomorphism criterion.

**Needs.** §PD.4.1; §PD.4.2; §PD.2.1; §PD.2.2; §PD.1.1.

### PD.4.4 Prismatic Ext-sheaves of an abelian scheme

**Theorem.** With R, X, f as in node abelian-hodge-tate-ext: ℰxt^i_{(R)_Δ}(u^{-1}X, O_Δ) = 0 for i = 0, 2, and ℰxt¹_{(R)_Δ}(u^{-1}X, O_Δ) is a prismatic crystal isomorphic to R¹f_{Δ,*}O_Δ, locally free of rank 2g over O_Δ.

**Hypotheses and conventions.**

- As in node abelian-hodge-tate-ext.

**Proof route.**

1. Reduce modulo I_Δ: O_Δ is (p, I)-complete and the reduction gives Ō_Δ, so derived Nakayama and node abelian-hodge-tate-ext give the vanishing of Ext⁰, Ext² and the local freeness of Ext¹; base change in the prism gives the crystal property (Anschütz–Le Bras, Theorem 4.5.6, p. 56).

**Checks.**

- For an elliptic curve E over R, ℰxt¹(u^{-1}E, O_Δ) is locally free of rank 2.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.5.6, p. 56: deduces the vanishing of Ext⁰ and Ext² and the local freeness of rank 2g of Ext¹ of an abelian scheme into O_Δ from the Hodge–Tate case.

**Needs.** §PD.4.3; `PrismaticCohomology:PR.1/prismatic-structure-sheaf`.

### PD.4.5 The prismatic Dieudonné crystal of an abelian scheme

**Theorem.** Let R be quasi-syntomic and X the p-completion of an abelian scheme of relative dimension g over R. Then ℳ_Δ(X[p^∞]) = ℰxt¹_{(R)_qsyn}(X[p^∞], O^pris) is a finite locally free O^pris-module of rank 2g, given by v_*R¹f_{Δ,*}O_Δ.

**Hypotheses and conventions.**

- R quasi-syntomic.

**Proof route.**

1. X[p^∞] → X → X[1/p] is exact with uniquely p-divisible cokernel, so ℰxt¹(X[p^∞], O^pris) ≅ ℰxt¹(X, O^pris) (O^pris derived p-complete), then apply node PD.2/pushforward-description and node abelian-prismatic-ext (Anschütz–Le Bras, Corollary 4.5.7, p. 57).
2. The exact sheaf sequence is 0 → X[p∞] → X → X[1/p] → 0. Tensoring with ℚ would also discard prime-to-p torsion and is not the stated sequence.

**Checks.**

- For an ordinary elliptic curve over an algebraically closed field, the crystal is O^pris ⊕ O^pris{−1} with slopes 0 and 1.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Corollary 4.5.7, p. 57: identifies the prismatic Dieudonné crystal of the p-divisible group of an abelian scheme with the first prismatic direct image, finite locally free of rank twice the dimension.

**Needs.** §PD.4.4; §PD.2.3; §PD.2.5.

### PD.4.6 Prismatic cohomology of an abelian scheme

**Theorem.** With X as in node abelian-prismatic-ext, R^*f_{Δ,*}O_Δ is a finite locally free crystal on (R)_Δ and the exterior algebra on the locally free crystal R¹f_{Δ,*}O_Δ of rank 2g. In particular, for an abelian scheme over a bounded prism (A, I), each H^i_Δ(X/A) is finite locally free over A, and for the Breuil–Kisin prism (W(k)⟦u⟧, (E)) each full prismatic cohomology module H^i_Δ(X/A)/p is u-torsion-free over k⟦u⟧.

**Hypotheses and conventions.**

- As in node abelian-prismatic-ext.
- In the Breuil–Kisin example S = W(k)⟦u⟧, the u-torsion-free module is H^i_Δ(X/S)/p over S/p = k⟦u⟧. The reduced cohomology H^i(̄Δ)/p over 𝒪_K/p is killed by a power of u and does not satisfy that assertion.

**Proof route.**

1. The cup product Λ^*R¹f_{Δ,*}O_Δ → R^*f_{Δ,*}O_Δ is an isomorphism modulo I_Δ by node abelian-conjugate-degeneration; both sides are derived (p, I)-complete, so it is an isomorphism (Anschütz–Le Bras, Corollary 4.5.8, p. 57).
2. Local freeness of all terms gives torsion-freeness of the reductions.

**Checks.**

- For g = 1, H² ≅ Λ²H¹ is invertible.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Corollary 4.5.8, p. 57: shows that the prismatic cohomology of an abelian scheme is a finite locally free crystal and the exterior algebra on its first cohomology.

**Needs.** §PD.4.4; §PD.4.1.

### PD.4.7 Prismatic Ext-sheaves of finite locally free group schemes

**Theorem.** Let R be p-complete and G a finite locally free commutative group scheme over R. Then ℰxt¹_{(R)_Δ}(u^{-1}G, O_Δ) is a prismatic crystal of locally finitely presented O_Δ-modules.

**Hypotheses and conventions.**

- R p-complete.

**Proof route.**

1. Zariski-locally embed G into a projective abelian scheme X (Raynaud, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/raynaud-abelian-embedding) with quotient abelian scheme X′ = X/G.
2. The long exact sequence for 0 → G → X → X′ → 0 and node abelian-prismatic-ext present ℰxt¹(u^{-1}G, O_Δ) as the cokernel of a map of locally free crystals (Anschütz–Le Bras, Proposition 4.6.2, p. 58).

**Checks.**

- For G = ℤ/p, the sequence 0 → ℤ → ℤ → ℤ/p → 0 gives ℰxt¹(u^{-1}ℤ/p, O_Δ) ≅ O_Δ/p, finitely presented over O_Δ but not locally free over O_Δ.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.2, p. 58: shows that the first prismatic Ext of a finite locally free group scheme is a crystal of locally finitely presented modules, by Raynaud's embedding into an abelian scheme.

**Needs.** §PD.4.4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-abelian-embedding`; §PD.1.2.

### PD.4.8 Prismatic Ext-sheaves of truncated Barsotti–Tate groups

**Theorem.** Let R be quasi-syntomic and G a truncated Barsotti–Tate group of level n and height h over R. Then ℰxt¹_{(R)_Δ}(u^{-1}G, O_Δ) is a prismatic crystal of finite locally free O_Δ/p^n-modules of rank h.

**Hypotheses and conventions.**

- Truncated Barsotti–Tate groups as in AbelianSchemesAndArithmeticModuli A4.5a.

**Proof route.**

1. Locally embed G into X′[p^n] for an abelian scheme X′ of dimension g with quotient H a truncated Barsotti–Tate group of height 2g − h (Illusie's recognition criterion, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/bt-n-recognition).
2. ℰxt¹(u^{-1}X′[p^n], O_Δ) = ℰxt¹(u^{-1}X′, O_Δ)/p^n is free of rank 2g over O_Δ/p^n; the sequence ℰxt¹(H) → ℰxt¹(X′[p^n]) → ℰxt¹(G) → 0 is right exact, and the outer terms are generated locally by 2g − h and h sections, so both are free of those ranks (Anschütz–Le Bras, Proposition 4.6.4, pp. 59–61).

**Checks.**

- G = μ_{p^n}: free of rank 1 over O_Δ/p^n.
- G = ℤ/p^n: free of rank 1 over O_Δ/p^n.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.4 and its proof, pp. 59–61: proves that the first prismatic Ext of a level-n truncated Barsotti–Tate group is a crystal of finite locally free O_Δ/p^n-modules, by embedding into the p^n-torsion of an abelian scheme and counting generators.

**Needs.** §PD.4.7; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/bt-n-recognition`; `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/truncated-barsotti-tate-groups`.

### PD.4.9 The prismatic Dieudonné crystal of a p-divisible group is locally free of rank the height

**Theorem.** Let G be a p-divisible group of height h over a quasi-syntomic ring R. Then ℰxt¹_{(R)_Δ}(u^{-1}G, O_Δ) is a prismatic crystal of finite locally free O_Δ-modules of rank h, and ℰxt¹_{(R)_Δ}(u^{-1}G, O_Δ)/p^n ≅ ℰxt¹_{(R)_Δ}(u^{-1}G[p^n], O_Δ). If R is quasi-syntomic, ℳ_Δ(G) is a finite locally free O^pris-module of rank h.

**Hypotheses and conventions.**

- R p-complete (quasi-syntomic for the last sentence).
- R is quasi-syntomic throughout this packet. The inverse limit from truncated BT groups uses the compatible-cover and internal-Ext infrastructure gaps; it is not justified by a bare interchange of inverse limit and Ext.

**Proof route.**

1. G = colim G[p^n]; in the replete prismatic topos R²lim vanishes, and the R¹lim term vanishes because the maps M_{n+m} ⊗ B/p^n → M_n are isomorphisms (node truncated-bt-ext-crystal) and N = lim M_n is finite locally free (Stacks, Tag 0D4B).
2. M → lim M/p^n is an isomorphism since Hom(u^{-1}G, O_Δ/p^n) = 0, which proves the crystal property (Anschütz–Le Bras, Proposition 4.6.5, pp. 61–62).
3. The last sentence follows by node PD.1/opris-vector-bundles and node PD.2/pushforward-description.
4. Closure gap — Compatible infinite p-root covers on the quasi-syntomic site: Plan a compatible tower of p-power-division covers of a p-divisible group whose completed limit is still a cover in the required quasi-syntomic site, and prove exactness of its inverse-limit sequence (AL23 Lemmas 4.2.5–4.2.6, pp. 41–43). Supply the analogous inverse-limit argument for truncated Ext crystals and étale Tate-module local triviality. R07.1/p-divisible-tate-module has a henselian local domain hypothesis and does not supply this sheaf statement.

**Checks.**

- ℳ_Δ(ℚ_p/ℤ_p) and ℳ_Δ(μ_{p^∞}) have rank 1; ℳ_Δ(E[p^∞]) has rank 2 for an elliptic curve E.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.5 and its proof, pp. 61–62: proves that the prismatic Dieudonné crystal of a p-divisible group is finite locally free of rank the height, by passing to the limit over the truncations.

**Needs.** §PD.4.8; §PD.2.3; §PD.2.5; `PrismaticCohomology:PR.7/quasisyntomic-crystal-comparison`.

**Planet:** Finiteness of the prismatic Dieudonné crystal.

### PD.4.10 O^pris and the crystalline structure sheaf in characteristic p

**Theorem.** For a quasi-syntomic F_p-algebra R′ there is a canonical isomorphism O^pris(R′) ≅ 𝒪^crys(R′) (the pushforward of the crystalline structure sheaf of the big crystalline site of R′ over ℤ_p, with Lau's p-th root topology) carrying N^{≥1}O^pris(R′) onto 𝒥^crys(R′), the pushforward of the PD ideal; it is compatible with Frobenius.

**Hypotheses and conventions.**

- Characteristic p; p-th root topology of Lau (2013, Definition 7.2).

**Proof route.**

1. Both sides are sheaves for the p-th root topology, for which semiperfect, hence quasi-regular semiperfect, rings form a basis; there Δ_{R′} ≅ A_crys(R′) (PrismaticCohomology PR.2/qrsp-char-p-acrys) carrying N^{≥1} to the PD ideal (Anschütz–Le Bras, Lemma 4.3.1, pp. 43–44).

**Checks.**

- For R′ perfect, both are W(R′) with N^{≥1} = pW(R′).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.3.1, pp. 43–44: identifies O^pris with the crystalline structure sheaf on quasi-syntomic F_p-algebras, matching the first Nygaard piece with the PD ideal, via the A_crys description of the prism of a quasi-regular semiperfect ring.

**Needs.** §PD.1.3; `PrismaticCohomology:PR.2/qrsp-char-p-acrys`; `CrystallineCohomology:CR.1/crystalline-site`; `CrystallineCohomology:CR.0/fontaine-envelope`.

### PD.4.11 Comparison with the crystalline Dieudonné functor

**Theorem.** (1) Let R be quasi-syntomic with pR = 0 and G a p-divisible group over R. There is a canonical Frobenius-equivariant isomorphism ℳ_Δ(G) ≅ v^crys_*ℰxt¹_{(R/ℤ_p)_crys}((u^crys)^{-1}G, 𝒪_crys), linear over node opris-ocrys; for R quasi-regular semiperfect, M_Δ(G) ≅ 𝔻(G)(A_crys(R)). (2) Let R be quasi-syntomic and D → R a surjection from a p-complete p-torsion-free δ-ring whose kernel has divided powers, so that (D, (p)) ∈ (R)_Δ. For every p-divisible group G over R, v^*(ℳ_Δ(G))(D, (p)) ≅ 𝔻(G)(D), Frobenius-equivariantly, where 𝔻(G) is the contravariant crystalline Dieudonné crystal.

**Hypotheses and conventions.**

- 𝔻(G) = ℰxt¹(G, 𝒪_{S/ℤ_p}) of AbelianSchemesAndArithmeticModuli A4.CR.7.2 (namespace CrystallineCohomology CR.7/dieudonne-evaluation).
- For the prismatic Dieudonné functor in part (2), R is quasi-syntomic. If D → R is the PD thickening, the crystalline-prism structure uses R → D/p induced by Frobenius on D (Frobenius kills the PD kernel modulo p); it is not a nonexistent reverse of the quotient D → R.

**Proof route.**

1. (1): ℰxt¹ on (R)_qsyn agrees with ℰxt¹ for the p-th root topology because quasi-regular semiperfectoid rings form a basis of both and O^pris has no higher cohomology on them (node PD.2/functorial-resolution); by node opris-ocrys it remains to compare ℰxt¹(G, 𝒪^crys) with the pushforward of the crystalline ℰxt¹, which holds because R¹u^crys_*𝒪_crys vanishes on quasi-syntomic objects and Hom((u^crys)^{-1}G, 𝒪_crys) = 0 (Anschütz–Le Bras, Theorem 4.3.2, pp. 44–45).
2. (2): the same argument on the PD thickening D → R, using that (D, (p)) is a crystalline prism (Lemma 4.3.3, p. 45).
3. Closure gap — Crystalline coefficients over mixed-characteristic p-adic bases: Construct the compatible crystalline Dieudonné evaluations over R/pⁿ and their p-adic limit, including the coefficient comparison and Hodge/Lie sequence on the relevant PD thickenings (AL23 Lemma 4.3.3 and §4.6, pp. 46–48, 58–65). CR.7/dieudonne-evaluation explicitly assumes characteristic p; that declaration alone does not provide this mixed-characteristic coefficient theory.

**Checks.**

- G = μ_{p^∞} over a perfect field k: both sides are (W(k), pσ) in the contravariant normalisation.
- For R = 𝒪_C/p, M_Δ(G) = 𝔻(G)(A_crys(𝒪_C/p)).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.3.2 and Lemma 4.3.3, pp. 44–45: identifies the prismatic Dieudonné crystal in characteristic p with the pushforward of the crystalline Dieudonné crystal of Berthelot–Breen–Messing, and its value on any crystalline prism (D, (p)) with the evaluation of the crystalline Dieudonné crystal.

**Needs.** §PD.4.10; §PD.2.3; §PD.2.5; §PD.2.1; `CrystallineCohomology:CR.7/dieudonne-evaluation`; `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`; `PrismaticCohomology:PR.0/crystalline-prism`; `PrismaticCohomology:PR.2/derived-crystalline-comparison`.

**Planet:** Crystalline comparison.

### PD.4.12 Comparison with classical Dieudonné theory over a perfect field

**Theorem.** For a perfect field k of characteristic p and a p-divisible group G over k there is a canonical W(k)-linear Frobenius-equivariant isomorphism M_Δ(G) ≅ M^cl(G) with the classical contravariant Dieudonné module of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Hypotheses and conventions.**

- k perfect; Δ_k = W(k).

**Proof route.**

1. By node crystalline-comparison, M_Δ(G) = 𝔻(G)(W(k)), and the classical module is the evaluation of the crystalline Dieudonné crystal at W(k) (AbelianSchemesAndArithmeticModuli A4.CR.7.2; Anschütz–Le Bras, Proposition 4.3.9, p. 51).

**Checks.**

- M_Δ(ℚ_p/ℤ_p) = (W(k), σ), M_Δ(μ_{p^∞}) = (W(k), pσ).
- For a supersingular elliptic curve E over F_{p²}, M_Δ(E[p^∞]) has slope 1/2.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.3.9, p. 51: identifies the prismatic Dieudonné module over a perfect field with the classical contravariant Dieudonné module.

**Needs.** §PD.4.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/standard-dieudonne-modules`.

### PD.4.13 A Hom-description of the prismatic Dieudonné crystal in characteristic p

**Theorem.** Let R be quasi-syntomic with pR = 0 and define the sheaf Q on (R)_Δ by 0 → O_Δ → O_Δ[1/p] → Q → 0. For every p-divisible group G over R the connecting map induces an isomorphism ℋom_{(R)_qsyn}(G, v_*Q) = v_*ℋom_{(R)_Δ}(u^{-1}G, Q) ≅ ℳ_Δ(G).

**Hypotheses and conventions.**

- pR = 0.

**Proof route.**

1. Apply RHom(u^{-1}G, −) to the defining sequence: Hom and Ext¹ into O_Δ[1/p] vanish because G is p-power torsion locally and O_Δ[1/p] is uniquely p-divisible (Anschütz–Le Bras, Definition 4.3.10 and Proposition 4.3.11, p. 51).

**Checks.**

- For G = ℚ_p/ℤ_p, Hom(ℚ_p/ℤ_p, v_*Q) ≅ O^pris, as computed directly.
- The Hom-description is in the contravariant convention; the covariant R07.2 module definition is not a supplier for a Witt-covector comparison.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.3.10 and Proposition 4.3.11, p. 51: introduces the quotient of O_Δ[1/p] by O_Δ and shows that homomorphisms from G into it compute the prismatic Dieudonné crystal in characteristic p.

**Needs.** §PD.2.3; §PD.2.5; §PD.1.1.

### PD.4.14 The prismatic Dieudonné crystal of a p-divisible group is admissible

**Theorem.** Let R be quasi-syntomic and G a p-divisible group of height h over R with Cartier dual Ǧ. Then (ℳ_Δ(G), φ_{ℳ_Δ(G)}) is an admissible prismatic Dieudonné crystal of rank h, and ℳ_Δ(G)/Fil ℳ_Δ(G) ≅ Lie(Ǧ) ⊗_R 𝒪, where Fil = φ^{-1}(I^pris·ℳ_Δ(G)); in particular rank_𝒪(ℳ/Fil) = dim Ǧ = h − dim G.

**Hypotheses and conventions.**

- R quasi-syntomic; Lie(Ǧ) the Lie algebra of the Cartier dual, finite projective of rank h − dim G (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1).

**Proof route.**

1. Local freeness of rank h is node pdiv-locally-free. Admissibility is local (node PD.1/dieudonne-crystal-stack), so assume R quasi-regular semiperfectoid.
2. Choose a perfectoid S ↠ R, henselian along the kernel (Anschütz–Le Bras, Corollary 2.1.10); G lifts to a p-divisible group H over S (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/henselian-lifting-p-divisible), so ℳ_Δ(G) is the base change of ℳ_Δ(H), admissible by node PD.3/perfectoid-prismatic-classification; admissibility is stable under base change (Theorem 4.6.7, p. 63).
3. Lie(Ǧ): over the perfectoid S, the Hodge quotient of M_Δ(H) maps to the Hodge quotient of the crystalline Dieudonné module on A_crys(S) (node PD.3/scholze-weinstein-perfectoid, last clause), which is Lie(Ȟ) by the Hodge filtration of the crystalline Dieudonné crystal (AbelianSchemesAndArithmeticModuli A4.CR.7.2, CrystallineCohomology CR.7/messing-filtration-interface); base change to R (Anschütz–Le Bras, Remark 1.4.2, p. 7).
4. Closure gap — Crystalline coefficients over mixed-characteristic p-adic bases: Construct the compatible crystalline Dieudonné evaluations over R/pⁿ and their p-adic limit, including the coefficient comparison and Hodge/Lie sequence on the relevant PD thickenings (AL23 Lemma 4.3.3 and §4.6, pp. 46–48, 58–65). CR.7/dieudonne-evaluation explicitly assumes characteristic p; that declaration alone does not provide this mixed-characteristic coefficient theory.
5. Choose a perfectoid presentation S → R and p-complete the henselization of S along its kernel. PerfectoidQuotients Q0/completely-etale-and-henselian-perfectoid (AL23 Corollary 2.1.10, p. 14) supplies perfectoidness; the quotient remains R. This is the henselian presentation required for lifting G.

**Checks.**

- G = ℚ_p/ℤ_p: Ǧ = μ_{p^∞}, Lie(Ǧ) free of rank 1 and ℳ/Fil = 𝒪.
- G = μ_{p^∞}: Ǧ = ℚ_p/ℤ_p, Lie(Ǧ) = 0 and Fil = ℳ.
- For an elliptic curve E, ℳ_Δ(E[p^∞])/Fil ≅ Lie(E^∨) of rank 1.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.6.7, p. 63; Remark 1.4.2, p. 7; Lemma 4.6.6, pp. 62–63: proves admissibility of the prismatic Dieudonné crystal by lifting the group from a quasi-regular semiperfectoid ring to a henselian perfectoid ring and invoking the perfectoid case, and records that its rank is the height and its Hodge quotient is the Lie algebra of the dual.

**Needs.** §PD.4.9; §PD.1.6; §PD.1.7; §PD.3.8; §PD.3.6; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/henselian-lifting-p-divisible`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`; `CrystallineCohomology:CR.7/messing-filtration-interface`; `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`.

**Planet:** Admissibility of M_Δ(G).

### PD.4.15 Exactness of the prismatic Dieudonné functor

**Theorem.** For R quasi-syntomic, ℳ_Δ : BT(R) → DM(R) is exact: a short exact sequence 0 → G′ → G → G″ → 0 of p-divisible groups gives 0 → ℳ_Δ(G″) → ℳ_Δ(G) → ℳ_Δ(G′) → 0.

**Hypotheses and conventions.**

- Exactness of p-divisible groups as fppf sheaves.

**Proof route.**

1. The long exact Ext sequence starts with Hom(G′, O^pris) = 0 (node PD.2/hom-vanishing).
2. Surjectivity of ℳ_Δ(G) → ℳ_Δ(G′): with H_n = G[p^n]/G′[p^n], the maps ℳ_Δ(G[p^n]) → ℳ_Δ(G′[p^n]) and ℳ_Δ(H_{n+1}) → ℳ_Δ(H_n) are surjective as in node pdiv-locally-free; pass to the limit (Anschütz–Le Bras, Proposition 4.6.8, p. 63).

**Checks.**

- The connected–étale sequence of a p-divisible group over a henselian local base gives a short exact sequence of crystals.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.8, p. 63: proves that the prismatic Dieudonné functor is exact using the vanishing of Hom into O^pris and surjectivity at finite levels.

**Needs.** §PD.4.9; §PD.2.4; §PD.2.3.

## Layer PD.5: The classification of p-divisible groups

q-logarithm, étale/multiplicative calculations and Cartier duality; weight-one kernel formula with the source G/G* correction; full faithfulness, essential surjectivity and the main contravariant classification. The explicit inverse uses Frobenius-compatible linear maps to O^pris, avoiding an undefined integral Frobenius on the naive dual. Sources: AL23 §2.2 and §§4.6–4.9, pp. 14–16, 63–74; BL22 Theorem 7.5.6.

### PD.5.1 The q-logarithm and the divided q-logarithm

**Construction.** (1) Let (B, J) be a prism over the q-de Rham prism (ℤ_p⟦q − 1⟧, ([p]_q)). For x ∈ 1 + N^{≥1}B of rank one (δ(x) = 0), log_q(x) = Σ_{n≥1} (−1)^{n−1} q^{−n(n−1)/2} (x − 1)(x − q)⋯(x − q^{n−1})/[n]_q converges in B, lies in N^{≥1}B, and equals ((q − 1)/log q)·log(x) in B[1/p]⟦x − 1⟧^∧_{(q−1)}. (2) If (B, J) is moreover bounded and x ∈ ℤ_p(1)(B/J) = T_p((B/J)^×), the Teichmüller-type lift [x^{1/p}]_θ̃ ∈ B has rank one and lies in 1 + N^{≥1}B, so ℓ_q(x) := log_q([x^{1/p}]_θ̃) ∈ B is defined; x ↦ ℓ_q(x) is a group homomorphism ℤ_p(1)(B/J) → B with φ(ℓ_q(x)) = [p]_q·ℓ_q(x).

**Hypotheses and conventions.**

- [n]_q = (q^n − 1)/(q − 1); [x^{1/p}]_θ̃ is the canonical rank-one lift of the compatible system of p-power roots through θ̃.

**Proof route.**

1. AL23 Lemma 2.2.2, p. 15 controls divisibility of the products by the q-integers and proves convergence in the prism topology; use that estimate, rather than claim denominators are harmless merely q-adically. The identity with the rescaled logarithm holds after rational formal completion.
2. For (2), rank-one elements with compatible p-power roots lie in 1 + N^{≥1}B by a δ-ring computation (Lemma 2.2.3, p. 15).
3. Frobenius: φ(log_q x) = ((q^p − 1)/log q^p)·log(x^p) = [p]_q log_q(x) by the comparison with log, which uses φ(q) = q^p and δ(x) = 0.
4. Compatibility with the prismatic logarithm of PrismaticCohomology PR.4/prismatic-logarithm: on the q-de Rham prism, ℓ_q and log_Δ differ by the generator e_A of A{1} with (q − 1)e_A = log_Δ(q^p).

**API.**

- `TauCeti.PrismaticDieudonne.qLog` (constructor): log_q on rank-one elements of 1 + N^{≥1}B.
- `TauCeti.PrismaticDieudonne.qLog_mem_nygaard` (other): log_q(x) ∈ N^{≥1}B.
- `TauCeti.PrismaticDieudonne.qLog_mul` (simp): log_q(xy) = log_q(x) + log_q(y) for rank-one x, y.
- `TauCeti.PrismaticDieudonne.qLog_eq_log` (compatibility): log_q(x) = ((q − 1)/log q)·log(x) after inverting p and completing.
- `TauCeti.PrismaticDieudonne.dividedQLog` (constructor): ℓ_q : ℤ_p(1)(B/J) → B, x ↦ log_q([x^{1/p}]_θ̃).
- `TauCeti.PrismaticDieudonne.dividedQLog_frob` (simp): φ(ℓ_q(x)) = [p]_q ℓ_q(x).
- `TauCeti.PrismaticDieudonne.dividedQLog_eq_prismaticLog` (compatibility): Relation with log_Δ of PrismaticCohomology PR.4 through the generator e_A of A{1}.
- `TauCeti.PrismaticDieudonne.q_logarithm_ext` (extensionality): Two homomorphisms from ℤ_p(1)(B/J) to the additive group of B are equal if they agree on every compatible root system.

**Checks.**

- `qLog_one` (degenerate): log_q(1) = 0.
- `qLog_q1` (compatibility): Specialising q ↦ 1 sends log_q to the classical logarithm series.
- `qLog_first_term` (computation): As a formal series over ℚ_p⟦q−1⟧, the coefficient of x−1 in log_q(x) is (q−1)/log q; it specializes to 1 at q=1 and is not identically 1 before specialization.
- `qLog_not_classical` (non-example): For x=q, every summand with n≥2 vanishes, so log_q(q)=q−1 exactly in ℤ_p⟦q−1⟧. The classical logarithm has coefficients 1/n and does not define an element of this integral power-series ring; interpreting it rationally or in the (q−1)-adic topology after inverting p is a different statement.
- At q = 1 (after reduction to a crystalline prism) log_q becomes the classical logarithm log x = Σ (−1)^{n−1}(x − 1)^n/n.
- ℓ_q(ε) for ε = (1, ζ_p, ζ_{p²}, …) is log_q(q^{1/p}·…) and is a generator of the twist after Proposition 4.7.3.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemmas 2.2.2 and 2.2.3, p. 15: constructs the q-logarithm of rank-one elements in 1 + N^{≥1}B for prisms over the q-de Rham prism, compares it with the logarithm, and applies it to Teichmüller lifts of p-power roots of unity.

**Needs.** `PrismaticCohomology:PR.0/q-de-rham-prism`; `PrismaticCohomology:PR.3/nygaard-filtration`; `PrismaticCohomology:PR.4/prismatic-logarithm`; `PrismaticCohomology:PR.0/rank-one-elements`.

### PD.5.2 The prismatic Dieudonné crystal of an étale p-divisible group

**Theorem.** For R quasi-syntomic, ℳ_Δ(ℚ_p/ℤ_p) is the free O^pris-module generated by the class of the pushout of 0 → ℤ_p → ℚ_p → ℚ_p/ℤ_p → 0 along ℤ_p → O^pris, with Frobenius φ. More generally for G étale, ℳ_Δ(G) ≅ ℋom(T_pG, ℤ_p) ⊗_{ℤ_p} O^pris with Frobenius 1 ⊗ φ.

**Hypotheses and conventions.**

- T_pG is a local system of finite free ℤ_p-modules on (R)_qsyn for G étale; ℤ_p denotes the sheaf of continuous ℤ_p-valued functions on π₀.

**Proof route.**

1. Node PD.2/tate-module-description: ℳ_Δ(G) = ℋom(T_pG, O^pris), and T_pG is locally ℤ_p^h (Anschütz–Le Bras, Lemma 4.7.1, pp. 65–66).
2. Closure gap — Compatible infinite p-root covers on the quasi-syntomic site: Plan a compatible tower of p-power-division covers of a p-divisible group whose completed limit is still a cover in the required quasi-syntomic site, and prove exactness of its inverse-limit sequence (AL23 Lemmas 4.2.5–4.2.6, pp. 41–43). Supply the analogous inverse-limit argument for truncated Ext crystals and étale Tate-module local triviality. R07.1/p-divisible-tate-module has a henselian local domain hypothesis and does not supply this sheaf statement.

**Checks.**

- G = (ℚ_p/ℤ_p)^h: ℳ_Δ(G) = (O^pris)^h with φ.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.7.1, pp. 65–66: computes the prismatic Dieudonné crystal of an étale p-divisible group as the dual of its Tate module tensored with O^pris.

**Needs.** §PD.2.6; §PD.2.3.

### PD.5.3 The Breuil–Kisin twist and ℳ_Δ(μ_{p^∞})

**Theorem.** Let O_Δ{−1} := ℋom_{(ℤ_p)_Δ}(u^{-1}ℤ_p(1), O_Δ) ≅ ℰxt¹(u^{-1}μ_{p^∞}, O_Δ), so that ℳ_Δ(μ_{p^∞}) ≅ v_*O_Δ{−1}. On the category of prisms over (ℤ_p⟦q − 1⟧, ([p]_q)), the O_Δ-linear map O_Δ → O_Δ{−1}, 1 ↦ ℓ_q, is an isomorphism, and φ(ℓ_q) = [p]_q·ℓ_q. Hence locally ℳ_Δ(μ_{p^∞}) ≅ (O^pris, ξ̃φ), and O_Δ{−1} is the inverse of the Breuil–Kisin twist O_Δ{1} of PrismaticCohomology PR.3.

**Hypotheses and conventions.**

- The trivialisation is over prisms living over the q-de Rham prism; for general prisms O_Δ{−1} is invertible by descent.

**Proof route.**

1. For (B, J) over the q-de Rham prism, ℰxt¹(u^{-1}Ĝ_m|_{(B,J)}, O_Δ) is locally free of rank one and compatible with base change (node PD.4/pdiv-locally-free), so it suffices to prove surjectivity of 1 ↦ ℓ_q after base change to (W(k), (p)), k algebraically closed.
2. There the crystalline comparison (node PD.4/crystalline-comparison) reduces to the classical fact that the crystalline logarithm log[x] generates the crystalline Dieudonné crystal of μ_{p^∞} (Berthelot–Breen–Messing 2.2.3); at q = 1 the q-logarithm becomes log (Anschütz–Le Bras, Proposition 4.7.3, pp. 66–67).
3. Frobenius: by node q-logarithm, φ(ℓ_q)(x) = [p]_q ℓ_q(x).
4. Agreement with O_Δ{1}^{-1}: both are invertible F-crystals on (ℤ_p)_Δ trivialised over the q-de Rham prism with Frobenius [p]_q, compatibly with the descent data (PrismaticCohomology PR.3/breuil-kisin-twist-examples).

**Checks.**

- Over (W(k), (p)): ℳ_Δ(μ_{p^∞}) = (W(k), pσ), the classical module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 4.7.2, Proposition 4.7.3 and Remark 4.7.4, pp. 66–67: defines O_Δ{−1} as maps from the Tate twist into O_Δ, identifies it with the Dieudonné crystal of μ_{p^∞}, and proves that the q-logarithm trivialises it over the q-de Rham prism with Frobenius multiplication by [p]_q.

**Needs.** §PD.5.1; §PD.4.9; §PD.4.11; §PD.2.3; `PrismaticCohomology:PR.3/breuil-kisin-twist`; `PrismaticCohomology:PR.3/breuil-kisin-twist-examples`.

**Planet:** Dieudonné crystal of μ_{p^∞}.

### PD.5.4 The prismatic Dieudonné crystal of a multiplicative p-divisible group

**Theorem.** Let R be an algebra over ℤ_p[ζ_p] and G a multiplicative p-divisible group over R. Then u^{-1}ℋom(G, μ_{p^∞}) ⊗_{ℤ_p} O_Δ ≅ ℰxt¹(u^{-1}G, O_Δ)|_{(R/A)_Δ}, f ↦ ℳ_Δ(f)(ℓ_q), on prisms over (A, I) = (ℤ_p⟦q − 1⟧, ([p]_q)).

**Hypotheses and conventions.**

- G étale-locally isomorphic to μ_{p^∞}^d.

**Proof route.**

1. The map commutes with étale localisation, so reduce to G ≅ μ_{p^∞}^d and use node bk-twist-trivialisation and additivity (Anschütz–Le Bras, Corollary 4.7.5, p. 67).

**Checks.**

- G = μ_{p^∞}^d: free of rank d with Frobenius [p]_q φ on each basis vector.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Corollary 4.7.5, p. 67: describes the prismatic Dieudonné crystal of a multiplicative p-divisible group through homomorphisms to μ_{p^∞} evaluated on the q-logarithm.

**Needs.** §PD.5.3; §PD.2.3.

### PD.5.5 The functor on homomorphisms from ℚ_p/ℤ_p to μ_{p^∞}

**Theorem.** Let R be quasi-regular semiperfectoid over ℤ_p^cycl, with q = [ε] and ξ̃ = [p]_q. Under ℤ_p(1)(R) ≅ Hom_R(ℚ_p/ℤ_p, μ_{p^∞}) and Hom_{DM(R)}(M_Δ(μ_{p^∞}), M_Δ(ℚ_p/ℤ_p)) ≅ Δ_R^{φ = ξ̃} (evaluation on ℓ_q), the prismatic Dieudonné functor sends x to ℓ_q(x) = log_q([x^{1/p}]_θ̃).

**Hypotheses and conventions.**

- R over ℤ_p^cycl = (colim ℤ_p[ζ_{p^n}])^∧.

**Proof route.**

1. Combine node PD.2/tate-module-description with nodes bk-twist-trivialisation and etale-dieudonne (Anschütz–Le Bras, Lemma 4.7.6, p. 68).

**Checks.**

- Together with the surjectivity of φ/ξ̃ − 1 (node tate-module-recovery) this already gives full faithfulness on Hom(ℚ_p/ℤ_p, μ_{p^∞}).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 4.7.6, p. 68: computes the prismatic Dieudonné functor on homomorphisms from ℚ_p/ℤ_p to μ_{p^∞} as the divided q-logarithm.

**Needs.** §PD.5.3; §PD.5.2; §PD.5.1; §PD.2.6.

### PD.5.6 Compatibility with Cartier duality

**Theorem.** Let R be quasi-syntomic and G a p-divisible group over R. The map Φ_G : ℳ_Δ(G)^∨ ⊗_{O^pris} ℳ_Δ(μ_{p^∞}) → ℳ_Δ(Ǧ), Φ_G(δ ⊗ l)(α) = (δ ∘ ℳ_Δ(α))(l) for α ∈ Hom(G, μ_{p^∞}) ≅ T_pǦ (using ℳ_Δ(Ǧ) ≅ ℋom(T_pǦ, O^pris)), is an isomorphism of prismatic Dieudonné crystals, where the source carries the Frobenius 1 ⊗ δ ⊗ l ↦ φ^*δ ∘ φ_{ℳ_Δ(G)}^{-1} ⊗ φ_{μ}(1 ⊗ l).

**Hypotheses and conventions.**

- ℳ_Δ(μ_{p^∞}) is invertible (node bk-twist-trivialisation); ℳ_Δ(G)^∨ is the O^pris-linear dual.

**Proof route.**

1. Both sides are locally free of rank h (node PD.4/pdiv-locally-free), so it suffices to check surjectivity after base change to perfect fields k.
2. Over k, ℳ_Δ is the crystalline Dieudonné functor (node PD.4/crystalline-comparison); any natural transformation of this shape is determined by its value on μ_{p^∞}, so Φ_G = u·Φ^cl_G for the classical duality isomorphism Φ^cl and a unit u (Anschütz–Le Bras, Proposition 4.6.9, pp. 64–65).

**Checks.**

- G = ℚ_p/ℤ_p: Φ_G identifies O^pris ⊗ ℳ_Δ(μ_{p^∞}) with ℳ_Δ(μ_{p^∞}).
- G = E[p^∞] for an elliptic curve: ℳ_Δ(G) is self-dual up to the twist ℳ_Δ(μ_{p^∞}), matching the Weil pairing.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.9 and the paragraphs before it, p. 64–65: constructs the duality map from the dual of ℳ_Δ(G) twisted by ℳ_Δ(μ_{p^∞}) to ℳ_Δ of the Cartier dual and proves it is an isomorphism by reduction to perfect fields and classical duality.

**Needs.** §PD.4.9; §PD.4.11; §PD.4.12; §PD.5.3; §PD.2.6; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`.

### PD.5.7 The Tate module of the dual as Frobenius-fixed points

**Theorem.** For a quasi-regular semiperfectoid R with an orientation ξ̃, T_pG* is the kernel sheaf of φ/ξ̃−1 : N≥1ℳ_Δ(G) → ℳ_Δ(G). Moreover RΓ((R)_qsyn,T_pG*) is the derived fibre of φ/ξ̃−1 on the evaluated modules N≥1M_Δ(G) → M_Δ(G); the coefficient acyclicity on this basis justifies using evaluated modules rather than raw sheaves inside a global-sections formula.

**Hypotheses and conventions.**

- The cyclotomic normalisation is harmless by descent.
- Work locally over the cyclotomic q-de Rham prism so that ξ̃=[p]_q and the displayed divided-Frobenius normalization is the one in the source; the kernel descriptions glue independently of that choice.

**Proof route.**

1. (1) is the weight-one syntomic computation: ℤ_p(1) is quasi-syntomic-locally T_p(G_m) in degree 0 (PrismaticCohomology PR.4/syntomic-low-weights, Bhatt–Lurie Theorem 7.5.6), and the syntomic complex in weight one is fib(φ₁ − 1 : N^{≥1}Δ{1} → Δ{1}), which over ℤ_p^cycl is untwisted by ℓ_q (node bk-twist-trivialisation).
2. (2) apply RHom(T_pG, −) and use T_pǦ = ℋom(T_pG, T_pG_m) and Ext¹(T_pG, T_pG_m) = Ext¹(G, μ_{p^∞}) = 0 locally (extensions of G by μ_{p^∞} split syntomic-locally since their splittings form a Ǧ-torsor) (Anschütz–Le Bras, Proposition 4.8.2 and Remark 4.8.4, pp. 68–70).
3. Apply internal Rℋom(T_pG,−) to Bhatt–Lurie’s locally exact weight-one sequence, identify both coefficient Hom sheaves using PD.2, and only then apply RΓ. The weight-one supplier is a sheaf/local statement, not an exact sequence of global sections for arbitrary R. The dual group appears in the Tate module, while the two Dieudonné terms contain G (AL23 Remark 4.8.4, p. 70).

**Checks.**

- G = ℚ_p/ℤ_p: T_pǦ = T_pμ_{p^∞} = ker(φ/ξ̃ − 1 on N^{≥1}O^pris), the sequence (1) itself.
- For R = 𝒪_C, global sections recover T_pǦ(𝒪_C) as (N^{≥1}M_Δ(Ǧ))^{φ = ξ̃}.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.8.2 and Remark 4.8.4, pp. 68–70: recovers the Tate module of the dual group as the kernel of φ/ξ̃ − 1 on the first Nygaard piece of the prismatic Dieudonné crystal, from Bhatt–Lurie's exact sequence for T_pG_m, and strengthens it to a fibre sequence computing all cohomology; [Bhargav Bhatt, Jacob Lurie](https://arxiv.org/abs/2201.06120), Theorem 7.5.6: the weight-one syntomic complex of a quasi-regular semiperfectoid ring is the p-adic Tate module of its units in degree zero.

**Needs.** `PrismaticCohomology:PR.4/syntomic-low-weights`; `PrismaticCohomology:PR.4/syntomic-complex`; §PD.5.3; §PD.2.6; §PD.1.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`.

**Planet:** Tate module as Frobenius fixed points.

### PD.5.8 Full faithfulness over quasi-regular semiperfectoid rings

**Theorem.** For R quasi-regular semiperfectoid, M_Δ : BT(R) → DM(R) is fully faithful.

**Hypotheses and conventions.**

- R quasi-regular semiperfectoid (reduce to R over ℤ_p^cycl by descent).
- Full faithfulness means Hom(G,H) ≃ Hom_DM(ℳ_Δ(H),ℳ_Δ(G)); the direction of the two inputs is reversed.

**Proof route.**

1. Write ℛ : Sh_R^op → 𝒟_R, F ↦ ℋom(F, O^pris), from abelian sheaves to O^pris[F]-modules, with left adjoint ℒ(M) = ℋom_{O^pris[F]}(M, O^pris); M_Δ(G) = ℛ(T_pG) (node PD.2/tate-module-description).
2. For F = T_pG the counit ℒℛF → F is an isomorphism: node tate-module-recovery applied to Ǧ gives F ≅ (ℳ_Δ(Ǧ))^{φ = ξ̃}, and Cartier duality (node cartier-duality) with ℳ_Δ(μ_{p^∞}) = (O^pris, ξ̃φ) rewrites this as ℒ(ℳ_Δ(G)).
3. The two natural isomorphisms differ by a natural endomorphism of all p-divisible groups, i.e. a locally constant scalar in ℤ_p; it is a unit, as seen on ℚ_p/ℤ_p (Anschütz–Le Bras, Theorem 4.8.1 and Proposition 4.8.3, pp. 68–70).

**Checks.**

- For G = H = μ_{p^∞} over 𝒪_C, End = ℤ_p = End_{DM}(A_inf, ξ̃φ).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.8.1 and Proposition 4.8.3, pp. 68–70: proves full faithfulness over quasi-regular semiperfectoid rings by showing that the adjunction between sheaves and O^pris[F]-modules is an isomorphism on Tate modules, via the Frobenius-fixed-point description and Cartier duality (argument of Akhil Mathew).

**Needs.** §PD.5.7; §PD.5.6; §PD.2.6; §PD.5.5.

### PD.5.9 Essential surjectivity over quasi-regular semiperfectoid rings

**Theorem.** For R quasi-regular semiperfectoid, M_Δ : BT(R) → DM^adm(R) (admissible prismatic Dieudonné modules) is essentially surjective.

**Hypotheses and conventions.**

- The source states the target as admissible crystals; modules are meant (source issue AL23 E1 of the paper extraction, recorded in sourceIssues).

**Proof route.**

1. It suffices to work on a quasi-syntomic cover: descent data for M_Δ(G′) give descent data for G′ by full faithfulness (node full-faithfulness) and p-divisible groups form a stack (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/p-complete-flat-descent).
2. Choose a perfect prism (A, I) with Ā = A/I ↠ R, henselian along the kernel, and (after a cover) generators a_j of the kernel with compatible p-power roots; put S = (Ā⟨X_j^{1/p^∞}⟩/(X_j))^∧ and S̃ = Ā⟦X_j^{1/p^∞}⟧ (perfectoid).
3. DM^adm(S) → DM^adm(R) is essentially surjective: Δ_S → Δ_R is surjective by the Hodge–Tate comparison and henselian along its kernel; lift windows by normal decompositions (Anschütz–Le Bras, Lemma 4.9.1).
4. DM^adm(S̃) → DM^adm(S) is essentially surjective: Δ_S = Δ_S̃{X_j/ξ̃}^∧, the kernel K of α : Δ_S → B = Δ_S̃/(X_j) is topologically generated by z_{j,n} = X_j^{p^n}/(φ^n(ξ̃)⋯ξ̃^{p^n}) (PrismaticCohomology PR.0/prismatic-envelope-rank-one-presentation), φ(K) ⊆ ξ̃Δ_S and φ/ξ̃ is topologically nilpotent on K (Lemma 4.9.3), so windows over Δ_S and B agree (node PD.0/window-deformation); windows over B lift to Δ_S̃ by henselian lifting of unit φ-modules (node PD.0/unit-frobenius-deformation) (Lemmas 4.9.2–4.9.4).
5. Over the perfectoid S̃ every admissible module comes from a p-divisible group (node PD.3/perfectoid-prismatic-classification); base change to R (Theorem 4.9.5, pp. 73–74).

**Checks.**

- For R perfectoid the statement is node PD.3/perfectoid-prismatic-classification.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemmas 4.9.1–4.9.4 and Theorem 4.9.5, pp. 70–74: proves essential surjectivity by descending to a quasi-syntomic cover, lifting windows along henselian surjections of prisms with topologically nilpotent divided Frobenius on the kernel, and reducing to the perfectoid case.

**Needs.** §PD.5.8; §PD.3.8; §PD.0.12; §PD.0.11; §PD.0.6; §PD.1.9; §PD.1.13; §PD.1.5; `PrismaticCohomology:PR.0/prismatic-envelope-rank-one-presentation`; `PrismaticCohomology:PR.0/transversal-prism-regular-sequences`; `PrismaticCohomology:PR.2/qrsp-prism`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-complete-flat-descent`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/henselian-lifting-p-divisible`; `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`.

### PD.5.10 Prismatic Dieudonné theory classifies p-divisible groups (Anschütz–Le Bras)

**Theorem.** Let R be a quasi-syntomic ring. The prismatic Dieudonné functor ℳ_Δ : BT(R) → DM^adm(R), G ↦ (ℳ_Δ(G), φ_{ℳ_Δ(G)}), is an antiequivalence between p-divisible groups over R and admissible prismatic Dieudonné crystals over R. It is exact, compatible with base change in R and with Cartier duality (node cartier-duality), ℳ_Δ(G) has rank the height of G and ℳ_Δ(G)/Fil ≅ Lie(Ǧ) ⊗ 𝒪. The same holds for p-divisible groups over a quasi-syntomic p-adic formal scheme.

**Hypotheses and conventions.**

- R quasi-syntomic (p-complete, bounded p^∞-torsion, L_{R/ℤ_p} of p-complete Tor-amplitude in [−1, 0]).

**Proof route.**

1. Both sides are stacks for the quasi-syntomic topology (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/p-complete-flat-descent; node PD.1/dieudonne-crystal-stack), and quasi-regular semiperfectoid rings form a basis (DerivedDeRhamCohomology DD.5/qrsp-refinement), so assume R quasi-regular semiperfectoid.
2. There crystals are modules (node PD.1/crystals-modules-qrsp), the functor lands in admissible objects (node PD.4/admissibility-and-lie), and it is fully faithful (node full-faithfulness) and essentially surjective (node essential-surjectivity) (Anschütz–Le Bras, Theorem 4.6.10, p. 65; Theorems 1.4.1 and 1.4.4 of the introduction, pp. 7–8).
3. Formal schemes: glue over an affine open cover using the stack property.

**Checks.**

- R perfectoid: minuscule BKF modules (node PD.3/perfectoid-prismatic-classification).
- R = k perfect: classical Dieudonné modules (node PD.4/classical-comparison).
- R = 𝒪_K: minuscule Breuil–Kisin modules (node PD.7/breuil-kisin-comparison).
- R = ℤ_p⟨T⟩ (p-adically completed polynomial ring, quasi-syntomic and not quasi-regular semiperfectoid): p-divisible groups are admissible crystals glued from a perfectoid cover.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 4.6.10, p. 65; Theorems 1.4.1 and 1.4.4, pp. 7–8: states and proves that the prismatic Dieudonné functor is an antiequivalence between p-divisible groups and admissible prismatic Dieudonné crystals over any quasi-syntomic ring, by descent to quasi-regular semiperfectoid rings.

**Needs.** §PD.5.9; §PD.5.8; §PD.4.14; §PD.4.15; §PD.5.6; §PD.1.7; §PD.1.11; `DerivedDeRhamCohomology:DD.5/qrsp-refinement`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-complete-flat-descent`.

**Planet:** Prismatic Dieudonné classification.

### PD.5.11 An explicit quasi-inverse, and étale p-divisible groups as unit-root crystals

**Theorem.** For quasi-syntomic R and an admissible crystal ℳ, define T(ℳ) = ℋom_{O^pris,φ}(ℳ,O^pris): a section f is O^pris-linear and satisfies fφ_ℳ = φf. Then G(ℳ) = T(ℳ)⊗_{ℤ_p}(ℚ_p/ℤ_p) is the p-divisible sheaf quasi-inverse to the contravariant classification. For ℳ=ℳ_Δ(G), T(ℳ) ≅ T_pG. Unit-root prismatic Dieudonné crystals correspond to étale p-divisible groups.

**Hypotheses and conventions.**

- The source notes that it seems difficult to see directly that 𝒢 takes values in p-divisible groups; (1) is deduced from node main-classification.

**Proof route.**

1. For ℳ=ℳ_Δ(G), Cartier duality and the Tate-recovery theorem identify the sheaf of Frobenius-compatible linear maps ℋom_{O^pris,φ}(ℳ,O^pris) with T_pG exactly. Tensoring with ℚ_p/ℤ_p reconstructs G by the quasi-syntomic sheaf sequence, subject to the recorded compatible-root-cover gap (AL23 Remark 4.9.6, p. 74). There is no unspecified extra Tate twist.
2. For étale G, ℳ_Δ(G) = ℋom(T_pG, ℤ_p) ⊗ O^pris has bijective linearised Frobenius (node etale-dieudonne), and conversely a unit-root crystal is admissible with Fil = N^{≥1}·ℳ; apply node main-classification.
3. Closure gap — Compatible infinite p-root covers on the quasi-syntomic site: Plan a compatible tower of p-power-division covers of a p-divisible group whose completed limit is still a cover in the required quasi-syntomic site, and prove exactness of its inverse-limit sequence (AL23 Lemmas 4.2.5–4.2.6, pp. 41–43). Supply the analogous inverse-limit argument for truncated Ext crystals and étale Tate-module local triviality. R07.1/p-divisible-tate-module has a henselian local domain hypothesis and does not supply this sheaf statement.
4. This Hom equation is meaningful before inverting I; the naive dual crystal can carry only a rational Frobenius, so writing an unspecified integral endomorphism φ on ℳ∨ and taking its kernel is insufficient. The sheaf reconstruction uses the compatible-root-cover gap in PD.2.

**Checks.**

- ℳ = (O^pris, φ): (O^pris)^{φ=1} = ℤ_p and 𝒢(ℳ) = ℚ_p/ℤ_p.
- Over a perfect field k, (2) is the equivalence between ℤ_p-representations of Gal(k̄/k) and unit-root F-crystals over W(k).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 4.9.6, p. 74: gives the quasi-inverse ℳ ↦ (ℳ^∨)^{φ=1} ⊗ ℚ_p/ℤ_p and deduces the classification of ℤ_p-local systems by unit-root prismatic F-crystals, generalising Katz.

**Needs.** §PD.5.10; §PD.5.2; §PD.5.7; §PD.5.6.

### PD.5.12 Crystalline Dieudonné theory over quasi-syntomic F_p-algebras

**Theorem.** Let R be quasi-syntomic with pR = 0. The contravariant crystalline Dieudonné functor G ↦ 𝔻(G) is an antiequivalence between p-divisible groups over R and the crystalline Dieudonné crystals (finite locally free crystals on (R/ℤ_p)_crys with F and V, FV = VF = p) whose restriction to the quasi-syntomic site is an admissible prismatic Dieudonné crystal under node PD.4/opris-ocrys. In particular it is fully faithful.

**Hypotheses and conventions.**

- pR = 0 and R quasi-syntomic. For excellent lci rings full faithfulness is de Jong–Messing; for F-finite lci rings the antiequivalence is Lau's.

**Proof route.**

1. Combine node main-classification with the crystalline comparison (node PD.4/crystalline-comparison), and identify finite locally free 𝒪^crys-modules on the quasi-syntomic site with crystalline crystals through quasi-regular semiperfect rings, where both are finite projective A_crys-modules (Anschütz–Le Bras, Remark 1.4.7, p. 8, and the paragraph after Lemma 4.3.1, p. 44).

**Checks.**

- R = k perfect: classical Dieudonné theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/dieudonne-p-divisible).
- R = 𝒪_C/p: recovers the integral full faithfulness of Scholze–Weinstein (R07.2/sw-dieudonne-semiperfect) for quotients of perfect rings by regular sequences.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Remark 1.4.7, p. 8: deduces from the main theorem and the crystalline comparison that the crystalline Dieudonné functor is an antiequivalence over quasi-syntomic rings of characteristic p, extending de Jong–Messing and Lau.

**Needs.** §PD.5.10; §PD.4.11; §PD.4.10; `CrystallineCohomology:CR.7/dieudonne-evaluation`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/sw-dieudonne-semiperfect`.

## Layer PD.6: Finite locally free group schemes over perfectoid and perfect bases

Torsion Dieudonné triples over perfectoid rings, exact base change and finite locally free group classification. Cartier duality uses Ext¹_A(M,A)⊗M_Δ(μ_{p∞}), with operators induced from a dual isogeny presentation. Include the Česnavičius–Scholze covariant normalization and perfect-base crystalline classification. Sources: AL23 §5.1, pp. 75–77; Lau18 §10, pp. 26–29; CS24 §§4.1–4.2, pp. 36, 41.

### PD.6.1 Torsion prismatic Dieudonné modules over a perfectoid ring

**Definition.** Let R be perfectoid, ξ a generator of ker θ and ξ̃ = φ(ξ). A torsion prismatic Dieudonné module over R is a triple (M, φ_M, ψ_M) with M a finitely presented A_inf(R)-module of projective dimension ≤ 1 killed by a power of p, φ_M : M → M φ-semilinear and ψ_M : M → M φ^{-1}-semilinear, such that φ_M ∘ ψ_M = ξ̃ and ψ_M ∘ φ_M = ξ. DM_tors(R) is the exact category of these, with maps commuting with φ_M and ψ_M and exact sequences those of underlying modules.

**Hypotheses and conventions.**

- R perfectoid. The two relations use the semilinearity conventions of the source: φ_M ∘ ψ_M is multiplication by ξ̃ and ψ_M ∘ φ_M multiplication by ξ.

**Proof route.**

1. Bundle the data (Anschütz–Le Bras, Definition 5.1.1, p. 75).
2. Locally on Spec R every object is the cokernel of an injective map of prismatic Dieudonné modules (an isogeny), because a finitely presented p-power-torsion module of projective dimension ≤ 1 has a two-term resolution by finite projectives on which φ_M lifts (Lau 2018, Lemma 10.10).

**API.**

- `TauCeti.PrismaticDieudonne.TorsionDieudonneModule` (structure): The triples (M, φ_M, ψ_M).
- `TauCeti.PrismaticDieudonne.TorsionDieudonneModule.exactCategory` (instance): The exact structure: sequences exact on underlying A_inf-modules.
- `TauCeti.PrismaticDieudonne.TorsionDieudonneModule.baseChange` (functoriality): Base change along a map of perfectoid rings (exact by node torsion-base-change).
- `TauCeti.PrismaticDieudonne.TorsionDieudonneModule.ofIsogeny` (constructor): Cokernel of an injective map of prismatic Dieudonné modules that becomes an isomorphism after inverting p (equivalently with p-power-torsion cokernel).
- `TauCeti.PrismaticDieudonne.TorsionDieudonneModule.perfectField` (compatibility): Over a perfect field k, ξ = ξ̃ = p and (M, φ_M, ψ_M) is a finite-length Dieudonné module with F = φ_M, V = ψ_M.
- `TauCeti.PrismaticDieudonne.torsion_dieudonne_module_ext` (extensionality): Two torsion Dieudonné morphisms are equal when their A_inf-linear maps agree.

**Checks.**

- `TorsionDieudonneModule.zp_mod` (computation): (A_inf(R)/p^n, ξ̃·φ, φ^{-1}) is a torsion prismatic Dieudonné module: φ∘ψ = ξ̃ and ψ∘φ = φ^{-1}(ξ̃) = ξ (it is M_Δ(μ_{p^n}) in the contravariant normalisation).
- `TorsionDieudonneModule.zero` (degenerate): The zero module is an object and the zero object.
- `TorsionDieudonneModule.not_pd1` (non-example): For R = 𝒪_C, A_inf/(p, [p^♭]) with any φ, ψ is excluded: it has projective dimension 2 over A_inf.
- `TorsionDieudonneModule.perfect_field` (compatibility): Over a perfect field the category is that of finite-length Dieudonné modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2).
- For pⁿ : M → M, the quotient has induced semilinear maps φ_M and ψ_M satisfying φ_Mψ_M=ξ̃ and ψ_Mφ_M=ξ. The inverse-type map is the one from the integral Frobenius matrix factorization; a rational inverse is not automatically an endomorphism of a torsion module.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 5.1.1, p. 75: defines torsion prismatic Dieudonné modules over a perfectoid ring as finitely presented p-power-torsion A_inf-modules of projective dimension at most one with φ and φ^{-1}-semilinear maps composing to ξ̃ and ξ; [Eike Lau](https://arxiv.org/abs/1603.07831), Definition 10.5 and Lemma 10.10: the corresponding torsion objects over perfectoid rings and their presentation as cokernels of isogenies.

**Needs.** §PD.1.8; §PD.3.8; `PrismaticCohomology:PR.0/ainf-prism`; Mathlib `Module.FinitePresentation`.

### PD.6.2 Base change of torsion prismatic Dieudonné modules is exact

**Theorem.** For a map R → R′ of perfectoid rings and M ∈ DM_tors(R), M ⊗^L_{A_inf(R)} A_inf(R′) is concentrated in degree 0; hence DM_tors(R) → DM_tors(R′) is exact.

**Hypotheses and conventions.**

- R, R′ perfectoid.

**Proof route.**

1. Take a resolution 0 → M₁ →^f M₂ → M → 0 by finite projectives; p^n kills M, so there is g with f ∘ g = p^n = g ∘ f; since A_inf(R′) is p-torsion-free, the base change of f stays injective (Anschütz–Le Bras, Lemma 5.1.2, p. 75).

**Checks.**

- Base change to a perfect field: M ⊗ W(k) is the classical Dieudonné module of the special fibre.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 5.1.2, p. 75: proves exactness of base change of torsion prismatic Dieudonné modules using a two-term resolution split up to p^n and p-torsion-freeness of A_inf.

**Needs.** §PD.6.1; `PrismaticCohomology:PR.0/ainf-prism`.

### PD.6.3 Classification of finite locally free group schemes over a perfectoid ring

**Theorem.** Let R be perfectoid. There is a natural exact antiequivalence H ↦ (M_Δ(H), φ_{M_Δ(H)}, ψ_{M_Δ(H)}) from the exact category of finite locally free commutative group schemes of p-power order over R to DM_tors(R), with M_Δ(H) = Ext¹_{(R)_Δ}(u^{-1}H, O_Δ) and φ induced by the Frobenius of O_Δ; its quasi-inverse is exact as well.

**Hypotheses and conventions.**

- R perfectoid; no restriction on p (Lau 2018, Theorem 10.12 needs p ≥ 3).
- All primes are included by AL23 Theorem 5.1.4; Lau18 Theorem 10.12 alone is stated for p≥3 and is not an all-p supplier.

**Proof route.**

1. Construction: Zariski-locally every H is the kernel of an isogeny of p-divisible groups of abelian schemes (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/raynaud-abelian-embedding), and every torsion module the cokernel of an isogeny of prismatic Dieudonné modules; apply node PD.3/perfectoid-prismatic-classification in place of Lau's Theorem 9.8 (Anschütz–Le Bras, proof of Theorem 5.1.4, p. 76).
2. M_Δ(H) = Ext¹(u^{-1}H, O_Δ): for H = ker(X → X′), Ext¹(u^{-1}X, O_Δ) → Ext¹(u^{-1}H, O_Δ) is surjective because Ext²(u^{-1}X′, O_Δ) = 0 (node PD.4/abelian-prismatic-ext).
3. Exactness: surjectivity of M_Δ(H) → M_Δ(H′) is local and reduces to abelian schemes as above; injectivity of M_Δ(H″) → M_Δ(H) needs Hom(u^{-1}H′, O_Δ) = 0, which holds as it is p-power torsion and embeds in H⁰(H′, Δ_{H′/A_inf}), p-torsion-free for the p-completely syntomic H′ (PrismaticCohomology PR.1/p-torsion-free-h0-syntomic).
4. Exactness of the inverse: by node torsion-base-change and compatibility with base change reduce to R a perfect field (Gabber–Ramero), where both categories are abelian (Anschütz–Le Bras, p. 77).

**Checks.**

- ℤ/p^n ↦ (A_inf/p^n, φ, ξ·φ^{-1}) (the cokernel of p^n on M_Δ(ℚ_p/ℤ_p) = (A_inf, φ)) and μ_{p^n} ↦ (A_inf/p^n, ξ̃φ, φ^{-1}) in the contravariant normalisation.
- α_p over a perfect field k ↦ (k, 0, 0).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 5.1.4 and its proof, Lemma 5.1.6, pp. 75–77: classifies finite locally free group schemes of p-power order over a perfectoid ring by torsion prismatic Dieudonné modules, with the explicit Ext formula, exactness of both directions, and the removal of the hypothesis p ≥ 3; [Eike Lau](https://arxiv.org/abs/1603.07831), Theorem 10.12: the classification of finite locally free group schemes over perfectoid rings for p ≥ 3.

**Needs.** §PD.6.1; §PD.6.2; §PD.3.8; §PD.4.4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-abelian-embedding`; `PrismaticCohomology:PR.1/p-torsion-free-h0-syntomic`; §PD.1.1.

**Planet:** Finite flat group schemes over perfectoid rings.

### PD.6.4 Cartier duality for finite locally free group schemes

**Theorem.** Let R be perfectoid, A=A_inf(R), H a finite locally free group scheme of p-power order, and L=M_Δ(μ_{p∞}). There is a natural identification of underlying A-modules M_Δ(H*) ≃ Ext¹_A(M_Δ(H),A)⊗_A L. Its Frobenius and inverse-type operator are induced by dualizing an isogeny presentation; this gives Cartier duality in the torsion category. The twist L is indispensable.

**Hypotheses and conventions.**

- M_Δ(H) is finitely presented of projective dimension at most one and killed by a p-power. The formula is asserted on perfectoid bases only.

**Proof route.**

1. Locally write H=ker(G₀→G₁) with a p-isogeny of p-divisible groups. Contravariance gives 0→M₁→M₀→M_Δ(H)→0.
2. Cartier duality of p-divisible groups identifies M_Δ(Gᵢ*) with Mᵢ∨⊗L. The cokernel of M₀∨⊗L→M₁∨⊗L is Ext¹_A(M_Δ(H),A)⊗L; Hom_A(M_Δ(H),A)=0 since A is p-torsion-free.
3. Transport the two operators through these dual presentations. Independence of the presentation and gluing follow from the finite-group classification and the functorial duality of p-divisible groups. This is a deduction from the two cited results, not the content of Remark 5.1.7.

**Checks.**

- Over a perfect field k, Cartier duality exchanges ℤ/p and μ_p. Omitting L would leave the Frobenius twist wrong.
- The zero group gives the zero module, and applying Cartier duality twice gives back H.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.6.9, pp. 64–65; Theorem 5.1.4 and proof, pp. 75–77: p-divisible Cartier duality and the isogeny-presentation construction; their two-term dual yields the stated Ext¹ formula.

**Needs.** §PD.5.6; §PD.6.1; §PD.6.3.

### PD.6.5 The covariant prismatic Dieudonné module over perfectoid rings

**Theorem.** Let A be perfectoid and ξ a generator of ker(A_inf(A) → A). The functor G ↦ 𝕄(G) := Ext¹_{A_Δ}(u^{-1}G^*, 𝒪_Δ) = M_Δ(G^*) is a covariant equivalence, compatible with base change, from commutative finite locally free A-groups of p-power order to finitely presented p-power-torsion A_inf(A)-modules of projective dimension ≤ 1 with a Frob-semilinear F and a Frob^{-1}-semilinear V such that FV = Frob(ξ) and VF = ξ; it is exact with exact inverse, 𝕄(μ_{p^n}) = (A_inf/p^n, F = Frob, V = ξ·Frob^{-1}), 𝕄(ℤ/p^n) = (A_inf/p^n, F = Frob(ξ)·Frob, V = Frob^{-1}), and for the p^n-torsion of a p-divisible group 𝕄(G) is finite projective over A_inf/p^n. For perfect F_p-algebras it agrees with the crystalline functor of node perfect-base-classification.

**Hypotheses and conventions.**

- Česnavičius–Scholze write ξ for the generator called ξ here and Frob(ξ) for ξ̃; the passage G ↦ G^* converts the contravariant functor of node finite-group-classification into a covariant one, exchanging the roles of φ and ψ.
- Constant height determines a constant rank; it does not trivialize a vector bundle over a nonlocal ring. In the covariant convention evaluate the contravariant functor on G* and retain its φ and ψ; Cartier duality is not defined by simply swapping the two semilinear operators on the same module.

**Proof route.**

1. Compose node finite-group-classification with Cartier duality (exact) and set F = φ_{M_Δ(G^*)}, V = ψ_{M_Δ(G^*)} (Česnavičius–Scholze, §4.2.1, p. 41).
2. Examples: Anschütz–Le Bras, Lemma 4.7.1 for ℤ/p^n and node PD.5/bk-twist-trivialisation for μ_{p^n} (Česnavičius–Scholze, Example 4.2.2).
3. Exactness: Lemma 4.2.3 of Česnavičius–Scholze, from the exactness in node finite-group-classification.

**Checks.**

- 𝕄(ℤ/p) = A_inf/p with F = Frob(ξ)Frob and V = Frob^{-1}; over a perfect field k this is (k, F = 0, V = Frob^{-1}).
- 𝕄 of a p-divisible group's p^n-torsion is free over A_inf/p^n when the group has constant height.

**Sources.** [Kęstutis Česnavičius, Peter Scholze](https://arxiv.org/abs/1912.10932v3), §4.2.1, Example 4.2.2 and Lemma 4.2.3, p. 41: states the covariant classification of finite locally free groups of p-power order over perfectoid rings by A_inf-modules with F, V satisfying FV = Frob(ξ), VF = ξ, its examples μ_{p^n} and ℤ/p^n, and its exactness, citing the prismatic theory.

**Needs.** §PD.6.3; §PD.6.4; §PD.5.2; §PD.5.3.

### PD.6.6 Crystalline Dieudonné theory over perfect F_p-schemes (Berthelot, Gabber, Lau)

**Theorem.** For a perfect F_p-scheme S there is a covariant equivalence G ↦ 𝕄(G) from commutative finite locally free S-groups locally of p-power order to quasi-coherent W(𝒪_S)-modules 𝕄 with Frobenius-semilinear F and Frobenius^{-1}-semilinear V, FV = VF = p, whose sections over every affine Spec R ⊆ S are finitely presented over W(R), killed by a power of p and of projective dimension ≤ 1. Zariski-locally 𝕄(G) = coker(𝕄(H₀) ↪ 𝕄(H₁)) for 0 → G → H₀ → H₁ → 0 with H_i p-divisible, where 𝕄(H) is the value of the covariant Dieudonné crystal ℰxt¹_crys(H^*, 𝒪) on (S, W_n(𝒪_S))_n; its formation commutes with base change along perfect S-schemes; it is exact with exact inverse; 𝕄(ℤ/p^n) = (W(𝒪_S)/p^n, F = p·Frob, V = Frob^{-1}) and 𝕄(μ_{p^n}) = (W(𝒪_S)/p^n, F = Frob, V = p·Frob^{-1}). On affine perfect S = Spec R it agrees with node covariant-normalisation for the perfectoid ring R (ξ = p).

**Hypotheses and conventions.**

- S perfect of characteristic p; W(𝒪_S) the Zariski sheaf of Witt vectors.

**Proof route.**

1. Affine case S = Spec R: R is perfectoid with A_inf(R) = W(R) and ξ = p; node covariant-normalisation gives the equivalence, and node PD.4/crystalline-comparison identifies 𝕄 with the crystalline covariant module (Anschütz–Le Bras, Proposition 4.3.6 for perfect R; Česnavičius–Scholze, §4.1.1 and §4.2.1, pp. 36, 41).
2. Glue Zariski-locally: both sides are Zariski sheaves and the functor commutes with localisation and perfect base change.
3. Exactness: the crystalline Dieudonné functor on p-divisible groups is exact (Berthelot–Breen–Messing 1.1.7, 3.3.3), and the snake lemma after embedding short exact sequences into sequences of p-divisible groups (Česnavičius–Scholze, Lemma 4.1.3, p. 36).
4. The theorem was first Gabber's (unpublished, after Berthelot 1980, Théorème 3.4.1 for perfect valuation rings, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/berthelot-perfect-valuation-rings) and was reproved by Lau (2013, Corollary 6.5).

**Checks.**

- Over S = Spec k, k a perfect field: classical covariant Dieudonné theory of finite group schemes.
- α_p over a perfect ring R ↦ (R, F = 0, V = 0) as a W(R)/p-module.
- Over a perfect ring with nontrivial idempotents R = k × k′, 𝕄 decomposes as the product of the two field cases.

**Sources.** [Kęstutis Česnavičius, Peter Scholze](https://arxiv.org/abs/1912.10932v3), §4.1.1, Example 4.1.2 and Lemma 4.1.3, p. 36: recalls the covariant crystalline classification of finite locally free groups of p-power order over perfect F_p-schemes by W(𝒪_S)-modules with F and V, its Zariski-glued construction from p-divisible groups, its examples and its exactness; [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 4.3.6, first paragraph, p. 48: over a perfect ring the prismatic and Scholze–Weinstein functors both identify with the crystalline Dieudonné module.

**Needs.** §PD.6.5; §PD.4.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/berthelot-perfect-valuation-rings`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`; `CrystallineCohomology:CR.7/dieudonne-evaluation`; Mathlib `WittVector`.

**Planet:** Dieudonné theory over perfect bases.

## Layer PD.7: Regular local rings, displays and the étale comparison

Import regular perfectoid towers, prove automatic admissibility and the one-variable Breuil–Kisin comparison with its separate characteristic-p connection gap; identify Kisin via the parent Fargues-pair compatibility. Own Witt frames, all-window displays, the correctly normalized Nygaard map, general formal groups and the display functor. The unrestricted Zink–Lau comparison is unverified; its printed prismatic proof is retracted. Étale comparison distinguishes the integral v-site, α and generic-fibre j. Sources: AL23 §§5.2–5.4, pp. 78–93 and erratum; Zink02; Lau08 attribution only.

### PD.7.1 Quasi-syntomic perfectoid covers of complete regular local rings

**Theorem.** Let R be a complete regular local ring with perfect residue field k of characteristic p. There is a quasi-syntomic cover R → R_∞ with R_∞ perfectoid.

**Hypotheses and conventions.**

- R complete noetherian regular local, residue field perfect of characteristic p.

**Proof route.**

1. A faithfully flat map to a perfectoid ring exists: the p-adic completion of the colimit of the finite flat regular tower of PerfectoidSpaces P7.17 (Bhatt–Iyengar–Ma, Theorem 4.7, Example 3.8).
2. If pR = 0 or R is unramified, Λ → R (Λ = F_p or ℤ_p) is a filtered colimit of smooth maps, so L_{R/Λ} has p-complete Tor-amplitude in degree 0, while L_{R_∞/Λ} has amplitude in degree −1 (perfectoid); the transitivity triangle gives amplitude [−1, 0] for L_{R_∞/R} (DerivedDeRhamCohomology DD.0/cotangent-transitivity).
3. If R is ramified of mixed characteristic, R → R_∞ is the p-completion of a colimit of syntomic maps extracting p-th roots, hence quasi-syntomic (Anschütz–Le Bras, Proposition 5.2.1, p. 78).

**Checks.**

- R = W(k)⟦u⟧: R_∞ is the completion of W(k)[p^{1/p^∞}]⟦u^{1/p^∞}⟧.
- R = k⟦u⟧: R_∞ = k⟦u^{1/p^∞}⟧ completed, a perfect ring.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 5.2.1 and Remark 5.2.2, p. 78: constructs a quasi-syntomic perfectoid cover of a complete regular local ring with perfect residue field from the faithfully flat perfectoid cover of Bhatt–Iyengar–Ma and a cotangent-complex computation.

**Needs.** `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`; `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`; Mathlib `IsRegularLocalRing`; `PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower`.

### PD.7.2 Over a complete regular local ring every prismatic Dieudonné crystal is admissible

**Theorem.** Let R be a complete regular local ring with perfect residue field of characteristic p. Then DM^adm(R) = DM(R).

**Hypotheses and conventions.**

- As in node regular-perfectoid-cover.

**Proof route.**

1. Base change (ℳ, φ_ℳ) to the perfectoid cover R_∞ (node regular-perfectoid-cover); there it is admissible (node PD.1/admissible-over-perfectoid); the descent datum is a datum in the full subcategory DM^adm, so (ℳ, φ_ℳ) descends to an admissible crystal (node PD.1/dieudonne-crystal-stack; Anschütz–Le Bras, Proposition 5.2.3, p. 78).

**Checks.**

- R = 𝒪_K: every prismatic Dieudonné crystal over 𝒪_K is admissible.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 5.2.3, p. 78: shows that every prismatic Dieudonné crystal over a complete regular local ring with perfect residue field is admissible, by descent from a perfectoid quasi-syntomic cover.

**Needs.** §PD.7.1; §PD.1.10; §PD.1.7; §PD.1.11.

### PD.7.3 p-divisible groups over 𝒪_K are minuscule Breuil–Kisin modules (prismatic proof)

**Theorem.** Let R be a complete regular local ring of dimension at most one with perfect residue field k of characteristic p. For dimension zero use (A,I)=(W(k),(p)); for R=k⟦u⟧ use (W(k)⟦u⟧,(p)); for a mixed-characteristic DVR use its Breuil–Kisin prism (W(k)⟦u⟧,(E(u))), with δ(u)=0. The target is the contravariant equivalence BT(R)^op ≃ BK_min(A) given by evaluating the prismatic Dieudonné crystal. The mixed-characteristic case recovers Kisin for odd p and Kim–Lau–Liu for p=2; the characteristic-p connection step remains a recorded gap.

**Hypotheses and conventions.**

- dim R ≤ 1, i.e. R = 𝒪_K for a complete discretely valued K of characteristic 0 with perfect residue field, R = k⟦u⟧, or R = k. The source states the theorem for every complete regular local ring but writes its proof only for d = 1 (source issue PrismaticCohomologyPartII/E1); for d ≥ 2 the classification of p-divisible groups by Breuil windows over W(k)⟦u₁, …, u_d⟧ is Lau's (p odd, Lau 2010, Theorem 1.1; p = 2, Lau 2014), whose identification with the prismatic functor is a recorded gap.
- For dim R=0, R=k and use (A,I)=(W(k),(p)). For dim R=1 in characteristic p, use (W(k)⟦u⟧,(p)); p is not an Eisenstein polynomial in u. The mixed-characteristic DVR case uses its actual Eisenstein polynomial E(u).

**Proof route.**

1. pR = 0: node PD.4/crystalline-comparison plus the classical description of Dieudonné crystals over k⟦u⟧ as minuscule Breuil–Kisin modules with a connection, which is unique for this A (de Jong, Proposition 2.7.3).
2. R p-torsion-free: by node PD.5/main-classification and node regular-automatic-admissibility, BT(R)^op ≃ DM(R). The Breuil–Kisin prism covers the final object of Shv((R)_Δ) (Lemma 5.2.7: any prism lifts R → R_∞ by Proposition 3.3.8, and then lives over the perfection of A), so a crystal is a minuscule Breuil–Kisin module over A with a descent datum over the self-coproduct B = A ⊗̂ A.
3. The descent datum is automatic: for the kernel J of B → A, J ⊆ N^{≥1}B, φ₁(J) ⊆ J and φ₁ = φ/E is topologically nilpotent on J (Lemma 5.2.8), so window base change along B → A is fully faithful (node PD.0/window-deformation) and evaluation on (A, I) is an equivalence (Anschütz–Le Bras, Theorem 5.2.5 and Lemmas 5.2.7–5.2.8, pp. 79–85).
4. Closure gap — Characteristic-p connection in the regular Breuil–Kisin comparison: For R=k⟦u⟧ prove existence and uniqueness of the integrable topologically quasi-nilpotent horizontal connection on the relevant minuscule module, as used in AL23 Theorem 5.2.5, p. 79 (which refers to de Jong Proposition 2.7.3). The general crystalline evaluation supplier does not state this automatic-connection theorem. The mixed-characteristic DVR proof in AL23 pp. 79–84 does not prove this separate characteristic-p step.

**Checks.**

- G = μ_{p^∞} over 𝒪_K ↦ (𝔖, E·φ) up to a unit; G = ℚ_p/ℤ_p ↦ (𝔖, φ).
- Over R = 𝒪_K with p = 2 the equivalence holds as well, recovering Kim, Lau and Liu.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Theorem 5.2.5, Lemmas 5.2.7–5.2.8 and Remark 5.2.6, pp. 79–85: proves that evaluation of the prismatic Dieudonné crystal on the Breuil–Kisin prism classifies p-divisible groups over a complete regular local ring by minuscule Breuil–Kisin modules, via descent along the Breuil–Kisin prism with topologically nilpotent divided Frobenius on the kernel of its self-coproduct; the written proof assumes d = 1; [Eike Lau](https://arxiv.org/abs/0908.4588), Theorem 1.1, p. 1: classifies p-divisible groups over any complete regular local ring with perfect residue field, p odd, by Breuil windows relative to W(k)⟦x₁, …, x_r⟧ → R; [Eike Lau](https://arxiv.org/abs/1006.2720), Introduction and main theorem: extends the Breuil window classification to p = 2 by relating Dieudonné displays and crystalline Dieudonné theory.

**Needs.** §PD.5.10; §PD.7.2; §PD.0.8; §PD.0.12; §PD.4.11; `PrismaticCohomology:PR.0/breuil-kisin-prism`; `PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-p-divisible-classification`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/dyadic-classification`.

**Planet:** Breuil–Kisin classification via prisms.

### PD.7.4 Kisin's functor is the prismatic Dieudonné functor

**Theorem.** Let K be complete discretely valued of characteristic 0 with perfect residue field, 𝔖 = W(k)⟦u⟧ → 𝒪_K the Breuil–Kisin prism for a uniformiser with Eisenstein polynomial E, and S the p-adic PD envelope of 𝔖 → 𝒪_K. (1) There is a natural Frobenius-equivariant isomorphism α_K : ℳ_Δ(G)(S, (p)) ≅ 𝔻(G)(S). (2) The functors G ↦ M^Kis(G) (Kisin; Kim, Lau, Liu for p = 2) and G ↦ ℳ_Δ(G)(𝔖, (E)) from p-divisible groups over 𝒪_K to minuscule Breuil–Kisin modules are naturally isomorphic, compatibly with α_K and with the A_crys comparison over 𝒪_C.

**Hypotheses and conventions.**

- Kisin's functor as in FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4/kisin-p-divisible-classification and R07.4/bk-integral-comparisons (defined through 𝔻(G)(S) and the Frobenius-twisted map 𝔖 → S).

**Proof route.**

1. Use the crystalline comparison on Breuil’s divided-power ring S to identify both functors after base change along ψ_K; this invokes the mixed-characteristic coefficient gap (AL23 Lemma 5.2.10, p. 85).
2. Pass faithfully flatly to A_inf(𝒪_C), distinguishing f(u)=[π♭] from g=φf. The evaluation on (A_inf,(ξ̃)) is the naive dual Scholze–Weinstein module (PD.3).
3. Use the existing parent PR.7/kisin-functor-comparison: its BMS Proposition 4.34 compatibility sends the crystalline lattice T=(T_pG)∨ to the Fargues pair (T,Ξ), with Ξ generated by D_dR(T_Qp). The same pair is supplied by G_𝒪_C. Fargues’ equivalence identifies the two A_inf modules with the correct crystalline realization; faithful flatness then descends the dotted comparison arrows (AL23 pp. 85–87). Do not claim arbitrary S-lattices are determined by their A_inf base change without descent data.

**Checks.**

- For G = μ_{p^∞} both functors give (𝔖, c·E·φ) with c a unit determined by the normalisation of E.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 5.2.10 and Proposition 5.2.11, pp. 85–87: identifies the value of the prismatic Dieudonné crystal on Breuil's PD thickening S with the crystalline Dieudonné module and shows that its value on the Breuil–Kisin prism is Kisin's module.

**Needs.** §PD.7.3; §PD.4.11; §PD.3.8; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-p-divisible-classification`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/breuil-s-modules`; `PrismaticCohomology:PR.7/kisin-functor-comparison`.

### PD.7.5 The Witt frame

**Construction.** For a ring R in which p is nilpotent, or a p-adically complete ring with bounded p^∞-torsion, the Witt frame is 𝒲_R = (W(R), I_R = V(W(R)) = ker(W(R) → R), F, F₁ = V^{-1}, p): F is the Witt Frobenius and F₁ : I_R → W(R) the inverse of the injective Verschiebung onto I_R, so F = p·F₁ on I_R. It is a frame in Lau's sense (I_R + pW(R) lies in the radical of W(R)); its formation is functorial in R and defines a frame of sheaves W(𝒪) on the p-completely faithfully flat site of R.

**Hypotheses and conventions.**

- Frames in Lau's generality (node PD.0/frame with completeness replaced by I_R + pW(R) ⊆ Rad W(R)).

**Proof route.**

1. V is injective with image I_R; F(V(x)) = p·x gives F = pF₁ on I_R (Mathlib WittVector.frobenius and WittVector.verschiebung, with WittVector.frobenius_verschiebung).
2. I_R + pW(R) lies in the radical since R is p-adically complete (Zink 2002, §1; Lau 2010, §2, the Witt frame example).

**API.**

- `TauCeti.PrismaticDieudonne.Frame.witt` (constructor): The Witt frame 𝒲_R.
- `TauCeti.PrismaticDieudonne.Frame.witt_fil` (characterisation): Fil 𝒲_R = V(W(R)) = ker(W(R) → R).
- `TauCeti.PrismaticDieudonne.Frame.witt_frobOne_verschiebung` (simp): F₁(V(x)) = x.
- `TauCeti.PrismaticDieudonne.Frame.witt_map` (functoriality): A ring map R → R′ induces a 1-morphism 𝒲_R → 𝒲_{R′}.

**Checks.**

- `Frame.witt_perfect` (computation): For k perfect, F₁(p) = 1 and Fil = pW(k).
- `Frame.witt_zero` (degenerate): For R = 0, W(R) = 0 is the zero frame.
- `Frame.witt_not_p_frame` (non-example): For R = F_p[ε]/ε², I_R ≠ pW(R): V([ε]) ∉ pW(R), so the Witt frame is not the p-frame of W(R).
- For k perfect, 𝒲_k = (W(k), pW(k), F, F/p, p).
- For R = F_p[ε]/ε², I_R contains V([ε]) with F₁(V[ε]) = [ε].

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 5.3.1, p. 87: uses the frame of Witt vectors with the kernel of the projection to the base, the Witt Frobenius and the inverse of Verschiebung as divided Frobenius; [Eike Lau](https://arxiv.org/abs/0908.4588), §2, the example of the Witt frame after Lemma 2.5, p. 4: the Witt frame of a p-adically complete ring, with θ = p; [Thomas Zink](https://www.math.uni-bielefeld.de/~zink/display.pdf), §1, Definition 1 and the preliminaries on Witt vectors: Witt vectors, the ideal I_R and the inverse Verschiebung used to define displays.

**Needs.** §PD.0.1; Mathlib `WittVector`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `Ideal.jacobson`.

### PD.7.6 Displays

**Definition.** For p-complete R with bounded p∞-torsion, a display in the convention of this roadmap is a window (P,Q,F,F₁) over the Witt frame 𝒲_R, equivalently a window over W(𝒪) on the p-completely faithfully flat site. P is finite projective over W(R), I_RP⊆Q⊆P, P/Q is finite projective over R, and F and F₁ obey the window semilinearity, relation and generation axioms. Here F₁ on Q is part of the module data; only the coefficient frame map on I_R is V⁻¹. F-nilpotence means local nilpotence of F modulo p. These all-window objects are Zink’s 3n-displays (Definition 1); his Definition 2 reserves “display” for the V-nilpotent subclass.

**Hypotheses and conventions.**

- p-complete R with bounded p^∞-torsion for the descent statement.

**Proof route.**

1. Window over 𝒲 (node witt-frame, node PD.0/window).
2. Displays satisfy faithfully flat descent (Zink 2002, Theorem 37), and over p-complete rings with bounded p^∞-torsion are compatible systems of displays over R/p^n, so the sheaf-theoretic definition agrees with windows over 𝒲_R (Anschütz–Le Bras, Definition 5.3.1 and Remark 5.3.2, pp. 87–88).

**API.**

- `TauCeti.PrismaticDieudonne.Display` (structure): Windows over the Witt frame.
- `TauCeti.PrismaticDieudonne.Display.IsFNilpotent` (characterisation): Zariski-locally, an iterate of F is zero modulo p.
- `TauCeti.PrismaticDieudonne.Display.baseChange` (functoriality): Base change along R → R′.
- `TauCeti.PrismaticDieudonne.Display.descent` (other): Displays form a stack for the p-completely faithfully flat topology.
- `TauCeti.PrismaticDieudonne.Display.toZinkDisplay` (compatibility): Identify the all-window object with Zink’s Definition 1 3n-display. Window duality carries its F-nilpotent subclass to Zink’s V-nilpotent displays, to which his BT functor applies.
- `TauCeti.PrismaticDieudonne.display_ext` (extensionality): Two display morphisms are equal when their W(R)-linear maps P→P′ agree.

**Checks.**

- `Display.perfect_field` (computation): Over a perfect field k, a display is a finite free W(k)-module P with pP⊆Q⊆P and F,F₁ satisfying the window axioms; its associated Dieudonné V has Q=VP and F₁=V⁻¹ on Q. This inverse concerns the module V, not the coefficient Verschiebung on W(k).
- `Display.zero` (degenerate): The zero display.
- `Display.etale_not_nilpotent` (non-example): The display of ℚ_p/ℤ_p over a perfect field (P = W(k), Q = pW(k), F = σ) is not F-nilpotent: F is bijective modulo p.
- In the contravariant normalisation of the source, Z_k(μ_{p^∞}) = (W(k), Fil = W(k), F = pσ) is F-nilpotent and Z_k(ℚ_p/ℤ_p) = (W(k), Fil = pW(k), F = σ) is not (node display-functor).

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Definition 5.3.1 and Remark 5.3.2, pp. 87–88: defines displays as windows over the Witt frame of sheaves on the p-completely faithfully flat site and identifies them with usual displays by descent; [Thomas Zink](https://www.math.uni-bielefeld.de/~zink/display.pdf), Definition 1 and Theorem 37: displays over rings in which p is nilpotent and their faithfully flat descent.

**Needs.** §PD.7.5; §PD.0.3.

**Planet:** Display.

### PD.7.7 The Nygaard frame maps to the Witt frame

**Theorem.** For quasi-regular semiperfectoid R with pR=0 or R p-torsion-free, the quotient Δ_R→R lifts to a v-morphism of frames f : Δ_{R,Nyg}→𝒲_R. Put v=F₁(f(ξ)) ∈ W(R)×, where ξ̃=φ(ξ). Then f(ξ̃)=vp and F₁f=vfφ₁. This is the u-morphism convention of PD.0 with u=v.

**Hypotheses and conventions.**

- As stated; ξ̃ generates I.

**Proof route.**

1. The δ-ring/Witt adjunction gives f : Δ_R→W(R), sending N≥1Δ_R into I_R. The identity f(ξ̃)=F(fξ)=pF₁(fξ) defines v without dividing by p. The distinguished-element condition makes v a unit. For p-torsion-free R the divided equation follows after multiplying by p; in characteristic p use the divided-Frobenius compatibility argument cited in AL23 Proposition 5.3.3, p. 88. The scalar written there with p=u f(ξ̃) is v⁻¹ and is inconsistent with its earlier u-morphism convention (source issue E3).

**Checks.**

- R = k perfect: Δ_k = W(k) and f is the identity with u = 1.
- R perfectoid p-torsion-free: f : A_inf(R) → W(R) is induced by θ.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 5.3.3, p. 88: lifts the projection from the prism of a quasi-regular semiperfectoid ring to a u-morphism from the Nygaard frame to the Witt frame, through the δ-ring adjunction with Witt vectors.

**Needs.** §PD.0.2; §PD.7.5; `PrismaticCohomology:PR.0/delta-witt-section-equivalence`; `PrismaticCohomology:PR.2/qrsp-prism`; `PrismaticCohomology:PR.3/nygaard-filtration-qrsp`.

### PD.7.8 The display of a p-divisible group

**Theorem.** Let R be quasi-syntomic. For G ∈ BT(R) put Z_R(G) = ℳ_Δ(G) ⊗_{O^pris} W(𝒪) with Frobenius φ ⊗ F, and Fil Z_R(G) generated by I(𝒪)·Z_R(G) and the image of φ^{-1}(I^pris·ℳ_Δ(G)). There is a unique way to complete this to a functor Z_R : BT(R)^op → Disp(R), natural in R, which for R quasi-regular semiperfectoid with pR = 0 or R p-torsion-free is the composite of ℳ_Δ (as windows over the Nygaard frame, node PD.1/nygaard-windows) with base change along the frame map of node nygaard-to-witt-frame. For p = 2 the functor is not an antiequivalence on all p-divisible groups.

**Hypotheses and conventions.**

- R quasi-syntomic.

**Proof route.**

1. For the QRSP characteristic-p or p-torsion-free cases, base change the Nygaard window along the correctly normalized v-morphism; this gives a contravariant display functor.
2. To extend to general quasi-syntomic R in the stated flatness range, the proposed universal construction requires a p-torsion-free smooth presentation of the moduli of full p-divisible groups, together with its relation space and compatibility of the universal windows. Descent of displays then defines Z_R and its naturality. R07.2/bt-stack-smooth states smoothness only for BT_n, not this compatible full-BT presentation; see the recorded gap.
3. Closure gap — Compatible smooth presentation for the full-BT display functor: Provide a compatible ind-smooth affine presentation of the height-h full Barsotti–Tate moduli problem and its relation spaces, or an equivalent effective inverse-limit construction from the smooth BT_n stacks. Prove p-torsion-freeness of the completed presentation rings and that the universal Nygaard-window construction descends naturally along the relation. Smoothness at each finite level does not by itself prove this assertion (AL23 Proposition 5.3.4, pp. 88–89).

**Checks.**

- For R = k perfect, Z_k(G) is the classical display of G (Dieudonné module with V^{-1} on Q).
- For G = μ_{p^∞}, Fil Z_R(G) = Z_R(G) because Fil ℳ_Δ(μ_{p^∞}) = ℳ_Δ(μ_{p^∞}); for G = ℚ_p/ℤ_p, Fil Z_R(G) = I(𝒪)·Z_R(G) + image of N^{≥1}O^pris.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 5.3.4 and its proof, pp. 88–89: constructs the display of a p-divisible group from its prismatic Dieudonné crystal by base change to the Witt frame, uniquely and naturally in the quasi-syntomic base.

**Needs.** §PD.7.7; §PD.7.6; §PD.1.9; §PD.0.4; §PD.5.10.

### PD.7.9 Formal p-divisible groups over general bases

**Definition.** Over a ring on which p is nilpotent, a formal p-divisible group is a commutative formally smooth finite-dimensional formal Lie group, locally given on nilpotent R-algebras by a power-series formal group law, for which [p] is finite locally free and the associated p-power-torsion fppf sheaf is a Barsotti–Tate group. Over a p-complete ring use compatible such objects over R/pⁿ, with the corresponding compatible Barsotti–Tate group. Write BT_f(R) for this category.

**Hypotheses and conventions.**

- No noetherian or local hypothesis on R. Dimension is locally constant. This is a formal Lie group on nilpotent test algebras, not an assertion that every section of its associated torsion sheaf over every algebra is nilpotent.

**Proof route.**

1. Use formal power-series laws Zariski-locally, with coordinate-free gluing on nilpotent algebras; impose formal smoothness and finite locally free p-multiplication. The BT sheaf and compatible p-adic systems are part of the definition. Zink’s introductory Nil_R framework supplies the needed general-base carrier.

**API.**

- `TauCeti.PrismaticDieudonne.FormalPDivisibleGroup` (structure): The formal group, finite locally free p-multiplication and associated BT sheaf.
- `TauCeti.PrismaticDieudonne.FormalPDivisibleGroup.toBT` (compatibility): The associated p-power-torsion Barsotti–Tate group.
- `TauCeti.PrismaticDieudonne.FormalPDivisibleGroup.baseChange` (functoriality): Base change on nilpotent test algebras, and compatible base change over R/pⁿ.
- `TauCeti.PrismaticDieudonne.FormalPDivisibleGroup.coordinateIso` (extensionality): Coordinate changes give isomorphic formal groups and the same BT object; morphisms are natural homomorphisms of formal groups.

**Checks.**

- `FormalBT.multiplicative` (computation): The formal multiplicative group has torsion BT group μ_{p∞}; its [p] has degree p on a characteristic-p base.
- `FormalBT.zero` (degenerate): The zero-dimensional trivial formal group has zero associated BT group.
- `FormalBT.etale_excluded` (non-example): Over a perfect field of characteristic p the nonzero étale group ℚ_p/ℤ_p is excluded from BT_f, while μ_{p∞} is included; this detects the reversed F/V nilpotence convention.
- On complete noetherian local rings this agrees with the formal Lie carrier of R07.1; that agreement does not extend the hypotheses of the R07 declaration itself.

**Sources.** [Thomas Zink](https://www.math.uni-bielefeld.de/~zink/display.pdf), Introduction and Definitions 1–2, pp. 3–4 of the author copy (PDF pp. 2–3): formal groups on nilpotent algebras and displays over general p-nilpotent bases.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`.

### PD.7.10 Formal p-divisible groups are F-nilpotent displays (Zink, Lau)

**Theorem.** For quasi-syntomic R flat over ℤ/pⁿ (n>0) or ℤ_p, the contravariant display functor Z_R has as its target a restriction giving an antiequivalence BT_f(R)^op ≃ Disp_F-nilp(R). The classification statement remains valid according to the AL23 erratum; its printed prismatic proof is withdrawn. The unrestricted Zink–Lau proof and its identification with this Z_R remain a verification gap in this packet.

**Hypotheses and conventions.**

- Formal groups mean the general-base definition PD.7/formal-p-divisible-group, not the noetherian-local connected/formal equivalence of R07.1.
- Zink’s BT functor is covariant on his V-nilpotent displays. First dualize our F-nilpotent window to a V-nilpotent one; the composite is contravariant. No additional Cartier dual of a formal group is needed.

**Proof route.**

1. Zink Theorems 9 and 103 prove the equivalence on the bases specified there. His all-window convention and V-nilpotent subcategory must be distinguished from the contravariant F-nilpotent category here.
2. The 2025 erratum explicitly points to Zink and Lau for the unrestricted classification. Lau08 Theorem 1.1 has not been read directly in this review; do not treat its proof as verified.
3. To identify Z_R with the dualized Zink–Lau construction, prove compatibility of the universal deformation/crystalline constructions over nilpotent PD thickenings and effectivity of the compatible systems. Agreement on residue fields and Hodge filtrations alone does not establish this over nonreduced bases. This compatibility is a remaining proof obligation.
4. Closure gap — Unrestricted Zink–Lau proof and identification with Z_R: Read Lau08 Theorem 1.1 and its proof from a cleared or public source, then supply the deformation-level comparison between its dualized BT construction and the specific prismatic display functor Z_R. The erratum confirms the theorem survives, but does not provide this comparison proof. Neither perfect-field agreement nor the abelian-scheme Grothendieck–Messing theorem suffices. This is the review’s unverified node.

**Checks.**

- Over a perfect field, the contravariant module of a formal group has F topologically nilpotent; μ_{p∞} gives F=pσ. The étale group ℚ_p/ℤ_p has F=σ and is excluded.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Proposition 5.3.5, p. 90: states the antiequivalence between formal p-divisible groups and F-nilpotent displays over quasi-syntomic rings flat over ℤ/p^n or ℤ_p, citing Zink and Lau; [Johannes Anschütz, Arthur-César Le Bras](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf), the erratum, p. 1: retracts the printed proof of the display comparison, gives Senger's counterexample to the nilpotence step, and states that the result stands by the earlier proofs of Zink and Lau; [Thomas Zink](https://www.math.uni-bielefeld.de/~zink/display.pdf), Theorem 9 (Introduction) and Theorem 103: the functor BT from nilpotent displays to formal p-divisible groups and its equivalence for excellent local rings and rings with R/pR of finite type over a field; [Eike Lau](https://doi.org/10.1007/s00222-007-0090-x), Theorem 1.1: Zink's functor is an equivalence between nilpotent displays and formal p-divisible groups over every ring in which p is nilpotent.

**Needs.** §PD.7.8; §PD.7.6; §PD.7.9; `CrystallineCohomology:CR.7/messing-filtration-interface`; §PD.4.11.

**Planet:** Zink–Lau classification by displays.

### PD.7.11 Étale comparison for the prismatic Dieudonné crystal

**Theorem.** For quasi-syntomic R, let (R)_v be the v-site of integral perfectoid R-algebras, α:(R)_v→(R)_{qsyn,qrsp} the morphism defined using perfectoidization, and j:Spa(R[1/p],R)^♦_v→(R)_v the generic-fibre morphism. For n≥1, α_*(ℤ/pⁿ)≃(O^pris/pⁿ)^{φ=1} and (α∘j)_*(ℤ/pⁿ)≃((O^pris/pⁿ)[1/I])^{φ=1}. For a p-divisible G, j*α*(((ℳ_Δ(G)/pⁿ)[1/I])^{φ=1})≃Hom_{ℤ/pⁿ}(G[pⁿ]_η,ℤ/pⁿ), and (α∘j)*G[pⁿ]≃G[pⁿ]_η. Fixed points here are non-derived.

**Hypotheses and conventions.**

- The notation Spa(R[1/p],R)^♦ is interpreted through its functor on perfectoid test pairs as in the source. The integral perfectoid site is not already the generic-fibre site, and j is not an open complement inside the coefficient ring.

**Proof route.**

1. (1): commute φ-fixed points with the colimit along φ; on quasi-regular semiperfectoid S, colim_φ O^pris(S) is p-torsion-free and the φ-fixed points of its mod-p^n generic part are W_n of the tilt's fixed points, ℤ/p^n (Artin–Schreier–Witt, PrismaticCohomology PR.4/perfectoid-artin-schreier-witt) (Anschütz–Le Bras, Lemma 5.4.1, p. 92).
2. (2): ℳ_Δ(G)/p^n = ℋom(G[p^n], O^pris/p^n) (node PD.2/tate-module-description and the proof of node PD.4/pdiv-locally-free); invert I, take φ-fixed points with (1), and use Lemma 5.4.3 to identify the pullback of G[p^n] (Proposition 5.4.2 and Lemma 5.4.3, pp. 92–93). This is the p-divisible-group case of the étale comparison of PrismaticCohomology PR.4/etale-comparison.
3. Closure gap — Integral perfectoid v-site and its quasi-syntomic morphism: Construct the integral perfectoid R-algebra v-site, its generic-fibre morphism j and the morphism α induced on the QRSP basis by universal perfectoidization (AL23 §5.4, pp. 91–93). PerfectoidQuotients Q2 supplies the algebraic perfectoidization target, and DiamondsAndVStacks D3 supplies the generic v-site; neither supplier statement constructs the integral site and the adjunction needed here.

**Checks.**

- G = μ_{p^∞}, R = 𝒪_C: recovers T_pμ_{p^∞}(C)^∨ = ℤ_p(−1) after the limit over n.
- G = ℚ_p/ℤ_p: ℤ/p^n.

**Sources.** [Johannes Anschütz, Arthur-César Le Bras](https://arxiv.org/abs/1907.10525v4), Lemma 5.4.1, Proposition 5.4.2 and Lemma 5.4.3, pp. 91–93: computes Frobenius fixed points of O^pris modulo p^n with I inverted as the constant sheaf on the generic fibre and recovers the dual of the generic-fibre p^n-torsion of G from its prismatic Dieudonné crystal.

**Needs.** §PD.2.6; §PD.4.9; §PD.1.3; `PrismaticCohomology:PR.4/perfectoid-artin-schreier-witt`; `PrismaticCohomology:PR.4/etale-comparison`; `PrismaticCohomology:PR.4/frobenius-fixed-points`; `DiamondsAndVStacks:D3`; `PerfectoidQuotients:Q2/universal-perfectoidization`.

**Planet:** Étale comparison for p-divisible groups.

## Open proof and infrastructure obligations

These are recorded endpoints of prerequisite chains, not assumptions that the missing proofs already exist. The Zink–Lau verification gap is the reason the independent review requests changes.

### Gap 1: p-divisible rigid-analytic groups (Fargues)

Essential surjectivity in Scholze–Weinstein Theorem B for spherically complete C with surjective norm uses Fargues, Groupes analytiques rigides p-divisibles (Math. Ann. 374 (2019)), Corollaire 9 and Théorème 15: a p-divisible rigid-analytic group whose identity component is an open ball comes from a formal p-divisible group. No roadmap of the atlas plans p-divisible rigid-analytic groups. The natural owner is a Part II of HodgeTateAndCanonicalSubgroups or of FiniteFlatGroupsAndIntegralPadicHodgeTheory (periods of p-divisible groups).

Needed by §PD.3.2.

### Gap 2: Image of the period morphism of Rapoport–Zink spaces (Scholze–Weinstein Theorem C)

Theorem B for general algebraically closed C is deduced in Scholze–Weinstein 2013 from Theorem C (a point of the flag variety lies in the image of the period morphism iff the associated modification of the vector bundle E(H) is trivial). No layer plans Theorem C; EndoscopicTransferAndUnitaryTraceComparison ET.6a uses Rapoport–Zink spaces at infinite level without it.

Needed by §PD.3.2.

### Gap 3: Isotriviality over 𝒪_C/p and Oort's existence theorem

Scholze–Weinstein, Proposition 14.9.4 uses (a) Scholze–Weinstein 2013, Theorem 5.1.4(i): every p-divisible group over 𝒪_C/p is quasi-isogenous to a constant one (from the Fargues–Fontaine classification of vector bundles, which FarguesFontaineDiamonds excludes), and (b) Oort's theorem that a p-divisible group over an algebraically closed field with symmetric Newton polygon is the p-divisible group of an abelian variety. Neither is planned in the atlas.

Needed by §PD.3.4.

### Gap 4: Breuil–Kisin comparison over complete regular local rings of dimension ≥ 2

Anschütz–Le Bras state Theorem 5.2.5 for every complete regular local ring with perfect residue field but write the proof for d = 1 only (source issue PrismaticCohomologyPartII/E1). The planned node covers dim R ≤ 1. For d ≥ 2 Lau (2010, p odd; 2014, p = 2) classifies p-divisible groups by Breuil windows over W(k)⟦u₁, …, u_d⟧; identifying Lau's functor with the evaluation of the prismatic Dieudonné crystal on the Breuil–Kisin prism, or proving that the descent datum over the self-coproduct is automatic for d ≥ 2, is open here.

Needed by §PD.7.3.

### Gap 5: Ringed-site and internal derived Hom infrastructure

Construct the relative big/small quasi-syntomic sites and ringed coefficient morphisms used here. Reuse Mathlib SheafOfModules.pullbackPushforwardAdjunction and pullbackIso (Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean, read at 082e2d3), checking continuity, the presheaf right-adjoint hypothesis and the sheafification instances for these sites, rather than constructing the generic adjunction again. Current Tau Ceti SheafOfModules.ihomObjEquiv and ihomCompForgetIso (TauCeti/Algebra/Category/ModuleCat/Sheaf/InternalHom/Basic.lean, read at a91d3aa) already supply ordinary internal Hom on a small site with the stated commutative-ring and sheafification hypotheses. Import this machinery through its small-site presentation, and supply the size/instance comparison, derived internal Rℋom, ℰxt and their base-change/pushforward compatibilities for the coefficient sheaves here. Mathlib CategoryTheory.Abelian.Ext is a global Ext group, not an internal Ext sheaf, and IsCocontinuous is only a condition. The cited supplier statements do not supply these specializations or derived compatibilities. PD.2 functor statements remain targets pending this infrastructure.

Needed by §PD.1.1, §PD.1.2, §PD.2.3, §PD.2.5.

### Gap 6: Compatible infinite p-root covers on the quasi-syntomic site

Plan a compatible tower of p-power-division covers of a p-divisible group whose completed limit is still a cover in the required quasi-syntomic site, and prove exactness of its inverse-limit sequence (AL23 Lemmas 4.2.5–4.2.6, pp. 41–43). Supply the analogous inverse-limit argument for truncated Ext crystals and étale Tate-module local triviality. R07.1/p-divisible-tate-module has a henselian local domain hypothesis and does not supply this sheaf statement.

Needed by §PD.2.6, §PD.4.9, §PD.5.2, §PD.5.11.

### Gap 7: Witt-vector v-descent in the perfectoid classification

Supply v-descent for finite projective W(S)-modules on perfect schemes, including the complete inverse-limit step, and descent of the corresponding p-divisible groups over W(S)/ξ (SW20 proof of Theorem 17.5.2, pp. 159–160, using Bhatt–Scholze 2017). The current AlgebraicVectorBundles roadmap does not contain this Witt-vector result. GeometricSatakeAndFusion is outside the permitted supplier order, so it cannot be used as a placeholder owner.

Needed by §PD.3.6.

### Gap 8: Abelian lifting for the integral Hodge–Tate splitting at p=2

Give the unpolarized infinitesimal lifting of an abelian scheme needed to split τ≤1 of its Hodge–Tate complex over A/I (AL23 Proposition 3.2.1, Corollary 3.2.3 and the proof of Proposition 4.5.1, pp. 20–21, 53–54). The A4 Hodge/de Rham exterior theorem and its nilpotent-PD Grothendieck–Messing statement do not by themselves supply a lift along a general prism quotient A/I². This input is essential to the p=2 integral exterior-power argument.

Needed by §PD.4.1.

### Gap 9: Crystalline coefficients over mixed-characteristic p-adic bases

Construct the compatible crystalline Dieudonné evaluations over R/pⁿ and their p-adic limit, including the coefficient comparison and Hodge/Lie sequence on the relevant PD thickenings (AL23 Lemma 4.3.3 and §4.6, pp. 46–48, 58–65). CR.7/dieudonne-evaluation explicitly assumes characteristic p; that declaration alone does not provide this mixed-characteristic coefficient theory.

Needed by §PD.3.5, §PD.4.11, §PD.4.14, §PD.7.4.

### Gap 10: Characteristic-p connection in the regular Breuil–Kisin comparison

For R=k⟦u⟧ prove existence and uniqueness of the integrable topologically quasi-nilpotent horizontal connection on the relevant minuscule module, as used in AL23 Theorem 5.2.5, p. 79 (which refers to de Jong Proposition 2.7.3). The general crystalline evaluation supplier does not state this automatic-connection theorem. The mixed-characteristic DVR proof in AL23 pp. 79–84 does not prove this separate characteristic-p step.

Needed by §PD.7.3.

### Gap 11: Compatible smooth presentation for the full-BT display functor

Provide a compatible ind-smooth affine presentation of the height-h full Barsotti–Tate moduli problem and its relation spaces, or an equivalent effective inverse-limit construction from the smooth BT_n stacks. Prove p-torsion-freeness of the completed presentation rings and that the universal Nygaard-window construction descends naturally along the relation. Smoothness at each finite level does not by itself prove this assertion (AL23 Proposition 5.3.4, pp. 88–89).

Needed by §PD.7.8.

### Gap 12: Unrestricted Zink–Lau proof and identification with Z_R

Read Lau08 Theorem 1.1 and its proof from a cleared or public source, then supply the deformation-level comparison between its dualized BT construction and the specific prismatic display functor Z_R. The erratum confirms the theorem survives, but does not provide this comparison proof. Neither perfect-field agreement nor the abelian-scheme Grothendieck–Messing theorem suffices. This is the review’s unverified node.

Needed by §PD.7.10.

### Gap 13: Integral perfectoid v-site and its quasi-syntomic morphism

Construct the integral perfectoid R-algebra v-site, its generic-fibre morphism j and the morphism α induced on the QRSP basis by universal perfectoidization (AL23 §5.4, pp. 91–93). PerfectoidQuotients Q2 supplies the algebraic perfectoidization target, and DiamondsAndVStacks D3 supplies the generic v-site; neither supplier statement constructs the integral site and the adjunction needed here.

Needed by §PD.7.11.

### Gap 14: Nonnoetherian formal Serre–Tate effectivity

The A4/serre-tate-equivalence target gives the affine nilpotent-base equivalence. Verify its application level by level to 𝒪_C/pⁿ and effectivity as a formal abelian scheme over 𝒪_C; the supplier’s separate complete noetherian local effectivity clause does not cover 𝒪_C. SW20 Proposition 14.9.4, pp. 129–130, uses this formal lifting step.

Needed by §PD.3.4.

### Gap 15: Hodge–Tate exactness beyond the dlog construction

The dlog maps are explicit, but proving their exact sequence over C is a key theorem rather than a formal consequence of duality or dimensions. SW20 Theorem 12.1.1, pp. 98–99, recalls and attributes it to Fargues without giving the full proof there. A direct proof route is still required at this lower-tier owner; the higher HodgeTateAndCanonicalSubgroups plan cannot be imported upward.

Needed by §PD.3.1.

## Source issues checked independently

The following entries paraphrase the issues and corrections. They contain no source excerpts. ArXiv v4 and the free published version have different statement numbers.

### PrismaticCohomologyPartII/E1 — gap

arXiv v4 §5.2 and Theorem 5.2.5, p. 79; published Theorem 5.12 and preceding paragraph, p. 74.

Theorem 5.2.5 is stated for every complete regular local ring R = W(k)⟦u₁, …, u_d⟧/(E) with perfect residue field, but the text fixes d = 1 for simplicity before the proof and expresses the hope that the general case works similarly.

The written prismatic descent proof is in one variable. This packet restricts its direct proof to dimension at most one, with a separate characteristic-p connection gap; higher-dimensional compatibility with evaluation remains a gap. This does not assert that the general Breuil-window classification is false.

**Review: confirmed.** Both the arXiv and published text restrict the ensuing argument to one variable while stating the theorem generally; the erratum addresses a different proposition. The limitation is in the written comparison proof.

### PrismaticCohomologyPartII/E2 — misprint

arXiv v4 Remark 4.8.4, p. 70; published Remark 4.85, p. 66.

After applying RHom(T_pG, −) to Bhatt–Lurie's sequence 0 → T_pG_m → N^{≥1}O^pris → O^pris → 0, the source writes the resulting middle and right terms, and the fibre computing RΓ(T_pǦ), with the Dieudonné crystal of the dual group Ǧ.

Use N≥1ℳ_Δ(G) and ℳ_Δ(G) in the coefficient terms. After applying global sections, use the derived fibre of their global sections, or the evaluated QRSP modules when acyclicity is invoked. The Tate module is T_pG*.

**Review: confirmed.** Direct comparison with the preceding Hom identification and Proposition 4.8.2 shows G* in the coefficient terms must be G. The same mismatch is present in published Remark 4.85.

### PrismaticCohomologyPartII/E3 — misprint

arXiv v4 Definition 4.1.16, p. 32 and Proposition 5.3.3, p. 88; published Definition 4.16, p. 28 and Proposition 5.21, p. 83.

The frame morphism proposition uses the reciprocal of the scalar prescribed by the earlier u-morphism equations.

With φ′₁α=uαφ₁ and α(ϖ)=uϖ′, use u=F₁(fξ) and f(ξ̃)=up. The scalar satisfying p=v f(ξ̃) is u⁻¹.

**Review: confirmed.** The equation f(ξ̃)=pF₁(fξ) identifies the scalar, so the discrepancy persists in the published version.

### PrismaticCohomologyPartII/E4 — gap

AL23 arXiv v4 Proposition 5.3.5, pp. 89–90; published Proposition 5.23, p. 85; erratum p. 1.

The original proof relies on topological nilpotence of divided Frobenius on the kernel of A_crys→W.

Discard that proof. Senger’s example R=𝔽_p[x^{1/p∞}]/(x) has a nonzero divided-Frobenius-fixed element in the kernel. Use Zink and Lau for the surviving classification and verify the functor comparison separately.

**Review: confirmed.** The authors’ erratum explicitly withdraws the proof; the kernel topology does not follow from the ambient p-adic topology.

### PrismaticCohomologyPartII/E5 — misprint

Example 12.1.6, p. 100 of the author copy (PDF p. 110).

The height index is set to the projective dimension of the rational hull minus one.

If H is the smallest rational projective subspace containing the line, its associated formal height is dim_projective(H)+1, equivalently the dimension of the rational vector-space hull.

**Review: confirmed.** A rational line gives H a projective point and must give formal height one; the printed subtraction gives a negative height. This also agrees with the full Drinfeld half-space example of height h.

## Pinned library baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every cited baseline name and statement was read. No baseline declaration is presented as a formalization of a roadmap endpoint.

| Declaration | Module | Exact scope used |
| --- | --- | --- |
| `mathlib:CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | Global Ext groups in an abelian category with HasExt; does not supply an internal Ext sheaf. |
| `mathlib:CategoryTheory.Functor.IsCocontinuous` | `Mathlib/CategoryTheory/Sites/CoverLifting.lean` | Covering-sieve condition for a cocontinuous site functor; does not itself construct the inverse-image adjunction or prove its exactness. |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves on a site |
| `mathlib:ExteriorAlgebra` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` | The exterior algebra of a module |
| `mathlib:ExteriorAlgebra.ι` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` | The inclusion of a module into its exterior algebra |
| `mathlib:HenselianRing` | `Mathlib/RingTheory/Henselian.lean` | Henselian pairs (R, I): I in the Jacobson radical and simple roots of monic polynomials lift |
| `mathlib:Ideal` | `Mathlib/RingTheory/Ideal/Defs.lean` | Ideals of a ring |
| `mathlib:Ideal.jacobson` | `Mathlib/RingTheory/Jacobson/Ideal.lean` | The Jacobson radical of an ideal |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | I-adically complete modules |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular local rings |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules |
| `mathlib:Module.FinitePresentation` | `Mathlib/Algebra/Module/FinitePresentation.lean` | Finitely presented modules |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | Projective modules |
| `mathlib:Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean` | Submodules |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Tensor products of modules |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | p-typical Witt vectors |
| `mathlib:WittVector.frobenius` | `Mathlib/RingTheory/WittVector/Frobenius.lean` | The Witt vector Frobenius |
| `mathlib:WittVector.verschiebung` | `Mathlib/RingTheory/WittVector/Verschiebung.lean` | The Witt vector Verschiebung |

## Suggested Lean file

`research/blueprint/suggested/PrismaticCohomologyPartII.lean` contains the light frame data, u-morphism data, `HasHeightAtMostOne`, two henselian-projective milestones and two examples. The height predicate expresses only the integral height condition; it is not a substitute for a full minuscule module. Windows, the Witt-frame construction and all site/crystal carriers remain the detailed README targets above. There are no sorry-defined data constructions.

The file elaborated at Mathlib 082e2d3 using `lean-check`, with four warnings, all for `sorry`. This checks the signatures, not their truth or the mathematical closure of the roadmap.

## References and reading record

- **AL23**: Johannes Anschütz, Arthur-César Le Bras, [Prismatic Dieudonné theory](https://arxiv.org/abs/1907.10525v4). arXiv:1907.10525v4 (11 October 2022); published Forum of Mathematics, Pi 11 (2023), e2. Locators are the arXiv statement numbers and arXiv pages (PDF page = printed page).. Read: §1.3–1.4 (pp. 6–9); §2.2 (pp. 14–16); §3.3 (pp. 20–23); §4.1–4.9 (pp. 27–74); §5.1–5.4 (pp. 75–93).
- **ALerr**: Johannes Anschütz, Arthur-César Le Bras, [Erratum to Prismatic Dieudonné theory](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf). Forum of Mathematics, Pi 13 (2025), e3; authors' copy. Read: the whole erratum (one page).
- **SW20**: Peter Scholze, Jared Weinstein, [Berkeley lectures on p-adic geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Annals of Mathematics Studies 207, Princeton 2020; authors' free copy of March 2020 (printed page numbers). Read: Lecture 12 §12.1 (pp. 98–100); Lecture 14 §§14.1, 14.4 and Appendix §§14.8–14.9 (pp. 115–130); Lecture 15 §15.2 (p. 135); Appendix to Lecture 17 (pp. 158–160).
- **SW13**: Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357). Cambridge Journal of Mathematics 1 (2013); arXiv:1211.6357. Read: Introduction, Theorems A–C (pp. 3–6); §5.1 Theorem 5.1.4 (p. 49); §5.2 Theorem 5.2.1 and its proof (pp. 51–57).
- **CS24**: Kęstutis Česnavičius, Peter Scholze, [Purity for flat cohomology](https://arxiv.org/abs/1912.10932v3). arXiv:1912.10932v3; Annals of Mathematics 199 (2024). Read: §4.1.1–4.1.3 (p. 36); §4.2.1–4.2.3 (p. 41).
- **Lau10**: Eike Lau, [Frames and finite group schemes over complete regular local rings](https://arxiv.org/abs/0908.4588). Documenta Mathematica 15 (2010); arXiv:0908.4588v1. Read: §1 Theorems 1.1–1.2; §2 frames and windows; §3 Theorem 3.2.
- **Lau14**: Eike Lau, [Relations between Dieudonné displays and crystalline Dieudonné theory](https://arxiv.org/abs/1006.2720). Algebra & Number Theory 8 (2014); arXiv:1006.2720. Read: Introduction and statement of the main results.
- **Lau18**: Eike Lau, [Dieudonné theory over semiperfect rings and perfectoid rings](https://arxiv.org/abs/1603.07831). Compositio Mathematica 154 (2018); arXiv:1603.07831. Read: Introduction p. 3; §10 Definition 10.5, Remark 10.6, Lemmas 10.9–10.10 and Theorem 10.12, pp. 26–29..
- **CL17**: Bryden Cais, Eike Lau, [Dieudonné crystals and Wach modules for p-divisible groups](https://arxiv.org/abs/1412.3174). Proceedings of the London Mathematical Society 114 (2017); arXiv:1412.3174. Read: §2.1 windows and Breuil–Kisin modules, Lemma 2.1.16.
- **Zink02**: Thomas Zink, [The display of a formal p-divisible group](https://www.math.uni-bielefeld.de/~zink/display.pdf). Astérisque 278 (2002), 127–248; author's copy. Read: Introduction, Theorem 9; §1 Definition 1 and Theorem 37; Theorem 103.
- **Lau08**: Eike Lau, [Displays and formal p-divisible groups](https://doi.org/10.1007/s00222-007-0090-x). Inventiones Mathematicae 171 (2008), 617–628. Read: Not directly read. The published DOI and attribution are known; ALerr confirms the classification survives through Zink and Lau. The unrestricted proof and its comparison with Z_R are explicit gaps..
- **BL22**: Bhargav Bhatt, Jacob Lurie, [Absolute prismatic cohomology](https://arxiv.org/abs/2201.06120). arXiv:2201.06120. Read: Theorem 7.5.6 and proof, pp. 184–185, read directly; the exact sequence is sheaf-local, not a global-sections assertion for all QRSP rings..
- **BS-FCRYS**: Bhargav Bhatt, Peter Scholze, [Prismatic F-crystals and crystalline Galois representations](https://arxiv.org/abs/2106.14735). arXiv:2106.14735v2. Read: Proposition 2.14 and proof, p. 8, read directly; imported through the parent roadmap and not replanned here..
- **Stacks**: The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). online, read 2026-10-17. Read: Tags 00XJ, 00XL, 0D4A, 0DYD, 068W, 0D4B.
- **ALpublished**: Johannes Anschütz, Arthur-César Le Bras, [Prismatic Dieudonné theory (published version)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F37879186079B53D1BB92F28AFD12BFC/S2050508622000221a.pdf/div-class-title-prismatic-dieudonne-theory-div.pdf). Forum of Mathematics, Pi 11 (2023), e2; published statement numbering differs from arXiv v4. Read: Definition 4.16, p. 28; Remark 4.85, p. 66; Remark 5.7 and Theorem 5.12, pp. 73–74; §5.3, pp. 83–85.

## Ownership and follow-up routing

- **AInfCohomology**: AI.2/minuscule-prismatic-dictionary already uses admissible prismatic modules. Its carrier/linear algebra is imported, while the prismatic interpretation belongs here; remove a circular import when that roadmap is next revised.
- **PrismaticCohomology**: PR.7/quasisyntomic-crystal-comparison owns the coefficient vector-bundle equivalence. The duplicate Part II node has been removed. Its broad ringed-morphism wording should be reconciled with the explicit module-category comparison rather than silently credit Mathlib IsCocontinuous with a full adjunction.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory**: R07.1 Tate/generic-fibre and formal-Lie suppliers have noetherian/local/domain hypotheses; they do not supply the general quasi-syntomic sheaf or formal-group constructions here. The p-divisible-group level-sequence statement also deserves a notation check. No upstream target is changed here.
- Later HodgeTateAndCanonicalSubgroups T0/T2 and PELModuli M2 plans should import the lower owners identified here. Their files were not changed.
- The higher-dimensional Breuil–Kisin comparison remains a gap in this Part II; its written one-variable proof is not promoted to a several-variable argument.
- The source and supplier proofs named in the gap list require a revision before the unverified display endpoint can be accepted.
