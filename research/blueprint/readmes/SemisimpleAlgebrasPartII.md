# Semisimple algebras, Artin–Wedderburn, and the structure of their modules, Part II

This continuation starts from the parent’s Layer6. The arithmetic branch descends its built algebra index to Brauer classes and studies finite splitting degrees and period. The geometric branch concerns sheaf Azumaya module equivalences, ideal support and characteristic coefficients over nonreduced bases. The two branches share Brauer conventions and do not require each other’s completion.

The target-level planning pass is complete under PROTOCOL0: all five stages are planned, each target ends in a read pinned declaration, an owner-stage request or a precise gap. None is closed. Every implementation status is unchecked. Independent review is required before promotion; completion of planning does not certify an implementation or repair a source proof.

## Conventions and ownership

All arithmetic classes use the actual same-universe BrauerGroup and Tau Ceti’s multiplicative group and base-change homomorphisms. The class identity is1; the period uses existing orderOf, with positivity proved from finite order. The class index is the quotient descent of the existing CSA index, rather than the degree of an arbitrary matrix representative. SplittingDegrees quantifies over actual finite extensions, including inseparable ones. Transfer uses finite separable extensions and the full units coefficient module; the trivial F₂ adapter is insufficient.

For the column proof, D is a division K-algebra, L an extension and ρ an actual K-algebra map to M_n(L). The built matrix action is restricted by Module.compHom, preserving the original K-action through ρ.commutes. Finite K-dimension implies finite D-dimension; freeness over division rings and the dimension tower are imports. With n>0 and dim_K D=n² the constructed tower yields n dividing dim_K L. Neither separability nor the desired divisibility is assumed. The exact-degree splitting matrix presentation and Brauer baseChange_comp are already built. The remaining parent request is the conjunction of separability and index degree, which two separate existence statements do not establish.

The reviewed audit has no applicable parent or PartII row. That records audit coverage, not library absence. Both upstream RepresentationTheory readers were read in full. The old generic moritaStructure locator is absent from the current K.7 decomposition; its current invariance-products-and-colimits node is coarse. Native projective-generator tensor/Hom and localization remain that owner’s requested interface. The single scheme-Azumaya/Brauer carrier belongs to SchemeAndStackFoundations:key/scheme-brauer, still reserved. SF.0 supplies QCoh/localization and finite-presentation descent; HodgeStructuresPartII:H.0 owns the integrable Higgs/symmetric action, without duplicate carriers here.

Scheme support means I_Y·M=0 and is stronger than topological support. Positive matrix rank matters; on disconnected bases it may vary. Splitting changes use specified invertible-sheaf evaluation, not a unique isomorphism between arbitrary modules. For finite spectral q:V→B, that line bundle lives on V and need not come from B. A semilocal trivialization and finite-presentation descent, followed by intertwining of every commuting action, are the explicit comparison needed for pushforward coefficients. The single-endomorphism line lemma on B alone does not prove it.

## Source checks and unresolved arguments

The author-corrected Gille–Szamuely2006 argument embeds the quotient by the reduced characteristic polynomial into the division algebra; the finite domain is then a field, and distinct roots supply separability. The false irreducibility claim over an algebraic closure is not used. The complete §4.5 proof, including4.5.16, has now been read; primary decomposition is outside the dependency chain of the stated targets and is not newly planned. The separate Saltman correction is outside this continuation.

Esnault–Groechenigv4 Theorem2.17/Remark2.18 and AppendixA.2–A.3 were reread. The polynomial uniqueness shortcut fails: over F₂[ε]/ε², λ and λ+ε are distinct monic polynomials with equal squares. The replacement compares and descends actual Morita coefficients; it also records the full commuting-Higgs invariant and matrix rank/power relation. These mathematical interfaces need the actual requested sheaf and determinant exports before native geometric elaboration.

Published OV07 Corollary2.9 and its lift-dependent context, and §4.2’s two-step boundary/Proposition4.4 were freshly read. OV writes F_*D as a ring sheaf on the Frobenius twist; its associated cotangent algebra is the algebra used by EG, not a Frobenius pullback with a missing descent. The splitting is bounded at the (p−1)st zero-section neighbourhood; it is not a splitting on an arbitrary spectral thickening. BB’s v2 §2.2 and Proposition3.11/Corollary3.12 supply specified splitting bimodules, not merely abstract equality of classes. Published/preprint identity for BB is not certified. BBv2 Proposition3.11 has two apparent misprints: the smaller algebra has rank p^(2d), and the typed composition is η∘δ. Its subsequent pullback calculation already uses that order. Both are recorded as preprint findings E5/E6; the publisher text could not be acquired. The arXiv OV file’s generated2024 cover date is not treated as a new authored version; the published copy is the planning citation.

In EGAppendixA.2, zero restriction at t=1 does not locate a form’s support on the cotangent zero-section. The exact target Φ(m*θ−r*θ)=0 on V×Spec k[t]/(t−1)^p is a named node with an open proof gap. Relative sequence naturality requires the actual ambient exact diagram, including its restriction to a singular spectral thickening. A canonical categorical refinement additionally needs chosen splitting data and identity-fibre/composition coherence. Neither conclusion follows just by naming OV or BB.

## Layer contracts


### SA.0. Class index and finite splitting degrees

Using the parent Layer6 CSA quotient, unique division representative, existing algebra index and scalar extension, descend the index to Brauer classes. Prove divisibility of all finite splitting degrees using the division-column module dimension calculation, including inseparable extensions. Identify the minimum and gcd of all finite splitting degrees and prove ind(α_L)|ind(α) for arbitrary extensions and ind(α)|[L:K]ind(α_L) for finite ones. The index-degree splitter is reused, not reconstructed.

Dependencies: tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields.

#### Index invariance under Brauer equivalence

Declaration: SemisimpleAlgebrasPartII:SA.0/index-brauer-congr. Kind: lemma.

For finite-dimensional central simple K-algebras A,B, IsBrauerEquivalent A B implies index_K(A)=index_K(B).

Construction or proof: Unpack the positive matrix sizes n,m and algebra equivalence. Install NeZero n and NeZero m from the nonzero witnesses. Apply index_eq_of_algEquiv to the matrix algebras. Rewrite both sides with index_matrix; this is the missing quotient-descent lemma, not a second definition of algebra index.

Prerequisites: tauceti:TauCeti.Algebra.index_matrix, tauceti:TauCeti.Algebra.index_eq_of_algEquiv, tauceti:TauCeti.BrauerGroup.mk_eq_mk_iff.

Source: GS §4.5.

#### Index of a Brauer class

Declaration: SemisimpleAlgebrasPartII:SA.0/class-index. Kind: definition.

For a field K, classIndex:Br(K)→N is the quotient descent of A↦TauCeti.Algebra.index K A. It equals the degree of the unique central division representative. All classes and representative carriers are in the same universe.

Construction or proof: Use the actual CSA setoid quotient and index-brauer-congr to form Quotient.lift. Identify the value on a division representative using index_eq_deg_of_divisionRing; uniqueness follows from the existing division-class uniqueness theorem.

Prerequisites: mathlib:BrauerGroup, tauceti:TauCeti.Algebra.index, SemisimpleAlgebrasPartII:SA.0/index-brauer-congr, tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing, tauceti:TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk, tauceti:TauCeti.Algebra.index_eq_deg_of_divisionRing, tauceti:TauCeti.Quaternion.orderOf_mk_eq_two.

Source: GS §4.5.

Uses: Benoist §0.1: Provides index of a brauer class for the consuming declarations in this layer and its successors.

Planning API:

