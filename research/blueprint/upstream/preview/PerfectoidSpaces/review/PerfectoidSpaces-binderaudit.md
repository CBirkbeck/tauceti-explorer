# PerfectoidSpaces: binder audit of the sorry'd data declarations

Folder `TauCetiRoadmap/PerfectoidSpaces/` (Suggested.lean, 27k lines). Only `Suggested.lean` was edited; README.md needed no change (every README sentence about the repaired declarations already assumes the restored hypotheses). Line numbers below are those of the repaired file.

## Mechanism, as verified in this toolchain (Lean v4.35.0-rc3)

* A `def`/`instance` whose body is `sorry` keeps exactly the section variables its *type* mentions. Unlike a theorem, it does **not** pick up instance-implicit variables whose dependencies are present: in a toy section `variable {R} [CommRing R]`, `noncomputable def bar : R := sorry` elaborates to `bar : {R : Type u_1} → R` with no `CommRing`.
* Prop-valued `instance`s are compiled as theorems but follow the *definition* rule above (no instance auto-inclusion), so they lose binders the same way; 189 of them exist here, 149 sorry'd.
* `include h in` does not reach a `def` (toy: `include hR in def foo : Type := sorry` gives `foo : Type`).
* Writing a binder that is still on a `variable` line again in a declaration trips `linter.overlappingInstances` (toy-confirmed). The repairs therefore rebind, in the declaration's own signature, the type variable(s) the lost binders mention together with every later section variable the declaration uses, in the original order and with the original binder kinds; the section variables are left untouched for the theorems. Anonymous instances that had to be rewritten were given their previous auto-generated names explicitly so no public name changes.
* `example`s are not affected: their bodies, like definition bodies, include any section variable they use once filled, and they export no signature.

## Method

1. Listing. A copy of Suggested.lean was instrumented with two elaborator commands: `#scope_dump` after every `variable`/`section`/`namespace`/`end`/`include`/`omit` command (prints the elaborated section variables: name, binder kind, type), and `#decl_dump` at the end (prints, for every constant of the file with a source range, its kind, whether its value contains `sorryAx`, and its elaborated binder list). Sorry'd Prop-valued instances (theorem values are not visible) were identified from the `declaration uses sorry` warnings of the baseline run.
2. Checked: **662** declarations = 512 sorry'd data definitions/instances (481 `def`s, 31 data `instance`s; no sorry'd `abbrev`) + 149 sorry'd Prop-valued instances + 1 sorry'd `local instance`.
3. For each, the elaborated binders were compared with the section variables in scope (named variables by name, anonymous instances by normalised type). A lost binder counts only if every section variable its type mentions is present in the declaration. 152 declarations lost at least one binder; each was classified against the README paragraph and the docstring, with a concrete instance for every FALSE verdict.
4. 18 root declarations were repaired (9 FALSE, 9 UNDERSPECIFIED), the instrumented copy re-elaborated, and all 2911 elaborated signatures diffed against the originals; then `#check @…` was run on the 40 repaired or propagated declarations in a copy of the repaired file, and the file itself was elaborated.

## Table (most severe first)

Kinds: def = sorry'd data definition, instance = sorry'd data instance, Prop instance = sorry'd Prop-valued instance. Root rows were edited; propagated rows changed only because they mention a repaired root.

