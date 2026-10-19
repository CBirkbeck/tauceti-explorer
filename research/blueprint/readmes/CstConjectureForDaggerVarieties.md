# The C_st-conjecture for dagger varieties

The roadmap constructs the analytic fundamental diagram, measures its failure by cohomology of modified Fargues–Fontaine bundles, and proves comparison for the classes established by Colmez–Nizioł. For a small variety, the comparison is equivalent to acyclicity of the filtered Hyodo–Kato modules, nonpositive curvature of pro-étale cohomology, and the height identity. The arithmetic recovery theorem retains Frobenius, monodromy, Galois descent and the Hodge filtration. The geometric theorem recovers extended period modules from the natural Topological Vector Space functor.

This is a target-level formalisation plan. All six layers are **planned**, none is closed, and all mathematical implementation statuses are **unchecked**. Supplier contracts and proof gaps are part of the plan; they are not proved assumptions. The unrestricted smooth-dagger assertions in Conjectures 6.21 and 9.1, and universal small-variety acyclicity, remain open in the source. In particular, this roadmap does not claim that the general C_st-conjecture is proved.

The main source is Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*, Duke Mathematical Journal 174 (2025), 2203–2301, [DOI](https://doi.org/10.1215/00127094-2024-0074). Locators below refer to the [61-page author manuscript CN5](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), compiled 24 November 2024, also checked against [arXiv v4](https://arxiv.org/abs/2108.12785v4). The publisher text was not consulted. Source findings apply to those author/arXiv versions and require journal collation. Every statement here is formulated in the roadmap’s own words.

The tube comparisons also use Elmar Grosse-Klönne, *De Rham cohomology of rigid spaces*, Mathematische Zeitschrift 247 (2004), 223–240, in the [public arXiv v1 text](https://arxiv.org/pdf/1408.3330v1). Its Proposition 3.7 and Corollary 3.8, pp.14–16 in that text, give unfiltered de Rham invariance. The lattice argument below records the weaker filtration compatibility needed here.

The [packet](../packets/CstConjectureForDaggerVarieties.json) records the dependency graph, source accounting and exact supplier requests. The [suggested Lean file](../suggested/CstConjectureForDaggerVarieties.lean) contains only checks expressible using existing pinned carriers. The reader is definitive: the missing dagger, modified-bundle, qBC and derived period objects are mathematical targets here, and are not replaced by abstract assertion parameters in Lean.

## Boundary and build order

Generic p-adic period rings, arithmetic filtered HN modules and the contravariant smooth-Galois period functors remain in PadicHodgeTheory R06.1–R06.2. The curve, vector bundles, classification, H⁰/H¹ and finite BC geometry remain in VectorBundlesAndIsocrystals VB0–VB3. The current upstream AlgebraicVectorBundles and AdicSpaces documents were read, including their Suggested declarations; their constructions are imported, not re-planned. The new filtered-module object adds a C-valued lattice to those existing coefficients, and its bundle target constructs a particular modification rather than defining vector bundles again.

Dagger spaces and de Rham complexes remain in AdicSpacesPartII F1. The read finiteness/Künneth nodes there have discretely valued bases, and its resolution lemma has affinoid scope; the C-valued and proper-pair extensions used here are explicit gaps. CP.4 supplies its named algebraic comparison node, while its present scope does not supply model-free analytic HK/syntomic cohomology. General Pairs and qBC require the proposed vector-bundle Part II, whose stages are not yet defined. L0 supplies strict derived categories and qualified nonarchimedean duality. Its missing extension-duality hypotheses are retained, and no dependency on the unrelated noncommutative distribution-algebra Part II is introduced.

| Layer | Construction and exit criterion |
| --- | --- |
| CS.0 | C-lattice filtered modules, their modifications, acyclicity and bounded period Hom |
| CS.1 | Natural fundamental square, smallness, twists, proper/affinoid/Stein cases |
| CS.2 | Two bundle-cohomology failure terms, canonical qBC filtration, height and equivalent criteria |
| CS.3 | Products, algebraic analytifications, almost proper varieties and specified tube applications |
| CS.4 | Countable-exhaustion obstructions, proper-factor Künneth and proper-times-Stein comparison |
| CS.5 | Arithmetic and geometric recovery, with the stronger positive crystalline affinoid target separately qualified |

The splitting targets at the end of CS.2 form a separate branch. Their G-FA obligation is not used to prove geometric comparison or the main recovery theorems. CS.4 supplies a non-small comparison case; CS.5 does not infer a finite-rank recovery theorem for every space covered by CS.4.

## Conventions
1. p is prime. K is complete discretely valued of characteristic zero, with perfect countable residue field k of characteristic p; F=W(k)[1/p], Fⁿʳ is its maximal unramified extension inside K̄, and C is the completion of K̄. All analytic spaces are separated, taut and countable at infinity, as in §1.3.3, pp.7–8. A completed unramified coefficient field is used only where explicitly stated, never silently substituted for Fⁿʳ.

2. Nφ=pφN. Period tensors use diagonal operators; the imported B_st coordinate has N=−d/du. Every monodromy-untwisting formula must be adjusted to that sign. t has φ(t)=pt, and {−r} on HK multiplies φ by p⁻ʳ. Derived joint invariants, derived completed tensors, and natural locally convex Q_p topologies are part of the analytic input.

3. LH(C_Q_p) is the abelian left heart of the strict derived category of locally convex Q_p spaces. Tildes refer to left-heart cohomology; untilded groups are its classical part. VS is the source’s Vector Space functor category, TVS is the functor category of Definition 4.1: functors from sympathetic algebras into LH(C_Q_p), with uniform boundedness for algebra maps. Its morphisms are natural transformations. Evaluation at C is an ordinary locally convex space only for classical objects, and arbitrary continuous maps on C-points are not TVS morphisms. The change from VS to TVS needs its precise comparison theorem.

4. FilʳHⁱ means the image of Hⁱ(FʳRΓ) in Hⁱ(RΓ); Fʳⁱ denotes the former group itself. The kernel Aʳⁱ is often large and torsion. The square has u=(a,b) and v=(c,−d). Finite BC height is signed, qBC height extends it, and ht(Q_p)=1 while a reasonable torsion B_dR⁺-Pair has height zero.

5. For small X the induced F⁰ lattice in Hⁱ_dR(X/B_dR) defines the filtered HK bundle. Smallness requires finite free B_dR⁺ cohomology in every degree. General Conjectures 6.21 and 9.1 are not promoted to unconditional theorem targets.


The natural TVS functor and its natural transformations are indispensable in the geometric theorem. In particular, Hom_TVS is not arbitrary continuous Q_p-linear Hom on a single cohomology group. Definition 4.1, p.20, specifies a functor on sympathetic algebras valued in the abelian left heart, with a boundedness condition on algebra maps; Definition 4.5, pp.21–22, specifies qBCs. These imported definitions are included in G-QBC, not owned again here.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The six exact baseline declarations read are BDeRhamPlus, BDeRham, CategoryTheory.BicartesianSq, Module.Free, Module.Finite and ModuleCat. The first two provide ring carriers under their stated completeness assumptions; they do not prove field/DVR properties. BicartesianSq is reused in the left heart, without a new square predicate. The library audit and direct pinned/current searches are recorded in the packet.


## CS.0 — Filtered period modules and modified bundles

Build the C-lattice version of filtered (φ,N)-modules on the imported coefficient objects; attach its modified bundle and acyclicity criteria. Prove bounded eigenspace generation and the three period-Hom comparisons needed for recovery. Generic arithmetic filtered HN theory and period functors are imported.

**Layer dependencies.** `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`, `VectorBundlesAndIsocrystals:VB0`, `VectorBundlesAndIsocrystals:VB1`, `VectorBundlesAndIsocrystals:VB2:classification`, `VectorBundlesAndIsocrystals:VB3:general-BC`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`.


### Filtered modules with a de Rham lattice

**Target `CS.0/filtered-module-c` (definition).** A filtered (φ,N)-module over C is a pair (M,L): M is finite dimensional over Fⁿʳ, φ is a bijective σ-semilinear map, N is Fⁿʳ-linear with Nφ=pφN, and L is a finite free B_dR⁺-submodule of M⊗B_dR spanning that module after inverting t. Morphisms are φ,N-equivariant maps carrying L into L′. The topology and period embeddings are the imported ones; C is not embedded canonically in B_dR⁺.

**Source.** CN25, §5.3.1, p. 36. Defines the C-valued filtration by a lattice rather than by a filtration of a C-vector space.

**Prerequisites.** `PadicHodgeTheory:R06.2/plan/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.1/plan/semistable-period-ring`, `mathlib:BDeRhamPlus`, `mathlib:BDeRham`.

**Construction/proof.**

1. Use the existing finite Frobenius–monodromy coefficients over Fⁿʳ; add only the lattice datum.
2. Use localization to express spanning and the induced period-linear morphism.

**Uses that determine the API.**

- CN25, Definition 5.13 and Remark 5.14: Attaches slopes and exactness criteria.
- CS.2 and CS.5: Receives filtered Hyodo–Kato cohomology and supports period reconstruction.

**API.**

- `FilteredModuleC.mk` (constructor): Construct (M,L) from the stated operator and full-lattice data.
- `FilteredModuleC.ext` (extensionality): A morphism is determined by its Fⁿʳ-linear map on M.
- `FilteredModuleC.lattice` (projection): The lattice includes into M⊗B_dR and localizes isomorphically.
- `FilteredModuleC.tensor` (structure): Tensor uses diagonal operators and L⊗L′; dual uses the B_dR⁺-dual lattice.
- `FilteredModuleC.ofFilteredK` (compatibility): A filtered module with smooth descent over K gives L=Fil⁰(M_K⊗B_dR), with convolution filtration, after extension to Fⁿʳ.
- `FilteredModuleC.map_comp` (functoriality): Extension to period modules preserves identity and composition.

**Unit tests.**

- `FilteredModuleC.zero`: The zero module with zero lattice is an object of rank zero.
- `FilteredModuleC.rank_one_shift`: For M=Fⁿʳ, φ=σ, N=0, every tᵐB_dR⁺, m∈Z, is a full lattice; changing m changes the embedded lattice.
- `FilteredModuleC.not_lattice`: The zero submodule of B_dR is not a lattice in the rank-one trivial module.

**Check.** Identity and composition preserve the lattice. No Galois action is required over C.

**Atlas planet.** Filtered (φ,N)-modules over C.


### The bundle of a filtered module

**Target `CS.0/modified-bundle` (construction).** Associate E(M,L) on the geometric Fargues–Fontaine curve by gluing the finite projective B_e-module (M⊗B_st)^{N=0,φ=1} away from ∞ to L at the completed local ring B_dR⁺, using their common B_dR-realization. Put V_st(M,L)=H⁰(E), equivalently the kernel of (M⊗B_st)^{N=0,φ=1}→(M⊗B_dR)/L. These are actual coherent bundles and section functors, not arbitrary modules labelled as bundles.

**Source.** CN25, §5.3.1, p. 36. Characterizes the modification by its punctured sections and its completed lattice.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/filtered-module-c`, `VectorBundlesAndIsocrystals:VB1`, `PadicHodgeTheory:R06.1/plan/semistable-period-ring`.

**Construction/proof.**

1. Apply the imported modification/gluing theory for bundles with a B_dR⁺ lattice.
2. Identify H⁰ with the equalizer of the two restriction maps.

**Uses that determine the API.**

- CN25, Remarks 5.14–5.16: Converts slope bounds into surjectivity.
- CN25, Theorem 8.1: Transfers tensor and lattice-enlargement arguments to coherent sheaves.

**API.**

- `FilteredModuleC.bundle_restrict` (characterisation): The punctured restriction has section module (M⊗B_st)^{N=0,φ=1}.
- `FilteredModuleC.bundle_complete` (characterisation): Completion at ∞ is L with its inclusion into M⊗B_dR.
- `FilteredModuleC.bundle_map` (functoriality): A morphism induces a bundle map; identity and composition agree.
- `FilteredModuleC.sections_eq_kernel` (universal-property): A section is exactly a period-invariant vector whose de Rham image belongs to L.
- `FilteredModuleC.bundle_tensor` (compatibility): The bundle of a tensor product is the tensor product of the bundles; use the existing scheme sheaf tensor and dual objects.

**Unit tests.**

- `FilteredModuleC.trivial_bundle`: For the trivial module with L=B_dR⁺ the bundle is O and V_st=Q_p.
- `FilteredModuleC.lattice_shift_bundle`: For the same M and L=tᵐB_dR⁺ the bundle is O(−m); m=1 has negative slope.
- `FilteredModuleC.zero_bundle`: The zero pair gives the zero bundle and zero sections.

**Check.** Recover the prescribed two restrictions and their common localization.

**Atlas planet.** Filtered-module bundles.


### Weak admissibility and acyclicity over C

**Target `CS.0/acyclic-module-c` (definition).** A pair (M,L) is weakly admissible when E(M,L) is semistable of slope zero; it is acyclic when every Harder–Narasimhan slope of E(M,L) is nonnegative. Both predicates hold for the zero object. With the imported convention for filtered objects over K, degree is t_H−t_N. Bundle slopes and BC curvature are distinct invariants.

**Source.** CN25, Definition 5.13 and Remark 5.14(i), p. 36; §5.1.2, p. 32 (corrected sign). Defines the two predicates by bundle slopes and compares them with the arithmetic definitions.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/modified-bundle`, `PadicHodgeTheory:R06.2/filtered-isocrystal-harder-narasimhan`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`.

**Construction/proof.**

1. Use the geometric bundle slope filtration, with zero treated by the empty slope list.
2. Transport the K definition along the filtered-module bundle comparison.

**Uses that determine the API.**

- CN25, Theorem 8.1(a): Tensor stability proves the product case.
- CS.2/local-equivalence: Vanishing of H¹ detects the diagram.

**API.**

- `FilteredModuleC.acyclic_iff_slopes` (characterisation): Acyclicity is equivalent to all bundle slopes being ≥0.
- `FilteredModuleC.weaklyAdmissible_acyclic` (relation): Weak admissibility implies acyclicity.
- `FilteredModuleC.acyclic_iso` (functoriality): Both predicates are invariant under isomorphism.
- `FilteredModuleC.acyclic_tensor` (structure): Tensor products of acyclic pairs are acyclic, by addition of bundle slopes.
- `FilteredModuleC.ofFilteredK_acyclic` (compatibility): An acyclic arithmetic filtered module gives an acyclic pair over C; likewise for weak admissibility.

**Unit tests.**

- `FilteredModuleC.acyclic_zero`: The zero pair is acyclic and weakly admissible.
- `FilteredModuleC.positive_not_wa`: The trivial M with L=t⁻¹B_dR⁺ gives O(1): it is acyclic and is not weakly admissible.
- `FilteredModuleC.negative_not_acyclic`: The trivial M with L=tB_dR⁺ gives O(−1) and is not acyclic.

**Check.** The degree sign matches weak admissibility t_H(D′)≤t_N(D′).

**Atlas planet.** Acyclic filtered modules.


### Cohomological criteria for acyclicity

**Target `CS.0/acyclicity-criteria` (theorem).** For a pair (M,L), acyclicity is equivalent to H¹(E(M,L))=0, to surjectivity of (M⊗B_st)^{N=0,φ=1}→(M⊗B_dR)/L, and to the existence of a sublattice L′⊆L for which (M,L′) is weakly admissible. Weak admissibility is equivalent to E≅O^rank(M), and also to finite Q_p-dimension of V_st together with exactness of its fundamental sequence. In that case V_st⊗B_st≅M⊗B_st and V_st⊗B_dR⁺≅L.

**Source.** CN25, Remark 5.14(ii)–(iii), p. 36; Lemma 5.3, pp. 32–33. Identifies slope, cohomology, period-surjectivity and smaller-lattice criteria.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/acyclic-module-c`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.

**Construction/proof.**

1. Apply classification and H⁰/H¹ of slope bundles.
2. Compute H¹ as the cokernel of the period-to-lattice-quotient map using the two-chart complex.
3. Shrink a lattice to a slope-zero modification using the argument of Lemma 5.3; classification identifies its sections and period evaluations.

**Check.** For L=t⁻¹B_dR⁺ the smaller lattice B_dR⁺ is admissible; reversing that inclusion fails for L=tB_dR⁺.


### Bounded eigenspaces and period kernels

**Target `CS.0/bounded-period-spaces` (definition).** For r∈N, M with φ-slopes in [0,r], and a lattice L satisfying M⊗tʳB_dR⁺⊆tʳL⊆M⊗B_dR⁺, define the VS-valued X_stʳ(M)=(M⊗B_st⁺)^{N=0,φ=pʳ} and V_stʳ(M,L)=ker(X_stʳ(M)→(M⊗B_dR⁺)/tʳL). The bounded positive ring is essential: the displayed quotient map is not defined on the unrestricted B_st eigenspace. In the acyclic case this is a short exact sequence and V_stʳ=tʳV_st inside M⊗B_dR. More generally for k≥0 the t⁻ᵏB_st⁺-version maps onto (M⊗t⁻ᵏB_dR⁺)/tʳL iff the pair is acyclic, with the same kernel. For any such M, X_stʳ(M) is a finite BC object of curvature ≤0 and height dim M: it is H⁰ of the nonnegative-slope bundle attached to M{−r} with lattice M⊗B_dR⁺.

**Source.** CN25, Remark 5.16, pp.36–37; Proposition 5.18, p.37; Proposition 5.20, p.38 (positive-ring correction). Supplies the bounded normalization and the finite-BC curvature/height calculation used in the period-Hom comparisons.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/filtered-module-c`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `PadicHodgeTheory:R06.1/plan/semistable-period-ring`, `VectorBundlesAndIsocrystals:VB1`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`, `VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`.

**Construction/proof.**

1. Form invariant subobjects of the imported period Vector Spaces and the indicated kernel.
2. Use the VB1 gluing comparison to identify X_stʳ(M) with H⁰(E(M{−r},M⊗B_dR⁺)); its slopes are r minus the Newton slopes of M. Standard-bundle cohomology, the Le Bras equivalence and Euler height give finite BC, curvature ≤0 and height dim M.
3. Use Remark 5.16 and the graded comparison of successive t-denominator levels to prove the criterion.

**Uses that determine the API.**

- CN25, Propositions 5.18, 5.20 and 5.23: Provides their source objects.
- CN25, Theorem 9.8: Identifies pro-étale cohomology modulo its torsion-pair part.

**API.**

- `PeriodKernel.mem` (characterisation): v belongs to V_stʳ exactly when N(v)=0, φ(v)=pʳv and its image belongs to tʳL.
- `PeriodKernel.map` (functoriality): A filtered morphism with the fixed bounds induces maps of both spaces, preserving identity and composition.
- `PeriodKernel.inclusion` (projection): The kernel includes in X_stʳ and hence in M⊗B_dR⁺.
- `PeriodKernel.exact_of_acyclic` (relation): For an acyclic pair the quotient map is onto in VS and the sequence with V_stʳ is exact.
- `PeriodKernel.mul_t` (compatibility): The map tʳ identifies V_st with V_stʳ; it is the period realization of the Tate twist, not equality of Galois actions.

**Unit tests.**

- `PeriodKernel.rank_one_zero`: For r=0, M trivial and L=B_dR⁺, X_st⁰=V_st⁰=Q_p and the quotient is zero.
- `PeriodKernel.fundamental`: For trivial M, L=B_dR⁺, r=1, the sequence is 0→Q_p·t→(B_cris⁺)^{φ=p}→C→0.
- `PeriodKernel.nonexample_bounds`: For r=0 and L=t⁻¹B_dR⁺ the upper bound fails, although the pair is acyclic; do not apply the bounded theorem.
- `PeriodKernel.monodromy_sign`: Take φ(e₀)=e₀, φ(e₁)=pe₁, N(e₀)=0 and N(e₁)=e₀. With φ(u)=pu and N_B=−d/du, e₁+ue₀ belongs to X_st¹(M); e₁−ue₀ has diagonal monodromy 2e₀ and does not. This tests the imported monodromy sign.

**Check.** All maps are natural Vector Space maps and agree on C-points.

**Atlas planet.** Bounded period kernels.


### Generation of the de Rham lattice

**Target `CS.0/eigenspace-generation` (theorem).** If M has φ-slopes in [0,r], X_stʳ(M)(C) spans M⊗B_dR⁺ over B_dR⁺. This is generation by the bounded simultaneous N=0,φ=pʳ eigenspace, without a filtration or Galois hypothesis.

**Source.** CN25, Lemma 5.17, p. 37. Proves bounded eigenvectors generate after de Rham scalar extension.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`, `PadicHodgeTheory:R06.2/plan/slope-decomposition`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`.

**Construction/proof.**

1. Reduce modulo t by Nakayama.
2. Use the imported coordinate with N_B=−d/du. The horizontal lift is exp(uN_M)m, since (N_M−∂/∂u)exp(uN_M)m=0; its inverse exp(−uN_M) removes monodromy and reduces to B_cris⁺. This translates the source coordinate convention.
3. Apply Dieudonné–Manin blocks of slope a/h and U_{h,rh−a}; independence of the conjugate Q_{pʰ}-characters shows their reductions span Cʰ.

**Check.** A slope-zero trivial rank-one block at r=0 already generates the whole lattice.

**Atlas planet.** Eigenspace generation.


### Period-valued Hom from an eigenspace

**Target `CS.0/eigenspace-period-hom` (theorem).** For M with φ-slopes in [0,r], evaluation induces B_dR- and B_st-linear isomorphisms M∨⊗B_dR≅Hom_VS(X_stʳ(M), B_dR) and M∨⊗B_st≅Hom_VS(X_stʳ(M), B_st). Hom here means natural Q_p-linear Vector Space morphisms, not merely linear maps of C-points and not maps assumed period-linear.

**Source.** CN25, Proposition 5.18 and Remark 5.19, pp.37–38; Proposition 3.27(i), p.20. Computes the two Hom modules using rank and generation.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/eigenspace-generation`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`, `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`.

**Construction/proof.**

1. Use generation for injectivity.
2. Use the finite-BC realization and height dim M of X_stʳ(M), then the period-Hom theorem of Proposition 3.27(i), pp.19–20: for curvature ≤0 the B_dR-valued natural Hom module is finite free of rank equal to height. This gives the required rank equality and surjectivity over B_dR; Euler height alone is not a Hom theorem.
3. Choose an admissible lattice and use its finite-dimensional period realization to force B_st-valued functionals to have B_st coefficients.

**Check.** The identifications are the evaluation pairings and are functorial in M.

**Unresolved direct inputs.** G-PERIOD-HOM.


### Period-valued Hom from an acyclic kernel

**Target `CS.0/filtered-period-hom` (theorem).** For an acyclic pair (M,L) with the bounds of CS.0/bounded-period-spaces, evaluation gives M∨⊗B_dR≅Hom_VS(V_stʳ(M,L), B_dR) and M∨⊗B_st≅Hom_VS(V_stʳ(M,L), B_st). These are module isomorphisms for the indicated period rings.

**Source.** CN25, Proposition 5.20 and Remark 5.21, p. 38 (corrected lattice inclusion; the printed Ext target is already correct). Extends the Hom computation through the finite torsion quotient.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`, `CstConjectureForDaggerVarieties:CS.0/eigenspace-period-hom`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`.

**Construction/proof.**

1. Apply Hom into B_dR to 0→V_stʳ→X_stʳ→(M⊗B_dR⁺)/tʳL→0.
2. Use vanishing of Hom and Ext¹ from the finite-length B_dR⁺ quotient into B_dR, then the preceding computation.
3. For B_st choose a weakly admissible sublattice L′⊆L and evaluate on its finite Q_p period space.

**Check.** The sublattice direction is L′⊆L. The required Ext¹ has target B_dR, as already printed in the checked source; E5 is rejected.

**Unresolved direct inputs.** G-PERIOD-HOM.

**Atlas planet.** Acyclic period reconstruction.


### Period reconstruction modulo a power of t

**Target `CS.0/truncated-period-hom` (theorem).** Under the same acyclicity and boundedness assumptions, for k≥2r the evaluation map M∨⊗(B_dR⁺/tᵏ)→Hom_VS(V_stʳ(M,L),B_dR⁺/tᵏ) has kernel killed by tʳ and cokernel killed by t²ʳ. In particular both are killed by t²ʳ. No isomorphism for finite k is asserted.

**Source.** CN25, Proposition 5.23, pp. 38–39 (corrected upper-left term on p. 39). Provides a controlled finite-level approximation, including the stronger kernel bound proved in the text.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/filtered-period-hom`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`.

**Construction/proof.**

1. Choose an admissible L′ between M⊗B_dR⁺ and L with the same bounds.
2. Compare the kernels for L′ and L; their quotient is killed by tʳ.
3. Compare their Hom groups with the two lattice quotients. The outside composite is multiplication by tʳ; the second torsion error gives t²ʳ on the cokernel.

**Check.** For r=0 the asserted annihilators are 1, so the map is an isomorphism.

**Unresolved direct inputs.** G-PERIOD-HOM.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-LEAN, G-PERIOD-HOM. All imported gaps remain inherited; none of these layers is closed.


## CS.1 — The fundamental diagram and elementary comparison cases

Fix the filtered-complex/image-filtration distinction and smallness. Construct the natural square in the strict derived left heart and its difference-map sequence. Establish twist invariance and the proper, affinoid and Stein cases; retain general bicartesianness as Conjecture 6.21.

**Layer dependencies.** `CstConjectureForDaggerVarieties:CS.0`, `AdicSpacesPartII:F1`, `LocallyAnalyticDistributions:L0`, `PadicHodgeTheory:R06.2`, `VectorBundlesAndIsocrystals:VB3:general-BC`.


### Filtered cohomology and its image filtration

**Target `CS.1/cohomology-notation` (construction).** For a smooth dagger X/C use the imported analytic cohomology package to set Bⁱ=Hⁱ_dR(X/B_dR⁺), Fʳⁱ=Hⁱ(FʳRΓ_dR(X/B_dR⁺)), DRʳⁱ=Hⁱ(RΓ_dR/Fʳ), Filʳⁱ=im(Fʳⁱ→Bⁱ) and Aʳⁱ=ker(Fʳⁱ→Bⁱ). Set Hʳⁱ=Hⁱ_proét(X,Q_p(r)) for i≤r and Xʳⁱ=(Hⁱ_HK(X)⊗̂B_st⁺)^{N=0,φ=pʳ}; joint invariants at complex level are derived. Tildes denote left-heart cohomology, ordinary letters its classical part, and bold letters the natural TVS/VS realization when supplied. Filter Bⁱ[1/t] by images of filtered complexes. Fʳⁱ is not identified with Filʳⁱ.

**Source.** CN25, §7.1.1 and §§7.2.1–7.2.2, pp. 46–47; Proposition 6.1, pp. 39–40 (import contract). Separates filtered-complex cohomology from the induced filtration on cohomology.

**Prerequisites.** `AdicSpacesPartII:F1/dagger-space`, `AdicSpacesPartII:F1/dagger-de-rham-complex`, `LocallyAnalyticDistributions:L0/strict-derived-category-left-heart`.

**Construction/proof.**

1. Take the cohomology and image/kernel maps of the filtered distinguished triangle.
2. Use the period morphism only in the truncation range i≤r; retain syntomic cohomology outside it.

**Uses that determine the API.**

- CS.2/defect-sequence: The kernel A produces the curvature-zero piece.
- CS.4/limit-obstruction and CS.5/torsion-hom-vanishing-k: The distinction between F and its image controls limits and recovery.

**API.**

- `DaggerCohomology.filtered_map` (projection): There are natural Fʳⁱ→Bⁱ and Bⁱ→DRʳⁱ with their connecting map DRʳ,ⁱ⁻¹→Fʳⁱ.
- `DaggerCohomology.image_quotient` (universal-property): Fʳⁱ/Aʳⁱ identifies with Filʳⁱ with the induced categorical image topology.
- `DaggerCohomology.filtration_decreasing` (structure): The maps Fʳ⁺¹→Fʳ induce Filʳ⁺¹ⁱ⊆Filʳⁱ and define the induced filtration on Bⁱ[1/t].
- `DaggerCohomology.pullback` (functoriality): Pullback preserves all cohomology maps, identity, composition and period comparison.
- `DaggerCohomology.arithmetic_comparison` (compatibility): Over K, Bⁱ≅Hⁱ_dR(X/K)⊗̂_K B_dR⁺; over C no canonical C-linear scalar-extension presentation is assumed.

**Unit tests.**

- `DaggerCohomology.point`: For a geometric point, B⁰=B_dR⁺, Fʳ⁰=tʳB_dR⁺ and Aʳ⁰=0.
- `DaggerCohomology.affinoid_kernel`: For a positive-dimensional smooth dagger affinoid at degree r=1, A¹¹≅O(X)/ker d; for a disc this is O(X)/C and is nonzero.
- `DaggerCohomology.negative_degree`: For i<0 all the listed cohomology groups vanish; in particular the degree-zero failure sequence has no H⁻¹ term.

**Check.** The diagram is first formed in the left heart; taking classical parts is explicitly labelled.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** The cohomological filtration.


### Small dagger varieties

**Target `CS.1/small-variety` (definition).** A smooth dagger variety X/C is small when Bⁱ=Hⁱ_dR(X/B_dR⁺) is finite free over B_dR⁺ for every i≥0, as in the operational convention of §7.2. The analytic Hyodo–Kato isomorphism then identifies its rank with dim_Fⁿʳ Hⁱ_HK(X) and with dim_C Hⁱ_dR(X). Quasi-compact smooth dagger spaces, naive interiors of quasi-compact spaces, and algebraic analytifications are the source examples; those examples require the corresponding finiteness and base-change inputs, not a definition by quasi-compactness.

**Source.** CN25, §7.2, p. 46; §1.2.3 and Remark 1.10, pp. 5–6. Pins the finite-free hypothesis used in the qBC arguments.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `mathlib:Module.Free`, `mathlib:Module.Finite`.

**Construction/proof.**

1. Define smallness by the actual B_dR⁺ modules.
2. Use the imported strict Hyodo–Kato comparison to compute rank; cite finiteness for each geometric example.

**Uses that determine the API.**

- CN25, Proposition 7.10: Makes both failure terms finite BC objects with height.
- CN25, Theorems 9.3 and 9.8: Supplies finite-rank dual period modules.

**API.**

- `SmallDagger.finiteFree` (projection): Each Bⁱ is free and finitely generated.
- `SmallDagger.rank_hk` (compatibility): rank_B_dR⁺ Bⁱ=dim_Fⁿʳ Hⁱ_HK(X)=dim_C Hⁱ_dR(X).
- `SmallDagger.iso` (functoriality): Smallness is invariant under dagger isomorphism and under cohomology equivalences preserving the full period package.
- `SmallDagger.quasicompact` (constructor): A smooth quasi-compact dagger variety over C is small, using the precise analytic finiteness theorem.
- `SmallDagger.analytification` (example): The analytification of a finite-type smooth C-variety is small.

**Unit tests.**

- `SmallDagger.point`: A point is small, with rank one in degree zero and zero in other degrees.
- `SmallDagger.disc`: The dagger closed disc is small although its H¹_proét is infinite dimensional over Q_p.
- `SmallDagger.infinite_components`: A countable disjoint union of geometric points is not small: B⁰ is the product of countably many B_dR⁺ modules and is not finite free.

**Check.** Smallness is checked in all degrees and is not a bound on Q_p-dimension of pro-étale cohomology.

**Unresolved direct inputs.** G-ANALYTIC, G-GEOMETRIC.

**Atlas planet.** Small varieties.


### The fundamental diagram

**Target `CS.1/fundamental-square` (construction).** For every smooth dagger X/C and 0≤i≤r form the natural commutative square with upper row H̃ʳⁱ→X̃ʳⁱ and lower row F̃ʳⁱ→B̃ⁱ, using the syntomic period map and the map of triangles with common term RΓ_dR/Fʳ. The associated two maps are u=(a,b):H̃ʳⁱ→X̃ʳⁱ⊕F̃ʳⁱ and v=(c,−d):X̃ʳⁱ⊕F̃ʳⁱ→B̃ⁱ. Thus vu=0. X̃ and B̃ are classical. The general assertion that this square is bicartesian is Conjecture 6.21, not an unconditional theorem.

**Source.** CN25, §6.4 and Conjecture 6.21, pp. 43–44; square (6.16) and sequence (6.17), p.43 (difference-map convention). Specifies the conjectural square and its exact-sequence formulation without claiming it is always bicartesian.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `mathlib:CategoryTheory.BicartesianSq`.

**Construction/proof.**

1. Form the syntomic and filtered de Rham triangles and their compatible maps.
2. Take left-heart cohomology and the truncation isomorphism α_r.
3. Use the existing BicartesianSq predicate; in the abelian left heart it is equivalent to the sequence 0→H̃→X̃⊕F̃→B̃→0 being exact, with the stated minus sign.

**Uses that determine the API.**

- CS.2/local-equivalence: Identifies both obstructions to bicartesianness.
- CS.3 and CS.4: States the comparison delivered for the proved classes.

**API.**

- `FundamentalDiagram.commutes` (relation): c∘a=d∘b in the left heart.
- `FundamentalDiagram.complex` (simp): The difference map v satisfies v∘u=0.
- `FundamentalDiagram.naturality` (functoriality): Every dagger morphism induces a morphism of the four corners and both exactness maps.
- `FundamentalDiagram.bicartesian_iff` (compatibility): Mathlib BicartesianSq for the square is equivalent to exactness of 0→H̃→X̃⊕F̃→B̃→0 in the abelian left heart.
- `FundamentalDiagram.classical_corners` (characterisation): X̃ʳⁱ and B̃ⁱ are the embeddings of Xʳⁱ and Bⁱ; no such automatic identification is made for H̃ and F̃.

**Unit tests.**

- `FundamentalDiagram.point`: For a point at i=r=0 the square is Q_p→Q_p over B_dR⁺→B_dR⁺, with bottom identity and both vertical maps the inclusions.
- `FundamentalDiagram.sign`: For that square v(1,1)=0; using c+d instead gives 2≠0.
- `FundamentalDiagram.not_forget_topology`: Exactness of a sequence of underlying vector spaces alone does not certify BicartesianSq in LH(C_Q_p); a dense nonclosed inclusion must retain its left-heart cokernel.

**Check.** Both routes around the square agree; their difference, rather than their sum, kills u.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** The fundamental diagram.


### Twist invariance and the surjectivity reduction

**Target `CS.1/twist-and-induction` (theorem).** For fixed i≥0 the fundamental square is bicartesian for one r≥i iff it is so for every r≥i. Multiplication by t identifies H̃ʳⁱ with H̃ʳ⁺¹ⁱ and F̃ʳ⁺¹ⁱ=tF̃ʳⁱ; the quotient Xʳ⁺¹ⁱ/tXʳⁱ identifies with Hⁱ_HK(X)⊗̂C and the corresponding Bⁱ/tBⁱ with Hⁱ_dR(X), by Hyodo–Kato. For a fixed r, surjectivity of Xʳⁱ⊕Fʳⁱ→Bⁱ in all degrees 0≤i≤r yields the short exact left-heart sequences in that range by induction from degree −1=0.

**Source.** CN25, Remark 6.23(ii)–(iii), pp. 44–45. Reduces all twists to a single twist and the full comparison to surjectivity.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`.

**Construction/proof.**

1. Apply the exact rows and columns for t multiplication; the bottom comparison is an isomorphism.
2. Apply the long exact cohomology sequence of the syntomic fiber; preceding-degree surjectivity kills the left kernel.

**Check.** Surjectivity at a single isolated degree is not used to infer injectivity at the same degree.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** Twist invariance.


### Proper analytic comparison over K

**Target `CS.1/proper-comparison-k` (theorem).** For a smooth proper rigid analytic X_K/K, with X=X_K×C, all cohomology groups below are finite dimensional and there is a natural B_st-linear G_K-equivariant isomorphism Hⁱ_ét(X,Q_p)⊗B_st≅Hⁱ_HK(X)⊗B_st preserving φ and N. It induces the filtered B_dR comparison with Hⁱ_dR(X_K)⊗_K B_dR. No semistable model is assumed. The induced dual Hom descriptions are strict for the natural weak Hom topologies.

**Source.** CN25, Theorem 6.4 and Remark 6.7, pp. 40–41. Removes the semistable-model condition in the proper rigid setting.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `PadicHodgeTheory:R06.2/weak-admissibility-is-admissibility`, `VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`.

**Construction/proof.**

1. Construct the map using α_s for s>i and untwist by tˢ.
2. Use finite-dimensional étale cohomology and finite BC Dimension to split the syntomic sequence.
3. Identify the filtered arithmetic module as weakly admissible and apply its period evaluations; verify independence of s and strictness.

**Check.** On a proper semistable model this is the imported CP.4 comparison, with its Nφ=pφN convention.

**Unresolved direct inputs.** G-ANALYTIC, G-ETALE.

**Atlas planet.** Proper analytic comparison.


### Proper analytic comparison over C

**Target `CS.1/proper-comparison-c` (theorem).** For X/C smooth proper rigid analytic and i≥0 there are natural B_st-linear isomorphisms Hⁱ_ét(X,Q_p)⊗B_st≅Hⁱ_HK(X)⊗B_st preserving φ,N and inducing a filtered B_dR isomorphism with Bⁱ⊗_{B_dR⁺}B_dR. The filtration on Bⁱ is im(Hⁱ(FʲRΓ_dR)→Bⁱ). In particular the associated pair (Hⁱ_HK,F⁰(Bⁱ[1/t])) is weakly admissible. This does not identify its lattice with the unfiltered Bⁱ.

**Source.** CN25, Theorem 6.8 and Remark 6.13, pp. 41–42 (F⁰ correction). Proves the proper C comparison with its actual induced cohomological filtration.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`.

**Construction/proof.**

1. Use the finite-rank proper cohomology and finite-length graded filtered quotients.
2. Split the syntomic sequence by the same BC argument as over K.
3. Show Bⁱ/FilˢBⁱ→Hⁱ(RΓ_dR/Fˢ) is bijective using its injectivity from the image definition and surjectivity from the period sequence.
4. Apply the weak-admissible lattice criterion.

**Check.** The identification uses F⁰(Bⁱ[1/t]), not Bⁱ in general.

**Unresolved direct inputs.** G-ANALYTIC, G-ETALE.


### The simplified Stein and affinoid diagram

**Target `CS.1/stein-affinoid-diagram` (theorem).** For a smooth dagger Stein space or dagger affinoid X/C and r≥0 there is a natural map between strictly exact rows 0→Ωʳ⁻¹(X)/ker d→Hʳ_proét(X,Q_p(r))→Xʳʳ→0 and 0→Ωʳ⁻¹(X)/ker d —d→ Ωʳ(X)^{d=0}→Hʳ_dR(X)→0. The left vertical map is identity, the right is ι_HK⊗θ, and the middle β̃=p⁻ʳβα_r⁻¹. All vertical maps are strict with closed image. Hʳ_proét is Fréchet in the Stein case and LB in the affinoid case; ker β̃≅(Hʳ_HK(X)⊗̂B_st⁺)^{N=0,φ=p^{r−1}}. Set Ω⁻¹=0.

**Source.** CN25, Theorem 6.14, p. 43; its cited part-I Corollary 6.9 and Proposition 5.13. Transfers the simplified syntomic diagram to pro-étale cohomology, including topology.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `AdicSpacesPartII:F1/dagger-strict-differentials`, `AdicSpacesPartII:F1/dagger-partially-proper`.

**Construction/proof.**

1. Import the syntomic Stein diagram and α_r in degree r.
2. Normalize the middle map by p⁻ʳ to preserve symbols.
3. Transport the topology, strictness and kernel assertions through α_r.

**Check.** The top row is pro-étale, and its differential-form kernel on a disc is nonzero.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** The simplified fundamental diagram.


### Bicartesian diagrams for proper, Stein and affinoid spaces

**Target `CS.1/elementary-bicartesian-cases` (theorem).** The fundamental square is bicartesian for smooth proper X/C and for smooth dagger Stein or affinoid X/C, in all 0≤i≤r by twist invariance. At degree i=r the proper horizontal arrows are injective and Fʳʳ→Filʳʳ is an isomorphism. At degree r in the Stein/affinoid case both horizontal arrows are surjective with common kernel Ωʳ⁻¹/ker d. The latter assertion uses pro-étale cohomology, not étale cohomology of a rigid affinoid completion.

**Source.** CN25, Corollaries 6.15 and 6.19, Remark 6.18, pp. 43–44 (pro-étale correction). Establishes the two initial geometric cases and distinguishes their horizontal maps.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/twist-and-induction`, `CstConjectureForDaggerVarieties:CS.1/proper-comparison-c`, `CstConjectureForDaggerVarieties:CS.1/stein-affinoid-diagram`.

**Construction/proof.**

1. For the proper case use the short exact period sequence and the filtered quotient identification.
2. For Stein/affinoid spaces compare the two triangles, use Hʲ(RΓ_dR/Fʳ)=0 for j≥r, and identify the two kernels by reduction to C.
3. Apply twist invariance for other i≤r.

**Check.** A proper point tests horizontal injectivity; a dagger disc in degree one tests the shared nonzero kernel.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-ANALYTIC, G-ETALE, G-GEOMETRIC, G-LEAN. All imported gaps remain inherited; none of these layers is closed.


## CS.2 — The qBC filtration and comparison criteria

Identify kernel and cokernel by finite bundle cohomology, construct the canonical qBC filtration and its exact defect sequence, and prove the degreewise and global equivalences with acyclicity, curvature and height. Record noncanonical crystalline and syntomic splittings on a separate branch.

**Layer dependencies.** `CstConjectureForDaggerVarieties:CS.0`, `CstConjectureForDaggerVarieties:CS.1`, `LocallyAnalyticDistributions:L0`, `PadicHodgeTheory:R06.2`, `VectorBundlesAndIsocrystals:VB3:general-BC`.


### Bundle cohomology measuring the diagram

**Target `CS.2/failure-objects` (construction).** For small X, i≥0, r≥0 and n=0,1 put hⁿ_i(r)=Hⁿ(X_FF,E(Hⁱ_HK(X){−r},FilʳHⁱ_dR(X/B_dR))), as a finite BC object. Here {−r} multiplies φ by p⁻ʳ and leaves N fixed, and the lattice is the induced Filʳ lattice in Bⁱ[1/t]. Use hⁿ_{−1}(r)=0. In the range i≤r, or for quasi-compact X with r≥dim X, the tʳ-period isomorphism identifies this modified bundle with the untwisted pair (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)); the simultaneous change of φ and lattice is essential.

**Source.** CN25, §7.2.2 and Lemma 7.7, p. 47; proof of Proposition 7.10, p. 48. Introduces the finite bundle-cohomology objects controlling both ends of the comparison sequence.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/small-variety`, `CstConjectureForDaggerVarieties:CS.0/modified-bundle`, `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `CstConjectureForDaggerVarieties:CS.1/twist-and-induction`, `VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`.

**Construction/proof.**

1. Apply the filtered-module bundle construction to the finite cohomology module and its image lattice.
2. Use the finite BC realization of H⁰ and H¹ of a coherent bundle.
3. Use t multiplication and the filtration shift in the range i≤r to identify the twisted and untwisted pairs.

**Uses that determine the API.**

- CS.2/defect-sequence: Identifies the left kernel and right cokernel.
- CS.2/local-equivalence and CS.3: Acyclicity of these bundles is the criterion used in geometric cases.

**API.**

- `FailureObjects.h0` (projection): The zeroth object is H⁰ of the indicated modified bundle.
- `FailureObjects.h1` (projection): The first object is H¹ of that bundle.
- `FailureObjects.map` (functoriality): Compatible pullbacks on filtered HK modules induce maps of hⁿ, preserving identity and composition.
- `FailureObjects.negative_degree` (simp): hⁿ_{−1}(r)=0.
- `FailureObjects.twist` (compatibility): Simultaneously twisting φ and the lattice by tʳ identifies the bundle and its cohomology with the untwisted F⁰ pair.

**Unit tests.**

- `FailureObjects.point`: For a point at i=r=0 the bundle is O, so h⁰=Q_p and h¹=0.
- `FailureObjects.shifted_point`: For a point at i=0,r=1, φ=p⁻¹ and lattice tB_dR⁺ cancel to give O again; twisting only the lattice would give O(−1).
- `FailureObjects.rank_zero`: A zero HK group with zero lattice gives h⁰=h¹=0.

**Check.** The lattice uses the image filtration; Aʳⁱ is not part of that lattice.

**Atlas planet.** The two failure terms.


### Kernel and cokernel descriptions

**Target `CS.2/failure-kernel-cokernel` (theorem).** For small X and i≤r, h⁰_i(r)≅ker(Xʳⁱ⊕Filʳⁱ→Bⁱ)≅ker(Xʳⁱ→Bⁱ/Filʳⁱ), and h¹_i(r) is the corresponding cokernel. Moreover ker(Hʳⁱ→Xʳⁱ⊕Fʳⁱ)≅h¹_{i−1}(r). These identifications lift to the natural TVS objects, with the difference-map convention of CS.1.

**Source.** CN25, Lemma 7.7 and equation (7.6), pp. 46–47. Computes the two failure terms by an explicit comparison of exact rows.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/failure-objects`, `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `CstConjectureForDaggerVarieties:CS.0/bounded-period-spaces`.

**Construction/proof.**

1. The two-chart cohomology complex gives the first two identities.
2. Compare the syntomic and filtered de Rham long exact sequences with their common DR term.
3. Apply the snake lemma; multiplying Fʳⁱ by tʳ kills its torsion and identifies its image in Bⁱ, justifying the reduced bottom row.

**Check.** At i=0 the preceding-degree kernel is zero.

**Unresolved direct inputs.** G-ANALYTIC, G-QBC.


### The canonical qBC filtration on pro-étale cohomology

**Target `CS.2/canonical-qbc-filtration` (construction).** For small X and 0≤i≤r the natural TVS Hʳⁱ is a qBC. Its functorial canonical filtration has successive curvature pieces Hʳⁱ_{>0}≅h¹_{i−1}(r), Hʳⁱ_{=0}≅Aʳⁱ=(Fʳⁱ)_{B_dR⁺-tors}, and Hʳⁱ_{<0}≅h⁰_i(r). The middle piece is a reasonable B_dR⁺-Pair and need not be finite BC. These are associated graded objects, not a canonical direct-sum decomposition. Zero pieces are allowed in every curvature class.

**Source.** CN25, Corollary 7.9(i), p. 47, with its proof. Constructs the filtration from the cohomological diagram and identifies all its graded pieces.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/failure-kernel-cokernel`, `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration`.

**Construction/proof.**

1. Use the diagram of CS.2/failure-kernel-cokernel to filter H by successive kernels.
2. Identify the middle quotient with ker(F→B).
3. Apply the imported qBC three-piece recognition and uniqueness theorem; finite bundle H¹ and H⁰ provide the positive and negative curvature pieces.

**Uses that determine the API.**

- CS.2/height-defect and local-equivalence: Separates finite height errors from the height-zero Pair.
- CS.5/recovery-c: Its torsion Pair has zero maps into period fields.

**API.**

- `ProetaleQBC.positive` (projection): The first subobject is h¹_{i−1}(r), with its canonical injection into Hʳⁱ.
- `ProetaleQBC.zero_piece` (characterisation): The middle graded piece equals Aʳⁱ and its B_dR⁺-torsion description.
- `ProetaleQBC.negative` (projection): The final quotient is h⁰_i(r).
- `ProetaleQBC.naturality` (functoriality): Dagger pullback preserves the filtration and induces the expected bundle maps on its finite graded pieces.
- `ProetaleQBC.finite_agreement` (compatibility): When H is already finite BC, its filtration agrees with the existing finite BC curvature filtration; the qBC height restricts to the BC height.

**Unit tests.**

- `ProetaleQBC.proper`: For proper X the only nonzero piece is the finite Q_p negative-curvature piece Hʳ_proét; the positive and torsion pieces vanish.
- `ProetaleQBC.disc`: For the dagger disc at i=r=1, HK¹=0, so both finite pieces vanish while A¹¹=O(X)/C and H¹_proét≅A¹¹.
- `ProetaleQBC.point`: For a point in degree zero the negative piece is Q_p of height one, not curvature zero merely because it has C-dimension zero.

**Check.** The assertion does not replace an infinite torsion Pair by a finite-length module.

**Unresolved direct inputs.** G-QBC.

**Atlas planet.** The canonical qBC filtration.


### The exact sequence with two failure terms

**Target `CS.2/defect-sequence` (theorem).** For small X and 0≤i≤r there is a natural exact sequence of TVS objects 0→h¹_{i−1}(r)→Hʳⁱ→Fʳⁱ⊕Xʳⁱ→Bⁱ→h¹_i(r)→0, with the signs transported from CS.1. Consequently the fundamental diagram in degree i is bicartesian exactly when both h¹_{i−1}(r) and h¹_i(r) vanish.

**Source.** CN25, Corollary 7.9(ii), p. 47; Proposition 7.10(a)–(b), p. 48. Displays both obstructions; killing only the right one is insufficient.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/canonical-qbc-filtration`, `CstConjectureForDaggerVarieties:CS.2/failure-kernel-cokernel`, `CstConjectureForDaggerVarieties:CS.1/fundamental-square`.

**Construction/proof.**

1. Combine the kernel description with the canonical qBC filtration.
2. The image of F→B is Fil, so adjoining F does not change the right cokernel.
3. Compare the classical sequence with the left-heart sequence using the classical X,B corners and the strict analytic comparison.

**Check.** The criterion requires the preceding-degree failure term as well as the degree-i term.

**Unresolved direct inputs.** G-ANALYTIC, G-QBC.

**Atlas planet.** The failure exact sequence.


### The height formula and its sign

**Target `CS.2/height-defect` (theorem).** For small X and r≥0, ht(Hʳʳ)=dim_Fⁿʳ Hʳ_HK(X)+ht(h¹_{r−1}(r))+ht(h¹_r(r)). Each h¹ term has height ≤0, and height zero occurs only if that term is zero, because it is H¹ of a vector bundle. Therefore ht(Hʳʳ)≤dim_C Hʳ_dR(X), with equality exactly when both failure terms vanish. This strictness is not asserted for every positive-curvature BC: torsion away from ∞ is a counterexample to that broader assertion.

**Source.** CN25, Proposition 7.10 proof, p. 48; Equation (3.10) and Remark 3.11, p.15; Remark 3.13(iv), p.16. Computes the two numerical defects and uses the stronger sign for H¹ of bundles.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/canonical-qbc-filtration`, `VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`, `VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs`, `CstConjectureForDaggerVarieties:CS.1/small-variety`.

**Construction/proof.**

1. The Pair piece has height zero and qBC height is additive.
2. Apply the imported Euler-height identity ht(H⁰E)−ht(H¹E)=rk E.
3. Decompose the bundle into slope blocks; each nonzero H¹ block has strictly negative height.
4. Use the Hyodo–Kato rank comparison.

**Check.** Height is a signed BC/qBC invariant, not the ordinary dimension of an infinite Q_p-vector space.

**Unresolved direct inputs.** G-QBC.

**Atlas planet.** The height formula.


### The degreewise equivalence of comparison criteria

**Target `CS.2/local-equivalence` (theorem).** For a small smooth dagger X/C and r≥0 the following are equivalent: the fundamental square at degree i=r is bicartesian; h¹_{r−1}(r)=h¹_r(r)=0; the two pairs (Hʲ_HK(X),F⁰Hʲ_dR(X/B_dR)) for j=r−1,r are acyclic; the TVS Hʳʳ and H_syn^{r+1}(X,r) both have curvature ≤0; ht(Hʳʳ)=dim_C Hʳ_dR(X). The degree r+1 term here is syntomic, not H^{r+1}_proét(X,Q_p(r)); it lies outside the comparison range. Negative-degree pairs vanish.

**Source.** CN25, Proposition 7.10 with footnote 21, p. 48. Equates five conditions, retaining the adjacent syntomic group in the curvature condition.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/defect-sequence`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `CstConjectureForDaggerVarieties:CS.2/failure-objects`, `CstConjectureForDaggerVarieties:CS.2/height-defect`.

**Construction/proof.**

1. Use the failure exact sequence and acyclicity criteria.
2. Twist the bundle pairs to remove r.
3. Apply the positive-piece description also to the adjacent syntomic term in the source diagram; do not extend α_r past degree r.
4. Use the height defect formula and the strict negativity of nonzero bundle H¹.

**Check.** The single-degree curvature condition is not substituted for the pair of degree-r and degree-(r+1) conditions.

**Unresolved direct inputs.** G-ANALYTIC, G-QBC.

**Atlas planet.** Equivalent comparison criteria.


### The four conjectural properties for a small variety

**Target `CS.2/global-equivalence` (theorem).** For a small smooth dagger X/C the following families of statements are equivalent: the fundamental squares are bicartesian for all 0≤i≤r; all pairs (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)) are acyclic; every Hⁱ_proét(X,Q_p) has curvature ≤0; ht(Hⁱ_proét(X,Q_p))=dim_C Hⁱ_dR(X) for every i. This is an equivalence of properties, not a proof that they hold for every small X.