- classIndex_mk: classIndex([A])=index_K(A).
- classIndex_pos: For every α, 0<classIndex α.
- classIndex_eq_one_iff: classIndex α=1 iff α=1.
- classIndex_baseChange_dvd: For every field extension L/K, classIndex(α_L) divides classIndex α.

Acceptance tests:

- matrix_identity: classIndex of any positive matrix algebra over K is 1, even for M₂(K) of degree2.
- finite_field: Every class over a finite field has index1.
- division_representative: For a central division algebra D of degree d, classIndex([D])=d; a nonsplit quaternion division example has value2.
- zero_excluded: No Brauer class has index0; the zero-dimensional matrix ring is not a CSA.
- hamilton_period_index: For the Hamilton quaternion class h=[ℍ[ℝ]], classIndex(h)=2 and orderOf(h)=2; the built order-of-class theorem supplies the period computation.
- complexification_lowers_index: For h=[ℍ[ℝ]], classIndex(baseChange ℝ ℂ h)=1 < classIndex(h)=2. This is a finite quadratic extension that strictly lowers the index.

Atlas planet: Index of a Brauer class.

#### Class index on representatives

Declaration: SemisimpleAlgebrasPartII:SA.0/class-index-mk. Kind: lemma.

For A:CSA K, classIndex([A])=TauCeti.Algebra.index K A.

Construction or proof: Evaluate Quotient.lift on the actual canonical quotient projection.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index, tauceti:TauCeti.BrauerGroup.mk.

Source: GS §4.5.

#### Positivity of class index

Declaration: SemisimpleAlgebrasPartII:SA.0/class-index-positive. Kind: lemma.

For every α∈Br(K), 0<classIndex α.

Construction or proof: Quotient induction, class-index-mk, then existing index_pos.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index-mk, tauceti:TauCeti.Algebra.index_pos.

Source: GS §4.5.

#### Index one is the trivial class

Declaration: SemisimpleAlgebrasPartII:SA.0/class-index-one. Kind: lemma.

For every α∈Br(K), classIndex α=1 iff α=1.

Construction or proof: Choose a CSA representative and use the existing index-one/splitting equivalence. Translate self-splitting to triviality of the class using the existing base-change kernel theorem and baseChange_self.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index-mk, tauceti:TauCeti.Algebra.isSplittingField_self_iff_index_eq_one, tauceti:TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField, tauceti:TauCeti.BrauerGroup.baseChange_self.

Source: GS §4.5.

#### Finite splitting degrees

Declaration: SemisimpleAlgebrasPartII:SA.0/splitting-degrees. Kind: definition.

splittingDegrees_K(α) is the subset of N of all dim_K L, where L/K is a finite extension in the fixed universe and baseChange_K,L(α)=1. Separability is not imposed.

Construction or proof: Quantify over native field, K-algebra and finite-dimensional instances. Use the existing base-change homomorphism and its identity element; no second Brauer carrier.

Prerequisites: tauceti:TauCeti.BrauerGroup.baseChange.

Source: GS §4.5.

Uses: Benoist §0.1: Provides finite splitting degrees for the consuming declarations in this layer and its successors.

Planning API:

- mem_splittingDegrees: d belongs iff there is a finite extension L/K of degree d killing α.
- one_mem_splittingDegrees_iff: 1 belongs iff α=1.
- splittingDegrees_nonempty: Every α has a finite splitting degree.
- splittingDegrees_positive: Every member is positive.
- classIndex_mem_splittingDegrees: The class index itself belongs.

Acceptance tests:

- identity_degree_one: 1 belongs for the identity class, using K/K.
- zero_degree: 0 is never a member, since extensions are nontrivial fields.
- nontrivial_no_degree_one: For α≠1, degree1 cannot split α.
- quaternion_degree_two: A quaternion division class split by a quadratic extension has degree2 in the set.

#### Division-module splitting dimension

Declaration: SemisimpleAlgebrasPartII:SA.0/division-module-dimension. Kind: lemma.

Let D be a central division K-algebra of degree d>0 and L/K finite with L⊗_K D≃ₐ[L]M_d(L). The column module V=L^d admits a finite-dimensional left D-module structure compatible with its K-action, and dim_K V=d²·dim_D V.

Construction or proof: Choose the matrix presentation of exact degree through the built nonempty_algEquiv_matrix_deg; no new parent existence result. Set ρ=(e restricted to K)∘includeRight and take divisionColumnModule with this actual homomorphism. Apply column-scalar-tower, column-finite and column-tower-dimension. Rewrite dim_K D=d² using the built deg_sq in its stated direction. The Mathlib-only action, tower, finiteness and cancellation now have separate admission-free proof receipts; the Tau Ceti signature remains uncompiled.

Prerequisites: mathlib:Module.finrank_mul_finrank, tauceti:TauCeti.Algebra.index_eq_deg_of_divisionRing, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields, tauceti:TauCeti.Algebra.deg_sq, SemisimpleAlgebrasPartII:SA.0/division-column-action, SemisimpleAlgebrasPartII:SA.0/column-tower-dimension, tauceti:TauCeti.Algebra.IsSplittingField.nonempty_algEquiv_matrix_deg.

Source: GS 4.5.3, 4.5.8; authored dimension strengthening.

#### Index divides every splitting degree

Declaration: SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree. Kind: theorem.

For every field K, α∈Br(K), and finite extension L/K with α_L=1, classIndex α divides dim_K L. No separability hypothesis.

Construction or proof: Choose the existing central division representative D and use the built class-kernel and exact-degree matrix-presentation exports. Instantiate column-splitting-degree at n=deg_K D, using deg_pos and deg_sq. Translate the representative degree through class-index-mk and index_eq_deg_of_divisionRing. This final Tau Ceti adapter remains uncompiled.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index, SemisimpleAlgebrasPartII:SA.0/class-index-positive, SemisimpleAlgebrasPartII:SA.0/division-module-dimension, tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing, tauceti:TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField, SemisimpleAlgebrasPartII:SA.0/column-splitting-degree.

Source: GS 4.5.8; authored extension to all finite fields.

Atlas planet: Index divides every splitting degree.

#### Index under scalar extension

Declaration: SemisimpleAlgebrasPartII:SA.0/index-basechange-divides. Kind: theorem.

For every extension L/K, finite or infinite, classIndex(α_L) divides classIndex α.

Construction or proof: Choose central division representative D, of degree classIndex α. After extending to L, its index divides its degree; deg_baseChange preserves the latter. Use baseChange_mk and class-index-mk to identify this index with the class index.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index, SemisimpleAlgebrasPartII:SA.0/class-index-mk, tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing, tauceti:TauCeti.Algebra.index_dvd_deg, tauceti:TauCeti.Algebra.deg_baseChange, tauceti:TauCeti.BrauerGroup.baseChange_mk.

Source: GS 4.5.11 first divisibility; direct CSA proof.

#### Reverse index divisibility

Declaration: SemisimpleAlgebrasPartII:SA.0/index-divides-degree-index. Kind: theorem.

For every finite extension L/K, classIndex α divides [L:K]·classIndex(α_L). No separability hypothesis.

Construction or proof: Choose the built index-degree finite splitter M/L of a representative of α_L. Install the native K/L/M algebra tower and finiteness. Evaluate the existing baseChange_comp at α to see that M kills α; this is a supplied group law, not a new splitting ascent theorem. Apply all-finite splitting-degree divisibility and the field tower dimension formula.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree, tauceti:TauCeti.Algebra.exists_isSplittingField_finrank_eq_index, mathlib:Module.finrank_mul_finrank, tauceti:TauCeti.BrauerGroup.baseChange, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields, tauceti:TauCeti.BrauerGroup.baseChange_comp.

