# Galois groups of polynomials, Part II

Specialisation modulo a prime records a polynomial's Galois action by its factor degrees. At an unramified prime, those degrees are exactly the cycle lengths of a Frobenius element. At a ramified prime, several distinct characteristic-zero roots can reduce to one residue root. This roadmap describes the resulting operation on cycle lengths, then builds a criterion on arbitrary probability laws on partitions which excludes every transitive permutation group except the alternating and symmetric groups.

The arithmetic bridge and the partition criterion have separate inputs. The bridge needs a monic integral polynomial, separability over ℚ, and a prime. The criterion needs three quantitative properties of a probability law on partitions; it does not need a polynomial or a coefficient distribution. A final deterministic certificate joins them. Higher irreducibility supplies a second polynomial interface through actions on ordered distinct root tuples.

## Boundaries and conventions

This continues **PolynomialGaloisGroups**, importing its layers 0 (faithful root action), 1 (permutation groups and blocks), 5 (Frobenius specialisation), and 9 (polynomial symmetric-group context). The existing full cycle partition, factor-degree multiset, arithmetic Frobenius existence and finite-field orbit theorems are inputs. The existing double-transitivity quotient theorem is also an input. They are not targets of this continuation.

**AnalyticNumberTheory** supplies its exact uniform divisor subpower estimate `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound` and Mertens product theorem `AnalyticNumberTheory:AN.2/mertens-prime-product`. Concrete coefficient laws, repeated-factor tails and quantitative irreducibility probabilities belong to **ArithmeticStatisticsPartIIRandomPolynomials**, which consumes the criterion here. No coefficient-law theorem is a prerequisite of the partition criterion.

All permutation carriers are finite. Write \(S_\Omega=\operatorname{Sym}(\Omega)\), \(A_\Omega=\operatorname{Alt}(\Omega)\), and \(n=|\Omega|\). A polynomial Galois group means its faithful permutation image on its distinct roots when comparing it with these groups. The abstract group alone does not determine a block system on those roots.

A partition of (n) is Mathlib's `Nat.Partition n`: a multiset of positive natural numbers whose sum is (n). Multiset inequalities refer to occurrences, including repeated parts. A permutation's `Equiv.Perm.fullCycleType` includes one part 1 for each fixed point. `Polynomial.factorDegrees` includes repetitions arising from repeated normalized irreducible factors. Submultiset sums and part counts retain those occurrences throughout.

Measures on partitions use the discrete measurable structure. The three-premise law is a property of a measure; every probability theorem separately assumes that measure is a probability measure. Real powers, logarithms and interval comparisons use real numbers. Interval endpoints are inclusive integer cutoffs. All asymptotic statements have an integer threshold \(N\ge3\), avoiding the small-degree logarithm conventions.

The common quantitative ranges are

\[
 C\ge1,\quad 0<t<1,\quad 0<\kappa\le1,\quad
 0<\delta\le\tfrac1{10},\quad 0<\varepsilon<\delta/2,\quad
 0\le\theta\le\delta/2-\varepsilon,\qquad
 \alpha=\delta/4-\theta/2.
\]

Thus \(\varepsilon/2\le\alpha\le1/40\). Constants and thresholds in the probability criterion depend only on \(C,t,\kappa,\delta,\varepsilon\), uniformly over \(\theta\) and over the law, even when the law changes with \(n\).

The proposed declarations below use the namespace `TauCeti.PolynomialGaloisGroupsPartII`. API statements and mathematical unit tests form part of the specification of each definition and construction.

## Imported contracts

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The interfaces used from these libraries are:

| Input | Interface required here |
| --- | --- |
| `Nat.Partition` | Positive multiset, sum (n), finite partition type and extensionality. |
| `Equiv.Perm.fullCycleType` | Full cycle multiset, its sum, conjugacy invariance and transport by `permCongr`. |
| `Polynomial.factorDegrees`, `Polynomial.Monic.sum_factorDegrees` | Repeated reduction factor degrees with total degree for a monic integral polynomial. |
| `Polynomial.Gal.galActionHom`, `Polynomial.Gal.galActionHom_injective` | Faithful action transported to roots in a splitting extension. The corresponding splitting fact is required. |
| `Polynomial.Gal.restrict_surjective` | Restriction from a normal splitting extension onto a polynomial Galois group; the extension need not be the minimal splitting field. |
| `NumberField.exists_isArithFrobAt_int_of_liesOver` | Arithmetic Frobenius lift at a prime above (p), including ramified primes. |
| `TauCeti.FiniteField.exists_orbit_eq_rootSet_factor` | An irreducible finite-field factor has one Frobenius orbit of roots of cardinal its degree. |
| `Ideal.exists_maximal_ideal_liesOver_of_isIntegral` | A maximal ideal above the base maximal ideal in an integral faithful algebra. |
| `TauCeti.isPretransitive_iff_irreducible` | Root transitivity iff irreducibility for a separable positive-degree polynomial. |
| `TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple` | A root-point stabilizer is the fixing subgroup of its simple root field. |
| `TauCeti.is_two_pretransitive_iff_irreducible_divByMonic` | The existing (k=2) polynomial quotient adapter. |
| `MulAction.isMultiplyPretransitive_iff`, `SubMulAction.ofStabilizer.isMultiplyPretransitive`, `MulAction.isMultiplyPretransitive_of_le` | Transport between injections of `Fin k`, the point-stabilizer recursion, and monotonicity within the carrier cardinality. |
| `IsMultiplyPretransitive.alternatingGroup_le`, `alternatingGroup.isMultiplyPretransitive` | The ((n-2))-transitivity recognition endpoint and its converse. |
| `MulAction.IsPreprimitive`, `MulAction.isPreprimitive_of_is_two_pretransitive` | Existing primitive action vocabulary and the implication from double transitivity. |
| `harmonic_le_one_add_log`, `log_add_one_le_harmonic` | Harmonic sums differ from logarithms by a uniformly bounded amount. |
| `Real.eulerMascheroniConstant_lt_two_thirds` | With \(2/3<\log2\), the strict bound \(e^\gamma<2\). |
| `Equiv.Perm.IsCycle.pow_apply_eq_self_iff` | A cycle power fixes a moved point exactly when its length divides the exponent. |

Two external contracts have mathematical content beyond these declarations:

* **PolynomialGaloisGroups, layer 1.** A faithful transitive imprimitive subgroup on (n) points has an equivariant quotient onto (r) blocks, where \(r\mid n\), (1<r<n), and every fibre has cardinal (s=n/r). Primitive small-support recognition says that a primitive subgroup containing a transposition is symmetric, and one containing a 3-cycle contains the alternating group in degree at least 5. Include the degree-5 case if a chosen Jordan theorem is stated only from degree 6.
* **AnalyticNumberTheory, AN.2 and AN.5.** For each \(\eta>0\), \(\tau(n)\le C_\eta n^\eta\) for every positive integer \(n\). The reciprocal prime product has its specified leading constant:
  \[
  \prod_{p\le x}(1-1/p)^{-1}=e^\gamma\log x+O(1).
  \]
  The implied constant is absolute and the statement holds uniformly for sufficiently large real \(x\). An unspecified \(O(\log x)\) bound does not supply the coefficient needed in PG2.3.

## The dependency order

| Layer | Material | Direct layer inputs |
| --- | --- | --- |
| PG2.0 | Equal-part merging and cycles over fibres | PolynomialGaloisGroups layer 0; full cycle partition |
| PG2.1 | Ramified Frobenius merging | PG2.0; PolynomialGaloisGroups layer 5; factor degrees and arithmetic Frobenius |
| PG2.2 | Tuple quotient and higher irreducibility | PolynomialGaloisGroups layer 0; existing root stabilizer and (k=2) adapter |
| PG2.3 | Partition law, anatomy events and probability bounds | PG2.0; AnalyticNumberTheory AN.2 and AN.5 |
| PG2.4 | Primitive minimum degree | PolynomialGaloisGroups layer 1; primitive and multiple-transitivity APIs |
| PG2.5 | Exclusion of proper transitive groups | PG2.0, PG2.3, PG2.4; parent layer 1 |
| PG2.6 | Uniform criterion and polynomial certificate | PG2.1, PG2.2, PG2.3, PG2.5; parent layer 9 as context |

