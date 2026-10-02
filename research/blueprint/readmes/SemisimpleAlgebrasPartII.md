# Semisimple algebras, Artin–Wedderburn, and the structure of their modules, Part II

This continuation starts with the parent roadmap’s Layer6. Its arithmetic branch studies the index of a Brauer class, the finite extensions which split it, and its period. Its geometric branch studies modules over Azumaya algebras, their scheme-theoretic support, and characteristic coefficients which descend through Morita equivalences. The two branches share Brauer-class conventions, but neither depends on completion of the other. Five layers make this separation explicit. The Cartier application uses the geometric branch and retains the unresolved source argument on a nilpotent relative thickening.

This is an initial partial checkpoint. All five stages are partial, all implementation statuses are unchecked, and the outstanding native constructions and source inputs are named below. Passing the packet checker checks structure and references; it does not prove the statements. In particular, the single checked affine support calculation does not establish sheaf Morita theory, period-index arithmetic or the relative Cartier application.

## Conventions and the starting library

A field is nontrivial. A central simple algebra is finite-dimensional over its centre K. The degree is the square root of its K-dimension, while the index is the degree of its central division representative. These agree for a division algebra, but differ for a positive matrix algebra. The Brauer identity is written multiplicatively as 1. Its period is Mathlib’s existing orderOf: positivity is proved from a finite-order witness, because natural order is zero on an arbitrary infinite-order group element. No new group order is defined.

The arithmetic prototypes use the same universe for K, its algebra representatives and the extension fields. This matches the pinned Brauer CommGroup and base-change homomorphism. The minimum/gcd characterization quantifies over actual finite field extensions in that universe; it is not a finite list of guessed splitting degrees. Scalar extension for index divisibility need not be separable. Corestriction and the Galois cohomology argument require finite separable extensions and chosen closure embeddings until independence is proved.

The reviewed library audit contains no row for either this new roadmap or its parent. This absence is recorded, rather than converted into a missing-library verdict. Actual declarations were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. The parent README predates several built exports. Algebra index, positive-matrix invariance, division representatives, scalar extension of Brauer classes, finite index-degree splitting fields and finite separable splitting fields all exist and are reused. The last two existence theorems do not state their conjunction. A separable splitter of index degree remains an exact parent-owned input to the period proof.

On schemes, the one shared carrier and Brauer definition belong to SchemeAndStackFoundations:key/scheme-brauer. That reserved key has not yet been written. This roadmap imports it; it does not construct a competing sheaf Azumaya or scheme Brauer definition. Affine IsAzumaya, the finite nonempty matrix Azumaya instance and the actual matrix module-category equivalence are already in Mathlib. General projective-generator Morita structure is imported from GeneralAlgebraicKTheory:K.7, whose existing moritaStructure API needs finer native declarations. Its source uses right modules; the supplier must provide the opposite-ring comparison needed for the left-module convention here.

For an ideal sheaf I_Y and an A-module M, scheme-theoretic support on Y means I_Y·M=0. Topological support in the underlying closed set is weaker and is insufficient over nilpotents. A splitting module P is a finite locally free generator with specified A≅End(P). Its local rank is positive; on a disconnected base the rank may differ between components. Tensoring P with an invertible sheaf changes the splitting module and its transition functor. The chosen evaluation, unit and counit are data: arbitrary splitting modules are not uniquely isomorphic.

## Source scope and corrections

The fresh source reading covers Benoist §0.1, Gille–Szamuely’s 2006 §4.5 on printed pp100–105, the author’s December4,2020 errata, and Esnault–Groechenig arXiv v4 Theorem2.17/Remark2.18 and AppendixA.2–A.3. Both binding route briefs and all seven item records were read. The published EG PDF returned403; no equality of its text with the preprint is certified. OV07 and BB07 are required cited inputs which have not been freshly acquired. The complete papers and the complete book have not been read, and no full-source coverage claim is made.

The author’s correction to Gille–Szamuely p101 repairs the separable index-degree argument. A polynomial with distinct roots cannot also be irreducible over the algebraic closure when its degree exceeds one. Instead, its quotient algebra embeds in the division algebra: after scalar extension the map is the diagonal-algebra embedding. The finite commutative subalgebra is a domain, hence a field; the distinct roots supply separability. The corrected argument must be used by the parent supplier. The author’s separate Saltman correction changes a prime-to-characteristic bound to index dividing period squared; that stronger period-index problem is outside the general arithmetic targets here.

