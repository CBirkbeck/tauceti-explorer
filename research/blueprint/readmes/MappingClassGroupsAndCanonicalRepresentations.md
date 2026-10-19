# Mapping class groups and canonical representations of surface groups

The main target is finite monodromy for an actual complex surface-group representation whose conjugacy class has finite mapping-class orbit and whose rank satisfies r²<g+1. The plan also proves the higher Prym subrepresentation bound, derives arithmetic finite monodromy for the generic pointed curve over Q, and gives examples that distinguish the hypotheses. It follows Landesman–Litt with corrected statements, and imports the existing topology, pointed moduli, cohomology and Hodge machinery.

This is a target-level roadmap, with one node per definition, construction or key theorem. The packet records 62 targets across ten layers. All ten layers are **planned**; none is closed. A complete design pass means that every target has a dependency chain ending in a pinned declaration, an existing supplier, a precise request or an explicit gap. It does not mean that the mathematics is implemented or that the supplier proofs have been completed. Every implementation status is unchecked.

The reader is definitive. The suggested Lean file follows the streamlined shape in WORKERS.md: light real-bodied definitions and end theorems that can be stated using the pins. It is not an implementation of this roadmap. No mock surface, mapping-class, moduli, sheaf or Hodge carrier is introduced merely to make signatures elaborate.

## Conventions and theorem ranges

- Σ(g,n) is an oriented connected genus-g surface with n punctures and no boundary; Σ(g,b,p) has b boundary circles and p punctures. Generic surface and mapping-class objects are imported from MordellLawrenceVenkatesh:LV.5, retaining its pending transfer to topology owners.
- PMod fixes ordered punctures and boundary pointwise. Mod may permute punctures. Finite orbit for the pure or full orientation-preserving group is equivalent by finite index. The based additional mark gives an automorphism action; forgetting it gives an outer action.
- Conjugacy always means actual GL conjugacy of representations, including extensions. A character/GIT quotient is used only in its semisimple range. Rank zero is allowed in the main finite-image theorem; positive-rank determinant and central-isogeny arguments assume r>0.
- A versal family means dominant **étale** over the ordered smooth moduli stack. Family, Birman and Teichmüller comparisons use 2g−2+n>0. The rank-one unpointed torus is handled separately, and its arithmetic/isomonodromy comparison is a recorded source obligation.
- Local coefficients use the existing fundamental-groupoid functor and monodromyRepresentation. Compare path multiplication before converting actions; on cohomology inverse pullback gives the left action compatible with homology pushforward. Generic locally constant sheaves and Rπ_* are supplied, not axiomatized here.
- Open-cover H¹ and compact-cover H₁ are distinct. An isotypic component is the whole σ⊗Hom_H(σ,V), not just the multiplicity space. Track σ∨ when dualizing; the compact oriented duality comparison is equivariant.
- A unitary representation is unitarizable, equivalently its image has compact closure. For GL the adjoint coefficient is the trace-zero Lie algebra, of rank r²−1 for r>0. For PGL use its adjoint Lie algebra. Strong rigidity means ordinary H¹=0; middle-extension rigidity also requires its boundary conventions.
- The generic arithmetic moduli point is over M(g,n)_Q. The field is finitely generated of characteristic zero. A chosen Qbar_ℓ≃C is abstract; no preservation of topology under that isomorphism is assumed. Density is used back in the original ℓ-adic topology.
- Arithmeticity has the smaller rank range r<√(g+1). The wider r<2√(g+1) geometric/Hodge characterization excludes arithmeticity. The precise integral-realization convention is an open supplier/source gate.
- Residual surjections exist for every prime in the stated surface range. Nonlifting is proved only outside the primes dividing a uniform Jordan exponent. Nonflatness does not imply failure of the complete-intersection property.

## Existing work and build order

The reviewed library-coverage catalogue has no entry for this new roadmap. It does record built or partly built Hodge material; no generic pure, polarized or rational mixed-Hodge carrier is re-planned. At the pins, local coefficients and monodromy, generic module isotypic components, the socle and its semisimplicity, unitary complete reducibility, compact unitarization, the degree-square identity and bounded-embedding finiteness are already present. The declarations below were read, rather than inferred from names.

The audit also screened the current read-only upstream roadmaps, including the nine additions absent from the atlas snapshot. AlgebraicTopology and Completed/UniversalCovers supply the nearby style and topology contracts. The current CharacterTheory and InductionRestriction roadmaps distinguish finite-group results from the arbitrary-group extension and Jordan inputs requested here. No generic covering-space, surface, group-algebra socle or finite-group character theory is a new target of this roadmap.

The acyclic order is: common surface topology and pointed moduli; C.0–C.2; the shared Art_C deformation extension and Hodge H.1–H.5; then C.3–C.8. In particular H.4 may use C.2/artin-decomposition but must not use the final canonical finiteness theorem. C.9 tests the ranges. The request ledger below is part of the plan: a stage citation does not assert that the supplier has already completed the requested theorem.

| Layer | Targets | Main output |
|---|---:|---|
| C.0 — Finite orbits and surface monodromy | 5 | Define actual finite conjugacy orbits and punctured étale-versal families. Compare the ordered moduli orbifold with pure mapping classes, and prove the versal-family fundamental-group sequence and fibral finite-orbit property. Generic surfaces, presentations, twists, and Birman sequences are imported. |
| C.1 — Projective realization | 4 | Establish finite-orbit operations and point-pushing restriction, rank-one and determinant finiteness for positive genus, and the canonical actual-intertwiner projective extension of an irreducible representation. |
| C.2 — Linear lifting and relative structure | 5 | Kill a specified finite abelian obstruction by dominant étale refinement, lift the projective extension with its fibre prescribed, realize irreducible representations on versal families, prove the arbitrary-group normal-restriction lemma, and construct the relative Artinian unitary decomposition. |
| C.3 — Higher Prym representations | 9 | Define open-cover cohomological and compact-cover homological Prym actions and the Putman–Wieland predicate. Construct marked versal cover families from the Hurwitz supplier, reduce boundary components, identify cover cohomology, and prove the subrepresentation rank bound and its small-degree and small-order consequences. |
| C.4 — Unitary rigidity and integrality | 6 | Use Artinian invariant vanishing to prove strong rigidity of fibre-irreducible low-rank total representations. Import twist quasi-unipotence and compactification, deduce projective and linear integrality, and prove finite monodromy for low-rank unitary MCG-finite representations using every coefficient conjugate. |
| C.5 — Constancy and semisimple finiteness | 3 | Apply the shared abstract-group deformation criterion to fibre-unitary formal families. Prove conjugacy constancy in connected algebraic fixed-determinant families and semisimple finite monodromy, exposing the nonabelian-Hodge-to-algebraic-family bridge as a supplier obligation. |
| C.6 — General finiteness and free groups | 9 | Prove characteristic-socle transport, the low-rank extension splitting theorem, and finite monodromy for all MCG-finite representations of rank r with r²<g+1. Deduce fibral, algebraic-isomonodromy, free-group, Nielsen-tuple, and characteristic-quotient consequences. |
| C.7 — Generic arithmetic curves | 6 | Define arithmetic finite Galois orbit, compare it with finite topological mapping-class orbit on a curve generic over M(g,n) over Q, and prove arithmetic finite monodromy. Formulate the four-way geometric/Hodge equivalence and its wider three-way range with a precise integral-realization supplier contract. |
| C.8 — Residual lifts and nondensity | 6 | Define residual arithmetic lifts. Prove the uniform Jordan-word obstruction, nonliftability for sufficiently large residual characteristic, explicit surjections, and nondensity on hyperbolic surfaces. State only the justified conditional nonflat/nonsmooth deformation-ring consequence. |
| C.9 — Examples and range checks | 9 | Construct the surface and free-group abelianization unipotent examples, plan the three Morita/augmentation examples with source gates, record genus-one and rank-two classifications and higher-rank existence certificates. Keep the source’s classification, rigidity, rank-minimum and free-group conjectures explicitly open. |

## Pinned baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The word built below refers only to these declarations, not to any planned application.

