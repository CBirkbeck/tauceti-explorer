# Roadmap: fixed fibres of reduced Schur covers and reduced multipliers of marked groups (induction, restriction, and Mackey theory for finite groups, part II)

**Summary.** The nonabelian Cohen–Lenstra moments of Wood, the lifting invariant of
Ellenberg–Venkatesh–Westerland in Wood's algebraic form, and the predicted distribution of
Liu–Wood–Zureick-Brown all count points of a finite set with a power action: the elements of a
universal marked central extension U(G, c), or of the fibre product P = S_c ×_{Gᵃᵇ} ℤ^D of a
reduced Schur cover with the lattice of class degrees, fixed by a power q acting through corrected
powers. The roadmap continues InverseGaloisAndArithmeticFundamentalGroups, whose Layer IG.3 builds
those objects — commuting-pair classes ⟨x, y⟩ in the integral Schur multiplier M(G) = H₂(G, ℤ),
the reduced multiplier M(G, c) = M(G)/Q_c, reduced covers and their markings, U(G, c) with its
kernel, the action of units and the cyclotomic twist. This roadmap is stated on those carriers and
supplies what the counting needs on top of them. Layer RS.0 states the integral homology that
IG.3 uses without stating: the class map of a central extension on cycle representatives and its
naturality, the five-term exact sequence of an arbitrary group extension, finiteness and
order-annihilation of the homology of a finite group in every positive degree, and the Hall part of
the homology of a group with a normal Hall subgroup. Layer RS.1 proves that commuting-pair classes are bilinear on
centralisers, normalises lifts locally in a reduced cover, and identifies the image of the
homology of a reduced cover in M(G). Layer RS.3 shows that units act on the kernel K(G, c) by
automorphisms through a finite level and builds the counting slices, the power-fixed degree
lattices and the orbit set of class degrees. Layer RS.4 counts the fixed points of an odd power q
in every fibre in terms of a square-class obstruction and a two-adic threshold, and turns the
dependence on parities into linear algebra over F₂ (affine kernel cosets, rank formulas, weight
enumerators). Layer RS.6 certifies finite examples: an index-two reduction, finite reduction
certificates with their parity algorithm, a closed formula M(F(G), c(G)) ≅ Λ²G for the
anti-diagonal models of odd abelian groups, and the reduced multipliers of the thirty-one marked
groups of Wood's Table 2, nineteen of which follow from that formula.

The end results are the fixed-fibre count and its two-adic survival criterion (`all_fixed_fibers`,
`two_adic_survival`, `surviving_parities`, `rank_parity_count`, Layer RS.4), the anti-diagonal
formula and the table of reduced multipliers (`antidiagonal_reduced_multiplier`, `table_row_k`,
Layer RS.6), and, as tools, the five-term sequence and the Hall decomposition of integral homology
(`extensionClassMap_exact`, `integralHomology_hallPart`, Layer RS.0). No moment, limit or asymptotic
is asserted here; those are the arithmetic consumers' statements.

| Layer | Title | Headline targets |
| --- | --- | --- |
| RS.0 | Integral homology of groups and central extensions | `integralEvaluation_mk`, `extensionClassMap_natural`, `extensionClassMap_exact`, `integralHomology_card_smul`, `integralHomology_hallPart` |
| RS.1 | Commuting-pair classes and reduced Schur covers | `homologicalCommutator_mul_left`, `commutator_order`, `localClassNormalization`, `local_factors_commute`, `homology_image` |
| RS.3 | The unit action on the kernel and degree orbits | `kernel_action_aut`, `finite_level_action`, `boundedDegreeSlice`, `powerFixedDegree`, `DegreeOrbitSet` |
| RS.4 | Fixed fibres, square obstructions and parity | `squareObstruction`, `all_fixed_fibers`, `torsionImageFiltration`, `two_adic_survival`, `jointParityMap`, `parityWeightEnumerator` |
| RS.6 | Certified finite examples | `odd_index_two_reduction`, `ReductionCertificate`, `order96Type`, `antidiagonal_reduced_multiplier`, `table_row_k` |

The layer labels RS.0, RS.1, RS.3, RS.4 and RS.6 are the ones other roadmaps cite
(ArithmeticStatistics cites RS.4 and RS.6 by label and by subsection).

Suggested home: `TauCeti/GroupTheory/ReducedSchur/`, next to InverseGalois's `ReducedSchur`
namespace, one file per layer; the integral homology of Layer RS.0 belongs next to Tau Ceti's group
homology, in `TauCeti/RepresentationTheory/Homological/GroupHomology/`. `Suggested.lean` states
the light definitions and the statements that can be made at the pins in the namespace
`TauCetiRoadmap.InductionRestrictionPartII`.

## Scope and ownership

**Owned here.**

- Layer RS.0: the class map of a central extension computed on cycle representatives from the
  factor set of any normalized section, and its naturality in the group and in the coefficients;
  the free and divisible cases of the universal coefficient theorem and |H²(G, ℂˣ)| = |M(G)| for
  finite G;
  the five-term exact sequence of a central extension, and of an arbitrary extension through its
  central quotient; finiteness and order-annihilation of the integral homology of a finite group
  in every positive degree; the Hall part of the integral homology of a finite group with a normal
  Hall subgroup, in every positive degree.
- Layer RS.1: bilinearity of commuting-pair classes on centralisers and the power law
  ⟨xⁿ, y⟩ = n⟨x, y⟩; the local class normalisation of lifts in a reduced cover and the commutation
  of normalised factors; the image of the homology of a reduced cover in M(G).
- Layer RS.3: the unit action on the kernel K(G, c) by automorphisms, the finite level that
  determines the action, the bounded total-degree slices, the power-fixed degree lattices and the
  orbit set of class degrees.
- Layer RS.4: lift squares, the square-class obstruction of a fibre, the fixed-fibre equation and
  count, the torsion-image filtration and the two-adic threshold, and the F₂-linear algebra of
  surviving parities (joint parity maps, affine kernel cosets, rank counts, weight enumerators).
- Layer RS.6: the odd-index-two reduction, lift-commutator homomorphisms on centralisers, finite
  reduction certificates and their parity algorithm, the order-96 type, the anti-diagonal,
  sum-kernel, graph and full wreath models, and the reduced multipliers of Wood's Table 2.

**Imported from InverseGaloisAndArithmeticFundamentalGroups (TauCetiRoadmap pull request #850),
Layer IG.3.** These are stated there, with their API and Checks, and are used here as they stand;
the names are InverseGalois's.

- IG.3.4 *Commutators of lifts and the class map of a central extension*: the commutator of lifts
  κ_E(x, y) (`ReducedSchur.liftCommutator`, with independence of the lifts, the swap law and
  naturality), the oriented commuting-pair cycle and class ⟨x, y⟩ (`ReducedSchur.commutingCycle`,
  `ReducedSchur.homologicalCommutator`, with the swap law and naturality), the class map
  τ_E : M(G) → A of a central extension with τ_E⟨x, y⟩ = κ_E(x, y)
  (`homological_commutator_central_extension`), and the universal coefficient theorem for trivial
  coefficients: H²(G, A) → Hom(M(G), A), [E] ↦ τ_E, is onto with kernel Ext(Gᵃᵇ, A). Its free and
  divisible cases and the order of H²(G, ℂˣ), which InverseGalois uses without stating, are RS.0.2.
- IG.3.4 *The reduced Schur multiplier*: Q_c and M(G, c) = M(G)/Q_c (`ReducedSchur.schurRelations`,
  `ReducedSchur.reducedMultiplier`, with monotonicity, functoriality and `schurRelations_empty`).
- IG.3.4 *Reduced Schur covers*: Schur covers π : S → G of a finite group with their class
  isomorphism τ_S : M(G) ≅ ker π (the representation groups of RepresentationTheory/InductionRestriction
  Layer 7, together with the comparison that a stem central extension with |ker π| = |M(G)| is one),
  the reduced cover S_c = S/τ_S(Q_c) with π_c and τ_c : M(G, c) ≅ ker π_c
  (`ReducedSchur.ReducedCover`, `reduced_cover_projection`, `reduced_cover_kernel`,
  `reduced_cover_commute`, `reduced_cover_stem`), and the vanishing of the composite
  H₂(S_c, ℤ) → M(G) → M(G, c).
- IG.3.4 *Conjugacy classes lift bijectively*: lifts of x ∈ c and of y ∈ C_G(x) commute in S_c,
  classes of S_c over c ∪ {1} map bijectively onto their image classes, and the class-compatible
  marking x ↦ x̂ (`ReducedSchur.classCompatibleMarking` with `_over`, `_conj`, `_rep`, `_change`,
  `_ext`).
- IG.3.4 *Marked central extensions*, *The universal marked extension*, *The class degree map*, *The
  marked fibre product and the computation of `U(G, c)`*, *The kernel of the universal marked
  extension*: `ReducedSchur.MarkedExtension`, U(G, c) = `ReducedSchur.universalMarked` with its
  projection, `ReducedSchur.universal_central` and `ReducedSchur.universal_marked_property`; the
  class set D = c/G and the lattice L = ℤ^D with δ : L → Gᵃᵇ (`ReducedSchur.classSet`,
  `ReducedSchur.classDegree`) and the degree of a marked word (`ReducedSchur.degree`); the marked
  fibre product P = S_c ×_{Gᵃᵇ} L, the marking correction and the marked isomorphism U(G, c) ≅ P
  (`ReducedSchur.markedFiberProduct`, `ReducedSchur.markingCorrection`,
  `ReducedSchur.universalEquivFiberProduct`); the kernel K(G, c) = ker π_U with degree image ker δ
  and the exact sequence 0 → M(G, c) → K(G, c) → ker δ → 0 (`ReducedSchur.universalKernel`).
- IG.3.4 *Coprime semidirect products and admissible inertia*: for G = H ⋊ Γ with coprime orders,
  M(G) → M(Γ) is onto, M(G) is finite of exponent dividing |G| and splits as M_H × M_Γ, the kernel
  of M(G) → M(Γ) is M_H, compatible Schur covers, the equal-order inertia classes of an admissible
  H with the abelianization comparison, and M(G, c) → M(Γ, d) onto with kernel prime to |Γ|
  (`ReducedSchur.compatibleCovers`, `ReducedSchur.multiplier_kernel_primary`,
  `ReducedSchur.admissibleInertiaClasses`, `ReducedSchur.admissible_abelianization`,
  `ReducedSchur.reduced_kernel_primary`). With Γ = 1 this gives finiteness of M(G) and exponent
  dividing |G| for every finite G.
- IG.3.5 *Powers by units and the permutation of class degrees*, *Central power corrections*, *The
  discrete action of units*, *The cyclotomic twist of a set*: the power map g ↦ g^α of a unit α of
  the prime-to-p profinite integers on a finite group (`ReducedSchur.unitPow`), the permutation of
  D and of the coordinates of L (`ReducedSchur.degreePermutation`), the corrections
  z_d(α) and W_α with their composition law (`ReducedSchur.powerCorrection`,
  `ReducedSchur.correction_cocycle`), the action α ∗ (h, m) = (h^α · W_α(m), m^α) on P and on
  U(G, c) (`ReducedSchur.unitAction`, with its projection and degree laws, independence of the
  model, and compatibility with admissible semidirect products), and the twist
  X⟨−1⟩ = Map_B(T, X) (`ReducedSchur.cyclotomicTwist`).

**Left to other roadmaps and to the libraries.**

- RepresentationTheory/InductionRestriction (TauCetiRoadmap), Layer 7: projective representations,
  factor sets, H²(G, kˣ) and the representation group of a finite group. It enters only through
  InverseGalois's *Reduced Schur covers*. Induction, restriction and Mackey theory themselves are not
  used.
- InverseGalois IG.4 *Coprime profinite complements*: existence of complements to a normal Hall
  subgroup and their conjugacy when the subgroup or the quotient is solvable, in particular when
  the quotient is cyclic. Mathlib's `Subgroup.exists_right_complement'_of_coprime` gives existence
  for finite groups.
- InverseGalois IG.3.6 uses, inline in its arithmetic lifting invariant, the normalisation z(f) of a
  lift over a fixed element c₀; RS.1.2 gives it a name and its API.
- Tau Ceti (pinned): extensions with abelian kernel and their factor-set classes
  (`TauCeti.GroupExtension.factorSet`, `TauCeti.FactorSet.cohomologyClass`, the classification and
  the splitting criterion), and the maximal elementary-2 quotient `TauCeti.ElementaryTwoQuotient`.
- Tau Ceti (current library, newer than the pin): the homological transfer with
  `cor ∘ tr = [G : S]` in every degree, and the Kronecker evaluation of the homology of a chain
  complex against the cohomology of its dual. They are cited in Layer RS.0 and reused as they
  stand.
- AlgebraicTopology (TauCetiRoadmap) plans the universal coefficient theorem for singular
  cohomology of spaces. It is not used: everything here is the algebraic bar complex of a group.
- ArithmeticStatistics, ST.3, identifies the marked groups of Layer RS.6 with the embedded
  arithmetic types of the source tables and enumerates those types; its ST.5 turns the fixed-fibre
  and parity counts of Layer RS.4 into moments and limits. No arithmetic statement enters this
  roadmap as a hypothesis, and nothing here asserts a moment, a limit or an asymptotic.

## Conventions

- A *central extension* is Mathlib's `GroupExtension A E G` (fields `inl`, `rightHom`, exactness
  `range_inl_eq_ker_rightHom`) together with the hypothesis `S.inl.range ≤ Subgroup.center E`
  (`IsCentralExtension S` in the Lean file). It is *stem* if moreover `S.inl.range ≤ commutator E`
  (`IsStemExtension S`). Finiteness is assumed exactly where stated.
- M(G) = H₂(G, ℤ) is the carrier `groupHomology.H2 (Rep.trivial ℤ G ℤ)`, written additively, and
  Hₙ(G, ℤ) is `groupHomology (Rep.trivial ℤ G ℤ) n`. A group homomorphism f induces f_* on both, with
  the identity on the trivial integral coefficients (`homologyMap f n` and `multiplierMap f` in the
  Lean file). `TauCeti.schurMultiplier k G` is the different group H²(G, kˣ).
- Commutators are `XYX⁻¹Y⁻¹` (Mathlib's `⁅X, Y⁆`). The oriented commuting-pair class ⟨x, y⟩ of
  commuting x, y is InverseGalois's: the class of the integral 2-cycle [x|y] − [y|x]. Mathlib's
  differentials with trivial coefficients are `d[g|h] = [h] − [gh] + [g]` and
  `d[g|h|k] = [h|k] − [gh|k] + [g|hk] − [g|h]`.
- The factor set of a normalized section σ of an extension satisfies
  `inl(φ(g, h)) = σ(g)σ(h)σ(gh)⁻¹` (Tau Ceti's convention). With this convention the class map
  sends ⟨x, y⟩ to the commutator `XYX⁻¹Y⁻¹` of lifts, not to its inverse; the two-term witness is
  the Heisenberg extension in the Checks of RS.0.1.
- c ⊆ G is conjugacy-invariant. Generation of G by c is assumed wherever U(G, c) or P is used;
  closure under invertible powers is assumed for the unit action; in Layer RS.4 and in the parity
  statements every element of c has order two.
- D = c/G, L = ℤ^D (Mathlib's `D →₀ ℤ`) with basis vectors e_d, and δ : L → Additive Gᵃᵇ,
  δ(e_[x]) = [x], are InverseGalois's. Degrees are integers; inverse generators have negative
  degree.
- M(G, c) is canonical. A reduced cover S_c depends on the chosen Schur cover; different choices need
  not give isomorphic groups (D₈ and Q₈ over C₂ × C₂). Statements about a reduced cover hold for
  every choice.
- The units of the prime-to-p profinite integers act on a finite group of order prime to p by
  g ↦ g^α, through any common exponent. On a nonabelian group this is a permutation of the
  underlying set, not a homomorphism. On L the action permutes coordinates, m^α(d^α) = m(d); it
  never multiplies a degree by α. An integer q prime to p|G| acts as its image in these units.
- In Layer RS.4, A = M(G, c) is the kernel of the reduced cover, B = A/A² is
  `TauCeti.ElementaryTwoQuotient` of `Multiplicative A`, A[n] is the n-torsion and v₂ the 2-adic
  valuation.
- Explicit finite groups are given by their multiplication and their marked embedding; an abstract
  group name or a SmallGroups number names an example but does not replace these data.

## Exact supplier contracts

### From Mathlib (pinned 082e2d3)

- `GroupExtension`, `GroupExtension.Section`, `GroupExtension.Splitting`
  (`Mathlib/GroupTheory/GroupExtension/Defs.lean`): an injective `inl`, a surjective `rightHom` and
  exactness; centrality is not part of the structure and is always a separate hypothesis.
- `Rep.trivial`, `groupHomology.cycles₂`, `groupHomology.boundaries₂`, `groupHomology.H2`,
  `groupHomology.H2π`, `groupHomology.H2π_eq_iff`, `groupHomology.d₂₁_single`,
  `groupHomology.d₃₂_single`
  (`Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean`): the integral 2-cycles
  as a submodule of `G × G →₀ ℤ`, their quotient H₂ and its kernel. `groupHomology`,
  `groupHomology.inhomogeneousChains`, `groupHomology.map` and `groupHomology.map_comp`
  (`.../GroupHomology/Basic.lean`, `.../GroupHomology/Functoriality.lean`) give homology in every
  degree and its functoriality along a group homomorphism with a compatible coefficient map; with
  trivial integral coefficients the identity serves.
- `groupHomology.H1AddEquivOfIsTrivial`, `groupHomology.d₁₀_eq_zero_of_isTrivial`,
  `groupHomology.isZero_groupHomology_succ_of_subsingleton`, `groupHomology.H0IsoOfIsTrivial`,
  `Rep.FiniteCyclicGroup.groupHomologyIsoEven` and `groupHomologyIsoOdd`.
- `groupCohomology.cocycles₂`, `groupCohomology.coboundaries₂`, `groupCohomology.H2`,
  `groupCohomology.H2π`, `groupCohomology.H2π_eq_iff`, `groupCohomology.map`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/`).