**Source.** CN25, Corollary 7.11 and Remark 7.12, p. 48; Conjectures 7.1, 7.3 and 7.4, p. 46. Extends the quasi-compact equivalence to the actual finite-free smallness condition.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/local-equivalence`, `CstConjectureForDaggerVarieties:CS.1/twist-and-induction`, `CstConjectureForDaggerVarieties:CS.2/failure-objects`.

**Construction/proof.**

1. Vary r in the degreewise equivalence and use twist invariance.
2. For the adjacent positive-curvature piece use the bundle-cohomology twist identification h¹_i(r)≅h¹_i(r+1) from the failure objects. At r+1 the comparison range includes degree r+1; this identifies the finite positive piece needed for the induction. No comparison of the full syntomic group in degree r+1 at twist r is asserted.

**Check.** All degrees are quantified; a height identity in one degree is not used to prove acyclicity in every degree.


### Splitting the crystalline eigenspace complex

**Target `CS.2/crystalline-eigenspace-splitting` (theorem).** For a smooth quasi-compact dagger X/C, r≥dim X, and the functorial log-crystalline complex of the analytic package, Hⁱ([RΓ_cris(X)]^{φ=pʳ})≅(Hⁱ_HK(X)⊗B_st⁺)^{N=0,φ=pʳ} as BC objects. The eigenspace complex is quasi-isomorphic to the direct sum of these groups placed in degree i. The splitting depends on cocycle lifts; it is neither canonical nor claimed Galois equivariant. The proof uses the completed unramified coefficient version of HK, with its comparison to the Fⁿʳ version.

**Source.** CN25, Lemma 7.13 and Remark 7.14, pp. 48–49. Constructs a noncanonical splitting in the dimension-bounded range.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/eigenspace-generation`, `PadicHodgeTheory:R06.2/plan/slope-decomposition`, `CstConjectureForDaggerVarieties:CS.1/small-variety`.

