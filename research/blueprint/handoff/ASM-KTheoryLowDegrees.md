# ASM-KTheoryLowDegrees — assembly handoff

Issue: #243. Worker: Codex — codex-zq0Z8d. Date: 2026-10-06.

## Result and review boundary

The assembly job is complete. The [full reader](../readmes/KTheoryLowDegrees.md) gives one purpose, scope, neighbouring-roadmap boundaries, conventions, source catalogues and layer overview, followed by all 594 contracts in the parts’ order. It preserves 957 API entries, 576 unit-test contracts, 62 planets, all twelve gap groups, twenty-three open supplier requests, forty-two source corrections and the 817 distinct pinned library references. All declarations remain `unchecked`. No layer is declared closed. The [combined suggested file](../suggested/KTheoryLowDegrees.lean) has one standard note, one block of 174 unique imports and consistent shared K₀ names.

This is an assembly of reviewed inputs, not acceptance of them. Both packets retain `review.status = needs_changes`. The latest reviews are [U.1 round 2](../reviews/REV-KTheoryLowDegrees--U.1~2.md) and [Z.3 round 2](../reviews/REV-KTheoryLowDegrees--Z.3~2.md). The full reader incorporates their packet corrections, including the nonidentity transvection condition, arbitrary-ring matrix maps, finite-basis hypotheses, stable zero-rank padding, the relative-first-row source locator, the corrected curve/divisor signs and references, the projective-line direct γ calculation, and E13/E14’s known author errata with plus Witt normalization and positive exponential. The two part readers are read-only inputs to this job and remain unchanged; their stale passages still need owner-authorized synchronization before those parts are published separately.

The U.1 review leaves four unverifiable routes: `U.3/SK1-real-circle-nonzero`, `U.4/power-reduction-non-totally-imaginary`, `U.4/power-reduction-totally-imaginary`, and `U.6/relative-K1-homotopy-comparison`. Their source and supplier gaps remain explicit in the full reader. Z.3’s special-λ representation route, general Picard pullback/duality and coherent spectra/v-descent also retain their conditional supplier interfaces. Assembly does not certify these proofs or change any review verdict. The orchestrator should retain the independent revision/review work required by those verdicts.

## Cross-part reconciliation

Only `KTheoryLowDegrees--Z.3.json` changes. In `Z.3/local-det-equivalence`, the whole-stage `Z.2` prerequisite is replaced by `Z.2/local-projective-free`, `Z.2/local-ring-k0` and `Z.2/rank-connected`. The whole-stage `U.3` prerequisite is replaced by `U.3/SK1-local`, `U.6/pi1-plus-construction` and `U.6/pi1-plus-determinant`. These are the named local rank, units and loop/determinant comparisons used by the existing proof plan. The now-supplied internal U.3 request is removed. Its consumer contract and the outstanding enhanced-spectrum request are retained. The combined graph has 1977 internal edges, including 102 Z.3-part imports from the U.1 part and one reverse import (`U.5/K0-action-on-K1` imports `Z.3/finite-projective-monoidal`); it is acyclic. The local determinant’s 171-node transitive supplier closure is also acyclic. There are no unresolved internal node references.

No reviewed statement, hypothesis, proof step, acceptance condition, API, test, source correction or coverage status is changed. Dependency refinement should be checked in the independent assembly review: the U.6 comparison nodes are now explicit prerequisites, so the local determinant cannot be read as already supplied merely by a classical units computation.

The standalone Lean files repeated fourteen command names in `TauCeti.RingK0`. The combined file uses the arbitrary-ring Z.1 definitions of `FP`, `K0`, `cls`, `lift`, `rank`, `rankSection`, `map`, `rankℤ`, `transfer` and `divisionRingEquiv` and their retained lemmas. Z.3 calls infer the source ring in `map f`. A native `map_cls` comparison with commutative tensor extension and `transferAlgebra R S` abbreviation specialize the existing maps; neither introduces another K₀ carrier or a replacement axiom. The standalone rank-on-unit lemma is named `rank_one_ring`, alongside the retained object-class lemma `rank_one`. All standalone command names remain available, all named test and supplier-omission receipts survive, and unnamed noncomputable sections are closed between parts. The common note distinguishes actual carriers, proof/data sorries and enhanced statements omitted for lack of suppliers. These shared signature choices require elaboration when the pinned build is available.

## Validation and compilation limit

Both part packets pass `python3 scripts/check_blueprint.py` with zero errors and zero warnings. A full reader-agreement check verified all statements, hypotheses, proof steps, acceptance conditions, APIs, tests, uses and source contracts against the packets, plus coverage/remaining inputs, gaps, requests, corrections and baseline descriptions. Reader anchors and local links resolve. Static Lean checks find 1530 distinct named commands, no repeated qualified command names, balanced scopes and 174 unique imports. They establish assembly preservation, not Lean typechecking. `git diff --check` passes and only issue-authorized deliverables change.

Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is pinned to `f790474821cf4256814db967cb154e7af3d0c369`. `free -g` showed 98 GB available before `lean-check research/blueprint/suggested/KTheoryLowDegrees.lean`. The wrapper stopped at the missing prebuilt `TauCeti.CategoryTheory.Exact.Functor.olean` import, before declarations. The available shared build has the Mathlib pin but Tau Ceti commit `cf386627e9176a3827c1a5fe804989fd94a4d216`, so there is no complete pinned build here. The final assembly was not elaborated; no API lemma or test is claimed executed. No build, update, cache download or language server was started. Resume elaboration with `lean-check` only after a complete pinned shared build exists.

## Maintainer actions and proposal disposition

The inventories below preserve all 29 part `restructure` proposals verbatim. They are proposals, not applied atlas changes. Some describe interfaces now supplied inside the joined roadmap: Z.2 rank and finite-product contracts, Z.3’s ring refinement and Z.1 Milnor patching. Those references should import the listed node IDs; they do not constitute unresolved duplicate suppliers. The remaining twenty-three external requests are collected verbatim with their consuming nodes.

The principal atlas decisions still needed are removal of inherited `S.6→Z.5` and `S.7→Z.6` edges; the early `Z.5:vector-bundles` / later `Z.5:curves` split to avoid the S.2 cycle; explicit Z.1 ownership for K.2/K.7 and U.1 ownership for elementary groups consumed by T.1; early plus/relative-fibre ownership before the late low-degree comparison; and the general-degree local-symbol/reciprocity extension within ClassFieldTheory’s Part II direction. Do not edit Tau Ceti’s existing roadmaps as part of applying these proposals. The ReductiveGroups Part II representation interfaces and the enhanced foundations/spectra determinant interfaces remain proposed scopes. No data/content file or upstream roadmap was edited in this job.

The retained upstream note concerns the doubled-line/doubled-plane distinction: the doubled line has vector-bundle K₀ = G₀ = ℤ²; the doubled plane has vector-bundle K₀ = ℤ but G₀ = ℤ². The GeneralAlgebraicKTheory K.3 owner must correct its acceptance example; this assembly cannot edit it. Source-version boundaries remain as recorded by the Z.3 part.

## Restructure inventory — U.1

### U.1 proposal 1: Z.1 owns ring-level scalar extension, complements and degree-zero Morita invariance

**kind.** ownership

