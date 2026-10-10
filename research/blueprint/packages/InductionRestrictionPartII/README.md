# Induction, restriction, and Mackey theory for finite groups, Part II: reduced Schur covers and marked extensions

Ordinary Schur covers encode projective representations. Arithmetic applications require an additional quotient: commuting pairs involving specified inertia classes must have commuting lifts. This roadmap builds that quotient and the marked universal extension that makes it independent of a presentation. It then develops the finite power action, its fixed fibers, square-class obstructions, compatible covers for coprime semidirect products, and finite certificates for the reduced multipliers occurring in quadratic-field statistics.

The starting point is [InductionRestriction, Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier): ordinary projective representations, factor sets, central extensions and representation groups. The integral multiplier uses Mathlib's group homology, while the parent uses second cohomology for factor-set classes. The two carriers are related through the oriented homological class map; they are not interchangeable definitions.

Suggested home: `TauCeti/GroupTheory/ReducedSchur/`, with namespace `TauCeti.ReducedSchur`.

## Scope and neighbouring developments

The six layers own the reduced multiplier, marked presentation and comparison, discrete action, fixed-fiber obstruction, semidirect-product compatibility, and certification of finite reductions. Induction, restriction, Mackey theory and ordinary Schur-cover existence stay in the parent. Existing factor-set classification and splitting criteria are consumed from Tau Ceti.

[Arithmetic statistics, ST.3](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/readmes/ArithmeticStatistics.md) supplies the embedded finite-group types and their arithmetic interpretation. Its ST.5 consumes the finite fiber and parity data for component counts and limits. The inverse-Galois and arithmetic-fundamental-group layers IG.3–IG.5 consume the marking, lifting and power interfaces for branch-cycle and Frobenius constructions. Those arithmetic and geometric conclusions do not enter as assumptions on the reduced multiplier. Finite linear algebra and weight enumerators here make no assertion about a moment or asymptotic limit.

## Standing conventions

* A group is finite exactly where stated. A central extension is Mathlib's `GroupExtension A E G`, together with the explicit condition that its injected kernel commutes with every element of E. An ordinary Schur cover includes a surjective central projection, the stem condition, and a compatible identification of its kernel with integral second homology.
* Write M(G)=H₂(G,ℤ), the carrier of `groupHomology.H2 (Rep.trivial ℤ G ℤ)`. Use additive notation in this carrier. `TauCeti.schurMultiplier k G` is H²(G,kˣ) and retains its different coefficient and variance conventions.
* The commutator is XYX⁻¹Y⁻¹. The commuting-pair class is the image of [x|y]−[y|x] with integral coefficient 1. The ordered basis of ℤ² gives the positive orientation. Reversing the inputs negates the homological class and inverts the kernel commutator.
* The set c is conjugacy-invariant. Generation of G by c is required for the universal central surjection and its marked comparison. Closure under invertible powers is required for the discrete power action. In the involution layers, every element of c has order exactly 2. A one-class normalization additionally specifies a chosen c₀∈c.
* Put D=c/G, implemented by the subtype of Mathlib's `ConjClasses G` whose classes meet c. Put L=D→₀ℤ; for finite D it is the integer coordinate lattice ℤ^D. The map δ:L→Additive(G^ab) sends e_[x] to the abelianized class of x. Degree coordinates are integers; inverse generators have negative degree.
* The canonical reduced multiplier is M(G,c)=M(G)/Q_c. The chosen reduced cover S_c=S/τ_S(Q_c) retains the ordinary cover S and its oriented kernel identification τ_S. Distinct choices need not give isomorphic reduced extensions.
* In cover coordinates, the marked universal object is P=S_c×_{G^ab}Multiplicative L, with membership [π_c(h)]=δ(m). Its central kernel is M(G,c)×kerδ. It usually has an infinite free factor and is not the finite reduced multiplier.
* Unit powers of a nonabelian group are set permutations, not group homomorphisms. The power action permutes the class-degree coordinates: m^α(d^α)=m(d). It never scales integer degrees by α. Its restriction to the central kernel is a group action by automorphisms.
* Finite-group computations specify multiplication, inverses, projections, embedded marked subsets and cover maximality. Abstract group names and SmallGroups indices identify the intended examples, but do not replace the marked data or their proofs.

## Existing library interfaces

Use `GroupExtension` and `GroupExtension.Splitting` for extensions and homomorphic sections. `TauCeti.FactorSet.cohomologyClassEquiv` classifies factor sets, while `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` supplies the splitting criterion. `TauCeti.GroupExtension.factorSet` converts a normalized section into the corresponding factor set.

For integral homology use `groupHomology.cycles₂`, `groupHomology.H2π`, `groupHomology.H2`, `groupHomology.map` and `groupHomology.map_comp`. For group quotients and presentations use `Abelianization`, `Abelianization.of`, `Abelianization.lift`, `PresentedGroup` and `PresentedGroup.toGroup`. These interfaces fix the carriers and universal properties; there is no second private theory of H₂ or abelianization.

The integral homology map uses the identity on the trivial integral coefficient representation together with the specified group homomorphism. A chosen cover is retained through its projection and oriented kernel isomorphism. Its relation subgroup is the image of Q_c under that isomorphism and the kernel inclusion; centrality supplies the normality needed by `QuotientGroup`. Quotient and comparison maps preserve these specified maps, rather than merely asserting that suitable abstract groups are isomorphic.

Coordinate permutations use `Finsupp.domCongr` on L. A twist is a bundled equivariant map `T →[B] X`, with `Torsor B T` providing the simply transitive source action. Evaluation at a chosen torsor point identifies the twist with X; changing the point acts on X. The finite-level power action takes values in `Equiv.Perm P`; its kernel restriction takes values in `MulAut` of the actual projection kernel.

For square classes use `TauCeti.ElementaryTwoQuotient`, `TauCeti.elementaryTwoQuotientMk_eq_zero_iff`, `TauCeti.elementaryTwoQuotientMk_mul`, and `TauCeti.elementaryTwoQuotientMap`. Finite primary decomposition comes from `AddCommGroup.equiv_directSum_zmod_of_finite`; freeness of the integer-lattice subgroup comes from `Submodule.basisOfPid`. `powMonoidHom` and `MonoidHom.fiberEquivKer` supply the power kernel and the count of a nonempty power fiber. `LinearMap.finrank_range_add_finrank_ker` and `Module.card_eq_pow_finrank` supply the finite binary counts. Schur–Zassenhaus complement existence is `Subgroup.exists_right_complement'_of_coprime`; conjugacy of complements is a separate input.

## Homological input contracts

The reduced-cover comparison requires the natural integral degree-two universal coefficient sequence for every abelian kernel A with trivial G-action, including infinite A. Its class map τ_E:M(G)→A evaluates [x|y]−[y|x] as the commutator of lifts in E. Its kernel is the image of Ext¹(G^ab,A); when G^ab is free abelian, this Ext term vanishes. The class map must be natural for maps of central extensions with specified kernel maps. The finite-kernel specialization alone does not suffice for the universal marked extension.

The homological five-term sequence for a central extension supplies exactness at M(G) between H₂(E,ℤ)→M(G) and its transgression into A. For an ordinary stem cover, the transgression is the oriented kernel isomorphism. This exactness is what gives equality of the reduced-cover homology image with Q_c; the vanishing composite is strictly less information.

Finite positive-degree integral homology must be finite and killed by the group order through transfer. The coprime degree-two Lyndon–Hochschild–Serre reduction must include the incoming d₃ differential, not merely its E² terms. The cyclic-complement application additionally requires that any complement to H in H⋊C, for finite coprime H,C with C cyclic, is H-conjugate to the standard complement.

## Layers and dependencies

| Layer | Objects and milestones | Inputs |
| --- | --- | --- |
| RS.1 | Commuting-pair classes, reduced multipliers, reduced covers and lifted markings | Parent Layer 7; integral group homology and its input contracts |
| RS.2 | Universal marked presentation, degree lattice, fiber product and full central kernel | RS.1; arbitrary-kernel UCT; freeness of the integer lattice |
| RS.3 | Power permutations, corrections, twists and degree orbits | RS.1–RS.2; finite multiplier exponent bound |
| RS.4 | Fixed-fiber solvability, torsion images, obstruction thresholds and parity counts | RS.3; elementary-2 quotient and finite linear algebra |
| RS.5 | Compatible covers and reduced multipliers of coprime semidirect products | RS.1 and RS.3; transfer and cyclic-complement conjugacy |
| RS.6 | Reduction certificates, parity algorithm and marked finite examples | RS.1, RS.4; degree-two homology reduction; ST.3 marked types |

Every definition below has its API and three discriminating unit tests. The required theorems retain the hypotheses in their mathematical statements. Source citations distinguish the published articles from preprint-only constructions.

## RS.1: Commuting-pair classes and reduced Schur covers

Construct the integral quotient before choosing a cover. Then compare its generators with central lift commutators. Surjectivity of lifted centralizers is the reason the marking is independent of the conjugator. The stronger homology-image equality uses the five-term input contract.

### Commutator of lifts

**Target `lift_commutator`.** For a central GroupExtension A E G, commuting x,y∈G, and arbitrary lifts X,Y∈E, define κ_E(x,y)∈A by inl(κ_E(x,y))=XYX⁻¹Y⁻¹. Surjectivity supplies lifts, exactness gives kernel membership, and injectivity supplies a unique preimage. Centrality means inl(A)⊆Z(E).

Construction and proof route: Use exactness to extract a kernel element; differences between lifts lie in the central kernel.

Needs: `GroupExtension` (Mathlib).

Required API:

- `lift_commutator_inl` (projection): inl(κ_E(x,y))=XYX⁻¹Y⁻¹ for any lifts X,Y.
- `lift_commutator_independent` (characterisation): Changing either lift by any kernel element leaves κ_E(x,y) unchanged.
- `lift_commutator_swap` (relation): κ_E(y,x)=κ_E(x,y)⁻¹.
- `lift_commutator_map` (functoriality): A map of central extensions sends κ_E(x,y) to κ_E′(f(x),f(y)) through its specified kernel map.

Unit tests:

- `lift_commutator_test_1` (degenerate): κ_E(1,y)=1.
- `lift_commutator_test_2` (compatibility): In the split direct-product extension A×G→G, κ_E(x,y)=1 for every commuting pair.
- `lift_commutator_test_3` (computation): For either D₈→C₂² or Q₈→C₂², lifts of two independent basis elements have commutator equal to the nonidentity central element.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2.1, author PDF p.2.

### The oriented commuting-pair cycle

**Target `commuting_pair_cycle`.** For xy=yx, [x|y]−[y|x] with integral coefficient 1 belongs to groupHomology.cycles₂ (Rep.trivial ℤ G ℤ). The orientation is x followed by y.

Construction and proof route: The existing d₂₁ sends [x|y] to [y]−[xy]+[x]; subtract the reversed formula and use xy=yx.

Needs: `Rep.trivial` (Mathlib); `groupHomology.cycles₂` (Mathlib).

Checks: Reversing the pair negates the cycle; the coefficient is 1, not 0.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2.1, author PDF p.2.

### Universal homological commutator

**Target `homological_commutator`.** For commuting x,y∈G define ⟨x,y⟩ as H2π applied to the oriented cycle [x|y]−[y|x], in M(G)=H₂(G,ℤ). Equivalently it is the image of the oriented generator of H₂(ℤ²,ℤ) under (a,b)↦xᵃyᵇ.

Construction and proof route: Use the existing cycle quotient. Compare with the ℤ² generator and the oriented UCT evaluation through the homological input contracts.

Needs: RS.1, the oriented commuting-pair cycle; `groupHomology.H2π` (Mathlib); `groupHomology.H2` (Mathlib); `groupHomology.map` (Mathlib).

Required API:

- `homological_commutator_cycle` (compatibility): ⟨x,y⟩=H2π([x|y]−[y|x]).
- `homological_commutator_swap` (relation): ⟨y,x⟩=−⟨x,y⟩.
- `homological_commutator_map` (functoriality): For any f:G→H, f_*(⟨x,y⟩)=⟨f(x),f(y)⟩.
- `homological_commutator_central_extension` (compatibility): The UCT class map τ_E sends ⟨x,y⟩ to κ_E(x,y), using the XYX⁻¹Y⁻¹ convention.

Unit tests:

- `homological_commutator_test_1` (degenerate): ⟨1,y⟩=0, since the displayed cycle is a boundary.
- `homological_commutator_test_2` (computation): For G=C₂² and independent x,y, ⟨x,y⟩ is the nonzero element of M(G)≅C₂.
- `homological_commutator_test_3` (non-example): For G=ℤ² the ordered basis gives the positive generator; swapping gives its negative, not the same integer.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2.1, author PDF p.2.