Two geometric source problems remain explicit. On F₂[ε]/ε², T and T+ε are distinct monic polynomials with equal squares. Thus a Frobenius power relation cannot provide uniqueness of a monic root over arbitrary nonreduced bases. The replacement is descent of actual Morita characteristic coefficients, with a further commuting-Higgs refinement still required. In AppendixA.2, vanishing on t=1 does not imply support on the zero-section: a nilpotent parameter multiplied by a nonzero fibre coordinate still survives away from that section. No repaired proof of the relative Brauer-class vanishing is certified. The categorical refinement in A.3 additionally needs chosen bimodule and coherence data; equality of Brauer classes alone does not choose an equivalence.

## Layer contracts

Each item below is one planned declaration. A prerequisite beginning with mathlib or tauceti names a read statement at the exact pin; a stage prerequisite names a recorded supplier request. Promised keys remain unresolved. API items used by another node are promoted into separately listed declarations. The three new definitions and two constructions carry twenty acceptance tests in total; the native file represents the field interfaces and the affine support boundary, while the missing geometric and cohomological carriers have an explicit omission ledger.

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

Prerequisites: mathlib:BrauerGroup, tauceti:TauCeti.Algebra.index, SemisimpleAlgebrasPartII:SA.0/index-brauer-congr, tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing, tauceti:TauCeti.BrauerGroup.nonempty_algEquiv_of_mk_eq_mk, tauceti:TauCeti.Algebra.index_eq_deg_of_divisionRing.

Source: GS §4.5.

The interface serves Benoist §0.1: Provides index of a brauer class for the consuming declarations in this layer and its successors..

- classIndex_mk (simp): classIndex([A])=index_K(A).
- classIndex_pos (characterisation): For every α, 0<classIndex α.
- classIndex_eq_one_iff (characterisation): classIndex α=1 iff α=1.
- classIndex_baseChange_dvd (functoriality): For every field extension L/K, classIndex(α_L) divides classIndex α.

Acceptance tests:

- matrix_identity: classIndex of any positive matrix algebra over K is 1, even for M₂(K) of degree2.
- finite_field: Every class over a finite field has index1.
- division_representative: For a central division algebra D of degree d, classIndex([D])=d; a nonsplit quaternion division example has value2.
- zero_excluded: No Brauer class has index0; the zero-dimensional matrix ring is not a CSA.

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

The interface serves Benoist §0.1: Provides finite splitting degrees for the consuming declarations in this layer and its successors..

- mem_splittingDegrees (characterisation): d belongs iff there is a finite extension L/K of degree d killing α.
- one_mem_splittingDegrees_iff (characterisation): 1 belongs iff α=1.
- splittingDegrees_nonempty (structure): Every α has a finite splitting degree.
- splittingDegrees_positive (characterisation): Every member is positive.
- classIndex_mem_splittingDegrees (example): The class index itself belongs.

Acceptance tests:

- identity_degree_one: 1 belongs for the identity class, using K/K.
- zero_degree: 0 is never a member, since extensions are nontrivial fields.
- nontrivial_no_degree_one: For α≠1, degree1 cannot split α.
- quaternion_degree_two: A quaternion division class split by a quadratic extension has degree2 in the set.

#### Division-module splitting dimension

Declaration: SemisimpleAlgebrasPartII:SA.0/division-module-dimension. Kind: lemma.

Let D be a central division K-algebra of degree d>0 and L/K finite with L⊗_K D≃ₐ[L]M_d(L). The column module V=L^d admits a finite-dimensional left D-module structure compatible with its K-action, and dim_K V=d²·dim_D V.

Construction or proof: Restrict the matrix column action along D→L⊗D and the chosen matrix equivalence; explicitly verify scalar-tower compatibility. A K-spanning set also D-spans V, so V is finite-dimensional over the division ring D. The module structure and its finite/free instances are a genuine construction obligation. Use the free-module tower law and dim_K D=d². This is an authored proof for inseparable extensions as well, rather than an attribution of that strengthening to GS4.5.11.

Prerequisites: mathlib:Module.finrank_mul_finrank, tauceti:TauCeti.Algebra.index_eq_deg_of_divisionRing, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields, tauceti:TauCeti.Algebra.deg_sq.

Source: GS 4.5.3, 4.5.8; authored dimension strengthening.