**detail.** RS-18 (accepted) records “Explicit ring K0 scalar extension, complements/cofinality and general-ring degree-zero Morita specialization” with owner KTheoryLowDegrees:Z.1, formerly also GeneralAlgebraicKTheory:K.2:plus and K.7, and adds the links Z.1 → K.2:plus and Z.1 → K.7. This part plans them in Z.1 (Z.1/free-summand-data, Z.1/extend-scalars, Z.1/extend-scalars-finite-projective, Z.1/ring-k0-map, Z.1/equivalence-preserves-finite-projective, Z.1/ring-k0-morita, Z.1/ring-k0-matrix). K.2:plus (“scalar extension along every unital ring homomorphism preserves these objects”, “every finitely generated projective has a projective complement making it free”) and K.7 (Morita invariance of all K-groups) should import these nodes and not re-plan them. The atlas does not yet carry RS-18’s edge Z.1 → K.7, so the stage-cycle helper would allow Z.1 to cite K.7; Z.1 does not, following RS-18’s direction.

### U.1 proposal 2: Extension of scalars along noncommutative ring homomorphisms is planned in Z.1

**kind.** ownership

**detail.** Mathlib’s ModuleCat.extendScalars and extendRestrictScalarsAdj require commutative rings, and no roadmap in the atlas plans a noncommutative extension of scalars (the DGAInfinity layer 1 extension of scalars is for DG modules, and FoundationsAndLibraryIntegration LI.1 is commutative). Z.1 is the most foundational layer that needs it (for P ↦ S ⊗_R P on K₀; consumers ClassicalArithmeticCompletion CA.7 for orders ℤ[G] → 𝓞_K[G], GeneralAlgebraicKTheory K.2:plus, and the noncommutative local rings of Z.2), so Z.1/extend-scalars constructs it as the left adjoint of ModuleCat.restrictScalars with a comparison to Mathlib’s commutative functor. If a module-theory roadmap adopts the construction, the node moves there unchanged.

### U.1 proposal 3: Resolution of the companion packet’s references to KTheoryLowDegrees:Z.2

**kind.** interface

**detail.** KTheoryLowDegrees--Z.3 cites the stage KTheoryLowDegrees:Z.2 and requests “the existing finite-projective carrier with finite clopen rank fibres, their orthogonal-idempotent product decomposition, local freeness and the virtual ring homomorphism rank:K₀(R)→LocallyConstant(Spec R,ℤ), natural under scalar extension and normalized on every object class … For a Dedekind domain, provide the integer-valued specialization normalized by fraction-field dimension.” These resolve to: the carrier Z.1/ring-k0 (the same SplitK0 of finiteProjectiveModules, reducible, so the SplitK0 ring structure applies); clopen rank fibres and orthogonal idempotents Z.2/rank-fibre-decomposition (with clopen modules in Z.2/componentwise-free); local freeness Z.2/local-freeness; the rank Z.2/rank-hom, normalised by rank [P] = rankAtStalk P, with its naturality Z.2/rank-base-change; the “rank-one normalisation” of invertible modules is the API item RingK0.rank_of_invertible of Z.2/rank-hom; the integer specialisation normalised by fraction-field dimension is Z.2/rank-connected with Z.2/rank-domain. Names follow the companion’s namespace TauCeti.RingK0 and module TauCeti/Algebra/KTheory/RingK0/…

### U.1 proposal 4: The rank is a ring homomorphism only once Z.3 has the ring structure

**kind.** ownership

**detail.** The companion packet’s Z.3/augmentation calls the Z.2 rank a “virtual rank ring homomorphism”. The commutative ring structure on K₀ is constructed in Z.3 (Z.3/finite-projective-monoidal), downstream of Z.2, so Z.2 cannot state multiplicativity on K₀. Z.2 supplies the additive map (Z.2/rank-hom) and the object-level input rankAtStalk (P ⊗ Q) = rankAtStalk P · rankAtStalk Q (API item RingK0.rankAtStalk_tensor, Mathlib’s rankAtStalk_tensorProduct). Proposal: add to Z.3 a lemma “rank is a ring homomorphism” with prerequisites Z.3/finite-projective-monoidal, Z.2/rank-hom, TauCeti.SplitK0.ringHom_ext and Mathlib’s rankAtStalk_tensorProduct, and let Z.3/augmentation cite it.

### U.1 proposal 5: Finite-product formula and the finite-field case

**kind.** ownership

**detail.** The reviewed audit lists GeneralAlgebraicKTheory K.7 as duplicating the degree-zero product formula; RS-18 keeps “disconnected and finite-product comparison” in Z.2 and links Z.2 → K.7, so the degree-zero formula is planned here (Z.2/k0-pi) and K.7 compares its higher statement with it. The audit also lists KTheoryFiniteLocalFields L.1 (K₀(𝔽_q) = ℤ) as a duplicate: L.1 imports Z.2, and the finite-field case is Z.2/division-ring-k0; L.1 should cite it rather than restate it.

### U.1 proposal 6: E(A), elementary matrices over any ring and their commutator identities are U.1's; K2SymbolsBrauer T.1 should import them

**kind.** ownership

**detail.** The atlas edge U.1 → K2SymbolsBrauer:T.1:classical makes U.1 the supplier. The accepted packet K2SymbolsBrauer--T.1 re-plans part of U.1: T.1/stabilisation says 'Construct the stable elementary group as the colimit of the finite-rank elementary groups', T.1/elementary-matrices-satisfy says 'the noncommutative case is proved here', T.1/k2-is-centre uses 'the centre of E(R) is trivial' without a prerequisite, and T.1/k2-definition imports 'E(R) is the commutator subgroup of GL(R) and K_1(R) is the quotient' from GeneralAlgebraicKTheory:K.2. The owners are KTheoryLowDegrees:U.1/stable-elementary-subgroup, U.1/elementary-commutator-chain, U.1/elementary-commute, U.1/elementary-commutator-reverse, U.1/stable-elementary-centre, U.1/whitehead-lemma and U.2/K1; T.1's nodes should cite them. GL(A) here is a Mathlib DirectLimit, as T.1's St(A) is, so φ : St(A) → E(A) ≤ GL(A) is a DirectLimit.map.

### U.1 proposal 7: Left or right modules for K₁ classes of automorphisms

**kind.** convention

**detail.** U.2 defines the K₁ class of an automorphism for finitely generated projective RIGHT A-modules with matrices acting on column vectors, as the K-book (I.1: right modules, homomorphisms as matrices on column vectors) and Bass (§ 12: right modules) do; in Mathlib these are modules over Aᵐᵒᵖ, and End(Aⁿ_A) ≅ M_n(A) is multiplicative (U.2/right-module-matrix-equiv). Tau Ceti's finiteProjectiveModules and the Z.1 part of this packet use left modules (Z.1/idempotent-module uses row vectors). For commutative rings the two agree and the class of v ↦ gv is [g]. For non-commutative A a left A-module is a right Aᵐᵒᵖ-module and its classes lie in K₁(Aᵐᵒᵖ); using LinearMap.toMatrixRight' (row vectors) instead would give the class of the transposed matrix, which differs on SK₁ (transposition inverts Mennicke symbols). The packet summary states this convention.

### U.1 proposal 8: Break the stage cycle that blocks the power reciprocity law for U.4

**kind.** rescope

**action.** rescope

**roadmaps.** ClassicalArithmeticCompletion, K2SymbolsBrauer, KTheoryLowDegrees.