### Schur commutator relations

**Target `schur_relations`.** For conjugacy-invariant c⊆G set Q_c to the additive subgroup of M(G) generated by ⟨x,y⟩ with x∈c and y∈C_G(x). No generation or rationality hypothesis on c is needed for this quotient.

Construction and proof route: Take the subgroup closure of exactly the specified commuting-pair classes.

Needs: RS.1, universal homological commutator.

Required API:

- `schur_relations_mem` (constructor): x∈c and xy=yx imply ⟨x,y⟩∈Q_c.
- `schur_relations_le` (universal-property): Q_c≤B iff every specified commuting-pair class lies in B.
- `schur_relations_mono` (functoriality): c⊆d implies Q_c≤Q_d.
- `schur_relations_map` (functoriality): f(c)⊆d implies f_*(Q_c)⊆Q_d.

Unit tests:

- `schur_relations_test_1` (degenerate): Q_∅=0.
- `schur_relations_test_2` (computation): For C₂² and c={x} with x nonzero, Q_c=M(C₂²).
- `schur_relations_test_3` (non-example): For c=∅ in C₂² the quotient retains C₂; it must not be forced trivial by relations from x outside c.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Definition of H₂(G,c), followed by Lemma 2.3, author PDF p.3.

### Reduced Schur multiplier

**Target `reduced_multiplier`.** Define M(G,c)=H₂(G,c)=M(G)/Q_c as the additive group quotient of the existing integral H₂ carrier. It depends functorially on (G,c) under f(c)⊆d and is independent of a Schur-cover choice.

Construction and proof route: Use the additive quotient by Q_c; induce maps using its universal property.

Needs: RS.1, schur commutator relations; `groupHomology.H2` (Mathlib).

Required API:

- `reduced_multiplier_mk` (projection): The quotient map M(G)→M(G,c) is onto with kernel Q_c.
- `reduced_multiplier_lift` (universal-property): Maps M(G,c)→B correspond to additive maps M(G)→B vanishing on Q_c.
- `reduced_multiplier_map` (functoriality): An f with f(c)⊆d gives M(G,c)→M(H,d), with identity and composition laws.
- `reduced_multiplier_empty` (compatibility): M(G,∅)≅M(G), through the quotient by the zero subgroup.

Unit tests:

- `reduced_multiplier_test_1` (degenerate): M(1,c)=0 for either allowed c.
- `reduced_multiplier_test_2` (computation): For finite cyclic G and any c, M(G,c)=0.
- `reduced_multiplier_test_3` (computation): M(C₂²,∅)≅C₂ but M(C₂²,{x})=0 for x≠1.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Definition of H₂(G,c), followed by Lemma 2.3, author PDF p.3.

### Reduced Schur cover

**Target `reduced_cover`.** Given a chosen ordinary Schur cover π:S→G and its oriented class isomorphism τ_S:M(G)≅kerπ, define S_c=S/τ_S(Q_c). Retain π, τ_S and the cover choice as parameters. The descended π_c:S_c→G is a central surjection with kernel canonically identified with M(G,c) for these data.

Construction and proof route: Quotient by the central image of Q_c; descend the projection and use exactness to identify its kernel.

Needs: RS.1, reduced schur multiplier; RS.1, commutator of lifts; InductionRestriction, Layer 7.

Required API:

- `reduced_cover_projection` (projection): π_c∘quotient=π.
- `reduced_cover_kernel` (equivalence): The induced τ_c:M(G,c)≅kerπ_c commutes with the quotient from M(G).
- `reduced_cover_commute` (relation): Lifts of x∈c and y∈C_G(x) commute in S_c.
- `reduced_cover_stem` (compatibility): The map S_c^ab→G^ab is an isomorphism, inherited from the ordinary stem cover.

Unit tests:

- `reduced_cover_test_1` (degenerate): For c=∅ the quotient is the chosen S itself.
- `reduced_cover_test_2` (computation): For G=C₂² and c all nonidentity elements, either D₈ or Q₈ reduces to G.
- `reduced_cover_test_3` (non-example): For c=∅ the two reduced covers D₈ and Q₈ of C₂² are nonisomorphic: there is no canonical reduced extension determined by G,c.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Definition of H₂(G,c), followed by Lemma 2.3, author PDF p.3.

### Centralizers lift commutatively

**Target `centralizer_lifts`.** In a reduced cover S_c→G, if x∈c and y∈C_G(x), any lifts X,Y commute. Consequently C_{S_c}(X)→C_G(x) is surjective.

Construction and proof route: The lift commutator is a generator of τ_S(Q_c), killed by the quotient.

Needs: RS.1, reduced schur cover; RS.1, commutator of lifts.

Checks: For c=∅ this conclusion is unavailable; independent basis lifts in D₈ provide a counterexample.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Definition of H₂(G,c), followed by Lemma 2.3, author PDF p.3.

### Conjugacy classes lift bijectively

**Target `conjugacy_bijection`.** Every conjugacy class in S_c with image contained in c∪{1} maps bijectively to its image conjugacy class in G. No uniqueness is asserted for which class above a class of c is chosen.

Construction and proof route: Surjectivity follows by lifting conjugators; two conjugators with equal image on x differ by a centralizer lift, which fixes X. Kernel elements are central singletons.

Needs: RS.1, centralizers lift commutatively.

Checks: Several classes above one class can exist, each individually mapping bijectively.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1 p.388 and Lemmas 3.3–3.4 p.390 (PDF pp.12,14).

### Conjugacy-equivariant lifted marking

**Target `class_compatible_marking`.** For one representative x_d in each d∈D=c/G, choose a lift X_d∈S_c. Define x̂ for x=gx_dg⁻¹ by a lifted conjugator g̃X_dg̃⁻¹. This is independent of g and g̃ but retains the initial representative-lift choices.

Construction and proof route: Independence uses centrality for g̃ and centralizer-lift commutation for g; conjugate the resulting lift for equivariance.

Needs: RS.1, conjugacy classes lift bijectively.

Required API:

- `class_compatible_marking_over` (projection): π_c(x̂)=x.
- `class_compatible_marking_conj` (functoriality): The lift of gxg⁻¹ equals g̃x̂g̃⁻¹ for any lift g̃.
- `class_compatible_marking_rep` (simp): The marking takes x_d to the chosen X_d.
- `class_compatible_marking_change` (compatibility): Changing X_d by a_d∈M(G,c) changes every marked lift in d by the same central a_d.
- `class_compatible_marking_ext` (extensionality): Two conjugacy-equivariant markings agree if they agree at every chosen class representative.

Unit tests:

- `class_compatible_marking_test_1` (degenerate): If c=∅, the marking is the unique empty function.
- `class_compatible_marking_test_2` (computation): For a cyclic group with its identity reduced cover, marking is the inclusion on c.
- `class_compatible_marking_test_3` (non-example): For nonempty c and nontrivial reduced kernel A, multiplying the chosen lift of one class by a nonidentity a∈A gives a different marking; the class-compatible construction does not erase this choice.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Definition of H₂(G,c), followed by Lemma 2.3, author PDF p.3.

### Local class normalization

**Target `local_class_normalization`.** Assume c is one conjugacy class, choose c₀∈c, and let E=S_c. For e with π_c(e)∈c∪{1}, define z(e) to be the unique element in its conjugacy class mapping to c₀ if π_c(e)∈c, and e itself if π_c(e)=1.

Construction and proof route: Apply the individual-class bijection; no arithmetic lift or global product is constructed here.

Needs: RS.1, conjugacy classes lift bijectively.

Required API:

- `local_class_normalization_image` (projection): π_c(z(e)) is c₀ or 1 according to the branch.
- `local_class_normalization_conj` (characterisation): z(e) lies in the conjugacy class of e and is invariant under conjugating e.
- `local_class_normalization_fixed` (simp): If π_c(e)∈{1,c₀}, z(e)=e.
- `local_class_normalization_mul_kernel` (compatibility): For a∈kerπ_c and allowed e, z(ae)=a·z(e); central multiplication transports the unique conjugate over c₀.

Unit tests:

- `local_class_normalization_test_1` (degenerate): For a kernel element a, z(a)=a.
- `local_class_normalization_test_2` (computation): For S₃ with c the transpositions and c₀=(12), z((23))=(12) in its identity reduced cover.
- `local_class_normalization_test_3` (non-example): For several conjugacy classes c, one c₀ cannot normalize elements from all classes; the single-class hypothesis is essential.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1 p.388 and Lemmas 3.3–3.4 p.390 (PDF pp.12,14).

### Local normalized factors commute

**Target `local_factors_commute`.** Any two elements of a central extension mapping to {1,c₀} commute. In particular all z(e) in the preceding single-class construction commute.

Construction and proof route: Kernel factors are central; two elements above c₀ differ by a central kernel factor.

Needs: RS.1, local class normalization; `GroupExtension` (Mathlib).

Checks: This is the algebraic input to the global product in IG.4, not its local/global arithmetic existence theorem.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), Definition 3.1 p.388 and Lemmas 3.3–3.4 p.390 (PDF pp.12,14).

### Reduced-cover homology image

**Target `homology_image`.** For π_c:S_c→G, im(H₂(S_c,ℤ)→M(G))=Q_c. Thus the composite H₂(S_c,ℤ)→M(G)→M(G,c) is zero. The equality uses the central-extension homological five-term exact sequence; the zero composite alone also follows by UCT naturality and the diagonal splitting.

Construction and proof route: The five-term transgression is the quotient M(G)→M(G,c); exactness identifies its kernel Q_c.

Needs: RS.1, reduced schur cover; `groupHomology.map` (Mathlib).

Checks: The equality is stronger than Wood Lemma 2.2, and is not inferred from the zero composite alone.

Source: Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, §7.3, paragraph after the definition, arXiv v1 PDF p.34.

### Reduced-cover homology composite vanishes

**Target `homology_composite_zero`.** The composite H₂(S_c,ℤ)→M(G)→M(G,c) is zero.

Construction and proof route: Compose the image equality with the quotient map.

Needs: RS.1, reduced-cover homology image.

Checks: For c=∅ this says a Schur-cover homology map to M(G) is zero.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Lemma 2.2 and proof, author PDF p.3.

### Commuting-pair classes respect orders

**Target `commutator_order`.** For commuting x,y, the homological commutator is additive in each commuting cyclic variable: ⟨x^n,y⟩=n⟨x,y⟩. In particular if x is an involution then 2⟨x,y⟩=0.

Construction and proof route: Compute the degree on the oriented torus generator and its homological image; use ⟨1,y⟩=0.

Needs: RS.1, universal homological commutator.

Checks: This does not assert bilinearity on arbitrary pairs of noncommuting elements.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2.1, author PDF p.2.

## RS.2: Universal marked extensions and degree

The presentation and the fiber product have distinct roles. The presentation fixes the canonical marked object; the fiber product exposes its finite and free coordinates. Prove both abelianization calculations before splitting a marked pullback. Correct a splitting by the inverse of its discrepancy on the degree basis; this sign is detected by a C₃ test.

### Marked central extension

**Target `marked_extension`.** For conjugacy-invariant generating c⊆G, a c-marked central extension is a GroupExtension A E G with central kernel and a section s:c→E such that s(gxg⁻¹)=e s(x)e⁻¹ whenever π(e)=g. Its marked subset s(c) maps bijectively to c. A morphism is a group homomorphism over G preserving s; a kernel identification need not be fixed.

Construction and proof route: Bundle an existing extension together with marking data and genuine centrality/equivariance conditions.

Needs: `GroupExtension` (Mathlib); RS.1, conjugacy-equivariant lifted marking.

Required API:

- `marked_extension_section` (projection): π(s(x))=x for x∈c.
- `marked_extension_conjugation` (relation): Any e over g conjugates s(x) to s(gxg⁻¹).
- `marked_extension_hom` (characterisation): A marked morphism f satisfies π′∘f=π and f(s(x))=s′(x).
- `marked_extension_subset` (compatibility): The section formulation is equivalent to a conjugacy-invariant marked subset mapping bijectively to c.
- `marked_extension_hom_ext` (extensionality): Marked morphisms out of an extension generated by its marked subset are equal if their values agree on that subset; generation is essential.

Unit tests:

- `marked_extension_test_1` (degenerate): For G=1,c=∅, any central extension A→A→1 has the empty marking.
- `marked_extension_test_2` (computation): The identity extension G→G has its inclusion marking.
- `marked_extension_test_3` (non-example): The quotient C₄→C₂ is marked on its nontrivial class using a lift of order 4; the marking is a set-section, not a splitting homomorphism.