**Construction/proof.**

1. Use the non-equivariant crystalline–HK comparison.
2. Decompose each finite HK group into Dieudonné–Manin blocks and choose cocycle lifts of its basis.
3. Construct maps into the mapping fiber of 1−φ/pʳ by correcting each lifted block with a primitive of its Frobenius discrepancy.
4. Use the slope bound ≤min(i,dim X) and r≥dim X to identify the eigenspaces and cohomology.

**Check.** Changing cocycle lifts may change the splitting; no naturality assertion is added.

**Unresolved direct inputs.** G-ANALYTIC.


### A noncanonical decomposition of syntomic cohomology

**Target `CS.2/syntomic-filtration-splitting` (theorem).** For smooth quasi-compact dagger X/C and r≥dim X, every natural syntomic TVS H_synⁱ(X,r) is isomorphic, noncanonically, to h¹_{i−1}(r)⊕h⁰_i(r)⊕P_i, where P_i is a reasonable B_dR⁺-Pair representing the curvature-zero piece. For i≤r this decomposes pro-étale cohomology through α_r. It does not prove that the canonical qBC filtration splits canonically or that every qBC splits.

**Source.** CN25, Proposition 7.15, pp. 49–50. Splits the canonical filtration after choices in the stated range.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/crystalline-eigenspace-splitting`, `CstConjectureForDaggerVarieties:CS.2/canonical-qbc-filtration`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/compact-type-extension-duality`.