**detail.** CA.1's nodes tame-hilbert-symbol-formula, hilbert-product-formula-of-degree-n and power-reciprocity-law cite K2SymbolsBrauer:T.7 only for the local norm-residue symbol; T.7 is downstream of KTheoryLowDegrees U.4 (via ArithmeticKTheory N.5 and K3BlochGroups V.2), so U.4 cannot import CA.1.

**proposal.** CA.1 imports the named cohomological pairing from ClassFieldTheory layer 5 instead of K2SymbolsBrauer:T.7. A ClassFieldTheory Part II supplier must establish the general degree-m Artin comparison and its BMS/CA.1 transpose dictionary: layer 6 currently promises only the exponent-two comparison. With the CA.1 → T.7 edge removed and that dictionary supplied, U.4 can import CA.1’s three arithmetic nodes, with (a,b)_BMS=(b,a)_CA.1 fixed explicitly. K2SymbolsBrauer T.7 then imports CA.1. These changes are proposals, and the reciprocity gap remains open.

### U.1 proposal 9: ClassFieldTheory, Part II: explicit local symbols at p

**kind.** rescope

**action.** rescope

**roadmaps.** tauceti:TauCetiRoadmap/ClassFieldTheory, KTheoryLowDegrees.

**detail.** BMS (A.17)–(A.18), the values of the degree-p^n Hilbert symbol on higher unit groups of a p-adic field, have no owner; Tau Ceti's ClassFieldTheory excludes explicit reciprocity laws beyond quadratic reciprocity.

**proposal.** Plan the general degree-m cohomological/Artin dictionary, the BMS/CA.1 orientation, openness and finite index of local power subgroups, including the archimedean cases (A.13)–(A.15), and the higher-unit statements (A.17)–(A.18) in “Class field theory, Part II: explicit Hilbert symbols and power reciprocity”. The higher-unit source is Serre’s Corps locaux XIV §3; it still requires an accessible proof source. CA.1 is an alternative owner once the cycle is removed. U.4 imports the exact contracts instead of assuming these arithmetic consequences from the layer-5 cohomological pairing.

### U.1 proposal 10: Classical K₂ should not depend on the late K.2 layer

**kind.** rescope

**action.** rescope

**roadmaps.** K2SymbolsBrauer, GeneralAlgebraicKTheory, KTheoryLowDegrees.

**detail.** K2SymbolsBrauer:T.1/k2-definition lists GeneralAlgebraicKTheory:K.2 (the combined stage, which requires K.2:low-degree-comparisons ← KTheoryLowDegrees U.6) as a prerequisite, so all of T.1:classical, T.1:plus and T.6 are downstream of U.5 and U.6. This blocks U.5 from naming the K₂ boundary K₂(A/I) → K₁(A, I) and U.6 from completing the homotopy comparison of relative K₁.

**proposal.** Replace that prerequisite by GeneralAlgebraicKTheory:K.2:plus (or drop it: classical K₂ is St(A) → E(A)). U.5/relative-sequence-degree-one then imports T.6's boundary, and U.6/relative-K1-homotopy-comparison imports T.1:plus and T.6.

### U.1 proposal 11: Ownership of the relative-K₁ comparison with the homotopy fibre

**kind.** rescope

**action.** rescope

**roadmaps.** GeneralAlgebraicKTheory, KTheoryLowDegrees.

**detail.** RS-18 gives U.5 the comparison of K₁(A, I) with K.5's homotopy-fibre relative K₁, and K.5 the generic fibre (owner 35). The comparison needs π₁BGL(A)⁺ = K₁(A), which is U.6's, and π₂ = K₂; U.5 is upstream of U.6, so the comparison cannot be a U.5 node. The actual relative-plus comparison and degree-two boundary compatibility are additional proof obligations; resolving the π₂ supplier alone does not prove that the double-ring comparison is an isomorphism.

**proposal.** The comparison is the U.6 node U.6/relative-K1-homotopy-comparison, realising U.5 and U.6, and it imports K.5's fibre. K.5 keeps the fibre and its exact sequence; consumers of the identification with the classical groups cite U.6. K.5 must cite K.2:plus nodes rather than nodes of the combined stage GeneralAlgebraicKTheory:K.2 (such as K.2/functorial-K-theory-of-a-ring): the combined stage requires K.2:low-degree-comparisons, which is downstream of U.6, so such a citation would close the cycle U.6 → K.5 → K.2 → K.2:low-degree-comparisons → U.6. It would also put SchemeKTheoryOperations S.2 and S.3 downstream of U.6 (S.2 requires K.6, which requires K.5), against RS-18's import of the DVR boundary from S.3 into U.5.

### U.1 proposal 12: Presentation of the S-integers as a localisation belongs upstream of U.4

**kind.** rescope

**action.** rescope

**roadmaps.** ArithmeticKTheory, KTheoryLowDegrees.

**detail.** U.4/s-integers-ring-of-fractions (BMS: A′ = A[a⁻¹]) restates the finite-S case of ArithmeticKTheory N.1/S-integers-as-a-localisation and N.1/S-integers-localisation-of-torsion-class-group, which U.4 cannot cite (N.1 is downstream of U.4).

**proposal.** Move N.1's two nodes to KTheoryLowDegrees U.4 (or keep U.4's lemma as the owner of the finite-S statement), and let N.1 import it through U.5 → N.1.

### U.1 proposal 13: Milnor patching for Z.1

**kind.** rescope

**action.** rescope

**roadmaps.** KTheoryLowDegrees.

**detail.** The degree-zero ideal sequence requires ring-level projective patching, beyond the categorical Grothendieck-group owner. No other current packet plans Milnor squares or Milnor patching; the accepted RS-18 ring/projective extension is its home.

**proposal.** Add Milnor patching and K₀ Mayer–Vietoris to Z.1. The 16 milnor-* nodes now decompose this extension; U.5 imports them. Their only matrix input is U.1’s independent finite-rank Whitehead identity and elementary coefficient lifting. A proposed patching sub-layer may expose these nodes without exceeding the existing six Z.1 planets.

## Restructure inventory — Z.3

### Z.3 proposal 1: The special-λ question: the representation-ring route and its Serre inputs

**kind.** decision

**detail.** The special λ-structure uses the representation-ring route: construct the exact representation group R_ℤ(G), embed it by formal characters into the special λ-ring ℤ[X(T)], and transport the identities along associated-projective-module maps to K₀(R), with enough GL factors to represent each virtual class and clopen reduction to constant ranks. The exact K₀ comparison in Serre Proposition 4 is decomposed for a free coefficient coalgebra over a PID. The generic/residue-fibre comparison and its formal-character compatibility are decomposed for a free coefficient coalgebra and specified torus restriction. The product GL coefficient/base-change square now reuses the native single-factor and torus identifications. Integral coefficient freeness, direct-model exact K₀/formal-character transport, and arbitrary-field highest-weight classification, descent and common character image remain distinct inputs in the Serre gap. The complex ClassicalGroups request supplies only a complex comparison. Weibel’s flag-bundle splitting-principle route uses SchemeKTheoryOperations S.5 downstream of Z.3 and cannot provide a prerequisite here. The existing F²_γ=SK₀, first graded piece, determinant formulas, and rank/determinant normalization of Adams operations retain their independent proofs.

### Z.3 proposal 2: The abstract λ-ring algebra moves from SchemeKTheoryOperations S.6 to KTheoryLowDegrees Z.3: node replacement list

**kind.** ownership

