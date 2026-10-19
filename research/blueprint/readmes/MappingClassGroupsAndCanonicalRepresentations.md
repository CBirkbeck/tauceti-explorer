# Mapping class groups and canonical representations of surface groups

The main target is finite monodromy for an actual complex surface-group representation whose conjugacy class has finite mapping-class orbit and whose rank satisfies r²<g+1. The plan also proves the higher Prym subrepresentation bound, derives arithmetic finite monodromy for the generic pointed curve over Q, and gives examples that distinguish the hypotheses. It follows Landesman–Litt with corrected statements, and imports the existing topology, pointed moduli, cohomology and Hodge machinery.

This is a target-level roadmap, with one node per definition, construction or key theorem. The packet records 62 targets across ten layers; its independent review removed three targets that duplicated accepted suppliers and added three routed key theorems that no roadmap plans. All ten layers are **planned**; none is closed. A complete design pass means that every target has a dependency chain ending in a pinned declaration, an existing supplier, a precise request or an explicit gap. It does not mean that the mathematics is implemented or that the supplier proofs have been completed. Every implementation status is unchecked.

The reader is definitive. The suggested Lean file follows the streamlined shape in WORKERS.md: light real-bodied definitions and end theorems that can be stated using the pins. It is not an implementation of this roadmap. No mock surface, mapping-class, moduli, sheaf or Hodge carrier is introduced merely to make signatures elaborate.

## Conventions and theorem ranges

- Σ(g,n) is an oriented connected genus-g surface with n punctures and no boundary; Σ(g,b,p) has b boundary circles and p punctures. Generic surface and mapping-class objects are imported from the MordellLawrenceVenkatesh:LV.5 nodes, retaining its pending transfer to topology owners. Teichmüller uniformization, Nielsen generation of Aut(F_N) and the Aramayona–Souto multitwist theorem are planned here, as the extraction routes them.
- PMod fixes ordered punctures and boundary pointwise. Mod may permute punctures. Finite orbit for the pure or full orientation-preserving group is equivalent by finite index. The based additional mark gives an automorphism action; forgetting it gives an outer action.
- Conjugacy always means actual GL conjugacy of representations, including extensions. A character/GIT quotient is used only in its semisimple range. Rank zero is allowed in the main finite-image theorem; positive-rank determinant and central-isogeny arguments assume r>0.
- A versal family means dominant **étale** over the ordered smooth moduli stack. Family, Birman and Teichmüller comparisons use 2g−2+n>0. The rank-one unpointed torus is handled separately, and its arithmetic/isomonodromy comparison is a recorded source obligation.
- Local coefficients use the existing fundamental-groupoid functor and monodromyRepresentation. Compare path multiplication before converting actions; on cohomology inverse pullback gives the left action compatible with homology pushforward. Generic locally constant sheaves and Rπ_* are supplied, not axiomatized here.
- Open-cover H¹ and compact-cover H₁ are distinct. An isotypic component is the whole σ⊗Hom_H(σ,V), not just the multiplicity space. Track σ∨ when dualizing; the compact oriented duality comparison is equivariant.
- A unitary representation is unitarizable, equivalently its image has compact closure. For GL the adjoint coefficient is the trace-zero Lie algebra, of rank r²−1 for r>0. For PGL use its adjoint Lie algebra. Strong rigidity means ordinary H¹=0; middle-extension rigidity also requires its boundary conventions.
- The generic arithmetic moduli point is over M(g,n)_Q. The field is finitely generated of characteristic zero. A chosen Qbar_ℓ≃C is abstract; no preservation of topology under that isomorphism is assumed. Density is used back in the original ℓ-adic topology.
- Arithmeticity has the smaller rank range r<√(g+1). The wider r<2√(g+1) geometric/Hodge characterization excludes arithmeticity. Integral PVHS is read in the O_K sense of LL22 Theorem 1.2.5, as in HodgeStructuresPartII:H.5/integral-pvhs: an O_K-local system all of whose conjugates underlie complex PVHS.
- Residual surjections exist for every prime in the stated surface range. Nonlifting is proved only outside the primes dividing a uniform Jordan exponent. Nonflatness does not imply failure of the complete-intersection property.

## Existing work and build order

The reviewed library-coverage catalogue has no entry for this new roadmap. It does record built or partly built Hodge material; no generic pure, polarized or rational mixed-Hodge carrier is re-planned. At the pins, local coefficients and monodromy, generic module isotypic components, the socle and its semisimplicity, unitary complete reducibility, the degree-square identity, induced representations, free groups and the inflation–restriction sequence are already present; compact unitarization and bounded-embedding finiteness enter through HodgeStructuresPartII:H.5/unitary-embeddings-finite. The declarations below were read, rather than inferred from names.

The audit also screened the current read-only upstream roadmaps, including the nine additions absent from the atlas snapshot. AlgebraicTopology and Completed/UniversalCovers supply the nearby style and topology contracts. The current CharacterTheory and InductionRestriction roadmaps distinguish finite-group results from the arbitrary-group extension and Jordan inputs requested here. No generic covering-space, surface, group-algebra socle or finite-group character theory is a new target of this roadmap.

The acyclic order is: common surface topology and pointed moduli; C.0–C.2; the shared Art_C deformation extension and the accepted HodgeStructuresPartII H.1–H.5 packets; then C.3–C.8. HodgeStructuresPartII:H.4/artinian-vanishing records Lemma 2.4.2 as a gap awaiting C.2/artin-decomposition and must not use the final canonical finiteness theorem. C.9 tests the ranges. Most inputs are exact nodes of accepted packets: HodgeStructuresPartII H.1/H.2/H.4/H.5 (rank bound, Artinian vanishing, rigidity, integrality, nonabelian Hodge deformation, very-general-curve bounds, geometric origin and integral PVHS), InverseGaloisAndArithmeticFundamentalGroups IG.1/IG.3/IG.5 (arithmetic representations, family exactness, Artin neighbourhoods, versal φ-cover families), AlgebraicModuliForArithmeticGeometry R09.7a (compactification and boundary meridians), DiamondsAndVStacks D0 (Leray) and LV.5. The request ledger below names only what those owners do not yet state; a stage citation does not assert that the supplier has completed the requested theorem.