**Construction/proof.**

1. Replace the crystalline eigenspace complex by its split cohomology complex.
2. Represent the syntomic fiber by the explicit three-term total complex and remove an acyclic differential-image complex.
3. Use finite free de Rham cohomology, compact-type reflexivity, extension of continuous forms and the open mapping theorem to choose period-linear complements.
4. The remaining kernel and cokernel are h⁰_i and h¹_{i−1}; reduce the middle Pair modulo tʳ.

**Check.** The theorem is independent of the proofs of the final comparison cases: do not make Theorem 8.1 depend on it.

**Unresolved direct inputs.** G-QBC, G-FA.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-ANALYTIC, G-FA, G-LEAN, G-QBC. All imported gaps remain inherited; none of these layers is closed.


## CS.3 — Geometric classes with nonnegative de Rham slopes

Define nonnegative de Rham slopes and prove product closure, algebraic analytification and almost proper cases. Apply the latter to the exact semistable and projective-space tube settings supplied by the geometric owner.

**Layer dependencies.** `CstConjectureForDaggerVarieties:CS.0`, `CstConjectureForDaggerVarieties:CS.1`, `AdicSpacesPartII:F1`, `CohomologyComparisons:CP.4`, `VectorBundlesAndIsocrystals:VB0`, `VectorBundlesAndIsocrystals:VB2:ampleness`.