**detail.** Accepting S.6's restructure entry 'The abstract λ-ring algebra should be owned by KTheoryLowDegrees Z.3', Z.3 now plans the algebra that Z.3 itself needs, with statements, sources and tests re-verified. Replacements (S.6 node → Z.3 nodes): S.6/lambda-universal-polynomials → Z.3/lambda-universal-polynomials; S.6/lambda-ring → Z.3/pre-lambda-ring (pre-λ-rings, homomorphisms, λ-ideals, quotients) and Z.3/special-lambda-ring (special λ-rings), with the ℤ instance in Z.3/binomial-lambda-ring and Z.3/binomial-special; S.6 keeps only the non-unital λ-algebra clause (for K(A) = ⊕K_m(A) and K^Y(X)) as a node over Z.3/special-lambda-ring; S.6/laurent-lambda-ring → Z.3/monoid-lambda-ring; S.6/lambda-identity-principle → Z.3/lambda-identity-principle; S.6/adams-operations → Z.3/adams-operations; S.6/adams-additivity-square-zero → Z.3/adams-add (a), Z.3/adams-line-element (b), Z.3/adams-square-zero (c), Z.3/adams-binomial (d); S.6/adams-multiplicative-composition → Z.3/adams-ring-endomorphism, Z.3/adams-composition, Z.3/adams-frobenius; S.6/gamma-filtration → Z.3/augmented-lambda-ring, Z.3/gamma, Z.3/gamma-add, Z.3/gamma-series, Z.3/gamma-vanishing-above-rank (γ^k(ℓ − 1) = 0), Z.3/gamma-filtration, Z.3/gamma-filtration-mul, Z.3/gamma-filtration-one and Z.3/gamma-filtration-eq-span (the ideal/span comparison for H = ℤ and H⁰(X, ℤ)); the filtration on the non-unital part K_m stays in S.6; S.6/representation-ring-of-gl → Z.3/representation-ring-of-gl (the rings R_ℤ(∏GL_{N_i}) and their character maps; S.6 keeps R_ℤ(GL) = lim_N R_ℤ(GL_N) and the elements (τ(id_N − N))_N as a node over it); S.6/serre-representation-ring-theorem → Z.3/serre-representation-ring-theorem (S.6 keeps only the passage to the limit R_ℤ(GL)); S.6's gap 'Serre's theorem on representation rings of split reductive groups' and its request to ClassicalGroups layer 4 move with it. Z.3 keeps its existing ids Z.3/gamma and Z.3/gamma-filtration and restates them for pre-λ-rings (resp. augmented pre-λ-rings) with K₀(R) the main instance, so no second γ declaration exists. Not moved (S.6 keeps them and should cite the Z.3 nodes above): S.6/adams-eigenvalue-on-gamma-graded (its weight-one case is Z.3/adams-first-graded), S.6/rational-weight-decomposition, S.6/bott-cannibalistic-class and S.6/representation-ring (R_A(G) of abstract groups), which Z.3's targets do not use.

### Z.3 proposal 3: What S.6, S.7 and the companion packet should cite in Z.3

**kind.** interface

**detail.** S.6/vector-bundle-lambda-ring: for X = Spec A cite Z.3/ring-k0-special, and Z.3/exterior-extension-filtration for the filtration of Λ^k of an extension (K-book Ex. I.5.4); its associated-bundle step is the scheme version of Z.3/associated-projective-module. S.6/degree-zero-comparison: for an actual projective P of constant rank r, λ^r[P] is the K₀ class of det P; no formula is asserted for arbitrary virtual rank-r classes (Z.3/determinant-hom API) and the affine F¹/F² ≅ Pic is Z.3/gamma-first-graded. S.7/gamma-first-graded-pieces: for X = Spec A the statements F²_γ = ker(rank, det), Pic ≅ F¹/F² and the ring homomorphism rank ⊕ det are Z.3/gamma-filtration-two, Z.3/gamma-first-graded and Z.3/rank-det-ring-hom, proved there without the splitting principle, and the determinant identities det(E ⊗ F) and det(Λ^jE) it uses are Z.3/determinant-tensor and Z.3/determinant-exterior-power. The companion packet's restructure entry 'The rank is a ring homomorphism only once Z.3 has the ring structure' is realised as Z.3/rank-ring-hom, cited by Z.3/augmentation; its mapping of the checkpoint's Z.2 request to node ids has been applied (Z.2/rank-hom, Z.2/rank-section, Z.2/rank-fibre-decomposition, Z.2/componentwise-free, Z.2/local-freeness, Z.2/rank-base-change), and the Z.2 request is withdrawn.

### Z.3 proposal 4: Ring-level determinant inputs for KTheoryLowDegrees Z.4

**kind.** interface

**detail.** Z.4's multiplication law (m, L)(n, M) = (mn, L^n M^m) is the Dedekind case of Z.3/rank-det-ring and Z.3/rank-det-ring-hom (Weibel Corollary 2.6.2); the induced maps under localisation and extension of rings on the determinant coordinate are Z.3/determinant-base-change with Z.3/map-ring-hom; and SK₀(A) = 0 for a Dedekind domain is the kernel statement of Z.3/sk-zero. Z.4 should cite these node ids rather than re-plan them.

### Z.3 proposal 5: Corrections to the checkpoint's Z.3 nodes

**kind.** correction

**detail.** (1) The checkpoint said Weibel's γ-filtration is an additive subgroup and left 'agreement with the additive gamma filtration' as a gap; Weibel defines F^n_γ as the ideal generated by the weighted products (Chapter II, p. 30, both the 2012 chapter and the 2013 draft); the additive-subgroup form is Soulé's, for K(A). Z.3/gamma-filtration now matches Weibel, and Z.3/gamma-filtration-eq-span proves the two forms agree for n ≥ 1 (for n = 0 the span is smaller), including disconnected Spec R; the gap is withdrawn. (2) Every excerpt of the checkpoint's nodes was a fragment of a formula (for example '∧kP', 'rank', 'F n γ K'); each is replaced by a literal sentence of the 2012 chapters, and the vacuous acceptance items were replaced by concrete checks. (3) Prerequisites on the stage KTheoryLowDegrees:Z.2 were replaced by the node ids of the companion packet. (4) Z.3/gamma, gamma-series, gamma-one, gamma-add, lambda-zero-class, lambda-neg-recursion, gamma-rank-zero and the γ-filtration nodes are restated for (augmented) pre-λ-rings, with K₀(R) the main instance, since their proofs never used modules.

### Z.3 proposal 6: Z.4 ids for the requests of ArithmeticKTheory N.1–N.3, ClassicalArithmeticCompletion CA.7 and SchemeKTheoryOperations S.3

**kind.** interface