#### Index divides every splitting degree

Declaration: SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree. Kind: theorem.

For every field K, α∈Br(K), and finite extension L/K with α_L=1, classIndex α divides dim_K L. No separability hypothesis.

Construction or proof: Choose the existing central division representative D. The class-kernel theorem gives a splitting matrix equivalence after scalar extension. Apply division-module-dimension to obtain [L:K]·d=r·d². Cancel the positive d to obtain [L:K]=r·d. Do not cancel the square first and infer a false divisibility.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/class-index, SemisimpleAlgebrasPartII:SA.0/class-index-positive, SemisimpleAlgebrasPartII:SA.0/division-module-dimension, tauceti:TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing, tauceti:TauCeti.BrauerGroup.mk_mem_ker_baseChange_iff_isSplittingField.

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

Construction or proof: Apply the existing index-degree attainment theorem to a representative of α_L to choose M/L of degree classIndex(α_L). Composition of native algebra instances gives M/K finite; the existing splitting-field tower law makes M split α. Use index-divides-splitting-degree and the field tower degree formula.

Prerequisites: SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree, tauceti:TauCeti.Algebra.exists_isSplittingField_finrank_eq_index, mathlib:Module.finrank_mul_finrank, tauceti:TauCeti.BrauerGroup.baseChange, tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-6-the-brauer-group-and-splitting-fields.

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

This stage remains partial: Elaborate division-column module instances and all native field signatures; complete supplier splitting tower checks and all-finite proof.

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

The interface serves Benoist §0.1: Provides corestriction of brauer classes for the consuming declarations in this layer and its successors..

- brauerCorestriction_res (compatibility): cor(α_L)=α^[L:K].
- brauerCorestriction_comp (functoriality): Corestriction is transitive in finite separable towers.
- brauerCorestriction_self (simp): Corestriction for K/K is identity.
- brauerCorestriction_embedding (extensionality): Compatible changes of chosen closure embedding give the same map.

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

This stage remains partial: Close separable index-degree, all-class comparison naturality, units coefficient transfer, Sylow fixed-field and relative p-group chain.

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

The interface serves Esnault–Groechenig Theorem2.17 / AppendixA.3: Provides morita equivalence from a splitting module for the consuming declarations in this layer and its successors..

- sheafMorita_unit (universal-property): Hom_A(P,P⊗N)≅N naturally.
- sheafMorita_counit (universal-property): P⊗Hom_A(P,M)≅M naturally.
- sheafMorita_restrict (functoriality): The functors and adjunction data commute with restriction to opens.
- sheafMorita_matrix (compatibility): For P=O_X^n, n>0, the affine specialization is the pinned matrix equivalence.

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

This stage remains partial: Import native generic projective-generator theory and shared scheme-Brauer/QCoh carriers; elaborate coherent and support descent.

### SA.3. Characteristic invariants by Morita descent

For an A-linear endomorphism on an Azumaya module whose inverse Morita module is locally free, define its characteristic polynomial on splitting covers. Compare splitting modules by an invertible sheaf with specified evaluation and prove line-twist invariance; descend coefficient sections over nonreduced schemes. Extend this single-endomorphism model to the commuting Higgs tuple required by EG2.17 and its rank/power relation. The Frobenius-root uniqueness shortcut is false and is excluded.

Dependencies: SemisimpleAlgebrasPartII:SA.2, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2.

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

The interface serves Esnault–Groechenig Theorem2.17 / AppendixA.3: Provides morita characteristic polynomial for the consuming declarations in this layer and its successors..

- moritaCharpoly_matrix (compatibility): For A=M_n(R), M=R^n⊗N and t=id⊗u, the value is charpoly u.
- moritaCharpoly_changeSplitting (extensionality): Compatible replacement of splitting generator leaves the polynomial unchanged.
- moritaCharpoly_baseChange (functoriality): Pullback carries the polynomial to the coefficient pullback for finite locally free inverse modules.
- moritaCharpoly_degree (data): On a rank-r locus it is monic of degree r.

Acceptance tests:

- rank_one_scalar: For rank1 inverse module and scalar b, the polynomial is T−b.
- zero_rank: For M=0 the polynomial is 1, of degree0.
- nonreduced_scalar: Over F₂[ε]/ε², rank1 scalar ε has polynomial T−ε, distinct from T although their squares agree.
- line_twist: Replacing P by P⊗L yields the same polynomial, using the specified transition equivalence.