Source: Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, §§7.4–7.5, arXiv v1 PDF pp.34–37; compare Wood (2021), Lemmas 2.1–2.4 and Theorem 2.5, author pp.2–4.

### Universal marked presentation

**Target `universal_presentation`.** For conjugacy-invariant generating c⊆G, U(G,c) is PresentedGroup on the subtype c, with relation words [x][y][x]⁻¹[xyx⁻¹]⁻¹ for x,y∈c. Write [x] for the canonical generator. The map π_U:U→G sends [x] to x.

Construction and proof route: Use Mathlib’s normal-closure presentation; conjugacy invariance types the last generator. Construct the projection by evaluating each relation.

Needs: `PresentedGroup` (Mathlib); `PresentedGroup.toGroup` (Mathlib).

Required API:

- `universal_presentation_gen` (constructor): For x∈c, [x] is the image of its FreeGroup generator.
- `universal_presentation_relation` (relation): [x][y][x]⁻¹=[xyx⁻¹].
- `universal_presentation_projection` (projection): π_U([x])=x.
- `universal_presentation_lift` (universal-property): A generator map into E satisfying the conjugation relations extends uniquely to a homomorphism U→E.

Unit tests:

- `universal_presentation_test_1` (degenerate): U(1,∅)=1, the group on no generators.
- `universal_presentation_test_2` (computation): For C₂ and its nonidentity singleton c, U≅ℤ and π_U is reduction modulo 2.
- `universal_presentation_test_3` (non-example): Do not impose [x]^ord(x)=1: that would turn this C₂ example into C₂ rather than ℤ.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### The class degree homomorphism

**Target `class_degree_map`.** Let D=c/G and L=D→₀ℤ. Define δ:L→Additive(G^ab) by δ(e_d)=Additive.ofMul(Abelianization.of(x_d)); conjugate representatives give the same value. It is onto when c generates G.

Construction and proof route: Extend on the free integral module, and check degree is unchanged by the conjugation relation.

Needs: RS.2, universal marked presentation; `Abelianization.of` (Mathlib).

Required API:

- `class_degree_map_basis` (simp): δ(e_[x])=Additive.ofMul(Abelianization.of(x)).
- `class_degree_map_surjective` (characterisation): δ is onto when c generates G.
- `class_degree_map_compatible` (compatibility): The relation δ(deg(u))=Additive.ofMul(Abelianization.of(π_U(u))) is supplied by the separate universal-degree node.
- `class_degree_map_integer` (data): δ accepts arbitrary integer coefficients; δ(−e_[x]) is the negative of the abelianized image of x.

Unit tests:

- `class_degree_map_test_1` (computation): For C₂ with one nonidentity class, δ:ℤ→C₂ is reduction mod 2.
- `class_degree_map_test_2` (degenerate): For c=∅, L=0 and δ is the zero map.
- `class_degree_map_test_3` (non-example): δ(−e_[x]) is defined even though −e_[x] lies outside the nonnegative degree cone.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### The marked fiber product

**Target `marked_fiber_product`.** For a chosen reduced cover S_c→G, define P=S_c×_{G^ab}Multiplicative(ℤ^D), the subgroup of S_c×Multiplicative L of pairs (h,m) with [π_c(h)]=δ(m). Give it the marking x↦(x̂,e_[x]) from the class-compatible lifts.

Construction and proof route: Form the native subgroup fiber product; the marking is typed by its abelianization equality.

Needs: RS.1, reduced schur cover; RS.2, the class degree homomorphism; RS.1, conjugacy-equivariant lifted marking.

Required API:

- `marked_fiber_product_first` (projection): P→S_c is a surjective group homomorphism when c generates G.
- `marked_fiber_product_degree` (projection): P→Multiplicative L sends (h,m) to m.
- `marked_fiber_product_mark` (constructor): For x∈c, the marked point is (x̂,e_[x]).
- `marked_fiber_product_membership` (characterisation): A pair belongs precisely when [π_c(h)]=δ(m).

Unit tests:

- `marked_fiber_product_test_1` (computation): For C₂ and singleton c, P={(g,n):g=n mod 2}≅ℤ.
- `marked_fiber_product_test_2` (degenerate): For G=1,c=∅ and the trivial Schur cover, P=1.
- `marked_fiber_product_test_3` (non-example): For C₂ the pair (nonidentity,0) is absent, so P is not the full direct product C₂×ℤ.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Commutators of the marked fiber product

**Target `fiber_product_commutator`.** [P,P]=[S_c,S_c]×{0}, as a subgroup of S_c×Multiplicative L.

Construction and proof route: Every commutator of pairs has this form; lift both entries of any S_c commutator using surjectivity of δ.

Needs: RS.2, the marked fiber product.

Checks: The integer degree vanishes on every commutator.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Abelianization of the marked fiber product

**Target `fiber_product_abelianization`.** The degree projection induces P^ab≅Multiplicative(ℤ^D), taking the class of (x̂,e_[x]) to e_[x].

Construction and proof route: Quotient the commutator subgroup, then use S_c^ab≅G^ab to identify the remaining pullback with L.

Needs: RS.2, commutators of the marked fiber product; RS.1, reduced schur cover; `Abelianization.lift` (Mathlib).

Checks: Generation of c is required; it cannot be omitted from the general lemma.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Split the marked pullback extension

**Target `marked_pullback_split`.** For a marked central extension E→G, its pullback along P→G has a group-homomorphic splitting. This statement allows arbitrary abelian kernel A, including the infinite kernel of U→G.

Construction and proof route: The class map of E kills Q_c. The homological map out of P factors through S_c and is zero after reduction. UCT has no Ext term because P^ab is free, so the pullback class vanishes.

Needs: RS.1, reduced-cover homology composite vanishes; RS.2, abelianization of the marked fiber product; RS.2, marked central extension; `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` (Tau Ceti).

Checks: A UCT only for finite A is insufficient here.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Marking-preserving splitting correction

**Target `marking_correction`.** Suppose φ:P→E is a homomorphism over G and φ(x̂,e_[x])=s(x)k_x with k_x∈A. The discrepancy depends only on [x]. Let ψ:P→A be the homomorphism factoring through deg:P→ℤ^D with ψ(e_[x])=k_x. Define φ_corr(p)=φ(p) inl(ψ(p))⁻¹.

Construction and proof route: Centrality makes the product a homomorphism; the free-degree universal property constructs ψ; cancel the discrepancy with its inverse.

Needs: RS.2, split the marked pullback extension; RS.2, abelianization of the marked fiber product.

Required API:

- `marking_correction_over` (projection): φ_corr has the same projection to G as φ.
- `marking_correction_mark` (simp): φ_corr(x̂,e_[x])=s(x).
- `marking_correction_hom` (structure): φ_corr(pq)=φ_corr(p)φ_corr(q).
- `marking_correction_sign` (compatibility): The correcting factor is ψ⁻¹ when the recorded discrepancy is φ(mark)=s·ψ.

Unit tests:

- `marking_correction_test_1` (degenerate): If all k_x=1 then φ_corr=φ.
- `marking_correction_test_2` (computation): In an additive C₃ kernel with discrepancy 1, subtraction gives 0 while addition gives 2.
- `marking_correction_test_3` (non-example): Multiplying φ by ψ instead sends a marked point to s(x)k_x² and fails for a kernel element of order 3.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Degree of a marked word

**Target `universal_degree`.** Define deg:U(G,c)→Multiplicative(ℤ^D) by deg([x])=e_[x]. It is a group homomorphism with δ(deg(u)) the abelianized image of π_U(u).

Construction and proof route: Each conjugation relator has degree zero, so the free generator degree descends.

Needs: RS.2, universal marked presentation; RS.2, the class degree homomorphism.

Required API:

- `universal_degree_generator` (simp): deg([x])=e_[x].
- `universal_degree_inverse` (simp): deg([x]⁻¹)=−e_[x].
- `universal_degree_abelianization` (compatibility): δ∘deg is the additive spelling of the abelianized projection.
- `universal_degree_hom` (structure): deg(uv)=deg(u)+deg(v) in additive lattice notation.

Unit tests:

- `universal_degree_test_1` (computation): For the one-class C₂ example, deg identifies U=ℤ with ℤ.
- `universal_degree_test_2` (degenerate): deg(1)=0.
- `universal_degree_test_3` (non-example): deg([x]⁻¹)=−e_[x] is not a nonnegative degree.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Conjugation by a marked word

**Target `word_conjugation`.** For w=[g₁]^a₁⋯[g_k]^a_k and x∈c, w[x]w⁻¹=[π_U(w)xπ_U(w)⁻¹]. The inverse word is [g_k]^−a_k⋯[g₁]^−a₁.

Construction and proof route: Induct on a free word, using the defining relation and its inverse form; then descend the quotient.

Needs: RS.2, universal marked presentation; RS.2, degree of a marked word.

Checks: The word with one exponent −1 verifies that inverse conjugators use negative exponents.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### The presentation is a central extension

**Target `universal_central`.** If c generates G, π_U is onto and kerπ_U⊆Z(U); x↦[x] is a conjugacy-equivariant section on c.

Construction and proof route: Generation proves surjectivity. A kernel word fixes every generator by word conjugation, hence commutes with all U.

Needs: RS.2, conjugation by a marked word; RS.2, universal marked presentation; RS.2, degree of a marked word.

Checks: If c does not generate G, the projection need not be onto.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Universal marked central extension

**Target `universal_marked_property`.** For every c-marked central extension E→G there is exactly one marked morphism U(G,c)→E. Therefore any two universal marked extensions are uniquely isomorphic through their markings.

Construction and proof route: Its section satisfies the defining relation. Extend and use the generator universal property for uniqueness.

Needs: RS.2, the presentation is a central extension; RS.2, marked central extension; `PresentedGroup.toGroup` (Mathlib).

Checks: Uniqueness is for marked maps; ordinary unmarked central extensions do not have this initial object.

Source: Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, §§7.4–7.5, arXiv v1 PDF pp.34–37; compare Wood (2021), Lemmas 2.1–2.4 and Theorem 2.5, author pp.2–4.

### Abelianization of the presentation

**Target `presentation_abelianization`.** The degree map identifies U(G,c)^ab with Multiplicative(ℤ^D).

Construction and proof route: After abelianization the defining relations identify generators in a conjugacy class, with no additional additive relation.

Needs: RS.2, universal marked presentation; RS.2, the class degree homomorphism; `Abelianization.lift` (Mathlib); RS.2, degree of a marked word.

Checks: The single C₂ class gives a free ℤ, not C₂.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### The fiber product is universal marked

**Target `fiber_product_universal`.** For every marked E→G there is a unique marked morphism P→E.

Construction and proof route: Existence uses the corrected splitting. The ratio of two maps over G is a homomorphism to the central kernel, factors through P^ab≅ℤ^D, and vanishes on its marked basis.

Needs: RS.2, marking-preserving splitting correction; RS.2, abelianization of the marked fiber product; RS.2, degree of a marked word.

Checks: Uniqueness uses the degree basis rather than an unproved claim that marked lifts generate P.

Source: Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, §§7.4–7.5, arXiv v1 PDF pp.34–37; compare Wood (2021), Lemmas 2.1–2.4 and Theorem 2.5, author pp.2–4.

### Presentation and fiber-product comparison

**Target `presentation_comparison`.** There is a unique marked isomorphism U(G,c)≅P sending [x] to (x̂,e_[x]), compatible with projections and degree. It transports changes of cover and marking choice through the presentation; no canonical isomorphism S_c≅S′_c is asserted.

Construction and proof route: Initiality yields maps in both directions; uniqueness gives inverse composites.

Needs: RS.2, the fiber product is universal marked; RS.2, universal marked central extension; RS.2, degree of a marked word.

Checks: The isomorphism depends on the fiber-product marking but U is the choice-free presentation.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

### Kernel of the universal marked extension

**Target `universal_kernel`.** Define K(G,c)=ker(π_U:U→G), using the existing kernel subgroup. Under U≅P it is M(G,c)×ker(δ:L→G^ab). It is central and commutative, even though U generally is not. There is an exact sequence 0→M(G,c)→K→kerδ→0.

Construction and proof route: Restrict the isomorphism to kernels. A pair above 1 has h in the reduced-cover kernel and δ(m)=0.

Needs: RS.2, the presentation is a central extension; RS.2, presentation and fiber-product comparison; RS.2, degree of a marked word; `Submodule.basisOfPid` (Mathlib).

Required API:

- `universal_kernel_inclusion` (projection): K→U is the native subgroup inclusion; all its elements commute with U.
- `universal_kernel_degree` (projection): The degree image of K is exactly kerδ.
- `universal_kernel_torsion` (characterisation): The torsion subgroup of K is M(G,c), since kerδ is free abelian.
- `universal_kernel_product` (equivalence): In chosen cover coordinates K≅M(G,c)×kerδ, without a preferred basis for kerδ.