**detail.** ArithmeticKTheory--N.1's request to KTheoryLowDegrees:Z.4 resolves to node ids: (1) K₀(A) ≅ ℤ ⊕ Pic(A) is Z.4/rank-pic-equivalence (kept), with the class-group form Z.4/rank-class-group-equivalence and, for A = S.integer F with Tau Ceti's IsDedekindDomain.integerClassGroupEquiv, Z.4/k0-s-integers; the ring structure (m, a)(n, b) = (mn, aⁿbᵐ) used in N.1's fourth proof step is Z.4/rank-pic-ring-equiv. (2) The restriction-of-scalars formula det_R(Res P) = Norm(det P)·det_R(R′)^{rank P} is Z.4/restriction-determinant, stated for every finite injective extension of Dedekind domains, with the norm Z.4/pic-norm (the transport of Tau Ceti's ClassGroup.relNorm) and the K₀ form Z.4/k0-transfer-coordinates; N.1 supplies the hypotheses for O_{F,S} ⊂ O_{F′,S′} from N.1/S-integers-in-a-finite-extension. N.1/norms-transfers-and-pullbacks should cite these ids in place of the stage KTheoryLowDegrees:Z.4. N.3/quillen-finiteness-criterion's use ('finitely many isomorphism classes of projectives of each rank because Pic(R) is finite') is Z.4/projective-classification. SchemeKTheoryOperations S.3/dedekind-localisation-sequence and N.2/the-three-classical-rows use the normalisation [R] − [𝔭] ↦ (0, [𝔭]⁻¹), an API item of Z.4/rank-pic-equivalence and Z.4/rank-class-group-equivalence. ClassicalArithmeticCompletion CA.7/locally-free-class-group keeps Z.4/rank-pic-equivalence.

### Z.3 proposal 7: Localisations are S-integer rings: a Z.4 lemma that ArithmeticKTheory N.1 can cite

**kind.** interface

**detail.** Z.4/localization-eq-integer proves that every localisation R_M of a Dedekind domain at M ≤ R⁰ is S_M.integer K for S_M the height-one primes meeting M. This is the direction (ii) ⇒ (i) of ArithmeticKTheory:N.1/S-integers-as-a-localisation with S = S_M. Z.4 needs it for the class group of the actual localised ring; N.1 keeps the converse and the presentation of O_{F,S} as a localisation for a torsion class group (N.1/S-integers-localisation-of-torsion-class-group). Proposal: N.1's (ii) ⇒ (i) cites Z.4/localization-eq-integer instead of proving it again.

### Z.3 proposal 8: The Dedekind ring structure is the Dedekind case of Z.3's rank ⊕ det

**kind.** ownership

**detail.** Weibel's Corollary 2.6.2 (H⁰ ⊕ Pic is a ring and rank ⊕ det a surjective ring homomorphism with kernel SK₀) is planned in Z.3 (Z.3/rank-det-ring, Z.3/rank-det-ring-hom, Z.3/sk-zero, Z.3/determinant-mul). Z.4 plans only its Dedekind specialisation: SK₀ = 0, the ring isomorphism K₀(R) ≃+* ℤ ⊕ Pic(R) (Z.4/rank-pic-ring-equiv) and the multiplication law in rank/Pic coordinates (Z.4/rank-pic-mul). The square-zero identity of Z.4/line-class-product gives an independent check of the law. Z.4/reduced-line-class lifts Z.3/gamma-first-graded's L ↦ [L] − 1 into K₀(R) itself, which is possible because F²_γ = SK₀ = 0 for Dedekind domains.

### Z.3 proposal 9: The nonprincipal-ideal test of Z.6 imports Z.4/nonprincipal-ideal-class

**kind.** interface

**detail.** Z.4/nonprincipal-ideal-class gives, for A = ℤ[√−5] and I = (2, 1 + √−5), the rank/Pic facts (rank 0, determinant Pic.mk I ≠ 1, 2([I] − [A]) = 0 through I × I ≃ A × A) and K₀(A) ≅ ℤ ⊕ ℤ/2 through Z.4/zsqrtd-neg-five-integers and Tau Ceti's class number of ℚ(√−5). KTheoryLowDegrees:Z.6/nonprincipal-ideal-test should cite it for these facts and add only the localisation, skyscraper and Euler-class comparisons.

### Z.3 proposal 10: The checkpoint's request to KTheoryLowDegrees:Z.2 is withdrawn for Z.4

**kind.** interface

**detail.** Following the U.1 packet's entry 'Resolution of the companion packet’s references to KTheoryLowDegrees:Z.2', the Z.4 nodes cite Z.2/rank-connected (integer rank), Z.2/rank-domain (fraction-field normalisation and connectedness), Z.2/rank-hom (rank_of_invertible, rank_of_eq_zero_iff), Z.2/rank-base-change, Z.2/k0-pi and Z.2/pi-ring-modules in place of the stage.

### Z.3 proposal 11: Split Z.5 into Z.5:vector-bundles (upstream of SchemeKTheoryOperations S.1, S.2, S.6, S.7) and Z.5:curves

**kind.** sub-layer

**detail.** SchemeKTheoryOperations uses, without a node, exactly the objects the Z.5 stage text asks this layer to build ('Apply the categorical construction to finite locally free sheaves'): Vect(X) in S.1/vector-bundle-comparison, K(Vect X) in S.2/vector-bundle-k-theory-comparison, K₀(Vect X) and Λᵏ of vector bundles in S.6/vector-bundle-lambda-ring, and K₀(Vect X), the rank, det: K₀(Vect X) → Pic(X) and the ring map rank ⊕ det in S.7/scheme-gamma-filtration and S.7/gamma-first-graded-pieces. The atlas has S.6 → Z.5, S.7 → Z.6 and S.2 → Z.5, so those S nodes cannot cite the Z.5 ids. The nodes KTheoryLowDegrees:Z.5/vector-bundle, KTheoryLowDegrees:Z.5/vector-bundle-extension-closed, KTheoryLowDegrees:Z.5/vector-bundle-essentially-small, KTheoryLowDegrees:Z.5/vector-bundle-k-zero, KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison, KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback, KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring, KTheoryLowDegrees:Z.5/vector-bundle-rank, KTheoryLowDegrees:Z.5/sheaf-exterior-power, KTheoryLowDegrees:Z.5/exterior-power-vector-bundle, KTheoryLowDegrees:Z.5/exterior-power-extension-filtration, KTheoryLowDegrees:Z.5/determinant-bundle, KTheoryLowDegrees:Z.5/determinant-bundle-extension, KTheoryLowDegrees:Z.5/determinant-bundle-tensor, KTheoryLowDegrees:Z.5/vector-bundle-determinant, KTheoryLowDegrees:Z.5/rank-determinant-surjective, KTheoryLowDegrees:Z.5/picard-affine-comparison depend only on KTheoryLowDegrees Z.1–Z.3, Mathlib and Tau Ceti (none cites an S node). Proposal: make them the sub-layer 'KTheoryLowDegrees:Z.5:vector-bundles — Vector bundles and their K₀', with edges Z.5:vector-bundles → SchemeKTheoryOperations S.1, S.2, S.6, S.7 and S.6/S.7 citing these ids in place of their vocabulary; the remaining nodes KTheoryLowDegrees:Z.5/regular-curve-integral, KTheoryLowDegrees:Z.5/regular-curve-resolution-property, KTheoryLowDegrees:Z.5/regular-curve-finite-resolution, KTheoryLowDegrees:Z.5/regular-curve-cartan-iso, KTheoryLowDegrees:Z.5/skyscraper-class, KTheoryLowDegrees:Z.5/effective-divisor-class, KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes, KTheoryLowDegrees:Z.5/generic-rank-kernel, KTheoryLowDegrees:Z.5/point-class-map, KTheoryLowDegrees:Z.5/line-bundle-divisorial, KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence, KTheoryLowDegrees:Z.5/curve-k-zero-ring, KTheoryLowDegrees:Z.5/dedekind-curve-comparison, KTheoryLowDegrees:Z.5/doubled-line-example form 'KTheoryLowDegrees:Z.5:curves — Regular curves', which imports S.2 and S.3, removing the unnecessary S.6 edge as confirmed by RT-AREA-ktheory-2/41 and the outgoing edges to Z.6 and EllipticKTheory E.2. The split creates no cycle: the foundation sub-layer has no prerequisite in S.