### Varieties with nonnegative de Rham slopes

**Target `CS.3/nonnegative-de-rham-slopes` (definition).** A smooth dagger X/C has de Rham slopes ≥0 if X is small and, for every i≥0, the filtered module (Hⁱ_HK(X),F⁰Hⁱ_dR(X/B_dR)) is acyclic. The term refers to slopes of its modified bundle, not to φ-slopes alone and not to nonnegative Hodge–Tate weights.

**Source.** CN25, §8.1, p. 50; Conjecture 7.1, p. 46. Defines the hypothesis under which the small-variety comparison is proved.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/small-variety`, `CstConjectureForDaggerVarieties:CS.0/acyclic-module-c`, `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`.

**Construction/proof.**

1. Use smallness to obtain finite filtered modules in every degree.
2. Apply the acyclic predicate to their induced F⁰ lattices.

**Uses that determine the API.**

- CN25, Theorem 8.1: Formulates the three geometric stability results.
- CN25, Theorems 9.3 and 9.8: Is the common hypothesis of both reconstruction theorems.

**API.**

- `DeRhamNonnegative.small` (projection): The predicate implies smallness.
- `DeRhamNonnegative.acyclic` (projection): For each i the indicated filtered HK module is acyclic.
- `DeRhamNonnegative.iso` (functoriality): The predicate is preserved by compatible isomorphisms of the full cohomology package.
- `DeRhamNonnegative.bicartesian` (equivalence): For small X it is equivalent to all fundamental squares being bicartesian, by CS.2/global-equivalence.
- `DeRhamNonnegative.height` (relation): It implies ht(Hⁱ_proét)=dim_C Hⁱ_dR in every degree.

**Unit tests.**

- `DeRhamNonnegative.point`: A point has the predicate: its only nonzero bundle is O.
- `DeRhamNonnegative.affinoid`: A smooth dagger affinoid has the predicate by the elementary diagram, smallness and CS.2/global-equivalence; in particular the dagger disc does.
- `DeRhamNonnegative.infinite_points`: The countable disjoint union of points does not have the predicate, because it is not small even though its components have it.

**Check.** The smallness condition is included, even when acyclicity is used as shorthand.

**Atlas planet.** Nonnegative de Rham slopes.


### Nonnegative de Rham slopes for products

**Target `CS.3/product-slopes` (theorem).** If smooth dagger X,Y/C have de Rham slopes ≥0, their product has de Rham slopes ≥0. In degree n the cup product gives an injective bundle map ⊕_{i+j=n}E_i(X)⊗E_j(Y)→E_n(X×Y) whose cokernel is coherent and supported at ∞. Equality of the two filtration lattices is not required or asserted.

**Source.** CN25, Theorem 8.1(a), p. 50. Proves product closure using a torsion modification rather than equality of filtrations.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.

**Construction/proof.**

1. Apply HK and de Rham Künneth and their compatibility with cup products to establish smallness and identify the punctured bundles.
2. The filtered cup product gives lattice containment, hence the injection with torsion cokernel at ∞.
3. Tensor acyclicity annihilates H¹ of the source and torsion sheaves have H¹=0; the long exact sequence annihilates H¹ of the target.

**Check.** The claim is about de Rham/HK Künneth, not a general algebraic tensor-product formula for pro-étale cohomology.

**Unresolved direct inputs.** G-GEOMETRIC.

**Atlas planet.** Product stability.


### Algebraic analytifications have nonnegative slopes

**Target `CS.3/algebraic-analytification` (theorem).** For a smooth finite-type algebraic variety V/C, its dagger analytification Vᵃⁿ has de Rham slopes ≥0. For each i, the algebraic admissible filtered module maps to its analytic counterpart, isomorphically on HK; the resulting bundle injection has coherent cokernel supported at ∞. The analytic lattice may be larger than the algebraic one.

**Source.** CN25, Theorem 8.1(b), pp. 50–51. Uses algebraic admissibility and Hyodo–Kato GAGA to prove analytic acyclicity.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.0/acyclicity-criteria`, `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `AdicSpacesPartII:F1/dagger-analytification`.

**Construction/proof.**

1. Use the algebraic period comparison to obtain an admissible algebraic pair.
2. Apply HK GAGA and analytic de Rham finiteness to obtain smallness and the lattice comparison.
3. Enlarging the lattice gives a torsion modification; the H¹ sequence transfers acyclicity.

**Check.** The result includes nonproper V; it does not replace analytic pro-étale cohomology by algebraic étale cohomology.

**Unresolved direct inputs.** G-GEOMETRIC.

**Atlas planet.** Algebraic analytification.


### Almost proper varieties have nonnegative slopes

**Target `CS.3/almost-proper-slopes` (theorem).** Let X/C be smooth proper rigid analytic and Z⊆X any closed analytic subvariety. The smooth dagger complement U=X∖Z has de Rham slopes ≥0. No smoothness or normal crossings assumption on Z is imposed in the conclusion. A proper modification reducing the boundary to a simple normal crossings divisor is a proof input.

**Source.** CN25, Theorem 8.1(c), p. 51. Proves the complement case by resolving the boundary and comparing with logarithmic cohomology.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.1/twist-and-induction`, `CstConjectureForDaggerVarieties:CS.1/proper-comparison-c`, `AdicSpacesPartII:F1/dagger-snc-divisor`.

**Construction/proof.**

1. Resolve the pair in characteristic zero, without changing U, obtaining a smooth proper X′ with normal crossings boundary D.
2. Use the logarithmic period exact sequence for the proper pair (X′,D).
3. Identify ordinary HK and unfiltered de Rham cohomology of U with the log pair and compare logarithmic and naive filtrations.
4. Surjectivity in the top logarithmic sequence implies it for the fundamental difference map for U in every degree. Apply induction and CS.2/global-equivalence; retain finiteness proving smallness.

**Check.** The boundary may be singular; the resolution input must cover proper rigid pairs, not just affinoid dagger pairs.

**Unresolved direct inputs.** G-GEOMETRIC.

**Atlas planet.** Almost proper comparison.


### The logarithmic and naive filtration discrepancy

**Target `CS.3/etale-proetale-defect` (theorem).** With U=X′∖D a resolved almost proper pair and i≤r, the two-term complexes [Hⁱ_ét(U,Q_p(r))→H̃ⁱ_proét(U,Q_p(r))] and [Hⁱ(FʳRΓ_dR(X′ with log D/B_dR⁺))→H̃ⁱ(FʳRΓ_dR(U/B_dR⁺))] are naturally isomorphic in the derived/left-heart realization. These are complexes with maps; no equality of ordinary quotient vector spaces without strictness is inferred.

**Source.** CN25, Remark 8.2, p. 51. Identifies the cohomological difference with the difference between the two filtrations.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/almost-proper-slopes`, `CstConjectureForDaggerVarieties:CS.1/fundamental-square`.

**Construction/proof.**

1. Compare the logarithmic period and analytic syntomic triangles.
2. Their HK and unfiltered de Rham terms are isomorphic.
3. Cancel those terms in the associated mapping cones.

**Check.** For a proper pair with empty boundary both discrepancy complexes are zero.

**Unresolved direct inputs.** G-GEOMETRIC.


### Comparison for semistable tube complements

**Target `CS.3/semistable-tube-complement` (application).** Let 𝔛/O_K be weak formal with local étale charts Spf(O_K{T₁,…,T_n}/(T₁⋯T_s−π)), 1≤s≤m≤n. Let 𝔝 be locally either ⋂_{j=s+1}^mV(T_j) or ⋃_{j=s+1}^mV(T_j), with the stated compatible charts, and assume 𝔛_K smooth proper. For U=]𝔛_k∖𝔝_k[_𝔛, the base change U_C has de Rham slopes ≥0 and hence bicartesian fundamental diagrams. The restriction RΓ_dR(𝔛_K∖𝔝_K)→RΓ_dR(U) is an unfiltered quasi-isomorphism, compatible with the natural filtration map; no filtered-complex quasi-isomorphism is claimed. The compatible HK comparison identifies the underlying coefficients, and naturality gives inclusion of the induced full B_dR⁺ lattices. That inclusion, rather than equality of the filtrations, suffices for acyclicity.

**Source.** CN25, Proposition 8.3 and the following example, pp.51–52, with E16 filtration correction. The chart hypotheses and slope application are retained; lattice containment replaces the unjustified filtered-complex equivalence. GK04, Corollary 3.8(a),(c), p.16; Proposition 3.7, pp.14–16, in arXiv v1 pagination. Proves the underlying de Rham comparison for both the intersection and union charts; it does not assert an equivalence on the associated graded Hodge complexes.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/almost-proper-slopes`, `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.0/modified-bundle`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.

