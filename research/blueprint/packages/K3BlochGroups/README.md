# Roadmap: explicit K₃ and Bloch groups

**Summary.** Build an integral, functorial description of third algebraic K-theory by Steinberg-group homology, isolate the Milnor image, and construct the map from indecomposable K₃ to the Bloch group with its precise enhanced-torsion kernel. The output includes finite-field comparisons, arithmetic quotient examples, and finite certificates for symbol relations and zero boundaries. Integral conventions are part of the result: the antisymmetric tensor cokernel, the ordinary exterior square and the negative-unit quotient give different kernels, even over small finite fields.

## Scope and ownership

This roadmap owns the degree-three comparisons, the Bloch presentations and their exact convention maps, the frame and projective-configuration calculations needed for the Suslin map, and the certificate interfaces built on them. It does not construct general algebraic K-theory or the analytic dilogarithm. Every occurrence of K₃ refers to Quillen K-theory supplied below, and every abstract isomorphism with a cyclic group is distinguished from a natural comparison map.

The stable general-linear and elementary groups belong to KTheoryLowDegrees, Layers U.1 and U.3. K2SymbolsBrauer, Layer T.1, owns the stable Steinberg group, its universal central extension onto E(A), its superperfectness and the identification of the central kernel with K₂(A). Layer T.2 there owns Milnor K-theory, Matsumoto's theorem, the graded Milnor-to-Quillen map and the Bass–Tate signature theorem. Only the degree-three specialization and its cokernel are constructed here.

AlgebraicTopology, Stages 2–5 and 8, owns singular homology, CW pairs, relative homotopy, product homology with the coefficient-sensitive Künneth sequence, Hurewicz and Whitehead. StableHomotopyKTheory §1.17, `classifyingSpace_filteredColimit_homology`, supplies filtered-colimit homology for every unital coefficient ring, fixed left coefficient module and degree n≥0; §1.27 compares classifying-space and group homology. The completed UniversalCovers roadmap, Stages 2–3, owns based lifts and the higher-homotopy comparison for actual coverings. StableHomotopyKTheory supplies classifying spaces, plus constructions, fibre comparisons and spectra. These general constructions remain at their owners. The narrow Hopf and stable-unit extensions required below are explicit contracts, rather than unstated consequences of a covering-space theorem.

KTheoryFiniteLocalFields, Layer L.1, owns Quillen's finite-field K-groups and their restriction, transfer and Frobenius maps. ArithmeticKTheory, Layers N.3–N.5 and N.7, and BorelRegulators, Layer R.3, own finite generation, ranks, the cyclotomic formulas for w₂ and the ambient K₃ structure theorem for number fields. Their rational outputs include K₃(ℤ)→K₃(ℚ) being an isomorphism and K₃(ℚ)≅ℤ/48. N.7/`w-invariant` includes the Gaussian computation w₂(ℚ(i))=24 from N.4; §5.7 uses it with N.5. The arithmetic example layer N.8 consumes these outputs and the quotient calculations here; it is not a prerequisite of this roadmap.

Polylogarithms, Layer P.1, owns the interval Rogers function and the Bloch–Wigner function with their analytic identities. Layer P.2 owns the descended real regulator and its comparison with the Borel regulator; BorelRegulators R.7 fixes the exact scalar and sign. PadicHodgeRegulators D.2 owns the syntomic/étale and p-adic dilogarithm comparison. They consume the algebraic maps here. The algebraic finite-coefficient construction precedes the Habiro quantum-dilogarithm comparisons; it never uses a regulator comparison to prove its own underlying Suslin sequence.

The current Tau Ceti theorem `TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean` supplies affine cross-ratio invariance from a difference formula over any field. The projective extension here adds homogeneous coordinates, infinity, the normalized orbit classification and the configuration face values. Tau Ceti's `antisymmetricTensors` in `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean` is the negative eigenspace of the tensor flip. The object here is its cokernel analogue over arbitrary commutative rings; the integral diagonal torsion is essential. Those are distinct objects, and their comparison is asserted only where two is invertible.

Current Tau Ceti also supplies `TauCeti.groupHomology.indIso_inv` in `RepresentationTheory/Homological/GroupHomology/Shapiro`, `TauCeti.groupHomology.transfer`, `transfer_comp_map_subtype_id` and `map_comp_transfer` in `GroupHomology/Transfer/Basic`, `transfer_trans` in `GroupHomology/Transfer/Trans`, and `δ_naturality` in `GroupHomology/LongExactSequence`. These work over a commutative coefficient ring with actual representations; transfer requires finite-index subgroups. They supply the existing Shapiro, transfer and connecting-map interfaces. The finite-field stable-elements and cyclic/quaternion period calculations require additional results; they are not a second transfer construction.

## Conventions

Rings A are associative and unital; a ring map preserves one, and the zero ring is allowed. Fields F are nontrivial. A field homomorphism is therefore injective. Integral homology has trivial coefficients unless a representation or coefficient ring is displayed. Stable linear and Steinberg groups are directed colimits under block inclusion; no finite-rank stable range is implicit.

Write U(F)=Additive(Fˣ) and T(F)=U(F)⊗ℤU(F). Let τ exchange the two tensor factors and put Qₛ(F)=coker(1+τ). The notation a∧b in Qₛ means the class of a⊗b with the units written multiplicatively. Thus (ab)∧c=a∧c+b∧c, 1∧a=0, a∧b=−b∧a and 2(a∧a)=0; a∧a need not vanish. The ordinary exterior square is written Λ²U(F). The published CGZ target Q₋ is T(F) modulo the subgroup generated by u⊗(−u): the minus is multiplication by the field unit −1. It does not mean u⁻¹ or negation in the additive group U(F).

P(F) denotes Suslin's pre-Bloch group and ∂[x]=x∧(1−x). B(F)=ker ∂. Symbols at 0 and 1 mean zero only when extending the reduced symbol map by convention; they are not free generators of the reduced presentation. A separate unreduced presentation has [1] as a generator and kills it explicitly. The symbols [0] and [∞] in a projective presentation are separate generators with the relations specified in Layer 3. The classes c and h(u)=[u]+[u⁻¹] use |F|≥4 whenever their choice independence or homomorphism property is used.

Use column coordinates x=[1:x], 0=[1:0] and ∞=[0:1], with the left matrix action. Upper triangular matrices then stabilize 0. The projective cross-ratio is normalized by cr(0,∞,1,x)=x. Swapping the first two entries gives x⁻¹. The Bloch boundary has the order x then 1−x; Goncharov's displayed boundary has the opposite order and hence the opposite sign. For example, the alternating valuation pairing (a,b)↦v₂(a)v₃(b)−v₃(a)v₂(b) sends ∂[3]=3∧(−2) over ℚ to −1. This pins the sign independently of a kernel calculation; `Symbols.blochBoundary_valuation_sign` records the numerical pairing target.

K₃^ind(F)=K₃(F)/im(K₃ᴹ(F)→K₃(F)). It is not the quotient by torsion. The natural left term of the Suslin sequence is T̃(F), the enhanced Tor group, not an untwisted root subgroup. Its root-group model μ̃(F) is used only for abstract orders. The second Tate twist is the direct limit of μ_m⊗μ_m with the weight-two transition maps, equivalently Tor₁(μ,μ); it is not the ordinary tensor product of the divisible torsion group μ with itself, which is zero. An automorphism ζ↦ζᵃ acts on weight two by a².

For an abelian group M, M/n means M⊗ℤℤ/n=M/nM; M[n] is its n-torsion subgroup. These are different from K₃(F;ℤ/n) and from group homology with ℤ/n coefficients. A root-of-unity multiple is integral; division by its order is permitted only over a coefficient ring where that order is a unit. All based homotopy comparisons are natural up to based homotopy at the space level and strictly natural on induced group homomorphisms.

## Exact supplier contracts

The library baseline for the representative signatures is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current Tau Ceti additions cited in the ownership paragraph are suppliers for the eventual implementation, not extra imports of the representative file.

Write `integralRep G` for `Rep.trivial ℤ G ℤ`. From Mathlib, use `Rep.trivial`, `groupHomology`, `groupHomology.inhomogeneousChains`, `groupHomology.cycles`, `groupHomology.cyclesMk`, `groupHomology.iCycles`, `groupHomology.toCycles`, `groupHomology.π`, `groupHomology.chainsMap` and `groupHomology.map`. Their source modules are `RepresentationTheory/Homological/GroupHomology/{Basic,LowDegree,Functoriality}`. Use the actual cycles object and homology projection, not a second quotient model. The inhomogeneous degree-n chains are finitely supported functions on `Fin n → G`; the generic differential is required in degree four, beyond the low-degree triple notation.

The algebraic carriers are Mathlib's `FreeAbelianGroup`, `Finsupp`, `TensorProduct`, `Submodule`, `AddSubgroup`, `QuotientAddGroup`, `ExteriorPower`, `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Projectivization`, `Basis`, `LinearMap.toMatrix` and `Algebra.norm`. Localizations and finite coefficient rings are `Localization` and `ZMod`. Covering lifts use `IsCoveringMap.existsUnique_continuousMap_lifts` and `IsCoveringMap.liftHomotopy`; the H-space carrier is `HSpace`. None of these supplies K₃, a Bloch carrier, a group-action hyperhomology spectral sequence or a Chern-class theorem merely by having the right ambient type.

The precise external mathematical contracts are:

- **Stable groups and low K-theory.** KTheoryLowDegrees U.1/U.3 and K2SymbolsBrauer T.1 provide St(A)→E(A)→GL(A), St(A) superperfect, the central exact sequence 1→K₂(A)→St(A)→E(A)→1, entrywise maps and their finite-stage colimits. T.2 provides Kₙᴹ, its symbol presentation, products, the comparison mₙ, Matsumoto, finite-field vanishing in degrees ≥2 and the number-field sign isomorphism K₃ᴹ(F)≅(ℤ/2)^{real places}. The formula for m₃ on symbols fixes the product order.
- **Plus and external products.** StableHomotopyKTheory Layers 1–3 (the H.1–H.3 slices) provide BG, its homology comparison and the based plus functor. Section 3.33, `plusGroup_fibreUCE`, gives BK₂(A)→BSt(A)⁺→BE(A)⁺; its relative-plus and covering interfaces identify BE(A)⁺ under BE(A) with the simply connected covering model of BGL(A)⁺, with the naturality squares. Its §4.11 supplies the block-sum H-space. GeneralAlgebraicKTheory K.2, early plus construction, identifies πₙ(BGL(A)⁺) with Kₙ(A) for n≥1; K.7 supplies the external K₂(A)×K₁(ℤ)→K₃(A⊗ℤ) product and its unit comparison. The later low-degree K.2 applications may consume this roadmap; they are not prerequisites.
- **Hopf input.** AlgebraicTopology Stage 8 supplies the Hurewicz and relative pair sequences. The additional required Part II input is the based Hopf generator, π₃ of a wedge of 2-spheres, the unordered Whitehead-pair summands, and vanishing of Whitehead products in an H-space. The relative-Hurewicz application here uses H₃ of that wedge equal to zero. StableHomotopyKTheory §7.1 supplies stable η and the first two stems; §5.42 identifies η with self-braiding for Picard groupoids, and §6.3 gives the Barratt–Priddy–Quillen comparison. The remaining required compatibility is that the multiplicative unit sends stable η to [−1]∈K₁(ℤ), with the determinant of the transposition as its witness. The wedge/Whitehead calculation and this unit compatibility are prerequisite gaps beyond the named existing targets; ordinary Hurewicz and covering lifts alone do not supply them.
- **Motivic input.** MotivicEtaleKTheory, early weight-two and weight-three layers M.4–M.6, supplies the integral motivic spectral sequence, the Milnor edge identification, the finite étale degree-zero comparison and the relevant divisibility over algebraic closures. The needed low-degree exact sequence and the vanishing of its potential d₂ are stated in Layer 2. The characteristic-two branch additionally requires absence of 2-torsion in K₃ᴹ(F). M.5d's `milnor-torsion-divisible` supplies divisibility of characteristic-primary torsion, which does not imply its vanishing; the torsion-freeness input remains a prerequisite gap. The algebraically closed comparison also supplies the torsion e-invariant K₃(Ω)_tors≃μ_Ω(2), with the finite Bockstein convention of VI.2.1. The independent Chern construction is M.8/`finite-etale-chern`: additive maps cᵢ,ₙ:Kₙ(X;ℤ/m)→H²ⁱ⁻ⁿ(X,μ_m^⊗i), for regular X, m invertible and i,n≥1. It does not assert that the degree-three second Chern map is an isomorphism (the map denoted c₂,₁ in Levine’s indexing). Section 6.7 owns the degree-three isomorphism using Hutchinson 2024, Theorem 2.10, p.4, after the algebraic Suslin construction. Late regulator comparisons are consumers.
- **Spectral sequences.** StableHomotopyKTheory H.6 supplies the stable Atiyah–Hirzebruch spectral sequence with products and unit splitting. The group-module hyperhomology required for configurations and frames is constructed in Layer 4 from projective resolutions and finite total-degree filtrations; it is not inferred from a spectrum-only statement. Use the Shapiro, integral Künneth and filtered-colimit comparisons deferred in Scope and ownership, retaining their natural maps. Over ℤ the Künneth sequence splits abstractly, but its splitting is not natural; the configuration swap uses the canonical cross-product term and its Koszul sign.
- **Arithmetic.** KTheoryFiniteLocalFields L.1 supplies |K₃(𝔽_q)|=q²−1, K₂(𝔽_q)=0 and its actual functorial maps. ArithmeticKTheory N.3–N.5/N.7 and BorelRegulators R.3 supply finite generation, rank r₂, w₂(F)=|H⁰(F,μ(2))| and the corresponding ambient K₃ structures. N.7/`w-invariant` supplies w₂(ℚ(i))=24, with its proof from N.4's `computing-w-from-the-cyclotomic-character` and `two-primary-w-invariant`. For r₁>0 the ambient structure is ℤ^{r₂}⊕ℤ/(2w₂)⊕(ℤ/2)^{r₁−1}; for r₁=0 it is ℤ^{r₂}⊕ℤ/w₂. These abstract structures do not choose free generators or split the Milnor-image extension. This roadmap identifies the actual Milnor quotient. Weak approximation supplies prescribed real sign patterns.
- **Smooth-curve specialization.** AlgebraicCurves Layer 12A supplies that a rational point of a smooth integral curve gives a DVR with residue field F. The elementary specialization lemma in §3.12 is the algebraic weight-two input; it is placed here before the general Polylogarithms P.4 applications to avoid a reverse dependency.
- **Analytic and Habiro consumers.** Polylogarithms P.1 supplies L(1/2)=π²/12 and the Rogers five-term identity, with its interval normalization. The real homomorphism in §5.8 fixes its period. HabiroNumberFields HB.1–HB.2 supplies the CGZ étale Bloch group, its K₂[n] extension, R_ζ and its comparison scalar only for the final application in §6.7. It uses the same twist/Kummer convention as c̄₂,₁. Earlier parts of this roadmap do not depend on HB.2.

The following required refinements have no verified exact supplier target: the unstable H₂(SL₂(F)) coinvariant symbol presentation used in §4.5 (K2SymbolsBrauer Part II); the stable-elements and cyclic/quaternion periodic finite-group calculations beyond the current homology APIs (StableHomotopyKTheory Part II); and the full-field integral motivic Chern diagonal identity used to bound the §2.2 kernel by two. MotivicEtaleKTheory M.6/`universal-motivic-chern` constructs operations for smooth schemes over a perfect base; passage to every field and the required diagonal identity must be supplied explicitly. These are prerequisite gaps, alongside the Hopf and characteristic-primary torsion gaps stated above.

The build is ordered by these slices: linear/Steinberg, topology and early K-theory first; the algebraic comparison next; real, p-adic and quantum regulators afterwards. No numeric tier is assigned here to a roadmap outside the Caraiani–Newton tier order. The final Habiro application consumes the already constructed comparison and has no edge back into its proof.

## How to read the build

Layer 1 produces the actual homological K₃ map and finite-chain equality witnesses. Layer 2 forms the indecomposable quotient and identifies the number-field decomposable subgroup by signs. Layer 3 constructs the symbolic presentations before comparing them, so torsion lost in a change of convention remains visible. Layer 4 constructs the infinite-field Suslin map and identifies its natural kernel. Layer 5 supplies the separate finite-field route and tests the integral arithmetic consequences. Layer 6 packages certificates, root multiples and coefficient comparisons for downstream use. `Suggested.lean` records only the definitions and end statements expressible over the pinned carriers; the README specifies the complete construction.

## Layer 1: Homological K₃ of a ring

Start with an associative unital ring A. The targets in this layer apply the stable Steinberg and plus-construction suppliers to identify K₃(A) with actual third group homology. The equality test for representatives is a finite bar-boundary witness; it is stronger than a statement about the existence of an abstract group isomorphism.

### 1.1 The Steinberg plus space

For an associative unital ring A, define bStPlus(A)=BSt(A)⁺ by applying the based plus construction to BSt(A) relative to its entire perfect fundamental group. Write ι:BSt(A)→BSt(A)⁺ and q:BSt(A)⁺→BGL(A)⁺ for the canonical maps. The first induces integral homology isomorphisms, and both commute with ring-induced maps up to based homotopy. The space is two-connected and q induces πₙ(BSt(A)⁺)≅Kₙ(A) for n≥3, through the fibre and covering comparisons in the supplier contracts.

Here, the plus construction is the one of StableHomotopyKTheory H.3, taken relative to the named perfect normal subgroup.

Provide `bStPlus` (For a ring A, the space BSt(A)⁺ together with the canonical map ι : B St(A) → BSt(A)⁺); `bStPlus.ι_homology` (ι induces isomorphisms H_n(B St(A); Z) ≅ H_n(BSt(A)⁺; Z) for all n); `bStPlus.toBGLPlus` (The map q : BSt(A)⁺ → BGL(A)⁺ induced by St(A) → E(A) ⊂ GL(A)).

Provide `bStPlus_map` (A ring map A → B induces a map BSt(A)⁺ → BSt(B)⁺ compatible with ι and q up to homotopy); `bStPlus_map_id` (The map induced by the identity of A is homotopic to the identity); `bStPlus_map_comp` (The map induced by g ∘ f is homotopic to the composite of the maps induced by g and f).

Provide `bStPlus_twoConnected` (BSt(A)⁺ is 2-connected (§1.1)); `bStPlus_pi_eq_K` (For n ≥ 3, q induces π_n(BSt(A)⁺) ≅ K_n(A), natural in A (§1.1)); `bStPlus_fibration` (The homotopy fibration B K_2(A) → BSt(A)⁺ → BE(A)⁺ (the supplier contract)).

For every associative unital ring A, let X_A = BSt(A)⁺ be the plus model. It is path connected with π₁(X_A)=π₂(X_A)=0. Its degree-three Hurewicz map is an isomorphism π₃(X_A) ≅ H₃(X_A; ℤ), natural for the chosen based ring-induced maps. This is the first nonzero-degree Hurewicz map, not a Hurewicz isomorphism for BGL(A)⁺.

Here A is an associative unital ring; use the stable Steinberg group in the same universe as ℤ. Classifying spaces and plus models have CW homotopy type, with chosen basepoints.

For each ring A the canonical map q_A:BSt(A)⁺→BGL(A)⁺, induced by St(A)→E(A)→GL(A), factors through the simply connected cover Y_A of BGL(A)⁺. Under the imported relative-plus comparison there is a homotopy fibration BK₂(A)→BSt(A)⁺→BE(A)⁺, and BE(A)⁺≃Y_A under BE(A). Thus q_A induces π_n isomorphisms for n≥3 and exhibits BSt(A)⁺ as a two-connected cover of the base component of K(A). Chosen space representatives commute with ring maps up to based homotopy; induced homotopy-group maps commute exactly.

Here A is associative and unital. The central kernel is the stable K₂(A). Use the relative-plus and covering comparisons in the exact supplier contracts.

The source locators for these statements are Weibel, K-book, Ex. IV.1.9 (PDF p. 282); Weibel, K-book IV, IV.1, Exercise 1.9, IV.14–15; Weibel, K-book IV, IV.1, Exercises 1.8–1.9, IV.14–15.

**Checks.**

- For the zero ring, St(0) is trivial and BSt(0)⁺ is contractible.
- π_1(BSt(Z)⁺) = 1 although π_1(B St(Z)) = St(Z) ≠ 1: a definition taking the plus construction relative to the trivial subgroup fails this test.
- ι induces H_3(BSt(A)⁺; Z) ≅ groupHomology (Rep.trivial Z (St A) Z) 3, through the comparison of StableHomotopyKTheory H.1.
- π_2(BSt(Z)⁺) = 0 whereas π_2(BE(Z)⁺) ≅ K_2(Z) ≅ Z/2, so BSt(A)⁺ is not BE(A)⁺.
- π_1(BGL(Q)⁺) ≅ K_1(Q) ≅ Q^× is nontrivial while π_1(BSt(Q)⁺) = 1, so BSt(A)⁺ is not BGL(A)⁺.

Needs the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.2 The canonical third-homology comparison

For every associative unital ring A, refine the comparison to the canonical additive isomorphism c_A:K₃(A)≅H₃(St(A);ℤ). If q₃:π₃(BSt⁺)≅K₃(A), h₃:π₃(BSt⁺)≅H₃(BSt⁺), j₃:H₃(BSt)≅H₃(BSt⁺) and b₃:H₃(BSt)≅H₃(St(A);ℤ) are the specified supplier maps, define c_A=b₃∘j₃⁻¹∘h₃∘q₃⁻¹. All homology uses trivial integral coefficients. An additive isomorphism is automatically ℤ-linear.

Here A is associative and unital; K₃ is the imported plus/Q K-theory group. Maps q₃, h₃, j₃ and b₃ are the canonical maps indicated, with the agreed basepoints and orientations.

Provide `K3Homological.comparison` (Given the four canonical isomorphisms, form c_A in the specified order); `K3Homological.comparison_apply` (c_A(x)=b₃(j₃⁻¹(h₃(q₃⁻¹(x))))); `K3Homological.comparison_symm_apply` (c_A⁻¹(z)=q₃(h₃⁻¹(j₃(b₃⁻¹(z))))).

Provide `K3Homological.comparison_zero` (c_A(0)=0); `K3Homological.comparison_add` (c_A(x+y)=c_A(x)+c_A(y), hence c_A is ℤ-linear); `K3Homological.comparison_eq_zero` (c_A(x)=0 exactly when x=0).

For the composition direction, take all five carriers equal to ℤ/5, q(x)=2x and h,j,b identity. Then comparison(1)=3, since q must be reversed; the unreversed composite gives 2. This is a Check on the lightweight composition helper, separate from the topological construction of the four specified maps.

The source locators for these statements are Weibel, K-book IV, IV.1, Exercise 1.9, IV.14–15.

**Checks.**

- If all four groups agree and all four imported isomorphisms are identities, c_A is the identity.
- For a subsingleton Steinberg group G and any genuine c:K≅H₃(G;ℤ), K is subsingleton.
- For each x, c_A(x)=0 if and only if x=0; the constant-zero map fails this for every nonzero x.
- For all carriers ℤ/5, q(x)=2x and h,j,b identity, the comparison sends 1 to 3; using q instead of its inverse sends it to 2.

Needs §1.1; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.3 Finite bar cycles and equality witnesses

Present H_3(St(A), Z) through Mathlib's inhomogeneous (bar) chain complex with trivial coefficients Z: a bar 3-chain is a finitely supported function St(A) × St(A) × St(A) → Z (chainsIso₃); it is a bar 3-cycle when d₃₂ vanishes on it, and a bar 3-boundary when it is the image of a 4-chain under the general differential of the inhomogeneous complex. Construct the evaluation sending a bar 3-cycle to the element of K_3(A) that corresponds, under §1.2, to its homology class, and the induced chain map along a ring homomorphism.

Here, coefficients are the trivial representation on Z.

Provide `barCycle3` (The type of bar 3-cycles of St(A) with trivial integer coefficients); `barCycle3.mk` (A finitely supported c : St(A) × St(A) × St(A) → Z with d₃₂ c = 0 gives a bar 3-cycle (via chainsIso₃ and cyclesMk)); `barBoundary3` (The bar 3-boundaries: images of 4-chains under the differential of the inhomogeneous complex).

Provide `evalBarCycle` (A bar 3-cycle determines an element of K_3(A)); `evalBarCycleHom` (Evaluation is an additive homomorphism from bar 3-cycles to K_3(A)); `evalBarCycle_eq` (evalBarCycle z is the image of groupHomology.π z under the inverse of the isomorphism of §1.2).

Provide `evalBarCycle_boundary` (A bar 3-boundary evaluates to zero); `evalBarCycle_surjective` (Every element of K_3(A) is the evaluation of some bar 3-cycle); `evalBarCycle_map` (For a ring map A → B, evaluation commutes with the induced chain map).

Provide `evalBarCycle_eq_iff` (Two bar 3-cycles evaluate equally exactly when their difference is a boundary).

For the existing unnormalised integral bar complex C_*(St(A)), let Z₃ be Mathlib’s cycles object and β:C₄→Z₃ its toCycles map. Refine the evaluation to the additive map ev_A:Z₃→K₃(A), ev_A(z)=c_A⁻¹(π(z)). It is surjective and ev_A(z)=ev_A(z′) if and only if there is a finitely supported w∈C₄ with β(w)=z−z′. The underlying chain condition is d₃z=0; no map C₃→K₃ is asserted on arbitrary chains.

Here A is associative and unital; use the canonical comparison c_A. C_n consists of finitely supported integer combinations of Fin n-tuples. Identity entries are retained.

Provide `K3Homological.eval3` (Compose π:Z₃→H₃(St(A)) with c_A inverse, as an additive map); `K3Homological.eval3_comparison` (c_A(ev_A(z))=π(z), with the exact pinned groupHomology.π); `K3Homological.eval3_zero` (ev_A(0)=0).

Provide `K3Homological.eval3_add` (ev_A(z+z′)=ev_A(z)+ev_A(z′)); `K3Homological.eval3_zsmul` (ev_A(mz)=m ev_A(z) for each integer m); `K3Homological.eval3_boundary` (ev_A(β(w))=0 for each 4-chain w).

Provide `K3Homological.eval3_eq_iff_certificate` (ev_A(z)=ev_A(z′) iff ∃w:C₄, β(w)=z−z′); `K3Homological.eval3_surjective` (Every element of K₃(A) is ev_A(z) for some cycle z). The named boundary targets `K3Homological.bar_four_identity_boundary` and `K3Homological.bar_noncycle` assert d₄[1|1|1|1]=[1|1|1] and d₃[g|1|1]≠0 for g≠1, respectively.

The source locators for these statements are Weibel, K-book, Ex. IV.1.9 (PDF p. 282); Weibel, K-book, Example VI.2.1.2 (PDF p. 478); Weibel, K-book IV, IV.1, Exercise 1.9 and Definition 1.1, IV.2,14–15.

**Checks.**