Source: GS 4.5.11; authored all-finite strengthening.

Atlas planet: Reverse index divisibility.

#### Attainment of the class index

Declaration: SemisimpleAlgebrasPartII:SA.0/class-index-attained. Kind: lemma.

classIndex α belongs to splittingDegrees_K(α).

Construction or proof: Choose a CSA representative; use the built finite splitting field of index degree. Translate splitting through the class-kernel theorem and class-index-mk. This is a quotient adapter, not a new maximal-subfield theorem.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/splitting-degrees, SemisimpleAlgebrasPartII:SA.0/class-index-mk, tauceti:TauCeti.Algebra.exists_isSplittingField_finrank_eq_index, tauceti:TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField.

Source: GS §4.5.

#### Minimum splitting degree

Declaration: SemisimpleAlgebrasPartII:SA.0/minimum-splitting-degree. Kind: theorem.

classIndex α is the least member of splittingDegrees_K(α).

Construction or proof: Membership is class-index-attained. Each member is a positive multiple of classIndex α, by index-divides-splitting-degree; hence it is at least classIndex α.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index-attained, SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree, SemisimpleAlgebrasPartII:SA.0/class-index-positive.

Source: BENOIST §0.1, p63.

Atlas planet: Minimum splitting degree.

#### Gcd of splitting degrees

Declaration: SemisimpleAlgebrasPartII:SA.0/gcd-splitting-degrees. Kind: theorem.

For every n∈N, n divides every d∈splittingDegrees_K(α) iff n divides classIndex α. Thus the natural gcd of all finite splitting degrees is classIndex α.

Construction or proof: Forward: evaluate at the attained class-index degree. Reverse: transitivity of divisibility using index-divides-splitting-degree. This universal property avoids a finite-list surrogate for the infinite set.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index-attained, SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree.

Source: BENOIST §0.1, p63.

#### Index of a cyclic Brauer subgroup

Declaration: SemisimpleAlgebrasPartII:SA.0/same-cyclic-index. Kind: theorem.

If α,β generate the same cyclic subgroup of Br(K), classIndex α=classIndex β.

Construction or proof: For any L/K, α_L=1 iff β_L=1, by mutual integer-power expressions and the base-change homomorphism. Their finite splitting degree sets agree. Apply the minimum characterization.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/minimum-splitting-degree, SemisimpleAlgebrasPartII:SA.0/splitting-degrees, tauceti:TauCeti.BrauerGroup.baseChange.

Source: GS 4.5.10.

#### Restricted division-column action

Declaration: SemisimpleAlgebrasPartII:SA.0/division-column-action. Kind: construction.

For a division K-algebra D, extension field L and a specified K-algebra homomorphism ρ:D→M_n(L), divisionColumnModule n ρ is the left D-action on L^n obtained from the existing matrix column module by Module.compHom. For a chosen splitting equivalence take ρ=e∘includeRight with scalars restricted to K. This assembles built operations for the arithmetic proof; it does not reconstruct their general theory.

Construction or proof: Use the scoped matrix module instance and compose its scalar action with the actual ring homomorphism underlying ρ. For the splitting input, compose the existing tensor includeRight with the K-restriction of e. The column action retains its original K-vector-space structure.

Prerequisites: mathlib:Module.compHom, mathlib:Matrix.Module.matrixModule, mathlib:Algebra.TensorProduct.includeRight.

Source: GS 4.5.3; authored all-finite column-action argument.

Uses: SemisimpleAlgebrasPartII:SA.0/division-module-dimension: Supplies the actual noncommutative scalar action used in the dimension tower; no arithmetic proposition is assumed.

Planning API:

- divisionColumnAction: At coordinate i, a acts by the sum of ρ(a)_ij times v_j.
- divisionColumnTower: The restricted D-action has IsScalarTower K D L^n with the original K-action.
- divisionColumnFinite: If L/K is finite, L^n is a finite D-module for this action.
- divisionColumnDimension: Its K-dimension is dim_K(D) times its D-dimension.

Acceptance tests:

- column_rank_one: For n=1, a acts by multiplication by the single entry ρ(a)_00.
- column_rank_two: The zeroth coordinate is ρ(a)_00 v_0+ρ(a)_01 v_1; this distinguishes rows from transposed columns.
- column_empty: For n=0 the column module is finite and has dimension zero; positivity is separately required for cancellation.
- column_degree_boundary: A degree-two division algebra acting on a splitting column module forces an even extension degree; odd degree contradicts the proved tower identity.

#### Column-action coordinates

Declaration: SemisimpleAlgebrasPartII:SA.0/column-action-coordinate. Kind: lemma.

At coordinate i, a acts by the sum of ρ(a)_ij times v_j.

Construction or proof: Unfold the built restricted action once and use Matrix.Module.smul_apply.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/division-column-action.

Source: GS 4.5.3; authored all-finite division-column refinement.

#### Compatible scalar tower

Declaration: SemisimpleAlgebrasPartII:SA.0/column-scalar-tower. Kind: lemma.

The restricted D-action has IsScalarTower K D L^n with the original K-action.

Construction or proof: Use ρ.commutes to identify the image of a base-field scalar with the matrix algebra scalar. Use IsScalarTower.of_algebraMap_smul and the built matrix scalar-tower instance.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/division-column-action, mathlib:IsScalarTower.of_algebraMap_smul.

Source: GS 4.5.3; authored all-finite division-column refinement.

#### Finiteness over the division algebra

Declaration: SemisimpleAlgebrasPartII:SA.0/column-finite. Kind: lemma.

If L/K is finite, L^n is a finite D-module for this action.

Construction or proof: The original K-module is finite as a finite product of finite K-modules. Apply Module.Finite.of_restrictScalars_finite with the constructed scalar tower; no separate spanning-set proof is planned.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/column-scalar-tower, mathlib:Module.Finite.of_restrictScalars_finite.

Source: GS 4.5.3; authored all-finite division-column refinement.

#### Column dimension tower

Declaration: SemisimpleAlgebrasPartII:SA.0/column-tower-dimension. Kind: lemma.

Its K-dimension is dim_K(D) times its D-dimension.

Construction or proof: Every module over a division ring is free; import this instance for both K and D. Apply Module.finrank_mul_finrank with the constructed tower.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/column-scalar-tower, SemisimpleAlgebrasPartII:SA.0/column-finite, mathlib:Module.Basis.ofVectorSpace, mathlib:Module.finrank_mul_finrank.

Source: GS 4.5.3; authored all-finite division-column refinement.

#### Column splitting-degree divisibility

Declaration: SemisimpleAlgebrasPartII:SA.0/column-splitting-degree. Kind: lemma.

If n>0, dim_K D=n² and ρ:D→M_n(L) is a K-algebra homomorphism, with D and L finite-dimensional over K, then n divides dim_K L. No separability assumption.

Construction or proof: The same K-column module has dimension n·dim_K L by the finite-product rank theorem. The tower identity gives n·dim_K L=n²·dim_D L^n. Reassociate the right side and cancel the positive n. The explicit quotient is dim_D L^n. The dimension hypothesis is the built CSA square-dimension identity in the application, not the desired divisibility assumed as an input.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/column-tower-dimension, mathlib:Module.finrank_pi_fintype, mathlib:mul_left_cancel₀.

Source: GS 4.5.3; authored all-finite division-column refinement.

Coverage: planned. Remaining: Independently review the all-finite quotient/CSA adapter and elaborate it when the pinned Tau Ceti compiled imports exist.

### SA.1. Period and prime support