**Construction/proof.**

1. Use Grosse-Klönne Corollary 3.8(a),(c) for the unfiltered tube-complement comparison in the stated charts. Proposition 8.3 of CN25 overstates this as a filtered quasi-isomorphism; E16 records the correction.
2. Apply the almost proper theorem to V=(𝔛_K∖𝔝_K)_C, and use the compatible HK comparison to identify its punctured bundle with that of U_C.
3. Quasi-compactness of U_C gives smallness. The natural filtration map sends L_V into L_U inside the common localized period module. These are full lattices, so E_i(V)→E_i(U_C) is injective with finite-length cokernel at ∞. Torsion sheaves have H¹=0; the cohomology sequence therefore transfers H¹=0 from E_i(V) to E_i(U_C).

**Check.** Both intersection and union versions require the stated coordinate description; an arbitrary closed formal subscheme is not covered. For the weak formal projective line and the infinity section, restriction from the affine line to the dagger closed unit disc is not a quasi-isomorphism on gr⁰ of the naive Hodge filtration: (1−πT)⁻¹ is overconvergent on the disc but has a pole on the affine line. This rules out the stronger filtered-complex claim without affecting unfiltered de Rham invariance or the lattice-inclusion argument.

**Unresolved direct inputs.** G-GEOMETRIC.


### Small tubular neighbourhoods in projective space

**Target `CS.3/projective-tube-complement` (application).** Let X=Pⁿ_K and let Z=Z₁×_X⋯×_XZ_c be a smooth scheme-theoretic complete intersection of c hypersurfaces in the codimension-c setting of Proposition 8.4. There is ε₀∈|K×| such that for positive ε∈|K×| with ε<ε₀, removing the specified tubular neighbourhood Z(ε) instead of Z induces compatible quasi-isomorphisms in de Rham and HK cohomology. The same comparison holds for the union of the Z_j by analytic Čech descent under the source’s complete-intersection hypotheses. The resulting dagger complement over C has de Rham slopes ≥0. The chosen tube definition and its radius inequalities must be part of the geometric supplier. The restriction preserves the induced filtration, but equality of filtration lattices or a filtered-complex quasi-isomorphism is not required: lattice containment transfers acyclicity through a torsion quotient at ∞.

**Source.** CN25, Proposition 8.4 and the following paragraph, p. 52. Applies invariance for sufficiently small tubes; the local product uses a local piece of Z. GK04, Proposition 3.7, pp.14–16, in arXiv v1 pagination. Supplies the unfiltered de Rham invariance after the required local product and radius hypotheses have been checked.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.3/almost-proper-slopes`, `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.0/modified-bundle`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.

**Construction/proof.**

1. Use the local normal-coordinate description along the smooth complete intersection and the unfiltered tube invariance of de Rham cohomology in Grosse-Klönne Proposition 3.7.
2. Transfer to HK through its comparison and naturality; check analytic Čech descent for all strata used in the union statement. The precise radius and descent compatibility remain part of G-GEOMETRIC.
3. Use quasi-compact smallness and naturality to include the induced lattice of the almost proper complement in that of the tube complement. The resulting injective bundle map has torsion cokernel at ∞; its cohomology sequence transfers H¹=0 as in the semistable tube case.

**Check.** No theorem for every radius or for a singular complete intersection is asserted. Before closing this target, establish the compatible HK comparison and natural inclusion of the induced B_dR⁺ lattices, and verify the strata and radius hypotheses for the union descent. Underlying de Rham invariance alone supplies no equality of filtrations.

**Unresolved direct inputs.** G-GEOMETRIC.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-GEOMETRIC, G-LEAN. All imported gaps remain inherited; none of these layers is closed.


## CS.4 — Inverse limits and proper times Stein

Keep the countable exhaustion as data and compute Milnor/R¹lim obstructions. Prove proper-factor étale Künneth, the required proper-times-Stein limit vanishing and its pro-étale Künneth consequence, then obtain the global bicartesian square without assuming smallness.

**Layer dependencies.** `CstConjectureForDaggerVarieties:CS.1`, `CstConjectureForDaggerVarieties:CS.2`, `CstConjectureForDaggerVarieties:CS.3`, `VectorBundlesAndIsocrystals:VB3:general-BC`.


### Cohomology along a countable exhaustion

**Target `CS.4/exhaustion-data` (construction).** Fix a smooth dagger X/C with a chosen increasing admissible exhaustion X=⋃_{n∈N}X_n by quasi-compact open dagger subspaces, each having nonnegative de Rham slopes. For fixed r use the inverse systems H_n^{r,i},X_n^{r,i},F_n^{r,i},B_n^i,A_n^{r,i} and F̄_n^{r,i}=F_n^{r,i}/A_n^{r,i}=Fil_n^{r,i}, with restriction maps. The global versions are cohomology of the respective derived inverse-limit complexes, not definitions as ordinary limits of groups. In this setting X^{r,i}≅lim X_n^{r,i}, B^i≅lim B_n^i, and R¹lim X_n^{r,i}=R¹lim F̄_n^{r,i}=0.

**Source.** CN25, §8.2.1, notation (8.5)–(8.8) and Remark 8.9(i)–(ii), pp. 52–53. Sets up compatible systems while distinguishing cohomology of a limit from limits of cohomology.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`, `CstConjectureForDaggerVarieties:CS.2/defect-sequence`.

**Construction/proof.**

1. Restrict the analytic complexes and their comparison maps to the chosen exhaustion.
2. Use the imported derived-limit descent for HK, filtered de Rham and pro-étale complexes.
3. Apply the analytic inverse-limit vanishing statements from Part I, Propositions 5.8 and 5.12, including the finite BC quotient argument for F̄^r.

**Uses that determine the API.**

- CN25, Remark 8.9 and Lemma 8.10: Tracks the obstruction terms in passage to the limit.
- CN25, Proposition 8.17: Supplies the countable exhaustion of a proper-times-Stein space.

**API.**

- `ExhaustionCohomology.restrict` (functoriality): Restriction maps commute with all four corners and the torsion kernels.
- `ExhaustionCohomology.image` (characterisation): F̄_n=F_n/A_n is the induced image filtration, not F_n itself.
- `ExhaustionCohomology.refine` (compatibility): A cofinal refinement induces the canonical isomorphism of derived-limit complexes.
- `ExhaustionCohomology.period_limits` (relation): X and B identify with their ordinary limits under the stated analytic descent hypotheses.

**Unit tests.**

- `ExhaustionCohomology.constant`: For a constant exhaustion X_n=X the derived-limit complex is the original complex and the R¹lim terms vanish.
- `ExhaustionCohomology.disc_torsion`: For an exhaustion of the dagger open disc, F_n^{1,1} can have a nonzero torsion kernel although F̄_n^{1,1}=0; replacing F by F̄ loses that kernel.
- `ExhaustionCohomology.cofinal`: Replacing X_n by X_{2n} preserves the resulting global complex, not merely its underlying set of points.

**Check.** The exhaustion is specified data; no countability assertion for arbitrary dagger spaces is made.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** Cohomology along exhaustions.


### The inverse-limit obstruction sequence

**Target `CS.4/limit-obstruction` (theorem).** For the chosen exhaustion and a fixed r, in each degree i≤r the Milnor sequences are 0→R¹lim F_n^{r,i−1}→F^{r,i}→lim F_n^{r,i}→0 and 0→R¹lim H_n^{r,i−1}→H^{r,i}→lim H_n^{r,i}→0. The stagewise comparison sequences give 0→lim H_n^{r,i}→lim X_n^{r,i}⊕lim F_n^{r,i}→lim B_n^i→R¹lim H_n^{r,i}→R¹lim F_n^{r,i}→0. If R¹lim H_n^{r,j}=0 in the adjacent degrees needed for all 0≤i≤r, the global sequence 0→H^{r,i}→X^{r,i}⊕F^{r,i}→B^i→0 is exact and R¹lim F_n^{r,i}=0 in that range.

**Source.** CN25, Remark 8.9(ii)–(iii), p. 53. Locates both the preceding-degree and same-degree obstructions.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.4/exhaustion-data`, `CstConjectureForDaggerVarieties:CS.2/defect-sequence`.

**Construction/proof.**

1. Apply countable derived-limit cohomological dimension one to the complexes for the Milnor sequences.
2. Apply the long exact inverse-limit sequence to the stagewise short exact comparison sequence.
3. Use R¹lim X_n=0 and the two Milnor sequences to replace the limits by the actual global groups.

**Check.** At degree zero all negative-degree groups vanish. Do not suppress R¹lim before proving its vanishing.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** The inverse-limit obstruction.


### A de Rham criterion for R¹lim vanishing

**Target `CS.4/derived-limit-criterion` (theorem).** For the exhaustion above, fixed r and i≤r, R¹lim DR_n^{r,i−1}=0 implies R¹lim A_n^{r,i}=0, which implies R¹lim H_n^{r,i}=0. Here DR_n^{r,j}=Hʲ(RΓ_dR(X_n/B_dR⁺)/Fʳ). Moreover R¹lim(H_n^{r,i}/A_n^{r,i})=0 without the first hypothesis: these quotients lift functorially to finite BC objects.

**Source.** CN25, Lemma 8.10, Remark 8.11 and footnote 22, p. 53; Remark 3.15, p.16. Reduces the difficult pro-étale limit to truncated de Rham cohomology.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.4/limit-obstruction`, `CstConjectureForDaggerVarieties:CS.2/canonical-qbc-filtration`, `VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`.

**Construction/proof.**

1. The de Rham long exact sequence expresses A_n as a quotient of DR_n^{r,i−1}; countable R²lim=0 proves the first implication.
2. Use comparison to express H_n/A_n as a kernel between finite BC objects, retaining their Vector Space lifts.
3. Use countable BC inverse-limit vanishing and the long exact sequence for 0→A_n→H_n→H_n/A_n→0.

**Check.** A system of arbitrary topological Q_p-vector spaces is not assumed R¹lim-acyclic.

**Unresolved direct inputs.** G-ANALYTIC, G-QBC.

**Atlas planet.** The de Rham limit criterion.


### Étale Künneth with a proper factor

**Target `CS.4/proper-factor-kunneth` (theorem).** For smooth rigid analytic Y,T/C with Y proper, cup product gives ⊕_{j≥0}Hʲ_ét(Y,Q_p)⊗_{Q_p}H^{i−j}_ét(T,Q_p)≅Hⁱ_ét(Y×T,Q_p) for every i≥0. The sum is finite in each degree. At integral level the corresponding comparison uses a derived tensor over Z_p. The perfect coefficient complex in the projection formula is RΓ_ét(Y,Z_p); no perfection of RΓ_ét(T,Z_p) is assumed.

**Source.** CN25, Lemma 8.13, equations (8.14)–(8.15), p. 54 (perfect-factor correction). Proves the product formula with a single proper factor.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/proper-comparison-c`.

**Construction/proof.**

1. Apply proper base change to the projection Y×T→T to identify its derived direct image with the constant RΓ_ét(Y,Z_p).
2. Use perfection of the proper factor to pull this constant complex through derived global sections.
3. Invert p and take cohomology over the field Q_p.

**Check.** The proper factor has finite-dimensional Q_p-cohomology; no analogous formula for two arbitrary nonproper factors is inferred.

**Unresolved direct inputs.** G-ETALE.

**Atlas planet.** Proper-factor Künneth.


### R¹lim vanishing for proper times Stein

**Target `CS.4/proper-stein-limit-vanishing` (theorem).** Let Y/C be smooth proper and S/C smooth dagger Stein, with a strictly increasing admissible covering by open dagger affinoids S_n. Put X_n=Y×S_n. For every i≥0, R¹lim_n Hⁱ_proét(X_n,Q_p)=0. Consequently Hⁱ_proét(Y×S,Q_p)≅lim_n Hⁱ_proét(X_n,Q_p), with the natural cohomological topologies.

**Source.** CN25, Proposition 8.12 and Remark 8.16(i), p. 54. Proves the actual limit vanishing needed for the non-small product.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.4/proper-factor-kunneth`, `CstConjectureForDaggerVarieties:CS.1/stein-affinoid-diagram`, `CstConjectureForDaggerVarieties:CS.4/exhaustion-data`, `CstConjectureForDaggerVarieties:CS.3/product-slopes`.

**Construction/proof.**

1. Compare the derived inverse systems of dagger pieces and their rigid completions using cofinal strict shrinkings of the Stein exhaustion and the analytic descent contract. The affinoid pieces are not partially proper, so a termwise completion isomorphism is not used.
2. On the quasi-compact completions use the étale realization relevant to the comparison.
3. Apply proper-factor étale Künneth; the finite-dimensional proper groups commute with the inverse-limit computation.
4. Use the Stein/affinoid diagram and the analytic Stein limit theorem for S_n to kill R¹lim of the second factor.

**Check.** The comparison between dagger and completed systems is a derived-limit statement; do not assert it for every single non-partially-proper dagger space.

**Unresolved direct inputs.** G-ANALYTIC, G-ETALE.

**Atlas planet.** Proper times Stein limit vanishing.


### Pro-étale Künneth for proper times Stein

