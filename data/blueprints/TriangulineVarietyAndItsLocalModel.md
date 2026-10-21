# Roadmap: the trianguline variety and its local model

This roadmap compares generic trianguline deformation spaces with completed double-flag incidence varieties, retaining character weights and both framings. It derives local normality, tangent bounds, companion criteria and local cycle identities, then develops the crystabelline deformation and higher-intertwining parameters used to recover Hodge filtrations. A separate local branch supplies the ordered-regular tangent and numerical noncriticality inputs to eigenvariety arguments.

The end results are the completed local-model comparison, the local companion criterion and the crystalline cycle formula, together with the higher-intertwining exact sequences that recover crystabelline Hodge parameters. This is a complete target-level plan: all thirteen layers are **planned**, and every target has a prerequisite path to existing declarations, an exact supplier contract or one of the two explicit supplier gaps. It makes no implementation claim.

## Scope and ownership

This roadmap owns the deformation adapters, the two period flags, the comparison with the double-flag incidence model, the resulting local analytic geometry and cycle transfers, and the crystabelline tangent relations. A separate local branch owns the ordered-regular trianguline arguments used by Newton–Thorne and the nontrianguline rank-two obstruction used by Dospinescu–Le Bras. Global eigenvarieties, patching, completed cohomology, global socles and automorphy theorems consume these results.

Period rings, coefficient B-pairs, almost de Rham period equivalences and the module D_σ belong to `PadicHodgeTheory`; Robba categories, integral triangulations and KPX global/specialization theory belong to `PhiGammaModulesAndIwasawaCohomology`. The Grothendieck resolution, incidence components, normality, Cartan flatness, Steinberg cycles and geometric KL identities belong to `SpringerResolutionAndCharacteristicCycles`. Galois deformation rings, Schlessinger theory, rigid spaces and character spaces retain their existing owners. Requests below extend those directions, rather than defining their objects again.

The ownership audit read the current upstream roadmap tree at `350e970ce49f707a327909beac0b7b7c782cc7ee`, including changes beyond the older worktree, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. It checked the nine post-snapshot roadmap directions and the four completed directions named in WORKERS, as well as the relevant local Galois, rigid and p-adic functional-analysis documents. Searches of their suggested declarations and the current library did not locate native Robba, trianguline or almost de Rham deformation carriers sufficient for these statements. This absence claim is limited to those searches. Current upstream foundations are imported unchanged. The baseline for representative Lean statements remains the pinned Tau Ceti/Mathlib pair below.

The paper-route inventory contains 138 entries: 67 from BHS19, 59 from Ding25, 10 from NT21 and 2 from DLB17. Every entry is assigned to a target or an existing owner in the packet’s `routedInventory`. Repeated introductory formulations and proof-sized fibre-product steps share a target. The mathematical build below is organized by dependencies, rather than as a summary of any paper.

## Conventions

Let K/Q_p be finite of degree d, K₀ its maximal unramified subfield, e=[K:K₀], and E/Q_p a finite extension containing all embeddings Σ=Hom(K,E). Unless a layer strengthens it, n≥1. Art_E consists of local Artinian E-algebras with residue E, with local E-maps inducing the identity on the residue field. Characters and Galois actions are continuous. Frobenius linearizations are invertible. Finite freeness and saturation are part of the category whenever stated, rather than consequences of a bare module structure.

For BHS, wt is the logarithmic derivative and cyclotomic weight is +1. The local-model Hodge–Tate–Sen spectrum is sorted increasingly as h_{τ,1}<⋯<h_{τ,n}; its Hodge flag uses the decreasing-filtration indices −h_{τ,i}. Strict dominance of an ordered parameter tuple means its character weights decrease. Newton–Thorne use the opposite weight, with cyclotomic weight −1, and their noncritical ordered weights k increase. Ding uses decreasing h throughout the crystabelline branch. The local-model weight permutation is in (S_n)^Σ; Ding’s refinement permutation is one common w∈S_n, acting on Frobenius labels with the inverse in φ_{w⁻¹(i)}.

Write ε=N_{K/Q_p}|N_{K/Q_p}| for the cyclotomic character of K× in the character convention. The valuation satisfies v_p(p)=1. The large-gap criterion evaluates characters at a local uniformizer ϖ_K and includes e; NT numerical noncriticality evaluates at the rational prime p∈K×. The two formulas must not be interchanged. Reciprocity and rank-one Robba realization use the normalization of their cited local Galois supplier; the NT flag comparison is explicitly the arithmetic Art_K convention.

A D_pdR frame is a basis over A⊗K and contributes dn² parameters; a Galois frame is over A and contributes n². Graded rank-one rigidifications contribute n parameters. The Lie algebra g is Res_{K/Q_p}gl_n over E. Write g̃ for the simultaneous resolution, X=g̃×_g g̃, X_w for an incidence component and Z_v for a Steinberg zero-fibre component. The two Cartan maps are ordered so their graph is (z,w⁻¹z). All weight-factorization claims are scheme-theoretic on Artinian algebras.

For Layers 9–12, n≥2, φ_i/φ_j∉{1,|·|_K} for ordered i≠j, and every refinement of D is noncritical. D can be non-étale. The original D is regular at every embedding; D_σ usually is not. Throughout modification of endpoints and graded pieces uses the **ambient** minimum h_{τ,n}. A σ-partial deformation is de Rham at Σ minus {σ}. Original Ext¹₀ and modified Ext¹₀ have different definitions and dimensions.

## Exact supplier contracts

### From the pinned libraries

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following actual statements were read at the pin; generic linear algebra, completion and lengths are reused.

- [mathlib:LinearMap.prod](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Prod.lean): For maps f:U→ₗV and g:U→ₗW on the same source, the product map sends u to (f u,g u).
- [mathlib:LinearMap.range](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Range.lean): The image of a linear map is a submodule; membership means having a preimage.
- [mathlib:LinearMap.ker](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Ker.lean): The kernel is the inverse-image submodule of zero.
- [mathlib:LinearMap.finrank_range_add_finrank_ker](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean): For a linear map on a finite-dimensional vector space, finrank(range)+finrank(kernel)=finrank(source).
- [mathlib:Submodule.finrank_sup_add_finrank_inf_eq](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean): For finite-dimensional submodules, the dimensions of their sum and intersection add to the sum of their dimensions.
- [mathlib:AdicCompletion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean): The adic completion of a module is the inverse limit of its quotients by the ideal powers.
- [mathlib:Module.length](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean): The extended-natural module length comes from the submodule lattice; it supplies the finite local lengths used by the cycle supplier.

### From existing roadmaps

The accepted Springer packet supplies exact nodes in F/G/I for flags and incidence schemes, C/N for Cohen–Macaulayness, flatness and normal components, T for the formal Cartan graph/tangent criterion, Y/K/P for cycles and KL/parabolic identities, and E for completion and completed-cycle formulas. Each target below names its direct node IDs. The local Galois deformation supplier supplies `R08.1/local-lifting-ring`, point completions, tangent/obstruction comparisons, forget-framing, residue-field changes and `phi-gamma-module-deformation-rings`, plus R08.3 filtered-φ/N and crystalline/potentially semistable rings. This roadmap only adds the particular simultaneous-refinement and local-model conditions.

The Robba supplier supplies its PG.7 relative category, rank-one classification/characters/cohomology/weights, integral triangulations, global triangulation and specialization; PG.3 supplies Herr cohomology, Ext, cup products, Tate duality and localized comparisons; PG.2 supplies period-sheaf comparisons. The PHT supplier already supplies `P7/coefficient-b-pairs`, `coefficient-bdr-representations`, the field `fontaine-bdr-indecomposable-classification`, Sen modules, the existing B-pair/Robba and étale realizations, and the R06.3 filtered-module/Robba modification/equivalence and slope-zero criteria. Its exact `P7/embedding-selective-crystalline-modification` owns D_σ. The stronger Artinian and partial-cohomology contracts are R1–R4, not consequences silently attributed to those existing nodes.

Current upstream `LocalGaloisGroups` supplies local Galois and reciprocity foundations. `AdicSpacesPartII` and `RigidAnalyticGeometry` supply the rigid/adic categories, local rings, completions and comparisons, including `R1/rigid-local-ring-completion`. `DeformationAndDerivedPatchingAlgebra` supplies Artinian coefficient/small-extension categories, Schlessinger and Rim conditions, hulls, framed formal smoothness and completion/CM algebra. Current PFA §§5.1–5.3 supply character coordinates and universal algebras, and explicitly leave geometric character-space sheaves to other owners. Thus the general-K rigid character geometry in R7 remains an extension.

### Requested extensions

These are the nine open requests. Each names a real existing supplier stage; the packet attaches that stage to every consuming target. An assigned request is a planning boundary, not a claim that the needed theorem is implemented or already accepted.

**R1 — `PadicHodgeTheory:P7`.** Extend the existing coefficient B_dR category and field Fontaine classification to the almost de Rham period interface: B_pdR=B_dR[log t], D_pdR, nilpotent ν, and the tensor-compatible equivalence with finite free A⊗K modules with nilpotent ν for every A∈Art_E. Include H⁰=ker ν, H¹=coker ν and exactness, functoriality for finite A-modules, and existence of an A-free stable B_dR⁺ lattice. The existing field indecomposable classification is an input, not this Artinian equivalence. Place the additional theory in PadicHodgeTheory, Part II and assign its exact node IDs.