## PG2.0: Bounded equal-part merging

### Bounded equal-part merging

Proposed declaration: `EqualPartMerging`.

For real y≥1 and partitions a,b of the same integer, EqualPartMerging y a.parts b.parts holds iff the occurrences of a are partitioned into nonempty blocks, each of cardinal≤y, all entries in a block equal, and b is the multiset of their sums. A witness is a multiset of multisets whose flattening is a and whose multiset of sums is b. The raw-multiset relation also handles the empty partition.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Definition 11.2 and example, p.56.

Prerequisites: mathlib:Nat.Partition.

Construction or proof. Use occurrence blocks, not a set of lengths, so repetitions are retained. Nonemptiness prohibits creating zero parts. Each block with length k and cardinal m contributes m·k, and 1≤m≤y; flattening proves total-sum conservation.

Required API:

| Declaration | Statement |
| --- | --- |
| `EqualPartMerging.refl` | Every multiset merges to itself if 1≤y. |
| `EqualPartMerging.mono` | A y-merging is a z-merging if y≤z. |
| `EqualPartMerging.sum_eq` | Merging preserves the sum of all parts. |
| `EqualPartMerging.eq_of_lt_two` | If y<2, every merging is the identity. |
| `EqualPartMerging.pullback_submultiset` | Each submultiset v of output parts is the sum of a submultiset u of input occurrences. |

Mathematical unit tests:

* **merge_two_equal**: (1,1,2,3,4) is a 2-merging of(1,1,2,2,2,3).
* **merge_rejects_three**: (2,3,6) is not a 2-merging of(1,1,2,2,2,3).
* **merge_empty**: The empty partition1-merges to itself.
* **merge_not_transitive**: (1,1,2)2-merges to(2,2), which2-merges to(4), but(4) is not a 4-merging of(1,1,2).

Uses. PG2.1: Group equal-degree occurrences according to cycles of a ramified Frobenius lift. PG2.5: Pull invariant cycle sums back to sums of original parts; preserve uniquely occurring parts.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Permutations with merged cycle type

Proposed declaration: `MergePerms`.

For a partition ρ of n, MergePerms y ρ is the set of permutations σ of α for which EqualPartMerging y ρ.parts σ.fullCycleType. Membership forces n=card α. Fixed points contribute1. Relabeling transports both sets and preserves this membership.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §12.2 notation, p.61.

Prerequisites: PG2.0: Bounded equal-part merging; tauceti:Equiv.Perm.fullCycleType; tauceti:Equiv.Perm.sum_fullCycleType; tauceti:Equiv.Perm.fullCycleType_eq_of_isConj; tauceti:Equiv.Perm.fullCycleType_permCongr.

Construction or proof. Take the inverse image of the merging relation under the existing fullCycleType. Conjugacy and relabeling statements follow from the fullCycleType invariance.

Required API:

| Declaration | Statement |
| --- | --- |
| `mem_mergePerms` | Membership is exactly the equal-part-merging relation to fullCycleType. |
| `mergePerms_mono` | MergePerms y ρ⊆MergePerms z ρ for y≤z. |
| `mergePerms_card` | If σ belongs to MergePerms yρ, then n=card α. |
| `mergePerms_conj` | gσg⁻¹ belongs iff σ belongs. |

Mathematical unit tests:

* **merge_identity_includes_fixed_points**: The identity belongs to MergePerms1ρ iff ρ has exactly card α copies of 1.
* **merge_full_cycle**: A full 5-cycle belongs to MergePerms1 of the one-part partition(5).
* **merge_empty_carrier**: The unique permutation of an empty carrier belongs to MergePerms1 of the empty partition.

Uses. PG2.6: The measurable bad event quantifies a permutation in this set and a proper transitive witness group.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Bad transitive permutation set

Proposed declaration: `BadTransitive`.

BadTransitive α is the union of the underlying sets of all subgroups G≤Sym(α) that act pretransitively and are distinct from alternatingGroup α and top. It is an existential union of groups, not itself declared a subgroup. A permutation in A_n or S_n can still belong via a different witness.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Equation(11.1), §11 p.54; Proposition12.1 p.59.

Prerequisites: mathlib:MulAction.IsPreprimitive.

Construction or proof. Quantify a permutation subgroup with a proof of pretransitivity and two inequalities. Conjugate the witness subgroup to prove invariance. Degree≤3 has no permitted witness; a regular C₅ is a permitted witness in degree 5.

Required API:

| Declaration | Statement |
| --- | --- |
| `mem_badTransitive` | Membership iff there exists a transitive subgroup witness unequal to alternating and symmetric. |
| `badTransitive_conj` | Membership is invariant under conjugation. |
| `badTransitive_witness` | Any element of a permitted witness group belongs. |

Mathematical unit tests:

* **bad_small_degrees**: BadTransitive(Fin n)=∅ for n≤3.
* **bad_identity**: The identity in degree 5 belongs, witnessed by the regular cyclic subgroup.
* **bad_five_cycle**: Every full 5-cycle belongs, witnessed by its cyclic subgroup.

Uses. PG2.6: Exclude existence of any proper transitive witness, rather than testing membership outside the underlying sets of A_n and S_n.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Cycle lengths over cyclic fibres

Proposed declaration: `equivariant_cycle_fibres`.

Let finite nonempty X map surjectively and equivariantly to Y under permutations σ,ψ. Suppose ψ has one full cycle of length d>0 and every fibre has m>0 points. Then each σ-orbit has length d·m_i with 1≤m_i≤m, meets each fibre in exactly m_i points, and Σ_i m_i=m. Consequently fullCycleType σ is an m-merging of the multiset containing m copies of d.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Claim 11.4 and proof, p.57.

Prerequisites: PG2.0: Bounded equal-part merging; tauceti:Equiv.Perm.fullCycleType; tauceti:Equiv.Perm.sum_fullCycleType.

Construction or proof. The first return to a chosen fibre is σ^d. Its disjoint orbits have cardinalities m_i and partition that fibre. Going around the d bottom points transports each return orbit bijectively; its full σ-orbit has d·m_i points. The identity Σ_i m_i=m supplies the complete merging witness, not just a bound on individual cycle lengths.

Acceptance. Test d=1,m=2 with identity and swap upstairs; cycles(1,1) and(2) are both permitted. The fibre partition sums to m, including fixed points; an orbit-length divisibility statement alone does not discharge this target.

## PG2.1: Ramified Frobenius and factor multiplicities

### Maximum irreducible-factor multiplicity

Proposed declaration: `maxFactorMultiplicity`.

For a polynomial f over a field, maxFactorMultiplicity f is the maximum count of an irreducible normalized factor in normalizedFactors f, with maximum 0 on the empty list. Thus units and the library’s empty normalizedFactors convention at 0 have value 0; its arithmetic use always has nonzero monic reduction. Distinct factors of the same degree are not identified.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 11.3, p.56.

Prerequisites: tauceti:Polynomial.factorDegrees.

Construction or proof. Take the finite supremum of the count function over the factors’ finset. For nonzero nonunits, UFD factorization identifies these counts with the largest exponent m for which an irreducible q satisfies q^m∣f.

Required API:

| Declaration | Statement |
| --- | --- |
| `maxFactorMultiplicity_unit` | A unit polynomial has value 0. |
| `count_le_maxFactorMultiplicity` | Every normalized factor count is bounded by the maximum. |
| `maxFactorMultiplicity_le_iff` | The maximum≤m iff every occurring normalized factor has count≤m. |
| `maxFactorMultiplicity_eq_one_iff` | For nonzero nonunits, maximum 1 iff squarefree. |

Mathematical unit tests:

* **multiplicity_unit**: The polynomial1 over F₂ has value 0.
* **multiplicity_cube**: (X+1)^3 over F₂ has value 3.
* **multiplicity_not_degree_multiplicity**: X(X−1) over F₃ has value 1, although its degree multiset is(1,1).

Uses. PG2.1: Bound the number of equal factor-degree occurrences merged by one Frobenius cycle. ArithmeticStatisticsPartIIRandomPolynomials: Separate large repeated-factor probability from the bad merging event.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Reduction fibres count root multiplicities