Unit tests:

- `universal_kernel_test_1` (computation): For G=C₂,c={nonidentity}, K=2ℤ inside U=ℤ.
- `universal_kernel_test_2` (degenerate): For G=1,c=∅, K=1.
- `universal_kernel_test_3` (non-example): K is not the finite reduced multiplier in the C₂ example: it is infinite even though M(C₂,c)=0.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §2, Lemmas 2.1–2.4 and Theorem 2.5, author PDF pp.2–4.

## RS.3: Discrete powers, twists and degree orbits

Keep the finite residue level explicit. The correction takes values in the central reduced multiplier and is a lattice homomorphism, while the resulting action on the universal object is generally only a set action. Field-specific generator torsors are inputs to the equivariant-map construction; evaluation depends on the chosen generator.

### Finite power action

**Target `finite_power`.** Let G be finite, p prime with p∤|G| (or characteristic zero). A unit α of the prime-to-p profinite integers acts on the underlying set of G by g↦g^a, where a is its coordinate modulo ord(g). This is independent of the integer representative and factors through units modulo any positive common exponent of G.

Construction and proof route: Integer powers depend only on order; invertible residues supply inverse permutations. Centrality is not needed for the set permutation, but multiplicativity requires an abelian target.

Needs: `GroupExtension` (Mathlib).

Required API:

- `finite_power_residue` (characterisation): Congruent exponents modulo ord(g) give the same value.
- `finite_power_one` (simp): The unit 1 fixes g and every unit fixes 1_G.
- `finite_power_compose` (structure): α*(β*g)=(αβ)*g for the finite power action.
- `finite_power_commutative` (compatibility): On an abelian finite G, each unit acts by a group automorphism; no such law is asserted on general G.

Unit tests:

- `finite_power_test_1` (computation): On C₃, the residue 2 interchanges the two nonidentity elements.
- `finite_power_test_2` (degenerate): The trivial group has the trivial action.
- `finite_power_test_3` (non-example): In S₃, inversion (residue −1) fixes the transpositions (12),(23) but reverses their 3-cycle product, so it is not a group homomorphism.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4, powering-action definition, author PDF p.6.

### Power permutation of class degrees

**Target `degree_permutation`.** Assume c is also closed under invertible powers. Powering induces a permutation d↦d^α of D=c/G. Define m^α on L=ℤ^D by m^α(d^α)=m(d); it is a coordinate permutation, not multiplication of each integer coordinate by α.

Construction and proof route: Powering commutes with conjugation and its inverse does too; extend the resulting basis permutation integrally.

Needs: RS.3, finite power action; RS.2, the class degree homomorphism.

Required API:

- `degree_permutation_basis` (simp): (e_d)^α=e_{d^α}.
- `degree_permutation_sum` (compatibility): Σ_d m^α(d)=Σ_d m(d).
- `degree_permutation_lower_bound` (characterisation): All coordinates ≥M before permutation iff they are ≥M afterwards.
- `degree_permutation_abelianization` (compatibility): δ(m^α)=δ(m)^α in the multiplicative abelianized notation.

Unit tests:

- `degree_permutation_test_1` (degenerate): For m=0, m^α=0.
- `degree_permutation_test_2` (computation): For c the two nonidentity elements in C₃, α=2 swaps coordinates (1,4) to (4,1).
- `degree_permutation_test_3` (non-example): For an involution singleton class, every unit fixes degree 1; integer scalar multiplication by an odd α=3 would instead give 3.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4 and §4.1, equation (4), author PDF pp.6–8.

### Central power correction

**Target `central_power_correction`.** Fix class-compatible marked lifts x̂ in S_c. For a class d with representative x_d define z_d(α)=x̂_d^−α · widehat(x_d^α)∈A=M(G,c). Extend to W_α:L→A by W_α(m)=∏_d z_d(α)^m(d). Powers of finite-cover elements are read at a finite residue level, whereas m(d) remains an integer.

Construction and proof route: The projection of each correction is 1. Equivariance and centrality make it independent of the representative within a class. The integral free-module universal property gives W_α.

Needs: RS.3, power permutation of class degrees; RS.1, conjugacy-equivariant lifted marking; RS.1, reduced schur cover.

Required API:

- `central_power_correction_basis` (simp): W_α(e_d)=z_d(α).
- `central_power_correction_add` (structure): W_α(m+n)=W_α(m)W_α(n).
- `central_power_correction_identity` (simp): W_1(m)=1.
- `central_power_correction_choice` (compatibility): For marking change x̂_d′=x̂_d a_d, z_d′(α)=a_d^−α z_d(α) a_{d^α}; corresponding fiber-product coordinates transport the action.

Unit tests:

- `central_power_correction_test_1` (degenerate): W_α(0)=1.
- `central_power_correction_test_2` (computation): For α=1 every correction equals 1.
- `central_power_correction_test_3` (non-example): For an involution x with chosen lift X and X²≠1, its correction at α=−1 equals X²≠1; the formula must not discard central lift squares.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4 and §4.1, equation (4), author PDF pp.6–8.

### Composition law for central corrections

**Target `correction_cocycle`.** W_{αβ}(m)=W_β(m)^α W_α(m^β) for all m∈L.

Construction and proof route: Verify on basis vectors using widehat(x^β)=x̂^β z_[x](β), then cancel the commuting powers; extend multiplicatively on L.

Needs: RS.3, central power correction; RS.3, power permutation of class degrees.

Checks: The second correction is evaluated on the permuted degree, not on m itself.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4 and §4.1, equation (4), author PDF pp.6–8.

### Discrete cyclotomic action

**Target `discrete_action`.** For P=S_c×_{G^ab}L define α*(h,m)=(h^α W_α(m),m^α). This defines a group action on the underlying set P, and hence on U through the marked comparison. Its projection to G is the ordinary power permutation and its degree projection is the class-degree permutation.

Construction and proof route: Check the fiber-product equality using δ compatibility; centrality permits raising h times a correction to a power. The correction cocycle proves identity and composition. If the lifts change by central factors a_d, the comparison sends (h,m) to (h∏_d a_d^{m(d)},m); it intertwines the two actions. An isomorphism of marked covers gives the analogous comparison by applying its isomorphism to the first coordinate.

Needs: RS.3, composition law for central corrections; RS.2, the marked fiber product; RS.2, presentation and fiber-product comparison.

Required API:

- `discrete_action_formula` (data): The two coordinates are h^α W_α(m) and m^α.
- `discrete_action_projection` (compatibility): π_U(α*u)=π_U(u)^α.
- `discrete_action_degree` (compatibility): deg(α*u)=deg(u)^α.
- `discrete_action_choice` (functoriality): The unique marked comparison between chosen models intertwines their discrete set actions.

Unit tests:

- `discrete_action_test_1` (degenerate): The identity unit acts identically and all units fix 1_U.
- `discrete_action_test_2` (computation): For U(C₂,c)≅ℤ, the action is trivial because its generator and its unique class are fixed after correction.
- `discrete_action_test_3` (non-example): For S₃ and all transpositions, α=−1 is not multiplicative on U: its projection fixes both marked transpositions but inverts their 3-cycle product.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4 and §4.1, equation (4), author PDF pp.6–8.

### The restricted kernel action is multiplicative

**Target `kernel_action_aut`.** Each unit acts by a group automorphism on K(G,c). In cover coordinates h lies in the commutative central A, so α*(hh′,m+m′)=α*(h,m)α*(h′,m′). This statement does not extend to all U.

Construction and proof route: Use centrality of h,h′, the homomorphism law for W_α and additivity of the degree permutation. The inverse unit supplies the inverse homomorphism.

Needs: RS.3, discrete cyclotomic action; RS.2, kernel of the universal marked extension; RS.3, central power correction.

Checks: Prove multiplicativity on the central kernel and retain the set action on the whole extension.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), §12, published PDF pp.56–57; arXiv v2 pp.47–48.

### A finite level determines the discrete action

**Target `finite_level_action`.** For a finite G, α≡β modulo |G|² implies α* and β* agree on every element of U(G,c). The same holds for K and its degree lattice.

Construction and proof route: The exponent of M(G) divides |G|, so the exponent of S_c divides |G|². Power residues and class permutations are determined at that level; apply the coordinate formula. For a general marked central model, assume explicitly that every element of its kernel is killed by |G|. This gives the same exponent bound for its cover. The reduced-multiplier case requires the integral transfer annihilation input.

Needs: RS.3, discrete cyclotomic action.

Checks: This is a bound on the finite-cover coordinate, not a claim that U is finite.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, Remark 4.1, author PDF p.8.

### Cyclotomic twist of a set

**Target `cyclotomic_twist`.** For a unit group B, a nonempty simply transitive B-set T and a B-set X, define X⟨−1⟩=Map_B(T,X), the set of equivariant functions. Evaluation at a chosen t₀∈T is a bijection to X; this bijection depends on t₀. For the papers T is the torsor of topological generators of prime-to-characteristic roots of unity.

Construction and proof route: Use the existing equivariant-map notion for a torsor. Its inverse sends b·t₀ to b·x; simple transitivity makes it well-defined. The field-specific roots-of-unity realization is supplied by the arithmetic consumer.

Needs: RS.3, discrete cyclotomic action.

Required API:

- `cyclotomic_twist_evaluation` (equivalence): Evaluation at t₀ gives X⟨−1⟩≅X.
- `cyclotomic_twist_change` (compatibility): Changing t₀ to b·t₀ changes the evaluated value by b acting on X.
- `cyclotomic_twist_map` (functoriality): An equivariant map X→Y induces X⟨−1⟩→Y⟨−1⟩ by composition.

Unit tests:

- `cyclotomic_twist_test_1` (degenerate): For singleton X, the twist is singleton.
- `cyclotomic_twist_test_2` (computation): For B=C₂ acting regularly on X=C₂ and T=C₂, there are two equivariant functions.
- `cyclotomic_twist_test_3` (non-example): Replacing equivariant maps by arbitrary maps gives four maps in that C₂ example; replacing them by fixed points gives none.

Source: Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland* (2021), author copy, §4, equation (2), author PDF p.6.

### Bounded total-degree slice

**Target `bounded_degree_slice`.** For finite D, n∈ℕ and M∈ℕ define L_{n,≥M}={m∈ℤ^D: every m(d)≥M and Σ m(d)=n}. Define K_{n,≥M} as its degree preimage and the twisted slice as equivariant functions valued in this invariant subset. For the notation of LWZB M is positive; M=0 is also allowed for component tuples.

Construction and proof route: Use a subset of the integer lattice, not a subgroup; degree permutation preserves its inequalities and sum. Restrict the action to the actual projection kernel and bundle its degree projection as an equivariant map. The twisted slice is the inverse image of the lattice slice under the induced map of equivariant functions. Evaluation at one torsor point detects membership because the lattice slice is invariant.

Needs: RS.3, power permutation of class degrees; RS.2, kernel of the universal marked extension; RS.3, cyclotomic twist of a set.

Required API:

- `bounded_degree_slice_mem` (characterisation): Membership means both the coordinate lower bound and exact total sum.
- `bounded_degree_slice_invariant` (structure): Each power permutation preserves the slice.
- `bounded_degree_slice_preimage` (compatibility): K_{n,≥M}⟨−1⟩ is the preimage under the twisted degree map.

Unit tests:

- `bounded_degree_slice_test_1` (degenerate): For D empty, the slice is singleton at n=0 and empty at n>0.
- `bounded_degree_slice_test_2` (computation): For |D|=2,n=3,M=1, the slice consists of (1,2),(2,1).
- `bounded_degree_slice_test_3` (non-example): For nonempty D,n=0,M=1, the slice is empty; it is never declared a group containing zero.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), §12, published PDF pp.56–57; arXiv v2 pp.47–48.

### Power-fixed degree lattice

**Target `power_fixed_degree`.** For q prime to |G| define L_{≡q}={m∈ℤ^D:m(d^q)=m(d) for all d}. Its n,≥M slice adds the lower-bound and exact total-degree conditions.

Construction and proof route: Use the fixed subgroup of the permutation, and the ordinary action orbit quotient. Rationality of c as a set does not imply each conjugacy class is fixed.

Needs: RS.3, power permutation of class degrees; RS.3, bounded total-degree slice.

Required API:

- `power_fixed_degree_fixed` (characterisation): L_{≡q} consists precisely of q-fixed degree vectors.
- `power_fixed_degree_orbits` (equivalence): Identify fixed vectors with integer-valued functions on the native orbit quotient D/⟨q⟩; evaluation at an orbit represented by d gives m(d).
- `power_fixed_degree_weighted_sum` (compatibility): Under this identification, total degree is Σ_O |O|m_O, not the unweighted sum.