**Target `CS.4/proper-stein-proetale-kunneth` (theorem).** For the same Y,S, cup product gives ⊕_jHʲ_proét(Y,Q_p)⊗_{Q_p}H^{i−j}_proét(S,Q_p)≅Hⁱ_proét(Y×S,Q_p). The tensor products are ordinary tensors with the finite-dimensional proper-factor groups, carrying their natural finite direct-sum topology. This statement is restricted to a proper factor; the analogous algebraic tensor formula fails for the product of two open one-dimensional balls.

**Source.** CN25, Remark 8.16(ii), p. 54. Records the additional product theorem and its finiteness boundary.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.4/proper-factor-kunneth`, `CstConjectureForDaggerVarieties:CS.4/proper-stein-limit-vanishing`.

**Construction/proof.**

1. Pass the proper-factor étale Künneth maps to the inverse limit over S_n.
2. Use proper finiteness and the preceding R¹lim vanishing to identify both sides with pro-étale groups.

**Check.** There is no general pro-étale Künneth assertion for two nonproper factors.


### The fundamental diagram for proper times Stein

**Target `CS.4/proper-stein-fundamental-diagram` (theorem).** For smooth proper Y/C and smooth dagger Stein S/C, X=Y×S has a bicartesian fundamental square in LH(C_Q_p) for every 0≤i≤r, r≥0. Its associated sequence is 0→Hⁱ_proét(X,Q_p(r))→(Hⁱ_HK(X)⊗̂B_st⁺)^{N=0,φ=pʳ}⊕Hⁱ(FʳRΓ_dR(X/B_dR⁺))→Hⁱ_dR(X/B_dR⁺)→0, with the difference-map signs. Smallness of the global space X is not required.

**Source.** CN25, Proposition 8.17, p. 55. Extends the comparison beyond finite-free global de Rham cohomology.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.4/proper-stein-limit-vanishing`, `CstConjectureForDaggerVarieties:CS.4/limit-obstruction`, `CstConjectureForDaggerVarieties:CS.1/fundamental-square`, `CstConjectureForDaggerVarieties:CS.3/product-slopes`, `CstConjectureForDaggerVarieties:CS.1/elementary-bicartesian-cases`.

**Construction/proof.**

1. Each X_n=Y×S_n has nonnegative de Rham slopes by product stability and the proper and affinoid cases.
2. Apply stagewise comparison, proper-times-Stein R¹lim vanishing and the inverse-limit obstruction sequence.
3. Use the classical-corner criterion to lift exactness to the abelian left heart.

**Check.** Neither the small-variety height equality nor the finite-HK recovery theorem is automatically extended to this non-small case.

**Unresolved direct inputs.** G-ANALYTIC.

**Atlas planet.** Proper times Stein comparison.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-ANALYTIC, G-ETALE, G-LEAN, G-QBC. All imported gaps remain inherited; none of these layers is closed.


## CS.5 — Arithmetic and geometric period recovery

Remove arithmetic differential and torsion kernels before applying the imported period functors. Prove Theorem 9.3 with Galois and filtration data, and Theorem 9.8 with natural Topological Vector Space Hom and extended modules; retain positive crystalline affinoid bounds and the precise limits of recovery.

**Layer dependencies.** `CstConjectureForDaggerVarieties:CS.0`, `CstConjectureForDaggerVarieties:CS.1`, `CstConjectureForDaggerVarieties:CS.2`, `CstConjectureForDaggerVarieties:CS.3`, `CstConjectureForDaggerVarieties:CS.4`, `PadicHodgeTheory:R06.2`, `VectorBundlesAndIsocrystals:VB3:general-BC`.


### Vanishing on the differential error term

**Target `CS.5/differential-period-hom-vanishing` (theorem).** For a smooth dagger affinoid X/K and i≥1, both Hom^{sm}_{G_K}((Ω^{i−1}(X)/ker d)⊗̂_K C,B_st) and Hom_{G_K}((Ω^{i−1}(X)/ker d)⊗̂_K C,B_dR) vanish. The maps are continuous Q_p-linear; the smooth Hom means the union of Hom_{G_L} over finite L/K. The same argument applies to the relevant Čech terms used for quasi-compact X. For i=0 the differential term is zero.

**Source.** CN25, Lemma 9.5 and its proof, pp. 55–56. Removes the differential term in affinoid period recovery.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/stein-affinoid-diagram`, `PadicHodgeTheory:R06.2/almost-c-contravariant-periods`.

**Construction/proof.**

1. Reduce smooth B_st maps to B_dR maps equivariant for G_L.
2. Use Fontaine’s vanishing Hom_{G_L}(C,B_dR)=0 on each simple tensor.
3. Use density of algebraic tensors and continuity in the completed tensor product.

**Check.** Continuity and density are essential; unrestricted algebraic Hom is not used.

**Unresolved direct inputs.** G-PERIOD-HOM, G-ANALYTIC.


### Vanishing on the arithmetic torsion kernel

**Target `CS.5/arithmetic-torsion-hom-vanishing` (theorem).** For a small smooth dagger X/K whose base change to C has nonnegative de Rham slopes, set A^{r,i}=ker(Hⁱ(FʳRΓ_dR(X_C/B_dR⁺))→Hⁱ_dR(X_C/B_dR⁺)), i≤r. Then Hom^{sm}_{G_K}(A^{r,i},B_st)=Hom_{G_K}(A^{r,i},B_dR)=0. The topology and G_K action are the natural ones. The quasi-compact proof extends to the other small cases through the finite-free cohomology and strict Čech presentations used in §9.1.3.

**Source.** CN25, Lemma 9.6 and §§9.1.2–9.1.3, pp. 56–57. Removes the infinite torsion part before applying finite filtered-module recovery.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.1/cohomology-notation`, `CstConjectureForDaggerVarieties:CS.5/differential-period-hom-vanishing`, `CstConjectureForDaggerVarieties:CS.3/nonnegative-de-rham-slopes`.

**Construction/proof.**

1. Express A as a quotient of the preceding truncated de Rham cohomology.
2. Compute truncated de Rham cohomology by Čech complexes with coefficients B_dR⁺/t^k.
3. Use the Banach/compact-type presentations, density and the differential vanishing argument degree by degree.
4. Pass through the strict quotients and the source’s smallness reduction.

**Check.** This is not obtained by pretending A is a finite BC object.

**Unresolved direct inputs.** G-ANALYTIC, G-PERIOD-HOM.


### Arithmetic pro-étale-to-de Rham recovery

**Target `CS.5/recovery-k` (theorem).** Let X/K be smooth dagger and assume X_C has de Rham slopes ≥0 (hence is small). For every i≥0, naturally and strictly for the weak Hom topologies, Hom^{sm}_{G_K}(Hⁱ_proét(X_C,Q_p),B_st)≅Hⁱ_HK(X_C)^∨ as (φ,N,G_K)-modules over Fⁿʳ, and Hom_{G_K}(Hⁱ_proét(X_C,Q_p),B_dR)≅Hⁱ_dR(X/K)^∨ as filtered K-modules. Filtration on Hom is pointwise image in tʲB_dR⁺; smooth invariants are the colimit over finite extensions. These are contravariant duals; the Hodge filtration is retained only with the arithmetic G_K structure.

**Source.** CN25, Theorem 9.3; Remark 9.2; §§9.1.1–9.1.3, pp. 55–57. Proves Conjecture 9.1 under the stated small nonnegative-slope hypothesis.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.5/arithmetic-torsion-hom-vanishing`, `CstConjectureForDaggerVarieties:CS.2/local-equivalence`, `PadicHodgeTheory:R06.2/acyclic-period-reconstruction`, `PadicHodgeTheory:R06.2/almost-c-contravariant-periods`.

**Construction/proof.**

1. Choose r≥i, use bicartesian comparison, and quotient H^{r,i} by A^{r,i}.
2. Identify that quotient with the bounded V_st^r of the induced acyclic filtered HK module.
3. Kill maps from A by arithmetic torsion vanishing and apply the imported arithmetic acyclic period reconstruction.
4. Undo the Tate twist, check the φ,N,G_K and filtration conventions, and establish strictness using the Hausdorff weak Hom topology and finite-dimensional source of the comparison.

**Check.** The general smooth-dagger statement of Conjecture 9.1 remains open in this source. For proper X this specializes to the proper comparison without a semistable-model hypothesis.

**Unresolved direct inputs.** G-ANALYTIC, G-PERIOD-HOM.

**Atlas planet.** Arithmetic period recovery.


### Geometric pro-étale-to-period-module recovery

**Target `CS.5/recovery-c` (theorem).** Let X/C be smooth dagger with de Rham slopes ≥0. With 𝐇 the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p), M=Hⁱ_HK(X) and B=Hⁱ_dR(X/B_dR⁺), there are natural B_st- and B_dR-linear isomorphisms Hom_TVS(𝐇,𝐁_st)≅Hom_{Fⁿʳ}(M,B_st) and Hom_TVS(𝐇,𝐁_dR)≅Hom_{B_dR⁺}(B,B_dR). Here Hom_TVS consists of natural transformations between functors on sympathetic algebras valued in LH(C_Q_p), with the boundedness condition of Definition 4.1. It is not the set of arbitrary continuous maps on C-points. These recover extended period modules; no φ,N or Hodge filtration is claimed to be recovered from the geometric functor alone.

**Source.** CN25, Theorem 9.8 and §9.2 proof, pp. 57–58 (TVS category correction). Proves the geometric recovery theorem at the module level justified by its input.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.2/canonical-qbc-filtration`, `CstConjectureForDaggerVarieties:CS.2/defect-sequence`, `CstConjectureForDaggerVarieties:CS.0/filtered-period-hom`, `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`.

**Construction/proof.**

1. Use the canonical qBC filtration and the fundamental diagram to identify H/A with bounded V_st^r after twisting.
2. Present the reasonable B_dR⁺-Pair A densely by finite torsion pieces; their maps to B_dR and B_st vanish, and continuity passes this to A.
3. Apply filtered-period-Hom and undo the Tate twist to obtain both module isomorphisms.

**Check.** The theorem’s input is X over C; there is no further base change X_C to define. Retain the full natural Topological Vector Space functor in Hom; neither arbitrary continuous C-point maps nor period-linear maps on H are the specified Hom.

**Unresolved direct inputs.** G-QBC, G-PERIOD-HOM.

**Atlas planet.** Geometric period-module recovery.


### Positive crystalline recovery for affinoids

**Target `CS.5/crystalline-positive-hom-bounds` (theorem).** For a smooth dagger affinoid X/C in degree i, put M=Hⁱ_HK(X), B=Hⁱ_dR(X/B_dR⁺) and r=i. Monodromy untwisting identifies X_st^i(M) with X_cris^i(M). The intended strengthened affinoid comparison is Hom_TVS(Hⁱ_proét(X,Q_p(i)),B_cris⁺)≅Hom_TVS(X_cris^i(M),B_cris⁺)=M^∨⊗B_cris⁺. After the stated completed unramified scalar extension and duality it recovers φ on M⊗_{Fⁿʳ}F̂ⁿʳ. Also Fil^{i+k}B=t^kB for k≥0. The equality with positive crystalline coefficients is an exact target of Remark 9.9(ii), subject to G-CRIS; the weaker sandwich M^∨⊗B_cris⁺⊆Hom_VS(X_cris^i(M),B_cris⁺)⊆M^∨⊗t^{−i}B_cris⁺ alone does not prove that equality.