Use the full units-coefficient Brauer/H² comparison and chosen-embedding open subgroup bridge to transport corestriction for finite separable extensions. Prove cor∘res=[L:K], then α^ind(α)=1 using a separable index-degree splitter. Deduce positive finite period, per|ind, and equality of prime supports via a p-Sylow fixed field and relative p-group H². No general period=index theorem; the all-class comparison naturality and units coefficient transport remain explicit obligations.

Dependencies: SemisimpleAlgebrasPartII:SA.0, tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h², tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

#### Naturality of the Brauer comparison

Declaration: SemisimpleAlgebrasPartII:SA.1/comparison-basechange-units. Kind: comparison.

For a finite separable extension L/K with chosen embedding into Kˢ, the full comparison Additive Br(K)≃H²(G_K,Additive Kˢˣ) commutes with CSA base change and restriction, after the explicit separable-closure units coefficient comparison. This concerns all Brauer classes, not only 2-torsion.

Construction or proof: Import QFI7B’s crossed-product-normalized comparison, and Profinite9’s chosen-embedding open-subgroup bridge. Compute the restriction on a crossed-product class and refine to a common finite Galois splitting field. Prove equality using the comparison’s surjectivity. QFI7B states base-change naturality only for 2-torsion; the all-class extension is a new obligation here.

Prerequisites: tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h², tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory, tauceti:TauCeti.BrauerGroup.baseChange.

Source: GS 4.5.6–4.5.7; QFI7B normalization.

#### Corestriction of Brauer classes

Declaration: SemisimpleAlgebrasPartII:SA.1/brauer-corestriction. Kind: construction.

For finite separable L/K, brauerCorestriction_L,K:Br(L)→*Br(K) is the degree-two cohomological transfer transported through the full units-coefficient Brauer comparisons and the chosen separable-closure coefficient identification.

Construction or proof: Use the actual units coefficient module Additive(Kˢˣ), not the trivial F₂ coefficient adapter. Transport the supplied degree-two coinduced transfer through QFI7B’s full comparison. Prove independence of the embedding and separable-closure identifications using conjugation and coefficient naturality; do not silently erase these choices.

Prerequisites: tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h², tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees, SemisimpleAlgebrasPartII:SA.1/comparison-basechange-units.

Source: GS §4.5.

Uses: Benoist §0.1: Provides corestriction of brauer classes for the consuming declarations in this layer and its successors.

Planning API:

- brauerCorestriction_res: cor(α_L)=α^[L:K].
- brauerCorestriction_comp: Corestriction is transitive in finite separable towers.
- brauerCorestriction_self: Corestriction for K/K is identity.
- brauerCorestriction_embedding: Compatible changes of chosen closure embedding give the same map.

Acceptance tests:

- identity_extension: For K/K, cor α=α.
- trivial_class: For any finite separable extension cor(1)=1.
- quadratic_restriction: For a separable quadratic extension, cor(res α)=α², which is not generally α.
- inseparable_boundary: An inseparable extension is outside this construction’s input type.

Atlas planet: Corestriction of Brauer classes.

#### Corestriction-restriction identity

Declaration: SemisimpleAlgebrasPartII:SA.1/corestriction-restriction-degree. Kind: theorem.

For finite separable L/K and α∈Br(K), cor_L,K(α_L)=α^[L:K].

Construction or proof: Use comparison-basechange-units and Profinite10 cor∘res=[G_K:G_L] on H² with units coefficients. Identify the open-subgroup index with dim_K L through Profinite9. Translate addition back to Brauer multiplication.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/brauer-corestriction, SemisimpleAlgebrasPartII:SA.1/comparison-basechange-units, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Source: GS §4.5.

#### Separable splitting annihilates the class

Declaration: SemisimpleAlgebrasPartII:SA.1/separable-splitting-annihilates. Kind: lemma.

If finite separable L/K splits α, then α^[L:K]=1.

Construction or proof: Apply corestriction-restriction-degree to α_L=1 and the homomorphism’s identity law.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/corestriction-restriction-degree.

Source: GS §4.5.

#### Class annihilated by its index

Declaration: SemisimpleAlgebrasPartII:SA.1/class-power-index. Kind: theorem.

For every field K and α∈Br(K), α^(classIndex α)=1.

Construction or proof: For finite K use the built splitting/triviality results. For infinite K obtain a separable splitting field of degree classIndex α from parent Layer6; the pinned existence theorem of index degree does not include separability. Use separable-splitting-annihilates. The source’s p101 argument is read with the author’s injective-subalgebra correction, not the invalid irreducibility claim over an algebraic closure.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index, tauceti:TauCeti.Algebra.index_eq_one_of_finite, tauceti:TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields, SemisimpleAlgebrasPartII:SA.1/separable-splitting-annihilates, SemisimpleAlgebrasPartII:SA.0/class-index-one.

Source: GS 4.5.4, 4.5.12–4.5.13; author errata p101.

#### Finite order of Brauer classes

Declaration: SemisimpleAlgebrasPartII:SA.1/brauer-finite-order. Kind: theorem.

Every α∈Br(K) is of finite order, and its natural order is positive.

Construction or proof: Use the positive classIndex as an exponent killing α. Apply the generic finite-order criterion and positivity; orderOf alone may be zero for an infinite-order group element.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/class-power-index, SemisimpleAlgebrasPartII:SA.0/class-index-positive, mathlib:IsOfFinOrder.orderOf_pos, mathlib:isOfFinOrder_iff_pow_eq_one.

Source: GS 4.5.12.

#### Period divides index

Declaration: SemisimpleAlgebrasPartII:SA.1/period-divides-index. Kind: theorem.

For every field K and α∈Br(K), orderOf α divides classIndex α. The period is the existing group orderOf, not a second invariant with arbitrary witnesses.

Construction or proof: Apply orderOf_dvd_iff_pow_eq_one to class-power-index.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/class-power-index, mathlib:orderOf_dvd_iff_pow_eq_one.

Source: GS 4.5.13.

Atlas planet: Period divides index.

#### Prime-to-p splitting for prime-to-p period

Declaration: SemisimpleAlgebrasPartII:SA.1/prime-to-p-splitting. Kind: theorem.

Let p be prime with p∤orderOf α. There exists a finite separable splitting field E/K of degree prime to p.

Construction or proof: Choose a finite Galois splitting extension M/K from the existing comparison construction. Choose a p-Sylow P of Gal(M/K) and let E=M^P. The Galois degree formula gives [E:K] prime to p. The class over E lies in the relative Brauer group split by the p-group extension M/E; the supplied finite-group H² annihilation result makes its order a p-power. Restriction also makes its order divide orderOf α. Coprimality forces the E-class to be trivial. Sylow/fixed-field and relative comparison obligations remain named supplier inputs, not routine steps.

Prerequisites: tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h², tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees, SemisimpleAlgebrasPartII:SA.1/brauer-finite-order, tauceti:TauCeti.BrauerGroup.baseChange.

Source: GS 4.5.14.

#### Every index prime divides period

Declaration: SemisimpleAlgebrasPartII:SA.1/index-prime-divides-period. Kind: lemma.

For a prime p, if p divides classIndex α then p divides orderOf α.

Construction or proof: If p does not divide the period, prime-to-p-splitting gives a splitting degree not divisible by p. But index-divides-splitting-degree forces p to divide that degree, a contradiction.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/prime-to-p-splitting, SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree.

Source: GS 4.5.13–4.5.14.

#### Period and index have the same prime divisors

Declaration: SemisimpleAlgebrasPartII:SA.1/same-prime-divisors. Kind: theorem.