Unit tests:

- `power_fixed_degree_test_1` (degenerate): At q≡1 modulo the exponent of G, L_{≡q}=L.
- `power_fixed_degree_test_2` (computation): For the two nontrivial classes of C₃ and q=2, L_{≡q}={(a,a):a∈ℤ}; total degree is 2a.
- `power_fixed_degree_test_3` (non-example): For this C₃ example, a total-degree-1 fixed slice is empty despite a nonempty unconstrained slice.

Source: Liu–Wood–Zureick-Brown (2022 preprint), §12, paragraph before Proposition 12.7, arXiv v2 PDF p.50.

### Orbit set of class degrees

**Target `degree_orbit_set`.** Define 𝔖^{c,G} as the orbit quotient of the integer lattice L under the unit-power coordinate permutation. Its n,≥M subset is the image of L_{n,≥M}. Choice of a roots-of-unity generator changes a degree vector within this orbit.

Construction and proof route: Take the existing action-orbit equivalence relation, then its quotient. Bundle the unit-power permutations as a homomorphism into the class permutation group and act on the integer lattice by `Finsupp.domCongr`. Evaluation of an equivariant twist at any two torsor points gives the same orbit class.

Needs: RS.3, power permutation of class degrees; RS.3, bounded total-degree slice; RS.3, cyclotomic twist of a set.

Required API:

- `degree_orbit_set_mk` (projection): Every degree vector has a class in 𝔖^{c,G}.
- `degree_orbit_set_eq` (characterisation): Two orbit classes are equal iff the vectors differ by a unit-power permutation.
- `degree_orbit_set_slice` (compatibility): The n,≥M image is independent of the choice of torsor generator.

Unit tests:

- `degree_orbit_set_test_1` (degenerate): For D empty, the orbit set is singleton.
- `degree_orbit_set_test_2` (computation): For C₃ nonidentity classes, (1,4) and (4,1) have the same orbit class.
- `degree_orbit_set_test_3` (non-example): For the same two-class set, (1,4) and (2,3) have different orbit classes despite equal total degree.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), §12, published PDF pp.56–57; arXiv v2 pp.47–48.

## RS.4: Fixed fibers, square obstructions and parity

Check the abelianization compatibility δ(m)=[g] before solving a fixed-fiber equation. For odd q put r=(q−1)/2. A nonempty fiber is a torsor under A[q−1]; its existence is controlled by whether the obstruction lies in the image of 2r-th powers. Linearize the lift-square columns on the free binary coordinate space, rather than linearizing a nonabelian squaring operation.

### Lift squares are central

**Target `involution_square_central`.** Assume c consists of involutions. For x∈c every lift X∈S_c has X²∈A=M(G,c), hence X² commutes with S_c.

Construction and proof route: Project X² to x²=1; apply centrality of the kernel.

Needs: RS.1, reduced schur cover.

Checks: No squaring homomorphism S_c→A is asserted on the nonabelian cover.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Square-class obstruction of a fiber

**Target `square_obstruction`.** Assume finite G is generated by involution classes c_i, A=M(G,c), chosen class lifts X_i, and g∈c∪{1} with lift Y (Y=1 for g=1). For an integer degree m with Σ_i m_i[c_i]=[g] in G^ab, define b(g,m)=Y²∏_i(X_i²)^−m_i∈A and β(g,m) as its class in TauCeti.ElementaryTwoQuotient A. Lift changes multiply b by a square; β depends only on the parity of m.

Construction and proof route: All squared factors lie in A. Replacing Y or X_i by central kernel factors inserts squares. Modulo squares, exponents reduce mod 2.

Needs: RS.4, lift squares are central; RS.2, the class degree homomorphism; `TauCeti.ElementaryTwoQuotient` (Tau Ceti); `TauCeti.elementaryTwoQuotientMk_mul` (Tau Ceti).

Required API:

- `square_obstruction_representative` (data): b(g,m)=Y²∏_i(X_i²)^−m_i.
- `square_obstruction_choice` (characterisation): β is independent of lift choices; b generally is not.
- `square_obstruction_parity` (simp): Changing each m_i by an even integer leaves β unchanged.
- `square_obstruction_compatibility` (compatibility): The domain first requires δ(m)=[g]; incompatible fibers are empty before this obstruction is considered.

Unit tests:

- `square_obstruction_test_1` (degenerate): For g=1 and m=0, β=0.
- `square_obstruction_test_2` (computation): For g∈c_k and m=e_k, β=0.
- `square_obstruction_test_3` (non-example): A degree incompatible with [g] cannot acquire a nonempty fiber merely because the formal square product is a square.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### The fixed-fiber power equation

**Target `fixed_fiber_equation`.** For the hypotheses of square-obstruction and odd q coprime to |G|, let r=(q−1)/2. Writing a fiber point as (Yh,m), the q-fixed equation is h^{q−1}=b(g,m)^{−r}. Since the power subgroup is closed under inversion, solvability is equivalent to b(g,m)^r∈A^{2r}.

Construction and proof route: Insert the coordinate action and c_i involutions in Wood equation (6); all correction factors are powers of central X_i². The Lean fiber consists of elements of the actual pullback with projection g and degree m, rather than formal solutions to the displayed power equation. Require that each chosen class representative represents its indexed inertia class. A q-unit is obtained from coprimality with the chosen common exponent of the cover and base.

Needs: RS.4, square-class obstruction of a fiber; RS.3, discrete cyclotomic action; `powMonoidHom` (Mathlib).

Checks: Keep the inverse sign in the equation for h even though it does not change membership in the power subgroup.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### All fixed fibers and their torsion count

**Target `all_fixed_fibers`.** For odd q>1 prime to |G|, the fiber over (g,m) has |A[q−1]| fixed points if δ(m)=[g] and b(g,m)^r∈A^{2r}, and zero otherwise. The q and q⁻¹ actions have the same fixed points. No nonnegativity of m is needed for this group-theoretic statement.

Construction and proof route: Apply the existing nonempty power-fiber equivalence to its kernel; a permutation and its inverse have the same fixed set. For an arbitrary finite central marked model, retain the finite-kernel hypothesis and count the fixed subset of the actual (g,m) fiber. Its cardinality is zero when degree compatibility or power-image membership fails.

Needs: RS.4, the fixed-fiber power equation; `MonoidHom.fiberEquivKer` (Mathlib).

Checks: An empty fiber must not be assigned the positive torsion count.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Odd-parity fixed-point fiber

**Target `odd_parity_fiber`.** If g∈c_k, m_k is odd and all other m_i are even, then the fiber is compatible and its fixed count is |A[q−1]|.

Construction and proof route: The abelianized involution classes give compatibility. The displayed b is a square, so b^r is a 2r-th power.

Needs: RS.4, all fixed fibers and their torsion count; RS.4, square-class obstruction of a fiber.

Checks: This proves nonemptiness, rather than assuming it from a torsor count.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Even-parity fixed-point fiber

**Target `even_parity_fiber`.** If g=1 and every m_i is even, then the compatible fiber has exactly |A[q−1]| fixed points.

Construction and proof route: The degree maps to 1 in G^ab and b is a product of even powers.

Needs: RS.4, all fixed fibers and their torsion count; RS.4, square-class obstruction of a fiber.

Checks: Negative even degrees are permitted in U; Hurwitz tuple counts restrict them separately.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Square-times-torsion solvability

**Target `square_torsion_solvability`.** For a commutative group A, b∈A and r≥1, b^r∈A^{2r} iff b∈A²·A[r].

Construction and proof route: If b^r=h^{2r}, then bh⁻²∈A[r]; the converse is obtained by raising a square times r-torsion element to r.

Needs: `powMonoidHom` (Mathlib).

Checks: For A=C₈,r=2 and an odd generator b, both conditions fail; for r=8 both hold.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Torsion-image filtration

**Target `torsion_image_filtration`.** For a finite abelian A let B=TauCeti.ElementaryTwoQuotient A. Define B_t to be the image in B of A[2^t]=ker(powMonoidHom(2^t)), regarded as a ZMod 2 subspace. B_0=0; the filtration is increasing and B_e=B when the 2-primary exponent is 2^e.

Construction and proof route: Restrict the square-class map to the specified torsion subgroup; its additive image is a submodule. Finite abelian primary decomposition proves exhaustion.

Needs: `powMonoidHom` (Mathlib); `TauCeti.ElementaryTwoQuotient` (Tau Ceti); `TauCeti.elementaryTwoQuotientMap` (Tau Ceti); `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib).

Required API:

- `torsion_image_filtration_zero` (simp): B_0=0, since A[1]={1}.
- `torsion_image_filtration_mono` (structure): t≤u implies B_t≤B_u.
- `torsion_image_filtration_exhaustive` (characterisation): B_e=B for 2-primary exponent 2^e.
- `torsion_image_filtration_cyclic` (compatibility): For A=C_{2^e}, B_t=0 for t<e and B_t=B for t≥e.

Unit tests:

- `torsion_image_filtration_test_1` (degenerate): For A of odd order, B_t=0=B for every t.
- `torsion_image_filtration_test_2` (computation): For A=C₈, the filtration is zero at t=0,1,2 and all C₂ at t=3.
- `torsion_image_filtration_test_3` (non-example): In C₈, the nontrivial 2-torsion element is a square, so its image in B_1 is zero; the quotient is not the torsion subgroup.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Two-primary obstruction threshold

**Target `obstruction_threshold`.** For b∈finite abelian A with 2-primary exponent 2^e define t_A(b)=min{t≥0: the class of b belongs to B_t}. It lies between 0 and e. It depends only on the square class, and equals max{e_j : b has odd coordinate in a cyclic factor C_{2^{e_j}}} (empty maximum 0).

Construction and proof route: Exhaustion ensures the minimum exists. Compute the torsion image separately in each cyclic factor; the odd-primary part is uniquely 2-divisible.

Needs: RS.4, torsion-image filtration; RS.4, square-times-torsion solvability; `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib).

Required API:

- `obstruction_threshold_zero` (characterisation): t_A(b)=0 iff b is a square.
- `obstruction_threshold_class` (compatibility): Equal square classes have equal thresholds.
- `obstruction_threshold_bound` (data): 0≤t_A(b)≤e.
- `obstruction_threshold_cyclic` (simp): For a generator of C_{2^e}, e>0, t_A(b)=e.

Unit tests:

- `obstruction_threshold_test_1` (degenerate): t_A(1)=0.
- `obstruction_threshold_test_2` (computation): For b=(generator,1) in C₄×C₈, the threshold is 2.
- `obstruction_threshold_test_3` (non-example): For a generator in C₈ the threshold is 3, not 1 despite its nonzero image in a one-dimensional square quotient.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Two-adic criterion for fiber survival

**Target `two_adic_survival`.** For odd q>1 prime to |G| and compatible degree m, the fixed fiber is nonempty iff v₂(q−1)≥t_A(b(g,m))+1.

Construction and proof route: Put r=(q−1)/2; its odd part contributes no new square classes, so the image of A[r] is B_{v₂(r)}.

Needs: RS.4, all fixed fibers and their torsion count; RS.4, two-primary obstruction threshold; RS.4, square-times-torsion solvability.

Checks: The Proposition 4.1 parities have threshold 0 and survive every allowed odd q.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Involution classes span the abelianization

**Target `involution_abelianization`.** If c consists of N generating involution classes, G^ab is an elementary abelian 2-group. There is a surjective F₂-linear map a:F₂^N→Additive(G^ab), a(e_i)=[c_i].

Construction and proof route: Every abelianized generator has order dividing 2; extend on the free F₂-vector space and use generation.

Use `AddCommGroup.zmodModule` with the proved identity 2·u=0 to give the existing carrier Additive(G^ab) its F₂-module structure. The class map on binary coordinates retains the basis values of δ; this construction preserves the existing group operations.

Needs: RS.2, the class degree homomorphism; `Abelianization` (Mathlib).

Checks: Distinct conjugacy classes need not give linearly independent abelianized images.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Lift-square class columns

**Target `lift_square_columns`.** For each involution class c_i, the class s_i of X_i² in B=A/A² is independent of both the lift and the representative in c_i.

Construction and proof route: Lift changes insert squares of central factors; conjugation fixes the central lift square.

Needs: RS.4, lift squares are central; `TauCeti.elementaryTwoQuotientMk_mul` (Tau Ceti).

Checks: Only class columns are defined; squaring all nonabelian cover elements is not a homomorphism.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### The parity and lift-square maps