Atlas planet: Morita characteristic polynomial.

#### Frobenius root boundary

Declaration: SemisimpleAlgebrasPartII:SA.3/frobenius-root-boundary. Kind: lemma.

In R=F₂[ε]/ε², ε≠0 and ε²=0. Thus the distinct monic polynomials T and T+ε have the same square; a monic Frobenius root is not unique on a nonreduced base.

Construction or proof: Use the native TrivSqZeroExt(F₂,F₂) model and its pure nilpotent element. Verify nonzero by its second projection and square zero by inr_mul_inr. Compute (T+ε)²=T² in characteristic2. The compiled native tests check the two ring facts; the polynomial equality still needs its own native example.

Prerequisites: mathlib:TrivSqZeroExt.inr_mul_inr.

Source: EG Theorem2.17 proof, pp13–14; source issue E2.

This stage remains partial: Supply étale Picard transitions, coefficient descent and Higgs tuple refinement; prove native polynomial nilpotent example.

### SA.4. Cartier forms and relative Brauer comparison

Apply the Cartier-specific four-term units/closed-form exact sequence to obtain the two-step Brauer boundary, with additivity and relative base-change naturality. Import [D]=Φ(θ) and chosen W₂ splittings from the Cartier-flow owner. For perfect characteristic-p smooth projective Z and the spectral cover V, compare m*D and r*D on V×Spec k[t]/(t−1)^p; identify the missing relative class-vanishing input in EG AppendixA.2 and the coherent categorical refinement in A.3. These targets are partial until that gap and the OV07/BB07 inputs are closed.

Dependencies: SemisimpleAlgebrasPartII:SA.2, SemisimpleAlgebrasPartII:SA.3, SchemeAndStackFoundations:SF.2.

#### Cartier forms and Azumaya classes

Declaration: SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison. Kind: comparison.

For a smooth characteristic-p scheme in the exact Cartier setup of EG(A.3), the two-step étale boundary Φ:H⁰(Ω¹)→H²(G_m) is additive and natural for morphisms respecting that relative exact sequence. The differential-operator class satisfies [D]=Φ(θ) only through the Cartier-flow supplier’s OV07 comparison.

Construction or proof: Import the actual relative four-term exact sequence of units, dlog, closed forms and w*−C; a short exact sequence with the same names is insufficient. Use SF.2’s connecting-map construction twice, with its explicit middle image sheaf. Import the specific OV07 Proposition4.4 identification [D]=Φ(θ); it is not supplied merely by generic CR.1 crystals. Relative functoriality requires a morphism of the full exact sequence.

Prerequisites: SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:key/scheme-brauer.

Source: EG AppendixA.2, equation(A.3); OV07 Proposition4.4 not freshly acquired.

#### Relative Brauer class comparison

Declaration: SemisimpleAlgebrasPartII:SA.4/relative-brauer-equality. Kind: application.

Let Z/k be smooth projective, k perfect of characteristic p>0, with a W₂(k)-lift, and V=Z′_a. On T=Spec k[t]/(t−1)^p let m be cotangent scaling and r the projection. The target is [m*D]=[r*D] on V×T, with an equivalence of module categories carrying chosen splitting data when a refinement is established.

Construction or proof: By cartier-brauer-comparison the class difference is Φ(m*θ−r*θ). The published proof’s inference from vanishing on t=1 to support on the zero-section is invalid as stated; retain a named unresolved Brauer-class vanishing input for this exact relative thickening. If that input is proved, the equality follows. A chosen Morita bimodule/evaluation coherence is needed to obtain the categorical refinement of RemarkA.3. No canonical equivalence is inferred from equality of classes alone.

Prerequisites: SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison, SchemeAndStackFoundations:key/scheme-brauer, SemisimpleAlgebrasPartII:SA.2/sheaf-morita.

Source: EG PropositionA.2 and RemarkA.3, pp40–41.

This stage remains partial: Freshly read OV07 and BB07, decompose the relative Cartier sequence and repair A.2 class vanishing with coherent categorical data.

## The two chains requiring the most care