For all primes p, p∣orderOf α iff p∣classIndex α. No equality of period and index is asserted.

Construction or proof: One direction uses period-divides-index. The other uses index-prime-divides-period.

Prerequisites: SemisimpleAlgebrasPartII:SA.1/period-divides-index, SemisimpleAlgebrasPartII:SA.1/index-prime-divides-period.

Source: GS 4.5.13.

Atlas planet: Period and index have the same prime divisors.

Coverage: planned. Remaining: Implement the requested separable index-degree conjunction, all-class H² naturality/transfer and Sylow fixed-field relative chain.

### SA.2. Geometric Morita and scheme support

Import the one shared scheme-Azumaya/Brauer key and generic affine projective-generator Morita structure. Construct restriction-compatible sheaf tensor/Hom equivalences and their unit/counit, restrict to coherent objects under stated finiteness hypotheses, and prove equality of O_X-annihilator ideal sheaves. Scheme support means I_Y M=0, not topological containment. Reuse the built matrix equivalence and require nonempty local rank; use the Z/4 example to detect nilpotent support mistakes. Étale-local and strict-henselian splitting come from the shared key; ordinary henselianity alone is insufficient.

Dependencies: tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2, GeneralAlgebraicKTheory:K.7.

#### Scheme support in the matrix model

Declaration: SemisimpleAlgebrasPartII:SA.2/matrix-support. Kind: comparison.

For a commutative ring R, R-module M, ideal I and nonempty index type ι, I≤ann_R(ι→M) iff I≤ann_R M. For finite ι this is the underlying R-module of the actual matrix Morita functor.

Construction or proof: Use the existing annihilator_pi theorem and the nonempty constant infimum. Identify the actual matrix functor object as ι→M; no new functor or generic annihilator definition. The empty index type gives full annihilator, so it is excluded from the Morita statement.

Prerequisites: mathlib:Module.annihilator_pi, mathlib:ModuleCat.matrixEquivalence, mathlib:moritaEquivalenceMatrix.

Source: EG Remark2.18 and matrix step in proof of Theorem2.17.

#### Nilpotent support boundary

Declaration: SemisimpleAlgebrasPartII:SA.2/nilpotent-support-boundary. Kind: lemma.

For R=Z/4 and I=(2), R/I²=R has topological support in V(I)=Spec R but is not annihilated by I: 2·1=2≠0. Hence topological support does not imply scheme-theoretic support.

Construction or proof: Compute 2²=0 and 2≠0 in R. The generator 2 acts nontrivially on 1. Apply mem_annihilator to refute I≤ann_R R. Nilpotence places 2 in every prime ideal, so V(I) is all of Spec R. This finite-ring example instantiates EG’s ideal-support warning without a reduced-base assumption.

Prerequisites: mathlib:Module.mem_annihilator.

Source: EG Remark2.18.

#### Morita equivalence from a splitting module

Declaration: SemisimpleAlgebrasPartII:SA.2/sheaf-morita. Kind: construction.

Let X be a scheme, A a sheaf Azumaya O_X-algebra supplied by the shared key, and P a finite locally free generator with specified A≃End_O(P). Construct inverse O_X-linear functors P⊗− and Hom_A(P,−) between QCoh(X) and QCoh_A(X), with explicit unit and counit.

Construction or proof: Import generic projective-generator Morita theory from GeneralAlgebraicKTheory:K.7 and QCoh localization/gluing from SF.0. On affine opens apply the native End_R(P) equivalence with P finite projective and generating; the source’s locally free splitting data give these hypotheses. Construct restriction-compatible unit/counit and glue the actual functors, proving the two triangle identities. O_X-linearity is part of the result.

Prerequisites: SchemeAndStackFoundations:key/scheme-brauer, SchemeAndStackFoundations:SF.0, GeneralAlgebraicKTheory:K.7, mathlib:ModuleCat.matrixEquivalence, mathlib:moritaEquivalenceMatrix.

Source: EG Theorem2.17 proof, pp13–14; AppendixA.3.

Uses: Esnault–Groechenig Theorem2.17 / AppendixA.3: Provides morita equivalence from a splitting module for the consuming declarations in this layer and its successors.

Planning API:

- sheafMorita_unit: Hom_A(P,P⊗N)≅N naturally.
- sheafMorita_counit: P⊗Hom_A(P,M)≅M naturally.
- sheafMorita_restrict: The functors and adjunction data commute with restriction to opens.
- sheafMorita_matrix: For P=O_X^n, n>0, the affine specialization is the pinned matrix equivalence.

Acceptance tests:

- rank_one: For A=O_X,P=O_X, the equivalence is identity.
- matrix_rank_two: For P=O_X², the forward object is the matrix column module; annihilator agrees with the scalar module.
- disconnected_rank: On a disconnected base with ranks1 and2, apply local positive rank, not one globally constant rank.
- nongenerator: The zero bundle on a nonempty nontrivial base cannot give an equivalence.

Atlas planet: Morita equivalence from a splitting module.

#### Coherent Morita restriction

Declaration: SemisimpleAlgebrasPartII:SA.2/coherent-morita. Kind: theorem.

For X locally noetherian, A locally finite over O_X and splitting generator P finite locally free, the sheaf Morita equivalence restricts to coherent modules. More generally the finitely presented QCoh subcategories are preserved when coherence is not available.

Construction or proof: Use finite projectivity and the generic Morita restriction to finitely presented modules on affine opens. For a locally noetherian base finite modules are coherent; compare the actual affine restriction data. Glue the local comparisons using the sheafMorita restriction API.

Prerequisites: SemisimpleAlgebrasPartII:SA.2/sheaf-morita, GeneralAlgebraicKTheory:K.7, SchemeAndStackFoundations:SF.0.

Source: EG Theorem2.17, pp13–14.

#### Morita preserves scheme-theoretic support

Declaration: SemisimpleAlgebrasPartII:SA.2/sheaf-support-morita. Kind: theorem.

For any scheme X, closed immersion Y defined by I_Y and splitting generator P, I_Y·M=0 iff I_Y·Hom_A(P,M)=0. Equivalently the two actual O_X-annihilator ideal sheaves agree. No reducedness assumption.

Construction or proof: Localize where P is free of positive rank and A is the matching matrix algebra. Use the actual matrix-support comparison and the counit to identify underlying modules. Equality of ideal sheaves and vanishing of multiplication are local, so descend through SF.0.

Prerequisites: SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SemisimpleAlgebrasPartII:SA.2/matrix-support, SchemeAndStackFoundations:key/scheme-brauer, SchemeAndStackFoundations:SF.0, mathlib:LinearEquiv.annihilator_eq.

Source: EG Remark2.18 and proof of Theorem2.17.

Atlas planet: Morita preserves scheme-theoretic support.

Coverage: planned. Remaining: Implement the single shared scheme-Brauer carrier and generic projective-generator/QCoh localization interfaces, then coherent and ideal-support descent.

### SA.3. Characteristic invariants by Morita descent

For an A-linear endomorphism on an Azumaya module whose inverse Morita module is locally free, define its characteristic polynomial on splitting covers. Compare splitting modules by an invertible sheaf with specified evaluation and prove line-twist invariance; descend coefficient sections over nonreduced schemes. Use the explicit finite spectral pushforward, spectral-cover line twist, overlap and full commuting-Higgs coefficient nodes for EG2.17 and its rank/power relation; import the H.0 carrier once. The Frobenius-root uniqueness shortcut is false and is excluded.

Dependencies: SemisimpleAlgebrasPartII:SA.2, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2, HodgeStructuresPartII:H.0.

#### Change of splitting module