Proposed declaration: `fibre_card_eq_rootMultiplicity`.

For a commutative ring R, a field K, a ring homomorphism r:R→K, a finite set S⊆R and z∈K, the root multiplicity of z in ∏_{x∈S}(X−r(x)) equals #{x∈S:r(x)=z}. In the integral-root application, for each irreducible q dividing A mod p with exponent m, every residue root of q has exactly m integral roots of A above it.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 11.3 proof, pp.56–57, fibre construction preceding Claim 11.4.

Prerequisites: the existing finite-set, polynomial multiplicity, permutation and subgroup APIs.

Construction or proof. The factors X−r(x) are nonzero. Add root multiplicities through the finite product: each contributes1 or0. For the arithmetic application, factor A mod p in its splitting residue field. Irreducible finite-field factors are separable and different factors have disjoint root sets, so the multiplicity at a root of q is precisely q’s exponent.

Acceptance. The ring R need not be a field and r need not be injective: integral reduction has collisions. For R=ℤ,r reduction mod2,S={0,2}, the fibre at 0 has cardinal2 and the polynomial is X².

### Ramified Frobenius merging theorem

Proposed declaration: `ramified_merging`.

Let A∈ℤ[X] be monic of degree n>0, with its image in ℚ[X] separable, and let p be any prime. Put M=maxFactorMultiplicity(A mod p). There exists σ in Gal(A/ℚ) whose faithful action on the n roots has fullCycleType an M-merging of Polynomial.factorDegrees A p. There is no squarefree-reduction, discriminant or unramified-prime hypothesis.

Hypotheses: Monic A; A over ℚ separable; n>0; p prime.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 11.3 and Claim 11.4, pp.56–57.

Prerequisites: PG2.1: Maximum irreducible-factor multiplicity; PG2.1: Reduction fibres count root multiplicities; PG2.0: Cycle lengths over cyclic fibres; tauceti:Polynomial.factorDegrees; tauceti:Polynomial.Monic.sum_factorDegrees; tauceti:NumberField.exists_isArithFrobAt_int_of_liesOver; tauceti:TauCeti.FiniteField.exists_orbit_eq_rootSet_factor; mathlib:Ideal.exists_maximal_ideal_liesOver_of_isIntegral; mathlib:Polynomial.Gal.galActionHom; mathlib:Polynomial.Gal.galActionHom_injective.

Construction or proof. Monicity makes each splitting-field root integral over ℤ. Separability lists n distinct roots; mapping the product of their linear factors to the residue field gives the reduction polynomial. Choose a maximal ideal of the ring of integers above(p), using the lying-over theorem. The existing arithmetic Frobenius lift at this ideal acts equivariantly on root-reduction fibres. For an irreducible factor q of degree d and multiplicity m, the finite-field theorem identifies a d-cycle of residue roots, and the fibre-cardinality identity gives m roots per fibre. Apply equivariant-cycle-fibres on each such component; concatenate the blocks. Since m≤M, the full root permutation is an M-merging of the repeated factor-degree multiset.

Acceptance. A=X²−2 at p=2 has repeated factor X² and M=2, so the theorem must elaborate without an unramified hypothesis. For monic squarefree reduction M=1, the conclusion specializes to exact factorDegrees=fullCycleType. Degree0 is excluded here; units have empty factors and M=0 rather than an undefined maximum.

## PG2.2: Higher irreducibility and ordered root actions

### Polynomial over a tuple root field

Proposed declaration: `tupleRootQuotient`.

For f∈F[X] over a field and an injection x:Fin j→roots(f) in its splitting field L, let K_x=F(adjoin range x). Define tupleRootQuotient f x as f mapped to K_x, divided monically by ∏_{i<j}(X−x_i) formed in K_x. For separable f, the division is exact; mapping back to L gives the remaining-root polynomial.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Introduction p.5, definition of k-fold irreducibility; field-general adapter of the existing double-transitivity proof.

Prerequisites: tauceti:TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple; tauceti:TauCeti.is_two_pretransitive_iff_irreducible_divByMonic.

Construction or proof. Use IntermediateField.adjoin for K_x; each selected root belongs by the existing subset_adjoin inclusion. The selected roots are distinct because x is an injection. Divide by their monic linear-factor product. Separability and exact factorization identify the complement roots and degree deg f−j, and prove the quotient separable and split in L.

Required API:

| Declaration | Statement |
| --- | --- |
| `tupleRootQuotient_factor` | Over L, the quotient times the removed linear-factor product equals f mapped to L. |
| `tupleRootQuotient_natDegree` | For separable f the quotient has degree deg f−j. |
| `tupleRootQuotient_separable` | For separable f the quotient is separable. |

Mathematical unit tests:

* **quotient_empty_tuple**: At j=0, mapping the quotient to L yields f mapped to L.
* **quotient_all_roots**: For monic separable f and j=deg f the quotient is 1.
* **quotient_one_root**: At j=1 this is division by X−x₀ in the simple root field, agreeing with the k=2 adapter.

Uses. PG2.2: Irreducibility over the field generated by selected roots describes transitivity of their pointwise stabilizer on the remaining roots.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Higher irreducibility

Proposed declaration: `IsKFoldIrreducible`.

IsKFoldIrreducible f k holds exactly when f is separable of positive degree,1≤k≤deg f, and for every j<k and every injection x of j distinct splitting-field roots, tupleRootQuotient f x is irreducible over K_x. The j=0 condition includes ordinary irreducibility. Zero-fold and over-degree conditions are false by convention, preventing vacuous transitivity tests.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Introduction p.5, k-fold irreducibility and its Galois interpretation.

Prerequisites: PG2.2: Polynomial over a tuple root field; tauceti:TauCeti.isPretransitive_iff_irreducible.

Construction or proof. Use ordered distinct roots as Fin j embeddings, matching Mathlib’s multiple-pretransitivity carrier. Quantify the genuine quotient irreducibility condition and explicit admissible k range; do not replace it with the Galois-action conclusion.

Required API:

| Declaration | Statement |
| --- | --- |
| `IsKFoldIrreducible.one_iff` | For separable positive-degree f,1-fold irreducibility iff ordinary Irreducible f. |
| `IsKFoldIrreducible.mono` | k-fold implies l-fold for 1≤l≤k. |
| `IsKFoldIrreducible.degree_bound` | k-fold gives1≤k≤deg f. |

Mathematical unit tests:

* **kfold_zero**: No polynomial is 0-fold irreducible.
* **kfold_exceeds_degree**: No polynomial is k-fold irreducible when k>deg f.
* **kfold_cyclotomic**: Φ₁₁ overℚ is 1-fold but not2-fold irreducible.
* **kfold_nonseparable**: (X²−2)² overℚ is not1-fold irreducible; its transitive action on distinct roots does not rescue it.

Uses. PG2.2: Convert analytic irreducibility statements to multiple transitivity and the n−2 recognition endpoint. ArithmeticStatisticsPartIIRandomPolynomials: State polynomial-side consequences after supplying distribution estimates.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Tuple stabilizer and root-generated field

Proposed declaration: `tuple_stabilizer_eq_fixingSubgroup`.

For an injection x of j roots of f into its splitting field L, the stabilizer of x for the componentwise Gal(f/F) action on embeddings equals K_x.fixingSubgroup. Restricting this stabilizer to L over K_x identifies its faithful action on unselected roots with the Galois action needed by the quotient irreducibility test.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Introduction p.5; extension of the point-stabilizer argument in the MultipleTransitivity module.

Prerequisites: tauceti:TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple; PG2.2: Polynomial over a tuple root field; mathlib:Polynomial.Gal.restrict_surjective.

Construction or proof. An automorphism fixes the tuple iff it fixes every selected root. Fixing the selected generators is equivalent to fixing their intermediate-field adjoin; use the Galois correspondence and extend embeddings inside the normal splitting field. The quotient splits in L, which need not be its minimal splitting field. Use the surjective restriction of automorphisms to that splitting field, so orbit transitivity descends and lifts.