### Z.3 proposal 12: EllipticKTheory E.2 and E.5 should cite the Z.5 and Z.6 node ids

**kind.** interface

**detail.** E.2/K0-of-a-curve and E.2/K0-of-an-elliptic-curve should cite KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence and Z.5/skyscraper-class; E.2/ring-structure-of-K0-of-a-curve should cite Z.5/curve-k-zero-ring; E.2/picard-group-is-the-divisor-class-group should cite Z.5/line-bundle-divisorial, which proves the surjectivity 'Cl(X) ≅ Pic(X) for an integral noetherian scheme of dimension one with DVR local rings' that E.2 requests from JacobianChallenge layer A (RS-18 assigns the general regular-curve dictionary to Z.5; layer A covers smooth curves). E.2's hypothesis 'separated' is not needed and its remark 'separatedness matters, II.8.2.4 gives a regular non-separated scheme with K_0 ≠ G_0' does not apply in dimension one: II.8.2.4 is affine n-space with doubled origin for n ≥ 2, while every noetherian scheme of dimension ≤ 1 has affine diagonal (KTheoryLowDegrees:Z.5/regular-curve-resolution-property, Z.5/doubled-line-example). E.5/the-projective-line-and-the-projective-bundle-theorem should cite KTheoryLowDegrees:Z.6/projective-line-change-of-basis.

### Z.3 proposal 13: rescope

**action.** rescope

**roadmaps.** KTheoryLowDegrees, tauceti:TauCetiRoadmap/ReductiveGroups, tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups, ReductiveGroupsPartII.

**detail.** The current ClassicalGroups supplier covers complex representations, whereas the Serre route requires characteristic-p algebraic representations and descent to split base fields. General flat integral-coalgebra finite hulls also exceed its scope. The pinned comodule carriers already belong to ReductiveGroups layer 1 and are reused.

**proposal.** Keep the present low-degree exact K₀ comparison in Z.3 and import all existing comodule carriers. Rescope the existing ReductiveGroupsPartII extension with a separate foundational representation-theory stage for the missing arbitrary-field highest-weight/descent theory and, if chosen, general flat integral-coalgebra finite hulls. Its current RG2.0–RG2.5 local-structure and arithmetic-model stages do not cover these statements. The added stage must retain ReductiveGroups as the first prerequisite and specify split GL products over ℚ and every 𝔽_p, absolute simplicity/descent and formal integral characters. Existing ReductiveGroups layer 1 and ClassicalGroups layer 4 are not asserted to cover the stronger inputs. No new roadmap or stage is created by this four-file job.

### Z.3 proposal 14: rescope

**action.** rescope

**roadmaps.** KTheoryLowDegrees, SchemeAndStackFoundations, StableHomotopyKTheory.

**detail.** BS17 determinant descent requires homotopy-coherent connective spectra and perfect v-descent, beyond the current stated supplier surfaces.

**proposal.** Extend the foundations Part II direction with the perfect v-site and line-bundle descent/alteration interfaces of the SF.1 request. Add the Picard 1-type and coherent truncation interface to H.5:spectra, importing general enhanced categorical foundations once. Keep graded Picard signs and determinant functors in Z.3; keep Witt-support and generic K additivity with S.3/K.4:construction. These are proposals within the existing supplier directions, not newly created stages.

### Z.3 proposal 15: rescope

**action.** rescope

**roadmaps.** KTheoryLowDegrees, SchemeKTheoryOperations.

**detail.** Confirmed RT-AREA-ktheory-2/41: higher λ/Adams stages are not inputs to the curve rank/determinant theorem or degree-zero comparisons.

**proposal.** Remove S.6→Z.5 and S.7→Z.6 inherited edges. Use Z.3→Z.5 and S.2→Z.5; for Z.6 retain S.2 and S.5 and the E.2 test. The packet has no S.6/S.7 prerequisite. Keep the early vector-bundle sub-layer proposal; its foundational nodes have no S prerequisites. Outside this four-stage job, route S.6→M.4 replacement by S.6→M.6b to the motivic owner. Promotion only adds edges; an assembly/maintainer action is required to remove the old ones.

### Z.3 proposal 16: rescope

**action.** rescope

**roadmaps.** KTheoryLowDegrees, SchemeKTheoryOperations.

**detail.** The BS17 source route names Z.3 for the shared determinant, but scheme/support K are downstream of Z.3 in the live atlas. Direct S.2/S.3→Z.3 imports were correctly skipped by the assembler.

**proposal.** Keep graded Picard objects, signs, projective/ring determinant and local/sheafified normalization in Z.3; place scheme perfect-complex and Witt-supported determinant comparison nodes in Z.6, importing S.2/S.3. This refines the existing Z.6 map-level comparison target and keeps the supplier construction owners unchanged. Do not add the two cyclic edges. No source result is dropped.

## Supplier request inventory — U.1

### U.1 request 1

**supplier.** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

**need.** For finite extensions k/ℚ_p containing μ_m, the named cohomological localSymbol at kummerCupPairing ζ, bilinearity, Steinberg and antisymmetry, and nondegeneracy from tateDualityPairing_perfect_mixed. This is ClassFieldTheory layer 5's cohomological scope. The comparison with BMS reciprocity orientation and the openness/finite index of k^{×m}, including archimedean cases, are separately recorded gaps; layer 5 explicitly forbids local reciprocity.

**neededBy.** KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary, KTheoryLowDegrees:U.4/power-reduction-totally-imaginary.

### U.1 request 2

**supplier.** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

**need.** The ray-class factorisation of the global Artin map for number fields, with its splitting law (the Artin symbol of an unramified prime 𝔭 ∤ 𝔪 is the image of the ray class of 𝔭) and surjectivity for admissible moduli — BMS (A.5) in ray-class form. Layer 12's text: 'The ray-class factorization of the global Artin map, rayClassArtinMap, takes the admissibility proof as an argument, and its splitting law and surjectivity are stated for admissible moduli.'

**neededBy.** KTheoryLowDegrees:U.4/idelic-density-theorem.

### U.1 request 3

**supplier.** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

**need.** rayClassField 𝔪 and gal_rayClassField_equiv_rayClassGroup: the ray class field is abelian, unramified outside 𝔪, with Galois group the ray class group via the Artin map. Layer 13's text: 'define rayClassField 𝔪 as its class field' and 'The Galois/class-group isomorphisms (gal_rayClassField_equiv_rayClassGroup, …) are then the composite of galClassFieldEquiv, globalClassFieldGaloisEquiv and GlobalNumberFields.ker_rayClassQuotient'.

**neededBy.** KTheoryLowDegrees:U.4/idelic-density-theorem.

### U.1 request 4

**supplier.** tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

**need.** For a finite Galois (here abelian) extension L/K of number fields and σ ∈ Gal(L/K), infinitely many primes of K unramified in L with Frobenius σ — BMS (A.6). Layer 10's text: 'Derive, rather than reprove, the density of split-completely primes, the non-Galois statement via a Galois closure, infinitude of every Frobenius class, and the rational arithmetic-progression case.'

**neededBy.** KTheoryLowDegrees:U.4/idelic-density-theorem, KTheoryLowDegrees:U.4/primes-with-norm-not-one.