| # | Lean line | declaration | binders that were missing | verdict | repair applied |
|---|---|---|---|---|---|
| 1 | 5968 | `Perfectoid.perfectedTateAlgebra.isPerfectoidTateRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | **FALSE**: R = K⟨T⟩ with K the completion of ℚ_p(p^{1/p^∞}), ϖ = (p^{1/p^{n+1}})ₙ, σ = PEmpty: the algebra is R itself (R complete and uniform), and K⟨T⟩ is not perfectoid (T is not a p-th power modulo p in K°⟨T⟩). | R, ϖ, σ and R's binders rebound in the instance's signature |
| 2 | 6022 | `Perfectoid.perfectedTateAlgebra.emptyEquiv` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] ; unused data: σ, S | **FALSE**: R = ℚ_p(p^{1/p^∞}) (uncompleted, countable), ϖ = (p^{1/p^{n+1}})ₙ: the source is the ϖ-adic completion of R° with ϖ inverted, i.e. the completion of R, which is uncountable, so there is no bijection with R; a complete non-uniform R = K[ε]/(ε²) fails as well (the ϖ-adic completion of R° = K° + Kε kills ε). | R, ϖ and R's binders rebound in the signature |
| 3 | 6052 | `Perfectoid.tiltField.instNontriviallyNormedField` (instance) | [Fact (Prime p)] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | **FALSE**: K = ℚ_p: tiltField p ℚ_p = Perfection ℚ_p p has exactly p elements (0 and the (p−1)-st roots of unity, each with its unique compatible root system), and a finite type carries no NontriviallyNormedField. | p, K and K's binders rebound; instance named instNontriviallyNormedField to keep its name |
| 4 | 6520 | `Perfectoid.perfectedTateAlgebra.laurent.instIsPerfectoidTateRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | **FALSE**: same instance as perfectedTateAlgebra.isPerfectoidTateRing with σ = PEmpty (the exponent group (PEmpty →₀ ℤ[1/p]) is trivial, so laurent = R = K⟨T⟩). | R, ϖ, σ and R's binders rebound; instance named instIsPerfectoidTateRing to keep its name |
| 5 | 7374 | `Perfectoid.(local instance) PerfectRing (powerBoundedSubring K) p` (Prop instance) | [Fact (Prime p)] [CompleteSpace K] [IsPerfectoidField p K] [CharP K p] ; unused data: ϖ | **FALSE**: K = ℚ_p: the local instance says x ↦ x^p is bijective on ℤ_p for every ultrametric field K; p is not a p-th power in ℤ_p. | binders written in the local instance's own signature (rebinding p, K) |
| 6 | 8182 | `Perfectoid.isPerfectoidTateRing_completedTensor` (Prop instance) | [IsUniformAddGroup A] [CompleteSpace A] [T2Space A] [IsPerfectoidTateRing p A] [IsUniformAddGroup B] [CompleteSpace B] [T2Space B] [IsPerfectoidTateRing p B] [IsUniformAddGroup C] [CompleteSpace C] [T2Space C] [IsPerfectoidTateRing p C] | **FALSE**: A = B = C = ℚ_p (identity structure maps, adic): CompletedTensor ≅ ℚ_p, which has no pseudo-uniformizer ϖ with ϖ^p ∣ p in ℤ_p, so is not perfectoid. | the section's A/B/C variable block moved into the instance's signature (it was the only declaration of the section) |
| 7 | 8702 | `Perfectoid.isPerfectoid_uniformCompletedTensor` (Prop instance) | [IsUniformAddGroup A] [IsUniformAddGroup B] [CompleteSpace B] [T2Space B] [IsPerfectoidTateRing p B] [IsUniformAddGroup C] [CompleteSpace C] [T2Space C] [IsPerfectoidTateRing p C] | **FALSE**: A = B = C = ℚ_p: Uniformization ℚ_p = ℚ_p is not perfectoid. | A, B, C and their binders rebound in the instance's signature |
| 8 | 16196 | `CategoryTheory.FilteredTwoColimit.equivConst` (def) | [IsFiltered J] ; unused data: F | **FALSE**: J = Discrete PEmpty, C = Discrete PUnit: the 2-colimit of the empty diagram is empty and admits no equivalence to C (the file's own Check `cofiltered_empty_index` states this). | J rebound with [IsFiltered J]; the ineffective `include hJ in` deleted |
| 9 | 16699 | `CategoryTheory.FilteredTwoColimit.homEquiv` (def) | [IsFiltered J] | **FALSE**: J = WalkingParallelPair (not filtered), F constant at the one-object discrete category: every arrow is inverted, so Hom(ι zero *, ι zero *) is π₁ of a ⇉ b, i.e. ℤ, while the cospan quotient has three classes {(id,id),(l,l),(r,r)}, {(l,r)}, {(r,l)}. | J, F rebound with [IsFiltered J]; the ineffective `include hJ in` deleted |
| 10 | 7412 | `Perfectoid.almostInverseLimitRing.inverseComparison` (def) | [CharP K p] | **FALSE**: K = ℂ_p (characteristic 0), B the base object K°/ϖ: the inverse of the almost-reduction equivalence gives K°ᵃ, on which p is not almost zero, while the inverse-limit ring is an 𝔽_p-algebra (p acts as 0); the two are not isomorphic. | none needed in the declaration: it gains [CharP K p] through the repaired Algebra instance |
| 11 | 16039 | `PerfectoidSpace.cofilteredLimit.isLimit` (def) | [IsCofiltered I] | **FALSE**: I = Discrete PEmpty (hX vacuous): the cone point would be a terminal object of Perfd p, which has none (a terminal T would receive a Gal(Q̄_p/ℚ_p)-invariant map from Spa ℂ_p, i.e. a continuous map from a perfectoid Tate ring to ℚ_p, impossible since ℚ_p has no topologically nilpotent unit with all p-power roots). | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 12 | 16339 | `PerfectoidSpace.finiteStageFiniteEtaleEquiv` (def) | [IsCofiltered I] | **FALSE**: I = Discrete PEmpty: the 2-colimit of the empty diagram is the empty category, while the target category always contains ∅ → X. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 13 | 16406 | `PerfectoidSpace.finiteStageQcqsEquiv` (def) | [IsCofiltered I] | **FALSE**: I = Discrete PEmpty: the 2-colimit of the empty diagram is the empty category, while the target category always contains ∅ → X. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 14 | 16471 | `PerfectoidSpace.finiteStageSeparatedEquiv` (def) | [IsCofiltered I] | **FALSE**: I = Discrete PEmpty: the 2-colimit of the empty diagram is the empty category, while the target category always contains ∅ → X. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 15 | 16617 | `PerfectoidSpace.cofilteredLimit.baseChange` (def) | [IsCofiltered I] | **FALSE**: I = Discrete Bool, X true = Spa ℂ_p, X false = the empty affinoid, g = 𝟙: Over i has one object, so the statement at i = true and at i = false makes the same cone point isomorphic (resp. homeomorphic) to both, impossible. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 16 | 16621 | `PerfectoidSpace.cofilteredLimit.baseChangeHomeomorph` (def) | [IsCofiltered I] | **FALSE**: I = Discrete Bool, X true = Spa ℂ_p, X false = the empty affinoid, g = 𝟙: Over i has one object, so the statement at i = true and at i = false makes the same cone point isomorphic (resp. homeomorphic) to both, impossible. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 17 | 5406 | `Perfectoid.uniformTilt.instCommRing` (instance) | [Fact (Prime p)] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: inhabited (every nonempty type carries a commutative ring structure), but the ring structure cannot depend on the topology of B although its addition is the topological limit of `coeff_add`. | p, B and the topology binders rebound; instance named instCommRing to keep its name |
| 18 | 5988 | `Perfectoid.perfectedTateAlgebra.lift` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [IsUniformAddGroup S] [CompleteSpace S] [T2Space S] | **UNDERSPECIFIED**: inhabited (X ↦ 0 followed by f), but extending from the completed algebra needs S complete and Hausdorff (README: 'complete Hausdorff uniform Tate R-algebra S'). | R, ϖ, σ, S and their binders rebound in the signature |
| 19 | 6337 | `Perfectoid.completedFilteredColimit.lift` (def) | [IsUniformAddGroup S] [CompleteSpace S] [T2Space S] | **UNDERSPECIFIED**: the factorisation through the completed colimit needs S complete and Hausdorff (docstring: 'into a complete uniform Tate ring'). | S and its binders rebound in the signature |
| 20 | 6415 | `Perfectoid.perfectedTateAlgebra.pair` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | **UNDERSPECIFIED**: inhabited, but the sorried field `isRingOfIntegralElements` for R⁺⟨T^{1/p^∞}⟩ is only claimed by the README for perfectoid R ('the resulting perfectoid pair'). | R, ϖ, σ and R's binders rebound in the signature |
| 21 | 7394 | `Perfectoid.almostInverseLimitRing.instAlgebraSubtypeMemSubringPowerBoundedSubring` (instance) | [CharP K p] | **UNDERSPECIFIED**: inhabited (through the residue field), but the intended K°-action a ↦ (Φ⁻ⁿ(a) mod ϖ)ₙ needs K perfect of characteristic p. | K, ϖ, B and K's binders rebound; instance named explicitly to keep its name |
| 22 | 10022 | `Perfectoid.pfiniteSystem` (def) | [CompleteSpace K] [IsPerfectoidField p K] [CharP K p] | **UNDERSPECIFIED**: existence claim of Sch12 Lemma 6.13, stated there for a perfectoid field of characteristic p; without these hypotheses the claim is outside the source. | K, R, [Algebra K R] and K's binders rebound in the signature |
| 23 | 16026 | `PerfectoidSpace.cofilteredLimit` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: inhabited by junk, but the limit object exists only for cofiltered I; the `include hI in` line above it does not reach a def. | I rebound with [IsCofiltered I]; `include hI in` deleted; the two `omit hI in` lines on lift_π and hom_ext deleted (they now need hI) |
| 24 | 16996 | `CategoryTheory.FilteredTwoColimit.fullSubcategory` (def) | [IsFiltered J] | **UNDERSPECIFIED**: README states it for filtered J; without a calculus of fractions the localisation of a full subdiagram need not be the full subcategory. | J, F rebound with [IsFiltered J]; `include hJ in` deleted |
| 25 | 22669 | `PerfectoidSpace.GoodAffinoid.raise` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: raising a chart to a level j → W.level uses common refinements of stages, available only for cofiltered I. | I rebound with [IsCofiltered I] |
| 26 | 5410 | `Perfectoid.uniformTilt.instIsTopologicalRing` (Prop instance) | [Fact (Prime p)] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 27 | 5412 | `Perfectoid.uniformTilt.instIsUniformAddGroup` (Prop instance) | [Fact (Prime p)] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 28 | 5413 | `Perfectoid.uniformTilt.instCompleteSpace` (Prop instance) | [Fact (Prime p)] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 29 | 5415 | `Perfectoid.uniformTilt.instCharPOfNontrivial` (Prop instance) | [Fact (Prime p)] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 30 | 5416 | `Perfectoid.uniformTilt.instPerfectRing` (Prop instance) | [Fact (Prime p)] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 31 | 5417 | `Perfectoid.uniformTilt.instNonarchimedeanAddGroup` (Prop instance) | [Fact (Prime p)] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 32 | 5422 | `Perfectoid.uniformTilt.coeff` (def) | [Fact (Prime p)] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 33 | 5438 | `Perfectoid.uniformTilt.plus` (def) | [Fact (Prime p)] [IsUniformAddGroup B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 34 | 5449 | `Perfectoid.uniformTilt.plusEquiv` (def) | [IsUniformAddGroup B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 35 | 5459 | `Perfectoid.uniformTilt.theta` (def) | [IsUniformAddGroup B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 36 | 5467 | `Perfectoid.uniformTilt.map` (def) | [Fact (Prime p)] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] [IsUniformAddGroup C] [IsTopologicalRing C] [IsTateRing C] [CompleteSpace C] [T2Space C] [Fact (IsBounded ↑(powerBoundedSubring C))] | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 37 | 5479 | `Perfectoid.uniformTilt.equivTilt` (def) | [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] ; unused data: C | **UNDERSPECIFIED**: built on the topology-free ring structure of uniformTilt.instCommRing. | gains the topology binders through the repaired uniformTilt.instCommRing |
| 38 | 6058 | `Perfectoid.tiltField.instIsUltrametricDist` (Prop instance) | [Fact (Prime p)] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 39 | 6059 | `Perfectoid.tiltField.instCompleteSpace` (Prop instance) | [Fact (Prime p)] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 40 | 6060 | `Perfectoid.tiltField.instIsPerfectoidField` (Prop instance) | [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 41 | 6061 | `Perfectoid.tiltField.instCharP` (Prop instance) | [Fact (Prime p)] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 42 | 6075 | `Perfectoid.tiltField.integerEquiv` (def) | [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 43 | 6082 | `Perfectoid.tiltField.residueFieldEquiv` (def) | [Fact (Prime p)] [CompleteSpace K] [IsPerfectoidField p K] | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 44 | 6098 | `Perfectoid.tiltField.equivMathlibTilt` (def) | [CompleteSpace K] [IsPerfectoidField p K] (hvnorm : ∀ (x : K), v x = ‖x‖₊) | **UNDERSPECIFIED**: stated about the normed-field instance of tiltField, which was FALSE for K = ℚ_p. The lost `hvnorm` itself is not needed (the ring isomorphism with Mathlib `Tilt` does not involve the norm; no declaration uses `hvnorm`). | gains [Fact p.Prime] [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] (as far as not already present) through the repaired instance |
| 45 | 16030 | `PerfectoidSpace.cofilteredLimit.π` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 46 | 16035 | `PerfectoidSpace.cofilteredLimit.cone` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 47 | 16055 | `PerfectoidSpace.cofilteredLimit.homeomorph` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 48 | 16342 | `PerfectoidSpace.finiteStageFiniteEtaleEquiv_ι` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 49 | 16409 | `PerfectoidSpace.finiteStageQcqsEquiv_ι` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 50 | 16474 | `PerfectoidSpace.finiteStageSeparatedEquiv_ι` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 51 | 16608 | `PerfectoidSpace.cofilteredLimit.baseChangeCone` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 52 | 16642 | `PerfectoidSpace.cofilteredLimit.restrictRational` (def) | [IsCofiltered I] | **UNDERSPECIFIED**: stated about the junk limit object of cofilteredLimit. | gains [IsCofiltered I] through the repaired cofilteredLimit |
| 53 | 17476 | `CategoryTheory.FilteredTwoColimit.equivConst_ι` (def) | [IsFiltered J] | **UNDERSPECIFIED**: stated about equivConst, which was FALSE for empty J. | gains [IsFiltered J] through the repaired equivConst |
| 54 | 4360 | `Perfectoid.PseudoUniformizerRoots.map` (def) | [Fact (Prime p)] [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [IsUniformAddGroup S] [CompleteSpace S] [T2Space S] [IsPerfectoidTateRing p S] ; unused data: T | FINE: a continuous map of Tate rings sends the bounded ring of definition to a bounded set, hence power-bounded elements, pseudo-uniformizers and ϖ^p ∣ p to the same; no completeness or perfectoid hypothesis needed. | none |
| 55 | 4791 | `Perfectoid.untilt.sharp` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p] | FINE: x ↦ θ([x]) on R⁺, extended by inverting [ϖ], exists for any Tate ring with ring of integral elements; `sharp_apply` pins it. | none |
| 56 | 4811 | `Perfectoid.untilt.map` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] [CharP R p] | FINE: the docstring states it is defined for arbitrary ideals; continuous maps send pseudo-uniformizers of R⁺ to pseudo-uniformizers of R'⁺. | none |
| 57 | 5414 | `Perfectoid.uniformTilt.instNontrivial` (Prop instance) | [Fact (Prime p)] [UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [IsTateRing B] [CompleteSpace B] [T2Space B] [Fact (IsBounded ↑(powerBoundedSubring B))] [Fact (IsTopologicallyNilpotent ↑p)] | FINE: the constant sequences 0 and 1 differ for nontrivial B; no ring structure is involved. | none |
| 58 | 5945 | `Perfectoid.perfectedTateAlgebra.instAlgebra` (instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: R = R°[1/ϖ] for any Tate ring, and the adic uniformity of the completed algebra exists for any Tate R. | none |
| 59 | 5946 | `Perfectoid.perfectedTateAlgebra.instUniformSpace` (instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: R = R°[1/ϖ] for any Tate ring, and the adic uniformity of the completed algebra exists for any Tate R. | none |
| 60 | 5947 | `Perfectoid.perfectedTateAlgebra.instIsUniformAddGroup` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 61 | 5948 | `Perfectoid.perfectedTateAlgebra.instIsTopologicalRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 62 | 5949 | `Perfectoid.perfectedTateAlgebra.instIsTateRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 63 | 5950 | `Perfectoid.perfectedTateAlgebra.instCompleteSpace` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 64 | 5951 | `Perfectoid.perfectedTateAlgebra.instT2Space` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 65 | 6015 | `Perfectoid.perfectedTateAlgebra.mapIndex` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] ; unused data: S | FINE: functoriality of the adic completion and the projection onto integral exponents exist for any Tate R. | none |
| 66 | 6277 | `Perfectoid.integralDiagram` (def) | [IsFiltered J] | FINE: diagram constructions; filteredness is not used. | none |
| 67 | 6513 | `Perfectoid.perfectedTateAlgebra.laurent.instAlgebra` (instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: R = R°[1/ϖ] for any Tate ring, and the adic uniformity of the completed algebra exists for any Tate R. | none |
| 68 | 6514 | `Perfectoid.perfectedTateAlgebra.laurent.instUniformSpace` (instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: R = R°[1/ϖ] for any Tate ring, and the adic uniformity of the completed algebra exists for any Tate R. | none |
| 69 | 6515 | `Perfectoid.perfectedTateAlgebra.laurent.instIsUniformAddGroup` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 70 | 6516 | `Perfectoid.perfectedTateAlgebra.laurent.instIsTopologicalRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 71 | 6517 | `Perfectoid.perfectedTateAlgebra.laurent.instIsTateRing` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 72 | 6518 | `Perfectoid.perfectedTateAlgebra.laurent.instCompleteSpace` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 73 | 6519 | `Perfectoid.perfectedTateAlgebra.laurent.instT2Space` (Prop instance) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: true for any Tate R: the ϖ-adic completion of R°[monoid] with ϖ inverted is a complete Hausdorff Tate ring with ϖ as pseudo-uniformizer. | none |
| 74 | 6763 | `Perfectoid.perfectedTateAlgebra.restrictedIncl` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: functoriality of the adic completion and the projection onto integral exponents exist for any Tate R. | none |
| 75 | 6774 | `Perfectoid.perfectedTateAlgebra.retraction` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] | FINE: functoriality of the adic completion and the projection onto integral exponents exist for any Tate R. | none |
| 76 | 6810 | `Perfectoid.perfectedTateAlgebra.liftTilt` (def) | [IsUniformAddGroup R] [CompleteSpace R] [T2Space R] [IsPerfectoidTateRing p R] ; unused data: n, σ', σ'' | FINE: S keeps all its hypotheses (they enter through tilt p S); R's are not used by the construction. | none |
| 77 | 7384 | `Perfectoid.almostInverseLimitRing.instCommRing` (instance) | [CharP K p] | FINE: B lives over K°/ϖ, which has characteristic p in every characteristic (ϖ^p ∣ p), so the Perfection ring and its coordinates exist without [CharP K p]. | none |
| 78 | 7386 | `Perfectoid.almostInverseLimitRing.coeff` (def) | [CharP K p] | FINE: B lives over K°/ϖ, which has characteristic p in every characteristic (ϖ^p ∣ p), so the Perfection ring and its coordinates exist without [CharP K p]. | none |
| 79 | 8242 | `Perfectoid.discScale` (def) | [CompleteSpace K] [IsPerfectoidField p K] | FINE: T^{1/pⁿ} ↦ ϖ^{1/pⁿ}T^{1/pⁿ} on the perfected disc algebra needs no completeness or perfectoid hypothesis on K. | none |
| 80 | 9727 | `PerfectoidSpace.FieldSpace.instCategory` (instance) | [IsUltrametricDist K] [CompleteSpace K] [IsPerfectoidField p K] | FINE: composition of morphisms over K needs no hypothesis on K. | none |
| 81 | 11249 | `Perfectoid.FiniteEtale.untilt` (def) | [IsPerfectoidTateRing p R] | FINE: matcher false positive: the def rebinds R with its own [IsPerfectoidTateRing p R] (the section's named `hperfect` is shadowed). | none |
| 82 | 15857 | `Perfectoid.plusDiagram` (def) | [IsFiltered J] ; unused data: j₀ | FINE: diagram constructions; filteredness is not used. | none |
| 83 | 15897 | `Perfectoid.completedColimit.uniformizer` (def) | [IsFiltered J] | FINE: diagram constructions; filteredness is not used. | none |
| 84 | 16062 | `PerfectoidSpace.cofilteredLimit.isoOfInitial` (def) | [IsCofiltered I] | FINE: I is cofiltered automatically (Mathlib `IsCofiltered.of_initial`); the signature now also carries [IsCofiltered I] through cofilteredLimit. | gains [IsCofiltered I] through cofilteredLimit |
| 85 | 16163 | `CategoryTheory.FilteredTwoColimit.ι` (def) | [IsFiltered J] | FINE: the localisation functor, the inverted transport arrows and the universal property of the localisation exist for any J. | none |
| 86 | 16168 | `CategoryTheory.FilteredTwoColimit.ιCompIso` (def) | [IsFiltered J] | FINE: the localisation functor, the inverted transport arrows and the universal property of the localisation exist for any J. | none |
| 87 | 16173 | `CategoryTheory.FilteredTwoColimit.desc` (def) | [IsFiltered J] | FINE: the localisation functor, the inverted transport arrows and the universal property of the localisation exist for any J. | none |
| 88 | 16176 | `CategoryTheory.FilteredTwoColimit.ιCompDescIso` (def) | [IsFiltered J] | FINE: the localisation functor, the inverted transport arrows and the universal property of the localisation exist for any J. | none |
| 89 | 16290 | `PerfectoidSpace.finiteStageFiniteEtaleDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 90 | 16356 | `PerfectoidSpace.finiteStageQcqsDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 91 | 16424 | `PerfectoidSpace.finiteStageSeparatedDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 92 | 16601 | `PerfectoidSpace.cofilteredLimit.baseChangeDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 93 | 16716 | `CategoryTheory.FilteredTwoColimit.reindex` (def) | [IsFiltered J] | FINE: restriction of pseudofunctors; filteredness not used. | none |
| 94 | 16731 | `CategoryTheory.FilteredTwoColimit.equivOfFinal` (def) | [IsFiltered J] | FINE: J is filtered automatically (Mathlib `IsFiltered.of_final`: J' filtered, G final); the ineffective `include hJ in` above equivOfFinal deleted. | `include hJ in` deleted (no effect) |
| 95 | 16734 | `CategoryTheory.FilteredTwoColimit.equivOfFinal_ι` (def) | [IsFiltered J] | FINE: J is filtered automatically (Mathlib `IsFiltered.of_final`: J' filtered, G final); the ineffective `include hJ in` above equivOfFinal deleted. | `include hJ in` deleted (no effect) |
| 96 | 16765 | `PerfectoidSpace.finiteStagePullbackIso` (def) | [IsCofiltered I] | FINE: pullback pasting along π_j ≫ X.map a = π_i (π_comp); the signature now also carries [IsCofiltered I] through cofilteredLimit.π. | gains [IsCofiltered I] through cofilteredLimit |
| 97 | 16975 | `CategoryTheory.FilteredTwoColimit.fullSubdiagram` (def) | [IsFiltered J] | FINE: restriction of pseudofunctors; filteredness not used. | none |
| 98 | 17014 | `Perfectoid.completedColimit.quotientDiagram` (def) | [IsFiltered J] ; unused data: j₀ | FINE: diagram constructions; filteredness is not used. | none |
| 99 | 17065 | `PerfectoidSpace.sectionsDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 100 | 17071 | `PerfectoidSpace.plusSectionsDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 101 | 17178 | `CategoryTheory.fpModuleDiagram` (def) | [IsFiltered J] | FINE: diagram constructions; filteredness is not used. | none |
| 102 | 17505 | `PerfectoidSpace.globalPlusQuotientDiagram` (def) | [IsCofiltered I] (hX : ∀ (i : I), IsAffinoidPerfectoid p (obj i).obj) | FINE: pullback/section diagrams; neither cofilteredness nor hX is used. | none |
| 103 | 20866 | `AdicSpace.IsTildeLimit.homeomorph` (def) | [IsCofiltered I] | FINE: the structures carry `isEmbedding` and `range_eq`, which give the homeomorphism onto compatible tuples for any I. | none |
| 104 | 21613 | `Perfectoid.FrobeniusTower.discPower` (def) | [Fact (Prime p)] | FINE: X ↦ X^p on the completed polynomial ring is a ring map for any p (the def binds its own p). | none |
| 105 | 22657 | `PerfectoidSpace.IsResidueFieldTildeLimit.homeomorph` (def) | [IsCofiltered I] | FINE: the structures carry `isEmbedding` and `range_eq`, which give the homeomorphism onto compatible tuples for any I. | none |
| 106 | 23178 | `PerfectoidSpace.residueEtaleDiagram` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 107 | 23234 | `PerfectoidSpace.residueEtaleComparison` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 108 | 23384 | `PerfectoidSpace.residueEtaleSheafPullback` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 109 | 23401 | `PerfectoidSpace.residueEtaleLimitSheaf` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 110 | 23442 | `PerfectoidSpace.residueEtaleCohomologyDiagram` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 111 | 23452 | `PerfectoidSpace.residueEtaleCohomologyCocone` (def) | [IsCofiltered I] | FINE: constructions from pullbacks along transitions and cone maps; no limit property used. | none |
| 112 | 26192 | `Perfectoid.ringDiagram` (def) | [IsFiltered J] | FINE: diagram constructions; filteredness is not used. | none |
| 113 | 120 | `Almost.BasicSetup.classical` (def) | unused data: S | FINE: only section data the declaration does not use (S) | none |
| 114 | 155 | `Almost.BasicSetup.ofCompatibleRoots` (def) | unused data: S | FINE: only section data the declaration does not use (S) | none |
| 115 | 234 | `Almost.BasicSetup.ofValuationRing` (def) | unused data: V | FINE: only section data the declaration does not use (V) | none |
| 116 | 839 | `Almost.Module.classicalEquiv` (def) | unused data: S | FINE: only section data the declaration does not use (S) | none |
| 117 | 1515 | `Almost.Algebra.classicalEquiv` (def) | unused data: S | FINE: only section data the declaration does not use (S) | none |
| 118 | 2821 | `CotangentComplex.transitivityFirst` (def) | unused data: R, T | FINE: only section data the declaration does not use (R, T) | none |
| 119 | 2828 | `CotangentComplex.transitivitySecond` (def) | unused data: R, T | FINE: only section data the declaration does not use (R, T) | none |
| 120 | 2897 | `CotangentComplex.extensionSetoid` (def) | unused data: T | FINE: only section data the declaration does not use (T) | none |
| 121 | 4051 | `Perfectoid.PseudoUniformizerRoots.instNonempty` (Prop instance) | unused data: ϖ | FINE: only section data the declaration does not use (ϖ) | none |
| 122 | 4316 | `Perfectoid.tilt.map` (def) | unused data: T | FINE: only section data the declaration does not use (T) | none |
| 123 | 4369 | `Perfectoid.Pair.tiltHom` (def) | unused data: T | FINE: only section data the declaration does not use (T) | none |
| 124 | 4447 | `Perfectoid.isPerfectoidField_padicComplex` (Prop instance) | unused data: K | FINE: only section data the declaration does not use (K) | none |
| 125 | 4454 | `Perfectoid.padicCyclotomic.instIsPerfectoidField` (Prop instance) | unused data: K | FINE: only section data the declaration does not use (K) | none |
| 126 | 6362 | `Perfectoid.completedFilteredColimit.terminalEquiv` (def) | unused data: S | FINE: only section data the declaration does not use (S) | none |
| 127 | 6857 | `Perfectoid.IsIntegralAlmostPerfectoid` (def) | unused data: V | FINE: only section data the declaration does not use (V) | none |
| 128 | 6872 | `Perfectoid.IsModAlmostPerfectoid` (def) | unused data: V | FINE: only section data the declaration does not use (V) | none |
| 129 | 6888 | `Perfectoid.almostReductionFunctor` (def) | unused data: V, R | FINE: only section data the declaration does not use (V, R) | none |
| 130 | 6927 | `Perfectoid.almostReductionEquivalence` (def) | unused data: V, R | FINE: only section data the declaration does not use (V, R) | none |
| 131 | 6956 | `Perfectoid.fieldIntegralFunctor` (def) | unused data: V, R | FINE: only section data the declaration does not use (V, R) | none |
| 132 | 6988 | `Perfectoid.fieldIntegralEquivalence` (def) | unused data: V, R | FINE: only section data the declaration does not use (V, R) | none |
| 133 | 6996 | `Perfectoid.fieldIntegralEquivalence_inverse` (def) | unused data: V, R | FINE: only section data the declaration does not use (V, R) | none |
| 134 | 7083 | `Perfectoid.completedFilteredColimit.underObject` (def) | unused data: F, j₀ | FINE: only section data the declaration does not use (F, j₀) | none |
| 135 | 7092 | `Perfectoid.completedFilteredColimit.untiltEquiv` (def) | unused data: F, j₀ | FINE: only section data the declaration does not use (F, j₀) | none |
| 136 | 9841 | `PerfectoidSpace.charPOfPair` (def) | unused data: A, B | FINE: only section data the declaration does not use (A, B) | none |
| 137 | 11938 | `Perfectoid.finiteEtalePairFunctor` (def) | unused data: R | FINE: only section data the declaration does not use (R) | none |
| 138 | 12325 | `Perfectoid.FiniteEtale.trace` (def) | unused data: p | FINE: only section data the declaration does not use (p) | none |
| 139 | 16348 | `PerfectoidSpace.qcqsEtaleBaseChange` (def) | unused data: I | FINE: only section data the declaration does not use (I) | none |
| 140 | 16415 | `PerfectoidSpace.qcSeparatedEtaleBaseChange` (def) | unused data: I | FINE: only section data the declaration does not use (I) | none |
| 141 | 17172 | `CategoryTheory.fpModules.baseChange` (def) | unused data: J | FINE: only section data the declaration does not use (J) | none |
| 142 | 17593 | `PerfectoidSpace.continuousFunctionSpaceHomeomorph` (def) | unused data: I | FINE: only section data the declaration does not use (I) | none |
| 143 | 18491 | `PerfectoidSpace.prodProfinite.sectionsEquiv` (def) | unused data: X | FINE: only section data the declaration does not use (X) | none |
| 144 | 18494 | `PerfectoidSpace.prodProfinite.plusEquiv` (def) | unused data: X | FINE: only section data the declaration does not use (X) | none |
| 145 | 20875 | `AdicSpace.singletonCone` (def) | unused data: I | FINE: only section data the declaration does not use (I) | none |
| 146 | 21305 | `PerfectoidSpace.strongCompletion` (def) | unused data: R | FINE: only section data the declaration does not use (R) | none |
| 147 | 21307 | `PerfectoidSpace.strongCompletion.ι` (def) | unused data: R | FINE: only section data the declaration does not use (R) | none |
| 148 | 21310 | `PerfectoidSpace.strongCompletion.homeomorph` (def) | unused data: R | FINE: only section data the declaration does not use (R) | none |
| 149 | 21321 | `PerfectoidSpace.strongCompletion.map` (def) | unused data: R | FINE: only section data the declaration does not use (R) | none |
| 150 | 21798 | `PerfectoidSpace.CofinalityWitness.ofDecreasing` (def) | unused data: J | FINE: only section data the declaration does not use (J) | none |
| 151 | 22719 | `RegularTower.powerSeriesDiagram` (def) | unused data: p | FINE: only section data the declaration does not use (p) | none |
| 152 | 23003 | `PerfectoidSpace.analyticEtalePullback` (def) | unused data: p | FINE: only section data the declaration does not use (p) | none |

## Counts

* checked: **662**
* FALSE: **16** (9 root declarations edited directly; 7 more stated about a repaired root and fixed through it)
* UNDERSPECIFIED: **37** (9 roots edited; 28 propagated)
* FINE: **609** (99 that lost binders the construction does not need, 510 that lost nothing)

## Edits

* Binders written in the declaration's own signature (section variables rebound): `uniformTilt.instCommRing`, `perfectedTateAlgebra.isPerfectoidTateRing`, `perfectedTateAlgebra.lift`, `perfectedTateAlgebra.emptyEquiv`, `tiltField.instNontriviallyNormedField`, `completedFilteredColimit.lift`, `perfectedTateAlgebra.pair`, `perfectedTateAlgebra.laurent.instIsPerfectoidTateRing`, the local `PerfectRing (powerBoundedSubring K) p` instance, `almostInverseLimitRing.instAlgebraSubtypeMemSubringPowerBoundedSubring`, `isPerfectoid_uniformCompletedTensor`, `pfiniteSystem`, `cofilteredLimit`, `FilteredTwoColimit.equivConst`, `FilteredTwoColimit.homEquiv`, `FilteredTwoColimit.fullSubcategory`, `GoodAffinoid.raise`.
* `section CompletedTensorPerfectoid`: its only declaration is `isPerfectoidTateRing_completedTensor`, so the A/B/C part of the `variable` block was moved into that instance's signature (`variable (p : ℕ) [Fact p.Prime]` kept).
* Deleted `include … in` lines that preceded definitions (they never applied): before `cofilteredLimit`, `equivConst`, `homEquiv`, `fullSubcategory`, and the redundant ones before `equivOfFinal`, `completedColimitPlus`, `fpModuleColimitEquiv` (the last two already receive `[IsFiltered J]` through their types).
* Consumers adapted: the two `omit hI in` lines before the theorems `cofilteredLimit.lift_π` and `cofilteredLimit.hom_ext` were deleted, since these statements now need `hI` (`omit` of a referenced variable is an error). No Check or README sentence needed a change; `not_isKappaSmall_gaussField_cofilteredLimit` already supplies `letI := hI` and now uses it.
* No declaration deleted or renamed. One auto-generated name changes: the anonymous `local instance : PerfectRing (powerBoundedSubring K) p` is now auto-named `…instPerfectRingSubtypeMemSubringPowerBoundedSubringOfIsPerfectoidFieldOfCharP` (it is local to its section and referenced nowhere by name).

**Signature diff (all 2911 constants, before vs after):** 60 declarations changed, every change being added instance-implicit binders only; explicit/implicit binder sequences and result types are unchanged everywhere (the one textual type difference, in `not_isKappaSmall_gaussField_cofilteredLimit`, is its existing `hI` now being used by `cofilteredLimit`). Besides the rows above, the non-sorry `uniformTilt.instUniformSpace`, `uniformTilt.sharp` and `cofilteredLimit.lift` gained the same binders through the repaired roots.

## Theorem scan

Theorems follow the theorem rule (instances with present dependencies are included, `include` works), so the scan looked for named hypotheses and instances that a statement does not carry although its variables are present. Excluding structure-field projections and the local instance counted above, 15 theorems qualify, and none needs the binder for its README meaning: `preTiltVal_eq` and `equivMathlibTilt_integral` lack `hvnorm`, which no declaration uses and which the identity `PreTilt.val x = v(x♯)` does not need (it holds for any `v` with `v.Integers K°`); the six `finiteStage…Diagram_mapId/mapComp_hom_app` lemmas lack `hX`, which the diagrams do not use; `IsResidueFieldTildeLimit.level_isAnalytic` and `residueEtaleTopology_eq` carry a deliberate `omit [IsCofiltered I] in` (the first follows from the structure fields, the second identifies two constructions that do not use cofilteredness); three `Almost.Module` lemmas bind their own `N : ModuleCat V` (matcher artefact). The remaining two, `cofilteredLimit.lift_π` and `cofilteredLimit.hom_ext`, depended on the lost binder of `cofilteredLimit` and now carry `[IsCofiltered I]` (their `omit hI in` lines removed).

## `#check` output after repair (FALSE rows)

```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra.isPerfectoidTateRing : ∀ (p : ℕ)
  [inst : Fact (Nat.Prime p)] {R : Type u_1} [inst_1 : CommRing R] [inst_2 : UniformSpace R]
  [inst_3 : IsUniformAddGroup R] [inst_4 : IsTopologicalRing R] [inst_5 : TauCeti.Huber.IsTateRing R]
  [inst_6 : CompleteSpace R] [inst_7 : T2Space R] [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p R]
  (ϖ : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.PseudoUniformizerRoots p R) (σ : Type u_1),
  TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p
    (TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra p ϖ σ)
```
```
@TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra.emptyEquiv : {p : ℕ} →
  [inst : Fact (Nat.Prime p)] →
    {R : Type u_1} →
      [inst_1 : CommRing R] →
        [inst_2 : UniformSpace R] →
          [inst_3 : IsUniformAddGroup R] →
            [inst_4 : IsTopologicalRing R] →
              [inst_5 : TauCeti.Huber.IsTateRing R] →
                [inst_6 : CompleteSpace R] →
                  [inst_7 : T2Space R] →
                    [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p R] →
                      (ϖ : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.PseudoUniformizerRoots p R) →
                        TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra p ϖ PEmpty.{u_1 + 1} ≃ₐ[R] R
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.tiltField.instNontriviallyNormedField : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    (K : Type u_1) →
      [inst_1 : NontriviallyNormedField K] →
        [inst_2 : IsUltrametricDist K] →
          [inst_3 : CompleteSpace K] →
            [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidField p K] →
              NontriviallyNormedField (TauCetiRoadmap.PerfectoidSpaces.Perfectoid.tiltField p K)
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra.laurent.instIsPerfectoidTateRing : ∀ (p : ℕ)
  [inst : Fact (Nat.Prime p)] {R : Type u_1} [inst_1 : CommRing R] [inst_2 : UniformSpace R]
  [inst_3 : IsUniformAddGroup R] [inst_4 : IsTopologicalRing R] [inst_5 : TauCeti.Huber.IsTateRing R]
  [inst_6 : CompleteSpace R] [inst_7 : T2Space R] [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p R]
  (ϖ : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.PseudoUniformizerRoots p R) (σ : Type u_1),
  TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p
    (TauCetiRoadmap.PerfectoidSpaces.Perfectoid.perfectedTateAlgebra.laurent p ϖ σ)
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.instPerfectRingSubtypeMemSubringPowerBoundedSubringOfIsPerfectoidFieldOfCharP : ∀
  (p : ℕ) [inst : Fact (Nat.Prime p)] (K : Type u_1) [inst_1 : NontriviallyNormedField K] [inst_2 : IsUltrametricDist K]
  [inst_3 : CompleteSpace K] [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidField p K] [CharP K p],
  PerfectRing (↥(TauCeti.Huber.powerBoundedSubring K)) p
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.isPerfectoidTateRing_completedTensor : ∀ (p : ℕ) [inst : Fact (Nat.Prime p)]
  {A : Type u_1} {B : Type u_2} {C : Type u_3} [inst_1 : CommRing A] [inst_2 : UniformSpace A]
  [inst_3 : IsUniformAddGroup A] [inst_4 : IsTopologicalRing A] [inst_5 : TauCeti.Huber.IsTateRing A]
  [inst_6 : CompleteSpace A] [inst_7 : T2Space A] [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p A]
  [inst_9 : CommRing B] [inst_10 : UniformSpace B] [inst_11 : IsUniformAddGroup B] [inst_12 : IsTopologicalRing B]
  [inst_13 : TauCeti.Huber.IsTateRing B] [inst_14 : CompleteSpace B] [inst_15 : T2Space B]
  [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p B] [inst_17 : CommRing C]
  [inst_18 : UniformSpace C] [inst_19 : IsUniformAddGroup C] [inst_20 : IsTopologicalRing C]
  [inst_21 : TauCeti.Huber.IsTateRing C] [inst_22 : CompleteSpace C] [inst_23 : T2Space C]
  [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p C] [inst_25 : Algebra A B] [inst_26 : Algebra A C]
  [inst_27 : TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom (algebraMap A B)]
  [inst_28 : TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom (algebraMap A C)],
  TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p
    (TauCetiRoadmap.AdicSpacesPartII.Huber.CompletedTensor A B C)
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.isPerfectoid_uniformCompletedTensor : ∀ (p : ℕ) [inst : Fact (Nat.Prime p)]
  {A : Type u_1} {B : Type u_2} {C : Type u_3} [inst_1 : CommRing A] [inst_2 : UniformSpace A] [IsUniformAddGroup A]
  [inst_4 : IsTopologicalRing A] [inst_5 : TauCeti.Huber.IsTateRing A] [inst_6 : CommRing B] [inst_7 : UniformSpace B]
  [inst_8 : IsUniformAddGroup B] [inst_9 : IsTopologicalRing B] [inst_10 : TauCeti.Huber.IsTateRing B]
  [inst_11 : CompleteSpace B] [inst_12 : T2Space B]
  [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p B] [inst_14 : CommRing C]
  [inst_15 : UniformSpace C] [inst_16 : IsUniformAddGroup C] [inst_17 : IsTopologicalRing C]
  [inst_18 : TauCeti.Huber.IsTateRing C] [inst_19 : CompleteSpace C] [inst_20 : T2Space C]
  [TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p C] [inst_22 : Algebra A B] [inst_23 : Algebra A C]
  [inst_24 : TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom (algebraMap A B)]
  [inst_25 : TauCetiRoadmap.AdicSpacesPartII.Huber.IsAdicHom (algebraMap A C)],
  TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidTateRing p
    (TauCetiRoadmap.AdicSpacesPartII.Huber.Uniformization (TauCetiRoadmap.AdicSpacesPartII.Huber.CompletedTensor A B C))
```
```
@TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit.equivConst : {J : Type u_2} →
  [inst : CategoryTheory.SmallCategory J] →
    [CategoryTheory.IsFiltered J] →
      (C : Type u_3) →
        [inst_2 : CategoryTheory.Category.{u_1, u_3} C] →
          TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit
              ((CategoryTheory.Functor.const J).obj ↧C).toPseudofunctor' ≌
            C
```
```
@TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit.homEquiv : {J : Type u_2} →
  [inst : CategoryTheory.SmallCategory J] →
    [CategoryTheory.IsFiltered J] →
      (F : CategoryTheory.Pseudofunctor (CategoryTheory.LocallyDiscrete J) CategoryTheory.Cat) →
        {i j : J} →
          (x : ↑(F.obj { as := i })) →
            (y : ↑(F.obj { as := j })) →
              ((TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit.ι F i).obj x ⟶
                  (TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit.ι F j).obj y) ≃
                Quot (TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit.HomRepresentative.Rel F)
```
```
TauCetiRoadmap.PerfectoidSpaces.Perfectoid.almostInverseLimitRing.inverseComparison : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    (K : Type u_1) →
      [inst_1 : NontriviallyNormedField K] →
        [inst_2 : IsUltrametricDist K] →
          [inst_3 : CompleteSpace K] →
            [inst_4 : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.IsPerfectoidField p K] →
              [inst_5 : CharP K p] →
                (ϖ : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.PseudoUniformizerRoots p K) →
                  (B : TauCetiRoadmap.PerfectoidSpaces.Perfectoid.ModAlmostPerfectoid p K ϖ) →
                    ((TauCetiRoadmap.PerfectoidSpaces.Perfectoid.almostReductionEquivalence p K ϖ).inverse.obj B).obj ≅
                      (TauCetiRoadmap.PerfectoidSpaces.Almost.Algebra.toAlmost
                            (TauCetiRoadmap.PerfectoidSpaces.Perfectoid.almostSetup p K)).obj
                        ↧(TauCetiRoadmap.PerfectoidSpaces.Perfectoid.almostInverseLimitRing p K ϖ B)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.isLimit : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              CategoryTheory.Limits.IsLimit
                (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.cone p X hX)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageFiniteEtaleEquiv : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageFiniteEtaleDiagram p X) ≌
                TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.smallFiniteEtale p
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit p X hX)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageQcqsEquiv : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageQcqsDiagram p X) ≌
                TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.qcqsEtale p
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit p X hX)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageSeparatedEquiv : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              TauCetiRoadmap.PerfectoidSpaces.CategoryTheory.FilteredTwoColimit
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.finiteStageSeparatedDiagram p X) ≌
                TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.qcSeparatedEtale p
                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit p X hX)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.baseChange : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              (i : I) →
                {Y : TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p} →
                  (g : Y ⟶ X.obj i) →
                    CompactSpace ↑(TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.underlyingPoints p Y) ∧
                        QuasiSeparatedSpace ↑(TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.underlyingPoints p Y) →
                      CategoryTheory.Limits.IsLimit
                        (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.baseChangeCone p X hX i g)
```
```
TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.baseChangeHomeomorph : (p : ℕ) →
  [inst : Fact (Nat.Prime p)] →
    {I : Type} →
      [inst_1 : CategoryTheory.SmallCategory I] →
        [hI : CategoryTheory.IsCofiltered I] →
          (X : CategoryTheory.Functor I (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p)) →
            (hX : ∀ (i : I), TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.IsAffinoidPerfectoid p (X.obj i).obj) →
              (i : I) →
                {Y : TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.Perfd p} →
                  (g : Y ⟶ X.obj i) →
                    CompactSpace ↑(TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.underlyingPoints p Y) ∧
                        QuasiSeparatedSpace ↑(TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.underlyingPoints p Y) →
                      ↑(TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.underlyingPoints p
                            (CategoryTheory.Limits.pullback g
                              (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.π p X hX i))) ≃ₜ
                        { s //
                          ∀ (a b : CategoryTheory.Over i) (f : a ⟶ b),
                            (CategoryTheory.ConcreteCategory.hom
                                  (TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.pointMap p
                                    ((TauCetiRoadmap.PerfectoidSpaces.PerfectoidSpace.cofilteredLimit.baseChangeDiagram
                                          p X i g).map
                                      f)))
                                (s a) =
                              s b }
```

## `lake env lean` outcome

From the project root, `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean` on the repaired file: exit code 0, **3360 warnings, every one ``declaration uses `sorry` ``**, no other warning, no error (5 min 21 s). The baseline run before the edits gave the same: exit 0, 3360 sorry warnings and nothing else. The `#check` probe file (repaired file plus the 40 `#check`s) also elaborated with no error.

## Appendix: checked declarations that lost no binder (FINE)

Line, name (relative to `TauCetiRoadmap.PerfectoidSpaces`), kind.

- 134 `Almost.BasicSetup.baseChange` (def)
- 323 `Almost.BasicSetup.almostZero_isSerreClass` (Prop instance)
- 360 `Almost.BasicSetup.firm` (def)
- 368 `Almost.BasicSetup.firmAdj` (def)
- 371 `Almost.BasicSetup.instFullFirmModuleCatClosure` (Prop instance)
- 374 `Almost.BasicSetup.instFaithfulFirmModuleCatClosure` (Prop instance)
- 703 `Almost.BasicSetup.firmInclusionAdj` (def)
- 706 `Almost.BasicSetup.Firm.abelian` (instance)
- 715 `Almost.BasicSetup.firm_isLocalization` (Prop instance)
- 727 `Almost.BasicSetup.tildeToIdeal` (def)
- 747 `Almost.BasicSetup.tildeTensorIdealEquiv` (def)
- 756 `Almost.BasicSetup.tildeTensorSelfEquiv` (def)
- 779 `Almost.BasicSetup.baseChangeTildeEquiv` (def)
- 801 `Almost.isoModSerre_isMonoidal` (Prop instance)
- 833 `Almost.Module.adjElements` (def)
- 836 `Almost.Module.adjShriek` (def)
- 854 `Almost.Module.homLinearEquiv` (def)
- 905 `Almost.Module.shriekIsoTensor` (def)
- 935 `Almost.Module.elements_counit_isIso` (Prop instance)
- 938 `Almost.Module.shriek_unit_isIso` (Prop instance)
- 941 `Almost.Module.shriek_preservesFiniteLimits` (Prop instance)
- 1004 `Almost.Module.alHomFunctor` (def)
- 1014 `Almost.Module.tensorAlHomAdj` (def)
- 1017 `Almost.Module.monoidalClosed` (instance)
- 1020 `Almost.Module.closedIso` (def)
- 1023 `Almost.Module.elementsLaxMonoidal` (instance)
- 1030 `Almost.Module.shriekToElements` (def)
- 1084 `Almost.Module.elementsToAlmostIso` (def)
- 1098 `Almost.Module.tensorIsoElements` (def)
- 1102 `Almost.Module.shriekTensorIso` (def)
- 1133 `Almost.toAlmost_isLocalization` (Prop instance)
- 1136 `Almost.toAlmost_preservesFiniteLimits` (Prop instance)
- 1138 `Almost.toAlmost_essSurj` (Prop instance)
- 1140 `Almost.toAlmost_preservesFiniteColimits` (Prop instance)
- 1161 `Almost.toAlmostCompInvertIso` (def)
- 1166 `Almost.invert_preservesFiniteLimits` (Prop instance)
- 1169 `Almost.invertMonoidal` (instance)
- 1445 `Almost.Algebra.elements` (def)
- 1448 `Almost.Algebra.elementsUnderlying` (def)
- 1452 `Almost.Algebra.elementsHomEquiv` (def)
- 1464 `Almost.Algebra.toAlmost` (def)
- 1467 `Almost.Algebra.toAlmostUnderlying` (def)
- 1471 `Almost.Algebra.adj` (def)
- 1474 `Almost.Algebra.counit_isIso` (Prop instance)
- 1482 `Almost.Algebra.moduleEquiv` (def)
- 1584 `Almost.Module.dualTensorHomIso` (def)
- 1675 `Almost.Algebra.shriekRing.nonUnitalCommRing` (instance)
- 1692 `Almost.Algebra.shriekShriek` (def)
- 1699 `Almost.Algebra.shriekRelationLinear` (def)
- 1707 `Almost.Algebra.shriekShriekAdj` (def)
- 1709 `Almost.Algebra.shriekShriekUnitIso` (def)
- 1711 `Almost.Algebra.shriekShriekToElements` (def)
- 1723 `Almost.Algebra.shriekShriek_preservesColimits` (Prop instance)
- 1762 `Almost.Algebra.instHasPushouts` (Prop instance)
- 1941 `Almost.Algebra.traceElements` (def)
- 2113 `Almost.Module.tor_toAlmost` (def)
- 2117 `Almost.Module.alExt_toAlmost` (def)
- 2222 `Almost.Algebra.finiteEtaleBaseChange` (def)
- 2229 `Almost.Algebra.finiteEtaleBaseChangeUnderlying` (def)
- 2234 `Almost.Algebra.etaleBaseChange` (def)
- 2240 `Almost.Algebra.etaleBaseChangeUnderlying` (def)
- 2246 `Almost.Algebra.nilpotentEtaleEquiv` (def)
- 2254 `Almost.Algebra.nilpotentEtaleEquiv_obj` (def)
- 2260 `Almost.Algebra.adicSystem` (def)
- 2272 `Almost.Algebra.instHasLimitsOfShapeOppositeNat` (Prop instance)
- 2323 `Almost.Algebra.idealElements` (def)
- 2682 `Almost.Module.rankDecomposition` (def)
- 2692 `Almost.Module.RankDecomposition.unitIso` (def)
- 2750 `CotangentComplex.PolynomialResolution.differentials` (def)
- 2753 `CotangentComplex.PolynomialResolution.termIso` (def)
- 2772 `CotangentComplex.resolution` (def)
- 2784 `CotangentComplex.resolutionIso` (def)
- 2787 `CotangentComplex.homologyZeroIso` (def)
- 2789 `CotangentComplex.homologyOneIso` (def)
- 2910 `CotangentComplex.morphismObstruction` (def)
- 2942 `CotangentComplex.extensionClass` (def)
- 3027 `Almost.instHasBinaryProductsAlgebra` (Prop instance)
- 3028 `Almost.toAlmost_additive` (Prop instance)
- 3107 `Almost.cotangentTransitivityFirst` (def)
- 3113 `Almost.cotangentTransitivitySecond` (def)
- 3180 `Almost.cotangentComplex_H0` (def)
- 3186 `Almost.cotangentComplex_toAlmost` (def)
- 3470 `Almost.almostZeroSheaf_isSerreClass` (Prop instance)
- 3667 `Perfectoid.frobeniusQuot` (def)
- 3834 `Perfectoid.IsTateRing.instProd` (Prop instance)
- 3841 `Perfectoid.isTateRing_of_nontriviallyNormedField` (Prop instance)
- 3853 `Perfectoid.IsPerfectoidTateRing.prod` (Prop instance)
- 3876 `Perfectoid.padicCyclotomic.instNontriviallyNormedField` (instance)
- 3882 `Perfectoid.padicCyclotomic.instIsPerfectoidTateRing` (Prop instance)
- 3887 `Perfectoid.dualNumberPadicComplex.instIsTateRing` (Prop instance)
- 4139 `Perfectoid.tilt.instCommRing` (instance)
- 4142 `Perfectoid.tilt.instIsTopologicalRing` (Prop instance)
- 4149 `Perfectoid.tilt.instIsUniformAddGroup` (Prop instance)
- 4152 `Perfectoid.tilt.instNontrivial` (Prop instance)
- 4156 `Perfectoid.tilt.charP` (Prop instance)
- 4159 `Perfectoid.tilt.perfectRing` (Prop instance)
- 4166 `Perfectoid.tilt.instIsTateRing` (Prop instance)
- 4169 `Perfectoid.tilt.instCompleteSpace` (Prop instance)
- 4175 `Perfectoid.tilt.isPerfectoidTateRing` (Prop instance)
- 4182 `Perfectoid.tilt.coeff` (def)
- 4191 `Perfectoid.tilt.equivOfCharP` (def)
- 4208 `Perfectoid.Pair.tilt` (def)
- 4273 `Perfectoid.tilt.sharp₀` (def)
- 4394 `Perfectoid.almostSetup` (def)
- 4467 `Perfectoid.tilt.ainfEquiv` (def)
- 4749 `Perfectoid.untilt.instUniformSpace` (instance)
- 4755 `Perfectoid.untilt.instIsUniformAddGroup` (Prop instance)
- 4758 `Perfectoid.untilt.instIsTopologicalRing` (Prop instance)
- 4762 `Perfectoid.untilt.instIsTateRing` (Prop instance)
- 4765 `Perfectoid.untilt.instCompleteSpace` (Prop instance)
- 4768 `Perfectoid.untilt.instT2Space` (Prop instance)
- 4774 `Perfectoid.untilt.isPerfectoidTateRing` (Prop instance)
- 4835 `Perfectoid.untilt.tiltEquiv` (def)
- 4944 `Perfectoid.untilt.pair` (def)
- 5489 `Perfectoid.uniformTilt_padic_uniform` (Prop instance)
- 5491 `Perfectoid.uniformTilt_padic_small` (Prop instance)
- 5492 `Perfectoid.uniformTilt_cyclotomic_small` (Prop instance)
- 5493 `Perfectoid.uniformTilt_cyclotomic_uniform` (Prop instance)
- 5598 `Perfectoid.tilt.integralEquivPreTilt` (def)
- 5616 `Perfectoid.tilt.theta` (def)
- 5753 `Perfectoid.PairCat.tiltFunctor` (def)
- 5774 `Perfectoid.PrimitiveTriple.instCategory` (instance)
- 5782 `Perfectoid.PrimitiveTriple.untiltObject` (def)
- 5784 `Perfectoid.PrimitiveTriple.untiltCarrierEquiv` (def)
- 5792 `Perfectoid.PrimitiveTriple.tiltIso` (def)
- 5796 `Perfectoid.classificationFunctor` (def)
- 5805 `Perfectoid.primitiveUntiltingFunctor` (def)
- 5814 `Perfectoid.classificationEquivalence` (def)
- 5833 `Perfectoid.MarkedUntilt.instCategory` (instance)
- 5855 `Perfectoid.MarkedUntilt.self` (def)
- 5860 `Perfectoid.MarkedUntilt.classification` (def)
- 5877 `Perfectoid.MarkedUntilt.pullback` (def)
- 6056 `Perfectoid.tiltField.toTilt` (def)
- 6173 `Perfectoid.PairCat.sliceTiltFunctor` (def)
- 6179 `Perfectoid.PairCat.sliceTriple` (def)
- 6186 `Perfectoid.PairCat.sliceUntiltFunctor` (def)
- 6193 `Perfectoid.PairCat.sliceTiltingEquivalence` (def)
- 6300 `Perfectoid.completedFilteredColimit.instUniformSpace` (instance)
- 6301 `Perfectoid.completedFilteredColimit.instIsUniformAddGroup` (Prop instance)
- 6302 `Perfectoid.completedFilteredColimit.instIsTopologicalRing` (Prop instance)
- 6306 `Perfectoid.completedFilteredColimit.instCompleteSpace` (Prop instance)
- 6307 `Perfectoid.completedFilteredColimit.instT2Space` (Prop instance)
- 6315 `Perfectoid.completedFilteredColimit.ι` (def)
- 6388 `Perfectoid.PseudoUniformizerRoots.tilt` (def)
- 6422 `Perfectoid.perfectedTateAlgebra.tiltEquiv` (def)
- 6462 `Perfectoid.completedFilteredColimit.tiltEquiv` (def)
- 6473 `Perfectoid.completedFilteredColimit.equivOfChoice` (def)
- 6568 `Perfectoid.MarkedUntilt.plusEquiv` (def)
- 6620 `Perfectoid.tiltField.quotEquiv` (def)
- 7044 `Perfectoid.PairCat.maximalFunctor` (def)
- 7055 `Perfectoid.completedFilteredColimit.cocone` (def)
- 7064 `Perfectoid.completedFilteredColimit.isColimit` (def)
- 7212 `Perfectoid.perfectedTateAlgebra.finiteDiagram` (def)
- 7224 `Perfectoid.perfectedTateAlgebra.equivCompletedColimit` (def)
- 7272 `Perfectoid.tilt.sharpQuotEquiv` (def)
- 7571 `Perfectoid.perfectLaurentTopology` (instance)
- 7572 `Perfectoid.perfectLaurentTopologicalRing` (Prop instance)
- 7575 `Perfectoid.perfectLaurentUniformAddGroup` (Prop instance)
- 7576 `Perfectoid.perfectLaurentTate` (Prop instance)
- 7577 `Perfectoid.perfectLaurentComplete` (Prop instance)
- 7578 `Perfectoid.perfectLaurentSeparated` (Prop instance)
- 7579 `Perfectoid.perfectLaurentPerfectoid` (Prop instance)
- 7580 `Perfectoid.perfectLaurentCharP` (Prop instance)
- 7650 `PerfectoidSpace.spaTilt` (def)
- 7859 `PerfectoidSpace.spaTiltHomeomorph` (def)
- 7964 `Perfectoid.rationalLocalization.tiltEquiv_affinoid` (def)
- 8356 `PerfectoidSpace.ofPair` (def)
- 8360 `PerfectoidSpace.spaFunctor` (def)
- 8374 `PerfectoidSpace.spaFunctor_full` (Prop instance)
- 8375 `PerfectoidSpace.spaFunctor_faithful` (Prop instance)
- 8383 `PerfectoidSpace.restrict` (def)
- 8385 `PerfectoidSpace.restrictι` (def)
- 8404 `PerfectoidSpace.tiltFunctor` (def)
- 8408 `PerfectoidSpace.tiltSpaIso` (def)
- 8416 `PerfectoidSpace.tiltHomeomorph` (def)
- 8425 `PerfectoidSpace.spaSpaceEquiv` (def)
- 8441 `PerfectoidSpace.tiltCharPIso` (def)
- 8444 `PerfectoidSpace.tiltRestrictIso` (def)
- 8458 `PerfectoidSpace.sliceTiltFunctor_isEquivalence` (Prop instance)
- 8463 `PerfectoidSpace.perfd_hasPullbacks` (Prop instance)
- 8464 `PerfectoidSpace.perfd_inclusion_preservesPullbacks` (Prop instance)
- 8468 `PerfectoidSpace.tilt_preservesPullbacks` (Prop instance)
- 8481 `PerfectoidSpace.perfd_slice_hasBinaryProducts` (Prop instance)
- 8485 `PerfectoidSpace.perf_hasBinaryProducts` (Prop instance)
- 8625 `PerfectoidSpace.affinoidPerfectoidEquiv` (def)
- 8627 `PerfectoidSpace.affinoidPerfectoidEquiv_spec` (def)
- 8785 `Perfectoid.rationalPair` (def)
- 8787 `Perfectoid.rationalMap` (def)
- 8808 `Perfectoid.rationalRes` (def)
- 8819 `Perfectoid.rationalPairFunctor` (def)
- 8862 `Perfectoid.rationalTiltIso` (def)
- 9076 `Perfectoid.rationalSections` (def)
- 9089 `Perfectoid.rationalIntegralSections` (def)
- 9101 `Perfectoid.rationalPresheaf` (def)
- 9111 `Perfectoid.integralPresheaf` (def)
- 9124 `Perfectoid.rationalSectionsEquivPresentationLimit` (def)
- 9216 `Perfectoid.integralScalar` (def)
- 9322 `Perfectoid.completedResidue_tate` (Prop instance)
- 9325 `Perfectoid.completedResidue_perfectoid` (Prop instance)
- 9336 `Perfectoid.residuePair` (def)
- 9340 `Perfectoid.residueTiltEquiv` (def)
- 9467 `Perfectoid.PairCat.tensorPair` (def)
- 9475 `Perfectoid.PairCat.tensorInl` (def)
- 9476 `Perfectoid.PairCat.tensorInr` (def)
- 9496 `Perfectoid.PairCat.tensorTiltIso` (def)
- 9581 `PerfectoidSpace.globalSections` (def)
- 9590 `PerfectoidSpace.globalPlus` (def)
- 9598 `PerfectoidSpace.identityChart` (def)
- 9602 `PerfectoidSpace.globalSectionsAffinoidEquiv` (def)
- 9619 `PerfectoidSpace.globalPullback` (def)
- 9629 `PerfectoidSpace.tiltChart` (def)
- 9636 `PerfectoidSpace.globalSharp` (def)
- 9699 `PerfectoidSpace.fieldBasePair` (def)
- 9738 `PerfectoidSpace.fieldSpaceEquivalence` (def)
- 9803 `PerfectoidSpace.prodChart` (def)
- 9843 `PerfectoidSpace.prodChartMap` (def)
- 9871 `Perfectoid.rationalOrderIso` (def)
- 9895 `PerfectoidSpace.spaHomEquiv` (def)
- 10365 `Perfectoid.rationalTateSheaf` (def)
- 10679 `HenselianApproximation.completion` (def)
- 10696 `HenselianApproximation.completionMap` (def)
- 10813 `HenselianApproximation.QuasiProjectiveOver.sectionTopology` (def)
- 11003 `AlgebraStructureModuli.instCommRingRing` (instance)
- 11004 `AlgebraStructureModuli.instAlgebraRing` (instance)
- 11024 `AlgebraStructureModuli.lawFunctor` (def)
- 11046 `AlgebraStructureModuli.X` (def)
- 11071 `AlgebraStructureModuli.etaleLawFunctor` (def)
- 11077 `AlgebraStructureModuli.U` (def)
- 11080 `AlgebraStructureModuli.autFunctor` (def)
- 11086 `AlgebraStructureModuli.Aut` (def)
- 11104 `AlgebraStructureModuli.changeBasis` (def)
- 11115 `AlgebraStructureModuli.etaleToLaw` (def)
- 11120 `AlgebraStructureModuli.openCoordinates` (def)
- 11151 `AlgebraStructureModuli.actionGraph` (def)
- 11290 `Perfectoid.FiniteEtale.untilt_full` (Prop instance)
- 11294 `Perfectoid.FiniteEtale.untilt_faithful` (Prop instance)
- 11305 `Perfectoid.FiniteEtale.untilt_isEquivalence_field` (Prop instance)
- 11419 `Perfectoid.fontaineWintenberger` (def)
- 11425 `Perfectoid.fontaineWintenbergerFiberIso` (def)
- 11471 `Perfectoid.FiniteEtale.untilt_isEquivalence` (Prop instance)
- 11534 `Perfectoid.rationalResidueMap` (def)
- 11678 `Perfectoid.almostInversion` (def)
- 11682 `Perfectoid.almostInversionMap` (def)
- 11740 `Perfectoid.almostInversion_isEquivalence` (Prop instance)
- 11744 `Perfectoid.almostSplit` (def)
- 11761 `Perfectoid.FiniteEtale.naturalPerfectoid` (Prop instance)
- 11767 `Perfectoid.FiniteEtale.tiltFunctor` (def)
- 11787 `Perfectoid.FiniteEtale.tiltUntiltIso` (def)
- 11790 `Perfectoid.FiniteEtale.untiltTiltIso` (def)
- 11794 `Perfectoid.finiteEtaleTiltEquiv_comparison` (def)
- 11822 `Perfectoid.FiniteEtale.untiltBaseChangeIso` (def)
- 11923 `Perfectoid.almostInversionParameterIso` (def)
- 11953 `Perfectoid.FiniteEtale.untiltPairIso` (def)
- 11974 `Perfectoid.FiniteEtale.untiltWittIso` (def)
- 12102 `Perfectoid.FiniteEtale.untiltProductIso` (def)
- 12673 `PerfectoidSpace.smallEtaleTopology` (def)
- 12682 `PerfectoidSpace.smallFiniteEtaleTopology` (def)
- 12694 `PerfectoidSpace.smallEtaleAdicEquiv` (def)
- 12697 `PerfectoidSpace.smallFiniteEtaleAdicEquiv` (def)
- 12755 `PerfectoidSpace.finiteEtaleAffinoidEquiv` (def)
- 12759 `PerfectoidSpace.finiteEtaleAffinoidSectionsIso` (def)
- 12781 `PerfectoidSpace.etaleTiltFunctor` (def)
- 12788 `PerfectoidSpace.etaleTiltFunctor_isEquivalence` (Prop instance)
- 12924 `PerfectoidSpace.finiteEtaleTiltFunctor` (def)
- 12931 `PerfectoidSpace.finiteEtaleTiltFunctor_isEquivalence` (Prop instance)
- 12995 `PerfectoidSpace.etaleBaseChange` (def)
- 13001 `PerfectoidSpace.smallEtale_hasFiniteLimits` (Prop instance)
- 13002 `PerfectoidSpace.smallFiniteEtale_hasFiniteLimits` (Prop instance)
- 13005 `PerfectoidSpace.finiteEtaleBaseChange` (def)
- 13061 `PerfectoidSpace.finiteEtalePrestack` (def)
- 13112 `PerfectoidSpace.finiteEtale_isStack` (Prop instance)
- 13150 `PerfectoidSpace.etaleO` (def)
- 13157 `PerfectoidSpace.etaleOPlus` (def)
- 13195 `PerfectoidSpace.etaleIntegralScalar` (def)
- 13205 `PerfectoidSpace.etale_hasSheafify` (Prop instance)
- 13208 `PerfectoidSpace.etale_hasExt` (Prop instance)
- 13218 `PerfectoidSpace.etaleIntegralQuotientTiltIso` (def)
- 13254 `PerfectoidSpace.etaleOCoefficients` (def)
- 13345 `PerfectoidSpace.etaleGeometricPointEquiv` (def)
- 13365 `PerfectoidSpace.finiteEtaleGaloisEquiv` (def)
- 13390 `PerfectoidSpace.etaleBaseChange_continuous` (Prop instance)
- 13809 `PerfectoidSpace.AffinoidField.ofRankOne` (def)
- 13816 `PerfectoidSpace.AffinoidField.valuationEquiv` (def)
- 13917 `PerfectoidSpace.fieldPoints_affinoidEquiv` (def)
- 14111 `PerfectoidSpace.injectionPullbackHomeomorph` (def)
- 14120 `PerfectoidSpace.residueField` (def)
- 14122 `PerfectoidSpace.residueField_chart` (def)
- 14133 `PerfectoidSpace.residueFieldPoint` (def)
- 14145 `PerfectoidSpace.residueFieldMap` (def)
- 14339 `PerfectoidSpace.zariskiClosedPair` (def)
- 14340 `PerfectoidSpace.zariskiClosedMap` (def)
- 14343 `PerfectoidSpace.zariskiClosedSubspace.ι` (def)
- 14579 `PerfectoidSpace.RationalSystem.plusDiagram` (def)
- 14588 `PerfectoidSpace.RationalSystem.scalar` (def)
- 14606 `PerfectoidSpace.proRationalPair` (def)
- 14607 `PerfectoidSpace.proRationalMap` (def)
- 14610 `PerfectoidSpace.proRationalSubspace.ι` (def)
- 14636 `PerfectoidSpace.proRationalStage` (def)
- 14723 `PerfectoidSpace.rationalNeighborhoods` (def)
- 14728 `PerfectoidSpace.RationalSystem.spaceDiagram` (def)
- 14734 `PerfectoidSpace.proRationalSubspace.cone` (def)
- 14740 `PerfectoidSpace.proRationalSubspace.isLimit` (def)
- 14779 `PerfectoidSpace.integralStalkToResidue` (def)
- 14794 `PerfectoidSpace.integralStalk_mod_equiv` (def)
- 14868 `PerfectoidSpace.tiltIdealEquiv` (def)
- 14917 `PerfectoidSpace.discAnnulus` (def)
- 14923 `PerfectoidSpace.annulusSystem` (def)
- 14930 `PerfectoidSpace.unitAnnulus` (def)
- 14934 `PerfectoidSpace.openUnitDisc` (def)
- 14942 `PerfectoidSpace.gaussPoint` (def)
- 15123 `PerfectoidSpace.ordinaryAnnulus.uniformAddGroup` (Prop instance)
- 15124 `PerfectoidSpace.ordinaryAnnulus.tate` (Prop instance)
- 15125 `PerfectoidSpace.ordinaryAnnulus.complete` (Prop instance)
- 15126 `PerfectoidSpace.ordinaryAnnulus.hausdorff` (Prop instance)
- 15129 `PerfectoidSpace.rootAnnulus` (def)
- 15165 `PerfectoidSpace.perfd_hasBinaryCoproducts` (Prop instance)
- 15167 `PerfectoidSpace.sumSpaceEquiv` (def)
- 15179 `PerfectoidSpace.sumPullbackEquiv` (def)
- 15323 `PerfectoidSpace.diagonalMultiplication` (def)
- 15376 `PerfectoidSpace.gaussRationalValuation` (def)
- 15480 `PerfectoidSpace.hasPushout_restrict_self` (Prop instance)
- 15512 `PerfectoidSpace.discAnnulusOpen` (def)
- 15517 `PerfectoidSpace.discScalar` (def)
- 15561 `PerfectoidSpace.semiperfectoidPerfectoidization` (def)
- 15562 `PerfectoidSpace.semiperfectoidPerfectoidization.ι` (def)
- 15564 `PerfectoidSpace.semiperfectoidPerfectoidization.perfectoid` (Prop instance)
- 15615 `PerfectoidSpace.completedIntegralQuotient` (def)
- 15887 `Perfectoid.completedColimit.ι` (def)
- 15900 `Perfectoid.completedColimit.plusCompletionEquiv` (def)
- 15916 `Perfectoid.completedColimit.lift` (def)
- 15942 `Perfectoid.completedColimit.equivOfInitial` (def)
- 16234 `PerfectoidSpace.toAdicSpace` (def)
- 16520 `Perfectoid.countableSubringPair` (def)
- 16527 `Perfectoid.countableSubringDiagram` (def)
- 16535 `Perfectoid.countableSubringCocone` (def)
- 16544 `Perfectoid.countableSubringIsColimit` (def)
- 16811 `Perfectoid.continuousFunctionPair` (def)
- 16839 `Perfectoid.binaryFunctionDiagram` (def)
- 16857 `Perfectoid.binaryFunctionEquiv` (def)
- 16919 `PerfectoidSpace.cofilteredLimit.pairIso` (def)
- 17024 `Perfectoid.completedColimit.plusQuotientEquiv` (def)
- 17080 `PerfectoidSpace.cofilteredLimit.globalSections_of_isCardinalFiltered` (def)
- 17090 `PerfectoidSpace.cofilteredLimit.globalPlus_of_isCardinalFiltered` (def)
- 17111 `Perfectoid.countablePerfectoidSubrings_isCardinalFiltered` (Prop instance)
- 17114 `Perfectoid.countablePerfectoidSubrings_isFiltered` (Prop instance)
- 17130 `PerfectoidSpace.countableSubringLimitIso` (def)
- 17193 `CategoryTheory.fpModuleColimitEquiv` (def)
- 17196 `CategoryTheory.fpModuleColimitEquiv_ι` (def)
- 17254 `Perfectoid.cantorDigitFunction` (def)
- 17392 `Perfectoid.contractingDiscDiagram` (def)
- 17515 `PerfectoidSpace.cofilteredLimit.plusQuotient` (def)
- 17555 `Perfectoid.profiniteFunctionDiagram` (def)
- 17587 `PerfectoidSpace.cofilteredLimit_prodProfinite` (def)
- 17672 `Perfectoid.continuousFunctionEval` (def)
- 17685 `Perfectoid.profiniteProjectionMap` (def)
- 17938 `proFlatten` (def)
- 18283 `PerfectoidSpace.ProEtalePresentation.constant` (def)
- 18377 `PerfectoidSpace.ProEtaleOver.hasPullbacks` (Prop instance)
- 18385 `PerfectoidSpace.ProEtaleOver.sliceEquivalence` (def)
- 18388 `PerfectoidSpace.AffinoidProEtale.sliceEquivalence` (def)
- 18401 `PerfectoidSpace.ProEtalePresentation.homeomorphLimit` (def)
- 18421 `PerfectoidSpace.prodLocallyProfinite` (def)
- 18427 `PerfectoidSpace.prodLocallyProfinite.fst` (def)
- 18429 `PerfectoidSpace.prodLocallyProfinite.snd` (def)
- 18431 `PerfectoidSpace.prodLocallyProfinite.homEquiv` (def)
- 18437 `PerfectoidSpace.prodLocallyProfinite.homeomorph` (def)
- 18478 `PerfectoidSpace.prodProfinite.baseChange` (def)
- 18484 `PerfectoidSpace.prodProfinite.tilt` (def)
- 18503 `PerfectoidSpace.fibreProdProfinite` (def)
- 18508 `PerfectoidSpace.fibreProdProfinite.fst` (def)
- 18510 `PerfectoidSpace.fibreProdProfinite.snd` (def)
- 18515 `PerfectoidSpace.fibreProdProfinite.homEquiv` (def)
- 18522 `PerfectoidSpace.fibreProdProfinite.homeomorph` (def)
- 18531 `PerfectoidSpace.fibreProdProfinite.baseChange` (def)
- 18577 `PerfectoidSpace.canonicalSmallIndex_cofiltered` (Prop instance)
- 18587 `PerfectoidSpace.canonicalCone` (def)
- 18609 `PerfectoidSpace.ProEtalePresentation.canonicalFunctor` (def)
- 18621 `PerfectoidSpace.ProEtalePresentation.canonicalFunctor_initial` (Prop instance)
- 18657 `PerfectoidSpace.proEtaleEquivalence` (def)
- 18661 `PerfectoidSpace.proEtaleEquivalence.cone` (def)
- 18671 `PerfectoidSpace.proEtaleEquivalence.isLimit` (def)
- 18676 `PerfectoidSpace.proEtaleKappaEquivalence` (def)
- 18905 `PerfectoidSpace.gaussPerfectoidField` (def)
- 18930 `PerfectoidSpace.perfd_hasCoproducts` (Prop instance)
- 18932 `PerfectoidSpace.sigmaPoints` (def)
- 19121 `PerfectoidSpace.zeroMonoidPresentation` (def)
- 19164 `PerfectoidSpace.finiteFourier` (def)
- 19224 `PerfectoidSpace.ProEtalePresentation.homStage` (def)
- 19231 `PerfectoidSpace.ProEtalePresentation.homDiagram` (def)
- 19240 `PerfectoidSpace.ProEtalePresentation.homEquiv` (def)
- 19275 `PerfectoidSpace.rankTwoGeometricPoint` (def)
- 19311 `PerfectoidSpace.KappaSmall.essentiallySmall` (Prop instance)
- 19389 `PerfectoidSpace.ProEtalePresentation.plusModEquiv` (def)
- 19412 `PerfectoidSpace.geometricPointProfiniteEquivalence` (def)
- 19416 `PerfectoidSpace.geometricPointProfiniteEquivalence_obj` (def)
- 19421 `PerfectoidSpace.geometricPointFiniteEquivalence` (def)
- 19427 `PerfectoidSpace.geometricPointFiniteEquivalence_obj` (def)
- 19498 `PerfectoidSpace.KappaSubpairs.map` (def)
- 19503 `PerfectoidSpace.KappaSubpairs.diagram` (def)
- 19509 `PerfectoidSpace.KappaSubpairs.cone` (def)
- 19513 `PerfectoidSpace.KappaSubpairs.isLimit` (def)
- 19517 `PerfectoidSpace.KappaSubpairs.plusDiagram` (def)
- 19523 `PerfectoidSpace.KappaSubpairs.plusCocone` (def)
- 19527 `PerfectoidSpace.KappaSubpairs.plusIsColimit` (def)
- 19558 `PerfectoidSpace.prodProfinite.finiteIso` (def)
- 19772 `PerfectoidSpace.ScholzeAffinoidTower.map` (def)
- 19903 `PerfectoidSpace.twoPointTransition` (def)
- 19914 `PerfectoidSpace.twoPointPresentation` (def)
- 20083 `PerfectoidSpace.proEtaleKappaEquivalence_forget` (def)
- 20131 `PerfectoidSpace.CompositionModel.instCategory` (instance)
- 20140 `PerfectoidSpace.CompositionModel.diagram` (def)
- 20148 `PerfectoidSpace.CompositionModel.cone` (def)
- 20162 `PerfectoidSpace.CompositionModel.isLimit` (def)
- 20198 `PerfectoidSpace.pPowerCharacter` (def)
- 20216 `PerfectoidSpace.characterCompletion` (def)
- 20222 `PerfectoidSpace.CharacterCompletion.fourier` (def)
- 20534 `Perfectoid.IntegralTower.diagram` (def)
- 20554 `Perfectoid.IntegralTower.completedTopology` (instance)
- 20555 `Perfectoid.IntegralTower.completedTopologicalRing` (Prop instance)
- 20558 `Perfectoid.IntegralTower.completedUniformAddGroup` (Prop instance)
- 20559 `Perfectoid.IntegralTower.completedComplete` (Prop instance)
- 20560 `Perfectoid.IntegralTower.completedT2` (Prop instance)
- 20561 `Perfectoid.IntegralTower.completedTate` (Prop instance)
- 20567 `Perfectoid.IntegralTower.completedPair` (def)
- 20581 `Perfectoid.IntegralTower.completedPlus_quotient` (def)
- 20646 `Perfectoid.FrobeniusTower.Hom.id` (def)
- 20653 `Perfectoid.FrobeniusTower.Hom.comp` (def)
- 20661 `Perfectoid.FrobeniusTower.shift` (def)
- 20677 `Perfectoid.FrobeniusTower.constPerfectoid` (def)
- 20699 `Perfectoid.FrobeniusTower.constCompletedEquiv` (def)
- 20717 `Perfectoid.FrobeniusTower.completed_map` (def)
- 20723 `Perfectoid.FrobeniusTower.completed_shift` (def)
- 20770 `AdicSpace.affinoidPoints` (def)
- 21130 `AdicSpace.residueRestriction` (def)
- 21237 `PerfectoidSpace.strongTopology` (instance)
- 21238 `PerfectoidSpace.strongTopologicalRing` (Prop instance)
- 21241 `PerfectoidSpace.strongUniformAddGroup` (Prop instance)
- 21242 `PerfectoidSpace.strongTate` (Prop instance)
- 21243 `PerfectoidSpace.strongComplete` (Prop instance)
- 21244 `PerfectoidSpace.strongT2` (Prop instance)
- 21254 `PerfectoidSpace.strongCompletionPair` (def)
- 21259 `PerfectoidSpace.strongCompletionPair.toCompletion` (def)
- 21343 `PerfectoidSpace.strongCompletion.affinoid` (def)
- 21519 `Perfectoid.IntegralTower.genericTopology` (instance)
- 21520 `Perfectoid.IntegralTower.genericTopologicalRing` (Prop instance)
- 21523 `Perfectoid.IntegralTower.genericUniformAddGroup` (Prop instance)
- 21524 `Perfectoid.IntegralTower.genericTate` (Prop instance)
- 21525 `Perfectoid.IntegralTower.genericComplete` (Prop instance)
- 21526 `Perfectoid.IntegralTower.genericT2` (Prop instance)
- 21532 `Perfectoid.IntegralTower.genericFibre` (def)
- 21536 `Perfectoid.IntegralTower.genericTransition` (def)
- 21542 `Perfectoid.IntegralTower.genericToCompleted` (def)
- 21549 `Perfectoid.IntegralTower.genericDiagram` (def)
- 21565 `Perfectoid.IntegralTower.genericCone` (def)
- 21620 `Perfectoid.FrobeniusTower.disc` (def)
- 21679 `Perfectoid.FrobeniusTower.discPowerHom` (def)
- 21936 `Perfectoid.FrobeniusTower.ofRelativeFrobenius` (def)
- 22054 `Perfectoid.FrobeniusTower.perfectionTransition` (def)
- 22071 `Perfectoid.FrobeniusTower.perfection` (def)
- 22217 `Perfectoid.FrobeniusTower.discCompletionEquiv` (def)
- 22787 `Perfectoid.IntegralTower.quotientDiagram` (def)
- 22795 `Perfectoid.IntegralTower.quotientColimit` (def)
- 22862 `Perfectoid.FrobeniusTower.perfectoidDiagram` (def)
- 23708 `PerfectoidSpace.affinoidFiniteEtaleDiagram` (def)
- 23952 `PerfectoidSpace.VQuotient.adicVFunctor` (def)
- 24335 `Almost.Module.descentPseudofunctor` (def)
- 24355 `Almost.Algebra.descentPseudofunctor` (def)
- 24438 `Almost.extensionSetoid` (def)
- 24509 `Almost.Algebra.relativeForget` (def)
- 24622 `Almost.flatDeformationSetoid` (def)
- 24826 `Almost.Module.AdicModule.instCategory` (instance)
- 24843 `Almost.Module.adicReduction` (def)
- 24934 `Almost.Module.enoughInjectives` (Prop instance)
- 24986 `Perfectoid.cyclotomicToricTopology` (instance)
- 24987 `Perfectoid.cyclotomicToricTopologicalRing` (Prop instance)
- 24990 `Perfectoid.cyclotomicToricUniformAddGroup` (Prop instance)
- 24991 `Perfectoid.cyclotomicToricTate` (Prop instance)
- 24992 `Perfectoid.cyclotomicToricComplete` (Prop instance)
- 24993 `Perfectoid.cyclotomicToricSeparated` (Prop instance)
- 25026 `Perfectoid.cyclotomicToricPerfectoid` (Prop instance)
- 25058 `CotangentComplex.resolutionRingMap` (def)
- 25090 `CotangentComplex.arrowModelMap` (def)
- 25122 `CotangentComplex.arrowFunctor` (def)
- 25201 `Almost.cotangentBaseMap` (def)
- 25244 `Almost.cotangentBaseFunctor` (def)
- 25294 `Perfectoid.tilt.mapEquiv` (def)
- 25452 `Almost.Algebra.homEquiv` (def)
- 25508 `Almost.Algebra.invert` (def)
- 25581 `PerfectoidSpace.pullbackOverAnalytic` (def)
- 25582 `PerfectoidSpace.pullbackOverAnalytic.fst` (def)
- 25583 `PerfectoidSpace.pullbackOverAnalytic.snd` (def)
- 25594 `PerfectoidSpace.pullbackOverAnalytic.lift` (def)
- 25741 `Perfectoid.almostSetupPlus` (def)
- 25767 `Perfectoid.almostModuleEquivPlus` (def)
- 26209 `Perfectoid.colimitSeminorm` (def)
- 26347 `Perfectoid.residueValuationRing` (def)
- 26366 `Perfectoid.instTopologicalSpaceResidueLaurentField` (instance)
- 26367 `Perfectoid.instIsTopologicalRingResidueLaurentField` (Prop instance)
- 26369 `Perfectoid.instIsUniformAddGroupResidueLaurentField` (Prop instance)
- 26370 `Perfectoid.instIsTateRingResidueLaurentField` (Prop instance)
- 26371 `Perfectoid.instCompleteSpaceResidueLaurentField` (Prop instance)
- 26372 `Perfectoid.instT2SpaceResidueLaurentField` (Prop instance)
- 26373 `Perfectoid.instIsPerfectoidTateRingResidueLaurentField` (Prop instance)
- 26374 `Perfectoid.instCharPResidueLaurentField` (Prop instance)
- 26375 `Perfectoid.instAlgebraRationalResiduePerfectionResidueLaurentField` (instance)
- 26387 `Perfectoid.residueLaurentReduction` (def)
- 26698 `PerfectoidSpace.etaleORing` (def)
- 26705 `PerfectoidSpace.etaleOPlusRing` (def)
- 26780 `PerfectoidSpace.etaleOPlusAlgebra` (def)
- 26853 `PerfectoidSpace.etaleAdicBaseChange` (def)