Acceptance. j=0 gives the full automorphism group and the base field. j=1 reduces to the simple-root stabilizer theorem. L is not assumed to be the splitting field of the quotient over K_x.

### Higher irreducibility and multiple transitivity

Proposed declaration: `kfold_iff_multiplyPretransitive`.

For any field F, separable f∈F[X] of positive degree n, and 1≤k≤n, IsKFoldIrreducible f k iff MulAction.IsMultiplyPretransitive f.Gal (f.rootSet f.SplittingField) k. At k=1 reuse the irreducibility/orbit theorem; at k=2 reuse the double-transitivity quotient adapter.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Introduction p.5; own-word field-general formalization of the stated equivalence.

Prerequisites: PG2.2: Higher irreducibility; PG2.2: Tuple stabilizer and root-generated field; tauceti:TauCeti.isPretransitive_iff_irreducible; tauceti:TauCeti.is_two_pretransitive_iff_irreducible_divByMonic; mathlib:MulAction.isMultiplyPretransitive_iff; mathlib:SubMulAction.ofStabilizer.isMultiplyPretransitive; mathlib:MulAction.isMultiplyPretransitive_of_le.

Construction or proof. Induct on k using the Mathlib action on Fin k embeddings and the stabilizer recursion for multiple pretransitivity. For a j-tuple, the remaining-root quotient is separable and has positive degree n−j. Identify its roots with the complement of the tuple image. Apply the orbit/irreducibility theorem over K_x to the surjective stabilizer restriction; assemble the criterion for every tuple.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Alternating or symmetric recognition from higher irreducibility

Proposed declaration: `kfold_degree_sub_two`.

For separable f over a field with n=deg f≥3, IsKFoldIrreducible f(n−2) iff the image of its faithful root action contains alternatingGroup of its n roots. Equivalently this image is alternating or symmetric. The degree lower bound makes n−2 a permitted positive k.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Introduction p.5, n−2 conclusion.

Prerequisites: PG2.2: Higher irreducibility and multiple transitivity; mathlib:IsMultiplyPretransitive.alternatingGroup_le; mathlib:alternatingGroup.isMultiplyPretransitive; mathlib:Polynomial.Gal.galActionHom_injective.

Construction or proof. Apply the k-fold adapter at k=n−2 and identify root cardinality with degree by separability. The multiple-pretransitivity theorem gives containment of alternatingGroup; the alternating action gives the reverse direction by enlarging the acting group. Index2 of alternatingGroup implies every containing subgroup is alternatingGroup or top.

Acceptance. At n=3 this reduces to irreducibility of a separable cubic; at n≤2 this target is not invoked. The alternating-group recognition uses the existing multiple-transitivity theorem.

## PG2.3: Anatomy of an arbitrary partition law

### Three-premise partition law

Proposed declaration: `PartitionLaw`.

For a probability measure ν on Nat.Partition n (discrete measurable space), constants C≥1,0<t<1,0<κ≤1,0<δ≤1/10 define PartitionLaw by three bounds: (a) ν({k,ℓ}≤ρ.parts)≤C/(kℓ) for integers2≤k,ℓ≤n/4, requiring two occurrences if k=ℓ; (b) ν(∃U≤ρ.parts,ΣU=k)≤C k^(−δ) for integers n^(1−δ/2)≤k≤n/2; (c) for f:ℕ→{0,1},1≤m≤n/log n, L=Σ_{k=1}^m f(k)/k, ν(Σ_{k∈ρ.parts,k≤m} f(k)≤tL)≤C exp(−κL). The last sum counts occurrences, and all displayed endpoints are inclusive integer cutoffs.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Proposition12.1(a)–(c), p.59.

Prerequisites: mathlib:Nat.Partition.

Construction or proof. Record the real-parameter ranges as proposition fields and write the three event bounds as genuine quantified mathematical conditions. Use the existing probability measure, finite partition type and real-valued event measure. Indicators are Bool-valued; harmonicMass is the displayed finite sum notation.

Required API:

| Declaration | Statement |
| --- | --- |
| `PartitionLaw.pair_diagonal` | Premise(a) at k=ℓ bounds the event countρ(k)≥2, not mere membership. |
| `PartitionLaw.enlarge_constant` | Increasing C preserves all three premises. |
| `PartitionLaw.weaken_kappa` | Replacing κ by 0<κ′≤κ preserves the law. |

Mathematical unit tests:

* **law_indicator_zero**: For a PartitionLaw and the zero indicator at m=7 in range, the lower-tail field bounds ν(count≤0) by C, since L=0.
* **law_indicator_singleton**: For a PartitionLaw and m=4≤n/log n, its lower-tail field gives ν(countρ(2)≤t/2)≤C exp(−κ/2), since L=1/2.
* **law_diagonal_counts_two**: For n≥8, PartitionLaw gives ν(countρ(2)≥2)≤C/4, counting two occurrences. A membership-only condition is a different event.

Uses. PG2.3: Use only(a) for E1,(b) for E2,(c) for E3/E4,and(a),(c) for the strengthened E5 estimate. ArithmeticStatisticsPartIIRandomPolynomials: Its coefficient-law estimates supply this interface only after the arbitrary-law theorem is available.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Five partition anatomy events

Proposed declaration: `GoodEvent`.

For n,t,κ,δ,α real parameters and a partitionρ, GoodEvent i (i=0,…,4) is E₁,…,E₅*: E₁ forbids occurrence pairs k,ℓ≤n/4 with gcd(k,ℓ)≥n^(κα); E₂ forbids a submultiset sum nj/r for r∣n,2≤r≤n^(δ/2),1≤j<r; E₃ requires at least(αt/2)log n parts in[n^(1−α),n/log n]; E₄ requires at least(t/4)log n parts k≤√n/3 with a prime divisor p>n^(1/8); E₅* requires, for each integer r≥2, at least FOUR parts in[n^(1−2α),n/log n] not divisible by r. Every count retains multiplicity. During the criterion α=δ/4−θ/2∈[ε/2,1/40].

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemmas12.2–12.6, pp.59–61; the four-witness use in Lemma 12.9 p.63.

Prerequisites: mathlib:Nat.Partition; PG2.3: Three-premise partition law.

Construction or proof. Use integer parts and real cutoff comparisons; E₂ retains δ/2 independently of α. Use four nondivisible occurrences for E₅*. E₁ makes sufficiently long counted parts distinct at the asymptotic thresholds used in the proof.

Required API:

| Declaration | Statement |
| --- | --- |
| `goodEvent_one_diagonal` | E₁ implies countρ(k)≤1 whenever n^(κα)≤k≤n/4. |
| `goodEvent_two_complement` | For U≤ρ.parts its complement has sum n−ΣU, the symmetry used by E₂. |
| `goodEvent_five_four` | E₅* supplies four nondivisible long occurrences for every integer r≥2. |

Mathematical unit tests:

* **good_event_repeated_part**: ρ=(2,2,4),n=8,κ=1,α=0 fails E₁ because gcd(2,2)=2≥1.
* **good_event_boundary_zero**: At n=1,α=0 the E₃ threshold is 0, so the unique partition passes.
* **good_event_four_not_one**: Every partition of 3 fails E₅* atα=0; one occurrence cannot meet the threshold4.
* **good_event_subsum**: ρ=(3,3),n=6,δ=2 fails E₂ at r=2,j=1. Parameters here test the definition outside the law’s asymptotic range.

Uses. PG2.5: E₁/E₄ exclude primitive groups; all five events with strengthened E₅* exclude imprimitive groups. Four witnesses prevent uncontrolled parts>n/4 entering the gcd contradiction.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Uniform long-interval harmonic masses

Proposed declaration: `anatomy_harmonic_masses`.

Fix ε>0. Uniformly for α∈[ε/2,1/40] and sufficiently large n, the harmonic mass of integers in[n^(1−α),n/log n] is α log n−log log n+O_ε(1). For2≤r≤n^α, the harmonic mass in[n^(1−2α),n/log n] not divisible by r is(1−1/r)(2α log n−log log n)+O_ε(1), uniformly in r. Floor/ceiling changes are included in the error.

Hypotheses: ε>0; α∈[ε/2,1/40].

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemmas12.4 and 12.6 proofs, pp.60–61.