| Layer | Targets | Main output |
|---|---:|---|
| C.0 — Finite orbits and surface monodromy | 6 | Define actual finite conjugacy orbits and punctured étale-versal families. State the Teichmüller uniformization of the pointed moduli stack, compare the ordered moduli orbifold with pure mapping classes, and prove the versal-family fundamental-group sequence and the fibral finite-orbit property. Generic surfaces, twists, point pushing and the Birman sequence are imported from LV.5. |
| C.1 — Projective realization | 4 | Establish finite-orbit operations and point-pushing restriction, rank-one and determinant finiteness for positive genus, and the canonical actual-intertwiner projective extension of an irreducible representation. |
| C.2 — Linear lifting and relative structure | 5 | Kill a specified finite abelian obstruction by dominant étale refinement, lift the projective extension with its fibre prescribed, realize irreducible representations on versal families, prove the arbitrary-group normal-restriction lemma, and construct the relative Artinian unitary decomposition. |
| C.3 — Higher Prym representations | 8 | Define open-cover cohomological and compact-cover homological Prym actions and the Putman–Wieland predicate. Import marked versal φ-cover families (InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families), reduce boundary components, identify cover cohomology, and prove the subrepresentation rank bound from HodgeStructuresPartII:H.4/sublocal-system-rank, with its small-degree and small-order consequences. |
| C.4 — Unitary rigidity and integrality | 6 | Import strong rigidity of fibre-irreducible low-rank total representations (HodgeStructuresPartII:H.5/versal-unitary-rigidity). Prove quasi-unipotence of multitwists in finite-index mapping-class subgroups and of boundary monodromy on a good compactification, deduce projective and linear integrality, and prove finite monodromy for low-rank unitary MCG-finite representations using every coefficient conjugate. |
| C.5 — Constancy and semisimple finiteness | 3 | Apply the shared abstract-group deformation criterion to fibre-unitary formal families. Prove conjugacy constancy in connected algebraic fixed-determinant families and semisimple finite monodromy, exposing the nonabelian-Hodge-to-algebraic-family bridge as a supplier obligation. |
| C.6 — General finiteness and free groups | 10 | Prove characteristic-socle transport, the low-rank extension splitting theorem, and finite monodromy for all MCG-finite representations of rank r with r²<g+1. State Nielsen generation of Aut(F_N) and deduce the fibral, algebraic-isomonodromy, free-group, Nielsen-tuple, characteristic-quotient and total-image consequences. |
| C.7 — Generic arithmetic curves | 5 | Import arithmetic representations of the geometric étale fundamental group (InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation). Compare finite Galois orbit with finite topological mapping-class orbit on a curve generic over M(g,n) over Q, prove arithmetic finite monodromy, and prove the four-way equivalence with geometric origin and integral PVHS in the O_K sense, and its wider three-way range. |
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
- [`mathlib:groupCohomology.H1InfRes_exact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean): Exactness at the middle of inflation-restriction in degree one; not a full LHS spectral sequence.
- [`mathlib:Representation.IsIrreducible`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Irreducible.lean): The simple group-algebra-module notion of irreducibility.
- [`mathlib:FreeGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): The existing free group as the quotient of words by reduction; no free-group carrier is planned.
- [`mathlib:FreeGroup.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): The equivalence from generator assignments to group homomorphisms, used for the Nielsen tuple dictionary.
- [`mathlib:Matrix.GeneralLinearGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The existing unit group of the square-matrix ring, including rank zero.
- [`mathlib:isotypicComponent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/SimpleModule/Isotypic.lean): The existing sum of all submodules isomorphic to the given simple module; specialize to the H-group algebra.
- [`tauceti:TauCeti.sum_characterDegree_sq_eq_card`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/Table.lean): The natural-number degree-square identity for the enumerated irreducible characters of a finite group over an algebraically closed field with invertible group order.
- [`mathlib:Representation.ind`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Induced.lean): Induction of a representation along a group homomorphism, with the induction–restriction adjunction Rep.indResAdjunction; used to induce from a finite-index subgroup of Mod(Z) in C.4/multitwist-quasi-unipotence.

## Layer targets

Every target below has a stable packet id. Definition and construction APIs are proposed declaration names; their tests are mathematical examples to implement once the actual carriers are supplied. A test is not silently replaced by an assumption in the suggested file. Targets added by the independent review are marked.

## C.0. Finite orbits and surface monodromy

Define actual finite conjugacy orbits and punctured étale-versal families. State the Teichmüller uniformization of the pointed moduli stack, compare the ordered moduli orbifold with pure mapping classes, and prove the versal-family fundamental-group sequence and the fibral finite-orbit property. Generic surfaces, twists, point pushing and the Birman sequence are imported from LV.5.

**Stage dependencies:** `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.0`; `StableReductionPartII:MC.2`; `StableReductionPartII:MC.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.0/finite-orbit — MCG-finite representations

**Definition.** For an oriented connected finite-type surface S=Σ(g,n), a rank-r complex representation ρ is MCG-finite when its actual GL_r(C)-conjugacy class has finite orbit under orientation-preserving mapping classes acting through Out(π₁S). Use pure mapping classes for ordered punctures; full versus pure finiteness is equivalent because their index is finite. No semisimplification is taken.

**Atlas planet:** MCG-finite representations.

**Construction or proof:**

1. Use conjugacy of homomorphisms as an equivalence relation; precomposition by an inner automorphism induces conjugation by ρ of that element.
2. Descend the outer action to classes; identify finite orbits with finite-index stabilizers.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5`; `mathlib:Matrix.GeneralLinearGroup`.

**Uses that determine the API:**

- C.1 projective realization: The stabilizer gives actual GL intertwiners.
- C.6 main theorem: The input is finite orbit of possibly nonsplit representations.

**API:**

- `mcgFinite_iff_stabilizer` (characterisation): MCG-finiteness is equivalent to the stabilizer of the actual conjugacy class having finite index.
- `mcgFinite_conjugate` (compatibility): Conjugate homomorphisms have the same finiteness predicate.
- `mcgFinite_pure_iff` (equivalence): Pure and full orientation-preserving mapping classes give equivalent predicates.
- `inner_precompose_conjugate` (simp): Precomposition by conjugation by x is conjugation of ρ by ρ(x).
- `mcgFinite_iff_hasFiniteConjugacyOrbitUnder` (compatibility): For the based action of PMod(g,n+1) on π₁(Σ(g,n),x), MCG-finiteness is HasFiniteConjugacyOrbitUnder of the suggested file; inner automorphisms change ρ only by conjugation, so the based and outer formulations agree.
- `mcgFinite_comp_aut` (functoriality): For an automorphism φ of π₁ induced by a mapping class, ρ is MCG-finite if and only if ρ∘φ is.
- `mcgFinite_det` (relation): If ρ is MCG-finite then so are det∘ρ and every exterior power of ρ.

**Discriminating unit tests:**

- `finiteOrbit_trivial` (degenerate): The trivial representation, including rank zero, has a one-element orbit.
- `finiteOrbit_finiteImage` (characterisation): A finite-image representation of a finitely generated surface group has finite orbit: only finitely many maps into its fixed finite image.
- `finiteOrbit_not_semisimplification` (non-example): On a closed genus-two surface let f(a₁)=1 and f(b₁)=f(a₂)=f(b₂)=0. The unipotent representation γ↦[[1,f(γ)],[0,1]] has infinite actual conjugacy orbit under mapping classes, while its semisimplification is trivial with singleton orbit.

**Checks:**

- Agrees with HasFiniteConjugacyOrbitUnder of the suggested file for the based action of PMod(g,n+1) on π₁(Σ(g,n),x); inner automorphisms act by conjugation of ρ, so the based and outer formulations give the same predicate.
- The predicate is unchanged when Mod(g,n) is replaced by PMod(g,n) or by any finite-index subgroup.

**Source:** LL24, Definition 1.1.1, p.2; §2.1, pp.12–13. Definition 1.1.1 calls ρ MCG-finite when its conjugacy class has finite orbit under the outer action of Mod(g,n), and the following paragraph stresses actual conjugacy classes rather than points of the character variety; §2.1 develops basic properties.

### C.0/versal-family — Punctured versal families

**Definition.** A punctured étale-versal (g,n)-family is a smooth proper connected genus-g curve C→M over a connected smooth complex variety, with n ordered disjoint sections, whose classifying map M→M(g,n) is dominant and étale; C° is the complement of those sections. In family arguments impose 2g−2+n>0. The word versal here includes étaleness.

**Atlas planet:** Punctured versal families.

**Construction or proof:**

1. Import the common pointed-curve moduli carrier, not a second moduli stack.
2. Define the open complement and the dominant étale condition on the supplied classifying map.

**Direct prerequisites:** `StableReductionPartII:key/moduli-curves`; `StableReductionPartII:MC.2`; `StableReductionPartII:MC.4`.

**Uses that determine the API:**

- HodgeStructuresPartII:H.4/sublocal-system-rank and H.4/artinian-vanishing: Supplies precisely the base families of the rank theorem and Artin vanishing.
- C.2 linear realization: Étale refinements remain in the same family class.

**API:**

- `versalFamily_puncturedFiber` (projection): The fibre of C° is the pointed curve with the section values removed.
- `versalFamily_etaleBaseChange` (functoriality): Connected dominant étale base change preserves the family and ordered sections.
- `versalFamily_marking` (compatibility): A chosen analytic fibre marking induces the surface group used by the existing local-coefficient monodromy functor.
- `versalFamily_ofLevelChart` (constructor): A connected fine level chart of M(g,n) with its universal pointed curve is a versal family; the charts come from StableReductionPartII:MC.4.

**Discriminating unit tests:**

- `versal_level_family` (compatibility): The universal curve on a connected fine level cover is an example when the level supplier supplies its (g,n)-range.
- `versal_constant_not_example` (non-example): A constant family over a point is not versal when 3g−3+n>0.
- `versal_sections_removed` (computation): For n=0, C°=C; for n>0 all n disjoint section points, and no others, are removed in each fibre.

**Checks:**

- For (g,n)=(0,3), M(0,3) is a point: a versal family is a finite étale cover of a point carrying the constant family P¹ with three sections, and the punctured fibre group is free of rank two.
- A dominant classifying map that is ramified (for instance a ramified double cover of a level chart) is excluded: versal includes étale.

**Source:** LL24, Notation 1.10.1, pp.10–11; Lemmas 2.1.4–2.1.5, pp.13–14. Notation 1.10.1 defines families of n-pointed curves in the hyperbolic range, calls them versal when the classifying map to M(g,n) is dominant and étale, and introduces the punctured family; §1.3 drops étaleness, the misprint PAPER-LANDESMAN-LITT-24/E3. Lemmas 2.1.4–2.1.5 are the first uses.

### C.0/moduli-monodromy — Moduli and point-pushing comparison

**Theorem.** For 2g−2+n>0, the analytic orbifold fundamental group of the ordered moduli stack M(g,n) is PMod(g,n); that of its universal punctured curve M(g,n+1) is PMod(g,n+1). The fibre inclusion is point pushing and its conjugation action agrees with the surface outer action. These are orbifold groups, not the fundamental groups of coarse spaces.

**Atlas planet:** Moduli and point-pushing comparison.

**Construction or proof:**

1. Apply C.0/teichmuller-uniformization to M(g,n) and M(g,n+1); the latter is the smooth punctured universal curve over the former (MC.2 interface).
2. Compare the homotopy sequence of the forgetful map with the Birman exact sequence (LV.5/birman-exact-sequence): the fibre inclusion is point pushing (LV.5/point-push), and conjugation by lifts induces the surface outer action.
3. Check the path-composition convention against TauCeti.LocalCoefficientSystem.monodromyRepresentation before identifying left and right actions.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/teichmuller-uniformization`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MordellLawrenceVenkatesh:LV.5/point-push`; `MordellLawrenceVenkatesh:LV.5`; `StableReductionPartII:MC.2`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks:**

- For (g,n)=(0,3) the forgetful map M(0,4)→M(0,3) is the thrice-punctured line over a point, and the Birman sequence becomes π₁(Σ(0,3))≅PMod(0,4)≅F₂ with PMod(0,3) trivial.
- Changing the chosen marking changes both vertical isomorphisms by the same inner automorphism, so the comparison diagram commutes for every choice.

**Source:** LL24, Lemma 2.0.1, p.12 (second group label corrected). Lemma 2.0.1 identifies π₁(M(g,n)) with PMod(g,n) and π₁(M(g,n+1)) with PMod(g,n+1), compatibly with the forgetful map and the Birman sequence, up to the choice of marking; the second identification is printed as PMod(g,n) (source issue E1).

### C.0/teichmuller-uniformization — Teichmüller uniformization of the pointed moduli stack

**Theorem.** For 2g−2+n>0, Teichmüller space T(g,n) of marked complex structures on Σ(g,n) is a contractible complex manifold of dimension 3g−3+n. PMod(g,n) acts on it by change of marking, properly discontinuously with finite stabilizers (the automorphism groups of the pointed curves), and the analytic stack M(g,n)^an is the orbifold quotient [T(g,n)/PMod(g,n)]. The universal pointed curve pulled back to T(g,n) is topologically the trivial family T(g,n)×Σ(g,n) with its n constant sections. Hence M(g,n)^an has contractible orbifold universal cover and orbifold fundamental group PMod(g,n); changing the marking of the base fibre changes this identification by an inner automorphism.

*Added by the independent review.*

**Atlas planet:** Teichmüller uniformization.

**Construction or proof:**

1. Teichmüller’s theorem identifies T(g,n) with an open ball of real dimension 6g−6+2n; this is the recorded Teichmüller gap (Farb–Margalit, Primer, Chapters 10–12, is the intended source and was not read here).
2. Proper discontinuity and the stabilizer computation follow from the same theory; the quotient is the analytic moduli stack by the universal property of the moduli pseudofunctor applied to the universal marked family.
3. A properly discontinuous action on a contractible space identifies the orbifold fundamental group of the quotient with the acting group, up to the inner automorphism fixed by the chosen base point and marking.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/surface`; `StableReductionPartII:key/moduli-curves`; `MordellLawrenceVenkatesh:LV.5`.

**Checks:**

- For (g,n)=(0,4): M(0,4) is the thrice-punctured line, a scheme with no stabilizers, and the theorem gives π₁ ≅ PMod(0,4), a free group of rank two (LL24 uses this freeness after Question 10.1.1, p.49).
- For (g,n)=(1,1): T(1,1) is the upper half-plane, PMod(1,1)=SL₂(Z) acts through PSL₂(Z) with −1 acting trivially, and the generic stabilizer ±1 is the elliptic involution; the coarse quotient is the j-line but the orbifold group is SL₂(Z), not PSL₂(Z).
- The theorem is about the stack: the coarse space of M(g,n) has a different fundamental group whenever stabilizers are nontrivial.

**Source:** LL24, Proof of Lemma 2.0.1, p.12; proof of Lemma 2.1.5, p.14. The proof of Lemma 2.0.1 derives π₁(M(g,n))≅PMod(g,n) from contractibility of the universal cover of M(g,n) and the properly discontinuous PMod action, citing Farb–Margalit §10.6.3 and p.353; Lemma 2.1.5 uses the same contractibility for injectivity of the fibre group. This node states that input; its own proof is the recorded Teichmüller gap.

### C.0/family-exact — Versal family fundamental groups

**Theorem.** For a punctured étale-versal hyperbolic family and compatible basepoints, 1→π₁(C°_m)→π₁(C°)→π₁(M)→1 is exact; the map π₁(M)→PMod(g,n) has finite-index image. Consequently the outer monodromy on the fibre is the restriction of the mapping-class action.

**Construction or proof:**

1. Finite index: after pulling back to a finite étale scheme cover of M(g,n) (a fine level chart), the image of π₁ of a dominant étale source has finite index; this uses the theorem that a dominant morphism of normal complex varieties has finite-index image on fundamental groups (recorded finite-index gap; LL24 cites Debarre Lemma 4.19).
2. The punctured family is a locally trivial fibre bundle by the relative Ehresmann theorem for a proper submersion with disjoint sections (recorded Ehresmann gap), so its homotopy sequence is exact except possibly on the left.
3. Injectivity on the left: the fibre inclusion factors through the universal punctured curve, where the fibre group injects because the orbifold universal cover of M(g,n) is contractible (C.0/teichmuller-uniformization). Do not assume π₂(M)=0.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`; `MappingClassGroupsAndCanonicalRepresentations:C.0/teichmuller-uniformization`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `StableReductionPartII:MC.4`.

**Checks:**

- For the constant family over a point with (g,n)=(0,3) the sequence is 1→F₂→F₂→1→1.
- The finite-index assertion needs dominance: a constant map from a point has trivial image, of infinite index in PMod(g,n) when 3g−3+n>0.

**Source:** LL24, Lemmas 2.1.4–2.1.5, pp.13–14. Lemma 2.1.4 shows the image of π₁(M) in PMod(g,n) has finite index for dominant étale M→M(g,n), via a finite étale scheme cover and Debarre Lemma 4.19; Lemma 2.1.5 proves exactness of the fibre sequence, deducing injectivity from the universal punctured curve.

### C.0/family-finite-orbit — Fibral finite-orbit monodromy

**Theorem.** The restriction to a fibre of every finite-dimensional complex local system on the total space of a punctured étale-versal hyperbolic family is MCG-finite.

**Construction or proof:**

1. Conjugation in the exact total-space group supplies intertwiners for the image of π₁(M).
2. That image has finite index in PMod(g,n); pass to the full group by the finite-index criterion.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/family-exact`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks:**

- A local system pulled back from the base restricts trivially to every fibre, a singleton orbit.
- For the universal punctured curve over a fine level chart, the conclusion is Proposition 2.1.2 for Γ the image of π₁ of the total space in PMod(g,n+1).

**Source:** LL24, Proposition 2.1.3, pp.13–14. Proposition 2.1.3, proved in §2.1.6, shows the fibre restriction of a representation of π₁ of a punctured versal family is MCG-finite, by conjugating with lifts of base loops and using the finite-index image of Lemma 2.1.4.

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

- The stabilizer of ρ⊕σ or ρ⊗σ contains the intersection of the two finite-index stabilizers.
- Non-characteristic quotients need not be MCG-finite: in the rank-(2g+1) abelianization example U on H⊕C (C.9/unipotent-example), the quotient by a line L⊂H has conjugacy class determined by L, and Sp(2g,Z) moves a rational line to infinitely many lines.

**Source:** LL24, Proposition 2.1.1, p.12; §8.7, p.44. Proposition 2.1.1 gives closure under direct sums and tensor products and that semisimple subquotients are MCG-finite (citing LL19 Lemma 2.2.1); §8.7 uses that the socle is characteristic, so it and its quotient are MCG-finite.

### C.1/point-push-restriction — Point-pushing restriction theorem

**Theorem.** If Γ is a finite-index subgroup of PMod(g,n+1) containing the point-pushing surface group, any complex representation of Γ restricts to an MCG-finite representation of that surface group, for 2g−2+n>0.

**Atlas planet:** Point-pushing restriction theorem.

**Construction or proof:**

1. Use the finite-index image of Γ in the Birman quotient: conjugation in Γ realizes all its outer actions by actual intertwiners.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/point-push`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`.

**Checks:**

- For n=0, Γ=PMod(g,1) and the symplectic representation on H₁(Σ_g) pulled back along the forgetful map, the restriction to the point-pushing subgroup is trivial, hence MCG-finite.
- The intertwiner for the image of γ̃∈Γ is ρ(γ̃) itself, so the orbit under the image of Γ in PMod(g,n) is a single conjugacy class.

**Source:** LL24, Proposition 2.1.2, p.13. Proposition 2.1.2: for a finite-index subgroup of Mod(g,n+1) containing the point-pushing subgroup, the restriction of any representation is MCG-finite, since ρ(γ) conjugates ρ to its twist by γ.

### C.1/rank-one — Rank-one canonical finiteness

**Theorem.** For g≥1 and n≥0 every MCG-finite character π₁Σ(g,n)→C× has finite image. In particular every positive-rank MCG-finite representation has finite determinant.

**Atlas planet:** Rank-one canonical finiteness.

**Construction or proof:**

1. A character factors through H₁. For a nonseparating simple closed curve a and a class x with î(x,a)=1, some power T_a^k lies in the stabilizer of χ, and LV.5/dehn-twist-homology gives χ(a)^k=1. The standard generators aᵢ,bᵢ are nonseparating (LV.5/primitive-classes-simple), and for n≥2 a puncture loop γ_j is handled through a nonseparating curve in the class a₁+γ_j.
2. Determinant is compatible with conjugation and precomposition; finite generation turns finitely many torsion values into a finite image.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`.

**Checks:**

- Check g=1,n=0 directly with the SL₂(Z) transvections; exclude a genus-zero finite-orbit character with non-torsion puncture monodromy.

**Source:** LL24, Proposition 2.3.1 and Lemma 2.3.2, pp.15–16. Proposition 2.3.1, quoting BGMW17 Lemma 3.2, gives finite image for MCG-finite characters when g≥1, with the Dehn-twist idea sketched after it; Lemma 2.3.2 deduces finite determinant and the subgroup det⁻¹(finite).

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
- `projectiveExtension_conj` (relation): For γ in Γ̃ and η in the point-pushing group, ρ̂(γ)·Pρ(η)·ρ̂(γ)⁻¹=Pρ(γηγ⁻¹).
- `projectiveExtension_geometric` (constructor): On the total space of a finite étale scheme cover of M(g,n) with π₁-image in Γ, ρ̂ defines a projective local system restricting on the based fibre to Pρ (LL24 Lemma 2.2.3).

**Discriminating unit tests:**

- `projectiveExtension_rankOne` (degenerate): At rank one the PGL extension is trivial.
- `projectiveExtension_inner` (computation): For n∈N its value is [ρ(n)].
- `projectiveExtension_not_arbitrary_unique` (non-example): For the standard irreducible Q₈ representation, take G=Q₈×C₂. Projective centralizers allow a nontrivial C₂-value in an extension of Pρ, although actual GL intertwiners for this trivial C₂-action must be scalar. Thus arbitrary projective extensions are not uniquely determined.

**Checks:**

- If Pρ has trivial centralizer in PGL_r(C) (for instance an irreducible ρ with Zariski-dense image in SL_r), every PGL extension restricting to Pρ coincides with ρ̂, consistent with the corrected uniqueness.
- On the point-pushing subgroup the extension is Pρ itself.

**Source:** LL24, Lemma 2.2.2, pp.14–15; Lemma 2.2.3, p.15. Lemma 2.2.2 builds ρ̃ on the preimage of the stabilizer from actual intertwiners, unique up to scalars by Schur, and asserts uniqueness of ρ̃, which fails in general (source issue E2; the author erratum deletes it). Lemma 2.2.3 is the geometric version on a finite étale scheme cover of M(g,n).

## C.2. Linear lifting and relative structure

Kill a specified finite abelian obstruction by dominant étale refinement, lift the projective extension with its fibre prescribed, realize irreducible representations on versal families, prove the arbitrary-group normal-restriction lemma, and construct the relative Artinian unitary decomposition.

**Stage dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `DiamondsAndVStacks:D0`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `StableReductionPartII:MC.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.2/kill-finite-class — Étale killing of finite obstruction classes

**Theorem.** Let M be a smooth connected complex variety, m∈M, μ a finite abelian group with trivial action, i>0 and α∈Hⁱ(π₁(M,m),μ). There are a smooth connected complex variety M′, a point m′ and a dominant étale map f:(M′,m′)→(M,m) with f^*α=0 in Hⁱ(π₁(M′,m′),μ). The map need not be finite, and its image need not be all of M, but it contains m.

**Atlas planet:** Étale killing of finite obstruction classes.

**Construction or proof:**

1. Map α to Hⁱ(M,μ) and pass to étale cohomology with finite coefficients (IG.3/finite-coefficient-comparison).
2. A positive-degree étale class vanishes on some pointed étale neighbourhood of m (D0/cech-to-derived-comparison); take its connected component through the base point, which is dominant because M is irreducible.
3. Refine to a pointed Artin good neighbourhood, which is a K(π,1) (IG.3/artin-good-neighborhoods); there group cohomology equals singular cohomology, so the pulled-back group class vanishes.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.3/artin-good-neighborhoods`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/finite-coefficient-comparison`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- For M=G_m, i=1, μ=Z/2 and α the nontrivial class, the squaring map z↦z², pointed at 1, is finite étale and kills α.
- The pointed form matters: the fibre over the base point must survive, so that the fibral representation of the lifting theorem is preserved (author erratum P04).

**Source:** LL24, Lemma 2.3.3, p.16. Lemma 2.3.3 kills a finite-coefficient class of π₁(M) by a dominant étale map, through the étale comparison, vanishing near the generic point and an Artin K(π,1) open; the author erratum (P04) replaces it by the pointed version stated here (source issue E12).

### C.2/prescribed-lift — Fibre-prescribed linear lifting

**Theorem.** For g≥1, start with the projective family extension of an irreducible MCG-finite ρ with finite determinant. After connected dominant étale base change it lifts to an actual GL_r(C) representation of the total-space group with finite determinant, whose restriction is isomorphic to the original ρ, not just projectively isomorphic.

**Atlas planet:** Fibre-prescribed linear lifting.

**Construction or proof:**

1. Set D=detρ(N) and use the central isogeny det⁻¹(D)→PGL_r with finite kernel μ (r>0). The obstruction restricts to zero on N.
2. Use the discrete Hochschild–Serre filtration: first kill the component in H¹(Q,H¹(N,μ)) after making its finite module constant by a finite étale cover; only then kill the resulting inflated class in H²(Q,μ). Every killing uses the pointed C.2/kill-finite-class, so the based fibre is kept.
3. Compare the resulting fibre lift with ρ. Make the finite mismatch character invariant, kill its transgression in H²(Q,μ), extend it to the total group, and twist the lift.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.2/kill-finite-class`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `mathlib:groupCohomology.H1InfRes_exact`.

**Checks:**

- For r=1 the projective extension is trivial and the lift is a finite character extended to the total space after killing its transgression.
- The fibre restriction of the lift equals ρ on the chosen based fibre, not a twist ρ⊗χ by a finite character.

**Source:** LL24, Proposition 2.3.4, pp.16–18; Corollary 2.3.5, p.18. Proposition 2.3.4 lifts a projective representation of π₁ of a punctured versal family, compatible with an MCG-finite fibre representation, to det⁻¹(finite) after dominant étale base change, using the Hochschild–Serre analysis of the H² and H¹ obstructions. The order of the killing steps (source issue E3) and pointedness (E12) are corrected here.

### C.2/linear-realization — Linear versal realization

**Theorem.** Every irreducible MCG-finite rank-r representation of π₁Σ(g,n), g≥1, r>0 and 2g−2+n>0, is the fibre restriction of a finite-determinant local system on a punctured étale-versal family with smooth quasiprojective base. All subsequent étale restrictions preserve this realization.

**Atlas planet:** Linear versal realization.

**Construction or proof:**

1. Combine the canonical projective realization with fibre-prescribed lifting; choose a smooth quasiprojective level chart and shrink the base when necessary.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/prescribed-lift`; `MappingClassGroupsAndCanonicalRepresentations:C.0/versal-family`; `StableReductionPartII:MC.4`.

**Checks:**

- For finite-image irreducible ρ the realization can be taken on the finite cover of a level-chart universal family defined by the kernel of ρ.
- The determinant of the realization has finite order, as C.2/normal-restriction requires.

**Source:** LL24, Corollary 2.3.5, p.18. Corollary 2.3.5: for g≥1 an irreducible MCG-finite ρ is the fibre restriction of a representation of π₁ of a punctured versal family whose determinant has finite order.

### C.2/normal-restriction — Irreducible normal restriction

**Theorem.** For arbitrary groups G and N normal in G, let ρ:G→GL_r(C) have finite determinant and irreducible restriction to N. If ρ(N) is finite then ρ(G) is finite; if ρ|N is unitarizable then ρ is unitarizable. No finiteness of G or finite index of N is assumed.

**Atlas planet:** Irreducible normal restriction.

**Construction or proof:**

1. For a finite N-image, the kernel of conjugation on that image centralizes an irreducible representation and hence consists of scalars; finite determinant bounds these scalars.
2. An N-invariant positive Hermitian form is unique up to positive scalar. Each G element transports it to such a multiple; finite determinant forces that multiple to be one.

**Direct prerequisites:** `mathlib:Representation.IsIrreducible`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

**Checks:**

- The finite-determinant hypothesis is necessary in both parts: for G=N×Z and ρ(n,k)=2^k·σ(n) with σ irreducible, unitary and of finite image, ρ|N is finite, unitary and irreducible while ρ has infinite, non-unitarizable image.
- Part (1) is proved through the finite-index kernel of the conjugation action on ρ(N) and Schur’s lemma, without Burnside’s theorem on groups of finite exponent.

**Source:** LL24, Lemma 2.4.1, p.19. Lemma 2.4.1: for H normal in G and ρ of finite-order determinant with irreducible restriction, finiteness and unitarity pass from H to G; the printed proof of (1) uses a false projective uniqueness and Burnside’s theorem (PAPER-LANDESMAN-LITT-24/E9, replaced in the author erratum). The proof here avoids both.

### C.2/artin-decomposition — Relative unitary decomposition

**Construction.** Let A be a local Artinian C-algebra with residue C and V a local system of finite free A-modules on a punctured étale-versal family with g≥1. Suppose the restriction to a chosen fibre is isomorphic over A to U⊗C A with U unitary. After dominant étale base change, V≃⊕ᵢ(Uᵢ⊗C π°^*Wᵢ), where Uᵢ are total-space unitary complex local systems with pairwise nonisomorphic irreducible fibre restrictions and Wᵢ are finite free A-local systems on M. This is fibre-constant deformation, not merely unitary reduction mod m_A.

**Atlas planet:** Relative unitary decomposition.

**Construction or proof:**

1. Extend the irreducible constituents of U by linear realization, and use the normal-restriction theorem to make them unitary on the total space.
2. Define Wᵢ=π°_*Hom(Uᵢ,V); Schur and fibrewise evaluation give finite freeness and the displayed decomposition.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.pullback`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`; `DiamondsAndVStacks:D0`.

**Uses that determine the API:**

- HodgeStructuresPartII:H.4/artinian-vanishing: Artinian invariant vanishing uses the decomposition over A, before the final finiteness stages.

**API:**

- `relativeUnitary_eval` (equivalence): The sum of evaluation maps Uᵢ⊗π°^*Wᵢ→V is an isomorphism.
- `relativeUnitary_multiplicity` (projection): Wᵢ is π°_*Hom(Uᵢ,V), with its actual induced A-monodromy.
- `relativeUnitary_baseChange` (functoriality): The decomposition commutes with further dominant étale pullback and Artinian scalar change.
- `relativeUnitary_unitary` (characterisation): Each Uᵢ is unitary on the total space and has finite-order determinant.
- `relativeUnitary_fibreIrreducible` (projection): The fibre restrictions Uᵢ|C° are irreducible and pairwise non-isomorphic, and V|C°≅⊕ᵢ Uᵢ|C°⊗(Wᵢ)_m.

**Discriminating unit tests:**

- `relativeUnitary_AeqC` (compatibility): For A=C the formula reduces to the complex isotypic evaluation decomposition.
- `relativeUnitary_rankZero` (degenerate): For the zero local system the indexing set is empty and the evaluation map is the unique isomorphism 0→0.
- `relativeUnitary_multiplicity_not_constant` (non-example): For V=π°^*W with W a nonconstant rank-one A-local system on M, W₁=W rather than a constant multiplicity module.

**Checks:**

- For A=C and V unitary on the total space with irreducible fibre restriction, the decomposition has the single summand U₁=V with W₁ trivial of rank one.
- Fibre constancy over A is required: for A=C[ε]/ε² and a non-constant first-order deformation of a unitary fibre, no decomposition with constant fibres exists.

**Source:** LL24, Lemma 2.4.2, pp.19–20. Lemma 2.4.2: after dominant étale base change, a free A-local system whose fibre restriction is V₀⊗A with V₀ unitary decomposes as ⊕Uᵢ⊗π^*Wᵢ with Uᵢ unitary, fibre-irreducible and pairwise distinct and Wᵢ=π_*Hom(Uᵢ,V). The proof uses Corollary 2.3.5, so g≥1 is needed (source issue E4, author erratum P04).

## C.3. Higher Prym representations

Define open-cover cohomological and compact-cover homological Prym actions and the Putman–Wieland predicate. Import marked versal φ-cover families (InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families), reduce boundary components, identify cover cohomology, and prove the subrepresentation rank bound from HodgeStructuresPartII:H.4/sublocal-system-rank, with its small-degree and small-order consequences.

**Stage dependencies:** `MordellLawrenceVenkatesh:LV.5`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5`; `MappingClassGroupsAndCanonicalRepresentations:C.2`; `DiamondsAndVStacks:D0`; `HodgeStructuresPartII:H.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.3/prym-action — Higher Prym actions

**Construction.** For a surjection φ:π₁Σ(g,b,p)↠H onto a finite group, put K=kerφ and let Γ⊂PMod(g,b,p+1) stabilize φ up to inner conjugacy in H. Restriction of the based automorphism to K acts on H¹(K,C), with the inverse-pullback convention giving a left action, and on H₁(K,C). It also acts on V_K=H₁ of the compactified covering surface. For each irreducible H-module σ, take the full σ-isotypic subspace σ⊗Hom_H(σ,V), embedded by evaluation; do this separately for open cohomology and compact homology. Γ normalizes the H-action up to inner automorphism, so the isotypic subspaces are stable.

**Atlas planet:** Higher Prym actions.

**Construction or proof:**

1. Import the actual covering attached to K and its deck action, and the supplied singular homology/cohomology.
2. Use functoriality for based automorphisms preserving K, fill ends for the compact quotient, and use the generic semisimple isotypic projector.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `tauceti:TauCeti.LocalCoefficientSystem`; `mathlib:isotypicComponent`.

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

- For H=1 and b=p=0, the compact-homology action of PMod(g,1) is the symplectic action of Mod(g) on H₁(Σ_g) pulled back along the forgetful map.
- With the inverse-pullback convention the actions on open-cover H¹ and H₁ are contragredient; a convention covariant on both fails prymAction_dual.

**Source:** LL24, Notation 7.1.1, p.35; Theorem 7.2.1 and Remark 7.2.2, p.36; proof, pp.37–38. Notation 7.1.1 sets up the finite cover of K=ker φ, the stabilizer Γ⊂PMod(g,b,p+1), isotypic components ρ⊗Hom_H(ρ,−) and the higher Prym representation on H₁ of the filled cover; Theorem 7.2.1 and its proof use cohomology of the open cover (PAPER-LANDESMAN-LITT-24/E1 records the H₁/H¹ mismatch); Remark 7.2.2 explains the restriction to subrepresentations.

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

- For H=Z/2 and g≥2 the property asserts that no nonzero class in H₁ of any connected double cover has finite orbit; C.3/pw-small-order gives it since 2<g².
- The property can fail: LL24 Remark 7.1.5 cites Marković’s counterexample to Putman–Wieland in genus two.

**Source:** LL24, Definition 7.1.2 and Remark 7.1.4, p.35. Definition 7.1.2 defines PW^H_{g,b,p}: for every surjection onto H, every nonzero vector of V_K has infinite Γ-orbit; Remark 7.1.4 relates it to the rational, group-free form of the Putman–Wieland conjecture.

### C.3/boundary-reduction — Boundary-to-puncture reduction

**Theorem.** Replacing all boundary circles by punctures gives an equivariant isomorphism H¹(Σ(g′,b′,p′),C)^σ≃H¹(Σ(g′,0,b′+p′),C)^σ. For each finite-index Γ′ in the original quotient stabilizer, its capping image Γ″ is finite index and has exactly the corresponding invariant subspaces. The covering genus remains g′.

**Construction or proof:**

1. Use the boundary-collar deformation retraction and naturality of covering cohomology.
2. Use the supplied capping sequence; boundary twists act by an inner action or the identity on K-abelianization and hence trivially on cohomology.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`; `MordellLawrenceVenkatesh:LV.5/capping-surjective`; `MordellLawrenceVenkatesh:LV.5/surface`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Checks:**

- For b=0 the reduction is the identity.
- Both sides have covering genus g′; the printed target surface of genus g would have the wrong first Betti number (source issue E5).

**Source:** LL24, Lemma 7.2.5, p.36 (covering genus corrected). Lemma 7.2.5 replaces boundary components by punctures, giving an isomorphism of isotypic components and a bijection of invariant subspaces for the image of Γ′ in PMod(g,0,b+p+1), since boundary twists act trivially; the printed target surface has genus g instead of g′ (source issue E5).

### C.3/cover-cohomology — Cover cohomology and family monodromy

**Theorem.** After dominant étale refinement of a versal φ-cover with g≥1, f_*C decomposes as ⊕σ Uσ⊗π°^*Wσ with Uσ finite-image unitary local systems of rank dimσ and Wσ constant complex multiplicity local systems. Its R¹π°_* σ-piece identifies, with the deck/dual convention fixed, with the open-cover H¹ σ-piece. Compact H¹ injects equivariantly into open H¹, and compact duality transfers the same subspace bounds to compact H₁.

**Construction or proof:**

1. Take a versal φ-cover family (IG.5/versal-phi-cover-families); apply the relative unitary decomposition with A=C to f_*C, and the finite-image normal-restriction result to its irreducible factors.
2. Trivialize the finite multiplicity monodromies by a finite étale cover. Use projection formula and the local-coefficient-to-sheaf adapter for R¹.
3. Use the long exact sequence of filling punctures and oriented compact Poincaré duality, checking the dual σ label rather than identifying every representation with its dual.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families`; `MappingClassGroupsAndCanonicalRepresentations:C.2/artin-decomposition`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`; `DiamondsAndVStacks:D0`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `mathlib:isotypicComponent`.

**Checks:**

- For H=1 the decomposition is f_*C=C and the identification is R¹π°_*C with the open-surface H¹.
- The comparison must be equivariant for every finite-index Γ′, which is why the cover family is refined to a finite étale cover of its base with π₁-image in Γ′.

**Source:** LL24, Proof of Theorem 7.2.1, pp.37–38. §7.3 builds a versal φ-cover family, decomposes f_*C by Lemma 2.4.2 into U_ρ⊗W_ρ with W_ρ trivial after a finite cover, identifies the π₁(M)-action on R¹π°_*U_ρ with the Γ-action on isotypic cohomology of the cover, and passes to H₁ of the compact cover by the inclusion into open cohomology and Poincaré duality.

### C.3/prym-rank — Higher Prym rank bound

**Theorem.** For every finite quotient φ of π₁Σ(g,b,p), every irreducible complex H-module σ, and every finite-index Γ′⊂Γ, each nonzero Γ′-stable subspace of H¹ of the open covering surface in its σ-isotypic component has dimension at least 2g−2 dimσ. The same bound holds for the compact covering H₁ σ-piece. No assertion is made for arbitrary open-cohomology subquotients.

**Atlas planet:** Higher Prym rank bound.

**Construction or proof:**

1. For g≤1 the numerical bound is nonpositive, so the statement is immediate; otherwise reduce boundary to punctures.
2. Refine the cover family to the chosen finite-index subgroup and use the cover cohomology comparison.
3. Apply H.4 Theorem 1.7.1 to each Uσ and its constant multiplicity sum, and pass to compact homology by the equivariant injection and duality.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/boundary-reduction`; `MappingClassGroupsAndCanonicalRepresentations:C.3/cover-cohomology`; `HodgeStructuresPartII:H.4/sublocal-system-rank`.

**Checks:**

- Reject the same statement for arbitrary subquotients in the noncompact case.
- For g=3 and dimσ=1, every nonzero such invariant subspace has dimension at least 4.

**Source:** LL24, Theorem 7.2.1, p.36; proof, pp.37–38. Theorem 7.2.1: for irreducible ρ of H and finite-index Γ′⊂Γ, the ρ-isotypic cohomology of the open cover, and the ρ-isotypic H₁ of the compact cover, have no nonzero Γ′-invariant subrepresentation of dimension below 2g−2dim ρ; §7.3 derives it from Theorem 1.7.1.

### C.3/pw-small-degree — Small-degree Putman–Wieland theorem

**Theorem.** If every irreducible complex representation of a finite H has dimension strictly less than g, then PW(H,g,b,p) holds for all b,p≥0.

**Atlas planet:** Small-degree Putman–Wieland theorem.

**Construction or proof:**

1. Project a hypothetical virtual fixed vector onto an isotypic summand. Its line contradicts the lower bound, which is an even integer at least 2.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-rank`; `MappingClassGroupsAndCanonicalRepresentations:C.3/pw-property`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`.

**Checks:**

- For abelian H every irreducible has dimension one, so the hypothesis is g≥2.
- For H=S₃ (an irreducible of dimension two) the hypothesis requires g≥3.

**Source:** LL24, Corollary 7.2.3, p.36. Corollary 7.2.3 deduces PW^H when every irreducible of H has dimension below g, by Theorem 7.2.1 applied to one-dimensional invariant subspaces of a finite-index stabilizer.

### C.3/pw-small-order — Small-order Putman–Wieland theorem

**Theorem.** For a finite group H with |H|<g², PW(H,g,b,p) holds for all b,p≥0.

**Atlas planet:** Small-order Putman–Wieland theorem.

**Construction or proof:**

1. Import the finite-group degree-square identity |H|=Σσ(dimσ)², conclude dimσ<g, and apply the small-degree result.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/pw-small-degree`; `tauceti:TauCeti.sum_characterDegree_sq_eq_card`.

**Checks:**

- For a cyclic H and g≥2, use the stronger small-degree theorem even when the order bound fails.
- For H=1,g=2 the order criterion holds; do not extend the strict inequality to all |H|=g².

**Source:** LL24, Corollary 7.2.4, p.36. Corollary 7.2.4 deduces PW^H for |H|<g² from Corollary 7.2.3 and the sum-of-squares formula for irreducible degrees.

### C.3/small-isotypic-orbits — Small-isotypic infinite orbits

**Theorem.** For a fixed irreducible H-module σ with dimσ<g, every nonzero vector of the compact covering homology σ-isotypic component has infinite orbit under Γ. No restriction on the dimensions of the other irreducible H-modules is required.

**Construction or proof:**

1. A finite vector orbit gives a fixed line for its finite-index stabilizer. The higher Prym bound is at least 2 on this component, contradicting the line.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-rank`; `MappingClassGroupsAndCanonicalRepresentations:C.3/prym-action`.

**Checks:**

- For a cyclic H and g≥2 all individual components satisfy the criterion, independently of |H|.
- The hypothesis is dimσ<g, not dimσ≤g.

**Source:** LL24, Theorem 1.4.2, p.5; Corollary 7.2.3 argument, p.36. Theorem 1.4.2: for irreducible ρ of H with dim ρ<g, no nonzero vector of the ρ-isotypic H₁ of the cover has finite Γ-orbit; it is the one-dimensional case of Theorem 7.2.1.

## C.4. Unitary rigidity and integrality

Import strong rigidity of fibre-irreducible low-rank total representations (HodgeStructuresPartII:H.5/versal-unitary-rigidity). Prove quasi-unipotence of multitwists in finite-index mapping-class subgroups and of boundary monodromy on a good compactification, deduce projective and linear integrality, and prove finite monodromy for low-rank unitary MCG-finite representations using every coefficient conjugate.

**Stage dependencies:** `AlgebraicModuliForArithmeticGeometry:R09.7a`; `HodgeStructuresPartII:H.5`; `StableReductionPartII:MC.4`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`; `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.4/boundary-quasiunipotence — Quasi-unipotent boundary monodromy

**Theorem.** For g≥3, a local system on a punctured level-versal total curve induced from a finite-index pointed mapping-class representation has quasi-unipotent local monodromy along a suitable smooth projective SNC compactification. The same holds for the canonical projective extension, tested through its faithful adjoint representation.

**Atlas planet:** Quasi-unipotent boundary monodromy.

**Construction or proof:**

1. Compactify the level-cover total space with R09.7a/stable-curve-boundary-interface: strictify the stable boundary, normalize in the function field of the cover and resolve preserving the open. Every final boundary meridian maps to a product of commuting node-smoothing meridians with nonnegative exponents.
2. Identify each node-smoothing meridian with the Dehn twist about its vanishing cycle (recorded Dehn-twist gap; R09.7a leaves this identification to this roadmap), so boundary monodromy is a multitwist up to finite-cover powers.
3. Apply C.4/multitwist-quasi-unipotence to the linear representation, and for PGL_r to Ad∘ρ̂, whose faithfulness transfers quasi-unipotence back; commuting quasi-unipotent matrices have quasi-unipotent product.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.4/multitwist-quasi-unipotence`; `AlgebraicModuliForArithmeticGeometry:R09.7a/stable-curve-boundary-interface`; `HodgeStructuresPartII:H.5/boundary-monodromy-data`; `StableReductionPartII:MC.4`; `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`.

**Checks:**

- For finite-image ρ the conclusion holds for every compactification.
- The exceptional divisors of the log resolution are covered: their meridians are again products of the commuting node-smoothing meridians (author erratum P04; PAPER-LANDESMAN-LITT-24/E18).

**Source:** LL24, Proposition 8.3.2 and Lemma 8.3.3, p.40. The proof of Lemma 8.3.3 reduces quasi-unipotent local monodromy of ρ̃ to Proposition 8.3.2 by showing that boundary meridians map to products of commuting Dehn twists (citing LLSS Lemma 2.1.1); its normalization step is replaced by a log resolution in the author erratum and in AlgebraicModuliForArithmeticGeometry/E1903.

### C.4/projective-integrality — Projective integrality theorem

**Theorem.** For g≥3, an irreducible unitary MCG-finite representation of rank r>0 with r²−1<g has projectivization conjugate into PGL_r(O_K) for some number field K, in the sense of the supplied reductive-group integral model.

**Atlas planet:** Projective integrality theorem.

**Construction or proof:**

1. Realize Pρ on the total space of a finite étale level chart (C.1/projective-extension) and obtain H¹(C°,ad)=0 from H.5/versal-unitary-rigidity, using r²−1<g.
2. Quasi-unipotent boundary monodromy (C.4/boundary-quasiunipotence) makes cohomological rigidity defined, and strong rigidity implies it (H.5/strong-implies-cohomological), in the order fixed by the author erratum.
3. PGL_r-irreducibility follows from irreducibility of the fibre restriction, and PGL_r has trivial abelianization; apply H.5/integrality-KP.

**Direct prerequisites:** `HodgeStructuresPartII:H.5/versal-unitary-rigidity`; `HodgeStructuresPartII:H.5/strong-implies-cohomological`; `HodgeStructuresPartII:H.5/integrality-KP`; `MappingClassGroupsAndCanonicalRepresentations:C.4/boundary-quasiunipotence`; `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`.

**Checks:**

- For r=1 the statement is empty since PGL₁ is trivial.
- Cohomological rigidity is deduced only after quasi-unipotent boundary monodromy is known, the order fixed by the author erratum (source issue E13).

**Source:** LL24, Lemma 8.3.3, p.40; KP20, Definition 1.1 and Theorem 1.2, pp.1–2. Lemma 8.3.3: for g≥3 and irreducible unitary MCG-finite ρ with r<√(g+1), Pρ is integral, by realizing it on a finite étale cover of M(g,n), rigidity (Proposition 8.2.1), quasi-unipotence (Proposition 8.3.2) and KP20 Theorem 1.2; the order of these steps is fixed in the author erratum (source issue E13). Theorem 1.2: a G-irreducible, G-cohomologically rigid local system with quasi-unipotent local monodromy and finite abelianized image, for G split connected reductive over Z, is conjugate into G(O_L) for a number field L.

### C.4/linear-integrality — Linear integrality with fixed determinant

**Theorem.** Under the same hypotheses, ρ is conjugate into GL_r(O_L) after a finite extension L of the projective coefficient number field.

**Atlas planet:** Linear integrality with fixed determinant.

**Construction or proof:**

1. Use finite determinant D and the finite central isogeny det⁻¹(D)→PGL_r after enlarging the number field to include D.
2. For each generator the actual lift ρ(γ) is a point of the finite pullback over its integral projective image and hence is integral after finite extension. Finite generation gives one common L.
3. Apply the same argument to inverses, so the matrices lie in GL_r(O_L), not merely integral matrix entries with nonunit determinant.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.4/projective-integrality`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `HodgeStructuresPartII:H.5/integral-representation`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`.

**Checks:**

- For r=1, ρ is a finite-order character (C.1/rank-one), integral over a cyclotomic ring of integers.
- The lift lies in GL_r(O_L), not only in M_r(O_L): inverses are treated by the same finite pullback.

**Source:** LL24, Lemma 8.3.4, pp.40–41. Lemma 8.3.4 deduces integrality of ρ from that of Pρ and finite determinant, since det⁻¹(μ_m)→PGL_r is finite and the lifting obstruction for each generator is a torsor trivialized over a finite extension.

### C.4/multitwist-quasi-unipotence — Quasi-unipotence of multitwists in finite-index subgroups

**Theorem.** Let S be a connected oriented surface of finite type and genus g≥3, Γ⊂Mod(S) a subgroup of finite index and r≥1. There is k=k(Γ,r)≥1 such that for every homomorphism ρ:Γ→GL_r(C) and every multitwist μ∈Γ (a product of powers of Dehn twists about pairwise disjoint simple closed curves), ρ(μ)^k is unipotent. In particular ρ(μ) is quasi-unipotent.

*Added by the independent review.*

**Atlas planet:** Quasi-unipotence of multitwists.

**Construction or proof:**

1. Since the twists in a multitwist commute, it suffices to treat μ=T_γ^m∈Γ for one simple closed curve γ; a product of commuting matrices whose k-th powers are unipotent has unipotent k-th power.
2. Cut S along γ. Because g≥3 some complementary component Z has genus at least 2, and Z has a boundary component η with ι(T_η)=T_γ under the inclusion-induced map ι:Mod(Z)→Mod(S) (LV.5 capping and twist nodes).
3. Induce ρ∘ι from the finite-index preimage of Γ to Mod(Z); ρ∘ι is a direct summand of the restriction of the induced representation (AS16 asserts more, see the source issue). T_η is central in Mod(Z), so the generalized eigenspaces of its image are Mod(Z)-invariant, and the determinant on each is a character of Mod(Z).
4. H₁(Mod(Z);Z) is finite for genus at least 2 (recorded gap), so these characters have order bounded by its exponent; the eigenvalues of ρ(T_γ^m) are therefore roots of unity of order bounded in terms of r and the index of Γ, which gives a uniform k.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `MordellLawrenceVenkatesh:LV.5/capping-surjective`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `mathlib:Representation.ind`.

**Checks:**

- Under the symplectic representation of Mod(S_g), g≥3, every Dehn twist maps to a transvection (LV.5/dehn-twist-homology), which is unipotent: consistent with k=1 for Γ=Mod(S_g) there.
- The genus bound is needed: PMod(0,4) is free of rank two on two Dehn twists, so a character sending one of them to 2 is not quasi-unipotent.
- The constant k depends on r and on Γ only, not on ρ or μ; the application to boundary monodromy needs this uniformity only for one ρ at a time.

**Source:** AS16, Proposition 2.4, Lemma 2.5 and proofs, pp.10–11; LL24, Proposition 8.3.2, p.40. Proposition 2.4 states, for genus at least 3 and finite-index Γ, a uniform power making the image of every multitwist unipotent; Lemma 2.5 proves the boundary-twist case on a genus-at-least-2 subsurface by induction, centrality of the boundary twist and finiteness of H¹(Map;R), and Proposition 2.4 reduces to it by cutting along the curve. Quotes the AS16 result for a single Dehn twist power in a finite-index subgroup of Mod(g,n), g≥3, as the input to Lemma 8.3.3.

### C.4/conjugate-unitarity — Unitarity of coefficient conjugates

**Theorem.** For a low-rank irreducible unitary MCG-finite representation integral over a number field, every number-field embedding into C gives a unitarizable conjugate representation. The hypothesis is r²<g+1 and g≥3 here.

**Construction or proof:**

1. Realize ρ on a punctured versal family with finite determinant (C.2/linear-realization); the total representation ρ′ is irreducible, strongly cohomologically rigid (H.5/versal-unitary-rigidity) and integral over O_K after C.4/linear-integrality.
2. For an embedding τ choose σ∈Aut(C) with σ∘ι=τ. Then ρ′⊗_σC is irreducible, strongly rigid and of finite determinant (H.5/rigidity-conjugate), so it underlies a complex PVHS on the total space (H.5/coh-rigid-semisimple-cvhs).
3. On analytically general fibres a PVHS of rank below 2√(g+1) is unitary (H.5/low-rank-pvhs-unitary), and r²<g+1 gives r<2√(g+1); transport along the family identifies the fibre representation with ρ⊗_τC.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`; `HodgeStructuresPartII:H.5/versal-unitary-rigidity`; `HodgeStructuresPartII:H.5/rigidity-conjugate`; `HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs`; `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`; `MappingClassGroupsAndCanonicalRepresentations:C.4/linear-integrality`.

**Checks:**

- For the identity embedding the conclusion is the hypothesis.
- A complex PVHS on one curve is not enough: H.5/low-rank-pvhs-unitary is applied to a variation on the total space of the versal family.

**Source:** LL24, Proof of Proposition 8.4.1, p.41; LL22, Theorem 1.2.12, pp.4–5. The proof of Proposition 8.4.1 conjugates the strongly rigid irreducible total representation by automorphisms of C, gets a complex PVHS from Lemma 4.3.2 and unitarity of every conjugate ρ⊗_τC from LL22 Theorem 1.2.12. Theorem 1.2.12: a flat bundle of rank below 2√(g+1) on a hyperbolic pointed curve whose isomonodromic deformation to an analytically general nearby curve underlies a PVHS has unitary monodromy.

### C.4/unitary-finite — Unitary canonical finiteness

**Theorem.** Every unitary MCG-finite rank-r representation of π₁Σ(g,n) with r²<g+1 has finite image, for all g,n≥0.

**Atlas planet:** Unitary canonical finiteness.

**Construction or proof:**

1. Split it into irreducibles using the existing unitary semisimplicity theorem. For g<3 the bound gives rank at most one (rank zero for g=0), covered directly by the rank-one theorem.
2. For each positive-rank irreducible in g≥3, use linear integrality and unitarity at all coefficient embeddings.
3. A representation into GL_r(O_L) that is unitary at every complex embedding has finite image (H.5/unitary-embeddings-finite, LL22 Lemma 7.2.1).

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`; `MappingClassGroupsAndCanonicalRepresentations:C.4/linear-integrality`; `MappingClassGroupsAndCanonicalRepresentations:C.4/conjugate-unitarity`; `HodgeStructuresPartII:H.5/unitary-embeddings-finite`; `tauceti:TauCeti.ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

**Checks:**

- An infinite cyclic unitary rank-one representation on a genus-zero punctured surface shows why g=0 permits only rank zero here.
- Unitarity at one embedding is not enough: H.5/infinite-image-unitary-example gives integral unitary rank-one systems of infinite image.

**Source:** LL24, Proposition 8.4.1, p.41; LL22, Lemma 7.2.1, p.51. Proposition 8.4.1: unitary MCG-finite representations of rank below √(g+1) have finite image; the proof reduces to irreducibles, treats g<3 by Proposition 2.3.1, and otherwise combines Lemma 8.3.4, unitarity of all conjugates and LL22 Lemma 7.2.1. Lemma 7.2.1: a representation into GL_m(O_K) that is unitary at every complex embedding has finite image, by discreteness of O_K in the product of its embeddings.

## C.5. Constancy and semisimple finiteness

Apply the shared abstract-group deformation criterion to fibre-unitary formal families. Prove conjugacy constancy in connected algebraic fixed-determinant families and semisimple finite monodromy, exposing the nonabelian-Hodge-to-algebraic-family bridge as a supplier obligation.

**Stage dependencies:** `DeformationAndDerivedPatchingAlgebra:R03.2`; `HodgeStructuresPartII:H.4`; `MappingClassGroupsAndCanonicalRepresentations:C.2`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `HodgeStructuresPartII:H.1`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `HodgeStructuresPartII:H.5`; `MappingClassGroupsAndCanonicalRepresentations:C.4`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.5/formal-constancy — Formal fibral constancy

**Theorem.** For a punctured étale-versal family and a representation ρ∞:π₁(C°)→GL_r(C[[t]]) with determinant equal to a fixed complex character, if its special fibre restricts unitarily to the curve group and r>0, r²<g+1, then the fibre restriction of ρ∞ is conjugate over C[[t]] to its constant special fibre.

**Atlas planet:** Formal fibral constancy.

**Construction or proof:**

1. Import the abstract discrete-group relative formal-constancy criterion over Art_C: it quantifies over every truncated deformation with constant restriction to the normal subgroup, not just the given family.
2. For B_n=C[t]/(tⁿ⁺¹) apply H.4/artinian-vanishing to adγ, of rank r²−1<g, whose fibre restriction is the constant deformation of the unitary ad ρ₀: H⁰(M,R¹π°_*adγ)=0 over B_n.
3. Use the criterion’s compatible sequence of conjugators; a separate conjugator at each order without compatibility does not suffice.

**Direct prerequisites:** `DeformationAndDerivedPatchingAlgebra:R03.2`; `HodgeStructuresPartII:H.4/artinian-vanishing`; `MappingClassGroupsAndCanonicalRepresentations:C.2/artin-decomposition`; `MappingClassGroupsAndCanonicalRepresentations:C.0/family-exact`.

**Checks:**

- If ρ∞ is conjugate to ρ₀⊗C[[t]] by a matrix of GL_r(C[[t]]), the conclusion holds trivially.
- The rank bound enters only through rank(adγ)=r²−1<g, the hypothesis of H.4/artinian-vanishing; for r²−1≥g no conclusion is drawn.

**Source:** LL24, Lemma 8.5.1, p.42; LL24, Proposition 3.2.1, pp.21–23. Lemma 8.5.1: for a punctured versal family, a C[[t]]-representation of π₁(C°) with constant determinant and unitary special fibre on the fibre group has fibre restriction conjugate to a constant one, by Proposition 3.2.1 and Theorem 6.2.1 for adγ of rank r²−1<g. Proposition 3.2.1: for 1→N→G→Q→1, if every truncated deformation constant on N has H⁰(Q,H¹(N,adγ))=0, a constant-determinant C[[t]]-deformation is conjugate to a constant one on N, by successive approximation with the derivative map dₙ.

### C.5/algebraic-constancy — Connected algebraic fibral constancy

**Theorem.** Let X be a connected finite-type C-scheme and ρ:π₁(C°)→GL_r(Γ(X,O_X)) an actual family of total-space representations whose determinant is a fixed complex character. If r>0, r²<g+1 and its restriction at one closed point is unitary, then the restrictions at all closed points of X are GL_r(C)-conjugate. This is a statement about representations, not arbitrary maps into a coarse character variety.

**Atlas planet:** Connected algebraic fibral constancy.

**Construction or proof:**

1. Join the two points by a chain of reduced curves and normalize each irreducible component.
2. Complete at a smooth point and apply formal fibral constancy. Intertwiner equations and the nonvanishing determinant show generic conjugacy after algebraic field extension.
3. Use that the orbit of a semisimple, in particular unitary, representation is closed (closed orbits are the semisimple points of the GIT quotient, H.1/betti-coarse) to specialize along the smooth curve, then propagate across intersections of components.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.5/formal-constancy`; `HodgeStructuresPartII:H.1/betti-framed`; `HodgeStructuresPartII:H.1/betti-coarse`.

**Checks:**

- For X a point the statement is empty.
- Closedness of the orbit at the unitary point is essential: for a non-semisimple point (a nonsplit unipotent representation) the orbit is not closed and the specialization step fails.

**Source:** LL24, Lemma 8.5.2, pp.42–43. Lemma 8.5.2: over a connected finite-type C-scheme, a constant-determinant family of representations of π₁(C°) with one unitary fibre has pairwise conjugate fibre restrictions, via reduction to smooth curves, Lemma 8.5.1 and closedness of semisimple orbits (citing Sikora Theorem 30).

### C.5/semisimple-finite — Semisimple canonical finiteness

**Theorem.** Every semisimple MCG-finite representation π₁Σ(g,n)→GL_r(C) with r²<g+1 has finite image, without assuming it unitary at the outset.

**Atlas planet:** Semisimple canonical finiteness.

**Construction or proof:**

1. Reduce to irreducibles and handle ranks zero and one separately; realize an irreducible ρ in a finite-determinant versal family (C.2/linear-realization).
2. Deform the total representation with constant determinant to one underlying a complex PVHS (H.5/deformation-to-cvhs, LL24 Theorem 4.3.1); its fibre restrictions are unitary (H.5/low-rank-pvhs-unitary, r<2√(g+1)) and MCG-finite (C.0/family-finite-orbit), hence finite by C.4/unitary-finite.
3. Place the original and the deformed total representations in one connected finite-type family of actual representations with fixed determinant: the deformation is a path in the fixed-determinant representation scheme H.1/betti-framed, whose connected components carry the universal representation. The component-lifting statement needed when the deformation is only given in the Betti quotient is the recorded bridge gap and H.1 request.
4. Apply C.5/algebraic-constancy: the fibre restriction of ρ is conjugate to the finite one.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.2/linear-realization`; `MappingClassGroupsAndCanonicalRepresentations:C.0/family-finite-orbit`; `HodgeStructuresPartII:H.5/deformation-to-cvhs`; `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary`; `HodgeStructuresPartII:H.1/betti-framed`; `HodgeStructuresPartII:H.1`; `MappingClassGroupsAndCanonicalRepresentations:C.5/algebraic-constancy`; `MappingClassGroupsAndCanonicalRepresentations:C.4/unitary-finite`.

**Checks:**

- For unitary ρ the deformation is trivial and the theorem is C.4/unitary-finite.
- Outside the range the statement fails: the rank-two special dihedral representations in genus one (C.9/genus-one-rank-two) are semisimple with infinite image, and r²=4≥g+1=2.

**Source:** LL24, Theorem 8.5.3, p.43; Theorem 4.3.1 and Lemma 4.3.2, p.27. Theorem 8.5.3: semisimple MCG-finite ρ of rank below √(g+1) has finite image, via Corollary 2.3.5, the PVHS deformation of Theorem 4.3.1, LL22 Theorem 1.2.12, Proposition 8.4.1 and Lemma 8.5.2; the family required by Lemma 8.5.2 is not exhibited (source issue E6).

## C.6. General finiteness and free groups

Prove characteristic-socle transport, the low-rank extension splitting theorem, and finite monodromy for all MCG-finite representations of rank r with r²<g+1. State Nielsen generation of Aut(F_N) and deduce the fibral, algebraic-isomonodromy, free-group, Nielsen-tuple, characteristic-quotient and total-image consequences.

**Stage dependencies:** `MappingClassGroupsAndCanonicalRepresentations:C.1`; `MappingClassGroupsAndCanonicalRepresentations:C.3`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count`; `MappingClassGroupsAndCanonicalRepresentations:C.5`; `HodgeStructuresPartII:H.2`; `StableReductionPartII:MC.2`; `MordellLawrenceVenkatesh:LV.5`; `MappingClassGroupsAndCanonicalRepresentations:C.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.6/socle-transport — Characteristic socle transport

**Theorem.** For an MCG-finite finite-dimensional complex surface representation, its existing group-algebra-module socle and its quotient are MCG-finite. Iteration produces a finite characteristic socle filtration with semisimple graded pieces; no new generic socle carrier is introduced.

**Construction or proof:**

1. Transport the supremum of simple submodules along each intertwiner, using the existing socle universal property.
2. Finite-dimensionality gives strict dimension growth until the whole module; use the characteristic-subquotient finite-orbit result at each step.

**Direct prerequisites:** `tauceti:TauCeti.socle`; `tauceti:TauCeti.isSemisimpleModule_socle`; `MappingClassGroupsAndCanonicalRepresentations:C.1/closure`.

**Checks:**

- For semisimple ρ the socle filtration has length one.
- For the abelianization unipotent example the socle is H and the quotient is the trivial line, both MCG-finite.

**Source:** LL24, §8.7, p.44; Proposition 2.1.1, p.12. §8.7 inducts on the socle filtration, using that the socle is characteristic so the socle and quotient are MCG-finite; Proposition 2.1.1 covers semisimple subquotients.

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

**Source:** LL24, Lemma 8.6.1, p.44 (stabilizer choice repaired). Lemma 8.6.1: if ρ is MCG-finite of rank below √(g+1), with semisimple characteristic ρ₁ and semisimple quotient ρ₂ of finite image, the extension splits, via a cover trivializing ρ₁⊕ρ₂ and Theorem 7.2.1 for the image of H₁ of the cover in ρ₂^∨⊗ρ₁; the printed Γ only stabilizes the constituents σᵢ (source issue E7).

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

**Source:** LL24, Theorem 1.2.1, p.3; proof §8.7, p.44. Theorem 1.2.1: MCG-finite ρ of rank r<√(g+1) has finite image; §8.7 proves it by induction on socle length from Theorem 8.5.3 and Lemma 8.6.1.

### C.6/fibral-finiteness — Finite fibral monodromy

**Theorem.** For a local system of rank r on a punctured étale-versal family of genus g with r²<g+1, its restriction to every fibre has finite image. No semisimplicity of the total-space representation is required.

**Construction or proof:**

1. Combine the total-space-to-finite-orbit result with canonical representation finiteness, and use parallel transport to pass between fibres.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/family-finite-orbit`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`.

**Checks:**

- A local system pulled back from the base has trivial fibre restrictions.
- No semisimplicity is assumed; the bound r²<g+1 is the one of the main theorem.

**Source:** LL24, Corollary 1.3.1, p.4. Corollary 1.3.1: on a punctured versal family, a local system of rank below √(g+1) has finite monodromy on every fibre, by Proposition 2.1.3 and Theorem 1.2.1.

### C.6/isomonodromy — Algebraic universal isomonodromy criterion

**Theorem.** For a smooth projective complex pointed genus-g curve and a semisimple regular-singular logarithmic flat connection of rank r with residue eigenvalue real parts in [0,1), if r>0 and r²<g+1, its universal analytic isomonodromic deformation is algebraizable exactly when its monodromy has finite image. In the hyperbolic range use the mild-connection isomonodromy theorem; the unpointed genus-one rank-one case requires its separate comparison.

**Atlas planet:** Algebraic universal isomonodromy criterion.

**Construction or proof:**

1. Use the Deligne canonical extension (H.2/canonical-extension, H.2/residue-monodromy): residue eigenvalues with real parts in [0,1) characterize it, and such logarithmic connections are mild in the sense of CH19.
2. In the hyperbolic range CH19 Theorem A (recorded CH19 gap) identifies algebraicity of the universal isomonodromic deformation with finiteness of the mapping-class orbit of the monodromy; the main theorem turns a finite orbit into finite image, and finite image gives a finite orbit.
3. Do not apply CH19 outside 2g−2+n>0; the unpointed genus-one rank-one case remains an explicit source gate.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `HodgeStructuresPartII:H.2/canonical-extension`; `HodgeStructuresPartII:H.2/residue-monodromy`; `StableReductionPartII:MC.2`.

**Checks:**

- A flat bundle with finite monodromy has an algebraic universal isomonodromic deformation, defined over a finite étale cover of the moduli stack: the easy direction.
- The residue condition (real parts in [0,1)) says the connection is the Deligne canonical extension, which is mild in the sense of CH19; other connections are first gauge-transformed birationally.

**Source:** LL24, Corollary 1.2.3, p.4; CH19, Theorem A, p.4; §3.2 examples of mild models, p.11. Corollary 1.2.3: for semisimple regular-singular (E,∇) of rank below √(g+1) with residue eigenvalues of real part in [0,1), an algebraic universal isomonodromic deformation exists exactly when the monodromy is finite, by CH19 Theorem A and Theorem 1.2.1. Theorem A: for 2g−2+n>0, mild ∇₀ and, when r>2, semisimple monodromy, a universal algebraic isomonodromic deformation exists exactly when the mapping-class orbit of [ρ] is finite; a Deligne model (residue real parts in [0,1)) is mild.

### C.6/free-finiteness — Free-group canonical finiteness

**Theorem.** Let N=2g or 2g+1 and ρ:F_N→GL_r(C). If its actual conjugacy class has finite Out(F_N)-orbit and r²<g+1, then its image is finite.

**Atlas planet:** Free-group canonical finiteness.

**Construction or proof:**

1. For even N identify F_N with π₁Σ(g,1); for odd N use Σ(g,2). Restrict the Out(F_N)-action to surface mapping classes.
2. Apply the surface theorem. This is a consequence in one direction; finite mapping-class orbit is not claimed equivalent to finite Out orbit.
3. Handle N=0 and N=1 directly under the rank inequality, which forces rank zero.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5`; `mathlib:FreeGroup`; `mathlib:Matrix.GeneralLinearGroup`.

**Checks:**

- For N=0 or N=1 the bound forces g=0 and r=0.
- For odd N=2g+1 the surface is Σ(g,2), whose fundamental group is free of rank 2g+1.

**Source:** LL24, Corollary 1.6.1, p.5. Corollary 1.6.1: for N=2g or 2g+1, an Out(F_N)-finite representation of rank below √(g+1) has finite image, by identifying F_N with π₁ of a once- or twice-punctured genus-g surface.

### C.6/nielsen-generation — Nielsen generators of Aut(F_N)

**Theorem.** For N≥1 and the free group F_N on the ordered basis x₁,…,x_N, Aut(F_N) is generated by the cyclic shift xᵢ↦xᵢ₊₁ (indices mod N), the transposition of x₁ and x₂ (N≥2), the inversion x₁↦x₁⁻¹ and the transvection x₁↦x₁x₂ (N≥2), each fixing the remaining basis elements. Under the evaluation bijection Hom(F_N,G)≅G^N, precomposition with these four automorphisms is the operation c, τ, ε or d of LL24 Remark 1.6.3 on N-tuples, and Out(F_N) acts on simultaneous-conjugacy classes of tuples.

*Added by the independent review.*

**Construction or proof:**

1. Nielsen’s theorem (Nielsen reduction of a basis) gives the generation statement; its primary source is the recorded Nielsen gap.
2. The tuple dictionary is FreeGroup.lift: precomposition by an automorphism φ sends the tuple (ρ(x₁),…,ρ(x_N)) to (ρ(φ(x₁)),…,ρ(φ(x_N))), which for the four generators gives c, τ, ε, d.
3. Inner automorphisms change a tuple by simultaneous conjugation, so the action on conjugacy classes factors through Out(F_N).

**Direct prerequisites:** `mathlib:FreeGroup`; `mathlib:FreeGroup.lift`.

**Checks:**

- Abelianization sends the four generators to a cyclic permutation matrix, a transposition matrix, diag(−1,1,…,1) and an elementary transvection matrix, which together generate GL_N(Z); a candidate generating set whose image misses the sign change fails this check.
- For N=1, Aut(Z)={±1} is generated by the inversion alone; the cyclic shift is the identity.
- For N=2 and G=GL₃(C), the transvection sends the pair (I+E₁₃, I+E₂₃) of Remark 10.2.7 to (I+E₁₃+E₂₃, I+E₂₃), which is conjugate to the original pair by the block matrix fixing e₂,e₃ and sending e₁ to e₁+e₂: a direct instance of the finite-orbit property of C.9/unipotent-example.

**Source:** LL24, Remark 1.6.3, pp.5–6. Lists the four tuple operations as the Nielsen generators of Aut(F_N), citing Nielsen 1924 and Magnus–Karrass–Solitar Theorem 3.2, p.131, and uses them for the elementary reformulation of Corollary 1.6.1.

### C.6/nielsen-tuples — Nielsen matrix finiteness criterion

**Theorem.** For N≥2 with N=2g or 2g+1, let (A₁,…,A_N) be invertible complex r×r matrices. If the tuples obtained by cyclic permutation, swapping the first two entries, inverting A₁, and replacing A₁ by A₁A₂ meet only finitely many simultaneous conjugacy classes, and r²<g+1, then the Aᵢ generate a finite group.

**Construction or proof:**

1. Use C.6/nielsen-generation: the four operations are precomposition with the Nielsen generators of Aut(F_N).
2. Although only forward words are specified, each invertible generator permutes the finite set of reached conjugacy classes; its inverse therefore preserves this set.
3. Apply the free-group finite-orbit theorem via the basis evaluation equivalence.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/free-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.6/nielsen-generation`; `mathlib:FreeGroup.lift`.

**Checks:**

- For N=2 and r=1 the tuple condition holds for pairs of roots of unity and fails when λ has infinite order, since the operation d sends (λ,μ) to (λμ,μ) and with τ produces infinitely many pairs.
- The forward closure under the four operations is closed under inverses, because each operation is a bijection on simultaneous-conjugacy classes and the reached set is finite.

**Source:** LL24, Remark 1.6.3, pp.5–6. Remark 1.6.3 reformulates Corollary 1.6.1: if the tuples obtained by the four Nielsen operations meet only finitely many simultaneous conjugacy classes and r<√(g+1), the matrices generate a finite group.

### C.6/characteristic-quotient — Characteristic quotient consequence

**Theorem.** Let G be a quotient of F_N by a characteristic normal subgroup, N=2g or 2g+1. A rank-r representation of G with finite Out(G)-orbit has finite image when r²<g+1. Likewise for a characteristic quotient of a surface group under its induced mapping-class action and the surface bound.

**Construction or proof:**

1. Pull back along the surjection. Characteristicity induces the automorphism action on the quotient; pullback preserves conjugacy and the image, so apply the appropriate finite-orbit theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.6/free-finiteness`.

**Checks:**

- For G=F_N^{ab}=Z^N, a characteristic quotient with Out(G)=GL_N(Z), the conclusion recovers the rank-one statement for characters of Z^N.
- The quotient must be characteristic so that automorphisms of F_N descend to G.

**Source:** LL24, Remark 1.6.5, p.6. Remark 1.6.5: the analogue of Corollary 1.6.1 for characteristic quotients of free (or surface) groups follows by pulling back along the quotient map.

### C.6/total-finiteness — Finite total mapping-class image

**Theorem.** For a finite-index Γ⊂PMod(g,n+1) containing the hyperbolic point-pushing subgroup, a representation of rank r with r²<g+1, finite determinant and irreducible restriction to the surface group has finite total image.

**Construction or proof:**

1. Use point-pushing restriction, canonical finite monodromy on the normal subgroup, and the arbitrary-group irreducible normal-restriction theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/point-push-restriction`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `MappingClassGroupsAndCanonicalRepresentations:C.2/normal-restriction`.

**Checks:**

- For the trivial representation of Γ the conclusion is immediate.
- The finite-determinant and irreducibility hypotheses are exactly those of C.2/normal-restriction, through which the conclusion passes from the surface group to Γ.

**Source:** LL24, Remark 10.1.7, p.51. Remark 10.1.7: for finite-index Γ⊂PMod(g,n+1) containing the point-pushing subgroup, a representation of rank below √(g+1) with irreducible point-pushing restriction and finite determinant has finite image, by Theorem 1.2.1, Lemma 2.4.1(1) and Proposition 2.1.2.

## C.7. Generic arithmetic curves

Import arithmetic representations of the geometric étale fundamental group (InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation). Compare finite Galois orbit with finite topological mapping-class orbit on a curve generic over M(g,n) over Q, prove arithmetic finite monodromy, and prove the four-way equivalence with geometric origin and integral PVHS in the O_K sense, and its wider three-way range.

**Stage dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `MappingClassGroupsAndCanonicalRepresentations:C.0`; `StableReductionPartII:MC.4`; `MappingClassGroupsAndCanonicalRepresentations:C.6`; `MappingClassGroupsAndCanonicalRepresentations:C.1`; `HodgeStructuresPartII:H.5`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.7/arithmetic-comparison — Generic curve orbit comparison

**Theorem.** Let (C,x₁,…,x_n)/K be a smooth geometrically connected pointed curve, K finitely generated of characteristic zero, in the hyperbolic range. Suppose SpecK→M(g,n)_Q factors through its generic point. Every continuous arithmetic geometric representation has finite mapping-class orbit after choosing K↪C, restricting to the dense topological surface group, and transporting coefficients by an abstract field isomorphism Qbar_ℓ≃C.

**Atlas planet:** Generic curve orbit comparison.

**Construction or proof:**

1. Compare the arithmetic exact sequence of the curve over K with that of the universal punctured curve over M(g,n)_Q (IG.1/stack-and-family-exactness), using a fine level scheme where needed; generic dominance gives finite-index image on the étale fundamental group of the moduli stack.
2. Use characteristic-zero algebraically closed base change for the nonproper punctured curves, Riemann existence and compatible outer actions. The universal homotopy sequence and its kernel injection require the precise profinite centerlessness/exactness theorem; discrete centerlessness alone is not a proof.
3. The Galois orbit finiteness descends to the moduli group and then to its topological mapping-class subgroup. The coefficient field isomorphism is purely algebraic and is not used to preserve ℓ-adic topology.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness`; `MappingClassGroupsAndCanonicalRepresentations:C.0/moduli-monodromy`; `StableReductionPartII:MC.4`.

**Checks:**

- For finite-image ρ the comparison is immediate.
- Galois acts through the outer action on the geometric group, and the topological surface group is dense in it, so a finite Galois orbit restricts to a finite mapping-class orbit.

**Source:** LL24, Proof of Theorem 9.1.2, pp.46–47. The proof of Theorem 9.1.2 maps the homotopy sequence of the curve over K to that of the universal punctured curve over M(g,n)_Q, proves exactness of the latter from the topological sequence by profinite completion with centreless kernel (citing Anderson), and deduces finiteness of the orbit under π₁(M(g,n)_Qbar) and then under the topological mapping class group.

### C.7/arithmetic-finite — Generic arithmetic finite monodromy

**Theorem.** For K finitely generated of characteristic zero and a smooth geometrically connected n-pointed genus-g curve whose moduli map is generic over M(g,n)_Q, every continuous arithmetic ρ:π₁ᵉᵗ(C_Kbar minus the marks)→GL_r(Qbar_ℓ) with r²<g+1 has finite image.

**Atlas planet:** Generic arithmetic finite monodromy.

**Construction or proof:**

1. Handle rank zero, and genus-one rank one directly by geometric SL₂ monodromy if the hyperbolic comparison does not apply.
2. Apply the generic orbit comparison and the surface finiteness theorem to the dense topological subgroup.
3. In the original ℓ-adic topology a finite set is closed. Continuity and density therefore force the entire étale image to equal that finite image.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-comparison`; `MappingClassGroupsAndCanonicalRepresentations:C.6/main-finiteness`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness`; `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`.

**Checks:**

- For r=1 and g≥1 a continuous arithmetic character of the geometric group of the generic curve has finite order.
- Genericity is essential: if a pointed curve admits a nonconstant map to a modular curve sending the complement of the marks into the open modular curve, the pulled-back Tate module is an arithmetic rank-two representation of infinite image, so for g≥4 such a pointed curve is never generic (compare LL22 Corollary 1.2.8).

**Source:** LL24, Theorem 9.1.2, p.45; proof, pp.46–47. Theorem 9.1.2: on a curve whose moduli point is the generic point of M(g,n)_Q, continuous arithmetic representations of rank below √(g+1) have finite image, by the orbit comparison, Theorem 1.2.1 and density of the topological group.

### C.7/finite-arithmetic — Finite monodromy is arithmetic

**Theorem.** For a smooth geometrically connected finite-type curve in characteristic zero over finitely generated K, every continuous finite-image geometric ℓ-adic representation is arithmetic.

**Construction or proof:**

1. The geometric profinite fundamental group is topologically finitely generated. Precomposition with its outer automorphisms yields only finitely many homomorphisms into the same finite matrix group.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness`.

**Checks:**

- The trivial representation is arithmetic.
- Finite image is sufficient but not necessary for arithmeticity: Tate modules of abelian schemes are arithmetic with infinite image.

**Source:** LL24, Corollary 9.1.4, pp.45–46, implication (1)⇒(2). Corollary 9.1.4 records that finite image implies arithmeticity.

### C.7/hodge-characterisation — Geometric and Hodge characterisations

**Theorem.** For a generic pointed curve as in C.7/arithmetic-finite and r²<g+1, the following are equivalent for a continuous ρ: (1) ρ has finite image; (2) ρ is arithmetic; (3) for every embedding K↪C and every field isomorphism Qbar_ℓ≃C, the complex local system on the punctured Riemann surface is of geometric origin (H.5/geometric-origin); (4) for every such choice it underlies an integral PVHS in the O_K sense of H.5/integral-pvhs: it comes from an O_K-local system all of whose conjugates underlie complex PVHS.

**Atlas planet:** Geometric and Hodge characterisations.

**Construction or proof:**

1. (1)⇔(2) is C.7/arithmetic-finite together with C.7/finite-arithmetic.
2. (1)⇒(3): a finite-image local system is a direct summand of the pushforward of the constant sheaf along the finite étale cover it defines. (3)⇒(4) is H.5/geometric-origin-integral-pvhs.
3. (4)⇒(1): choose K↪C at an analytically very general point; this is possible because the points lying over the generic point of M(g,n)_Q form a comeagre set and the very general locus is comeagre. Then H.5/very-general-rank-bound (LL22 Theorem 1.2.5) gives finite monodromy, since r<2√(g+1).

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `MappingClassGroupsAndCanonicalRepresentations:C.7/finite-arithmetic`; `HodgeStructuresPartII:H.5/geometric-origin`; `HodgeStructuresPartII:H.5/integral-pvhs`; `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`; `HodgeStructuresPartII:H.5/very-general-rank-bound`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness`.

**Checks:**

- A non-real finite-order character satisfies (4) in the O_K sense although it has no invariant rank-one Z-lattice; under a literal Z-lattice reading the implication (1)⇒(4) would fail (source issue E8).
- The quantifiers in (3) and (4) range over all embeddings and all coefficient isomorphisms.

**Source:** LL24, Corollary 9.1.4, pp.45–46; LL22, Theorem 1.2.5 and Corollary 1.2.7, p.3. Corollary 9.1.4 states the equivalence of finite image, arithmeticity, geometric origin and integral PVHS for dim ρ<√(g+1); its proof cites LL22 Corollary 1.2.7 where Theorem 1.2.5 is meant (PAPER-LANDESMAN-LITT-24/E19), and leaves the meaning of integral PVHS implicit (source issue E8). Theorem 1.2.5: an O_K-local system with infinite monodromy on an analytically very general hyperbolic curve, all of whose conjugates underlie PVHS, has rank at least 2√(g+1); Corollary 1.2.7 is the geometric-origin consequence.

### C.7/wider-hodge-range — Wider Hodge finiteness range

**Theorem.** For the same generic pointed curve, conditions (1), (3) and (4) of C.7/hodge-characterisation are equivalent whenever r<2√(g+1). Arithmeticity is not part of this wider equivalence.

**Construction or proof:**

1. The implications (1)⇒(3)⇒(4) hold in every rank; (4)⇒(1) uses only r<2√(g+1) in H.5/very-general-rank-bound. The low-rank arithmetic theorem is not used, so no wider arithmetic statement follows.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.7/hodge-characterisation`; `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs`; `HodgeStructuresPartII:H.5/very-general-rank-bound`; `HodgeStructuresPartII:H.5/integral-pvhs`.

**Checks:**

- Arithmeticity is excluded in this range: LL24 Remark 9.1.5 records that only the relative Fontaine–Mazur conjecture would extend it to semisimple ρ with r<2√(g+1).
- The bound is 2√(g+1), strictly larger than the bound √(g+1) of C.7/hodge-characterisation.

**Source:** LL24, Corollary 9.1.4, p.46, final assertion. The final assertion of Corollary 9.1.4: finite image, geometric origin and integral PVHS are equivalent whenever dim ρ<2√(g+1).

## C.8. Residual lifts and nondensity

Define residual arithmetic lifts. Prove the uniform Jordan-word obstruction, nonliftability for sufficiently large residual characteristic, explicit surjections, and nondensity on hyperbolic surfaces. State only the justified conditional nonflat/nonsmooth deformation-ring consequence.

**Stage dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `HodgeStructuresPartII:H.5`; `MappingClassGroupsAndCanonicalRepresentations:C.7`; `MordellLawrenceVenkatesh:LV.5`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `HodgeStructuresPartII:H.1`; `DeformationAndDerivedPatchingAlgebra:R03.4`; `DeformationAndDerivedPatchingAlgebra:R03.2`.

**Coverage:** planned; every target is represented below. Closure requires the supplier and source obligations named for these targets in the gap ledger.

### C.8/residual-lift — Residual arithmetic lifts

**Definition.** For a residual representation ρbar:π₁ᵉᵗ(C_Kbar°)→GL_r(F_p), an arithmetic lift consists of a finite extension E/Q_p, an O_E-lattice L of rank r, and a continuous characteristic-zero arithmetic representation on L⊗E, preserving L, whose residual representation becomes isomorphic to ρbar after a chosen residue-field embedding and scalar extension. A residual geometric-origin realization is such a stable-lattice reduction of a characteristic-zero representation of geometric origin, with its specified coefficient field. Do not quantify only over unramified lifts.

**Atlas planet:** Residual arithmetic lifts.

**Construction or proof:**

1. Use the arithmetic predicate IG.1/arithmetic-representation, stable lattices and their reductions; geometric origin is H.5/geometric-origin.
2. State the reduction isomorphism, with its residue scalar extension, as part of the lifting data. Import geometric-origin descent to arithmeticity for its use in nonlifting.

**Direct prerequisites:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation`; `HodgeStructuresPartII:H.5/geometric-origin`; `HodgeStructuresPartII:H.5`.

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

- A lift over a ramified finite extension E with residue field F_p is admitted.
- A residual geometric-origin realization yields an arithmetic lift only through the geometric-origin descent requested from H.5.

**Source:** LL24, Definition 9.2.1, pp.47–48; Corollary 9.2.2, p.48. Definition 9.2.1 defines residual representations of geometric origin as reductions of stable lattices in characteristic-zero representations of geometric origin over W(F)[1/p]; Corollary 9.2.2 works with arithmetic lifts over finite extensions of Q_p.

### C.8/jordan-word — Uniform Jordan word obstruction

**Theorem.** For each r≥2 there is an integer m(r)>0 such that every finite subgroup of GL_r in characteristic zero satisfies [x^m,y^m]=1. For every prime p not dividing m(r), GL_r(F_p) violates this identity. Consequently it cannot be a quotient obtained by reducing a finite characteristic-zero matrix subgroup of rank r.

**Atlas planet:** Uniform Jordan word obstruction.

**Construction or proof:**

1. Import Jordan’s theorem: a uniform bound J(r) on the index of an abelian normal subgroup of a finite subgroup of GL_r in characteristic zero (recorded Jordan gap), and take m(r)=J(r)!.
2. Then all m-th powers lie in that abelian subgroup. Polynomial identities survive reduction and quotients.
3. Use opposite 2×2 unipotents embedded as a block in rank r; their m-th powers have off-diagonal entries m and do not commute when p∤m.

**Direct prerequisites:** `mathlib:Matrix.GeneralLinearGroup`.

**Checks:**

- Check the two opposite-unipotent block calculation in rank two.
- The exceptional set is the finite set of primes dividing m(r); an assertion for every p is not justified.

**Source:** LL24, Proof of Corollary 9.2.2, p.48; LL22, Lemma 7.5.1 proof, p.54. The proof of Corollary 9.2.2 uses Jordan’s theorem as the identity [g₁^{n(r)},g₂^{n(r)}]=1 in finite subgroups of GL_r in characteristic zero and the opposite unipotents of GL_r(F_p), which violate it for p∤n(r). The proof of Lemma 7.5.1 uses the same identity with exponent m_r! from Jordan’s bound m_r on the index of an abelian normal subgroup.

### C.8/nonlifting — Residual arithmetic nonlifting

**Theorem.** For the generic characteristic-zero pointed curve, if 1<r<√(g+1), p∤m(r), and ρbar is a surjection onto GL_r(F_p), then it has no arithmetic characteristic-zero lift in the stable-lattice sense. It has no residual geometric-origin realization once the geometric-origin-to-arithmetic descent supplier is applied.

**Atlas planet:** Residual arithmetic nonlifting.

**Construction or proof:**

1. An arithmetic lift would have finite image by the generic arithmetic theorem. Reduce its uniform Jordan word to contradict residual surjectivity.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.8/residual-lift`; `MappingClassGroupsAndCanonicalRepresentations:C.8/jordan-word`; `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `HodgeStructuresPartII:H.5`.

**Checks:**

- For primes dividing m(r) no conclusion is drawn (author erratum P04 restricts Example 9.2.3 accordingly).
- r=1 is excluded: GL₁(F_p) is cyclic and the Jordan word is trivial there.

**Source:** LL24, Corollary 9.2.2, p.48. Corollary 9.2.2: for 1<r<√(g+1) and p≫_r 0, no surjection onto GL_r(F_p) has an arithmetic lift, since a lift has finite image by Theorem 9.1.2 and Jordan’s theorem then contradicts surjectivity; mod-p representations of geometric origin are excluded as well.

### C.8/residual-surjections — Surjective residual examples

**Theorem.** For every prime p and r≥2, a smooth characteristic-zero curve with n>0 and 2g+n−1≥2, or with n=0 and g≥2, has a continuous geometric representation surjecting onto GL_r(F_p). On the generic curves in the low-rank range these examples have no arithmetic lifts when p∤m(r).

**Construction or proof:**

1. Import two-generation of GL_r(F_p) (recorded Jordan and two-generation gap).
2. An open curve has free profinite geometric group of the indicated rank (the profinite completion, IG.1/stack-and-family-exactness, of the free topological group of LV.5/fadell-neuwirth-sequence). For a closed curve send every bᵢ to 1 in the surface presentation to obtain a free profinite quotient on g generators.
3. Map two free generators to the certified generating pair. Apply nonlifting only outside the finite exceptional prime set.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence`; `MappingClassGroupsAndCanonicalRepresentations:C.8/nonlifting`.

**Checks:**

- For n>0 the geometric group is free profinite on 2g+n−1 generators.
- For n=0, sending every b_i to 1 gives a surjection onto the free profinite group on a₁,…,a_g.

**Source:** LL24, Example 9.2.3, pp.48–49 (prime restriction corrected for nonlifting). Example 9.2.3 produces surjections onto GL_r(F_p) for every p from free profinite quotients and two-generation of GL_r(F_p) (citing Waterhouse); non-liftability holds only for p≫_r 0 (source issue E9, author erratum P04).

### C.8/nondensity — Arithmetic representation nondensity

**Theorem.** For a hyperbolic surface with g≥1, r≥2, the finite-image rank-r semisimple complex representations lie in a proper closed locus of the character variety. Thus on the generic curve in the range 1<r<√(g+1), arithmetic geometric representations are not Zariski dense. The unpointed torus is excluded.

**Atlas planet:** Arithmetic representation nondensity.

**Construction or proof:**

1. The uniform Jordan word imposes finitely many word identities on the fixed representation scheme (H.1/betti-framed); the locus is closed and conjugation-invariant, so its image in the GIT quotient (H.1/betti-coarse) is closed.
2. To see it is proper, use a free quotient on two generators, map them to the opposite unipotent blocks, and semisimplify; the irreducible SL₂ block still violates the identity.
3. Use arithmetic finite monodromy in the smaller rank range. On the unpointed torus torsion characters are dense, so no unrestricted genus-one statement is exported.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.8/jordan-word`; `MappingClassGroupsAndCanonicalRepresentations:C.7/arithmetic-finite`; `MordellLawrenceVenkatesh:LV.5/surface`; `HodgeStructuresPartII:H.1/betti-framed`; `HodgeStructuresPartII:H.1/betti-coarse`.

**Checks:**

- For r=1 the conclusion fails: torsion characters are dense in the character torus, hence r≥2.
- The unpointed torus is excluded since its fundamental group is abelian and finite-image representations are dense there.

**Source:** LL24, Remark 9.1.3, p.45; LL22, Lemma 7.5.1 and proof, pp.53–54. Remark 9.1.3 combines Theorem 9.1.2 with LL22 Lemma 7.5.1: arithmetic representations are not Zariski dense in the character variety for 1<r<√(g+1). Lemma 7.5.1: for r>1 finite-image representations are not Zariski dense, via the closed locus [ρ(x)^s,ρ(y)^s]=1 and a representation sending two generators to opposite unipotents.

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

**Source:** LL24, Remarks 9.2.5–9.2.6, p.49 (weakened to the justified conditional conclusion). Remarks 9.2.5–9.2.6 infer failure of the complete-intersection property from non-flatness of deformation rings; the inference is invalid and the remarks are deleted in the author erratum (source issue E10). Only the conditional non-flatness is kept.

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

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

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

- For F₂ the matrices are those displayed in LL24 Remark 10.2.7.
- For a closed genus-g surface the rank is 2g+1, the bound of LL24 §10.2 showing that the rank hypothesis cannot be improved beyond linear in g.

**Source:** LL24, Example 10.1.6(3), p.51; Remark 10.2.7, pp.52–53. Example 10.1.6(3) describes the point-pushing restriction of Morita’s extension as v↦v, e↦e+a(γ) on H₁⊕Qe, and Remark 10.2.7 gives the free-group variant of rank N+1 with explicit matrices for N=2; invariance of the conjugacy class is checked directly here.

### C.9/morita-primitive — Morita primitive exterior extension

**Theorem.** For closed genus g≥3, with H=H₁(Σ_g,Q) and the symplectic inclusion H→∧³H, there is a nonzero class in H¹(Mod_g,(∧³H)/H), hence a nonsplit extension 0→(∧³H)/H→W→Q→0 and a nontrivial deformation of its split representation. The nonzero class, the normalization of H→∧³H and the genus range require the original Morita source certificate.

**Construction or proof:**

1. Import the symplectic surface representation and exterior powers, and the group-cohomology extension dictionary.
2. Use Morita’s nonzero class as an explicitly source-gated input; scaling its cocycle gives the deformation with split special fibre.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- At g=2, H→∧³H is an isomorphism, so the displayed quotient cannot support the asserted nonzero class.
- The original nonvanishing proof is required before this example can be closed.

**Source:** LL24, Example 10.1.6(1), p.50; citation [Mor93]. Example 10.1.6(1) cites Morita 1993 for a nonzero class in H¹(Mod_g,∧³H/H), giving a non-split extension and non-rigidity of Q⊕∧³H/H; genus range and normalization are not stated.

### C.9/augmentation-extension — Augmentation-ideal extension example

**Theorem.** For g≥2 and n>0 with 2g+n−3>0, let I be the augmentation ideal of Q[π₁Σ(g,n−1)] with its PMod(g,n)-action. The candidate sequence 0→I²/I³→I/I³→I/I²→0 is the punctured-surface nonsplit deformation example. Its nonsplitting needs a worked point-pushing or Johnson computation; the source’s unrestricted direct-computation assertion is not used as a proved theorem.

**Construction or proof:**

1. Use actual group-algebra ideal powers and the existing based mapping-class automorphism action.
2. Compute the degree-two conjugation cocycle and exhibit one point-push with nonzero class after the surface relation; prove this obstructs an equivariant splitting.
3. Record the missing computation as a source gap. Do not extend to (g,n)=(1,1), where abelianity permits an equivariant truncated logarithm splitting.

**Direct prerequisites:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/point-push`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- The filtration terms are I²/I³ and I/I², not the full untruncated augmentation ideal.
- Provide an explicit nonzero degree-two cocycle and a splitting obstruction, not only a dimension count.

**Source:** LL24, Example 10.1.6(2), p.51. Example 10.1.6(2) asserts by direct computation that 0→I²/I³→I/I³→I/I²→0 is non-split as PMod(g,n)-representations; for (g,n)=(1,1) it splits (source issue E11).

### C.9/morita-pointed — Morita pointed extension

**Theorem.** For g≥2, plan the non-torsion class in H¹(Mod(g,1),H₁Σ_g,Z) from Morita’s Proposition 6.4, its rational nonsplit extension, and a restriction computation identifying the point-pushing action with the surface abelianization unipotent example of rank 2g+1. A normalization factor in the restricted class must be specified and nonzero; the restriction is not assumed to be exactly the primitive integral class.

**Construction or proof:**

1. Import Morita’s integral class and calculate the point-pushing restriction with the source’s normalization.
2. Over Q rescale a nonzero restriction and identify the action with (v,t)↦(v+t a(γ),t). Use the explicit unipotent construction for the finite-orbit example independently of the global Morita extension.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.9/unipotent-example`; `MordellLawrenceVenkatesh:LV.5/point-push`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

**Checks:**

- Separate the integral global class from its rationally normalized restriction.
- The canonical surface-group example is unconditional on obtaining the integral global normalization.

**Source:** LL24, Example 10.1.6(3), p.51; [Mor89, Proposition 6.4]. Example 10.1.6(3) cites Morita 1989 Proposition 6.4 for a non-torsion class in H¹(Mod(g,1),H₁(Σ_g,Z)) and describes its point-pushing restriction.

### C.9/genus-one-rank-two — Genus-one rank-two examples

**Theorem.** For g=1,n>0, there are rank-two semisimple MCG-finite surface representations with infinite special-dihedral image, and rank-two nonsplit infinite-image MCG-finite examples. These are punctured-torus examples, not representations of the closed abelian torus group. Their finite-orbit and infinite-image certificates are source-gated by the BGMW and Cousin–Heu classifications.

**Atlas planet:** Genus-one rank-two examples.

**Construction or proof:**

1. Import the explicit special-dihedral normal forms and their orbit calculation, and the nonsplit classification with all puncture restrictions.
2. Check infinite image and semisimplicity separately for the dihedral example; compare its rank with the strict square-root bound.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`.

**Checks:**

- The CH19 Theorem B(2) representations ρ_{μ,c} have some cᵢ≠0 (since Σcᵢ=1), so ρ(γᵢ) is a nontrivial unipotent: the image is infinite and the representation is reducible and nonsplit.
- Rank two with g=1 gives r²=4≥g+1=2, outside the main theorem, so no contradiction arises.

**Source:** LL24, Remark 10.2.1, p.52; [BGMW17, Theorem B]; CH19, Theorem B, p.6. Remark 10.2.1 cites BGMW17 Theorem B for semisimple special dihedral MCG-finite representations of π₁(Σ(1,n)), n>0, with infinite image, and CH19 Theorem B for non-semisimple examples, giving sharpness at g=1. Theorem B classifies reducible rank-two representations with finite Γ(g,n)-orbit for g>0: direct sums of finite characters, or for g=1, n>0 twists of the explicit nonsplit ρ_{μ,c}.

### C.9/low-genus-rank-two — Genus-two and three rank-two finiteness

**Theorem.** For g=2 or 3 and every n≥0, every MCG-finite representation π₁Σ(g,n)→GL₂(C) has finite image, a range improvement over the general square-root theorem.

**Atlas planet:** Genus-two and three rank-two finiteness.

**Construction or proof:**

1. Import the nonsplit rank-two classification to handle reducible cases.
2. Use determinant finiteness. Choose a square root character; its possible choices form a finite set because the surface group is finitely generated. Thus twisting to determinant one preserves finite orbit after a finite-index stabilizer.
3. Apply the SL₂ finite-orbit classification. The primary BGMW theorem and nonsplit normal forms are explicit source gates.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/rank-one`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`.

**Checks:**

- For r=2 and g=2,3 one has r²≥g+1, so the statement goes beyond the main theorem.
- For g=1 the statement is false by C.9/genus-one-rank-two.

**Source:** LL24, Remark 10.2.2, p.52; [BGMW17, Theorem A]; CH19, Theorem B, p.6. Remark 10.2.2: for g=2,3 there are no rank-two MCG-finite representations with infinite image, by CH19 Theorem B in the non-semisimple case and BGMW17 Theorem A after twisting to determinant one. For g≥2 Theorem B leaves only direct sums of finite characters among reducible rank-two finite-orbit representations.

### C.9/large-semisimple — Large-rank semisimple examples

**Theorem.** Plan explicit infinite-image semisimple MCG-finite surface representations of rank bounded exponentially in g, by restricting a certified TQFT or Kodaira–Parshin mapping-class representation to the point-pushing subgroup. The supplier certificate must give the genus/puncture range, actual rank formula, semisimplicity of the restricted representation, and infinite point-pushing image, rather than mere nontriviality.

**Construction or proof:**

1. Obtain one complete explicit construction from the existing geometric-family or quantum-topology owner, with its exact range and rank.
2. Use point-pushing restriction for finite orbit. Verify that the restricted image is infinite and the restriction semisimple; neither follows merely from nontrivial total monodromy.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/point-push-restriction`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `StableReductionPartII:MC.2`; `HodgeStructuresPartII:H.2/geometric-pure`.

**Checks:**

- A source certificate with a concrete rank formula is required before claiming this example closed.
- Do not infer semisimplicity of an arbitrary subgroup restriction from semisimplicity of a total representation.

**Source:** LL24, Example 10.2.4, p.52; [KS16, Corollary 4.3], [BKMS18, Theorem 5.1], [LL19, Example 3.3.1]. Example 10.2.4 cites TQFT and Kodaira–Parshin constructions of semisimple MCG-finite representations of rank exponential in g with infinite image.

### C.9/free-examples — Small free-group examples

**Theorem.** For F₁, any non-torsion rank-one character has infinite image and an Out(F₁)-orbit of size two. For F₂, plan an infinite-image semisimple finite-Out-orbit example from a faithful linear representation of Aut(F₂) or a Kodaira–Parshin construction, with the infinite image after semisimplification explicitly verified. No existence theorem is asserted for every F_N with N≥3.

**Construction or proof:**

1. The F₁ computation uses Out(Z)={±1}.
2. For F₂ import a primary-source finite-dimensional linear construction or the geometric family and verify the normal-subgroup image survives semisimplification; use the automorphism-group version of the canonical projective extension/restriction argument.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.1/projective-extension`; `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `StableReductionPartII:MC.2`.

**Checks:**

- The F₂ source certificate must distinguish a faithful nonsplit representation from a semisimple infinite-image restriction.
- Keep Conjecture 10.2.8 for N≥3 open.

**Source:** LL24, Remark 10.2.7 and Conjecture 10.2.8, pp.52–53. Remark 10.2.7 gives semisimple Out(F₂)-finite examples from linearity of Aut(F₂) or the Kodaira–Parshin trick; Conjecture 10.2.8 conjectures semisimple infinite-image examples for all N.

### C.9/rigid-punctured-sphere — Rigid punctured-sphere examples

**Theorem.** Plan the application that a physically rigid irreducible local system on a punctured sphere, with its ordered local conjugacy classes fixed, is MCG-finite: pure mapping classes preserve local classes and physical rigidity leaves a single global conjugacy class. A concrete infinite-image rigid example and its physical-rigidity certificate remain assigned to the Hodge/rigid-local-system supplier.

**Construction or proof:**

1. Use the supplier’s physical-rigidity uniqueness statement. Do not identify it with adjoint middle-extension H¹ vanishing without the irreducibility and comparison theorem.

**Direct prerequisites:** `MappingClassGroupsAndCanonicalRepresentations:C.0/finite-orbit`; `HodgeStructuresPartII:H.5`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`.

**Checks:**

- For n=3, PMod(0,3) is trivial and every representation is MCG-finite; the statement has content for n≥4.
- Physical rigidity is the hypothesis; cohomological rigidity is related to it only through the H.5 supplier.

**Source:** LL24, Example 10.2.5, p.52; citation [Kat96]. Example 10.2.5 points to Katz’s rigid local systems in genus zero as a large class of MCG-finite representations.

## Supplier contracts

These are precise requests to existing stages, for what their accepted nodes do not yet state. Extensions beyond a stage’s current scope are proposed in the structure ledger; their anchors are not claims of existing coverage.

### R1. MordellLawrenceVenkatesh:LV.5

The existing LV.5 nodes are cited directly (surface, mapping-class-group, change-of-coordinates, dehn-twist, dehn-twist-homology, primitive-classes-simple, point-push, birman-exact-sequence, capping-surjective, fadell-neuwirth-sequence, surface-homology). Additionally needed from the same owner: the pure mapping class group PMod(g,n) of classes fixing each puncture, as the kernel of the permutation action on punctures, with the Birman sequence 1→π₁Σ(g,n)→PMod(g,n+1)→PMod(g,n)→1 for 2g−2+n>0; and a free basis of π₁Σ(g,2), of rank 2g+1, beside the existing once-punctured statement. The packet is pending transfer to topology owners: keep its node ids.

**Direct consumers:** `C.0/finite-orbit`, `C.0/moduli-monodromy`, `C.0/teichmuller-uniformization`, `C.6/free-finiteness`.

### R2. StableReductionPartII:MC.2

For every 2g−2+n>0 (not only g≥2 as in MC.2/higher-genus-pointed), the smooth Deligne–Mumford stack M(g,n) and the identification of its smooth punctured universal curve with M(g,n+1) through the forgetful morphism MC.2/forget restricted to smooth curves, compatible with base change along étale maps from schemes. The analytic orbifold presentation is C.0/teichmuller-uniformization, not part of this request.

**Direct consumers:** `C.0/versal-family`, `C.0/moduli-monodromy`, `C.6/isomonodromy`, `C.9/large-semisimple`, `C.9/free-examples`.

### R3. StableReductionPartII:MC.4

Supply connected smooth quasiprojective fine level scheme charts with universal pointed curves and finite étale maps onto smooth M(g,n), for all 2g−2+n>0. The current unpointed g≥2 full-level node is not enough for genus-one pointed families or all n. Add the pointed extension in this owner, retaining pairing-component and automorphism hypotheses.

**Direct consumers:** `C.0/versal-family`, `C.0/family-exact`, `C.1/projective-extension`, `C.2/linear-realization`, `C.4/boundary-quasiunipotence`, `C.7/arithmetic-comparison`.

### R4. DiamondsAndVStacks:D0

Leray is DiamondsAndVStacks:D0/cech-to-derived-comparison, cited directly. Additionally supply, compatibly with TauCeti.LocalCoefficientSystem, the equivalence between locally constant sheaves of finite free A-modules on a locally simply connected space and A-representations of its fundamental groupoid; for a fibre bundle with K(π,1) fibres, the identification of R¹π_*L with the local system of fibre group cohomology H¹(π₁(fibre),L); and the projection formula R¹π_*(L⊗π^*W)≅R¹π_*L⊗W.

**Direct consumers:** `C.2/artin-decomposition`, `C.3/cover-cohomology`.

### R5. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology

Use the existing relative singular/local-coefficient chain and cohomology comparison, covering transfer and filling-puncture exact sequence. This stage does not, by its current statement, supply ordinary analytic-sheaf Leray.

**Direct consumers:** `C.3/prym-action`, `C.3/boundary-reduction`, `C.9/unipotent-example`.

### R6. tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Supply oriented compact-surface Poincaré duality and naturality for orientation-preserving deck and mapping-class actions, including the relation between a σ component and its dual label.

**Direct consumers:** `C.3/prym-action`, `C.3/cover-cohomology`.

### R7. tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count

Use the existing finite-group Schur lemma and isotypic evaluation interfaces of this layer, with TauCeti.sum_characterDegree_sq_eq_card. Jordan’s theorem and two-generation of GL_r(F_p) are outside its scope; they are a recorded gap and are proposed for a Character theory, Part II in the structure ledger.

**Direct consumers:** `C.3/prym-action`, `C.3/cover-cohomology`, `C.3/pw-small-degree`, `C.6/extension-splitting`.

### R8. tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier

The current layer treats finite-group factor sets and Schur multipliers. Extend in Induction, restriction, and Mackey theory, Part II to projective representations of arbitrary discrete groups, finite central isogenies and the H² obstruction with fixed fibre lift. The surface/Aut(F_N) intertwiner extension here is a consumer specialization, not a substitute for that general carrier.

**Direct consumers:** `C.1/projective-extension`, `C.2/prescribed-lift`, `C.4/linear-integrality`.

### R9. tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

The current roadmap is continuous profinite cohomology. A Part II contract must supply arbitrary discrete-group low-degree cohomology, representation extensions, the LHS spectral sequence and its filtration/five-term sequence for 1→N→G→Q→1. The lift proof needs successive H¹(Q,H¹(N,μ)) and H²(Q,μ) killing, and an invariant fibre character with vanishing transgression extends to G. Pinned H1InfRes_exact supplies only exactness at its middle term.

**Direct consumers:** `C.2/kill-finite-class`, `C.2/prescribed-lift`, `C.9/morita-primitive`, `C.9/augmentation-extension`, `C.9/morita-pointed`.

### R10. DeformationAndDerivedPatchingAlgebra:R03.2

Extend the abstract deformation interface to finitely presented discrete groups over local Artinian C-algebras with residue C, actual and conjugacy deformation functors with constant determinant, tangent H¹(G,adρ), restriction to normal subgroups and LL24 Proposition 3.2.1. Use B_n=C[t]/(tⁿ⁺¹), R_n=B_(n−1)[ε]/ε², derivative embedding f↦f+εf′ and compatible conjugators. This is not supplied by an arithmetic G_{F,S} deformation functor. Put this shared algebra before Hodge and mapping-class consumers. The LL24 extraction routed Lemmas 3.1.1–3.1.2 and Proposition 3.2.1 (items 26–28) to GlobalGaloisDeformations R04.1–R04.2; this request places them in the abstract deformation layer instead, an owner choice for the orchestrator to confirm.

**Direct consumers:** `C.5/formal-constancy`, `C.8/conditional-nonflat`, `C.9/morita-primitive`, `C.9/augmentation-extension`.

### R11. DeformationAndDerivedPatchingAlgebra:R03.4

For a specified arithmetic profinite group and absolutely irreducible residual extension, provide representability with its coefficient category and the finite-extension-valued point theorem for a nonzero characteristic-zero generic fibre. Only with these hypotheses can geometric nonlifting imply nonflatness of an arithmetic deformation ring.

**Direct consumers:** `C.8/conditional-nonflat`.

### R12. HodgeStructuresPartII:H.1

The fixed-determinant representation scheme and its GIT quotient are HodgeStructuresPartII:H.1/betti-framed and H.1/betti-coarse, cited directly. Additionally supply the component-lifting statement: for a finitely presented group, fixed determinant and the connected group GL_r, each fibre of R_B→M_B is connected (every orbit closure contains the unique closed orbit), and the connected components of R_B are GL_r-invariant with closed, pairwise disjoint images; so two points of R_B whose images lie in one connected component of M_B lie in one connected component of R_B, which carries the universal representation over its ring of functions. Also state that the deformation of H.5/deformation-to-cvhs stays inside the fixed-determinant scheme.

**Direct consumers:** `C.5/semisimple-finite`.

### R13. HodgeStructuresPartII:H.5

The H.5 nodes are cited directly (versal-unitary-rigidity, strong-implies-cohomological, integrality-KP, rigidity-conjugate, coh-rigid-semisimple-cvhs, low-rank-pvhs-unitary, deformation-to-cvhs, unitary-embeddings-finite, integral-representation, boundary-monodromy-data, geometric-origin, integral-pvhs, geometric-origin-integral-pvhs, very-general-rank-bound). Additionally supply: (a) a local system of geometric origin on a variety over a finitely generated characteristic-zero field, spread out from a smooth proper family over a finite extension of that field, is arithmetic in the sense of InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation (used for residual geometric-origin realizations); (b) for physically rigid irreducible local systems on a punctured sphere with fixed local conjugacy classes, uniqueness up to global conjugacy, and one certified example of infinite image.

**Direct consumers:** `C.8/residual-lift`, `C.8/nonlifting`, `C.9/rigid-punctured-sphere`.

## Closure gaps

All of these block proof closure of their consumers. They do not leave an unvisited layer in this design pass.

### G1. Teichmüller theory

No roadmap plans Teichmüller space: its contractibility (Teichmüller’s theorem), the properly discontinuous PMod action with finite stabilizers, and the identification of M(g,n)^an with the orbifold quotient. The accepted extraction routes this item (PAPER-LANDESMAN-LITT-24/114) here, so C.0/teichmuller-uniformization owns the statement; its proof needs hyperbolic or quasiconformal Teichmüller theory, planned nowhere in the atlas. Intended source: Farb–Margalit, A Primer on Mapping Class Groups, Chapters 10–12, cited by LL24 at §10.6.3 and p.353; the authors’ PDF could not be fetched during the review, so these locators are unverified.

**Consumers:** `C.0/teichmuller-uniformization`, `C.0/moduli-monodromy`, `C.0/family-exact`.

### G2. Relative Ehresmann theorem and finite-index image

C.0/family-exact needs (a) the relative Ehresmann theorem: a proper submersion with disjoint sections is a locally trivial fibre bundle of pairs. ComplexComparisonPartII:C5/relative-betti-local-system requests the absolute theorem from a DifferentialGeometry Part II; the version with marked sections must be added to that request. (b) A dominant morphism of normal complex varieties has finite-index image on fundamental groups (LL24 Lemma 2.1.4, citing Debarre, Higher-dimensional algebraic geometry, Lemma 4.19, not read). Neither is planned.

**Consumers:** `C.0/family-exact`.

### G3. Pointed fine levels and the unpointed torus

MC.4 currently states unpointed g≥2 levels. Its pointed extension and genus-one comparison are necessary; the unpointed genus-one arithmetic and isomonodromy rank-one cases require a separate Jacobian/point-after-field-extension argument, not the hyperbolic Birman sequence.

**Consumers:** `C.0/versal-family`, `C.2/linear-realization`, `C.6/isomonodromy`, `C.7/arithmetic-finite`.

### G4. Local systems as sheaves and higher direct images

Leray is DiamondsAndVStacks:D0/cech-to-derived-comparison. The comparison of TauCeti.LocalCoefficientSystem with locally constant sheaves of finite free A-modules, R¹π_* of a K(π,1) fibre bundle as fibre group cohomology, and the projection formula are requested from D0 and not yet planned. A singular Serre spectral sequence is not substituted.

**Consumers:** `C.2/artin-decomposition`, `C.3/cover-cohomology`.

### G5. Discrete cohomology and fibre-prescribed lift

Profinite cohomology and finite-group Schur multipliers do not supply the arbitrary discrete-group LHS filtration and central-isogeny obstruction. Verify the successive killing, mismatch character and transgression arguments in the proposed Part II interfaces.

**Consumers:** `C.2/kill-finite-class`, `C.2/prescribed-lift`.

### G6. Shared abstract Artinian deformation layer

R03.2 must export LL24 §§3.1–3.2 for arbitrary discrete groups with normal subgroup, rather than merely the arithmetic deformation problem. The derivative trick and compatible formal conjugators are part of that supplier obligation. The extraction routed these items to GlobalGaloisDeformations R04.1–R04.2; whichever owner is confirmed, the statements are those of LL24 §§3.1–3.2.

**Consumers:** `C.5/formal-constancy`.

### G7. Nonabelian Hodge algebraic-family bridge

Read LL24 pp.27 and 43. The PVHS deformation (HodgeStructuresPartII:H.5/deformation-to-cvhs) and the family constancy lemma C.5/algebraic-constancy have different hypotheses: the latter needs one connected finite-type family of actual representations with fixed determinant. H.1/betti-framed supplies the fixed-determinant representation scheme; the component-lifting statement (request to H.1) and constancy of the determinant along the deformation must still be verified. Until then C.5/semisimple-finite, and through it C.6/main-finiteness, are conditional on this contract.

**Consumers:** `C.5/semisimple-finite`.

### G8. Node-smoothing monodromy as Dehn twists

AlgebraicModuliForArithmeticGeometry:R09.7a/stable-curve-boundary-interface computes boundary meridians of the resolved compactification as products of node-smoothing meridians and leaves to this roadmap the identification of each node-smoothing meridian with the Dehn twist about its vanishing cycle. That Picard–Lefschetz statement for nodal degenerations of pointed curves (cited by LL24 from LLSS Lemma 2.1.1, not read) is not yet planned.

**Consumers:** `C.4/boundary-quasiunipotence`.

### G9. Finite abelianization of mapping class groups

AS16 Lemma 2.5 uses that H¹(Mod(Z);R)=0 for a surface Z of genus at least 2 with boundary, citing a survey of Korkmaz. No roadmap, LV.5 included, plans the abelianization of mapping class groups.

**Consumers:** `C.4/multitwist-quasi-unipotence`.

### G10. Nielsen generation of Aut(F_N)

C.6/nielsen-generation needs Nielsen’s theorem (Nielsen 1924; Magnus–Karrass–Solitar Theorem 3.2, p.131, as cited in LL24 Remark 1.6.3). Neither source was read, and the theorem is planned nowhere else in the atlas.

**Consumers:** `C.6/nielsen-generation`.

### G11. Cousin–Heu algebraization theorem

C.6/isomonodromy uses CH19 Theorem A, read at its statement (p.4) only, as an external theorem: universal isomonodromic deformations, the logarithmic Riemann–Hilbert correspondence with mild transversal models and the algebraization argument are planned in no roadmap. HodgeStructuresPartII:H.5/low-rank-pvhs-unitary records the same isomonodromy carrier gap.

**Consumers:** `C.6/isomonodromy`.

### G12. Jordan bound and two-generator certificate

Read the Jordan applications in LL24 p.48 and LL22 p.54. The general Jordan theorem and the original Waterhouse two-generation result were not read; Character theory, Part II needs precise characteristic-zero bound and all p,r≥2 generator certificates. Do not identify a bound on index with an integer divisible by every index without taking a factorial.

**Consumers:** `C.8/jordan-word`, `C.8/residual-surjections`.

### G13. Conditional deformation-ring arithmetic extension

The geometric residual surjection is not a specified residual representation of a fixed arithmetic group. Supply that extension, continuity/representability hypotheses and the finite-coefficient-point theorem before deriving nonflatness. No complete-intersection claim is planned.

**Consumers:** `C.8/conditional-nonflat`.

### G14. Morita primitive class certificate

Original Morita 1993 nonvanishing, the symplectic inclusion normalization and genus range were not read. Require the cited primary nonzero cohomology class, not just LL24’s discussion.

**Consumers:** `C.9/morita-primitive`.

### G15. Augmentation nonsplitting computation

The displayed ideal-power sequence is well defined, but its nonsplitting needs an explicit degree-two point-push computation in the stated g≥2 range. The unrestricted source assertion has low-complexity counterexamples.

**Consumers:** `C.9/augmentation-extension`.

### G16. Morita integral normalization

Morita 1989 Proposition 6.4 was not read. Its restriction may be a nonprimitive multiple of the abelianization cocycle; verify the multiple and separate integral and rational extension claims.

**Consumers:** `C.9/morita-pointed`.

### G17. Rank-two classifications

BGMW Theorems A/B and the full Cousin–Heu nonsplit classification proofs were not read. Obtain exact normal forms, determinant-twist choices and puncture/genus restrictions for the positive and negative rank-two examples.

**Consumers:** `C.9/genus-one-rank-two`, `C.9/low-genus-rank-two`.

### G18. Large-rank and free-group source certificates

Choose and read an original TQFT or Kodaira–Parshin source with an explicit rank and genus range, and prove infinite image after restricting/semisimplifying. The F₂ linearity construction also requires this last verification. These examples are source-gated existence targets, with no claim about all free groups.

**Consumers:** `C.9/large-semisimple`, `C.9/free-examples`.

### G19. Rigid genus-zero example certificate

Physical rigidity gives a finite-orbit application, but a concrete infinite-image rigid local system and the physical/cohomological rigidity comparison must come from H.5 and a read original Katz/accessible primary source.

**Consumers:** `C.9/rigid-punctured-sphere`.

## Structure and ownership

- **rescope** (MappingClassGroupsAndCanonicalRepresentations, MordellLawrenceVenkatesh): The brief assigns generic mapping-class topology here although LV.5 already plans much of it. Import the existing LV.5 nodes and keep the surface-representation applications here. Preserve LV.5 node ids through its pending transfer to a topology owner. The review adds here the three routed items that nobody plans (Teichmüller uniformization, Nielsen generation, the Aramayona–Souto multitwist theorem); a later topology owner may take them over by import, without a duplicate.
- **rescope** (MappingClassGroupsAndCanonicalRepresentations, HodgeStructuresPartII, DeformationAndDerivedPatchingAlgebra): There is a two-way roadmap relationship but no intended target-level cycle. Order LV.5 and MC.2/4, then C.0–C.2; place general Art_C deformation algebra in an R03.2 extension; HodgeStructuresPartII:H.4/artinian-vanishing awaits C.2/artin-decomposition (its gap G2); C.3–C.8 import the H.4 and H.5 nodes. Hodge suppliers must not import the final canonical finiteness theorem.
- **extend** (tauceti:TauCetiRoadmap/ProfiniteCohomology, tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction): The lift requires arbitrary discrete groups; current cohomology is continuous profinite and projective representation theory is finite-group. Propose Profinite cohomology, Part II: discrete comparison and extension obstructions, and Induction/restriction, Part II: arbitrary-group projective extensions. Keep current Tau Ceti roadmaps unchanged; request anchors do not assert current coverage.
- **extend** (tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory, HodgeStructuresPartII): Jordan bounds and two-generation of GL_r(F_p) exceed the cited CharacterTheory layer; actual representation schemes are HodgeStructuresPartII:H.1/betti-framed, and only the component-lifting statement is requested there; the nonproper family comparison is InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness. Add a Character theory, Part II layer for uniform finite linear group bounds and two-generation certificates. No new competing carrier or roadmap id is introduced by this packet.

## Open questions

The following are a question inventory, not proved or conditionally assumed theorems. A future research result could change their status; this plan does not prove them.

- **O1** (Questions 10.1.1 and 10.1.3, pp.49–50): Determine rigidity of all irreducible representations of finite-index mapping-class subgroups in sufficiently large genus, and finiteness of the corresponding fixed character loci. No proof target is asserted.
- **O2** (Question 10.1.5, p.50): Determine whether all semisimple mapping-class local systems, and all semisimple canonical surface representations in sufficiently large genus, have geometric origin.
- **O3** (Questions 10.2.3 and 10.2.6, p.52): Determine the minimal infinite-image MCG-finite rank, separately without and with semisimplicity.
- **O4** (Conjecture 10.2.8, p.53): Existence of semisimple infinite-image finite-Out-orbit representations of F_N for every N>0 is a conjecture; the N≥3 cases are not claimed here.
- **O5** (Question 10.3.1, p.53): Classify finite-orbit surface and free-group representations, and compare the surface classification with algebraic isomonodromy under its stated hypotheses.

## Source corrections and proof qualifications

These reports paraphrase the sources and contain no excerpts. Each carries the independent review’s verdict. Several are corrected in the authors’ adopted erratum for the Annals version (P04, on Daniel Litt’s page), whose printed page numbers are cited; the AI-generated reviews on the same page are not used as corrections. Mistakes already recorded with the paper extraction (PAPER-LANDESMAN-LITT-24/E1–E22) or the HodgeStructuresPartII H.4 packet are cross-referenced rather than repeated.

### E1 — misprint

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.0.1, p.12.

Paraphrase: The second orbifold fundamental-group label repeats the n-punctured mapping-class group.

**Correction:** Use PMod(g,n+1) for the universal punctured curve.

**Reason:** The universal curve is M(g,n+1); its Birman kernel is the n-punctured surface group.

**Reach:** nothing. **Known correction:** new (not in the P04 author erratum; also recorded as PAPER-LANDESMAN-LITT-24/E5).

**Review:** confirmed. Checked at LL24 v4 p.12: the lemma states the second isomorphism with PMod(g,n) although the diagram places it above PMod(g,n+1); the fibre of M(g,n+1)→M(g,n) is the punctured surface and the Birman sequence forces PMod(g,n+1).

### E2 — error

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.2.2, pp.14–15.

Paraphrase: The projective extension is described as unique without restricting the kind of intertwiners.

**Correction:** Uniqueness holds for values represented by actual GL intertwiners.

**Reason:** For the irreducible Q₈ representation its projective image has a nontrivial projective centralizer. In Q₈×C₂ one can change the C₂-value of a PGL extension without changing the restriction to Q₈.

**Reach:** a stated result. **Known correction:** P04 author erratum, printed pp.838–839: “unique” is deleted from Lemma 2.2.2 and the uniqueness paragraph removed; also PAPER-LANDESMAN-LITT-24/E7.

**Review:** confirmed. Checked at LL24 v4 pp.14–15: uniqueness of ρ̃ is asserted from uniqueness of the intertwiner classes, which shows only that ρ̃(γ) is forced among values represented by actual intertwiners. The Q₈×C₂ example is valid: the projective image of the 2-dimensional Q₈ representation is the Klein four-group, its own centralizer in PGL₂(C), so the C₂ factor may be sent to any of its elements. The author erratum makes the same deletion.

### E3 — gap

**Locator:** LL24 arXiv:2205.15352v4, Proposition 2.3.4, pp.16–18.

Paraphrase: The LHS filtration passage treats the obstruction as an inflated class before completing all lower-filtration killing.

**Correction:** First kill H¹(Q,H¹(N,μ)); then choose and kill the resulting H²(Q,μ) class. Afterwards extend and remove the finite fibre-mismatch character, killing its transgression as needed.

**Reason:** A class restricting trivially to N is only in the first kernel filtration, not necessarily in the inflation image before the edge obstruction vanishes.

**Reach:** the proof. **Known correction:** partly: P04 author erratum, printed pp.840–843, replaces the end of the proof of Proposition 2.3.4 by a pointed version applying Lemma 2.3.3 successively; the order (H¹(Q,H¹(N,μ)) component first, then the newly inflated H²(Q,μ) class) is not spelled out there.

**Review:** confirmed. Checked at LL24 v4 pp.17–18: the proof kills every element of the two Hochschild–Serre graded pieces over M in one step and concludes that ker η vanishes. After killing the H¹,¹ image, a class becomes inflated from a new class of H²(Q′,μ) that need not come from M, so a second application of Lemma 2.3.3 is needed; the fix is as stated.

### E4 — gap

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.4.2, pp.19–20.

Paraphrase: The family decomposition is presented without repeating the positive-genus condition used by its realization input.

**Correction:** Impose g≥1 for this proof and its use of Corollary 2.3.5.

**Reason:** The preceding finite-determinant/linear-realization arguments use positive-genus rank-one finiteness; the statement must not silently use them for genus zero.

**Reach:** a stated result. **Known correction:** P04 author erratum, printed pp.844–845 (adds g≥1); also PAPER-LANDESMAN-LITT-24/E10 and HodgeStructuresPartII/E-H4-4.

**Review:** confirmed. Checked at LL24 v4 pp.19–20: the proof applies Corollary 2.3.5, stated for g≥1, and the lemma carries no genus hypothesis; the author erratum adds it. Theorem 6.2.1 has a nonzero local system of rank below g, so its uses are unaffected.

### E5 — misprint

**Locator:** LL24 arXiv:2205.15352v4, Lemma 7.2.5, p.36.

Paraphrase: The boundary-replaced covering surface is labelled with the base genus.

**Correction:** Its genus is g′ throughout the deformation-retraction comparison.

**Reason:** Removing discs and replacing them by punctures does not change the covering genus.

**Reach:** nothing. **Known correction:** new (not in the P04 author erratum; also recorded as PAPER-LANDESMAN-LITT-24/E14).

**Review:** confirmed. Checked at LL24 v4 p.36: the statement and the first proof sentences use Σ(g,0,b′+p′), while the final sentence and the deformation retraction concern the covering surface of genus g′.

### E6 — gap

**Locator:** LL24 arXiv:2205.15352v4, Theorem 8.5.3, p.43 with Theorem 4.3.1, p.27.

Paraphrase: A nonabelian Hodge deformation is used with the constancy result for connected algebraic families of actual representations.

**Correction:** Supply the actual connected algebraic fixed-determinant family, or a separate argument giving the same conjugacy conclusion.

**Reason:** Continuity of a deformation in a Betti/Hodge moduli space alone does not produce the representation over Γ(X,O_X) required in Lemma 8.5.2.

**Reach:** the proof. **Known correction:** new as a correction: not in the P04 author erratum; the AI-generated review reproduced on the author page raises the same point, which is not an author correction.

**Review:** confirmed. Checked at LL24 v4 pp.27 and 43: Theorem 8.5.3 applies Lemma 8.5.2, which needs a representation over the functions of a connected finite-type C-scheme with constant determinant, to the deformation of Theorem 4.3.1 without exhibiting such a family. The step is routine once the fixed-determinant representation scheme and its connected components are available (HodgeStructuresPartII:H.1/betti-framed), which is the recorded bridge.

### E7 — gap

**Locator:** LL24 arXiv:2205.15352v4, Lemma 8.6.1, p.44.

Paraphrase: The chosen finite-index subgroup stabilizes the Hom constituents but not explicitly the original extension class.

**Correction:** Intersect with a finite-index stabilizer of the actual class of ρ and the covering data.

**Reason:** Only this uses the MCG-finite hypothesis to make the extension image a stable cohomological subspace. Without it, nonsplit unipotent extensions of trivial representations give counterexamples.

**Reach:** the proof. **Known correction:** new as a correction: not in the P04 author erratum; also recorded as PAPER-LANDESMAN-LITT-24/E17, and raised by the AI review on the author page.

**Review:** confirmed. Checked at LL24 v4 p.44: Γ is chosen to stabilize only the classes of the σᵢ, so the image Qᵢ of H₁ of the cover need not be Γ-stable; the rank-two unipotent representation of the C.0 test, with trivial σ, is a counterexample to the printed step. Stabilizing the class of ρ (hence ρ₁, ρ₂ and the cover) and passing to a finite-index subgroup acting on H by inner automorphisms repairs it.

### E8 — gap

**Locator:** LL24 arXiv:2205.15352v4, Corollary 9.1.4 and proof, pp.45–46.

Paraphrase: Geometric-origin complex subquotients are treated as integral polarizable variations without fixing the lattice/summand convention.

**Correction:** Read “underlies an integral PVHS” as: comes from an O_K-local system, for a number field K, all of whose complex conjugates underlie polarizable complex variations of Hodge structure (LL22 Theorem 1.2.5); this is HodgeStructuresPartII:H.5/integral-pvhs.

**Reason:** A non-real rank-one character of a finite cyclic group has finite image but has no invariant rank-one Z-lattice; an ambient integral regular representation does contain it.

**Reach:** nothing. **Known correction:** new; the related misattribution of LL22 Corollary 1.2.7 for Theorem 1.2.5 is PAPER-LANDESMAN-LITT-24/E19.

**Review:** confirmed. Checked at LL24 v4 p.46 and LL22 v2 p.3: Corollary 9.1.4(4) does not say what an integral PVHS is. Read as a local system carrying an invariant Z-lattice, the implication (1)⇒(4) fails for a non-real finite-order character; read in the O_K sense of LL22 Theorem 1.2.5 (HodgeStructuresPartII:H.5/integral-pvhs) every implication holds. The packet now uses the O_K reading, so no supplier gap remains.

### E9 — error

**Locator:** LL24 arXiv:2205.15352v4, Example 9.2.3, pp.48–49.

Paraphrase: The examples for every prime are immediately described as having no arithmetic lifts.

**Correction:** Surjections exist for every prime, but the nonlifting conclusion here is only for p∤m(r), hence in particular for sufficiently large p.

**Reason:** The preceding proof uses noncommuting m-th powers of opposite unipotents, which fails when p divides m.

**Reach:** a stated result. **Known correction:** P04 author erratum, printed p.878 (non-liftability restricted to p≫_r 0); also PAPER-LANDESMAN-LITT-24/E20.

**Review:** confirmed. Checked at LL24 v4 pp.48–49: the example claims non-liftability for every p, while Corollary 9.2.2 proves it only for p not dividing n(r); the author erratum restricts the sentence.

### E10 — error

**Locator:** LL24 arXiv:2205.15352v4, Remarks 9.2.5–9.2.6, p.49.

Paraphrase: Nonflatness is used to conclude failure of the complete-intersection property.

**Correction:** Keep only the conditional nonflat/nonsmooth consequence after the arithmetic deformation problem is specified.

**Reason:** Z_p[[x]]/(p) is a nonflat complete intersection, so nonflatness alone cannot imply the stated conclusion.

**Reach:** a stated result. **Known correction:** P04 author erratum, printed pp.878–879: Remark 9.2.5 is deleted and the final sentence of Remark 9.2.6 removed.

**Review:** confirmed. Checked at LL24 v4 p.49: failure of flatness over Z_p is used to deny the complete-intersection property; Z_p[[x]]/(p) is a non-flat complete intersection. The author erratum deletes the remark for the same reason.

### E11 — error

**Locator:** LL24 arXiv:2205.15352v4, Example 10.1.6(2), p.51.

Paraphrase: The augmentation sequence is declared nonsplit for punctured surfaces without a range restriction or computation.

**Correction:** Require and prove the nonsplitting in a suitable hyperbolic positive-genus range; the present target uses g≥2 and retains a source gap.

**Reason:** For (g,n)=(1,1), π₁ of the filled surface is Z². The truncated logarithm gives an Aut(Z²)-equivariant splitting modulo I³ in characteristic zero.

**Reach:** a stated result. **Known correction:** new (not in the P04 author erratum or the extraction errata).

**Review:** confirmed. Checked at LL24 v4 p.51: the example is stated for every n>0. For (g,n)=(1,1) the acting group is π₁ of the closed torus, Z², whose completed group algebra over Q is a power-series ring in log x and log y; g↦log g mod I³ is an Aut(Z²)-equivariant splitting of I/I³→I/I².

### E12 — gap

**Locator:** LL24 arXiv:2205.15352v4, Lemma 2.3.3 and proof of Proposition 2.3.4, pp.16–18.

The dominant étale maps that kill obstruction classes come from étale neighbourhoods of the generic point, and the proof then chooses a point over the original base point.

**Correction:** Use pointed dominant étale maps (M′,m′)→(M,m), obtained from a pointed étale neighbourhood of m on which the class vanishes and a pointed Artin K(π,1) refinement, so that the chosen fibre and its representation are preserved.

**Reason:** A neighbourhood of the generic point need not contain the fixed base point m, so the fibre over m and the prescribed fibral representation need not be available after base change.

**Reach:** the proof. **Known correction:** P04 author erratum, printed pp.840–843, which replaces Lemma 2.3.3 by the pointed version.

**Review:** confirmed. Found by this review at LL24 v4 p.16 (the vanishing is arranged at the generic point) and checked against the P04 author erratum, which states the same failure and the pointed replacement adopted in C.2/kill-finite-class.

### E13 — misprint

**Locator:** LL24 arXiv:2205.15352v4, Proposition 8.2.1, p.39, and proof of Lemma 8.3.3, p.40.

Proposition 8.2.1 concludes that V is cohomologically rigid, and Lemma 8.3.3 invokes that conclusion before checking quasi-unipotent local monodromy.

**Correction:** Proposition 8.2.1 gives strong cohomological rigidity H¹(C°,ad V)=0 only; cohomological rigidity follows by Lemma 8.1.3 after quasi-unipotent boundary monodromy is established in Lemma 8.3.3.

**Reason:** Definition 8.1.1 defines cohomological rigidity only for representations whose monodromy at infinity is quasi-unipotent, so the term is not yet defined at the point of Proposition 8.2.1.

**Reach:** nothing. **Known correction:** P04 author erratum, printed pp.867–868.

**Review:** confirmed. Found by this review at LL24 v4 pp.38–40 and checked against the P04 author erratum, which makes this correction; C.4/projective-integrality follows the corrected order.

### E14 — error

**Locator:** AS16 author survey PDF, proof of Lemma 2.5, p.11.

Inducing ρ from the finite-index subgroup Γ to Map(X), the proof asserts that the restriction of the induced representation to Γ is the sum of d copies of ρ.

**Correction:** The restriction of the induced representation to Γ contains ρ as a direct summand (the identity double coset in Mackey’s formula); this is all the argument needs, since the eigenvalues of ρ(δ^m) are among those of the induced representation.

**Reason:** For Γ=A₃ in G=S₃ and ρ a nontrivial character ω of A₃, the induced representation is the two-dimensional irreducible of S₃, whose restriction to A₃ is ω⊕ω², not ω⊕ω.

**Reach:** nothing. **Known correction:** new.

**Review:** confirmed. Found by this review at AS16 p.11; the counterexample and the corrected step are elementary.

## Sources read

Page numbers refer to the numbered pages of the specified public PDFs, except where an author erratum cites printed Annals pages. Original results named only through a citation remain source gates in the ledger; no unread theorem is passed off as directly verified.

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

**Read:** Proposition 2.4, Lemma 2.5 and proofs, pp.10–11; Corollary 2.6, p.11.

**SHA-256:** `85e9989eaa81b97402a7016aff4c7488d911a044d85695b04b2b327b0e640409`. Accessed 2026-10-18.

### LL-P04

[Author-adopted erratum P04 for “Canonical representations of surface groups”](https://www.daniellitt.com/published-paper-reviews.html) — Aaron Landesman; Daniel Litt (posted by Daniel Litt). Erratum section P04 on the author page, referring to the printed pages of Annals of Mathematics 199 (2024); the AI-generated reviews on the same page are not authority.

**Read:** P04 erratum, all thirteen entries (printed pp.831–879).

**SHA-256:** `c382f55815ca3e6f01a3b1abf60d8d06161f8734876e9aaf887c5dc4143a6032`. Accessed 2026-10-19.

## Suggested Lean coverage

`HasFiniteConjugacyOrbitUnder` has a real body on existing automorphism groups and homomorphisms: a finite set of representative homomorphisms meets every automorphic pullback up to actual conjugation. This is the core used by C.0. It is not a replacement surface or mapping-class definition. The file states compatibility with actual conjugation, restriction of the acting group, finite acting groups and inner precomposition; its examples test trivial and inner actions and show that a finite orbit for a trivial action need not force finite image.

`freeGroup_finite_image` is C.6/free-finiteness with the existing FreeGroup and matrix-unit GL carriers, using Aut in place of Out because inner automorphisms already act by representation conjugacy. The file also states the F₀/rank-zero check. The body of the finite-orbit definition is provided; theorem proofs are placeholders. Elaboration at the pins succeeded with only the intended proof-placeholder warnings, rechecked by the independent review. This validates signatures, not theorem proofs.

The other seven definitions and constructions, their APIs and all twenty-four roadmap unit tests remain fully specified above; the API item mcgFinite_iff_hasFiniteConjugacyOrbitUnder records how the file’s predicate specializes to MCG-finiteness. Their missing surface, moduli, sheaf, Artinian-family and Hodge carriers are not encoded as assumed Prop fields. This follows the 12 October streamlined shape in WORKERS.md, which supersedes the older request for an exhaustive prototype.

## Extraction routing ledger

The 139 extraction ids are accounted for below so that the original 67-item new-roadmap route can be checked together with its supplier inputs. An import names the accepted node or the stage that owns the item; a gap row names the recorded gap. Item 83 is replaced by its justified conditional nonflat statement. Item 117 is unnecessary in the revised finite-image proof. Open questions are listed separately above.

| Extraction item | Disposition | Target or owner |
|---|---|---|
| 1 | target | `C.0/finite-orbit` |
| 2 | target | `C.6/main-finiteness` |
| 3 | target | `C.6/isomonodromy` |
| 4 | target | `C.6/fibral-finiteness` |
| 5 | target | `C.3/pw-small-order` |
| 6 | target | `C.3/small-isotypic-orbits` |
| 7 | target | `C.6/free-finiteness` |
| 8 | import | `HodgeStructuresPartII:H.4/sublocal-system-rank` |
| 9 | target | `C.0/versal-family` |
| 10 | import | `HodgeStructuresPartII:H.5/trace-free-adjoint` |
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
| 37 | import | `HodgeStructuresPartII:H.5/deformation-to-cvhs` |
| 38 | import | `HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs` |
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
| 50 | import | `HodgeStructuresPartII:H.4/artinian-vanishing` |
| 51 | target | `C.3/prym-action` |
| 52 | target | `C.3/pw-property` |
| 53 | target | `C.3/prym-rank` |
| 54 | target | `C.3/pw-small-degree` |
| 55 | target | `C.3/pw-small-order` |
| 56 | target | `C.3/boundary-reduction` |
| 57 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families` |
| 58 | import | `HodgeStructuresPartII:H.5/cohomological-rigidity` |
| 59 | import | `HodgeStructuresPartII:H.5/strong-implies-cohomological` |
| 60 | import | `HodgeStructuresPartII:H.5/versal-unitary-rigidity` |
| 61 | import | `HodgeStructuresPartII:H.5/integral-representation` |
| 62 | target | `C.4/multitwist-quasi-unipotence` |
| 63 | import | `HodgeStructuresPartII:H.5/integrality-KP` |
| 64 | target | `C.4/projective-integrality` |
| 65 | target | `C.4/linear-integrality` |
| 66 | target | `C.4/unitary-finite` |
| 67 | target | `C.5/formal-constancy` |
| 68 | target | `C.5/algebraic-constancy` |
| 69 | target | `C.5/semisimple-finite` |
| 70 | target | `C.6/extension-splitting` |
| 71 | import | `HodgeStructuresPartII:H.1/betti-coarse` |
| 72 | import | `HodgeStructuresPartII:H.5/low-rank-pvhs-unitary` |
| 73 | import | `HodgeStructuresPartII:H.5/unitary-embeddings-finite` |
| 74 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation` |
| 75 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness` |
| 76 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness` |
| 77 | target | `C.7/arithmetic-finite` |
| 78 | target | `C.7/hodge-characterisation` |
| 79 | import | `HodgeStructuresPartII:H.5/geometric-origin` |
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
| 96 | target | `C.6/nielsen-generation` |
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
| 113 | import | `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence` |
| 114 | target | `C.0/teichmuller-uniformization` |
| 115 | import | `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences` |
| 116 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.3/artin-good-neighborhoods` |
| 117 | not-needed | `C.2/normal-restriction` |
| 118 | import | `HodgeStructuresPartII:H.2` |
| 119 | import | `HodgeStructuresPartII:H.2` |
| 120 | import | `HodgeStructuresPartII:H.2` |
| 121 | import | `HodgeStructuresPartII:H.4` |
| 122 | import | `HodgeStructuresPartII:H.4` |
| 123 | import | `HodgeStructuresPartII:H.3` |
| 124 | import | `DiamondsAndVStacks:D0` |
| 125 | import | `InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families` |
| 126 | target | `C.6/socle-transport` |
| 127 | import | `HodgeStructuresPartII:H.5/boundary-monodromy-data` |
| 128 | import | `MordellLawrenceVenkatesh:LV.5/dehn-twist` |
| 129 | import | `MordellLawrenceVenkatesh:LV.5/capping-surjective` |
| 130 | target | `C.8/jordan-word` |
| 131 | target | `C.8/nondensity` |
| 132 | target | `C.8/nondensity` |
| 133 | import | `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-2-wedderburn-irreducible-indexing-and-the-count` |
| 134 | target | `C.9/large-semisimple` |
| 135 | gap | `Relative Ehresmann theorem and finite-index image` |
| 136 | import | `HodgeStructuresPartII:H.2` |
| 137 | import | `HodgeStructuresPartII:H.5/very-general-rank-bound` |
| 138 | import | `HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs` |
| 139 | target | `C.8/residual-lift` |

The packet is the machine-readable companion to this document; both carry the same targets, API statements, tests, prerequisites, gaps and corrections. The handoff records validation and the work needed for proof closure.