- [`tauceti:TauCeti.LocalCoefficientSystem`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean): The existing fundamental-groupoid functor carrier for local coefficients; no new local-system carrier is planned.
- [`tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean): Monodromy on the actual fibre, with the library path-composition convention.
- [`tauceti:TauCeti.LocalCoefficientSystem.pullback`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean): Pullback by a continuous map, compatible with monodromy.
- [`tauceti:TauCeti.socle`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/SimpleModule/Socle.lean): The largest semisimple submodule, as a supremum of simple submodules.
- [`tauceti:TauCeti.isSemisimpleModule_socle`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/SimpleModule/Socle.lean): Semisimplicity of the existing socle.
- [`tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean): A finite-dimensional unitary representation is semisimple, without assuming the source group finite.
- [`tauceti:TauCeti.ContRepresentation.exists_isUnitary_congr`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/UnitaryModel.lean): Continuous representations of compact groups admit a unitary model; apply to the compact closure of the image.
- [`mathlib:NumberField.Embeddings.finite_of_norm_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean): Algebraic integers in a fixed number field bounded at every complex embedding form a finite set.
- [`mathlib:groupCohomology.H1InfRes_exact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean): Exactness at the middle of inflation-restriction in degree one; not a full LHS spectral sequence.
- [`mathlib:Representation.IsIrreducible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Irreducible.lean): The simple group-algebra-module notion of irreducibility.
- [`mathlib:FreeGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): The existing free group as the quotient of words by reduction; no free-group carrier is planned.
- [`mathlib:FreeGroup.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): The equivalence from generator assignments to group homomorphisms, used for the Nielsen tuple dictionary.
- [`mathlib:Matrix.GeneralLinearGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The existing unit group of the square-matrix ring, including rank zero.
- [`mathlib:isotypicComponent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/SimpleModule/Isotypic.lean): The existing sum of all submodules isomorphic to the given simple module; specialize to the H-group algebra.
- [`tauceti:TauCeti.sum_characterDegree_sq_eq_card`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/Table.lean): The natural-number degree-square identity for the enumerated irreducible characters of a finite group over an algebraically closed field with invertible group order.

## Layer targets

Every target below has a stable packet id. Definition and construction APIs are proposed declaration names; their tests are mathematical examples to implement once the actual carriers are supplied. A test is not silently replaced by an assumption in the suggested file.

## C.0. Finite orbits and surface monodromy

Define actual finite conjugacy orbits and punctured étale-versal families. Compare the ordered moduli orbifold with pure mapping classes, and prove the versal-family fundamental-group sequence and fibral finite-orbit property. Generic surfaces, presentations, twists, and Birman sequences are imported.

**Stage dependencies:** `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.0`; `StableReductionPartII:MC.2`; `StableReductionPartII:MC.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.0/finite-orbit — MCG-finite representations

**Definition.** For an oriented connected finite-type surface S=Σ(g,n), a rank-r complex representation ρ is MCG-finite when its actual GL_r(C)-conjugacy class has finite orbit under orientation-preserving mapping classes acting through Out(π₁S). Use pure mapping classes for ordered punctures; full versus pure finiteness is equivalent because their index is finite. No semisimplification is taken.

**Atlas planet:** MCG-finite representations.

**Construction or proof:**

1. Use conjugacy of homomorphisms as an equivalence relation; precomposition by an inner automorphism induces conjugation by ρ of that element.
2. Descend the outer action to classes; identify finite orbits with finite-index stabilizers.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `mathlib:Representation.IsIrreducible`.

**Uses that determine the API:**

- C.1 projective realization: The stabilizer gives actual GL intertwiners.
- C.6 main theorem: The input is finite orbit of possibly nonsplit representations.

**API:**

- `mcgFinite_iff_stabilizer` (characterisation): MCG-finiteness is equivalent to the stabilizer of the actual conjugacy class having finite index.
- `mcgFinite_conjugate` (compatibility): Conjugate homomorphisms have the same finiteness predicate.
- `mcgFinite_pure_iff` (equivalence): Pure and full orientation-preserving mapping classes give equivalent predicates.
- `inner_precompose_conjugate` (simp): Precomposition by conjugation by x is conjugation of ρ by ρ(x).

**Discriminating unit tests:**

- `finiteOrbit_trivial` (degenerate): The trivial representation, including rank zero, has a one-element orbit.
- `finiteOrbit_finiteImage` (characterisation): A finite-image representation of a finitely generated surface group has finite orbit: only finitely many maps into its fixed finite image.
- `finiteOrbit_not_semisimplification` (non-example): On a closed genus-two surface let f(a₁)=1 and f(b₁)=f(a₂)=f(b₂)=0. The unipotent representation γ↦[[1,f(γ)],[0,1]] has infinite actual conjugacy orbit under mapping classes, while its semisimplification is trivial with singleton orbit.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Definition 1.1.1, p.2; §2.1, pp.12–13.

### C.0/versal-family — Punctured versal families

**Definition.** A punctured étale-versal (g,n)-family is a smooth proper connected genus-g curve C→M over a connected smooth complex variety, with n ordered disjoint sections, whose classifying map M→M(g,n) is dominant and étale; C° is the complement of those sections. In family arguments impose 2g−2+n>0. The word versal here includes étaleness.

**Atlas planet:** Punctured versal families.

**Construction or proof:**

1. Import the common pointed-curve moduli carrier, not a second moduli stack.
2. Define the open complement and the dominant étale condition on the supplied classifying map.

**Direct prerequisites:** `StableReductionPartII:key/moduli-curves`; `StableReductionPartII:MC.2`; `StableReductionPartII:MC.4`.

**Uses that determine the API:**

- HodgeStructuresPartII:H.4: Supplies precisely the base families of the rank theorem and Artin vanishing.
- C.2 linear realization: Étale refinements remain in the same family class.

**API:**

- `versalFamily_puncturedFiber` (projection): The fibre of C° is the pointed curve with the section values removed.
- `versalFamily_etaleBaseChange` (functoriality): Connected dominant étale base change preserves the family and ordered sections.
- `versalFamily_marking` (compatibility): A chosen analytic fibre marking induces the surface group used by the existing local-coefficient monodromy functor.

**Discriminating unit tests:**

- `versal_level_family` (compatibility): The universal curve on a connected fine level cover is an example when the level supplier supplies its (g,n)-range.
- `versal_constant_not_example` (non-example): A constant family over a point is not versal when 3g−3+n>0.
- `versal_sections_removed` (computation): For n=0, C°=C; for n>0 all n disjoint section points, and no others, are removed in each fibre.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Notation 1.10.1, pp.10–11; Lemmas 2.1.4–2.1.5, pp.13–14.

### C.0/moduli-monodromy — Moduli and point-pushing comparison

**Theorem.** For 2g−2+n>0, the analytic orbifold fundamental group of the ordered moduli stack M(g,n) is PMod(g,n); that of its universal punctured curve M(g,n+1) is PMod(g,n+1). The fibre inclusion is point pushing and its conjugation action agrees with the surface outer action. These are orbifold groups, not the fundamental groups of coarse spaces.

**Atlas planet:** Moduli and point-pushing comparison.

**Construction or proof:**

1. Use the supplied contractible Teichmüller uniformization with stabilizers retained.
2. Apply the existing Birman sequence and check the path convention against monodromyRepresentation.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.2`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 2.0.1, p.12 (second group label corrected).

### C.0/family-exact — Versal family fundamental groups

**Theorem.** For a punctured étale-versal hyperbolic family and compatible basepoints, 1→π₁(C°_m)→π₁(C°)→π₁(M)→1 is exact; the map π₁(M)→PMod(g,n) has finite-index image. Consequently the outer monodromy on the fibre is the restriction of the mapping-class action.

**Construction or proof:**

1. Dominance gives a finite-index image by the normal-complex-variety fundamental-group theorem; no claim that dominance alone fails is needed.
2. The analytic punctured family is a fibre bundle. Compare its homotopy sequence with the universal orbifold sequence; the fibre group injects there, hence in this family. Do not assume π₂(M)=0.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.4`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemmas 2.1.4–2.1.5, pp.13–14.

### C.0/family-finite-orbit — Fibral finite-orbit monodromy

**Theorem.** The restriction to a fibre of every finite-dimensional complex local system on the total space of a punctured étale-versal hyperbolic family is MCG-finite.

**Construction or proof:**

1. Conjugation in the exact total-space group supplies intertwiners for the image of π₁(M).
2. That image has finite index in PMod(g,n); pass to the full group by the finite-index criterion.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/family-exact`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proposition 2.1.3, pp.13–14.

## C.1. Projective realization

Establish finite-orbit operations and point-pushing restriction, rank-one and determinant finiteness for positive genus, and the canonical actual-intertwiner projective extension of an irreducible representation.

**Stage dependencies:** `MappingClassGroupsAndCanonicalRepresentations:C.0`; `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `StableReductionPartII:MC.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.1/closure — Finite-orbit operations

**Theorem.** Finite direct sums, tensor products and duals of MCG-finite representations are MCG-finite. Every irreducible constituent of the semisimplification is MCG-finite. A subrepresentation or quotient singled out functorially under all representation isomorphisms is MCG-finite, including the socle and its quotient. Arbitrary non-characteristic subquotients of a nonsplit representation are not asserted to have finite orbit.

**Construction or proof:**

1. Intersect finitely many stabilizers for sums and tensors; transport duals.
2. Mapping classes permute the finite set of semisimple constituents. Isomorphism-invariant submodules and quotients transport under each stabilizing intertwiner.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCeti.socle`; `tauceti:TauCeti.isSemisimpleModule_socle`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proposition 2.1.1, p.12; §8.7, p.44.

### C.1/point-push-restriction — Point-pushing restriction theorem

**Theorem.** If Γ is a finite-index subgroup of PMod(g,n+1) containing the point-pushing surface group, any complex representation of Γ restricts to an MCG-finite representation of that surface group, for 2g−2+n>0.

**Atlas planet:** Point-pushing restriction theorem.

**Construction or proof:**

1. Use the finite-index image of Γ in the Birman quotient: conjugation in Γ realizes all its outer actions by actual intertwiners.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proposition 2.1.2, p.13.

### C.1/rank-one — Rank-one canonical finiteness

**Theorem.** For g≥1 and n≥0 every MCG-finite character π₁Σ(g,n)→C× has finite image. In particular every positive-rank MCG-finite representation has finite determinant.

**Atlas planet:** Rank-one canonical finiteness.

**Construction or proof:**

1. Use powers of nonseparating Dehn twists in the stabilizer to force torsion values on simple generators; use the puncture relations and the rank-one finite-orbit classification cited there.
2. Determinant is functorial for conjugation and precomposition; finite generation turns finitely many torsion values into a finite subgroup.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`.

**Checks:**

- Check g=1,n=0 directly with the SL₂(Z) transvections; exclude a genus-zero finite-orbit character with non-torsion puncture monodromy.

**Source:** LL24, Proposition 2.3.1 and Lemma 2.3.2, pp.15–16.

### C.1/projective-extension — Canonical projective extension

**Construction.** Let ρ:N→GL_r(C), r>0, be irreducible, with N the hyperbolic surface point-pushing group. Let Γ be the finite-index pure mapping-class stabilizer of [ρ] and Γ̃ its preimage in PMod(g,n+1). For γ∈Γ̃ select an actual GL intertwiner Aγ from ρ to ρ∘conjγ. Its class defines a homomorphism ρ̂:Γ̃→PGL_r(C) restricting to Pρ. Uniqueness is within the class of extensions represented by these actual intertwiners, not among arbitrary PGL extensions.

**Atlas planet:** Canonical projective extension.

**Construction or proof:**

1. Schur makes the space of actual intertwiners one dimensional; multiplication is compatible modulo scalars.
2. Inner elements act by the class of ρ. Pull back to a fine level scheme to obtain a projective local system on a versal total space.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`; `mathlib:Representation.IsIrreducible`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `StableReductionPartII:MC.4`.

**Uses that determine the API:**

- C.2 linear lift: Supplies the projective total representation and the prescribed fibre lift.

**API:**

- `projectiveExtension_restrict` (compatibility): On N the extension equals projectivization of ρ.
- `projectiveExtension_intertwiner` (characterisation): The class of any actual GL intertwiner is its value on γ.
- `projectiveExtension_scalar_independent` (extensionality): Changing each intertwiner by a nonzero scalar leaves the homomorphism unchanged.
- `projectiveExtension_baseChange` (functoriality): Restriction to a smaller stabilizer agrees with pulling back the extension.

**Discriminating unit tests:**

- `projectiveExtension_rankOne` (degenerate): At rank one the PGL extension is trivial.
- `projectiveExtension_inner` (computation): For n∈N its value is [ρ(n)].
- `projectiveExtension_not_arbitrary_unique` (non-example): For the standard irreducible Q₈ representation, take G=Q₈×C₂. Projective centralizers allow a nontrivial C₂-value in an extension of Pρ, although actual GL intertwiners for this trivial C₂-action must be scalar. Thus arbitrary projective extensions are not uniquely determined.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 2.2.2, pp.14–15; Lemma 2.2.3, p.15.

## C.2. Linear lifting and relative structure

Kill a specified finite abelian obstruction by dominant étale refinement, lift the projective extension with its fibre prescribed, realize irreducible representations on versal families, prove the arbitrary-group normal-restriction lemma, and construct the relative Artinian unitary decomposition.

**Stage dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `DiamondsAndVStacks:D0`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `StableReductionPartII:MC.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.2/kill-finite-class — Étale killing of finite obstruction classes

**Theorem.** Let M be a connected smooth complex algebraic variety, μ a finite abelian group with trivial π₁(M)-action, i>0 and α∈Hⁱ(π₁(M),μ). There is a connected dominant étale M′→M for which the pulled-back class vanishes. The map may involve shrinking and is not claimed finite over all M.

**Atlas planet:** Étale killing of finite obstruction classes.

**Construction or proof:**

1. On a sufficiently small smooth dense open, compare finite-coefficient singular and étale cohomology.
2. Kill the étale class locally using an injective resolution and a dominant étale neighbourhood of a generic point.
3. Pass to an Artin K(π,1) open to return from sheaf cohomology to group cohomology. No finiteness of the whole cohomology group is assumed.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `DiamondsAndVStacks:D0`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 2.3.3, p.16.

### C.2/prescribed-lift — Fibre-prescribed linear lifting

**Theorem.** For g≥1, start with the projective family extension of an irreducible MCG-finite ρ with finite determinant. After connected dominant étale base change it lifts to an actual GL_r(C) representation of the total-space group with finite determinant, whose restriction is isomorphic to the original ρ, not just projectively isomorphic.

**Atlas planet:** Fibre-prescribed linear lifting.

**Construction or proof:**

1. Set D=detρ(N) and use the central isogeny det⁻¹(D)→PGL_r with finite kernel μ (r>0). The obstruction restricts to zero on N.
2. Use discrete LHS filtration: first kill the component in H¹(Q,H¹(N,μ)) after making its finite module constant; only then kill the newly determined inflated class in H²(Q,μ).
3. Compare the resulting fibre lift with ρ. Make the finite mismatch character invariant, kill its transgression in H²(Q,μ), extend it to the total group, and twist the lift.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.2/kill-finite-class`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `mathlib:groupCohomology.H1InfRes_exact`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proposition 2.3.4, pp.16–18; Corollary 2.3.5, p.18.

### C.2/linear-realization — Linear versal realization

**Theorem.** Every irreducible MCG-finite rank-r representation of π₁Σ(g,n), g≥1, r>0 and 2g−2+n>0, is the fibre restriction of a finite-determinant local system on a punctured étale-versal family with smooth quasiprojective base. All subsequent étale restrictions preserve this realization.

**Atlas planet:** Linear versal realization.

**Construction or proof:**

1. Combine the canonical projective realization with fibre-prescribed lifting; choose a smooth quasiprojective level chart and shrink the base when necessary.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/prescribed-lift`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `StableReductionPartII:MC.4`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 2.3.5, p.18.

### C.2/normal-restriction — Irreducible normal restriction

**Theorem.** For arbitrary groups G and N normal in G, let ρ:G→GL_r(C) have finite determinant and irreducible restriction to N. If ρ(N) is finite then ρ(G) is finite; if ρ|N is unitarizable then ρ is unitarizable. No finiteness of G or finite index of N is assumed.

**Atlas planet:** Irreducible normal restriction.

**Construction or proof:**

1. For a finite N-image, the kernel of conjugation on that image centralizes an irreducible representation and hence consists of scalars; finite determinant bounds these scalars.
2. An N-invariant positive Hermitian form is unique up to positive scalar. Each G element transports it to such a multiple; finite determinant forces that multiple to be one.

**Direct prerequisites:** `mathlib:Representation.IsIrreducible`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 2.4.1, p.19.

### C.2/artin-decomposition — Relative unitary decomposition

**Construction.** Let A be a local Artinian C-algebra with residue C and V a local system of finite free A-modules on a punctured étale-versal family with g≥1. Suppose the restriction to a chosen fibre is isomorphic over A to U⊗C A with U unitary. After dominant étale base change, V≃⊕ᵢ(Uᵢ⊗C π°^*Wᵢ), where Uᵢ are total-space unitary complex local systems with pairwise nonisomorphic irreducible fibre restrictions and Wᵢ are finite free A-local systems on M. This is fibre-constant deformation, not merely unitary reduction mod m_A.

**Atlas planet:** Relative unitary decomposition.

**Construction or proof:**

1. Extend the irreducible constituents of U by linear realization, and use the normal-restriction theorem to make them unitary on the total space.
2. Define Wᵢ=π°_*Hom(Uᵢ,V); Schur and fibrewise evaluation give finite freeness and the displayed decomposition.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.pullback`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`; `DiamondsAndVStacks:D0`.

**Uses that determine the API:**

- HodgeStructuresPartII:H.4: Artinian invariant vanishing uses the decomposition over A, before the final finiteness stages.

**API:**

- `relativeUnitary_eval` (equivalence): The sum of evaluation maps Uᵢ⊗π°^*Wᵢ→V is an isomorphism.
- `relativeUnitary_multiplicity` (projection): Wᵢ is π°_*Hom(Uᵢ,V), with its actual induced A-monodromy.
- `relativeUnitary_baseChange` (functoriality): The decomposition commutes with further dominant étale pullback and Artinian scalar change.

**Discriminating unit tests:**

- `relativeUnitary_AeqC` (compatibility): For A=C the formula reduces to the complex isotypic evaluation decomposition.
- `relativeUnitary_rankZero` (degenerate): For the zero local system the indexing set is empty and the evaluation map is the unique isomorphism 0→0.
- `relativeUnitary_multiplicity_not_constant` (non-example): For V=π°^*W with W a nonconstant rank-one A-local system on M, W₁=W rather than a constant multiplicity module.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 2.4.2, pp.19–20.

## C.3. Higher Prym representations

Define open-cover cohomological and compact-cover homological Prym actions and the Putman–Wieland predicate. Construct marked versal cover families from the Hurwitz supplier, reduce boundary components, identify cover cohomology, and prove the subrepresentation rank bound and its small-degree and small-order consequences.

**Stage dependencies:** `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5`; `StableReductionPartII:MC.4`; `MappingClassGroupsAndCanonicalRepresentations:C.2`; `DiamondsAndVStacks:D0`; `HodgeStructuresPartII:H.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.3/prym-action — Higher Prym actions

**Construction.** For a surjection φ:π₁Σ(g,b,p)↠H onto a finite group, put K=kerφ and let Γ⊂PMod(g,b,p+1) stabilize φ up to inner conjugacy in H. Restriction of the based automorphism to K acts on H¹(K,C), with the inverse-pullback convention giving a left action, and on H₁(K,C). It also acts on V_K=H₁ of the compactified covering surface. For each irreducible H-module σ, take the full σ-isotypic subspace σ⊗Hom_H(σ,V), embedded by evaluation; do this separately for open cohomology and compact homology. Γ normalizes the H-action up to inner automorphism, so the isotypic subspaces are stable.

**Atlas planet:** Higher Prym actions.

**Construction or proof:**

1. Import the actual covering attached to K and its deck action, and the supplied singular homology/cohomology.
2. Use functoriality for based automorphisms preserving K, fill ends for the compact quotient, and use the generic semisimple isotypic projector.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `tauceti:TauCeti.LocalCoefficientSystem`; `mathlib:isotypicComponent`.

**Uses that determine the API:**

- C.3 rank bound: The theorem bounds subspaces of the full isotypic component.
- C.6 splitting: Dual cohomology of a trivializing cover detects extension classes.

**API:**

- `prymAction_restrict` (functoriality): Restricting Γ to a finite-index Γ′ preserves both actions and their isotypic subspaces.
- `prymAction_isotypic_eval` (compatibility): The isotypic space is the image of σ⊗Hom_H(σ,V) under the supplied evaluation map, not the multiplicity space alone.
- `prymAction_compactification` (compatibility): Open-to-compact homology and compact-to-open cohomology maps are equivariant with the chosen left actions.
- `prymAction_dual` (compatibility): Dualizing changes σ to σ∨; compact Poincaré duality carries the induced action and deck labels coherently.

**Discriminating unit tests:**

- `prym_trivial_cover` (computation): For H=1 the compact representation is the ordinary surface H₁ of dimension 2g.
- `prym_punctured_sphere` (non-example): The identity cover of the three-punctured sphere has open H¹ dimension 2 and compact H₁ dimension 0; these carriers must differ.
- `prym_multiplicity_dimension` (characterisation): If V=σ⊕σ, its full σ-isotypic subspace has dimension 2 dimσ, whereas Hom_H(σ,V) has dimension 2.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Notation 7.1.1, p.35; Theorem 7.2.1 and Remark 7.2.2, p.36; proof, pp.37–38.

### C.3/pw-property — Putman–Wieland property

**Definition.** For fixed finite H and g,b,p≥0, PW(H,g,b,p) means: for every surjective φ:π₁Σ(g,b,p)↠H, every nonzero vector of compact-cover homology V_K has infinite orbit under the stabilizer Γ of φ up to conjugacy. Quantification is over the compact homology representation, with C coefficients.

**Atlas planet:** Putman–Wieland property.

**Construction or proof:**

1. Use the preceding compact-cover action; quantify over surjections and nonzero vectors.
2. Prove the equivalent condition that no finite-index subgroup of any Γ has a nonzero fixed vector.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`.

**Uses that determine the API:**

- C.3 small-degree theorem: Convert the rank bound into the orbit property.

**API:**

- `pw_iff_no_virtual_invariants` (characterisation): PW is equivalent to V_K^Γ′=0 for every φ and every finite-index Γ′⊂Γ.
- `pw_no_surjection` (simp): If no such surjection exists the property holds vacuously.
- `pw_coefficient_extension` (compatibility): The Q and C formulations agree for this finite-dimensional rational action by base change of the fixed-space linear equations.

**Discriminating unit tests:**

- `pw_genusZero` (degenerate): When every compact cover has genus zero, V_K=0 and PW holds.
- `pw_fixed_vector_fails` (non-example): One nonzero vector fixed by a finite-index Γ′ disproves PW by giving a finite Γ-orbit.
- `pw_trivial_group_genusAtLeastTwo` (compatibility): For H=1 and g≥2, the definition reduces to infinite orbits of nonzero vectors in standard compact surface homology under the mapping-class action.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Definition 7.1.2 and Remark 7.1.4, p.35.

### C.3/versal-cover — Versal families of finite covers

**Construction.** For hyperbolic Σ(g,0,n) and a fixed finite quotient φ, a versal φ-cover consists of a punctured étale-versal family C°→M, a based fibre marking i:π₁Σ≃π₁(C°_m,c), and an H-torsor X°→C° whose based fibre quotient is φ under i. The marking and quotient identification are part of the data, not just the topological covering degree.

**Atlas planet:** Versal families of finite covers.

**Construction or proof:**

1. Pull back the generic Hurwitz family of H-covers for this Nielsen class and take a scheme chart.
2. Use an étale multisection and shrink to obtain a section of C°→M when the proof requires a lift to M(g,n+1). Keep H-equivariant vertical automorphisms distinct from arbitrary automorphisms of the base curve.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5`; `StableReductionPartII:MC.4`.

**Uses that determine the API:**

- C.3 cohomology comparison: Identify the relevant mapping-class action with a family monodromy action.

**API:**

- `versalCover_fibre` (projection): The kernel of the fibre monodromy quotient is i(kerφ).
- `versalCover_pullback` (functoriality): Connected dominant étale base change transports the torsor, marking and quotient together.
- `versalCover_refine_stabilizer` (other): For any finite-index Γ′ in the relevant stabilizer, a finite étale refinement makes the base π₁-image lie in Γ′.

**Discriminating unit tests:**

- `versalCover_trivial_H` (degenerate): For H=1 the torsor is the identity cover C°→C°.
- `versalCover_wrong_quotient` (non-example): A cover of the same degree with a different based quotient φ′ does not satisfy the data unless the specified quotient identifications match.
- `versalCover_deck_fibre` (compatibility): For the resulting family, the deck H-action on a marked fibre agrees with the covering-space action attached to kerφ.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Definition 7.3.1 and proof of Theorem 7.2.1, p.37.

### C.3/boundary-reduction — Boundary-to-puncture reduction

**Theorem.** Replacing all boundary circles by punctures gives an equivariant isomorphism H¹(Σ(g′,b′,p′),C)^σ≃H¹(Σ(g′,0,b′+p′),C)^σ. For each finite-index Γ′ in the original quotient stabilizer, its capping image Γ″ is finite index and has exactly the corresponding invariant subspaces. The covering genus remains g′.

**Construction or proof:**

1. Use the boundary-collar deformation retraction and naturality of covering cohomology.
2. Use the supplied capping sequence; boundary twists act by an inner action or the identity on K-abelianization and hence trivially on cohomology.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`; `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 7.2.5, p.36 (covering genus corrected).

### C.3/cover-cohomology — Cover cohomology and family monodromy

**Theorem.** After dominant étale refinement of a versal φ-cover with g≥1, f_*C decomposes as ⊕σ Uσ⊗π°^*Wσ with Uσ finite-image unitary local systems of rank dimσ and Wσ constant complex multiplicity local systems. Its R¹π°_* σ-piece identifies, with the deck/dual convention fixed, with the open-cover H¹ σ-piece. Compact H¹ injects equivariantly into open H¹, and compact duality transfers the same subspace bounds to compact H₁.

**Construction or proof:**

1. Apply the relative unitary decomposition with A=C to f_*C, and the finite-image normal-restriction result to its irreducible factors.
2. Trivialize the finite multiplicity monodromies by a finite étale cover. Use projection formula and the local-coefficient-to-sheaf adapter for R¹.
3. Use the long exact sequence of filling punctures and oriented compact Poincaré duality, checking the dual σ label rather than identifying every representation with its dual.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/versal-cover`; `MappingClassGroupsAndCanonicalRepresentations:C.2/artin-decomposition`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`; `DiamondsAndVStacks:D0`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `mathlib:isotypicComponent`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proof of Theorem 7.2.1, pp.37–38.

### C.3/prym-rank — Higher Prym rank bound

**Theorem.** For every finite quotient φ of π₁Σ(g,b,p), every irreducible complex H-module σ, and every finite-index Γ′⊂Γ, each nonzero Γ′-stable subspace of H¹ of the open covering surface in its σ-isotypic component has dimension at least 2g−2 dimσ. The same bound holds for the compact covering H₁ σ-piece. No assertion is made for arbitrary open-cohomology subquotients.

**Atlas planet:** Higher Prym rank bound.

**Construction or proof:**

1. For g≤1 the numerical bound is nonpositive, so the statement is immediate; otherwise reduce boundary to punctures.
2. Refine the cover family to the chosen finite-index subgroup and use the cover cohomology comparison.
3. Apply H.4 Theorem 1.7.1 to each Uσ and its constant multiplicity sum, and pass to compact homology by the equivariant injection and duality.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/boundary-reduction`; `MappingClassGroupsAndCanonicalRepresentations:C.3/cover-cohomology`; `HodgeStructuresPartII:H.4`.

**Checks:**

- Reject the same statement for arbitrary subquotients in the noncompact case.
- For g=3 and dimσ=1, every nonzero such invariant subspace has dimension at least 4.

**Source:** LL24, Theorem 7.2.1, p.36; proof, pp.37–38.

### C.3/pw-small-degree — Small-degree Putman–Wieland theorem

**Theorem.** If every irreducible complex representation of a finite H has dimension strictly less than g, then PW(H,g,b,p) holds for all b,p≥0.

**Atlas planet:** Small-degree Putman–Wieland theorem.

**Construction or proof:**

1. Project a hypothetical virtual fixed vector onto an isotypic summand. Its line contradicts the lower bound, which is an even integer at least 2.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-rank`; `MappingClassGroupsAndCanonicalRepresentations:C.3/pw-property`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 7.2.3, p.36.

### C.3/pw-small-order — Small-order Putman–Wieland theorem

**Theorem.** For a finite group H with |H|<g², PW(H,g,b,p) holds for all b,p≥0.

**Atlas planet:** Small-order Putman–Wieland theorem.

**Construction or proof:**

1. Import the finite-group degree-square identity |H|=Σσ(dimσ)², conclude dimσ<g, and apply the small-degree result.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/pw-small-degree`; `tauceti:TauCeti.sum_characterDegree_sq_eq_card`.

**Checks:**

- For a cyclic H and g≥2, use the stronger small-degree theorem even when the order bound fails.
- For H=1,g=2 the order criterion holds; do not extend the strict inequality to all |H|=g².

**Source:** LL24, Corollary 7.2.4, p.36.

### C.3/small-isotypic-orbits — Small-isotypic infinite orbits

**Theorem.** For a fixed irreducible H-module σ with dimσ<g, every nonzero vector of the compact covering homology σ-isotypic component has infinite orbit under Γ. No restriction on the dimensions of the other irreducible H-modules is required.

**Construction or proof:**

1. A finite vector orbit gives a fixed line for its finite-index stabilizer. The higher Prym bound is at least 2 on this component, contradicting the line.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-rank`; `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`.

**Checks:**

- For a cyclic H and g≥2 all individual components satisfy the criterion, independently of |H|.
- The hypothesis is dimσ<g, not dimσ≤g.

**Source:** LL24, Theorem 1.4.2, p.5; Corollary 7.2.3 argument, p.36.

## C.4. Unitary rigidity and integrality

Use Artinian invariant vanishing to prove strong rigidity of fibre-irreducible low-rank total representations. Import twist quasi-unipotence and compactification, deduce projective and linear integrality, and prove finite monodromy for low-rank unitary MCG-finite representations using every coefficient conjugate.

**Stage dependencies:** `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`; `DiamondsAndVStacks:D0`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.3`; `StableReductionPartII:MC.4`; `AlgebraicModuliForArithmeticGeometry:R09.7d`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `MappingClassGroupsAndCanonicalRepresentations:C.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.4/strong-rigidity — Low-rank strong rigidity

**Theorem.** Let C°→M be a punctured étale-versal family and ρ a GL_r(C) or PGL_r(C) total-space representation whose restriction to the fibre is the projectivization of an irreducible unitary GL_r representation (or that representation itself). If r>0 and r²−1<g, then H¹(C°,adρ)=0, with adρ=sl_r. This strong vanishing is established before asserting quasi-unipotence or middle-extension rigidity.

**Atlas planet:** Low-rank strong rigidity.

**Construction or proof:**

1. Fibre irreducibility gives π°_*adρ=0 by Schur and trace zero.
2. H.4 Artinian vanishing with A=C gives H⁰(M,R¹π°_*adρ)=0.
3. Use the ordinary sheaf Leray low-degree sequence. Once a quasi-unipotent boundary is supplied, import strong-to-middle-extension rigidity.

**Direct prerequisites:** `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`; `DiamondsAndVStacks:D0`; `mathlib:Representation.IsIrreducible`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`.

**Checks:**

- At r=1 the adjoint space is zero.
- Do not assume semisimplicity or vanishing of H¹(M,C) to discard the base term: the coefficient sheaf π°_*adρ itself is zero.

**Source:** LL24, Proposition 8.2.1, p.39; Lemma 8.1.3, p.39.

### C.4/boundary-quasiunipotence — Quasi-unipotent boundary monodromy

**Theorem.** For g≥3, a local system on a punctured level-versal total curve induced from a finite-index pointed mapping-class representation has quasi-unipotent local monodromy along a suitable smooth projective SNC compactification. The same holds for the canonical projective extension, tested through its faithful adjoint representation.

**Atlas planet:** Quasi-unipotent boundary monodromy.

**Construction or proof:**

1. Import the theorem that every multitwist in a finite-index mapping-class subgroup has quasi-unipotent image under any complex linear representation.
2. Choose the level compactification, then resolve its normalized boundary while preserving the open. Local boundary inertia maps to products of commuting twist powers; track new exceptional divisors as such products.
3. Apply the adjoint embedding for PGL. Normalization alone is not a smooth SNC compactification.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.3`; `StableReductionPartII:MC.4`; `AlgebraicModuliForArithmeticGeometry:R09.7d`; `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proposition 8.3.2 and Lemma 8.3.3, p.40; AS16 Proposition 2.4, pp.10–11.

### C.4/projective-integrality — Projective integrality theorem

**Theorem.** For g≥3, an irreducible unitary MCG-finite representation of rank r>0 with r²−1<g has projectivization conjugate into PGL_r(O_K) for some number field K, in the sense of the supplied reductive-group integral model.

**Atlas planet:** Projective integrality theorem.

**Construction or proof:**

1. Realize the projectivization on a smooth quasiprojective versal total space.
2. Use strong rigidity and the boundary theorem to verify every reductive-group integrality hypothesis: PGL-irreducibility, middle-extension adjoint H¹=0, quasi-unipotent boundary and finite abelianization (trivial for PGL).
3. Import the G-valued integrality theorem for split connected reductive Z-groups, not just the GL version.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.4/strong-rigidity`; `MappingClassGroupsAndCanonicalRepresentations:C.4/boundary-quasiunipotence`; `HodgeStructuresPartII:H.5`; `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 8.3.3, p.40; KP20 Definition 1.1 and Theorem 1.2, pp.1–3.

### C.4/linear-integrality — Linear integrality with fixed determinant

**Theorem.** Under the same hypotheses, ρ is conjugate into GL_r(O_L) after a finite extension L of the projective coefficient number field.

**Atlas planet:** Linear integrality with fixed determinant.

**Construction or proof:**

1. Use finite determinant D and the finite central isogeny det⁻¹(D)→PGL_r after enlarging the number field to include D.
2. For each generator the actual lift ρ(γ) is a point of the finite pullback over its integral projective image and hence is integral after finite extension. Finite generation gives one common L.
3. Apply the same argument to inverses, so the matrices lie in GL_r(O_L), not merely integral matrix entries with nonunit determinant.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.4/projective-integrality`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 8.3.4, pp.40–41.

### C.4/conjugate-unitarity — Unitarity of coefficient conjugates

**Theorem.** For a low-rank irreducible unitary MCG-finite representation integral over a number field, every number-field embedding into C gives a unitarizable conjugate representation. The hypothesis is r²<g+1 and g≥3 here.

**Construction or proof:**

1. Use the finite-determinant linear versal realization and normal-restriction unitarity; apply strong rigidity there.
2. Extend each number-field embedding to an automorphism of C. The finite-CW cochain description preserves adjoint H¹=0 and finite determinant.
3. Import strong-rigidity-to-complex-PVHS, then the isomonodromic very-general-fibre unitarity theorem under r<2√(g+1). Identify the topological fibre representation along the family. A PVHS on a single arbitrary curve is not sufficient.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `MappingClassGroupsAndCanonicalRepresentations:C.4/strong-rigidity`; `MappingClassGroupsAndCanonicalRepresentations:C.4/linear-integrality`; `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proof of Proposition 8.4.1, p.41; LL22 Theorem 1.2.12, pp.4–5.

### C.4/unitary-finite — Unitary canonical finiteness

**Theorem.** Every unitary MCG-finite rank-r representation of π₁Σ(g,n) with r²<g+1 has finite image, for all g,n≥0.

**Atlas planet:** Unitary canonical finiteness.

**Construction or proof:**

1. Split it into irreducibles using the existing unitary semisimplicity theorem. For g<3 the bound gives rank at most one (rank zero for g=0), covered directly by the rank-one theorem.
2. For each positive-rank irreducible in g≥3, use linear integrality and unitarity at all coefficient embeddings.
3. At each of finitely many embeddings compactness bounds every matrix coefficient in the chosen common integral basis; take a common finite bound and apply the existing number-field bounded-integers finiteness theorem entrywise.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.4/linear-integrality`; `MappingClassGroupsAndCanonicalRepresentations:C.4/conjugate-unitarity`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`; `mathlib:NumberField.Embeddings.finite_of_norm_le`; `tauceti:TauCeti.ContRepresentation.exists_isUnitary_congr`.

**Checks:**

- An infinite cyclic unitary rank-one representation on a genus-zero punctured surface shows why g=0 permits only rank zero here.
- Do not claim all matrix entries have norm ≤1 in a single integral basis at every embedding.

**Source:** LL24, Proposition 8.4.1, p.41; LL22 Lemma 7.2.1, p.51.

## C.5. Constancy and semisimple finiteness

Apply the shared abstract-group deformation criterion to fibre-unitary formal families. Prove conjugacy constancy in connected algebraic fixed-determinant families and semisimple finite monodromy, exposing the nonabelian-Hodge-to-algebraic-family bridge as a supplier obligation.

**Stage dependencies:** `DeformationAndDerivedPatchingAlgebra:R03.2`; `HodgeStructuresPartII:H.4`; `MappingClassGroupsAndCanonicalRepresentations:C.2`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `HodgeStructuresPartII:H.1`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `MappingClassGroupsAndCanonicalRepresentations:C.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.5/formal-constancy — Formal fibral constancy

**Theorem.** For a punctured étale-versal family and a representation ρ∞:π₁(C°)→GL_r(C[[t]]) with determinant equal to a fixed complex character, if its special fibre restricts unitarily to the curve group and r>0, r²<g+1, then the fibre restriction of ρ∞ is conjugate over C[[t]] to its constant special fibre.

**Atlas planet:** Formal fibral constancy.

**Construction or proof:**

1. Import the abstract discrete-group relative formal-constancy criterion over Art_C: it quantifies over every truncated deformation with constant restriction to the normal subgroup, not just the given family.
2. For B_n=C[t]/(tⁿ⁺¹), use adγ of rank r²−1<g; H.4 gives H⁰(M,R¹π°_*adγ)=0 over B_n.
3. Use the criterion’s compatible sequence of conjugators; a separate conjugator at each order without compatibility does not suffice.

**Direct prerequisites:** `DeformationAndDerivedPatchingAlgebra:R03.2`; `HodgeStructuresPartII:H.4`; `MappingClassGroupsAndCanonicalRepresentations:C.2/artin-decomposition`; `MappingClassGroupsAndCanonicalRepresentations:C.0/family-exact`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 8.5.1, p.42; Proposition 3.2.1, pp.21–23.

### C.5/algebraic-constancy — Connected algebraic fibral constancy

**Theorem.** Let X be a connected finite-type C-scheme and ρ:π₁(C°)→GL_r(Γ(X,O_X)) an actual family of total-space representations whose determinant is a fixed complex character. If r>0, r²<g+1 and its restriction at one closed point is unitary, then the restrictions at all closed points of X are GL_r(C)-conjugate. This is a statement about representations, not arbitrary maps into a coarse character variety.

**Atlas planet:** Connected algebraic fibral constancy.

**Construction or proof:**

1. Join the two points by a chain of reduced curves and normalize each irreducible component.
2. Complete at a smooth point and apply formal fibral constancy. Intertwiner equations and the nonvanishing determinant show generic conjugacy after algebraic field extension.
3. Use closedness of the semisimple orbit to specialize along the smooth curve, then propagate across intersections of components.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.5/formal-constancy`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `HodgeStructuresPartII:H.1`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Lemma 8.5.2, pp.42–43.

### C.5/semisimple-finite — Semisimple canonical finiteness

**Theorem.** Every semisimple MCG-finite representation π₁Σ(g,n)→GL_r(C) with r²<g+1 has finite image, without assuming it unitary at the outset.

**Atlas planet:** Semisimple canonical finiteness.

**Construction or proof:**

1. Reduce to irreducibles and handle ranks zero and one separately; realize an irreducible in a finite-determinant versal family.
2. Import the nonabelian Hodge deformation to a complex PVHS with finite determinant and reductive monodromy. On an analytically general fibre, import LL22 unitarity.
3. Use the requested fixed-determinant GIT component-lifting bridge: for the connected conjugating group GL_r, quotient fibres are connected via their unique closed orbit; the finitely many connected components of the representation scheme are invariant and have closed disjoint images. A continuous path in the character quotient therefore puts the endpoints in the same connected algebraic component of the actual representation scheme, which carries its universal representation. Verification of this bridge and of constant determinant along the Hodge deformation is a supplier gap.
4. Apply connected algebraic fibral constancy and then unitary canonical finiteness.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `HodgeStructuresPartII:H.1`; `HodgeStructuresPartII:H.4`; `MappingClassGroupsAndCanonicalRepresentations:C.5/algebraic-constancy`; `MappingClassGroupsAndCanonicalRepresentations:C.4/unitary-finite`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Theorem 8.5.3, p.43; Theorem 4.3.1 and Lemma 4.3.2, p.27.

## C.6. General finiteness and free groups

Prove characteristic-socle transport, the low-rank extension splitting theorem, and finite monodromy for all MCG-finite representations of rank r with r²<g+1. Deduce fibral, algebraic-isomonodromy, free-group, Nielsen-tuple, and characteristic-quotient consequences.

**Stage dependencies:** `MappingClassGroupsAndCanonicalRepresentations:C.1`; `MappingClassGroupsAndCanonicalRepresentations:C.3`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `MappingClassGroupsAndCanonicalRepresentations:C.5`; `HodgeStructuresPartII:H.1`; `HodgeStructuresPartII:H.2`; `StableReductionPartII:MC.2`; `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.6/socle-transport — Characteristic socle transport

**Theorem.** For an MCG-finite finite-dimensional complex surface representation, its existing group-algebra-module socle and its quotient are MCG-finite. Iteration produces a finite characteristic socle filtration with semisimple graded pieces; no new generic socle carrier is introduced.

**Construction or proof:**

1. Transport the supremum of simple submodules along each intertwiner, using the existing socle universal property.
2. Finite-dimensionality gives strict dimension growth until the whole module; use the characteristic-subquotient finite-orbit result at each step.

**Direct prerequisites:** `tauceti:TauCeti.socle`; `tauceti:TauCeti.isSemisimpleModule_socle`; `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, §8.7, p.44; Proposition 2.1.1, p.12.

### C.6/extension-splitting — Low-rank extension splitting

**Theorem.** Suppose ρ is MCG-finite of rank r with r²<g+1 and 0→V₁→V→V₂→0 is exact, with V₁ characteristic, and V₁,V₂ semisimple of finite image. Then the extension splits and ρ has finite image.

**Atlas planet:** Low-rank extension splitting.

**Construction or proof:**

1. Let a=dimV₁,b=dimV₂. Trivialize their finite images on a finite Galois cover, then view the restricted extension as an H-equivariant linear map from cover H₁ to Hom(V₂,V₁).
2. Choose a finite-index stabilizer of the actual class of ρ, as well as the finite cover and constituent labels. The image/dual subspace is then stable; stabilizing only Hom constituents does not suffice.
3. Each nonzero image gives a stable cohomology subspace of dimension ≤ab<(g+1)/4 in an isotypic piece labelled by σ or σ∨ of dimension ≤ab. The bound 2g−2 dimσ>ab contradicts the higher Prym theorem. Treat a=0 or b=0 and the low genera directly.
4. The extension becomes trivial on the finite cover and hence has finite image. Average over that finite image to split it in characteristic zero.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-rank`; `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`.

**Checks:**

- A nonzero unipotent extension with trivial graded pieces and infinite additive image is excluded by the MCG-finite hypothesis, not by semisimplicity of the graded pieces alone.
- Check the numerical contradiction for the smallest possible nontrivial split a=b=1 in the allowed genus range.

**Source:** LL24, Lemma 8.6.1, p.44 (stabilizer choice repaired).

### C.6/main-finiteness — Canonical representation finiteness

**Theorem.** For all g,n,r≥0, if ρ:π₁Σ(g,n)→GL_r(C) is MCG-finite and r²<g+1, then ρ has finite image. No semisimplicity assumption is imposed.

**Atlas planet:** Canonical representation finiteness.

**Construction or proof:**

1. For g=0 the rank inequality forces r=0. For (g,n)=(1,0) it forces r≤1, so use the direct rank-one result; other small ranks are handled there as well.
2. Induct on socle length using characteristic transport. The socle and quotient have finite image by induction, hence the quotient is semisimple in characteristic zero.
3. Apply low-rank extension splitting.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.5/semisimple-finite`; `MappingClassGroupsAndCanonicalRepresentations:C.6/socle-transport`; `MappingClassGroupsAndCanonicalRepresentations:C.6/extension-splitting`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`.

**Checks:**

- The strict bound is r²<g+1, not r²≤g+1.
- In genus 3 the theorem covers rank 1, while rank 2 belongs to the separate example-range classification.

**Source:** LL24, Theorem 1.2.1, p.3; proof §8.7, p.44.

### C.6/fibral-finiteness — Finite fibral monodromy

**Theorem.** For a local system of rank r on a punctured étale-versal family of genus g with r²<g+1, its restriction to every fibre has finite image. No semisimplicity of the total-space representation is required.

**Construction or proof:**

1. Combine the total-space-to-finite-orbit result with canonical representation finiteness, and use parallel transport to pass between fibres.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/family-finite-orbit`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 1.3.1, p.4.

### C.6/isomonodromy — Algebraic universal isomonodromy criterion

**Theorem.** For a smooth projective complex pointed genus-g curve and a semisimple regular-singular logarithmic flat connection of rank r with residue eigenvalue real parts in [0,1), if r>0 and r²<g+1, its universal analytic isomonodromic deformation is algebraizable exactly when its monodromy has finite image. In the hyperbolic range use the mild-connection isomonodromy theorem; the unpointed genus-one rank-one case requires its separate comparison.

**Atlas planet:** Algebraic universal isomonodromy criterion.

**Construction or proof:**

1. Import the regular-singular Riemann–Hilbert and mild canonical-extension comparison, including the stable pointed-curve hypothesis of CH19.
2. In the hyperbolic range CH19 identifies algebraizability with finite MCG orbit. The main theorem gives finite image; conversely finite image gives finite orbit.
3. Do not apply CH19 outside 2g−2+n>0. The genus-one unpointed comparison remains an explicit source gate.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `HodgeStructuresPartII:H.1`; `HodgeStructuresPartII:H.2`; `StableReductionPartII:MC.2`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 1.2.3, p.4; CH19 Theorem A, pp.3–4.

### C.6/free-finiteness — Free-group canonical finiteness

**Theorem.** Let N=2g or 2g+1 and ρ:F_N→GL_r(C). If its actual conjugacy class has finite Out(F_N)-orbit and r²<g+1, then its image is finite.

**Atlas planet:** Free-group canonical finiteness.

**Construction or proof:**

1. For even N identify F_N with π₁Σ(g,1); for odd N use Σ(g,2). Restrict the Out(F_N)-action to surface mapping classes.
2. Apply the surface theorem. This is a consequence in one direction; finite mapping-class orbit is not claimed equivalent to finite Out orbit.
3. Handle N=0 and N=1 directly under the rank inequality, which forces rank zero.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MordellLawrenceVenkatesh:LV.5`; `mathlib:FreeGroup`; `mathlib:Matrix.GeneralLinearGroup`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 1.6.1, p.5.

### C.6/nielsen-tuples — Nielsen matrix finiteness criterion

**Theorem.** For N≥2 with N=2g or 2g+1, let (A₁,…,A_N) be invertible complex r×r matrices. If the tuples obtained by cyclic permutation, swapping the first two entries, inverting A₁, and replacing A₁ by A₁A₂ meet only finitely many simultaneous conjugacy classes, and r²<g+1, then the Aᵢ generate a finite group.

**Construction or proof:**

1. Import Nielsen generation of Aut(F_N) with these conventions.
2. Although only forward words are specified, each invertible generator permutes the finite set of reached conjugacy classes; its inverse therefore preserves this set.
3. Apply the free-group finite-orbit theorem via the basis evaluation equivalence.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/free-finiteness`; `MordellLawrenceVenkatesh:LV.5`; `mathlib:FreeGroup.lift`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 1.6.3, pp.5–6.

### C.6/characteristic-quotient — Characteristic quotient consequence

**Theorem.** Let G be a quotient of F_N by a characteristic normal subgroup, N=2g or 2g+1. A rank-r representation of G with finite Out(G)-orbit has finite image when r²<g+1. Likewise for a characteristic quotient of a surface group under its induced mapping-class action and the surface bound.

**Construction or proof:**

1. Pull back along the surjection. Characteristicity induces the automorphism action on the quotient; pullback preserves conjugacy and the image, so apply the appropriate finite-orbit theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.6/free-finiteness`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 1.6.5, p.6.

### C.6/total-finiteness — Finite total mapping-class image

**Theorem.** For a finite-index Γ⊂PMod(g,n+1) containing the hyperbolic point-pushing subgroup, a representation of rank r with r²<g+1, finite determinant and irreducible restriction to the surface group has finite total image.

**Construction or proof:**

1. Use point-pushing restriction, canonical finite monodromy on the normal subgroup, and the arbitrary-group irreducible normal-restriction theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/point-push-restriction`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 10.1.7, p.51.

## C.7. Generic arithmetic curves

Define arithmetic finite Galois orbit, compare it with finite topological mapping-class orbit on a curve generic over M(g,n) over Q, and prove arithmetic finite monodromy. Formulate the four-way geometric/Hodge equivalence and its wider three-way range with a precise integral-realization supplier contract.

**Stage dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `StableReductionPartII:MC.4`; `MappingClassGroupsAndCanonicalRepresentations:C.6`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `MordellLawrenceVenkatesh:LV.5`; `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.7/arithmetic — Arithmetic geometric representations

**Definition.** For a geometrically connected variety X over a finitely generated characteristic-zero field K and a continuous ρ:π₁ᵉᵗ(X_Kbar)→GL_r(Qbar_ℓ), arithmetic means that the actual conjugacy class of ρ has finite orbit under Gal(Kbar/K), acting through the outer arithmetic fundamental-group action. This is a property of the geometric representation; no chosen linear extension to π₁ᵉᵗ(X) is part of the definition.

**Atlas planet:** Arithmetic geometric representations.

**Construction or proof:**

1. Use the supplied arithmetic fundamental-group exact sequence and the existing outer-action conjugacy quotient.
2. Define finite orbit and identify it with a finite-index stabilizer; for continuous families of actions distinguish an abstract finite-index subgroup from an open subgroup when needed.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`.

**Uses that determine the API:**

- C.7 generic curve theorem: Transfers a finite Galois orbit to a finite mapping-class orbit.
- C.8 nonlifting: Specifies the arithmetic characteristic-zero lifts excluded by the theorem.

**API:**

- `arithmetic_conjugate` (compatibility): Arithmeticity is invariant under a fixed GL conjugation.
- `arithmetic_finiteExtension` (equivalence): Arithmeticity is unchanged after a finite extension of K inside Kbar.
- `arithmetic_extension_sufficient` (characterisation): A representation extending linearly to the arithmetic group after a finite K-extension is arithmetic; extension is sufficient and is not the definition.

**Discriminating unit tests:**

- `arithmetic_trivial` (degenerate): The trivial representation is fixed by the whole Galois group.
- `arithmetic_finiteImage` (characterisation): A finite-image representation is arithmetic when the geometric profinite group is topologically finitely generated, since only finitely many maps to its fixed finite image exist.
- `arithmetic_not_groupFinite` (non-example): For X=Spec Q and the trivial geometric representation, arithmeticity holds although Gal(Qbar/Q) is infinite; a definition demanding a finite Galois group fails this example.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Definition 9.1.1, p.45.

### C.7/arithmetic-comparison — Generic curve orbit comparison

**Theorem.** Let (C,x₁,…,x_n)/K be a smooth geometrically connected pointed curve, K finitely generated of characteristic zero, in the hyperbolic range. Suppose SpecK→M(g,n)_Q factors through its generic point. Every continuous arithmetic geometric representation has finite mapping-class orbit after choosing K↪C, restricting to the dense topological surface group, and transporting coefficients by an abstract field isomorphism Qbar_ℓ≃C.

**Atlas planet:** Generic curve orbit comparison.

**Construction or proof:**

1. Compare the arithmetic exact sequence of the curve over K with that of the universal punctured curve over M(g,n)_Q, using a fine level scheme if necessary. The generic dominance gives finite-index image on the moduli étale fundamental group.
2. Use characteristic-zero algebraically closed base change for the nonproper punctured curves, Riemann existence and compatible outer actions. The universal homotopy sequence and its kernel injection require the precise profinite centerlessness/exactness theorem; discrete centerlessness alone is not a proof.
3. The Galois orbit finiteness descends to the moduli group and then to its topological mapping-class subgroup. The coefficient field isomorphism is purely algebraic and is not used to preserve ℓ-adic topology.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic`; `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`; `StableReductionPartII:MC.4`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Proof of Theorem 9.1.2, pp.46–47.

### C.7/arithmetic-finite — Generic arithmetic finite monodromy

**Theorem.** For K finitely generated of characteristic zero and a smooth geometrically connected n-pointed genus-g curve whose moduli map is generic over M(g,n)_Q, every continuous arithmetic ρ:π₁ᵉᵗ(C_Kbar minus the marks)→GL_r(Qbar_ℓ) with r²<g+1 has finite image.

**Atlas planet:** Generic arithmetic finite monodromy.

**Construction or proof:**

1. Handle rank zero, and genus-one rank one directly by geometric SL₂ monodromy if the hyperbolic comparison does not apply.
2. Apply the generic orbit comparison and the surface finiteness theorem to the dense topological subgroup.
3. In the original ℓ-adic topology a finite set is closed. Continuity and density therefore force the entire étale image to equal that finite image.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-comparison`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Theorem 9.1.2, p.45; proof, pp.46–47.

### C.7/finite-arithmetic — Finite monodromy is arithmetic

**Theorem.** For a smooth geometrically connected finite-type curve in characteristic zero over finitely generated K, every continuous finite-image geometric ℓ-adic representation is arithmetic.

**Construction or proof:**

1. The geometric profinite fundamental group is topologically finitely generated. Precomposition with its outer automorphisms yields only finitely many homomorphisms into the same finite matrix group.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MordellLawrenceVenkatesh:LV.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 9.1.4, pp.45–46, implication (1)⇒(2).

### C.7/hodge-characterisation — Geometric and Hodge characterisations

**Theorem.** For a generic pointed curve as above and r²<g+1, compare: finite image; arithmeticity; geometric origin after every K↪C and every Qbar_ℓ≃C; and polarizable integral Hodge realization after every such choice. Here geometric origin is the supplied subquotient-on-a-dense-open notion. The integral realization must allow the given complex local system as a direct summand of the complexification of an integral polarizable variation, with the coefficient-conjugate condition needed by LL22. It must not mean that an arbitrary complex irreducible itself has a rank-r Z-lattice. The precise equivalence with the source’s integral-PVHS wording is an explicit H.5 gap.

**Atlas planet:** Geometric and Hodge characterisations.

**Construction or proof:**

1. Finite image gives geometric origin via a finite étale cover and Hodge realization as a summand of its integral regular representation.
2. Import the precise geometric-origin-to-integral-Hodge-realization comparison, with subquotients, coefficient fields and all conjugates tracked.
3. Use an analytically very general embedding of the generic moduli field and LL22 small-rank integral-Hodge finiteness. The arithmetic equivalence uses the generic arithmetic theorem.
4. The integral-realization carrier and comparison are supplier/source gates; this node is not claimed proof-closed.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `MappingClassGroupsAndCanonicalRepresentations:C.7/finite-arithmetic`; `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Checks:**

- A non-real one-dimensional character of a finite cyclic group must be admitted via a summand of a larger integral realization; it generally has no rank-one integral lattice.
- The embedding and coefficient-isomorphism quantifiers are universal.

**Source:** LL24, Corollary 9.1.4, pp.45–46; LL22 Theorem 1.2.5 and Corollary 1.2.7, pp.3–4.

### C.7/wider-hodge-range — Wider Hodge finiteness range

**Theorem.** For the same generic pointed curve, finite image, geometric origin for every complex embedding/coefficient isomorphism, and integral Hodge realization in the precise preceding sense are equivalent when r<2√(g+1). Arithmeticity is not included in this wider equivalence. The same integral-realization source gate applies.

**Construction or proof:**

1. Use the finite-image constructions and the LL22 very-general-curve Hodge/geometric-origin bound; no use of the low-rank arithmetic theorem can establish a wider arithmetic statement.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/hodge-characterisation`; `HodgeStructuresPartII:H.4`; `HodgeStructuresPartII:H.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 9.1.4, p.46, final assertion.

## C.8. Residual lifts and nondensity

Define residual arithmetic lifts. Prove the uniform Jordan-word obstruction, nonliftability for sufficiently large residual characteristic, explicit surjections, and nondensity on hyperbolic surfaces. State only the justified conditional nonflat/nonsmooth deformation-ring consequence.

**Stage dependencies:** `MappingClassGroupsAndCanonicalRepresentations:C.7`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `HodgeStructuresPartII:H.5`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `MordellLawrenceVenkatesh:LV.5`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `DeformationAndDerivedPatchingAlgebra:R03.4`; `DeformationAndDerivedPatchingAlgebra:R03.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.8/residual-lift — Residual arithmetic lifts

**Definition.** For a residual representation ρbar:π₁ᵉᵗ(C_Kbar°)→GL_r(F_p), an arithmetic lift consists of a finite extension E/Q_p, an O_E-lattice L of rank r, and a continuous characteristic-zero arithmetic representation on L⊗E, preserving L, whose residual representation becomes isomorphic to ρbar after a chosen residue-field embedding and scalar extension. A residual geometric-origin realization is such a stable-lattice reduction of a characteristic-zero representation of geometric origin, with its specified coefficient field. Do not quantify only over unramified lifts.

**Atlas planet:** Residual arithmetic lifts.

**Construction or proof:**

1. Use the shared arithmetic predicate and generic integral-lattice/reduction objects.
2. State the reduction isomorphism, with its residue scalar extension, as part of the lifting data. Import geometric-origin descent to arithmeticity for its use in nonlifting.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `HodgeStructuresPartII:H.5`.

**Uses that determine the API:**

- C.8 Jordan obstruction: Tests an actual finite characteristic-zero image after generic arithmetic finiteness.

**API:**

- `arithmeticLift_reduction` (projection): Reduction of the chosen stable lattice, after the specified residue extension, is isomorphic to ρbar.
- `arithmeticLift_fieldExtension` (functoriality): A finite coefficient extension of a lift is again a lift with the induced reduction comparison.
- `geometricResidual_implies_lift` (compatibility): A residual geometric-origin realization gives an arithmetic lift only through the supplied characteristic-zero geometric-origin descent theorem.

**Discriminating unit tests:**

- `residualLift_trivial` (degenerate): The trivial residual representation has its trivial Z_p-lattice lift.
- `residualLift_not_matrix_lift` (non-example): Lifting generator matrices arbitrarily to O_E is not a lift unless all group relations hold and the resulting homomorphism is continuous.
- `residualLift_ramified` (compatibility): The definition admits a stable lattice over a ramified finite coefficient extension; it agrees with ordinary scalar-extended reduction there.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Definition 9.2.1, pp.47–48; Corollary 9.2.2, p.48.

### C.8/jordan-word — Uniform Jordan word obstruction

**Theorem.** For each r≥2 there is an integer m(r)>0 such that every finite subgroup of GL_r in characteristic zero satisfies [x^m,y^m]=1. For every prime p not dividing m(r), GL_r(F_p) violates this identity. Consequently it cannot be a quotient obtained by reducing a finite characteristic-zero matrix subgroup of rank r.

**Atlas planet:** Uniform Jordan word obstruction.

**Construction or proof:**

1. Import Jordan’s uniform bound J(r) on the index of a normal abelian subgroup, and take m(r)=J(r)!, not merely the raw index bound.
2. Then all m-th powers lie in that abelian subgroup. Polynomial identities survive reduction and quotients.
3. Use opposite 2×2 unipotents embedded as a block in rank r; their m-th powers have off-diagonal entries m and do not commute when p∤m.

**Direct prerequisites:** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`.

**Checks:**

- Check the two opposite-unipotent block calculation in rank two.
- The exceptional set is the finite set of primes dividing m(r); an assertion for every p is not justified.

**Source:** LL24, Proof of Corollary 9.2.2, p.48; LL22 Lemma 7.5.1 proof, p.54.

### C.8/nonlifting — Residual arithmetic nonlifting

**Theorem.** For the generic characteristic-zero pointed curve, if 1<r<√(g+1), p∤m(r), and ρbar is a surjection onto GL_r(F_p), then it has no arithmetic characteristic-zero lift in the stable-lattice sense. It has no residual geometric-origin realization once the geometric-origin-to-arithmetic descent supplier is applied.

**Atlas planet:** Residual arithmetic nonlifting.

**Construction or proof:**

1. An arithmetic lift would have finite image by the generic arithmetic theorem. Reduce its uniform Jordan word to contradict residual surjectivity.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.8/residual-lift`; `MappingClassGroupsAndCanonicalRepresentations:C.8/jordan-word`; `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `HodgeStructuresPartII:H.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Corollary 9.2.2, p.48.

### C.8/residual-surjections — Surjective residual examples

**Theorem.** For every prime p and r≥2, a smooth characteristic-zero curve with n>0 and 2g+n−1≥2, or with n=0 and g≥2, has a continuous geometric representation surjecting onto GL_r(F_p). On the generic curves in the low-rank range these examples have no arithmetic lifts when p∤m(r).

**Construction or proof:**

1. Import two-generation of GL_r(F_p) with a primary-source certificate.
2. An open curve has a free profinite geometric group of the indicated rank. For a closed curve send all bᵢ to 1 in the surface presentation to obtain a free profinite quotient on g generators.
3. Map two free generators to the certified generating pair. Apply nonlifting only outside the finite exceptional prime set.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MappingClassGroupsAndCanonicalRepresentations:C.8/nonlifting`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Example 9.2.3, pp.48–49 (prime restriction corrected for nonlifting).

### C.8/nondensity — Arithmetic representation nondensity

**Theorem.** For a hyperbolic surface with g≥1, r≥2, the finite-image rank-r semisimple complex representations lie in a proper closed locus of the character variety. Thus on the generic curve in the range 1<r<√(g+1), arithmetic geometric representations are not Zariski dense. The unpointed torus is excluded.

**Atlas planet:** Arithmetic representation nondensity.

**Construction or proof:**

1. The uniform Jordan word imposes finitely many generator word identities on the representation scheme and descends to a closed conjugation-invariant character locus.
2. To see it is proper, use a free quotient on two generators, map them to the opposite unipotent blocks, and semisimplify; the irreducible SL₂ block still violates the identity.
3. Use arithmetic finite monodromy in the smaller rank range. On the unpointed torus torsion characters are dense, so no unrestricted genus-one statement is exported.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.8/jordan-word`; `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `MordellLawrenceVenkatesh:LV.5`; `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 9.1.3, p.45; LL22 Lemma 7.5.1 and proof, pp.53–54.

### C.8/conditional-nonflat — Conditional nonflat deformation rings

**Theorem.** Suppose a nonliftable residual example extends to an absolutely irreducible residual representation of an arithmetic profinite group, and suppose its framed or unframed deformation functor has a specified nonzero complete Noetherian local W(F)-algebra R for which every nonempty characteristic-zero generic fibre has a point over a finite extension of Frac W(F), giving an arithmetic lift of the specified geometric representation. Then R[1/p]=0, R is not flat over W(F), and it is not formally smooth over W(F). No failure of the complete-intersection property follows from this argument.

**Construction or proof:**

1. Use the supplier’s representability and characteristic-zero-point theorem; if R[1/p] were nonzero it would supply the prohibited lift.
2. Flatness of the nonzero R over W(F) would make multiplication by p injective and force a nonempty generic fibre. Formal smoothness would supply compatible Witt lifts.
3. Do not identify deformations of the geometric group with deformations of a chosen arithmetic extension without proving the descent and extension hypotheses.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.8/nonlifting`; `DeformationAndDerivedPatchingAlgebra:R03.4`; `DeformationAndDerivedPatchingAlgebra:R03.2`.

**Checks:**

- The ring Z_p[[x]]/(p) is nonflat but a complete intersection, disproving the inference used in the source remark.
- This target is conditional on a specified arithmetic residual extension and the coefficient-point theorem, neither supplied merely by the geometric surjection.

**Source:** LL24, Remarks 9.2.5–9.2.6, p.49 (weakened to the justified conditional conclusion).

## C.9. Examples and range checks

Construct the surface and free-group abelianization unipotent examples, plan the three Morita/augmentation examples with source gates, record genus-one and rank-two classifications and higher-rank existence certificates. Keep the source’s classification, rigidity, rank-minimum and free-group conjectures explicitly open.

**Stage dependencies:** `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `StableReductionPartII:MC.2`; `HodgeStructuresPartII:H.2`; `HodgeStructuresPartII:H.5`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.9/unipotent-example — Abelianization unipotent representations

**Construction.** For G a free group F_N or a closed genus-g surface group, let H=G_ab⊗Z C and a:G→H be abelianization followed by scalar extension. Define U_G(γ)(v,t)=(v+t a(γ),t) on H⊕C. It has rank dimH+1, is unipotent, and its actual conjugacy class is fixed by Out(G). If H≠0 then it has infinite image and is a nonsplit extension of trivial representations.

**Atlas planet:** Abelianization unipotent representations.

**Construction or proof:**

1. The additive identity a(γδ)=a(γ)+a(δ) proves the representation law.
2. An automorphism of G acts invertibly on H; conjugation by its block diagonal action on H⊕C implements precomposition. Inner automorphisms act trivially on H, so the conjugacy class descends to Out(G).
3. Nonzero integral abelianization gives an infinite cyclic subgroup of translations. An invariant complement to H would force a=0.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Uses that determine the API:**

- C.9 rank checks: Exhibits actual infinite-image finite-orbit representations above the small-rank range.
- C.0 finite orbit: Checks that semisimplification cannot replace actual conjugacy in the definition.

**API:**

- `unipotentExample_action` (simp): The action on (v,t) is (v+t a(γ),t).
- `unipotentExample_outFixed` (functoriality): The block diagonal abelianization action of α conjugates the representation to its precomposition by α.
- `unipotentExample_rank` (characterisation): Its rank is N+1 for F_N and 2g+1 for a closed genus-g surface group.
- `unipotentExample_split_iff` (characterisation): The extension of trivial modules splits exactly when the additive map a is zero.

**Discriminating unit tests:**

- `unipotent_F2_matrices` (computation): For the two basis generators of F₂ the matrices are I₃+E₁₃ and I₃+E₂₃, respectively.
- `unipotent_F0` (degenerate): For F₀ the representation is the one-dimensional trivial representation, not a nontrivial extension.
- `unipotent_F1_nonsplit` (non-example): For F₁=Z the generator matrix [[1,1],[0,1]] has infinite order and a nonsplit invariant line, though its semisimplification is trivial.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Example 10.1.6(3), p.51; Remark 10.2.7, pp.52–53.

### C.9/morita-primitive — Morita primitive exterior extension

**Theorem.** For closed genus g≥3, with H=H₁(Σ_g,Q) and the symplectic inclusion H→∧³H, there is a nonzero class in H¹(Mod_g,(∧³H)/H), hence a nonsplit extension 0→(∧³H)/H→W→Q→0 and a nontrivial deformation of its split representation. The nonzero class, the normalization of H→∧³H and the genus range require the original Morita source certificate.

**Construction or proof:**

1. Import the symplectic surface representation and exterior powers, and the group-cohomology extension dictionary.
2. Use Morita’s nonzero class as an explicitly source-gated input; scaling its cocycle gives the deformation with split special fibre.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- At g=2, H→∧³H is an isomorphism, so the displayed quotient cannot support the asserted nonzero class.
- The original nonvanishing proof is required before this example can be closed.

**Source:** LL24, Example 10.1.6(1), p.50; citation [Mor93].

### C.9/augmentation-extension — Augmentation-ideal extension example

**Theorem.** For g≥2 and n>0 with 2g+n−3>0, let I be the augmentation ideal of Q[π₁Σ(g,n−1)] with its PMod(g,n)-action. The candidate sequence 0→I²/I³→I/I³→I/I²→0 is the punctured-surface nonsplit deformation example. Its nonsplitting needs a worked point-pushing or Johnson computation; the source’s unrestricted direct-computation assertion is not used as a proved theorem.

**Construction or proof:**

1. Use actual group-algebra ideal powers and the existing based mapping-class automorphism action.
2. Compute the degree-two conjugation cocycle and exhibit one point-push with nonzero class after the surface relation; prove this obstructs an equivariant splitting.
3. Record the missing computation as a source gap. Do not extend to (g,n)=(1,1), where abelianity permits an equivariant truncated logarithm splitting.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- The filtration terms are I²/I³ and I/I², not the full untruncated augmentation ideal.
- Provide an explicit nonzero degree-two cocycle and a splitting obstruction, not only a dimension count.

**Source:** LL24, Example 10.1.6(2), p.51.

### C.9/morita-pointed — Morita pointed extension

**Theorem.** For g≥2, plan the non-torsion class in H¹(Mod(g,1),H₁Σ_g,Z) from Morita’s Proposition 6.4, its rational nonsplit extension, and a restriction computation identifying the point-pushing action with the surface abelianization unipotent example of rank 2g+1. A normalization factor in the restricted class must be specified and nonzero; the restriction is not assumed to be exactly the primitive integral class.

**Construction or proof:**

1. Import Morita’s integral class and calculate the point-pushing restriction with the source’s normalization.
2. Over Q rescale a nonzero restriction and identify the action with (v,t)↦(v+t a(γ),t). Use the explicit unipotent construction for the finite-orbit example independently of the global Morita extension.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.9/unipotent-example`; `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- Separate the integral global class from its rationally normalized restriction.
- The canonical surface-group example is unconditional on obtaining the integral global normalization.

**Source:** LL24, Example 10.1.6(3), p.51; [Mor89, Proposition 6.4].

### C.9/genus-one-rank-two — Genus-one rank-two examples

**Theorem.** For g=1,n>0, there are rank-two semisimple MCG-finite surface representations with infinite special-dihedral image, and rank-two nonsplit infinite-image MCG-finite examples. These are punctured-torus examples, not representations of the closed abelian torus group. Their finite-orbit and infinite-image certificates are source-gated by the BGMW and Cousin–Heu classifications.

**Atlas planet:** Genus-one rank-two examples.

**Construction or proof:**

1. Import the explicit special-dihedral normal forms and their orbit calculation, and the nonsplit classification with all puncture restrictions.
2. Check infinite image and semisimplicity separately for the dihedral example; compare its rank with the strict square-root bound.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 10.2.1, p.52; [BGMW17, Theorem B]; CH19 Theorem B, pp.3–4.

### C.9/low-genus-rank-two — Genus-two and three rank-two finiteness

**Theorem.** For g=2 or 3 and every n≥0, every MCG-finite representation π₁Σ(g,n)→GL₂(C) has finite image, a range improvement over the general square-root theorem.

**Atlas planet:** Genus-two and three rank-two finiteness.

**Construction or proof:**

1. Import the nonsplit rank-two classification to handle reducible cases.
2. Use determinant finiteness. Choose a square root character; its possible choices form a finite set because the surface group is finitely generated. Thus twisting to determinant one preserves finite orbit after a finite-index stabilizer.
3. Apply the SL₂ finite-orbit classification. The primary BGMW theorem and nonsplit normal forms are explicit source gates.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Remark 10.2.2, p.52; [BGMW17, Theorem A]; CH19 Theorem B, pp.3–4.

### C.9/large-semisimple — Large-rank semisimple examples

**Theorem.** Plan explicit infinite-image semisimple MCG-finite surface representations of rank bounded exponentially in g, by restricting a certified TQFT or Kodaira–Parshin mapping-class representation to the point-pushing subgroup. The supplier certificate must give the genus/puncture range, actual rank formula, semisimplicity of the restricted representation, and infinite point-pushing image, rather than mere nontriviality.

**Construction or proof:**

1. Obtain one complete explicit construction from the existing geometric-family or quantum-topology owner, with its exact range and rank.
2. Use point-pushing restriction for finite orbit. Verify that the restricted image is infinite and the restriction semisimple; neither follows merely from nontrivial total monodromy.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/point-push-restriction`; `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.2`; `HodgeStructuresPartII:H.2`.

**Checks:**

- A source certificate with a concrete rank formula is required before claiming this example closed.
- Do not infer semisimplicity of an arbitrary subgroup restriction from semisimplicity of a total representation.

**Source:** LL24, Example 10.2.4, p.52; [KS16, Corollary 4.3], [BKMS18, Theorem 5.1], [LL19, Example 3.3.1]; LL22 Proposition 5.1.1 and Remark 5.1.2 (not read here).

### C.9/free-examples — Small free-group examples

**Theorem.** For F₁, any non-torsion rank-one character has infinite image and an Out(F₁)-orbit of size two. For F₂, plan an infinite-image semisimple finite-Out-orbit example from a faithful linear representation of Aut(F₂) or a Kodaira–Parshin construction, with the infinite image after semisimplification explicitly verified. No existence theorem is asserted for every F_N with N≥3.

**Construction or proof:**

1. The F₁ computation uses Out(Z)={±1}.
2. For F₂ import a primary-source finite-dimensional linear construction or the geometric family and verify the normal-subgroup image survives semisimplification; use the automorphism-group version of the canonical projective extension/restriction argument.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.2`.

**Checks:**

- The F₂ source certificate must distinguish a faithful nonsplit representation from a semisimple infinite-image restriction.
- Keep Conjecture 10.2.8 for N≥3 open.

**Source:** LL24, Remark 10.2.7 and Conjecture 10.2.8, pp.52–53.

### C.9/rigid-punctured-sphere — Rigid punctured-sphere examples

**Theorem.** Plan the application that a physically rigid irreducible local system on a punctured sphere, with its ordered local conjugacy classes fixed, is MCG-finite: pure mapping classes preserve local classes and physical rigidity leaves a single global conjugacy class. A concrete infinite-image rigid example and its physical-rigidity certificate remain assigned to the Hodge/rigid-local-system supplier.

**Construction or proof:**

1. Use the supplier’s physical-rigidity uniqueness statement. Do not identify it with adjoint middle-extension H¹ vanishing without the irreducibility and comparison theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `HodgeStructuresPartII:H.5`; `MordellLawrenceVenkatesh:LV.5`.

**Checks:**

- Establish the stated result with the listed hypotheses; preserve base-point and conjugation conventions.

**Source:** LL24, Example 10.2.5, p.52; citation [Kat96].

## Supplier contracts

These are precise requests anchored in existing stages. Extensions beyond current stage scope are proposed in the structure ledger; their anchors are not claims of existing coverage.

### R1. MordellLawrenceVenkatesh:LV.5

Import the existing surface carrier, ordered/pure and full mapping classes, standard π₁ presentation and punctured freeness, Dehn twists and finite generating sets, point-pushing and the Birman sequence in the hyperbolic range, boundary capping, cover lifting and surface homology. Existing exact nodes include surface, mapping-class-group, dehn-twist, point-push, birman-exact-sequence, capping-surjective and surface-homology in this stage. Extend the same owner for Nielsen generators of Aut(F_N), the positive-genus rank-one twist calculation, and AS16 Proposition 2.4 for finite-index groups. The packet is pending transfer to topology owners: retain one owner and the existing node ids; do not re-plan them here.

**Direct consumers:** `C.0/finite-orbit`, `C.0/moduli-monodromy`, `C.0/family-exact`, `C.1/point-push-restriction`, `C.1/rank-one`, `C.3/prym-action`, `C.3/boundary-reduction`, `C.4/boundary-quasiunipotence`, `C.6/free-finiteness`, `C.6/nielsen-tuples`, `C.7/finite-arithmetic`, `C.8/residual-surjections`, `C.8/nondensity`, `C.9/unipotent-example`, `C.9/morita-primitive`, `C.9/augmentation-extension`, `C.9/morita-pointed`, `C.9/genus-one-rank-two`, `C.9/low-genus-rank-two`, `C.9/large-semisimple`, `C.9/free-examples`, `C.9/rigid-punctured-sphere`.

### R2. StableReductionPartII:MC.2

Use StableReductionPartII:key/moduli-curves for the common pointed-curve carrier and MC.2 for the smooth hyperbolic universal punctured curve. Supply its analytic orbifold presentation and base-change compatibility; stable universal curves include collisions/nodes, so restrict to the smooth punctured locus before identifying M(g,n+1).

**Direct consumers:** `C.0/versal-family`, `C.0/moduli-monodromy`, `C.6/isomonodromy`, `C.9/large-semisimple`, `C.9/free-examples`.

### R3. StableReductionPartII:MC.3

Supply pointed stable boundary charts whose complex local monodromy is a commuting multitwist with explicitly labelled vanishing cycles. Stack-normal-crossings need not be globally simple; export chartwise inertia for use after level cover and resolution.

**Direct consumers:** `C.4/boundary-quasiunipotence`.

### R4. StableReductionPartII:MC.4

Supply connected smooth quasiprojective fine level scheme charts with universal pointed curves and finite étale maps onto smooth M(g,n), for all 2g−2+n>0. The current unpointed g≥2 full-level node is not enough for genus-one pointed families or all n. Add the pointed extension in this owner, retaining pairing-component and automorphism hypotheses.

**Direct consumers:** `C.0/versal-family`, `C.0/family-exact`, `C.1/projective-extension`, `C.2/linear-realization`, `C.3/versal-cover`, `C.4/boundary-quasiunipotence`, `C.7/arithmetic-comparison`.

### R5. DiamondsAndVStacks:D0

Supply the ordinary analytic locally constant module-sheaf/fundamental-groupoid equivalence, compatible with TauCeti.LocalCoefficientSystem, and the ordinary derived-sheaf Rπ_* Leray low-degree sequence and projection formula. In particular export H¹(base,π_*L)→H¹(total,L)→H⁰(base,R¹π_*L). This is ordinary sheaf cohomology, not just a Serre spectral sequence for singular chains.

**Direct consumers:** `C.2/kill-finite-class`, `C.2/artin-decomposition`, `C.3/cover-cohomology`, `C.4/strong-rigidity`.

### R6. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology

Use the existing relative singular/local-coefficient chain and cohomology comparison, covering transfer and filling-puncture exact sequence. This stage does not, by its current statement, supply ordinary analytic-sheaf Leray.

**Direct consumers:** `C.3/prym-action`, `C.3/boundary-reduction`, `C.9/unipotent-example`.

### R7. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Supply oriented compact-surface Poincaré duality and naturality for orientation-preserving deck and mapping-class actions, including the relation between a σ component and its dual label.

**Direct consumers:** `C.3/prym-action`, `C.3/cover-cohomology`.

### R8. tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count

Use the existing finite-group Schur and isotypic evaluation interfaces. Generic isotypicComponent and the degree-square identity are already cited from the pins. A new Character theory, Part II layer is needed for Jordan’s uniform bound for finite subgroups of GL_r in characteristic zero, and a certified two-generator theorem for GL_r(F_p); neither is supplied by the degree-square theorem.

**Direct consumers:** `C.3/prym-action`, `C.3/cover-cohomology`, `C.3/pw-small-degree`, `C.6/extension-splitting`, `C.8/jordan-word`.

### R9. tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier

The current layer treats finite-group factor sets and Schur multipliers. Extend in Induction, restriction, and Mackey theory, Part II to projective representations of arbitrary discrete groups, finite central isogenies and the H² obstruction with fixed fibre lift. The surface/Aut(F_N) intertwiner extension here is a consumer specialization, not a substitute for that general carrier.

**Direct consumers:** `C.1/projective-extension`, `C.2/prescribed-lift`, `C.4/linear-integrality`, `C.8/jordan-word`.

### R10. tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

The current roadmap is continuous profinite cohomology. A Part II contract must supply arbitrary discrete-group low-degree cohomology, representation extensions, the LHS spectral sequence and its filtration/five-term sequence for 1→N→G→Q→1. The lift proof needs successive H¹(Q,H¹(N,μ)) and H²(Q,μ) killing, and an invariant fibre character with vanishing transgression extends to G. Pinned H1InfRes_exact supplies only exactness at its middle term.

**Direct consumers:** `C.2/kill-finite-class`, `C.2/prescribed-lift`, `C.9/morita-primitive`, `C.9/augmentation-extension`, `C.9/morita-pointed`.

### R11. DeformationAndDerivedPatchingAlgebra:R03.2

Extend the abstract deformation interface to finitely presented discrete groups over local Artinian C-algebras with residue C, actual and conjugacy deformation functors with constant determinant, tangent H¹(G,adρ), restriction to normal subgroups and LL24 Proposition 3.2.1. Use B_n=C[t]/(tⁿ⁺¹), R_n=B_(n−1)[ε]/ε², derivative embedding f↦f+εf′ and compatible conjugators. This is not supplied by an arithmetic G_{F,S} deformation functor. Put this shared algebra before Hodge and mapping-class consumers.

**Direct consumers:** `C.5/formal-constancy`, `C.8/conditional-nonflat`, `C.9/morita-primitive`, `C.9/augmentation-extension`.

### R12. DeformationAndDerivedPatchingAlgebra:R03.4

For a specified arithmetic profinite group and absolutely irreducible residual extension, provide representability with its coefficient category and the finite-extension-valued point theorem for a nonzero characteristic-zero generic fibre. Only with these hypotheses can geometric nonlifting imply nonflatness of an arithmetic deformation ring.

**Direct consumers:** `C.8/conditional-nonflat`.

### R13. InverseGaloisAndArithmeticFundamentalGroups:IG.0

Supply the ordinary finite-étale Galois category, arithmetic outer actions and the finite-coefficient singular/étale comparison used in LL24 Lemma 2.3.3, with Artin K(π,1) good neighbourhoods. No theorem that every smooth variety is a K(π,1) is requested.

**Direct consumers:** `C.2/kill-finite-class`, `C.7/arithmetic`, `C.7/arithmetic-comparison`, `C.7/finite-arithmetic`.

### R14. InverseGaloisAndArithmeticFundamentalGroups:IG.1

Supply characteristic-zero geometric/arithmetic exact sequences, topological finite generation of geometric curve groups, algebraically closed field-extension invariance for punctured curves (SGA1 XIII Corollary 4.6, not only proper X Corollary 1.8), and the compatible universal-punctured-family sequence after a fine-level scheme cover. Include Riemann existence/profinite completion and the exact profinite kernel/centerlessness theorem needed for injectivity; do not infer it from discrete centerlessness. Add the nonproper family comparison in Inverse Galois and arithmetic fundamental groups, Part II where beyond the current selected proper range.

**Direct consumers:** `C.2/kill-finite-class`, `C.7/arithmetic`, `C.7/arithmetic-comparison`, `C.7/arithmetic-finite`, `C.7/finite-arithmetic`, `C.7/hodge-characterisation`, `C.8/residual-lift`, `C.8/residual-surjections`.

### R15. InverseGaloisAndArithmeticFundamentalGroups:IG.5

Extend the same Hurwitz owner to arbitrary-genus punctured base curves and a prescribed finite quotient φ, with a universal H-torsor after dominant étale scheme refinement, the based quotient identification, and refinement to a specified finite-index stabilizer. Verify Wewers 1998 Theorem 4 in its original form; distinguish H-equivariant vertical inertia Z(H) from all automorphisms of the covered curve.

**Direct consumers:** `C.3/versal-cover`.

### R16. AlgebraicModuliForArithmeticGeometry:R09.6

Supply finite-type actual representation schemes for finitely presented groups, determinant fibres, their universal representations, semisimple closed-orbit criterion and character/GIT quotient with closed invariant loci. For fixed determinant and connected GL_r, prove the GIT component-lifting bridge: a quotient fibre is connected since the closure of each connected orbit contains its unique closed orbit; connected components of the finite-type representation scheme are invariant and have closed, disjoint quotient images. Thus points joined in the analytic quotient lie over the same algebraic connected component, with its actual universal representation. Also supply curve-chain normalization and algebraic descent of invertible intertwiners. The current general formal-comparison stage does not assert all these character-variety contracts; propose a representation-moduli extension in the same owner.

**Direct consumers:** `C.5/algebraic-constancy`, `C.8/nondensity`.

### R17. AlgebraicModuliForArithmeticGeometry:R09.7d

Supply a smooth projective SNC compactification preserving the given quasiprojective open after finite level cover and normalization, with a boundary-inertia computation under the chosen resolution. The current resolution theorem supplies smooth SNC compactification; the additional compatibility that exceptional meridians map to products of twist powers must be proved using the pointed stable-boundary charts.

**Direct consumers:** `C.4/boundary-quasiunipotence`.

### R18. HodgeStructuresPartII:H.1

Use finite-determinant reductive monodromy nonabelian Hodge theory, including LL24 Theorem 4.3.1 from Mochizuki Theorem 10.5 with constant determinant and reductive-preserving input. Export a verified bridge to an actual connected algebraic fixed-determinant family linking the original and a fibre-unitary representation, or an alternative proof sufficient for LL24 Theorem 8.5.3. A continuous path in a Betti moduli space does not by itself meet Lemma 8.5.2.

**Direct consumers:** `C.5/algebraic-constancy`, `C.5/semisimple-finite`, `C.6/isomonodromy`.

### R19. HodgeStructuresPartII:H.2

Use polarizable complex variations, admissible graded-polarizable real mixed variations, canonical logarithmic extensions, fixed part, and regular-singular Riemann–Hilbert/canonical mild models. Specifically R¹π°_* of a unitary local system has real MHS weights 1 and 2 with W₁=R¹π_*j_*V and F¹ from E⊗ω(D). The rational/integral mixed-Hodge carrier at the pins does not cover arbitrary real unitary coefficients. Import generic variation definitions, not another carrier here.

**Direct consumers:** `C.6/isomonodromy`, `C.9/large-semisimple`.

### R20. HodgeStructuresPartII:H.4

Supply exactly LL24 Theorem 1.7.1 (rank of each nonzero sublocal system ≥2g−2rk V for total-space unitary V) and Theorem 6.2.1 (H⁰(M,R¹π°_*V)=0 for finite-free local Artin C coefficients, fibre-constant unitary deformation, rank_A V<g). Also supply LL22 Theorem 1.2.12 with an isomonodromic deformation to an analytically general fibre and rank<2√(g+1). These are not arbitrary-subquotient bounds or unitarity of a PVHS on any single curve. For Artinian decomposition import only C.0–C.2 of this roadmap, never its final finiteness layers.

**Direct consumers:** `C.3/prym-rank`, `C.4/strong-rigidity`, `C.4/conjugate-unitarity`, `C.5/formal-constancy`, `C.5/semisimple-finite`, `C.7/hodge-characterisation`, `C.7/wider-hodge-range`.

### R21. HodgeStructuresPartII:H.5

Supply strong adjoint H¹ rigidity, its implication to middle-extension rigidity after quasi-unipotence, finite-determinant strongly rigid semisimple→complex PVHS, and KP20 Theorem 1.2 for split connected reductive Z-groups with G-irreducibility, middle-extension adjoint rigidity, finite abelianization and quasi-unipotent boundary. Include G-valued companions, not just GL integrality. Resolve the precise integral-Hodge-realization versus geometric-origin formulation in LL24 Corollary 9.1.4: track complex direct summands, an ambient integral lattice and all coefficient embeddings; never demand a rank-r Z-lattice on an arbitrary complex constituent. Supply geometric-origin descent to arithmeticity for the residual application and the separate physical-rigidity examples.

**Direct consumers:** `C.4/strong-rigidity`, `C.4/projective-integrality`, `C.4/conjugate-unitarity`, `C.7/hodge-characterisation`, `C.7/wider-hodge-range`, `C.8/residual-lift`, `C.8/nonlifting`, `C.9/rigid-punctured-sphere`.

## Closure gaps

All of these block proof closure of their consumers. They do not leave an unvisited layer in this design pass.

### G1. Topological supplier transfer and Teichmüller source

LV.5 has the common mapping-class and Birman targets but is pending transfer to topology owners. Confirm the exact contractible Teichmüller uniformization, finite generating set, surface presentation, Nielsen conventions and low-complexity capping statements there. No new generic topology is planned in this packet.

**Consumers:** `C.0/moduli-monodromy`, `C.1/rank-one`, `C.3/boundary-reduction`, `C.6/nielsen-tuples`.

### G2. Pointed fine levels and the unpointed torus

MC.4 currently states unpointed g≥2 levels. Its pointed extension and genus-one comparison are necessary; the unpointed genus-one arithmetic and isomonodromy rank-one cases require a separate Jacobian/point-after-field-extension argument, not the hyperbolic Birman sequence.

**Consumers:** `C.0/versal-family`, `C.2/linear-realization`, `C.6/isomonodromy`, `C.7/arithmetic-finite`.

### G3. Ordinary analytic sheaf comparison and Leray

The fundamental-groupoid local-coefficient carrier is present, but a compatible ordinary locally constant sheaf equivalence, R¹π°_* and Leray exact sequence must be supplied by D0 with the algebraic-topology adapters. A singular Serre spectral sequence is not silently substituted.

**Consumers:** `C.2/artin-decomposition`, `C.3/cover-cohomology`, `C.4/strong-rigidity`.

### G4. Discrete cohomology and fibre-prescribed lift

Profinite cohomology and finite-group Schur multipliers do not supply the arbitrary discrete-group LHS filtration and central-isogeny obstruction. Verify the successive killing, mismatch character and transgression arguments in the proposed Part II interfaces.

**Consumers:** `C.2/kill-finite-class`, `C.2/prescribed-lift`.

### G5. Artin good-neighbourhood comparison

LL24 Lemma 2.3.3 cites the finite-coefficient comparison and Artin neighbourhood theorem without developing them. Verify the generic étale class killing and the return to group cohomology after shrinking in IG.0/IG.1; the requested map is dominant étale, not necessarily finite.

**Consumers:** `C.2/kill-finite-class`.

### G6. Shared abstract Artinian deformation layer

R03.2 must export LL24 §§3.1–3.2 for arbitrary discrete groups with normal subgroup, rather than merely the arithmetic deformation problem. The derivative trick and compatible formal conjugators are part of that supplier obligation.

**Consumers:** `C.5/formal-constancy`.

### G7. Hodge-engine supplier coverage

HodgeStructuresPartII presently plans H.1–H.5 at stage level; its detailed packet covers H.0 and does not close these contracts. Real admissible VMHS, period derivative, parabolic rank estimates, Artinian vanishing and reductive-group integrality remain supplier work. The application graph uses the early C.2 decomposition before H.4 and later imports H.4.

**Consumers:** `C.3/prym-rank`, `C.4/strong-rigidity`, `C.4/projective-integrality`, `C.4/conjugate-unitarity`, `C.5/formal-constancy`.

### G8. Nonabelian Hodge algebraic-family bridge

Read LL24 pp.27 and43. The deformation statement and the connected algebraic-family constancy lemma have different hypotheses. The proposed bridge uses connected fibres of the fixed-determinant GL GIT quotient and the closed disjoint images of the invariant connected components of the representation scheme; the universal representation on the resulting connected component gives the required family. Verify these generic GIT statements and the fixed-determinant Hodge path in the suppliers. Until then the semisimple and general finiteness proofs remain conditional on that contract.

**Consumers:** `C.5/semisimple-finite`.

### G9. Boundary resolution compatibility

A normalization of a level compactification need not be smooth or have simple normal crossings. Import resolution preserving the open and prove its new inertia loops remain commuting twist products before applying KP20. AS16 Proposition 2.4 itself was read directly.

**Consumers:** `C.4/boundary-quasiunipotence`, `C.4/projective-integrality`.

### G10. Hurwitz existence primary-source check

The arbitrary-genus universal H-torsor refinement in Wewers 1998 Theorem 4 was not read in the original. The LL24 application is read at p.37. IG.5 must verify its range, stack inertia, scheme chart, quotient marking and multisection/refinement claims.

**Consumers:** `C.3/versal-cover`, `C.3/cover-cohomology`.

### G11. Generic étale family exactness and Riemann existence

The original Anderson 1974 Proposition 3 and the nonproper SGA1 XIII base-change theorem are source gates. Verify profinite centerlessness and exactness after level cover, not merely discrete surface centerlessness. ComplexComparisonPartII:C4 concerns Chow algebraization and is not an adequate Riemann-existence citation.

**Consumers:** `C.7/arithmetic-comparison`.

### G12. Integral PVHS and geometric-origin semantics

The literal reading that every complex finite-image constituent itself carries an integral lattice is false. Resolve the intended summand/ambient-integral and coefficient-conjugate formulation against LL22. The four-way and wider three-way statements are source targets with this exact unresolved comparison, not proof-closed corollaries.

**Consumers:** `C.7/hodge-characterisation`, `C.7/wider-hodge-range`, `C.8/residual-lift`.

### G13. Jordan bound and two-generator certificate

Read the Jordan applications in LL24 p.48 and LL22 p.54. The general Jordan theorem and the original Waterhouse two-generation result were not read; Character theory, Part II needs precise characteristic-zero bound and all p,r≥2 generator certificates. Do not identify a bound on index with an integer divisible by every index without taking a factorial.

**Consumers:** `C.8/jordan-word`, `C.8/residual-surjections`.

### G14. Representation-moduli extension

The actual representation scheme, fixed-determinant connected family, semisimple closed-orbit criterion and GIT closed-locus descent need named targets in the moduli owner. R09.6 is the request anchor and does not yet provide these statements.

**Consumers:** `C.5/algebraic-constancy`, `C.8/nondensity`.

### G15. Conditional deformation-ring arithmetic extension

The geometric residual surjection is not a specified residual representation of a fixed arithmetic group. Supply that extension, continuity/representability hypotheses and the finite-coefficient-point theorem before deriving nonflatness. No complete-intersection claim is planned.

**Consumers:** `C.8/conditional-nonflat`.

### G16. Morita primitive class certificate

Original Morita 1993 nonvanishing, the symplectic inclusion normalization and genus range were not read. Require the cited primary nonzero cohomology class, not just LL24’s discussion.

**Consumers:** `C.9/morita-primitive`.

### G17. Augmentation nonsplitting computation

The displayed ideal-power sequence is well defined, but its nonsplitting needs an explicit degree-two point-push computation in the stated g≥2 range. The unrestricted source assertion has low-complexity counterexamples.

**Consumers:** `C.9/augmentation-extension`.

### G18. Morita integral normalization

Morita 1989 Proposition 6.4 was not read. Its restriction may be a nonprimitive multiple of the abelianization cocycle; verify the multiple and separate integral and rational extension claims.

**Consumers:** `C.9/morita-pointed`.

### G19. Rank-two classifications

BGMW Theorems A/B and the full Cousin–Heu nonsplit classification proofs were not read. Obtain exact normal forms, determinant-twist choices and puncture/genus restrictions for the positive and negative rank-two examples.

**Consumers:** `C.9/genus-one-rank-two`, `C.9/low-genus-rank-two`.

### G20. Large-rank and free-group source certificates

Choose and read an original TQFT or Kodaira–Parshin source with an explicit rank and genus range, and prove infinite image after restricting/semisimplifying. The F₂ linearity construction also requires this last verification. These examples are source-gated existence targets, with no claim about all free groups.

**Consumers:** `C.9/large-semisimple`, `C.9/free-examples`.

### G21. Rigid genus-zero example certificate

Physical rigidity gives a finite-orbit application, but a concrete infinite-image rigid local system and the physical/cohomological rigidity comparison must come from H.5 and a read original Katz/accessible primary source.

**Consumers:** `C.9/rigid-punctured-sphere`.

## Structure and ownership

- **rescope** (MappingClassGroupsAndCanonicalRepresentations, MordellLawrenceVenkatesh): The original brief assigns generic mapping-class topology here although LV.5 already plans it. Import the existing nodes and keep only surface-representation applications here. Preserve LV.5 node ids through its pending transfer to GeometricTopology/AlgebraicTopology successors. Add missing Teichmüller, presentation and Nielsen contracts to that shared topology direction, not duplicate nodes in this packet.
- **rescope** (MappingClassGroupsAndCanonicalRepresentations, HodgeStructuresPartII, DeformationAndDerivedPatchingAlgebra): There is a two-way roadmap relationship but no intended target-level cycle. Order LV.5 and MC.2/4, then C.0–C.2; place general Art_C deformation algebra in an R03.2 extension; H.4 imports C.2/artin-decomposition; C.3–C.8 import H.4/H.5. Hodge suppliers must not import the final canonical finiteness theorem.
- **extend** (tauceti:TauCetiRoadmap/ProfiniteCohomology, tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction): The lift requires arbitrary discrete groups; current cohomology is continuous profinite and projective representation theory is finite-group. Propose Profinite cohomology, Part II: discrete comparison and extension obstructions, and Induction/restriction, Part II: arbitrary-group projective extensions. Keep current Tau Ceti roadmaps unchanged; request anchors do not assert current coverage.
- **extend** (tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory, AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups): Jordan bounds, actual representation/character moduli, and nonproper universal étale family comparison exceed the cited suppliers’ currently stated outputs. Add distinct Part II layers in those existing directions: uniform finite linear group bounds; representation schemes and character quotients; nonproper characteristic-zero family comparison. Reuse arbitrary-genus Hurwitz families in IG.5. No new competing carrier or roadmap id is introduced by this packet.

## Open questions

The following are a question inventory, not proved or conditionally assumed theorems. A future research result could change their status; this plan does not prove them.

- **O1** (Questions 10.1.1 and 10.1.3, pp.49–50): Determine rigidity of all irreducible representations of finite-index mapping-class subgroups in sufficiently large genus, and finiteness of the corresponding fixed character loci. No proof target is asserted.
- **O2** (Question 10.1.5, p.50): Determine whether all semisimple mapping-class local systems, and all semisimple canonical surface representations in sufficiently large genus, have geometric origin.
- **O3** (Questions 10.2.3 and 10.2.6, p.52): Determine the minimal infinite-image MCG-finite rank, separately without and with semisimplicity.
- **O4** (Conjecture 10.2.8, p.53): Existence of semisimple infinite-image finite-Out-orbit representations of F_N for every N>0 is a conjecture; the N≥3 cases are not claimed here.
- **O5** (Question 10.3.1, p.53): Classify finite-orbit surface and free-group representations, and compare the surface classification with algebraic isomonodromy under its stated hypotheses.

## Source corrections and proof qualifications

These reports use paraphrases. They contain no source excerpts. A separate independent review must verify the reports; no reviewer verdict is claimed. Extraction mistakes such as the generic arithmetic base field and the torus nondensity range are corrected in the target statements rather than attributed to the paper when its own hypotheses already settle them.

### E1 — misprint

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.0.1, p.12.

Paraphrase: The second orbifold fundamental-group label repeats the n-punctured mapping-class group.

**Correction:** Use PMod(g,n+1) for the universal punctured curve.

**Reason:** The universal curve is M(g,n+1); its Birman kernel is the n-punctured surface group.

**Reach:** nothing. No published correction established in this pass.
### E2 — error

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.2.2, pp.14–15.

Paraphrase: The projective extension is described as unique without restricting the kind of intertwiners.

**Correction:** Uniqueness holds for values represented by actual GL intertwiners.

**Reason:** For the irreducible Q₈ representation its projective image has a nontrivial projective centralizer. In Q₈×C₂ one can change the C₂-value of a PGL extension without changing the restriction to Q₈.

**Reach:** a stated result. No published correction established in this pass.
### E3 — gap

**Locator:** LL24 arXiv:2205.15352v4, Proposition 2.3.4, pp.16–18.

Paraphrase: The LHS filtration passage treats the obstruction as an inflated class before completing all lower-filtration killing.

**Correction:** First kill H¹(Q,H¹(N,μ)); then choose and kill the resulting H²(Q,μ) class. Afterwards extend and remove the finite fibre-mismatch character, killing its transgression as needed.

**Reason:** A class restricting trivially to N is only in the first kernel filtration, not necessarily in the inflation image before the edge obstruction vanishes.

**Reach:** the proof. No published correction established in this pass.
### E4 — gap

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.4.2, pp.19–20.

Paraphrase: The family decomposition is presented without repeating the positive-genus condition used by its realization input.

**Correction:** Impose g≥1 for this proof and its use of Corollary 2.3.5.

**Reason:** The preceding finite-determinant/linear-realization arguments use positive-genus rank-one finiteness; the statement must not silently use them for genus zero.

**Reach:** the proof. No published correction established in this pass.
### E5 — misprint

**Locator:** LL24 arXiv:2205.15352v4, Lemma 7.2.5, p.36.

Paraphrase: The boundary-replaced covering surface is labelled with the base genus.

**Correction:** Its genus is g′ throughout the deformation-retraction comparison.

**Reason:** Removing discs and replacing them by punctures does not change the covering genus.

**Reach:** nothing. No published correction established in this pass.
### E6 — gap

**Locator:** LL24 arXiv:2205.15352v4, Theorem 8.5.3, p.43 with Theorem 4.3.1, p.27.

Paraphrase: A nonabelian Hodge deformation is used with the constancy result for connected algebraic families of actual representations.

**Correction:** Supply the actual connected algebraic fixed-determinant family, or a separate argument giving the same conjugacy conclusion.

**Reason:** Continuity of a deformation in a Betti/Hodge moduli space alone does not produce the representation over Γ(X,O_X) required in Lemma 8.5.2.

**Reach:** the proof. No published correction established in this pass.
### E7 — error

**Locator:** LL24 arXiv:2205.15352v4, Lemma 8.6.1, p.44.

Paraphrase: The chosen finite-index subgroup stabilizes the Hom constituents but not explicitly the original extension class.

**Correction:** Intersect with a finite-index stabilizer of the actual class of ρ and the covering data.

**Reason:** Only this uses the MCG-finite hypothesis to make the extension image a stable cohomological subspace. Without it, nonsplit unipotent extensions of trivial representations give counterexamples.

**Reach:** the proof. No published correction established in this pass.
### E8 — gap

**Locator:** LL24 arXiv:2205.15352v4, Corollary 9.1.4 and proof, pp.45–46.

Paraphrase: Geometric-origin complex subquotients are treated as integral polarizable variations without fixing the lattice/summand convention.

**Correction:** Specify a compatible ambient integral realization, complex direct summands, and all coefficient-conjugate conditions, then prove the LL22 finiteness comparison.

**Reason:** A non-real rank-one character of a finite cyclic group has finite image but has no invariant rank-one Z-lattice; an ambient integral regular representation does contain it.

**Reach:** the proof. No published correction established in this pass.
### E9 — error

**Locator:** LL24 arXiv:2205.15352v4, Example 9.2.3, pp.48–49.

Paraphrase: The examples for every prime are immediately described as having no arithmetic lifts.

**Correction:** Surjections exist for every prime, but the nonlifting conclusion here is only for p∤m(r), hence in particular for sufficiently large p.

**Reason:** The preceding proof uses noncommuting m-th powers of opposite unipotents, which fails when p divides m.

**Reach:** a stated result. No published correction established in this pass.
### E10 — error

**Locator:** LL24 arXiv:2205.15352v4, Remarks 9.2.5–9.2.6, p.49.

Paraphrase: Nonflatness is used to conclude failure of the complete-intersection property.

**Correction:** Keep only the conditional nonflat/nonsmooth consequence after the arithmetic deformation problem is specified.

**Reason:** Z_p[[x]]/(p) is a nonflat complete intersection, so nonflatness alone cannot imply the stated conclusion.

**Reach:** a stated result. No published correction established in this pass.
### E11 — error

**Locator:** LL24 arXiv:2205.15352v4, Example 10.1.6(2), p.51.

Paraphrase: The augmentation sequence is declared nonsplit for punctured surfaces without a range restriction or computation.

**Correction:** Require and prove the nonsplitting in a suitable hyperbolic positive-genus range; the present target uses g≥2 and retains a source gap.

**Reason:** For (g,n)=(1,1), π₁ of the filled surface is Z². The truncated logarithm gives an Aut(Z²)-equivariant splitting modulo I³ in characteristic zero.

**Reach:** a stated result. No published correction established in this pass.

## Sources read

Page numbers refer to the numbered pages of the specified public PDFs. The source manifest records hashes and the portions read. Original results named only through a citation in Landesman–Litt remain source gates in the ledger; no unread theorem is passed off as directly verified.

### LL24

[Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4) — Aaron Landesman; Daniel Litt. arXiv:2205.15352v4, 25 February 2025; Annals of Mathematics 199 (2024), no.2.

**Read:** Definition 1.1.1; §§1.2–1.7 and 1.9–1.10, pp.2–7,9–11; §§2–3, pp.12–23; §§4–6, pp.24–34 (Hodge supplier interfaces); §§7–10, pp.35–53; Appendix A opening, p.54.

**SHA-256:** `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`. Accessed 2026-10-18.
### CH19

[Algebraic isomonodromic deformations and the mapping class group](https://arxiv.org/pdf/1612.05779v4) — Gaël Cousin; Viktoria Heu. arXiv:1612.05779v4, 2 October 2019.

**Read:** Introduction, Theorems A and B, pp.3–4.

**SHA-256:** `bd77b762b20c37576c66e39fbd10df572d4483121466ee76b72ad11037173904`. Accessed 2026-10-18.
### KP20

[G-rigid local systems are integral](https://arxiv.org/pdf/2009.07350v2) — Christian Klevdal; Stefan Patrikis. arXiv:2009.07350v2.

**Read:** Definitions 1.1 and Theorem 1.2, pp.1–3.

**SHA-256:** `c759728f34fa45936cabdc5a86b349c4e9bbaa3215a55f109a5ccce9b99e8858`. Accessed 2026-10-18.
### LL22

[Geometric local systems on very general curves and isomonodromy](https://arxiv.org/pdf/2202.00039v2) — Aaron Landesman; Daniel Litt. arXiv:2202.00039v2.

**Read:** Theorem 1.2.5, Corollary 1.2.7 and Theorem 1.2.12, pp.3–5; Lemma 7.2.1, p.51; Lemma 7.5.1 and proof, pp.53–54.

**SHA-256:** `37380b99082b5fc287c4c025247fc8926a18d9f951604bd6e27e467687ddc597`. Accessed 2026-10-18.
### AS16

[Rigidity phenomena in the mapping class group](https://www.math.univ-toulouse.fr/~jaramayo/rigidity-survey.pdf) — Javier Aramayona; Juan Souto. Author survey PDF, 33 pages.

**Read:** Proposition 2.4, Lemma 2.5 and proof, pp.10–11.

**SHA-256:** `85e9989eaa81b97402a7016aff4c7488d911a044d85695b04b2b327b0e640409`. Accessed 2026-10-18.

## Suggested Lean coverage

`HasFiniteConjugacyOrbitUnder` has a real body on existing automorphism groups and homomorphisms: a finite set of representative homomorphisms meets every automorphic pullback up to actual conjugation. This is the core used by C.0. It is not a replacement surface or mapping-class definition. The file states compatibility with actual conjugation, restriction of the acting group, finite acting groups and inner precomposition; its examples test trivial and inner actions and show that a finite orbit for a trivial action need not force finite image.

`freeGroup_finite_image` is C.6/free-finiteness with the existing FreeGroup and matrix-unit GL carriers, using Aut in place of Out because inner automorphisms already act by representation conjugacy. The file also states the F₀/rank-zero check. The body of the finite-orbit definition is provided; theorem proofs are placeholders. Elaboration at the pins succeeded with only the intended proof-placeholder warnings. This validates signatures, not theorem proofs.

The other nine object definitions/constructions, their APIs and all thirty roadmap unit tests remain fully specified above. Their missing surface, moduli, sheaf, Artinian-family and Hodge carriers are not encoded as assumed Prop fields. This follows the 12 October streamlined shape in WORKERS.md, which supersedes the older request for an exhaustive prototype.

## Extraction routing ledger

The 139 extraction ids are accounted for below so that the original 67-item new-roadmap route can be checked together with its corrected supplier inputs. An import is a dependency contract, not a new target here; a baseline/import row may contain both a built core and an adapter obligation. Item 83 is replaced by its justified conditional nonflat statement. Item 117 is unnecessary in the revised finite-image proof. Open questions are listed separately above.

| Extraction item | Disposition | Target or owner |
|---|---|---|
| 1 | target | `C.0/finite-orbit` |
| 2 | target | `C.6/main-finiteness` |
| 3 | target | `C.6/isomonodromy` |
| 4 | target | `C.6/fibral-finiteness` |
| 5 | target | `C.3/pw-small-order` |
| 6 | target | `C.3/small-isotypic-orbits` |
| 7 | target | `C.6/free-finiteness` |
| 8 | import | `HodgeStructuresPartII:H.4` |
| 9 | target | `C.0/versal-family` |
| 10 | baseline/import | `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation` |
| 11 | target | `C.0/moduli-monodromy` |
| 12 | target | `C.1/closure` |
| 13 | target | `C.1/point-push-restriction` |
| 14 | target | `C.0/family-finite-orbit` |
| 15 | target | `C.0/family-exact` |
| 16 | target | `C.0/family-exact` |
| 17 | target | `C.1/projective-extension` |
| 18 | target | `C.1/projective-extension` |
| 19 | target | `C.1/rank-one` |
| 20 | target | `C.1/rank-one` |
| 21 | target | `C.2/kill-finite-class` |
| 22 | target | `C.2/prescribed-lift` |
| 23 | target | `C.2/linear-realization` |
| 24 | target | `C.2/normal-restriction` |
| 25 | target | `C.2/artin-decomposition` |
| 26 | import | `DeformationAndDerivedPatchingAlgebra:R03.2` |
| 27 | import | `DeformationAndDerivedPatchingAlgebra:R03.2` |
| 28 | import | `DeformationAndDerivedPatchingAlgebra:R03.2` |
| 29 | import | `HodgeStructuresPartII:H.2` |
| 30 | import | `HodgeStructuresPartII:H.2` |
| 31 | import | `HodgeStructuresPartII:H.2` |
| 32 | import | `HodgeStructuresPartII:H.2` |
| 33 | import | `HodgeStructuresPartII:H.2` |
| 34 | import | `HodgeStructuresPartII:H.2` |
| 35 | import | `HodgeStructuresPartII:H.2` |
| 36 | import | `HodgeStructuresPartII:H.2` |
| 37 | import | `HodgeStructuresPartII:H.1` |
| 38 | import | `HodgeStructuresPartII:H.5` |
| 39 | import | `HodgeStructuresPartII:H.2` |
| 40 | import | `HodgeStructuresPartII:H.3` |
| 41 | import | `HodgeStructuresPartII:H.3` |
| 42 | import | `HodgeStructuresPartII:H.3` |
| 43 | import | `HodgeStructuresPartII:H.3` |
| 44 | import | `HodgeStructuresPartII:H.4` |
| 45 | import | `HodgeStructuresPartII:H.4` |
| 46 | import | `HodgeStructuresPartII:H.4` |
| 47 | import | `HodgeStructuresPartII:H.4` |
| 48 | import | `HodgeStructuresPartII:H.4` |
| 49 | import | `HodgeStructuresPartII:H.4` |
| 50 | import | `HodgeStructuresPartII:H.4` |
| 51 | target | `C.3/prym-action` |
| 52 | target | `C.3/pw-property` |
| 53 | target | `C.3/prym-rank` |
| 54 | target | `C.3/pw-small-degree` |
| 55 | target | `C.3/pw-small-order` |
| 56 | target | `C.3/boundary-reduction` |
| 57 | target | `C.3/versal-cover` |
| 58 | import | `HodgeStructuresPartII:H.5` |
| 59 | import | `HodgeStructuresPartII:H.5` |
| 60 | target | `C.4/strong-rigidity` |
| 61 | import | `HodgeStructuresPartII:H.5` |
| 62 | target | `C.4/boundary-quasiunipotence` |
| 63 | import | `HodgeStructuresPartII:H.5` |
| 64 | target | `C.4/projective-integrality` |
| 65 | target | `C.4/linear-integrality` |
| 66 | target | `C.4/unitary-finite` |
| 67 | target | `C.5/formal-constancy` |
| 68 | target | `C.5/algebraic-constancy` |
| 69 | target | `C.5/semisimple-finite` |
| 70 | target | `C.6/extension-splitting` |
| 71 | import | `AlgebraicModuliForArithmeticGeometry:R09.6` |
| 72 | import | `HodgeStructuresPartII:H.4` |
| 73 | target | `C.4/unitary-finite` |
| 74 | target | `C.7/arithmetic` |
| 75 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1` |
| 76 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1` |
| 77 | target | `C.7/arithmetic-finite` |
| 78 | target | `C.7/hodge-characterisation` |
| 79 | import | `HodgeStructuresPartII:H.5` |
| 80 | target | `C.8/residual-lift` |
| 81 | target | `C.8/nonlifting` |
| 82 | target | `C.8/residual-surjections` |
| 83 | target | `C.8/conditional-nonflat` |
| 84 | target | `C.6/total-finiteness` |
| 85 | target | `C.9/morita-primitive` |
| 86 | target | `C.9/genus-one-rank-two` |
| 87 | target | `C.9/unipotent-example` |
| 88 | import | `HodgeStructuresPartII:H.3` |
| 89 | import | `HodgeStructuresPartII:H.3` |
| 90 | import | `HodgeStructuresPartII:H.3` |
| 91 | import | `HodgeStructuresPartII:H.3` |
| 92 | import | `HodgeStructuresPartII:H.3` |
| 93 | import | `HodgeStructuresPartII:H.3` |
| 94 | baseline/import | `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology` |
| 95 | baseline/import | `mathlib:FreeGroup` |
| 96 | import | `MordellLawrenceVenkatesh:LV.5` |
| 97 | import | `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count` |
| 98 | baseline/import | `tauceti:TauCeti.sum_characterDegree_sq_eq_card` |
| 99 | baseline/import | `tauceti:TauCeti.ContRepresentation.exists_isUnitary_congr` |
| 100 | import | `DeformationAndDerivedPatchingAlgebra:R03.2` |
| 101 | baseline/import | `HodgeStructuresPartII:H.4` |
| 102 | import | `HodgeStructuresPartII:H.4` |
| 103 | import | `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` |
| 104 | import | `DiamondsAndVStacks:D0` |
| 105 | import | `AlgebraicModuliForArithmeticGeometry:R09.1` |
| 106 | import | `StableReductionPartII:MC.0` |
| 107 | import | `StableReductionPartII:MC.3` |
| 108 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1` |
| 109 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1` |
| 110 | import | `HodgeStructuresPartII:H.5` |
| 111 | import | `DeformationAndDerivedPatchingAlgebra:R03.2` |
| 112 | target | `C.6/nielsen-tuples` |
| 113 | import | `MordellLawrenceVenkatesh:LV.5` |
| 114 | import | `MordellLawrenceVenkatesh:LV.5` |
| 115 | import | `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences` |
| 116 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.0` |
| 117 | not-needed | `C.2/normal-restriction` |
| 118 | import | `HodgeStructuresPartII:H.2` |
| 119 | import | `HodgeStructuresPartII:H.2` |
| 120 | import | `HodgeStructuresPartII:H.2` |
| 121 | import | `HodgeStructuresPartII:H.4` |
| 122 | import | `HodgeStructuresPartII:H.4` |
| 123 | import | `HodgeStructuresPartII:H.3` |
| 124 | import | `DiamondsAndVStacks:D0` |
| 125 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.5` |
| 126 | target | `C.6/socle-transport` |
| 127 | import | `HodgeStructuresPartII:H.5` |
| 128 | import | `MordellLawrenceVenkatesh:LV.5` |
| 129 | import | `MordellLawrenceVenkatesh:LV.5` |
| 130 | target | `C.8/jordan-word` |
| 131 | target | `C.8/nondensity` |
| 132 | target | `C.8/nondensity` |
| 133 | import | `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count` |
| 134 | target | `C.9/large-semisimple` |
| 135 | import | `MordellLawrenceVenkatesh:LV.5` |
| 136 | import | `HodgeStructuresPartII:H.2` |
| 137 | import | `HodgeStructuresPartII:H.4` |
| 138 | import | `HodgeStructuresPartII:H.5` |
| 139 | target | `C.8/residual-lift` |

The packet is the machine-readable companion to this document; both carry the same targets, API statements, tests, prerequisites, gaps and corrections. The handoff records validation and the work needed for proof closure.