Declaration: SemisimpleAlgebrasPartII:SA.3/splitting-transition-line. Kind: theorem.

For two splitting generators P,Q of a sheaf Azumaya algebra A, the comparison of their inverse Morita functors is tensoring by the invertible sheaf Hom_A(Q,P), with the evaluation isomorphism fixed. Local ranks are positive and equal on each connected component.

Construction or proof: Import the Picard torsor of splitting modules and its evaluation maps from the shared scheme-Brauer key. Apply the imported unit/counit to identify the transition functor. Pin direction by testing Q=P⊗L: Hom_A(Q,M)≅L^∨⊗Hom_A(P,M). Never assert a unique isomorphism between arbitrary splitting modules.

Prerequisites: SchemeAndStackFoundations:key/scheme-brauer, SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SchemeAndStackFoundations:SF.0.

Source: EG Theorem2.17 étale descent step; explicit repair of source issue E2.

#### Characteristic polynomial under a line twist

Declaration: SemisimpleAlgebrasPartII:SA.3/charpoly-line-twist. Kind: lemma.

For a finite locally free O_X-module N and O_X-linear endomorphism t, the characteristic polynomial of id_L⊗t on L⊗N equals that of t for every invertible sheaf L, over arbitrary scheme bases.

Construction or proof: Trivialize N and L locally. In those trivializations the two matrices agree, or are conjugate after changing frames. Use the pinned charpoly_units_conj for independence from frames. Glue equality of polynomial coefficient sections; nilpotents do not affect the argument.

Prerequisites: mathlib:Matrix.charpoly_units_conj, SchemeAndStackFoundations:SF.0.

Source: EG Theorem2.17 descent; authored invariant-based repair.

#### Morita characteristic polynomial

Declaration: SemisimpleAlgebrasPartII:SA.3/morita-characteristic-polynomial. Kind: definition.

Given a sheaf Azumaya algebra A, A-module M and A-linear endomorphism t, suppose its inverse Morita module is finite locally free of rank r on an étale splitting cover. Define the degree-r monic polynomial in O_X[T] locally as charpoly(Hom_A(P,t)). The coefficients are sections on X after the overlap compatibility has been proved.

Construction or proof: Use the shared key’s étale splitting cover and inverse Morita modules. On overlaps use splitting-transition-line and charpoly-line-twist; keep natural evaluation data so this is descent of specified coefficients. Use SF.0/SF.2 sheaf descent. This defines an invariant by Morita data, not an arbitrary Frobenius root of the full polynomial.

Prerequisites: SchemeAndStackFoundations:key/scheme-brauer, SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SemisimpleAlgebrasPartII:SA.3/splitting-transition-line, SemisimpleAlgebrasPartII:SA.3/charpoly-line-twist, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2.

Source: EG Theorem2.17; repair of E2.

Uses: Esnault–Groechenig Theorem2.17 / AppendixA.3: Provides morita characteristic polynomial for the consuming declarations in this layer and its successors.

Planning API:

- moritaCharpoly_matrix: For A=M_n(R), M=R^n⊗N and t=id⊗u, the value is charpoly u.
- moritaCharpoly_changeSplitting: Compatible replacement of splitting generator leaves the polynomial unchanged.
- moritaCharpoly_baseChange: Pullback carries the polynomial to the coefficient pullback for finite locally free inverse modules.
- moritaCharpoly_degree: On a rank-r locus it is monic of degree r.

Acceptance tests:

- rank_one_scalar: For rank1 inverse module and scalar b, the polynomial is T−b.
- zero_rank: For M=0 the polynomial is 1, of degree0.
- nonreduced_scalar: Over F₂[ε]/ε², rank1 scalar ε has polynomial T−ε, distinct from T although their squares agree.
- line_twist: Replacing P by P⊗L yields the same polynomial, using the specified transition equivalence.

Atlas planet: Morita characteristic polynomial.

#### Frobenius root boundary

Declaration: SemisimpleAlgebrasPartII:SA.3/frobenius-root-boundary. Kind: lemma.

In R=F₂[ε]/ε², ε≠0 and ε²=0. Thus the distinct monic polynomials T and T+ε have the same square; a monic Frobenius root is not unique on a nonreduced base.

Construction or proof: Use the native TrivSqZeroExt(F₂,F₂) model and its pure nilpotent element. Verify nonzero by its second projection and square zero by inr_mul_inr. The separate native proof verifies distinctness by constant coefficients, monicity and the polynomial square equality, as well as the two ring facts. It uses the native dual-number ring; no reducedness hypothesis is inserted.

Prerequisites: mathlib:TrivSqZeroExt.inr_mul_inr.

Source: EG Theorem2.17 proof, pp13–14; source issue E2.

#### Finite pushforward of a matrix Morita module

Declaration: SemisimpleAlgebrasPartII:SA.3/finite-pushforward-morita. Kind: lemma.

Let q:V→B be finite, A split by a free generator of positive rank n, and M=P⊗F. Then q_*M≅(q_*F)^⊕n, respecting every commuting function action from V. If q_*M is finite locally free, q_*F is finite locally free and its componentwise rank is rank(q_*M)/n.

Construction or proof: Restriction of scalars along a finite algebra map preserves finite direct sums. The inverse summand is a finite direct summand of q_*M, hence finite projective; descend the affine finite-projective description. The rank identity uses the actual nonempty finite product, and n may vary on components.

Prerequisites: SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SchemeAndStackFoundations:SF.0, mathlib:ModuleCat.matrixEquivalence.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Line trivialization over a finite cover

Declaration: SemisimpleAlgebrasPartII:SA.3/spectral-line-trivialization. Kind: lemma.

For a finite morphism q:V→B and invertible sheaf L on V, after passage to a strictly henselian local base at a point of B, L is free on the resulting semilocal finite algebra. With finite-presentation data this trivialization descends to an étale neighbourhood of that point.

Construction or proof: A finite algebra over a local ring is semilocal; an invertible module over a semilocal ring is free of rank one. Use finite presentation of L, its inverse and the evaluation maps to descend a chosen basis and its inverse from the filtered étale neighbourhoods. Request the generic semilocal and finite-presentation descent exports from SF.0; strict-henselian splitting of A remains the shared key.

Prerequisites: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:key/scheme-brauer.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Spectral line twists preserve characteristic coefficients

Declaration: SemisimpleAlgebrasPartII:SA.3/finite-pushforward-line-invariant. Kind: lemma.

For finite q:V→B, F with q_*F finite locally free, and an invertible sheaf L on V, tensoring F by L preserves the characteristic polynomial of every universal commuting function action after q_*. The line is on V and need not be a pullback from B.

Construction or proof: Use spectral-line-trivialization on a covering family of étale base neighbourhoods. A chosen V-linear basis of L identifies the two pushed-forward modules and intertwines all function actions, so their universal matrices are conjugate. Import matrix conjugation invariance and descend equality of coefficient sections; no Frobenius root cancellation and no reduction of B.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/spectral-line-trivialization, mathlib:Matrix.charpoly_units_conj, SchemeAndStackFoundations:SF.0, HodgeStructuresPartII:H.0.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Morita Higgs coefficients agree on overlaps

Declaration: SemisimpleAlgebrasPartII:SA.3/morita-higgs-overlap. Kind: lemma.

For a finite spectral morphism V→B and two étale splitting generators of A, the characteristic coefficients of the finite locally free inverse Morita pushforwards agree, including their full symmetric differential coefficients.