**Target `parity_square_map`.** With V=F₂^N, the already constructed a:V→Additive(G^ab), and B=TauCeti.ElementaryTwoQuotient A, define s:V→B by the lift-square columns s(e_i)=s_i. Extend only on the free vector space, not on G or S_c.

Construction and proof route: Specify basis values and use the free-vector-space universal property.

Extract X_i² in the injected kernel using `GroupExtension` exactness before taking its image in `TauCeti.ElementaryTwoQuotient A`. On the finite coordinate space, s(v)=Σ_i v_i·class(X_i²). This formula supplies the adapter from the extension's chosen marked lifts to the binary linear map.

Needs: RS.4, involution classes span the abelianization; RS.4, lift-square class columns.

Required API:

- `parity_square_map_basis_s` (simp): s(e_i)=class(X_i²).
- `parity_square_map_linear` (structure): Both maps preserve addition and F₂ scalar multiplication.
- `parity_square_map_quotient` (compatibility): s uses the existing TauCeti elementary-2 quotient of A.

Unit tests:

- `parity_square_map_test_1` (degenerate): a(0)=0 and s(0)=0.
- `parity_square_map_test_2` (computation): For S₃ transpositions and its identity reduced cover, V=U=F₂, a=id, B=0 and s=0.
- `parity_square_map_test_3` (non-example): For distinct classes with the same abelianized image, a(e₁+e₂)=0 even though e₁+e₂≠0. In S₆ the class of a transposition and the class of three disjoint transpositions give an explicit example: their cycle types differ and both have odd sign.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6), Remark 4.2, printed pp.400–401 (PDF pp.24–25).

### Compatible parities and their obstruction

**Target `affine_compatible_parities`.** For g=1 set v_g=0; for g∈c_k set v_g=e_k. Compatible ε are exactly v_g+ker a, and β(g,ε)=s(v_g+ε).

Construction and proof route: The abelianization condition is a(ε)=a(v_g). Over F₂ subtraction equals addition, and the central-square product gives the displayed s value.

Needs: RS.4, the parity and lift-square maps; RS.4, square-class obstruction of a fiber.

A signature includes either the identity with lift 1, or an actual x∈c with its marked lift. Write v_g=0 in the first case and v_g=e_[x] in the second. For an integer degree m, let ε(m)_d be m_d reduced modulo 2. The signature square is the kernel element extracted from the square of this chosen lift. The equivalence with ε(m)+v_g∈ker a uses the actual degree-to-abelianization map, and the square-obstruction identity uses the actual extension's marked square columns. Each chosen representative x_d must belong to its indexed conjugacy class.

Checks: Use a signature translate; ker a alone only describes the g=1 case.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

### Joint parity constraint map

**Target `joint_parity_map`.** Put U_ab=Additive(G^ab), with its elementary-2 vector-space structure. For t≥0 define the linear map L_t:V→U_ab⊕(B/B_t), v↦(a(v),s(v) mod B_t). Its kernel consists of degree parities compatible with the identity and with square obstruction in B_t.

Construction and proof route: Compose s with the quotient linear map and pair with a using existing product linear maps.

Needs: RS.4, the parity and lift-square maps; RS.4, torsion-image filtration.

Required API:

- `joint_parity_map_apply` (data): L_t(v)=(a(v),class(s(v)) in B/B_t).
- `joint_parity_map_kernel` (characterisation): v∈kerL_t iff a(v)=0 and s(v)∈B_t.
- `joint_parity_map_mono_kernel` (functoriality): t≤u implies kerL_t⊆kerL_u.
- `joint_parity_map_last` (compatibility): At t=e, kerL_e=ker a.

Unit tests:

- `joint_parity_map_test_1` (degenerate): L_t(0)=0.
- `joint_parity_map_test_2` (computation): For a=0,s=id on F₂ and B_t=0, kerL_t=0; when B_t=B, kerL_t=F₂.
- `joint_parity_map_test_3` (non-example): Using only a misses the obstruction in the first of those cases.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

### Surviving parities form an affine kernel coset

**Target `surviving_parities`.** If v₂(q−1)=t+1, the parities giving nonempty fixed fibers are C_t^g=v_g+kerL_t. Each corresponding compatible integer-degree fiber has |A[q−1]| fixed points.

Construction and proof route: Membership combines a compatibility equation and the quotient obstruction equation. Translate by v_g.

Needs: RS.4, joint parity constraint map; RS.4, compatible parities and their obstruction; RS.4, two-adic criterion for fiber survival.

Instantiate L_t with the existing involution abelianization map and the lift-square map of the marked extension. For every integer degree m, the actual fixed subset of the pullback over (g,m) is nonempty exactly when ε(m)+v_g∈ker L_t. The fixed subset then has cardinality |ker(a↦a^{q−1})|. This specializes to the reduced-cover model, where A is the reduced multiplier; it also holds for any finite central marked model. The conditions are q>1, q odd, and q coprime to a positive common exponent n of the cover and G. No upper bound q<n is required.

Checks: Lower bounds on coordinates and an exact total degree enter the subsequent integer-degree count. They are not hypotheses of the fixed-fiber criterion itself.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

### Ranks count surviving parities

**Target `rank_parity_count`.** |C_t^g|=2^{N−rankL_t}. For K_t=2^{N−rankL_t} and K_{−1}=0, the number of compatible parities with exact threshold t is K_t−K_{t−1}. Real and imaginary signatures have equal parity cardinalities, without an asserted equality of weights.

Construction and proof route: Translation preserves cardinality; use rank-nullity and finite-vector-space cardinality. Increasing kernels give the histogram difference.

Needs: RS.4, surviving parities form an affine kernel coset; `LinearMap.finrank_range_add_finrank_ker` (Mathlib); `Module.card_eq_pow_finrank` (Mathlib).

For t=0 the exact-threshold set is the entire translated kernel of L_0. For t>0 it is the translated kernel of L_t with the translated kernel of L_{t−1} removed. On a compatible actual degree fiber this condition is equivalent to threshold β(g,m)=t. The kernels are nested because B_{t−1}⊆B_t, so ordinary natural-number subtraction gives the stated histogram. Translation identifies the parity counts for any two signatures, independently of the chosen representative lifts.

Checks: A translated coset can have a different weight enumerator despite equal cardinality.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

### Weight enumerator of a surviving parity coset

**Target `parity_weight_enumerator`.** For C_t^g⊆F₂^N and lower bound N₀≥0, set δ=N₀ mod 2 and W_t^g(X)=Σ_{ε∈C_t^g} X^{wt(ε+δ·1)}∈ℕ[X]. The exponent is the excess above the coordinate lower bound of the least nonnegative degree of parity ε.

Construction and proof route: Take a finite polynomial sum. The associated counting-series interface is X^{NN₀}W(X)/(1−X²)^N, but no Tauberian theorem or asymptotic limit is built here.

Needs: RS.4, surviving parities form an affine kernel coset.

Required API:

- `parity_weight_enumerator_coefficient` (characterisation): The coefficient of X^j is the number of ε with wt(ε+δ·1)=j.
- `parity_weight_enumerator_at_one` (simp): W(1)=|C_t^g|.
- `parity_weight_enumerator_translation` (compatibility): Changing the lower-bound parity translates the weight argument, not the surviving affine coset.

Unit tests:

- `parity_weight_enumerator_test_1` (degenerate): For N=0 and the singleton parity, W=1.
- `parity_weight_enumerator_test_2` (computation): For N=1,N₀=0, C={0} gives 1 and C={1} gives X.
- `parity_weight_enumerator_test_3` (non-example): Those two cosets have equal cardinality but unequal polynomials; signature counts cannot be identified by cardinality alone.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

### Independent class images eliminate the obstruction

**Target `independent_classes`.** If the N class images in G^ab are linearly independent, then a is an isomorphism. Each g-signature has the sole compatible parity v_g, β=0, and a nonempty fixed fiber for every allowed q.

Construction and proof route: Surjectivity and basis independence give an isomorphism; its kernel is zero, and s(0)=0.

Needs: RS.4, the parity and lift-square maps; RS.4, compatible parities and their obstruction; RS.4, surviving parities form an affine kernel coset.

State independence on the actual elements [x_d] in Additive(G^ab), using the elementary-2 module structure supplied by generation by involutions. The bijectivity of a identifies degree compatibility with ε(m)=v_g. The square-obstruction class is then zero, and for every allowed q the actual fixed fiber is nonempty with |A[q−1]| elements. Generation, valid class representatives, finiteness of A, and the common exponent hypotheses remain explicit; independence does not replace any of them.

Checks: No condition on the size of the reduced multiplier is needed.

Source: Derived from Wood’s fixed-fiber equation in *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1 and equation (6), printed pp.400–401 (PDF pp.24–25), by the square-class and finite-vector-space arguments above. The affine-kernel and histogram formulas are consequences developed here, rather than separately numbered results in that paper.

## RS.5: Coprime semidirect products and compatible covers

Let G=H⋊Γ with H and Γ finite and coprime in order. The cover construction uses these hypotheses; admissibility is additionally needed for the inertia-class and abelianization statements. Distinguish the H-primary kernel before reduction from its quotient after reduction. Its order being prime to |Γ| does not imply it is prime to an arbitrary power exponent.

### Split projections induce homology surjections

**Target `split_homology_surjection`.** For finite G=H⋊Γ, the projection ρ:G→Γ has a section, hence ρ_*:M(G)→M(Γ) is onto.

Construction and proof route: Apply homology functoriality to the projection-section composite.

Needs: `groupHomology.map` (Mathlib); `groupHomology.map_comp` (Mathlib).

Checks: For H=1 this is the identity of M(Γ).

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### Primary parts of a coprime semidirect multiplier

**Target `multiplier_primary_support`.** For finite H,Γ with coprime orders and G=H⋊Γ, M(G) is finite of exponent dividing |G|. Its canonical primary decomposition M_H×M_Γ uses primes dividing |H| and primes dividing |Γ|.

Construction and proof route: Import the transfer bound on positive-degree integral homology and finite abelian primary decomposition; no assertion that the whole multiplier has exponent 2 is made.

The two parts can be represented by Mathlib's `AddCommGroup.primaryComponent` with parameters |H| and |Γ|, respectively. For a composite parameter n this subgroup consists of elements annihilated by a power of n. The isomorphism to their product must reconstruct each original class by adding its two components; the product cardinality alone does not specify the projections.

Needs: RS.5, split projections induce homology surjections; `AddCommGroup.equiv_directSum_zmod_of_finite` (Mathlib).

Checks: For Γ=1 the Γ-primary part is trivial; for H=1 the H-primary part is trivial.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### The coprime central splitting is unique

**Target `central_coprime_splitting`.** For the chosen Schur cover S→H⋊Γ, write S′ as the preimage of H. The central extension 1→M_Γ→S′/M_H→H→1 has a unique splitting and is isomorphic to M_Γ×H.

Construction and proof route: Schur–Zassenhaus gives a complement and thus a splitting. The difference of two splittings is a homomorphism H→M_Γ, trivial by coprime cardinalities.

Use the native `GroupExtension.Splitting` for the section. The reusable central-extension statement assumes finite kernel and quotient, their coprime cardinalities, and explicit centrality, and concludes both existence and uniqueness of the splitting. Its product isomorphism sends (a,h) to inl(a)s(h). This uniqueness concerns a central extension; the inertia application below requires the separate conjugacy theorem for complements in a possibly noncentral semidirect product.

Needs: RS.5, primary parts of a coprime semidirect multiplier; InductionRestriction, Layer 7; `Subgroup.exists_right_complement'_of_coprime` (Mathlib); `GroupExtension.Splitting` (Mathlib).

Checks: Centrality is essential for the homomorphic difference and the direct-product conclusion.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### The Hall preimage is normal in the cover

**Target `hall_preimage_normal`.** Let φ:S′/M_H→M_Γ be the projection obtained from the unique splitting, and D its kernel preimage in S′. Then D is characteristic in S′, normal in S, and |D|=|H||M_H|.

Construction and proof route: The subgroup D is normal in S′ as a kernel preimage, and its order |H||M_H| is coprime to its index |M_Γ|. Any subgroup of S′ of order |D| has trivial image in S′/D by coprimality, so is contained in D and equals D. Thus D is the unique Hall subgroup of this order and is characteristic. Since S′ is normal in S, D is normal in S.

The subgroup-level interface retains the normal inclusion S′⊆S and the actual surjection θ:S′→M_Γ. It identifies D with kerθ mapped into S, proves kerθ characteristic in S′, and preserves its cardinality under that inclusion. The cardinality formula |S′|=|kerθ||M_Γ| uses surjectivity of θ.

Needs: RS.5, the coprime central splitting is unique.

Checks: Being merely a chosen complement would not establish normality in S.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### Compatible Schur covers