- `Abelianization`, `Abelianization.of`, `Abelianization.lift`, `Abelianization.map`, `commutator`,
  `commutatorElement`, `ConjClasses`, `IsConj`, `Subgroup.centralizer`, `Subgroup.center`,
  `MulAut.conjNormal`, `Representation.Coinvariants`, `QuotientGroup`, `SemidirectProduct` (with
  `inl`, `inr`, `rightHom`, `lift`), `MulEquiv.prodComm`, `alternatingGroup`, `DihedralGroup`,
  `Matrix.SpecialLinearGroup`, `Matrix.GeneralLinearGroup`.
- `CategoryTheory.Abelian.Ext` (the carrier `Ext ℤ (ModuleCat ℤ) 1`), `Module.Baer.of_divisible`,
  `AddCommGrpCat.injective_of_divisible` (`Mathlib/Algebra/Category/Grp/Injective.lean`): a
  divisible abelian group is injective.
- `Subgroup.exists_right_complement'_of_coprime` (`Mathlib/GroupTheory/SchurZassenhaus.lean`):
  existence of a complement to a normal subgroup of coprime order and index.
- `Finsupp.domCongr`, `Finsupp.equivFunOnFinite`, `MulActionHom` (`T →[B] X`),
  `MulAction.orbitRel`.
- `powMonoidHom`, `MonoidHom.fiberEquivKer`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
  `AddCommGroup.primaryComponent`, `AddCommGroup.zmodModule`, `padicValNat`,
  `LinearMap.finrank_range_add_finrank_ker`, `Module.card_eq_pow_finrank`, `Polynomial`.

### From Tau Ceti (pinned f790474)

- `TauCeti.GroupExtension.factorSet`, `TauCeti.GroupExtension.inl_factorSet`
  (`TauCeti/GroupTheory/GroupExtension/FactorSetOfSection.lean`): the factor set of a normalized
  section of an extension whose conjugation action on its abelian kernel is the ambient one, with
  `inl(φ(g,h)) = σ(g)σ(h)σ(gh)⁻¹`; `TauCeti.GroupExtension.conjAct_eq_one_of_le_center` (a central
  kernel carries the trivial action).
- `TauCeti.FactorSet.cohomologyClass`, `TauCeti.GroupExtension.cohomologyClass_factorSet_eq`
  (independence of the section), `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
  (`TauCeti/GroupTheory/GroupExtension/Cohomology.lean`). The splitting criterion is stated for the
  extension built from a factor set; it is applied to an arbitrary extension through
  `factorSetToGroupExtensionEquiv`.
- `TauCeti.schurMultiplier k G = H²(G, kˣ)` for the trivial action
  (`TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean`), the carrier of
  `card_schurMultiplier_complex` (RS.0.2).
- `TauCeti.ElementaryTwoQuotient G` for a commutative group G (the `ZMod 2`-module
  `ModN (Additive G) 2`), `TauCeti.elementaryTwoQuotientMk`, `TauCeti.elementaryTwoQuotientMk_mul`,
  `TauCeti.elementaryTwoQuotientMk_eq_iff`, `TauCeti.elementaryTwoQuotientMap`
  (`TauCeti/Algebra/Group/ElementaryTwoQuotient/Basic.lean`).

### From the current Tau Ceti library (after the pin)

These declarations are in Tau Ceti a91d3aaf and are cited, not re-planned; the pinned Lean file does
not import them.

- `TauCeti.groupHomology.transfer` and `TauCeti.groupHomology.transfer_comp_map_subtype_id`
  (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`): the transfer to a
  finite-index subgroup S and the identity `cor ∘ tr = [G : S] • 𝟙` in every degree;
  `TauCeti.groupHomology.map_comp_transfer` (naturality in the coefficients).
- `TauCeti.ChainComplex.kronecker`, `kronecker_homologyπ`, `kronecker_naturality`
  (`TauCeti/Algebra/Homology/Kronecker.lean`): evaluation of the homology of a complex against the
  cohomology of its dual, with no hypothesis on the coefficient object (`kronecker_bijective`
  assumes an injective coefficient object and is not used for arbitrary A).

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups (pull request #850)

Cited below as *InverseGalois*. Layer IG.3.4–IG.3.5 supplies, with the hypotheses stated there:

- the commutator of lifts κ_E, the class ⟨x, y⟩ with its cycle, swap law and naturality, the class
  map τ_E of a central extension with τ_E⟨x, y⟩ = κ_E(x, y), and the universal coefficient theorem
  for trivial A (onto, kernel Ext(Gᵃᵇ, A)), for every group G (*Commutators of lifts and the class
  map of a central extension*). Its Lean name for τ_E is left open there; the statements below write
  it `extensionClassMap S`.
- Q_c and M(G, c) (*The reduced Schur multiplier*); Schur covers with τ_S, reduced covers
  π_c : S_c → G with τ_c : M(G, c) ≅ ker π_c, lifts over c commuting with lifts of centralisers, and
  the zero composite H₂(S_c, ℤ) → M(G) → M(G, c) (*Reduced Schur covers*); the bijective lifting of
  classes and the class-compatible marking x ↦ x̂ (*Conjugacy classes lift bijectively*).
- for finite G generated by the conjugacy-invariant c: U(G, c), its projection π_U and degree,
  D, L and δ, the marked fibre product P = S_c ×_{Gᵃᵇ} L with the marked isomorphism U(G, c) ≅ P,
  and the kernel K(G, c) with 0 → M(G, c) → K(G, c) → ker δ → 0 (*The universal marked
  extension*, *The class degree map*, *The marked fibre product and the computation of `U(G, c)`*,
  *The kernel of the universal marked extension*).
- for G = H ⋊ Γ with coprime orders: surjectivity of M(G) → M(Γ), finiteness and exponent dividing
  |G|, the splitting M(G) = M_H × M_Γ and the kernel M_H (*Coprime semidirect products and
  admissible inertia*, items 1–2).
- for c stable under invertible powers: the power map, the permutation of D and of L, the
  corrections W_α with `correction_cocycle`, the unit action on P and on U(G, c) with
  π_U(α ∗ u) = π_U(u)^α and deg(α ∗ u) = deg(u)^α, and the twist X⟨−1⟩ (IG.3.5).

### From TauCetiRoadmap.ProfiniteArithmetic

- Layer 0, §0.4: the unit group ẑˣ and its reductions to (ℤ/n)ˣ, through which a unit acts at a
  finite level (RS.3.2).

## How to read the build

Layer RS.0 is the integral homology toolkit that InverseGalois's reduced Schur covers rest on:
once the class map is pinned on representatives and is natural, the five-term sequence turns every
comparison between a central extension and M(G) into an exactness statement, and transfer gives
finiteness and the Hall part. Layer RS.1 adds three facts about commuting-pair classes and reduced
covers that the counting needs: bilinearity (so classes of involutions have order at most two),
local normalisation of lifts, and the exact image of the homology of a reduced cover. Layer RS.3
restricts InverseGalois's unit action to the kernel and builds the finite sets the counts range over.
Layer RS.4 solves the fixed-point equation of a power fibre by fibre and reduces survival of a
fibre to linear algebra over F₂. Layer RS.6 computes examples. Within each layer nothing is used
before it is stated.

```text
RS.0 class map on cycles ─> five-term sequence ─┐
RS.0 finite homology ─> Hall part               │      InverseGalois IG.3.4: ⟨x,y⟩, Q_c, M(G,c),
RS.1 bilinearity of ⟨x,y⟩;  local normalisation; image of H₂(S_c) = Q_c <── S_c, x̂, U(G,c) ≅ P, K(G,c)
RS.3 unit action on K(G,c) ─> finite level; slices, fixed lattices, orbit set <── IG.3.5: α ∗ (h, m)
RS.4 lift squares ─> obstruction β(g,m) ─> fixed fibres ─> two-adic threshold ─> F₂ cosets, ranks, enumerators
RS.6 index-two reduction (RS.0 Hall part, RS.1) ─> certificates ─> anti-diagonal formula ─> Table 2
```

## Layer RS.0: Integral homology of groups and central extensions

InverseGalois IG.3.4 compares central extensions with M(G) = H₂(G, ℤ) through the class map
τ_E : M(G) → A and the universal coefficient theorem, and uses without stating them the formula of
τ_E on cycles, its naturality, the five-term sequence and the finiteness of M(G). This layer states
those, in the generality the later layers and the sources support: the class map on
representatives (RS.0.1), the free and divisible cases of the universal coefficient theorem and
the order of `H²(G, ℂˣ)` (RS.0.2), the five-term sequence of a central extension and of an arbitrary
one (RS.0.3), finiteness and annihilation of Hₙ(G, ℤ) for every n ≥ 1 (RS.0.4), and the Hall part of
Hₙ(G, ℤ) for a normal Hall subgroup (RS.0.5). Mathlib has the carriers (`groupHomology`,
`groupHomology.H2` with its cycle quotient `groupHomology.H2π`, the degree-two cohomology carrier
and the functorial maps), and Tau Ceti classifies extensions with abelian kernel by factor-set
classes; neither library has a statement of this layer.

### RS.0.1 The class map on cycle representatives

Let `G` be any group and `A` an abelian group, written additively, with trivial `G`-action. Write
`integralEvaluation : H²(G, A) →+ (M(G) →+ A)` for the universal coefficient map of InverseGalois
IG.3.4, the map sending the class of a central extension `E` to its class map `τ_E`, and
`extensionClassMap S = τ_S` for the class map of a central extension `S : GroupExtension A E G`.
This subsection fixes both on representatives and states their naturality; InverseGalois states
that `integralEvaluation` is onto with kernel `Ext(Gᵃᵇ, A)` and that `τ_S⟨x, y⟩ = κ_S(x, y)`, and
neither statement is repeated here.

Define the chain-level pairing of a function `φ : G × G → A` with an integral 2-chain,

```text
cyclePairing φ z = Σ_(g,h) z(g, h) • φ(g, h),      z : G × G →₀ ℤ,
```

and prove `cyclePairing_boundary` (a 2-cocycle pairs to zero with every boundary) and
`cyclePairing_coboundary` (a 2-coboundary pairs to zero with every cycle). With trivial action
Mathlib's differentials are `d[g|h] = [h] − [gh] + [g]` on chains and
`(dψ)(g, h) = ψ(h) − ψ(gh) + ψ(g)` on 1-cochains, and likewise one degree up, so the pairing of a
cochain with the boundary of a chain is the pairing of its coboundary with the chain; both descent
statements follow. No finiteness of `G` or `A` is assumed.

Prove:

- `integralEvaluation_mk`: for a cocycle `φ ∈ Z²(G, A)` and a cycle `z ∈ Z₂(G, ℤ)`,
  `integralEvaluation (H2π φ) (H2π z) = cyclePairing φ z`.
- `integralEvaluation_map_group`: for `f : G →* H`, evaluating the pullback `f^*α` on `z` equals
  evaluating `α` on `f_* z` (cohomology contravariant, homology covariant in the group).
- `integralEvaluation_map_coeff`: for `μ : A →+ B`, evaluating `μ_* α` on `z` is `μ` of evaluating
  `α` on `z`.
- `extensionClassMap_apply`: let `S` be central (`S.inl.range ≤ Subgroup.center E`), `σ` a
  normalized section of `S.rightHom` and `φ = TauCeti.GroupExtension.factorSet σ` its factor set,
  `S.inl (φ(g, h)) = σ(g) σ(h) σ(gh)⁻¹`. Then `φ` is a 2-cocycle for the trivial action (centrality
  makes the induced action trivial, `TauCeti.GroupExtension.conjAct_eq_one_of_le_center`) and
  `τ_S (H2π z) = cyclePairing (Additive.ofMul ∘ φ) z` for every `σ`;
  `TauCeti.GroupExtension.cohomologyClass_factorSet_eq` makes the right side independent of `σ`.
- `extensionClassMap_natural`: for a map of central extensions — `a : A →* A'`, `e : E →* E'`,
  `f : G →* G'` with `e ∘ S.inl = S'.inl ∘ a` and `S'.rightHom ∘ e = f ∘ S.rightHom` — one has
  `τ_{S'} ∘ f_* = a ∘ τ_S`. All three maps are retained; nothing is assumed about the kernels being
  identified.
- `extensionClassMap_eq_zero_of_splitting`: a homomorphic section (`S.Splitting`) forces `τ_S = 0`.
  The converse holds when `Ext¹(Gᵃᵇ, A) = 0`, for example when `Gᵃᵇ` is free: then `τ_S = 0` makes
  the class of `S` zero by InverseGalois's universal coefficient theorem, and `S` splits by
  `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` (applied through
  `TauCeti.GroupExtension.factorSetToGroupExtensionEquiv`).

*Proof sketch.* The two descent statements are the adjunction of `d` on chains and cochains noted
above. `integralEvaluation_mk` is the definition of the universal coefficient map on the bar
complex. For `extensionClassMap_apply`, the class of `S` is the class of `φ`
(`TauCeti.FactorSet.cohomologyClass`), and the class map is its evaluation. Naturality: pull back
the section of `S'` along `f` and compare it with `e ∘ σ`; their factor sets differ by the
coboundary of a 1-cochain, which pairs to zero with cycles. A homomorphic section has factor set
`1`. The current Tau Ceti library has the evaluation for a general chain complex against its dual
(`TauCeti.ChainComplex.kronecker`, with `kronecker_homologyπ` and `kronecker_naturality`, in
`TauCeti/Algebra/Homology/Kronecker.lean`); it postdates the pin, assumes nothing about the
coefficient object, and gives `integralEvaluation_map_coeff` once the pin moves. *Needs:*
InverseGalois IG.3.4 *Commutators of lifts and the class map of a central extension*; Mathlib
`groupHomology.cycles₂`, `groupHomology.boundaries₂`, `groupHomology.H2π`,
`groupHomology.H2π_eq_iff`, `groupCohomology.cocycles₂`, `groupCohomology.coboundaries₂`,
`groupCohomology.H2π`, `groupCohomology.H2π_eq_iff`, `groupHomology.map`, `groupCohomology.map`,
`GroupExtension.Section`, `GroupExtension.Splitting`; Tau Ceti
`TauCeti.GroupExtension.factorSet`, `TauCeti.GroupExtension.inl_factorSet`,
`TauCeti.GroupExtension.cohomologyClass_factorSet_eq`,
`TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`.

*Source.* Hatcher, *Algebraic Topology*, §3.1, the evaluation map `Hⁿ(C; G) → Hom(Hₙ(C), G)` built
from cycles and boundaries, p. 191, applied to the integral inhomogeneous chain complex of `G`
(whose chain groups are free abelian); Löh, *Group Cohomology* (lecture notes, version of 30 July
2019), §1.2, pp. 11–17, for the bar complex as the defining complex of group (co)homology, and
§1.5.2, pp. 32–40, for extensions with abelian kernel and their second-cohomology classes; Wood,
*An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), §2.1, author copy
p. 2, for the class map of a central extension.

**Checks.**

- `integralEvaluation_test_1` (orientation, infinite group): for `G = ℤ²`, `A = ℤ` and the bilinear
  cocycle `φ((a,b),(c,d)) = ad`, `cyclePairing φ ([e₁|e₂] − [e₂|e₁]) = 1` and
  `cyclePairing φ ([e₂|e₁] − [e₁|e₂]) = −1`. A pairing that symmetrises or ignores order fails.
- `integralEvaluation_test_2` (torsion coefficients): for `G = C₂ × C₂`, `A = ZMod 2` and the same
  coordinate cocycle `φ((a,b),(c,d)) = ad`, the commuting cycle of the two basis vectors pairs to
  `1`. A construction valid only for torsion-free `A` fails.
- `integralEvaluation_test_3` (degenerate): for `G` trivial, `M(G) = 0` and evaluation is the zero
  map for every `A`.
- `extensionClassMap_test_1` (split, infinite kernel): for the direct product `ℤ × G → G` the
  section `g ↦ (0, g)` is a homomorphism, its factor set is zero, and `τ = 0`.
- `extensionClassMap_test_2` (nonsplit but zero): for `C₂ → C₄ → C₂`, `τ = 0` because
  `M(C₂) = 0`, yet there is no homomorphic section; the extension class lies in
  `Ext¹(C₂, C₂) ≅ C₂`, so the converse of `extensionClassMap_eq_zero_of_splitting` needs its Ext
  hypothesis.
- `extensionClassMap_test_3` (the sign, by a two-term witness): the integral Heisenberg group of
  triples `(a, b, z)` with `(a,b,z)(a',b',z') = (a+a', b+b', z+z'+ab')` is a central extension of
  `ℤ²` by `ℤ`. With `X = (1, 0, 0)` and `Y = (0, 1, 0)`, `XY = (1, 1, 1)` and `YX = (1, 1, 0)`, so
  `XYX⁻¹Y⁻¹ = (0, 0, 1)` and `τ⟨e₁, e₂⟩ = +1`. The section `(a, b) ↦ (a, b, 0)` has factor set
  `φ((a,b),(c,d)) = ad`, and `cyclePairing φ ([e₁|e₂] − [e₂|e₁]) = 1` agrees; the inverse
  convention would give `−1`.