For splitting-degree divisibility, choose the division representative D of degree d. A splitting equivalence over L acts on the d-dimensional column module V=L^d. Restrict that action to D. Its K-action must agree with the given field scalar action, and a K-spanning set gives a D-spanning set. Since D is a division ring, the finite module is free. The tower formula then compares [L:K]·d with dim_K(D)·dim_D(V)=d²·r. Cancelling the positive d yields d dividing [L:K]. This argument works for inseparable extensions and is an authored strengthening of the separable book statement. The compatible action, finiteness and free instances are unresolved native obligations; they are not asserted by an arbitrary arithmetic hypothesis.

For prime support, first prove finite positive period and period dividing index. If a prime p does not divide the period, take a finite Galois splitter M/K and the fixed field E of a p-Sylow subgroup. Then [E:K] is prime to p. The restricted Brauer class lies in the relative group of the p-group extension M/E; the comparison with finite-group H² and positive-degree annihilation make its order a p-power. Restriction also makes that order divide the original period, so it is trivial. Index divisibility for E now excludes p from the index. The relative comparison, Sylow degree and units-coefficient annihilation need the stated suppliers. A trivial F₂ coefficient adapter cannot prove this for general classes.

## Native prototype and continuation

The field part uses actual CSA, BrauerGroup, TauCeti.Algebra.index, scalar extension, TensorProduct, Matrix, Subgroup.zpowers, finite-dimensional modules and natural group order. It has no opaque arithmetic proposition package. Twenty-two packet declarations have native signatures, while the two concrete boundary nodes have partial native examples. Eleven declarations remain unrepresented because their genuine sheaf or H² inputs have not been supplied. Their twelve API items and twelve tests are listed in the packet ledger. The field signatures have not been elaborated: all four required Tau Ceti compiled imports are absent from the existing pinned build. No library build, project setup, cache retrieval or language server was run.

The separate affine proof prototype preserved at immutable commit3895cfa elaborated with zero errors and zero warnings. It checks the nonempty-product ideal-support equivalence, three matrix-size examples including the empty boundary, the nonzero square-zero element over F₂, and two Z/4 support computations. The separate proof prototype’s named matrixSupport theorem has printed axioms omitting the admission axiom. This check concerns the product module and the finite-ring computations; it does not certify the uncompiled field signatures, a full sheaf support theorem, or the characteristic polynomial boundary as a named theorem. Exact source and log hashes are in the packet and handoff.

Continue at the division-column action and separable index-degree export, then the units comparison and Sylow relative chain. In parallel mathematical order, refine the generic Morita supplier, obtain the shared scheme-Brauer key, and write native sheaf tensor/Hom/support and coefficient-descent declarations. Read OV07 and BB07 before decomposing the Cartier-specific exact sequence. The relative AppendixA.2 class vanishing must be established by a valid argument before any final equality or categorical equivalence can be marked closed.

## Public sources

- [Central Simple Algebras and Galois Cohomology](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), Philippe Gille and Tamás Szamuely, Cambridge Studies in Advanced Mathematics101, 2006. Read2026-10-02: 2006 edition §4.5, printed pp100–105; proof of 4.5.16 not completely read.
- [Errata and additional comments](https://pagine.dm.unipi.it/tamas/erratams.pdf), Tamás Szamuely, Author errata dated December4, 2020. Read2026-10-02: December 4, 2020: p101 correction and p105 Saltman correction.
- [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Olivier Benoist, Publications Mathématiques de l’IHÉS130 (2019), 63–110. Read2026-10-02: §0.1, printed p63: definitions and general divisibility; the surface theorems are outside this continuation.
- [Rigid connections and F-isocrystals](https://arxiv.org/pdf/1707.00752v4), Hélène Esnault and Michael Groechenig, arXiv:1707.00752v4, June1, 2020. Read2026-10-02: arXiv v4, June 1, 2020; Theorem2.17 and Remark2.18, pp13–14; Appendix A.2–A.3, pp40–41.

## Suggested-file protocol correction

Under PROTOCOL13 every current suggested definition, theorem and example body is admitted. The current affine signature extraction elaborates with zero errors, eight admitted-body warnings and zero other warnings; seven examples remain. The earlier actual proofs and their receipt are retained at [immutable commit3895cfa](https://github.com/CBirkbeck/tauceti-explorer/blob/3895cfae9312599fb6dc1546fdee537d5bf14e36/research/blueprint/suggested/SemisimpleAlgebrasPartII.lean). Its proof receipt is distinct from the current sketch, whose full Tau Ceti file remains uncompiled. This correction changes prototype bodies and test-kind metadata, with all mathematical statements and dependency records preserved.