**Target `compatible_covers`.** For finite H,Γ of coprime orders and G=H⋊Γ, choose a Schur cover S→G and let S_Γ=S/D with D from the preceding construction. The quotient S→S_Γ covers G→Γ. The lower central extension has kernel M_Γ and is an ordinary Schur cover of Γ.

Construction and proof route: The quotient S/D→Γ is a central extension with kernel M_Γ. Naturality gives τ_lower∘ρ=pr_Γ∘τ_S, where τ_S is an isomorphism. The map ρ is onto because G→Γ splits. Its target M(Γ) is Γ-primary, hence ρ kills M_H. On M_Γ, the displayed composite is the identity, so ρ restricted to M_Γ is injective and τ_lower is onto. Surjectivity of ρ, together with ρ(M_H)=0, makes that restriction onto M(Γ), hence an isomorphism. Therefore τ_lower is its inverse, S/D is a Schur cover, and kerρ=M_H. This proves the primary-kernel claim before using it.

A compatible-cover diagram records D with its normality, the projection S/D→Γ, centrality and the stem condition, and the lower integral kernel isomorphism. The upper and lower isomorphisms are the extension-class evaluation maps. An arbitrary abstract isomorphism from homology to the kernel is insufficient for the naturality square. For every z∈M(G), quotienting τ_S(z) in S gives τ_lower(ρ_*(z)) in S/D; this equation also controls the descended reduced-cover maps.

Needs: RS.5, the hall preimage is normal in the cover; RS.5, split projections induce homology surjections; InductionRestriction, Layer 7.

Required API:

- `compatible_covers_square` (compatibility): The diagram S→G, S_Γ→Γ, S→S_Γ, G→Γ commutes.
- `compatible_covers_kernel` (projection): The cover-kernel map is M_H×M_Γ→M_Γ.
- `compatible_covers_schur` (characterisation): The lower class map τ_{S_Γ}:M(Γ)≅M_Γ is an isomorphism.
- `compatible_covers_choice` (data): These covers are compatible choices, not canonical covers functorial for every group map.

Unit tests:

- `compatible_covers_test_1` (degenerate): For H=1 take S=S_Γ and the identity cover map.
- `compatible_covers_test_2` (degenerate): For Γ=1 take the lower cover to be trivial, with upper cover mapping to it.
- `compatible_covers_test_3` (computation): For H=C₃ with inversion by Γ=C₂, G=S₃ and both ordinary multipliers are trivial, so the identity covers are compatible.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### The multiplier-map kernel is H-primary

**Target `multiplier_kernel_primary`.** For these finite coprime semidirect products, ker(M(G)→M(Γ))≅M_H and its order is prime to |Γ|. The paper states admissibility too; the inspected cover proof uses only finiteness and coprime orders.

Construction and proof route: Use the natural UCT class-map diagram and the projection onto M_Γ.

Needs: RS.5, compatible schur covers; RS.5, primary parts of a coprime semidirect multiplier.

Checks: Prime to |Γ| alone does not imply prime to an arbitrary q−1.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Lemma 12.10 and proof, published PDF pp.62–63; proof of Theorem 10.4 p.64; arXiv v2 pp.53–54.

### Admissible equal-order inertia classes

**Target `admissible_inertia_classes`.** Let H and Γ be finite groups of coprime orders, with an action of Γ on H. Assume H is generated by h⁻¹γ(h) for h∈H,γ∈Γ (finite admissibility). In G=H⋊Γ let c consist of nonidentity elements having the same order as their image in Γ. Then c generates G, is conjugacy- and invertible-power-stable, and c/G→(Γ∖{1})/Γ is a bijection.

Construction and proof route: The coprime cyclic-subgroup splitting gives conjugacy to elements (1,γ); its uniqueness up to H-conjugation supplies the class bijection. The admissible generators and embedded Γ generate G.

Retain the action Γ→Aut(H) and the native semidirect-product projection. The generating subset of H is exactly the set of h⁻¹γ(h), and c excludes the identity before imposing equality of orders. The conjugacy input asserts that an equal-order g is h(1,ρ(g))h⁻¹ for some h∈H. The class-lattice map sends e_[g] to e_[ρ(g)] and intertwines δ with the induced map on abelianizations. The abelianization comparison itself only needs the admissible generating condition; its proof does not use complement conjugacy.

Needs: `GroupExtension` (Mathlib); `Subgroup.exists_right_complement'_of_coprime` (Mathlib).

Checks: Exclude 1 explicitly; equality of orders alone would include it.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Proof of Theorem 10.4, published PDF p.64; arXiv v2 p.54.

### Admissible semidirect abelianization

**Target `admissible_abelianization`.** For such admissible H, projection G^ab→Γ^ab is an isomorphism, and the class-lattice maps δ correspond under the bijection c/G≅(Γ∖{1})/Γ.

Construction and proof route: Each h⁻¹γ(h) is a commutator in G; admissibility kills all H in the abelianization, while the section supplies the inverse.

Needs: RS.5, admissible equal-order inertia classes; `Abelianization.lift` (Mathlib).

Checks: For H=C₃ and trivial Γ-action, admissibility fails and H survives in G^ab.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Proof of Theorem 10.4, published PDF p.64; arXiv v2 p.54.

### The Schur relation map is surjective

**Target `relations_surjection`.** For the c above and d=Γ∖{1}, the split projection sends Q_c onto Q_d.

Construction and proof route: All commuting-pair classes map into Q_d; conversely each generator in Γ lifts through the embedded Γ to a commuting pair with its first element in c.

Needs: RS.5, admissible equal-order inertia classes; RS.1, universal homological commutator; RS.1, schur commutator relations.

Checks: The reverse inclusion uses the splitting, not merely surjectivity of G→Γ.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Proof of Theorem 10.4, published PDF p.64; arXiv v2 p.54.

### Compatible reduced multipliers

**Target `reduced_kernel_primary`.** The induced M(G,c)→M(Γ,d) is surjective with H-primary kernel, so its kernel order is prime to |Γ|. The compatible cover map descends to S_c→(S_Γ)_d and commutes with the reduced-kernel isomorphisms.

Construction and proof route: For a surjection M(G)→M(Γ) carrying Q_c onto Q_d, the new kernel is a quotient of its H-primary kernel. Descend the cover map via the same relation images.

Specify that quotient through a surjection from M_H to the kernel of the reduced-multiplier map, sending z to its class modulo Q_c. The descended cover homomorphism sends the class of s in S_c to the class of sD in (S/D)_d. Its projection square and kernel square must use the actual quotient maps and the reduced kernel isomorphisms.

Needs: RS.5, the schur relation map is surjective; RS.5, the multiplier-map kernel is h-primary; RS.1, reduced schur cover.

Checks: Quotienting can shrink the primary kernel; it is not asserted equal to the unreduced M_H.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Proof of Theorem 10.4, published PDF p.64; arXiv v2 p.54.

### Compatibility of power corrections

**Target `compatible_correction`.** Choose class representatives and marked lifts compatible with S_c→(S_Γ)_d. For every unit α, its reduced-kernel map f satisfies f(W^G_α(m))=W^Γ_α(classMap(m)). The marked U and K maps intertwine the discrete actions.

Construction and proof route: Apply the cover map to the defining lift-power products; homomorphisms commute with finite powers.

For central marked extensions M,N, retain the kernel, cover and base homomorphisms a,e,ρ, their injection and projection squares, and e(x̂)=widehat(ρ(x)). The induced class map gives a homomorphism of integer lattices by sending each class basis vector to its image basis vector. With a positive common exponent for both covers and base groups, the correction identity induces a homomorphism of their marked fiber products and intertwines the discrete set actions. Restriction to the actual projection kernels gives the kernel-action comparison.

Needs: RS.5, compatible reduced multipliers; RS.3, central power correction; RS.5, admissible semidirect abelianization.

Checks: A root-count comparison additionally requires the kernel order prime to q−1; that extra hypothesis belongs to its arithmetic-statistics consumer.

Source: Liu–Wood–Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (2024), Proof of Theorem 10.4, published PDF p.64; arXiv v2 p.54.

## RS.6: Certified finite examples

A finite central surjection becomes a computational input only with a proved Schur-cover certificate. Compute the relation subgroup from centralizer generators, then take the kernel quotient and its square-class filtration. Embedded type enumeration belongs to ST.3. Each row below is a certification target for the specified marked type, not a substitute for its executable data.

### Odd-index-two homology reduction

**Target `odd_index_two_reduction`.** For finite H normal in G with |H| odd and G/H=C₂, M(G)≅M(H)_{C₂} and M(G) has odd order. For any union c of involution classes, Q_c=0 and M(G,c)=M(G).

Construction and proof route: In the integral homological LHS spectral sequence, positive C₂-homology of the odd-order positive-degree H-homology modules vanishes. The (2,0) term is H₂(C₂,ℤ)=0. The only possible remaining incoming differential to (0,2) is d₃ from a subquotient of H₃(C₂,ℤ), which is 2-primary; its odd-order target forces it to vanish. Thus the edge map identifies H₂(G,ℤ) with the C₂-coinvariants of H₂(H,ℤ).  Commuting-pair classes with an involution entry are killed by 2 and therefore vanish in this odd-order multiplier.

Use `Representation.Coinvariants` for the integral homology representation induced by conjugation on the normal subgroup H. Inner conjugation by H acts trivially, so the G-action factors through G/H. The edge isomorphism sends the inclusion-induced image of z∈M(H) to the native coinvariant class of z. This identifies the map as well as the two abstract groups. The vanishing relation conclusion also permits any subset whose elements square to the identity.

Needs: RS.1, universal homological commutator; RS.1, reduced schur multiplier; RS.1, commuting-pair classes respect orders.

Checks: This does not extend to even-order H.

Source: Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II* (2012), withdrawn preprint, Example 9.3.2, arXiv v1 PDF p.57.

### The order-96 A₄ arithmetic type

**Target `order96_type`.** Let ab:A₄→C₃ be its abelianization map. Put K=ker((a,b)↦ab(a)+ab(b)) inside A₄², and F=K⋊C₂ with the involution swapping the two A₄ factors. Then |K|=48 and |F|=96. Use the explicit embedding F⊆A₄≀C₂ and c its outside order-2 elements for the reduced multiplier, rather than an unmarked abstract SmallGroups label.

Construction and proof route: The sum map A₄²→C₃ is onto and preserved by swap; form its kernel and restricted semidirect product. The finite embedded-type enumeration belongs to ST.3.

The abelianization fixture is a surjection A₄→C₃ with kernel [A₄,A₄], used consistently on both coordinates. The multiplicative form of the kernel condition is ab(a)ab(b)=1. Swapping coordinates defines an automorphism of this actual kernel and hence the C₂-action. The homomorphism into (A₄×A₄)⋊C₂ retains both coordinates and the swap coordinate and is injective. The outside-involution set uses that projection, not a cardinality test or a chosen abstract group identifier.

Needs: `GroupExtension` (Mathlib); `Abelianization.of` (Mathlib).

Required API:

- `order96_type_kernel` (characterisation): K consists exactly of pairs with ab(a)+ab(b)=0.
- `order96_type_swap` (structure): Swap preserves K and squares to the identity.
- `order96_type_order` (example): |K|=48 and |F|=96.
- `order96_type_outside` (projection): The quotient F→C₂ is the swap coordinate; c is its outside involution set.

Unit tests:

- `order96_type_test_1` (computation): A pair of 3-cycles with abelianized values 1,2 belongs to K.
- `order96_type_test_2` (non-example): A pair with values 1,1 does not belong to K; using the difference instead of the sum builds another specified kernel.
- `order96_type_test_3` (compatibility): The outside element ((1,1),swap) has order 2 and projects nontrivially.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), Appendix opening, printed p.420 (PDF p.44).

### Commutators define a centralizer homomorphism

**Target `centralizer_commutator_hom`.** For fixed x∈c in a central extension E→G, the lift-commutator function κ_E(x,−):C_G(x)→A is a group homomorphism.

Construction and proof route: Choose product lifts and expand [X,YZ]; the two kernel commutators are central, so conjugation terms disappear.

Needs: RS.1, commutator of lifts.

Checks: Its domain is the centralizer, not all of G.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix opening p.420 (PDF pp.11,43–44).

### Centralizer generators suffice for reduction

**Target `centralizer_generator_relations`.** For a central extension E→G, the subgroup generated by all κ_E(x,y) with x∈c,y∈C_G(x) equals that generated using one representative per class in c and any group-generating set of its centralizer.

Construction and proof route: At fixed x the commutator-of-lifts map C_G(x)→A is a homomorphism because its values are central. Conjugating both arguments preserves the central result.