**Source.** CN25, Remarks 5.19 and 5.21, pp. 38–39; Remark 9.9(ii), p. 58. Records the stronger affinoid equality and its proof obligation separately from the general B_st comparison.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.0/eigenspace-period-hom`, `CstConjectureForDaggerVarieties:CS.0/eigenspace-generation`, `CstConjectureForDaggerVarieties:CS.1/stein-affinoid-diagram`, `CstConjectureForDaggerVarieties:CS.5/recovery-c`.

**Construction/proof.**

1. Apply eigenspace generation and the weaker positive crystalline Hom sandwich.
2. Use the affinoid exact sequence and torsion-Pair Hom vanishing to remove the differential term.
3. Establish the additional positive-period criterion for these Hom maps required by the final equality in Remark 9.9(ii); this is G-CRIS, not supplied by the sandwich.
4. Then extend scalars to F̂ⁿʳ and dualize, respecting φ; use the affinoid filtered de Rham complex for the displayed filtration.

**Check.** Prove the exact positive equality, not just the t^{−i} sandwich. Keep the completed coefficient extension and distinguish it from recovery of the original Fⁿʳ descent datum.

**Unresolved direct inputs.** G-PERIOD-HOM, G-CRIS.


### Information and scope of the recovery theorems

**Target `CS.5/limits-of-recovery` (application).** For a smooth proper X/C the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p) is the constant finite-dimensional Q_p functor. Its geometric period Hom functors therefore retain its rank and the corresponding free extended period modules, while the source’s extra φ,N and filtration data require additional structure. The full recovery assertions for arbitrary smooth dagger spaces, including the sheafified direction of Remark 9.9(iii), are research problems, not theorem targets discharged by Theorems 9.3 or 9.8.

**Source.** CN25, Remark 9.9(i),(iii), p. 58; Conjectures 1.6, 1.8 and 9.1, pp.5,55. States precisely what is and is not obtained by the proved recovery theorems.

**Prerequisites.** `CstConjectureForDaggerVarieties:CS.5/recovery-k`, `CstConjectureForDaggerVarieties:CS.5/recovery-c`, `CstConjectureForDaggerVarieties:CS.4/proper-stein-fundamental-diagram`.

**Construction/proof.**

1. Specialize geometric recovery to a constant finite Q_p functor and identify its natural period Hom modules with finite free modules.
2. Compare the arithmetic theorem’s G_K input with the geometric theorem’s Topological Vector Space functor input.
3. Record the unrestricted conjectures as open and keep all non-small cases outside the finite-module recovery theorem.

**Check.** No universal recovery statement or impossibility theorem is promoted from the source’s discussion.

**Layer acceptance.** Every target above must be proved with its stated topology, range, functoriality and source corrections, and every definition/construction must pass at least three discriminating tests. Current status: planned. Direct gap classes: G-ANALYTIC, G-CRIS, G-LEAN, G-PERIOD-HOM, G-QBC. All imported gaps remain inherited; none of these layers is closed.


## Supplier obligations and proof gaps

These contracts terminate prerequisite chains at target granularity. A routing request to an existing owner does not assert that its current stage already proves the requested extension. The packet distinguishes such requests explicitly.


### G-ANALYTIC — Model-free analytic cohomology package and limit descent

Supply the actual complexes, topologies, natural VS lifts, strict α_r:τ≤rRΓ_syn→τ≤rRΓ_proét, HK and B_dR⁺ comparisons, φ-slope bound [0,min(i,dim X)], syntomic fiber and filtered triangle, and functorial partial-proper completion and countable exhaustion descent summarized in Proposition 6.1, pp.39–40 and Remark 8.9, p.53. CN Part I Theorems 4.27,5.8,5.12 and its §7.3 are cited by CN25 but not independently checked here. The extraction’s proposed SyntomicCohomologyAndSteinComparison is not a defined roadmap in this checkout, and the earlier model-based Stein route is narrower. Route a model-free extension through the comparison owners; no existing proper comparison stage is represented as supplying this contract. For Proposition 8.12 specifically, supply the comparison of derived inverse systems of dagger affinoid pieces and their rigid completions after cofinal strict shrinkings. Partial-proper invariance cannot be applied separately to those affinoid pieces.


### G-QBC — Reasonable period Pairs and qBC extension beyond finite BC

Supply CN25 §§2,4: the actual natural Topological Vector Space category of Definition 4.1 (not just ordinary C-point topologies), reasonable B_dR⁺-Pairs, qBC recognition, canonical curvature filtration, signed height additivity, natural TVS realization and compatibility with finite BC. Include the dense finite-torsion presentations, the adjacent syntomic positive piece of Proposition 7.10 and countable BC inverse-limit vanishing of Remark 3.15. VB3’s read packet supplies finite BC only. The proposed VectorBundlesAndIsocrystalsPartII is not yet defined and is requested as an extension rather than an existing prerequisite.


### G-PERIOD-HOM — Qualified period Hom, torsion Ext and bounded filtered interfaces

Supply arbitrary VS-to-B_dR bounded-image Hom vanishing and Ext¹,natural vanishing on finite torsion periods (Corollary 3.18, Lemma 3.26); the reviewed VB3 packet itself leaves G-HOM and G-EXT open. Supply the compatibility of VS and natural Topological Vector Space Hom in §9.2, arithmetic Fontaine Hom vanishing, and the smaller weakly admissible filtration with the same bounds (Lemmas 5.3–5.4) needed by bounded arithmetic reconstruction. R06.2 owns the generic arithmetic period functors and reconstruction, not a second definition here. Correct the degree and containment conventions before use. Include Proposition 3.27(i), pp.19–20: for every finite BC W of curvature ≤0, Hom_VS(W,B_dR) is finite free over B_dR of rank ht(W), with the natural evaluation comparison. Euler height by itself supplies no period-Hom rank theorem.


### G-GEOMETRIC — Analytic finiteness, GAGA, logarithmic pairs and tube invariance

Supply finite-free B_dR⁺/HK cohomology and compatible Künneth over C, HK GAGA for finite-type algebraic C-varieties, characteristic-zero resolution of smooth proper rigid pairs with arbitrary closed boundary, the logarithmic comparison sequence, and compatible unfiltered de Rham/HK tube comparisons for Propositions 8.3–8.4. Include naturality of the induced filtration map, full-lattice containment inside the common localized period module, the tube radius definition and the strata/radius checks for union descent. Read F1 nodes have discretely valued finiteness/Künneth hypotheses and affinoid resolution scope, and do not supply these C/global cases. Do not request a filtered-complex quasi-isomorphism: E16 shows that is too strong. Lattice containment with torsion quotient, not equality, is the input needed for the slope application.


### G-ETALE — Proper rigid étale finiteness, base change and product comparison

Supply finite/perfect proper Z_p-cohomology and Bhatt–Hansen proper base change in the smooth rigid setting needed for Lemma 8.13, p.54, together with the rational/pro-étale comparison for the completed quasi-compact pieces in Proposition 8.12. The underlying proper factor, not the arbitrary second factor, is the perfect complex used in the projection formula. Existing algebraic period comparison is not a proof of this analytic input.


### G-FA — Strong-dual strictness for the syntomic splitting

The read L0/compact-type-extension-duality node retains hypotheses H1 (strict strong-dual sequence) and H2 (continuous bidual map). The source uses stereotype duals; neither the required strong-dual strictness nor continuity on the unknown middle term follows from the endpoint identifications alone. Supply H1/H2 for the spaces in Proposition 7.15, pp.49–50, or another valid splitting argument. This is a qualified missing import, not an assertion that the extension theorem is false; G-FA is confined to the splitting branch and is not an input to Theorem 8.1 or recovery.


### G-CRIS — Positive crystalline equality in the affinoid refinement

Remark 9.9(ii), p.58 strengthens Remarks 5.19/5.21 from a bounded sandwich to an exact B_cris⁺ Hom equality and Frobenius recovery after completion of Fⁿʳ. Its last equality uses a criterion involving all positive Frobenius iterates lying in B_dR⁺. The public LaTeX source itself discusses the distinction between B_cris⁺ and B_max⁺ in a commented justification, so a formal proof must identify the exact additional condition on these restricted Hom maps, or pass through a justified B_max⁺ argument; mere localization or the t^{−i} bound is insufficient. This stronger positivity input was not independently established in this pass. Keep the target and this gap; Theorems 9.3 and 9.8 do not depend on it.


### G-LEAN — Heavy carriers and geometric comparison types at the pins

Neither pinned search nor the read current-library audit supplies genuine dagger analytic cohomology, qBC/Pairs, geometric FF modified bundles and the requisite strict derived completed period interfaces. The suggested file therefore checks only existing categorical and module conventions and the sign test; its examples encode none of the comparison theorems. Replace no carrier by an arbitrary type, opaque placeholder or mathematical assertion parameter. Instantiate mathematical targets only when their owners provide the actual carriers.


## Independently checked source findings

All findings concern the consulted CN5/arXiv v4 text; none is a finding against an unread publisher version. The packet records the version, correction search and independent verdict for each entry. E14 and E15 are qualified proof obligations, not claims that their conclusions are false.

- **E1 — confirmed**, CN5 author manuscript / arXiv v4: §5.1.2, p.32: Use deg=t_H−t_N in the acyclic HN convention. Shrinking a filtration lowers t_H; Lemma 5.3 needs it to lower degree, and the modified-bundle slope uses that same sign.
- **E2 — confirmed**, CN5 author manuscript / arXiv v4: Lemma 5.4 proof, p.33: Keep Fil¹_i=Fil_i for i≠i₀, and change only i₀. Otherwise the described modification contradicts the preserved degree-zero boundary condition.
- **E3 — confirmed**, CN5 author manuscript / arXiv v4: Proposition 5.20 statement, p.38: Use B_st⁺, as in X_st^r and the short exact sequence in the proof. An unrestricted period vector can have negative t-powers and cannot be mapped to the stated positive quotient in that manner.
- **E4 — confirmed**, CN5 author manuscript / arXiv v4: Proposition 5.20 proof, p.38: Choose the weakly admissible lattice L′ inside L. Remark 5.14(iii) provides a smaller lattice; its period vectors must lie in the bounded kernel being tested.
- **E5 — rejected.** Independent reading of p.38 and the corresponding public LaTeX formula shows the earlier allegation of a torsion-quotient target was a transcription error in the extraction. No correction to that formula is needed.
- **E6 — confirmed**, CN5 author manuscript / arXiv v4: Proposition 5.23 proof diagram, p.39: The upper-left source of the reconstruction map is M^∨⊗(B_dR⁺/t^k); track multiplication by t^r in the composite, not in that source. This is the displayed map in the proposition; at r>0 the extra factor changes its domain and the torsion-error argument.
- **E7 — confirmed**, CN5 author manuscript / arXiv v4: Remark 6.13, p.42: Use F⁰Hⁱ_dR(X/B_dR), the lattice induced by the cohomological filtration. The proper filtered comparison identifies the latter lattice; forgetting the Hodge convolution changes its modification.
- **E8 — confirmed**, CN5 author manuscript / arXiv v4: Corollary 6.19, p.43: Use Hⁱ_proét(X,Q_p(r)) in this diagram. Theorem 6.14 and α_r construct the pro-étale group; the unrestricted analytic étale group is not substituted here.
- **E9 — confirmed**, CN5 author manuscript / arXiv v4: Sequence (6.17), p.43 (associated to square (6.16)): For a commutative square c a=d b choose u=(a,b), v=(c,−d), or change one sign in u instead. For the degree-zero point square, u(1)=(1,1) and the printed sum sends it to 2. The difference sends it to zero, as a complex requires.
- **E10 — confirmed**, CN5 author manuscript / arXiv v4: Equation (8.7), p.52; Remark 8.9(iii), p.53: Use global F^{r,i} in the global sequence, and apply the inverse limit to stagewise (8.8). A free stage index cannot occur in a canonical global sequence; the displayed long exact limit sequence is precisely the one induced by (8.8).
- **E11 — confirmed**, CN5 author manuscript / arXiv v4: Lemma 8.13 proof, p.54: Use perfection of RΓ_ét(Y,Z_p), with Y proper, to commute that coefficient complex through RΓ_ét(T,−). The second factor T is arbitrary and need not have perfect cohomology. The projection formula needs a perfect coefficient object, which the proper factor supplies.
- **E12 — confirmed**, CN5 author manuscript / arXiv v4: Lemma 7.13 and Remark 7.14, p.49: Index summands by j∈J_i and take Q_{p^{h_j}} on the block of rank h_j. The preceding Dieudonné–Manin decomposition defines J_i and h_j, and Frobenius closes after h_j iterates on that block.
- **E13 — confirmed**, CN5 author manuscript / arXiv v4: Theorem 9.8 proof, p.57: Use X over C directly; h is defined on Topological Vector Spaces, including qBCs, not only period Pairs. The theorem assumes X/C, and its H object can have nonzero finite BC graded pieces and therefore is not generally a period Pair.
- **E14 — confirmed**, CN5 author manuscript / arXiv v4: Proposition A.4 proof, p.59: Use the conditional L0/compact-type-extension-duality interface and prove H1/H2 for the spaces in Proposition 7.15, or replace the argument. The read source does not supply the strict dual sequence and continuous bidual map needed by the owner’s chosen strong-dual repair. This confirms the missing import for this formalisation route, without asserting that stereotype and strong topologies are interchangeable or that the extension theorem is false.
- **E15 — confirmed**, CN5 author manuscript / arXiv v4: Remark 9.9(ii), p.58: Supply a valid positivity criterion for these restricted natural Hom maps, with any necessary B_max⁺ passage and its compatibility; retain G-CRIS until it is proved. The earlier bounded Hom sandwich only supplies a t^{−i} error. The public LaTeX discussion distinguishes B_cris⁺ positivity from B_max⁺ positivity, so that bound alone cannot discharge the claimed exact equality. This pass has not established the missing refinement.
- **E16 — confirmed**, CN5 author manuscript / arXiv v4: Proposition 8.3, p.51 and its B_dR follow-up, p.52; compare GK04 Corollary 3.8, p.16: Use the unfiltered de Rham/HK comparison and the natural map of induced full B_dR⁺ lattices. Its containment gives a bundle injection with torsion cokernel, enough to transfer acyclicity. Do not claim an equivalence of the naive-Hodge filtered complexes. Take the weak formal projective line with boundary the infinity section. The map is restriction from the analytic affine line to the dagger closed unit disc. For gr⁰ of the naive Hodge filtration its H⁰ is the restriction on functions; (1−πT)⁻¹ is overconvergent on the disc but has a pole at π⁻¹ in the affine line, so restriction is not onto. GK04 Corollary 3.8 asserts only the underlying de Rham isomorphism.

## Coverage and acceptance boundary

All 74 items routed by PAPER-COLMEZ-NIZIOL-25 are mapped individually in `sourceAccounting`. Introductory duplicates are mapped to the detailed targets; pre-existing objects are imports, unsupported generic inputs are supplier contracts, and conjectural items retain that status. The 46 targets comprise five definitions, six constructions, 32 theorems and three applications. The eleven definitions/constructions carry 55 API items and 34 discriminatory tests. There are 29 planets, at most six per layer.

A promotion check must obtain the actual model-free analytic package, reasonable qBC/TVS theory, period Hom/Ext interfaces, geometric C/global extensions, proper rigid étale finiteness/base change, the qualified splitting proof and the positive crystalline refinement before resolving their gaps. It must then instantiate the heavy carriers and recheck all statements. Passing the JSON checker or the companion Lean convention examples does not close any of those mathematical obligations.