*Used by:* [A/period-deformation](#a-period-deformation), [L/lattice-filtration](#l-lattice-filtration), [T/parameter-weight](#t-parameter-weight), [C/cohomology-comparison](#c-cohomology-comparison). BHS19 §§3.1.1–3.1.2, Proposition 3.1.1, Corollary 3.1.2, Lemma 3.1.4 and Remark 3.1.3, pp. 330–333.

**R2 — `PadicHodgeTheory:P7`.** Supply the Art_E-coefficient extension of the existing B-pair/Robba equivalence and the étale Robba/Galois equivalence, preserving ranks, exact sequences, morphisms and finite coefficient tensor products. Include the A-freeness criterion from a free localized module and a free B_dR⁺ lattice. Existing finite-field E-coefficient B-pair nodes alone do not assert the Artinian generality. Reuse them rather than defining another B-pair category.

*Used by:* [T/period-functor](#t-period-functor), [M/gluing](#m-gluing), [M/galois-component-rings](#m-galois-component-rings), [N/ordered-deformation](#n-ordered-deformation). BHS19 Lemma 3.3.5, pp. 344–345; Proposition 3.5.1 and Remark 3.5.2, pp. 355–356; §3.6, pp. 361–364.

**R3 — `PadicHodgeTheory:P7`.** For a J-de Rham B-pair W, define H¹_g,J as the kernel of restriction to H¹(W_dR,J) and the modified group H²_J by a positive algebraic twist at J killing H⁰(W_dR,J⁺). Prove dim H¹_g,J=[K:Q_p]rk W+dim H⁰(W)+dim H²_J(W)−dim H⁰(W_dR,J⁺); if H²_J(W)=H²(W), deduce dim H¹_g,J=dim H¹(W)−dim H⁰(W_dR,J⁺). For 0→W₁→W₂→W₃→0 of J-de Rham B-pairs, H²_J(W₁)=0 gives the exact sequence ending H¹_g,J(W₁)→H¹_g,J(W₂)→H¹_g,J(W₃)→0, preceded by the H⁰ terms. Include the comparison with Herr cohomology and locally σ-analytic rank-one derivatives. Preserve the modified H² hypothesis in every application.

*Used by:* [P/partial-dimensions](#p-partial-dimensions), [P/modified-dimensions](#p-modified-dimensions), [I/sigma-intertwining](#i-sigma-intertwining). Ding19 Appendix A, Propositions A.3 and A.5, Corollary A.4, preprint pp. 44–47; Ding25 Lemma 2.16 and Propositions 2.17, 2.20, 2.22, pp. 20–23.

**R4 — `PadicHodgeTheory:P7`.** Supply the semistability criterion for a trianguline Galois representation with algebraic, strictly decreasing labelled parameter weights used in BHSsmooth17 Lemma 2.10; identify its D_st Frobenius characters, and prove that excluding both regular-character exceptional families forces zero monodromy and noncritical crystalline refinement. This extends the period-theoretic criterion, while this roadmap owns the slope inequalities that force saturation.

*Used by:* [G/large-gap-saturation](#g-large-gap-saturation). BHSsmooth17 Lemma 2.10 and proof, author PDF pp. 15–16; the proof cites Berger’s semistability criterion.

**R5 — `PhiGammaModulesAndIwasawaCohomology:PG.7`.** Provide the relative moduli S_n of regular triangulated Robba modules with each rank-one graded piece rigidified, as a smooth rigid space over T_regⁿ of relative dimension [K:Q_p]n(n−1)/2. Include its admissible étale locus, associated family of Galois representations after framing, and the n independent graded-rescaling action. This is a moduli/relative-category extension; the existing triangulation and relative-category nodes do not supply its representability. Reuse the existing KPX triangulation and specialization results.

*Used by:* [V/regular-locus-geometry](#v-regular-locus-geometry). BHS17 Theorem 2.6 and proof, author PDF pp. 8–12 (S_n and the framed étale locus).

**R6 — `PhiGammaModulesAndIwasawaCohomology:PG.7`.** For a (φ,Γ)-module D over the Robba ring R_E with K=Q_p and E finite over Q_p, supply Colmez’s saturation lemma: if D contains a rank-one (φ,Γ)-submodule, it contains a saturated rank-one (φ,Γ)-submodule with finite free quotient, compatibly with finite extensions of E. The existing triangulation node defines saturation but does not prove that saturations exist. No finite-dimensionality of φ-eigenspaces is requested: the nontrianguline obstruction only uses subspaces stable under both φ and Γ.

*Used by:* [N/rank-two-nontrianguline](#n-rank-two-nontrianguline). Colmez08 Lemma 3.2, p. 231; DLB17 proof of Lemma 6.3, arXiv p. 31.

**R7 — `PadicMeasuresIwasawaAlgebras:L0a`.** Coordinate with LocallyAnalyticDistributions to supply, for arbitrary finite K/Q_p, the rigid spaces T=Hom_cont(K×,G_m) and W=Hom_cont(O_K×,G_m), universal characters and coefficient base change. They are smooth of dimensions d+1 and d; restriction T→W is smooth of relative dimension one. The logarithmic derivative W→E^Σ is étale locally at every point, hence identifies their formal completions after translation. For each algebraic unit character and every C>0, algebraic tuples with adjacent decreasing weight gaps greater than C are Zariski dense on a neighbourhood basis at that tuple. This is local accumulation at algebraic points; it does not assert analytic density in every open of the full weight space. Import the current PFA §5 character coordinates; PFA explicitly leaves geometric character-space sheaves to other owners.

*Used by:* [T/generic-parameters](#t-generic-parameters), [M/relative-representability](#m-relative-representability), [V/trianguline-variety](#v-trianguline-variety), [G/accumulation-theorem](#g-accumulation-theorem), [Y/weight-cycle-transfer](#y-weight-cycle-transfer), [N/regular-parameters](#n-regular-parameters), [N/ordered-deformation](#n-ordered-deformation). BHS19 §3.3.4, pp. 347–349; BHSsmooth17 proof of Proposition 2.12, author PDF pp. 16–17, especially its final weight-coordinate argument; NT21 §2.3.1, pp. 28–30; current upstream PFA §§5.1–5.3.

**R8 — `AdicSpacesPartII:R1`.** Starting from the existing rigid-local-ring completion, normalization and rigid/adic comparison interfaces, supply excellence and descent of normality and Cohen–Macaulayness from completions, openness of those loci, injectivity into completed rings above a proper birational normalization of a reduced rigid space, openness of flat morphisms, generic local freeness/base change for the coherent Herr sheaves, and the constructibility facts used in BHS17 Theorem 2.6: the image of a projective morphism of rigid spaces is Zariski-constructible, and a Zariski-constructible subset that is open for the adic topology is Zariski open (Hellmann–Schraen, Density of potentially crystalline representations of fixed weight, Lemmas 2.13–2.14). These are analytic supplier extensions, not a second definition of rigid spaces or completions.

*Used by:* [V/trianguline-variety](#v-trianguline-variety), [V/regular-locus-geometry](#v-regular-locus-geometry), [V/completion-map](#v-completion-map), [V/normal-cm](#v-normal-cm), [G/accumulation-theorem](#g-accumulation-theorem), [N/closure-tangent](#n-closure-tangent), [N/density-repair](#n-density-repair). BHS19 proofs of Propositions 3.7.2–3.7.3, pp. 366–367, and Corollary 3.7.10, p. 371; NT21 Proposition 2.15 and Remark 2.16, pp. 36–38. BHS17 proof of Theorem 2.6, author PDF pp. 10–12.

**R9 — `PadicDifferentialEquationsAndRigidCohomology:RD.1`.** For the connection ∇ on D_rig(V) of a rank-two étale Q_p Robba module, prove finite E-dimensionality of ker P(∇) for every nonzero polynomial P∈E[X], compatibly with φ∇=∇φ. The existing finiteness of differential-equation cohomology for ∂ does not give this statement. Keep the RD owner, with a Part II extension if necessary; this roadmap only derives injectivity from the absence of finite-dimensional subspaces stable under φ and Γ, using φ∇=∇φ and the commutation of ∇ with Γ.

*Used by:* [N/polynomial-connection-kernel](#n-polynomial-connection-kernel). DLB17 Lemma 6.3 and its proof, arXiv p. 31, which invokes Dospinescu Proposition 2.1.

### Supplier gaps that prevent packaging

**G1 — Assign the almost de Rham Artinian period extension to a precise supplier node.** R1 and R2 state verified source contracts. The accepted PHT field/coefficient-category nodes stop short of the full Artinian Fontaine and B-pair equivalences. No exact reserved Part II node exists in this checkout. Obtain that ownership/acceptance before packaging; do not regard a field classification as this stronger input. This is a supplier-closure gap, not an assertion that BHS proves no such theorem.

**G2 — Locally analytic constituent supplier has no reserved stage.** The pending LocallyAnalyticRepresentationsOfLocalGroups direction must supply the actual locally analytic principal series I_δ, Orlik–Strauch constituents Π_w, finite Jordan–Hölder multiplicities, strong-linkage unitriangularity and the constituent isomorphism criterion under dominant parabolic permutations. No suitable existing or reserved node was found. This packet records the exact contract in pendingSuppliers instead of inventing a supplier stage or replacing representations by labels. The general multiplicity assertion remains a conjecture even after that supplier exists. The all-parameter signed-cycle uniqueness proof also needs this full unitriangular vanishing input; see E16. No effectivity restriction is silently added to the conjecture.

The pending locally analytic representation contract is: For finite K/Q_p and split GL_n(K), construct I_δ=(Ind_{B̄(K)}^{GL_n(K)}δ₁⊗δ₂ε⊗⋯⊗δ_nε^(n−1))^an and its genuine irreducible Orlik–Strauch constituents. Supply finite length, Jordan–Hölder multiplicities equal to the relevant KL coefficients at integral regular weights, the strong-linkage unitriangular ordering used for recursive uniqueness, and the parabolic-dominance criterion for two constituent presentations to be isomorphic. State the twists and Borel conventions compatible with BHS19 §4.3. For conditional uniqueness in the signed cycle group, extend the unitriangular vanishing argument to all constituent families, including those induced by non-locally-algebraic or nongeneric parameters. The cancellation shortcut in BHS19 Proposition 4.3.6 is recorded as E16 and must not replace that argument.

The first-order modification proof is supplied in Layer 11, rather than left as a gap because the source omits its details. The accumulation proof includes the auxiliary BHSsmooth17 saturation result, and the partial-cohomology dimension/exactness input was checked in Ding19 Appendix A. General-Robba finite-kernel theory remains an explicit request R9, with the final injectivity application conditional on it.

## How to read the build

Layers 1–4 construct the period and localized deformation adapters. Layer 5 glues them and compares both framings with incidence components; Layer 6 identifies the analytic completion. Layers 7–8 derive geometry and cycles. Layers 9–12 form the all-refinement crystabelline branch, using the same period/cohomology suppliers but a different regularity convention. Layer 13 supplies the ordered-regular tangent and numerical criteria and the rank-two obstruction. Within each subsection, the source locator supports the stated target, “Needs” lists direct inputs, the API is the planned reusable interface, and the Checks are mathematical acceptance tests. Only two lightweight adapters over existing carriers appear in the suggested Lean file: `MatchedRelation.range` and `NumericalNoncritical.nativeBounds`, with their representative milestones and examples. All period, Robba and rigid-space targets retain their full specifications here.

## Layer 1: Framed almost de Rham deformation adapters

The first frame belongs to D_pdR, a rank-n module over the product A⊗K. The coefficient Fontaine equivalence is an input. The new work is its deformation-groupoid adapter and the comparison with the full matrix space. Nilpotence over an Artinian ring is weaker than lying in the scheme-theoretic nilpotent cone; confusing these would delete genuine first-order character directions.

<a id="a-period-deformation"></a>

### 1.1 Almost de Rham deformation groupoids

**A/period-deformation (definition).** For an almost de Rham E⊗B_dR representation W of rank n, X_W(A) is the groupoid of pairs (W_A,ι:W_A⊗_A E≅W), with equivariant isomorphisms compatible with ι. X_W^pdR adds an A⊗K-linear frame α_A:(A⊗K)^n≅D_pdR(W_A) lifting a fixed α. Pullback along A→B is tensor product, retaining the special-fibre identification.

*Additional hypotheses:* W is finite free over E⊗B_dR. Almost de Rham, B_pdR, D_pdR and its nilpotent ν are imported from the requested PadicHodgeTheory Part II interface.

*Proof plan:* 1. Use the coefficient Fontaine equivalence to show every Artinian deformation is almost de Rham. 2. Transport tensor pullback through that equivalence, with the canonical associativity isomorphisms; retain groupoids before removing automorphisms.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.1: Proposition 3.1.1, Corollary 3.1.2 and Lemma 3.1.4, pp. 330–332; definitions of X_W and X_W^□ with Remark 3.1.5, pp. 332–333.

*Needs:* `PadicHodgeTheory:P7`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-coefficient-category-and-small-extensions`, `PadicHodgeTheory:P7/coefficient-bdr-representations`, `PadicHodgeTheory:P7/fontaine-bdr-indecomposable-classification`.

**API.**

- `PeriodDef.mk` (constructor): Bundle a lift and its special-fibre isomorphism.
- `PeriodDef.baseChange` (functoriality): Pullback is equivariant tensor extension and composes canonically.
- `PeriodDef.framedForget` (projection): Forget α_A, retaining W_A and ι.
- `PeriodDef.iso_iff` (extensionality): An isomorphism is exactly an equivariant module isomorphism reducing to the prescribed identity.

*Used by:* A/matrix-completion and M/double-flag-model — Carries the first linear-algebra flag and supplies the framing torsor..

**Checks.**

- `residue`: X_W(E) has one isomorphism class, with automorphisms respecting ι necessarily trivial.
- `dualNumbers`: For W trivial of rank one, a ν=ε deformation over E[ε]/ε² is permitted and differs from the ν=0 deformation.
- `changeOfFrame`: Over dual numbers, changing α by 1+εB changes the framed object unless it is induced by a compatible equivariant isomorphism.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="a-matrix-completion"></a>

### 1.2 The framed matrix deformation model

**A/matrix-completion (theorem).** X_W^pdR is equivalent to the discrete deformation functor represented by the completion of g=Res_{K/Q_p} gl_n,E at N=α⁻¹ν_Wα. The forgetful map X_W^pdR→X_W is formally smooth of relative dimension dn². The target is the full Lie algebra completion, including infinitesimal matrices whose characteristic polynomial is not X^n.

*Additional hypotheses:* A/period-deformation conventions; α fixed.

*Proof plan:* 1. Apply the fully faithful coefficient Fontaine equivalence, reading ν in the chosen basis. 2. A matrix reducing to a nilpotent matrix is nilpotent over an Artinian ring, so it defines an almost de Rham object. 3. Lift bases over nilpotent ideals; their differences form gl_n(A⊗K), while a framed automorphism commuting with ν and fixing its frame is the identity.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.1.6 and Remark 3.1.7, p. 334.

*Needs:* [A/period-deformation](#a-period-deformation), `SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution`, `DeformationAndDerivedPatchingAlgebra:R03.2/formally-smooth-hull-framing`, `mathlib:AdicCompletion`.
**Checks.**

- `scalarNilpotent`: For n=1,A=E[ε]/ε², ν=ε is admitted although its characteristic polynomial is X−ε.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="a-filtered-deformation"></a>

### 1.3 Filtered period deformations and their weights

**A/filtered-deformation (definition).** For a full G_K-stable B_dR flag F_• of W with rank-one graded pieces, define X_{W,F}(A) using a lifted full flag in W_A and its reduction to F_•; add α_A for X^pdR_{W,F}. Let κ_F be the ordered scalars by which ν acts on the graded A⊗K lines. Thus κ_F lies in m_A⊗_Qp K^n and is independent of α_A.

*Additional hypotheses:* F_• is exhaustive, increasing and saturated in W.

*Proof plan:* 1. Exactness of D_pdR sends the flag to a full ν-stable flag over A⊗K. 2. On each graded line ν is multiplication by a unique scalar; reduction is zero, and tensor base change preserves these scalars.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Definition 3.1.8 and formulas (3.3)–(3.4), pp. 334–336.

*Needs:* [A/period-deformation](#a-period-deformation), `PadicHodgeTheory:P7`, `SpringerResolutionAndCharacteristicCycles:F/flag-scheme`.

**API.**

- `FilteredPeriodDef.mk` (constructor): Lift the full flag as finite free direct summands with rank-one successive quotients.
- `FilteredPeriodDef.kappa` (projection): Return the ordered diagonal ν-scalars, componentwise in τ.
- `FilteredPeriodDef.kappa_baseChange` (compatibility): κ_F tensors along A→B.
- `FilteredPeriodDef.kappa_frame_independent` (compatibility): Simultaneous change of basis and flag leaves the scalar tuple unchanged.

*Used by:* T/parameter-weight and M/component-detection — Compares character derivatives to the Cartan map of the first flag..

**Checks.**

- `rankOne`: For n=1, κ_F is the scalar ν.
- `upperTriangular`: For ν=[[ε,a],[0,2ε]] preserving the standard flag, κ=(ε,2ε), independent of a.
- `orderMatters`: Swapping the ordered graded lines swaps κ-coordinates; it is not an unordered spectrum.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="a-flag-completion"></a>

### 1.4 The first simultaneous-resolution model

**A/flag-completion (theorem).** The frame and D_pdR identify X^pdR_{W,F} with the completion of g̃ at (α⁻¹D_pdR(F_•),N); under this identification κ_F is the Cartan projection of the simultaneous resolution. This framed functor is formally smooth of dimension dn².

*Proof plan:* 1. Use A/matrix-completion and the full ν-stable flag correspondence. 2. Identify the functor of matrix–flag pairs with the supplier’s incidence definition of g̃; use its smoothness and dimension.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.1.9, pp. 334–335.

*Needs:* [A/filtered-deformation](#a-filtered-deformation), [A/matrix-completion](#a-matrix-completion), `SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution`, `SpringerResolutionAndCharacteristicCycles:F/flag-geometry`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=1 and A=E[ε]/ε², multiplication by ε is nilpotent and represents a valid lift of N=0. Its characteristic polynomial is X−ε, so the completion of the nilpotent cone would incorrectly remove it. For two embeddings, a period frame has 2n² infinitesimal coordinates, while a Galois frame still has n².

### Dependencies

`DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `PadicHodgeTheory:P7`, `SpringerResolutionAndCharacteristicCycles:F`, `SpringerResolutionAndCharacteristicCycles:G`.

**Planning status: planned.** Close G1 by assigning and accepting R1–R2; implement no replacement field-only period interface.

**Atlas planets:** Almost de Rham deformation groupoids; Framed matrix deformation model; Filtered period deformations; Filtered simultaneous-resolution model.

## Layer 2: Regular period lattices and Hodge flags

A lattice supplies the second flag. Keep the decreasing filtration and its ν-operator until regularity turns it into a full flag; the jumps depend on the embedding. The coefficient filtration theorem is also the engine for the explicit first-order modification in Layer 11.

<a id="l-lattice-filtration"></a>

### 2.1 The period-lattice filtration adapter

**L/lattice-filtration (construction).** For an almost de Rham lattice W⁺⊂W, send it to the decreasing filtration Fil^i D_pdR(W)=(t^i B_pdR⁺⊗_{B_dR⁺}W⁺)^{G_K}. This is exhaustive, separated and ν-stable. Conversely recover W⁺ as the ν=0 horizontal part of Σ_i t^(−i) B_pdR⁺⊗_K Fil^i. These constructions are inverse and compatible with morphisms.

*Additional hypotheses:* W⁺ is a finite free B_dR⁺ lattice and has integral Sen weights. Use D_pdR rather than D_dR.

*Proof plan:* 1. Apply the almost de Rham period equivalence to the t-adic filtration. 2. Use nilpotence of ν and finite exhaustive filtration to identify the horizontal sum with a B_dR⁺ lattice. 3. Check both compositions after extension to B_pdR, where the connection gives the explicit inverse.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 3.2.1, pp. 336–337.

*Needs:* [A/period-deformation](#a-period-deformation), `PadicHodgeTheory:P7`.

**API.**

- `PeriodLattice.filtration` (projection): Fil^i is the specified invariant submodule, with inclusion Fil^(i+1)⊂Fil^i.
- `PeriodLattice.ofFiltration` (constructor): Recover the lattice by ν-horizontal elements in the finite filtered sum.
- `PeriodLattice.equivFiltration` (equivalence): The two functors are quasi-inverse on morphisms as well as objects.
- `PeriodLattice.tShift` (compatibility): Replacing W⁺ by t^aW⁺ shifts Fil^i to Fil^(i+a).

*Used by:* L/artinian-lattice and M/gluing — Turns the lattice half of a Robba module into the second local-model flag..

**Checks.**

- `trivialLine`: For W⁺=B_dR⁺, Fil^i K is K for i≤0 and zero for i>0.
- `tShift`: For W⁺=t^aB_dR⁺ the unique jump is −a.
- `nonzeroMonodromy`: A ν-stable filtration on a nontrivial nilpotent two-dimensional object reconstructs that ν; forgetting ν cannot define an inverse.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="l-artinian-lattice"></a>

### 2.2 Artinian lattice and filtration equivalence

**L/artinian-lattice (theorem).** The preceding equivalence extends over A∈Art_E to finite free A⊗B_dR⁺ representations and finite free A⊗K modules with nilpotent ν and exhaustive separated ν-stable filtrations whose graded pieces are finite projective over A⊗K. Filtration, graded pieces and the equivalence commute with tensoring any finite A-module. At each τ every graded piece is A-free, but ranks may be zero and need not be parallel in τ.

*Proof plan:* 1. Induct on the length of A using the small-extension exact sequence and the field equivalence. 2. Use flatness of graded pieces to preserve the filtration sequence under arbitrary finite A-module tensor products. 3. Split A⊗K as ∏_τ A; projectivity gives free τ-components, not a globally rank-one assertion.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.2.2, pp. 337–340.

*Needs:* [L/lattice-filtration](#l-lattice-filtration), `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-coefficient-category-and-small-extensions`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="l-regular-hodge-flag"></a>

### 2.3 Regular lattices and the Hodge flag

**L/regular-hodge-flag (definition).** A lattice is regular when its Sen weights are distinct at every τ. For their increasing ordering h_{τ,i}, form the increasing full flag Fil_i=⊕_τ Fil^(−h_{τ,i})_τ D_pdR(W). In every Artinian deformation the ranks of all graded τ-pieces equal the residual ranks, so the same indexed jumps define a lifted full flag.

*Proof plan:* 1. Apply tensor compatibility with E to identify each residual graded piece. 2. Finite freeness and Nakayama fix its rank; distinct residual weights then yield a full flag at the displayed indices.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.2.3, Definition 3.2.4 and (3.9), pp. 340–341.

*Needs:* [L/artinian-lattice](#l-artinian-lattice), `SpringerResolutionAndCharacteristicCycles:F/flag-scheme`, `PadicHodgeTheory:P7/sen-module`.

**API.**

- `RegularLattice.hodgeFlag` (constructor): Evaluate the decreasing filtration at −h_{τ,i} separately at each embedding.
- `RegularLattice.gradedRank` (characterisation): Regularity means each nonzero residual τ-graded piece has rank one.
- `RegularLattice.baseChange` (functoriality): The Hodge flag and its graded ranks commute with Artinian pullback.

*Used by:* L/hodge-completion and M/double-flag-model — Supplies the second full flag with the correct sign convention..

**Checks.**

- `twoWeights`: Weights (0,2) give Fil_1=Fil^0 of rank one and Fil_2=Fil^(−2) of rank two.
- `nonparallel`: For two embeddings, weights (0,2) and (1,4) are regular despite different jumps; a global fixed-jump rank-one rule fails.
- `repeated`: Weights (0,0) fail regularity and do not give the specified full flag.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="l-hodge-completion"></a>

### 2.4 The second simultaneous-resolution model

**L/hodge-completion (theorem).** For a regular W⁺, its D_pdR-framed lattice deformation groupoid is equivalent to the completion of g̃ at (HodgeFlag(W⁺),N). It is formally smooth of dimension dn². The Cartan coordinates are the ν-scalars on the Hodge graded lines.

*Proof plan:* 1. Use L/artinian-lattice and fixed graded ranks to replace lifted filtrations by lifted full flags. 2. Apply the same matrix–flag representing property as A/flag-completion, keeping this Hodge flag distinct from F_•.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Theorem 3.2.5, p. 341.

*Needs:* [L/regular-hodge-flag](#l-regular-hodge-flag), [A/flag-completion](#a-flag-completion).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

A trivial line has Fil^i=K for i≤0. Replacing its lattice by t^aB_dR⁺ moves the jump to −a. With two labelled weights (0,2), the full Hodge flag uses Fil^0 and Fil^(−2); a second embedding with weights (1,4) has different jumps but the same flag ranks.

### Dependencies

`DeformationAndDerivedPatchingAlgebra:R03.1`, `PadicHodgeTheory:P7`, `SpringerResolutionAndCharacteristicCycles:F`, [A](#a).

**Planning status: planned.** Import R1 and R2 in Art_E generality; retain projective graded pieces and nonparallel embedding ranks.

**Atlas planets:** Period lattices and filtrations; Regular period lattices; Regular lattice deformation model.

## Layer 3: Localized triangulations and character weights

An integral triangulation and a localized triangulation have different specialization behaviour. Fix the residual parameter before asserting uniqueness of a lifted character tuple. The Cartan map records the difference of character derivatives from the residual weights, so its origin is zero even at a nonzero integral weight.

<a id="t-generic-parameters"></a>

### 3.1 Generic ordered parameter tuples

**T/generic-parameters (definition).** Let T be the rigid space of continuous characters K×→E×. Define T₀ⁿ by requiring, for every ordered i≠j, both δ_i/δ_j and εδ_j/δ_i to be nonalgebraic, where ε=N_{K/Qp}|N_{K/Qp}|. Define T_regⁿ by excluding δ_i/δ_j=∏ττ^(−aτ) and δ_i/δ_j=ε∏ττ^aτ for all aτ≥0 and every i≠j. The first condition is stronger than the regular rank-one cohomology condition; these loci must not be confused with NT regularity.

*Proof plan:* 1. Import the character space and algebraic characters; form the indicated complements of exceptional characters. 2. Use the rank-one H⁰/H² formula to identify the cohomological meaning of each exclusion.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.4, definition of T₀ and T₀ⁿ before Theorem 3.4.4, p. 352 (restatement corrected as E7); §3.7, definition of T_reg and T_regⁿ, p. 365; [BHS17](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/eigenvariete.pdf), §2.2, author PDF pp. 7–8, regular character locus.

*Needs:* `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.7/character-cohomology`.

**API.**

- `ParameterTuple.generic` (characterisation): Test both ordered exceptional algebraic ratios.
- `ParameterTuple.regular` (characterisation): Test precisely the nonnegative algebraic and cyclotomic-algebraic exceptional sets.
- `ParameterTuple.generic_regular` (compatibility): T₀ⁿ is contained in T_regⁿ.
- `ParameterTuple.permute_generic` (functoriality): Genericity is invariant under permutation of all n coordinates.

*Used by:* C/smooth-lifting and V/unique-localized-flag — Kills localized H⁰ and H² and guarantees uniqueness of the flag..

**Checks.**

- `rankOne`: For n=1 both conditions are vacuous.
- `algebraicRatio`: If δ₂/δ₁ is algebraic, the pair fails T₀ even when one orientation is omitted.
- `cyclotomicRatio`: A pair with δ₁/δ₂=ε fails genericity and regularity.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="t-localized-triangulation"></a>

### 3.2 Localized triangulations and deformation parameters

**T/localized-triangulation (definition).** For M=D[1/t], a localized triangulation F_• is an exhaustive full flag by finite projective (φ,Γ)-submodules with graded pieces R_E[1/t](δ_i). Define X_{M,F} by lifting this flag and M over Art_E. Its parameter map ω sends a lift to the unique tuple δ_A reducing to the specified residual tuple δ whose localized rank-one modules identify with its graded pieces. Without fixing δ, the tuple is only determined up to algebraic twists.

*Proof plan:* 1. Use the supplier’s relative localized category and rank-one classification. 2. A localized rank-one isomorphism differs by an algebraic character, which has no nontrivial infinitesimal variation with fixed residue. 3. Trivialize graded line bundles over local Artinian coefficients; show independence of those trivializations.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.3.4, pp. 343–344; Definition 3.3.8 and the definition of ω_δ, p. 347; (3.15)–(3.16), p. 348.

*Needs:* `PhiGammaModulesAndIwasawaCohomology:PG.7/relative-category`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-classification`, [T/generic-parameters](#t-generic-parameters).

**API.**

- `LocalizedTriangulation.mk` (constructor): Require the localized rank-one graded identifications, not an integral saturated flag.
- `LocalizedTriangulation.parameter` (projection): Return the unique lift of the fixed residual tuple.
- `LocalizedTriangulation.baseChange` (functoriality): Tensor extension preserves the flag and its parameter.
- `LocalizedTriangulation.changeResidual` (compatibility): Changing δ by a fixed algebraic tuple changes the parameter convention by that tuple.

*Used by:* M/gluing and V/completion-map — Provides the deformation condition retained after a specialized integral triangulation fails to be saturated..

**Checks.**

- `algebraicTwist`: R[1/t](δ)≅R[1/t](δ∏ττ^aτ); unbased uniqueness of δ would be false.
- `infinitesimal`: δ(1+εψ) and δ have the same based parameter only when ψ=0.
- `notSaturation`: An integral flag that loses saturation on specialization can still determine a localized flag; integral saturation is not built into this definition.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="t-torsion-cohomology"></a>

### 3.3 Rank-one torsion and localized isomorphisms

**T/torsion-cohomology (lemma).** For k=(kτ)≥0 and a continuous δ:K×→E×, H⁰ and H¹ of R_E(δ)/(∏τtτ^kτ) vanish if every wtτ(δ) avoids {1−kτ,…,0}; by dévissage on A the same vanishing holds for R_A(δ)/(∏τtτ^kτ), A∈Art_E, when the residual character of δ satisfies this condition. If every labelled weight of a field-valued δ belongs to its indicated interval, both have E-dimension d. An isomorphism R_A[1/t](δ)≅R_A[1/t](δ′) exists exactly when δ/δ′ is an algebraic character with fixed integral exponents; this includes nilpotent coefficient information.

*Additional hypotheses:* In the dimension clause kτ>0 and all weights satisfy the displayed membership condition; no mixed-embedding dimension formula is asserted.

*Proof plan:* 1. Compute successive tτ-quotients using the Γ-eigenspaces of the coefficient Sen module. 2. Pass through the finite filtration for torsion cohomology. 3. Apply H⁰ after sufficiently large t-shifts to characterize an invertible localized rank-one morphism. 4. For the converse direction of the isomorphism criterion use R_E(x_σ)≅(t_σ), so twisting by an algebraic character changes a rank-one module by a power of t and leaves its localization unchanged.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemmas 3.3.3–3.3.4, pp. 343–344.

*Needs:* `PhiGammaModulesAndIwasawaCohomology:PG.7/character-cohomology`, `PhiGammaModulesAndIwasawaCohomology:PG.7/character-weights`, `PadicHodgeTheory:P7/sen-module`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-characters`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="t-period-functor"></a>

### 3.4 Localized period realization over Artinian coefficients

**T/period-functor (construction).** The B-pair functor gives an exact, coefficient-base-change-compatible W_dR from (φ,Γ)-modules M over R_{A,K}[1/t] to finite free A⊗B_dR representations of rank rk M. Here M is finite free over R_{A,K}[1/t] and contains a φ,Γ-stable R_K-lattice, which need not be free over R_{A,K}; W_dR(M) is independent of that lattice. For a (φ,Γ)-module D over R_{A,K}, W_dR⁺(D) is finite free of rank rk D and commutes with tensoring finite A-modules. On localized triangulations W_dR sends the full flag to a G_K-stable full flag.

*Proof plan:* 1. Import the coefficient B-pair equivalence rather than rebuilding period rings. 2. Use the Artinian flatness criterion and Nakayama on each period realization; the freeness of W_dR(M) is proved directly from a stable R_K-lattice, without assuming an R_{A,K}-free lattice (BHS19 Lemma 3.3.5(ii)). 3. Compare two lattices after bounding one between t-powers of the other; inverting t removes the choice.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.3.5 and §3.3.3, pp. 344–345.

*Needs:* `PadicHodgeTheory:P7/b-pair-robba-equivalence`, `PhiGammaModulesAndIwasawaCohomology:PG.2/period-sheaf-equivalences`, [T/localized-triangulation](#t-localized-triangulation), `PadicHodgeTheory:P7/coefficient-bdr-representations`, `PadicHodgeTheory:P7`.

**API.**

- `LocalizedPeriod.ofModule` (constructor): Associate the finite free W_dR representation.
- `LocalizedPeriod.exact` (compatibility): Preserve short exact sequences in the indicated exact category.
- `LocalizedPeriod.lattice_independent` (compatibility): Identify realizations from different stable lattices canonically.
- `LocalizedPeriod.tensor` (functoriality): Commute with finite coefficient-module tensor products.

*Used by:* C/cohomology-comparison and M/gluing — Makes both the extension map on H¹ and the fibre-product deformation comparison well-defined..

**Checks.**

- `rankOne`: The realization of R_A[1/t](δ) has rank one over A⊗B_dR.
- `tLattice`: D and tD give canonically the same W_dR but different W_dR⁺.
- `shortExact`: A nonsplit extension retains its extension class under realization; replacing it by a direct sum is not an exact functor on extensions.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="t-parameter-weight"></a>

### 3.5 Character weights equal period Cartan coordinates

**T/parameter-weight (theorem).** For a residual field-valued rank-one character δ, W_dR(R_E[1/t](δ)) is almost de Rham if and only if δ is locally algebraic. For an Artinian deformation δ_A of such a δ, ν on D_pdR(W_dR(R_A[1/t](δ_A))) is multiplication by wt(δ_A)−wt(δ). Hence for a localized flag κ_F=wt(ω)−wt(δ), embedding by embedding. The rank-one period representation is trivial precisely when δ_A is locally algebraic, including the absence of infinitesimal weight variation.

*Proof plan:* 1. Use the rank-one Sen classification to identify integral residual weights with locally algebraic characters, then twist away their algebraic part. 2. Compute the logarithmic Γ-action in rank one; the nilpotent coefficient is its derivative. 3. Apply the rank-one calculation to every graded line and use exactness.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemmas 3.3.6–3.3.7, pp. 345–346; Corollary 3.3.9, pp. 348–349.

*Needs:* [T/torsion-cohomology](#t-torsion-cohomology), [T/period-functor](#t-period-functor), [A/filtered-deformation](#a-filtered-deformation), `PhiGammaModulesAndIwasawaCohomology:PG.7/character-weights`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

In rank one no pairwise genericity test is imposed. In rank two a ratio equal to ε fails the regular condition, whereas a nontrivial smooth factor can make a locally algebraic ratio nonalgebraic and admissible for T₀. After inverting t an algebraic twist of a graded character gives the same rank-one module; fixing the residual tuple removes this discrete ambiguity in deformations.

### Dependencies

`PadicHodgeTheory:P7`, `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, [A](#a).

**Planning status: planned.** Discharge R1–R2 and R7; preserve the distinct BHS generic and regular exceptional sets.

**Atlas planets:** Generic trianguline parameters; Localized trianguline deformations; Artinian localized period realization; Parameter–period weight identity.

## Layer 4: Extension comparison and formal lifting

Formal lifting is an extension problem with two prescribed outputs: a character and a period extension. The rank-one H¹ comparison supplies their compatibility; the vanishing of H² removes the obstruction. Genericity and local algebraicity enter different parts of this argument and must remain separate hypotheses.

<a id="c-cohomology-comparison"></a>

### 4.1 The localized Herr-to-period extension map

**C/cohomology-comparison (construction).** Exact period realization induces a natural map H¹_{φ,Γ}(M)→H¹(G_K,W_dR(M)) by sending an extension of R_A[1/t] by M to its period extension. For almost de Rham W, H⁰(G_K,W)=ker ν and H¹(G_K,W)=coker ν on D_pdR(W); in particular H¹ is right exact, and is exact on the subcategory ν=0.

*Proof plan:* 1. Use Yoneda extensions in the localized exact category, not a nonexistent isomorphism of arbitrary complexes. 2. Apply the coefficient almost de Rham cohomology calculation; a short exact sequence induces the kernel–cokernel sequence for ν.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.3, (3.11)–(3.13), p. 343; §3.4, (3.18)–(3.19) and the identifications H⁰=ker ν, H¹=coker ν, p. 349.

*Needs:* [T/period-functor](#t-period-functor), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, `PhiGammaModulesAndIwasawaCohomology:PG.3/localized-herr`, `PadicHodgeTheory:P7`.

**API.**

- `LocalizedH1.toPeriod` (constructor): Map each Herr extension to its realized Galois extension.
- `LocalizedH1.natural` (functoriality): Commute with module maps and coefficient extension.
- `PeriodH1.cokerMonodromy` (equivalence): Identify H¹ with coker ν in the almost de Rham category.
- `PeriodH1.rightExact` (compatibility): Transport right exactness of cokernels to period H¹.

*Used by:* C/rank-one-comparison and C/smooth-lifting — Supplies exactly the lifting map whose surjectivity controls the filtered deformation comparison..

**Checks.**

- `zeroMonodromy`: If ν=0, H⁰ and H¹ both identify with D_pdR(W).
- `jordanBlock`: For a nonzero nilpotent 2×2 Jordan block, H⁰ and H¹ have dimension one, not two.
- `extensionNaturality`: Pushing out an extension before period realization equals pushing out its realized extension.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="c-rank-one-comparison"></a>

### 4.2 Rank-one localization and period comparison

**C/rank-one-comparison (theorem).** If δ and εδ⁻¹ are nonalgebraic, H⁰(t^(−k)R_E(δ))=H²(R_E(δ))=0. The H¹ localization map is an isomorphism when wtτδ avoids {1,…,kτ} for every τ, and is zero when every wtτδ lies in that interval. If δ is additionally locally algebraic, H¹(R_E[1/t](δ))→H¹(G_K,W_dR(R_E[1/t](δ))) is an isomorphism. Over A with generic residual δ, localized H⁰ and H² vanish; the H¹ map is surjective if residual δ is locally algebraic and an isomorphism if δ_A itself is locally algebraic.

*Proof plan:* 1. Use rank-one Herr cohomology and the torsion exact sequence to compute the localization map. 2. Compare the B-pair Bloch–Kato local condition with Herr duality for sufficiently large t-shifts. 3. Induct on the length of A; right exactness of period H¹ gives surjectivity, and ν=0 supplies the stronger isomorphism.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemmas 3.4.1–3.4.3, pp. 349–352.

*Needs:* [C/cohomology-comparison](#c-cohomology-comparison), [T/torsion-cohomology](#t-torsion-cohomology), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-tate-duality`, `PadicHodgeTheory:P7/b-pair-herr-comparison`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="c-smooth-lifting"></a>

### 4.3 Formal smoothness of the filtered period comparison

**C/smooth-lifting (theorem).** For M with a localized triangulation of locally algebraic generic residual parameter δ, the map X_{M,F}→T̂_δⁿ×_{t̂₀}X_{W_dR(M),F} is formally smooth. Its points retain both the lifted character tuple and the lifted period flag with matching κ. This assertion holds for groupoids and all small extensions in Art_E.

*Proof plan:* 1. Lift the triangulation inductively by its rank. 2. Localized H²=0 removes the obstruction to lifting each extension. 3. The rank-one H¹-to-period surjection adjusts the lift to the prescribed period extension; the elementary surjective fibre-product module lemma ensures compatible choices. 4. Check graded parameters and special-fibre identifications at every step.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Theorem 3.4.4 and Lemma 3.4.5, pp. 352–354.

*Needs:* [C/rank-one-comparison](#c-rank-one-comparison), [T/parameter-weight](#t-parameter-weight), `DeformationAndDerivedPatchingAlgebra:R03.2/obstruction-theory`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="c-flag-uniqueness"></a>

### 4.4 Closed triangulation condition and split de Rham lifts

**C/flag-uniqueness (theorem).** For a generic residual localized triangulation, X_{M,F}→X_M is relatively representable by a closed immersion. If the residual δ is locally algebraic generic and an Artinian deformation M_A has ν_{W_dR(M_A)}=0, then M_A splits as ⊕_i R_A[1/t](δ_{A,i}) with locally algebraic lifted parameters. The splitting assertion is not asserted without ν=0.

*Proof plan:* 1. Use localized H⁰ vanishing between successive rank-one characters for uniqueness of a lifted flag. 2. Apply relative Schlessinger representability to the subfunctor and its tangent injection. 3. For ν=0, period H¹ is exact and the rank-one comparison kills the extension classes in the inductive flag construction.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 3.4.6 and Lemma 3.4.7, pp. 354–355.

*Needs:* [C/rank-one-comparison](#c-rank-one-comparison), [C/smooth-lifting](#c-smooth-lifting), `DeformationAndDerivedPatchingAlgebra:R03.2/rim-schlessinger-condition-and-prorepresentability`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For a locally algebraic generic rank-one parameter with an infinitesimal nonsmooth twist, the period comparison is only asserted surjective. When the entire Artinian character is locally algebraic it is an isomorphism. A zero residual weight derivative does not by itself eliminate an infinitesimal derivative.

### Dependencies

`DeformationAndDerivedPatchingAlgebra:R03.2`, `PadicHodgeTheory:P7`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, [T](#t).

**Planning status: planned.** Discharge R1–R2 and verify the locally algebraic hypothesis in each H¹ comparison.

**Atlas planets:** Localized extension comparison; Generic localized rank-one comparison; Smooth filtered period comparison.

## Layer 5: The double-flag model and Galois components

Glue the localized module to its period lattice. The two flags then meet in X=g̃×_g g̃, whose components and Cartan maps come from the Springer roadmap. Pass from the D_pdR frame to the Galois frame only after the smooth relative dimensions have been recorded. Component detection must see infinitesimal character directions, rather than only closed points.

<a id="m-gluing"></a>

### 5.1 Robba deformation gluing through the period lattice

**M/gluing (theorem).** For D with M=D[1/t], W⁺=W_dR⁺(D) and W=W_dR(M), deformation groupoids satisfy X_D≃X_M×_{X_W}X_{W⁺}. With a fixed localized flag, X_{D,F}≃X_{M,F}×_{X_W}X_{W⁺}; the same identities hold with compatible D_pdR frames. The flag on D is required only after inverting t, not integrally.

*Proof plan:* 1. Apply coefficient Berger equivalence to reconstruct D from M and a compatible B_dR⁺ lattice. 2. Check finite freeness of the reconstructed module by Artinian reduction and the coefficient equivalence. 3. Form the 2-fibre product including its period identification, then verify essential surjectivity and full faithfulness. 4. For a localized module with almost de Rham period realization, choose the A-free stable period lattice from R1 and reconstruct its free Robba lattice using R2; this is the free-lattice consequence used in subsequent relative representability arguments.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 3.5.1 and Remark 3.5.2, pp. 355–356.

*Needs:* [T/period-functor](#t-period-functor), [T/localized-triangulation](#t-localized-triangulation), [L/artinian-lattice](#l-artinian-lattice), `PadicHodgeTheory:P7/b-pair-robba-equivalence`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-relative-representability"></a>

### 5.2 Representability of the comparison morphisms

**M/relative-representability (theorem).** Assume the localized triangulation has a parameter in T₀ⁿ. The morphisms X_M→X_W, X_{M,F}→X_{W,F}, X_D→X_{W⁺}, and X_{D,F}→X_{W⁺,F} are relatively prorepresentable; the last two are base changes of the first two. They satisfy the relative Schlessinger fibre-product criterion and have finite-dimensional relative tangent spaces. The character-weight map T̂_δⁿ→t̂₀ is formally smooth of relative dimension n.

*Additional hypotheses:* The localized triangulation of M admits a parameter in T₀ⁿ, the standing assumption of BHS19 from Lemma 3.5.3 on; finiteness of the relative tangent spaces uses dim H¹(R_E(δ)[1/t])=d for δ∈T₀.

*Proof plan:* 1. Identify relative fibres with deformations equipped with a period isomorphism. 2. Use finite Herr H¹ and compatibility with Artinian fibre products for the relative Schlessinger conditions. 3. Compute character derivatives: the unit-character directions give dn coordinates and the unramified directions give n.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.5.3, Corollary 3.5.4 and Lemma 3.5.5, pp. 356–358.

*Needs:* [M/gluing](#m-gluing), [C/cohomology-comparison](#c-cohomology-comparison), `DeformationAndDerivedPatchingAlgebra:R03.2/schlessinger-conditions-and-tangent-spaces`, `PadicMeasuresIwasawaAlgebras:L0a`, [T/generic-parameters](#t-generic-parameters), [C/rank-one-comparison](#c-rank-one-comparison).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-framed-localized-dimension"></a>

### 5.3 Framed localized deformation dimension

**M/framed-localized-dimension (theorem).** For locally algebraic generic δ, X^pdR_{M,F} is prorepresented by a formally smooth complete local E-algebra of dimension d(n²+n(n+1)/2). Adding fixed rank-one graded bases instead gives a smooth rigidified functor of dimension n+dn(n+1)/2; forgetting those bases has relative dimension n. The n graded rescalings must not be counted as dn.

*Proof plan:* 1. Combine C/smooth-lifting with A/flag-completion and relative representability. 2. Compute the tangent dimension using graded rigidification: compare its n rescalings with the dn²-dimensional period framing torsor. 3. Use generic H⁰ vanishing to remove automorphisms of the rigidified object.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.5.6 and Proposition 3.5.7, pp. 358–359.

*Needs:* [M/relative-representability](#m-relative-representability), [C/smooth-lifting](#c-smooth-lifting), [A/flag-completion](#a-flag-completion).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-double-flag-model"></a>

### 5.4 The double-flag formal local model

**M/double-flag-model (theorem).** Assume δ locally algebraic generic and W⁺ regular. Set x_pdR=(α⁻¹D_pdR(F_•),α⁻¹HodgeFlag(W⁺),N) in X=g̃×_g g̃. The functor X^pdR_{W⁺,F} is represented by X̂_{x_pdR}; X^pdR_{D,F}→X̂_{x_pdR} is formally smooth of relative dimension dn(n+1)/2. Its completed local ring is a formal power-series algebra of that relative dimension over the completed incidence local ring.

*Proof plan:* 1. Take the fibre product of the two framed simultaneous-resolution models over the framed matrix model. 2. Apply M/gluing and C/smooth-lifting to obtain formal smoothness. 3. Use the dimension computation of the framed localized functor and the complete local smooth structure theorem.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.5.8, pp. 359–360.

*Needs:* [A/flag-completion](#a-flag-completion), [L/hodge-completion](#l-hodge-completion), [M/gluing](#m-gluing), [M/framed-localized-dimension](#m-framed-localized-dimension), `SpringerResolutionAndCharacteristicCycles:I/incidence-scheme`, `DeformationAndDerivedPatchingAlgebra:R03.2/formally-smooth-hull-framing`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-component-functors"></a>

### 5.5 Component deformation conditions

**M/component-functors (definition).** For w∈(S_n)^Σ define X^{pdR,w}_{D,F}=X^pdR_{D,F}×_{X̂}X̂_w and similarly for the lattice–flag functor. Let S(x_pdR)={w:x_pdR∈X_w}. Descend the condition after forgetting α; G-equivariance of X_w makes the unframed condition independent of α. Empty components are retained as empty functors, not zero rings declared to be domains.

*Proof plan:* 1. Use the imported reduced irreducible components X_w of X. 2. Pull their completed closed immersions back along the local-model map. 3. Descend by the change-of-frame action and check the resulting 2-cartesian square.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.5.9, (3.25)–(3.26), Proposition 3.5.10, pp. 360–361.

*Needs:* [M/double-flag-model](#m-double-flag-model), `SpringerResolutionAndCharacteristicCycles:I/component-closures`.

**API.**

- `ComponentDef.pullback` (constructor): Impose membership in the specified completed X_w.
- `ComponentDef.nonempty` (characterisation): Nonemptiness is equivalent to w∈S(x_pdR).
- `ComponentDef.frame_independent` (compatibility): Changing α transports the same unframed subfunctor.
- `ComponentDef.closed` (compatibility): Each component condition is a relatively representable closed immersion.

*Used by:* M/component-detection and V/local-identification — Selects the component forced by the ordered parameter weights..

**Checks.**

- `absentComponent`: If x_pdR∉X_w, its pullback has no residual object.
- `rankOne`: For n=1 there is one permutation and the component condition is the whole functor.
- `basisChange`: Conjugating N and both flags by g leaves the descended w-condition unchanged.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-component-normality"></a>

### 5.6 Normality of the framed component rings

**M/component-normality (theorem).** For w∈S(x_pdR), X^{pdR,w}_{D,F} is represented by a complete local normal domain of dimension d(n²+n(n+1)/2), formally smooth over X̂_{w,x_pdR} with relative dimension dn(n+1)/2. Cohen–Macaulayness follows from the imported local-model CM theorem and formal smoothness; neither conclusion asserts smoothness of X_w.

*Proof plan:* 1. Use normality and CM of the supplier’s incidence components. 2. Pass to completion using excellence; preserve normality and CM under a power-series extension. 3. Exclude the empty case before applying domain statements.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.5.11 and its proof, p. 361; Cohen–Macaulayness through Proposition 2.3.3 as used in Corollary 3.7.10, p. 371.

*Needs:* [M/component-functors](#m-component-functors), [M/double-flag-model](#m-double-flag-model), `SpringerResolutionAndCharacteristicCycles:N/normal-components`, `SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero`, `DeformationAndDerivedPatchingAlgebra:R03.3/excellence-normalization-and-formal-fibres`, `DeformationAndDerivedPatchingAlgebra:R03.3/cm-completion-and-equidimensionality`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-component-detection"></a>

### 5.7 Weight-graph detection of a component

**M/component-detection (theorem).** Let Θ=(κ_triangulation,κ_Hodge):X_{D,F}→(t×_{t/S}t)^∧_(0,0). For w∈S(x_pdR), its restriction to X^w_{D,F} factors through the completed graph T_{w′}={(z,(w′)⁻¹z)} if and only if w′=w; the framed version is equivalent. This is scheme-theoretic factorization, including nilpotent Artinian weight directions.

*Proof plan:* 1. Identify Θ with the two Cartan projections in the double-flag model. 2. Use formal smoothness and faithful flatness to descend the imported formal component-detection criterion. 3. Transport the criterion through the framing torsor.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.5.12, pp. 361–362.

*Needs:* [M/component-functors](#m-component-functors), [T/parameter-weight](#t-parameter-weight), `SpringerResolutionAndCharacteristicCycles:T/formal-component-detection`, `SpringerResolutionAndCharacteristicCycles:N/cartan-relation`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-galois-component-rings"></a>

### 5.8 Framed Galois component rings

**M/galois-component-rings (theorem).** Let r:G_K→GL_n(E) have D=D_r and a generic locally algebraic localized triangulation, with regular W⁺. The framed Galois functor X_{r,F} is prorepresented by a reduced equidimensional complete local ring R_{r,F} of dimension n²+dn(n+1)/2. Its minimal primes p_w are indexed by S(x_pdR); R_{r,F}/p_w is a normal domain representing X^w_{r,F}. Its Θ-map factors through T_w and no other weight graph.

*Proof plan:* 1. Import the étale Robba–Galois equivalence and the framed deformation ring of r. 2. Compare the n²-dimensional Galois framing torsor with the dn²-dimensional period framing torsor. 3. Apply M/component-normality and the component detection theorem to identify exactly the minimal primes.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Theorem 3.6.2, pp. 362–364.

*Needs:* [M/component-normality](#m-component-normality), [M/component-detection](#m-component-detection), `LocalGaloisDeformationRings:R08.1/completion-at-points`, `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="m-galois-tangent-comparison"></a>

### 5.9 Tangent dimensions and relative-position support

**M/galois-tangent-comparison (comparison).** For w∈S(x_pdR), dim_E T X^w_{r,F}=n²−dn²+dn(n+1)/2+dim_E T_{x_pdR}X_w. If w_x is the relative position of the two flags, then w_x≤w is necessary for w∈S(x_pdR). Sufficiency is asserted at N=0, not for an arbitrary nonzero nilpotent N.

*Proof plan:* 1. Subtract the period framing dimension and add the Galois framing dimension in the smooth comparison. 2. Use the supplier’s Bruhat support of X_w; at N=0 its zero-fibre components give sufficiency.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.6.3 and Proposition 3.6.4, pp. 364–365.

*Needs:* [M/galois-component-rings](#m-galois-component-rings), [M/double-flag-model](#m-double-flag-model), `SpringerResolutionAndCharacteristicCycles:I/bruhat-support`, `SpringerResolutionAndCharacteristicCycles:Y/cartan-zero-fibres`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=2,d=1, the framed Galois component dimension is 7. Adding the period frame gives dimension 11, while the incidence component has dimension 4 and the relative smooth dimension is 3. The formula 7+4=4+3+4 checks both frame contributions. At N=0, Bruhat support is sufficient; the same claim is not made for an arbitrary nonzero nilpotent.

### Dependencies

`DeformationAndDerivedPatchingAlgebra:R03.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `LocalGaloisDeformationRings:R08.1`, `PadicHodgeTheory:P7`, `PadicMeasuresIwasawaAlgebras:L0a`, `SpringerResolutionAndCharacteristicCycles:C`, `SpringerResolutionAndCharacteristicCycles:I`, `SpringerResolutionAndCharacteristicCycles:N`, `SpringerResolutionAndCharacteristicCycles:T`, `SpringerResolutionAndCharacteristicCycles:Y`, [A](#a), [C](#c), [L](#l), [T](#t).

**Planning status: planned.** Discharge R1–R2 and R7; formalize the two-framing smooth comparison over the accepted Springer component API.

**Atlas planets:** Robba–period deformation gluing; Trianguline double-flag local model; Trianguline component deformation functors; Weight-graph component detection; Generic trianguline Galois component rings.

## Layer 6: The analytic trianguline variety near a generic point

The analytic space is defined by reduced closure. At a generic regular-Sen point its completed ring selects one incidence component, even when the displayed parameter no longer gives a saturated integral triangulation. This component identification, rather than a density assertion alone, gives local normality and Cohen–Macaulayness.

<a id="v-trianguline-variety"></a>

### 6.1 The framed trianguline variety

**V/trianguline-variety (definition).** Fix a residual representation r̄:G_K→GL_n(k_E) and its framed lifting space X^□_{r̄}. Let U_tri be the locus of pairs (r,δ) with δ∈T_regⁿ and D_r admitting an integral saturated triangulation of parameter δ. Define X_tri(r̄) as the reduced Zariski closure of U_tri in X^□_{r̄}×Tⁿ. Denote the full-character projection by ω′:X_tri→Tⁿ and its restriction to units by ω:X_tri→Wⁿ. The reduced structure and the closure are part of the definition.

*Proof plan:* 1. Import the rigid generic fibre of the framed deformation ring and the current character/weight-space interface. 2. Use the supplier’s integral triangulation definition for U_tri, then take its reduced analytic Zariski closure. 3. Distinguish ω′ from its composition with restriction to O_K×.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.7, pp. 365–366.

*Needs:* `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, [T/generic-parameters](#t-generic-parameters), `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `AdicSpacesPartII:R1`, `PadicMeasuresIwasawaAlgebras:L0a`.

**API.**

- `TriangulineVariety.closure` (constructor): Take the reduced Zariski closure of the specified saturated locus.
- `TriangulineVariety.fullCharacter` (projection): Project to δ on K×.
- `TriangulineVariety.weight` (projection): Restrict each δ_i to O_K×.
- `TriangulineVariety.closedEmbedding` (compatibility): Embed the closure in the product of the framed lifting space and Tⁿ.

*Used by:* V/local-identification, G/flat-character and Y/full-character-transfer — Specifies the analytic space, the full-character map, and the distinct unit-weight map used by the local geometry..

**Checks.**

- `rankOne`: Rank one has no flag choice; the parameter records the corresponding rank-one Robba character.
- `specialization`: A closure point is not required to retain an integral saturated flag of the displayed δ.
- `twoProjections`: Characters differing by a nontrivial unramified factor have the same unit weight but different full-character coordinates.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="v-regular-locus-geometry"></a>

### 6.2 Dimension and smooth regular triangulation locus

**V/regular-locus-geometry (theorem).** U_tri is open and Zariski dense in X_tri, smooth of dimension n²+dn(n+1)/2; its full-character map ω′ is smooth, as is its unit-weight map ω. X_tri is equidimensional of that dimension. These assertions concern the actual saturated regular triangulation locus, not every point of its closure.

*Proof plan:* 1. Import from the requested PG.7 interface (R5) the moduli S_n of regular triangulated Robba modules with rigidified graded pieces, smooth over T_regⁿ of relative dimension dn(n−1)/2, and its admissible étale locus; add a Galois frame (a GL_n-torsor) and restrict to lifts of r̄. The resulting smooth space S^□(r̄), of dimension n²+n+dn(n+1)/2, maps onto U_tri with fibres the n independent graded rescalings. 2. Points of U_tri are strictly trianguline (N/strict-uniqueness; BHS T_regⁿ lies inside the NT-regular locus). Apply the global triangulation theorem on X_tri after a proper birational modification; over a Zariski-open dense V⊂X_tri on which the modification is an isomorphism, the G_mⁿ-torsor of trivializations of the graded line bundles identifies with an open subspace of S^□(r̄). Hence X_tri is equidimensional of dimension n²+dn(n+1)/2. 3. At y∈U_tri compare the completed local rings of S^□(r̄) and X_tri: the completion of the framed lifting space at r_y is its framed deformation ring, forgetting the regular triangulation is a closed immersion on deformations (N/ordered-representability), and X_tri is unibranch at y because the fibre of S^□(r̄) is connected. This gives Ô_{S,x}≅Ô_{X_tri,y}[[x_1,…,x_n]]. 4. The image of the smooth projection is open for the adic topology and Zariski-constructible as the image of a projective morphism (R8), hence Zariski open. Smoothness of U_tri and of ω′ on it follows from smoothness of S_n→T_regⁿ; ω is its composite with the smooth restriction Tⁿ→Wⁿ.

*Source:* [BHS17](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/eigenvariete.pdf), Theorem 2.6 and proof, author PDF pp. 8–12; cited as [19, Theorem 2.6] in BHS19 §3.7, p. 365.

*Needs:* [V/trianguline-variety](#v-trianguline-variety), `PhiGammaModulesAndIwasawaCohomology:PG.7/relative-category`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `PhiGammaModulesAndIwasawaCohomology:PG.7/global-triangulation`, [N/strict-uniqueness](#n-strict-uniqueness), [N/ordered-representability](#n-ordered-representability), `LocalGaloisDeformationRings:R08.1/completion-at-points`, `AdicSpacesPartII:R1`.
**Checks.**

- Acceptance: Track the n graded rescalings separately from the n²-dimensional Galois frame.
- Acceptance: Prove smoothness of the full-character map on U_tri; it implies smoothness of its restriction-to-units composition.


<a id="v-unique-localized-flag"></a>

### 6.3 A unique flag at generic closure points

**V/unique-localized-flag (theorem).** For x=(r,δ)∈X_tri with δ∈T₀ⁿ, the localized D_r[1/t] has a unique full triangulation with parameter δ, where algebraic twists are identified after inversion of t. Its period flag is intrinsic. There is no assertion that D_r has a saturated integral triangulation with that exact tuple.

*Proof plan:* 1. Apply global triangulation after a proper birational modification on each irreducible component through x. 2. Use specialization and the rank-one localization classification to obtain a localized flag at x. 3. Use generic H⁰ vanishing to prove uniqueness, independent of component and modification.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 3.7.1 and proof, pp. 365–366.

*Needs:* [V/trianguline-variety](#v-trianguline-variety), `PhiGammaModulesAndIwasawaCohomology:PG.7/global-triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation-specialization`, [C/flag-uniqueness](#c-flag-uniqueness).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="v-completion-map"></a>

### 6.4 The completed analytic space imposes the localized flag

**V/completion-map (theorem).** For a generic x=(r,δ), the map X̂_tri,x→X_r obtained by forgetting δ factors through the closed localized-trianguline condition X_{r,F}; both X̂_tri,x→X_{r,F} and X̂_tri,x→X_r are closed immersions, compatible with ω′ into T̂_δⁿ. The point-completion X_r is the completion of the framed lifting space at r.

*Proof plan:* 1. Use the supplier’s framed point-completion theorem. 2. Pull the global triangulation to a proper birational modification; above the dense saturated locus the closed condition holds. 3. Use reducedness, normalization and injectivity into the product of completed rings upstairs to descend the defining ideal. 4. Recover the parameter from the based uniqueness theorem.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Propositions 3.7.2–3.7.3 and their proofs, pp. 366–367.

*Needs:* [V/unique-localized-flag](#v-unique-localized-flag), [C/flag-uniqueness](#c-flag-uniqueness), `LocalGaloisDeformationRings:R08.1/completion-at-points`, `PhiGammaModulesAndIwasawaCohomology:PG.7/global-triangulation`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R1/rigid-local-ring-completion`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="v-sen-root-matching"></a>

### 6.5 Sen polynomials and infinitesimal root matching

**V/sen-root-matching (lemma).** On X_tri the τ-Sen polynomial of r equals ∏_i(T−wtτδ_i). If the residual weights are distinct, equality of these factorizations over an Artinian local algebra matches the roots by the unique permutation determined over E. Thus if wtδ=w(h) for increasing residual h, the completed Θ-map factors scheme-theoretically through T_w.

*Proof plan:* 1. Prove the Sen identity on the dense saturated locus using the exact period flag, then extend it by reducedness. 2. For each residual distinct pair, its difference is a unit in A; evaluate the factorized polynomial at a root and remove all unit factors. 3. Combine matching with T/parameter-weight and the fixed Hodge jumps.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.7.4 and Lemmas 3.7.5–3.7.7, pp. 368–370.

*Needs:* [V/completion-map](#v-completion-map), [T/parameter-weight](#t-parameter-weight), [L/regular-hodge-flag](#l-regular-hodge-flag), `PadicHodgeTheory:P7/sen-module`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="v-local-identification"></a>

### 6.6 The trianguline variety local-model theorem

**V/local-identification (theorem).** Let x=(r,δ)∈X_tri with δ locally algebraic generic and with distinct labelled Sen weights. Let w satisfy wtδ=w(h) for increasing h. Then X̂_tri,x≅X^w_{r,F}. Adding a D_pdR frame gives X^{pdR,w}_{r,F}→X^w_{r,F} of relative dimension dn². Forgetting the Galois frame gives X^{pdR,w}_{r,F}→X^{pdR,w}_{D,F} of relative dimension n², and the latter maps formally smoothly to X̂_{w,x_pdR} with relative dimension dn(n+1)/2. Thus R_tri[[u₁,…,u_dn²]] is noncanonically isomorphic to Ô_{X_w,x_pdR}[[v₁,…,v_{n²+dn(n+1)/2}]], with the compatible Cartan/character maps furnished by this diagram.

*Proof plan:* 1. The closed immersion V/completion-map lies in the union of minimal components of the same dimension. 2. Use the root-matching weight graph and M/component-detection to select only the w-component. 3. Reducedness and equidimensionality remove any additional ideal on that component. 4. Base-change the double-flag comparison, then forget the independent n²-dimensional Galois frame. Retain both torsors and the Cartan maps: the total smooth dimension on the incidence side is n²+dn(n+1)/2.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Corollary 3.7.8 and diagram (3.33), pp. 370–371.

*Needs:* [V/regular-locus-geometry](#v-regular-locus-geometry), [V/sen-root-matching](#v-sen-root-matching), [M/galois-component-rings](#m-galois-component-rings), [M/double-flag-model](#m-double-flag-model), [M/component-detection](#m-component-detection), `DeformationAndDerivedPatchingAlgebra:R03.2/formally-smooth-hull-framing`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="v-normal-cm"></a>

### 6.7 Normality and Cohen–Macaulayness at generic algebraic points

**V/normal-cm (theorem).** Under V/local-identification, X_tri is normal, locally irreducible and Cohen–Macaulay in a neighbourhood of x. The conclusion includes de Rham points and applies under the weaker locally algebraic generic, regular-Sen hypotheses of Remark 3.7.9. Smoothness requires a separate condition on the incidence component.

*Proof plan:* 1. Apply the normal and CM local component theorem to the completed ring. 2. Use excellence of the rigid local ring and descent of normality and CM from its completion. 3. Shrink an affinoid neighbourhood using openness of the resulting loci.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Remark 3.7.9, pp. 370–371; Corollary 3.7.10, p. 371.

*Needs:* [V/local-identification](#v-local-identification), [M/component-normality](#m-component-normality), `AdicSpacesPartII:R1`, `DeformationAndDerivedPatchingAlgebra:R03.3/cm-completion-and-equidimensionality`, `AdicSpacesPartII:R1/rigid-local-ring-completion`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

A closure point can have a unique localized flag with the displayed parameter and still fail to have a saturated integral flag of that parameter. At a generic regular-Sen point the completed trianguline variety is one normal component, not the union of all components of the localized deformation condition.

### Dependencies

`AdicSpacesPartII:R1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `LocalGaloisDeformationRings:R08.1`, `PadicHodgeTheory:P7`, `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, [C](#c), [L](#l), [M](#m), [N](#n), [T](#t). The uniqueness and representability of lifted triangulations of regular parameter come from Layer N, which is presented later.

**Planning status: planned.** Discharge R5, R7 and R8; use reduced closure and the single-component identification rather than imposing saturation at every closure point.

**Atlas planets:** Framed trianguline variety; Regular trianguline locus; Trianguline local-model theorem; Normality of the trianguline variety.

## Layer 7: Flatness, accumulation and companion geometry

Flatness comes from the Cartan map. Crystalline accumulation additionally needs a saturation argument with quantitative weight gaps and bounded uniformizer valuations. The companion criterion fixes the ordered Frobenius refinement and varies only its weight permutation; it is a local assertion about this analytic space.

<a id="g-flat-character"></a>

### 7.1 Flatness of character and weight projections

**G/flat-character (theorem).** At x satisfying V/local-identification, ω′:X_tri→Tⁿ is flat in a neighbourhood of x. Consequently its restriction-of-characters composition ω:X_tri→Wⁿ is flat there. No smoothness of either morphism is asserted.

*Proof plan:* 1. Add the period frame and use the cartesian comparison with the first Cartan map on X_w. 2. Import flatness of that Cartan map at every point of every fibre; descend flatness by the smooth faithfully flat frame maps. 3. Use the smooth unramified-character projection Tⁿ→Wⁿ.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 4.1.1, pp. 371–372.

*Needs:* [V/local-identification](#v-local-identification), `SpringerResolutionAndCharacteristicCycles:C/cartan-flatness`, [M/relative-representability](#m-relative-representability).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="g-accumulation"></a>

### 7.2 Crystalline accumulation property

**G/accumulation (definition).** For x with algebraic unit weight, the accumulation property means that for every C>0 the set of crystalline strictly dominant noncritical points x′=(r′,δ′), with pairwise distinct Frobenius eigenvalues and ordered character weights k′_{τ,1}>⋯>k′_{τ,n} satisfying k′_{τ,i}−k′_{τ,i+1}>C, accumulates at x: there is a neighbourhood basis at x on each member of which this set is Zariski dense. The k′ are the parameter weights in decreasing order; the h used for local-model indexing are the same spectrum sorted increasingly.

*Proof plan:* 1. Use the imported notion of crystalline representations and the noncritical refinement condition. 2. Use the supplier’s rigid accumulation convention: Zariski density on a neighbourhood basis, not mere existence of a converging sequence.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Definition 4.1.3, p. 373.

*Needs:* [V/trianguline-variety](#v-trianguline-variety), `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`.

**API.**

- `TriangulineAccumulation.onNeighbourhood` (characterisation): Assert density for every C>0 on a neighbourhood basis at x.
- `TriangulineAccumulation.shrink` (functoriality): Pass to smaller admissible neighbourhoods of x.
- `TriangulineAccumulation.gap` (projection): Obtain density with the stated adjacent-weight lower bound.

*Used by:* G/accumulation-theorem; eigenvariety consumers — Provides large regular crystalline weights in every local neighbourhood for classicality and density arguments..

**Checks.**

- `allBounds`: Density for C=1 alone does not satisfy the definition.
- `nearby`: Density in one distant component cannot certify accumulation at x.
- `strictness`: Crystalline points with repeated weights fail the strictly dominant condition.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="g-large-gap-saturation"></a>

### 7.3 Large weight gaps force saturated crystalline refinements

**G/large-gap-saturation (theorem).** Let x=(r,δ)∈X_tri have algebraic unit parameter weights k_{τ,i} that are dominant, k_{τ,1}≥⋯≥k_{τ,n} at every τ. Put e=[K:K₀] and normalize v_p(p)=1. If k_{τ,i}−k_{τ,i+1}>e·v_p((δ₁⋯δ_i)(ϖ_K)) for every τ and i<n, then the point is saturated and r is semistable. If also δ∈T_regⁿ, r is crystalline, the parameter is strictly dominant and the refinement is noncritical. The dominance hypothesis is missing from the source statement and is needed when [K:Q_p]≥2 (E17). This result uses the decreasing parameter-weight convention, not the increasing sorting h of the local model.

*Additional hypotheses:* The algebraic parameter weights are dominant (k_{τ,1}≥⋯≥k_{τ,n}) at every embedding; once saturation is proved, the étale slope bound v_p((δ₁⋯δ_i)(ϖ_K))≥0 and the gap inequalities make them strictly decreasing. The source omits the dominance hypothesis (E17).

*Proof plan:* 1. Use the specialization theorem to obtain a saturated parameter δ′ differing from δ by a labelled permutation of algebraic weights. 2. Apply slope-zero inequalities to each exterior power of the étale Robba module (sub-objects have slope ≥0). Induct on i: a nonidentity first remaining permutation contradicts the gap bound, because dominance makes every other summand of Σ_τ(k_{τ,i}−k_{τ,w⁻¹(i)}) nonnegative. 3. With δ′=δ apply the semistability criterion for a trianguline representation with decreasing integral parameter weights. 4. The regular-character exclusions eliminate the Frobenius ratios permitting nonzero monodromy, so semistability becomes crystallinity and gives the stated noncriticality.

*Source:* [BHSsmooth17](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/classicite.pdf), Lemma 2.10 and proof, author PDF p. 15 (Lemma 3.12 in arXiv:1510.01222v1); dominance hypothesis added as E17.

*Needs:* [V/trianguline-variety](#v-trianguline-variety), `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation-specialization`, `PadicHodgeTheory:R06.3/weak-admissibility-robba-slope-zero`, `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Check e=[K:K₀], the normalization v_p(p)=1 and evaluation at ϖ_K.
- Acceptance: In rank two a gap equal to the displayed prefix bound does not satisfy this sufficient criterion.


<a id="g-accumulation-theorem"></a>

### 7.4 Accumulation at generic algebraic-weight points

**G/accumulation-theorem (theorem).** A point x satisfying V/local-identification and having algebraic unit weight has the accumulation property of G/accumulation. This uses the crystalline density theorem on the regular triangulation locus in addition to flatness; it does not follow from flatness alone.

*Proof plan:* 1. Choose the flat affinoid neighbourhood of x with open weight image. Use density of U_tri and local irreducibility as in BHS19 Proposition 4.1.4 to reduce to algebraic-weight points of the regular locus; retain the algebraic-centre hypothesis in this reduction. 2. The flat weight map is open. On each chosen affinoid the finitely many prefix uniformizer valuations are bounded. 3. At each reduced algebraic-weight point, use a local product chart for the smooth weight map and algebraic weights accumulating at that centre with arbitrarily large decreasing gaps. Apply G/large-gap-saturation and the regular-character condition to obtain crystalline noncritical Frobenius-distinct points. 4. Use the smooth weight map on U_tri and local irreducibility to obtain density in a neighbourhood basis, for every prescribed gap bound.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 4.1.4, pp. 373–374; [BHSsmooth17](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/classicite.pdf), Lemma 2.10 and proof, author PDF pp. 15–16; first half of Proposition 2.12, pp. 16–17.

*Needs:* [G/flat-character](#g-flat-character), [G/accumulation](#g-accumulation), [V/regular-locus-geometry](#v-regular-locus-geometry), [G/large-gap-saturation](#g-large-gap-saturation), [V/normal-cm](#v-normal-cm), `PadicMeasuresIwasawaAlgebras:L0a`, `AdicSpacesPartII:R1`.
**Checks.**

- Acceptance: Prove every gap-bound and neighbourhood-basis quantifier, retaining the bounded valuation step.
- Acceptance: Use flatness for openness and the saturation theorem for crystallinity; neither input alone supplies the conclusion.


<a id="g-tangent-bound"></a>

### 7.5 Tangent bounds and smoothness through Schubert geometry

**G/tangent-bound (theorem).** For a de Rham generic regular point, dim T_x X_tri=dim X_tri−dn²+dim T_{x_pdR}X_w. With w_x the relative position and d_u=codim t^u, this is at most dim X_tri−d_{w w_x⁻¹}+ℓ(w_xw₀)+dim T_{π(x_pdR)}Ū_w−dn(n−1). Smoothness of X_tri at x is equivalent to smoothness of X_w there. It follows when Ū_w is smooth there and d_{w w_x⁻¹}=ℓ(w)−ℓ(w_x).

*Proof plan:* 1. Apply the formal smooth tangent-dimension identity to the local-model diagram. 2. Insert the supplier’s tangent estimate and smoothness criterion, using the same ordered flag convention. 3. Keep the conjectural general equality of the source separate from this proved upper bound.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 4.1.5 and Remark 4.1.6, pp. 373–375.

*Needs:* [V/local-identification](#v-local-identification), [M/galois-tangent-comparison](#m-galois-tangent-comparison), `SpringerResolutionAndCharacteristicCycles:T/tangent-space-bound`, `SpringerResolutionAndCharacteristicCycles:T/smoothness-criterion`.
**Checks.**

- `dominant`: For w=w₀ the bound becomes dim X_tri−d_{w_xw₀}+ℓ(w_xw₀); a product of distinct simple reflections gives the stated smooth case.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="g-refined-crystalline-space"></a>

### 7.6 Refined crystalline deformation space and its embedding

**G/refined-crystalline-space (construction).** Fix strictly dominant labelled weights k (equivalently increasing Hodge–Tate weights h with k=w₀(h)) and let X^{k-cr}_{r̄}⊂X_{r̄} be the smooth rigid space of framed crystalline lifts of r̄ with labelled Hodge–Tate weights k. The refined space X̃^{k-cr}_{r̄}=X^{k-cr}_{r̄}×_{T^rig/S_n}T^rig parametrizes pairs (r,(φ₁,…,φ_n)) with (φ_i) an ordering of the eigenvalues of the linearized crystalline Frobenius φ^{[K₀:Q_p]}. It is reduced and equidimensional of the dimension of X^{k-cr}_{r̄}. The locus where the φ_i are distinct is smooth, Zariski open and dense; on its dense open part W̃ where φ_iφ_j⁻¹∉{1,p^{[K₀:Q_p]}}, a local Frobenius-adapted basis of the family D_cris defines a smooth morphism h:W̃→(G/B)^rig recording the Hodge flag, whose Bruhat cell relative to the refinement flag is independent of the basis. The morphism ι_k:(r,φ)↦(r,z^{k}unr(φ)) is a closed immersion X̃^{k-cr}_{r̄}→X_tri(r̄), and the noncritical regular locus maps into U_tri.

*Additional hypotheses:* r̄:G_K→GL_n(k_E) is fixed and k is strictly dominant at every embedding. Kisin’s crystalline deformation spaces of fixed weight, with their families of filtered φ-modules, are imported from LocalGaloisDeformationRings R08.3.

*Proof plan:* 1. Import the smooth framed crystalline deformation space of weight k and the locally free family (D,Φ) of filtered φ-modules over it. 2. Form the fibre product with T^rig→T^rig/S_n, the map to T/S_n being the characteristic polynomial of Φ^{[K₀:Q_p]}; reducedness follows because T→T/S_n is finite flat and generically étale and the map to T/S_n is open (BHSsmooth17 Lemmas 2.2–2.3). 3. Locally choose a basis of D; the Frobenius matrix and the Hodge filtration define a smooth morphism to (Res GL_n×Flag)^rig, and distinct eigenvalues, the transversality condition and regularity of the ratios cut out smooth Zariski-open dense loci (BHSsmooth17 Lemma 2.4). On W̃ a Frobenius-adapted basis gives h, and changing the adapted basis acts through B, so Bruhat cells are well defined. 4. At noncritical regular points Berger’s dictionary turns the ordered refinement into a triangulation with parameter z^{k}unr(φ), so those points map into U_tri; reducedness and density then give ι_k into X_tri, a closed immersion because (r,φ)↦(r,z^kunr(φ)) is a closed immersion into X_{r̄}×Tⁿ.

*Source:* [BHSsmooth17](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/classicite.pdf), §2.2, (2.4)–(2.9), Lemmas 2.2–2.4 and Corollary 2.5, author PDF pp. 8–12; [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proof of Theorem 4.2.3, (4.2)–(4.5), pp. 376–377.

*Needs:* `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`, `LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations`, `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `SpringerResolutionAndCharacteristicCycles:F/flag-scheme`, [V/trianguline-variety](#v-trianguline-variety), [V/regular-locus-geometry](#v-regular-locus-geometry), `PadicMeasuresIwasawaAlgebras:L0a`, `AdicSpacesPartII:R1`.

**API.**

- `RefinedCrystalline.space` (constructor): The fibre product of the weight-k crystalline deformation space with T^rig over T^rig/S_n, given by the characteristic polynomial of the linearized Frobenius.
- `RefinedCrystalline.toCrystalline` (projection): Forgetting the ordering is finite and surjective, and étale over the locus of distinct eigenvalues.
- `RefinedCrystalline.hodgeFlag` (data): On W̃, the smooth morphism h to (G/B)^rig defined by a local Frobenius-adapted basis; its Bruhat cell relative to the refinement flag does not depend on the basis.
- `RefinedCrystalline.embedding` (compatibility): ι_k is a closed immersion into X_tri(r̄) whose composite with ω′ is (r,φ)↦z^{k}unr(φ).
- `RefinedCrystalline.noncritical_mem_Utri` (characterisation): A point with distinct eigenvalues, noncritical refinement and regular ratios maps into U_tri.

*Used by:* G/companion-criterion (BHS19 Theorem 4.2.3, (4.2)–(4.5)) — embeds refined crystalline points into X_tri and supplies the Hodge-flag map whose Bruhat-cell closures realise every w with w_x≤w; Y/crystalline-multiplicity (through G/companion-criterion) — decides which companion parameter points lie on X_tri when the cycles at absent parameters are set to zero.

**Checks.**

- `rankOne`: For n=1 the refined space equals the crystalline space and ι_k sends r to (r,z^{k}unr(φ)) with φ its Frobenius eigenvalue.
- `twoOrderings`: For n=2 and a point with Frobenius eigenvalues φ₁≠φ₂, the fibre over r consists of exactly the two points (φ₁,φ₂) and (φ₂,φ₁).
- `repeatedEigenvalue`: At a point with φ₁=φ₂ the fibre has one point and forgetting the ordering is not étale there; such points lie outside the smooth locus of distinct eigenvalues.
- `criticalImage`: A critical refinement still gives a point of X_tri through ι_k, but not a point of U_tri: z^{k}unr(φ) is not a parameter of a triangulation of r.
- Acceptance: Keep the ordering of Frobenius eigenvalues as data: the refined space is finite over the crystalline space, not equal to it.
- Acceptance: Prove that ι_k lands in X_tri through reducedness and density of the noncritical regular locus, not pointwise.


<a id="g-companion-criterion"></a>

### 7.7 Generic crystalline companion points

**G/companion-criterion (theorem).** Let r be crystalline, with distinct labelled Hodge–Tate weights h and Frobenius eigenvalue ratios avoiding 1 and p^[K₀:Q_p]. Fix an ordered refinement φ and its relative position w_x. Put x_w=(r,z^{w(h)}unr(φ)) for w∈(S_n)^Σ, with the same ordered φ. Then x_w∈X_tri if and only if w_x≤w in product Bruhat order. Such algebraic changes of parameter with fixed r are the companion points in this statement.

*Proof plan:* 1. Necessity follows from the local-model support inequality. 2. For sufficiency use the refined crystalline space G/refined-crystalline-space: its Hodge-flag map h is smooth, so the preimage of the closure of the Bruhat cell of w is the closure of the preimage of the cell; the maps ι_{h,w} send that cell into U_tri by Berger’s dictionary, hence its closure into X_tri, and the given point lies in it exactly when w_x≤w. 3. Keep the Frobenius ordering fixed while varying w; do not identify this criterion with the global companion theorem of BHS §5.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Theorem 4.2.3 and its proof, pp. 375–377.

*Needs:* [M/galois-tangent-comparison](#m-galois-tangent-comparison), [V/local-identification](#v-local-identification), `LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations`, `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`, `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `SpringerResolutionAndCharacteristicCycles:I/bruhat-support`, [G/refined-crystalline-space](#g-refined-crystalline-space).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For a rank-two prefix valuation b and ramification index e, a positive adjacent gap greater than eb satisfies the sufficient saturation bound; equality does not. The density proof chooses gaps exceeding both a prescribed C and the bound on the chosen affinoid. For GL₂, product Bruhat order is the two-element order, so a noncritical refinement permits both weight permutations while a critical one permits only the upper one.

### Dependencies

`AdicSpacesPartII:R1`, `LocalGaloisDeformationRings:R08.3`, `PadicHodgeTheory:P7`, `PadicHodgeTheory:R06.3`, `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `SpringerResolutionAndCharacteristicCycles:C`, `SpringerResolutionAndCharacteristicCycles:F`, `SpringerResolutionAndCharacteristicCycles:I`, `SpringerResolutionAndCharacteristicCycles:T`, [M](#m), [V](#v).

**Planning status: planned.** Discharge R4, R7 and R8; implement the large-gap density proof with its bounded valuations and neighbourhood-basis quantifier.

**Atlas planets:** Flat trianguline character map; Crystalline accumulation property; Trianguline tangent bound; Refined crystalline deformation space; Crystalline companion-point criterion.

## Layer 8: Local trianguline cycles and the crystalline multiplicity formula

There are two cycle transfers: first fix logarithmic weights, then fix the remaining unramified character coordinates. The general multiplicity problem lives in a free abelian cycle group and is a conjecture. The crystalline theorem constructs effective cycles; effectivity is not silently inserted into the general formulation. The signed-cycle uniqueness argument requires the full constituent contract G2, including the vanishing issue E16.

<a id="y-weight-cycle-transfer"></a>

### 8.1 Transfer of local-model cycles to Galois weight fibres

**Y/weight-cycle-transfer (construction).** For a generic r with integral regular Sen weights, transfer the supplier’s top cycles of the Steinberg zero fibre to cycles Z_v^wt on the fixed logarithmic-weight completed fibre (equivalently, the fixed formal unit-character fibre) of Spf R_r, using the framed smooth comparison and completion cycle map. Define C_v^wt=Σ_u a_{v,u}Z_u^wt using the imported simple-module transition matrix. Their ambient codimension is dn(n+1)/2. The transfer is independent of the period frame and of algebraic twisting of the localized parameters.

*Proof plan:* 1. Identify the completed logarithmic-weight fibre with the completed unit-character fibre by the formal étaleness of the logarithmic derivative on the character space; this comparison is part of the weight-space supplier request. 2. Pull cycles through the formally smooth diagram with its fixed relative dimensions. 3. Use the imported completion formula for generic lengths, then descend through the period frame. 4. Check equivariance and algebraic-twist invariance before declaring the resulting cycles intrinsic.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §4.3, (4.6)–(4.8) and Remark 4.3.1, pp. 377–380.

*Needs:* [V/local-identification](#v-local-identification), `SpringerResolutionAndCharacteristicCycles:Y/top-cycle-group`, `SpringerResolutionAndCharacteristicCycles:Y/module-cycle`, `SpringerResolutionAndCharacteristicCycles:K/three-bases`, `SpringerResolutionAndCharacteristicCycles:E/completion-cycle-map`, `SpringerResolutionAndCharacteristicCycles:E/module-completion-formula`, `PadicMeasuresIwasawaAlgebras:L0a`, `mathlib:Module.length`.

**API.**

- `TriangulineCycle.weightTransfer` (constructor): Transfer top-dimensional zero-fibre cycles through the specified completed smooth maps.
- `TriangulineCycle.simpleWeight` (constructor): Apply the simple-module transition coefficients to the transferred components.
- `TriangulineCycle.frame_independent` (compatibility): A different D_pdR frame gives the same cycle on Spf R_r.
- `TriangulineCycle.codimension` (characterisation): The cycles lie in codimension dn(n+1)/2 of the framed Galois deformation ring.

*Used by:* Y/weight-kl and Y/full-character-transfer — Turns the imported geometric KL identity into an identity of local Galois deformation cycles..

**Checks.**

- `rankOne`: Weight transfer has codimension d in the n=1 ambient framed ring.
- `twist`: Replacing δ by an algebraic tuple changes neither the fixed unit weight of r nor the transferred intrinsic cycles.
- `dimension`: For n=2,d=1, the ambient dimension is 8 and the weight-fibre dimension is 5, not 3.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-weight-kl"></a>

### 8.2 Kazhdan–Lusztig identity for weight-fibre cycles

**Y/weight-kl (theorem).** For a de Rham generic regular point with parameter permutation w and relative position w_x, [Spec Ō_{X_tri,x}^{wt}]=Σ_{w_x≤v≤w}P_{w₀w,w₀v}(1) C_v^wt as cycles on the ambient framed deformation ring. These terms are nonzero in the de Rham case. The extremal C_{w₀}^wt=Z_{w₀}^wt is nonzero exactly for de Rham r, and for crystalline r is the corresponding fixed-weight crystalline fundamental cycle.

*Proof plan:* 1. Apply the supplier’s completed KL identity before descending the frame. 2. Use the support and simple-cycle triangularity to identify the nonzero terms. 3. Compare the extremal zero section with the de Rham condition; in the crystalline case identify the appropriate crystalline quotient ring.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Remark 4.3.1 and Corollary 4.3.2, pp. 379–380.

*Needs:* [Y/weight-cycle-transfer](#y-weight-cycle-transfer), `SpringerResolutionAndCharacteristicCycles:E/completed-kl-identity`, `SpringerResolutionAndCharacteristicCycles:K/kl-transition`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-full-character-embedding"></a>

### 8.3 Embedding of the fixed-character fibre

**Y/full-character-embedding (lemma).** For generic δ, the fixed-full-character completed fibre X̂_tri,(r,δ)^{δ}→X_r is a closed immersion, even without locally algebraic δ. Thus its fundamental cycle can be viewed on the ambient framed Galois deformation space. This is stronger than specifying a fibre as an abstract analytic space.

*Proof plan:* 1. Use the uniqueness of the localized generic flag and its based parameter. 2. Apply the completed closed immersion argument to the fixed-character subfunctor.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 4.3.3, p. 380.

*Needs:* [V/completion-map](#v-completion-map), [C/flag-uniqueness](#c-flag-uniqueness).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-multiplicity-problem"></a>

### 8.4 The local trianguline multiplicity problem

**Y/multiplicity-problem (definition).** For generic trianguline r, formulate the local multiplicity problem as existence of cycles C_{r,Π} of codimension dn(n+1)/2+n in the free abelian cycle group of Spec R_r, depending only on r and an irreducible locally analytic constituent Π, such that for every δ∈Tⁿ one has [Spec Ō_{X_tri,(r,δ)}^δ]=Σ_Π m_{δ,Π}C_{r,Π}. The left side is zero when the parameter point is absent. Here m_{δ,Π} is the finite Jordan–Hölder multiplicity in I_δ=(Ind_{B̄(K)}^{GL_n(K)}δ₁⊗δ₂ε⊗⋯⊗δ_nε^(n−1))^an. Generic r means all its triangulation parameters are in T₀ⁿ. The assertion is conjectural; existence and effectivity are proved here only in the crystalline case.

*Additional hypotheses:* The locally analytic induction, finite-length theorem, irreducible labels and multiplicities require pending supplier G2.

*Proof plan:* 1. Import I_δ and its composition factors from the locally analytic representation roadmap; do not define them as formal labels. 2. Specify the target cycle group with the full-character codimension, then state effectivity and the simultaneous equations.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Conjecture 4.3.4 and Remark 4.3.5, p. 381 (dimension corrected as E1).

*Needs:* [Y/full-character-embedding](#y-full-character-embedding), `SpringerResolutionAndCharacteristicCycles:Y/top-cycle-group`.

**API.**

- `LocalMultiplicityProblem.effectiveFamily` (constructor): Require an effective cycle for every occurring genuine irreducible constituent.
- `LocalMultiplicityProblem.equation` (characterisation): Require the multiplicity identity for each generic full parameter δ.
- `LocalMultiplicityProblem.intrinsic` (compatibility): Cycles indexed by isomorphic Π are equal, independently of a presentation as a principal-series constituent.

*Used by:* Y/conditional-uniqueness and Y/crystalline-multiplicity — Separates the general conjectural family from its proved crystalline instance..

**Checks.**

- `fullCharacterDimension`: For n=2,d=1 each cycle has ambient dimension 3 and codimension 5.
- `missingConstituent`: A constituent with zero multiplicity contributes zero to that particular equation, rather than forcing its intrinsic cycle to vanish in every other equation.
- `cycleGroup`: The ambient cycle group contains [Z₁]−[Z₂]; it is not the monoid of effective cycles. Effectivity is an additional property of the crystalline construction.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-conditional-uniqueness"></a>

### 8.5 Uniqueness conditional on local cycle existence

**Y/conditional-uniqueness (theorem).** If generic trianguline r has integral Sen weights and a family of cycles satisfying Y/multiplicity-problem exists, it is unique. This is conditional uniqueness in the free abelian cycle group; it supplies no existence statement for general r. The all-constituent triangularity input is required, including constituents induced by non-locally-algebraic parameters.

*Additional hypotheses:* G2 supplies the strong-linkage and unitriangular Jordan–Hölder multiplicity results used in the proof.

*Proof plan:* 1. For every constituent family, use a principal-series presentation with that constituent occurring once and all remaining constituents strictly higher in the finite linkage order. This includes the non-locally-algebraic parameter families; G2 records the missing supplier contract. 2. Solve the resulting unitriangular system recursively in the free abelian cycle group. Parameters absent from X_tri give zero right-hand equations. 3. Do not infer termwise vanishing from a zero sum of signed cycles. The source makes that shortcut at the start of its proof; either a separate triangularity argument or an effectivity hypothesis is needed for that step, as recorded in E16.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 4.3.6, pp. 382–383.

*Needs:* [Y/multiplicity-problem](#y-multiplicity-problem).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-full-character-transfer"></a>

### 8.6 Full-character cycles and their dimensions

**Y/full-character-transfer (construction).** For de Rham generic regular r, transfer the same simple local-model cycles to C_v^δ on the full-character fibre through diagram (4.11); the additional n unramified-character coordinates are fixed. These cycles have codimension dn(n+1)/2+n, hence dimension n²−n+dn(n−1)/2, in the smooth ambient Galois ring of dimension n²+dn². The construction is independent of the auxiliary period frame.

*Proof plan:* 1. Refine the weight-fibre comparison by fixing the n unramified character coordinates. 2. Use smooth pullback and descent of cycles as in the weight transfer. 3. Calculate the codimension from the two independent framing dimensions and all dn+n character coordinates.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Diagram (4.11) and discussion before Proposition 4.3.7, pp. 382–383 (dimension corrected as E1).

*Needs:* [Y/weight-cycle-transfer](#y-weight-cycle-transfer), [Y/full-character-embedding](#y-full-character-embedding), [M/relative-representability](#m-relative-representability), `SpringerResolutionAndCharacteristicCycles:E/completion-cycle-map`.

**API.**

- `TriangulineCycle.characterTransfer` (constructor): Fix full characters rather than only their unit restrictions.
- `TriangulineCycle.character_codimension` (characterisation): Return codimension dn(n+1)/2+n.
- `TriangulineCycle.character_frame_independent` (compatibility): Descend the transferred cycle through period-frame changes.

*Used by:* Y/constituent-invariance and Y/crystalline-multiplicity — Supplies cycles with the exact dimension needed for full-character multiplicity identities..

**Checks.**

- `rankOne`: For n=1 the full-character fibre has dimension zero, while the weight fibre has dimension one.
- `rankTwo`: For n=2,d=1 the full-character fibre has dimension 3, compared with weight-fibre dimension 5.
- `higherDegree`: For n=2,d=2 the full-character dimension is 4 and codimension 8; replacing the extra n by dn would give the wrong answer.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-constituent-invariance"></a>

### 8.7 Independence from the principal-series presentation

**Y/constituent-invariance (theorem).** If two admissible presentations (w,δ) give isomorphic irreducible locally analytic constituents Π_w, the associated full-character cycles C_w^δ agree. Thus they depend only on r and Π_w in the generic de Rham setting where constructed.

*Additional hypotheses:* G2 supplies the precise constituent-isomorphism criterion and dominant parabolic conventions.

*Proof plan:* 1. Reduce to permutations within the dominant Levi blocks. 2. Use ν=0 splitting of the localized module and the supplier’s parabolic invariance of simple cycles. 3. Transport the resulting identity through the full-character diagram.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Proposition 4.3.7 and proof, pp. 383–384.

*Needs:* [Y/full-character-transfer](#y-full-character-transfer), [C/flag-uniqueness](#c-flag-uniqueness), `SpringerResolutionAndCharacteristicCycles:P/parabolic-cycle-invariance`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-crystalline-multiplicity"></a>

### 8.8 Local multiplicity formula for generic crystalline representations

**Y/crystalline-multiplicity (theorem).** For crystalline r with distinct labelled Hodge–Tate weights and generic Frobenius eigenvalue ratios as in G/companion-criterion, the effective intrinsic cycles C_{r,Π} exist and satisfy Y/multiplicity-problem for every δ∈Tⁿ, including parameters absent from X_tri. Their dimension is n²−n+dn(n−1)/2. This proves the crystalline case of the local conjecture, not the general conjecture or a global locally analytic socle statement.

*Proof plan:* 1. Use the companion criterion to list the relevant parameter points. 2. Transfer the completed geometric KL identity to each full-character fibre. 3. Identify its coefficients with the imported principal-series multiplicities and apply constituent invariance. 4. For an absent parameter, show that any constituent shared with a present parameter has zero cycle: constituent invariance supplies its refinement, and w_x≤w′≤w would contradict the companion criterion. Set every other constituent cycle to zero. Then apply conditional uniqueness to the all-parameter family.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Theorem 4.3.8 and proof, pp. 384–385 (dimension corrected as E1).

*Needs:* [Y/conditional-uniqueness](#y-conditional-uniqueness), [Y/constituent-invariance](#y-constituent-invariance), [Y/weight-kl](#y-weight-kl), [G/companion-criterion](#g-companion-criterion), `SpringerResolutionAndCharacteristicCycles:E/completed-kl-identity`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="y-rank-two-fibres"></a>

### 8.9 A rank-two split crystalline fibre calculation

**Y/rank-two-fibres (theorem).** For K=Q_p,n=2 and r=χ₁⊕χ₂ with χ_i=z^{h_i}unr(φ_i), h₁<h₂ and generic φ₁/φ₂, use δ=(z^{h₂}unrφ₁,z^{h₁}unrφ₂). X_tri is smooth at x, but its fixed-full-character completed fibre is reduced with two irreducible components, each of dimension 3; one is crystalline and one is not. The weight fibre has dimension 5. This is a test that flatness and smoothness of the ambient space do not imply smoothness of the character or weight projection.

*Proof plan:* 1. Apply the two-dimensional incidence calculation and retain the Galois framing directions. 2. Identify the two transferred components and their crystalline/noncrystalline loci. 3. Check dimensions against Y/full-character-transfer and verify the corresponding two principal-series constituents through G2.

*Source:* [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), §1, Examples (i) after Theorem 1.9, p. 305.

*Needs:* [Y/crystalline-multiplicity](#y-crystalline-multiplicity), [G/flat-character](#g-flat-character), [Y/full-character-transfer](#y-full-character-transfer), `SpringerResolutionAndCharacteristicCycles:S/steinberg-components`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=2,d=1 the smooth ambient Galois ring has dimension 8. A weight fibre has dimension 5 and a full-character fibre dimension 3. For n=2,d=2 those dimensions are 12, 6 and 4. For n=1,d=2 the full-character fibre is a point, not a negative-dimensional cycle. In the split GL₂ example the ambient trianguline space is smooth but its full-character fibre has two components.

### Dependencies

`LocalGaloisDeformationRings:R08.3`, `PadicMeasuresIwasawaAlgebras:L0a`, `SpringerResolutionAndCharacteristicCycles:E`, `SpringerResolutionAndCharacteristicCycles:K`, `SpringerResolutionAndCharacteristicCycles:P`, `SpringerResolutionAndCharacteristicCycles:S`, `SpringerResolutionAndCharacteristicCycles:Y`, [C](#c), [G](#g), [M](#m), [V](#v).

**Planning status: planned.** Close G2 with actual locally analytic constituents and their multiplicity/isomorphism API; discharge R7; keep the general multiplicity problem conjectural.

**Atlas planets:** Trianguline weight cycles; Trianguline Kazhdan–Lusztig cycle identity; Local trianguline multiplicity problem; Full-character trianguline cycles; Crystalline local multiplicity formula; Split crystalline rank-two fibres.

## Layer 9: Crystabelline Hodge parameters and modification

The second branch studies a module whose every refinement is noncritical, without assuming étaleness. The injection between two overlapping rank-(n−1) endpoints retains information lost by their isomorphism classes. The single-embedding modification itself is imported from its existing period-theory owner; only its endpoint/refinement diagram is new here.

<a id="h-crystabelline-parameters"></a>

### 9.1 Generic noncritical crystabelline Hodge parameters

**H/crystabelline-parameters (definition).** Fix φ and strictly decreasing h as in the Ding setting. ΦΓ_nc(φ,h) consists of rank-n crystabelline Robba modules with D[1/t]≅⊕_i R(φ_i)[1/t], weights h and all n! Frobenius refinements noncritical. For w∈S_n the corresponding integral triangulation has successive parameters φ_{w⁻¹(i)}z^{h_i}. No étaleness is required. The permutation is common to the embeddings, whereas the BHS weight permutation lies in (S_n)^Σ.

*Proof plan:* 1. Import crystalline filtered-module realization and integral triangulation, then impose noncriticality for every refinement. 2. Use the generic smooth-character ratios to identify the labelled Frobenius lines and their orderings.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.1 and notation ΦΓ_nc(φ,h), pp. 9–10.

*Needs:* `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-characters`.

**API.**

- `CrystabellineNC.refinement` (projection): Return the integral triangulation with parameters φ_{w⁻¹(i)}z^{h_i}.
- `CrystabellineNC.localizedSplit` (projection): Identify the labelled direct sum after inverting t.
- `CrystabellineNC.noncritical` (characterisation): Require the noncritical weight order for every common refinement.
- `CrystabellineNC.baseField` (functoriality): Extend E while preserving all labelled embeddings and refinements.

*Used by:* H/canonical-subquotients, D/refinement-tangents and I/higher-intertwining — Fixes the class of modules, the precise refinements and the descending weight convention..

**Checks.**

- `oneRefinementInsufficient`: Having only one noncritical refinement does not certify membership.
- `nonEtale`: A non-étale weakly inadmissible filtered module can still be in this category when its refinements meet the conditions.
- `labelOrder`: For n=2 the transposition exchanges φ₁ and φ₂ but keeps the decreasing order h₁,h₂ in the two graded positions.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-canonical-subquotients"></a>

### 9.2 Canonical labelled crystabelline subquotients

**H/canonical-subquotients (construction).** For each proper nonempty subset r⊂{1,…,n} of size k, construct the canonical rank-k D_r⊂D with localized Frobenius labels r and weights (h₁,…,h_k), and D^r=D/D_{rᶜ}, with labels r and weights (h_{n−k+1},…,h_n). Put D₁=D_{1,…,n−1} and C₁=D^{1,…,n−1}. The composite ι_D:D₁→D→C₁ is injective. Its source and target both have rank n−1, and their ordered weight lists differ.

*Proof plan:* 1. Take the appropriate initial segment of a noncritical refinement and prove independence of the internal ordering using its labelled localized summands. 2. Form the saturated quotient by the complementary canonical submodule. 3. Use generic rank-one Hom vanishing to show that the displayed composite has full rank and zero kernel.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.1, p. 11; exact sequences (2.1)–(2.2), p. 11.

*Needs:* [H/crystabelline-parameters](#h-crystabelline-parameters), `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.7/character-cohomology`.

**API.**

- `CrystabellineNC.subsetSubmodule` (constructor): Produce D_r with the first k decreasing weights.
- `CrystabellineNC.subsetQuotient` (constructor): Produce D^r with the last k weights.
- `CrystabellineNC.iota` (constructor): Compose the canonical inclusion D₁→D and projection D→C₁.
- `CrystabellineNC.iota_injective` (characterisation): The composite is an injective Robba-module map.

*Used by:* H/projective-iota, I/extension-correspondence and I/higher-intertwining — Provides the two rank-(n−1) modules and the injection whose projective class encodes Hodge parameters..

**Checks.**

- `rankTwo`: For n=2,D₁ has parameter φ₁z^{h₁}, while C₁ has parameter φ₁z^{h₂}.
- `complement`: For |r|=k, D/D_{rᶜ} has rank k, not n−k.
- `weightShift`: The quotient C₁ carries h₂,…,h_n, so identifying its weights with those of D₁ loses the Hodge information.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-torsion-period-invariants"></a>

### 9.3 Period calculation for an equal-rank torsion quotient

**H/torsion-period-invariants (lemma).** For an inclusion N⊂M of equal-rank Robba modules, the natural map H⁰_{φ,Γ}(M/N)→H⁰(G_K,W_dR⁺(M)/W_dR⁺(N)) is an isomorphism. If M is de Rham, this is D_dR⁺(M)/D_dR⁺(N). The cohomology is of the torsion quotient; it is not H⁰ of the localized module, where that quotient vanishes.

*Proof plan:* 1. Apply the exact B-pair cohomology sequence to N⊂M. 2. Use injectivity of the relevant H¹ comparison to identify the invariant quotient. 3. In the de Rham case use the period lattice comparison to compute invariants explicitly.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Lemma 2.1, pp. 10–11.

*Needs:* `PadicHodgeTheory:P7/b-pair-herr-comparison`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, [T/period-functor](#t-period-functor).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-hom-pencil"></a>

### 9.4 The rank-(n−1) injection pencil

**H/hom-pencil (theorem).** For D∈ΦΓ_nc(φ,h), dim_E Hom(D₁,C₁)≤2. It is two exactly when n≥3 and for each i<n the quotient (D₁)^{r_i} is isomorphic to the submodule (C₁)_{r_i}, where r_i={1,…,n−1} minus {i}. In that case the quotient–isomorphism–inclusion maps α_i are pairwise linearly independent and noninjective of rank n−2. In particular n=3 always gives dimension two; the stated n=4,K=Q_p case does as well.

*Proof plan:* 1. Use the localized direct sum to describe morphisms by labelled scalars. 2. Apply the torsion-period invariant formula and noncritical flags to bound their space by two. 3. Characterize the rank drop and the resulting quotient/submodule identifications; use distinct kernels for pairwise independence.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.2 and Remark 2.3, pp. 11–12.

*Needs:* [H/canonical-subquotients](#h-canonical-subquotients), [H/torsion-period-invariants](#h-torsion-period-invariants).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-projective-iota"></a>

### 9.5 Recovering a Hodge extension from its injection line

**H/projective-iota (theorem).** The cup/pushout pairing Ext¹(R(φ_nz^{h_n}),D₁)×Hom(D₁,C₁)→Ext¹(R(φ_nz^{h_n}),C₁) has an annihilator of ι_D of dimension d and containing the nonzero extension line E[D] from 0→D₁→D→R(φ_nz^{h_n})→0. For K=Q_p this annihilator equals E[D], so (D₁,C₁,[ι_D],φ_n) determines D up to isomorphism. For general K the dimension d statement alone does not give recovery.

*Proof plan:* 1. Apply Hom and Ext to the two canonical exact sequences. 2. Compute the relevant rank-one Herr groups and identify the annihilator via the connecting morphism. 3. For d=1 its dimension forces the extension line, and scalar multiples of a nonzero extension yield isomorphic middle modules.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.4, pp. 12–13.

*Needs:* [H/canonical-subquotients](#h-canonical-subquotients), [H/hom-pencil](#h-hom-pencil), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-cup`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-sigma-modification"></a>

### 9.6 Refinement-compatible modified endpoint diagrams

**H/sigma-modification (construction).** Import the period modification D⊂D_σ from PadicHodgeTheory:P7/embedding-selective-crystalline-modification. Define D₁,σ=(D_σ)_{1,…,n−1}, C₁,σ=(D_σ)^{1,…,n−1}, and ι_{Dσ} as their inclusion–projection composite. Identify these endpoints with the modifications of D₁ and C₁ using the ambient off-σ cutoff h_{τ,n} for both. Each refinement has parameters φ_{w⁻¹(i)}z^{(T_σh)_i}; the σ-filtered endpoint maps are the original ones. The existence, uniqueness, lattice construction and D_pst comparison of D_σ are imported, not constructed again here.

*Proof plan:* 1. Apply the imported period modification to D and saturate each labelled refinement step in D_σ. 2. Use rank-one character classification to identify its new graded weights. 3. Take the first n−1 labelled submodule and quotient, tracking the ambient cutoff and functorial inclusion–projection map.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.5 and Lemma 2.6, p. 13; endpoint notation and (2.7), pp. 13–14.

*Needs:* [H/canonical-subquotients](#h-canonical-subquotients), `PadicHodgeTheory:P7/embedding-selective-crystalline-modification`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-classification`.

**API.**

- `ModifiedEndpoints.ofModule` (constructor): Apply the imported D_σ construction and form its two labelled rank-(n−1) endpoints.
- `ModifiedEndpoints.inclusion` (projection): Retain D⊂D_σ and the equality after inverting t.
- `ModifiedEndpoints.sigmaFiltration` (compatibility): Preserve the complete σ-filtered de Rham module.
- `ModifiedEndpoints.refinement` (compatibility): The refinement w has parameters φ_{w⁻¹(i)}z^{(T_σh)_i}.

*Used by:* P/modifying-first-order and I/sigma-intertwining — Reduces recovery over a general K to a single varying Hodge filtration..

**Checks.**

- `oneEmbedding`: When K=Q_p the modification is D itself.
- `otherEmbedding`: For two embeddings, weights (3,1,0) at τ≠σ become (0,0,0), so D_σ is not regular at τ.
- `preserveSigma`: Changing the σ-Hodge filtration while keeping φ,h fixed changes D_σ; the construction cannot discard that filtration.
- `ambientCutoff`: For n=3 and off-σ weights (3,1,0), both D₁,σ and C₁,σ have weights (0,0); replacing the first endpoint cutoff by 1 is incorrect.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-sigma-recovery"></a>

### 9.7 The modified injection determines the σ-Hodge filtration

**H/sigma-recovery (theorem).** Every refinement of D_σ has the parameters in H/sigma-modification. The Hom-pencil bound and its rank-drop criterion hold for (D₁,σ,C₁,σ). The annihilator of ι_{Dσ} under the corresponding extension pairing is the one-dimensional line E[D_σ] for every K. Hence (D₁,σ,C₁,σ,[ι_{Dσ}],φ_n) recovers D_σ and the original σ-Hodge filtration.

*Proof plan:* 1. Apply the explicit modified period lattices to all refinement subquotients. 2. Repeat the Hom and Ext calculation, noting that only the σ-filtration contributes a nontrivial annihilator direction. 3. Recover the extension line, then use the preserved σ-filtration.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Propositions 2.7–2.8, p. 14.

*Needs:* [H/sigma-modification](#h-sigma-modification), [H/projective-iota](#h-projective-iota), [H/hom-pencil](#h-hom-pencil).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-rank-three-hodge-example"></a>

### 9.8 A rank-three Hodge parameter recovered from an injection

**H/rank-three-hodge-example (theorem).** For n=3 fix the Frobenius-labelled basis e₁,e₂,e₃ and a∈E minus {0,1}. At σ choose the Hodge plane span(e₁+e₂,e₁+a e₂+e₃) and Hodge line E(e₁+a e₂+e₃). The induced top lines of D₁,σ and C₁,σ are E(e₁+e₂) and E(e₁+a e₂); the projective class of their canonical injection recovers a once the labelled φ and weights are fixed. The excluded values produce a critical refinement and are not examples in ΦΓ_nc.

*Additional hypotheses:* For the displayed crystalline realization assume K/Q_p unramified and D crystalline, as in the source example.

*Proof plan:* 1. Intersect and project the displayed flag to the labelled Frobenius subquotients. 2. Write the injection in the induced bases and solve for the ratio a. 3. Check that a=0 or a=1 forces failure of the all-refinement noncriticality condition.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Example 2.9, pp. 14–15.

*Needs:* [H/sigma-recovery](#h-sigma-recovery).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="h-modification-surjectivity"></a>

### 9.9 Every single-embedding module lifts to a regular one

**H/modification-surjectivity (theorem).** The map T_σ:ΦΓ_nc(φ,h)→ΦΓ_nc(φ,T_σh) is surjective on isomorphism classes. Thus every module with the specified single varying σ-filtration comes from a module regular at every embedding, without asserting that the choice of the other filtrations is unique.

*Proof plan:* 1. Start with its fixed labelled Deligne–Fontaine module and retain the σ-filtration. 2. At each τ≠σ choose a full flag transverse to every one of the finitely many Frobenius refinement flags. The required open subset of the full flag variety is nonempty over the infinite coefficient field. 3. Give that flag the strictly decreasing jumps h_τ and reconstruct the crystabelline module by the imported filtered-module equivalence. Its modification is the original target.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Surjectivity assertion in (2.7), p. 13.

*Needs:* [H/sigma-modification](#h-sigma-modification), `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `SpringerResolutionAndCharacteristicCycles:F/relative-position`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=3, off-σ weights (3,1,0) become (0,0,0). Both rank-two endpoints must then have weights (0,0), using the ambient minimum 0; independently modifying the first endpoint with its own minimum 1 gives the wrong diagram. At σ, the two endpoint Hodge lines E(e₁+e₂) and E(e₁+a e₂) retain the projective parameter a∉{0,1}.

### Dependencies

`PadicHodgeTheory:P7`, `PadicHodgeTheory:R06.3`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `SpringerResolutionAndCharacteristicCycles:F`, [T](#t).

**Planning status: planned.** Build endpoint adapters on the existing PHT modification with the ambient cutoff; import R1–R2 through the period/cohomology dependencies.

**Atlas planets:** Noncritical crystabelline parameters; Crystabelline injection pencil; Projective injection Hodge parameter; Modified crystabelline endpoint diagrams; Single-embedding Hodge recovery; Rank-three Hodge parameter.

## Layer 10: Refinement tangent spaces and paraboline relations

Use the existing deformation functors and identify the tangent subspaces of their simultaneous refinements. First establish the graded paraboline quotient isomorphism directly, then prove refinement generation in Layer 12. Reversing that order would create a circular argument.

<a id="d-rank-one-derivative"></a>

### 10.1 Rank-one self-extensions as character derivatives

**D/rank-one-derivative (comparison).** Use the supplier’s identification of first-order deformations with Ext¹(D,D), where ε acts on an extension by projection followed by inclusion. In rank one Ext¹(R(δ),R(δ))≅Hom_cont(K×,E), with ψ corresponding to δ(1+εψ). The smooth subspace has dimension 1, the locally σ-analytic subspace dimension 2, and the full space dimension d+1. These normalizations fix the signs of all κ-maps below.

*Proof plan:* 1. Import Herr–Yoneda Ext and local Galois/Robba deformation equivalences. 2. Differentiate multiplication of rank-one characters over E[ε]/ε². 3. Use the unit/uniformizer decomposition of K× and the d independent embedding logarithms.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.1, (2.11), p. 15.

*Needs:* `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, `PadicMeasuresIwasawaAlgebras:L0a`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-refinement-tangents"></a>

### 10.2 Refinement deformation spaces and parameter derivatives

**D/refinement-tangents (definition).** For each refinement w let Ext¹_w(D,D) be the subspace of first-order deformations lifting its integral triangulation. Define κ_w:Ext¹_w→Hom_cont((K×)^n,E) from the derivatives of its n lifted characters, in their ordered graded positions. Ext¹_g(D,D) denotes the de Rham first-order subspace. The underlying deformation functors and their representing rings are imported; this target specifies their simultaneous refinement subspaces and derivatives.

*Proof plan:* 1. Use the supplier’s trianguline first-order cartesian square, keeping the chosen refinement. 2. Read the rank-one graded derivatives through D/rank-one-derivative. 3. Define the de Rham condition by the period comparison, then verify the conditions form E-linear subspaces.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.1, (2.11)–(2.12) and Proposition 2.10, pp. 15–16.

*Needs:* [H/crystabelline-parameters](#h-crystabelline-parameters), [D/rank-one-derivative](#d-rank-one-derivative), `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`.

**API.**

- `RefinementTangent.subspace` (constructor): Require a lift of the specified integral refinement.
- `RefinementTangent.kappa` (projection): Return the ordered character derivative.
- `RefinementTangent.inclusion` (projection): Forget the refinement to obtain an element of Ext¹(D,D).
- `RefinementTangent.deRham` (characterisation): On a refinement, de Rham classes are exactly those whose κ is smooth.

*Used by:* D/common-kernel and I/refinement-generation — Compares tangent directions of all refinements and separates their common kernel..

**Checks.**

- `scalarTwist`: D⊗R(1+εψ) belongs to every refinement space, with κ_w=(ψ,…,ψ).
- `nonSmoothTwist`: For a logarithmic nonsmooth ψ, that scalar twist is not de Rham.
- `smoothTwist`: For an unramified ψ, the scalar twist is de Rham and has the same ψ in every ordered position.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-tangent-dimensions"></a>

### 10.3 Dimensions and Weyl transport of refinement tangents

**D/tangent-dimensions (theorem).** The dimensions are dim Ext¹(D,D)=1+n²d, dim Ext¹_g=1+n(n−1)d/2, and dim Ext¹_w=1+n(n+1)d/2. Each κ_w is surjective and κ_w⁻¹(Hom_sm(T(K),E))=Ext¹_g. On Ext¹_g, κ_{w₂}=(w₂w₁⁻¹)κ_{w₁}, with the permutation action matching the ordered character positions.

*Proof plan:* 1. Compute H⁰ and H² of ad D by genericity and apply the Herr Euler characteristic. 2. Compute the de Rham local condition from the labelled regular filtration. 3. Use the trianguline smooth deformation ring and rank-one character derivatives for surjectivity and the displayed fibre condition. 4. Track the labelled Frobenius eigencharacters on de Rham lifts for Weyl transport.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.10 and Lemma 2.11, pp. 16–17.

*Needs:* [D/refinement-tangents](#d-refinement-tangents), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-tate-duality`, `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-common-kernel"></a>

### 10.4 The common zero-parameter quotient

**D/common-kernel (definition).** Let Ext¹₀(D,D)=ker κ_w; it is independent of w, lies in Ext¹_g and has dimension 1−n+dn(n−1)/2. Put barExt¹=Ext¹/Ext¹₀ and similarly for subspaces containing Ext¹₀. Then barExt¹_w≅Hom_cont(T(K),E), barExt¹_g≅Hom_sm(T(K),E), and dim barExt¹=dn(n+1)/2+n. This full-kernel identity applies to the regular original D and must not be transferred unchanged to D_σ.

*Proof plan:* 1. Use Weyl transport on the de Rham subspace and the κ fibre characterization. 2. Apply rank-nullity and descend κ to the indicated quotient. 3. Verify quotient maps agree for all refinements.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.1, (2.14)–(2.16), p. 17.

*Needs:* [D/tangent-dimensions](#d-tangent-dimensions), `mathlib:LinearMap.ker`, `mathlib:LinearMap.finrank_range_add_finrank_ker`.

**API.**

- `ZeroParameterTangent.subspace` (constructor): Use the common kernel as a native linear subspace of self-Ext.
- `ZeroParameterTangent.quotient` (constructor): Form the module quotient by that subspace.
- `ZeroParameterTangent.refinementEquiv` (equivalence): Descend κ_w to an isomorphism barExt¹_w≅Hom_cont(T(K),E).
- `ZeroParameterTangent.dimension` (characterisation): Compute dim Ext¹₀ and dim barExt¹ as stated.

*Used by:* I/higher-intertwining and P/modified-zero-kernel — Removes deformation directions invisible to all refinement characters while preserving the Hodge-parameter relation..

**Checks.**

- `rankTwoQp`: For n=2,d=1, dim Ext¹₀=0 and dim barExt¹=5.
- `rankThreeQp`: For n=3,d=1, dim Ext¹₀=1 and dim barExt¹=9.
- `originalVsModified`: For d>1 the full kernel of κ on D_σ is larger than its de Rham zero-parameter subspace; the present definition is not silently reused there.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-de-rham-up-to-twist"></a>

### 10.5 De Rham deformation directions up to scalar twist

**D/de-rham-up-to-twist (definition).** Define Ext¹_{g′}(D,D) as de Rham deformations up to a rank-one character twist. Let Hom_{g′}(T(K),E)=Hom_sm(T(K),E)+{ψ∘det:ψ∈Hom_cont(K×,E)}. Then Ext¹_{g′}=κ_w⁻¹(Hom_{g′}) for every w and has dimension 1+d(n(n−1)/2+1). Weyl transport of κ holds on this larger subspace.

*Proof plan:* 1. Use additivity of first-order character twists. 2. Identify the common derivative direction with ψ∘det and quotient its overlap with the smooth subspace. 3. Use the de Rham fibre formula and Weyl invariance of determinant.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.1, (2.17), p. 18.

*Needs:* [D/common-kernel](#d-common-kernel), [D/rank-one-derivative](#d-rank-one-derivative).

**API.**

- `DeRhamUpToTwist.subspace` (constructor): Add the scalar character-twist directions to Ext¹_g.
- `DeRhamUpToTwist.kappa_iff` (characterisation): Recognize membership by smooth derivatives plus one common continuous derivative.
- `DeRhamUpToTwist.weyl` (compatibility): Transport derivatives by the refinement permutation.

*Used by:* D/parabolic-up-to-twist and P/partial-local-condition — Identifies blockwise scalar twists without incorrectly imposing full de Rhamness..

**Checks.**

- `determinantTwist`: Every common ψ in all n coordinates is admitted.
- `nonCommonLogs`: A tuple of unrelated nonsmooth derivatives in two positions is excluded unless their difference is smooth.
- `rankTwoQp`: For n=2,d=1 its dimension is 3, compared with de Rham dimension 2.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-paraboline-tangents"></a>

### 10.6 Paraboline deformation subspaces

**D/paraboline-tangents (definition).** For a standard parabolic P with ordered block sizes n₁,…,n_r summing to n and a saturated P-filtration F_P of D, let M_i=gr_i F_P have rank n_i. Ext¹_{F_P}(D,D) consists of deformations lifting F_P, and κ_{F_P} sends them to the tuple in ∏_i Ext¹(M_i,M_i). A refinement w is compatible when its full flag refines F_P. Define quotient versions only after proving Ext¹₀⊂Ext¹_{F_P}.

*Proof plan:* 1. Use the relative Robba deformation category with a filtration of specified ranks. 2. Take the induced first-order deformations of the graded modules. 3. Verify independence of representatives and linearity via the Yoneda interpretation.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.1, P-filtration and (2.18), pp. 18–19.

*Needs:* [D/refinement-tangents](#d-refinement-tangents), [H/canonical-subquotients](#h-canonical-subquotients), `PhiGammaModulesAndIwasawaCohomology:PG.7/relative-category`.

**API.**

- `ParabolineTangent.subspace` (constructor): Lift F_P with graded ranks n_i, not cumulative ranks.
- `ParabolineTangent.graded` (projection): Return each first-order graded self-extension.
- `ParabolineTangent.refinement` (compatibility): A compatible full refinement induces this filtration and the corresponding graded refinements.
- `ParabolineTangent.blockRanks` (characterisation): Each gr_i has rank n_i; the i-th filtration term has rank n₁+⋯+n_i.

*Used by:* D/paraboline-dimensions and I/higher-intertwining — Provides the first- and last-line deformation conditions and their maps to rank-(n−1) self-Ext..

**Checks.**

- `oneBlock`: For P=GL_n the paraboline space is the entire self-Ext and κ is the identity.
- `allLines`: For P=B and the corresponding refinement, the condition is the trianguline condition and κ records rank-one derivatives.
- `twoBlocks`: For block sizes (2,1), graded ranks are (2,1), while filtration ranks are (2,3).
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-paraboline-dimensions"></a>

### 10.7 Paraboline dimensions and quotient product formulas

**D/paraboline-dimensions (theorem).** κ_{F_P} is surjective and dim Ext¹_{F_P}=1+d dim P, where dim P=Σ_{i≤j}n_i n_j. For a compatible refinement w, Ext¹_w is the inverse image of ∏Ext¹_{w_i}(M_i,M_i). The quotient barExt¹_{F_P}≅∏barExt¹(M_i,M_i) has dimension d dim(B∩L_P)+n, and its compatible trianguline quotients identify with the product of graded trianguline quotients. The sign before n is positive.

*Proof plan:* 1. Use successive extension lifting and rank-one H² vanishing to lift arbitrary graded deformations. 2. Compute the filtered endomorphism Euler characteristic and scalar H⁰. 3. Identify the common zero-parameter kernel by the graded de Rham derivative maps; apply rank-nullity to obtain the quotient product formula. 4. If using the source’s alternative spanning argument, order it after I/refinement-generation, rather than making that argument circular.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.13 and Corollary 2.14, pp. 18–19 (quotient dimension corrected as E2).

*Needs:* [D/paraboline-tangents](#d-paraboline-tangents), [D/common-kernel](#d-common-kernel), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-tate-duality`, [C/rank-one-comparison](#c-rank-one-comparison).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="d-parabolic-up-to-twist"></a>

### 10.8 Blockwise de Rham directions and Weyl transport

**D/parabolic-up-to-twist (comparison).** Let Ext¹_{F_P,g′} be the κ_{F_P}-inverse image of ∏Ext¹_{g′}(M_i,M_i). Its compatible-refinement derivative image is Hom_{P,g′}=Hom_sm(T(K),E)+Σ_i{ψ_i∘det_i}, of dimension n+rd. Derivative transport is equivariant for W_P, and membership is equivalent to the displayed blockwise condition.

*Proof plan:* 1. Apply the one-block up-to-twist calculation to each graded module. 2. Pull the condition back through κ_{F_P} and a compatible refinement. 3. Track the permutations within each Levi block, whose determinant is invariant.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.15, (2.21) and proof, pp. 19–20.

*Needs:* [D/paraboline-dimensions](#d-paraboline-dimensions), [D/de-rham-up-to-twist](#d-de-rham-up-to-twist).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=2,d=1, the full, de Rham and trianguline self-Ext dimensions are 5, 2 and 4; the common zero-parameter kernel is zero. For n=3,d=1 that kernel has dimension 1 and the full quotient dimension is 9. A P-filtration with block sizes (2,1) has graded ranks (2,1) and cumulative filtration ranks (2,3).

### Dependencies

`LocalGaloisDeformationRings:R08.1`, `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, [C](#c), [H](#h).

**Planning status: planned.** Import R2 and R7 through the deformation/character suppliers; retain the acyclic proof of the graded quotient isomorphism before refinement generation.

**Atlas planets:** Crystabelline refinement tangent spaces; Crystabelline tangent dimensions; Common zero-parameter tangent quotient; De Rham directions up to twist; Paraboline tangent spaces; Paraboline quotient product formula.

## Layer 11: Partial de Rham deformation spaces

The σ-subscript means de Rham at every embedding except σ. Modification makes all other weights equal and changes the de Rham zero-parameter kernel; the full trianguline κ-kernel must not be substituted for it. The first-order construction uses the one-jump replacement of the period filtration and retains its nilpotent coefficient operator.

<a id="p-partial-local-condition"></a>

### 11.1 Partial de Rham self-extension conditions

**P/partial-local-condition (definition).** For J⊂Σ a Robba module is J-de Rham when dim_E D_dR,τ equals its rank for every τ∈J. Write Ext¹_σ(D,D) for self-extensions that are (Σ minus {σ})-de Rham, and intersect this subspace with the refinement, paraboline and g′ conditions to obtain Ext¹_{σ,?}. Quotients barExt¹_{σ,?} are taken by Ext¹₀ whenever it is contained. For a de Rham rank-one character, Ext¹_σ≅Hom_σ(K×,E).

*Proof plan:* 1. Import partial B-pair de Rham local conditions at individual split embeddings. 2. Use the de Rham condition on each period component to define linear self-extension subspaces. 3. Apply the rank-one derivative comparison to identify the σ-analytic character directions.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.3.2, (2.22)–(2.25), pp. 20–21.

*Needs:* [D/refinement-tangents](#d-refinement-tangents), [D/common-kernel](#d-common-kernel), `PadicHodgeTheory:P7/b-pair-herr-comparison`.

**API.**

- `PartialDeRhamTangent.subspace` (constructor): Intersect the required period-kernel conditions at τ≠σ.
- `PartialDeRhamTangent.withFiltration` (constructor): Intersect with the specified refinement or paraboline space.
- `PartialDeRhamTangent.rankOneEquiv` (equivalence): Identify rank-one partial classes with locally σ-analytic additive characters.
- `PartialDeRhamTangent.allEmbeddings` (compatibility): Requiring de Rhamness at every embedding recovers Ext¹_g.

*Used by:* P/partial-dimensions and I/sigma-intertwining — Selects precisely the deformation directions that retain one varying Hodge filtration..

**Checks.**

- `q_p`: For K=Q_p there are no τ≠σ conditions, so Ext¹_σ is the full self-Ext space.
- `rankOne`: For d>1 the rank-one partial space has dimension 2, while full character derivatives have dimension d+1.
- `complement`: A nonsmooth derivative supported at τ≠σ violates the condition; a σ-logarithmic derivative is allowed.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="p-partial-dimensions"></a>

### 11.2 Partial de Rham dimensions and paraboline products

**P/partial-dimensions (theorem).** For regular D, dim Ext¹_σ(D,D)=1+(d−1)n(n−1)/2+n². For a P-filtration, dim Ext¹_{σ,F_P}=1+(d−1)n(n−1)/2+dim P; its graded map is surjective and induces barExt¹_{σ,F_P}≅∏_i barExt¹_σ(M_i,M_i). Compatible refinement quotients identify with the product of graded refinement quotients, and κ_w induces barExt¹_{σ,w}≅Hom_σ(T(K),E).

*Additional hypotheses:* Use R3: the partial B-pair dimension/exactness formula, verified in Ding19 Appendix A, Propositions A.3 and A.5, with the modified H²-vanishing hypotheses checked for the filtered endomorphism pieces.

*Proof plan:* 1. Identify each deformation subspace with H¹_{g,Σ minus {σ}} of the appropriate endomorphism B-pair. 2. Compute the τ≠σ period invariants from the descending weight differences, using the rank n_i graded pieces. 3. Compare dimensions with the paraboline graded map; its kernel is de Rham, so the partial map is surjective. 4. Pass through the common zero-parameter quotient and use the rank-one partial comparison.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Lemma 2.16, Proposition 2.17 and Corollaries 2.18–2.19, pp. 20–21.

*Needs:* [P/partial-local-condition](#p-partial-local-condition), [D/paraboline-dimensions](#d-paraboline-dimensions), `PadicHodgeTheory:P7/b-pair-herr-comparison`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="p-modified-dimensions"></a>

### 11.3 Tangent dimensions for the modified module

**P/modified-dimensions (theorem).** For D_σ, dim Ext¹=1+n²d, dim Ext¹_g=1+n(n−1)/2, and dim Ext¹_{F_P}=1+d dim P. Every de Rham deformation lifts every such P-filtration, and the graded paraboline map is surjective. However κ_w⁻¹(Hom_sm) has dimension 1+dn(n−1)/2, so strictly contains Ext¹_g when d>1. The partial dimensions are dim Ext¹_σ=1+n² and dim Ext¹_{σ,F_P}=1+dim P.

*Proof plan:* 1. Use generic H⁰=E and H²=0 for the full self-Ext dimension. 2. Use the constant τ≠σ weights to compute n² period invariants at those embeddings. 3. Show the off-diagonal de Rham Ext groups obstructing a filtration vanish; lift the filtration successively. 4. Apply the partial B-pair formula and then rank-nullity for κ_w.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.20, Remark 2.21 and Proposition 2.22, pp. 22–23; [Ding19](https://arxiv.org/pdf/1602.08859v2), Appendix A, Propositions A.3, A.5 and Corollary A.4, author preprint pp. 44–47.

*Needs:* [H/sigma-modification](#h-sigma-modification), [P/partial-dimensions](#p-partial-dimensions), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-tate-duality`, `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="p-modifying-first-order"></a>

### 11.4 Modification of first-order deformations

**P/modifying-first-order (construction).** For each deformation D̃ over R_{K,E[ε]/ε²}, construct a unique D̃_σ⊃D̃ with the same localization, the same σ-Sen weights, and τ≠σ Sen weights, as E-weights, all equal to h_{τ,n}. It reduces to D_σ and defines an E-linear map T_σ:Ext¹(D,D)→Ext¹(D_σ,D_σ), preserving partial de Rhamness and saturated filtrations. Constant E-weights do not impose vanishing of nilpotent Sen operators.

*Proof plan:* 1. Put A=E[ε]/ε². The underlying E-representation W_dR(D̃) is almost de Rham; apply the coefficient D_pdR equivalence without setting its nilpotent ν to zero. 2. At σ retain the original ν-stable filtration. At τ≠σ replace it by the one-jump filtration Fil^i=D_pdR(D̃)_τ for i≤−h_{τ,n} and Fil^i=0 otherwise. Its only graded piece is A-free, and it contains the original lattice filtration because h_{τ,n} is the ambient minimum. 3. Apply L/artinian-lattice to this filtration and M/gluing to the unchanged localized module. This produces the unique free A-Robba module containing D̃ with the specified localization and E-Sen spectrum. Uniqueness follows from the one-jump filtration off σ and, at σ, inclusion of lattices with the same elementary-divisor multiset. 4. The replacement commutes with finite coefficient tensor products and is exact on sequences using the same ambient cutoff. Thus pullback, pushout, Baer sums and scalar multiplication commute with it. Apply the same cutoff to filtration terms and quotients; their A-free graded pieces give saturation. Partial de Rhamness is ν=0 at the required embeddings, which this construction preserves.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.23 and (2.29), p. 23; [BHS19](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf), Lemma 3.2.2, pp. 337–340; Proposition 3.5.1 and Remark 3.5.2, pp. 355–356 (construction of the omitted coefficient details).

*Needs:* [H/sigma-modification](#h-sigma-modification), [L/artinian-lattice](#l-artinian-lattice), [T/period-functor](#t-period-functor), `PadicHodgeTheory:P7/sen-module`, [A/period-deformation](#a-period-deformation), [M/gluing](#m-gluing).

**API.**

- `FirstOrderModification.map` (constructor): Modify a genuine first-order Robba deformation over K.
- `FirstOrderModification.inclusion` (projection): Retain D̃⊂D̃_σ and the localized equality.
- `FirstOrderModification.linear` (compatibility): Commute with scalar multiplication and Baer sums of self-extensions.
- `FirstOrderModification.graded` (compatibility): Modify a saturated filtration and its graded deformations compatibly.

*Used by:* P/modification-kernel and I/partial-comparison — Compares Hodge-recovery relations for D and D_σ without identifying their full Ext spaces..

**Checks.**

- `q_pIdentity`: For K=Q_p the map is the identity.
- `scalarLogTwist`: A scalar infinitesimal twist supported at τ≠σ can have nonzero nilpotent Sen derivative after modification; constant residual E-weights do not kill it.
- `splitClass`: The split self-extension maps to the split self-extension of D_σ.
- Acceptance: Reconstruct through the actual Artinian lattice and B-pair equivalences, retaining the full nilpotent ν and A-action.
- Acceptance: Use the ambient cutoff for every graded piece; prove exactness before asserting E-linearity on Ext¹.


<a id="p-modification-kernel"></a>

### 11.5 Kernel and restricted surjectivity of modification

**P/modification-kernel (theorem).** ker T_σ has dimension (d−1)n(n−1)/2 and lies in Ext¹_g(D,D). Restrictions to Ext¹_g, Ext¹_σ and Ext¹_{σ,F_P} are surjective onto the corresponding spaces for D_σ, with this same kernel. The graded diagram commutes, and Ext¹_{σ,F_P}(D_σ,D_σ)→∏Ext¹_σ(M_i,σ,M_i,σ) is surjective. The full map on Ext¹ is not surjective when d>1 and n≥2.

*Proof plan:* 1. Compare T_σ with pushforward Ext¹(D,D)→Ext¹(D,D_σ) and the injective pullback from Ext¹(D_σ,D_σ). 2. Compute its kernel as torsion-quotient invariants using H/torsion-period-invariants. 3. Evaluate the period-lattice quotient dimensions; compare source and target dimensions for the three stated restrictions. 4. Use construction-level graded compatibility and the regular-module partial surjectivity.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.24 and diagram (2.30), pp. 23–24.

*Needs:* [P/modifying-first-order](#p-modifying-first-order), [H/torsion-period-invariants](#h-torsion-period-invariants), [P/modified-dimensions](#p-modified-dimensions), [P/partial-dimensions](#p-partial-dimensions).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="p-modified-zero-kernel"></a>

### 11.6 The modified de Rham zero-parameter quotient

**P/modified-zero-kernel (definition).** Define Ext¹₀(D_σ,D_σ) as the kernel of κ_w restricted to Ext¹_g(D_σ,D_σ). It is independent of w, has dimension 1−n+n(n−1)/2, and is strictly smaller than ker κ_w on the full refinement space if d>1. Define modified barExt¹ by this de Rham kernel. The maps κ_w:Ext¹_g→Hom_sm are surjective and obey Weyl transport.

*Proof plan:* 1. Use the modified de Rham dimension and parameter surjectivity obtained through T_σ. 2. Restrict before taking the kernel; apply rank-nullity and Weyl transport. 3. Compare its dimension with the full refinement kernel computed in P/modified-dimensions.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.25 and definition before Corollary 2.26, p. 24.

*Needs:* [P/modification-kernel](#p-modification-kernel), [P/modified-dimensions](#p-modified-dimensions), [D/common-kernel](#d-common-kernel).

**API.**

- `ModifiedZeroTangent.subspace` (constructor): Take the parameter kernel inside Ext¹_g, not inside all Ext¹_w.
- `ModifiedZeroTangent.quotient` (constructor): Form the quotient by precisely this subspace.
- `ModifiedZeroTangent.weyl` (compatibility): Show independence of w by the de Rham derivative permutation.
- `ModifiedZeroTangent.dimension` (characterisation): Compute dimension 1−n+n(n−1)/2.

*Used by:* P/quotient-comparison and I/sigma-intertwining — Uses the correct quotient in all modified higher-intertwining exact sequences..

**Checks.**

- `rankTwoDegreeTwo`: For n=2,d=2 the modified de Rham zero kernel is zero, while the full refinement κ-kernel has dimension one.
- `rankThree`: For n=3 any d the modified zero kernel has dimension one.
- `q_pAgreement`: For d=1 it agrees with the original regular-module zero kernel.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="p-quotient-comparison"></a>

### 11.7 Modification induces partial tangent quotient isomorphisms

**P/quotient-comparison (comparison).** Ext¹₀(D,D)=T_σ⁻¹(Ext¹₀(D_σ,D_σ)), and T_σ maps these zero subspaces surjectively. For *=g,σ or (σ,F_P), it induces barExt¹_*(D,D)≅barExt¹_*(D_σ,D_σ). The paraboline product isomorphisms commute with this comparison and the graded modifications.

*Proof plan:* 1. Use the kernel and restricted surjectivity theorem and the commuting κ diagram. 2. Characterize both zero subspaces inside their respective de Rham spaces. 3. Apply the quotient isomorphism theorem and compare the two graded product diagrams.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollaries 2.26–2.27, pp. 24–25.

*Needs:* [P/modified-zero-kernel](#p-modified-zero-kernel), [P/modification-kernel](#p-modification-kernel), [D/common-kernel](#d-common-kernel), [P/partial-dimensions](#p-partial-dimensions).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For n=2,d=2, original Ext¹₀ has dimension 1, modified Ext¹₀ has dimension 0, and the modification map has kernel dimension 1. Both full self-Ext spaces have dimension 9, so the full map cannot be surjective. The partial spaces have dimensions 6 and 5, and their restricted map is surjective with that kernel. A nonsmooth scalar twist at τ≠σ remains visible as a nilpotent Sen operator after modification.

### Dependencies

`PadicHodgeTheory:P7`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, [A](#a), [D](#d), [H](#h), [L](#l), [M](#m), [T](#t).

**Planning status: planned.** Discharge R3 and inherited R1–R2; implement the explicit one-jump Artinian construction for first-order modification, checking exactness and nilpotent Sen directions.

**Atlas planets:** Partial de Rham tangent spaces; Partial de Rham paraboline product formula; Modified-module tangent dimensions; First-order Hodge modification; Hodge-modification kernel; Modified de Rham zero-parameter quotient.

## Layer 12: Higher intertwining and recovery of Hodge parameters

Pullback and pushout must come from the same extension. Their signed image is the compatibility relation; the product of their separate images loses the required datum. Higher intertwining identifies that relation with the kernel of the sum of the two paraboline maps. The original and single-embedding exact sequences recover different amounts of Hodge data.

<a id="i-extension-correspondence"></a>

### 12.1 Pullback and pushout along a Hodge injection

**I/extension-correspondence (construction).** For ι:D₁→C₁ define ι⁻:Ext¹(C₁,D₁)→Ext¹(D₁,D₁) by pullback and ι⁺:Ext¹(C₁,D₁)→Ext¹(C₁,C₁) by pushout. Write Ext¹_ι for their respective image subspaces. Both maps are E-linear and preserve de Rham local conditions. This notation includes noninjective ι, but later rigidity theorems specify injectivity.

*Proof plan:* 1. Use the supplier’s exact category and native Yoneda functoriality. 2. Apply the universal pullback and pushout constructions with all identifications of endpoints. 3. Verify compatibility with the period functor and addition of extensions.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Formula (2.34), pp. 25–26.

*Needs:* [H/canonical-subquotients](#h-canonical-subquotients), `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, `mathlib:LinearMap.range`.

**API.**

- `HodgeInjection.pullback` (constructor): Pull an extension back along ι on its quotient.
- `HodgeInjection.pushout` (constructor): Push an extension out along ι on its submodule.
- `HodgeInjection.image` (constructor): Take the native linear range of each map.
- `HodgeInjection.deRham` (compatibility): Both operations preserve the period-local extension subspace.

*Used by:* I/injection-rigidity and I/matched-relation — Encodes the Hodge injection through first-order deformation spaces..

**Checks.**

- `zeroMap`: For ι=0 both maps and both image subspaces are zero.
- `identity`: For ι=id on a single module both maps are the identity on self-Ext.
- `scale`: Replacing ι by a∈E× times ι scales both linear maps and preserves their image subspaces.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-noninjective-images"></a>

### 12.2 Dimensions of the exceptional noninjective images

**I/noninjective-images (lemma).** Assume dim Hom(D₁,C₁)=2 and use the rank-(n−2) maps α_i. Each Ext¹_{α_i} has dimension (n−1)(n−2)d. For distinct i,j their intersection has dimension (n−1)(n−3)d+d−1 and their sum has dimension 1+n(n−2)d. Both assertions hold on the D₁ and on the C₁ side.

*Proof plan:* 1. Express the image as the kernel of pullback to the corresponding rank-one labelled submodule. 2. Compute the two-map kernel by the torsion-period invariant formula. 3. Use the native dimension identity for a sum and intersection of subspaces.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Lemma 2.28 and proof, p. 26.

*Needs:* [I/extension-correspondence](#i-extension-correspondence), [H/hom-pencil](#h-hom-pencil), [H/torsion-period-invariants](#h-torsion-period-invariants), `mathlib:Submodule.finrank_sup_add_finrank_inf_eq`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-injection-rigidity"></a>

### 12.3 Self-extension images determine the injection line

**I/injection-rigidity (theorem).** If ι:D₁→C₁ is injective, both Ext¹_ι image spaces have dimension 1+(n−1)(n−2)d and contain the relevant de Rham self-Ext space. For any ι′, equality of either image with the corresponding image of ι is equivalent to ι′=aι for a∈E×. For a de Rham M∈Ext¹(C₁,D₁), the smooth derivatives κ_{φ₁}(ι⁻M) and κ_{φ₁}(ι⁺M) agree.

*Proof plan:* 1. Compute the kernel from torsion period invariants and obtain the image dimension. 2. Use the de Rham local-condition dimension formula to prove surjectivity onto de Rham self-Ext. 3. If ι′ is not proportional, the two exceptional α_i images would both lie in an image too small for their computed sum. 4. Compare the de Rham rank-one character derivatives under the induced injection between the two self-extensions.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.29 and Lemma 2.30, pp. 26–28.

*Needs:* [I/noninjective-images](#i-noninjective-images), [P/partial-dimensions](#p-partial-dimensions), [D/tangent-dimensions](#d-tangent-dimensions).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-matched-relation"></a>

### 12.4 The signed matched-extension relation

**I/matched-relation (construction).** Define I_ι as the image of M↦(ι⁻M,−ι⁺M) in Ext¹(D₁,D₁)×Ext¹(C₁,C₁). Equivalently its points are pairs arising from one common extension with the indicated minus sign. For native linear maps f:U→V and g:U→W this is LinearMap.range(f.prod(−g)); it is a submodule, not the product of the two separate ranges.

*Proof plan:* 1. Use the linear pullback/pushout maps and the native product linear map. 2. Take its native range; express membership by existence of a common preimage. 3. Keep the sign fixed to match the kernel of the addition map in the higher-intertwining exact sequence.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Formula (2.36) and Corollary 2.31, p. 28.

*Needs:* [I/extension-correspondence](#i-extension-correspondence), `mathlib:LinearMap.prod`, `mathlib:LinearMap.range`.

**API.**

- `MatchedRelation.range` (constructor): Take range(f.prod(−g)) for native linear maps.
- `MatchedRelation.mem_iff` (characterisation): (v,w) belongs iff ∃u, f(u)=v and −g(u)=w.
- `MatchedRelation.scale` (compatibility): Multiplying both maps by a nonzero scalar preserves the relation.
- `MatchedRelation.projections` (projection): Project a related pair to the separate ranges; the converse needs a common preimage.

*Used by:* I/higher-relation and I/hodge-recovery-exact — Supplies the signed compatibility datum that survives after quotienting invisible deformation directions..

**Checks.**

- `zero`: For f=g=0 the relation is the zero subspace.
- `identity`: For f=g=id_E the relation is the anti-diagonal {(a,−a)}; (1,1) is not related in characteristic zero.
- `notProduct`: For f=g=id_E the pair (1,0) lies in the product of ranges but not in the matched relation.
- `scalar`: Scaling both identity maps by 2 preserves the anti-diagonal over E.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-relation-rigidity"></a>

### 12.5 The matched relation determines the Hodge injection

**I/relation-rigidity (theorem).** For injective ι and ι′, I_ι=I_{ι′} if and only if ι′∈E×ι. For D,D′ in the nonempty family ΦΓ_nc(D₁,C₁,φ_n) with the same fixed endpoints, equality I_D=I_{D′} is equivalent to equality of the injection lines; when K=Q_p it is equivalent to D≅D′.

*Additional hypotheses:* The family consists of isomorphism classes with the displayed endpoint identifications and Hom(D₁,D)=Hom(D,C₁)=E.

*Proof plan:* 1. Project the common signed relation onto either self-Ext space and apply image rigidity. 2. Conversely rescale the common extension variable. 3. Apply H/projective-iota for the Q_p recovery assertion.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.31, p. 28.

*Needs:* [I/matched-relation](#i-matched-relation), [I/injection-rigidity](#i-injection-rigidity), [H/projective-iota](#h-projective-iota).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-higher-intertwining"></a>

### 12.6 The first/last-filtration higher-intertwining criterion

**I/higher-intertwining (theorem).** Let F be D₁⊂D and G be R(φ_nz^{h₁})⊂D. For D̃∈Ext¹_F(D,D), write κ_F(D̃)=(D̃₁,ψ). Then D̃ also belongs to Ext¹_G if and only if D̃₁⊗R(1−εψ) belongs to Ext¹_{ι_D}(D₁,D₁). In that case κ_{G,2}=ψ and there is M∈Ext¹(C₁,D₁) with D̃₁=ι_D⁻M⊗R(1+εψ) and κ_{G,1}=ι_D⁺M⊗R(1+εψ). All Robba coefficients are over K.

*Proof plan:* 1. Twist by 1−εψ to reduce to ψ=0. 2. Identify the two filtration conditions as kernels of the relevant pullback/pushout compositions. 3. Use torsion-period invariants to show the intermediate rank-one Ext map is injective. 4. The remaining kernel is the image of Ext¹(C₁,D₁); restore the common twist to read both graded maps.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Theorem 2.32, pp. 28–29 (coefficient notation corrected as E3).

*Needs:* [D/paraboline-dimensions](#d-paraboline-dimensions), [I/extension-correspondence](#i-extension-correspondence), [H/torsion-period-invariants](#h-torsion-period-invariants), [I/injection-rigidity](#i-injection-rigidity).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-first-last-generation"></a>

### 12.7 Two paraboline spaces span self-Ext

**I/first-last-generation (theorem).** dim(Ext¹_F∩Ext¹_G)=1+(n²−2n+2)d, and Ext¹_F+Ext¹_G=Ext¹(D,D). Here each of Ext¹_F and Ext¹_G has dimension 1+(n²−n+1)d. Compute dim(F+G)=dim F+dim G−dim(F∩G), subtracting the whole intersection dimension including its constant term.

*Proof plan:* 1. Use the higher-intertwining criterion, the rank-one character space of dimension d+1, and ker κ_F of dimension −1+(n−1)d to compute the intersection. 2. Apply the native submodule dimension identity and compare with dim Ext¹(D,D).

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.33, p. 29 (displayed arithmetic corrected as E4).

*Needs:* [I/higher-intertwining](#i-higher-intertwining), [D/paraboline-dimensions](#d-paraboline-dimensions), [D/tangent-dimensions](#d-tangent-dimensions), `mathlib:Submodule.finrank_sup_add_finrank_inf_eq`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-refinement-generation"></a>

### 12.8 All noncritical refinements span the tangent space

**I/refinement-generation (theorem).** The sum map ⊕_{w∈S_n}Ext¹_w(D,D)→Ext¹(D,D) is surjective, and remains surjective after quotienting by Ext¹₀. This is proved by rank induction from the first/last-filtration spanning theorem and the graded refinement preimage formula, rather than using this result as its own prerequisite.

*Proof plan:* 1. For rank one there is a single refinement. 2. Use I/first-last-generation in rank n. 3. Lift spanning refinement directions from the rank n−1 graded module through each paraboline graded map; its kernel is contained in each compatible refinement space. 4. Pass to the common quotient.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.12, p. 18, with the rank-induction proof indicated there using Corollary 2.33, p. 29.

*Needs:* [I/first-last-generation](#i-first-last-generation), [D/paraboline-dimensions](#d-paraboline-dimensions), [D/common-kernel](#d-common-kernel).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-higher-relation"></a>

### 12.9 The higher-intertwining relation on tangent quotients

**I/higher-relation (definition).** Set V=(barExt¹(D₁,D₁)×Hom(K×,E))⊕(barExt¹(C₁,C₁)×Hom(K×,E)). Define L(D,D₁,C₁) to consist of ((a,ψ),(b,−ψ)) for which representatives ã,b̃ satisfy (ã⊗R(1−εψ), b̃⊗R(1+εψ))∈I_D. Existence of such representatives is required; an unqualified condition on arbitrary representatives before quotienting is insufficient.

*Proof plan:* 1. Use the quotient paraboline product isomorphisms to identify V with barExt¹_F⊕barExt¹_G. 2. Show that changing representatives by Ext¹₀ is absorbed by the de Rham image subspaces in I_D. 3. Apply the signed matched relation after the two opposite twists and prove the result is a linear subspace.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Definition preceding Corollary 2.34, p. 30.

*Needs:* [I/matched-relation](#i-matched-relation), [D/common-kernel](#d-common-kernel), [D/paraboline-dimensions](#d-paraboline-dimensions), [I/higher-intertwining](#i-higher-intertwining).

**API.**

- `HigherIntertwiningRelation.subspace` (constructor): Require the signed scalar coordinates and existence of matched twisted representatives.
- `HigherIntertwiningRelation.representative_independent` (compatibility): The existential condition descends through both zero-parameter quotients.
- `HigherIntertwiningRelation.zeroTwist` (characterisation): For ψ=0 the condition is the image of I_D in the product quotient.
- `HigherIntertwiningRelation.parabolineEquiv` (equivalence): Identify V with the sum of the two quotient paraboline spaces.

*Used by:* I/hodge-recovery-exact and analytic crystabelline representation consumers — Exports the intrinsic relation whose kernel presentation and rigidity recover Hodge parameters..

**Checks.**

- `oppositeCharacters`: Every member has scalar coordinates ψ and −ψ; unrelated coordinates are excluded.
- `zeroTwist`: A pair coming from M gives (([ι⁻M],0),([−ι⁺M],0)).
- `invisibleClass`: Changing either representative by an allowed common zero-parameter class does not change membership.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-hodge-recovery-exact"></a>

### 12.10 A tangent presentation that recovers the Hodge parameter

**I/hodge-recovery-exact (theorem).** There is a natural short exact sequence 0→L(D,D₁,C₁)→V→barExt¹(D,D)→0, where the last map adds the two paraboline classes. For fixed endpoints and φ_n, L(D,D₁,C₁)=L(D′,D₁,C₁) if and only if ι_D′∈E×ι_D; for K=Q_p this is equivalent to D≅D′.

*Proof plan:* 1. Use I/first-last-generation for surjectivity after quotienting. 2. Use I/higher-intertwining and the opposite-sign relation to identify the kernel. 3. Set ψ=0 to recover each self-Ext image modulo Ext¹₀; de Rham containment lifts equality to full images. 4. Apply injection rigidity and H/projective-iota.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.34 and (2.40), p. 30.

*Needs:* [I/higher-relation](#i-higher-relation), [I/first-last-generation](#i-first-last-generation), [I/relation-rigidity](#i-relation-rigidity).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-sigma-images"></a>

### 12.11 Partial extension images recover the modified injection

**I/sigma-images (theorem).** For injective ι_σ:D₁,σ→C₁,σ, use Ext¹_σ(C₁,σ,D₁,σ) in the pullback and pushout maps. Their image dimensions are 1+(n−1)(n−2), they contain the respective de Rham self-Ext spaces, and equality of either image determines ι_σ up to E×. The signed relation I_{Dσ} determines D_σ up to isomorphism for every K.

*Proof plan:* 1. Repeat the torsion-quotient image computation with the partial local condition. 2. Use the partial B-pair exact-sequence theorem, including its hypotheses, to justify each dévissage rather than treating partial H¹ as automatically exact. 3. Apply the modified Hom-pencil argument and H/sigma-recovery.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.35 and Corollary 2.36, pp. 30–31.

*Needs:* [I/injection-rigidity](#i-injection-rigidity), [H/sigma-recovery](#h-sigma-recovery), [P/partial-dimensions](#p-partial-dimensions), [P/modified-dimensions](#p-modified-dimensions).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-sigma-intertwining"></a>

### 12.12 Higher intertwining with one varying Hodge embedding

**I/sigma-intertwining (theorem).** For D̃_σ∈Ext¹_{σ,F}(D_σ,D_σ) with κ_F=(D̃₁,σ,ψ), ψ∈Hom_σ(K×,E), the additional G-filtration exists exactly when D̃₁,σ⊗R_{K,E[ε]/ε²}(1−εψ) belongs to the partial injection image. In this case κ_{G,2}=ψ and a common M∈Ext¹_σ(C₁,σ,D₁,σ) gives both graded deformations with the same +εψ twist, as in I/higher-intertwining.

*Proof plan:* 1. Repeat the first/last-filtration kernel argument using partial Ext. 2. Invoke the requested partial exact-sequence input, with its modified H²-vanishing condition at each dévissage. 3. Use the modified torsion-period vanishing and restore the twist over the K-Robba ring.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Theorem 2.37, p. 31 (D₁,σ and coefficient notation corrected as E3).

*Needs:* [I/higher-intertwining](#i-higher-intertwining), [I/sigma-images](#i-sigma-images), [P/modified-dimensions](#p-modified-dimensions), `PadicHodgeTheory:P7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-sigma-relation"></a>

### 12.13 The single-embedding higher-intertwining relation

**I/sigma-relation (construction).** Set V_σ=(barExt¹_σ(D₁,σ,D₁,σ)×Hom_σ(K×,E))⊕(barExt¹_σ(C₁,σ,C₁,σ)×Hom_σ(K×,E)), using the modified de Rham zero subspaces. Define L_σ(D_σ,D₁,σ,C₁,σ) by the signed opposite-twist representative condition with I_{Dσ}, exactly as in I/higher-relation. Both the C₁,σ endpoint and the σ-subscript on the partial condition are essential.

*Proof plan:* 1. Use the partial graded quotient products and the modified zero subspaces. 2. Descend the partial matched relation through those quotients using its de Rham image containment. 3. Verify compatibility with the scalar σ-analytic character coordinates.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Definition preceding Corollary 2.38, pp. 31–32 (endpoint notation corrected as E5).

*Needs:* [I/sigma-intertwining](#i-sigma-intertwining), [P/modified-zero-kernel](#p-modified-zero-kernel), [I/higher-relation](#i-higher-relation).

**API.**

- `SigmaHigherRelation.subspace` (constructor): Use partial Ext and the modified quotient kernels.
- `SigmaHigherRelation.representatives` (compatibility): Descend the opposite-twist condition to quotient classes.
- `SigmaHigherRelation.character` (projection): Read ψ∈Hom_σ and the opposite coordinate −ψ.

*Used by:* I/sigma-recovery-exact and I/partial-comparison — Encodes the one-embedding Hodge filtration in a quotient deformation relation..

**Checks.**

- `q_p`: For K=Q_p this reduces to the original L relation.
- `correctEndpoint`: The second endpoint is C₁,σ; replacing it by an unrelated D₂,σ does not type-check the pushout relation.
- `kernelChoice`: For n=2,d=2 use the zero modified de Rham kernel, not the one-dimensional full refinement kernel.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-sigma-recovery-exact"></a>

### 12.14 The single-embedding recovery exact sequence

**I/sigma-recovery-exact (theorem).** There is a short exact sequence 0→L_σ(D_σ,D₁,σ,C₁,σ)→V_σ→barExt¹_σ(D_σ,D_σ)→0. For fixed endpoints and φ_n, equality of these L_σ relations is equivalent to D_σ≅D′_σ, for every finite K/Q_p. Hence the relation determines the original σ-Hodge filtration.

*Proof plan:* 1. Apply the partial higher-intertwining criterion to identify the kernel. 2. Compute the partial first/last-filtration intersection and sum to prove surjectivity. 3. Use partial image rigidity and the one-dimensional modified annihilator for recovery.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.38 and (2.42), p. 32.

*Needs:* [I/sigma-relation](#i-sigma-relation), [I/sigma-images](#i-sigma-images), [H/sigma-recovery](#h-sigma-recovery).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-partial-comparison"></a>

### 12.15 Modification identifies the two recovery sequences

**I/partial-comparison (comparison).** Let V(D₁,C₁)_σ be the partial subspace of V and L(D,D₁,C₁)_σ=L∩V_σ. Modification T_σ identifies its exact sequence 0→L_σ→V_σ→barExt¹_σ(D,D)→0 with the modified sequence of I/sigma-recovery-exact, by isomorphisms on all three terms. Thus the original module’s partial tangent relation recovers its σ-Hodge filtration.

*Proof plan:* 1. Use P/quotient-comparison for the two endpoint and target quotient isomorphisms. 2. Check commutativity of pullback, pushout, character twists and modification. 3. Transfer exactness and identify the kernel relation.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Proposition 2.39, p. 32.

*Needs:* [P/quotient-comparison](#p-quotient-comparison), [I/hodge-recovery-exact](#i-hodge-recovery-exact), [I/sigma-recovery-exact](#i-sigma-recovery-exact).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="i-partial-refinement-generation"></a>

### 12.16 Partial refinement spaces generate all partial deformations

**I/partial-refinement-generation (theorem).** For both D and D_σ the map ⊕_{w∈S_n}Ext¹_{σ,w}→Ext¹_σ is surjective, as is its barExt quotient. This generation statement includes the original and modified modules with their different zero kernels.

*Proof plan:* 1. Use I/partial-comparison to span the quotient partial tangent space by the first/last paraboline spaces. 2. Induct on rank using the partial graded product and compatible-refinement preimage formulas. 3. Since the relevant Ext¹₀ lies in every compatible refinement, lift quotient surjectivity to full partial Ext.

*Source:* [Ding25](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), Corollary 2.40 and its proof, p. 32.

*Needs:* [I/partial-comparison](#i-partial-comparison), [P/partial-dimensions](#p-partial-dimensions), [P/modified-zero-kernel](#p-modified-zero-kernel).
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

For f=g=id_E, the matched relation is {(a,−a)}. Its two projections are both all of E, but (1,0) is not related. For n=3,d=1, each first/last paraboline space has dimension 8 and their intersection dimension 6, giving 8+8−6=10=dim Ext¹(D,D). The common-preimage sign and the full intersection subtraction are independent checks.

### Dependencies

`PadicHodgeTheory:P7`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, [D](#d), [H](#h), [P](#p).

**Planning status: planned.** Discharge R3 and inherited period/character extensions; implement the signed common-preimage relation and both exact sequences with their distinct zero kernels.

**Atlas planets:** Hodge-injection rigidity; Matched Hodge-extension relation; Crystabelline higher intertwining; Higher-intertwining Hodge relation; Higher-intertwining Hodge recovery; Single-embedding higher-intertwining recovery.

## Layer 13: Ordered-regular local deformation applications

This branch uses Newton–Thorne’s weaker, ordered regularity condition and their opposite sign for weights. It gives the local tangent and noncriticality inputs to eigenvariety arguments. The final rank-two application separates the absence of finite-dimensional (φ,Γ)-stable subspaces from the differential-equation theorem that makes a polynomial connection kernel finite.

<a id="n-regular-parameters"></a>

### 13.1 Ordered-regular parameters and ordinary flags

**N/regular-parameters (definition).** Define NT-regularity of δ=(δ₁,…,δ_n) by δ_i/δ_j≠∏ττ^aτ for every i<j and every aτ≥0. A parameter is ordinary when each δ_i(ϖ_K) is a p-adic unit. For an ordinary tuple, a Galois representation is trianguline of that parameter exactly when it has a G_K-stable flag whose graded characters are δ_i∘Art_K⁻¹. These conditions are ordered and use the arithmetic reciprocity normalization of NT.

*Proof plan:* 1. Import the existing rank-one Robba and integral triangulation definitions. 2. Apply rank-one étaleness and the exact étale Robba/Galois equivalence to ordinary graded pieces. 3. Use the ordered rank-one H⁰ vanishing for the NT-regular condition.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), §2.3.1 before Lemma 2.4, p. 28.

*Needs:* `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.7/character-cohomology`, `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicMeasuresIwasawaAlgebras:L0a`.

**API.**

- `NTParameter.regular` (characterisation): Exclude only the displayed nonnegative algebraic ratios for i<j.
- `NTParameter.ordinary` (characterisation): Each δ_i evaluated at a uniformizer has valuation zero.
- `NTParameter.ordinaryFlag` (equivalence): Identify ordinary triangulations with ordered Galois flags.
- `NTParameter.weightConvention` (compatibility): The negative derivative weights agree with NT Definition 2.5.

*Used by:* N/strict-uniqueness and N/fixed-weight-de-rham — Provides the weaker ordered hypothesis used in the NT local tangent argument..

**Checks.**

- `rankOne`: Regularity is vacuous for n=1.
- `orderedExclusion`: For n=2,δ₁/δ₂=∏ττ^aτ with aτ≥0 fails regularity even when the reversed ratio would not.
- `unit`: An ordinary parameter has zero individual uniformizer valuations, not just zero valuation of their product.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-strict-uniqueness"></a>

### 13.2 Strictness and uniqueness for ordered-regular parameters

**N/strict-uniqueness (theorem).** If ρ has an integral triangulation of NT-regular parameter δ, it is unique and strict: for 0≤i≤n−1 the H⁰ of (D_rig(ρ)/Fil_i)(δ_{i+1}⁻¹) is one-dimensional. There is no δ_{n+1} condition. This theorem needs no cyclotomic exceptional-ratio exclusion.

*Proof plan:* 1. Compute H⁰ on the graded rank-one pieces: the matched index gives E and later indices give zero by NT regularity. 2. Induct through the quotient filtration to prove the one-dimensional assertion. 3. A normalized generator determines the first line, then repeat on the quotient.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Lemma 2.4, pp. 28–29 (index range corrected as E6).

*Needs:* [N/regular-parameters](#n-regular-parameters), `PhiGammaModulesAndIwasawaCohomology:PG.7/character-cohomology`, `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-ordered-deformation"></a>

### 13.3 The ordered-regular deformation condition and weight tangent

**N/ordered-deformation (definition).** Given (ρ,F,δ) with δ NT-regular, let D_{ρ,F,δ}(A) be triples (ρ_A,F_A,δ_A) reducing to them, modulo conjugation by 1+M_n(m_A) transporting the flag; F_A is an integral saturated triangulation of D_rig(ρ_A). Its tangent identifies with H¹_tri,δ(K,adρ)⊂H¹(K,adρ). Restrict δ_A to (O_K×)^n to obtain the weight map to Ŵ_{δ|units}; its derivative is the weight-tangent map.

*Proof plan:* 1. Use the exact coefficient Galois–Robba equivalence and strictness for the lifting condition. 2. Keep the special-fibre identifications and strict conjugation relation. 3. Apply the standard deformation-cohomology tangent identification, then differentiate the restriction of characters.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Definition 2.5 and discussion around Proposition 2.6, pp. 29–30.

*Needs:* [N/strict-uniqueness](#n-strict-uniqueness), `LocalGaloisDeformationRings:R08.1/local-tangent-obstruction`, `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeTheory:P7`.

**API.**

- `NTTriangulineDef.lift` (constructor): Lift the representation, the saturated ordered flag and its based characters.
- `NTTriangulineDef.forget` (projection): Forget the flag and parameter modulo strict conjugation.
- `NTTriangulineDef.tangent` (equivalence): Identify the tangent image with the specified H¹_tri,δ subspace.
- `NTTriangulineDef.weight` (projection): Restrict parameters to units, then differentiate at the base point.

*Used by:* N/ordered-representability, N/fixed-weight-de-rham and N/closure-tangent — Supplies the exact local tangent subspace that global eigenvariety arguments pull back..

**Checks.**

- `strictConjugacy`: Conjugating by a matrix reducing to the identity gives the same deformation class.
- `unramified`: An infinitesimal unramified character twist has zero unit-weight tangent.
- `logarithmic`: A nonzero embedding-logarithm scalar twist has nonzero unit-weight tangent, even if its value at a uniformizer is fixed.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-ordered-representability"></a>

### 13.4 Representability under the weaker ordered regularity condition

**N/ordered-representability (theorem).** For NT-regular δ the forgetful transformation D_{ρ,F,δ}→D_ρ is relatively representable and injective on A-points for every A∈Art_E. If ρ is absolutely irreducible, both unframed functors are prorepresentable and R_ρ→R_{ρ,F,δ} is surjective. Absolute irreducibility is required for this unframed prorepresentability claim.

*Proof plan:* 1. Use strictness to show uniqueness of the flag and its parameter on every Artinian lift. 2. Apply the relative deformation representability criterion, using finite Herr tangent spaces. 3. For absolutely irreducible ρ use its scalar endomorphisms and the standard Galois deformation-ring theorem.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Proposition 2.6, pp. 29–30.

*Needs:* [N/ordered-deformation](#n-ordered-deformation), `DeformationAndDerivedPatchingAlgebra:R03.2/rim-schlessinger-condition-and-prorepresentability`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-fixed-weight-de-rham"></a>

### 13.5 Fixed-weight noncritical tangent directions are de Rham

**N/fixed-weight-de-rham (theorem).** Suppose ρ is de Rham, trianguline of NT-regular δ, and wt_NT,τδ₁<⋯<wt_NT,τδ_n are integers for every τ. The kernel of H¹_tri,δ(K,adρ)→T_{δ|units}W lies in H¹_g(K,adρ)=ker(H¹(K,adρ)→H¹(K,adρ⊗B_dR)). Equivalently every first-order trianguline lift with fixed unit characters is de Rham. The inclusion is not asserted to be equality.

*Proof plan:* 1. Use fixed unit characters to fix all infinitesimal labelled character weights. 2. Apply the noncritical integral ordered-weight period extension argument over E[ε]/ε², not only over fields. 3. Identify the resulting period-trivial extension with the Bloch–Kato g-kernel.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Lemma 2.7 and its Artinian-coefficient proof, pp. 30–31.

*Needs:* [N/ordered-deformation](#n-ordered-deformation), [T/parameter-weight](#t-parameter-weight), [L/artinian-lattice](#l-artinian-lattice), `PadicHodgeTheory:P7/b-pair-herr-comparison`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-numerical-noncriticality"></a>

### 13.6 Numerically noncritical character tuples

**N/numerical-noncriticality (definition).** Let k_{τ,i}=wt_NT,τδ_i be strictly increasing integers. Call δ numerically noncritical if, for every τ and 1≤i<n, v_p((δ₁⋯δ_i)(p))<k_{τ,i+1}−k_{τ,i}, with v_p(p)=1 and p the rational prime viewed in K×. A native arithmetic adapter records these inequalities for rational prefix slopes s_i and integral weights k; it is not itself a definition of a Robba character or of its valuation.

*Proof plan:* 1. Import continuous characters and their weights and evaluations. 2. Specify the prefix-product valuations and every embedding inequality. 3. For the Lean adapter use native finite ordered indices, integer weights, rational slopes and strict monotonicity.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Definition 2.9, p. 32.

*Needs:* [N/regular-parameters](#n-regular-parameters), `PadicMeasuresIwasawaAlgebras:L0a`.

**API.**

- `NumericalNoncritical.weights` (projection): Return the strictly increasing integral labelled weights.
- `NumericalNoncritical.prefixBound` (characterisation): Impose the strict prefix-slope inequality at each adjacent pair and each embedding.
- `NumericalNoncritical.rankOne` (compatibility): At n=1 the slope inequalities are vacuous.
- `NumericalNoncritical.nativeBounds` (compatibility): The native rational-slope predicate matches this arithmetic part after substituting the actual valuations.

*Used by:* N/wd-noncriticality and symmetric-power eigenvariety consumers — Gives the explicit valuation inequalities used to force the noncritical triangulation..

**Checks.**

- `rankTwo`: For one embedding, weights (0,3) and prefix slope 2 satisfy the inequalities.
- `strictBoundary`: The same weights with prefix slope 3 fail because the inequality is strict.
- `allEmbeddings`: With gaps 3 and 1 at two embeddings, prefix slope 2 fails the condition despite passing at the first embedding.
- `rankOne`: A one-entry integral weight tuple has no prefix bound to check.
- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-wd-noncriticality"></a>

### 13.7 A Weil–Deligne valuation criterion for noncritical triangulations

**N/wd-noncriticality (theorem).** Let ρ be de Rham with distinct ascending labelled weights k and a full WD(ρ)-stable flag with rank-one graded characters χ₁,…,χ_n. For every τ require v_p(χ₁(p))<k_{τ,2}+Σ_{τ′≠τ}k_{τ′,1}; for 2≤i<n require v_p((χ₁⋯χ_i)(p))<k_{τ,i+1}+Σ_{τ′≠τ}k_{τ′,i}+Σ_{τ′}Σ_{j<i}k_{τ′,j}. Then ρ has the noncritical triangulation δ_i=(χ_i∘Art_K)∏ττ^(−k_{τ,i}). Equivalently the numerical noncriticality of this δ suffices. A WD flag and de Rhamness are hypotheses, not conclusions of numerical inequalities alone.

*Proof plan:* 1. Transport the WD flag to the potentially semistable (φ,N,G_K)-module and then to Robba modules using Berger’s filtered equivalence. 2. Induct on the flag rank: weak admissibility bounds the sum of the induced jumps by the Newton slope, and the strict inequality excludes every jump other than the smallest remaining labelled one. 3. Identify the rank-one character with the displayed reciprocity and algebraic normalization.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Lemma 2.8 and reformulation after Definition 2.9, pp. 31–32.

*Needs:* [N/numerical-noncriticality](#n-numerical-noncriticality), `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`, `PadicHodgeTheory:R06.3/weak-admissibility-robba-slope-zero`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-rank-two-triangulations"></a>

### 13.8 Three rank-two de Rham triangulation cases

**N/rank-two-triangulations (application).** For K=Q_p, a rank-two de Rham ρ with k₁<k₂ and distinct WD semisimple characters χ₁,χ₂ has: if N≠0, exactly one triangulation, noncritical, after ordering χ₁=χ₂|·|; if potentially crystalline and irreducible or reducible indecomposable, exactly two, both noncritical, with the two χ-orderings and the same k-ordering; if split ψ₁⊕ψ₂ with wtψ_i=k_i, exactly two, one with ordered k and one critical with reversed graded weights. No two-refinement assertion is made when χ₁=χ₂.

*Proof plan:* 1. Classify the WD-stable rank-one lines in the three cases. 2. Use the filtered-module/Robba equivalence to inspect saturation and induced jumps. 3. Track parameter characters explicitly as χ∘Art times x^(−k), including the reversal in the split critical case.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Example 2.10, pp. 32–33; [Colmez08](https://www.numdam.org/item/AST_2008__319__213_0.pdf), Definition 4.1 and Proposition 4.3, pp. 237–238.

*Needs:* [N/wd-noncriticality](#n-wd-noncriticality), `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `PadicHodgeTheory:R06.3/filtered-module-robba-equivalence`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-closure-tangent"></a>

### 13.9 A local tangent constraint on a regular trianguline closure

**N/closure-tangent (theorem).** Let ρ be absolutely irreducible with NT-regular δ, and work in a neighbourhood U_v of its pseudorepresentation carrying a universal representation. In U_v×T_NT,reg let V_tri be the pointwise trianguline locus and Z_v its reduced Zariski closure. V_tri is Zariski open in Z_v. At (ρ,δ)∈V_tri the projection T Z_v→H¹(K,adρ) is injective with image contained in H¹_tri,δ; its character coordinate is forced by the unique triangulation. This is not a claimed isomorphism with the whole trianguline tangent space.

*Proof plan:* 1. After normalizing an irreducible component, apply the global triangulation theorem on a dense open set. 2. Strictness identifies the saturated locus by nonvanishing and makes it Zariski open. 3. Use injectivity of completed rings into the product above the normalization to factor the completed local ring through the trianguline deformation quotient. 4. Apply N/ordered-representability to obtain the tangent inclusion in the correct direction.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Proposition 2.15 and proof, pp. 36–38.

*Needs:* [N/ordered-representability](#n-ordered-representability), `PhiGammaModulesAndIwasawaCohomology:PG.7/global-triangulation`, `LocalGaloisDeformationRings:R08.1/local-residue-field-change`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R1/rigid-local-ring-completion`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-density-repair"></a>

### 13.10 From Zariski-dense interpolation to the KPX density hypothesis

**N/density-repair (lemma).** In the setting of N/closure-tangent, a merely Zariski-dense set X_alg of trianguline points can be enlarged to a set satisfying the KPX admissible-cover density requirement. On each connected normal reduced component, choose a Zariski-open dense U′ where the relevant coherent Herr H⁰ sheaves and their t_τ quotients are locally free and the rank-one section is nonzero and saturated. Then X_alg∪U′ is dense for the required admissible cover. Normalization, connectedness and the sheaf base-change conditions are retained.

*Proof plan:* 1. Apply generic local freeness and coherent Herr base change to the rank-one interpolation sheaves and their t_τ reductions. 2. Identify the nonvanishing/saturation failure as a proper analytic closed subset. 3. Use normal connectedness and the identity principle on every member of an admissible affinoid cover. 4. Apply the global triangulation theorem to the enlarged set without assuming the two density notions coincide.

*Source:* [NT21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf), Remark 2.16, p. 38.

*Needs:* [N/strict-uniqueness](#n-strict-uniqueness), `PhiGammaModulesAndIwasawaCohomology:PG.7/global-triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`, `AdicSpacesPartII:R1/rigid-identity-principle`, `AdicSpacesPartII:R1`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-rank-two-nontrianguline"></a>

### 13.11 A nontrianguline rank-two module has no (φ,Γ)-stable finite-dimensional subspace

**N/rank-two-nontrianguline (theorem).** For K=Q_p and an absolutely irreducible two-dimensional E-representation V that is not trianguline, even after any finite extension of E, D_rig(V) contains no nonzero finite-dimensional E-subspace stable under both φ and Γ, and this persists after any finite extension of E. A φ-eigenvector alone is not claimed to span a Γ-stable line.

*Additional hypotheses:* Colmez’s saturation lemma for a rank-one (φ,Γ)-submodule is requested from PG.7 (R6); nontriangulinity is meant after every finite extension of coefficients, as in Colmez’s definition.

*Proof plan:* 1. Let X be a nonzero finite-dimensional subspace stable under φ and Γ. The operators φ and γ∈Γ commute with each other, so after a finite extension of E they have a common eigenvector x≠0 in X. 2. The Robba-span of x is a rank-one (φ,Γ)-submodule of D_rig(V); by Colmez’s saturation lemma (R6) it lies in a saturated rank-one (φ,Γ)-submodule, whose quotient has rank one. 3. This is a triangulation of D_rig(V) after a finite extension of E, contradicting nontriangulinity.

*Source:* [DLB17](https://arxiv.org/pdf/1509.00606v2), Proof of Lemma 6.3, arXiv p. 31 (published version p. 356), completed as in E18; [Colmez08](https://www.numdam.org/item/AST_2008__319__213_0.pdf), Lemma 3.2 and Definition 3.4, p. 231; Definition 4.1, p. 237.

*Needs:* `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-classification`, `PhiGammaModulesAndIwasawaCohomology:PG.7`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.


<a id="n-polynomial-connection-kernel"></a>

### 13.12 The nontrianguline polynomial-connection kernel argument

**N/polynomial-connection-kernel (application).** Under N/rank-two-nontrianguline, suppose the differential-equation supplier gives finite-dimensionality of ker P(∇)⊂D_rig(V) for every nonzero P∈E[X]. Then P(∇) is injective: ∇ commutes with φ and with Γ, so its kernel is a finite-dimensional subspace stable under φ and Γ, which vanishes by the preceding theorem. The finiteness theorem and the connection itself remain owned by the differential-equation and period suppliers.

*Proof plan:* 1. φ∇=∇φ, and γ∇=∇γ for γ∈Γ because Γ is commutative, so ker P(∇) is stable under φ and Γ. 2. By the finiteness input (R9) the kernel is finite-dimensional over E. 3. Apply N/rank-two-nontrianguline: no nonzero such subspace exists, so P(∇) is injective.

*Source:* [DLB17](https://arxiv.org/pdf/1509.00606v2), Lemma 6.3 and its proof, arXiv p. 31 (published version p. 356).

*Needs:* [N/rank-two-nontrianguline](#n-rank-two-nontrianguline), `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicDifferentialEquationsAndRigidCohomology:RD.1`.
**Checks.**

- Acceptance: Establish the stated result with the specified coefficient category, all functorial maps and no additional genericity or étaleness hypothesis.
- Acceptance: Verify the source locator and the direct prerequisite contracts before implementing this target.

### Examples

With one embedding and weights (0,3), prefix slope 2 passes the numerical criterion and slope 3 fails. With a second embedding of gap 1, slope 2 fails the all-embedding test. A fixed-unit-weight unramified infinitesimal twist is allowed and is de Rham. A nonzero finite-dimensional subspace stable under φ and Γ, such as a nonzero kernel of P(∇), contradicts nontriangulinity through Colmez’s saturation lemma; a bare φ-eigenvector is not enough.

### Dependencies

`AdicSpacesPartII:R1`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `LocalGaloisDeformationRings:R08.1`, `PadicDifferentialEquationsAndRigidCohomology:RD.1`, `PadicHodgeTheory:P7`, `PadicHodgeTheory:R06.3`, `PadicMeasuresIwasawaAlgebras:L0a`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, [L](#l), [T](#t).

**Planning status: planned.** Discharge R2, R6–R9; the polynomial-connection injectivity target is conditional on the finite-kernel supplier, and the closure tangent is only an inclusion.

**Atlas planets:** Ordered-regular trianguline parameters; Fixed-weight trianguline tangent lemma; Numerical noncriticality; Weil–Deligne noncriticality criterion; Local trianguline closure tangent constraint; Nontrianguline (φ,Γ)-eigenline vanishing.

## Source corrections and proof safeguards

These findings are scoped to the exact versions in the references and packet hashes. The independent review confirmed E1–E16 at their locators (reclassifying E7 as a misprint) and added E17–E20; none is an author-confirmed erratum. The inherited findings were rechecked at their printed locators. Title/erratum and author/publisher searches on 19 October 2026 did not identify an author-issued correction. The new E16 finding identifies a proof inference and leaves its repair in the explicit G2 supplier contract; it does not allege the uniqueness result is false.

**E1 (BHS19, error).** Theorem 1.9, p. 305; Conjecture 4.3.4 and Remark 4.3.5, p. 381; (4.11)–(4.12), p. 382; Theorem 4.3.8 proof, pp. 384–385. The codimension assigned to the full-character cycles is dn(n+3)/2; the corresponding dimension is n²+dn(n−3)/2. Use codimension dn(n+1)/2+n and dimension n²−n+dn(n−1)/2. The fixed-weight codimension dn(n+1)/2 is unchanged. The smooth character space has dimension n(d+1), whereas unit weights have dimension nd. Fixing the unramified character coordinates removes n dimensions, not dn. For n=1,d=2 the ambient ring has dimension 3 and the full-character fibre is a point; the printed formula instead gives dimension −1. Affects: a stated result.

**E2 (Ding25, misprint).** Proof of Corollary 2.14, p. 19. The middle quotient-dimension expression has d dim(B∩L_P)−n. It is d dim(B∩L_P)+n. Subtract 1−n+dn(n−1)/2 from 1+d dim P. The result agrees with the sum of the block quotient dimensions only with +n; the claimed isomorphism is unaffected. Affects: the proof.

**E3 (Ding25, misprint).** Theorem 2.32(2), p. 28; Theorem 2.37, p. 31. The twist ring omits the local-field subscript, and the partial theorem reverses the endpoint indices in its hypothesis. Use R_{K,E[ε]/ε²} for the twist and D̃₁,σ for the endpoint. The twist must be over the same Robba ring as the module; the endpoint in the conclusion and the previously defined D₁,σ fix the intended index order. Affects: nothing.

**E4 (Ding25, misprint).** Proof of Corollary 2.33, p. 29. The dimension subtraction does not bracket the complete intersection dimension. Compute 2(1+(n²−n+1)d)−(1+(n²−2n+2)d)=1+n²d. The sum/intersection dimension identity subtracts both the constant and the d-term. The corrected result equals the self-Ext dimension and proves spanning. Affects: the proof.

**E5 (Ding25, misprint).** Definition of L_σ, p. 31; Corollary 2.38, p. 32. The third argument is written D₂,σ in the definition, and the corollary drops the partial-condition subscript. Use L_σ(D_σ,D₁,σ,C₁,σ), with the σ-partial condition in both assertions. The second extension map is a pushout to C₁,σ; no D₂,σ was defined. The ambient space and subsequent comparison use the C₁,σ endpoint and partial Ext throughout. Affects: nothing.

**E6 (NT21, misprint).** Proof of Lemma 2.4, printed p. 29. The strictness test runs through i=n while referring to δ_{i+1}. The test is for 0≤i≤n−1. There are n graded characters. At i=n the quotient is zero and δ_{n+1} is undefined; the stated one-dimensional H⁰ test is the strictness test for the n actual graded steps. Affects: the proof.

**E7 (BHS19, misprint).** Definition of T₀ⁿ in §3.4, before Theorem 3.4.4, printed p. 352. The complement description uses simultaneous algebraicity of a ratio and its cyclotomic multiple. A tuple is excluded if either exceptional ratio family is algebraic for some ordered pair i≠j. Equivalently require δ_i/δ_j∈T₀ for every ordered pair. The cyclotomic character ε=N|N| is not algebraic. A ratio and its ε-multiple cannot both be algebraic, so the printed simultaneous condition would exclude nothing, contrary to the preceding rank-one definition. Affects: nothing.

**E8 (BHS19, misprint).** Formula (3.6), p. 336; Lemma 3.2.2 setup, p. 337; regular-lattice completion point and reference, pp. 340–341. The filtration formula uses D_dR in place of D_pdR; the coefficient filtration wording imposes excessive freeness/rank, and the displayed completion point suppresses transport by the frame. Use D_pdR, ν-stable filtrations with finite projective A⊗K graded pieces, and the point (α⁻¹HodgeFlag,N). Each τ-graded piece is A-free of its own rank; zero and nonparallel pieces are allowed. The comparison is Theorem 3.2.5. The nonzero nilpotent period operator lives on D_pdR. Since A⊗K is a product over embeddings, a nonparallel rank-one object has a graded summand supported at only one factor; that summand is projective but need not have constant rank on the product. All other displayed frame comparisons require α⁻¹. Affects: nothing.

**E9 (BHS19, misprint).** Formula (3.16), printed p. 348. The placement of the tuple index obscures the subtraction in the character-weight map. The tuple is (wt(δ_{A,i})−wt(δ_i))_{1≤i≤n}. Both terms belong to A⊗K for each fixed i, and the resulting n-tuple must be based at zero to match the nilpotent Cartan coordinates. Affects: nothing.

**E10 (Ding25, misprint).** First display in the proof of Lemma 2.11, printed p. 16. The last graded deformation repeats the top Hodge weight. The last graded character has algebraic part z^{h_n}. The fixed triangulation has decreasing ordered graded weights h₁,…,h_n. Its last piece cannot carry h₁ when the weights are distinct. Affects: nothing.

**E11 (Ding25, misprint).** Definition of P-filtration and its deformation in §2.3.1, printed p. 18. The notation makes M_i a rank integer and calls the lifted filtration a filtration by submodules of the residual D. Set M_i=gr_i F_P and require rank M_i=n_i; the lift is filtered by submodules of D̃ over E[ε]/ε². The next construction takes Ext¹(M_i,M_i), which requires a module. The lifted graded modules and ranks are those of D̃, with the residual filtration supplied by reduction. Affects: nothing.

**E12 (Ding25, misprint).** Proof of Lemma 2.16, printed p. 20. The endomorphism-weight differences are indexed by the number r of parabolic blocks. Use i,j=1,…,n. End(D) has rank n², so all n² labelled weight differences occur; no parabolic block decomposition is fixed in this lemma. Affects: nothing.

**E13 (BHS19, misprint).** Proof of Theorem 2.4.7, printed p. 323 (imported Springer input). The KL vanishing sentence drops the w₀ prefixes while retaining the reversed support order. Use P_{w₀w,w₀v}(1)=0 unless v≤w. The support condition P_{a,b}≠0 requires a≤b. Left multiplication by w₀ reverses the Bruhat order. The accepted Springer KL-transition node uses this corrected convention. Affects: nothing.

**E14 (BHS19, error).** Lemma 2.3.2, printed p. 315 (imported flatness input). Global dimensions of equidimensional fibres over a regular base are used to claim flatness for an arbitrary Cohen–Macaulay source. Use the pointwise equality dim O_{Y,y}=dim O_{Z,f(y)}+dim O_{f⁻¹(f(y)),y}. The incidence applications satisfy it; import the corrected Springer flatness theorem. Take Y=Spec k disjoint union A¹_k over Z=A¹_k, with the isolated point mapping to zero and the other component by the identity. All fibres have dimension zero and Y is Cohen–Macaulay of global dimension one, yet the isolated point is not flat over k[t]_(t). The pointwise equality prevents this example. Affects: a stated result.

**E15 (BHS19, misprint).** Proof of Proposition 3.5.10, p. 361; proof of Lemma 3.7.4, p. 369; character notation in §4.2, p. 375; Corollary 4.3.2, p. 380. Several local displays suppress the deformed flag or tuple grouping, and the multivariable algebraic character retains a free coordinate index. The framed lift carries F_{A,•}; group the τ-weight tuple componentwise; define the i-th algebraic character as z_i↦∏ττ(z_i)^{h_{τ,i}}. In Corollary 4.3.2 explicitly choose w with wtδ=w(h). The completion comparison is over the deformed flag, and z^h is an n-variable character. These type and quantifier corrections are forced by the adjoining diagrams; they do not alter the local theorems. Affects: nothing.

**E16 (BHS19, gap).** Beginning of the proof of Proposition 4.3.6, printed p. 382; cycle group convention, p. 377. For a parameter point absent from X_tri, the proof infers vanishing of every constituent cycle from vanishing of their multiplicity-weighted sum. Provide a unitriangular vanishing argument for all those constituent families, or assume effectivity for this inference. Y/conditional-uniqueness uses the first approach as an explicit pending G2 supplier contract; it does not silently add effectivity to Conjecture 4.3.4. The cycles lie in a free abelian group and are not required to be effective in the printed conjecture. A zero sum of signed cycles does not imply termwise vanishing: C+(−C)=0. The subsequent finite-linkage induction treats locally algebraic generic inducing data; extending the vanishing argument to the other constituent families needs its own input. This finding concerns that proof step, not a counterexample to the uniqueness theorem. Affects: the proof.

**E17 (BHSsmooth17, error).** Lemma 2.10, author PDF p. 15 (Lemma 3.12 in arXiv:1510.01222v1). The lemma assumes only that ω(x)=δ_k is algebraic and that k_{τ,i}−k_{τ,i+1} exceeds [K:K₀] times the valuation of (δ₁⋯δ_i)(ϖ_K) for every τ and i, and concludes that x is saturated. The proof later uses that k is strictly dominant. Add the hypothesis that k is dominant, k_{τ,1}≥⋯≥k_{τ,n} for every τ. Then the induction goes through, and saturation together with the slope bound makes k strictly dominant. Every application (BHSsmooth17 Proposition 2.12, BHS19 Proposition 4.1.4) uses strictly dominant weights with large gaps, so they are unaffected. Counterexample for [K:Q_p]=2, K unramified, n=2: take r crystalline, generic, noncritical for the refinement (φ₁,φ₂), with Hodge–Tate weights {0,2} at both embeddings and v_p(φ₁)=−3, v_p(φ₂)=−1 (weakly admissible: the noncritical slope conditions −3+4≥0, −1+4≥0 and −4+4=0 hold). By BHS19 Theorem 4.2.3 with w_x=1 the anti-dominant companion x=(r,z^{(0,0),(2,2)}unr(φ)) lies on X_tri. At x, v_p(δ₁(p))=−3 and k_{τ,1}−k_{τ,2}=−2>−3 at both embeddings, so the hypothesis holds, but x is not saturated: the only saturated rank-one submodule with Frobenius label φ₁ has parameter z^{(2,2)}unr(φ₁). In the proof, the step from the gap inequality at one τ to the inequality for Σ_τ(k_{τ,i}−k_{τ,w⁻¹(i)}) fails when the other summands are negative. Affects: a stated result.

**E18 (DLB17, gap).** Proof of Lemma 6.3, arXiv:1509.00606v2 p. 31; the same text in the published version, Ann. of Math. 186 (2017), p. 356. The proof passes from the nonzero finite-dimensional φ-stable kernel X of P(∇) to the existence of φ-eigenvectors on D_rig(V) and declares that this contradicts Colmez’s Lemma 3.2. Note that X is also Γ-stable (∇ commutes with Γ) and choose, after a finite extension of L, a common eigenvector of φ and Γ in X. It spans a rank-one (φ,Γ)-submodule, whose saturation (Colmez Lemma 3.2) gives a triangulation, contradicting nontriangulinity. A φ-eigenvector alone need not span a Γ-stable line, so it does not give a rank-one (φ,Γ)-submodule; Colmez’s Lemma 3.2 concerns rank-one (φ,Γ)-submodules. The missing step is short, and the lemma is true. Affects: nothing.

**E19 (BHSsmooth17, misprint).** Proof of Lemma 2.10, author PDF p. 15. The slope inequality is written with the absolute value of δ′₁(ϖ_K)⋯δ′_i(ϖ_K) at least 1, and the induction step compares with indices j∈{i,…,n}. The absolute value is at most 1 (valuation at least 0), which is the direction used in (2.13); the comparison is with j∈{i+1,…,n}. Rank-one submodules of an étale (φ,Γ)-module have nonnegative slope, which is what (2.13) uses; for j=i the stated strict inequality would read val<0 and is not what the argument needs. Affects: nothing.

**E20 (Ding25, misprint).** Paragraph after Lemma 2.6 and (2.7), printed p. 14. The text asserts D_{1,σ}=T_σ(D₁) with T_σ defined as in (2.7), that is, replacing the weights off σ by the module’s own lowest weight. For D₁ the weights off σ must be replaced by the ambient lowest weight h_{τ,n}, not by D₁’s own lowest weight h_{τ,n−1}; the Hodge–Tate–Sen weights of D_{1,σ} stated in the preceding sentence are the correct ones. For C₁ the two cutoffs agree. D_{1,σ} is the saturated submodule of D_σ, whose weights off σ are all h_{τ,n}; applying (2.7) to D₁ itself would give weights h_{τ,n−1} off σ. Affects: nothing.

## Downstream consumers

**PadicFamilies:L2a and L3.** Pull back the injective local trianguline tangent and the inclusion of its fixed-weight kernel in H¹_g; no equality or absolute irreducibility-free ring claim is supplied. Inputs: [N/ordered-representability](#n-ordered-representability), [N/fixed-weight-de-rham](#n-fixed-weight-de-rham), [N/wd-noncriticality](#n-wd-noncriticality), [N/closure-tangent](#n-closure-tangent).

**CompletedCohomology:R31.6 and the proposed completed-cohomology local-model extension.** Use these as local inputs. Patched eigenvarieties, global companion constituents and global socle theorems remain consumers, not prerequisites. Inputs: [V/local-identification](#v-local-identification), [V/normal-cm](#v-normal-cm), [G/companion-criterion](#g-companion-criterion), [Y/crystalline-multiplicity](#y-crystalline-multiplicity).

**PotentialAutomorphyTheoremsPartII:PL8.** Supply the NT local noncritical and tangent ingredients; automorphy and symmetric-power lifting are not local targets here. Inputs: [N/fixed-weight-de-rham](#n-fixed-weight-de-rham), [N/wd-noncriticality](#n-wd-noncriticality).

**Locally analytic crystabelline representation constructions.** Recover the full module only for K=Q_p from the original relation; recover a single σ-Hodge filtration for arbitrary K from the modified or partial relation. Inputs: [H/projective-iota](#h-projective-iota), [H/sigma-recovery](#h-sigma-recovery), [I/hodge-recovery-exact](#i-hodge-recovery-exact), [I/sigma-recovery-exact](#i-sigma-recovery-exact), [I/partial-comparison](#i-partial-comparison).

**PadicHodgeParametersInLocallyAnalyticRepresentations (input contracts TR1–TR5).** TR1 is H/crystabelline-parameters with H/canonical-subquotients; TR2 is D/refinement-tangents, D/tangent-dimensions, D/common-kernel, D/de-rham-up-to-twist and I/refinement-generation; TR3 is D/paraboline-tangents, D/paraboline-dimensions and D/parabolic-up-to-twist; TR4 is P/partial-dimensions, P/modifying-first-order, P/modification-kernel, P/quotient-comparison and I/partial-refinement-generation, with D_σ itself from PadicHodgeTheory:P7/embedding-selective-crystalline-modification; TR5 is I/sigma-relation and I/sigma-recovery-exact. These targets assume n≥2; the n=1 case of TR5 is the rank-one statement P/partial-local-condition, and the consumer should point its G-TR gap at these node ids. Inputs: [H/crystabelline-parameters](#h-crystabelline-parameters), [H/canonical-subquotients](#h-canonical-subquotients), [D/refinement-tangents](#d-refinement-tangents), [D/tangent-dimensions](#d-tangent-dimensions), [D/common-kernel](#d-common-kernel), [D/de-rham-up-to-twist](#d-de-rham-up-to-twist), [D/paraboline-tangents](#d-paraboline-tangents), [D/paraboline-dimensions](#d-paraboline-dimensions), [D/parabolic-up-to-twist](#d-parabolic-up-to-twist), [I/refinement-generation](#i-refinement-generation), [P/partial-dimensions](#p-partial-dimensions), [P/modifying-first-order](#p-modifying-first-order), [P/modification-kernel](#p-modification-kernel), [P/quotient-comparison](#p-quotient-comparison), [I/partial-refinement-generation](#i-partial-refinement-generation), [I/sigma-relation](#i-sigma-relation), [I/sigma-recovery-exact](#i-sigma-recovery-exact).

## Completion and acceptance

The packet has 101 target nodes: 20 definitions, 12 constructions, 56 theorems, 6 lemmas, 5 comparisons and 2 applications. Its 32 definitions/constructions carry 123 API items and 100 discriminating tests in total; every such node has at least three tests and recorded uses. The 64 planets respect the limit of six per layer. Seven pinned baseline declarations are cited directly. All thirteen layers are planned; none is marked closed while the nine supplier requests and G1/G2 remain open. Follow-up work must assign and accept those contracts, then implement the stated targets. No result in this plan is claimed formalized.

Acceptance includes the acyclic own-target graph, resolution of all external prerequisites, complete coverage of the 138 routed items, matching packet/reader statements and API/tests, and elaboration of the compact native Lean interfaces. The full arithmetic targets must eventually use the genuine supplier carriers; compiling the representative file does not discharge them. The general multiplicity conjecture remains a conjecture after those implementation tasks.

## References

**BHS19.** Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [A local model for the trianguline variety and applications](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf). Publications Mathématiques de l’IHÉS 130 (2019), 299–412. Read 19 October 2026: §§3.1–4.3, printed pp. 330–385, including proofs; introductory local examples, pp. 300–305; imported §2 statements checked against the accepted Springer packet. SHA-256: `34ffd69795468054b4caab7847d5ae90393826c889b187397dbe53e16993967a`.

**Ding25.** Yiwen Ding, [p-Adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf). Publications Mathématiques de l’IHÉS 142 (2025), 1–74. Read 19 October 2026: §§2.1–2.4, printed pp. 9–32, including proofs; introduction pp. 1–9. SHA-256: `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`.

**NT21.** James Newton and Jack A. Thorne, [Symmetric power functoriality for holomorphic modular forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00127-3.pdf). Publications Mathématiques de l’IHÉS 134 (2021), 1–116. Read 19 October 2026: §2.3.1, pp. 28–33; Proposition 2.15 and Remark 2.16, pp. 36–38, including proofs. SHA-256: `ef76912a84fdf3d0630fe3aaa83548110f9aca9fc50a421401ba5462512dce37`.

**Colmez08.** Pierre Colmez, [Représentations triangulines de dimension 2](https://www.numdam.org/item/AST_2008__319__213_0.pdf). Astérisque 319 (2008), 213–258. Read 19 October 2026: Lemma 3.2 and Definition 3.4, p. 231; Definition 4.1 and Proposition 4.3, pp. 237–238, including proofs. SHA-256: `eab0e8f383307b5d63960ea24cf4d86fb9aab215ae2e8155d7bf57efdf105ed6`.

**DLB17.** Gabriel Dospinescu and Arthur-César Le Bras, [Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://arxiv.org/pdf/1509.00606v2). arXiv:1509.00606v2 (28 April 2017); published Annals of Mathematics 186 (2017), 321–411. Read 19 October 2026: §6, Lemma 6.3 and its proof, arXiv p. 31; Theorem 8.3 and its use of Lemma 6.3. SHA-256: `bdf8f14fb4bfb4fe43980fdbff088b33469a16a9c0260616a0630de48de8cd68`.

**BHS17.** Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [Une interprétation modulaire de la variété trianguline](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/eigenvariete.pdf). Author final copy; Mathematische Annalen 367 (2017), 1587–1645. Read 19 October 2026: §2.2, author PDF pp. 7–8; Theorem 2.6 and its complete proof, author PDF pp. 8–12. SHA-256: `e382a23bbf0cc63b386549a05337a5502c1b8e6430c95d23619fb58054688cf0`.

**BHSsmooth17.** Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [Smoothness and classicality on eigenvarieties](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/classicite.pdf). Author final copy; Inventiones Mathematicae 209 (2017), 197–274. Read 19 October 2026: Lemma 2.4, author PDF pp. 10–12; Lemma 2.10 and proof, pp. 15–16; local density part of Proposition 2.12, pp. 16–17. SHA-256: `26651229c1f8aedf1011c275e9f8160a4669166f5e277d638815257a8ae5fea1`.

**Ding19.** Yiwen Ding, [Companion points and locally analytic socle for GL₂(L)](https://arxiv.org/pdf/1602.08859v2). arXiv:1602.08859v2 (21 February 2019); published Israel Journal of Mathematics 231 (2019), 47–122. Read 19 October 2026: Appendix A, author preprint pp. 44–47, including proofs of Propositions A.3, A.5 and Corollary A.4. SHA-256: `168be9c2ff7980d285a81dc940da6c0ecb79c8fe136f90786a5a90a7bbb9e4c7`.