Needs: RS.1, commutator of lifts; RS.1, conjugacy-equivariant lifted marking; RS.6, commutators define a centralizer homomorphism.

Checks: Do not use arbitrary generators of G; they need not belong to the relevant centralizer.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix opening p.420 (PDF pp.11,43–44).

### Finite reduced-cover certificate

**Target `reduction_certificate`.** A certificate for explicit finite groups E,G and π:E→G contains executable multiplication/inverse tables, a surjective homomorphism π, centrality of its kernel, an independently checked ordinary Schur-cover certificate (stem plus maximal kernel/class-map isomorphism), class representatives for c, generating sets for their centralizers, and the subgroup R generated by their lift commutators. Its conclusion identifies A=kerπ/R with M(G,c). The computational data include proofs of the cover properties and of the marked subgroup identifications.

Construction and proof route: Check finite tables, maps, centrality, generating sets, subgroup closure and quotient cardinality; invoke the separately certified cover maximality before identifying the kernel with homology.

Fix enumerations E≃Fin |E| and G≃Fin |G|. Multiplication, inverse and projection tables are transported from these native groups through the enumerations, with their laws proved. The certificate's oriented class isomorphism evaluates every commuting pair as XYX⁻¹Y⁻¹. For each class representative, its selected finite centralizer generators generate the actual centralizer subgroup. The closure of their lift commutators in kerπ is then the image of Q_c. On an integral class z, the quotient equivalence sends its reduced class to the quotient class of τ_E(z).

Transport along group isomorphisms must preserve π and c; transport to an arithmetic type also retains its ambient embedding from ST.3. Conjugacy-equivariant markings in the reduced cover retain the selected representative lifts. These choices provide the lift-square columns used by the parity computation.

Needs: RS.6, centralizer generators suffice for reduction; RS.1, reduced schur cover; InductionRestriction, Layer 7.

Required API:

- `reduction_certificate_tables` (data): Group operations and π are finite executable data, with checked associativity and map laws.
- `reduction_certificate_relations` (projection): The checked subgroup R is exactly the image of Q_c in kerπ.
- `reduction_certificate_quotient` (equivalence): A≅M(G,c) only after the independent Schur-cover certification.
- `reduction_certificate_transport` (compatibility): An explicit marked isomorphism transports the certificate to the selected embedded arithmetic type.

Unit tests:

- `reduction_certificate_test_1` (degenerate): For G=E=1 and c empty, R and A are trivial.
- `reduction_certificate_test_2` (computation): For D₈→C₂² with c all nonidentity elements, one nontrivial central commutator generates kerπ and A=1.
- `reduction_certificate_test_3` (non-example): The central surjection C₄→C₂ has a kernel of order 2 but is not a Schur cover of C₂; a checker must reject the identification A=M(C₂,c).

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix opening p.420 (PDF pp.11,43–44).

### Finite reduced-cover parity algorithm

**Target `finite_parity_algorithm`.** Given a checked reduction certificate, a generating involution c, a homomorphism π₀:G→C₂ and a chosen τ∈c with π₀(τ)≠1, compute the class columns a,s, the torsion-image spaces B_t, both cosets C_t^1 and C_t^τ, their ranks, exact-threshold histograms and lower-bound weight enumerators. The algorithm is finite and exact conditional on the certified ordinary cover and explicit marked embedding.

Construction and proof route: Construct the reduced quotient group, then use finite linear algebra over F₂ and finite polynomial enumeration. The theorem-level rank identities provide independent cross-checks.

For each threshold t and signature g, enumerate the finite parity space and retain exactly those v with L_t(v+v_g)=0. Obtain the class and square columns from the certified reduced marked model. The resulting membership test is equivalent to degree compatibility together with the actual square obstruction lying in B_t. The histogram at t=0 is the first coset cardinality; at positive t it subtracts the preceding coset cardinality. For lower bound N₀, the weight polynomial counts each surviving v with exponent equal to the number of nonzero coordinates of v+(N₀ mod 2). An executable implementation supplies decidable table representations of the quotients and filtration, as well as the logical finite-enumeration specification.

Needs: RS.6, finite reduced-cover certificate; RS.4, joint parity constraint map; RS.4, ranks count surviving parities; RS.4, weight enumerator of a surviving parity coset.

Required API:

- `finite_parity_algorithm_obstruction` (compatibility): The computed column map equals the lift-square map in the existing elementary-2 quotient.
- `finite_parity_algorithm_cosets` (characterisation): Computed surviving parities are precisely v_g+kerL_t.
- `finite_parity_algorithm_counts` (compatibility): Computed cardinalities equal 2^{N−rankL_t} and histogram differences.
- `finite_parity_algorithm_weights` (projection): The output polynomial is the exact finite weight sum, not an asymptotic estimate.

Unit tests:

- `finite_parity_algorithm_test_1` (computation): For S₃ transpositions, a=id on F₂, A=0, each signature has one parity and threshold 0.
- `finite_parity_algorithm_test_2` (degenerate): For trivial A every compatible parity survives all odd q.
- `finite_parity_algorithm_test_3` (non-example): For the algebraic fixture A=C₈ with one odd square column, survival first occurs at v₂(q−1)=4; do not label this an admissible arithmetic-type counterexample.

Source: The parity algorithm is derived from Wood, *Nonabelian Cohen–Lenstra moments* (2019), §4.1, Proposition 4.1, equation (6) and Remark 4.2, printed pp.400–401 (PDF pp.24–25), together with the finite linear algebra in RS.4. Its certified-cover input uses §2.3 p.387; its marked examples use Table 2 p.419 and the Appendix opening p.420.

### Reduced multiplier of the order-96 type

**Target `order96_reduced_multiplier`.** For the embedded order-96 type F with outside-involution c, prove M(F,c)≅C₂. Build an explicit ordinary cover with its oriented kernel identification, compute the generated reduction subgroup, and certify the quotient. The C₂³ kernel and order-4 relation subgroup are computational data that require verification in this construction.

Construction and proof route: A complete certificate must establish the cover-kernel class isomorphism, the outside c and its centralizer-generated relations, then show the quotient kernel is cyclic of order 2.

Needs: RS.6, the order-96 a₄ arithmetic type; RS.6, finite reduced-cover certificate.

Checks: No moment limit or type enumeration follows from this multiplier value.

Source: Wood, *Nonabelian Cohen–Lenstra moments* (2019), §2.3 p.387; Table 2 p.419; Appendix opening p.420 (PDF pp.11,43–44).

### Marked-group certification targets

For every row, c is the set of involutions outside the index-two kernel in the specified good admissible embedding F⊆G≀C₂, and c has one F-conjugacy class. Construct the marked embedding, its outside-involution subset, a certified cover, centralizer generators, the relation subgroup and the quotient isomorphism. Different embeddings of the same abstract group must be transported as marked embeddings. The bracketed number is the SmallGroups identifier within the order context stated in the row.

Needs: RS.6 reduction certificate and the ST.3 embedded type. Source: Wood (2019), §8.2, Table 2, p.419; the A₄ embedding is specified at the beginning of the Appendix, p.420.

| Target | Group G and marked group F | Reduced multiplier |
| --- | --- | --- |
| `table_row_01` | G=C_3, F=S_3. | 1 |
| `table_row_02` | G=C_5, F=D_{10}. | 1 |
| `table_row_03` | G=C_7, F=D_{14}. | 1 |
| `table_row_04` | G=C_9, F=D_{18}. | 1 |
| `table_row_05` | G=C_3^2 , F=(C_3^2) ⋊ C_2 [4]. Order context order(F)=18. | C_3 |
| `table_row_06` | G=C_{11}, F=D_{22}. | 1 |
| `table_row_07` | G=A_4, F=S_4. | 1 |
| `table_row_08` | G=A_4, F=((C_2^4) ⋊ C_3) ⋊ C_2 [227]. Order context order(F)=96. | C_2 |
| `table_row_09` | G=C_{13}, F=D_{26}. | 1 |
| `table_row_10` | G=C_{15}, F=D_{30}. | 1 |
| `table_row_11` | G=C_{17}, F=D_{34}. | 1 |
| `table_row_12` | G=C_{19}, F=D_{38}. | 1 |
| `table_row_13` | G=C_7 ⋊ C_3 [1], F=((C_7^2 ) ⋊ C_3) ⋊ C_2 [7]. Order context order(G)=21, order(F)=294. | 1 |
| `table_row_14` | G=C_{21}, F=D_{42}. | 1 |
| `table_row_15` | G=C_{23}, F=D_{46}. | 1 |
| `table_row_16` | G=SL(2,3), F=GL(2,3). | 1 |
| `table_row_17` | G=SL(2,3), F=((Q_8^2) ⋊ C_3) ⋊ C_2 [18130]. Order context order(F)=384. | 1 |
| `table_row_18` | G=C_{25}, F=D_{50}. | 1 |
| `table_row_19` | G=C_5^2 , F=(C_5^2) ⋊ C_2 [4]. Order context order(F)=50. | C_5 |
| `table_row_20` | G=C_{27}, F=D_{54}. | 1 |
| `table_row_21` | G=C_9 × C_3, F=(C_9 × C_3) ⋊ C_2 [7]. Order context order(F)=54. | C_3 |
| `table_row_22` | G=(C_3^2) ⋊ C_3 [3], F=((C_3^2) ⋊ C_3) ⋊ C_2 [8]. Order context order(G)=27, order(F)=54. | 1 |
| `table_row_23` | G=(C_3^2) ⋊ C_3 [3], F=(C_3 × ((C_3^2) ⋊ C_3)) ⋊ C_2 [46]. Order context order(G)=27, order(F)=162. | C_3^2 |
| `table_row_24` | G=C_9 ⋊ C_3 [4], F=((C_9 × C_3) ⋊ C_3) ⋊ C_2 [17]. Order context order(G)=27, order(F)=162. | 1 |
| `table_row_25` | G=C_3^3, F=(C_3^3) ⋊ C_2 [14]. Order context order(F)=54. | C_3^3 |
| `table_row_26` | G=C_{29}, F=D_{58}. | 1 |
| `table_row_27` | G=C_{31}, F=D_{62}. | 1 |
| `table_row_28` | G=A_5, F=S_5. | 1 |
| `table_row_29` | G=A_5, F=A_5≀ C_2. | C_2 |
| `table_row_30` | G=PSL(3,2), F=PSL(3,2)⋊ C_2 [208]. Order context order(F)=336. | 1 |
| `table_row_31` | G=PSL(3,2), F=PSL(3,2)≀ C_2. | C_2 |

Each certificate must recover the displayed multiplier and transport it under marked-group isomorphism. For odd-order index-two kernels the homological reduction above supplies an independent check. For the order-96 A₄ type, additionally check |ker(F→C₂)|=48 and that the involution swaps the two A₄ factors; the condition is ab(a)+ab(b)=0, not a difference relation.

## References

- Melanie Matchett Wood. [Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050). Duke Math. J. 168(3) (2019), 377–427. Relevant locations: §2.3 p.387; Definition 3.1 p.388; Lemmas 3.3–3.4 p.390; §4.1 pp.399–401, Proposition 4.1, equations (5)–(6), Remark 4.2; §8.2, Table 2 p.419.
- Melanie Matchett Wood. [An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland](https://par.nsf.gov/servlets/purl/10253245). 13-page author copy of Research in the Mathematical Sciences 8 (2021), Article 21. Relevant locations: §2, Lemmas 2.1–2.4 and Theorem 2.5, author pp.2–4; §4, author pp.6–8, equation (4) and Remark 4.1.
- Jordan S. Ellenberg; Akshay Venkatesh; Craig Westerland. [Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields, II](https://arxiv.org/pdf/1212.0923v1). arXiv:1212.0923v1, 5 December 2012; withdrawn preprint. Relevant locations: §§7.2–7.5 pp.32–37; Example 9.3.2 p.57; used only for the stated group-homology reduction.
- Yuan Liu; Melanie Matchett Wood; David Zureick-Brown. [A predicted distribution for Galois groups of maximal unramified extensions](https://arxiv.org/pdf/1907.05002v2). arXiv:1907.05002v2, 21 July 2022. Relevant locations: Notation 10.1 p.39; §12 definitions pp.46–48; invariant degrees p.50; Lemma 12.10 p.53 and compatible reduced-cover maps p.54.
- Yuan Liu; Melanie Matchett Wood; David Zureick-Brown. [A predicted distribution for Galois groups of maximal unramified extensions](https://par.nsf.gov/servlets/purl/10509628). Invent. Math. 237 (2024), 49–116; NSF published PDF, 68 pages. Relevant locations: §12 definitions, PDF pp.56–57; Lemma 12.10 and proof, PDF pp.62–63; reduced-cover comparison PDF p.64.