- `extensionClassMap_test_4` (a value on a finite group): for the dihedral extension
  `C₂ → D₈ → C₂ × C₂` and the quaternion extension `C₂ → Q₈ → C₂ × C₂`, the factor set of any
  normalized section pairs with the commuting cycle of the two basis vectors to the nonidentity
  central element, since in both groups lifts of the two basis vectors fail to commute.
- `extensionClassMap_natural_test` (the kernel map is kept): `(a, b, z) ↦ (2a, b, 2z)` is an
  endomorphism of the Heisenberg extension over `f(a, b) = (2a, b)` with kernel map `z ↦ 2z`. Both
  sides of naturality give `τ(f_*⟨e₁, e₂⟩) = τ⟨2e₁, e₂⟩ = 2 = a(τ⟨e₁, e₂⟩)`; a statement
  `τ_{S'} ∘ f_* = τ_S` that drops `a` would give `1`.

### RS.0.2 Corollaries of the universal coefficient theorem

InverseGalois IG.3.4 states that `integralEvaluation` is onto with kernel `Ext¹(Gᵃᵇ, A)` for every
group `G` and every abelian `A` with trivial action. Prove the three consequences that this roadmap
and InverseGalois's Schur covers use, none of which is stated there:

- `integralEvaluation_bijective_of_free`: for any group `G` (finite or not) whose abelianization
  `Additive Gᵃᵇ` is a free `ℤ`-module, and any `A`, `integralEvaluation` is bijective.
- `integralEvaluation_bijective_of_divisible`: for any group `G` and any divisible `A` (every element
  is an `n`-th multiple for every `n ≥ 1`), `integralEvaluation` is bijective; in particular
  `H²(G, ℂˣ) ≅ Hom(M(G), ℂˣ)`.
- `card_schurMultiplier_complex`: for finite `G`, Tau Ceti's `TauCeti.schurMultiplier ℂ G = H²(G, ℂˣ)`
  has the order of `M(G)`. Consequently a representation group of InductionRestriction Layer 7, a
  stem central extension whose kernel has the order of `H²(G, ℂˣ)`, has `|ker π| = |M(G)|`, which is
  the hypothesis of InverseGalois's comparison (*Reduced Schur covers*) making `τ_S` an isomorphism;
  so every finite group has a Schur cover in InverseGalois's sense.

*Proof sketch.* `Ext¹(F, A) = 0` for free `F`, and `Ext¹(−, A) = 0` for divisible `A`, because a
divisible abelian group is an injective `ℤ`-module (Mathlib `Module.Baer.of_divisible`,
`AddCommGrpCat.injective_of_divisible`); in both cases the kernel of InverseGalois's surjection
vanishes. For finite `G`, `M(G)` is finite (InverseGalois's coprime semidirect target with
`Γ = 1`), and `Hom(M(G), ℂˣ)` has the order of `M(G)` because `ℂˣ` contains
a cyclic group of every finite order. *Needs:* RS.0.1; InverseGalois IG.3.4 *Commutators of lifts
and the class map of a central extension* (the universal coefficient theorem), *Coprime semidirect
products and admissible inertia* (finiteness of `M(G)`); Tau Ceti `TauCeti.schurMultiplier`; Mathlib
`CategoryTheory.Abelian.Ext`, `Module.Baer.of_divisible`, `AddCommGrpCat.injective_of_divisible`;
InductionRestriction Layer 7 (representation groups).

*Source.* Hatcher, *Algebraic Topology*, §3.1: Lemma 3.1, p. 194, and Theorem 3.2 (the universal
coefficient theorem for cohomology of a chain complex of free abelian groups), p. 195, with the
computations `Ext(ℤ/n, A) = A/nA` and `Ext(F, A) = 0` for free `F` on p. 195; Löh, *Group
Cohomology*, Corollary 3.2.20 (algebraic universal coefficient theorem), p. 133.

**Checks.**

- `integralExtInclusion_test_1` (a nonzero Ext class): `G = C₂`, `A = ℤ`. Here `M(C₂) = 0`, while
  `H²(C₂, ℤ) ≅ Ext¹(C₂, ℤ) ≅ C₂`; evaluation has a nonzero kernel, so it is not injective without a
  hypothesis on `Gᵃᵇ` or on `A`.
- `integralExtInclusion_test_2` (vanishing Ext, infinite group): `G = ℤ²`. Its abelianization is
  free, so evaluation is bijective for every `A`, and `H²(ℤ², ℤ) ≅ Hom(M(ℤ²), ℤ) ≅ ℤ`.
- `integralExtInclusion_test_3` (torsion coefficients): `G = C₄`, `A = ZMod 2`. Then `M(C₄) = 0` but
  `Ext¹(C₄, C₂) ≅ C₂/4C₂ = C₂`, so `H²(C₄, C₂) ≅ C₂` lies entirely in the kernel of evaluation; its
  nonzero element is the class of `C₂ → C₈ → C₄`. `ZMod 2` is not divisible, so the divisible case
  does not apply.
- `card_schurMultiplier_complex_test` (orders): for `G = C₂ × C₂`, `|H²(G, ℂˣ)| = |M(G)| = 2`; for
  `G = C₆`, both are `1`.

### RS.0.3 The five-term exact sequence

Prove `extensionClassMap_exact`: for a central extension `S : GroupExtension A E G` (no
finiteness assumed) the sequence

```text
M(E) --π_*--> M(G) --τ_S--> Additive A --(inl)ᵃᵇ--> Additive Eᵃᵇ --(π)ᵃᵇ--> Additive Gᵃᵇ --> 0
```

is exact, where `π_* = groupHomology.map S.rightHom` on trivial integral coefficients,
`(inl)ᵃᵇ = (Abelianization.of.comp S.inl).toAdditive` and
`(π)ᵃᵇ = (Abelianization.map S.rightHom).toAdditive`. The four exactness statements are separate
theorems:

- `extensionClassMap_exact_left`: `range π_* = ker τ_S`;
- `extensionClassMap_exact_mid`: `range τ_S = ker (inl)ᵃᵇ`, the kernel elements that become trivial
  in `Eᵃᵇ`;
- `abelianization_exact_of_extension`: `range (inl)ᵃᵇ = ker (π)ᵃᵇ`;
- `abelianization_map_surjective`: `(π)ᵃᵇ` is onto.

The last two need only a group extension, with any kernel; centrality is used for the first two.

Two corollaries for **stem** extensions (`S.inl.range ≤ commutator E`):

- `extensionClassMap_surjective_of_stem`: `τ_S` is onto;
- `abelianization_map_bijective_of_stem`: `(π)ᵃᵇ` is an isomorphism `Eᵃᵇ ≃ Gᵃᵇ`.

The general form, `extensionFiveTerm_general`: for an arbitrary extension `S` of `G` by a normal
subgroup `N` of `E` (no centrality), let `N̄ = N/[E, N]` and `Ē = E/[E, N]`. Then `Ē → G` is a
central extension with kernel `N̄` (abelian, since `[N, N] ⊆ [E, N]`, and central, since `[E, N]`
is killed), and

```text
H₂(E, ℤ) --π_*--> M(G) --τ_{Ē}--> Additive N̄ --> Additive Eᵃᵇ --> Additive Gᵃᵇ --> 0
```

is exact. Here `N̄ = H₁(N, ℤ)_G`, the coinvariants of the conjugation action on `Nᵃᵇ`. For central
`S`, `[E, A] = 1`, `N̄ = A`, `Ē = E` and this is `extensionClassMap_exact`.

*Proof sketch.* The Hochschild–Serre spectral sequence of the extension with trivial integral
coefficients has `E²_(p,q) = H_p(G, H_q(N, ℤ))`. Its low-degree terms give the exact sequence
`H₂(E) → H₂(G) → H₁(N)_G → H₁(E) → H₁(G) → 0`, with the differential
`d² : E²_(2,0) = M(G) → E²_(0,1) = H₁(N)_G` as the middle map; `H₁(N)_G = N/[E, N]` by the
computation of `H₁` as the abelianization and of coinvariants. For central `S`, identify `d²`
with `τ_S` by computing it on the section cocycle (both are the transgression of the factor set);
this fixes the sign as in `extensionClassMap_test_3`. For general `S`, naturality of the spectral
sequence along the map of extensions `E → Ē` (identity on `G`, and `H₁(N)_G → N̄` an isomorphism)
identifies `d²` with `τ_{Ē}`. The tail `N̄ → Eᵃᵇ → Gᵃᵇ → 0` is the elementary statement
`Eᵃᵇ/(image of N) = (E/N)ᵃᵇ`. A route avoiding spectral sequences applies Hopf's formula to a free
presentation `F → E` and its composite with `E → G`: with `R ⊆ T ⊆ F` the kernels,
`M(G) = (T ∩ [F,F])/[F,T]`, `M(E) = (R ∩ [F,F])/[F,R]`, and in the central case `A = T/R` and the
map `M(G) → A` is induced by the inclusion `T ∩ [F,F] ⊆ T`; its kernel is
`((R ∩ [F,F])[F,T])/[F,T]` because `[F,T] ⊆ R` by centrality. *Needs:* RS.0.1; InverseGalois
IG.3.4 *Commutators of lifts and the class map of a central extension* (τ_S); Mathlib
`groupHomology.map`, `Abelianization`, `Abelianization.map`, `commutator`, `QuotientGroup`.