- The evaluation of the boundary of any 4-chain is zero.
- The 3-cycle single (1,1,1) 1 is the boundary of single (1,1,1,1) 1, so its evaluation is 0.
- For g = x_12(1) in St(Z), the chain single (g,1,1) 1 is not a bar 3-cycle: its image under d₃₂ is single (1,1) 1 − single (g,1) 1 ≠ 0.
- For the inclusion Z → Q, evaluation commutes with the induced map on K_3.
- The distinct cycles single (1,1,1) 1 and 0 have the same evaluation: evaluation is not injective on cycles.
- The nonzero chain [1|1|1] is a cycle and has evaluation zero, with witness [1|1|1|1].
- The zero cycle evaluates to zero.
- After c_A, evaluation agrees exactly with the pinned groupHomology.π on every cycle.
- Evaluation on cycles is not injective: [1|1|1] and zero are distinct cycles with equal values, even for the trivial group.
- For g≠1 the differential of [g|1|1] is nonzero; the constructor cannot silently treat every 3-chain as a cycle.

Needs §1.2; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.4 Ring maps and finite stages

For a unital ring map f:A→B let s_f:St(A)→St(B), K₃(f):K₃(A)→K₃(B), Z₃(f) and H₃(s_f) be the canonical maps. Then c_B∘K₃(f)=H₃(s_f)∘c_A and K₃(f)(ev_A(z))=ev_B(Z₃(f)z). If β_A(w)=z−z′, tuplewise chainsMap sends w to a certificate β_B(C₄(f)w)=Z₃(f)z−Z₃(f)z′. Identity and composition laws are strict on chains, cycles and groups; the space-level comparison uses based homotopies.

Here A and B associative unital rings; f preserves the unit. All coefficient maps are the identity of ℤ with trivial actions.

For any ring A and the directed tower St_n(A) defining St(A), every x∈K₃(A) has a representative cycle z_n∈Z₃(St_n(A);ℤ) at some finite rank n. If two finite-stage cycles have the same value in K₃(A), there is a common later rank m and a 4-chain w_m with d₄w_m equal to the difference of their stabilised underlying chains. Conversely any such witness proves equality. Neither injectivity of St_n→St(A) nor a uniform stable range is assumed.

Here A associative unital; use the imported colimit tower and its universal maps. Finite stages need not be superperfect, and are not assigned K₃(A) by a finite-rank Hurewicz theorem.

Provide `comparison_natural`, `eval3_natural` and `chainsMap_boundaryWitness` for the three squares, and `finiteStageCycle_exists` and `finiteStageBoundary_exists` for the two colimit assertions.

**Checks.**

- Over the zero ring every finite-stage group, cycle value and homology class is zero.
- For an identity ring map, tuplewise transport fixes every coefficient and every support tuple.
- For A→B→C, transport of a four-chain along the composite equals successive transport; its boundary is the same finite integer combination of image tuples.

Finite support supplies a common stage for both a cycle and the equations proving it is a cycle; it also supplies a stage for a chosen equality witness.

The source locators for these statements are Weibel, K-book IV, IV.1, Functoriality 1.1.2, IV.3; Weibel, K-book IV, IV.1, stable GL convention, IV.2; Exercise 1.9, IV.15.

Needs §1.2, §1.3; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.5 The elementary cover and the Hopf kernel

Let X_A be a well-pointed CW-type model of BGL(A)⁺ with the block-sum H-space structure of the early plus-construction contract, and p_A:Y_A→X_A a based simply connected covering model, Y_A locally path connected, p_A(y₀)=e_X. Lift μ_X∘(p_A×p_A) uniquely through p_A with value y₀ at (y₀,y₀). This multiplication, y₀, and lifted unit homotopies give Mathlib’s HSpace Y_A. Its multiplication projects exactly to μ_X; under the imported BE(A)⁺≃Y_A it supplies the H-space needed in the η-Hurewicz argument.

Here A associative unital; p_A is an actual covering map of the chosen CW-type K-space model. Y_A is simply connected and locally path connected, with chosen y₀ over the H-space unit. The block-sum H-space has based unit homotopies, as in the pinned HSpace carrier.

For a based simply connected well-pointed CW-type H-space X, composition with the based Hopf generator η:S³→S² gives an additive map η_X:π₂(X)→π₃(X), and π₂(X)→π₃(X)→H₃(X;ℤ)→0 is exact. In particular H₃(X)≅π₃(X)/im(η_X), naturally for based H-maps. The proof uses the elementary degree-three wedge calculation and a relative-Hurewicz consequence with H₃(Y)=0; it does not use Exercise IV.1.25 as printed.

Here X is a based simply connected well-pointed CW-type H-space. Consume the precise Hopf/Whitehead extension specified in the supplier contracts.

For every associative unital ring A, transport π₂(Y_A) and π₃(Y_A) to K₂(A) and K₃(A) through its covering projection and the imported plus model. Then the Hopf composition operation equals α↦α·[−1], the external pairing K₂(A)×K₁(ℤ)→K₃(A⊗ℤ)≅K₃(A). Under the canonical sphere-unit map π₁ˢ→K₁(ℤ), stable η maps to the unit class [−1]. No internal tensor product of two arbitrary A-modules, or commutativity of A, is required.

Here A is associative and unital. Use the external product over ℤ and the specified multiplicative sphere-unit compatibility; no commutativity of A is assumed.

For every associative unital ring A define h_A:K₃(A)→H₃(E(A);ℤ) by h_A=H₃(St(A)→E(A))∘c_A. Then K₂(A) --(α↦α·[−1])→ K₃(A) --h_A→ H₃(E(A);ℤ)→0 is exact and natural for unital ring maps. Equivalently c_A⁻¹ identifies the kernel of H₃(St(A))→H₃(E(A)) with the image of the minus-one product. This is a quotient of K₃, not an isomorphism K₃(A)≅H₃(E(A)).

Here A associative unital; trivial integral homology and the right K₁(ℤ)-scalar convention. Use all canonical comparison maps and the covering H-space structure, rather than arbitrary abstract group isomorphisms.

Provide `elementaryCover.mul_project`, `elementaryCover.unit_left` and `elementaryCover.unit_right` for multiplication and unit homotopies, and `elementaryCover.hspace_map` for transport under a ring-induced based H-map. Provide `hopfHurewicz_exact`, `hopf_eq_minusOneProduct` and `elementaryHomology_exact` for the three comparisons.

**Checks.**

- The cover over the zero ring is contractible, and its multiplication has one homotopy class.
- For the identity covering of a simply connected H-space the lifted multiplication is the given multiplication; in general projection of a lifted product is exactly the product of the projections.
- For A=ℤ the quotient is ℤ/48→ℤ/24 with an order-two kernel; it has no additive section.
- In characteristic two the minus-one product is zero.
- For X=K(ℤ,2), both π₃ and H₃ vanish; for X=K(ℤ,3), π₃≃H₃≃ℤ and π₂=0.

For the Hopf exact sequence, choose a wedge of two-spheres mapping onto π₂(X). The relative Hurewicz sequence identifies the Hurewicz kernel with its π₃ image. The wedge calculation gives Hopf and Whitehead terms; the H-space multiplication kills the Whitehead terms and makes Hopf composition additive. The stable unit comparison then identifies the remaining operation with the external minus-one product.

The source locators for these statements are Weibel, K-book IV, IV.1, Exercise 1.11 and Corollary 1.20, IV.14–15; Weibel, K-book IV, IV.1, Lemma 1.19 and Remark 1.19.1, IV.13; Hatcher, Algebraic Topology, Section 4.2, Examples 4.51–4.52, printed pp.380–381; Exercise 37, p.392; Weibel, K-book IV, IV.1, Exercise 1.12(a),(e), IV.15; IV.4, Theorem 4.9.3, IV.43; Weibel, K-book IV, IV.1, Corollary 1.20, IV.13–14.

Needs §1.1, §1.2, §1.4; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### Examples

In the unnormalised bar complex, d₄[1|1|1|1]=[1|1|1]. This nonzero cycle has zero evaluation even for the trivial group. In contrast d₃[g|1|1]=[1|1]−[g|1] is nonzero for g≠1. The cycle equation, the homology projection and evaluation are three separate operations. Over ℤ, passing from St to E then halves the order of the third homology group from 48 to 24.

### Dependencies

Use KTheoryLowDegrees U.1/U.3, K2SymbolsBrauer T.1, GeneralAlgebraicKTheory’s early K.2 plus model and K.7 external products, StableHomotopyKTheory H.1–H.3/H.5, AlgebraicTopology Stage 8 and its stated Hopf extension, and UniversalCovers Stages 2–3. The bar chains, cycles and maps are Mathlib’s. No field stability theorem enters this layer.

## Layer 2: Decomposable and indecomposable K₃

Here F is a field. The degree-three Milnor comparison determines both the subgroup of decomposables and its quotient. Injectivity is integral and requires the motivic argument; rational ranks alone cannot establish it. Number-field signatures make the subgroup explicit without choosing a splitting of K₃(F).

### 2.1 The Milnor image and its cokernel

Specialise the graded ring map K^M_*(F) -> K_*(F) imported from K2SymbolsBrauer T.2 to degree three, obtaining a homomorphism K_3^M(F) -> K_3(F) determined by the product of three units. Nothing about this map is asserted in degrees other than three, and its degree-two case, an isomorphism by Matsumoto's theorem, is not a model for degree three.