Prerequisites: mathlib:harmonic_le_one_add_log; mathlib:log_add_one_le_harmonic.

Construction or proof. Subtract upper/lower harmonic-sum bounds at the inclusive integer endpoints. Their differences from logarithms are uniformly bounded. For divisible parts put k=rj and subtract(1/r) times the corresponding harmonic interval; r≤n^α ensures the lower endpoint stays≥n^(1−3α), so no empty or below1 cutoff invalidates the logarithm calculation.

Acceptance. One error constant and one threshold work for the entire α,r range; a separately chosen constant for each θ is insufficient.

### Harmonic mass of parts with a large prime factor

Proposed declaration: `nonsmooth_harmonic_mass`.

For all sufficiently large n, Σ_{1≤k≤√n/3, ∃p prime:p∣k,p>n^(1/8)}1/k ≥(log n)/4. In fact the sum is at least(1/2−e^γ/8)log n+O(1), where γ is the existing Euler constant; e^γ<2 makes the coefficient strictly greater than 1/4.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.5 proof, pp.60–61.

Prerequisites: AnalyticNumberTheory:AN.2/mertens-prime-product; mathlib:harmonic_le_one_add_log; mathlib:log_add_one_le_harmonic; mathlib:Real.eulerMascheroniConstant_lt_two_thirds.

Construction or proof. The total harmonic mass through √n/3 is(1/2)log n+O(1). Every integer whose prime factors are≤n^(1/8) contributes to the full positive reciprocal Euler product over those primes, which is an upper bound even without a size cutoff. Invoke exactly the imported Mertens product with leading constant e^γ, and the standard Euler-constant bound γ<log2. A generic O(log x) comparison has no sufficient coefficient.

Acceptance. The sharp leading constant e^γ is required; a bound with an unspecified coefficient does not suffice.

### Large-gcd pair probability

Proposed declaration: `pair_gcd_failure`.

Fix C,t,κ,δ with the PartitionLaw ranges and ε∈(0,δ/2). There are B≥0,N≥3 depending only on C,t,κ,δ,ε such that for every n≥N, every probability law ν satisfying the three premises, and every θ∈[0,δ/2−ε], the failure probability of E1 is≤B·(log n)² n^(−κα), with α=δ/4−θ/2.

Hypotheses: Probability law ν; PartitionLaw premises; 0<ε<δ/2; 0≤θ≤δ/2−ε.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.2, pp.59–60.

Prerequisites: PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; mathlib:harmonic_le_one_add_log.

Construction or proof. For each possible common divisor r≥n^(κα), union-bound the pair events(ri,rj) with i,j≤n/(4r), retaining the diagonal case. Premise(a) gives C/r² times two harmonic sums. Sum r^(−2) above the threshold, obtaining O((log n)² n^(−κα)).

Acceptance. The rate has one constant and one threshold for all laws and all permitted θ. The proof uses only the premise fields cited in its steps, not an arithmetic-statistics theorem.

### Block-fraction subsum probability

Proposed declaration: `block_subsum_failure`.

Fix C,t,κ,δ with the PartitionLaw ranges and ε∈(0,δ/2). There are B≥0,N≥3 depending only on C,t,κ,δ,ε such that for every n≥N, every probability law ν satisfying the three premises, and every θ∈[0,δ/2−ε], the failure probability of E2 is≤B·n^(−δ/4), with α=δ/4−θ/2.

Hypotheses: Probability law ν; PartitionLaw premises; 0<ε<δ/2; 0≤θ≤δ/2−ε.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.3, p.60.

Prerequisites: PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound.

Construction or proof. Replace U by its complement so j≤r/2. For r≤n^(δ/2), the sum nj/r lies in the precise premise(b) interval. Summing C(nj/r)^(−δ) over j≤r/2 gives O(n^(−δ)r). Sum over divisors r of n to get O(n^(−δ/2)τ(n)). Apply the imported divisor subpower bound with exponentδ/4; retain its δ-dependent constant.

Acceptance. The rate has one constant and one threshold for all laws and all permitted θ. The proof uses only the premise fields cited in its steps, not an arithmetic-statistics theorem.

### Long-part lower-tail probability

Proposed declaration: `long_parts_failure`.

Fix C,t,κ,δ with the PartitionLaw ranges and ε∈(0,δ/2). There are B≥0,N≥3 depending only on C,t,κ,δ,ε such that for every n≥N, every probability law ν satisfying the three premises, and every θ∈[0,δ/2−ε], the failure probability of E3 is≤B·(log n)^κ n^(−κα), with α=δ/4−θ/2.

Hypotheses: Probability law ν; PartitionLaw premises; 0<ε<δ/2; 0≤θ≤δ/2−ε.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.4, p.60.

Prerequisites: PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; PG2.3: Uniform long-interval harmonic masses.

Construction or proof. Apply premise(c) to the indicator of[n^(1−α),n/log n], using m=floor(n/log n). The harmonic mass is αlog n−log log n+O(1). Uniform α≥ε/2 ensures the E₃ failure threshold is≤tL for n sufficiently large. Exponentiation yields the stated logarithmic factor and power, with uniform constants.

Acceptance. The rate has one constant and one threshold for all laws and all permitted θ. The proof uses only the premise fields cited in its steps, not an arithmetic-statistics theorem.

### Large-prime part probability

Proposed declaration: `large_prime_parts_failure`.

Fix C,t,κ,δ with the PartitionLaw ranges and ε∈(0,δ/2). There are B≥0,N≥3 depending only on C,t,κ,δ,ε such that for every n≥N, every probability law ν satisfying the three premises, and every θ∈[0,δ/2−ε], the failure probability of E4 is≤B·n^(−κ/4), with α=δ/4−θ/2.

Hypotheses: Probability law ν; PartitionLaw premises; 0<ε<δ/2; 0≤θ≤δ/2−ε.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.5, pp.60–61.

Prerequisites: PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; PG2.3: Harmonic mass of parts with a large prime factor.

Construction or proof. Use the indicator of k≤√n/3 with some prime factor>n^(1/8); choose m=floor(√n/3)≤n/log n for large n. The imported harmonic mass is≥log n/4, so E₄ failure is inside premise(c)’s event. Exponentiate its bound.

Acceptance. The rate has one constant and one threshold for all laws and all permitted θ. The proof uses only the premise fields cited in its steps, not an arithmetic-statistics theorem.

### Four nondivisible long parts with high probability

Proposed declaration: `four_nondivisible_parts_failure`.

Fix C,t,κ,δ with the PartitionLaw ranges and ε∈(0,δ/2). There are B≥0,N≥3 depending only on C,t,κ,δ,ε such that for every n≥N, every probability law ν satisfying the three premises, and every θ∈[0,δ/2−ε], the failure probability of E5* is≤B·(log n)² n^(−κα), with α=δ/4−θ/2.

Hypotheses: Probability law ν; PartitionLaw premises; 0<ε<δ/2; 0≤θ≤δ/2−ε.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.6 proof, p.61; four-witness form of Lemma 12.9.

Prerequisites: PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; PG2.3: Uniform long-interval harmonic masses; PG2.3: Large-gcd pair probability; PG2.3: Long-part lower-tail probability.

Construction or proof. On E₁∩E₃ there are at least five distinct long parts for uniformly large n. For r≥n^(κα), at most one is divisible by r, so four are not. For2≤r≤n^(κα), the indicator of long parts not divisible by r has L_r=(1−1/r)(2αlog n−log log n)+O(1). Fewer than four parts means count≤3≤tL_r uniformly for large n. Apply premise(c), giving O((log n)^κ n^(−2κα(1−1/r))). Sum separately r=2,3≤r≤log n,and log n<r≤n^(κα). Combine E₁ and E₃ exceptional probabilities; the four-part threshold changes only the uniform starting n, not the final rate.

Acceptance. The rate has one constant and one threshold for all laws and all permitted θ. The proof uses only the premise fields cited in its steps, not an arithmetic-statistics theorem.

The five failure estimates can be read together as follows. Each bound uses one constant and one threshold uniformly over the common parameter ranges above; \(E_5^*\) is the four-occurrence event.