*Source.* Löh, *Group Cohomology*, Theorem 3.2.12 (Hochschild–Serre spectral sequence), p. 123,
Proposition 3.2.13 (the conjugation action on the coefficients), p. 124, and Remark 3.2.14
(naturality), p. 125; the low-degree analysis, and the computation `H₁(N; ℤ)_G = N/[F, N]`, are
those of the proof of Theorem 3.2.18 (Hopf's formula), pp. 129–131; Hopf's formula itself is
Theorem 1.5.1, p. 30, and `H₁` is the abelianization by Theorem 1.4.1, p. 20. The identification of
the middle map with the commutator class is Wood (2021), §2.1, p. 2.

**Checks.**

- `extensionFiveTerm_test_1` (split central): for `A × G → G`, `(inl)ᵃᵇ` is injective and `(π)ᵃᵇ` is
  onto, including for infinite `A`.
- `extensionFiveTerm_test_2` (abelian total group): for `C₂ → C₄ → C₂`, `(inl)ᵃᵇ` is injective and
  `ker (π)ᵃᵇ` has order two; `τ = 0` does not force a splitting.
- `extensionFiveTerm_test_3` (stem): for `C₂ → D₈ → C₂ × C₂`, `(inl)ᵃᵇ = 0`, `τ` is onto and `(π)ᵃᵇ`
  is bijective. A statement claiming injectivity of `(inl)ᵃᵇ` in general fails here.
- `extensionFiveTerm_test_4` (the general form): for `A₃ → S₃ → C₂`, the kernel is not central,
  `[S₃, A₃] = A₃` (the commutator of a transposition and a 3-cycle `a` is `a^{±2}`, a generator),
  so `N̄ = 1`, `Ē = C₂`, and the sequence reads `H₂(S₃) → 0 → 0 → C₂ → C₂ → 0`: the image of the
  kernel in `S₃ᵃᵇ` is trivial (`[t, a] = a⁻² = a` for a transposition `t`) and `(π)ᵃᵇ` is bijective,
  the tail being exact without centrality. Using `N = A₃`
  itself in place of `N̄` would break exactness at that term: all of `C₃` dies in `S₃ᵃᵇ = C₂`,
  while the preceding term `M(C₂)` is `0`.

### RS.0.4 Finite integral homology

Prove, for a finite group `G` and every `n ≥ 1`, on the carrier
`groupHomology (Rep.trivial ℤ G ℤ) n`:

- `integralHomology_finite`: the group is finite;
- `integralHomology_card_smul`: `Nat.card G • z = 0` for every element `z`.

In degree two this is the finiteness of `M(G)` and the exponent bound that InverseGalois IG.3.4
(*Coprime semidirect products and admissible inertia*, item 1, with `Γ = 1`) states; here it holds
in every positive degree. Degree zero is excluded: `H₀(G, ℤ) = ℤ`.

*Proof sketch.* Annihilation: apply corestriction after transfer to the trivial subgroup; the
composite is multiplication by `[G : 1] = |G|` and factors through the homology of the trivial
group, which vanishes in positive degrees
(`groupHomology.isZero_groupHomology_succ_of_subsingleton`). The current Tau Ceti library has the
transfer and this composite as `TauCeti.groupHomology.transfer` and
`TauCeti.groupHomology.transfer_comp_map_subtype_id`
(`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`; it postdates the
pin). Finiteness: the chain module `(Fin n → G) →₀ ℤ` is finite free, so its homology is a finitely
generated abelian group, and a finitely generated abelian group of finite exponent is finite.
*Needs:* Mathlib `groupHomology`, `groupHomology.isZero_groupHomology_succ_of_subsingleton`,
`groupHomology.inhomogeneousChains`; current Tau Ceti `TauCeti.groupHomology.transfer`,
`TauCeti.groupHomology.transfer_comp_map_subtype_id`.

*Source.* Löh, *Group Cohomology*, Theorem 1.7.15 (transfer), p. 64, and its application to the
trivial subgroup in the proof of Corollary 1.7.16, pp. 64–65.

**Checks.**

- `integralHomology_test_1` (degenerate): the trivial group has zero homology in every positive
  degree.
- `integralHomology_test_2` (cyclic): `H_(2k+1)(C₂, ℤ) ≅ C₂` and `H_(2k+2)(C₂, ℤ) = 0` for `k ≥ 0`
  (Mathlib's `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`, `groupHomologyIsoEven`); this rejects a
  degree shift and a claim that all positive-degree homology of a finite group vanishes.
- `integralHomology_test_3` (degree zero excluded): `H₀(C₂, ℤ) ≅ ℤ` is infinite and `2 • [1] ≠ 0`
  there (`groupHomology.H0IsoOfIsTrivial`).
- `integralHomology_test_4` (a composite order):
  `H₃(S₃, ℤ) ≅ ℤ/6` (Löh, Example 3.2.16, pp. 126–127) is killed by `|S₃| = 6` but neither by 2 nor
  by 3.

### RS.0.5 The Hall part of integral homology

Let `H` be a normal subgroup of a finite group `G` with `gcd(|H|, [G : H]) = 1` (a normal Hall
subgroup), `ϖ` the set of primes dividing `|H|`, and `n ≥ 1`. For a finite abelian group `X` write
`X_ϖ` for its `ϖ`-primary part, the elements killed by a power of `|H|`. The group `G` acts on
`Hₙ(H, ℤ)` through conjugation, `g ↦ (c_g)_*` with `c_g = MulAut.conjNormal g`; inner
automorphisms of `H` act trivially, so the action factors through `G/H`, and
`Hₙ(H, ℤ)_G = Representation.Coinvariants` of it.

Prove `integralHomology_hallPart`: corestriction (`groupHomology.map H.subtype`) induces an
isomorphism `Hₙ(H, ℤ)_G ≃+ Hₙ(G, ℤ)_ϖ`. In the form statable on Mathlib's carriers:

- `integralHomology_hallPart_range`: an element `z ∈ Hₙ(G, ℤ)` lies in the image of corestriction iff
  `|H|^k • z = 0` for some `k`;
- `integralHomology_hallPart_ker`: the kernel of corestriction is the subgroup generated by the
  differences `(c_g)_* v − v`, `g ∈ G`, `v ∈ Hₙ(H, ℤ)`.

The degree-two case `multiplier_hallPart`, `M(H)_G ≃+ M(G)_ϖ`, is the one Layer RS.6 uses. For a
semidirect product `G = H ⋊ Γ` the complementary statement — `M(G) → M(Γ)` is onto with kernel
`M(G)_ϖ`, so `M(H ⋊ Γ) ≅ M(H)_Γ ⊕ M(Γ)` — combines this with InverseGalois IG.3.4 *Coprime
semidirect products and admissible inertia*, items 1–2. By Schur–Zassenhaus
(`Subgroup.exists_right_complement'_of_coprime`) every such `G` is a semidirect product `H ⋊ Γ`.

*Proof sketch.* `Hₙ(G, ℤ)` is finite of exponent dividing `|G|` (RS.0.4), so it is the sum of its
`ϖ`- and `ϖ'`-parts (Mathlib's finite abelian primary decomposition), and `Hₙ(H, ℤ)` is a
`ϖ`-group. Write `m = [G : H]`, prime to `|H|`. Corestriction after transfer is `m`
(`transfer_comp_map_subtype_id`), so every `ϖ`-element `y = m · (m⁻¹y)` is a corestriction, where
`m⁻¹` is an inverse of `m` modulo the exponent; and corestriction lands in the `ϖ`-part. Transfer
after corestriction on `Hₙ(H, ℤ)` is the norm `Σ_(gH ∈ G/H) (c_g)_*` (the chain-level formula for the
transfer, Löh §1.7.3, pp. 63–64, with `H` normal), which induces multiplication by `m` on the
coinvariants; as `m` is invertible on the `ϖ`-group `Hₙ(H, ℤ)_G`, an element killed by
corestriction is zero in the coinvariants. Corestriction kills each `(c_g)_* v − v` because inner
automorphisms of `G` act trivially on `Hₙ(G, ℤ)`. *Needs:* RS.0.4; Mathlib `groupHomology.map`,
`groupHomology.map_comp`, `MulAut.conjNormal`, `Representation.Coinvariants`,
`AddCommGroup.equiv_directSum_zmod_of_finite`; current Tau Ceti `TauCeti.groupHomology.transfer`,
`TauCeti.groupHomology.transfer_comp_map_subtype_id`.

*Source.* Löh, *Group Cohomology*, Theorem 1.7.15, p. 64, and the chain-level description of the
transfer, pp. 63–64; for the spectral-sequence route in degree two, Theorem 3.2.12, p. 123, and
Proposition 3.2.13, p. 124. The use in the source papers is Liu–Wood–Zureick-Brown, Lemma 12.10 and
its proof (published version pp. 110–111), and Ellenberg–Venkatesh–Westerland, Example 9.3.2
(arXiv v1, p. 57).

**Checks.**

- `multiplier_hallPart_test_1` (trivial complement): for `G = H` the corestriction is the identity
  and the coinvariants are `M(H)` itself; the map, not only the orders, is tested.
- `multiplier_hallPart_test_2` (action on the multiplier): `H = C₃ × C₃` with `Γ = C₂` acting by
  inversion. Then `M(H) ≅ Λ²H ≅ C₃` and inversion acts on `Λ²H` by `(−1)² = 1`, so the coinvariants
  are `C₃` and `M(H ⋊ C₂) ≅ C₃`. Replacing the induced action on `M(H)` by inversion would wrongly
  give `0`.
- `integralHomology_hallPart_test_3` (degrees one and three): for `S₃ = C₃ ⋊ C₂`, `C₂` acts on
  `H_(2k+1)(C₃, ℤ) ≅ C₃` by `(−1)^(k+1)` (Löh, Example 3.2.16, p. 126). In degree one the
  coinvariants vanish and `H₁(S₃, ℤ) = C₂` has no 3-part; in degree three they are `C₃`, the 3-part
  of `H₃(S₃, ℤ) ≅ ℤ/6`. Ignoring the action would give `C₃` in degree one.
- `multiplier_hallPart_test_4` (coprimality needed): in `C₂ × C₂` with `H = C₂ × 1`, of order and
  index 2, `M(H) = 0` while `M(C₂ × C₂) ≅ C₂` is 2-primary; corestriction is not onto the
  `ϖ`-part.

### Examples

- For `G = C₂ × C₂`: `M(G) ≅ C₂`, and in both Schur covers `D₈` and `Q₈` the class map sends the
  commuting class of the basis to the central involution (`extensionClassMap_apply` with the
  factor set of the evident section).
- For `G = S₃ = C₃ ⋊ C₂`: `M(C₃)_{C₂} = 0` and `M(C₂) = 0`, so `M(S₃) = 0` by RS.0.5 and
  InverseGalois's complement part; in degree three RS.0.5 gives the `C₃` in `H₃(S₃, ℤ) ≅ ℤ/6`.

### Dependencies

Mathlib (group homology in all degrees and cohomology in degree two, `Ext` and injectivity of
divisible groups, abelianization, semidirect products, Schur–Zassenhaus existence, finite abelian
groups); Tau Ceti (factor sets and their classes, the splitting criterion, `schurMultiplier`);
InverseGalois IG.3.4 (the class map and the universal coefficient theorem, the coprime semidirect
splitting); InductionRestriction Layer 7 (representation groups, in RS.0.2). The current Tau Ceti library's transfer and Kronecker
evaluation are reused once the pin moves past them.

## Layer RS.1: Commuting-pair classes and reduced Schur covers

The commuting-pair classes ⟨x, y⟩, the reduced multiplier M(G, c) and the reduced covers
π_c : S_c → G are InverseGalois IG.3.4. This layer proves three facts about them that the counting
layers use and InverseGalois does not state: ⟨−, y⟩ is a homomorphism on the centraliser of y, so
classes ⟨x, y⟩ with x an involution have order at most two (RS.1.1); lifts in a reduced cover can be
normalised class by class, and normalised lifts over one element commute (RS.1.2–RS.1.3); and the
image of H₂(S_c, ℤ) in M(G) is exactly Q_c (RS.1.4), which sharpens InverseGalois's vanishing of
the composite H₂(S_c, ℤ) → M(G) → M(G, c).

### RS.1.1 Commuting-pair classes are bilinear

Prove, for a group `G` and InverseGalois's class `⟨x, y⟩ = H2π([x|y] − [y|x])` of commuting `x, y`:

- `homologicalCommutator_mul_left`: if `a` and `b` both commute with `y`, then
  `⟨ab, y⟩ = ⟨a, y⟩ + ⟨b, y⟩`. The hypotheses concern only commuting with `y`; `a` and `b` need not
  commute with each other. So `⟨−, y⟩ : C_G(y) → M(G)` is a group homomorphism, and it factors
  through `C_G(y)ᵃᵇ`.
- `homologicalCommutator_mul_right`: if `b` and `b'` both commute with `x`, then
  `⟨x, bb'⟩ = ⟨x, b⟩ + ⟨x, b'⟩` (from the left law and the swap law `⟨y, x⟩ = −⟨x, y⟩`).
- `commutator_order`: for commuting `x, y` and every integer `n`, `⟨xⁿ, y⟩ = n⟨x, y⟩`; in
  particular `2⟨x, y⟩ = 0` when `x² = 1`, and `n⟨x, y⟩ = 0` when `xⁿ = 1`.
- `homologicalCommutator_self`: `⟨x, x⟩ = 0`, hence `⟨xᵃ, xᵇ⟩ = 0` for all integers `a, b`.

*Proof sketch.* Work in Mathlib's integral inhomogeneous bar chains. Write `z(a, y) = [a|y] − [y|a]`
and, for `a` and `b` commuting with `y`,

```text
T(a, b; y) = [a|b|y] − [a|y|b] + [y|a|b].
```

Expanding `groupHomology.d₃₂_single` on the three terms (its four terms on `[a|b|y]` are
`[b|y] − [ab|y] + [a|by] − [a|b]`) and cancelling with `by = yb` and `ay = ya` gives

```text
d₃ T(a, b; y) = z(a, y) + z(b, y) − z(ab, y),
```

so the left law holds in `M(G)` by `groupHomology.H2π_eq_iff`. Taking `a = b = 1` shows that `z(1, y)`
is a boundary even in the unnormalized chain model, so `⟨1, y⟩ = 0`; the integer power law follows
by induction on `n ≥ 0` and from `⟨x⁻¹, y⟩ + ⟨x, y⟩ = ⟨1, y⟩ = 0`. The right law is the left law
conjugated by the swap. Finally `z(x, x) = 0` as a chain. No finiteness, chosen cover, universal
coefficient theorem or computation of the homology of a torus is used. *Needs:* InverseGalois IG.3.4
*Commutators of lifts and the class map of a central extension* (`ReducedSchur.commutingCycle`,
`ReducedSchur.homologicalCommutator`, `homological_commutator_swap`); Mathlib
`groupHomology.d₃₂_single`, `groupHomology.boundaries₂`, `groupHomology.H2π_eq_iff`.

*Source.* Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021),
§2.1, author copy p. 2, fixes the oriented cycle representing ⟨x, y⟩. The boundary computation is
a direct deduction from that cycle and Mathlib's differential, not a result stated by Wood.

**Checks.**

- `commutator_order_test_1` (small exponents): `n = 0` gives `⟨1, y⟩ = 0` (the chain
  `−T(1, 1; y)` has boundary `−z(1, y)`), `n = 1` is trivial, and `n = −1` gives
  `⟨x⁻¹, y⟩ = −⟨x, y⟩`, not `⟨x, y⟩`.
- `commutator_order_test_2` (involutions, with a nonzero class): for `G = C₂ × C₂` and its basis
  `x, y`, `⟨x, y⟩` is the nonzero element of `M(G) ≅ C₂`, while `⟨x², y⟩ = ⟨1, y⟩ = 0 = 2⟨x, y⟩`.
  The law gives `2⟨x, y⟩ = 0`, not `⟨x, y⟩ = 0`.
- `homologicalCommutator_mul_left_test` (infinite group): in `G = ℤ²`,
  `⟨2e₁, e₂⟩ = 2⟨e₁, e₂⟩ = 2` and `⟨e₁ + e₂, e₂⟩ = ⟨e₁, e₂⟩ + ⟨e₂, e₂⟩ = 1` in `H₂(ℤ², ℤ) = ℤ`.
- `homologicalCommutator_mul_left_test_2` (a nonabelian centraliser): in `G = S₃ × ℤ` with `y` the
  generator of the central factor, `C_G(y) = G`. By the Künneth formula `M(G) ≅ S₃ᵃᵇ ⊗ ℤ ≅ C₂`
  (Löh, Corollary 3.2.23, p. 136, with `M(S₃) = M(ℤ) = 0`), `⟨a, y⟩` is the nonzero element for a
  transposition `a`, and for two transpositions `a, b` with `ab` a 3-cycle the law gives
  `⟨ab, y⟩ = 1 + 1 = 0`, matching `[ab] = 0` in `S₃ᵃᵇ`. A law that required `a` and `b` to commute
  would not apply here.
- `homologicalCommutator_orientation_test`: reversing the pair negates the class, `⟨e₂, e₁⟩ = −1` in
  `H₂(ℤ², ℤ) = ℤ`, and the right law gives `⟨x, y⁻¹⟩ = −⟨x, y⟩`; no law is asserted for a
  non-commuting pair, for which no class is defined (in `S₃`, `(12)` and `(23)` have none).
- `homologicalCommutator_self_test`: in a finite cyclic group every class `⟨xᵃ, xᵇ⟩` vanishes,
  consistent with `M(C_n) = 0`.

### RS.1.2 Local class normalisation

**`localClassNormalization`.** Let `π_c : S_c → G` be a reduced cover (InverseGalois IG.3.4) and
choose a representative `x_d ∈ d` of each class `d ∈ D`. For `e ∈ S_c` with `π_c(e) ∈ c ∪ {1}`,
define `z(e)` to be the unique element of the `S_c`-conjugacy class of `e` lying over
`x_{[π_c(e)]}` if `π_c(e) ∈ c`, and `z(e) = e` if `π_c(e) = 1`. Existence and uniqueness are
InverseGalois's bijective lifting of classes over `c ∪ {1}`: the class of `e` maps bijectively onto
the class of `π_c(e)`, which contains `x_{[π_c(e)]}` once. When `c` is a single class and `x_d = c₀`
this is the normalisation of Wood's Definition 3.1; InverseGalois IG.3.6 uses that case inline.

The API:

- `localClassNormalization_image`: `π_c(z(e))` is `x_{[π_c(e)]}` or `1` according to the branch.
- `localClassNormalization_conj`: `z(e)` is conjugate to `e` in `S_c`, and `z(geg⁻¹) = z(e)` for every
  `g ∈ S_c`.
- `localClassNormalization_fixed`: if `π_c(e)` is `1` or a chosen representative, `z(e) = e`.
- `localClassNormalization_mul_kernel`: for `a ∈ ker π_c` and allowed `e`, `z(ae) = a · z(e)`; central
  multiplication transports the unique conjugate over `x_d`.

*Construction.* Apply the bijective lifting of classes to the class of `e`; no arithmetic lift and no
global product is constructed here. *Needs:* InverseGalois IG.3.4 *Reduced Schur covers*,
*Conjugacy classes lift bijectively*.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1, p. 388, and Lemmas
3.3–3.4, p. 390.

**Checks.**

- `localClassNormalization_test_1` (degenerate): for a kernel element `a`, `z(a) = a`.
- `localClassNormalization_test_2` (computation): for `S₃` with `c` the transpositions, its identity
  reduced cover (`M(S₃) = 0`) and `x_d = (12)`, `z((23)) = (12)` and `z((13)) = (12)`.
- `localClassNormalization_test_3` (one representative per class is needed): for `S₆` with `c` the
  transpositions together with the triple transpositions, an element over `(12)(34)(56)` has no
  conjugate over `(12)`; a single `c₀` cannot normalise both classes, so the representative system
  is part of the data.

### RS.1.3 Normalised factors over one element commute

Prove `local_factors_commute`: in a central extension `E → G`, any two elements lying over `{1, g}`
for one fixed `g ∈ G` commute. In particular all normalised lifts `z(e)` over one representative
`x_d`, together with the kernel, commute pairwise.

*Proof sketch.* Kernel elements are central; two elements over `g` differ by a central kernel
factor. *Needs:* RS.1.2; Mathlib `GroupExtension`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1, p. 388, and Lemmas
3.3–3.4, p. 390.

**Checks.**

- `local_factors_commute_test` (one element, not one class): in `D₈ → C₂ × C₂`, the two lifts `r`
  and `r³` of the image of the rotation commute, while lifts of the two basis elements do not
  (`⁅r, s⁆ = r²`); lying over the same class `c`, rather than over one element, is not enough once
  `c` has two elements whose lifts fail to commute.

### RS.1.4 The image of the homology of a reduced cover

Prove `homology_image`: for a Schur cover `S → G` of a finite group and its reduced cover
`π_c : S_c → G` (InverseGalois IG.3.4), the image of `H₂(S_c, ℤ) → M(G)` is exactly `Q_c`. In
particular the composite `H₂(S_c, ℤ) → M(G) → M(G, c)` is zero, which is the form InverseGalois
states.

*Proof sketch.* The quotient `S → S_c` is a map of central extensions over the identity of `G` whose
kernel map is the quotient `ker π → ker π_c = ker π / τ_S(Q_c)`. By naturality
(`extensionClassMap_natural`, RS.0.1) the class map of `S_c` is that quotient composed with
`τ_S`, and since `τ_S` is an isomorphism its kernel is `Q_c`. Exactness at `M(G)` of the five-term
sequence of `S_c` (`extensionClassMap_exact_left`, RS.0.3) identifies the image of `H₂(S_c, ℤ)` with
that kernel. Functoriality alone gives only the inclusion of the image in `Q_c`. *Needs:* RS.0.1,
RS.0.3; InverseGalois IG.3.4 *Reduced Schur covers*, *The reduced Schur multiplier*; Mathlib
`groupHomology.map`.

*Source.* Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the
Cohen–Lenstra conjecture over function fields, II* (2012, withdrawn preprint), §7.3, the paragraph
after the definition, arXiv v1 p. 34.

**Checks.**

- `homology_image_test` (both extremes): for `G = C₂ × C₂` and `c = ∅` (so `S_c = D₈` or `Q₈`) the
  image of `H₂(S_c, ℤ)` in `M(G) ≅ C₂` is `Q_∅ = 0`; for `c` the three nonidentity elements,
  `S_c = G` and the image is all of `M(G) = Q_c`. A claim that the image is always zero fails the
  second case, and the zero composite does not decide either.

### Examples

- `G = C₂ × C₂`: `M(G) ≅ C₂` is generated by `⟨x, y⟩` for the basis, and `2⟨x, y⟩ = 0` (RS.1.1). With
  `c = ∅` the reduced covers are `D₈` and `Q₈`, whose `H₂` maps to zero in `M(G)`; with `c` the three
  nonidentity elements `Q_c = M(G)`, `S_c = G` and the image is everything (RS.1.4).
- `G = S₃`, `c` the transpositions: `M(S₃) = 0`, the identity is the reduced cover, the marking is the
  inclusion of `c`, and the normalisation with `x_d = (12)` sends every transposition to `(12)`.
- Bilinearity with `x` an involution shows that every class `⟨x, y⟩` with `x ∈ c` has order at most
  two when `c` consists of involutions; this is what makes `Q_c` vanish in odd-order multipliers
  (RS.6.1).

### Dependencies

Layer RS.0 (naturality of the class map, the five-term sequence); InverseGalois IG.3.4 (⟨x, y⟩,
`Q_c`, Schur and reduced covers, bijective lifting of classes); Mathlib group homology in degrees
two and three.

## Layer RS.3: The unit action on the kernel and degree orbits

InverseGalois IG.3.5 defines the action α ∗ (h, m) = (h^α · W_α(m), m^α) of the units of the
prime-to-p profinite integers on the marked fibre product P = S_c ×_{Gᵃᵇ} L and, through the marked
isomorphism, on U(G, c); it is an action on the underlying set and not by automorphisms. This
layer proves that on the central kernel K(G, c) it is an action by automorphisms (RS.3.1) and that
a finite level determines it (RS.3.2), and it builds the finite sets over which the arithmetic
counts range: the bounded total-degree slices (RS.3.3), the power-fixed degree lattices (RS.3.4)
and the orbit set of class degrees (RS.3.5). Throughout, `G` is finite, `c` is conjugacy-invariant,
stable under invertible powers and generates `G`, and `p` is `1` or a prime not dividing `|G|`.

### RS.3.1 The unit action on the kernel is by automorphisms

Prove `kernel_action_aut`: each unit `α` acts on `K(G, c) = ker(π_U)` by a group automorphism, with
inverse the action of `α⁻¹`. In cover coordinates an element of `K` is a pair `(h, m)` with `h` in
the commutative central kernel `M(G, c)` of `π_c` and `m ∈ ker δ`, and
`α ∗ (hh', m + m') = (α ∗ (h, m)) · (α ∗ (h', m'))`. The statement does not extend to `U(G, c)`.

*Proof sketch.* For `h, h'` central, `(hh')^α = h^α h'^α`; `W_α` is a homomorphism `L → M(G, c)`
(InverseGalois *Central power corrections*); and the coordinate permutation `m ↦ m^α` is additive.
The action of `α⁻¹` is inverse to that of `α` by the action law. *Needs:* InverseGalois IG.3.5
*Central power corrections*, *The discrete action of units*; InverseGalois IG.3.4 *The kernel of the
universal marked extension*.

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48. Their §12 remarks that
the action on K(G, c) does not respect the group structure; in the cover coordinates above it does,
because the cover coordinate of a kernel element lies in the central abelian kernel of `π_c`.

**Checks.**

- `kernel_action_aut_test` (restriction to the kernel is needed): for `G = S₃` with `c` the
  transpositions, `U(G, c) ≅ {(h, n) ∈ S₃ × ℤ : sign h = (−1)ⁿ}` and the unit `−1` acts by
  `(h, n) ↦ (h⁻¹, n)`. On `U` this is not multiplicative: it fixes `((12), 1)` and `((23), 1)` but
  sends their product `((12)(23), 2)` to `(((12)(23))⁻¹, 2) ≠ ((12)(23), 2)`. On the kernel
  `K = {(1, n) : n even} ≅ 2ℤ` it is the identity, an automorphism.

### RS.3.2 A finite level determines the unit action

Prove `finite_level_action`: for units `α, β` with `α ≡ β` modulo `|G|²` (that is, with the same
image in `(ℤ/|G|²)ˣ`, ProfiniteArithmetic §0.4), `α ∗ u = β ∗ u` for every `u ∈ U(G, c)`; the same
holds on `K(G, c)` and on the degree lattice.

*Proof sketch.* `M(G)` is killed by `|G|` (RS.0.4 in degree two), so `M(G, c)` is too, and the
exponent of `S_c` divides `|G|²`. In `α ∗ (h, m) = (h^α · W_α(m), m^α)`, the power `h^α` depends on
`α` modulo the order of `h`; the correction `z_d(α) = x̂_d^{−α} · (x_d^α)^` depends on `α` modulo the
orders of `x̂_d` and of `x_d`; and the permutation `d ↦ d^α` depends on `α` modulo the exponent of
`G`. All of these divide `|G|²`. For a general finite marked central model, assume explicitly that
its kernel is killed by `|G|`; the same exponent bound follows. *Needs:* RS.0.4; InverseGalois
IG.3.5 *The discrete action of units*; ProfiniteArithmetic Layer 0 (§0.4, units of `ẑ` and their
reductions).

*Source.* Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021),
Remark 4.1, author copy p. 8.

**Checks.**

- `finite_level_action_test` (a finite level on an infinite group): for `G = C₃` with `c` its two
  nonidentity elements, the units `2` and `11`, congruent modulo `9 = |G|²`, act identically on the
  infinite group `U(G, c)`. The bound is an upper bound: here `M(C₃) = 0`, `S_c = C₃`, every
  correction is trivial, and already `2` and `5`, congruent modulo `3`, act identically, while `1`
  and `2` do not (`2` exchanges the two classes).

### RS.3.3 Bounded total-degree slices

**`boundedDegreeSlice`.** For a finite set `D`, an integer `n` and an integer lower bound `M`,
define `L_{n, ≥M} = {m ∈ ℤ^D : m(d) ≥ M for every d, and Σ_d m(d) = n}`. Define `K_{n, ≥M}` as its
preimage in `K(G, c)` under the degree, and the twisted slice `K_{n, ≥M}⟨−1⟩` as the
`ẑ^{(p′)×}`-equivariant maps from the torsor `T` of generators of the prime-to-`p` roots of unity
(InverseGalois *The cyclotomic twist of a set*) into `K(G, c)` whose values lie in `K_{n, ≥M}`. In
the notation of Liu–Wood–Zureick-Brown `M` is positive; `M = 0` is also allowed, for component
counts.

*Construction.* A subset of the integer lattice, not a subgroup; each degree permutation preserves
its inequalities and its sum. The twisted slice is the preimage of the lattice slice under the
map of twists induced by the equivariant degree map; since the lattice slice is invariant,
membership is detected by evaluation at any one point of `T`.

The API:

- `boundedDegreeSlice_mem`: membership is the coordinate lower bound together with the exact total.
- `boundedDegreeSlice_invariant`: every degree permutation of InverseGalois IG.3.5 preserves the
  slice.
- `boundedDegreeSlice_preimage`: `K_{n, ≥M}⟨−1⟩` is the preimage of the slice under the twisted
  degree map.

*Needs:* RS.3.1; InverseGalois IG.3.5 *Powers by units and the permutation of class degrees*, *The
cyclotomic twist of a set*; InverseGalois IG.3.4 *The kernel of the universal marked extension*;
Mathlib `MulActionHom`.

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48.

**Checks.**

- `boundedDegreeSlice_test_1` (degenerate): for `D` empty the slice is a single point at `n = 0` and
  empty for `n ≠ 0`.
- `boundedDegreeSlice_test_2` (computation): for `|D| = 2`, `n = 3` and `M = 1`, the slice is
  `{(1, 2), (2, 1)}`.
- `boundedDegreeSlice_test_3` (not a subgroup): for nonempty `D`, `n = 0` and `M = 1` the slice is
  empty, so it never contains `0`.

### RS.3.4 Power-fixed degree lattices

**`powerFixedDegree`.** For an integer `q` prime to `p|G|`, let `d ↦ d^q` be its permutation of `D`
and define `L_{≡q} = {m ∈ ℤ^D : m(d^q) = m(d) for all d}`, the fixed subgroup of the coordinate
permutation. Its `(n, ≥M)` slice adds the lower bound and the exact total degree.

*Construction.* The equalizer of the coordinate permutation and the identity. Rationality of `c` as
a set does not make each class fixed by `q`.

The API:

- `powerFixedDegree_fixed`: `L_{≡q}` consists exactly of the `q`-fixed degree vectors.
- `powerFixedDegree_orbits`: fixed vectors correspond to integer-valued functions on the orbit set
  `D/⟨q⟩`; evaluation at the orbit of `d` gives `m(d)`.
- `powerFixedDegree_weighted_sum`: under this correspondence the total degree is `Σ_O |O| · m_O`,
  the weighted, not the unweighted, sum over orbits.

*Needs:* RS.3.3; InverseGalois IG.3.5 *Powers by units and the permutation of class degrees*;
Mathlib `Finsupp.domCongr`.

*Source.* Liu–Wood–Zureick-Brown (arXiv v2), §12, the paragraph before Proposition 12.7, p. 50.

**Checks.**

- `powerFixedDegree_test_1` (degenerate): for `q ≡ 1` modulo the exponent of `G`, `L_{≡q} = L`.
- `powerFixedDegree_test_2` (computation): for the two nonidentity classes of `C₃` and `q = 2`,
  `L_{≡q} = {(a, a) : a ∈ ℤ}`, of total degree `2a`.
- `powerFixedDegree_test_3` (the weighted sum matters): in that example with `M = 0`, the fixed slice
  of total degree `1` is empty (`2a = 1` has no solution), while the unconstrained slice contains
  `(1, 0)` and `(0, 1)`.

### RS.3.5 The orbit set of class degrees

**`DegreeOrbitSet`.** Define `𝔖^{c,G}` as the quotient of `L` by the coordinate permutations of all
units (InverseGalois *Powers by units and the permutation of class degrees*). Its `(n, ≥M)` subset
is the image of `L_{n, ≥M}`. A change of the chosen generator of the roots of unity changes a degree
vector within its orbit, so the orbit of the degree of an element of a twist is well defined.

*Construction.* The orbit relation of the subgroup of permutations of `D` induced by the units,
acting on `L` through `Finsupp.domCongr`; evaluation of an equivariant map at any two points of the
torsor gives the same orbit.

The API:

- `degreeOrbitSet_mk`: every degree vector has a class in `𝔖^{c,G}`.
- `degreeOrbitSet_eq`: two classes are equal iff the vectors differ by the coordinate permutation of
  some unit.
- `degreeOrbitSet_slice`: the `(n, ≥M)` image does not depend on the chosen generator of the roots of
  unity.

*Needs:* RS.3.3; InverseGalois IG.3.5 *Powers by units and the permutation of class degrees*, *The
cyclotomic twist of a set*; Mathlib `MulAction.orbitRel`.

*Source.* Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified
extensions* (2024), §12, published version pp. 104–105; arXiv v2 pp. 47–48.

**Checks.**

- `degreeOrbitSet_test_1` (degenerate): for `D` empty the orbit set is a single point.
- `degreeOrbitSet_test_2` (computation): for the two nonidentity classes of `C₃`, `(1, 4)` and
  `(4, 1)` have the same class.
- `degreeOrbitSet_test_3` (non-example): in the same example `(1, 4)` and `(2, 3)` have different
  classes although their totals agree.

### Examples

- `G = C₃`, `c` its two nonidentity elements: the unit `2` exchanges the two classes and acts on
  `L = ℤ²` by `(m₁, m₂) ↦ (m₂, m₁)`; the power-fixed lattice for `q = 2` is `{(a, a)}`, of total
  degree `2a`, and the orbit set identifies `(m₁, m₂)` with `(m₂, m₁)`.
- `G = S₃`, `c` the transpositions: every unit fixes the single class; the action on
  `U ≅ {(h, n) : sign h = (−1)ⁿ}` is `(h, n) ↦ (h^α, n)`, a permutation that is not a homomorphism for
  `α = −1`, and the identity on `K ≅ 2ℤ`.

### Dependencies

InverseGalois IG.3.4–IG.3.5 (the kernel, the unit action, the degree permutation, the twist); RS.0.4
for the finite level; ProfiniteArithmetic Layer 0; Mathlib `Finsupp.domCongr`, `MulActionHom`,
orbit relations.

## Layer RS.4: Fixed fibres, square obstructions and parity

Here `G` is finite, `c` is a union of classes `c_1, …, c_N` of involutions that generates `G`,
`π_c : S_c → G` is a reduced cover with kernel `A = M(G, c)` (InverseGalois IG.3.4), written
multiplicatively, and `P = S_c ×_{Gᵃᵇ} L` is the marked fibre product with InverseGalois's unit
action (IG.3.5). For `g ∈ G` and `m ∈ L` the *fibre* over `(g, m)` is the set of elements of `P`
with projection `g` and degree `m`. For an odd `q` prime to `|G|` the fixed points of `q` in a
fibre are the solutions of a power equation in the finite abelian group `A`; solvability is
governed by the square class of an explicit element `b(g, m)` and by `v₂(q − 1)`. The second half
turns the dependence on the parities of `m` into linear algebra over F₂. Statements about a fibre
hold for every choice of Schur cover, of class representatives and of lifts.

### RS.4.1 Lift squares are central

Prove `involution_square_central`: in a central extension `E → G` with kernel `A`, every lift `X` of
an involution `x ∈ G` has `X² ∈ A`; hence `X²` is central. For the reduced cover this says that for
`x ∈ c` every lift `X ∈ S_c` has `X² ∈ M(G, c)`.

*Proof sketch.* `X²` projects to `x² = 1`, so it lies in the kernel, which is central. *Needs:*
Mathlib `GroupExtension`; InverseGalois IG.3.4 *Reduced Schur covers* for the specialisation.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `involution_square_central_test` (squares depend on the class): for the two Schur covers of
  `G = C₂ × C₂`, with kernel `A ≅ C₂`: in `Q₈` every lift of a nonidentity element squares to the
  central `−1`; in `D₈` the lifts of the image of the rotation square to the central element `r²` and
  the lifts of the two reflection classes square to `1`. So `X² ∈ A` depends on the class, and
  squaring is not a homomorphism `E → A`.
- `involution_square_central_test_2` (the involution hypothesis): in `C₄ → C₂` a generator, a lift of
  the involution, squares into the kernel, while in `C₉ → C₃` a generator, a lift of an element of
  order three, has square outside the kernel `C₃`; the order-two hypothesis on `x` is what puts `X²`
  in `A`.

### RS.4.2 The square-class obstruction of a fibre

**`squareObstruction`.** Choose a lift `X_i ∈ S_c` of a representative of each class `c_i`, and for
`g ∈ c ∪ {1}` a lift `Y` of `g` (`Y = 1` for `g = 1`). For an integer degree `m` with
`Σ_i m_i [c_i] = [g]` in `Gᵃᵇ` (that is, `δ(m) = [g]`), define

```text
b(g, m) = Y² · Π_i (X_i²)^(−m_i) ∈ A,
```

and `β(g, m)` its class in `B = TauCeti.ElementaryTwoQuotient A`. Changing a lift multiplies `b` by
a square, and `β` depends only on the parities of the `m_i`.

*Construction.* All the squared factors lie in `A` (RS.4.1). Replacing `Y` or `X_i` by its product
with a kernel element `k` multiplies its square by `k²`. Modulo squares the exponents reduce
modulo two.

The API:

- `squareObstruction_representative`: `b(g, m) = Y² · Π_i (X_i²)^(−m_i)`.
- `squareObstruction_choice`: `β` does not depend on the choice of lifts; `b` in general does.
- `squareObstruction_parity`: changing each `m_i` by an even integer leaves `β` unchanged.
- `squareObstruction_compatibility`: the domain requires `δ(m) = [g]`; incompatible fibres are empty
  before this obstruction is considered.

*Needs:* RS.4.1; InverseGalois IG.3.4 *The class degree map*; Tau Ceti
`TauCeti.ElementaryTwoQuotient`, `TauCeti.elementaryTwoQuotientMk_mul`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `squareObstruction_test_1` (degenerate): for `g = 1` and `m = 0`, `β = 0`.
- `squareObstruction_test_2` (computation): for `g ∈ c_k` and `m = e_k`, `b = Y² · X_k^(−2)` and
  `β = 0`, since `Y` is a conjugate of `X_k` times a kernel element and `X_k²` is central.
- `squareObstruction_test_3` (non-example): a degree with `δ(m) ≠ [g]` has an empty fibre even when
  the formal product is a square.

### RS.4.3 The fixed-fibre power equation

Prove `fixed_fiber_equation`: with the data of RS.4.2 and an odd `q` prime to `|G|`, put
`r = (q − 1)/2`. Writing a point of the fibre over `(g, m)` as `(Yh, m)` with `h ∈ A`, it is fixed by
`q` iff `h^(q−1) = b(g, m)^(−r)`. Since the subgroup of `(q − 1)`-th powers is closed under
inversion, the fibre has a fixed point iff `b(g, m)^r ∈ A^(2r)`.

*Proof sketch.* Odd powers fix every involution, so `q` fixes every class `c_i` and `m^q = m`. In the
unit action `q ∗ (Yh, m) = ((Yh)^q · W_q(m), m)`, and `(Yh)^q = Y · (Y²)^r · h^q` because `Y²` and `h`
are central. For a representative `x_i` of `c_i`, `x_i^q = x_i`, so
`z_{c_i}(q) = X_i^(−q) · X_i = (X_i²)^(−r)` and `W_q(m) = Π_i (X_i²)^(−r m_i)`. The fixed-point
condition `Y (Y²)^r h^q Π_i (X_i²)^(−r m_i) = Y h` is `h^(q−1) = b(g, m)^(−r)`. The fibre is the set
of points of `P` with projection `g` and degree `m`, not the set of formal solutions of the
equation; each chosen representative must lie in its indexed class, and `q` must be a unit modulo
a common exponent of `S_c` and `G`. *Needs:* RS.4.2; InverseGalois IG.3.5 *Central power
corrections*, *The discrete action of units*; Mathlib `powMonoidHom`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `fixed_fiber_equation_test` (the sign of the correction): for `q = 3` (`r = 1`) and a class with
  `X² = a`, the correction is `W_3(e_i) = X_i^(−2) = a⁻¹`, so the equation reads `h² = b⁻¹`. The sign
  changes the solutions `h`, though not their existence.

### RS.4.4 Square-times-torsion solvability

Prove `square_torsion_solvability`: for a commutative group `A`, `b ∈ A` and `r ≥ 1`,
`b^r ∈ A^(2r)` iff `b ∈ A² · A[r]`.

*Proof sketch.* If `b^r = h^(2r)`, then `b h^(−2) ∈ A[r]`; conversely `(a² t)^r = (a^r)²` for
`t ∈ A[r]`. *Needs:* Mathlib `powMonoidHom`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `square_torsion_solvability_test` (both directions in `C₈`): for `A = C₈`, `r = 2` and `b` a
  generator, `A² · A[2]` is the even residues and `b^2 = 2` is not in `A^4 = {0, 4}`, so both sides
  fail; for `r = 8`, `A[8] = A` and `b^8 = 0 ∈ A^16`, so both hold.

### RS.4.5 All fixed fibres and their torsion count

Prove `all_fixed_fibers`: for odd `q > 1` prime to `|G|`, the fibre over `(g, m)` has exactly
`|A[q − 1]|` points fixed by `q` if `δ(m) = [g]` and `b(g, m)^r ∈ A^(2r)`, and none otherwise. The
units `q` and `q⁻¹` have the same fixed points. No nonnegativity of `m` is needed for this
group-theoretic statement.

*Proof sketch.* The solutions of `h^(q−1) = b^(−r)`, when there is one, form a coset of
`A[q − 1] = ker(powMonoidHom (q − 1))` (`MonoidHom.fiberEquivKer`); a permutation and its inverse
have the same fixed set. For an arbitrary finite central marked model, keep the finite-kernel
hypothesis and count the fixed subset of the actual fibre; it is empty when degree compatibility or
power-image membership fails. *Needs:* RS.4.3; Mathlib `MonoidHom.fiberEquivKer`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `all_fixed_fibers_test` (an obstructed fibre gets no count): take `A = C₄` (written additively),
  `b = 1` and `q = 3` (`r = 1`). Then `b ∉ 2A + A[1] = 2A`, so the fibre has no fixed point, although
  `|A[q − 1]| = |A[2]| = 2`.

### RS.4.6 The odd-parity fixed-point fibre

Prove `odd_parity_fiber`: if `g ∈ c_k`, `m_k` is odd and every other `m_i` is even, then the fibre is
compatible and has exactly `|A[q − 1]|` fixed points for every odd `q > 1` prime to `|G|`.

*Proof sketch.* Each `[c_i]` has order at most two in `Gᵃᵇ`, so `δ(m) = [c_k] = [g]`. Writing
`Y = ũ X_k ũ⁻¹ a` with `a ∈ A`, `Y² = X_k² a²`, and
`b = a² · (X_k²)^(1 − m_k) · Π_{i ≠ k} (X_i²)^(−m_i)` is a square, so `b^r` is a `2r`-th power.
*Needs:* RS.4.5, RS.4.2.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `odd_parity_fiber_test`: for `G = S₃` with `c` the transpositions, `A = 0`, so every compatible
  fibre has exactly one fixed point for every allowed `q`.

### RS.4.7 The even-parity fixed-point fibre

Prove `even_parity_fiber`: if `g = 1` and every `m_i` is even, then the fibre is compatible and has
exactly `|A[q − 1]|` fixed points for every odd `q > 1` prime to `|G|`.

*Proof sketch.* The degree maps to `1` in `Gᵃᵇ`, and `b = Π_i (X_i²)^(−m_i)` is a product of even
powers. *Needs:* RS.4.5, RS.4.2.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `even_parity_fiber_test` (negative degrees allowed): the degree `m = −2e_i` is covered; the
  statement is about the group `U(G, c)`, and nonnegativity enters only through the counting slices
  of RS.3.3.

### RS.4.8 The torsion-image filtration

**`torsionImageFiltration`.** For a commutative group `A` let `B = TauCeti.ElementaryTwoQuotient A`
and define `B_t ⊆ B` as the image of `A[2^t] = ker(powMonoidHom (2^t))`, a `ZMod 2`-subspace. Then
`B_0 = 0`, the filtration increases, and for finite `A` with `2`-primary exponent `2^e`, `B_e = B`.

*Construction.* The image of the torsion subgroup under the square-class map is an additive subgroup,
hence a subspace; exhaustion follows from the finite abelian primary decomposition.

The API:

- `torsionImageFiltration_zero`: `B_0 = 0`, since `A[1] = {1}`.
- `torsionImageFiltration_mono`: `t ≤ u` gives `B_t ≤ B_u`.
- `torsionImageFiltration_exhaustive`: `B_e = B` for finite `A` of `2`-primary exponent `2^e`.
- `torsionImageFiltration_cyclic`: for `A = C_{2^e}`, `B_t = 0` for `t < e` and `B_t = B` for `t ≥ e`.

*Needs:* Mathlib `powMonoidHom`, `AddCommGroup.equiv_directSum_zmod_of_finite`; Tau Ceti
`TauCeti.ElementaryTwoQuotient`, `TauCeti.elementaryTwoQuotientMap`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `torsionImageFiltration_test_1` (degenerate): for `A` of odd order, `B_t = 0 = B` for every `t`.
- `torsionImageFiltration_test_2` (computation): for `A = C₈`, `B_t = 0` for `t = 0, 1, 2` and
  `B_3 = B ≅ C₂`.
- `torsionImageFiltration_test_3` (the image, not the torsion): in `C₈` the nonzero `2`-torsion
  element `4` is a square, so its image in `B_1` is zero; `B_1` is not the torsion subgroup.

### RS.4.9 The two-primary obstruction threshold

**`obstructionThreshold`.** For `b` in a finite abelian group `A` with `2`-primary exponent `2^e`,
define `t_A(b) = min{t ≥ 0 : the class of b lies in B_t}`. It lies between `0` and `e`, depends only
on the square class of `b`, and equals `max{e_j : b has an odd coordinate in a cyclic factor
C_{2^{e_j}}}` for any decomposition of the `2`-primary part into cyclic factors (the empty maximum
being `0`).

*Construction.* Exhaustion makes the minimum exist. Compute the torsion image factor by factor; the
odd-primary part is uniquely `2`-divisible and contributes nothing.

The API:

- `obstructionThreshold_zero`: `t_A(b) = 0` iff `b` is a square.
- `obstructionThreshold_class`: equal square classes have equal thresholds.
- `obstructionThreshold_bound`: `0 ≤ t_A(b) ≤ e`.
- `obstructionThreshold_cyclic`: for a generator of `C_{2^e}` with `e > 0`, `t_A(b) = e`.

*Needs:* RS.4.8, RS.4.4; Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `obstructionThreshold_test_1` (degenerate): `t_A(1) = 0`.
- `obstructionThreshold_test_2` (computation): in `C₄ × C₈`, `b = (generator, identity)` has threshold
  `2` and `b = (identity, generator)` has threshold `3`.
- `obstructionThreshold_test_3` (non-example): a generator of `C₈` has threshold `3`, not `1`, although
  its image spans the one-dimensional square quotient.

### RS.4.10 The two-adic criterion for fibre survival

Prove `two_adic_survival`: for odd `q > 1` prime to `|G|` and a compatible degree `m`, the fibre over
`(g, m)` has a fixed point iff `v₂(q − 1) ≥ t_A(b(g, m)) + 1`.

*Proof sketch.* Put `r = (q − 1)/2`, so `v₂(r) = v₂(q − 1) − 1`. The odd part of `r` contributes no
square classes, so the image of `A[r]` in `B` is `B_{v₂(r)}`, and by RS.4.4 the condition
`b^r ∈ A^(2r)` is `β ∈ B_{v₂(r)}`, that is `t_A(b) ≤ v₂(q − 1) − 1`. Combined with RS.4.3–RS.4.4
this is a statement about the finite abelian group `A` alone: the equation `h^(q−1) = b^r` has a
solution iff `v₂(q − 1) ≥ t_A(b) + 1`; the Lean file states it in this form. *Needs:* RS.4.5, RS.4.9,
RS.4.4.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `two_adic_survival_test_1` (a high threshold): for `A = C₈` and `b` a generator, `t_A(b) = 3`, so the
  fibre has fixed points exactly when `16 ∣ q − 1` (`q = 17` is the first prime that works).
- `two_adic_survival_test_2` (the smallest case): for `A = C₂` and `b` the generator, `t_A(b) = 1`;
  `q = 3` gives `h² = b`, with no solution, and `q = 5` gives `h⁴ = b² = 1`, solved by every `h`,
  matching `v₂(2) = 1 < 2 ≤ v₂(4)`.
- The parities of `odd_parity_fiber` and `even_parity_fiber` have threshold `0` and survive every
  allowed `q`.

### RS.4.11 Involution classes span the abelianization

Prove `involution_abelianization`: if `c` consists of `N` classes of involutions generating `G`, then
`Gᵃᵇ` is an elementary abelian `2`-group, and there is a surjective F₂-linear map
`a : F₂^N → Additive Gᵃᵇ` with `a(e_i) = [c_i]`.

*Proof sketch.* Every abelianized generator has order dividing two; extend on the free F₂-module and
use generation. The F₂-module structure on `Additive Gᵃᵇ` is `AddCommGroup.zmodModule` with the
identity `2 · u = 0`; the class map on binary coordinates keeps the basis values of InverseGalois's
`δ`. *Needs:* InverseGalois IG.3.4 *The class degree map*; Mathlib `Abelianization`,
`AddCommGroup.zmodModule`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `involution_abelianization_test` (onto but not injective): for `S₃` with `c` the transpositions,
  `N = 1` and `a : F₂ → C₂` is the identity; for `S₆` with `c` the transpositions and the triple
  transpositions, `N = 2` and `a(e₁ + e₂) = 0`, so `a` is onto but not injective.

### RS.4.12 Lift-square class columns

Prove `lift_square_columns`: in a central extension `E → G` with kernel `A`, the class in
`B = A/A²` of the square `X²` of a lift `X` of an involution `x` depends only on the conjugacy class
of `x`, not on the lift or on the representative. For the reduced cover and the classes `c_i` this
defines the columns `s_i = class(X_i²)`.

*Proof sketch.* A change of lift multiplies the square by the square of a central factor;
conjugation fixes the central lift square. *Needs:* RS.4.1; Tau Ceti
`TauCeti.elementaryTwoQuotientMk_mul`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `lift_square_columns_test`: changing `X_i` to `X_i k` with `k ∈ A` changes `X_i²` to `X_i² k²`, with
  the same class in `B`; and in `D₈ → C₂ × C₂` the columns of the rotation class and of a reflection
  class differ (nonzero and zero), so the column depends on the class.

### RS.4.13 The parity and lift-square maps

**`paritySquareMap`.** With `V = F₂^N`, the map `a : V → Additive Gᵃᵇ` of RS.4.11 and
`B = TauCeti.ElementaryTwoQuotient A`, define `s : V → B` by the lift-square columns,
`s(e_i) = s_i`, so `s(v) = Σ_i v_i · class(X_i²)`. Both maps are defined on the free vector space
only, never on `G` or `S_c`.

*Construction.* Prescribe basis values and use the universal property of the free vector space.
`X_i²` is read in the injected kernel through `GroupExtension` exactness before its image in
`TauCeti.ElementaryTwoQuotient A` is taken.

The API:

- `paritySquareMap_basis_s`: `s(e_i) = class(X_i²)`.
- `paritySquareMap_linear`: both maps are F₂-linear.
- `paritySquareMap_quotient`: `s` takes values in Tau Ceti's elementary-2 quotient of `A`.

*Needs:* RS.4.11, RS.4.12.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and
Remark 4.2, pp. 400–401.

**Checks.**

- `paritySquareMap_test_1` (degenerate): `a(0) = 0` and `s(0) = 0`.
- `paritySquareMap_test_2` (computation): for `S₃` with `c` the transpositions and its identity reduced
  cover, `V = F₂`, `Additive Gᵃᵇ ≅ F₂`, `a = id`, `B = 0` and `s = 0`.
- `paritySquareMap_test_3` (non-example): for distinct classes with the same abelianized image,
  `a(e₁ + e₂) = 0` although `e₁ + e₂ ≠ 0`; in `S₆` the class of a transposition and the class of three
  disjoint transpositions are such a pair (different cycle types, both odd).

### RS.4.14 Compatible parities and their obstruction

Prove `affine_compatible_parities`: put `v_g = 0` for `g = 1` and `v_g = e_k` for `g ∈ c_k`. For an
integer degree `m` let `ε(m) ∈ V` be its reduction modulo two. Then the compatible parities are
exactly `v_g + ker a`, that is `δ(m) = [g]` iff `ε(m) ∈ v_g + ker a`, and `β(g, m) = s(v_g + ε(m))`.

*Proof sketch.* Compatibility is `a(ε) = a(v_g)`, and over F₂ subtraction is addition. In `B`,
`β = class(Y²) + Σ_i m_i s_i`, and `class(Y²) = s_k = s(v_g)` for `g ∈ c_k` by RS.4.12. The
statement uses the actual degree-to-abelianization map and the actual marked square columns of the
extension; each chosen representative must lie in its indexed class. *Needs:* RS.4.13, RS.4.2.

*Source.* Derived from Wood's fixed-fibre equation in *Nonabelian Cohen–Lenstra moments* (2019),
§4.1, Proposition 4.1 and equation (6), pp. 400–401, by the square-class and finite-vector-space
arguments above. The affine-kernel and histogram formulas of RS.4.14–RS.4.19 are consequences
developed here, not separately numbered results of that paper.

**Checks.**

- `affine_compatible_parities_test` (a coset, not the kernel): for `G = S₃`, `c` the transpositions
  and `g` a transposition, `v_g = e₁` and the compatible parities are `{e₁} = v_g + ker a`, not
  `ker a = {0}`.

### RS.4.15 The joint parity constraint map

**`jointParityMap`.** Put `U_ab = Additive Gᵃᵇ` with its F₂-structure. For `t ≥ 0` define the linear
map `L_t : V → U_ab × (B/B_t)`, `v ↦ (a(v), s(v) mod B_t)`. Its kernel consists of the parities
compatible with the identity whose square obstruction lies in `B_t`.

*Construction.* Compose `s` with the quotient map and pair with `a`.

The API:

- `jointParityMap_apply`: `L_t(v) = (a(v), class of s(v) in B/B_t)`.
- `jointParityMap_kernel`: `v ∈ ker L_t` iff `a(v) = 0` and `s(v) ∈ B_t`.
- `jointParityMap_mono_kernel`: `t ≤ u` gives `ker L_t ⊆ ker L_u`.
- `jointParityMap_last`: at `t = e`, `ker L_e = ker a`.

*Needs:* RS.4.13, RS.4.8.

*Source.* As for RS.4.14.

**Checks.**

- `jointParityMap_test_1` (degenerate): `L_t(0) = 0`.
- `jointParityMap_test_2` (computation): for `a = 0` and `s = id` on `F₂`, `ker L_t = 0` when
  `B_t = 0` and `ker L_t = F₂` when `B_t = B`.
- `jointParityMap_test_3` (non-example): using `a` alone misses the obstruction in the first of those
  cases.

### RS.4.16 Surviving parities form an affine kernel coset

Prove `surviving_parities`: if `v₂(q − 1) = t + 1`, the parities of degrees whose fibre over
`(g, m)` has a fixed point are exactly `C_t^g = v_g + ker L_t`, and each such compatible fibre has
`|A[q − 1]|` fixed points.

*Proof sketch.* A parity `ε = v_g + w` is compatible iff `w ∈ ker a`, and then
`β = s(v_g + ε) = s(w)` since `2v_g = 0`; by RS.4.10 the fibre survives iff `β ∈ B_t`, that is
`w ∈ ker L_t`. The statement uses InverseGalois's class map `a` and the lift-square map of the
marked extension; it holds for the reduced-cover model, where `A` is the reduced multiplier, and
for any finite central marked model. The conditions are `q > 1`, `q` odd and `q` prime to a common
exponent of the cover and `G`; no upper bound on `q` is needed. *Needs:* RS.4.15, RS.4.14, RS.4.10.

*Source.* As for RS.4.14.

**Checks.**

- `surviving_parities_test` (the threshold moves the coset): with `a = 0`, `s = id` on `V = F₂` and
  `B = F₂` (so `B_0 = 0` and `B_1 = B`, as for `A = C₂`): for `t = 0` (`q ≡ 3 mod 4`) the surviving
  parities for `g = 1` are `{0}`, and for `t = 1` (`q ≡ 5 mod 8`) they are all of `F₂`. Lower bounds
  and total degree are not hypotheses here; they enter the counts of RS.4.17–RS.4.18.

### RS.4.17 Ranks count surviving parities

Prove `rank_parity_count`: `|C_t^g| = 2^(N − rank L_t)`. With `K_t = 2^(N − rank L_t)` and
`K_{−1} = 0`, the number of compatible parities of exact threshold `t` is `K_t − K_{t−1}`. The cosets
for `g = 1` and for `g ∈ c` have the same cardinality, though not in general the same weight
enumerator (RS.4.18).

*Proof sketch.* Translation preserves cardinality; use rank–nullity and the cardinality of a finite
F₂-space. For `t = 0` the exact-threshold set is the translated kernel of `L_0`; for `t > 0` it is the
translated kernel of `L_t` minus that of `L_{t−1}`, and on a compatible fibre this is the condition
`t_A(β(g, m)) = t`. The kernels are nested because `B_{t−1} ⊆ B_t`, so natural-number subtraction
gives the histogram. *Needs:* RS.4.16; Mathlib `LinearMap.finrank_range_add_finrank_ker`,
`Module.card_eq_pow_finrank`.

*Source.* As for RS.4.14.

**Checks.**

- `rank_parity_count_test` (equal sizes, different enumerators): for `N = 2` and
  `ker L_t = {0, e₁ + e₂}`, the coset `{0, e₁ + e₂}` for `g = 1` and the coset `{e₁, e₂}` for
  `v_g = e₁` both have `2 = 2^(2−1)` elements, but (with `N₀ = 0`) weight enumerators `1 + X²` and
  `2X`.

### RS.4.18 The weight enumerator of a surviving parity coset

**`parityWeightEnumerator`.** For `C ⊆ F₂^N` and a lower bound `N₀ ≥ 0`, put `δ₀ = N₀ mod 2` and
`W(X) = Σ_{ε ∈ C} X^{wt(ε + δ₀·𝟙)} ∈ ℕ[X]`. The exponent is the excess, above the coordinate lower
bound, of the least degree of parity `ε` with every coordinate at least `N₀`: a coordinate of the
parity of `N₀` contributes `0`, the other parity `1`.

*Construction.* A finite sum of monomials. The associated counting series is
`X^{N·N₀} · W(X)/(1 − X²)^N`; no Tauberian theorem or limit is built here.

The API:

- `parityWeightEnumerator_coefficient`: the coefficient of `X^j` is the number of `ε ∈ C` with
  `wt(ε + δ₀·𝟙) = j`.
- `parityWeightEnumerator_at_one`: `W(1) = |C|`.
- `parityWeightEnumerator_translation`: changing the parity of `N₀` translates the weight argument,
  not the coset `C`.

*Needs:* RS.4.16.

*Source.* As for RS.4.14.

**Checks.**

- `parityWeightEnumerator_test_1` (degenerate): for `N = 0` and the one-point coset, `W = 1`.
- `parityWeightEnumerator_test_2` (computation): for `N = 1` and `N₀ = 0`, `C = {0}` gives `1` and
  `C = {1}` gives `X`.
- `parityWeightEnumerator_test_3` (non-example): those two cosets have the same cardinality but
  different enumerators, so signature counts are not determined by cardinality alone.

### RS.4.19 Independent class images remove the obstruction

Prove `independent_classes`: if the `N` class images `[x_d]` in `Additive Gᵃᵇ` are F₂-linearly
independent, then `a` is an isomorphism, each signature `g` has the single compatible parity
`v_g`, `β = 0`, and every compatible fibre has `|A[q − 1]|` fixed points for every allowed `q`.

*Proof sketch.* Surjectivity (RS.4.11) and independence make `a` bijective, so compatibility is
`ε(m) = v_g`, and then `β = s(2v_g) = s(0) = 0`. Generation, valid class representatives, finiteness
of `A` and the common-exponent hypothesis stay explicit; independence replaces none of them.
*Needs:* RS.4.13, RS.4.14, RS.4.16.

*Source.* As for RS.4.14.

**Checks.**

- `independent_classes_test` (when it applies): for `G = C₂ × C₂` with `c` its three nonidentity
  elements, the three class images are dependent in `F₂²`, so the criterion does not apply; for
  `G = C₂` with `c` its nonidentity element it applies with `N = 1`, whatever `A` is.

### Examples

- For `G = S₃` (one involution class, `A = 0`) every compatible fibre has exactly one fixed point
  for every odd `q` prime to `6`, and the surviving parities are `v_g + ker a = {v_g}`.
- For a reduced multiplier `A = C₈` with one column `s₁` the class of a generator (an algebraic
  fixture), a fibre whose square obstruction is the class of a generator has threshold `3`, so it
  has fixed points exactly when `16` divides `q − 1`.

### Dependencies

Layer RS.3 (the counting slices) and InverseGalois IG.3.4–IG.3.5 (reduced covers, the class degree
map, the marked fibre product and the unit action); Tau Ceti `TauCeti.ElementaryTwoQuotient`;
Mathlib finite abelian groups and finite-dimensional linear algebra over `ZMod 2`.

## Layer RS.6: Certified finite examples

A finite central surjection gives a reduced multiplier only together with a proof that it is a Schur
cover; the certificate of RS.6.4 records exactly the data needed. The layer proves an index-two
reduction and a closed formula for the anti-diagonal models, which together settle nineteen of the
thirty-one rows of Wood's Table 2, and states the remaining rows as certification targets on
explicit marked groups.

### RS.6.1 Odd-index-two homology reduction

Prove `schurRelations_eq_bot_of_coprime`: for a finite group `G` and a conjugacy-invariant `c` such
that the order of every `x ∈ c` is prime to `|M(G)|`, `Q_c = 0` and `M(G, c) = M(G)`.

Prove `odd_index_two_reduction`: for a normal subgroup `H` of a finite group `G` with `|H|` odd and
`[G : H] = 2`, corestriction induces `M(H)_{C₂} ≅ M(G)`, so `M(G)` has odd order, and for every set
`c` of elements of order at most two, `Q_c = 0` and `M(G, c) = M(G)`.

*Proof sketch.* For `x ∈ c` and `y ∈ C_G(x)`, `ord(x) · ⟨x, y⟩ = ⟨x^{ord(x)}, y⟩ = 0`
(`commutator_order`, RS.1.1), and `|M(G)| · ⟨x, y⟩ = 0`; coprimality gives `⟨x, y⟩ = 0`. For the
index-two case, `H` is a normal Hall subgroup with quotient `C₂`, and an involution outside `H`
spans a complement: for `g ∉ H`, `g² ∈ H` has odd order `k`, so `g^k` is an involution outside
`H`. By RS.0.5 corestriction gives `M(H)_{C₂} ≅ M(G)_odd`, and by InverseGalois
IG.3.4 (*Coprime semidirect products and admissible inertia*, items 1–2) `M(G)_2 ≅ M(C₂) = 0`; so
`M(G) = M(H)_{C₂}` has odd order, and the first statement applies to elements of order at most two.
The Hochschild–Serre argument of the source gives the same: positive `C₂`-homology of the odd-order
modules `H_q(H, ℤ)` vanishes, `H₂(C₂, ℤ) = 0`, and the only possible `d³` into the `(0, 2)` term
starts from a `2`-primary group. The isomorphism is the coinvariant map of RS.0.5, which
identifies the map as well as the two groups. *Needs:* RS.1.1, RS.0.5; InverseGalois IG.3.4 *The
reduced Schur multiplier*, *Coprime semidirect products and admissible inertia*; Mathlib
`Rep.FiniteCyclicGroup.groupHomologyIsoEven` (`M(C₂) = 0`),
`Subgroup.exists_right_complement'_of_coprime`.

*Source.* Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the
Cohen–Lenstra conjecture over function fields, II* (2012, withdrawn preprint), Example 9.3.2, arXiv
v1 p. 57.

**Checks.**

- `odd_index_two_reduction_test_1` (odd order of `H` is needed): for `G = C₂ × C₂` and `H = C₂ × 1`
  the conclusion fails: `M(G) ≅ C₂`, and for `c` the three nonidentity elements `Q_c = M(G) ≠ 0`.
- `odd_index_two_reduction_test_2` (computation): for `G = (C₃ × C₃) ⋊ C₂` with inversion,
  `M(G) ≅ M(C₃²)_{C₂} ≅ C₃` (inversion acts on `Λ²(C₃²)` by `(−1)² = 1`), and `Q_c = 0` for `c` the
  involutions.
- `schurRelations_eq_bot_of_coprime_test` (the coprimality hypothesis): for `G = C₂ × C₂` and `c` its
  three involutions, `|M(G)| = 2` is not prime to `2` and `Q_c = M(G)`; for `G = C₃ × C₃ × C₂`
  (`M(G) ≅ C₃` by the Künneth formula) and `c = {(0, t)}`, its unique involution, the order `2` is
  prime to `3` and `Q_c = 0`.

### RS.6.2 Lift commutators define a homomorphism on the centraliser

Prove `centralizer_commutator_hom`: in a central extension `E → G` and for any fixed `x ∈ G`, the
commutator of lifts `κ_E(x, −) : C_G(x) → A` (InverseGalois's `ReducedSchur.liftCommutator`) is a
group homomorphism.

*Proof sketch.* For lifts `X`, `Y`, `Z` of `x`, `y`, `z ∈ C_G(x)`, expand `⁅X, YZ⁆ = ⁅X, Y⁆ · Y⁅X, Z⁆Y⁻¹`;
the second commutator is central, so conjugation by `Y` fixes it. *Needs:* InverseGalois IG.3.4
*Commutators of lifts and the class map of a central extension*.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3, p. 387.

**Checks.**

- `centralizer_commutator_hom_test` (computation, and the centraliser is needed): for
  `D₈ → C₂ × C₂` and `x` the image of the rotation, `κ(x, −)` is the homomorphism `C₂ × C₂ → C₂`
  that kills `x` and is nonzero on the other two nonidentity elements. In `S₃` (the identity
  extension, trivial kernel), the transpositions `(12)` and `(23)` do not commute, and their
  commutator `(132)` is not in the kernel; `κ(x, −)` is defined only on the centraliser.

### RS.6.3 Centraliser generators suffice for the relations

Prove `centralizer_generator_relations`: for a central extension `E → G` and a conjugacy-invariant
`c`, the subgroup of `A` generated by all `κ_E(x, y)` with `x ∈ c` and `y ∈ C_G(x)` equals the
subgroup generated by the `κ_E(x_d, y)` for one representative `x_d` of each class `d ∈ D` and `y`
running over any generating set of `C_G(x_d)`.

*Proof sketch.* At fixed `x` the map `κ_E(x, −)` is a homomorphism (RS.6.2), so its values on a
generating set generate its image. Conjugation by a lift of `g` fixes central elements, so
`κ_E(gxg⁻¹, gyg⁻¹) = κ_E(x, y)` and one representative per class suffices. *Needs:* RS.6.2;
InverseGalois IG.3.4 *Commutators of lifts and the class map of a central extension*.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3, p. 387.

**Checks.**

- `centralizer_generator_relations_test` (generators of the centraliser, not of `G`): for
  `D₈ → C₂ × C₂` with `c` the image of the rotation, the centraliser is all of `C₂ × C₂` and the
  generators `{x, y}` give the relation `κ(x, y) = r²`; for `S₃` and `c` the transpositions, the
  generators `(12)`, `(23)` of `S₃` do not lie in `C_{S₃}((12)) = {1, (12)}`, and using them would
  produce elements outside the kernel.

### RS.6.4 Finite reduced-cover certificate

**`ReductionCertificate`.** A certificate for explicit finite groups `E`, `G` and a map
`π : E → G` consists of:

- enumerations `E ≃ Fin |E|` and `G ≃ Fin |G|`, with multiplication, inverse and projection tables
  transported from these groups and their laws proved;
- a proof that `π` is a surjective homomorphism with central kernel;
- an independently checked Schur-cover certificate: the stem property and `|ker π| = |M(G)|`, which
  by InverseGalois's comparison (*Reduced Schur covers*) makes `τ_E : M(G) ≅ ker π` an isomorphism,
  evaluating every commuting pair as `XYX⁻¹Y⁻¹`;
- representatives `x_d` of the classes of `c` and, for each, a finite set of generators of the actual
  centraliser `C_G(x_d)`;
- the subgroup `R ⊆ ker π` generated by the lift commutators `κ_E(x_d, y)` of those generators.

Its conclusion identifies `A = ker π / R` with `M(G, c)`: by RS.6.3, `R` is the image `τ_E(Q_c)`,
and the quotient equivalence sends the reduced class of an integral class `z` to the class of
`τ_E(z)`. Transport along group isomorphisms must preserve `π` and `c`; transport to an arithmetic
type also keeps its ambient embedding, which ArithmeticStatistics, ST.3, supplies. The
class-compatible marking of the reduced cover keeps the selected representative lifts, and these
choices give the lift-square columns of the parity computation (RS.4.13).

*Construction.* Check the finite tables, the maps, centrality, the generating sets, the subgroup
closure and the quotient cardinality; invoke the separately certified Schur-cover property before
identifying the kernel with homology.

The API:

- `reductionCertificate_tables`: group operations and `π` are finite executable data with checked
  associativity and homomorphism laws.
- `reductionCertificate_relations`: the checked subgroup `R` is exactly `τ_E(Q_c)`.
- `reductionCertificate_quotient`: `A ≅ M(G, c)`, available only after the Schur-cover certification.
- `reductionCertificate_transport`: an explicit marked isomorphism transports the certificate to the
  selected embedded arithmetic type.

*Needs:* RS.6.3; InverseGalois IG.3.4 *Reduced Schur covers* (the Schur-cover property being
certified, and the reduced cover), *Conjugacy classes lift bijectively* (the marking).

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3, p. 387; Table 2, p. 419; the
opening of the Appendix, p. 420.

**Checks.**

- `reductionCertificate_test_1` (degenerate): for `G = E = 1` and `c` empty, `R` and `A` are trivial.
- `reductionCertificate_test_2` (computation): for `D₈ → C₂ × C₂` with `c` the three nonidentity
  elements, one central commutator `r²` generates `ker π` and `A = 1`.
- `reductionCertificate_test_3` (non-example): the central surjection `C₄ → C₂` has kernel of order
  two but is not a Schur cover of `C₂` (`M(C₂) = 0`, and the kernel is not in `[C₄, C₄] = 1`); a
  checker must reject the identification `A = M(C₂, c)`.

### RS.6.5 Finite reduced-cover parity algorithm

**`finiteParityAlgorithm`.** Given a checked reduction certificate for a group `G` generated by a
class `c` of involutions, a homomorphism `π₀ : G → C₂` and a chosen `τ ∈ c` with `π₀(τ) ≠ 1`, compute
the class columns `a` and `s` (RS.4.13), the torsion-image spaces `B_t` (RS.4.8), both cosets
`C_t^1` and `C_t^τ` (RS.4.16), their ranks, the exact-threshold histograms (RS.4.17) and the
lower-bound weight enumerators (RS.4.18). The algorithm is finite and exact, conditional on the
certified Schur cover and the explicit marked embedding.

*Construction.* Build the reduced quotient group from the certificate, then use finite linear algebra
over F₂ and finite polynomial enumeration. For each threshold `t` and signature `g`, enumerate the
finite parity space and keep exactly the `v` with `L_t(v + v_g) = 0`; the class and square columns
come from the certified reduced marked model, so the membership test is degree compatibility
together with the actual square obstruction lying in `B_t`. The histogram at `t = 0` is the first
coset cardinality, and at `t > 0` the difference with the preceding one. For a lower bound `N₀` the
weight polynomial counts each surviving `v` with exponent the number of nonzero coordinates of
`v + (N₀ mod 2)·𝟙`. An executable implementation supplies decidable table representations of the
quotients and of the filtration, together with the logical specification of the finite enumeration.
The rank identities of RS.4.17 give independent cross-checks.

The API:

- `finiteParityAlgorithm_obstruction`: the computed column map equals the lift-square map in Tau
  Ceti's elementary-2 quotient.
- `finiteParityAlgorithm_cosets`: the computed surviving parities are exactly `v_g + ker L_t`.
- `finiteParityAlgorithm_counts`: the computed cardinalities are `2^(N − rank L_t)` and their
  histogram differences.
- `finiteParityAlgorithm_weights`: the output polynomial is the exact finite weight sum, not an
  asymptotic estimate.

*Needs:* RS.6.4, RS.4.15, RS.4.17, RS.4.18.

*Source.* Derived from Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1,
equation (6) and Remark 4.2, pp. 400–401, together with the finite linear algebra of Layer RS.4;
the certified-cover input uses §2.3, p. 387, and the marked examples use Table 2, p. 419, and the
opening of the Appendix, p. 420.

**Checks.**

- `finiteParityAlgorithm_test_1` (computation): for `S₃` with `c` the transpositions, `a = id` on F₂,
  `A = 0`, and each signature has one parity, of threshold `0`.
- `finiteParityAlgorithm_test_2` (degenerate): for trivial `A` every compatible parity survives every
  odd `q`.
- `finiteParityAlgorithm_test_3` (non-example): for the algebraic fixture `A = C₈` with one column the
  class of a generator, survival first occurs at `v₂(q − 1) = 4`; this fixture is not claimed to be an
  admissible arithmetic type.

### RS.6.6 The order-96 A₄ arithmetic type

**`order96Type`.** Let `ab : A₄ → C₃` be the abelianization map. Put
`K = ker((a, b) ↦ ab(a) + ab(b)) ⊆ A₄ × A₄` and `F = K ⋊ C₂`, the involution swapping the two
factors. Then `|K| = 48` and `|F| = 96`. The marked group is `F` with its explicit embedding
`F ⊆ A₄ ≀ C₂` and `c` its outside involutions, rather than an unmarked abstract SmallGroups label.

*Construction.* The sum map `A₄ × A₄ → C₃` is onto and preserved by the swap; form its kernel and the
restricted semidirect product. The abelianization is a surjection `A₄ → C₃` with kernel `[A₄, A₄]`,
used on both coordinates; multiplicatively the kernel condition is `ab(a) ab(b) = 1`. Swapping
coordinates is an automorphism of the kernel and gives the `C₂`-action. The homomorphism into
`(A₄ × A₄) ⋊ C₂` keeps both coordinates and the swap coordinate and is injective. The
outside-involution set uses the projection to `C₂`, not a cardinality test or an abstract group
identifier. The enumeration of embedded types is made in ArithmeticStatistics, ST.3.

The API:

- `order96Type_kernel`: `K` consists exactly of the pairs with `ab(a) + ab(b) = 0`.
- `order96Type_swap`: the swap preserves `K` and squares to the identity.
- `order96Type_order`: `|K| = 48` and `|F| = 96`.
- `order96Type_outside`: the quotient `F → C₂` is the swap coordinate, and `c` is its set of outside
  involutions.

*Needs:* Mathlib `alternatingGroup`, `Abelianization`, `SemidirectProduct`, `MulEquiv.prodComm`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), the opening of the Appendix, p. 420.

**Checks.**

- `order96Type_test_1` (computation): a pair of 3-cycles with abelianized values `1` and `2` lies in
  `K`.
- `order96Type_test_2` (non-example): a pair with values `1` and `1` does not; the difference in place
  of the sum would define another kernel.
- `order96Type_test_3` (compatibility): the outside element `((1, 1), swap)` has order two and
  projects nontrivially.

### RS.6.7 Reduced multiplier of the order-96 type

Prove `order96_reduced_multiplier`: for the order-96 type `F` of RS.6.6 with `c` its outside
involutions, `M(F, c) ≅ C₂`, the value of Wood's Table 2, row 8. The proof builds an explicit Schur
cover with its oriented kernel identification, computes the relation subgroup from centraliser
generators (RS.6.3) and certifies the quotient (RS.6.4). An unverified machine computation suggests
`M(F) ≅ C₂³` with a relation subgroup of order four; certifying both is part of the target.

*Proof sketch.* A complete certificate establishes the cover-kernel class isomorphism, the outside
`c` and its centraliser-generated relations, and then that the quotient kernel is cyclic of order
two. *Needs:* RS.6.6, RS.6.4.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3, p. 387; Table 2, p. 419; the
opening of the Appendix, p. 420.

**Checks.**

- `order96_reduced_multiplier_test` (consistency): the value agrees with the sum-kernel model of
  RS.6.9 for `G = A₄`, whose order is `2 · 12 · 4 = 96`; no moment limit or type enumeration follows
  from this multiplier value.

### RS.6.8 The anti-diagonal model for abelian base groups

**`antidiagonalModel`.** For an abelian group G let W(G) = (G × G) ⋊ C₂, the nonidentity element of
C₂ swapping the two factors, and let F(G) ≤ W(G) be the subgroup of elements ((a, a⁻¹), t) with a ∈
G and t ∈ C₂. Its quotient map ρ : F(G) → C₂ is the restriction of the projection of W(G), and its
marking is c(G) = {x ∈ F(G) : ρ(x) ≠ 1}. Every element of c(G) is an involution: ((a,a⁻¹),t)² =
((a,a⁻¹)(a⁻¹,a), 1) = 1. The coordinate map (a, t) ↦ ((a,a⁻¹), t) identifies F(G) with G ⋊ C₂, the
nonidentity element acting by inversion on G (not by the swap), so for G = C_n it is the dihedral
group of order 2n.

The API:

- `antidiagonalModel_mem`: ((a,b),t) ∈ F(G) iff b = a⁻¹.
- `antidiagonalModel_card`: |F(G)| = 2|G| for finite G.
- `antidiagonalModel_outside`: x ∈ c(G) iff ρ(x) ≠ 1, and then x² = 1.
- `antidiagonalModel_dihedral`: for G = ZMod n, an isomorphism F(G) ≃\* DihedralGroup n carrying c(G)
  onto the reflections.

*Construction.* Define the swap action `swapAction G : C₂ →* MulAut (G × G)` through
`MulEquiv.prodComm`, form `SwapWreath G = (G × G) ⋊ C₂`, and take F(G) to be the kernel of ((a,b),t)
↦ ab, a homomorphism because G is commutative. This is the sum-kernel model of RS.6.9 for abelian G,
and the Lean file states it as `sumKernelModel G`; the marking is `outsideInvolutions`. *Needs:*
Mathlib `SemidirectProduct`, `MulEquiv.prodComm`, `DihedralGroup`, `MonoidHom.range`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), introduction, printed pp. 378–379, for
the admissibility conditions and this model for abelian groups; §8.2, Table 2, p. 419.