### U.1 request 5

**supplier.** tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters

**need.** The cyclotomic extension K(ζ_m)/K is abelian, with the chosen arithmetic Frobenius at 𝔭∤m transported to an automorphism and an ideal Q of its integer ring lying over 𝔭. The norm-power and character formulas themselves are pinned baseline AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one and autToPow_eq_absNorm, as CH-L18 records; supply their actual IsArithFrobAt and LiesOver hypotheses, rather than re-plan those formulas.

**neededBy.** KTheoryLowDegrees:U.4/primes-with-norm-not-one.

### U.1 request 6

**supplier.** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary

**need.** Every open subgroup of IdeleClassGroup K contains RaySubgroup 𝔪 for some modulus 𝔪; rayClassQuotient : IdeleClassGroup K →* RayClassGroup 𝔪 is surjective with kernel RaySubgroup 𝔪; and the class of a prime idèle at 𝔭 ∤ 𝔪 maps to the ray class of 𝔭. Layer 7's text: 'Prove openness, antitonicity, and rayClassQuotient … with surjectivity and kernel RaySubgroup 𝔪 … Prove that every open subgroup of the idele class group contains a ray subgroup'.

**neededBy.** KTheoryLowDegrees:U.4/idelic-density-theorem, KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type.

### U.1 request 7

**supplier.** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

**need.** The idèle norm on Mathlib's NumberField.IdeleClassGroup and the compactness of its norm-one subgroup IdeleClassGroup.normOne (the idèle group and idèle class group themselves are in Mathlib 082e2d3) — BMS (A.4) 'C⁰ is compact'. Layer 6's text: 'define the closed norm-one subgroup IdeleClassGroup.normOne. Prove its compactness'.

**neededBy.** KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type, KTheoryLowDegrees:U.4/idelic-density-theorem.

### U.1 request 8

**supplier.** tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions

**need.** For every N≥2, a continuous retraction r_N from the subtype of real N×N matrices of determinant one, with its coordinate topology, to TauCeti.QuadraticMap.specialOrthogonalGroup of realCliffordForm N 0. Its composite with the faithful coordinate representation fixes each matrix in SO_N, and r_N(1)=1. The SO topology must be the pinned topology induced by specialOrthogonalToGeneralLinear, so composition with a jointly continuous based SL_N contraction is continuous. This is the K-factor projection of the SL_N(ℝ) Cartan/Iwasawa decomposition explicitly owned by LieGroups layer 9; only the retraction property is consumed here.

**neededBy.** KTheoryLowDegrees:U.3/SK1-real-circle-nonzero.

## Supplier request inventory — Z.3

### Z.3 request 1

**supplier.** tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-4-characters-and-schur-polynomials

**need.** ClassicalGroups layer 4 with layer 3: the complex rational-representation character map for products of GL_n(ℂ), with det-twisted Schur characters and injectivity into symmetric Laurent polynomials. This is solely the complex comparison within Z.3/serre-representation-ring-theorem. It does not supply highest-weight classification over ℚ or 𝔽_p, descent, or Serre’s integral comparison. Those precise additional needs are recorded as gaps and a Part II proposal, in accord with this supplier’s stated base field ℂ.

**neededBy.** KTheoryLowDegrees:Z.3/serre-representation-ring-theorem.

### Z.3 request 2

**supplier.** tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

**need.** Layer A: 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗' — the group structure on Tau Ceti's commutative monoid LineBundleClass X, the inverse of [L] being [Hom(L, O_X)] with L ⊗ Hom(L, O_X) ≅ O_X (Stacks 01CT), so that the determinant K₀(Vect X) → Pic(X) of KTheoryLowDegrees:Z.5/vector-bundle-determinant is a homomorphism of groups for every scheme; and the smooth-curve 'Cl(X) ≅ Pic X', which must be the same map D ↦ O_X(D) as KTheoryLowDegrees:Z.5/line-bundle-divisorial (which proves it for every integral regular noetherian scheme of dimension ≤ 1, possibly nonproper or arithmetic, as RS-18 assigns to Z.5). The same interface includes ordinary integer tensor powers, covariant transport along line-bundle isomorphisms (dual of the inverse for negative powers), and Picard pullback induced by Scheme.Modules.pullback, preserving unit, tensor, dual, identity and composition. Z.5 owns only the additional locally constant-exponent module structure, not these general Picard constructions.

**neededBy.** KTheoryLowDegrees:Z.5/vector-bundle-determinant, KTheoryLowDegrees:Z.5/rank-determinant-surjective, KTheoryLowDegrees:Z.5/line-bundle-divisorial, KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext, KTheoryLowDegrees:Z.5/pic-locally-constant-module, KTheoryLowDegrees:Z.5/pic-locally-constant-pullback.

### Z.3 request 3

**supplier.** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts

**need.** Layer 12D: 'Weil divisors on X_F ≅ Divisor k F, matching degrees, principal divisors, and linear equivalence — so Pic-style class groups agree with Cl(F)', used only for the compatibility items of KTheoryLowDegrees:Z.5/point-class-map and Z.5/line-bundle-divisorial on a regular projective curve over a field (RS-18: 'on regular projective function-field models reuse Algebraic Curves 12'); nothing of 12 is re-planned.

**neededBy.** KTheoryLowDegrees:Z.5/point-class-map, KTheoryLowDegrees:Z.5/line-bundle-divisorial.

### Z.3 request 4

**supplier.** tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map

**need.** RS-18's owner of 'the existing categorical Cartan map': TauCeti.cartanMap, TauCeti.cartanMap_of and TauCeti.cartanEquiv, already built at the pin and cited as baseline; Z.6 proves that the vector-bundle Cartan map of Z.5 and π₀ of SchemeKTheoryOperations S.2's Cartan map are this map, and defines no second one.

**neededBy.** KTheoryLowDegrees:Z.6/cartan-map-comparison.

### Z.3 request 5

**supplier.** tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-3-finite-resolutions-and-the-resolution-theorem

**need.** RS-18's supplier of the finite-resolution Euler class ('Euler class of a resolution ... independent of its length, zero padding, and choice of resolution'), built at the pin in the projective case as TauCeti.ExactStructure.eulerClassOf / TauCeti.moduleEulerClassOf with TauCeti.ExactStructure.eulerClassOf_eq and cited as baseline; Z.6 identifies it with the class of a perfect complex in π₀K.

**neededBy.** KTheoryLowDegrees:Z.6/perfect-complex-euler-class.

### Z.3 request 6

**supplier.** AlgebraicModuliForArithmeticGeometry:R09.1

**need.** R09.1: 'Construct projective bundles, Grassmannians and flag schemes with their quotient/subbundle universal properties, universal sheaves and base-change laws' — here only P¹_F = P(O^{⊕2}) = Proj F[T₀, T₁] over Spec F with its twisting sheaves O(m) and the standard affine cover, the convention SchemeKTheoryOperations S.5 uses.

**neededBy.** KTheoryLowDegrees:Z.6/projective-line-regular-curve.

### Z.3 request 7

**supplier.** StableHomotopyKTheory:H.5:spectra

**need.** Connective-spectrum mapping spaces and truncation with universal properties; Picard groupoids as 1-truncated connective spectra, homotopy groups and discrete H⁰. Retain coherent, rather than only homotopy-category, maps in BS17 §5/§12.