| Event | Failure bound | Premise used |
| --- | --- | --- |
| \(E_1\) | \(B(\log n)^2n^{-\kappa\alpha}\) | Pair occurrence bound (a) |
| \(E_2\) | \(Bn^{-\delta/4}\) | Submultiset sum bound (b), divisor subpower estimate |
| \(E_3\) | \(B(\log n)^\kappa n^{-\kappa\alpha}\) | Lower-tail bound (c), long-interval harmonic mass |
| \(E_4\) | \(Bn^{-\kappa/4}\) | Lower-tail bound (c), nonsmooth harmonic mass |
| \(E_5^*\) | \(B(\log n)^2n^{-\kappa\alpha}\) | (a), (c), \(E_1\) and \(E_3\) estimates |

The small-\(r\) part of the \(E_5^*\) estimate splits its union bound at \(r=2\), \(r=\log n\), and \(r=n^{\kappa\alpha}\). For \(3\le r\le\log n\), the exponent \(2\kappa\alpha(1-1/r)\) is at least \(4\kappa\alpha/3\), absorbing the extra logarithmic number of integers. For \(r>\log n\), the factor \(n^{2\kappa\alpha/r}\) is bounded, and there are at most \(n^{\kappa\alpha}\) integers in the range. The \(r=2\) term has the endpoint rate \(n^{-\kappa\alpha}\). For larger \(r\), \(E_1\) allows at most one of the five distinct \(E_3\) parts to be divisible by \(r\). These estimates explain both the four-part threshold and the uniform logarithmic factor.

## PG2.4: Primitive minimum degree

### Minimum support of a permutation group

Proposed declaration: `minSupport`.

For G≤Sym(α) on a finite carrier, minSupport G is none if G is trivial; otherwise it is some m, where m is the minimum support cardinality among σ∈G,σ≠1. The nonempty case attains its minimum and has m≥2. No minimum over an empty set is silently assigned0.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §12.2 notation and Lemma 12.7, pp.61–62.

Prerequisites: the existing finite-set, polynomial multiplicity, permutation and subgroup APIs.

Construction or proof. Use the finite nonidentity part of the subgroup. Its support-cardinality image has an attained natural minimum if nonempty. Return Option ℕ so the trivial group is explicit; support0 occurs only for the identity.

Required API:

| Declaration | Statement |
| --- | --- |
| `minSupport_eq_none` | minSupport G=none iff G=bot. |
| `minSupport_eq_some` | minSupport G=some m iff a nonidentity element attains m and every nonidentity element has support≥m. |
| `minSupport_le` | A nonidentity element of G has support at least any some m returned by minSupport. |

Mathematical unit tests:

* **minimum_trivial**: Sym(Fin0) has minSupport none.
* **minimum_symmetric**: Sym(Fin2) has minSupport some 2.
* **minimum_alternating**: A₃ has minSupport some 3.

Uses. PG2.4: The primitive lower bound is compared to the support of a nontrivial power of a merged permutation.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Orbital distinguishers

Proposed declaration: `orbitalDistinguishers`.

For G≤Sym(α) and x,y∈α, orbitalDistinguishers G x y is the finite set of z for which no g∈G fixes z while sending x to y. Equivalently(x,z),(y,z) lie in different orbits for the diagonal action on α×α, or x,y lie in different orbits of the stabilizer of z. This uses existing orbits and stabilizers; it introduces no coherent-configuration carrier.