**Checks.**

- `antidiagonalModel_test_1` (membership): in W(C₃), ((1,2),t) ∈ F(C₃) for both t (additive
  residues), but the diagonal pair ((1,1),1) is not in F(C₃).
- `antidiagonalModel_test_2` (marking): the pure swap ((0,0),t) with t ≠ 1 lies in c(G), and the
  identity does not.
- `antidiagonalModel_test_3` (dihedral): F(C₃) is the dihedral group of order 6 (≅ S₃), with c the
  three reflections.

Prove `antidiagonal_marking`: for every abelian G, c(G) generates F(G) (the product of two outside
elements ((a,a⁻¹),t)((b,b⁻¹),t) is ((ab⁻¹,(ab⁻¹)⁻¹),1)), and for finite G of odd order c(G) is a
single conjugacy class: conjugating ((a,a⁻¹),t) by ((b,b⁻¹),1) gives ((ab²,(ab²)⁻¹),t), and squaring
is bijective on G. For G = C₂ the one-class statement fails: F(C₂) ≅ C₂ × C₂ is abelian and c(C₂)
consists of two classes.

Prove `antidiagonal_reduced_multiplier`: for finite abelian G of odd order,

```text
M(F(G), c(G)) = M(F(G)) ≅ M(G) ≅ Λ²G,
```