**neededBy.** KTheoryLowDegrees:Z.3/graded-line-fibre, KTheoryLowDegrees:Z.3/graded-line-automorphisms, KTheoryLowDegrees:Z.3/determinant-truncation, KTheoryLowDegrees:Z.6/witt-det-uniqueness.

### Z.3 request 8

**supplier.** StableHomotopyKTheory:H.4

**need.** BS17 §12 generic symmetric-monoidal groupoid group completion and its E∞ coherence. The Segal subset model must include the empty-family unit. Import π₀ as ordinary group completion from GrothendieckEulerForms, not a second K₀ owner; compare finite-projective completion with the agreed K model.

**neededBy.** KTheoryLowDegrees:Z.3/ring-spectrum-det, KTheoryLowDegrees:Z.3/graded-line-components.

### Z.3 request 9

**supplier.** SchemeAndStackFoundations:SF.1

**need.** Perfect F_p v-site, effective v-descent of line bundles and their isomorphisms (BS17 Theorem 4.1(ii)), locally constant integer v-sheaf (Prop.5.2), sheafification of 1-types and alteration covers by regular/smooth perfections. Existing fpqc/fppf descent does not imply these stronger statements; extend the foundations direction by the rescope below.

**neededBy.** KTheoryLowDegrees:Z.3/graded-pic-v-descent, KTheoryLowDegrees:Z.6/v-sheafified-first-k, KTheoryLowDegrees:Z.6/witt-det-uniqueness.

### Z.3 request 10

**supplier.** GeneralAlgebraicKTheory:K.4:construction

**need.** Map-level group-completion/Waldhausen projective comparison and additivity paths for perfect distinguished triangles and finite filtrations, including octahedral/refinement coherence. Generic construction and additivity stay with this owner.

**neededBy.** KTheoryLowDegrees:Z.3/ring-spectrum-det, KTheoryLowDegrees:Z.6/determinant-triangle, KTheoryLowDegrees:Z.6/witt-filtration-det.

### Z.3 request 11

**supplier.** SchemeKTheoryOperations:S.3

**need.** Support Perf(W(X) on X), restriction α from Perf(X), regular immersion dévissage, supported p-completion comparison and filtered K continuity. For arbitrary regular R₀ in BS17 Cor.5.6 use smooth approximation; no general Frobenius lift follows from affine coherent cohomology without finite-projective cotangent input.

**neededBy.** KTheoryLowDegrees:Z.6/witt-supported-input, KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison.

### Z.3 request 12

**supplier.** SchemeKTheoryOperations:S.1

**need.** Enhanced perfect complexes, derived pullback and affine comparison, including the p-torsion-free Witt restriction support case. No resolution-property equivalence is asserted for arbitrary schemes.

**neededBy.** KTheoryLowDegrees:Z.6/scheme-spectrum-det, KTheoryLowDegrees:Z.6/witt-supported-input.

### Z.3 request 13

**supplier.** SchemeKTheoryOperations:S.2

**need.** K(Perf X), natural affine projective/perfect comparison and K-theory Zariski descent for qcqs schemes. Keep the one Cartan map and its actual regularity hypotheses.

**neededBy.** KTheoryLowDegrees:Z.6/scheme-spectrum-det.

### Z.3 request 14

**supplier.** GeneralAlgebraicKTheory:K.3

**need.** Regular immersion devissage and comparison with supported K via the specified Waldhausen/abelian localization interfaces. Replace the verified false doubled-line counterexample in the supplier acceptance by the doubled plane.

**neededBy.** KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison.

### Z.3 request 15

**supplier.** GeneralAlgebraicKTheory:K.7

**need.** For finite projective modules over any commutative ring, the biexact tensor-product pairing on Quillen/Waldhausen K-theory induces on π₀ the product [P]·[Q]=[P⊗Q], compatible with scalar extension and the K.1 ExactK0/π₁BQ comparison. The previously cited K.7/biexact-pairings-and-products node does not exist in the reviewed input; this is a request to the actual K.7 stage, not a claimed supplied theorem.

**neededBy.** KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero.

## Open-gap index

The full details are preserved in the reader and both packets. These remain open after assembly.

- U.1 gap 1: The SL-to-SO retraction for the real-circle obstruction. Consumers: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`.
- U.1 gap 2: The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21)). Consumers: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.
- U.1 gap 3: Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18)). Consumers: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.
- U.1 gap 4: Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15). Consumers: `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`.
- U.1 gap 5: Full relative Mennicke universality and the finite arithmetic congruence defect. Consumers: .
- U.1 gap 6: The arithmetic and congruence completions and the central kernel. Consumers: .
- U.1 gap 7: Serre’s SL₂ congruence-kernel theorem at infinite unit rank. Consumers: .
- U.1 gap 8: The congruence-kernel-to-localized-H¹ interface for Calegari–Geraghty. Consumers: .
- U.1 gap 9: The BMS local-symbol dictionary and power-subgroup topology. Consumers: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.
- Z.3 gap 1: General Picard duality and pullback supplier boundary. Consumers: `KTheoryLowDegrees:Z.5/pic-disjoint-cover-ext`, `KTheoryLowDegrees:Z.5/pic-locally-constant-module`, `KTheoryLowDegrees:Z.5/pic-locally-constant-pullback`, `KTheoryLowDegrees:Z.5/vector-bundle-determinant`, `KTheoryLowDegrees:Z.5/rank-determinant-surjective`, `KTheoryLowDegrees:Z.3/graded-line-groupoid`, `KTheoryLowDegrees:Z.3/graded-line-inverse`.
- Z.3 gap 2: Serre's coefficient and arbitrary-field character inputs. Consumers: `KTheoryLowDegrees:Z.3/serre-representation-ring-theorem`, `KTheoryLowDegrees:Z.3/ring-k0-special`.
- Z.3 gap 3: Homotopy-coherent determinant and perfect-site descent suppliers. Consumers: `KTheoryLowDegrees:Z.3/graded-line-components`, `KTheoryLowDegrees:Z.3/graded-line-automorphisms`, `KTheoryLowDegrees:Z.3/graded-line-fibre`, `KTheoryLowDegrees:Z.3/ring-spectrum-det`, `KTheoryLowDegrees:Z.3/determinant-truncation`, `KTheoryLowDegrees:Z.3/local-det-equivalence`, `KTheoryLowDegrees:Z.3/zariski-sheafified-det`, `KTheoryLowDegrees:Z.6/scheme-spectrum-det`, `KTheoryLowDegrees:Z.6/determinant-triangle`, `KTheoryLowDegrees:Z.3/graded-pic-v-descent`, `KTheoryLowDegrees:Z.6/witt-supported-input`, `KTheoryLowDegrees:Z.6/witt-regular-perfection-comparison`, `KTheoryLowDegrees:Z.6/v-sheafified-first-k`, `KTheoryLowDegrees:Z.6/witt-supported-det`, `KTheoryLowDegrees:Z.6/witt-det-uniqueness`, `KTheoryLowDegrees:Z.6/witt-filtration-det`.

## Where to resume

Review the dependency refinement and shared native signatures first; retain all part review verdicts. Resolve the four U.1 proof routes and the external supplier interfaces in their owning jobs, synchronize the read-only part readers under an authorized revision, then elaborate at the exact pins. Source hashes, read scopes and correction search limits are in the full reader and original packets. Scratch files are disposable; all information a later worker needs is in the committed deliverables. This worker submits only #243 and claims no second job.