Construction or proof: Use the specified splitting-transition-line evaluation to compare inverse modules by an invertible V-sheaf. Apply finite-pushforward-line-invariant to the universal commuting action; the base one-endomorphism line lemma alone does not supply this step.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/splitting-transition-line, SemisimpleAlgebrasPartII:SA.3/finite-pushforward-line-invariant, HodgeStructuresPartII:H.0.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Morita Higgs characteristic coefficients

Declaration: SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant. Kind: construction.

Given a finite spectral morphism V→B, sheaf Azumaya A on V and A-module M, suppose on étale splitting neighbourhoods the inverse Morita pushforward is finite locally free of rank r with the imported integrable coefficient-valued Higgs action. Construct degree-r monic symmetric characteristic coefficients on B by descent of these actual inverse-module coefficients, without choosing a Frobenius root.

Construction or proof: Use the imported H.0 integrable Higgs/symmetric-action carrier and request its universal determinant coefficients. Use morita-higgs-overlap to glue all coefficient sections through SF.0 descent. Keep the evaluation maps fixed; invariance of coefficients does not assert uniqueness of the modules.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/morita-higgs-overlap, SemisimpleAlgebrasPartII:SA.3/finite-pushforward-morita, HodgeStructuresPartII:H.0, SchemeAndStackFoundations:SF.0.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

Uses: EG2.17 local Morita step and Cartier successor BNR support comparison: Provides the degree-r invariant with coefficients in all symmetric differential degrees over nonreduced parameter bases.

Planning API:

- moritaHiggsInvariant_local: On a splitting chart the descended coefficients equal the universal Higgs determinant of the actual inverse-module pushforward.
- moritaHiggsInvariant_changeSplitting: A compatible change of splitting generator leaves every symmetric coefficient unchanged.
- moritaHiggsInvariant_baseChange: Compatible base change preserving the stated local freeness pulls back all coefficients.
- moritaHiggsInvariant_power: For local matrix rank n the original pushforward has characteristic polynomial equal to the n-th power of the Morita polynomial and rank nr.

Acceptance tests:

- higgs_scalar_rank_one: For one commuting scalar b the polynomial is λ−b; in several coefficient directions retain each linear coefficient.
- higgs_zero_module: The zero module has invariant1 and rank0.
- higgs_spectral_line: An invertible sheaf on the finite spectral cover, even one not pulled back from the base, preserves all pushed-forward coefficients.
- higgs_nonreduced_root: Over the characteristic-two dual numbers, λ and λ+ε have the same square but different coefficients; the action, rather than its square, selects the invariant.

#### Local Morita Higgs invariant

Declaration: SemisimpleAlgebrasPartII:SA.3/higgs-invariant-local. Kind: lemma.

On a splitting chart the descended coefficients equal the universal Higgs determinant of the actual inverse-module pushforward.

Construction or proof: Evaluate the descended section on its defining covering chart.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Change of Morita Higgs splitting

Declaration: SemisimpleAlgebrasPartII:SA.3/higgs-invariant-change. Kind: lemma.

A compatible change of splitting generator leaves every symmetric coefficient unchanged.

Construction or proof: Use the overlap equality and sheaf section extensionality.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/morita-higgs-overlap, SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Base change of Morita Higgs coefficients

Declaration: SemisimpleAlgebrasPartII:SA.3/higgs-invariant-basechange. Kind: lemma.

Compatible base change preserving the stated local freeness pulls back all coefficients.

Construction or proof: Import coefficient pullback for the universal determinant and finite flat base change or the explicitly supplied pushforward comparison. Compare on splitting charts and descend. Arbitrary base change requires that comparison and the stated finite local freeness.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant, HodgeStructuresPartII:H.0, SchemeAndStackFoundations:SF.0.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

#### Matrix multiplicity of Morita Higgs coefficients

Declaration: SemisimpleAlgebrasPartII:SA.3/higgs-invariant-power. Kind: lemma.

For local matrix rank n the original pushforward has characteristic polynomial equal to the n-th power of the Morita polynomial and rank nr.

Construction or proof: In a coefficient basis, each universal commuting-action matrix is n identical diagonal blocks. The determinant of block diagonal matrices is the product of block determinants; this does not depend on the characteristic. Descend coefficient equality and the local rank identity, including n=p^d in the differential-operator application.

Prerequisites: SemisimpleAlgebrasPartII:SA.3/finite-pushforward-morita, SemisimpleAlgebrasPartII:SA.3/morita-higgs-invariant, HodgeStructuresPartII:H.0, mathlib:Matrix.det_blockDiagonal.

Source: EG Theorem2.17 proof, pp13–14; authored repair of the overlap argument.

Coverage: planned. Remaining: Implement finite spectral pushforward, semilocal line trivialization, symmetric Higgs determinant and coefficient descent with the supplied carrier; the polynomial boundary has separate checked evidence.

### SA.4. Cartier forms and relative Brauer comparison

Apply the Cartier-specific four-term units/closed-form exact sequence to obtain the two-step Brauer boundary, with additivity and relative base-change naturality. Import [D]=Φ(θ) and chosen W₂ splittings from the Cartier-flow owner. For perfect characteristic-p smooth projective Z and the spectral cover V, compare m*D and r*D on V×Spec k[t]/(t−1)^p; identify the missing relative class-vanishing input in EG AppendixA.2 and the coherent categorical refinement in A.3. All target interfaces are planned with the exact relative class-vanishing gap and lift-dependent OV/BB supplier obligations; the stage is not closed.

Dependencies: SemisimpleAlgebrasPartII:SA.2, SemisimpleAlgebrasPartII:SA.3, SchemeAndStackFoundations:SF.2.

#### Cartier forms and Azumaya classes

Declaration: SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison. Kind: comparison.

For a smooth characteristic-p scheme in the exact Cartier setup of EG(A.3), the two-step étale boundary Φ:H⁰(Ω¹)→H²(G_m) is additive and natural for morphisms respecting that relative exact sequence. The differential-operator class satisfies [D]=Φ(θ) only through the Cartier-flow supplier’s OV07 comparison.

Construction or proof: Import the actual relative four-term exact sequence of units, dlog, closed forms and w*−C; a short exact sequence with the same names is insufficient. Use SF.2’s connecting-map construction twice, with its explicit middle image sheaf. Import the specific OV07 Proposition4.4 identification [D]=Φ(θ); it is not supplied merely by generic CR.1 crystals. Relative functoriality requires a morphism of the full exact sequence.

Prerequisites: SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:key/scheme-brauer, SemisimpleAlgebrasPartII:SA.4/cartier-middle-image, SemisimpleAlgebrasPartII:SA.4/cartier-boundary-additivity, SemisimpleAlgebrasPartII:SA.4/cartier-boundary-naturality.

Source: EG EGAppendixA.2 equation(A.3); freshly read published OV07 Proposition4.4 pp87–88.

#### Relative Brauer class comparison

Declaration: SemisimpleAlgebrasPartII:SA.4/relative-brauer-equality. Kind: application.

Let Z/k be smooth projective, k perfect of characteristic p>0, with a W₂(k)-lift, and V=Z′_a. On T=Spec k[t]/(t−1)^p let m be cotangent scaling and r the projection. The target is [m*D]=[r*D] on V×T, with an equivalence of module categories carrying chosen splitting data when a refinement is established.

Construction or proof: By cartier-brauer-comparison the class difference is Φ(m*θ−r*θ). The published proof’s inference from vanishing on t=1 to support on the zero-section is invalid as stated; retain a named unresolved Brauer-class vanishing input for this exact relative thickening. If that input is proved, the equality follows. A chosen Morita bimodule/evaluation coherence is needed to obtain the categorical refinement of RemarkA.3. No canonical equivalence is inferred from equality of classes alone.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison, SchemeAndStackFoundations:key/scheme-brauer, SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SemisimpleAlgebrasPartII:SA.4/relative-class-vanishing-input, SemisimpleAlgebrasPartII:SA.4/relative-morita-refinement.