where Λ²G is the exterior square of the ℤ-module G. Concretely, for G = ⊕ᵢ C_{nᵢ} the multiplier is
⊕_{i<j} C_{gcd(nᵢ,nⱼ)}.

*Proof sketch.* The kernel of ρ is G, of odd order, so RS.6.1 gives M(F,c) = M(F) ≅ M(G)_{C₂}, where
C₂ acts through inversion on G. The Künneth formula gives M(A × B) ≅ M(A) ⊕ M(B) ⊕ (A ⊗ B) for
abelian A, B, and M(C_n) = 0, so M(G) ≅ Λ²G naturally in G; inversion acts on Λ²G by (−1)·(−1) = 1,
so the coinvariants are all of M(G). *Needs:* RS.6.1, RS.0.5; Mathlib
`Rep.FiniteCyclicGroup.groupHomologyIsoEven` (M(C_n) = 0); the degree-two Künneth formula M(A × B) ≅
M(A) ⊕ M(B) ⊕ (A ⊗ B), which Mathlib lacks at the pin and which is proved as part of this target.

*Source.* Löh, *Group Cohomology*, Corollary 3.2.23 (Künneth theorem for group homology), p. 136,
and Corollary 1.6.13 (homology of finite cyclic groups), p. 49; Ellenberg–Venkatesh–Westerland,
Example 9.3.2 (arXiv v1, p. 57), for the index-two reduction in this setting.