Source: [László Babai; original lecture scribe Tom Hayes: Primitive coherent configurations and the order of uniprimitive permutation groups](https://people.cs.uchicago.edu/~laci/papers/uni-update.pdf), Babai notes Definition 6.1 and Exercise 6.2, pp.5–6.

Prerequisites: the existing finite-set, polynomial multiplicity, permutation and subgroup APIs.

Construction or proof. Define the finite set through the explicit stabilizer transport test. The equivalence with pair orbitals follows by reading the two coordinates; inverse group elements prove symmetry. If g sends x to y, a distinguisher z cannot be fixed by g, so it belongs to g.support.

Required API:

| Declaration | Statement |
| --- | --- |
| `mem_orbitalDistinguishers` | Membership iff x,y are in different orbits of the stabilizer of z. |
| `orbitalDistinguishers_symm` | Swapping x,y preserves the finite set. |
| `orbitalDistinguishers_subset_support` | For g∈G, D(x,gx)⊆support g. |

Mathematical unit tests:

* **distinguisher_diagonal**: D(x,x)=∅ for every G.
* **distinguisher_trivial**: For G=bot and x≠y, D(x,y) is the whole carrier.
* **distinguisher_symmetric**: For G=Sym(α),x≠y, D(x,y)={x,y}.

Uses. PG2.4: A graph-counting bound on distinguishers forces every moved-point element to have large support.

Acceptance. The statement preserves every displayed range, multiplicity and hypothesis.

### Connectivity of primitive orbital graphs

Proposed declaration: `orbital_walk_connectivity`.

For a primitive permutation subgroup G on a finite carrier and x≠y, the undirected relation joining u,v when(u,v) or(v,u) belongs to the G-orbit of(x,y) is connected: every a,b are related by its reflexive transitive closure.

Source: [László Babai; original lecture scribe Tom Hayes: Primitive coherent configurations and the order of uniprimitive permutation groups](https://people.cs.uchicago.edu/~laci/papers/uni-update.pdf), Babai notes §§3–4, Exercises3.4,4.4–4.8, pp.4–5.

Prerequisites: mathlib:MulAction.IsPreprimitive.

Construction or proof. The graph is G-invariant. Its connected components form a G-invariant block partition. Primitivity makes a component either a singleton or the whole carrier; the non-diagonal edge excludes the singleton case for its endpoints, and transitivity excludes singleton components elsewhere. Translating vertices or endpoint pairs gives bijections proving valency and intersection-count constancy. These are proof infrastructure for the next target, not a new general coherent-configuration library.

Acceptance. Connectivity is for an undirected orbital graph, not a claim that every primitive action is doubly transitive. The existing IsPreprimitive vocabulary is used; x≠y and degree restrictions control degenerate actions.

### Babai’s distinguisher lower bound

Proposed declaration: `babai_distinguishers`.

Let G≤Sym(α) be primitive but not2-pretransitive, with n=card α≥5. For every x≠y, #{z:no element of G fixes z and sends x to y}≥√n/2. Hence every nonidentity element has support at least√n/2.

Source: [László Babai; original lecture scribe Tom Hayes: Primitive coherent configurations and the order of uniprimitive permutation groups](https://people.cs.uchicago.edu/~laci/papers/uni-update.pdf), Babai notes Theorem 6.6; Lemmas8.5–8.18, Corollary 8.19; Exercise 9.5 and Corollary 9.6, pp.7–10.

Prerequisites: PG2.4: Orbital distinguishers; PG2.4: Connectivity of primitive orbital graphs.

Construction or proof. Work with the diagonal pair orbits as colours. Their non-diagonal valencies ρ_i and distinguisher numbers D(i) are constant by orbit transport. For a noncomplete symmetrized orbital graph its COMPLEMENT has diameter2 (Babai Lemma 8.5); the regular diameter-two count gives ρ_i≤n−1−√(n−1). If the symmetrization is complete, the paired valency is(n−1)/2. Counting triples gives average distinguisher number Dbar≥n−ρmax>√n. Along an orbital path, D(a,b) lies in the union of the edge distinguisher sets. Thus if a symmetrized orbital has diameter2, D(i)≥Dbar/2>√n/2. If its diameter≥3, a shortest path of length 3 has disjoint endpoint neighborhoods, both contained in D(a,b); the path union bound gives D(i)≥2ρ_i/3. For fixed z, form the weighted graph of z’s suborbits joined by orbital-i edges. Connectivity follows from the orbital graph. A spanning tree, oriented away from the singleton suborbit, has total weight≥n−1 because the edge between suborbits of valencies ρ_j,ρ_k has weight≥max(ρ_j,ρ_k). Double-count distinguished ordered orbital-i pairs to get D(i)≥(n−1)/ρ_i. Combining with 2ρ_i/3 yields D(i)²≥2(n−1)/3>n/4. Use D(x,gx)⊆support g for a moved point x. No group-order or base-size estimate is substituted for the support theorem.

Acceptance. The diameter-two claim applies to the complement where indicated; confusing it with the orbital graph makes the argument false. The large-diameter case includes the weighted suborbit spanning-tree count, not just the easy triangle inequality.

### Bochert’s doubly transitive minimum degree

Proposed declaration: `bochert_minSupport`.

For a 2-pretransitive subgroup G ≤Sym(α) of degree n≥38 that does not contain alternatingGroup α, minSupport G=some m implies m≥n/4.

Source: [Bernd Schomburg: Bochert’s results on the minimal degree of multiply transitive permutation groups](https://arxiv.org/pdf/2209.12049v1), Schomburg Theorem 3.1 proof, pp.4–5; Lemmas2.3–2.5 pp.3–4; commutator inclusion(2.1) pp.1–2.

Prerequisites: PG2.4: Minimum support of a permutation group; PolynomialGaloisGroups · layer-1-permutation-groups-blocks-and-wreath-products; mathlib:MulAction.isMultiplyPretransitive_iff; mathlib:MulAction.isPreprimitive_of_is_two_pretransitive.

Construction or proof. The imported primitive3-cycle/transposition recognition excludes m≤3. Choose u of minimal support m>3, a moved α and β=uα. The case m=n already satisfies the bound. Conjugate u by the stabilizer of α. Double transitivity makes its action on the other n−1 points transitive, so the fraction of conjugates fixing β is(n−m)/(n−1), and the fraction moving any specified γ≠α is(m−1)/(n−1). These proportions follow by counting an invariant incidence relation in both orders (Schomburg Lemmas2.3–2.5). Every conjugate v fixing β moves α and fails to commute with u. The commutator has support contained in Δ∪uΔ∪vΔ, Δ=support u∩support v. Minimality gives|Δ|≥m/3. Sum|Δ| over these conjugates. The upper bound is their cardinal plus(m−2) times the total conjugate cardinal times(m−1)/(n−1). Cancel the nonempty conjugacy-class factor to obtain n≤4m+6/(m−3). If n≥38 then m≥10; the final correction is≤6/7, and integrality gives m≥n/4.

Acceptance. Retain n≥38; do not cite an unqualified n/4 bound for small degrees. Use explicit noncommuting conjugates and their counts rather than an unsupported average-intersection assertion.

### Primitive minimum degree

Proposed declaration: `primitive_minSupport`.

For a primitive G≤Sym(α),n=card α≥5,G≠A_n,G≠S_n, minSupport G=some m implies m≥(√n−1)/2.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), BSKK Lemma 12.7 p.62; Bary-Soroker–Kozma Claim 1 pp.9–10 (combine the two proofs above).

Prerequisites: PG2.4: Minimum support of a permutation group; PG2.4: Babai’s distinguisher lower bound; PG2.4: Bochert’s doubly transitive minimum degree; PolynomialGaloisGroups · layer-1-permutation-groups-blocks-and-wreath-products.

Construction or proof. Containing A_n would force G=A_n or S_n by its index2, so the hypotheses exclude it. If G is not2-pretransitive, apply Babai’s support bound. If it is 2-pretransitive and n≥38, apply Bochert and compare n/4 to(√n−1)/2. For 5≤n<38, primitive small-support recognition gives m≥4, which is larger than(√n−1)/2 throughout this finite range.

Acceptance. The primitive proof covers the non-doubly-transitive case; Jordan’s prime-cycle theorem alone does not prove it. The small-degree branch is explicit and does not rely on a Bochert bound outside its read source range.

## PG2.5: Primitive and imprimitive exclusions

### Cycle arithmetic in a block orbit

Proposed declaration: `block_orbit_cycle_divisibility`.

Let a permutation σ preserve a block system of r blocks of common cardinal s. A point cycle L of lengthℓ meets one block orbit of size r′ and has s′ points in each of these blocks, where1≤r′≤r,1≤s′≤s,ℓ=r′s′. The union X of these blocks isσ-invariant of cardinal r′s, and every point cycle in X has length divisible by r′. Different point cycles have either equal or disjoint block orbits. This includes singleton cycles.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.9, observation before the case split, p.62.

Prerequisites: PolynomialGaloisGroups · layer-1-permutation-groups-blocks-and-wreath-products.

Construction or proof. Represent the block system as a surjective equivariant quotient b:X→Fin r with all fibres of cardinal s, importing the parent’s block-system construction. The projected σ-orbit is exactly the orbit of its block under the induced permutation. Equivariance bijects its intersections with the blocks. A σ-cycle in the same block orbit visits every block in that orbit; its length is a positive multiple of r′. Block orbits partition the blocks, proving the equal-or-disjoint dichotomy.

Acceptance. The output r′ is the actual cardinality of the block orbit, not merely an arbitrary divisor ofℓ. For a fixed point the point-cycle length is 1, even though cycleOf.support is empty.

### Exclusion of proper primitive groups

Proposed declaration: `primitive_exclusion`.

Fix0<t,0<κ≤1,0<δ≤1/10 and 0<ε<δ/2. Uniformly in θ∈[0,δ/2−ε] and sufficiently large n, ifρ∈E₁∩E₄, then no n^(1/8)-merging ofρ belongs to a primitive subgroup unequal to A_n and S_n. In particular this excludes n^θ-mergings since θ≤1/20<1/8.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.8, p.62.

Prerequisites: PG2.3: Five partition anatomy events; PG2.0: Bounded equal-part merging; PG2.0: Permutations with merged cycle type; PG2.4: Primitive minimum degree; tauceti:Equiv.Perm.IsCycle.pow_apply_eq_self_iff.

Construction or proof. There are at most three original parts>n/4. Each has at most eight prime divisors>n^(1/8), so at most24 exceptional primes arise. E₁ permits at most one small part divisible by each such prime. E₄ supplies(t/4)log n distinct parts k≤√n/3 with a prime factor>n^(1/8); for large n choose one not meeting these exceptional primes. Its chosen prime p divides no other original part. The selected k has multiplicity 1 and survives any allowed equal-part merging. Other output lengths are mℓ with m≤n^(1/8)<p and p∤ℓ, so p divides only the k-cycle. Raise the merged permutation to p^(v_p(k)−1) times the prime-to-p part of the least common multiple of its cycle lengths. All other cycles die; the k-cycle remains nonidentity and moves exactly k points, by the cycle-power support theorem. Its support≤√n/3<(√n−1)/2 for n>9 contradicts primitive minimum degree. The required comparison is n^(κα)≤n^(1/40)<n^(1/8)<p.

Acceptance. No Frobenius or probability-law assumption enters this deterministic combinatorial theorem. The exponent kills every other cycle and does not kill the chosen one; a claim of a single p-cycle is unnecessary.

### Exclusion of transitive imprimitive groups

Proposed declaration: `imprimitive_exclusion`.

With the same parameter ranges and uniformity as primitive-exclusion, ifρ∈E₁∩E₂∩E₃∩E₄∩E₅*, no n^θ-merging ofρ belongs to any transitive imprimitive subgroup of S_n. E₄ is harmless in this statement but unused in its proof; E₅* is the strengthened four-part event.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 12.9, pp.62–63; the four-witness form of the block argument.

Prerequisites: PG2.3: Five partition anatomy events; PG2.0: Bounded equal-part merging; PG2.0: Permutations with merged cycle type; PG2.5: Cycle arithmetic in a block orbit.

Construction or proof. Supposeσ preserves r equal blocks of size s=n/r with 1<r<n, and put α=δ/4−θ/2. Long parts in the chosen intervals lie≤n/log n≤n/4 and≥n^(κα) for uniformly large n, so E₁ makes each unique and unchanged by merging. If2≤r≤n^(δ/2), choose a long partℓ not divisible by r via E₅*. Its block orbit has r′<r. Its invariant union has size nr′/r. Pulling the contained cycle lengths back through merging yields a submultiset sum forbidden by E₂. If n^(δ/2)<r<n^(1−α), choose FIVE distinct E₃ parts. For eachℓ, r′≥ℓ/s>n^(δ/2−α)>n^(κα). Two selected cycles cannot have the same block orbit, since their gcd would then be≥r′; thus their block unions are disjoint. At most one selected cycle fills its blocks, since s>n^α and two such lengths would violate E₁. A permutation has at most three cycles>n/4. Of the five disjoint block unions, choose one whose selected cycle does not fill its blocks and that contains no cycle>n/4. It has a companion cycle m·k≤n/4, with k an original part and m≤n^θ. Then gcd(k,ℓ)≥r′/m>n^(δ/2−α−θ)=n^α≥n^(κα), contradicting E₁ within its actual small-part range. If n^(1−α)≤r<n, then s≥2. Choose FOUR E₅* long parts not divisible by s. Each leaves unused points in its block orbit and has r′>n^(1−3α). Their block unions are disjoint by E₁; at most three contain a cycle>n/4. In the fourth union choose a companion m·k≤n/4. Then gcd(k,ℓ)≥r′/n^θ>n^(1−3α−θ)≥n^(κα), again contradicting E₁. All companion parts used in E₁ are therefore at most n/4, and the probability exponent is preserved.

Acceptance. Middle range uses five disjoint block orbits, accounting for one filled orbit and three possible long companion cycles. Large range uses four nondivisible long parts. Every invocation of E₁ checks both original parts≤n/4.

In both the middle and large block ranges the short companion part comes from a cycle of length at most \(n/4\) in a selected invariant block union. If that cycle is a merge of \(m\) equal occurrences of an original part \(k\), then \(mk\le n/4\) implies \(k\le n/4\). The selected long part is also at most \(n/\log n\le n/4\). Both arguments of the final gcd comparison therefore satisfy the actual hypothesis of \(E_1\).

The relevant exponent comparisons are

\[
\delta/2-\alpha-\theta=\alpha,\qquad
1-3\alpha-\theta\ge\kappa\alpha,\qquad
n^{\kappa\alpha}\le n^{1/40}<n^{1/8}<p.
\]

For the middle range, a filled block union would make \(s\) divide its selected length, while \(s>n^\alpha\). Two such selected lengths would violate \(E_1\), so at most one union is filled. Avoiding that one union and the at most three unions containing a cycle longer than \(n/4\) is exactly why five distinct \(E_3\) parts suffice. In the large range every selected length is chosen not divisible by \(s\); no filled union occurs, and four \(E_5^*\) parts suffice.

## PG2.6: The arbitrary-law Galois criterion

### Generalized Łuczak–Pyber criterion

Proposed declaration: `generalized_luczak_pyber`.

Fix C≥1,0<t<1,0<κ≤1,0<δ≤1/10,0<ε<δ/2. There are B≥0 and integer N≥3 depending only on C,t,κ,δ,ε such that, for every n≥N, every probability measure ν on partitions of n satisfying PartitionLaw, and every θ∈[0,δ/2−ε], ν({ρ:∃σ∈BadTransitive(Fin n),σ∈MergePerms(n^θ)ρ})≤B(log n)² n^(−κ(δ/4−θ/2)). The law may vary with n; B and N do not depend on ν or θ.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Proposition12.1 and proof, pp.59,63.

Prerequisites: PG2.0: Bad transitive permutation set; PG2.0: Permutations with merged cycle type; PG2.3: Three-premise partition law; PG2.3: Five partition anatomy events; PG2.3: Large-gcd pair probability; PG2.3: Block-fraction subsum probability; PG2.3: Long-part lower-tail probability; PG2.3: Large-prime part probability; PG2.3: Four nondivisible long parts with high probability; PG2.5: Exclusion of proper primitive groups; PG2.5: Exclusion of transitive imprimitive groups.

Construction or proof. On the intersection of the five good events the primitive and imprimitive exclusions leave no bad-transitive witness. Every permitted witness group is in one of these cases. The bad event is therefore contained in the union of their complements. All events are measurable in the discrete finite partition space. Use the five failure estimates. Since α≤δ/4,κ≤1, their powers and logarithmic factors are each bounded by a constant times(log n)² n^(−κα). Take the maximum of the finitely many uniform thresholds and sum the constants. The α lower bound ε/2 makes this choice uniform up to θ=δ/2−ε.

Acceptance. The endpoint θ=0 permits only identity merging, while θ=δ/2−ε still has α=ε/2>0. The theorem has all three law premises and exposes constant dependence; it is independent of concrete coefficient measures.

### Polynomial-side bad-group certificate

Proposed declaration: `galois_merging_certificate`.

Let A∈ℤ[X] be monic, separable and irreducible overℚ, and p prime. If the faithful root-action image is neither alternating nor symmetric and maxFactorMultiplicity(A mod p)≤y, then an element in that image witnesses a y-merging of A.factorDegrees p in the bad-transitive set on its n roots. Transporting the roots to Fin n gives the event bounded by generalized-luczak-pyber. Therefore any random-polynomial application bounds its bad-group event by the union of the large-multiplicity event and this partition event.

Source: [Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma: Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), Lemma 11.3; §11.3 reduction following(11.2), pp.57–58; Proposition12.1.

Prerequisites: PG2.1: Ramified Frobenius merging theorem; PG2.0: Bounded equal-part merging; PG2.0: Bad transitive permutation set; tauceti:TauCeti.isPretransitive_iff_irreducible; mathlib:Polynomial.Gal.galActionHom; mathlib:Polynomial.Gal.galActionHom_injective; tauceti:Equiv.Perm.fullCycleType_permCongr; PG2.6: Generalized Łuczak–Pyber criterion.

Construction or proof. Irreducibility gives transitivity; characteristic0 and the stated separability give exactly n roots. Ramified-merging supplies a Galois element. Monotonicity increases M to y; its image subgroup is a permitted bad-transitive witness. Transport the finite root carrier to Fin n, preserving fullCycleType and the alternating/symmetric subgroup inequalities. The pointwise implication yields the event inclusion on any coefficient probability space. Concrete laws, repeated-factor tails and quantitative irreducibility estimates are consumers supplied by ArithmeticStatisticsPartIIRandomPolynomials; no such theorem is an input to the arbitrary-law criterion.

Acceptance. At a ramified prime the element exists even when reduction is not squarefree. Do not claim that transitivity alone gives irreducibility for a nonseparable polynomial, e.g.(X²−2)².

## References and locator conventions

All statements and arguments above are expressed in the roadmap’s own mathematical notation. Page numbers refer to the public versions listed here.

* **Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma**, [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3, final preprint, June 2023; published Invent. Math. 233 (2023), 1041–1120, DOI 10.1007/s00222-023-01193-6. Locators below use the 65-page preprint, not the journal pagination. Read 2026-10-11. Relevant locators: Introduction pp.4–5, k-fold irreducibility; §11.2 pp.56–57, Definition 11.2, Lemma 11.3, Claim 11.4; §12 pp.59–63, Proposition12.1 and all proofs of Lemmas12.2–12.9.
* **László Babai; original lecture scribe Tom Hayes**, [Primitive coherent configurations and the order of uniprimitive permutation groups](https://people.cs.uchicago.edu/~laci/papers/uni-update.pdf). Author exposition, October21,2018; graph proof of Babai1981 with Zemlyachenko’s simplification Read 2026-10-11. Relevant locators: §§2–4 pp.3–5, orbital configurations and primitivity; §6 pp.5–6, distinguishers; §8 pp.7–9, full proof of Theorem 6.6; §9 p.10, Exercise 9.5 and Corollary 9.6.
* **Bernd Schomburg**, [Bochert’s results on the minimal degree of multiply transitive permutation groups](https://arxiv.org/pdf/2209.12049v1). arXiv:2209.12049v1, September24,2022 Read 2026-10-11. Relevant locators: §2 pp.1–4, commutator support and Lemmas2.3–2.5; §3 pp.4–5, Theorem 3.1 and its entire proof.
* **Lior Bary-Soroker, Gady Kozma**, [Irreducible polynomials of bounded height](https://arxiv.org/pdf/1710.05165). Public arXiv:1710.05165 PDF read October11,2026; published Duke Math. J.169 (2020),579–598 Read 2026-10-11. Relevant locators: Claim 1 and proof, pp.9–10, primitive minimum degree source route.