Provide `milnorToQuillen3` (The homomorphism K_3^M(F) → K_3(F)); `milnorToQuillen3_symbol` (It sends the Milnor symbol {a,b,c} to the product [a]·[b]·[c] of K_1 classes, in this order); `milnorToQuillen3_symbol_eq_mul` (milnorToQuillen3 {a,b,c} = [a]·m({b,c}) under the product K_1(F) ⊗ K_2(F) → K_3(F), where m is Matsumoto's isomorphism K_2^M(F) ≅ K_2(F)).

Provide `milnorToQuillen3_map` (It is natural in the field for every field homomorphism); `milnorToQuillen3_map_id` (The naturality square for the identity of F is the identity); `milnorToQuillen3_map_comp` (The naturality squares compose along composites of field homomorphisms).

Provide `milnorToQuillen3_graded` (It is the degree-three component of the imported graded ring map).

Define K_3^ind(F) as the cokernel of the degree-three Milnor-to-Quillen map, together with the quotient map K_3(F) -> K_3^ind(F). The decomposable part is by definition the image of that map; it is a subgroup of K_3(F) isomorphic to K_3^M(F) only once injectivity has been proved, which is a separate theorem.

Provide `K3ind` (The abelian group K_3^ind(F)); `K3ind.mk` (The surjection K_3(F) → K_3^ind(F)); `K3ind.mk_surjective` (K3ind.mk is surjective).

Provide `K3ind.mk_eq_zero_iff` (A class dies in the quotient exactly when it lies in the image of the degree-three map); `K3ind.mk_milnorToQuillen3` (K3ind.mk (milnorToQuillen3 x) = 0 for every x in K_3^M(F)); `K3ind.lift` (A homomorphism f : K_3(F) → M with f ∘ milnorToQuillen3 = 0 descends to K3ind F → M).

Provide `K3ind.lift_mk` (K3ind.lift f (K3ind.mk x) = f x); `K3ind.ext` (Two homomorphisms out of K_3^ind(F) agree when their composites with the quotient map agree); `K3ind.map` (A field homomorphism induces a map of indecomposable quotients, compatibly with the quotient maps).

Provide `K3ind.map_id` (The map induced by the identity is the identity); `K3ind.map_comp` (The map induced by a composite is the composite of the induced maps); `K3ind.map_mk` (K3ind.map φ (K3ind.mk x) = K3ind.mk (K_3(φ) x)).

Provide `K3ind.equivQuotient` (K3ind F is isomorphic to the quotient of K_3(F) by the range of milnorToQuillen3, as a Mathlib QuotientAddGroup); `K3ind.decomposable` (The decomposable subgroup, defined as the image, with its inclusion).

The sequence K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0 is exact and natural in F. Exactness on the left is not asserted here; it is the content of the injectivity theorem.

The source locators for these statements are Weibel, K-book, Example IV.1.10.1 (PDF p. 274); Weibel, K-book, VI.5 opening (PDF p. 495).

**Checks.**

- For a finite field the source vanishes, so the map is zero.
- For F = Q the symbol {−1,−1,−1} has nonzero image, of order two.
- For Q inside R the square with the induced maps commutes.
- For a number field with r_2 > 0 the map is not surjective, since the target has positive rank and the source is torsion.
- For units a, b, c of F, milnorToQuillen3 {a,b,c} = [a]·[b]·[c] in K_3(F), with the product taken in this order.
- For a finite field the quotient map is an isomorphism (K_3^M(F_q) = 0).
- For Q the quotient is cyclic of order 24 while K_3 is cyclic of order 48.
- For a number field the quotient has free rank r_2.
- K_3(Q) modulo its torsion subgroup is 0, but K_3^ind(Q) ≅ Z/24: the indecomposable quotient is not the torsion-free quotient.

Needs Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.2 Injectivity and the motivic edge

For every field F the degree-three map K_3^M(F) -> K_3(F) is injective. In characteristic two the proof requires Izhboldin’s absence of characteristic-primary torsion in Milnor K-theory (Weibel III.7.8, chapter pp.67–68; VI.4.3.2, p.18). This input is a K2SymbolsBrauer Part II prerequisite gap: divisibility of the torsion subgroup in MotivicEtaleKTheory M.5d is insufficient. Consequently the decomposable part is isomorphic to K_3^M(F) and the sequence of the previous lemma is short exact.

For a field k, the motivic spectral sequence E_2^{p,q} = H^{p−q}(k, Z(−q)) ⇒ K_{−p−q}(k) yields an exact sequence K_4(k) → H^0(k, Z(2)) → K_3^M(k) → K_3(k) → H^1(k, Z(2)) → 0, in which the middle map is milnorToQuillen3 under the Nesterenko–Suslin–Totaro isomorphism K_3^M(k) ≅ H^3(k, Z(3)), and the map into K_3^M(k) is the differential d_2.

For every field F, twice every element of the kernel of K_3^M(F) → K_3(F) is zero.

For every field F of characteristic different from 2, H⁰(F,Z(2))/2=0. Consequently the integral differential d₂:H⁰(F,Z(2))→K₃ᴹ(F) in the low-degree sequence is zero. This theorem refines the characteristic-not-two branch of the injectivity proof; it does not use that injectivity theorem as an input.

Here char(F)≠2.

For every field F the edge map e_F:K₃(F)→H¹(F,Z(2)) in the low-degree integral sequence induces a natural additive equivalence e_m:K₃^ind(F)≃H¹(F,Z(2)), characterized by e_m(q_F(x))=e_F(x). This is a quotient assertion; it uses right exactness of the sequence and does not need injectivity of m₃.

Provide `motivicEdgeQuotientEquiv` (e_m:K₃^ind(F)≃+H¹(F,Z(2))); `motivicEdgeQuotientEquiv_apply` (e_m(q_F(x))=e_F(x)); `motivicEdgeQuotientEquiv_symm_apply` (e_m⁻¹(e_F(x))=q_F(x)).

Provide `motivicEdgeQuotientEquiv_unique` (Every additive homomorphism with this evaluation on representatives equals e_m); `motivicEdgeQuotientEquiv_map` (The equivalence commutes with maps induced by every field homomorphism).

The source locators for these statements are Weibel, K-book, Proposition VI.4.3.2 (PDF p. 490); Weibel, K-book, Low degree terms VI.4.3.1 (PDF p. 490); Weibel, K-book, Edge Map VI.4.3 (PDF p. 489); Weibel, K-book, Lemma V.11.13 (PDF p. 466); Weibel, K-book VI, VI.4.3.1–4.3.2, chapter PDF pp.17–18; for the corrected K₄-divisibility citation, VI.1.3.1(i), p.3, and VI.1.6(i), pp.4–5; Weibel, K-book V, V.11.3, V.11.11, Lemma 11.13, chapter PDF pp.81–82,85–87; Weibel, K-book VI, VI.4.3.1, chapter PDF p.17.

**Checks.**

- The equivalence takes the zero quotient class to zero.
- e_m(q_F(m₃(x)))=0 for every Milnor class x.
- The inverse of the edge image e_F(x) is exactly q_F(x).

Needs §2.1; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.3 Real places and the decomposable subgroup

Let R(F) be the finite subtype of real infinite places and σ_F:K₃ᴹ(F)≃⊕_{v∈R(F)} Z/2 the imported Bass–Tate signature, written additively with 1 for an all-negative triple. Define b_v=σ_F⁻¹(δ_v), where δ_v is 1 at v and 0 elsewhere. This is canonical; choosing a sign-isolating unit is not part of its data.

Here F is a number field.

Provide `realBasis` (b_v=σ_F⁻¹(δ_v)); `realBasis_signature` (σ_F(b_v)(w) equals 1 if w=v and 0 otherwise); `realBasis_nonzero` (b_v≠0 for each real place v).

Provide `realBasis_two_nsmul` (2b_v=0); `realBasis_expand` (Every x is the sum of b_v over the real places with σ_F(x)(v)=1); `realBasis_map` (For an embedding F→L of number fields, restriction sends b_v to the sum over real places w of L restricting to v).

For each real place v of a number field F, there exists u_v∈F× negative at v and positive at every other real place. For every such u_v, b_v={−1,−1,u_v}. Thus the symbol is independent of the chosen sign-isolating unit.

For a number field F the additive homomorphism p_F:K₂ᴹ(F)→K₃ᴹ(F), x↦{−1}·x, is surjective. Under Matsumoto and the imported graded comparison, the image of K₂(F) --[−1]·→ K₃(F) equals the decomposable subgroup D(F)=im(m₃). This statement is about number fields; no all-fields equality of these two images is asserted.

For a number field F, let D(F)=im(m₃)⊆K₃(F), the decomposable subgroup. Integral injectivity gives j:K₃ᴹ(F)≃D(F). Construct s_D:D(F)≃⊕_{v real} Z/2 as σ_F∘j⁻¹. In particular |D(F)|=2^{r₁} and every element of D(F) is killed by 2; do not identify D(F) with all torsion in K₃(F).

Provide `decomposableSignature` (The additive equivalence s_D:D(F)≃(R(F)→Z/2)); `decomposableSignature_apply` (s_D(m₃(x), membership in its range)=σ_F(x)); `decomposableSignature_symm` (s_D⁻¹(t) has ambient K₃ class m₃(σ_F⁻¹(t))).

Provide `decomposableSignature_two_nsmul` (2d=0 for d∈D(F)); `decomposableSignature_card` (The finite cardinality of D(F) equals 2^{r₁}); `decomposableSignature_map` (Restriction of D(F)→D(L) corresponds to pulling back sign functions along R(L)→R(F)).

The source locators for these statements are Weibel, K-book III, Examples 7.2(c–d), pp. 61–62 (Bass–Tate signs); Weibel, K-book VI, VI.4.3.2, chapter PDF p.18.

**Checks.**

- With the single real coordinate of Q, σ_Q(b)=1.
- When R(F) is empty every x∈K₃ᴹ(F) equals zero.
- For two distinct real places v,w, b_v≠b_w. Defining every generator as {−1,−1,−1} fails this test.
- The signature of m₃(0) is the zero function.
- A class mapping to the unique coordinate 1 is nonzero, so D(Q) is not zero.
- With an empty real-place type every ambient decomposable class is zero.
- For every real place v, the decomposable signature of the ambient Milnor image m₃(b_v) is δ_v. Postcomposing with a nontrivial coordinate permutation or another additive automorphism fails this test.

Needs §2.1, §2.2; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.4 Totally imaginary fields and stable special-linear homology

For a field F, the Hurewicz map K_3(F) → H_3(SL(F), Z) is surjective, and its kernel is the image under milnorToQuillen3 of the subgroup {−1}·K_2^M(F) of K_3^M(F) generated by the symbols {−1, a, b}. Once §2.2 is available, the kernel is that subgroup itself.

If F is a number field with r₁=0, the quotient q_F:K₃(F)→K₃^ind(F) is an additive equivalence e_F. Construct it from q_F and D(F)=0; its inverse is the unique lift of a quotient class. It is natural for embeddings between totally imaginary number fields.

Here F is a number field. F has no real infinite places: r₁(F)=0.

Provide `totallyImaginaryQuotientEquiv` (e_F:K₃(F)≃+K₃^ind(F)); `totallyImaginaryQuotientEquiv_apply` (e_F(x)=q_F(x)); `totallyImaginaryQuotientEquiv_symm_apply` (e_F⁻¹(q_F(x))=x).

Provide `totallyImaginaryQuotientEquiv_map` (For an embedding of totally imaginary number fields, e_L∘K₃(f)=K₃^ind(f)∘e_F).

For a number field F the stable Hurewicz map h_F:K₃(F)→H₃(SL(F),Z) factors uniquely through an additive equivalence e_h:K₃^ind(F)≃H₃(SL(F),Z). Here SL(F) is the stable special linear group, not SL₂(F). The equivalence is natural under embeddings of number fields.

Provide `stableHurewiczQuotientEquiv` (e_h:K₃^ind(F)≃+H₃(SL(F),Z)); `stableHurewiczQuotientEquiv_apply` (e_h(q_F(x))=h_F(x)); `stableHurewiczQuotientEquiv_symm_apply` (e_h⁻¹(h_F(x))=q_F(x)).

Provide `stableHurewiczQuotientEquiv_unique` (Every additive homomorphism with this evaluation on q_F equals e_h); `stableHurewiczQuotientEquiv_map` (e_h commutes with K₃^ind(f) and stable H₃(SL(f),Z)).

The source locators for these statements are Weibel, K-book, VI.5 opening (PDF p. 495); Weibel, K-book III, Examples 7.2(c–d), pp. 61–62 (Bass–Tate signs); Weibel, K-book VI, VI.5 opening, chapter PDF p.23 (definition of the cokernel); Weibel, K-book VI, VI.5 opening paragraph, chapter PDF p.23.

**Checks.**

- The equivalence takes zero to the zero quotient class.
- Applying the inverse to the quotient class of x recovers x.
- q_F(x)=q_F(y) iff x=y under D(F)=0.
- The equivalence sends the zero class to zero.
- e_h(q_F(m₃(x)))=0 for every Milnor class x.
- h_F(x)=0 iff q_F(x)=0.
- For every ambient class x, e_h(q_F(x))=h_F(x). An unrelated isomorphism with the same kernel or a postcomposition by an automorphism of stable H₃ fails this test.

Needs §1.5, §2.1, §2.3; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.5 Information lost over the rationals

For a number field F, the quotient map induces an isomorphism K_3(F) ⊗_Z Q ≅ K_3^ind(F) ⊗_Z Q of rational vector spaces of dimension r_2, and K_3^M(F) ⊗_Z Q = 0.

Here F is a number field.

The source locators for these statements are Weibel, K-book, VI.5.3 (PDF p. 496).

Needs §2.1, §2.3; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### Examples

For ℚ the real-place basis is the single symbol {−1,−1,−1}. Its image is the unique element of order two in K₃(ℚ)=ℤ/48, so the quotient is ℤ/24 and the quotient extension does not split. For ℚ(i) the real-place type is empty; the Milnor image vanishes and the quotient map is an isomorphism. Tensoring either example with ℚ forgets this difference.

### Dependencies

Use Layer 1, K2SymbolsBrauer T.2 for symbols, Matsumoto and the global sign theorem, MotivicEtaleKTheory’s early M.4–M.6 comparisons, and ArithmeticKTheory N.3/N.5/N.7 with BorelRegulators R.3. GlobalNumberFields Layer 1 supplies weak approximation; Mathlib supplies the real-place subtype and quotient groups. The motivic edge equivalence follows from right exactness before the separate injectivity proof.

## Layer 3: Bloch presentations with integral conventions

All fields are permitted in the basic presentations. Every use of c and the inversion homomorphism states the additional size hypothesis |F|≥4. The main boundary takes values in an antisymmetric tensor cokernel, whose diagonal classes can have order two. Three other tensor targets and two different configuration presentations are compared only by named maps.

### 3.1 The antisymmetric tensor cokernel

For a commutative ring R and an R-module M, antisymSquare R M is the quotient of M ⊗_R M by the submodule LinearMap.range (id + comm), which is the submodule spanned by all a ⊗ b + b ⊗ a; the class of a ⊗ b is written a ∧ b. The roadmap uses R = ℤ and M = Additive Fˣ, which is the K-book's ∧̃²A. It is the cokernel of 1 + τ (τ the flip): it is not Tau Ceti's antisymmetricTensors, which is the kernel of 1 + τ, and it is not the exterior square, since the class a ∧ a need not vanish.

Here R is a commutative ring and M is an R-module; the roadmap uses R = ℤ and M = Additive Fˣ. No hypothesis on 2: the construction is used over ℤ, where 2 is not invertible.

Provide `antisymSquare` (The R-module antisymSquare R M = (M ⊗[R] M) ⧸ LinearMap.range (id + comm)); `antisymSquare.mk` (The bilinear map M → M → antisymSquare R M, (a, b) ↦ a ∧ b); `antisymSquare.ker_mkQ` (The kernel of the quotient map M ⊗ M → antisymSquare R M is LinearMap.range (id + comm), which is the span of the a ⊗ b + b ⊗ a).

Provide `antisymSquare.antisymm` (a ∧ b + b ∧ a = 0 for all a, b); `antisymSquare.wedge_self_add` ((a + b) ∧ (a + b) = a ∧ a + b ∧ b); `antisymSquare.two_smul_wedge_self` (2 • (a ∧ a) = 0).

Provide `antisymSquare.wedgeSelf` (The additive map M → antisymSquare R M, a ↦ a ∧ a, which vanishes on 2M); `antisymSquare.lift` (A bilinear map f : M → M → N with f a b + f b a = 0 factors uniquely through antisymSquare R M); `antisymSquare.lift_mk` (lift f (a ∧ b) = f a b).

Provide `antisymSquare.hom_ext` (Two linear maps out of antisymSquare R M that agree on every a ∧ b are equal); `antisymSquare.map` (A linear map g : M → N induces antisymSquare R M → antisymSquare R N with map g (a ∧ b) = g a ∧ g b, map id = id and map (g ∘ h) = map g ∘ map h); `antisymSquare.toExterior` (The canonical surjection onto Mathlib's exterior square ⋀[R]^2 M, with toExterior (a ∧ b) = exteriorPower.ιMulti R 2 ![a, b]).

Provide `antisymSquare.equivAntisymmetricTensors` (When 2 is invertible in R, a ∧ b ↦ ⅟2 • (a ⊗ b − b ⊗ a) is an R-linear equivalence from antisymSquare R M onto TauCeti.antisymmetricTensors R M); `antisymSquare.equivCoinvariants` (antisymSquare R M is equivalent to Representation.Coinvariants of the action of Multiplicative (ZMod 2) on M ⊗ M in which the generator acts by −comm); `antisymSquare.prodEquiv` (antisymSquare R (M × N) ≃ antisymSquare R M × antisymSquare R N × (M ⊗[R] N)).

Provide `antisymSquare.zmodEquiv` (antisymSquare ℤ (ZMod n) ≃ ZMod (gcd 2 n), and antisymSquare ℤ ℤ ≃ ZMod 2).

For every abelian group A, the canonical surjection toExterior from antisymSquare ℤ A onto the exterior square ⋀[ℤ]^2 A has kernel the subgroup of classes a ∧ a, and a ↦ a ∧ a induces an isomorphism from A/2A onto that kernel. So 0 → A/2A → antisymSquare ℤ A → ⋀[ℤ]^2 A → 0 is exact.

Here A is an abelian group.

The source locators for these statements are Weibel, K-book, VI.5, opening of the section (PDF p. 495).

**Checks.**

- For M = ZMod 2 the class 1 ∧ 1 is nonzero, which the exterior square would kill.
- a ∧ b = −(b ∧ a) for all a and b.
- antisymSquare ℤ ℤ ≃ ZMod 2, generated by 1 ∧ 1. This fails for the exterior square (which is zero), for the tensor square ℤ ⊗ ℤ ≅ ℤ, and for TauCeti.antisymmetricTensors ℤ ℤ (which is ⊥).
- antisymSquare ℤ (ZMod 3) = 0, because 1 + τ = 2 is invertible on ZMod 3 ⊗ ZMod 3; the unquotiented tensor square fails this.
- For R with ⅟2 and any R-module M, equivAntisymmetricTensors is an equivalence antisymSquare R M ≃ₗ[R] TauCeti.antisymmetricTensors R M; for R = M = ℤ no such equivalence exists (ZMod 2 against ⊥).
- For M = ZMod 2 the map toExterior is not injective: its source is ZMod 2 and its target is zero.

Needs the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.2 The projective cross-ratio

For a field F and pairwise distinct points (a, b, c, d) of ℙ¹(F), let cr(a, b, c, d) = g(d) ∈ F − {0, 1}, where g is the unique element of PGL_2(F) with g(a) = 0, g(b) = ∞ and g(c) = 1; in homogeneous coordinates cr(a, b, c, d) = [d, a][c, b] / ([d, b][c, a]) with [u, v] = u₀v₁ − u₁v₀. Then cr is GL_2(F)-invariant, cr(0, ∞, 1, x) = x, cr induces a bijection from the GL_2(F)-orbits of injective 4-tuples onto F − {0, 1}, and the stabiliser in GL_2(F) of every injective triple is the centre.

Provide `crossRatio` (cr : (Fin 4 ↪ ℙ¹(F)) → F − {0, 1}, by the determinant formula); `crossRatio_smul` (cr(g • t) = cr(t) for g ∈ GL_2(F)); `crossRatio_std` (cr(0, ∞, 1, x) = x for x ∉ {0, 1}).

Provide `crossRatio_eq_iff` (cr(t) = cr(t′) if and only if t′ = g • t for some g ∈ GL_2(F)); `isMultiplyPretransitive_three` (GL_2(F) is 3-pretransitive on ℙ¹(F), and the stabiliser of (0, ∞, 1) is the centre); `crossRatio_swap` (cr(b, a, c, d) = cr(a, b, c, d)^{−1} and cr(a, b, d, c) = cr(a, b, c, d)^{−1}).

Provide `crossRatio_faces` (The five face values of (0, ∞, 1, x, y) in deletion order below).

The five face values of (0,∞,1,x,y), in deletion order, are (1−x)/(1−y), (1−x⁻¹)/(1−y⁻¹), y/x, y and x. Their alternating sum is precisely the five-term expression. For (x,y)=(2,3) over ℚ these are 1/2, 3/4, 3/2, 3 and 2. Distinctness makes both determinant denominators nonzero. Over F₂ there are no injective four-tuples, agreeing with F₂−{0,1} being empty.

The source locators for these statements are Weibel, K-book, Proof of Lemma VI.5.6 (PDF p. 498).

**Checks.**

- cr(0, ∞, 1, x) = x and cr(∞, 0, 1, x) = x^{−1}.
- Over ℚ, z ↦ z + 1 sends (0, ∞, 1, 2) to (1, ∞, 2, 3), and cr(1, ∞, 2, 3) = 2.
- Over F_3, every ordering of the four points of ℙ¹(F_3) has cross-ratio −1.
- cr(0, ∞, 1, x) ≠ cr(∞, 0, 1, x) when x² ≠ 1, so cr is not a function of the underlying set of four points.

Needs the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.3 Admissible five-term relations

For a field F and elements x, y of F with x and y outside the set consisting of 0 and 1 and with x different from y, the five-term element of the free abelian group on the symbols [z], z in F without 0, is [x] - [y] + [y/x] - [(1 - x^{-1})/(1 - y^{-1})] + [(1 - x)/(1 - y)]. The five-term subgroup is the subgroup generated by all these elements together with the element [1]. This is Suslin's normalisation, as presented in the K-book; the Calegari-Garoufalidis-Zagier normalisation indexes the same expression over the projective line and is compared in §§3.13–3.16.

Here F is a field; x and y lie in F, are different from 0 and 1, and are different from each other. The five arguments are then all defined and different from 0.

Provide `fiveTerm` (The five-term element [x] − [y] + [y/x] − [(1 − x^{-1})/(1 − y^{-1})] + [(1 − x)/(1 − y)] attached to an admissible pair (x ≠ y, both in F − {0, 1})); `fiveTermSubgroup` (The subgroup generated by all five-term elements and by [1]); `fiveTerm_mem` (Membership in the five-term subgroup as a finite integer combination of five-term elements and of [1]).

Provide `fiveTerm_args_ne_zero` (For an admissible pair, the five arguments are nonzero); `fiveTerm_args_ne_one` (For an admissible pair, the five arguments are different from 1); `Admissible.oneSub` (If (x, y) is admissible then so is (1 − y, 1 − x)).

Provide `Admissible.inv` (If (x, y) is admissible then so is (x^{-1}, y^{-1})); `fiveTerm_oneSub` (fiveTerm (1 − y) (1 − x) = [1 − y] − [1 − x] + [(1 − x)/(1 − y)] − [(1 − x^{-1})/(1 − y^{-1})] + [y/x]); `fiveTerm_inv` (fiveTerm x^{-1} y^{-1} = [x^{-1}] − [y^{-1}] + [x/y] − [(1 − x)/(1 − y)] + [(1 − x^{-1})/(1 − y^{-1})]).

Provide `fiveTerm_map` (A field homomorphism sends five-term elements to five-term elements).

For the reduced free carrier use `RawSymbols F`=ℤ[F−{0,1}] and extend its injection by `rawSymbol 0=rawSymbol 1=0`. Define `Admissible x y` by x,y≠0,1 and x≠y, and `fiveTermRaw` by the same five-term expression in this reduced carrier. Killing [1] identifies the unreduced and reduced quotient presentations. Provide `rawSymbol_zero`, `rawSymbol_one` and `fiveTermRaw_oneSub` for this extension and the reflection identity. The checks below also require rawSymbol(2)≠0 over ℚ, the admissible pair (2,3), rejection of a diagonal pair, and fiveTermRaw(2,3)=[2]−[3]+[3/2]−[3/4]+[1/2].

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- For an admissible pair all five arguments are nonzero elements of F different from 1.
- In the free abelian group, fiveTerm x y − fiveTerm (1 − y) (1 − x) = [x] + [1 − x] − [y] − [1 − y].
- In the free abelian group, fiveTerm x y + fiveTerm x^{-1} y^{-1} + fiveTerm y x + fiveTerm y^{-1} x^{-1} = 2([y/x] + [x/y]).
- Over F_4 with ω² + ω + 1 = 0, fiveTerm ω ω² = 3[ω] − 2[ω²].
- The defining formula evaluated at x = y equals [1], so a definition that silently admits the diagonal changes nothing, whereas one that admits y = 1 produces a division by zero.
- In RawSymbols(ℚ), rawSymbol(0)=rawSymbol(1)=0, while rawSymbol(2) is nonzero.
- Admissible(2,3) holds over ℚ, whereas Admissible(x,x) and Admissible(x,1) fail for every field element x.
- For the reduced free carrier, fiveTermRaw(2,3)=[2]−[3]+[3/2]−[3/4]+[1/2].

Needs the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.4 The pre-Bloch presentation

For a field F define the pre-Bloch group P(F) as the abelian group presented by generators [x], one for each x in F without 0, subject to [1] = 0 and to all five-term relations. Equivalently it is the quotient of the free abelian group on F without 0 by the five-term subgroup.

Here F is any field. Restrictions to |F|≥4 belong only to the subsequent torsion identities.

Provide `preBloch` (The pre-Bloch group P(F)); `preBloch.gen` (The class [x] of a nonzero element x); `preBloch.gen_one` ([1] = 0).

Provide `preBloch.fiveTerm` (Every five-term element is zero in P(F)); `preBloch.lift` (A function on nonzero elements killing [1] and all five-term elements extends uniquely to a homomorphism out of P(F)); `preBloch.lift_gen` (lift f [x] = f x).

Provide `preBloch.hom_ext` (Two homomorphisms out of P(F) that agree on every generator [x] are equal); `preBloch.induction_on` (P(F) is generated by the classes [x]); `preBloch.map` (A field homomorphism induces a homomorphism of pre-Bloch groups, with map_id and map_comp).

Provide `preBloch.equivAdmissible` (P(F) ≃ the free abelian group on F − {0, 1} modulo the five-term elements).

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- [1] = 0.
- A five-term element evaluates to zero.
- P(F_2) = 0: its only generator is [1].
- P(F_3) ≅ ℤ, free on [−1], since there is no admissible pair; a definition that forgot [1] = 0 would give ℤ².
- P(F_4) ≅ ℤ/5, from the relations 3[ω] − 2[ω²] and 3[ω²] − 2[ω].
- P(F_5) ≅ ℤ/6 on [3], with [2] = 2[3] and [4] = 0.

Needs §3.3; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.5 The boundary, its kernel and Matsumoto exactness

Construct the homomorphism from P(F) to the antisymmetric tensor quotient of the group of units of F sending [x] to x wedge (1 - x) for x different from 1, and [1] to 0. The sign convention is the one displayed here; the opposite sign gives the same kernel but a different map, and the choice is recorded rather than left implicit.

Here, the target is the antisymmetric tensor quotient of the multiplicative group of F, written additively.

Provide `blochBoundary` (The homomorphism P(F) → antisymSquare ℤ (Additive Fˣ)); `blochBoundary_gen` (The boundary of [x] is x ∧ (1 − x) for x ≠ 0, 1); `blochBoundary_one` (The boundary of [1] is zero).

Provide `blochBoundary_c` (∂([x] + [1 − x]) = 0 for x ∈ F − {0, 1}); `blochBoundary_angle` (∂([x] + [x^{-1}]) = x ∧ (−x) for x ∈ Fˣ); `blochBoundary_map` (The boundary commutes with the maps induced by a field homomorphism).

Provide `blochBoundary_comp_exterior` (Composing with antisymSquare.toExterior gives the classical boundary [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ)).

Define B(F), Suslin's Bloch group, as the kernel of the boundary from P(F) to the antisymmetric tensor quotient of the units of F. It is a subgroup of P(F), not a quotient, and the target of the boundary is the antisymmetric quotient rather than the exterior square.

Here F is any field. Restrictions to |F|≥4 belong only to the subsequent torsion identities.

Provide `blochGroup` (The subgroup B(F) of P(F)); `blochGroup.mem_iff` (An element lies in B(F) exactly when its boundary vanishes); `blochGroup.map` (A field homomorphism induces a homomorphism of Bloch groups).

Provide `blochGroup.coe` (The inclusion of B(F) into P(F)); `blochGroup.ext` (Two elements of B(F) are equal exactly when their images in P(F) are).

For every field F the sequence 0 -> B(F) -> P(F) -> antisymSquare of the units of F -> K_2(F) -> 0 is exact. In particular the cokernel of the boundary is Matsumoto's presentation of K_2(F).

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- The boundary of a five-term element is zero.
- Over ℚ, β(∂[3]) = −1 for the alternating form β(a, b) = v_2(a)v_3(b) − v_3(a)v_2(b), so ∂[3] = 3 ∧ (−2) and not (−2) ∧ 3.
- The composite with antisymSquare.toExterior is [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ).
- Over F_5, ∂ maps P(F_5) ≅ ℤ/6 onto antisymSquare ℤ (Additive F_5ˣ) ≅ ℤ/2 with kernel ℤ/3: ∂[3] = 3 ∧ 3 ≠ 0 and ∂[2] = 0.
- Over F_5, ∂([2] + [3]) = 2 ∧ 3 ≠ 0, so the angle-bracket element at 2 is not a Bloch element.
- B(F_5) ≅ ℤ/3, generated by c = [2]; [2] ∈ B(F_5) and [3] ∉ B(F_5).
- B(F_7) ≅ ℤ/4, generated by [−1] = 2[3].
- B(F_4) = P(F_4) ≅ ℤ/5, because antisymSquare ℤ (Additive F_4ˣ) = 0.
- B(F_5) has order 3, whereas the kernel of P(F_5) → ⋀²(F_5ˣ) = 0 is all of P(F_5), of order 6; and [−1] ∉ B(F_3). A definition with the exterior square as target fails both.
- The element [x] + [1 - x] lies in B(F) for every admissible x.

Needs §3.1, §3.4; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.6 Universal torsion and inversion symbols

Let F have at least four elements. For x ≠ y in F − {0, 1}, [x] + [1 − x] = [y] + [1 − y] in P(F). The common value c lies in B(F), since ∂c = x ∧ (1 − x) + (1 − x) ∧ x = 0 in the antisymmetric quotient. Define c ∈ B(F) as this element. Part (b) of the source lemma, on the elements ⟨x⟩, is §3.6; those elements need not lie in B(F).

Here F is a field with at least four elements. x lies in F and is different from 0 and 1.

Provide `BlochGroup.c` (The element c ∈ B(F), for |F| ≥ 4); `BlochGroup.c_eq` (c = [x] + [1 − x] in P(F) for every x ∈ F − {0, 1}); `BlochGroup.c_mem` (The class [x] + [1 − x] lies in B(F)).

Provide `BlochGroup.map_c` (A field homomorphism sends c to c).

Let F have at least four elements and write ⟨x⟩ = [x] + [x^{-1}] ∈ P(F). The map x ↦ ⟨x⟩ is a group homomorphism from Additive Fˣ to P(F). Its image is an elementary abelian 2-group, and it sends squares to zero. ⟨x⟩ lies in B(F) if and only if x ∧ (−x) = 0 in antisymSquare ℤ (Additive Fˣ), because ∂⟨x⟩ = x ∧ (−x). For example ⟨−1⟩ ∈ B(F), but ⟨2⟩ ∉ B(F_5). The K-book states the target as B(F); the correct target is P(F), see the the sign conventions below.

Let F have at least four elements and write ⟨x⟩ = [x] + [x^{-1}] ∈ P(F). For x ≠ y in F − {0, 1}, ⟨y⟩ − ⟨x⟩ = ⟨y/x⟩ in P(F). For every x ∈ Fˣ, 2⟨x⟩ = 0 in P(F). These are statements in P(F): ⟨x⟩ need not lie in B(F).

Let F have at least four elements. Then 3c = ⟨−1⟩ in P(F); both sides lie in B(F), and 6c = 0 in B(F).

Let F have at least four elements. (i) If char F = 2 or F contains a square root of −1, then 3c = 0 in B(F). (ii) If F contains a root ζ of t² − t + 1 (a primitive sixth root of unity when char F ≠ 3, and ζ = −1 when char F = 3), then c = ⟨ζ⟩ and 2c = 0 in B(F). The K-book's '∛−1 ∈ F' means such a ζ: −1 itself is always a cube root of −1. Neither statement says that c = 0; c = 0 when both hypotheses hold.

The source locators for these statements are Weibel, K-book, VI.5.4 (a) (PDF p. 496); Weibel, K-book, Proof of VI.5.4 (PDF p. 497); Weibel, K-book, VI.5.4 (c) (PDF p. 496); Weibel, K-book, Before VI.5.4 (PDF p. 496); Weibel, K-book, VI.5.4 (b) (PDF p. 496); Weibel, K-book, VI.5.4 (d) (PDF p. 496); Weibel, K-book, VI.5.4.1 (PDF p. 497).

**Checks.**

- Over F_5, c = [2] = 2[3], of order 3 in B(F_5) ≅ ℤ/3.
- Over F_7, c = 2[−1] = 2[4] ≠ 0, of order 2 in B(F_7) ≅ ℤ/4; in particular c ≠ [4].
- Over F_11, c has order 6 and generates B(F_11) ≅ ℤ/6.
- Over F_4, c = 0.

Needs §3.3, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.7 Small-field calculations

P(F_2) = B(F_2) = 0. P(F_3) is infinite cyclic on [−1], since there is no admissible pair; ∂[−1] = (−1) ∧ (−1) is the generator of antisymSquare ℤ (Additive F_3ˣ) ≅ ℤ/2, so B(F_3) = 2P(F_3) is infinite cyclic, generated by ⟨−1⟩ = 2[−1] = c. For these two fields the |F| ≥ 4 statements of this layer fail: 2⟨−1⟩ ≠ 0 and 3c ≠ ⟨−1⟩ in P(F_3). Directly from the presentation: B(F_4) = P(F_4) ≅ ℤ/5; P(F_5) ≅ ℤ/6 on [3] and B(F_5) ≅ ℤ/3 on c = [2] = 2[3], with [−1] = 0 and [3] ∉ B(F_5); P(F_7) ≅ ℤ/8 on [3] and B(F_7) ≅ ℤ/4 on [−1] = 2[3], with c = 2[−1] = 2[4]. The general formula for q > 3 is §5.5 and is not used here.

Here F is a finite field with 2, 3, 4, 5 or 7 elements.

The source locators for these statements are Weibel, K-book, VI.5.1.1 (PDF p. 495); Weibel, K-book, Exercise VI.5.3 (PDF p. 508).

Needs §3.1, §3.3, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.8 Replacing the target by the exterior square

For a field F let B̃(F) be the kernel of P(F) → ⋀[ℤ]^2 (Additive Fˣ), [x] ↦ x ∧ (1 − x), the composite of the boundary with antisymSquare.toExterior. This is the group CGZ's Definition 2.1 calls Suslin's Bloch group. It contains this layer's B(F), and it is in general larger.

Provide `extBloch` (The subgroup B̃(F) of P(F)); `mem_extBloch_iff` (z ∈ B̃(F) iff toExterior (∂z) = 0); `blochGroup_le_extBloch` (B(F) ≤ B̃(F)).

Provide `extBloch.map` (A field homomorphism maps B̃(F) into B̃(E)).

For every field F there is an exact sequence 0 → B(F) → B̃(F) → Fˣ/Fˣ² → K_2(F), where ξ maps to the class a with ∂ξ = a ∧ a, and a maps to {−1, a}. Hence B̃(F)/B(F) ≅ {a ∈ Fˣ/Fˣ² : {−1, a} = 0 in K_2(F)}: this is Fˣ/Fˣ² for finite F, and zero when Fˣ is 2-divisible.

The source locators for these statements are CGZ, arXiv v3 (2021), Definition 2.1, §2.1, p. 8; Weibel, K-book, VI.5, opening of the section (PDF p. 495); Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- B̃(F_5) = P(F_5) ≅ ℤ/6, because ⋀² of a cyclic group is zero, while B(F_5) ≅ ℤ/3.
- B̃(F_3) = P(F_3) ≅ ℤ, while B(F_3) = 2P(F_3).
- B̃(ℂ) = B(ℂ), because ℂˣ is 2-divisible, so toExterior is an isomorphism for Additive ℂˣ.
- ⟨2⟩ ∉ B̃(ℚ): its exterior boundary 2 ∧ (−1) is detected by the alternating form (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2, where s is the sign.

Needs §3.1, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.9 The full-tensor lecture kernel

For every field F put A₀(F)=ℤ[F−{0,1}], T(F)=Additive(Fˣ)⊗ℤ Additive(Fˣ), and λ:A₀(F)→T(F), [x]↦(1−x)⊗x. Define B_raw(F)=ker λ as a subgroup of A₀(F), before imposing any five-term relations. Symbols at 0 and 1, when used in formulas, mean zero in A₀. Its inclusion into A₀ is part of the interface. This full-tensor model is distinct from the Suslin kernel inside P(F). Its attribution to Bloch’s Lecture 6, (6.1.2), remains unverified; the construction here is specified by the displayed kernel.

Here F is a field; no field-size hypothesis.

Provide `LectureBloch.lambda_symbol` (λ([x])=(1−x)⊗x for x≠0,1); `LectureBloch.mem_iff` (α lies in B_raw exactly when λ(α)=0; equality in B_raw is equality in A₀); `LectureBloch.inclusion_injective` (The kernel inclusion B_raw→A₀ is injective, using the Mathlib additive-kernel subtype).

Provide `LectureBloch.map_symbol` (For a field embedding f:F→E, the free map [x]↦[f(x)] commutes with λ via the tensor map of units, restricts to B_raw, and has identity/composition laws).

Let R₅≤A₀ be generated by the admissible five-term elements, q:A₀↠P(F) the reduced-generator presentation map, and π:T↠Q_s the antisymmetric tensor quotient. Then ∂q=−πλ. Hence q restricts to μ:B_raw→B(F). Define K_raw=R₅∩ker λ, regarded as a subgroup of B_raw. The induced map μ_rel:B_raw/K_raw→B(F) is injective and has image μ(B_raw). No quotient A₀/R₅→T with generator assignment λ exists in general.

Here F is a field; all symbols and signs as in §3.9 and §3.5.

Provide `LectureBloch.boundary_compare` (∂∘q=−π∘λ as homomorphisms A₀→Q_s); `LectureBloch.mu_coe` (For α∈B_raw the image of μ(α) in P(F) is q(α)); `LectureBloch.mu_ker` (μ(α)=0 iff the underlying free element α belongs to R₅).

Provide `LectureBloch.muRel_injective` (μ_rel is the unique map from B_raw/K_raw composing with the quotient map to μ, and is injective).

These are algebraic consequences of the displayed free-group kernel, the five-term presentation of §3.3 and the identities of §3.6 (Weibel VI.5.1–5.2.1, chapter pp.23–24). The proposed convention locator Bloch, Higher Regulators, §6.1, p.43, (6.1.2), remains unverified and supplies no theorem used here.

**Checks.**

- B_raw(F₂)=0 because A₀(F₂)=0.
- A₀(F₃)≅ℤ on [−1], T(F₃)≅ℤ/2, and λ([−1]) is its nonzero generator; B_raw(F₃)=2ℤ.
- Over F₅ the admissible relation R(2,3) equals [4] in A₀, and λ([4]) is nonzero of order 2. The ordinary relation subgroup is not contained in B_raw.
- The nonzero free element 2[4] in A₀(F₅) is a lecture cycle and maps to zero under μ; K_raw is not finite torsion.
- The lecture cycle 4[3] over F₅ maps to 4[3]=2c, a nonzero generator of B(F₅)≅ℤ/3.
- Over ℚ, 4[−1] is a nonzero lecture cycle in ker μ and has infinite additive order. Thus μ⊗ℚ itself is not injective.

Needs §3.1, §3.3, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.10 The obstruction to lifting a lecture cycle

For every field F set S=range(1+τ)≤T, E=im λ∩S and L=λ(R₅)≤E. There is a canonical obstruction o:B(F)→E/L: choose α with qα=β and take λ(α) mod L. It is independent of the lift and is surjective. The sequence 0→K_raw→B_raw→B(F)→E/L→0 is exact. In particular ker μ=K_raw and coker μ≅E/L, not merely an unspecified torsion discrepancy.

Here τ is the tensor flip; R₅, q, λ and K_raw are the preceding definitions.

For a field F with at least four elements, 6·(E/L)=0. Consequently μ_rel:B_raw/K_raw→B(F) is injective with cokernel killed by 6, and becomes an isomorphism after tensoring with ℤ[1/6] or ℚ. Explicitly, if qα=β∈B(F), let σ[x]=[1−x], let deg([x])=1, and interpret [−1]=0 in characteristic 2. Then γ=3(α−σα)+deg(α)·2[−1] belongs to B_raw and μγ=6β. No such conclusion identifies B_raw itself rationally with B(F).

Here F is a field with at least four elements.

Provide `lectureObstruction`, `lectureObstruction_surjective`, `lectureObstruction_exact` and `lectureObstruction_six` for this obstruction, its image and its annihilator.

**Checks.**

- Over F₂, E=L=0.
- Over F₃, R₅=0 and λ surjects onto ℤ/2, so E=0 and μ:2ℤ→2ℤ is the identity.
- Over F₅, 4[3] maps to a generator of B(F₅), while the nonzero lecture cycle 2[4] lies in the kernel.

The displayed γ proves the cokernel bound by a finite lift; it does not make the free-cycle kernel torsion.

These are algebraic consequences of the displayed free-group kernel, the five-term presentation of §3.3 and the identities of §3.6 (Weibel VI.5.1–5.2.1, chapter pp.23–24). The proposed convention locator Bloch, Higher Regulators, §6.1, p.43, (6.1.2), remains unverified and supplies no theorem used here.

Needs §3.1, §3.6, §3.9; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.11 The generic configuration presentation

For every field F define G₂^gen(F)=A₀(F)/R_conf, where R_conf is generated by ∑_{i=0}^4(−1)^i[cr(x₀,…,x̂ᵢ,…,x₄)] for pairwise distinct points x₀,…,x₄∈P¹(F). Use exactly the cross-ratio of §3.2, cr(0,∞,1,z)=z. The generators are P¹(F)−{0,1,∞}; degenerate symbols are zero by notation. No relations from coinciding points are imposed. Its boundary δ_gen is [x]↦(1−x)∧x in Q_s, with descent proved in §3.11.

Here F is a field, possibly F₂ or F₃. Only injective five-tuples occur in R_conf.

Provide `GoncharovB2.class` (For x≠0,1, class(x) is the quotient class of [x]; symbols 0,1,∞ evaluate to zero); `GoncharovB2.eq_iff` (The classes of α and β agree iff α−β belongs to R_conf); `GoncharovB2.lift` (Any assignment into an abelian group annihilating all injective five-point relations extends uniquely to G₂^gen).

Provide `GoncharovB2.map_symbol` (A field embedding maps class(x) to class(f(x)); identity and composition maps agree with those on the free symbols).

For every field F the identity on nondegenerate symbols gives e_gen:G₂^gen(F)≃P(F), integrally, and δ_gen=−∂∘e_gen into Q_s. Consequently ker δ_gen≃B(F), with zero kernel and zero cokernel. If one instead composes with the ordinary exterior-square projection, its kernel corresponds to the B̃(F); the exact discrepancy is §3.8. Tensoring with ℚ makes both wedge targets coincide. Neither G₂^gen itself nor a free projective-line presentation is identified with B(F).

Here F is a field; the boundary uses the antisymmetric tensor quotient specified on p. 218.

The source locators for these statements are Goncharov 1995, pp. 202–203 and §2.3 pp. 253–254; Goncharov 1995, §1.8, p. 218, definition before the Bloch–Suslin complex; Goncharov 1995, §1.8 p. 218, displayed Bloch–Suslin complex.

**Checks.**

- G₂^gen(F₂)=0; the projective line has only three points and there are no nondegenerate generators.
- G₂^gen(F₃)≅ℤ on [−1], since its projective line has only four points and no relation five-tuple.
- G₂^gen(F₅)≅ℤ/6 on [3], while its boundary kernel is ℤ/3. In particular G₂^gen is not the Bloch kernel.

Needs §3.1, §3.2, §3.4, §3.5, §3.8; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.12 Rational smooth-curve specialization

For every field F let V_F=ℚ[P¹(F)] and W_F=ℚ⊗ℤ Q_s(F), and define d_F:V_F→W_F by [x]↦1⊗((1−x)∧x) for x≠0,1,∞, with degenerate values zero. For each smooth connected curve X/F and F-rational points u,v, projective specialization sends rational functions in F(X) to F∪{∞}. Let R_curv^ℚ(F) be the ℚ-span of [0], [∞], and sp_u(α)−sp_v(α), for every such curve and every α∈ker d_{F(X)}. Define G₂^curv(F)=V_F/R_curv^ℚ(F). This is the rational version of §1.9, (1.25a), with the rationalization on both sides. Smooth connected curves over a field are integral; use integral schemes smooth of relative dimension one, not arbitrary fields with unexplained evaluation maps.

Here u,v are F-rational points, not geometric points over an unspecified extension. Specializations take zeros to 0 and poles to ∞. All smooth connected curves occur; F(t) alone is a different relation set. Curve has its usual algebraic meaning: separated and of finite type over F; smoothness has relative dimension one. The integral carrier expresses connectedness in this smooth setting.

Provide `GoncharovCurve.class` (class_F(z) is the image of the basis vector [z] under the Mathlib submodule quotient projection); `GoncharovCurve.eq_iff` (class(α)=class(β) iff α−β∈R_curv^ℚ); `GoncharovCurve.lift` (An ℚ-linear map V_F→M annihilating [0], [∞] and every specialized cycle difference factors uniquely through G₂^curv(F)).

Provide `GoncharovCurve.specialization_relation` (For every smooth connected X/F, u,v∈X(F) and α∈ker d_{F(X)}, the quotient classes of sp_u α and sp_v α agree).

For every field F, R_curv^ℚ(F) lies in ker d_F. Thus d_F descends uniquely to δ_curv:G₂^curv(F)→W_F with δ_curv(class(x))=1⊗((1−x)∧x). The input is the following local specialization lemma: if O is a DVR with fraction field K, residue field k, valuation v and the usual specialization sp([f])=[f̄] for v(f)=0, [0] for v(f)>0 and [∞] for v(f)<0, then d_k(sp α)=0 whenever α is a rational finite symbol combination with d_K α=0. The target is rational and the degenerate symbols have zero boundary. Apply the lemma to the DVR at each F-rational point of a smooth connected integral curve. Prove it by writing f=π^v(f)u, splitting units from valuation powers in Kˣ, and specializing the unit-unit component of its tensor boundary; this is an elementary algebraic input here, before the general polylogarithmic applications.

Here F is a field; canonical projective specialization as in §3.12. The scalar field is ℚ: diagonal and sign 2-torsion vanish.

Provide `GoncharovCurve.boundary_class` (δ_curv(class(x))=d_F([x]); it is zero on the three degenerate classes); `GoncharovCurve.boundary_unique` (δ_curv is the unique linear map whose composite with the quotient projection is d_F); `GoncharovCurve.mem_kernel` (For α∈V_F, its quotient class lies in ker δ_curv iff d_F(α)=0).

For every field F the identity on symbols induces a surjection ψ:P(F)⊗ℚ→G₂^curv(F), compatible with δ_curv=−∂_ℚ. Let R_red=spanℚ([0],[1],[∞])+R₅⊗ℚ inside V_F and K_curv=R_curv^ℚ/R_red. Then ker ψ≅K_curv and coker ψ=0. Because K_curv consists of cycles, ψ restricts to a surjection B(F)⊗ℚ→ker δ_curv with the same kernel K_curv. Over F₃, canonical projective-line inversion gives class(−1)+class(−1)=0, so G₂^curv(F₃)=0 and K_curv≅ℚ, whereas P(F₃)⊗ℚ≅ℚ. Over F₂ both groups and K_curv are zero. Thus an all-field isomorphism is false, and any relation-equality theorem must respect small-field exceptions. No bound by 2, 3 or 6 can dispose of a nonzero rational vector-space kernel. For fields with at least four elements, the statement K_curv=0 is the rational weight-two instance of Conjecture 1.20 in the source; it remains conditional here. The separate F(t)-inductive construction is not substituted for the all-curve assertion.

Here, all-curve specializations and the boundary closure are as in the preceding constructions.

The source locators for these statements are Goncharov 1995, §1.9, pp. 221–224, (1.25a) and Corollary 1.19; Goncharov 1995, §1.9 pp. 221–222, Lemma 1.16; Goncharov 1995, §1.9, p. 225, Conjecture 1.20.

**Checks.**

- class(0)=0 and class(∞)=0; both are relation generators, not additional free summands.
- class(1)=0, using [t]+[1−t] and the points 0,∞ on P¹.
- For x∈Fˣ, class(x)+class(x⁻¹)=0: rationally [t]+[t⁻¹] is a cycle, and specialize at x and 0. The same integral assertion in P(F) is false in general.
- δ_curv(class(0))=δ_curv(class(1))=δ_curv(class(∞))=0.
- Under the generic comparison, δ_curv of an image is −(∂⊗ℚ) of its Suslin pre-Bloch class, in W_F.
- Over ℂ, δ_curv(class(i))=1⊗((1−i)∧i)=0, since i is torsion in ℂˣ; class(i) is a cycle. Replacing the wedge of multiplicative units by the field’s additive vector space would not give this value.

Needs §3.1, §3.5, §3.11; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.13 The older projective exterior convention

Let Z(F) be the free abelian group on P^1(F) = F ∪ {∞}. Let d : Z(F) → ⋀[ℤ]^2 (Additive Fˣ) be [X] ↦ X ∧ (1 − X), with [0], [1], [∞] ↦ 0, and A(F) = ker d. Let ⟨ξ⟩ be the subgroup generated by the elements ξ_{X,Y} = [X] − [Y] + [Y/X] − [(1 − X^{-1})/(1 − Y^{-1})] + [(1 − X)/(1 − Y)] for X, Y ∈ P^1(F) with no argument of the form 0/0 or ∞/∞. The arithmetic of P^1 is: a/0 = ∞ for a ≠ 0, a/∞ = 0 for a ≠ ∞, 1 − ∞ = ∞, 0^{-1} = ∞, ∞^{-1} = 0. Define B_old(F) = A(F)/(A(F) ∩ ⟨ξ⟩), the image of A(F) in Z(F)/⟨ξ⟩. This is CGZ's Definition 1.1 with C(F) read as A(F) ∩ ⟨ξ⟩. As printed, C(F) ⊆ A(F) fails: ξ_{2,1} = [2] + [1/2] − [1] is allowed and d ξ_{2,1} = 2 ∧ (−1) ≠ 0 in ⋀²(ℚˣ).

Provide `cgzBloch` (The group B_old(F)); `cgzBloch.mk` (The class of an element of A(F)); `cgzBloch.gen_one` ([1] = 0).

Provide `cgzBloch.gen_infty` ([∞] = −[0]); `cgzBloch.three_zero` (3[0] = 0); `cgzBloch.xi_mem` (An admissible ξ_{X,Y} that lies in A(F) is zero in B_old(F)).

Provide `cgzBloch.map` (A field homomorphism induces B_old(F) → B_old(E), with map_id and map_comp).

Let F have at least four elements. The kernel of P(F) → Z(F)/⟨ξ⟩, the map induced by the inclusion of generators, is ⟨Fˣ⟩, the image of x ↦ ⟨x⟩. The target is generated by that image together with [0] ≡ c and [∞] ≡ −c. Consequently B̃(F) → B_old(F) is surjective with kernel B̃(F) ∩ ⟨Fˣ⟩, an elementary abelian 2-group. ⟨X⟩ itself lies in B̃(F) only when X ∧ (−1) = 0 in the exterior square.

Here F is a field with at least four elements.

Let F be a field with at least four elements. The inclusion of generators ℤ[F − {0, 1}] ⊂ ℤ[P^1(F)] induces κ : B(F) → B_old(F), from this layer's Bloch group to the CGZ Bloch group of §3.13, with κ(c) = [0]. κ factors as B(F) ⊆ B̃(F) ↠ B_old(F) through the exterior-kernel group B̃(F) of CGZ's Definition 2.1. Hence ker κ = B(F) ∩ ⟨Fˣ⟩ and coker κ ≅ B̃(F)/(B(F) + (B̃(F) ∩ ⟨Fˣ⟩)), where ⟨Fˣ⟩ ⊆ P(F) is the image of x ↦ ⟨x⟩. Both are elementary abelian 2-groups, and κ becomes an isomorphism after ⊗ ℤ[1/2] and after ⊗ ℤ/n for odd n. Neither vanishes in general: over F_11, κ maps B(F_11) ≅ ℤ/6 (generated by c) onto ⟨[0]⟩ ≅ ℤ/3 ⊂ B_old(F_11) ≅ ℤ/6, so ker κ = {0, 3c} ≅ ℤ/2 and coker κ ≅ ℤ/2. In particular B_old(F) is not in general a quotient of this layer's B(F); CGZ's remark that it is a quotient of 'Suslin's Bloch group' concerns B̃(F), whose boundary target is the exterior square.

Here F is a field with |F| ≥ 4. For F_2, B(F_2) = 0 while B_old(F_2) ≅ ℤ/3 on [0]. B_old(F) is read as in §3.13: the image of A(F) in ℤ[P^1(F)] modulo the five-term elements. Both conventions are read in their own sources and neither is adjusted to the other.

The source locators for these statements are CGZ, arXiv v3 (2021), Definition 1.1, §1.1, p. 2; CGZ, arXiv v3 (2021), Lemma 2.2, §2.1, p. 9; CGZ, arXiv v3 (2021), Proof of Lemma 2.2, p. 9; CGZ, arXiv v3 (2021), Definition 1.1 and the remark after it, §1.1, p. 2; CGZ, arXiv v3 (2021), Proof of Theorem 2.11, §2.5, p. 15; Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- B_old(F_2) ≅ ℤ/3, generated by [0], whereas B(F_2) = 0.
- B_old(F_5) ≅ ℤ/3, with [0] of order 3 and [1] = 0.
- B_old(F_11) ≅ ℤ/6, with [0] of order 3.
- ξ_{2,1} = [2] + [1/2] − [1] ∉ A(ℚ): d ξ_{2,1} = 2 ∧ (−1), detected by (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2. So C(F) := ⟨ξ⟩ taken literally is not a subgroup of A(F).

Needs §3.3, §3.4, §3.5, §3.6, §3.8; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.14 The published negative-unit tensor target

For every field F let N_neg≤T(F) be the subgroup generated by u⊗(−u), u∈Fˣ, and put Q_neg(F)=T(F)/N_neg, where −u means the multiplicative unit −1 times u, not the inverse or the additive negative of Additive Fˣ. Write ρ:T↠Q_neg. Since range(1+τ)≤N_neg, ρ factors uniquely as T↠Q_s --p_neg→Q_neg. The factor is surjective and its kernel is the subgroup generated by the classes u∧(−u), killed by 2. This is not in general the ordinary exterior square.

Here F is a field; no field-size hypothesis for the tensor quotient.

Provide `CGZPublished.negativeTensor_zero` (ρ(u⊗(−u))=0 for every multiplicative unit u); `CGZPublished.tensorProjection_surjective` (The canonical ρ:T→Q_neg is surjective, and p_neg∘π=ρ); `CGZPublished.tensorLift` (A ℤ-linear map T→M killing every u⊗(−u) factors uniquely through Q_neg).

Provide `CGZPublished.symmetrizer_le` (range(1+τ)≤N_neg; the comparison from Q_s is a quotient map, not a projection to the exterior square).

Assume |F|≥4 and let H=im(h:Fˣ→P(F)), h(u)=[u]+[u⁻¹], as in §3.6. Then ker(p_neg:Q_s→Q_neg)=∂H. Equivalently ker(p_neg∘∂:P→Q_neg)=B(F)+H. Here H lies in P(F) and need not be a subgroup of B(F); only B(F)∩H is a Bloch subgroup. Also 2H=0.

Here F is a field with at least four elements.

The source locators for these statements are CGZ 2023, §2.1, p. 391, Definition 2.1; CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof.

**Checks.**

- Q_neg(F₃)≅ℤ/2, whereas ⋀² Additive(F₃ˣ)=0.
- Q_s(F₅)≅ℤ/2 but Q_neg(F₅)=0, since for a generator g of F₅ˣ, g⊗(−g) is 3 times the generator of T≅ℤ/4.
- In the ordinary exterior square of ℚˣ, 2∧(−2)=2∧(−1)≠0, while Q_neg kills it. Thus the ordinary exterior boundary cannot be substituted for the published target.

Needs §3.1, §3.5, §3.6; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.15 The published projective presentation

For every field F define d_new:Z_P¹(F)=ℤ[P¹(F)]→Q_neg(F) by [x]↦ρ(x⊗(1−x)) when x≠0,1,∞ and the three degenerate symbols↦0. Reuse the projective arithmetic and all admissible extended five-term elements ξ_{X,Y} of the §3.13, including diagonal X=Y when the displayed fractions are defined. Let C_ext be their generated subgroup, unchanged from the CGZ presentation. Then C_ext≤ker d_new. Thus d_new descends to d_quot:Z_P¹/C_ext→Q_neg. No intersection repair is necessary for this published definition.

Here, admissibility forbids 0/0 and ∞/∞; it does not simply exclude all degenerate points.

Provide `CGZPublished.boundary_symbol` (d_new([x])=ρ(x⊗(1−x)) for x≠0,1,∞; d_new([0])=d_new([1])=d_new([∞])=0); `CGZPublished.relations_le_kernel` (Every admissible extended ξ_{X,Y} belongs to ker d_new; hence C_ext≤ker d_new); `CGZPublished.boundaryQuotient_unique` (d_quot is the unique additive map with d_quot∘q_ext=d_new).

Provide `CGZPublished.boundary_ordinary` (On reduced nondegenerate symbols, d_quot∘j=p_neg∘∂, where j:P(F)→Z_P¹/C_ext is the presentation map).

For any field F define B_new(F)=ker(d_new)/C_ext. The containment C_ext⊂ker(d_new) is essential. Equivalently it is the kernel of d_quot on ℤ[P¹(F)]/C_ext. The equivalence sends the class of a free cycle to its projective-presentation class. For |F|≥4 the extended pre-Bloch group is P(F)/H, and this identifies B_new with (B+H)/H. B_old always denotes the different, intersection-repaired exterior-cycle presentation of §3.13.

Here, the P/H description uses |F|≥4; the free projective presentation itself does not.

Provide `CGZPublished.cycleClass` (A free projective cycle α∈ker d_new gives cycleClass(α)∈B_new); `CGZPublished.cycleClass_eq_iff` (cycleClass(α)=cycleClass(β) iff α−β∈C_ext); `CGZPublished.kernelEquiv` (The map ker(d_new)/C_ext≃ker d_quot sends a cycle class to its class in the extended presentation).

Provide `CGZPublished.cycleLift` (An additive map ker d_new→M killing C_ext descends uniquely to B_new).

The source locators for these statements are CGZ 2023, §2.1, p. 391, Definition 2.1; CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof.

**Checks.**

- The three free symbols [0],[1],[∞] all have zero d_new boundary before taking the quotient.
- d_new([2]+[3])=0 in Q_neg(F₅), although ∂([2]+[3])≠0 in Q_s(F₅).
- For F=ℚ, ξ_{2,1}=[2]+[1/2]−[1] has d_new boundary zero; its ordinary-exterior boundary is the nonzero 2∧(−1).
- B_new(F₂)≅ℤ/3 on [0], although B(F₂)=0. The unrestricted field version of Lemma 2.2 is false.
- B_new(F₃)=0. The extended presentation is ℤ/2 on [−1], whose d_quot map to Q_neg≅ℤ/2 is an isomorphism.
- B_new(F₁₁)≅ℤ/3 on the image of c, whereas B_old(F₁₁)≅ℤ/6. The two CGZ versions are not interchangeable integrally.

Needs §3.3, §3.5, §3.13, §3.14; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.16 Exact convention maps

For every field F, inclusion of nondegenerate symbols induces κ_new:B(F)→B_new(F), by boundary compatibility. For |F|≥4, identify it with B↪B+H↠(B+H)/H. It sends c to [0], sends h(u) to zero whenever h(u) lies in B, and is natural under field embeddings. Its quotient target does not mean all h(u) are Bloch cycles. Surjectivity and the exact 2-primary kernel are the separate exact comparison below.

Here, statements involving the c and H use |F|≥4.

Provide `CGZPublished.compare_coe` (The underlying extended-quotient class of κ_new(β) is j(β) for β∈B); `CGZPublished.compare_c` (For |F|≥4, κ_new(c)=[0] in B_new); `CGZPublished.compare_angle` (For |F|≥4, if h(u)∈B then κ_new(h(u))=0; the membership hypothesis is required).

Provide `CGZPublished.compare_natural` (For a field embedding f, the Bloch and modified-CGZ symbol maps commute with κ_new, with identity/composition laws from the free maps).

For |F|≥4, κ_new:B(F)→B_new(F) is surjective, ker κ_new=B(F)∩H and 2·ker κ_new=0. Thus 0→B∩H→B→B_new→0 is exact, and B_new≃B/(B∩H) canonically. The cokernel is zero. This proves the published Lemma 2.2 without importing the nonzero-cokernel statement belonging to the older exterior convention. The |F|≥4 hypothesis is necessary for this theorem as stated: F₂ has a nonzero cokernel, and F₃ has an infinite kernel not killed by 2.

Here F is a field with at least four elements.

For |F|≥4 let B_old be the repaired exterior-kernel group. There is a canonical injection ι_new_old:B_new→B_old, identifying B_new with the image of B inside P/H. Its kernel is zero and its cokernel is B̃/(B+(B̃∩H)), killed by 2. The older comparison factors as κ_old=ι_new_old∘κ_new. The map is defined using the shared extended presentation P/H, not by a nonexistent general projection Q_neg→⋀²Fˣ. Over F₁₁ the inclusion is ℤ/3↪ℤ/6 of index 2. Over F₇ it is ℤ/2↪ℤ/4 of index 2. Hence the source version changes the integral target even though all three groups agree after inverting 2.

Here F is a field with |F|≥4, with B_old defined by its repaired exterior-cycle quotient.

For |F|≥4, tensoring κ_new and ι_new_old with ℤ[1/2] or ℚ gives isomorphisms B→B_new→B_old; κ_old is their composite. Tensoring these maps with ℤ/n gives isomorphisms whenever n>0 is odd. The lecture comparison μ_rel:B_raw/K_raw→B becomes an isomorphism over ℤ[1/6] and ℚ, and modulo n>0 coprime to 6. These are the specified canonical maps, not merely abstract isomorphisms. The integral generic Goncharov comparison already has zero correction. For G₂^curv the exact rational kernel K_curv remains; its vanishing is not a coefficient export. Imposing the further relation [0]=0 on B_new kills its subgroup generated by κ_new(c), of order dividing 3, and the composite B→B_new/⟨[0]⟩ has exact kernel (B∩H)+⟨c⟩, killed by 6, with zero cokernel. This last quotient describes the effect of an extra degenerate-zero relation; it is not the generic Goncharov presentation.

Here, modulo n uses n>0 and the stated coprimality; the 2 and 3 exclusions are mathematical, not blanket algorithmic exclusions.

The source locators for these statements are CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof; CGZ 2023, §2.1, p. 391, Definition 2.1; Bloch, Higher Regulators (convention only; see References), §6.1, p. 43, (6.1.2); Goncharov 1995, §1.9, p. 225, Conjecture 1.20.

**Checks.**

- κ_new:B(F₅)≅ℤ/3→B_new(F₅)≅ℤ/3 is an isomorphism and preserves c.
- κ_new:B(F₇)≅ℤ/4→B_new(F₇)≅ℤ/2 has kernel generated by h(−1)=c, of order 2; κ_new(c)=0.
- κ_new:B(F₁₁)≅ℤ/6→B_new(F₁₁)≅ℤ/3 sends c to a generator and has kernel {0,3c}.

Needs §3.5, §3.6, §3.7, §3.8, §3.10, §3.11, §3.12, §3.13, §3.14, §3.15; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### Examples

For ℚ, ∂([2]+[−1])=2∧(−1)+(−1)∧2=0, while ∂[2] is nonzero of order two. For F₅, P=ℤ/6 on [3], B=ℤ/3 on [2], and the exterior-kernel group is all of P. For F₁₁, B=ℤ/6 on c, B_new=ℤ/3, and B_old=ℤ/6; κ_new is onto while κ_old has an order-two kernel and an order-two cokernel. Abstract equal orders do not identify the maps. The rational all-curve comparison retains the explicit kernel K_curv and its conditional vanishing statement.

### Dependencies

Use Mathlib tensor products, free abelian groups, quotient modules, exterior powers, projectivization and general linear groups, with K2SymbolsBrauer T.2 for Matsumoto. The affine invariance supplier extends to the projective normalization in §3.2. Smooth-curve specialization uses AlgebraicCurves Layer 12A for the local DVR dictionary and the local algebraic lemma stated here. No K₃-to-Bloch theorem is used to construct these presentations or their convention maps.

## Layer 4: Configuration homology and the Suslin sequence

The homology arguments up to the infinite-field Suslin sequence assume F infinite unless a statement explicitly says otherwise. Independent vector frames prove the stability and Milnor quotient needed by the projective-configuration construction. The monomial calculation then identifies the integral kernel, including its enhancement at two.

### 4.1 Group-module hyperhomology

For a group G and a bounded-below complex C of integral G-modules, construct Hₙ(G,C) from the total complex of a projective right ℤ[G]-resolution P of ℤ tensored with C. Comparison maps make it independent of the chosen resolution and invariant under equivariant quasi-isomorphisms. Its finite-in-each-total-degree filtration has E¹_{p,q}=H_q(G,C_p) and converges to H_{p+q}(G,C). The augmentation P→ℤ gives a natural map to Hₙ(C_G). Specializing to ordered configurations defines configHyperhomology and its map to the coinvariant complex; for an infinite set X, augmentation identifies it with Hₙ(G,ℤ). This same generic construction is used for the frame spectral sequence, with a finite frame filtration.

Here G is a group acting on the set X. For the identification with H_n(G, ℤ): X is infinite.

Provide `configHyperhomology` (H_n(G, C_*(X)), the homology of the total complex of P ⊗_G C_*(X)); `configHyperhomology.toCoinvariants` (The canonical map H_n(G, C_*(X)) → H_n(C_*(X) ⊗_G ℤ)); `configHyperhomology.iso_groupHomology` (For X infinite, the augmentation induces H_n(G, C_*(X)) ≅ groupHomology (Rep.trivial ℤ G ℤ) n).

Provide `configHyperhomology.map_quasiIso` (A G-equivariant quasi-isomorphism of bounded-below complexes induces an isomorphism of hyperhomology); `configHyperhomology.map` (Naturality for a group homomorphism with a compatible injection of G-sets, commuting with toCoinvariants and iso_groupHomology).

For C concentrated in degree zero at a module M, this is ordinary Hₙ(G,M). For C=0 it is zero. For the trivial group and any C it is Hₙ(C), with identity comparison to coinvariants. These checks characterize the general construction before specializing C to frames or configurations later in this layer.

The source locators for these statements are Weibel, K-book, Definition VI.5.5, second paragraph (PDF p. 497); Weibel, K-book, Corollary VI.5.5.2 (PDF p. 497).

**Checks.**

- For the trivial group the map H_n(1, C_*(X)) → H_n(C_*(X)) is the identity.
- For G = GL_2(F) acting on ℙ¹(F), H_q(G, C_1(ℙ¹(F))) ≅ H_q(T_2, ℤ) via groupHomology.indIso; the stabiliser of (0, ∞, 1) is the centre, so H_q(G, C_2(ℙ¹(F))) ≅ H_q(F^×, ℤ).
- For G trivial and X = {x, y}, H_1(G, C_*(X)) ≅ ℤ while H_1(G, ℤ) = 0: without acyclicity the identification with group homology fails.
- For X infinite and G transitive on X, H_0(G, C_*(X)) ≅ ℤ ≅ H_0(C_G), and the canonical map is an isomorphism.
- For C concentrated at degree zero at M, the generic hyperhomology is Hₙ(G,M).
- For the zero complex it is zero in every degree.
- For G trivial the augmentation-to-coinvariants map is the identity on Hₙ(C).

Needs Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.2 Independent-vector chains

For a field F and n,m≥0, C₀ⁿ,ᵐ=Z and C_qⁿ,ᵐ is the free abelian group on ordered q-tuples (vᵢ,wᵢ)∈Fⁿ⊕Fᵐ with the projected family vᵢ linearly independent, q≥1. The boundary is alternating deletion, d(v,w)=1 in degree1. Thus C_q=0 for q>n. This is the shifted augmented complex of Um(Fⁿ,Fᵐ), not the projective configuration complex. It carries the natural action of Aₙ,ₘ={ (g 0;u 1):g∈GLₙ(F),u∈Hom(Fⁿ,Fᵐ)}.

Here F any field, n,m≥0; no infinitude required for construction.

Provide `unimodularChains` (The complex Cⁿ,ᵐ with the stated augmentation, differential and action); `unimodularChains.frame` (An independent ordered q-frame gives a basis chain in degreeq, including the empty frame); `unimodularChains.frame_d` (For q≥1, the boundary of a basis frame is the alternating sum of its q deleted frames).

Provide `unimodularChains.basisEquiv` (The degreeq underlying module is linearly equivalent to the free abelian group on the projected-independent q-frames); `unimodularChains.glRepresentation` (For m=0 the complex is a complex in Rep Z GLₙ; forgetting the action recovers Cⁿ,⁰); `unimodularChains.mapField` (A field embedding acts on both coordinate blocks and induces a chain map, commuting with augmentation; identity and composite embeddings induce identity and composite maps).

Provide `unimodularChains.affineMap` (The lower block (g 0;u 1) acts by (v,w)↦(gv,uv+w), giving a chain automorphism. Identity and composition follow the actual lower-block multiplication, including the shear when m>0); `unimodularChains.affineMap_frame` (The action sends each independent frame basis chain to the basis chain of its coordinatewise lower-block transform); `unimodularChains.glRepresentation_frame` (For m=0 the underlying-complex equivalence identifies the GL representation on every basis frame with the coordinatewise g action; merely giving the right underlying module is insufficient).

For infinite F, H_q(Cⁿ,ᵐ)=0 for q≠n. Equivalently Um(Fⁿ,Fᵐ) is (n−2)-acyclic in reduced homology; the only possible homology of the shifted augmented complex is its top group Uₙ,ₘ=H_n(Cⁿ,ᵐ). For n=0 the empty augmentation Z is precisely that top group.

Here F infinite; n,m≥0.

The source locators for these statements are Suslin 1984, §2 definitions, Lemmas2.1–2.2, pp191–192; Suslin 1984, Lemmas2.1–2.2, pp191–192.

**Checks.**

- C⁰,ᵐ has degree0 Z and zero positive terms, even when m>0.
- For n=1,m=0, d(a)=1 for a≠0, so d((2)−(1))=0 over Q; there are no degree2 independent frames.
- For the standard frame (e₁,e₂) in F², d(e₁,e₂)=(e₂)−(e₁); forgetting the order or using an all-positive boundary fails.
- The distinct vectors e₁ and 2e₁ in Q² are not a degree2 generator. Distinctness alone is insufficient.
- For n=m=1 over Q, the block (1 0;1 1) sends the degree-one frame (1,0) to (1,1). A trivial action on the lower coordinates fails.

Needs Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.3 Scalar acyclicity and affine stabilizers

For an infinite field F, an F-vector space V, a prime field k, j>0 and i≥0, Hᵢ(Fˣ,Hⱼ(V_add,k))=0, where Fˣ acts by scalar multiplication on V and hence on its additive-group homology. V need not be finite-dimensional. This is coefficient homology, not the assertion that Hⱼ(V_add,k) itself vanishes.

Here F infinite; k=Q or F_p; j>0.

Let G₁≤GLₙ(F), G₂≤GLₘ(F), and M≤Matₙ,ₘ(F) be an F-linear subspace stable under left G₁ and right G₂ multiplication. If F is infinite and either G₁ or G₂ contains every scalar matrix, the block-diagonal inclusion G₁×G₂→{(g₁ u;0 g₂):u∈M} induces an isomorphism on integral homology in every degree. The stronger all-diagonal hypothesis printed in Su84 implies this sufficient scalar hypothesis.

Here n,m≥1; F infinite; scalar containment in at least one block; M stable.

The source locators for these statements are Suslin 1984, Corollary1.8, p191; Suslin 1984, Theorem1.9 and proof, p191.

Needs Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.4 Top frame coinvariants

Define Sₙ(F)=H₀(GLₙ(F),Uₙ,₀) using integral coefficient homology and the representation on top frame homology. For n≥1, ⟨a₁,…,aₙ⟩ is the coinvariant class of the alternating sum of the n-element faces of (e₁,…,eₙ,Σaᵢeᵢ), aᵢ∈Fˣ. Each face is independent; the (n+1)-tuple itself is not a generator of Cⁿ,⁰. Direct-sum concatenation of independent frames induces associative products Sₙ⊗Sₘ→Sₙ₊ₘ, with S₀=Z as unit. This is Suslin’s frame-homology algebra, not Milnor K-theory itself.

Here F infinite for the generator presentation; the underlying coinvariants are defined for any field.

Provide `stabilityCoinvariants` (The existing H₀ of the top-homology representation); `stabilityCoinvariants.gen` (For n≥1 and nonzero entries, the specified boundary class ⟨a⟩); `stabilityCoinvariants.ext` (Two additive homomorphisms out of Sₙ agreeing on every ⟨a⟩ agree, n≥1).

Provide `stabilityCoinvariants.relation` (For pairwise distinct λᵢ∈Fˣ, ⟨λ₁a₁,…,λₙaₙ⟩−⟨a₁,…,aₙ⟩=Σᵢ(−1)ⁱ⁺ⁿ⟨a₁(λ₁−λᵢ),…, omit aᵢ(λᵢ−λᵢ),…,aₙ(λₙ−λᵢ),λᵢ⟩, with indices1,…,n); `stabilityCoinvariants.mul` (Associative bilinear direct-sum product, with S₀=Z acting by integer multiplication; the product uses ordered concatenation); `stabilityCoinvariants.milnorRetraction` (The unique homomorphism Sₙ→Kₙᴹ(F) sends every ⟨a⟩ to {a₁,…,aₙ}, using T.2’s Milnor-symbol presentation).

Provide `stabilityCoinvariants.unit` (The empty-frame augmentation class 1 in S₀=Z is the multiplicative unit); `stabilityCoinvariants.mul_unit` (Multiplication by that unit on either side is the identity, after transporting 0+n and n+0); `stabilityCoinvariants.eMul` (Multiplication by e=⟨1,1⟩ is the additive map Sₙ→Sₙ₊₂, with the displayed ordered-product formula).

Provide `stabilityCoinvariants.eMul_apply` (eMul(x)=mul(⟨1,1⟩⊗x), transporting the codomain index 2+n to n+2).

The source locators for these statements are Suslin 1984, §2.3–2.5, pp192–195.

**Checks.**

- S₀(F) is Z, not the zero group.
- S₁(F)≅Fˣ written additively, and ⟨a⟩ maps to a; in particular ⟨1⟩=0.
- Under S₂(F)≅K₂ᴹ(F)⊕Z, ⟨1,1⟩ maps to (0,1), so S₂ is not just K₂ᴹ and this class is nonzero.
- ⟨a⟩·⟨b⟩=⟨a,b⟩−⟨1,b⟩−⟨a,1⟩+⟨1,1⟩; the Milnor retraction sends it to {a,b}.

Needs §4.2, §4.3; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.5 Connecting homomorphisms and ordered Milnor symbols

For infinite F and n≥1, the exact augmented frame complex defines δₙ:Hₙ(GLₙ(F),Z)→Sₙ(F) by n successive connecting homomorphisms. Its restriction along GLₙ₋₁→GLₙ is zero. With ordered block-sum homology products, δₙ₊ₘ(x×y)=δₙ(x)·δₘ(y). The connecting-map convention is pinned by δ₁([a])=⟨a⟩, so the Milnor symbol comparison has no unspecified sign.

Here F infinite; n≥1; integral homology; stabilization is diag(g,1).

Provide `frameConnecting` (The homomorphism δₙ defined from the exact augmented complex); `frameConnecting_stabilization` (δₙ vanishes on the image of Hₙ(GLₙ₋₁), not on all of Hₙ(GLₙ)); `frameConnecting_product` (δₙ₊ₘ sends the ordered block-sum product to the S-algebra product).

Provide `frameConnecting_one` (On H₁(GL₁)=Fˣ written additively, δ₁([a])=⟨a⟩); `frameConnecting_field` (The connecting map commutes with field embeddings and the induced maps on group homology and Sₙ).

For infinite F and n≥1 define θₙ:Kₙᴹ(F)→Hₙ(GLₙ(F),Z)/im Hₙ(GLₙ₋₁(F),Z) by {a₁,…,aₙ}↦the quotient class of the ordered block-diagonal product [a₁]×⋯×[aₙ]. It is the unique homomorphism with this generator formula. Multilinearity and the Steinberg relation make it well-defined before stability is proved.

Here F infinite; n≥1; ordered homology cross products, not Quillen products.

Provide `milnorHomologyTheta` (The symbol-induced additive map θₙ to the quotient by the stabilization image); `milnorHomologyTheta_symbol` (A Milnor symbol maps to the quotient class of the ordered degree-one homology product); `milnorHomologyTheta_field` (θ commutes with field embeddings and their maps on Milnor K-theory, GL homology and stabilization quotients).

Provide `milnorHomologyTheta_unique` (Every additive map from Kₙᴹ to the stabilization quotient with the ordered-product formula on symbols equals θₙ).

The composite Kₙᴹ(F)→θₙ Hₙ(GLₙ)/im Hₙ(GLₙ₋₁)→δₙ Sₙ(F)→Kₙᴹ(F) is the identity, for infinite F and n≥1. In particular θₙ and its lift into Sₙ are injective. This statement is established before the stability spectral-sequence induction.

Here F infinite; n≥1; the connecting convention δ₁([a])=⟨a⟩.

Well-definedness at n=2 uses the unstable SL₂ coinvariant symbol presentation, not just stable Matsumoto. Its exact K2SymbolsBrauer Part II supplier remains a prerequisite gap.

The source locators for these statements are Suslin 1984, §2.6 and Lemma2.6.1, p195; Suslin 1984, 2.7.1–2.7.4 and Theorem3.4(d), pp195–198; Suslin 1984, Corollary2.7.4, p196.

**Checks.**

- δ₁([2])=⟨2⟩ over Q under the abelianisation identification.
- Every H₃(GL₂) class maps to zero under δ₃ after stabilization.
- The Milnor retraction of δ₃([a]×[b]×[c]) is {a,b,c}, including the order of the three factors.
- θ₁ is Fˣ≅H₁(GL₁) because H₁(GL₀)=0.
- The ordered torus product [a]×[1−a]×[b] has zero class modulo im H₃(GL₂), for a≠0,1 and b≠0.
- Over R, {-1,-1,-1} maps to a nonzero quotient class of order2. An erroneous multiplication-by-2 normalization would kill it.

Needs §4.2, §4.4; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.6 Splitting the frame algebra

For infinite F, S₂(F)≅K₂ᴹ(F)⊕Z with ⟨a,b⟩↦({a,b},1). For n≥2, Sₙ is the internal sum of the embedded Kₙᴹ and the image of multiplication by e=⟨1,1⟩ from Sₙ₋₂; the intersection is zero. Multiplication by e is injective once the stability induction below is established. For n≥3 all Sₙ are generated by products of positive-degree classes.

Here F infinite; use the normalized Milnor section θ through δ and the Milnor retraction.

The source locators for these statements are Suslin 1984, 2.7.4, 3.3.1–3.3.5, pp196–198.

Needs §4.4, §4.5; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.7 Diagonal and monomial subgroups

For a field F and n ≥ 1 let T_n ⊂ GL_n(F) be the diagonal matrices, Σ_n ⊂ GL_n(F) the permutation matrices and M_n = T_n ⋊ Σ_n ≅ F^× ≀ Σ_n the monomial matrices (one nonzero entry in each row and column). Let M = ⋃_n M_n ≅ F^× ≀ Σ_∞ and Σ_∞ = ⋃_n Σ_n inside GL(F), with M_n ⊂ M_{n+1} by block sum with 1.

Here F is a field; n ≥ 1.

Provide `diagonalSubgroup` (T_n as a subgroup of GL_n(F)); `permSubgroup` (Σ_n as permutation matrices in GL_n(F)); `monomialSubgroup` (M_n as a subgroup of GL_n(F)).

Provide `diagonalSubgroup_normal` (T_n is normal in M_n with quotient Σ_n, and M_n = T_n ⋊ Σ_n); `diagonalSubgroup_equiv` (T_n ≅ (F^×)^n); `monomialSubgroup.stable` (The inclusions M_n ⊂ M_{n+1} by block sum, and M = ⋃ M_n ≅ F^× ≀ Σ_∞ in GL(F)).

The source locators for these statements are Weibel, K-book, Before Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Monomial matrices, before Proposition VI.5.15 (PDF p. 503).

**Checks.**

- For F = F_2, M_2 has order two and T_2 is trivial.
- T_n is isomorphic to (F^×)^n.
- For n = 2 and F = F_3, M_2 is a proper subgroup of GL_2(F_3), of order 8 against 48.
- For n = 1, T_1 = M_1 = GL_1(F) = F^×.

Needs Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.8 The stability induction

For infinite F and n≥1, the frame hyperhomology spectral sequence has E¹_{p,q}=H_p(GLₙ₋q(F),Z), 0≤q≤n, and abuts to H_{p+q−n}(GLₙ(F),Uₙ) with the finite frame filtration. The d¹ in odd q is stabilization and in even q is zero. Its dʳ vanish for every r≥2. Multiplication by e:Sₙ₋₂→Sₙ is injective for n≥2. The degree-n edge has kernel im Hₙ(GLₙ₋₁) and its Milnor retraction identifies the quotient with Kₙᴹ. Consequently the finite-step stabilization H_i(GLₙ₋₁)→H_i(GLₙ) is an isomorphism for i≤n−1. These assertions are proved simultaneously, rather than invoking the stability theorem to prove itself.

Here F infinite; GL₀ is the trivial group; homological indexing p=group degree, q=augmented frame length.

For infinite F, θ₃ is an isomorphism with inverse the descended Milnor retraction of δ₃. If t₃:H₃((Fˣ)³)→H₃(GL₃) is induced by diagonal matrices and s₂:H₃(GL₂)→H₃(GL₃) by diag(g,1), then im t₃+im s₂=H₃(GL₃). The quotient sends the ordered degree-one product for (a,b,c) to {a,b,c}, with coefficient +1. This supplies the proof interface of the §4.8; it does not change the ψ₃.

Here F infinite; all homology integral; order of factors fixed.

The source locators for these statements are Suslin 1984, §3.1–3.2 and Theorem3.4(a–d), pp196–198; Suslin 1984, Theorem3.4(d), p198.

Needs §4.2, §4.3, §4.5, §4.6, §4.7; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.9 Ordered configurations and augmentation

For a set X let C_n(X) be the free abelian group on the ordered tuples of n + 1 pairwise distinct points of X, with the alternating-sum differential that deletes one entry, and with the augmentation sending each singleton to 1. When a group acts on X this is a complex of modules over the group ring. The tuples are ordered and the entries are required to be distinct; both are part of the definition.

Here X is a set; G is a group acting on X when the equivariant structure is used.

Provide `configComplex` (The chain complex C_*(X) of abelian groups (and of G-modules when G acts on X), indexed by ℕ); `configComplex.single` (For an injective tuple x : Fin (n + 1) ↪ X, the basis element [x] of C_n(X)); `configComplex.d_single` (d [x] = Σ_{i=0}^{n} (−1)^i [x ∘ Fin.succAbove i]).

Provide `configComplex.d_comp_d` (The differential squares to zero); `configComplex.aug` (The augmentation C_0(X) → ℤ with aug [x] = 1); `configComplex.aug_comp_d` (aug ∘ d_1 = 0).

Provide `configComplex.smul` (The action of a group acting on X, by acting on every entry; g • [x] = [g • x]); `configComplex.toRep` (C_n(X) is Rep.ofMulAction ℤ G (Fin (n + 1) ↪ X) and d is a morphism of representations, so C_*(X) is a ChainComplex (Rep ℤ G) ℕ; Fin (n + 1) ↪ X is the index type of Mathlib's MulAction.IsMultiplyPretransitive); `configComplex.map` (An injection f : X ↪ Y induces a chain map, with map id = id and map (g ∘ f) = map g ∘ map f, compatible with the augmentations).

If X is an infinite set, the augmented configuration complex C_*(X) → ℤ is exact; equivalently the augmentation is a quasi-isomorphism. The identification of hyperhomology with group homology that the K-book deduces (Corollary VI.5.5.2) is part of §4.1, and the finite case (Exercise VI.5.1) is not planned, since it is used only for finite fields.

Here X is an infinite set.

The source locators for these statements are Weibel, K-book, Definition VI.5.5 (PDF p. 497); Weibel, K-book, Lemma VI.5.5.1 and its proof (PDF p. 497); Weibel, K-book, Exercise VI.5.1 (PDF p. 508).

**Checks.**

- d ∘ d = 0 in every degree; the unsigned sum of deletions fails, giving d d (x, y, z) = 2(x) + 2(y) + 2(z).
- For a one-point set X, C_0(X) = ℤ, C_n(X) = 0 for n ≥ 1, and the augmentation is an isomorphism.
- For X = {x, y}, H_1(C_*(X)) ≅ ℤ, generated by (x, y) + (y, x); a definition admitting repeated entries gives an acyclic complex here.
- For |X| = 3 the groups C_0, C_1, C_2 have ranks 3, 6, 6 (ordered tuples, not the ranks 3, 3, 1 of subsets) and the homology is ℤ, 0, ℤ² in degrees 0, 1, 2.
- d(x_0, x_1) = (x_1) − (x_0), and aug(d(x_0, x_1)) = 0.
- For G acting on X, d(g • s) = g • d(s) and aug(g • s) = aug(s) for every chain s.

Needs Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.10 Projective configuration coinvariants

Let F be a field, G the group of invertible two by two matrices over F acting on the projective line of F, and C_G the coinvariant complex. Then the degree-zero homology is the integers, the homology vanishes in degrees one and two, and the degree-three homology is the pre-Bloch group P(F). The identification sends the class of the tuple consisting of 0, infinity, 1 and x to the generator [x].

Here F is a field (any field: the computation also holds for F_2, where C_3 = 0 = P(F_2), and for F_3, where C_4 = 0 and P(F_3) ≅ ℤ on [−1]); G = GL_2(F) acts on ℙ¹(F).

The source locators for these statements are Weibel, K-book, Lemma VI.5.6 and its proof (PDF p. 498).

Needs §3.2, §3.3, §3.4, §4.9; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.11 The rank-two spectral sequence

Let F be an infinite field and G = GL_2(F) act on X = ℙ¹(F). The hyperhomology spectral sequence E^1_{p,q} = H_q(G, C_p(X)) ⇒ H_{p+q}(G, ℤ) has E^1_{0,q} = H_q(B, ℤ), E^1_{1,q} = H_q(T_2, ℤ) and E^1_{2,q} = H_q(Δ, ℤ), where B is the upper triangular group (the stabiliser of 0), T_2 the diagonal torus (the stabiliser of (0, ∞)) and Δ = {(a, a)} the centre (the stabiliser of (0, ∞, 1)); its row q = 0 is the coinvariant complex, so E^2_{p,0} = H_p(C_G), which is ℤ, 0, 0, P(F) for p = 0, 1, 2, 3. The differential d^1 : H_q(Δ) → H_q(T_2) is induced by the inclusion and is split injective, so E^2_{2,q} = 0; with the d^1 involution lemma, E^2_{0,q} = H_q(T_2)_σ, E^2_{1,q} = H_q(T_2)^σ / H_q(Δ), E^2_{0,1} = F^× and E^2_{1,1} = 0.

Here F is an infinite field. B, T_2 and the centre Δ are the stabilisers named in the statement.

For an infinite field F the inclusion of the diagonal torus T_2 into the upper triangular group B_2 of GL_2(F) induces an isomorphism H_*(T_2, ℤ) → H_*(B_2, ℤ).

Let F be infinite and σ(a, b) = (b, a) on T_2. Under the Shapiro identifications E^1_{1,q} ≅ H_q(T_2, ℤ) and E^1_{0,q} ≅ H_q(B_2, ℤ) ≅ H_q(T_2, ℤ), the differential d^1 : E^1_{1,q} → E^1_{0,q} of the configuration spectral sequence of GL_2(F) on ℙ¹(F) is induced by 1 − σ.

For F infinite, in the configuration spectral sequence of GL_2(F) on ℙ¹(F), E^2_{0,2} = H_2(T_2)_σ ≅ ∧²F^× ⊕ ∧̃²(F^×) (Künneth: σ exchanges the two copies of H_2(F^×) = ∧²F^× and acts on F^× ⊗ F^× by x ⊗ y ↦ −y ⊗ x), and d^3 : E^3_{3,0} = P(F) → E^3_{0,2} is the boundary [x] ↦ x ⊗ (1 − x) of Layer 3 followed by the split inclusion of ∧̃²(F^×). Hence E^∞_{3,0} = B(F) and E^∞_{0,2} ≅ ∧²F^× ⊕ K_2(F).

The d³ boundary formula is the target `rankTwo_d3_boundary`. Suslin, Lemma 2.4, p.222, states it but omits the chain calculation. A bar-chain derivation with the following representatives remains a proof gap; citation to that lemma does not supply the missing computation.

Fix the Shapiro representatives for columns 0,1,2 as (0), (∞,0), (∞,0,1). Then d(∞,0)=(0)−(∞), giving 1−σ; this avoids an unrecorded sign change from using (0,∞). On H₁(T₂), the class (a,1) maps to (a,a⁻¹) in multiplicative coordinates. The centre is Δ(a)=(a,a), whose image is σ-fixed. On the mixed H₁⊗H₁ Künneth term the swap sends a⊗b to −b⊗a. These pin the antisymmetric cokernel in the d³ target.

The source locators for these statements are Weibel, K-book, (5.8) and the paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Proof of Theorem VI.5.7 (PDF p. 499); Weibel, K-book, Paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Lemma VI.5.8.1 (PDF p. 499); Weibel, K-book, Exercise VI.5.2(iii) (PDF p. 508).

Needs §3.1, §3.5, §4.1, §4.3, §4.7, §4.10; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.12 The rank-two Bloch map

For an infinite field F, construct psiGL2:H₃(GL₂(F),ℤ)→B(F) from the configuration edge map. On the second page E²_{3,0}=H₃(C_G)=P(F). There is no incoming higher differential to this position; the remaining outgoing differential is d³=∂, so E∞_{3,0}=ker ∂=B(F). The edge map therefore lands in B(F). Its composite with B(F)⊂P(F) is the canonical augmentation-to-coinvariants map. The first page E¹_{3,0} consists of coinvariant chains, not P(F).

Here F is an infinite field.

Provide `psiGL2` (The homomorphism H_3(GL_2(F), ℤ) → B(F)); `psiGL2_coe` (Its composite with B(F) ⊆ P(F) is H_3(GL_2(F), ℤ) → H_3(C_G) ≅ P(F)); `psiGL2_surjective` (ψ is onto B(F)).

Provide `psiGL2_natural` (For a field homomorphism F → E, ψ_E ∘ H_3(GL_2(F) → GL_2(E)) = B(F → E) ∘ ψ_F).

For every infinite field F, H_1(GL_2(F), ℤ) ≅ F^×, H_2(GL_2(F), ℤ) ≅ ∧²F^× ⊕ K_2(F), and the sequence H_3(M_2, ℤ) → H_3(GL_2(F), ℤ) −ψ→ B(F) → 0 is exact, where M_2 is the monomial subgroup and ψ is the map of §4.12.

Here F is an infinite field. The K-book's 'For all F' is false even with its standing |F| ≥ 4: the H_2 formula fails for F_4.

The source locators for these statements are Weibel, K-book, Paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Proof of Theorem VI.5.7 (PDF p. 499).

**Checks.**

- ψ is onto B(F).
- The composite with B(F) ⊆ P(F) equals the canonical map H_3(GL_2(F), ℤ) → H_3(C_G) ≅ P(F) of §4.1.
- For F = ℚ the image is a proper subgroup of P(ℚ): [2] is not in B(ℚ), since its boundary 2 ∧ (−1) is nonzero in ∧̃²(ℚ^×).
- ψ vanishes on the image of H_3(T_2, ℤ).

Needs §3.5, §4.1, §4.7, §4.10, §4.11; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.13 General position, rotations and the cone

For a field F let GP_n ⊆ C_n(ℙ²(F)) be spanned by the (n + 1)-tuples of points of ℙ²(F) no three of which are collinear. GP_* is a subcomplex of the configuration complex, stable under GL_3(F) and under the rotations t_n. For F infinite, GP_* → ℤ, and hence GP_* → C_*(ℙ²(F)), is a quasi-isomorphism.

Here F is a field; for the acyclicity, F is infinite.

Provide `gpComplex` (The subcomplex GP_* of configComplex (ℙ²(F))); `gpComplex.le` (GP_* is a subcomplex of configComplex (ℙ²(F)), with the induced augmentation); `gpComplex.smul` (The GL_3(F)-action on GP_*).

Provide `gpComplex.rotate` (The rotations t_n preserve GP_n); `gpComplex.aug_quasiIso` (For F infinite, GP_* → ℤ is a quasi-isomorphism).

Let C_* be the configuration complex C_*(X), or the general-position complex of ℙ²(F). The rotations t_n(x_0, …, x_n) = (x_n, x_0, …, x_{n−1}) preserve the generators and satisfy t_n^{n+1} = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t_{n−1} ∂_{i−1} for i ≥ 1: C_* is a precyclic abelian group (faces and rotations, no degeneracies; duplicating an entry leaves the complex). Construct C^a_*, with the same terms and differential d^a = Σ_{i=0}^{n−1} (−1)^i ∂_i (the last face omitted), the norm N = Σ_{i=0}^{n} ((−1)^n t_n)^i : C_n → C^a_n, which is a chain map, and the mapping cone D_* of the truncated morphism N : C_{≥1} → C^a_{≥1}: D_0 = C^a_1 and D_n = C^a_{n+1} ⊕ C_n for n > 0, with differential (x, y) ↦ (d^a x − N y, −d y). For X infinite (for the general-position complex, F infinite), C^a_* is acyclic and ε : D_0 → ℤ, (x_0, x_1) ↦ 1, induces a quasi-isomorphism D_* → ℤ.

Here X is a set; for the acyclicity statements X is infinite, and for the general-position complex of ℙ²(F), F is infinite.

Provide `precyclicConfig` (The rotations t_n on injective (or general-position) tuples, with t_n^{n+1} = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t_{n−1} ∂_{i−1} for i ≥ 1); `acyclicConfig` (The complex C^a_* with differential d^a omitting the last face); `acyclicConfig_exact` (For infinite X (general position: infinite F), C^a_* is exact in every degree, including degree zero).

Provide `normMap` (N = Σ_{i=0}^{n} ((−1)^n t_n)^i, a chain map C_* → C^a_*); `coneD` (The complex D_* with D_0 = C^a_1, D_n = C^a_{n+1} ⊕ C_n and differential (x, y) ↦ (d^a x − N y, −d y)); `coneD.aug` (ε : D_0 → ℤ, (x_0, x_1) ↦ 1).

Provide `coneD_quasiIso` (The shifted cone of N maps quasi-isomorphically to C_* and to D_*, and ε : D_* → ℤ is a quasi-isomorphism for infinite X); `coneD.smul` (The action of a group acting on X, commuting with d^a, N and the cone differential).

The source locators for these statements are Weibel, K-book, Example VI.5.9.1 (PDF p. 500); Weibel, K-book, Definition VI.5.9 (PDF p. 500); Weibel, K-book, (5.9.1) (PDF p. 500).

**Checks.**

- GL_3(F) acts transitively on GP_3, and GP_3 ⊗_{GL_3(F)} ℤ ≅ ℤ, generated by P = (p_1, p_2, q, p_3).
- ((1 : 0 : 0), (0 : 1 : 0), (1 : 1 : 0)) is a generator of C_2(ℙ²(F)) but not of GP_2.
- t_n(GP_n) = GP_n, and every face map sends GP_n into GP_{n−1}.
- Over F_2, GP_n = 0 for n ≥ 4: the largest sets of points of ℙ²(F_2) with no three collinear have four points.
- For X infinite, H_n(C^a_*(X)) = 0 for all n ≥ 0; in degree zero d^a(x_0, x_1) = (x_1) is onto.
- For |X| = 3, H_2(C^a_*(X)) is free of rank 3 (and for |X| = 4, H_3 has rank 8; checked by computer), so the infinite hypothesis is needed.
- On (x, y, z) the norm Σ_i ((−1)^2 t)^i = 1 + t + t² satisfies d^a N = N d, while Σ_i (−1)^i t^i does not.
- D_0 = C^a_1, and d(x, y) = d^a x − N y on D_1 = C^a_2 ⊕ C_1.
- t_n^{n+1} = 1 and ∂_0 t_n = ∂_n on injective tuples; for X = {x, y}, t_1(x, y) = (y, x).

Needs §4.9; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.14 The rank-three comparison and coefficient change

Let F be infinite, D_* the cone complex of §4.13 for the general-position complex of ℙ²(F), and D_G = D_* ⊗_{GL_3(F)} ℤ. Then (D_G)_3 = ℤP ⊕ ⊕ ℤ[a; x], with P = (p_1, p_2, q, p_3) in the C_3 summand and [a; x] = (p_1, p_2, q, (1 : a : x), p_3) in the C^a_4 summand (a, x ∉ {0, 1}, a ≠ x), and d : (D_G)_3 → (D_G)_2 is zero. Define ψ′ : (D_G)_3 → P(F) by ψ′([a; x]) = [a] (the cross-ratio of the projection from the last point) and ψ′(P) = −2c. Then ψ′ vanishes on d((D_G)_4), so it induces ψ : H_3(GL_3(F), ℤ) ≅ H_3(GL_3(F), D_*) → H_3(D_G) → P(F). The K-book prints ψ′([a; x]) = a and ψ′(P) = 2c; with its displayed cone differential the sign of the P-value must be −2c.

Here F is an infinite field.

Provide `psiPrime` (ψ′ : (D_G)_3 → P(F), with ψ′([a; x]) = [a] and ψ′(P) = −2c); `psiPrime_comp_d` (ψ′ ∘ d = 0 on (D_G)_4); `psiGL3` (The induced homomorphism H_3(GL_3(F), ℤ) → P(F)).

Provide `psiGL3_natural` (Naturality for field homomorphisms F → E); `psiGL3_stable` (The extension of ψ to H_3(GL(F), ℤ) through H_3(GL_3(F)) ≅ H_3(GL(F)) (Remark VI.5.12.1)).

The composite of the map induced by the inclusion of the two by two matrices into the three by three matrices with the map psi of the rank-three construction is the map psi of the rank-two theorem, followed by the inclusion of B(F) into P(F).

Let F be infinite and T_3 ⊂ GL_3(F) the diagonal torus. For n > 0 the map H_n(T_3, ℤ) → H_n(D_* ⊗_{T_3} ℤ) is zero; hence ψ vanishes on the image of H_3(T_3, ℤ) in H_3(GL_3(F), ℤ).

For an infinite field F the image of the map ψ : H_3(GL_3(F), ℤ) → P(F) of §4.14 is B(F), and the sequence H_3(M_2, ℤ) ⊕ H_3(T_3, ℤ) → H_3(GL_3(F), ℤ) −ψ→ B(F) → 0 is exact.

For a field embedding f:F→E and an ordered injective quadruple t in P¹(F), the cross-ratio satisfies cr_E(P¹(f)t)=f(cr_F(t)). It induces the corresponding square between degree-three configuration coinvariants and P(F)→P(E), so the maps ψ₂ and the rank-comparison ψ₃ commute with field embeddings. Use cr(0,∞,1,x)=x, not the reciprocal convention of the polylogarithm cocycle.

Here F,E fields; f a unital field embedding; t consists of four distinct points. Infinitude is needed for ψ from acyclic configurations, not for the cross-ratio identity.

The source locators for these statements are Weibel, K-book, Before Lemma VI.5.10 (PDF p. 501); Weibel, K-book, Lemma VI.5.10 and its proof (PDF p. 501); Weibel, K-book, Lemma VI.5.11 (PDF p. 501); Weibel, K-book, Proposition VI.5.12 and its proof (PDF p. 502); Suslin 1991, Lemma2.2, p221.

**Checks.**

- ψ′([a; x]) = [a], the cross-ratio of the projection of (p_1, p_2, q, (1 : a : x)) from p_3.
- Σ_{i=0}^{4} ψ′(t^i[a; x]) = 2c in P(F); for F = F_11 this holds for all 72 admissible (a, x), and forces ψ′(P) = −2c.
- ψ′ ∘ d^a vanishes on every general-position 6-tuple (p_1, p_2, q, r, s, p_3).
- ψ′ does not take values in B(F): ψ′([2; x]) = [2] ∉ B(ℚ). Only the induced map on H_3 lands in B(F) (Proposition 5.12).

Needs §3.2, §3.3, §3.4, §3.6, §4.1, §4.7, §4.8, §4.10, §4.12, §4.13; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.15 Permutation classes and the monomial sequence

Let F be a field with at least four elements and x ∈ F − {0, 1, −1}. Then (i) [x²] = 2([x] + [−x] + [−1]) in P(F), and (ii) [x²] + 2[−x^{−1}] − 2[x − 1] − [(1 − x)^{−2}] = 2c. The K-book's Exercise VI.5.5 prints (ii) as [x²] + 2[−x²] − 2[x − 1] − [1/x²] = 2c, which is false.

Here F is a field with at least four elements; x ∉ {0, 1, −1}; [1] = 0.

Let F be an infinite field and A_3 ⊂ GL_3(F) the even permutation matrices. The image of H_3(A_3, ℤ) ≅ ℤ/3 under H_3(A_3) → H_3(GL_3(F)) −ψ→ B(F) is the subgroup generated by 2c.

Here F is an infinite field (the K-book's |F| ≥ 4 is needed only for the choice of x and y).

Let F be an infinite field and regard Σ_∞ as the group of permutation matrices in GL(F). The image of H_3(Σ_∞, ℤ) −ι_*→ H_3(GL(F), ℤ) −ψ→ B(F) is the subgroup generated by 2c, which is trivial or cyclic of order three.

Here F is an infinite field (ψ on H_3(GL(F), ℤ) needs the stability input).

Let F be an infinite field, M = ⋃_n M_n ⊂ GL(F) the monomial group and ι : Σ_∞ → GL(F) the permutation matrices. The sequence H_3(M, ℤ) → H_3(GL(F), ℤ) ⊕ H_3(Σ_∞, ℤ) −(ψ, −ψι_*)→ B(F) → 0 is exact, where the first map is (inclusion_*, π_*) for the projection π : M = F^× ≀ Σ_∞ → Σ_∞.

Here F is an infinite field.

For an infinite field F the cokernel of π_3(BM^+) → K_3(F) is B(F)/⟨2c⟩, and there is an exact sequence π_3(BM^+) → K_3(F) ⊕ π^s_3 −(ψ, −ψι_*)→ B(F) → 0. The indecomposable reformulation (Corollary 5.16.1) is the separate §4.16.

The two-primary vanishing for permutation classes and the relative monomial Künneth summands require the separate arguments cited in the K-book to Suslin’s Lecture Notes in Mathematics 1046 version, §§4.2 and 4.4.1. These arguments have not been verified from that version. The Russian §§1–3 source for frame stability does not supply them; their proof decomposition remains a gap.

The source locators for these statements are Weibel, K-book, Exercise VI.5.5 (PDF p. 508); Weibel, K-book, Lemma VI.5.14 (PDF p. 502); Weibel, K-book, Proof of Lemma VI.5.14 (PDF p. 503); Weibel, K-book, Proposition VI.5.13 and its proof (PDF p. 502); Weibel, K-book, Proposition VI.5.15 (PDF p. 503) and its proof (PDF p. 504); Weibel, K-book, Theorem VI.5.16 (PDF p. 504).

Needs §1.5, §2.1, §3.2, §3.3, §3.4, §3.6, §4.7, §4.8, §4.9, §4.12, §4.14; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.16 Indecomposable monomial homotopy

For a field F let M = F^× ≀ Σ_∞ be the monomial group and BM^+ its plus construction with respect to the perfect commutator subgroup P = [M, M]. Define π_3^ind(BM^+) as the quotient of π_3(BM^+) by the image of the products π_1(BM^+) ⊗ π_2(BM^+) → π_3(BM^+) in the graded ring π_*(ℤ × BM^+) ≅ π_*K(F^×-Sets_fin), together with the natural maps π_3^ind(BM^+) → π^s_3/(η³) ≅ ℤ/12 and π_3^ind(BM^+) → K_3^ind(F).

Provide `pi3Ind` (π_3^ind(BM^+) for the monomial group of F); `pi3Ind.mk` (The quotient map π_3(BM^+) → π_3^ind(BM^+)); `pi3Ind.toStable` (The natural map to π^s_3/(η³) ≅ ℤ/12, split by the unit π^s_3 → π_3(BM^+)).

Provide `pi3Ind.toK3ind` (The map to K_3^ind(F) induced by the ring map to K_*(F)); `pi3Ind.map` (Naturality for field homomorphisms, through F^× ≀ Σ_∞ → E^× ≀ Σ_∞).

For a field F there is a natural exact sequence 0 → μ_2(F) → π_3^ind(BM^+) −γ→ Tor_1^ℤ(μ(F), μ(F)) ⊕ ℤ/12 → 0, where the Tor term is H_3(F^×, ℤ)/∧³F^× (Ex. VI.5.9(a)). The K-book writes μ(F) for that term; the two are isomorphic, but not naturally in F (Ex. VI.5.9(b)).

For an infinite field F the sequence of Theorem 5.16 induces an exact sequence π_3^ind(BM^+) → K_3^ind(F) ⊕ ℤ/12 → B(F) → 0.

Here F is an infinite field.

The source locators for these statements are Weibel, K-book, After Theorem VI.5.16 (PDF p. 505); Weibel, K-book, Proposition VI.5.17 (PDF p. 505); Weibel, K-book, Proof of Proposition VI.5.17 (PDF p. 506); Weibel, K-book, Corollary VI.5.16.1 (PDF p. 505).

**Checks.**

- For F = F_2, π_3^ind(BM^+) ≅ ℤ/12.
- π_3^ind(BM^+) → ℤ/12 is split surjective, split by the unit π^s_3 → π_3(BM^+).
- For F = F_2 the quotient is ℤ/12, not π_3 = ℤ/24: the product η · η² = η³ ≠ 0 is divided out.
- For F = ℚ, π_3^ind(BM^+) ≅ ℤ/4 ⊕ ℤ/12.

Needs §2.1, §4.7, §4.15; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.17 Cyclic Chern classes, doubling and Bocksteins

Let δ : H_3(μ(F), ℤ) → H_3(P, ℤ) → π_3^ind(BM^+) be induced by x ↦ diag(x, x^{−1}). Then the μ-component of γ ∘ δ is twice the canonical isomorphism H_3(μ(F), ℤ) ≅ Tor_1(μ(F), μ(F)). The K-book states this as 'μ(F) → μ(F), x ↦ x²' after identifying H_3(μ(F)) with μ(F).

Let Ω be algebraically closed, m≥2 prime to char Ω, and ρ_m:µ_m→SL₂(Ω) be ζ↦diag(ζ,ζ⁻¹). If λ is the tautological character and u=c₁(λ), then c₂(ρ_m)=−u∪u in H⁴(µ_m,µ_m^{⊗2}). Evaluation gives an isomorphism H₄(µ_m,Z/m)→µ_m^{⊗2}. The finite-level cyclic resolution fixes its generator and the negative sign. This evaluates the supplier’s Chern class; it does not construct Chern classes in Layer 4.

Here Ω algebraically closed; m invertible; finite-level coefficient tensor products over Z/m, with the cyclic generator specified.

The source locators for these statements are Weibel, K-book, Lemma VI.5.18 (PDF p. 506); Suslin 1991, Lemma5.7 proof, p236; Weibel, K-book V, Exercise11.5, p89.

Needs §4.7, §4.16; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.18 Detecting ordinary Tor in an algebraic closure

For infinite F choose an algebraic closure Ω and let µ(F) be its roots-of-unity subgroup in Fˣ. The δ:H₃(µ(F),Z)→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F), followed by scalar extension to Ω, lands in the torsion of K₃ⁱⁿᵈ(Ω). Uniquely divisible Milnor K₃ and its split embedding identify that torsion with K₃(Ω)_tors. Compose with e_Ω to obtain D_F:H₃(µ(F),Z)→µ_Ω(2)^{Aut(Ω/F)}. Here µ_Ω(2) is the second Tate twist, naturally Tor₁^Z(µ(Ω),µ(Ω)); it is not the ordinary tensor product µ(Ω)⊗Zµ(Ω). This construction uses the e-invariant only on torsion.

Here F infinite; Ω algebraically closed over F; roots have order prime to the characteristic. The chosen closure is transported along embeddings, with independence of the transport on the invariant target.

Provide `closureTorsionDetector` (The additive homomorphism D_F given by this composite through closure torsion); `closureTorsionDetector_formula` (On every H₃(µ(F)) class it equals e_Ω of the torsion class obtained from the δ and scalar extension); `closureTorsionDetector_field` (Under F→E and compatible closures, D_E∘H₃(µ(F)→µ(E)) is the Tate-twist restriction of D_F; the equality is independent of the closure embedding on the invariant target).

Provide `closureTorsionDetector_fixed` (Every value is fixed by Aut(Ω/F) under its weight-two action; an automorphism acting on µ_m by ζ↦ζᵃ acts on the detected m-torsion by a²).

For algebraically closed Ω and m≥2 invertible with m odd or 8 dividing m, K₄(Ω;Z/m) has generator β², ∂β=ζ, and its Bockstein identifies it with K₃(Ω)[m] and K₃ⁱⁿᵈ(Ω)[m]. Under the early Chern interface c₁,₂(β)=ζ and c₂,₄(β²)=−ζ⊗ζ, so e_Ω=−c₂,₄ after that Bockstein identification. The square from H₄(µ(Ω);Z/m), through the monomial/SL homology maps, to c₂,₄ commutes with its integral Bockstein and the δ arrow to K₃ⁱⁿᵈ(Ω)[m].

Here Ω algebraically closed; m≥2 invertible; m odd or 8|m for the cited Chern product rule Weibel V.11.3.2. This sufficient cofinal set of moduli covers every prime-to-characteristic torsion order. The order-two case is covered at m=8. No mod4 product normalization is assumed.

For every infinite field F the detector D_F is injective. For algebraically closed F it is an isomorphism onto the second Tate twist. In particular the composite H₃(µ(F))→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F) is injective. The assertion concerns ordinary Tor; the enhanced-Tor exact kernel additionally uses its AHSS and extension argument.

Here F infinite; all finite root orders are prime to the characteristic.

For C₇ with generator g, the degree-three power-two action is multiplication by 4. At the finite Chern level, the weights +1 and −1 give first Chern classes u and −u and second Chern class −u². The coefficient −1 remains nonzero at m=2, and m=8 supplies the cited integral product-rule normalization for the two-primary limit. The representative end theorem `cyclic_seven_power_two` computes the map induced by the actual power-two endomorphism, with the identity coefficient map.

The source locators for these statements are Weibel, K-book VI, Definition2.1 p6; Lemma5.19 p34; Suslin 1991, Lemma5.7, p236; Weibel, K-book VI, Lemma5.19 proof and diagram, p34; Weibel, K-book V, Finite coefficients 11.3.2, p82; Suslin 1991, Lemma5.7 and Lemma5.8, pp236–237; Weibel, K-book VI, Lemma5.19, p34.

**Checks.**

- For Ω algebraically closed the detector identifies H₃(µ(Ω)) with the entire second Tate twist. The companion tensor-zero test separately excludes the ordinary tensor target.
- For F=Q, H₃(µ(Q))=H₃(C₂)=Z/2 has nonzero detected image; the square of the projection back to Tor multiplies by2 and therefore cannot serve as this detector.
- For the actual power-two endomorphism of C₇, the induced H₃ map multiplies by4, and its detector image is multiplied by4 rather than2. The example does not assume this homology calculation as a hypothesis.
- For a divisible torsion root group µ, the ordinary tensor product of its underlying additive group with itself is zero. The detector target therefore must be the Tate twist/ordinary Tor, not this tensor product.

Needs §2.1, §2.2, §2.4, §4.16, §4.17; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.19 Enhanced torsion and its root-group model

For a field F define the enhanced torsion term T̃(F) = ker(π_3^ind(BM^+) → ℤ/12), natural for all field homomorphisms. By §4.16 it is an extension 0 → μ_2(F) → T̃(F) → Tor_1^ℤ(μ(F), μ(F)) → 0, and T̃(F) ≅ Tor_1(μ(F), μ(F)) when char F = 2 (μ_2(F) = 1); that the extension does not split when char F ≠ 2 is proved in §4.19. This is Suslin's Tor_1^ℤ(μ(F), μ(F))~ with its characteristic-dependent convention, in a form in which naturality is visible.

Provide `enhancedTor` (T̃(F) = ker(π_3^ind(BM^+) → ℤ/12)); `enhancedTor.toTor` (The surjection onto Tor_1^ℤ(μ(F), μ(F)), with kernel μ_2(F)); `enhancedTor.map` (Naturality for all field homomorphisms, with map_id and map_comp).

Provide `enhancedTor.char_two` (For char F = 2, toTor is an isomorphism); `enhancedTor.nonsplit` (For char F ≠ 2 the extension does not split (a consequence of §4.19, stated there)); `enhancedTor.equivEnhancedMu` (An isomorphism T̃(F) ≅ μ̃(F), depending on a choice; no such isomorphism is natural in F).

For a finite cyclic group A of even order there is a unique nontrivial extension Ã of A by ℤ/2 (0 → ℤ/2 → Ã → A → 0, with Ã cyclic of twice the order); for A of odd order set Ã = A. The K-book defines μ̃(F) as the union of the μ̃_n(F). A union needs transition maps, and these are not canonical (an extension of A = ℤ/m, m even, by ℤ/2 has the automorphism x ↦ (1 + m)x over A and ℤ/2), so define μ̃(F) by the choice-free model μ̃(F) = {ζ ∈ F̄^× : ζ² ∈ μ(F)} in a fixed algebraic closure, with the surjection ζ ↦ ζ² onto μ(F). Its kernel is μ_2(F̄) = {±1}, so μ̃(F) is the nontrivial extension when char F ≠ 2 (μ(F) contains −1; when finite it has even order), and squaring is bijective when char F = 2, where μ̃(F) = μ(F). The group μ̃(F) is abstractly isomorphic to Tor_1^ℤ(μ(F), μ(F))~, but not naturally in F (§4.19).

Here F is a field; the roots of unity are those of F.

Provide `enhancedRootsOfUnity` (μ̃(F) = {ζ ∈ (AlgebraicClosure F)^× : ζ² ∈ μ(F)}); `enhancedRootsOfUnity.toRoots` (The surjection ζ ↦ ζ² onto μ(F), with kernel {±1} (trivial in characteristic two)); `enhancedRootsOfUnity.odd_eq` (In characteristic two the surjection is an isomorphism).

Provide `enhancedRootsOfUnity.even_card` (For char F ≠ 2 and μ(F) finite of order w, μ̃(F) is cyclic of order 2w, and the extension does not split); `enhancedRootsOfUnity.finite_eq` (For A = μ_n(F) of even order the preimage of A is the K-book's Ã); `enhancedRootsOfUnity.map` (A field embedding with a compatible embedding of algebraic closures induces an injection μ̃(F) → μ̃(E) over μ(F) → μ(E)).

Provide `enhancedRootsOfUnity.ne_tor` (μ̃(F) ≅ Tor_1^ℤ(μ(F), μ(F))~ abstractly; no isomorphism is natural in F).

For every field F, π_3^ind(BM^+) ≅ T̃(F) ⊕ ℤ/12, where T̃(F) = ker(π_3^ind(BM^+) → ℤ/12) is the enhanced torsion term (§4.19) and ℤ/12 is the image of the unit π^s_3 → π_3(BM^+); abstractly T̃(F) ≅ μ̃(F), which is the K-book's form π_3^ind(BM^+) ≅ μ̃(F) ⊕ ℤ/12.

Compare the enhanced torsion term T̃(F) = Tor_1^ℤ(μ(F), μ(F))~ (§4.19) with μ̃(F) (§4.19). (i) They are isomorphic as abstract groups: both are locally cyclic, with Tor_1(A, A) ≅ A for a locally cyclic torsion group A, and both are the nontrivial extension by ℤ/2 exactly when char F ≠ 2. (ii) No isomorphism is natural in F: an automorphism acting on μ(F) by ζ ↦ ζ^k acts on Tor_1(μ(F), μ(F)) by k² (Ex. VI.5.9(b)), so Galois groups act on T̃ through the square of the cyclotomic character and on μ̃ through the character itself. (iii) The ordinary Tor group cannot replace T̃: for F = ℚ there is no exact sequence 0 → Tor_1(μ(ℚ), μ(ℚ)) → K_3^ind(ℚ) → B(ℚ) → 0, since 2 · 6 ≠ 24.

The source locators for these statements are Weibel, K-book, Proposition VI.5.17 (PDF p. 505); Weibel, K-book, Proof of Theorem VI.5.2 (PDF p. 507); Weibel, K-book, Remark VI.5.1.2 (PDF p. 495); Weibel, K-book, Corollary VI.5.20 and its proof (PDF p. 507); Weibel, K-book, Exercise VI.5.9 (PDF p. 509); Weibel, K-book, Exercise VI.5.9(b) (PDF p. 509).

**Checks.**

- T̃(ℚ) ≅ ℤ/4, while Tor_1(μ(ℚ), μ(ℚ)) ≅ ℤ/2.
- For char F = 2, T̃(F) → Tor_1(μ(F), μ(F)) is an isomorphism.
- Complex conjugation on F = ℚ(ζ_3) acts trivially on Tor_1(μ_6, μ_6) but by inversion on μ(F) = μ_6, so T̃(F) is not naturally isomorphic to μ̃(F).
- For char F ≠ 2, T̃(F) is locally cyclic, so 0 → μ_2 → T̃ → Tor_1 → 0 does not split.
- In characteristic two, μ̃(F) = μ(F) and the squaring surjection is an isomorphism; over F₄ it exchanges the two primitive cube roots, so it is not the identity.
- For F = ℚ, μ̃(ℚ) = μ_4 is cyclic of order four while μ(ℚ) = {±1} has order two.
- For F = F_5, μ̃(F_5) = μ_8 ⊂ F_25^×, cyclic of order eight.
- For char F ≠ 2 the extension does not split: μ̃(ℚ) = μ_4 is not ℤ/2 ⊕ ℤ/2.
- For F = ℚ, Tor_1^ℤ(μ(ℚ), μ(ℚ)) ≅ ℤ/2 has order two, while μ̃(ℚ) has order four.

Needs §4.16, §4.17, §4.18; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.20 The natural infinite-field Suslin sequence

For every infinite field F there is an exact sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 (its naturality is §4.20), where T̃(F) is the enhanced torsion term of §4.19 (Suslin's Tor_1^ℤ(μ(F), μ(F))~) and B(F) is the Bloch group in Suslin's convention of Layer 3. Abstractly T̃(F) ≅ μ̃(F), which is the K-book's form 0 → μ̃(F) → K_3^ind(F) → B(F) → 0; that isomorphism is not natural in F.

Here F is infinite. Finite fields of size at least four use the separate proof in Layer 5. B(F) uses the antisymmetric tensor cokernel, and K₃^ind uses the Milnor-image quotient.

The Suslin sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 is natural for all homomorphisms of infinite fields, and the composite K_3(F) → B(F) agrees with h : K_3(F) → H_3(GL(F), ℤ) (the Hurewicz map, equivalently the composite through Layer 1's H_3(St(F), ℤ)) followed by the stable ψ of §4.14, and it vanishes on the image of K^M_3(F), so it factors through K_3^ind(F).

Here F and E are infinite fields and F → E is a field homomorphism.

The source locators for these statements are Weibel, K-book, Theorem VI.5.2 (PDF p. 495); Weibel, K-book, Proof of Theorem VI.5.2 (PDF p. 507); Weibel, K-book, VI.5.16 proof and VI.5.12.1 (PDF pp. 502, 504-505).

Needs §1.2, §2.1, §3.5, §4.8, §4.14, §4.16, §4.18, §4.19; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### Examples

The smallest frame algebra terms are S₀=ℤ, S₁=Fˣ and S₂=K₂ᴹ⊕ℤ; e=⟨1,1⟩ maps to (0,1). The projective triple stabilizer consists of scalar matrices diag(a,a). It is not diag(a,a⁻¹). On a cyclic root group C₇ the power-two map multiplies H₃ by four, exhibiting the second Tate twist. Over ℚ the enhanced kernel has order four, while ordinary Tor has order two. The equality 4·6=24 is compatible with the Suslin sequence; 2·6=24 is false.

### Dependencies

Use Layers 1–3; the group-homology and early algebraically closed K-theory contracts; and StableHomotopyKTheory H.6 for stable AHSS, stable stems and the unit splitting. The general group-module hyperhomology construction comes first in §4.1. Frame products, the Milnor retraction and the simultaneous stability induction precede the GL₂/GL₃ edge maps. The Chern normalization and closure detector precede the enhanced-Tor identification. The finite-field acyclicity replacement is supplied separately in Layer 5.

## Layer 5: Finite fields and arithmetic examples

Use the separate refined configuration argument over finite fields; the infinite-set contracting homotopy from Layer 4 is unavailable there. All coefficient localizations invert the characteristic. Arithmetic applications use the ambient K-groups in the supplier contracts and compute only their Milnor images, quotient maps and Bloch consequences.

### 5.1 Finite-field indecomposables and transfer

For every finite field F of cardinality q, including q=2,3, the canonical quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. Its group has order q²−1, imported from L.1; no Quillen model or generator is constructed here.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ.

Transport L.1’s restriction, transfer and Frobenius along the canonical quotient isomorphisms. For Fq⊂Fqᵈ: restriction is injective with image the Gal-invariants, transfer is onto, tr∘res=d, res∘tr=(q²ᵈ−1)/(q²−1), and Frobenius acts by q². The same formulas hold on K₃ⁱⁿᵈ and do not specify generators.

Here E/F is an extension of finite fields, |F|=q and [E:F]=d≥1. Restriction, transfer and Frobenius are the L.1 maps, transported through the canonical indecomposable quotient isomorphisms.

The source locators for these statements are Weibel, K-book III, III.7.2(a), p61; Weibel, K-book IV, IV.1.13, p10.

Needs §2.1; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.2 Unstable special-linear homology

Let F be finite of characteristic ℓ and cardinality q. H₃(SL₂(F),Z[1/ℓ]) is cyclic of order q²−1. For a subgroup C⊂SL₂(F) of order prime to ℓ the inclusion induces an injection on integral H₃ and H₃(C,Z) is cyclic of order |C|. GL₂(F) conjugation acts trivially on localized H₃. Integral H₃ is not asserted to have order q²−1.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ. C≤SL₂(F) is a subgroup whose order is prime to ℓ, for the subgroup assertion.

For finite Fq of characteristic ℓ, the ℓ-primary summand of integral H₃(SL₂(Fq),Z) is Z/ℓ exactly for q∈{2,3,4,5,8,9,27}, and is zero otherwise. Thus integral H₃ is abstractly Z/(ℓ(q²−1)) in these exceptional cases, and Z/(q²−1) otherwise.

Use `finite_sl2_localized_homology` for the abstract additive equivalence with ℤ/(q²−1); the construction of the canonical stabilization equivalence follows in §5.3. The abstract equivalence here does not choose a natural cyclic generator.

The source locators for these statements are Hutchinson 2013, arXiv v2, §3, Corollaries 3.6–3.7 and Lemma 3.8, pp14–15; Hutchinson 2013, arXiv v2, §3, Lemma 3.14, pp17–18.

Needs Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.3 The finite stabilization equivalence

Construct σF:H₃(SL₂(F),Z[1/ℓ])→K₃(F) from SL₂→SL∞ and the inverse stable Hurewicz identification K₃(F)/(−1·K₂(F))≅H₃(SL∞(F),Z). Finite K₂=0 and K₃ has no ℓ-primary torsion, so the integral map extends uniquely over localization. This is the actual stabilization map, not an arbitrary cyclic isomorphism.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ.

Provide `finiteStabilization` (The σF homomorphism with the specified stabilization composite); `finiteStabilization_natural` (For an embedding F→L of finite fields, σL∘H₃(SL₂(f))=K₃(f)∘σF, with the same localized coefficient ring); `finiteStabilization_unique` (A homomorphism on localized H₃ agreeing on all integral coefficient classes with stabilization equals σF).

Provide `finiteStabilization_hurewicz` (For the actual stable Hurewicz map h and the homology stabilization s, h(σF(loc z))=s(z) for every integral class z. This fixes σF as the stabilization composite, including its normalization).

The map σF is bijective for every finite field, including F₂ and F₃. The proof requires `algebraicClosureStabilization`: for Ω an algebraic closure of a finite field of characteristic ℓ, the actual map H₃(SL₂(Ω),ℤ[1/ℓ])→K₃^ind(Ω) is an isomorphism, compatibly with the finite-subfield maps. Hutchinson’s proof invokes Sah, Homology of classical Lie groups made discrete III, for this step. No exact supplier target for that unstable comparison has been identified; it is a prerequisite gap, not a consequence of equal finite cyclic orders. Consequently H₃(SL₂(F),Z[1/ℓ])≅K₃(F)≅K₃ⁱⁿᵈ(F) naturally in finite fields.

The source locators for these statements are Hutchinson 2013, arXiv v2, §3, proof of Corollary 3.9, p15; Hutchinson 2013, arXiv v2, §3, Corollary 3.9, p15.

**Checks.**

- The integral stabilization sends every characteristic-primary class to zero.
- The F₂→F₄ square commutes for the actual entrywise inclusion.
- Integral stabilization at F₅ has a nontrivial kernel; the localized map is bijective.

Needs §1.5, §2.4, §5.1, §5.2; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.4 The finite cross-ratio homomorphism

For finite F with q≥4 construct λF:H₃(SL₂(F),Z)→Bₛ(F), where Bₛ is precisely the Layer 3 Suslin kernel using the antisymmetric tensor quotient. Use Hutchinson’s refined configuration edge map followed by RB(F)→Bₛ(F). On a cyclic bar class represented by Σᵢ(1,t,tⁱ⁺¹,tⁱ⁺²), evaluate using the chain map βx,y of §6.3 and the refined cross-ratio map, then forget square classes. Degenerate tuples are handled by β, not by inserting inadmissible symbols.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. Bₛ(F) is the Layer 3 Suslin Bloch kernel in the antisymmetric tensor quotient, with no extra relation.

Provide `finiteBlochHom` (The homomorphism λF induced by the refined configuration edge map); `finiteBlochHom_natural` (Bₛ(f)∘λF=λL∘H₃(SL₂(f)) for embeddings between finite fields of cardinality at least4); `finiteBlochHom_char_torsion` (If ℓᵃz=0, λF(z)=0).

Provide `finiteBlochHom_cyclic_bar` (For a cyclic subgroup and the specified bar generator, λ equals the sum of cr(βx,y(1,t,tⁱ⁺¹,tⁱ⁺²)) in Bₛ; the result is independent of x,y).

The source locators for these statements are Hutchinson 2013, arXiv v2, §4 Theorem 4.3; §6.3–6.4 pp30–33; §7 Lemma 7.1.

**Checks.**

- The kernel for F₅ has order40, distinguishing integral H₃ from its order24 localization.
- The kernel for F₇ has order12 and the target has order4.
- The kernel for a field of cardinality4 has order6 and target order5.

Needs §3.2, §3.5, §4.1, §4.9; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.5 The finite Bloch sequence and its orders

For q≥4, Bₛ(Fq) is cyclic of order (q+1)/2 when q is odd, and q+1 when q is even. At q=2,3 the unmodified Suslin presentation instead gives Bₛ(F₂)=0 and Bₛ(F₃)=Z; these are separate presentation calculations, not instances of the finite exact sequence. The CGZ convention agrees modulo odd n through §3.16, not integrally.

Here F is a finite field with cardinality q≥4 for the cyclic order formula. The separate small-field assertions use the same Suslin presentation at F₂ and F₃.

For q≥4, factor λF through coefficient localization (its target has order prime to ℓ), obtaining λF,loc. Define bF=λF,loc∘σF⁻¹:K₃(F)→Bₛ(F). It is a natural surjection and satisfies bF∘σF∘localization=λF. The inverse of σ is canonical, so no cyclic generator enters the definition.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. σF is the actual stabilization comparison and λF the finite refined edge map followed by RB→Bₛ.

Provide `finiteK3Bloch` (bF is λF,loc∘σF⁻¹); `finiteK3Bloch_triangle` (bF(σF(localization(z)))=λF(z)); `finiteK3Bloch_natural` (Bₛ(f)∘bF=bL∘K₃(f) for finite-field embeddings).

Provide `finiteK3Bloch_surjective` (Every finite Bloch class is the image of an actual K₃ class).

For q≥4, 0→T̃(Fq)→K₃(Fq)−bF→Bₛ(Fq)→0 is natural and exact; T̃ is exactly the enhanced Tor term of Layer 4. It is cyclic of order2(q−1) for odd q and q−1 for even q. The left arrow is the homological torsion map of Hutchinson Corollary 7.5. The statement does not identify this arrow with an untwisted roots-of-unity inclusion.

Here T̃(F) and its monomial arrow are the Layer 4 enhanced Tor construction; the finite identification of this arrow is the refined-chain compatibility obligation.

The source locators for these statements are Hutchinson 2013, arXiv v2, §7 Lemma 7.4 and preceding paragraph, pp34–35; Hutchinson 2013, arXiv v2, §7 Corollary 7.5 and proof, pp35–36; Hutchinson 2013, arXiv v2, §7 Corollary 7.5, p35.

**Checks.**

- Its kernel at F₅ has order8.
- Its kernel at F₇ has order12.
- Its kernel at cardinality4 has order3.
- At q=5, integral H₃(SL₂(F₅),ℤ) has characteristic-primary information that is excluded by ℤ[1/5]; do not identify the integral group with ℤ/24.
- q=2 and q=3 remain outside this Bloch convention’s finite-field order formula.

Needs §3.4, §3.6, §3.13, §4.19, §5.2, §5.3, §5.4; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.6 Odd coefficients and the norm-one Cartan

Let q≥4 and n>0 be odd with gcd(n,q−1)=1. The actual map bF induces a bijection K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n. Both are cyclic of order gcd(n,q+1), and κ gives the same comparison with B_new. If n|q+1 they have order n. Without the gcd hypothesis this is false (q=7,n=3). These are tensor quotients of integral H₃/K₃, not group homology with Z/n coefficients.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. n is a positive odd integer with gcd(n,q−1)=1; modulo n means tensoring the integral groups with Z/n.

For a quadratic extension E/F of finite fields and a basis e:Fin2→E, let C¹=ker(N:Eˣ→Fˣ). Construct ιe:C¹→SL₂(F) by the matrix in e of multiplication by u. Its determinant is N(u)=1 and it is injective. A basis change conjugates the matrices by the actual change-of-basis element of GL₂(F). The field norm and matrix carriers are Mathlib’s; no second norm or special-linear group is defined.

Here E/F is a quadratic extension of finite fields. e is an F-linear basis of E indexed by Fin 2; C¹ is the kernel of the norm homomorphism on units.

Provide `cartanEmbedding` (The multiplication-matrix homomorphism C¹→SL₂(F)); `cartanEmbedding_toMatrix` (Its underlying matrix is LinearMap.toMatrix e e of multiplication by u); `cartanEmbedding_injective` (Equality of matrices implies equality of units).

Provide `cartanEmbedding_changeBasis` (If U=e′⁻¹∘e in coordinates then ιe′(u)=Uιe(u)U⁻¹).

Let Fq be finite with q≥4 odd, n>0 odd and n|q+1. The maps H₃(C¹,Z)⊗Z/n→H₃(SL₂(Fq),Z)⊗Z/n→K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n→B_new(Fq)⊗Z/n induced by ιe, stabilization, bF and κ are bijective. Their composite is independent of e because GL₂ conjugation acts trivially after inverting the characteristic. The result concerns H₃(C¹), not a claimed canonical identification H₃(C¹)=C¹.

Here F has odd cardinality q≥4; E/F is its quadratic extension, with an F-basis e indexed by Fin 2. n is positive and odd, and n divides q+1; all quotients mean tensoring integral homology with Z/n.

The source locators for these statements are CGZ 2023, §4.2 and Lemma 4.4, pp406–407; Hutchinson 2013, arXiv v2, §7 Corollary 7.5, p35; Hutchinson 2013, arXiv v2, §3 before Lemma 3.5, p13; CGZ 2023, §4.2 p406; CGZ 2023, §4.2 pp406–407.

**Checks.**

- The norm-one unit1 maps to the identity matrix.
- The norm-one unit−1 maps to the scalar matrix−I, including characteristic2.
- For u∈C¹ the matrix trace is u+u⁻¹, viewed in E by algebraMap.
- q=5,n=3 and q=11,n=3 satisfy the hypotheses; q=7,n=3 does not.
- A different cyclic generator must transform the bar-cycle image accordingly.

Needs §3.13, §5.1, §5.2, §5.3, §5.5; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.7 Number-field quotient applications

For a number field F, the image of K₃ᴹ(F)→K₃(F) equals the image of multiplication by [−1]:K₂(F)→K₃(F). Via Layer 2 injectivity it is (Z/2)^r₁. In particular it vanishes for totally imaginary F. All degree-three Milnor signs are imported from K2SymbolsBrauer T.2, not computed in Layer 5.

Here F is a number field; multiplication is the Quillen product with the K₁ class of−1, and the Milnor comparison preserves products.

Import K₃(Z)→K₃(Q) as an isomorphism and K₃(Q)≅Z/48 from ArithmeticKTheory N.5/N.7 (with N.8 responsible for its certified example). Bass–Tate gives K₃ᴹ(Q)=Z/2 and the Layer 2 degree-three map is injective. Its image is the unique order2 subgroup generated by {−1,−1,−1}; under any cyclic coordinate it is {0,24}. Thus K₃ⁱⁿᵈ(Q)=Z/24. This quotient extension does not split.

Here F=Q; the Milnor comparison and indecomposable quotient are those of Layer 2. The ambient K₃(Z)→K₃(Q) and cyclic structure of order48 are imported from ArithmeticKTheory N.5/N.7, not recomputed here.

For F=Q(i), use w₂(F)=24 from ArithmeticKTheory N.7/`w-invariant` and the N.5 ambient structure theorem to obtain K₃(F)≅Z⊕Z/24. Bass–Tate gives K₃ᴹ(F)=0 since r₁=0; hence the quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. The rank1 free generator exists but is not canonical; choosing a basis is distinct from constructing a Bloch-symbol generator with certified index.

Here F=ℚ(i) has r₁=0 and r₂=1. The ambient structure is N.5; the Gaussian w₂ certificate is the explicit test and proof step of N.7/`w-invariant`, using N.4’s primewise formulas. Neither requires the N.8 Gaussian example.

The source locators for these statements are Weibel, K-book III, III.7.2(c)–(d), pp61–62; Weibel, K-book VI, VI.2.1.2 p7; VI.2.2–2.3, pp8–11; VI.5.3 p24. The named targets `rational_quotient_kernel` and `rational_quotient_nonsplit` pin the reduction ℤ/48→ℤ/24: 24 is a nonzero kernel element and the additive quotient has no section.

Needs §2.1, §2.2; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.8 A real detector for the universal torsion class

Using the interval Rogers function L from Polylogarithms P.1, construct ρ:Pₛ(R)→R/(π²Z). For an admissible real generator x, set ρ([x]) equal modulo π² to L(x)−π²/6 if 0<x<1, π²/6−L(1/x) if x>1, and L(1/(1−x))−π²/3 if x<0. This is the Suslin normalization. Restricting along Bₛ(R)⊂Pₛ(R) gives the Bloch detector. No analytic function is newly defined in Layer 5.

Here Pₛ(R) is the Layer 3 Suslin pre-Bloch group on real symbols x≠0,1. L is the unshifted interval Rogers function with the normalization, reflection and ordered five-term identity specified in the P.1 request.

Provide `realRogersHom` (The homomorphism ρ on the exact Suslin real pre-Bloch presentation); `realRogersHom_pos` (For0<x<1, ρ([x])=[L(x)−π²/6]); `realRogersHom_gt_one` (Forx>1, ρ([x])=[π²/6−L(1/x)]).

Provide `realRogersHom_neg` (Forx<0, ρ([x])=[L(1/(1−x))−π²/3]); `realRogersHom_unique` (A homomorphism agreeing on every admissible symbol with those three formulas equalsρ).

The universal class c has exact order6 in Bₛ(R) and Bₛ(Q). The real detector sends c=[2]+[−1] to−π²/6 moduloπ², an element of order6. Naturality under Q→R proves the rational lower bound; the Layer 3 relation6c=0 gives the upper bound in both fields. Through the infinite Suslin sequence, K₃ⁱⁿᵈ(Q)=Z/24 and T̃(Q) has order4, so Bₛ(Q)=Z/6 and c is a generator.

Here, the fields are R and Q, with the Layer 3 Suslin Bloch group and universal class c=[x]+[1−x].

The source locators for these statements are Suslin 1991, §1 Lemma 1.6 and proof, pp219–220; Zagier 2007, II.1.A pp23–24; Suslin 1991, §1 Proposition1.1, p220; Weibel, K-book VI, VI.5.2.1 p24.

**Checks.**

- ρ([1/2])=[−π²/12].
- ρ([2])=[π²/12].
- ρ([−1])=[−π²/4].

Needs §3.4, §3.5, §3.6, §4.19, §4.20, §5.7; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### Examples

At q=5, integral H₃(SL₂) has order 120, its characteristic-localized part has order 24, B has order 3, and the two Bloch-map kernels have orders 40 and 8. At q=4 the corresponding orders are 30,15,5 and kernels 6,3. At q=7,n=3, K₃/n has order three while B/n=0, showing why the root coprimality condition matters. For ℚ, the Rogers values π²/12 and −π²/4 on [2] and [−1] sum to −π²/6, proving exact order six for c.

### Dependencies

Use Layers 1–4, KTheoryFiniteLocalFields L.1 for actual finite-field restriction and transfer, and the arithmetic contracts for the ambient number-field groups. The refined finite configuration complex, its edge map and compatibility with the monomial torsion arrow are the finite proof obligations here; no contraction by a fresh point is used for a finite set. Polylogarithms P.1 supplies only the interval Rogers function and its analytic identities. Its later Borel and p-adic regulator comparisons consume the maps already constructed.

## Layer 6: Certificates and coefficient comparisons

Certificates distinguish two tasks: proving a finite symbolic expression has zero boundary, and proving two expressions agree modulo five-term relations. A lift to K₃ exists in the ranges of Layers 4–5, with its exact ambiguity. Neither a five-term witness nor an abstract surjection supplies an executable chain-synthesis algorithm.

### 6.1 Five-term equality certificates

For a field F, a five-term certificate is a pair (a, k) of a finitely supported function a from admissible pairs — (x, y) with x, y in F − {0, 1} and x ≠ y — to Z, and an integer k. Its evaluation is Σ a(x, y) · R(x, y) + k[1] in the free abelian group on F − {0}, where R(x, y) = [x] − [y] + [y/x] − [(1 − x^{−1})/(1 − y^{−1})] + [(1 − x)/(1 − y)] is the five-term element of §3.3. A certificate is valid for ξ when its evaluation equals ξ; this is a decidable equality in the free abelian group when F has decidable equality. Certificates form an abelian group under pointwise addition, and evaluation is a homomorphism. The certificate is Suslin's normalisation (K-book VI.5.1); a certificate in CGZ's normalisation over the projective line is a different object, compared through §3.13.

Here, each pair in the list is admissible for the five-term relation.

Provide `FiveTermCertificate` (A pair (a, k): a finitely supported function a from admissible pairs to Z, and the coefficient k ∈ Z of [1]); `FiveTermCertificate.eval` (eval (a, k) = Σ a(x, y) R(x, y) + k[1] in the free abelian group on F − {0}); `FiveTermCertificate.eval_single` (eval of the indicator of (x, y) is R(x, y); eval (0, 1) = [1]).

Provide `FiveTermCertificate.eval_zero` (eval 0 = 0); `FiveTermCertificate.eval_add` (eval (c + c') = eval c + eval c'; eval (−c) = −eval c); `FiveTermCertificate.Valid` (Valid c ξ ⇔ eval c = ξ).

Provide `FiveTermCertificate.Valid.add` (Valid c ξ and Valid c' ξ' imply Valid (c + c') (ξ + ξ'); Valid c ξ implies Valid (−c) (−ξ)); `FiveTermCertificate.decidableValid` (Valid c ξ is decidable when F has decidable equality (FreeAbelianGroup.equivFinsupp, Finsupp.instDecidableEq)); `FiveTermCertificate.mem_fiveTermSubgroup_iff` (ξ lies in the five-term subgroup of §3.3 if and only if some certificate is valid for ξ).

Provide `FiveTermCertificate.map` (For a field embedding σ: F → K, map σ c has eval (map σ c) = FreeAbelianGroup.map σ (eval c); map id = id and map (τ ∘ σ) = map τ ∘ map σ); `FiveTermCertificate.Valid.modN` (Valid c ξ implies that the class of ξ vanishes in P(F)/nP(F) for every n: the transport of a relation through finite-coefficient reduction); `FiveTermCertificate.toCGZ` (A valid certificate for ξ gives a certificate for ξ in CGZ's convention, because Suslin's five-term subgroup lies in CGZ's C(F) (CGZ, proof of Lemma 2.2)).

A valid five-term certificate for the difference of two finite combinations proves that they have the same class in P(F). Conversely, if two combinations have the same class in P(F), then some valid certificate for their difference exists. Existence is not effective: no bound on the length of the certificate is claimed.

The source locators for these statements are Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, Lemma VI.5.4(a), proof (PDF p. 497); Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- eval (0, 0) = 0 and eval (0, k) = k[1]; the certificate with no pairs is valid exactly for the multiples of [1].
- Over Q, eval of the indicator of (2, 3) is [2] − [3] + [3/2] − [3/4] + [1/2].
- For x ≠ y in F − {0, 1}, the certificate with coefficient 1 on (x, y) and −1 on (1 − y, 1 − x) is valid for ([x] + [1 − x]) − ([y] + [1 − y]); a five-term formula with [x/y] in place of [y/x] fails this.
- eval is the unique additive map sending the indicator of (x, y) to R(x, y) and (0, 1) to [1].
- (x, x) and (x, 1) are not admissible pairs; the second would require the symbol of a quotient with zero denominator.
- Over Q no certificate is valid for [2]: the boundary of §3.5 kills every evaluation, but it sends [2] to 2 ∧ (−1) ≠ 0 in the antisymmetric quotient of Q^×.

Needs §3.3, §3.4; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.2 Boundary certificates and Bloch elements

Let F be a field and ξ = Σ n_x [x] a finitely supported integer combination of elements x ∈ F − {0, 1}. A vanishing-boundary certificate for ξ consists of a root of unity ζ_0 ∈ F^× with its exact order m_0 ≥ 1, elements g_1, …, g_s ∈ F^×, and for each x in the support exponent vectors e(x), f(x) ∈ Z/m_0 × Z^s with x = ζ_0^{e_0} ∏ g_j^{e_j} and 1 − x = ζ_0^{f_0} ∏ g_j^{f_j} (equalities in F). Its boundary is Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s) ≅ Z/gcd(m_0, 2) ⊕ (Z/m_0)^s ⊕ (Z/2)^s ⊕ Z^{s(s−1)/2}, with components Σ n_x e_0 f_0 mod gcd(m_0, 2), Σ n_x (e_0 f_j − e_j f_0) mod m_0, Σ n_x e_j f_j mod 2 and Σ n_x (e_j f_k − e_k f_j) for j < k. The certificate is valid when all components vanish. A valid certificate proves ∂ξ = 0 in ∧̃²F^×; if ζ_0 and the g_j generate a direct summand of F^× on which they are a basis, the converse holds.

Here F is a field; ξ is supported on F − {0, 1}. ζ_0 has exact order m_0; the displayed factorisations hold in F.

Provide `BoundaryCertificate` (The root of unity ζ_0 with its order m_0, the elements g_1, …, g_s, and the exponent vectors e(x), f(x) with their factorisation proofs); `BoundaryCertificate.boundary` (Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s), by the displayed component formula); `BoundaryCertificate.Valid` (All components of the boundary vanish).

Provide `BoundaryCertificate.decidableValid` (Validity is decidable); `BoundaryCertificate.boundary_map` (The induced map ∧̃²(Z/m_0 × Z^s) → ∧̃²F^× sends boundary to the boundary of §3.5 of the class of ξ); `BoundaryCertificate.sound` (Valid implies that the boundary of the class of ξ vanishes, so ξ defines an element of B(F)).

Provide `BoundaryCertificate.complete_of_summand` (If ζ_0, g_1, …, g_s form a basis of a direct summand of F^×, then ∂ξ = 0 implies Valid); `BoundaryCertificate.add` (Certificates over the same generators add, and the boundary is additive in ξ); `BoundaryCertificate.map` (A field embedding transports a certificate, with the same exponent vectors).

Provide `BoundaryCertificate.reduce` (A valid certificate gives vanishing of the boundary in ∧̃²F^× ⊗ Z/n and of d(ξ) in ∧²(F^×/F^{×n}), CGZ's condition for A(F; Z/nZ): the transport through finite-coefficient reduction).

Construct an element of B(F) from a finitely supported integer combination ξ of elements of F − {0} together with a proof that the boundary of the class of ξ vanishes in the antisymmetric tensor quotient ∧̃²F^×, or together with a vanishing-boundary certificate of §6.2. The construction refuses input whose boundary has not been shown to vanish in ∧̃²F^×; it does not pass to the exterior square or to another quotient where the boundary happens to die. It is Suslin's convention of Layer 3; inputs using the symbols [0] or [∞] of CGZ's convention are not accepted.

Here, the input is a finitely supported integer combination of nonzero elements of F.

Provide `ofData` (From ξ in the free abelian group on F − {0} and a proof that the boundary of the class of this ξ vanishes in ∧̃²F^×, an element of B(F)); `ofData_coe` (The image of ofData ξ h in P(F) is the class of ξ); `ofData_ext` (Two inputs with equal classes in P(F) give equal elements).

Provide `ofData_certificate` (A valid five-term certificate for ξ − ξ' proves ofData ξ h = ofData ξ' h'); `ofData_zero` (ofData 0 _ = 0); `ofData_add` (ofData (ξ + ξ') _ = ofData ξ _ + ofData ξ' _, and ofData (−ξ) _ = −ofData ξ _).

Provide `ofData_surjective` (Every element of B(F) is ofData ξ h for some input); `ofBoundaryCertificate` (The element of B(F) given by ξ and a valid certificate of §6.2; it equals ofData ξ (BoundaryCertificate.sound)); `ofData_elementC` (For x in F − {0, 1}, ofData ([x] + [1 − x]) _ = c when |F| ≥ 4 (§3.6)).

Provide `ofData_map` (A field embedding σ: F → K carries ofData ξ h to ofData (σξ) (σh); map id = id and map (τ ∘ σ) = map τ ∘ map σ); `ofData_cgz` (The comparison κ of §3.13 sends ofData ξ h to the CGZ class of ξ, regarded in the free abelian group on the projective line).

The source locators for these statements are Weibel, K-book, §VI.5, before Definition 5.1 (PDF p. 495); Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, Lemma VI.5.4(a) (PDF p. 496).

**Checks.**

- Over Q with ζ_0 = −1 (m_0 = 2), g_1 = 2: for ξ = [2] + [−1], e(2) = (0; 1), f(2) = (1; 0), e(−1) = (1; 0), f(−1) = (0; 1); the (0, 1) component is (0 − 1) + (1 − 0) = 0 and the others vanish, so the certificate is valid.
- Over Q with the same data, ξ = [2] has (0, 1) component −1 ≢ 0 mod 2, so it is not valid; since ⟨−1, 2⟩ is a direct summand of Q^×, [2] ∉ B(Q).
- Over Q(√−3) with ζ_0 = ω of order 6 and s = 0, ξ = [ω] has e = (1), f = (5) and (0, 0) component 5 ≢ 0 mod 2, so it is not valid, although its image in the exterior square vanishes; ξ = 2[ω] is valid.
- ξ = 0 with m_0 = 1 and s = 0 has a valid certificate.
- For a valid certificate, the boundary of §3.5 of the class of ξ is zero, so ofBoundaryCertificate lands in §3.5.
- Over Q the input [2] + [−1] is accepted, since 2 ∧ (−1) + (−1) ∧ 2 = 0, and the output is c.
- ofData 0 _ = 0.
- Over Q the input [2] is rejected: 2 ∧ (−1) has order two in ∧̃²Q^×. The input 2[2] is accepted.
- For x ≠ y in F − {0, 1}, the inputs [x] + [1 − x] and [y] + [1 − y] give the same element, by the certificate c_independence_certificate of §6.1.
- Over F_5 the input [3] is rejected: 3 ∧ (1 − 3) = 3 ∧ 3 is the nonzero element of ∧̃²F_5^× ≅ Z/2, although its image in the exterior square ∧²F_5^× = 0 vanishes. A constructor testing the exterior square would accept it.
- Over Q, κ(ofData ([2] + [−1])) = [0] in CGZ's B(Q), of order three (CGZ Definition 1.1: [X] + [1 − X] − [0] = 0 and 3[0] = 0; CGZ (34) with n = 3), while c has order six in B(Q).

Needs §3.1, §3.5, §6.1; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.3 Integral multiples of root symbols

Let F be a field and ζ ∈ F a root of unity of exact order m ≥ 2. Then m · ∂[ζ] = 0 in ∧̃²F^×, so m[ζ] ∈ B(F); and [ζ] ∈ B(F) if and only if ζ ∧ (1 − ζ) = 0 in ∧̃²F^×. For a primitive sixth root of unity ω one has 1 − ω = ω^{−1} and ∂[ω] = (−1) ∧ (−1), so [ω] ∈ B(F) if and only if −1 is a square in F. All statements are in Suslin's convention of Layer 3; in the exterior-square convention ∂[ω] is always zero.

Here ζ ∈ F is a root of unity of exact order m ≥ 2.

Let F be a field, ζ a primitive m-th root with m≥2, P(F) the pre-Bloch group and ∂ its boundary to Suslin’s antisymmetric square. Define rootMultiple(ζ,m)=(m[ζ], h_m) in B(F)=ker ∂, where h_m is the boundary vanishing supplied by §6.3. The reusable construction takes any abelian groups P,W, homomorphism δ:P→W, x∈P, natural m and proof δ(mx)=0, and returns (mx,h)∈ker δ. The proof is not data on which the resulting element depends. Exact order is needed only for the field specialization, not the generic kernel construction.

Here F is a field, m≥2 and IsPrimitiveRoot ζ m for the field specialization; hence ζ≠0,1. Use the antisymmetric quotient, retaining diagonal two-torsion, throughout the integral construction.

Provide `rootMultiple` (For δ,x,m,h:δ(mx)=0, return the kernel element with underlying value mx); `rootMultiple_coe` (The inclusion of rootMultiple(δ,x,m,h) into P is mx); `rootMultiple_proof_irrel` (For two proofs h,h′ of δ(mx)=0, the resulting kernel elements are equal).

Provide `rootMultiple_zero` (rootMultiple(δ,0,m,h)=0; rootMultiple(δ,x,0,h)=0); `rootMultiple_of_mem` (If b∈ker δ has underlying x, rootMultiple(δ,x,m,h)=mb); `rootMultiple_mul` (If δ(mx)=0 and δ((mk)x)=0, rootMultiple at mk is k times rootMultiple at m).

Provide `rootMultiple_map` (For f:P→P′ and g:W→W′ with δ′f=gδ, the induced kernel map sends rootMultiple(δ,x,m,h) to rootMultiple(δ′,f(x),m,h′)).

The source locators for these statements are Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, §VI.5, before Definition 5.1 (PDF p. 495); CGZ, arXiv v3 (2021), §6, final circular-unit paragraph, p33.

**Checks.**

- For δ:ℤ→ℤ/2 reduction, x=1 and m=2, the underlying rootMultiple is 2, not 1.
- For every δ and x, the kernel element built with annihilator 0 is zero.
- For b in the Mathlib additive kernel of δ and m=3, rootMultiple built from the underlying b equals 3b in that kernel.
- For δ:ℤ→ℤ/2 reduction, 1 is not in ker δ although 2 is. A constructor returning the raw symbol fails this test.

Needs §3.1, §3.5; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.4 Dividing root multiples over coefficient rings

Let δ:P→W be an additive homomorphism of abelian groups, B=ker δ, x∈P, m∈ℕ, and h:δ(mx)=0. Let R be a commutative ring and u∈R× with underlying value the image of m. Define rootCoefficient(δ,x,m,h,u)=(mx,h)⊗u⁻¹ in B⊗_ℤ R. Its image under B⊗R→P⊗R is x⊗1. This construction, without any flatness assumption, specializes for x=[ζ] to the rootClassMod (R=ℤ/n, gcd(m,n)=1), rootClassLoc (R=ℤ[1/m]) and rootClassPadic (R=ℤ_p, p∤m). It does not assert that tensoring the kernel identifies it with the kernel of the reduced boundary.

Here δ(mx)=0, R commutative and u a unit whose value is m in R. For the field specialization ζ has exact order m≥2. Coprimality or localization supplies the unit; when m is not invertible no raw coefficient class is constructed by this recipe.

Provide `rootCoefficient` (The pure tensor rootMultiple(δ,x,m,h)⊗u⁻¹ in B⊗R, for the specified unit u); `rootCoefficient_toPre` (Under the tensor of the kernel inclusion, rootCoefficient maps to x⊗1); `rootCoefficient_zero` (For x=0 and any valid denominator, rootCoefficient=0).

Provide `rootCoefficient_of_mem` (If b∈B has underlying x, rootCoefficient=b⊗1); `rootCoefficient_denominator_independent` (For two annihilating positive or zero natural numbers m,l with invertible images u,v in R, the divided tensor classes coincide); `rootCoefficient_changeRing` (For a ring map ρ:R→S, tensoring id_B with ρ sends the class to the class with unit ρ(u)).

Provide `rootCoefficient_map` (For a commuting boundary square f:P→P′,g:W→W′, tensoring its kernel map with id_R sends the class at x to that at f(x)); `rootCoefficient_specializations` (Under B⊗ℤ/n≅B/n this is rootClassMod; for ℤ[1/m] it is rootClassLoc; for ℤ_p with p∤m it is rootClassPadic, with the conventions).

The named target `nonflat_kernel_control` records the noninjective tensor of 2ℤ↪ℤ with ℤ/2, together with the failure of 2 to be a unit there.

Let ζ ∈ F be a root of unity of exact order m ≥ 2. (i) For n ≥ 1 prime to m, define ⟦ζ⟧_n ∈ B(F)/nB(F) as u · (m[ζ]) with u m ≡ 1 mod n; it does not depend on u and maps to the class of [ζ] in P(F)/nP(F). (ii) Define ⟦ζ⟧[1/m] ∈ B(F) ⊗ Z[1/m] as m[ζ] ⊗ m^{−1}; it maps to [ζ] ⊗ 1 in P(F) ⊗ Z[1/m]. (iii) For a prime p not dividing m, define the class in B(F) ⊗ Z_p in the same way. When [ζ] ∈ B(F) (§6.3) each class is the image of [ζ]; otherwise none is the image of an element [ζ] of B(F). These are the substitutes the consumers use in place of [ζ].

Here F is a field; ζ ∈ F has exact order m ≥ 2. n is prime to m, respectively p does not divide m.

Provide `rootClassMod` (⟦ζ⟧_n = u · ofData (m[ζ]) in B(F)/nB(F), for n prime to m and u m ≡ 1 mod n); `rootClassMod_indep` (⟦ζ⟧_n does not depend on u); `rootClassMod_toPreBloch` (The image of ⟦ζ⟧_n in P(F)/nP(F) is the class of [ζ]).

Provide `rootClassMod_of_mem` (If [ζ] ∈ B(F), then ⟦ζ⟧_n is the reduction of [ζ]); `rootClassLoc` (⟦ζ⟧[1/m] = m[ζ] ⊗ m^{−1} in the localisation of B(F) at the powers of m (LocalizedModule)); `rootClassLoc_toPreBloch` (The image of ⟦ζ⟧[1/m] in P(F) ⊗ Z[1/m] is [ζ] ⊗ 1).

Provide `rootClassPadic` (For p ∤ m, the class m[ζ] ⊗ m^{−1} in B(F) ⊗ Z_p); `rootClassLoc_reduce` (The image of ⟦ζ⟧[1/m] in B(F) ⊗ Z/n, for n prime to m, is ⟦ζ⟧_n); `rootClass_map` (A field embedding σ sends ⟦ζ⟧ to ⟦σζ⟧ in each of the three versions).

The source locators for these statements are CGZ, arXiv v3 (2021), §6, final circular-unit paragraph, p33; Weibel, K-book, Definition VI.5.1 (PDF p. 495); CGZ, arXiv v3 (2021), §1.2, equation (14), p. 5.

**Checks.**

- For δ:ℤ→ℤ/2 reduction, x=1,m=2,R=ℤ/5 and u=2, the image in ℤ⊗ℤ/5 is 1⊗1 and the defining tensor in B⊗ℤ/5 is (2,h)⊗3.
- The class at x=0 equals zero for every unit denominator.
- For δ:ℤ→ℤ/2 reduction, x=1,R=ℤ/5, the classes using annihilators 2 and 4 coincide; they both agree with pure tensor division in Mathlib.
- For δ:ℤ→ℤ/2 reduction and R=ℤ/2, there is a nonzero tensor in (ker δ)⊗R whose image in ℤ⊗R is zero. Thus projection to the raw tensor does not characterize an arbitrary class and 2 cannot be used as a unit denominator in this R.
- Over Q, ζ = −1, m = 2, n = 3, u = 2: 2[−1] = ⟨−1⟩ ∈ B(Q) and ⟦−1⟧_3 = 2⟨−1⟩ = 0 in B(Q)/3B(Q).
- Over Q(ζ_12), where [ω] ∈ B(F), ⟦ω⟧_5 is the reduction of [ω].
- Over Q(√−3), ⟦ω⟧_5 is defined but is not the reduction of an element [ω] of B(F), because ∂[ω] = (−1) ∧ (−1) ≠ 0.
- m · ⟦ζ⟧[1/m] equals the image of ofData (m[ζ]) in the localisation of B(F) at the powers of m.
- The choices u and u + n give the same ⟦ζ⟧_n.

Needs §3.4, §3.5, §6.2, §6.3; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.5 Suslin fibres and finite bar witnesses

For an infinite field F write the imported exact sequence as 0→T(F) --i→ K₃^ind(F) --q→ B(F)→0, with T(F) the enhanced Tor term in Layer 4. For β∈B(F), define SuslinLift(q,β)={k∈K₃^ind(F) | q(k)=β}. It is a nonempty fibre; T acts freely and transitively by k↦k+i(t). This is a torsor of witnesses, without a distinguished origin. For the generic API, q:K→B and i:T→K are homomorphisms of abelian groups, q surjective, i injective, and im i=ker q. The fibre definition itself needs only q and β.

Here F infinite for the source cited here; the separately justified finite-field comparisons are reused in their own ranges. The torsor statements use exactness, including the enhanced two-primary extension, not ordinary Tor or a chosen direct sum decomposition.

Provide `SuslinLift` (The fibre subtype of q at β); `SuslinLift.ofRep` (Given k and q(k)=β, produce a witness); `SuslinLift.over` (Every witness has q(value)=β).

Provide `SuslinLift.ext` (Two witnesses are equal iff their underlying K-elements are equal); `SuslinLift.choose` (Surjectivity of q provides a noncomputable witness for each β; no additivity or naturality of choose is asserted); `SuslinLift.translate` (For t∈T and q∘i=0, translate k by i(t) within the same fibre).

Provide `SuslinLift.translate_zero_add` (Translation by 0 is the identity and successive translations by t and s equal translation by s+t); `SuslinLift.unique_difference` (When i is injective and im i=ker q, for witnesses a,b there is a unique t∈T with b.value=a.value+i(t)); `SuslinLift.map` (For f:K→K′,g:B→B′ with q′f=gq, map a witness above β to the witness with representative f(k) above g(β)).

Provide `SuslinLift.map_id_comp` (The fibre maps respect identity maps and composition of commuting squares).

Let F be infinite, G=St(F) the imported stable Steinberg group, A the trivial integral representation, and ψ:H₃(G,ℤ)→B(F) the composite H₃(St(F),ℤ)≅K₃(F)→K₃^ind(F)→B(F). For β∈B(F), define BarLiftCertificate(ψ,β)={z∈Z₃(G,ℤ) | ψ(π(z))=β}. Here Z₃ and π are Mathlib’s cycles and their projection to homology. The underlying chain is a finitely supported integral function on triples (equivalently Fin 3→G), with bar boundary [g|h|k]↦[h|k]−[gh|k]+[g|hk]−[g|h]. Its data are a finite chain, proof its boundary vanishes, and proof its homology image is β. This does not include an algorithm producing a chain from a five-term certificate.

Here, the field-specific ψ and its surjectivity come from Layers 1 and 4. The witness type itself is defined for any group G and supplied ψ to any abelian B. Use the unnormalized inhomogeneous bar complex with trivial integral coefficients. A proof that a pre-Bloch symbol combination has boundary zero and a bar cycle are different kinds of certificate.

Provide `BarLiftCertificate` (The subtype of actual degree-three cycles z with ψπ(z)=β); `BarLiftCertificate.chain` (Include the witness cycle into Mathlib’s finite-support chain module); `BarLiftCertificate.cycle_eq` (The differential of chain(c) is zero).

Provide `BarLiftCertificate.homology` (The homology representative is π(cycle(c)) in the imported H₃); `BarLiftCertificate.over` (ψ(homology(c))=β); `BarLiftCertificate.ofCycle` (Given z∈Z₃ and ψπ(z)=β, construct the witness; the standard cyclesMk constructor accepts a finite chain and its zero-boundary proof).

Provide `BarLiftCertificate.ofChain` (Given a finite chain z∈C₃, a proof d₃z=0 and a proof ψπ(cyclesMk(z))=β, construct the witness using Mathlib’s cyclesMk with indices 3,2. No chain synthesis is asserted); `BarLiftCertificate.ofChain_chain` (The chain projection of ofChain(z,h_cycle,h_target) equals z, including its finite support; the constructor does not quotient chains by boundaries); `BarLiftCertificate.ext` (Witnesses are equal iff their underlying cycles are equal, equivalently iff their chains are equal).

Provide `BarLiftCertificate.addBoundary` (For w∈C₄, replacing z by z+d₄w is a witness above the same β and has the same homology representative); `BarLiftCertificate.choose` (If ψ is surjective, classical choice and the surjectivity of π provide a witness over every β. This API has no executable or functorial-choice guarantee); `BarLiftCertificate.map` (A map of cycle modules compatible with ψπ maps witnesses over β to witnesses over the image of β; the maps induced by group/field maps are those from Layer 1).

Provide `BarLiftCertificate.map_id_comp` (Maps of witness fibres respect identity and composition).

Let F be an infinite field and β an element of B(F) produced by §6.2. Then there is a class z ∈ H_3(GL_3(F), Z) with ψ(z) = β, and a class k ∈ K_3(F) ≅ H_3(St(F), Z), represented by a bar 3-cycle of the stable Steinberg group, whose image under K_3(F) → K_3^ind(F) → B(F) is β. The class z is determined up to the image of H_3(M_2, Z) ⊕ H_3(T_3, Z), and k up to the kernel of K_3(F) → B(F), which is the inverse image of T̃(F) under K₃(F)→K₃^ind(F), and fits into 0→K₃ᴹ(F)→ker(K₃(F)→B(F))→T̃(F)→0; a five-term certificate relating two inputs changes the lift only within this ambiguity. The statement is existence: no source read constructs an explicit bar cycle from a certificate.

Here F is an infinite field, as in §4.14 and §4.8.

The finite-chain existence theorem is `BarLiftCertificate.exists_of_surjective`: surjectivity of the specified homology map and of the cycles projection gives a witness. The latter surjectivity is a quotient property, so it neither chooses a natural lift nor supplies a chain-search algorithm. The named boundary targets `finite_lift_nonsplit`, `BarLiftCertificate.trivial_nonzero` and `BarLiftCertificate.trivial_boundary` record, respectively, the lack of a section of ℤ/24→ℤ/6, the empty nonzero fibre for a trivial group, and its nonzero chain [1|1|1] above zero.

The source locators for these statements are Weibel, K-book VI, Theorem VI.5.2, p23; Weibel, K-book VI, VI.5.12, p29, together with the Layer 1 homological model; Hutchinson 2024, §2.1, bar resolution and its differential, p2; Weibel, K-book, Proposition VI.5.12 (PDF p. 502); Weibel, K-book, Remark VI.5.12.1 (PDF p. 502); Weibel, K-book, Lemma VI.5.6, proof (PDF p. 498).

**Checks.**

- For every additive q, 0 with q(0)=0 is an element of SuslinLift(q,0).
- For q:ℤ/24→ℤ/6 reduction, the fibre over 1 has cardinality 4 and underlying representatives 1,7,13,19.
- For β=0 and q:K→B, the underlying representatives are exactly Mathlib’s additive kernel q.ker.
- The reduction ℤ/24→ℤ/6 has no additive section. Fibre nonemptiness cannot justify an additive canonical choice of lifts.
- The certificate of the zero cycle above 0 has zero chain and zero homology representative.
- For any c and four-chain w, the witness addBoundary(c,w) has the same image under Mathlib’s homology projection π as c.
- For the trivial group and any ψ:H₃(1,ℤ)→B, no witness exists over β≠0, because H₃(1,ℤ)=0.
- For the trivial group, the single chain [1|1|1] with coefficient 1 is a cycle representing zero homology. It is a witness above 0 distinct as a finite chain from the zero witness. Thus equality of homology must not be used as extensionality of witnesses.
- For any group G and g≠1, the single chain [g|1|1] with coefficient 1 is not the chain of any witness, over any β. Its boundary is [1|1]−[g|1]≠0. This catches a constructor that omits the cycle equation.

Needs §1.2, §1.3, §2.1, §4.8, §4.14, §4.20, §6.1, §6.2; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.6 Integral, rational and finite quotients

For |F|≥4, combine the infinite-field theorem and the separate finite-field theorem to obtain the natural integral sequence 0→T̃(F)→K₃^ind(F)→B(F)→0. Its left term is enhanced Tor, with an abstract root-group model but weight-two naturality. Over ℚ the sequence is 0→ℤ/4→ℤ/24→ℤ/6→0 and does not split. For the published CGZ group use the surjection κ_new:B(F)→B_new(F), whose kernel is B∩H and is killed by two. For the older exterior convention κ_old is the composite B→B_new↪B_old and may fail to be either injective or surjective. Replacing B by one of these groups integrally changes the sequence; there is no universal replacement of its enhanced-Tor kernel by ordinary Tor or by an untwisted root inclusion.

Here F is a field with at least four elements.

For |F|≥4, tensoring the integral Suslin sequence with ℚ gives the canonical isomorphism K₃^ind(F)⊗ℚ≃B(F)⊗ℚ. Both κ_new and κ_old become isomorphisms after inverting two and hence over ℚ. For number fields, the Milnor image is finite, so K₃(F)⊗ℚ→K₃^ind(F)⊗ℚ is also an isomorphism, of dimension r₂. For arbitrary fields one must first take the indecomposable quotient; no rational vanishing of K₃ᴹ(F) is assumed.

Let |F|≥4 and n≥1. The snake sequence for multiplication by n is exact: 0→T̃(F)[n]→K₃^ind(F)[n]→B(F)[n]→T̃(F)/n→K₃^ind(F)/n→B(F)/n→0. In particular the last map is onto, with kernel the image of T̃(F)/n. If n is odd and μ(F)⊗ℤ/n=0, that kernel vanishes, giving an isomorphism. For odd n, κ_new and κ_old each give isomorphisms on tensor quotients by n. For a number field, K₃(F)/n→K₃^ind(F)/n is an isomorphism at odd n, since the Milnor image has exponent two. Thus for a number field F and odd n, if F contains no primitive p-th root for each prime p|n, K₃(F)/n≃B(F)/n≃B_new(F)/n≃B_old(F)/n. These are induced maps, not chosen cyclic identifications. They require the root hypothesis; no such identification is asserted for even n.

Here F is a field with at least four elements; n is a positive integer. For the isomorphisms: n odd and µ(F) ⊗ Z/n = 0; for a number field, F contains no primitive p-th root of unity for p | n.

The source locators for these statements are Weibel, K-book, Theorem VI.5.2 (PDF p. 495); Weibel, K-book, Remark VI.5.2.1 (PDF p. 496); CGZ, arXiv v3 (2021), Definition 1.1 and its remarks, p. 2; CGZ, arXiv v3 (2021), §2.5, proof of Theorem 2.11, p. 15; CGZ, arXiv v3 (2021), Lemma 4.4 and its proof, pp. 24-25.

Needs §2.1, §2.3, §2.5, §3.13, §4.19, §4.20, §5.5, §5.7; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.7 Genuine finite-coefficient comparison

First construct `finiteChernIndEquiv` for every field E and integer n≥2 invertible in E: the second Chern map induces K₃(E;ℤ/n)^ind≃H¹(E,μ_n^⊗2), where the superscript denotes the quotient by the image of K₃ᴹ(E)/n under the integral comparison followed by the coefficient map. Require its evaluation on representatives and naturality under field embeddings with the same invertible n. The n=1 groups are zero. The map construction is MotivicEtaleKTheory M.8/`finite-etale-chern`; the isomorphism is a target here, following Levine, Theorem 4.12, pp.335–336, as restated in Hutchinson 2024, Theorem 2.10, p.4. Levine reduces to prime coefficients and a field containing the roots of unity, then uses the relative-K₃/Chern ladder and Theorem 4.11 for the degree-two relative term; the general coefficient theorem precedes the number-field specialization. For a number field and odd n, Bass–Tate gives K₃ᴹ(E)/n=0, so this is an isomorphism on the full finite-coefficient group, even when μ_n is not contained in E.

**Checks.**

- At n=1 the coefficient and étale groups vanish; no primitive-root choice carries extra data.
- For a number field and odd n, the real-sign Milnor group is killed by tensoring with ℤ/n, so the quotient map to the indecomposable coefficient group is an isomorphism.
- At an even n for a field with real places, this argument does not erase the Milnor image; the general comparison retains its indecomposable domain.

Let F be a number field, p an odd prime, a≥1, n=p^a and p∤w₂(F). Use the imported finite-coefficient Quillen group K₃(F;ℤ/n), whose exact sequence is 0→K₃(F)/n --j_K→ K₃(F;ℤ/n) --∂_K→ K₂(F)[n]→0. Use the Habiro-owned CGZ étale Bloch group B_new(F;ℤ/n), with its exact sequence 0→B_new(F)/n --j_B→ B_new(F;ℤ/n) --δ_B→K₂(F)[n]→0. The finite Chern isomorphism c̄₂,₁:K₃(F;ℤ/n)≅H¹(F,ℤ/n(2)) and the CGZ isomorphism R_ζ:B_new(F;ℤ/n)≅H¹(F,ℤ/n(2)), transported through the same chosen twist/Kummer convention for a primitive n-th root ζ, give Φ_ζ=R_ζ⁻¹∘c̄₂,₁. In the additional range n prime to M_F of Habiro HB.1, write R_ζ∘κq=c_ζ^γ on K₃(F)/n using HB.2’s Chern comparison. Then Φ_ζ∘j_K=j_B∘(γ⁻¹κq), with multiplicative powers interpreted as scalar multiplication on the additive target. No assertion δ_BΦ_ζ=∂_K is made without checking the right-hand normalization. In particular Φ is not asserted to extend the unscaled Suslin map.

Here F is a number field, n=p^a, p is odd, a≥1 and p∤w₂(F). Choose the same primitive n-th root ζ and twist/Kummer convention for both supplied equivalences. The formula on the modulo subgroup additionally requires n prime to the Habiro comparison constant M_F. The finite Chern equivalence is the preceding `finiteChernIndEquiv` specialization; M.8 supplies its underlying map, and no regulator theorem is used to prove it.

Provide `finiteCoefficientBlochEquiv` (For genuine additive equivalences c:K≃H and r:E≃H, the resulting Φ:K≃E is r⁻¹c. For the field specialization, c is the supplied finite Chern equivalence and r is the supplied R_ζ equivalence); `finiteCoefficientBlochEquiv_spec` (r(Φ(x))=c(x), and Φ⁻¹(y)=c⁻¹(r(y)). The first equation uniquely characterizes Φ); `finiteCoefficientBlochEquiv_def` (The generic construction is exactly Mathlib’s AddEquiv composition c.trans r.symm).

Provide `finiteCoefficientBlochEquiv_on_quotient` (For n-torsion modules L,H, a linear map h₀:L→H, a unit γ∈ℤ/n, and homomorphisms j_K:L→K,j_B:L→E satisfying c j_K=h₀ and r j_B=γh₀, one has Φ j_K(x)=j_B(γ⁻¹x). This is the field restriction after L=K₃(F)/n is identified with B_new(F)/n); `finiteCoefficientBlochEquiv_natural` (Given supplied equivalences c′:K′≃H′,r′:E′≃H′ and homomorphisms f:K→K′,g:E→E′,h:H→H′ with c′f=hc and r′g=hr, one has Φ′f=gΦ. Field-extension naturality uses exactly these supplied commuting comparisons in their common good-prime range).

In the arithmetic acceptance case F=ℚ,n=5, K₃(ℚ)/5=0, whereas the coefficient Bloch class [32] has K₂-boundary {2,−31}; five times this symbol is {32,−31}=0 by Steinberg, and its tame residue at 31 is 2∈F₃₁ˣ, of exact order five. Thus K₂(ℚ)[5] is nonzero and the genuine finite-coefficient middle group cannot be replaced by the ordinary quotient. For this test use the tame-symbol convention ∂ᵥ{u,π}=ū, which fixes the order of the two entries.

The source locators for these statements are Hutchinson 2024, §2.3, Theorem 2.10 and the universal coefficient sequence, p4; CGZ, arXiv v3 (2021), §6, equations (37)–(38), pp32–33.

**Checks.**

- In K=E=H=ℤ/5, let c(x)=2x and r(x)=3x. Then Φ(1)=4. Reversing the equivalences gives the wrong answer.
- For K=E=H=ℤ/1 and any supplied equivalences, Φ(0)=0.
- For actual Mathlib additive equivalences c,r, Φ equals c.trans r.symm, including its inverse map c⁻¹r.
- The exact sequence 0→0→ℤ/5→ℤ/5→0 has middle group not isomorphic to its left group: there is no additive equivalence ℤ/1≃ℤ/5. This tests the finite-coefficient K₂-term distinction in a finite model; the arithmetic acceptance instance is F=ℚ,n=5 and [32].

Needs §2.3, §3.13, §3.16, §6.6; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### Examples

Over ℚ the single five-term relation at (2,3) has arguments 2,3,3/2,3/4,1/2. A boundary certificate accepts [2]+[−1] and rejects [2]. For a primitive sixth root ω in ℚ(√−3), [ω] fails the integral boundary test while 2[ω] passes it. Dividing a root multiple over ℤ/5 is valid only with a unit denominator. The fibre of ℤ/24→ℤ/6 over 1 is {1,7,13,19}; choosing one representative cannot define an additive section. Finally c(x)=2x and r(x)=3x on ℤ/5 give r⁻¹c(1)=4.

### Dependencies

Use Layers 1–5 and Mathlib finite supports, kernels, tensor maps and coefficient rings. Only the final genuine finite-coefficient application uses HabiroNumberFields HB.1–HB.2, after `finiteChernIndEquiv` has been constructed from the early M.8 map. Its K₂[n] extension and comparison scalar are distinct from the integral Suslin sequence and the ordinary tensor quotient. Analytic regulator agreement remains with Polylogarithms P.2, BorelRegulators R.7 and PadicHodgeRegulators D.2.

## Downstream consumers

ArithmeticKTheory N.8 consumes the real-sign Milnor subgroup, the indecomposable quotient, and the rational and Gaussian quotient calculations. BorelRegulators R.7 and Polylogarithms P.2 consume the normalized K₃-to-Bloch map for their real regulator comparison; the analytic scalar belongs to those roadmaps. PadicHodgeRegulators D.2 consumes the integral maps, coefficient classes and exact kernel before its syntomic comparison. HabiroNumberFields HB.1–HB.2 consumes the convention maps, finite-field Cartan calculation and root classes. Its quantum comparison returns the scalar used only in §6.7. The all-curve Goncharov kernel does not disappear through one of these consumer comparisons.

## References

- Charles A. Weibel, [*The K-book*, combined author draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1 and VI.4–VI.5. “PDF p.” for this volume counts from its first page. Separate author chapters [III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), [IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), [V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) and [VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) have their own chapter pagination. The locators distinguish those editions.
- A. A. Suslin, [*Homology of GLₙ, characteristic classes and Milnor K-theory*](https://www.mathnet.ru/eng/tm2280), Trudy Mat. Inst. Steklov. 165 (1984), 188–204, especially §§1–3 and Theorem 3.4. Page numbers refer to the Russian version of record.
- A. A. Suslin, [*K₃ of a field, and the Bloch group*](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf), Proc. Steklov Inst. Math. 183 (1991), 217–239, §§1–2 and 5.
- Kevin Hutchinson, [*A Bloch–Wigner complex for SL₂*, arXiv:1107.0264v2](https://arxiv.org/abs/1107.0264v2), §§3–4 and 6–7. All locators to this work use the preprint pagination, not the journal pagination.
- Marc Levine, [*The indecomposable K₃ of fields*](https://numdam.org/item/10.24033/asens.1585.pdf), Ann. Sci. ENS 22 (1989), 255–344, Theorems 4.11–4.12, pp.334–336.
- Kevin Hutchinson, [*The Chern class for K₃ and the cyclic quantum dilogarithm*, arXiv:2104.14413v4 (2024)](https://arxiv.org/abs/2104.14413v4), §2.3, Theorem 2.10, p.4.
- Frank Calegari, Stavros Garoufalidis and Don Zagier, [*Bloch groups, algebraic K-theory, units, and Nahm’s conjecture*, arXiv:1712.04887v3 (2021)](https://arxiv.org/abs/1712.04887v3), Definitions 1.1 and 2.1 and §6. This is the older exterior presentation, read with the explicit intersection repair in §3.13. It differs from the [published author copy](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), Ann. Sci. ENS 56 (2023), 383–426, Definition 2.1 and Lemma 2.2, p.391; §4.2–4.3, pp406–407; §6, pp414–416. Published locators use printed journal pages.
- Alexander B. Goncharov, [*Geometry of configurations, polylogarithms, and motivic cohomology*](https://sasha-goncharov.github.io/Advances1995.pdf), Adv. Math. 114 (1995), 197–318, §§1.8–1.9 and 2.3. The all-curve relation-equality assertion is conditional, as specified at Conjecture 1.20, p.225.
- Spencer Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves*, CRM Monograph Series 11 (2000), Lecture 6, §6.1, p.43, (6.1.2), is a proposed, unverified locator for the full-tensor convention. The explicit kernel, obstruction and six-torsion comparisons here are algebraic consequences of the displayed definitions and five-term relations; no unavailable theorem of the monograph is an input.
- Don Zagier, [*The Dilogarithm Function*](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), in *Frontiers in Number Theory, Physics, and Geometry II* (2007), Appendix II.1.A, pp23–24, for the Rogers normalization.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), §4.2, Examples 4.51–4.52, pp380–381, and Exercise 37, p392, for the Hopf and Whitehead input at its topological owner.