**Checks.**

- `antidiagonal_reduced_multiplier_test_1` (cyclic): for G = C_n with n odd, M(F,c) = 0; this is
  rows 1–4, 6, 9–12, 14–15, 18, 20 and 26–27 of Wood's Table 2.
- `antidiagonal_reduced_multiplier_test_2` (rank two): for G = C₃², C₅², C₉ × C₃ the values are C₃,
  C₅, C₃ (rows 5, 19, 21).
- `antidiagonal_reduced_multiplier_test_3` (rank three): for G = C₃³ the value is C₃³ (row 25); a
  formula using M(G) ⊗ ℤ/2 or the coinvariants of the inversion action on G itself would give 0.

### RS.6.9 Sum-kernel, graph and full wreath models

These constructions realise the nonabelian rows. For any group G, W(G) = (G × G) ⋊ C₂ with the swap
action as in RS.6.8.

**`sumKernelModel`.** The map W(G) → Gᵃᵇ, ((a,b),t) ↦ [a][b], is a homomorphism (the target is
commutative, so the swap does not change [a][b]). Its kernel is `sumKernelModel G`, with quotient
map to C₂ the restriction of the projection of W(G), and marking its outside involutions. For finite
G, |sumKernelModel G| = 2|G||[G,G]|, because the map is onto with fibres of size |G|²/|Gᵃᵇ|.
Membership is [b] = [a]⁻¹ in Gᵃᵇ; an outside element ((a,b),t) is an involution iff b = a⁻¹ in G.
When G is perfect, `sumKernelModel G` is all of W(G) (the *full wreath model*).