Source: EG PropositionA.2 and RemarkA.3, pp40–41.

#### Middle image in the Cartier boundary

Declaration: SemisimpleAlgebrasPartII:SA.4/cartier-middle-image. Kind: comparison.

In the supplied relative four-term sequence, the image of dlog identifies with J=(F_*O_Y^×)/O_Y′^× and yields two short exact sequences: 0→O_Y′^×→F_*O_Y^×→J→0 and 0→J→F_*Z¹_Y/S→Ω¹_Y′/S→0.

Construction or proof: Use exactness to identify the quotient by the first kernel with the middle image, retaining the actual image and quotient maps. Import the Cartier-flow exactness and SF.2 abelian-sheaf cokernel/image comparison. No independent sheaf-of-forms carrier is introduced.

Prerequisites: SchemeAndStackFoundations:SF.2.

Source: OV07 §4.2 equation(4.1.1), Proposition4.2, pp85–86.

#### Additivity of the Cartier Brauer boundary

Declaration: SemisimpleAlgebrasPartII:SA.4/cartier-boundary-additivity. Kind: lemma.

For the supplied relative exact sequence and Φ=δ₁∘δ₀ through J, Φ(ω₁+ω₂)=Φ(ω₁)+Φ(ω₂) and Φ(0)=0 in H²_ét(O^×), corresponding to tensor-product Brauer classes under the shared comparison.

Construction or proof: Both connecting maps are homomorphisms of abelian groups. Transport addition through the shared scheme-Brauer comparison; field BrauerGroup is not used here.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/cartier-middle-image, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:key/scheme-brauer.

Source: OV07 §4.2 two-step morphism after(4.1.1), pp85–86.

#### Relative naturality of the Cartier Brauer boundary

Declaration: SemisimpleAlgebrasPartII:SA.4/cartier-boundary-naturality. Kind: lemma.

A supplied morphism of the full relative Cartier exact sequences, including the units and closed-form maps, commutes with Φ. Base change to a nonreduced parameter scheme requires this exact relative diagram; restriction to a reduced fibre alone is insufficient.

Construction or proof: Use functoriality of the actual middle image map and both supplied short exact sequences. Apply naturality of each connecting homomorphism and compose the two squares. Request the relative sequence for smooth Y/S and its base changes from the Cartier owner; never apply an absolute sequence to a singular thickening as if it were smooth over k.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/cartier-middle-image, SchemeAndStackFoundations:SF.2.

Source: OV07 §4.2 relative sequence; EGAppendixA.2 relative-base passage.

#### Relative Cartier class vanishing obligation

Declaration: SemisimpleAlgebrasPartII:SA.4/relative-class-vanishing-input. Kind: theorem.

In EGAppendixA.2, with perfect characteristic-p k, a smooth projective W₂-liftable Z, V=Z′_a and T=Spec k[t]/(t−1)^p, prove Φ(m*θ−r*θ)=0 on V×T using a valid relative argument. This is a target with the recorded source gap, not an assumed established theorem.

Construction or proof: The difference restricts to zero at t=1, but that does not locate its support on the cotangent zero-section. Supply a valid cohomological vanishing or an actual splitting bimodule on all V×T. The OV bounded zero-section splitting is only an input after a valid restriction/transport argument. The relative exact-sequence comparison is a separate prerequisite; singular V×T does not inherit smooth exactness without the supplied ambient restriction diagram.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/cartier-boundary-naturality, SchemeAndStackFoundations:key/scheme-brauer.

Source: EG PropositionA.2 proof, pp40–41; invalid support implication remains a gap.

#### Chosen relative Morita equivalence

Declaration: SemisimpleAlgebrasPartII:SA.4/relative-morita-refinement. Kind: comparison.

With a W₂-lift and an actual compatible splitting of m*D⊗(r*D)^op on V×T, construct the O-linear equivalence between their module categories, carrying its chosen evaluation and identity-fibre comparison. Bare equality of Brauer classes does not choose this splitting or coherence.

Construction or proof: Import the OV2.9 lift-dependent bounded splitting and BB3.11/3.12 explicit bimodule comparisons from the Cartier successor. Transport the splitting through the proven relative class-vanishing comparison and retain the chosen bimodule. Apply the geometric Morita unit/counit and verify restriction at t=1 and composition coherence. These transport/coherence steps remain supplier obligations.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/relative-class-vanishing-input, SemisimpleAlgebrasPartII:SA.2/sheaf-morita, SchemeAndStackFoundations:key/scheme-brauer.

Source: BBv2 §2.2 equivalence as splitting of A⊗B^op; Proposition3.11/Corollary3.12, p11; EGRemarkA.3.

Coverage: planned. Remaining: Supply the exact relative Cartier interfaces and chosen OV/BB bimodules, prove relative-class-vanishing-input through a valid argument, and verify lift-dependent restriction/coherence.

## Native validation and review boundary

The whole suggested file is uncompiled because the existing Tau Ceti build is at a different revision and cannot certify its five imports. No dependency build, project setup, cache download or language server was started. The canonical Mathlib-only extraction contains admitted planning signatures and tests; its independent checked proof source constructs the actual restricted column action and checks its tower, finiteness, dimension and cancellation, plus the distinct monic polynomial counterexample. These receipts have different scopes. The definitive packet ledger lists every unrepresented geometric or H² signature and its API/tests, without proxy proposition fields. Exact current receipts and recoverable public artifacts are in the handoff. Historical affine evidence remains at its immutable cited commit.

The target-level plan stops at55 nodes because every stage target is represented. All five stages require follow-up implementation and mathematical review as listed above. The general all-finite arithmetic application, generic Morita and sheaf suppliers, full symmetric coefficients, relative Cartier class vanishing and chosen categorical coherence remain precise review obligations.

## Public sources

- [Central Simple Algebras and Galois Cohomology](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Philippe Gille and Tamás Szamuely. Accessed 2026-10-04: 2006 §4.5 pp100–106, including complete proof4.5.16; selected §4.4 comparison statements. Primary decomposition is out of the target dependency chain and is not newly planned.
- [Errata and additional comments](https://pagine.dm.unipi.it/tamas/erratams.pdf), Tamás Szamuely. Accessed 2026-10-04: December 4, 2020: p101 correction and p105 Saltman correction
- [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Olivier Benoist. Accessed 2026-10-02: §0.1, printed p63: definitions and general divisibility; the surface theorems are outside this continuation
- [Rigid connections and F-isocrystals](https://arxiv.org/pdf/1707.00752v4), Hélène Esnault and Michael Groechenig. Accessed 2026-10-04: v4 Theorem2.17/Remark2.18 pp13–14, including complete local Morita proof; AppendixA.2–A.3 pp40–41.
- [Nonabelian Hodge theory in characteristic p](https://www.numdam.org/item/10.1007/s10240-007-0010-z.pdf), Arthur Ogus and Vadim Vologodsky. Accessed 2026-10-04: Published Corollary2.9, Theorem2.8 context pp33–34; §4.2 exact sequence and Proposition4.2/4.4 pp85–88; no full-paper reading.
- [Geometric Langlands correspondence for D-modules in prime characteristic: the GL(n) case](https://arxiv.org/pdf/math/0602255v2), Roman Bezrukavnikov and Alexander Braverman. Accessed 2026-10-04: arXiv math/0602255v2, 4Dec2006; §2.2 and §3.10–3.12, pp3,11; no published/preprint identity certification.