**`graphModel`.** For an involutive automorphism θ of G, let G ⋊_θ C₂ act through θ, and embed it in
W(G) by (g, t) ↦ ((g, θ(g)), t); involutivity makes this a homomorphism, and it is injective. Its
outside involutions are the elements (g, t) with t ≠ 1 and θ(g) = g⁻¹. For finite G it has order
2|G|.

The API:

- `sumKernelModel_mem`, `sumKernelModel_card`, `sumKernelModel_outside`,
  `sumKernelModel_eq_top_of_perfect` (G = [G,G] gives the whole of W(G));
- `graphModel_embedding_apply`, `graphModel_embedding_injective`, `graphModel_card`,
  `graphModel_outside`.

*Needs:* Mathlib `SemidirectProduct`, `SemidirectProduct.lift`, `Abelianization`, `commutator`,
`MulAut`, `MonoidHom.ker`. In the Lean file the map W(G) → Gᵃᵇ is built from `abelianizedSum G`.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), Appendix opening, p. 420 (the sum
condition), and §8.2, Table 2, p. 419.

**Checks.**

- `sumKernelModel_test_1` (sum, not difference): in W(C₃) the pair ((1,2),1) (additive residues)
  lies in the sum kernel and ((1,1),1) does not.
- `sumKernelModel_test_2` (orders): |sumKernelModel A₄| = 2·12·4 = 96 (row 8, equal to the type of
  RS.6.6), |sumKernelModel SL₂(𝔽₃)| = 2·24·8 = 384 (row 17), and for G = C₇ ⋊ C₃ the order is 2·21·7 =
  294 (row 13).
- `sumKernelModel_test_3` (perfect): for G = A₅ the sum kernel is all of W(A₅), of order 7200 (row
  29).
- `graphModel_test_1` (symmetric groups): for G = A_n (n = 4, 5) and θ conjugation by a
  transposition τ, G ⋊_θ C₂ ≅ S_n through (a, t) ↦ aτ^t, and the outside involutions are the
  transpositions (rows 7 and 28).
- `graphModel_test_2` (GL₂(𝔽₃)): for G = SL₂(𝔽₃) and θ conjugation by diag(−1,1), the graph model is
  GL₂(𝔽₃), of order 48, and its outside involutions are the 12 conjugates of diag(−1,1) (row 16).
- `graphModel_test_3` (inverse transpose): for G = SL₃(𝔽₂) and θ(g) = (g⁻¹)ᵀ, the graph model has
  order 336 (row 30); transpose alone reverses products and is not an automorphism.

### RS.6.10 The table of reduced multipliers

For each row k of Wood's Table 2 (§8.2, p. 419), prove `table_row_k`: for the marked group (F_k,
c_k) listed below, with c_k its outside involutions, M(F_k, c_k) is the listed group. The abelian
rows follow from RS.6.8; each other row is proved by a certificate (RS.6.4) for the listed model, or
for the odd rows 13, 22–24 also through RS.6.1. That the listed model is the embedded type selected
in the source is checked where the types are enumerated (ArithmeticStatistics, ST.3). Wood's table
lists only types in which c_k is a single conjugacy class of F_k; for the abelian rows this is
`antidiagonal_marking` (RS.6.8), and for the other rows it is part of the certificate.

| Row | G | Marked group F | M(F, c) |
| --- | --- | --- | --- |
| 1, 2, 3, 4 | C₃, C₅, C₇, C₉ | F(G) (RS.6.8): D₆, D₁₀, D₁₄, D₁₈ | 1 |
| 5 | C₃² | F(C₃²) | C₃ |
| 6, 9, 10, 11, 12 | C₁₁, C₁₃, C₁₅, C₁₇, C₁₉ | F(G): D₂₂, D₂₆, D₃₀, D₃₄, D₃₈ | 1 |
| 7 | A₄ | graph model, ≅ S₄ | 1 |
| 8 | A₄ | sum-kernel model, order 96 (RS.6.6) | C₂ |
| 13 | C₇ ⋊ C₃ | sum-kernel model, order 294 | 1 |
| 14, 15 | C₂₁, C₂₃ | F(G): D₄₂, D₄₆ | 1 |
| 16 | SL₂(𝔽₃) | graph model, ≅ GL₂(𝔽₃) | 1 |
| 17 | SL₂(𝔽₃) | sum-kernel model, order 384 | 1 |
| 18 | C₂₅ | F(C₂₅) = D₅₀ | 1 |
| 19 | C₅² | F(C₅²) | C₅ |
| 20 | C₂₇ | F(C₂₇) = D₅₄ | 1 |
| 21 | C₉ × C₃ | F(C₉ × C₃) | C₃ |
| 22 | Heisenberg group of order 27 | graph model for (a,b,z) ↦ (−a,−b,z), order 54 | 1 |
| 23 | Heisenberg group of order 27 | sum-kernel model, order 162 | C₃² |
| 24 | C₉ ⋊ C₃ | sum-kernel model, order 162 | 1 |
| 25 | C₃³ | F(C₃³) | C₃³ |
| 26, 27 | C₂₉, C₃₁ | F(G): D₅₈, D₆₂ | 1 |
| 28 | A₅ | graph model, ≅ S₅ | 1 |
| 29 | A₅ | full wreath model A₅ ≀ C₂ | C₂ |
| 30 | SL₃(𝔽₂) ≅ PSL₃(𝔽₂) | graph model for inverse transpose, order 336 | 1 |
| 31 | SL₃(𝔽₂) | full wreath model, order 56 448 | C₂ |

Here D_{2n} denotes the dihedral group of order 2n, the Heisenberg group is the upper unitriangular
subgroup of SL₃(𝔽₃) with coordinates (a, b, z) and product (a,b,z)(a′,b′,z′) = (a+a′, b+b′,
z+z′+ab′), and C₇ ⋊ C₃, C₉ ⋊ C₃ are the nonabelian groups of orders 21 and 27 with a cyclic normal
subgroup of index three (generated by x ↦ x+1 and x ↦ 2x on ℤ/7, respectively x ↦ x+1 and x ↦ 4x on
ℤ/9).

*Needs:* RS.6.4, RS.6.6–RS.6.9; for rows 13 and 22–24 also RS.6.1.

*Source.* Wood, *Nonabelian Cohen–Lenstra moments* (2019), §8.2, Table 2, p. 419, and the Appendix
opening, p. 420.

**Checks.**

- The values for the abelian rows agree with RS.6.8 (`antidiagonal_reduced_multiplier_test_1` to
  `_3`): a certificate that disagrees with Λ²G for these rows is wrong.
- Row 8 agrees with RS.6.7.
- The values of rows 29 and 31 (C₂) are nonzero although the bases are perfect: a rule "perfect base
  ⇒ trivial reduced multiplier" is false.

### Examples

- For the symmetric group `S₃` with `c` the transpositions (row 1), `M(S₃) = 0`, the identity is a
  Schur cover, the reduced cover is `S₃` itself, the parity map is the identity of F₂, and every
  compatible fibre has one fixed point for every odd `q` prime to `6`.
- For `G = C₃² ⋊ C₂` (row 5), `M(G, c) = M(G) ≅ C₃` by RS.6.1 and RS.6.8, so `A = C₃` has odd order,
  `B = 0`, and every compatible parity survives every allowed `q`, with `|A[q − 1]| = 3` or `1` fixed
  points according as `3` divides `q − 1` or not.

### Dependencies

Layers RS.0 (the Hall part), RS.1 (bilinearity) and RS.4 (the parity linear algebra); InverseGalois
IG.3.4 (commutators of lifts, reduced multipliers, Schur and reduced covers, the coprime semidirect
splitting). The identification of the marked models with the embedded arithmetic types is made in
ArithmeticStatistics, ST.3, which consumes this layer.

## Downstream consumers

- ArithmeticStatistics, ST.3 and ST.5: the slices, power-fixed lattices and orbit sets of Layer
  RS.3, the fixed-fibre counts and parity statistics of Layer RS.4 (`involution_abelianization`,
  `all_fixed_fibers`, `surviving_parities`, `rank_parity_count`, `parityWeightEnumerator`), and the
  certificates, the order-96 type and the table of Layer RS.6, with the embedded arithmetic types
  identified there. Its reduced multipliers and reduced covers are InverseGalois's, which this
  roadmap uses and does not restate.
- ArithmeticStatistics Part V: the reduction certificates and parity algorithm (RS.6.4–RS.6.5) and
  the explicit `order96Type` (RS.6.6).
- Any roadmap that needs the class map of a central extension on cycles, the five-term sequence of
  a group extension, or the finiteness and Hall decomposition of the integral homology of a finite
  group can take them from Layer RS.0.

## References

- Melanie Matchett Wood, *Nonabelian Cohen–Lenstra moments*, Duke Math. J. 168 (2019), no. 3,
  377–427 ([NSF public access copy](https://par.nsf.gov/servlets/purl/10152050)): introduction,
  pp. 378–379; §2.3, p. 387; Definition 3.1, p. 388; Lemmas 3.3–3.4, p. 390; §4.1, pp. 398–401
  (Proposition 4.1 and equation (5), p. 400; equation (6) and Remark 4.2, p. 401); §8.2, Table 2,
  p. 419; the opening of the Appendix, p. 420.
- Melanie Matchett Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*,
  Research in the Mathematical Sciences 8 (2021), Article 21 ([author
  copy](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf)): §2.1, p. 2; Remark 4.1,
  p. 8.
- Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland, *Homological stability for Hurwitz spaces
  and the Cohen–Lenstra conjecture over function fields, II*,
  [arXiv:1212.0923v1](https://arxiv.org/abs/1212.0923v1) (2012, withdrawn): §7.3, p. 34; Example
  9.3.2, p. 57.
- Yuan Liu, Melanie Matchett Wood, David Zureick-Brown, *A predicted distribution for Galois groups
  of maximal unramified extensions*, Invent. Math. 237 (2024), 49–116 ([NSF public access
  copy](https://par.nsf.gov/servlets/purl/10509628); preprint
  [arXiv:1907.05002v2](https://arxiv.org/abs/1907.05002v2)): §12, pp. 104–105 (arXiv v2 pp. 47–48;
  the paragraph before Proposition 12.7, arXiv v2 p. 50); Lemma 12.10 and its proof, pp. 110–111
  (arXiv v2 p. 53).
- Clara Löh, *Group Cohomology*, lecture notes, version of 30 July 2019 ([author
  copy](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf)): §1.2, pp. 11–17; Theorem
  1.4.1, p. 20; Theorem 1.5.1, p. 30; §1.5.2, pp. 32–40; Corollary 1.6.13, p. 49; §1.7.3 and
  Theorem 1.7.15, pp. 63–64; Corollary 1.7.16, pp. 64–65; Theorem 3.2.12, p. 123; Proposition
  3.2.13, p. 124; Remark 3.2.14, p. 125; Example 3.2.16, pp. 126–127; Theorem 3.2.18, pp. 129–131;
  Corollary 3.2.23, p. 136.
- Allen Hatcher, *Algebraic Topology*, Cambridge University Press, 2002 ([author
  copy](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf)): §3.1, the evaluation map, p. 191.
- InverseGaloisAndArithmeticFundamentalGroups, TauCetiRoadmap pull request #850 (README at head
  `164e3b1`): Layer IG.3, §§IG.3.4–IG.3.6, and Layer IG.4, *Coprime profinite complements*.
