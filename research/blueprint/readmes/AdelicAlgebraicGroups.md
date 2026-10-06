# Adelic algebraic groups and arithmetic quotients

This roadmap builds the adelic points `G(𝔸_F)` of an affine algebraic group over a number field,
their Haar, quotient and Tamagawa measures, the reduction theory of the arithmetic quotient
`G(F)\G(𝔸_F)`, the approximation theorems, neat levels and level maps, and checks the whole
apparatus on `GL_1`, `GL_2/ℚ` and a definite quaternion algebra. It is the owner that the Tau Ceti
roadmap *Global number fields* names for "every construction involving `G(𝔸_K)`, restricted
products of group points, quotient volumes, and Tamagawa numbers"; it consumes that roadmap's
adeles, ideles, places and product formula and never rebuilds the adele ring.

The plan is written at lemma level: one node is one library declaration. It has 201 nodes in
six layers, with 216 API items and 144 unit tests on its 48 definitions and constructions,
and 25 planets. Every node keeps `implementationStatus: unchecked`; nothing here is formalised.

## Scope

* **In scope.** Restricted products of Haar measures on Mathlib's restricted-product topology
  (AA.0); `G(𝔸_F)` for a finitely generated commutative Hopf algebra `H` over `F`, its
  comparison with the restricted product of the local points with respect to the integral points
  of a model, discreteness of `G(F)`, functoriality, restriction of scalars and unimodularity
  (AA.1); rational characters, `a_G`, the Harish-Chandra map `H_G`, `G(𝔸)^1`, the split component
  `A_G(ℝ)^0`, modulus characters, Weil quotient measures, `L²` with a unitary central character,
  gauge forms, convergence factors, Tamagawa measures and numbers (AA.2); adelic and fixed-`K`
  real reduction theory, finiteness of class numbers, finite volume, the compactness criterion and
  heights (AA.3); weak and strong approximation, the Kneser and Hasse-principle interfaces for
  simply connected groups, neat elements and levels, level maps, Hecke correspondences and
  Cartesian squares, and Khayutin's residual quotient (AA.4); the `GL_1`, `GL_2/ℚ` and definite
  quaternion validations (AA.5).
* **Out of scope.** Computing Tamagawa numbers beyond the stated checks (`τ(G_m) = 1` is Tate's
  thesis, owned by AutomorphicLFunctionsAndLocalFactors); the Borel–Serre compactification and
  cohomology of arithmetic groups (ArithmeticLocallySymmetricSpaces); automorphic forms
  (AutomorphicFormsOnReductiveGroups); Shimura-specific effective actions (ShimuraData D5,
  ShimuraVarieties V0); self-dual measures, Schwartz–Bruhat spaces and Poisson summation
  (AutomorphicLFunctionsAndLocalFactors AL.0); the function-field adelic theory
  (FunctionFieldArithmetic). The elementary restricted-product lemmas of AA.0 hold for any
  locally compact groups and are imported by the function-field roadmaps.

## Restructuring and red-team findings handled here

* **RS-04 (accepted).** AA.0 is narrowed: the generic restricted-product topology is Mathlib's
  (`isTopologicalGroup`, `locallyCompactSpace_of_group`, `continuous_dom`, `isOpen_forall_mem`,
  `isOpenEmbedding_structureMap`), and AA.0 develops only the measure layer, the change of finite
  set, Fubini and the Tamagawa distinction. The ownership entries of RS-04 are followed: AA.2 owns
  quotient measures, logarithmic characters and Tamagawa normalization; AA.3 owns reduction,
  component finiteness and height comparison; AA.4 owns qualified approximation, level-cover
  degrees and Hecke Cartesian squares; AA.5 owns the underlying `GL_2/ℚ` comparison.
* **RT-AREA-automorphic-1/7.** Strong approximation is stated with both hypotheses (simple
  connectedness and noncompactness of `G_S`) and proved from the Kneser–Tits property, requested
  from ReductiveGroupsPartII RG2.4 (the sub-stage `RG2.4:kneser-tits` proposed in the fix report),
  together with the S-arithmetic lattice property, Borel density and the openness of closures of
  Zariski-dense subgroups. The proof is decomposed for one isotropic place; the general case of
  Platonov–Rapinchuk §7.4 is recorded as remaining.
* **RT-AREA-automorphic-1/28.** Neat elements, their independence of the representation, their
  stability, torsion-freeness, neat levels and the existence of neat normal levels are planned in
  AA.4 (proposed sub-layer `AA.4:neat-levels`); ShimuraData D5, ShimuraVarieties V0 and
  ArithmeticLocallySymmetricSpaces ALS.0 import them.
* **RT-AREA-geomlanglands/12.** The restricted Haar product of AA.0 is stated for arbitrary
  locally compact groups with compact open subgroups, so ExcursionOperatorsAndSpectralAction ES7
  imports it for `D^×(𝔸_K)` instead of re-planning it.
* **RT-AREA-automorphic-1/38.** The link AA.3 → AF.1 is not used; AA.3 imports the real-group
  norm comparison from AF.1 (Bernstein–Krötz) for the archimedean factor of its adelic heights.

## Conventions

* `F` is a number field, `𝔸_F = F_∞ × 𝔸_{F,f}` is Mathlib's `AdeleRing (𝓞 F) F`, finite places
  are `HeightOneSpectrum (𝓞 F)`, and `F_v = v.adicCompletion F` with `𝒪_v` its integers.
* An affine algebraic group `G = Spec H` is given by a commutative Hopf algebra `H` over `F`;
  `G(R) = WithConv (H →ₐ[F] R)` is the convolution group of points (Tau Ceti
  `HopfAlgebra.points`). A homomorphism `G → G′` is a bialgebra map `H′ → H`.
* `G(R)` for a topological ring `R` carries the affine-points topology (Conrad, Proposition 2.1),
  requested from ReductiveGroupsPartII RG2.0 in that generality. `G(𝔸_F)` with this topology is
  identified with the restricted product of the `G(F_v)` with respect to the integral points of
  any model; the identification is a theorem (AA.1/restricted-product-comparison), not a
  definition.
* Haar measures are left Haar measures. Automorphic functions are acted on by right translation.
  The modular character follows Mathlib (`map (· * g) μ = Δ(g) • μ`), so `Δ_{P(𝔸)} = δ_P` with
  `δ_P(p) = ‖det(Ad p | Lie N_P)‖ = e^{⟨2ρ_P, H_P(p)⟩}`.
* `G(𝔸)^1 = ⋂_χ ker ‖χ‖` over `F`-rational characters. The split component `A_G` is the largest
  `ℚ`-split central torus of `Res_{F/ℚ} G`. Passing to `G(𝔸)^1` and dividing by `A_G(ℝ)^0` give
  homeomorphic quotients by a theorem (AA.2/quotient-norm-one-comparison), not by definition, and
  dividing by the larger `Z(F_∞)^0` does not.
* Local Haar measures: `𝒪_v` has volume one, Lebesgue measure at real places and twice Lebesgue
  measure at complex places (the normalization of Sutherland and of Rosengarten). Self-dual
  measures differ by `|d_F|^{-1/2}` and belong to AutomorphicLFunctionsAndLocalFactors AL.0.
* Neatness follows Milne: an automorphism is neat if its eigenvalues generate a torsion-free
  subgroup of `ℂ^×`, and a compact open level is neat if *all* its rational intersections
  `G(F) ∩ xUx⁻¹` are neat.
* Siegel sets in `G(ℝ)` are always associated to one fixed maximal compact subgroup `K`
  (Bakker–Klingler–Tsimerman as corrected by their 2023 erratum).

## Dependencies

* **Libraries.** Mathlib's restricted products, Haar measures (`haarMeasure`,
  `isMulLeftInvariant_eq_smul`, `modularCharacter`, `infinitePi`, `Measure.pi`), fundamental
  domains and quotient measures (`IsFundamentalDomain`, `QuotientMeasureEqMeasurePreimage`,
  `TopologicalGroup.IsSES.inducedMeasure`), adeles and ideles, the product formula, Dirichlet's
  unit theorem, the class number formula, Hopf algebras and group-like elements, double cosets,
  covering maps and action groupoids. Tau Ceti's points functor, Hopf ideals and centre, base
  change of points, `GL_n` and `G_m` points, character lattices with Galois action, dynamic
  parabolics with their Levi decomposition, cotangent spaces and the adjoint representation,
  simply connected semisimple groups, discreteness of `K` in `𝔸_K`, the product formula over
  places, weak approximation, `SL_2(ℤ) → SL_2(ℤ/d)` surjectivity, Hecke coset degrees, quotient
  covering maps, quaternion norm forms and Cholesky factorization. Each is listed with its module
  in the packet's `baseline.declarations`.
* **Other roadmaps.** ReductiveGroupsPartII RG2.0 (topologies on points over topological rings),
  RG2.0a (Weil restriction), RG2.1 (Borel–Tits theory over a number field), RG2.3 (hyperspecial
  models), RG2.4 (Cartan and Iwasawa decompositions, Kneser–Tits); Tau Ceti GlobalNumberFields
  layers 0, 1, 4, 5, 6 and 8; Tau Ceti NumberFieldArithmetic layer 4 (relative discriminants);
  Tau Ceti LieGroups layer 9 (real Cartan, Iwasawa and KAK decompositions); Tau Ceti Chebotarev,
  ClassFieldTheory layers 11–12 and GlobalQuadraticForms layer 5; AutomorphicFormsOnReductiveGroups
  AF.1; ModularCurvesPartII R12.2. Each use is a `requests` entry of the packet.

## Sources

Arthur, *An introduction to the trace formula* (§§2–5, 8, 13); Borel, *Some finiteness properties
of adele groups over number fields* (IHÉS 1963, §§1–2, 4–5, 7); Conrad, *Weil and Grothendieck
approaches to adelic points* (§§2–4); Rapinchuk, *Strong approximation for algebraic groups*
(§§1–2); Milne, *Introduction to Shimura varieties* (§§3, 5); Rosengarten, *Tamagawa numbers and
other invariants of pseudo-reductive groups over global function fields* (§§1, 3); Sutherland,
18.785 Lecture 23; Bakker–Klingler–Tsimerman, *Tame topology of arithmetic quotients and
algebraicity of Hodge loci* (§§2, 4.5) with its 2023 erratum; and the maintainer-added sources
Khayutin, *Joint equidistribution of CM points* (§§2.3, 3); Calegari–Geraghty, *Modularity lifting
beyond the Taylor–Wiles method* (§8.2); Lipnowski–Tsimerman, *How large is A_g(F_q)?* (§3.2);
Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse* (§6).
Borel–Serre (*Corners and arithmetic groups*) and Platonov–Rapinchuk were not available; the
steps they would supply are recorded as gaps or remaining work.

## AA.0. Restricted products of Haar measures
Mathlib already gives the restricted product `Πʳ i, [G i, B i]` of topological groups with respect
to open subgroups its topology, its topological-group structure, local compactness when almost all
`B i` are compact, the open embeddings of the level pieces and the continuity criteria
(`continuous_dom`, `mapAlong_continuous`). This layer adds the measure theory and nothing else.

For a countable index set (places of a number field) the restricted product is second countable,
so its Borel σ-algebra is generated by boxes `∏ C i` with `C i = B i` for all but finitely many
`i`. Given left Haar measures `μ i` with `μ i (B i) = 1` for all but finitely many `i`, the level
measure `μ_S` on the open subgroup `U_S = ∏_{i∈S} G i × ∏_{i∉S} B i` is the product of Mathlib's
finite product measure over `S` and of its infinite product of the probability measures
`μ i|B i` off `S`. These are compatible as `S` grows, and the restricted product measure `∏ʳ μ i`
is their directed supremum: the unique Borel measure restricting to every `μ_S`. It is a left Haar
measure, gives a box the finite product of the volumes of its factors, rescales by the finite
product of the scalars when finitely many factors are rescaled, does not change when the
restricting subgroups change at finitely many places, splits as a product over a finite set
(Fubini), integrates factorizable functions to the product of the local integrals, has modular
character the product of the local ones, and is functorial for isomorphisms of the factors.

The normalized measures on `𝔸_{F,f}`, `𝔸_F` and `𝔸_F^×` are the instances that AA.1–AA.5 and the adelic consumers use. Their
archimedean factor is twice Lebesgue measure at complex places, so it is `2^{r₂}` times Mathlib's
mixed-space volume, and the measure on `𝔸_F` is not self-dual when `|d_F| > 1`.

The layer closes with the reason Tamagawa measures need convergence factors: for `G_m` and
`ω = dx/x`, the local volumes `1 − p⁻¹` of `ℤ_p^×` have product `0`, because `Σ_p 1/p` diverges.
The normalized idele measure corrects each factor by `(1 − p⁻¹)⁻¹`.

**Depends on:** Mathlib (restricted products, Haar measures, `Measure.pi`, `infinitePi`),
Tau Ceti local fields, GlobalNumberFields layers 4 and 6. **Consumed by:** AA.1, AA.2,
AutomorphicLFunctionsAndLocalFactors AL.0 and AL.1, FunctionFieldArithmetic FA.2, DrinfeldModules
DM.2, ExcursionOperators ES7, ShimuraData D0, AnalyticNumberTheory AN.9 (finite-adele measure).

**Planets:** Restricted product of Haar measures (`AA.0/restricted-haar-product`).

### AA.0 declarations

#### `AA.0/second-countable` — The restricted product of countably many second countable groups is second countable (lemma)

Let ι be countable, let each G i be a second countable topological group and each B i an open subgroup of G i. Then Πʳ i, [G i, B i] is second countable. Consequently its Borel σ-algebra is generated by the boxes Π i, C i with C i open in G i and C i = B i for all but finitely many i.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i open subgroups.

*Proof outline:*
1. The finite subsets S of ι form a countable set, and Πʳ i, [G i, B i] is the union of the open subgroups U_S = Π_{i∈S} G i × Π_{i∉S} B i (RestrictedProduct.topologicalSpace_eq_iSup and the open embeddings of the principal pieces).
2. Each U_S is homeomorphic to a countable product of second countable spaces, hence second countable.
3. A space that is a countable union of open second countable subspaces is second countable; the boxes of the statement restricted to the U_S give a countable basis.

*Prerequisites:* `mathlib:RestrictedProduct.topologicalSpace_eq_iSup`, `mathlib:RestrictedProduct.isOpenEmbedding_inclusion_principal`.

*Acceptance:* For ι = the finite places of a number field, the finite adele ring is second countable. The statement fails for uncountable ι: an uncountable product of nontrivial compact groups is not second countable.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/borel-structure` — Borel structure on a restricted product (construction)

For the data of AA.0 put the Borel σ-algebra on Πʳ i, [G i, B i]. With it the restricted product is a Borel space in which every open subgroup U_S, every box Π i, C i (C i Borel, C i = B i cofinitely) and every inclusion of a principal piece is measurable, and the coordinate maps x ↦ x i are measurable.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Take the Borel σ-algebra of the restricted-product topology.
2. Boxes are countable intersections of preimages of Borel sets under continuous coordinate maps intersected with the open U_S, hence Borel.
3. By second-countable they generate the σ-algebra.

*Prerequisites:* `AA.0/second-countable`, `mathlib:RestrictedProduct.topologicalSpace_eq_iSup`.

*API:*
- `RestrictedProduct.borelSpace` (instance): Πʳ i, [G i, B i] carries the Borel σ-algebra and is a BorelSpace.
- `RestrictedProduct.measurable_eval` (simp): For each i the coordinate map x ↦ x i is measurable.
- `RestrictedProduct.measurableSet_box` (characterisation): For Borel C i with C i = B i for all but finitely many i, the box {x | ∀ i, x i ∈ C i} is measurable.
- `RestrictedProduct.measurable_inclusion` (functoriality): The inclusion of each principal piece Πʳ i, [G i, B i]_[𝓟 S] is measurable.
- `RestrictedProduct.borel_eq_generateFrom_boxes` (characterisation): For countable ι the Borel σ-algebra is generated by the boxes with open factors.

*Unit tests:*
- `RestrictedProduct.measurableSet_structureMap_range` (computation): The set {x | ∀ i, x i ∈ B i} is measurable.
- `RestrictedProduct.borel_finite_index` (degenerate): For finite ι the Borel structure agrees with the product σ-algebra on Π i, G i under the homeomorphism of homeoBot.
- `RestrictedProduct.measurableSet_not_box_infinite` (non-example): For ι = ℕ, G i = ℤ/4, B i = 2ℤ/4 and C i = {0}, the family C differs from B at every index, so Π i, C i is not a box of the generating family (it is a null set for the product measure, not a basic open).

*Used by:* AA.0/restricted-haar-product — the carrier σ-algebra of the restricted Haar product; AutomorphicLFunctionsAndLocalFactors:AL.0 — measurability of adelic Schwartz–Bruhat functions; AA.1/adelic-points — Borel structure on G(𝔸_F) through the restricted-product comparison.

*Acceptance:* The finite adele ring with this structure is a Borel space. Every compact open subgroup of the restricted product is measurable.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/level-measure` — Product measure on a level subgroup (construction)

Let S ⊂ ι be finite with B i compact and μ i (B i) = 1 for i ∉ S, where μ i is a left Haar measure on G i. On U_S = Π_{i∈S} G i × Π_{i∉S} B i define μ_S as the product of the finite product measure Measure.pi (fun i : S => μ i) and the infinite product measure infinitePi (fun i : ι∖S => μ i restricted to B i), each factor a probability measure on the compact group B i.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i is a left Haar measure on G i; S finite with μ i (B i) = 1 for i ∉ S.

*Proof outline:*
1. The restriction of μ i to B i is a probability measure for i ∉ S.
2. Apply infinitePi to these probability measures and Measure.pi to the finitely many μ i, i ∈ S, and take the product measure.
3. Transport along the homeomorphism of U_S with the product, which is measurable for the Borel structures by second-countable.

*Prerequisites:* `mathlib:MeasureTheory.Measure.pi`, `mathlib:MeasureTheory.Measure.infinitePi`, `mathlib:MeasureTheory.Measure.prod`, `AA.0/borel-structure`, `mathlib:RestrictedProduct.isOpenEmbedding_structureMap`.

*API:*
- `RestrictedProduct.levelMeasure` (constructor): The measure μ_S on the open subgroup U_S.
- `RestrictedProduct.levelMeasure_box` (simp): μ_S of a box with factors C i (i ∈ S) and B i (i ∉ S) is ∏_{i∈S} μ i (C i).
- `RestrictedProduct.levelMeasure_isHaar` (instance): μ_S is a left Haar measure on the topological group U_S.
- `RestrictedProduct.levelMeasure_univ_compact` (example): If every B i is compact and μ i (B i) = 1 for all i, then μ_∅ is a probability measure.

*Unit tests:*
- `RestrictedProduct.levelMeasure_empty_prob` (degenerate): For S = ∅ and μ i (B i) = 1 for all i, μ_∅ (univ) = 1.
- `RestrictedProduct.levelMeasure_two_factor` (computation): For ι = Fin 2, S = univ, μ_S is Measure.pi of the two Haar measures.
- `RestrictedProduct.levelMeasure_needs_normalization` (non-example): If μ i (B i) = 2 for infinitely many i ∉ S, the restrictions μ i|B i are not probability measures and the construction does not apply; rescaling by 1/2 changes the measure.

*Used by:* AA.0/restricted-haar-product — the restrictions of the global measure to the open subgroups U_S; AA.0/level-measure-compat — compatibility as S grows.

*Acceptance:* For S = ∅ and every B i compact, μ_∅ is the Haar probability measure of the compact group Π i, B i. μ_S(Π_{i∈S} C i × Π_{i∉S} B i) = ∏_{i∈S} μ i (C i).

*Sources:* sutherland-23, §23.2, p. 5; borel-1963, §5.5, p. 21.

#### `AA.0/level-measure-compat` — Compatibility of level measures (lemma)

For finite S ⊆ S' as in level-measure, the restriction of μ_{S'} to the open subgroup U_S ⊂ U_{S'} equals μ_S.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i (B i) = 1 for i ∉ S.

*Proof outline:*
1. Split U_{S'} as the product over S, over S'∖S and over ι∖S'.
2. On U_S the factors over S'∖S are B i, whose μ i-mass is 1, so the finite product over S'∖S of μ i|B i is the infinite product restricted to those coordinates (infinitePi_map_restrict).
3. Compare the two product measures on the generating boxes and conclude by uniqueness of measures agreeing on a π-system generating the σ-algebra.

*Prerequisites:* `AA.0/level-measure`, `mathlib:MeasureTheory.Measure.infinitePi_map_restrict`, `mathlib:MeasureTheory.Measure.pi_pi`.

*Acceptance:* For S' = S the statement is trivial. For ι = {1,2}, S = ∅, S' = {1} and μ 1 (B 1) = 1, the restriction of μ 1 ⊗ μ 2|B 2 to B 1 × B 2 is μ 1|B 1 ⊗ μ 2|B 2.

*Sources:* borel-1963, §5.5, p. 21.

#### `AA.0/restricted-haar-product` — Restricted product of Haar measures (definition)

Given left Haar measures μ i on G i with μ i (B i) = 1 for all but finitely many i, the restricted product measure μ = ∏ʳ μ i on Πʳ i, [G i, B i] is the unique Borel measure whose restriction to each open subgroup U_S (S finite and containing the finitely many i with μ i (B i) ≠ 1 or B i not compact) is μ_S. It is defined as the supremum of the directed family of measures (U_S ↪ Πʳ)_* μ_S.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i left Haar measures on G i; μ i (B i) = 1 for all but finitely many i.

*Proof outline:*
1. By level-measure-compat the pushforwards ν_S = (U_S ↪ Πʳ)_* μ_S form a monotone family indexed by the directed set of admissible finite S.
2. A directed supremum of measures is a measure: countable additivity follows by exchanging two suprema of monotone families.
3. Because the U_S are open and cover, ν restricted to U_S is μ_S; uniqueness follows because a Borel measure is determined by its restrictions to the countably many open sets U_S.

*Prerequisites:* `AA.0/level-measure`, `AA.0/level-measure-compat`, `AA.0/borel-structure`, `AA.0/directed-supremum-measure`.

*API:*
- `RestrictedProduct.haarProduct` (constructor): The measure ∏ʳ μ i on Πʳ i, [G i, B i], given hμ : ∀ᶠ i in cofinite, μ i (B i) = 1.
- `RestrictedProduct.haarProduct_restrict_level` (characterisation): For admissible finite S, the restriction of ∏ʳ μ i to U_S is μ_S.
- `RestrictedProduct.haarProduct_eq_of_restrict` (extensionality): A Borel measure whose restriction to every admissible U_S is μ_S equals ∏ʳ μ i.
- `RestrictedProduct.haarProduct_box` (simp): ∏ʳ μ i of a box Π i, C i with C i = B i cofinitely equals ∏ᶠ i, μ i (C i).
- `RestrictedProduct.haarProduct_isHaarMeasure` (instance): ∏ʳ μ i is a left Haar measure.
- `RestrictedProduct.haarProduct_smul` (relation): Rescaling μ i by c i with c i = 1 cofinitely rescales ∏ʳ μ i by ∏ᶠ i, c i.

*Unit tests:*
- `RestrictedProduct.haarProduct_compact_open_box` (computation): If μ i (B i) = 1 for every i, then ∏ʳ μ i of {x | ∀ i, x i ∈ B i} is 1.
- `RestrictedProduct.haarProduct_finite_index` (compatibility): For finite ι, transported along homeoBot, ∏ʳ μ i equals Measure.pi μ.
- `RestrictedProduct.haarProduct_not_probability_product` (non-example): If some factor has infinite total mass (as μ_p on ℚ_p), then ∏ʳ μ i has infinite total mass; it is not an infinite product of probability measures.

*Used by:* AA.0/finite-adele-haar — the normalized Haar measure on the finite adeles; AA.2/tamagawa-measure — Tamagawa measures as restricted products of convergence-factor-corrected local measures; AutomorphicLFunctionsAndLocalFactors:AL.0 — adelic Schwartz–Bruhat integrals and Poisson summation; AutomorphicLFunctionsAndLocalFactors:AL.1 — Tate's global zeta integral over the ideles; FunctionFieldArithmetic:FA.2 — the characteristic-independent restricted Haar product for function-field adeles (RS-04 link AA.0 → FA.2); ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic — compatible Haar measures on D^×(A_K) (RT-AREA-geomlanglands/12).

*Acceptance:* For finite ι with all B i = G i compact this is the product Haar measure Measure.pi μ. For the finite adeles of ℚ with μ_p (ℤ_p) = 1 the measure of ∏_p ℤ_p is 1.

*Sources:* sutherland-23, §23.2, p. 5; borel-1963, §5.5, p. 21.

#### `AA.0/restricted-haar-restrict-level` — Restriction of the restricted product measure to a level (lemma)

For every finite S containing the exceptional indices, (∏ʳ μ i).restrict U_S = (U_S ↪ Πʳ)_* μ_S, and ∏ʳ μ i is the unique measure with this property.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Immediate from the construction as a directed supremum and level-measure-compat.
2. Uniqueness: U_S cover Πʳ and are countably many, so measures agreeing on each U_S agree.

*Prerequisites:* `AA.0/restricted-haar-product`, `AA.0/level-measure-compat`.

*Acceptance:* Restricting to Π i, B i gives the infinite product of the probability measures μ i|B i when μ i (B i) = 1 for all i.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/restricted-haar-box` — Measure of a box (lemma)

For Borel sets C i ⊂ G i with C i = B i for all but finitely many i, ∏ʳ μ i (Π i, C i) = ∏ᶠ i, μ i (C i), the product being finite because almost all factors equal 1.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Choose S containing every i with C i ≠ B i or μ i (B i) ≠ 1; the box lies in U_S.
2. Apply restricted-haar-restrict-level and the product formulas Measure.pi_pi and the infinite product of probability measures on the box.

*Prerequisites:* `AA.0/restricted-haar-restrict-level`, `mathlib:MeasureTheory.Measure.pi_pi`.

*Acceptance:* For the finite adeles of ℚ, the box ∏_{p≠2} ℤ_p × 2ℤ_2 has measure 1/2.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/restricted-haar-is-haar` — The restricted product measure is a Haar measure (theorem)

∏ʳ μ i is a left Haar measure on the locally compact group Πʳ i, [G i, B i]; if every μ i is also right invariant then ∏ʳ μ i is right invariant.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Left invariance: for g in the restricted product choose S with g ∈ U_S; left translation by g preserves U_{S'} for S' ⊇ S and preserves each μ_{S'} because each factor is left invariant.
2. Finite on compacts: every compact set lies in finitely many translates of Π i, B i, which has finite measure.
3. Positive on opens: every nonempty open set contains a translate of an open box with factors of positive measure.
4. Right invariance is proved in the same way.

*Prerequisites:* `AA.0/restricted-haar-product`, `AA.0/restricted-haar-restrict-level`, `mathlib:RestrictedProduct.locallyCompactSpace_of_group`, `mathlib:RestrictedProduct.isTopologicalGroup`, `mathlib:MeasureTheory.Measure.IsHaarMeasure`.

*Acceptance:* On the finite adeles of ℚ, translating ∏_p ℤ_p by 1/p keeps measure 1.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/restricted-haar-rescale` — Change of local normalizations (lemma)

If μ' i = c i • μ i with c i ∈ ℝ_{>0} and c i = 1 for all but finitely many i, then ∏ʳ μ' i = (∏ᶠ i, c i) • ∏ʳ μ i. If instead c i ≠ 1 for infinitely many i the family μ' i does not satisfy the normalization hypothesis and no restricted product is formed without convergence factors.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Choose S containing the indices with c i ≠ 1; both measures are determined on U_S by level-measure, where the scalar ∏_{i∈S} c i appears by multilinearity of Measure.pi.

*Prerequisites:* `AA.0/restricted-haar-product`, `AA.0/restricted-haar-restrict-level`.

*Acceptance:* Doubling the measure at one place doubles the global measure.

*Sources:* rosengarten-tamagawa, §1, p. 2.

#### `AA.0/restricted-haar-change-subgroups` — Changing the restricting subgroups at finitely many places (lemma)

Let B' i ≤ G i be open subgroups with B' i = B i for all but finitely many i. The identity on Π i, G i restricts to an isomorphism of topological groups Πʳ i, [G i, B i] ≃ₜ* Πʳ i, [G i, B' i], under which ∏ʳ μ i corresponds to ∏ʳ μ i (the normalization condition being cofinite). Thus the restricted product and its measure depend only on the B i up to finitely many indices.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; B' i open subgroups, B' i = B i cofinitely.

*Proof outline:*
1. The underlying sets agree because the defining eventuality conditions agree cofinitely.
2. The topologies agree because both are the supremum over the same cofinal family of principal pieces (topologicalSpace_eq_iSup).
3. The measures agree on every U_S with S containing the indices where B i ≠ B' i.

*Prerequisites:* `AA.0/restricted-haar-product`, `mathlib:RestrictedProduct.topologicalSpace_eq_iSup`, `mathlib:RestrictedProduct.continuous_dom`.

*Acceptance:* Changing B 2 = ℤ_2 to 2ℤ_2 in the finite adeles of ℚ gives the same topological ring.

*Sources:* conrad-adelic, Theorem 3.6, p. 6.

#### `AA.0/split-finite-factors` — Splitting off finitely many factors (construction)

For a finite S ⊂ ι, the map x ↦ ((x i)_{i∈S}, (x i)_{i∉S}) is an isomorphism of topological groups Πʳ i, [G i, B i] ≃ₜ* (Π_{i∈S} G i) × Πʳ (i : ι∖S), [G i, B i].

*Hypotheses:* ι arbitrary, S finite; G i topological groups, B i open subgroups.

*Proof outline:*
1. The map and its inverse are well defined because the eventuality condition only concerns indices outside the finite S.
2. Continuity in both directions follows from continuous_dom applied to the principal pieces and the product topology.

*Prerequisites:* `mathlib:RestrictedProduct.continuous_dom`, `mathlib:RestrictedProduct.topologicalSpace_eq_iSup`, `mathlib:RestrictedProduct.mapAlong_continuous`.

*API:*
- `RestrictedProduct.splitFinite` (constructor): The isomorphism of topological groups for a finite set S.
- `RestrictedProduct.splitFinite_apply_fst` (simp): (splitFinite S x).1 i = x i for i ∈ S.
- `RestrictedProduct.splitFinite_apply_snd` (simp): (splitFinite S x).2 i = x i for i ∉ S.
- `RestrictedProduct.splitFinite_symm_apply` (simp): The inverse glues the two families.
- `RestrictedProduct.splitFinite_mono` (functoriality): For S ⊆ S' the splittings are compatible with the further splitting of the restricted factor.

*Unit tests:*
- `RestrictedProduct.splitFinite_empty` (degenerate): For S = ∅ the first factor is the trivial group and the second map is the canonical identification.
- `RestrictedProduct.splitFinite_univ_finite` (computation): For finite ι and S = univ the second factor is trivial and splitFinite is homeoBot.
- `RestrictedProduct.splitFinite_not_infinite` (non-example): Infinitely many factors cannot be split off: a family lying outside B i at infinitely many indices, such as (1/p)_p in ∏_p ℚ_p with B p = ℤ_p, is not an element of the restricted product.

*Used by:* AA.0/restricted-haar-split — Fubini for the restricted product measure; AA.1/adelic-points-split — G(𝔸) = G(F_∞) × G(𝔸_f) and G(𝔸) = G(F_S) × G(𝔸^S); AA.4/strong-approximation-property — density of G(F) in G(𝔸^S).

*Acceptance:* For S = ∅ it is the identity up to the unit factor. For the adeles of ℚ with S = {∞} it is 𝔸 = ℝ × 𝔸_f.

*Sources:* borel-1963, §1.2, p. 7.

#### `AA.0/restricted-haar-split` — Fubini for restricted product measures (theorem)

Under split-finite-factors, ∏ʳ_ι μ i corresponds to (Measure.pi (fun i : S => μ i)).prod (∏ʳ_{ι∖S} μ i). Hence for f integrable on Πʳ i, [G i, B i], ∫ f ∂(∏ʳ μ i) = ∫_{Π_{i∈S} G i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S) dμ^S dμ_S.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; f integrable for ∏ʳ μ i.

*Proof outline:*
1. Both sides are left Haar measures on the same group; compare their values on a single box of positive finite measure (restricted-haar-box) and use uniqueness of Haar measure.
2. Apply MeasureTheory.integral_prod.

*Prerequisites:* `AA.0/split-finite-factors`, `AA.0/restricted-haar-box`, `AA.0/restricted-haar-is-haar`, `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `mathlib:MeasureTheory.integral_prod`.

*Acceptance:* For the adeles of ℚ and S = {∞}, ∫_𝔸 f = ∫_ℝ ∫_{𝔸_f} f.

*Sources:* borel-1963, §5.5, p. 21.

#### `AA.0/restricted-haar-factorizable-integral` — Integral of a factorizable function (theorem)

Let f i : G i → ℂ be integrable, with f i = indicator of B i for all but finitely many i. Then f(x) = ∏ i, f i (x i) is a well-defined integrable function on Πʳ i, [G i, B i] and ∫ f ∂(∏ʳ μ i) = ∏ᶠ i, ∫ f i ∂μ i.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; f i integrable, f i = 1_{B i} cofinitely.

*Proof outline:*
1. For x in the restricted product, f i (x i) = 1 for all but finitely many i, so the product is finite.
2. Choose S containing the exceptional indices; f is supported in U_S, and on U_S it is a product of a function on Π_{i∈S} G i and the indicator of Π_{i∉S} B i.
3. Apply restricted-haar-split and Fubini for the finite product, using ∫ 1_{B i} dμ i = 1.

*Prerequisites:* `AA.0/restricted-haar-split`, `AA.0/restricted-haar-box`.

*Acceptance:* For ι = primes, f p = 1_{ℤ_p} for all p gives integral 1. Tate's global zeta integral of a factorizable Schwartz–Bruhat function is the product of local zeta integrals in the domain of convergence (AL.1).

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/restricted-unimodular` — Restricted products of unimodular groups are unimodular (lemma)

If every G i is unimodular (modularCharacter G i = 1), then Πʳ i, [G i, B i] is unimodular. More generally the modular character of the restricted product is x ↦ ∏ᶠ i, Δ_{G i}(x i), a finite product because Δ_{G i} is trivial on the compact B i.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i.

*Proof outline:*
1. Δ_{G i} is trivial on every compact subgroup, so the product is finite.
2. Right translation by x scales each factor of ∏ʳ μ i by Δ_{G i}(x i) (restricted-haar-is-haar, right translations of boxes).

*Prerequisites:* `AA.0/restricted-haar-is-haar`, `mathlib:MeasureTheory.Measure.modularCharacter`, `AA.0/restricted-haar-box`.

*Acceptance:* The finite adele ring is unimodular as an additive group. For G i = B(ℚ_p) the Borel subgroups of GL_2 the modular character is |a/d|_𝔸 (AA.2/modulus-character).

*Sources:* borel-1963, §5.5, p. 21.

#### `AA.0/restricted-haar-map` — Functoriality of restricted product measures (lemma)

Let φ i : G i ≃ₜ* G' i be isomorphisms of topological groups with φ i (B i) = B' i for all but finitely many i. The induced isomorphism Φ = RestrictedProduct.map φ of restricted products satisfies Φ_*(∏ʳ μ i) = ∏ʳ (φ i)_* μ i.

*Hypotheses:* ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; φ i topological group isomorphisms, φ i (B i) = B' i cofinitely.

*Proof outline:*
1. Φ is a homeomorphism (mapAlong_continuous in both directions).
2. Compare the two Haar measures on one box of positive finite measure using restricted-haar-box and uniqueness of Haar measure.

*Prerequisites:* `AA.0/restricted-haar-box`, `AA.0/restricted-haar-is-haar`, `mathlib:RestrictedProduct.mapAlong_continuous`, `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.

*Acceptance:* Multiplication by a finite idele a is a homeomorphism of 𝔸_f scaling ∏ʳ μ_v by ‖a‖.

*Sources:* rosengarten-tamagawa, Lemma 3.5, p. 26.

#### `AA.0/finite-adele-haar` — Normalized Haar measure on the finite adeles (construction)

For a number field K, the measure μ_f on 𝔸_{K,f} = FiniteAdeleRing (𝓞 K) K is the restricted product of the additive Haar measures μ_v on K_v normalized by μ_v(𝒪_v) = 1, where each K_v is a nonarchimedean local field and 𝒪_v its compact open valuation ring.

*Hypotheses:* K a number field.

*Proof outline:*
1. K_v is a nonarchimedean local field, so locally compact with 𝒪_v compact open (Tau Ceti local-field structure on adicCompletion).
2. Normalize μ_v(𝒪_v) = 1 and apply restricted-haar-product with B v = 𝒪_v; local compactness of 𝔸_{K,f} is GlobalNumberFields layer 4.

*Prerequisites:* `AA.0/restricted-haar-product`, `mathlib:IsDedekindDomain.FiniteAdeleRing`, `tauceti:IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`, `AA.0/local-normalized-haar`.

*API:*
- `NumberField.finiteAdeleHaar` (constructor): The normalized Haar measure on 𝔸_{K,f}.
- `NumberField.finiteAdeleHaar_integers` (simp): finiteAdeleHaar (∏_v 𝒪_v) = 1.
- `NumberField.finiteAdeleHaar_isAddHaar` (instance): finiteAdeleHaar is an additive Haar measure.
- `NumberField.finiteAdeleHaar_smul` (relation): For a finite idele a, map (a * ·) finiteAdeleHaar = (∏_v |a_v|_v)⁻¹ • finiteAdeleHaar.

*Unit tests:*
- `NumberField.finiteAdeleHaar_ideal` (computation): For a nonzero ideal 𝔞 of 𝓞 K, the closure of 𝔞 in ∏_v 𝒪_v has measure (Ideal.absNorm 𝔞)⁻¹.
- `NumberField.finiteAdeleHaar_rat_twoZ2` (computation): For K = ℚ, the set 2ℤ_2 × ∏_{p≠2} ℤ_p has measure 1/2.
- `NumberField.finiteAdeleHaar_not_finite` (non-example): finiteAdeleHaar is not a finite measure: 𝔸_{K,f} is a disjoint union of infinitely many translates of ∏_v 𝒪_v.

*Used by:* AnalyticNumberTheory:AN.9/bc-adelic-scaling-measure — additive finite-adele measure for the Bost–Connes scaling construction (request from AN.8); AA.0/adele-haar — the finite factor of the adele measure; AA.2/compact-open-volume — volumes of compact open subgroups of G(𝔸_f) in the GL_1 case.

*Acceptance:* μ_f(∏_v 𝒪_v) = 1. For a ∈ 𝔸_{K,f}^× multiplication by a scales μ_f by ∏_v |a_v|_v.

*Sources:* sutherland-23, §23.2, pp. 4–5.

#### `AA.0/adele-haar` — Normalized Haar measure on the adeles (construction)

For a number field K, the measure μ_𝔸 on 𝔸_K = K_∞ × 𝔸_{K,f} is the product of the measure on K_∞ = ∏_{w|∞} K_w given by Lebesgue measure at real places and twice Lebesgue measure at complex places, and the finite-adele measure finite-adele-haar.

*Hypotheses:* K a number field.

*Proof outline:*
1. K_∞ ≃ ℝ^{r₁} × ℂ^{r₂} (InfiniteAdeleRing.ringEquiv_mixedSpace); take 2^{r₂} times the transported mixed-space volume.
2. Take the product with finite-adele-haar; it is an additive Haar measure (product of Haar measures).

*Prerequisites:* `AA.0/finite-adele-haar`, `mathlib:NumberField.AdeleRing`, `mathlib:NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace`, `mathlib:NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis`, `mathlib:MeasureTheory.Measure.prod`.

*API:*
- `NumberField.adeleHaar` (constructor): The normalized Haar measure on 𝔸_K.
- `NumberField.adeleHaar_isAddHaar` (instance): adeleHaar is an additive Haar measure.
- `NumberField.adeleHaar_prod` (characterisation): adeleHaar is the product of the archimedean measure and finiteAdeleHaar.
- `NumberField.adeleHaar_infinite_eq_mixed` (compatibility): The archimedean factor is 2^{r₂} times the transport of the mixed-space volume.

*Unit tests:*
- `NumberField.adeleHaar_box_rat` (computation): For K = ℚ the set [0,1) × ∏_p ℤ_p has measure 1.
- `NumberField.adeleHaar_complex_factor` (computation): For K = ℚ(i), the set ([0,1]²) × ∏_v 𝒪_v has measure 2.
- `NumberField.adeleHaar_not_selfdual` (non-example): For K with |d_K| > 1 the measure is not self-dual for the standard character: the self-dual measure is |d_K|^{-1/2} • adeleHaar (AL.0 owns the self-dual normalization).

*Used by:* AutomorphicLFunctionsAndLocalFactors:AL.0 — the additive measure on 𝔸_K before self-dual renormalization; AA.2/tamagawa-number — vol(𝔸_K/K) for G_a; AA.5/gl1-adelic-quotient — idelic and adelic volume comparisons.

*Acceptance:* The archimedean factor equals 2^{r₂} times the mixed-embedding volume. The product [0,1]^{r₁} × ([0,1]²)^{r₂} × ∏_v 𝒪_v has measure 2^{r₂}.

*Sources:* sutherland-23, §23.2, p. 5.

#### `AA.0/idele-haar` — Normalized Haar measure on the ideles (construction)

For a number field K, the measure d^×x on the idele group 𝔸_K^× is the restricted product, through the topological isomorphism 𝔸_K^× ≅ Πʳ v, [K_v^×, 𝒪_v^×] (finite part) times ∏_{w|∞} K_w^×, of the Haar measures d^×x_v with vol(𝒪_v^×) = 1 at finite places, dx/|x| at real places and 2 dx dy/(x² + y²) at complex places.

*Hypotheses:* K a number field.

*Proof outline:*
1. Use RestrictedProduct.unitsEquiv for the finite part and its homeomorphism property for the units topology (GlobalNumberFields layer 6 proves local compactness and the units topology).
2. Apply restricted-haar-product with B v = 𝒪_v^×.

*Prerequisites:* `AA.0/restricted-haar-product`, `mathlib:NumberField.IdeleGroup`, `mathlib:RestrictedProduct.unitsEquiv`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

*API:*
- `NumberField.ideleHaar` (constructor): The normalized Haar measure on 𝔸_K^×.
- `NumberField.ideleHaar_isHaar` (instance): ideleHaar is a Haar measure on the idele group.
- `NumberField.ideleHaar_units` (simp): ideleHaar of ∏_v 𝒪_v^× times a box at infinity is the archimedean volume of the box.
- `NumberField.ideleHaar_invariant_principal` (relation): ideleHaar is invariant under multiplication by K^×.

*Unit tests:*
- `NumberField.ideleHaar_rat_box` (computation): For K = ℚ, ideleHaar (∏_p ℤ_p^× × [1,e]) = 1.
- `NumberField.ideleHaar_neq_restrict_adele` (non-example): ideleHaar is not the restriction of adeleHaar to the units: the units are adeleHaar-null in 𝔸_K.
- `NumberField.ideleHaar_form_factor` (compatibility): At a finite place, the measure |dx/x|_v built from the additive normalization gives 𝒪_v^× volume 1 - q_v⁻¹, so ideleHaar is the product of (1 - q_v⁻¹)⁻¹|dx/x|_v.

*Used by:* AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume — volume of the norm-one idele class group; AA.5/gl1-adelic-quotient — the GL_1 quotient measure; AA.0/tamagawa-convergence-failure — comparison with the form measures |dx/x|_v.

*Acceptance:* The measure of ∏_v 𝒪_v^× × ∏_w {1 ≤ |x_w| ≤ e} is 1 for K = ℚ. It is invariant under multiplication by principal ideles.

*Sources:* sutherland-23, §23.2, p. 5; rosengarten-tamagawa, §1, p. 2.

#### `AA.0/tamagawa-convergence-failure` — Products of form measures need convergence factors (theorem)

For K = ℚ and ω = dx/x on G_m, the local measures |ω|_p built from the additive normalization μ_p(ℤ_p) = 1 give vol(ℤ_p^×) = 1 - p⁻¹, and ∏_p (1 - p⁻¹) diverges to 0. Hence the family |ω|_p does not satisfy the normalization hypothesis of restricted-haar-product (cofinitely volume 1), and no rescaling by a single constant makes it do so; the Tamagawa measure of G_m uses the convergence factors λ_p = (1 - p⁻¹)⁻¹.

*Hypotheses:* K = ℚ; the analogous statement for a number field K uses the pole of the Dedekind zeta function at s = 1.

*Proof outline:*
1. ℤ_p^× = ℤ_p ∖ pℤ_p has additive measure 1 - p⁻¹, and |x|_p = 1 on it.
2. ∏_p (1 - p⁻¹) = 0 because ∑_p 1/p diverges (Nat.Primes.not_summable_one_div).
3. So the partial products of the volumes of ∏_p ℤ_p^× tend to 0 and the normalization condition fails at infinitely many places.

*Prerequisites:* `AA.0/idele-haar`, `mathlib:Nat.Primes.not_summable_one_div`, `AA.0/restricted-haar-product`.

*Acceptance:* This is the reason AA.2/tamagawa-measure inserts λ_v = L_v(X*(G), 1). With λ_p = (1 - p⁻¹)⁻¹ the corrected measures are the normalized idele measures of idele-haar.

*Sources:* rosengarten-tamagawa, §1, p. 2; borel-1963, §5.5, p. 21.

#### `AA.0/directed-supremum-measure` — Directed suprema of compatible measures (lemma)

Let X be a measurable space, (U_S) a countable directed family of measurable sets covering X and ν_S measures with ν_S supported on U_S and ν_{S'}|_{U_S} = ν_S for S ⊆ S'. Then E ↦ sup_S ν_S(E ∩ U_S) is a measure ν on X with ν|_{U_S} = ν_S for every S, and it is the unique measure with this property.

*Hypotheses:* (U_S) countable, directed and covering; compatibility ν_{S'}|_{U_S} = ν_S.

*Proof outline:*
1. For a fixed S the map E ↦ ν_{S'}(E ∩ U_{S'}) is monotone in S' and its limit exists in [0, ∞].
2. Countable additivity: for disjoint E_n, exchange the two monotone suprema sup_S Σ_n = Σ_n sup_S (monotone convergence for series).
3. Restriction to U_S: for S' ⊇ S, ν_{S'}(E ∩ U_S) = ν_S(E ∩ U_S) by compatibility.
4. Uniqueness: two measures agreeing on each U_S agree on X = ⋃ U_S by countable additivity over the disjointified pieces.

*Prerequisites:* .

*Acceptance:* For X = ℝ, U_n = [−n, n] and ν_n Lebesgue measure on U_n, the supremum is Lebesgue measure.

*Sources:* borel-1963, §5.5, p. 21.

#### `AA.0/local-normalized-haar` — Normalized local Haar measures (lemma)

For a number field K and a finite place v there is a unique additive Haar measure μ_v on K_v with μ_v(𝒪_v) = 1; for a ∈ K_v^×, map (a · ·) μ_v = |a|_v⁻¹ • μ_v with |a|_v = q_v^{−v(a)}.

*Hypotheses:* K a number field; v a finite place.

*Proof outline:*
1. K_v is a nonarchimedean local field (Tau Ceti), so locally compact with 𝒪_v compact open; normalize Mathlib's Haar measure so that 𝒪_v has volume one.
2. Scaling: multiplication by a uniformizer maps 𝒪_v onto 𝔪_v, of index q_v in 𝒪_v, so its volume is q_v⁻¹ (MeasureTheory.Subgroup.index_mul_measure); units preserve 𝒪_v.

*Prerequisites:* `tauceti:IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`, `mathlib:MeasureTheory.Measure.haarMeasure`, `mathlib:MeasureTheory.Subgroup.index_mul_measure`.

*Acceptance:* μ_p(pℤ_p) = 1/p for K = ℚ.

*Sources:* sutherland-23, §23.2, p. 5.

## AA.1. Adelic points and functoriality
For a finitely generated commutative Hopf algebra `H` over `F`, the adelic points are the
convolution group `G(𝔸_F) = WithConv (H →ₐ[F] 𝔸_F)` with the affine-points topology, the weakest
making every evaluation `x ↦ x(h)` continuous (Conrad, Proposition 2.1). RG2.0 is asked to supply
that topology over any Hausdorff topological ring, with its functoriality, products, closed
embeddings, local compactness and compactness of integral points; AA.1 evaluates it on `𝔸_F`,
`𝔸_{F,f}`, `F_v`, `𝒪_v` and `F ⊗ ℝ`. The diagonal `G(F) → G(𝔸_F)` and the local projections
`G(𝔸_F) → G(F_v)` are the points functor applied to the algebra maps `F → 𝔸_F → F_v`.

An integral model away from a finite set `S` is a finitely presented Hopf algebra `𝓗` over the
`S`-integers with generic fibre `H`. Models exist (spreading out) and two of them agree after
enlarging `S`, so their integral points `𝓗(𝒪_v)` agree for almost all `v`. The central theorem
of the layer identifies `G(𝔸_{F,f})` with the restricted product of the `G(F_v)` with respect to
the `𝓗(𝒪_v)` as topological groups (Conrad, Theorem 3.6, passed to the limit over `S`); this is the
comparison between "evaluating the affine group functor on `𝔸_F`" and Weil's adelization that
the roadmap's conventions require, and by AA.0 it does not depend on the model or on `S`.

Consequences: `G(𝔸_F)` is a second countable locally compact Hausdorff group; `G(F)` is discrete
and closed in it (from discreteness of `F` in `𝔸_F`, which Tau Ceti proves); but `G(F)` is
discrete in `G(𝔸_{F,f})` alone only when `G(F) ∩ U` is finite for a compact open `U` — true for
`G_m/ℚ` and a definite quaternion algebra, false for `G_a` and `SL_2/ℚ`. Homomorphisms induce
continuous homomorphisms compatible with diagonals and projections; closed subgroups give closed
embeddings; products and centres behave as expected; restriction of scalars along `E/F`
identifies `Res_{E/F}(G_E)(𝔸_F)` with `G_E(𝔸_E)` (using `𝔸_E ≅ E ⊗_F 𝔸_F` from GlobalNumberFields
layer 8 and Weil restriction from RG2.0a). For `G_a`, `G_m` and `GL_n` the adelic points are `𝔸_F`,
the idele group with its units topology, and `GL_n(𝔸_F)`.

Connected reductive groups have unimodular adelic points. The local statement is proved without
gauge forms: the modular character is trivial on compact subgroups and on the centre, the Cartan
decomposition (RG2.4, LieGroups layer 9) reduces it to a maximal split torus, and the Weyl group,
represented in `K`, forces it to vanish there. A restricted product of unimodular groups is
unimodular (AA.0).

Every compact open subgroup of `G(𝔸_{F,f})` contains, and lies in, a product of local compact open
subgroups equal to `𝓗(𝒪_v)` for almost all `v`; and an element `g` of `G(𝔸_{F,f})` lies in `𝓗(𝒪_v)`
for almost all `v`, so `gUg⁻¹` differs from `U` at finitely many places. These are the "restricted
product compact opens and conjugators equal to the identity outside a finite support" requested by
AbelianSchemesAndArithmeticModuliPartII F4.

**Depends on:** AA.0, ReductiveGroupsPartII RG2.0, RG2.0a, RG2.4, GlobalNumberFields layers 4, 5, 6,
8, LieGroups layer 9. **Consumed by:** AA.2–AA.5, ShimuraData D0 (D2 takes `G(ℝ)` from RG2.0),
MetaplecticAutomorphicForms MP.4, ExcursionOperators ES7, GeometryOfNumbers GN.2,
AbelianSchemesAndArithmeticModuliPartII F4, BorelRegulators R.1 and R.6.

**Planets:** Adelic points of an algebraic group (`AA.1/adelic-points`); Restricted-product comparison (`AA.1/restricted-product-comparison`); Discreteness of rational points (`AA.1/rational-points-discrete`).

### AA.1 declarations

#### `AA.1/adelic-points` — Adelic points of an affine algebraic group (definition)

For a finitely generated commutative Hopf algebra H over a number field F, G(𝔸_F) is the group of F-algebra maps H → 𝔸_F under convolution (TauCeti.HopfAlgebra.points H 𝔸_F), with the topology of affine points over the topological ring 𝔸_F (weakest topology making every evaluation h ↦ x(h) continuous). Likewise G(𝔸_{F,f}), G(F_∞) = G(F ⊗_ℚ ℝ) and G(F_v). The diagonal ι : G(F) → G(𝔸_F) is mapPoints along F → 𝔸_F and the local projection p_v : G(𝔸_F) → G(F_v) is mapPoints along the projection 𝔸_F → F_v.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Evaluate the points functor on the F-algebras 𝔸_F, 𝔸_{F,f}, F_v (the adele ring is an F-algebra; the projections are F-algebra maps built from RestrictedProduct.evalRingHom).
2. Give each the affine-points topology supplied by RG2.0 for topological rings; it is a topological group because multiplication is composition with comultiplication and inversion with the antipode.

*Prerequisites:* `tauceti:TauCeti.HopfAlgebra.points`, `tauceti:TauCeti.HopfAlgebra.mapPoints`, `tauceti:TauCeti.HopfAlgebra.pointsFunctor`, `mathlib:NumberField.AdeleRing`, `mathlib:IsDedekindDomain.FiniteAdeleRing`, `mathlib:RestrictedProduct.evalRingHom`, `ReductiveGroupsPartII:RG2.0`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`.

*API:*
- `AdelicPoints` (constructor): AdelicPoints H := WithConv (H →ₐ[F] 𝔸_F), a group under convolution.
- `AdelicPoints.instTopologicalSpace` (instance): The affine-points topology: induced from 𝔸_F^H by evaluation.
- `AdelicPoints.instIsTopologicalGroup` (instance): AdelicPoints H is a topological group.
- `AdelicPoints.diagonal` (data): The diagonal G(F) →* AdelicPoints H, mapPoints along algebraMap F 𝔸_F.
- `AdelicPoints.proj` (projection): For a finite place v, the continuous homomorphism AdelicPoints H →* G(F_v).
- `AdelicPoints.continuous_eval` (simp): For h ∈ H, x ↦ x h is continuous AdelicPoints H → 𝔸_F.
- `AdelicPoints.proj_diagonal` (simp): proj v (diagonal g) is the image of g in G(F_v).

*Unit tests:*
- `AdelicPoints.ga_eq_adeles` (compatibility): For H = F[T] with additive comultiplication, AdelicPoints H ≃ₜ+ 𝔸_F (see ga-adelic).
- `AdelicPoints.trivial_group` (degenerate): For H = F (the trivial group), AdelicPoints H is the one-point group.
- `AdelicPoints.not_product_topology` (non-example): For H = F[T, T⁻¹] the topology is not the subspace topology of 𝔸_F: the inversion map is not continuous for the subspace topology on 𝔸_F^×.

*Used by:* AA.1/restricted-product-comparison — identification with the restricted product of local points; AA.2/log-height — domain of H_G; AA.3/class-number-finite — double cosets G(F)\G(𝔸_f)/K; ShimuraData:D0 — adelic topological points of Shimura groups; MetaplecticAutomorphicForms:MP.4 — model-independent adelic points with local projections (request from MP.0); ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic — adelic points of D^× with the diagonal embedding (request from ES7); GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus — finite adelic points of spin groups with their restricted-product topology; AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set — finite-adelic points of an endomorphism unit group.

*Acceptance:* For H the coordinate ring of G_a, G(𝔸_F) is 𝔸_F with its own topology. For H the GL_n coordinate ring, G(𝔸_F) is GL_n(𝔸_F) with the units topology.

*Sources:* conrad-adelic, Proposition 2.1, p. 2; arthur-trace-intro, §2, p. 11.

#### `AA.1/integral-model` — Integral models over S-integers (definition)

An integral model of H away from a finite set S of places of F (containing the archimedean places) is a finitely presented commutative Hopf algebra 𝓗 over the S-integers 𝒪_{F,S} together with an isomorphism of Hopf algebras F ⊗_{𝒪_{F,S}} 𝓗 ≅ H. For v ∉ S its integral points are 𝓗(𝒪_v) = Hom_{𝒪_{F,S}}(𝓗, 𝒪_v) ⊂ G(F_v).

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); S a finite set of places containing the archimedean ones.

*Proof outline:*
1. Define the structure: the Hopf algebra 𝓗, the base-change isomorphism, and the map 𝓗(𝒪_v) → G(F_v) induced by 𝒪_v → F_v.

*Prerequisites:* `tauceti:TauCeti.HopfAlgebra.points`, `tauceti:TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv`.

*API:*
- `IntegralModel` (structure): Structure: S, a Hopf algebra 𝓗 over 𝒪_{F,S}, and baseChangeIso : F ⊗ 𝓗 ≃ H as Hopf algebras.
- `IntegralModel.localPoints` (data): For v ∉ S, the subgroup 𝓗(𝒪_v) of G(F_v).
- `IntegralModel.enlarge` (functoriality): For S ⊆ S′, the base-changed model over 𝒪_{F,S′}, with localPoints unchanged at v ∉ S′.
- `IntegralModel.localPoints_injective` (characterisation): The map 𝓗(𝒪_v) → G(F_v) induced by the injection 𝒪_v → F_v is injective.

*Unit tests:*
- `IntegralModel.gln_localPoints` (computation): For the standard model of GL_n, localPoints v = GL_n(𝒪_v) (invertible determinant), not all integral matrices with nonzero determinant.
- `IntegralModel.trivial` (degenerate): For the trivial group the localPoints are the trivial subgroup.
- `IntegralModel.monoid_not_model` (non-example): The 𝒪_{F,S}-bialgebra 𝒪_{F,S}[T] with T ↦ T ⊗ T is not an integral model of G_m: its generic fibre F[T] has no antipode, although its F-points contain F^×.

*Used by:* AA.1/restricted-product-comparison — the restricting subgroups 𝓗(𝒪_v); AA.2/tamagawa-convergence — smooth good models at almost all places; AA.3/good-maximal-compact — K_v = 𝓗(𝒪_v) hyperspecial for almost all v.

*Acceptance:* For H = F[GL_n] the model 𝒪_{F,S}[GL_n] has integral points GL_n(𝒪_v). For S ⊆ S′, base change gives a model over 𝒪_{F,S′}.

*Sources:* conrad-adelic, Remark 3.5 and §3, p. 6.

#### `AA.1/integral-model-exists` — Spreading out (lemma)

Every finitely generated commutative Hopf algebra H over F has an integral model away from some finite set S of places.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. H is finitely presented over the field F; F is the directed union of the rings 𝒪_{F,S}.
2. By Conrad, Theorem 3.4(1), H descends to a finitely presented 𝒪_{F,S}-algebra for some S, and the finitely many structure maps (comultiplication, counit, antipode) and Hopf identities descend after enlarging S (Theorem 3.4(1) applied to morphisms).

*Prerequisites:* `AA.1/integral-model`.

*Acceptance:* For H = F[GL_n] one may take S the archimedean places.

*Sources:* conrad-adelic, Theorem 3.4(1), p. 5.

#### `AA.1/integral-model-unique` — Uniqueness of integral models up to enlarging S (lemma)

Two integral models 𝓗, 𝓗′ of H (away from S and S′) become isomorphic, compatibly with their identifications with H, after base change to 𝒪_{F,S″} for some finite S″ ⊇ S ∪ S′. Consequently 𝓗(𝒪_v) = 𝓗′(𝒪_v) inside G(F_v) for all but finitely many v.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Apply Conrad, Theorem 3.4(3) to the two descents of the same finitely presented F-algebra, then to the Hopf structure maps.
2. For v ∉ S″ the isomorphism identifies the integral points inside G(F_v).

*Prerequisites:* `AA.1/integral-model`, `AA.1/integral-model-exists`.

*Acceptance:* The models 𝒪_{F,S}[GL_2] and its conjugate by diag(p, 1) agree away from S ∪ {p}.

*Sources:* conrad-adelic, Theorem 3.4(3), p. 5.

#### `AA.1/integral-points-level` — Integral points are compact open subgroups (lemma)

For an integral model 𝓗 away from S and a finite place v ∉ S, 𝓗(𝒪_v) is a compact open subgroup of G(F_v).

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. 𝒪_v is open and compact in F_v; by RG2.0 (Conrad, Example 2.3 and Corollary 3.7) X(𝒪_v) is open and compact in X(F_v) for X affine of finite type over 𝒪_v.
2. It is a subgroup because the group structure is defined over 𝒪_{F,S}.

*Prerequisites:* `AA.1/integral-model`, `ReductiveGroupsPartII:RG2.0`.

*Acceptance:* GL_n(ℤ_p) is compact open in GL_n(ℚ_p).

*Sources:* conrad-adelic, Example 2.3, p. 3.

#### `AA.1/restricted-product-comparison` — Adelic points as a restricted product (theorem)

Let 𝓗 be an integral model of H away from S. The map x ↦ (p_v(x))_v is an isomorphism of topological groups G(𝔸_{F,f}) ≃ₜ* Πʳ v, [G(F_v), B_v], where B_v = 𝓗(𝒪_v) for v ∉ S and B_v = G(F_v) for the finitely many finite v ∈ S; and G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}).

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); 𝓗 an integral model away from S.

*Proof outline:*
1. Points over a product of rings are the product of points; 𝔸_F = F_∞ × 𝔸_{F,f}.
2. Set-theoretic bijection: an F-algebra map H → 𝔸_{F,f} factors through 𝒪_{F,S′}-points of 𝓗 with values in 𝔸_{F,S′} for some S′ (H finitely generated, Theorem 3.4 limit argument), i.e. lands in ∏_{v∈S′} G(F_v) × ∏_{v∉S′} 𝓗(𝒪_v); conversely such a family glues (Conrad, Theorem 3.6).
3. Topology: on each 𝔸_{F,S′} the affine-points topology is the product topology (Conrad, Theorem 3.6, affine case), and both sides carry the direct-limit topology over S′ with open transition maps (RestrictedProduct.topologicalSpace_eq_iSup).

*Prerequisites:* `AA.1/adelic-points`, `AA.1/integral-model`, `AA.1/integral-points-level`, `mathlib:RestrictedProduct.topologicalSpace_eq_iSup`, `AA.0/split-finite-factors`, `ReductiveGroupsPartII:RG2.0`, `AA.1/finite-adeles-directed-union`, `AA.1/restricted-product-bijection`.

*Acceptance:* For G = G_a it is FiniteAdeleRing as a restricted product (definitional up to the identification). For G = GL_n it identifies GL_n(𝔸_f) with Πʳ_v [GL_n(F_v), GL_n(𝒪_v)].

*Sources:* conrad-adelic, Theorem 3.6, p. 6; borel-1963, §1.2, p. 7.

#### `AA.1/restricted-product-model-independence` — Independence of the model and of the exceptional set (theorem)

The topological group structure on Πʳ v, [G(F_v), 𝓗(𝒪_v)] obtained from restricted-product-comparison does not depend on the integral model 𝓗 or on S: for two models the identity of G(𝔸_{F,f}) corresponds to the canonical isomorphism of RestrictedProduct.changeSubgroups, and enlarging S does not change it.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Two models give the same B_v for all but finitely many v (integral-model-unique).
2. Apply restricted-haar-change-subgroups (its topological part); both comparisons are compatible with the projections p_v, which determine the map.

*Prerequisites:* `AA.1/restricted-product-comparison`, `AA.1/integral-model-unique`, `AA.0/restricted-haar-change-subgroups`.

*Acceptance:* For G = GL_2 the models 𝒪[GL_2] and its conjugate by diag(p,1) give the same topology on GL_2(𝔸_f).

*Sources:* conrad-adelic, Theorem 3.6, p. 6.

#### `AA.1/adelic-points-locally-compact` — Adelic groups are locally compact (theorem)

G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are second countable, locally compact, Hausdorff topological groups.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. By restricted-product-comparison G(𝔸_{F,f}) is a restricted product of locally compact groups G(F_v) with compact open subgroups 𝓗(𝒪_v) for almost all v; apply RestrictedProduct.locallyCompactSpace_of_group and AA.0/second-countable.
2. G(F_∞) is a closed subgroup of GL_n(F ⊗ ℝ) for a faithful representation (RG2.0).
3. Hausdorffness follows from the closed-embedding property of affine points over a Hausdorff ring.

*Prerequisites:* `AA.1/restricted-product-comparison`, `mathlib:RestrictedProduct.locallyCompactSpace_of_group`, `AA.0/second-countable`, `ReductiveGroupsPartII:RG2.0`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`.

*Acceptance:* GL_1(𝔸_ℚ) = 𝔸_ℚ^× is locally compact. The full product ∏_p GL_n(ℚ_p) with the product topology is not locally compact; the restricted product is.

*Sources:* borel-1963, §1.2, p. 7.

#### `AA.1/rational-points-discrete` — Rational points are discrete in the full adeles (theorem)

The diagonal G(F) → G(𝔸_F) is injective, its image is a discrete subgroup, and the image is closed.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. F is discrete and closed in 𝔸_F (Tau Ceti GlobalNumberFields discreteness).
2. For affine X, a discrete subring R ⊂ R′ gives X(R) discrete in X(R′) (Conrad, Example 2.2): choose generators h_1, …, h_n of H; the evaluation embedding sends X(R) into the discrete set R^n.
3. A discrete subgroup of a Hausdorff topological group is closed (Subgroup.isClosed_of_discrete).

*Prerequisites:* `AA.1/adelic-points`, `tauceti:TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`, `tauceti:TauCeti.GlobalNumberFields.isClosed_principalSubgroup`, `mathlib:Subgroup.isClosed_of_discrete`, `tauceti:NumberField.AdeleRing.instT2Space`, `ReductiveGroupsPartII:RG2.0`.

*Acceptance:* For G = G_a this is discreteness of F in 𝔸_F. For G = SL_2 over ℚ, SL_2(ℚ) is discrete in SL_2(𝔸_ℚ).

*Sources:* conrad-adelic, Example 2.3, p. 3; borel-1963, §1.2, p. 7.

#### `AA.1/finite-adelic-discreteness-criterion` — Discreteness in the finite adeles alone (theorem)

G(F) is discrete in G(𝔸_{F,f}) if and only if G(F) ∩ U is finite for one (equivalently every) compact open subgroup U ⊂ G(𝔸_{F,f}). In particular G_a(F) = F is not discrete in 𝔸_{F,f}, SL_2(ℚ) is not discrete in SL_2(𝔸_{ℚ,f}) because SL_2(ℤ) is infinite, and ℚ^× is discrete in 𝔸_{ℚ,f}^× because ℚ^× ∩ ∏_p ℤ_p^× = {±1}.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. If G(F) ∩ U is finite then a smaller open neighbourhood of 1 meets G(F) only in 1, since G(𝔸_{F,f}) is Hausdorff.
2. Conversely a discrete subgroup meets the compact U in a finite set.
3. Compact open subgroups are commensurable, so finiteness for one U gives it for all.
4. Examples: ℤ ⊂ ℚ ∩ ∏_p ℤ_p is infinite; SL_2(ℤ) = SL_2(ℚ) ∩ SL_2(ℤ̂) is infinite; ℚ^× ∩ ℤ̂^× = {±1}.

*Prerequisites:* `AA.1/rational-points-discrete`, `AA.1/adelic-points-locally-compact`.

*Acceptance:* For a definite quaternion algebra D over ℚ, D^× is discrete in (D ⊗ 𝔸_f)^× modulo the centre (AA.5/definite-quaternion-compact). Discreteness of G(F) in G(𝔸_F) does not imply discreteness in G(𝔸_{F,f}).

*Sources:* borel-1963, §1.8, p. 9.

#### `AA.1/adelic-points-split` — Splitting off finitely many places (lemma)

For a finite set S of places, G(𝔸_F) ≃ₜ* G(F_S) × G(𝔸_F^S), with G(F_S) = ∏_{v∈S} G(F_v) and G(𝔸_F^S) the adelic points away from S; in particular G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}). The diagonal G(F) maps to the pair of diagonals.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Combine restricted-product-comparison with split-finite-factors, and points of a product of rings.

*Prerequisites:* `AA.1/restricted-product-comparison`, `AA.0/split-finite-factors`, `AA.1/points-product-ring`.

*Acceptance:* For S = {∞} and F = ℚ, G(𝔸) = G(ℝ) × G(𝔸_f).

*Sources:* borel-1963, §1.2, p. 7.

#### `AA.1/adelic-map` — Functoriality of adelic points (construction)

A homomorphism of affine algebraic groups φ : G → G′ over F (a Hopf algebra map φ* : H′ → H) induces a continuous homomorphism φ_𝔸 : G(𝔸_F) → G′(𝔸_F), x ↦ x ∘ φ*, commuting with the diagonals and with the local projections, with (id)_𝔸 = id and (ψ ∘ φ)_𝔸 = ψ_𝔸 ∘ φ_𝔸. Under restricted-product-comparison it is the restricted product of the local maps φ_v, which send 𝓗(𝒪_v) into 𝓗′(𝒪_v) for almost all v.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); φ a homomorphism of affine algebraic groups over F.

*Proof outline:*
1. Precomposition with φ* is a group homomorphism of convolution groups (TauCeti.CommHopfAlgCat.pointsFunctor).
2. Continuity: each evaluation of φ_𝔸(x) at h′ is the evaluation of x at φ*(h′).
3. φ* is defined over 𝒪_{F,S} for S large (integral-model-unique), giving the restricted-product description (mapAlong_continuous).

*Prerequisites:* `AA.1/adelic-points`, `tauceti:TauCeti.CommHopfAlgCat.pointsFunctor`, `AA.1/restricted-product-comparison`, `AA.1/integral-model-unique`, `mathlib:RestrictedProduct.mapAlong_continuous`.

*API:*
- `AdelicPoints.map` (constructor): AdelicPoints.map φ : AdelicPoints H →* AdelicPoints H′ for a Hopf algebra map H′ → H.
- `AdelicPoints.continuous_map` (functoriality): AdelicPoints.map φ is continuous.
- `AdelicPoints.map_id` (functoriality): AdelicPoints.map (id) = id.
- `AdelicPoints.map_comp` (functoriality): AdelicPoints.map (φ ∘ ψ) = AdelicPoints.map ψ ∘ AdelicPoints.map φ (contravariance on Hopf algebras).
- `AdelicPoints.map_diagonal` (compatibility): map φ (diagonal g) = diagonal (φ g).
- `AdelicPoints.proj_map` (compatibility): proj v ∘ map φ = φ_v ∘ proj v.

*Unit tests:*
- `AdelicPoints.map_det_gl1` (computation): For n = 1 the determinant GL_1 → G_m is the identity Hopf map, and AdelicPoints.map of the identity is the identity of 𝔸_F^×.
- `AdelicPoints.map_trivial` (degenerate): The map to the trivial group is the constant map.
- `AdelicPoints.map_not_open` (non-example): The squaring map G_m → G_m induces a continuous homomorphism of 𝔸_ℚ^× with non-closed image of infinite index: (𝔸_ℚ^×)² has infinite index, so φ_𝔸 need not be surjective or open.

*Used by:* AA.2/log-height — rational characters χ : G → G_m give χ_𝔸 : G(𝔸) → 𝔸^×; AA.4/plus-subgroup — the image of the simply connected cover; GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus — induced spin-cover maps on finite adelic points; ShimuraData:D0 — morphisms of Shimura data on adelic points.

*Acceptance:* det : GL_n → G_m induces det : GL_n(𝔸_F) → 𝔸_F^×. The identity homomorphism induces the identity.

*Sources:* borel-1963, §1.3, p. 7.

#### `AA.1/closed-subgroup-adelic` — Closed subgroups give closed embeddings (lemma)

If H′ = H/I for a Hopf ideal I (a closed subgroup G′ ⊂ G), the induced map G′(𝔸_F) → G(𝔸_F) is a closed embedding of topological groups with image quotientPointsSubgroup H I 𝔸_F.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); I a Hopf ideal of H.

*Proof outline:*
1. Closed immersions induce closed embeddings on affine points over the Hausdorff ring 𝔸_F (RG2.0, Conrad Proposition 2.1).
2. The image is the set of points vanishing on I (TauCeti.CommHopfAlgCat.quotientPointsSubgroup).

*Prerequisites:* `AA.1/adelic-map`, `tauceti:TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, `ReductiveGroupsPartII:RG2.0`, `tauceti:NumberField.AdeleRing.instT2Space`.

*Acceptance:* SL_n(𝔸_F) is closed in GL_n(𝔸_F). The diagonal torus of GL_n gives a closed subgroup (𝔸_F^×)^n.

*Sources:* conrad-adelic, Proposition 2.1, p. 2.

#### `AA.1/product-adelic` — Products of groups (lemma)

For affine algebraic groups G, G′ over F, (G × G′)(𝔸_F) ≃ₜ* G(𝔸_F) × G′(𝔸_F), compatibly with diagonals and local projections.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Points of H ⊗_F H′ are pairs of points (TauCeti.AffineGroup.Product.pointsMulEquiv).
2. The affine-points topology is compatible with fibre products (RG2.0, Conrad Proposition 2.1).

*Prerequisites:* `AA.1/adelic-points`, `tauceti:TauCeti.AffineGroup.Product.pointsMulEquiv`, `ReductiveGroupsPartII:RG2.0`.

*Acceptance:* (G_m × G_m)(𝔸) = 𝔸^× × 𝔸^×.

*Sources:* conrad-adelic, Proposition 2.1, proof, p. 2.

#### `AA.1/center-adelic` — The centre on adelic points (lemma)

Let Z ⊂ G be the centre (centerDefiningIdeal). Then Z(𝔸_F) is a closed subgroup of G(𝔸_F) contained in the centre of G(𝔸_F), and Z(F) = Z(𝔸_F) ∩ G(F).

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Apply closed-subgroup-adelic to the centre Hopf ideal.
2. Points of the centre are universally central points (centerPointsSubgroup_eq_center), hence central in G(𝔸_F).
3. Intersection with G(F): a rational point lies in Z(𝔸_F) iff it vanishes on the defining ideal, i.e. lies in Z(F).

*Prerequisites:* `AA.1/closed-subgroup-adelic`, `tauceti:TauCeti.CommHopfAlgCat.centerDefiningIdeal`, `tauceti:TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center`.

*Acceptance:* For GL_n, Z(𝔸_F) = 𝔸_F^× scalar matrices. For SL_2, Z(𝔸_F) = {±1}^{places} ∩ restricted product, an infinite compact group.

*Sources:* borel-1963, §1.6, p. 8.

#### `AA.1/base-change-adelic` — Restriction of scalars on adelic points (construction)

For a finite extension E/F and an affine algebraic group G_E over E, with Res = Res_{E/F} G_E, there is an isomorphism of topological groups Res(𝔸_F) ≃ₜ* G_E(𝔸_E), natural in G_E, compatible with Res(F) = G_E(E) on diagonals.

*Hypotheses:* E/F a finite extension of number fields; G_E an affine algebraic group over E.

*Proof outline:*
1. Res(𝔸_F) = G_E(E ⊗_F 𝔸_F) by the defining property of Weil restriction (RG2.0a).
2. E ⊗_F 𝔸_F ≃ 𝔸_E as topological E-algebras (GlobalNumberFields layer 8).
3. Topologies: the module topology on E ⊗_F 𝔸_F is the one used by the affine-points topology (Conrad, Example 4.2).

*Prerequisites:* `AA.1/adelic-points`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

*API:*
- `AdelicPoints.resEquiv` (constructor): The isomorphism of topological groups Res_{E/F}(G_E)(𝔸_F) ≃ₜ* G_E(𝔸_E).
- `AdelicPoints.resEquiv_diagonal` (compatibility): resEquiv carries the diagonal of Res(F) to the diagonal of G_E(E).
- `AdelicPoints.resEquiv_natural` (functoriality): resEquiv is natural in homomorphisms G_E → G′_E.
- `AdelicPoints.resEquiv_trans` (functoriality): In a tower F ⊂ E ⊂ L, resEquiv for L/F is the composite of those for L/E and E/F.

*Unit tests:*
- `AdelicPoints.resEquiv_gm` (computation): For G_E = G_m, resEquiv is 𝔸_E^× ≃ (E ⊗ 𝔸_F)^×.
- `AdelicPoints.resEquiv_self` (degenerate): For E = F, resEquiv is the identity.
- `AdelicPoints.res_not_base_change` (non-example): Res_{E/F}(G_E) is not the base change of G_E: for E = ℚ(i), Res G_m(ℚ) = ℚ(i)^× while G_m(ℚ) = ℚ^×.

*Used by:* AA.2/tamagawa-restriction-scalars — transport of Tamagawa measures; AA.3/siegel-covering-adelic — reduction to F = ℚ; BorelRegulators:R.6/restriction-scalars-form — Res_{F/ℚ} of SL_1(D); ShimuraData:D0 — restriction-of-scalars point comparisons.

*Acceptance:* For G_E = G_m, Res_{E/F} G_m(𝔸_F) = 𝔸_E^×. For E = F it is the identity.

*Sources:* conrad-adelic, Example 4.2, p. 10; arthur-trace-intro, §2, p. 11.

#### `AA.1/base-change-local-factors` — Local factors of restriction of scalars (lemma)

Under base-change-adelic, the projection to F_v corresponds to Res(F_v) ≃ ∏_{w|v} G_E(E_w), and for almost all v the integral points of a model of Res correspond to ∏_{w|v} 𝓗_E(𝒪_w).

*Hypotheses:* E/F finite; G_E affine over E.

*Proof outline:*
1. E ⊗_F F_v ≃ ∏_{w|v} E_w (GlobalNumberFields layer 8 local decomposition).
2. Points of a product of rings are products of points; Res of a model of G_E is a model of Res for almost all v.

*Prerequisites:* `AA.1/base-change-adelic`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `ReductiveGroupsPartII:RG2.0a`.

*Acceptance:* For Res_{ℚ(i)/ℚ} G_m at p ≡ 1 mod 4, Res(ℚ_p) = ℚ_p^× × ℚ_p^×.

*Sources:* borel-1963, §1.4, p. 8.

#### `AA.1/ga-adelic` — The additive group (lemma)

For G = G_a (H = F[T] with T primitive), G(𝔸_F) ≃ₜ+ 𝔸_F, the diagonal is algebraMap F 𝔸_F and restricted-product-comparison recovers FiniteAdeleRing as a restricted product.

*Hypotheses:* F a number field.

*Proof outline:*
1. An F-algebra map F[T] → 𝔸_F is its value at T; the topology induced by evaluation at T is that of 𝔸_F.

*Prerequisites:* `AA.1/adelic-points`, `mathlib:NumberField.AdeleRing`, `mathlib:IsDedekindDomain.FiniteAdeleRing`.

*Acceptance:* The Haar measure of AA.0/adele-haar is a Haar measure on G_a(𝔸_F).

*Sources:* arthur-trace-intro, §2, p. 11.

#### `AA.1/gm-adelic` — The multiplicative group and the ideles (lemma)

For G = G_m, G(𝔸_F) ≃ₜ* NumberField.IdeleGroup (𝓞 F) F = 𝔸_F^× with the units topology, and under restricted-product-comparison the finite part is Πʳ v, [F_v^×, 𝒪_v^×] via RestrictedProduct.unitsEquiv.

*Hypotheses:* F a number field.

*Proof outline:*
1. TauCeti.MultiplicativeGroup.pointsMulEquiv identifies the group with 𝔸_F^×.
2. The affine-points topology for F[T, T⁻¹] is induced by x ↦ (x, x⁻¹), which is Mathlib's units topology.
3. GlobalNumberFields layer 6 identifies the units topology with the restricted-product topology.

*Prerequisites:* `AA.1/adelic-points`, `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv`, `mathlib:NumberField.IdeleGroup`, `mathlib:RestrictedProduct.unitsEquiv`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

*Acceptance:* F^× ⊂ 𝔸_F^× is discrete (rational-points-discrete). The idele norm is the composition with the character id ∈ X*(G_m) (AA.2/log-height).

*Sources:* borel-1963, §1.3, p. 7.

#### `AA.1/gln-adelic` — The general linear group (lemma)

For G = GL_n, G(𝔸_F) ≃ₜ* GL_n(𝔸_F) = (Matrix (Fin n) (Fin n) 𝔸_F)ˣ with the units topology, and its finite part is the restricted product Πʳ v, [GL_n(F_v), GL_n(𝒪_v)].

*Hypotheses:* F a number field; n ≥ 1.

*Proof outline:*
1. TauCeti.GeneralLinear.pointsMulEquiv.
2. The coordinate ring is generated by the entries and det⁻¹, so the topology is induced by g ↦ (g, g⁻¹).
3. Apply restricted-product-comparison to the standard model over 𝒪_F.

*Prerequisites:* `AA.1/adelic-points`, `tauceti:TauCeti.GeneralLinear.pointsMulEquiv`, `AA.1/restricted-product-comparison`, `AA.1/gm-adelic`.

*Acceptance:* For n = 1 it is gm-adelic. GL_n(𝒪_v) is not the set of integral matrices with nonzero determinant.

*Sources:* arthur-trace-intro, §2, p. 11.

#### `AA.1/local-unimodular-reductive` — Local unimodularity of reductive groups (lemma)

For a connected reductive group G over a local field E of characteristic 0, the locally compact group G(E) is unimodular.

*Hypotheses:* E a local field of characteristic 0; G connected reductive over E.

*Proof outline:*
1. The modular character Δ : G(E) → ℝ_{>0} is a continuous homomorphism, trivial on compact subgroups and on the centre Z(E), since Δ(g) is the modulus of conjugation by g.
2. Cartan decomposition G(E) = K M(E) K with M = Z_G(A) for a maximal split torus A (RG2.4 nonarchimedean, LieGroups layer 9 archimedean); so Δ is determined by its restriction to M(E), and M(E)/A(E)·M(E)^1 is finite with M(E)^1 compact, so Δ is determined by Δ|_{A(E)}.
3. For a ∈ A(E), the product ∏_{w∈W} w(a) of the relative Weyl orbit is W-invariant, hence a power of it lies in the split centre; Weyl representatives lie in K, so Δ(w a w⁻¹) = Δ(a), giving Δ(a)^{|W|·m} = 1 and Δ(a) = 1.

*Prerequisites:* `mathlib:MeasureTheory.Measure.modularCharacter`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `AA.1/modular-character-trivial-compact-centre`, `AA.1/weyl-orbit-product-central`.

*Acceptance:* GL_n(ℚ_p) and SL_n(ℝ) are unimodular. The Borel subgroup of GL_2(ℚ_p) is not unimodular: Δ(diag(a,d)) = |a/d|_p^{±1}.

*Sources:* borel-1963, §5.5, p. 20.

#### `AA.1/unimodular-reductive` — Adelic groups of reductive groups are unimodular (theorem)

For a connected reductive group G over a number field F, G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are unimodular.

*Hypotheses:* F a number field; G connected reductive over F.

*Proof outline:*
1. Each G(F_v) is unimodular (local-unimodular-reductive).
2. A restricted product of unimodular groups is unimodular (AA.0/restricted-unimodular, via restricted-product-comparison).

*Prerequisites:* `AA.1/local-unimodular-reductive`, `AA.0/restricted-unimodular`, `AA.1/restricted-product-comparison`.

*Acceptance:* GL_n(𝔸_F) is unimodular; the adelic points of the upper triangular Borel subgroup of GL_2 are not.

*Sources:* borel-1963, §5.5, p. 20.

#### `AA.1/compact-open-product` — Compact open subgroups and product levels (lemma)

Every compact open subgroup U ⊂ G(𝔸_{F,f}) contains a product subgroup ∏_v U_v with U_v ⊂ G(F_v) compact open and U_v = 𝓗(𝒪_v) for all but finitely many v, and is contained in such a product; any two compact open subgroups are commensurable.

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. By restricted-product-comparison and the box basis of the restricted-product topology (AA.0/second-countable), U contains an open box ∏_v U_v with U_v = 𝓗(𝒪_v) cofinitely.
2. U is compact, so its projections p_v(U) are compact and U ⊂ ∏_v p_v(U), with p_v(U) ⊂ 𝓗(𝒪_v) for almost all v (U lies in finitely many translates of ∏ 𝓗(𝒪_v)).
3. Commensurability: U ∩ U′ is open in the compact U, hence of finite index.

*Prerequisites:* `AA.1/restricted-product-comparison`, `AA.0/second-countable`.

*Acceptance:* GL_2(ℤ̂) ⊃ K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N)) = ∏_p K_p(N) is a product level.

*Sources:* borel-1963, §1.7, p. 8.

#### `AA.1/finite-support-conjugate` — Conjugation changes a level at finitely many places (lemma)

For g ∈ G(𝔸_{F,f}) and an integral model 𝓗, g_v ∈ 𝓗(𝒪_v) for all but finitely many v; hence for a product level U = ∏_v U_v, the conjugate gUg⁻¹ = ∏_v g_v U_v g_v⁻¹ agrees with U at all but finitely many v, and the element g can be written as g_B · u with g_B supported on a finite set B of places and u ∈ ∏_v 𝓗(𝒪_v).

*Hypotheses:* F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G).

*Proof outline:*
1. Restricted-product condition (restricted-product-comparison).
2. For v with g_v ∈ 𝓗(𝒪_v) = U_v conjugation preserves U_v.

*Prerequisites:* `AA.1/restricted-product-comparison`, `AA.1/compact-open-product`.

*Acceptance:* For g = diag(p, 1) ∈ GL_2(𝔸_f), gGL_2(ℤ̂)g⁻¹ differs from GL_2(ℤ̂) only at p.

*Sources:* borel-1963, §1.2, p. 7.

#### `AA.1/points-product-ring` — Points over a product of rings (lemma)

For commutative F-algebras R₁, R₂ (and more generally a finite product), WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂), naturally and as topological groups for the affine-points topology.

*Hypotheses:* H a commutative Hopf algebra over F.

*Proof outline:*
1. An algebra map into a product is a pair of algebra maps (AlgHom.prod); convolution is computed componentwise.
2. The affine-points topology is induced from R^H, which is the product of R₁^H and R₂^H.

*Prerequisites:* `AA.1/adelic-points`, `mathlib:AlgHom.prod`.

*Acceptance:* G(𝔸_F) = G(F_∞) × G(𝔸_{F,f}) because 𝔸_F = F_∞ × 𝔸_{F,f}.

*Sources:* conrad-adelic, Proposition 2.1, proof, p. 2.

#### `AA.1/finite-adeles-directed-union` — Finite adeles as a directed union of S-adeles (lemma)

For finite sets S of finite places, the S-adeles 𝔸_{F,S} = ∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v are open subrings of 𝔸_{F,f} forming a directed union, and every F-algebra map H → 𝔸_{F,f} from a finitely generated H restricts to a map of models 𝓗 → 𝔸_{F,S} for S large: G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S}).

*Hypotheses:* H finitely generated; 𝓗 an integral model.

*Proof outline:*
1. Each generator of H has finitely many denominators, so its image lies in 𝔸_{F,S} for S large.
2. Conrad, Theorem 3.4(1) applied to the directed system 𝒪_{F,S} → 𝔸_{F,S} identifies the points over the limit with the limit of the points (Remark 3.5).

*Prerequisites:* `AA.1/integral-model`, `AA.1/integral-model-exists`, `mathlib:RestrictedProduct.isOpenEmbedding_inclusion_principal`.

*Acceptance:* For G_a: 𝔸_{F,f} = ⋃_S 𝔸_{F,S}.

*Sources:* conrad-adelic, Remark 3.5, p. 6.

#### `AA.1/restricted-product-bijection` — The restricted-product bijection on S-adelic points (lemma)

For an integral model 𝓗 away from S and S' ⊇ S, the natural map 𝓗(𝔸_{F,S'}) → ∏_{v∈S'} G(F_v) × ∏_{v∉S'} 𝓗(𝒪_v) is a bijection, and a homeomorphism for the affine-points topology on the left and the product topology on the right.

*Hypotheses:* 𝓗 affine over 𝒪_{F,S}.

*Proof outline:*
1. Bijectivity: a map out of the affine 𝓗 into a product ring is a family of maps (points-product-ring for infinite products of rings, the affine case of Conrad Theorem 3.6).
2. Topology: for affine schemes the affine-points topology commutes with arbitrary products of rings because it is induced from the product topology on coefficient tuples.

*Prerequisites:* `AA.1/integral-model`, `AA.1/points-product-ring`, `ReductiveGroupsPartII:RG2.0`.

*Acceptance:* For GL_n: GL_n(𝔸_{F,S}) = ∏_{v∈S} GL_n(F_v) × ∏_{v∉S} GL_n(𝒪_v).

*Sources:* conrad-adelic, Theorem 3.6, p. 6.

#### `AA.1/modular-character-trivial-compact-centre` — The modular character on compact and central elements (lemma)

For a locally compact group G, the modular character Δ : G → ℝ_{>0} is a continuous homomorphism trivial on every compact subgroup and on the centre of G, and it is invariant under conjugation.

*Hypotheses:* G locally compact.

*Proof outline:*
1. Δ(g) is the scalar by which conjugation by g rescales Haar measure (Mathlib modularCharacter).
2. A compact subgroup maps to a compact subgroup of ℝ_{>0}, which is trivial.
3. Conjugation by a central element is the identity.
4. Δ is a homomorphism to an abelian group, hence constant on conjugacy classes.

*Prerequisites:* `mathlib:MeasureTheory.Measure.modularCharacter`.

*Acceptance:* For the Borel of GL_2(ℚ_p), Δ is trivial on the compact diagonal units diag(ℤ_p^×, ℤ_p^×).

*Sources:* borel-1963, §5.5, p. 20.

#### `AA.1/weyl-orbit-product-central` — Weyl orbit products lie in the split centre up to finite index (lemma)

Let A be a maximal split torus of a connected reductive group over a field and W its relative Weyl group. For a ∈ A(E), the product ∏_{w∈W} w(a) lies in (Z(G) ∩ A)(E) up to an element of a finite group; in particular some power of it lies in the split centre.

*Hypotheses:* G connected reductive; A maximal split torus.

*Proof outline:*
1. The product is W-invariant.
2. The W-invariants of X_*(A) ⊗ ℚ are X_*(Z ∩ A) ⊗ ℚ (W acts without nonzero fixed vectors on the span of the coroots).
3. So the W-invariant subtorus is the identity component of Z ∩ A, and A^W is a finite extension of it.

*Prerequisites:* `ReductiveGroupsPartII:RG2.4`.

*Acceptance:* For GL_2 and a = diag(x, y): a · w(a) = diag(xy, xy) is central.

*Sources:* borel-1963, §5.5, p. 20.

## AA.2. Characters, heights and integration
The `F`-rational characters of `G` are the group-like elements of `H`, a free abelian group of
finite rank for connected `G`, equal to the Galois-fixed part of the geometric character lattice
that Tau Ceti builds. Their real dual is `a_G`, and the Harish-Chandra map
`H_G : G(𝔸) → a_G` is `⟨H_G(x), χ⟩ = log ‖χ(x)‖` with the idele norm. It vanishes on `G(F)` by the
product formula and on compact subgroups, and `G(𝔸)^1 = ker H_G` is a closed normal subgroup
containing both. The split component `A_G`, the largest `ℚ`-split central torus of
`Res_{F/ℚ} G`, has `A_G(ℝ)^0 ≅ a_G` through `H_G`, which gives `G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0`. Dividing
by `A_G(ℝ)^0` and passing to `G(𝔸)^1` give homeomorphic quotients of `G(F)\G(𝔸)`; dividing by all of
`Z(F_∞)^0` does not.

For a parabolic `P = M_P N_P` the modulus `δ_P(p) = ‖det(Ad p | Lie N_P)‖` is a character trivial
on `P(F)` and `N_P(𝔸)`, equal to `e^{⟨2ρ_P, H_P(p)⟩}`, and it is the modular character of `P(𝔸)`
in Mathlib's convention; for the Borel of `GL_2` it is `‖a/d‖`, not `‖det‖`.

Weil's quotient measure exists on `H\G` for a closed subgroup with `Δ_G|_H = Δ_H`, unique up to a
scalar and characterized by `∫_G f = ∫_{H\G} ∫_H f(hg)` on compactly supported continuous `f`;
the formula extends to integrable `f`, quotient measures compose in stages, and for `G(F)` in
`G(𝔸)` the measure is the image of Haar measure on any measurable fundamental domain (Mathlib's
`IsFundamentalDomain.measure_eq` gives independence of the domain). The automorphic quotient
measure on `G(F)\G(𝔸)^1` and the Hilbert space `L²(G(F)\G(𝔸), ω)` with a unitary central
character, together with the decomposition of `L²` for a smaller central subgroup into its
isotypic pieces, are the shared carriers for AutomorphicFormsOnReductiveGroups and the arithmetic
roadmaps.

Tamagawa measures. A gauge form is a nonzero element of the top exterior power of the cotangent
space at the identity; its local measures `|ω|_v` are left Haar measures with `|cω|_v = |c|_v |ω|_v`
and with right translation acting through `|det Ad|_v⁻¹`, and Weil's formula gives the volume
`#𝓗(k_v) q_v^{-d}` of the integral points of a smooth model. The convergence factors are the local
factors `L_v(X, 1)` of the character module `X = X*(G_{F̄}) ⊗ ℂ` and `ρ_G` is the leading
coefficient of `L(X, s)` at `s = 1`; for split characters it is a power of the residue of the
Dedekind zeta function (Mathlib). The Tamagawa measure is
`τ_G = |d_F|^{-d/2} ρ_G⁻¹ ∏ʳ_v λ_v |ω|_v`; it does not depend on `ω` (product formula), is compatible
with restriction of scalars, and gives the Tamagawa number `τ(G) = vol(G(F)\G(𝔸)^1)`. Three gaps
are recorded: the change-of-variables formula for `p`-adic analytic maps (needed to define `|ω|_v`
at finite places), Artin `L`-functions at `s = 1` for nontrivial Galois action on characters, and
Steinberg's order formula for finite reductive groups (absolute convergence of the product).

**Depends on:** AA.1; Tau Ceti character lattices, dynamic parabolics, cotangent spaces and the
adjoint representation; Mathlib's quotient-measure and Dedekind-zeta results; Chebotarev (Frobenius
elements); GlobalNumberFields layers 0 and 6; NumberFieldArithmetic layer 4. **Consumed by:** AA.3,
AA.5, AutomorphicFormsOnReductiveGroups AF.3, BorelRegulators R.1, R.6 and R.7, Polylogarithms P.2,
AnalyticNumberTheory AN.8, EndoscopicTransfer ET.1, GeometryOfNumbers GN.3 and GN.4.

**Planets:** Harish-Chandra map H_G (`AA.2/log-height`); Norm-one subgroup G(A)^1 (`AA.2/norm-one-subgroup`); Split-centre decomposition (`AA.2/split-centre-decomposition`); Weil quotient integration formula (`AA.2/quotient-measure`); Tamagawa measure (`AA.2/tamagawa-measure`); Tamagawa number (`AA.2/tamagawa-number`).

### AA.2 declarations

#### `AA.2/rational-characters` — F-rational characters (definition)

X*_F(G) is the group of homomorphisms G → G_m defined over F, realized as the group-like elements χ ∈ H (Δχ = χ ⊗ χ, ε(χ) = 1) under multiplication; χ acts on points by x ↦ x(χ) ∈ R^×. Equivalently, X*_F(G) is the Galois-fixed subgroup of the geometric character group X*(G_{F̄}).

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated.

*Proof outline:*
1. Group-like elements are units (inverse S(χ)) and form a group.
2. A homomorphism G → G_m is a Hopf map F[T,T⁻¹] → H, determined by the image of T, which is group-like.
3. Galois descent: an F̄-character fixed by Gal(F̄/F) is defined over F.

*Prerequisites:* `mathlib:GroupLike`, `mathlib:GroupLike.instCommGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`.

*API:*
- `RationalCharacter` (constructor): RationalCharacter H := GroupLike F H, a commutative group.
- `RationalCharacter.apply` (data): For χ and a point x : H →ₐ[F] R, χ x := x χ ∈ Rˣ.
- `RationalCharacter.apply_mul` (simp): χ (x * y) = χ x * χ y for the convolution product.
- `RationalCharacter.equivHom` (equivalence): RationalCharacter H ≃* (Hopf maps F[T,T⁻¹] → H).
- `RationalCharacter.toGeometric_injective` (compatibility): Base change to an algebraic closure injects rational characters into the geometric character group (Tau Ceti geometricCharacterGroup), with image the Galois-fixed characters.
- `RationalCharacter.free` (structure): For geometrically connected G, RationalCharacter H is a free abelian group of finite rank.

*Unit tests:*
- `RationalCharacter.gln_det` (computation): For GL_n, RationalCharacter is infinite cyclic generated by det.
- `RationalCharacter.sln_trivial` (degenerate): For SL_n, RationalCharacter is trivial.
- `RationalCharacter.res_norm` (non-example): For E = ℚ(i), the rational characters of Res_{E/ℚ} G_m have rank 1, not the rank 2 of the geometric character group.

*Used by:* AA.2/log-height — the coordinates of H_G; AA.2/norm-one-subgroup — the kernels defining G(𝔸)^1; AA.3/finite-volume — finite volume of G(F)\G(𝔸)^1 for connected G; AA.2/convergence-factors — the Galois module X*(G_{F̄}) defining convergence factors.

*Acceptance:* X*_F(GL_n) = ℤ·det. X*_F(SL_n) = 0. For E/F quadratic, X*_F(Res_{E/F} G_m) = ℤ·N_{E/F} while X*(Res G_m ⊗ F̄) = ℤ².

*Sources:* arthur-trace-intro, §3, p. 16; borel-1963, §1.3, p. 7.

#### `AA.2/rational-characters-free` — Rational characters form a lattice (lemma)

For geometrically connected G, X*_F(G) is a free abelian group of finite rank. For connected reductive G, restriction of F-rational characters to the identity component of the centre is injective with finite cokernel (Borel 5.9).

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

*Proof outline:*
1. X*(G_{F̄}) is torsion free (Tau Ceti isMulTorsionFree_geometricCharacterGroup) and finitely generated, since characters factor through the torus G/[G,G]·R_u(G) over F̄.
2. A subgroup of a finitely generated free abelian group is free of finite rank.
3. For reductive G, restriction to the radical (connected centre) has finite kernel and cokernel because G is isogenous to Z° × G^der and G^der has no characters (Borel 5.9).

*Prerequisites:* `AA.2/rational-characters`, `tauceti:TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup`.

*Acceptance:* For GL_n, restriction of det to scalars is z ↦ zⁿ, with cokernel ℤ/n.

*Sources:* borel-1963, Lemma 5.9, p. 22; arthur-trace-intro, §5, p. 24.

#### `AA.2/real-character-space` — The real vector space a_G (definition)

a_G = Hom_ℤ(X*_F(G), ℝ), a finite-dimensional real vector space, with dual a_G^* = X*_F(G) ⊗_ℤ ℝ and complexification a_{G,ℂ}^* = X*_F(G) ⊗ ℂ. A homomorphism G → G′ induces a linear map a_G → a_{G′}.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

*Proof outline:*
1. Define as the dual of the lattice of rational-characters-free; functoriality by pulling back characters.

*Prerequisites:* `AA.2/rational-characters`, `AA.2/rational-characters-free`.

*API:*
- `RealCharacterSpace` (constructor): RealCharacterSpace H := Module.Dual ℤ (RationalCharacter H) ⊗ ℝ, written a_G.
- `RealCharacterSpace.pairing` (data): The pairing a_G × X*_F(G) → ℝ.
- `RealCharacterSpace.finrank` (characterisation): finrank ℝ a_G = rank of X*_F(G).
- `RealCharacterSpace.map` (functoriality): A Hopf map gives a linear map a_G → a_{G′}, with map_id and map_comp.

*Unit tests:*
- `RealCharacterSpace.gln_finrank` (computation): finrank ℝ a_{GL_n} = 1.
- `RealCharacterSpace.sln_zero` (degenerate): a_{SL_n} = 0.
- `RealCharacterSpace.res_gm_rank` (non-example): For E = ℚ(i) and G = Res_{E/ℚ} G_m, finrank a_G = 1, not 2.

*Used by:* AA.2/log-height — the target of H_G; AA.3/H-P — a_P = a_{M_P} for parabolics; AutomorphicFormsOnReductiveGroups:AF.3 — exponents of constant terms in a_{P,ℂ}^*.

*Acceptance:* a_{GL_n} ≅ ℝ via ⟨H, det⟩. a_{SL_n} = 0.

*Sources:* arthur-trace-intro, §3, p. 16.

#### `AA.2/log-height` — The Harish-Chandra map H_G (definition)

H_G : G(𝔸_F) → a_G is the continuous homomorphism with ⟨H_G(x), χ⟩ = log ‖χ(x)‖ for χ ∈ X*_F(G), where χ(x) = χ_𝔸(x) ∈ 𝔸_F^× and ‖·‖ is the idele norm ∏_v |·|_v.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

*Proof outline:*
1. Each χ gives a continuous homomorphism χ_𝔸 : G(𝔸) → 𝔸^× (AA.1/adelic-map and gm-adelic); compose with log ‖·‖ (GlobalNumberFields layer 6).
2. Additivity in χ makes x ↦ (χ ↦ log ‖χ(x)‖) an element of a_G.

*Prerequisites:* `AA.2/real-character-space`, `AA.1/adelic-map`, `AA.1/gm-adelic`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `tauceti:TauCeti.GlobalNumberFields.normalizedAbsValue`.

*API:*
- `AdelicPoints.logHeight` (constructor): logHeight : AdelicPoints H →* Multiplicative a_G (an additive map to a_G).
- `AdelicPoints.logHeight_apply` (simp): ⟪logHeight x, χ⟫ = Real.log ‖χ x‖.
- `AdelicPoints.continuous_logHeight` (instance): logHeight is continuous.
- `AdelicPoints.logHeight_diagonal` (simp): logHeight (diagonal g) = 0 (product formula).
- `AdelicPoints.logHeight_map` (functoriality): logHeight ∘ map φ = a(φ) ∘ logHeight.
- `AdelicPoints.logHeight_compact` (characterisation): logHeight vanishes on every compact subgroup.

*Unit tests:*
- `AdelicPoints.logHeight_gm` (compatibility): For G = G_m, logHeight is log of the idele norm.
- `AdelicPoints.logHeight_sln` (degenerate): For SL_n, logHeight is identically zero.
- `AdelicPoints.logHeight_not_infinite_only` (non-example): logHeight is not computed from the archimedean component alone: for F = ℚ, the ideles 1 and (p at the place p, 1 elsewhere) have the same archimedean component but norms 1 and p⁻¹.

*Used by:* AA.2/norm-one-subgroup — G(𝔸)^1 = ker H_G; AA.3/H-P — H_P(nmk) = H_{M_P}(m); AA.3/siegel-set-adelic — the chamber condition on H_{P_0}(a); AutomorphicFormsOnReductiveGroups:AF.3 — twists π_λ(x) = π(x)e^{λ(H_G(x))}; AnalyticNumberTheory:AN.8/cubic-adelic-zeta — the GL_2 determinant height in adelic zeta integrals.

*Acceptance:* For G = GL_n, ⟨H_G(x), det⟩ = log |det x|. H_G is trivial on every compact subgroup, in particular on G(𝒪̂) for a model.

*Sources:* arthur-trace-intro, §3, p. 16.

#### `AA.2/log-height-rational` — H_G vanishes on rational points (lemma)

For g ∈ G(F), H_G(g) = 0.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated.

*Proof outline:*
1. χ(g) ∈ F^× and ‖a‖ = 1 for a ∈ F^× by the product formula (Tau Ceti finprod_normalizedAbsValue_eq_one, Mathlib prod_abs_eq_one).

*Prerequisites:* `AA.2/log-height`, `tauceti:TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`, `mathlib:NumberField.prod_abs_eq_one`.

*Acceptance:* For GL_2(ℚ), |det γ|_𝔸 = 1.

*Sources:* arthur-trace-intro, §3, p. 16.

#### `AA.2/norm-one-subgroup` — The norm-one subgroup G(𝔸)^1 (definition)

G(𝔸_F)^1 = ker H_G = ⋂_{χ ∈ X*_F(G)} ker ‖χ‖, a closed normal subgroup of G(𝔸_F) containing G(F), every compact subgroup and the commutator subgroup.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

*Proof outline:*
1. Kernel of a continuous homomorphism to an abelian Hausdorff group.
2. Containment of G(F): log-height-rational; of compact subgroups: their image in ℝ is a compact subgroup, hence 0.

*Prerequisites:* `AA.2/log-height`, `AA.2/log-height-rational`.

*API:*
- `AdelicPoints.normOne` (constructor): normOne H : Subgroup (AdelicPoints H) := logHeight.ker.
- `AdelicPoints.isClosed_normOne` (instance): normOne is closed.
- `AdelicPoints.normOne_normal` (instance): normOne is normal.
- `AdelicPoints.diagonal_mem_normOne` (simp): diagonal g ∈ normOne.
- `AdelicPoints.mem_normOne_iff` (characterisation): x ∈ normOne iff ‖χ x‖ = 1 for every rational character χ.
- `AdelicPoints.normOne_eq_top_of_no_characters` (example): If X*_F(G) = 0 then normOne = ⊤.

*Unit tests:*
- `AdelicPoints.normOne_gm` (compatibility): For G_m, normOne is the norm-one idele subgroup of GlobalNumberFields layer 6.
- `AdelicPoints.normOne_sl2` (degenerate): For SL_2, normOne = ⊤.
- `AdelicPoints.normOne_not_finite_part` (non-example): normOne is not G(F_∞)^1 × G(𝔸_f): for GL_1(𝔸_ℚ) the idele (p_∞ = p, p_p = p, 1 elsewhere) has norm 1 but its archimedean component has |p|_∞ ≠ 1.

*Used by:* AA.3/finite-volume — G(F)\G(𝔸)^1 has finite volume; AA.3/compactness-criterion — compactness of G(F)\G(𝔸)^1; AA.2/tamagawa-number — τ(G) = vol(G(F)\G(𝔸)^1); AA.5/gl1-adelic-quotient — GL_1(𝔸)^1 = norm-one ideles.

*Acceptance:* GL_n(𝔸)^1 = {x : |det x| = 1}. For SL_n, SL_n(𝔸)^1 = SL_n(𝔸).

*Sources:* arthur-trace-intro, §3, p. 16; borel-1963, §5.8, p. 22.

#### `AA.2/split-centre` — The split component A_G (definition)

Let G₁ = Res_{F/ℚ} G. A_G is the largest ℚ-split torus in the centre of G₁, and A_G(ℝ)^0 ⊂ G₁(ℝ) = G(F ⊗ ℝ) = G(F_∞) ⊂ G(𝔸_F) the identity component of its real points, isomorphic to (ℝ_{>0})^k with k = rank X*_F(G).

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. The centre of G₁ is Res Z; its maximal ℚ-split subtorus exists and is unique.
2. X*_ℚ(G₁) ≅ X*_F(G) (Borel 1.5, Proposition), so dim A_G = rank X*_F(G) by rational-characters-free.

*Prerequisites:* `AA.2/rational-characters`, `AA.2/rational-characters-free`, `AA.1/base-change-adelic`, `AA.1/center-adelic`.

*API:*
- `SplitComponent` (constructor): The subgroup A_G(ℝ)^0 of AdelicPoints H (supported at the archimedean places).
- `SplitComponent.logHeight_equiv` (equivalence): logHeight restricts to an isomorphism of topological groups A_G(ℝ)^0 ≃ a_G.
- `SplitComponent.central` (characterisation): A_G(ℝ)^0 is central in G(𝔸).
- `SplitComponent.inter_normOne` (simp): A_G(ℝ)^0 ∩ G(𝔸)^1 = {1}.

*Unit tests:*
- `SplitComponent.gln_scalars` (computation): For GL_n, a_G is one-dimensional and SplitComponent (the positive real scalars at ∞ for F = ℚ) is homeomorphic to ℝ.
- `SplitComponent.semisimple_trivial` (degenerate): For semisimple G, SplitComponent is trivial.
- `SplitComponent.gm_number_field` (non-example): For G_m over a number field F, a_G and SplitComponent are one-dimensional, whereas (F ⊗ ℝ)^×_{>0} has dimension r₁ + r₂: for F real quadratic the anti-diagonal direction is not split over ℚ.

*Used by:* AA.2/split-centre-decomposition — G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0; AA.3/siegel-set-adelic — A_0(ℝ)^0 in Siegel sets; AutomorphicFormsOnReductiveGroups:AF.3 — the quotient G(F)A_G(ℝ)^0\G(𝔸); ArithmeticLocallySymmetricSpaces:ALS.0 — the split-centre quotient in locally symmetric spaces.

*Acceptance:* For GL_n over ℚ, A_G is the scalar G_m and A_G(ℝ)^0 = ℝ_{>0}·I. For G_m over F ≠ ℚ, A_G(ℝ)^0 = ℝ_{>0} embedded diagonally in (F ⊗ ℝ)^×, not the whole (F ⊗ ℝ)^×_{>0}.

*Sources:* arthur-trace-intro, §3, pp. 15–16; borel-1963, §1.5, Proposition, p. 8.

#### `AA.2/log-height-split-centre-iso` — H_G on the split centre (lemma)

The restriction of H_G to A_G(ℝ)^0 is an isomorphism of topological groups onto a_G; in particular H_G is surjective.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Restriction X*_F(G) ≅ X*_ℚ(G₁) → X*_ℚ(A_G) is injective with finite cokernel (rational-characters-free, Arthur (5.1)).
2. On A_G(ℝ)^0 ≅ (ℝ_{>0})^k, H_G is log of the restricted characters, a linear isomorphism after tensoring with ℝ.

*Prerequisites:* `AA.2/split-centre`, `AA.2/log-height`, `AA.2/rational-characters-free`.

*Acceptance:* For GL_n over ℚ, H_G(r·I) = n log r.

*Sources:* arthur-trace-intro, (5.1), p. 24.

#### `AA.2/split-centre-decomposition` — G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0 (theorem)

Multiplication G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F) is an isomorphism of topological groups.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. A_G(ℝ)^0 is central and closed; injectivity from SplitComponent.inter_normOne; surjectivity: for x choose a ∈ A_G(ℝ)^0 with H_G(a) = H_G(x) (log-height-split-centre-iso), then x a⁻¹ ∈ G(𝔸)^1.
2. Continuity of the inverse x ↦ (x a(x)⁻¹, a(x)) with a(x) = (H_G|_{A_G})⁻¹(H_G(x)).

*Prerequisites:* `AA.2/log-height-split-centre-iso`, `AA.2/norm-one-subgroup`, `AA.2/split-centre`.

*Acceptance:* GL_n(𝔸) = GL_n(𝔸)^1 × ℝ_{>0}.

*Sources:* arthur-trace-intro, §3, p. 16.

#### `AA.2/quotient-norm-one-comparison` — Two normalizations of the quotient (theorem)

The inclusion G(𝔸_F)^1 → G(𝔸_F) induces a homeomorphism G(F)\G(𝔸_F)^1 ≃ G(F)\G(𝔸_F)/A_G(ℝ)^0, equivariant for G(𝔸_F)^1 acting on the right; it is a theorem, not a definitional identity, and it fails if A_G(ℝ)^0 is replaced by a larger central subgroup such as Z(F_∞)^0.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Apply split-centre-decomposition; G(F) ⊂ G(𝔸)^1 commutes with the central factor.
2. Counterexample for the larger subgroup: G = G_m over a real quadratic field F: F^×\𝔸^1 is compact of dimension 1 at infinity mod units, while F^×\𝔸^×/(F ⊗ ℝ)^×_{>0} is the finite narrow class group.

*Prerequisites:* `AA.2/split-centre-decomposition`, `AA.1/rational-points-discrete`.

*Acceptance:* For GL_1 over ℚ: ℚ^×\𝔸^1 ≃ ℚ^×\𝔸^×/ℝ_{>0} ≃ ℤ̂^×.

*Sources:* arthur-trace-intro, §6, p. 30.

#### `AA.2/modulus-character` — Modulus character of a parabolic (definition)

For an F-parabolic P = M_P N_P of G (or any F-group with a normal unipotent F-subgroup N), δ_P : P(𝔸_F) → ℝ_{>0} is δ_P(p) = ‖det(Ad(p) | Lie N_P)‖, the idele norm of the determinant of the adjoint action on Lie N_P ⊗ 𝔸_F. It factors as ∏_v δ_{P,v}, is trivial on N_P(𝔸) and P(F), and δ_P(p) = e^{⟨2ρ_P, H_P(p)⟩}.

*Hypotheses:* F a number field; G a connected reductive group over F; P an F-parabolic with unipotent radical N_P (Tau Ceti dynamic parabolic P(λ) for an F-cocharacter λ).

*Proof outline:*
1. det ∘ Ad|_{Lie N} is an F-rational character of P; compose with the idele norm (log-height).
2. Trivial on P(F) by the product formula; trivial on N_P since unipotent elements act unipotently.
3. The formula with ρ_P: decompose Lie N_P into A_P-root spaces (Arthur §5).

*Prerequisites:* `AA.2/rational-characters`, `AA.2/log-height`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.unipotent`, `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`, `tauceti:Derivation.adjointPointRepresentation`.

*API:*
- `Parabolic.modulus` (constructor): Parabolic.modulus P : P(𝔸) →* ℝ≥0, p ↦ ‖det (Ad p | Lie N_P)‖.
- `Parabolic.modulus_apply_local` (simp): modulus p = ∏ᶠ v, |det(Ad p_v | Lie N_P ⊗ F_v)|_v.
- `Parabolic.modulus_rational` (simp): modulus (diagonal p) = 1 for p ∈ P(F).
- `Parabolic.modulus_unipotent` (simp): modulus n = 1 for n ∈ N_P(𝔸).
- `Parabolic.modulus_eq_exp_rho` (characterisation): modulus p = exp ⟨2ρ_P, H_P p⟩.

*Unit tests:*
- `Parabolic.modulus_borel_gl2` (computation): For the Borel of GL_2, modulus (diag(a,d) * n) = ‖a/d‖.
- `Parabolic.modulus_top` (degenerate): For P = G, modulus = 1.
- `Parabolic.modulus_not_det` (non-example): For the Borel of GL_2, modulus ≠ ‖det‖: at diag(a,1) with ‖a‖ = 2 both equal 2, but at diag(1,d) with ‖d‖ = 2, modulus = 1/2 while ‖det‖ = 2.

*Used by:* AA.2/modular-function-parabolic — the modular function of P(𝔸); AA.3/adelic-iwasawa — the Iwasawa integration formula ∫_G f = ∫_K ∫_{P} f(pk) δ_P(p)^{-1} d_ℓp dk; AutomorphicSpectralTheory:AS.1 — normalized induction from P(𝔸); AutomorphicFormsOnReductiveGroups:AF.3 — constant terms along P.

*Acceptance:* For the upper triangular Borel B ⊂ GL_2, δ_B(diag(a,d)n) = |a/d|. For P = G, δ_G = 1.

*Sources:* arthur-trace-intro, §5, p. 25.

#### `AA.2/modular-function-parabolic` — Modular function of P(𝔸) (theorem)

In Mathlib's convention (map (· * p) μ = Δ(p) • μ for a left Haar μ), the modular character of P(𝔸_F) is δ_P; in particular P(𝔸_F) is not unimodular unless P = G, and dℓp = δ_P(p) d_r p.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. P(𝔸) = M_P(𝔸) ⋉ N_P(𝔸) (Tau Ceti Levi decomposition on points, AA.1/closed-subgroup-adelic); M_P(𝔸) and N_P(𝔸) are unimodular (AA.1/unimodular-reductive; N_P(𝔸) is unimodular as a restricted product of unipotent groups).
2. For a semidirect product M ⋉ N, right translation by m scales the Haar measure of N by the modulus of conjugation, which on N(F_v) is |det Ad(m)|_{Lie N}|_v.
3. Multiply over places.

*Prerequisites:* `AA.2/modulus-character`, `AA.1/unimodular-reductive`, `AA.1/closed-subgroup-adelic`, `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`, `mathlib:MeasureTheory.Measure.modularCharacter`.

*Acceptance:* For the Borel B ⊂ GL_2 over ℚ_p: map (· * diag(a,d)) μ = |a/d|_p μ.

*Sources:* arthur-trace-intro, §5, p. 25.

#### `AA.2/quotient-measure` — Invariant measure on a coset space (construction)

Let G be a second countable locally compact group, H ≤ G a closed subgroup with Δ_G|_H = Δ_H, and dg, dh left Haar measures. There is a unique G-invariant Radon measure dġ on the right coset space H\G with ∫_G f(g) dg = ∫_{H\G} ∫_H f(hg) dh dġ for every f ∈ C_c(G).

*Hypotheses:* G second countable locally compact Hausdorff group; H closed subgroup; Δ_G restricted to H equals Δ_H.

*Proof outline:*
1. The map P : C_c(G) → C_c(H\G), Pf(Hg) = ∫_H f(hg) dh, is surjective (Bruhat function).
2. Define the functional Pf ↦ ∫_G f dg; it is well defined because ∫_G f dg = 0 whenever Pf = 0, using Δ_G|_H = Δ_H.
3. Apply the Riesz representation theorem (as in Mathlib's TopologicalGroup.IsSES.inducedMeasure for the normal case); invariance and uniqueness from those of dg.

*Prerequisites:* `mathlib:TopologicalGroup.IsSES.inducedMeasure`, `mathlib:TopologicalGroup.IsSES.integral_inducedMeasure`, `mathlib:MeasureTheory.Measure.modularCharacter`, `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `AA.2/bruhat-section`, `AA.2/quotient-functional-well-defined`.

*API:*
- `QuotientMeasure.measure` (constructor): The measure on H\G given dg, dh and the modular condition.
- `QuotientMeasure.integral_eq` (characterisation): ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ for f ∈ C_c(G).
- `QuotientMeasure.invariant` (instance): The measure is invariant under the right action of G.
- `QuotientMeasure.unique` (extensionality): Any G-invariant Radon measure on H\G is a scalar multiple.
- `QuotientMeasure.smul_left` (relation): Replacing dh by c • dh replaces dġ by c⁻¹ • dġ.

*Unit tests:*
- `QuotientMeasure.trivial_subgroup` (degenerate): For H = ⊥, the measure on G is dg.
- `QuotientMeasure.z_in_r` (computation): For G = ℝ, H = ℤ with counting measure, ℤ\ℝ has volume 1.
- `QuotientMeasure.borel_no_invariant` (non-example): For G = SL_2(ℝ) and H the upper triangular Borel, Δ_G|_H ≠ Δ_H and H\G = ℙ¹(ℝ) carries no SL_2(ℝ)-invariant Radon measure.

*Used by:* AA.2/automorphic-quotient-measure — the measure on G(F)\G(𝔸)^1; EndoscopicTransferAndUnitaryTraceComparison:ET.1 — measures on centralizer quotients G_γ(𝔸)\G(𝔸) in orbital integrals; GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value — quotient integration on SL_n(ℝ)/SL_n(ℤ); AA.3/adelic-iwasawa — measures on P(𝔸)\G(𝔸).

*Acceptance:* For H normal it agrees with the Haar measure on G/H from IsSES.inducedMeasure. For H = G(F) discrete it is the measure of discrete-quotient-fundamental-domain.

*Sources:* arthur-trace-intro, §1, p. 7; borel-1963, §5.6, p. 21.

#### `AA.2/quotient-integral-integrable` — Weil's formula for integrable functions (theorem)

In the setting of quotient-measure, for f ∈ L¹(G), the function h ↦ f(hg) is integrable on H for almost every Hg, the function Hg ↦ ∫_H f(hg) dh is integrable on H\G, and ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ.

*Hypotheses:* as in quotient-measure.

*Proof outline:*
1. Prove it for nonnegative lower semicontinuous f as a supremum of C_c functions (monotone convergence on both sides).
2. Extend to nonnegative measurable f by outer regularity, and to integrable f by splitting into positive and negative parts; finiteness of the inner integral a.e. follows from Tonelli.

*Prerequisites:* `AA.2/quotient-measure`.

*Acceptance:* For indicator functions of compact sets the formula computes vol(K) through the fibres.

*Sources:* arthur-trace-intro, §1, p. 9.

#### `AA.2/quotient-measure-transitivity` — Quotient measures in stages (lemma)

For closed subgroups H₁ ≤ H₂ ≤ G satisfying the modular conditions, the quotient measure on H₁\G is the product of those on H₂\G and H₁\H₂: ∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg) dh dg.

*Hypotheses:* G, H₂, H₁ as stated.

*Proof outline:*
1. Apply quotient-measure twice and compare on C_c(G) using uniqueness.

*Prerequisites:* `AA.2/quotient-measure`, `AA.2/quotient-integral-integrable`.

*Acceptance:* For Γ ⊂ G(𝔸)^1 ⊂ G(𝔸): vol(Γ\G(𝔸))-type integrals split as in quotient-norm-one-comparison.

*Sources:* arthur-trace-intro, §1, p. 9.

#### `AA.2/discrete-quotient-fundamental-domain` — Fundamental domains for rational points (lemma)

G(F) acting on G(𝔸_F) (or G(𝔸_F)^1) by left translation admits a Borel fundamental domain; the quotient measure on G(F)\G(𝔸_F) equals the pushforward of the restriction of Haar measure to any measurable fundamental domain, and does not depend on the choice.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated.

*Proof outline:*
1. G(F) is a countable discrete subgroup (AA.1/rational-points-discrete; F countable) of the second countable locally compact G(𝔸) (AA.1/adelic-points-locally-compact); a Borel fundamental domain exists by choosing a countable cover by open sets injecting into the quotient.
2. Independence: MeasureTheory.IsFundamentalDomain.measure_eq; identification with quotient-measure via QuotientMeasureEqMeasurePreimage and the unfolding lemma.

*Prerequisites:* `AA.1/rational-points-discrete`, `AA.1/adelic-points-locally-compact`, `mathlib:MeasureTheory.IsFundamentalDomain.measure_eq`, `mathlib:MeasureTheory.QuotientMeasureEqMeasurePreimage`, `mathlib:QuotientGroup.integral_eq_integral_automorphize`, `AA.2/quotient-measure`, `AA.2/fundamental-domain-exists`.

*Acceptance:* For ℤ ⊂ ℝ any interval [a, a+1) is a fundamental domain of measure 1.

*Sources:* borel-1963, Definition 4.1, p. 17.

#### `AA.2/automorphic-quotient-measure` — The measure on the automorphic quotient (construction)

For connected reductive G with a Haar measure dx on G(𝔸_F) and Lebesgue measure on a_G (normalized by the lattice dual to X*_F(G)), the measure on [G]^1 = G(F)\G(𝔸_F)^1 is the quotient (quotient-measure) of the measure on G(𝔸)^1 induced via split-centre-decomposition, and the measure on G(F)A_G(ℝ)^0\G(𝔸_F) is its transport by quotient-norm-one-comparison.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Transport dx along G(𝔸) ≅ G(𝔸)^1 × A_G(ℝ)^0 ≅ G(𝔸)^1 × a_G and divide by Lebesgue measure.
2. Take the quotient by the counting measure on G(F) (unimodularity: AA.1/unimodular-reductive and Borel 5.8).

*Prerequisites:* `AA.2/split-centre-decomposition`, `AA.2/quotient-measure`, `AA.2/discrete-quotient-fundamental-domain`, `AA.1/unimodular-reductive`, `AA.2/quotient-norm-one-comparison`.

*API:*
- `AutomorphicQuotient.measure` (constructor): The measure on G(F)\G(𝔸)^1 attached to dx.
- `AutomorphicQuotient.measure_split` (equivalence): Its transport to G(F)A_G(ℝ)^0\G(𝔸).
- `AutomorphicQuotient.invariant` (instance): Right G(𝔸)^1-invariance.
- `AutomorphicQuotient.smul_haar` (relation): Scaling dx by c scales the quotient measure by c.

*Unit tests:*
- `AutomorphicQuotient.semisimple` (degenerate): For G without rational characters (for instance semisimple G), G(𝔸)^1 = G(𝔸), so the measure lives on G(F)\G(𝔸).
- `AutomorphicQuotient.gl1_rat` (computation): For GL_1 over ℚ with ideleHaar, the quotient ℚ^×\𝔸^1 ≃ ℤ̂^× has volume 1 (ideleHaar(ℤ̂^×) = 1).
- `AutomorphicQuotient.not_full_quotient` (non-example): For GL_1, the norm-one quotient has finite volume while the split component ℝ_{>0} is not compact, so ℚ^×\𝔸^× has infinite volume.

*Used by:* AA.3/finite-volume — finiteness of vol([G]^1); AA.2/central-character-l2 — the Hilbert space carrier; AutomorphicFormsOnReductiveGroups:AF.3 — one quotient-measure and Hilbert carrier (RS-04 link AA.2 → AF.3); BorelRegulators:R.1 — one quotient/Tamagawa measure supplier; Polylogarithms:P.2 — the generic measure for Bloch–Borel volume identities; AnalyticNumberTheory:AN.8/cubic-adelic-zeta — GL_2 adelic quotient measure for the binary cubic zeta integral.

*Acceptance:* For GL_1 over ℚ with idele-haar, ℚ^×\𝔸^1 ≅ ℤ̂^× has volume 1 (AA.5/gl1-adelic-quotient). Changing dx by c changes the quotient measure by c.

*Sources:* borel-1963, Theorem 5.8, p. 22.

#### `AA.2/central-character-l2` — L² space with a unitary central character (construction)

Let 𝔛 ⊂ Z(𝔸_F) be a closed subgroup such that 𝔛Z(F) is closed, and ω a unitary character of 𝔛 trivial on 𝔛 ∩ Z(F). L²(G(F)\G(𝔸_F), ω) is the Hilbert space of (classes of) measurable φ on G(𝔸) with φ(γ z g) = ω(z) φ(g) for γ ∈ G(F), z ∈ 𝔛, and ∫_{𝔛G(F)\G(𝔸)} |φ|² < ∞, with right translation R a unitary representation of G(𝔸) on which 𝔛 acts by ω.

*Hypotheses:* F a number field; G a connected reductive group over F; 𝔛, ω as stated.

*Proof outline:*
1. |φ|² is left 𝔛G(F)-invariant, so its integral over the quotient (quotient-measure, quotient-integral-integrable) makes sense.
2. Completeness: identify with L² of a measurable fundamental domain (discrete-quotient-fundamental-domain) for 𝔛G(F).
3. Right translation preserves the norm by invariance of the quotient measure; strong continuity by density of C_c functions.

*Prerequisites:* `AA.2/quotient-measure`, `AA.2/quotient-integral-integrable`, `AA.2/discrete-quotient-fundamental-domain`, `AA.1/center-adelic`, `mathlib:MeasureTheory.Lp`, `AA.2/automorphic-quotient-measure`.

*API:*
- `CentralCharL2` (constructor): CentralCharL2 𝔛 ω, a Hilbert space.
- `CentralCharL2.rightReg` (data): The unitary representation of G(𝔸) by right translation.
- `CentralCharL2.rightReg_central` (simp): rightReg z = ω z • id for z ∈ 𝔛.
- `CentralCharL2.inner_def` (characterisation): ⟪φ, ψ⟫ = ∫_{𝔛G(F)\G(𝔸)} φ · conj ψ.
- `CentralCharL2.continuous_rightReg` (instance): rightReg is strongly continuous.

*Unit tests:*
- `CentralCharL2.trivial_X` (degenerate): For 𝔛 = 1 it is L²(G(F)\G(𝔸)).
- `CentralCharL2.gl1_dim` (computation): For GL_1 and 𝔛 = 𝔸^×, it is one-dimensional iff ω is trivial on F^×.
- `CentralCharL2.nontrivial_on_rational` (non-example): If ω is nontrivial on 𝔛 ∩ Z(F) the space is zero.

*Used by:* AutomorphicFormsOnReductiveGroups:AF.3 — the Hilbert carrier for cusp forms with central character; GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing — L² action normalization (request from GN); AutomorphicSpectralTheory:AS.1 — the spectral decomposition of L².

*Acceptance:* For 𝔛 = A_G(ℝ)^0 and ω = 1 it is L²(G(F)\G(𝔸)^1) (central-quotient-change). For G = GL_1 and 𝔛 = Z(𝔸) = G(𝔸) it is one-dimensional when ω is trivial on F^×, and zero otherwise.

*Sources:* arthur-trace-intro, §1, p. 7.

#### `AA.2/central-quotient-change` — Change of central quotient (theorem)

Let 𝔛′ ⊂ 𝔛 ⊂ Z(𝔸_F) be as in central-character-l2 with 𝔛′Z(F)\𝔛Z(F) compact, and ω′ a unitary character of 𝔛′. Then L²(G(F)\G(𝔸), ω′) is the Hilbert direct sum of the subspaces L²(G(F)\G(𝔸), ω) over the unitary characters ω of 𝔛 trivial on 𝔛 ∩ Z(F) and restricting to ω′, each being the ω-isotypic part for 𝔛. In particular L²(G(F)A_G(ℝ)^0\G(𝔸)) ≅ L²(G(F)\G(𝔸)^1) unitarily and G(𝔸)^1-equivariantly.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. The compact abelian group C = 𝔛′Z(F)\𝔛Z(F) acts unitarily on L²(…, ω′) by right translation (central elements).
2. Peter–Weyl for compact abelian groups decomposes into isotypic components indexed by characters of C; each is L²(…, ω).
3. The last statement follows from quotient-norm-one-comparison and transitivity of quotient measures.

*Prerequisites:* `AA.2/central-character-l2`, `AA.2/quotient-norm-one-comparison`, `AA.2/quotient-measure-transitivity`.

*Acceptance:* For GL_1 over ℚ, 𝔛′ = ℝ_{>0}, 𝔛 = 𝔸^×: L²(ℚ^×ℝ_{>0}\𝔸^×) = ⊕ over Dirichlet characters of one-dimensional spaces.

*Sources:* arthur-trace-intro, §3, p. 16.

#### `AA.2/invariant-top-form` — Invariant top-degree forms (definition)

For a smooth affine algebraic group G of dimension d over a field k with coordinate Hopf algebra H, the space of left-invariant top-degree differential forms is ω_G = ∧^d_k (𝔪_ε/𝔪_ε²), the top exterior power of the cotangent space at the identity; it is a one-dimensional k-vector space, and a nonzero ω ∈ ω_G is a gauge form. Right translation by g acts on ω_G by det(Ad(g))⁻¹.

*Hypotheses:* k a field; G smooth affine of dimension d.

*Proof outline:*
1. The cotangent space at the identity is Tau Ceti's Bialgebra.CotangentSpace, of dimension d for smooth G.
2. Left translation identifies invariant forms with their value at the identity; right translation acts through the coadjoint action, whose determinant on ∧^d is det(Ad)⁻¹.

*Prerequisites:* `tauceti:TauCeti.Bialgebra.CotangentSpace`, `tauceti:Derivation.adjointPointRepresentation`.

*API:*
- `GaugeForm` (constructor): GaugeForm H := ExteriorAlgebra.ιMulti over Bialgebra.CotangentSpace F H in degree d; finrank 1.
- `GaugeForm.finrank_eq_one` (characterisation): For smooth G, finrank k (GaugeForm H) = 1.
- `GaugeForm.baseChange` (functoriality): GaugeForm commutes with base change k → k′.
- `GaugeForm.rightTranslate` (relation): Right translation by g acts on GaugeForm by det(Ad g)⁻¹.

*Unit tests:*
- `GaugeForm.gm` (computation): For G_m the cotangent space at 1 is one-dimensional, spanned by the class of T − 1, so GaugeForm is spanned by dT/T.
- `GaugeForm.trivial_group` (degenerate): For the trivial group (d = 0), GaugeForm = k.
- `GaugeForm.borel_not_biinvariant` (non-example): For the Borel of GL_2, a left-invariant gauge form is not right-invariant: right translation by diag(a,d) multiplies it by (a/d)⁻¹ up to the sign convention.

*Used by:* AA.2/local-form-measure — the local Haar measures |ω|_v; AA.2/tamagawa-measure — the global gauge form; BorelRegulators:R.6/local-sl-volume — canonical differential-form local measures (request from R.6).

*Acceptance:* For G_m, ω_G = k·dT/T. For G_a, ω_G = k·dT.

*Sources:* rosengarten-tamagawa, §1, p. 2.

#### `AA.2/local-form-measure` — The Haar measure |ω|_v of a gauge form (construction)

For a smooth affine group G over a local field F_v of characteristic 0 with gauge form ω and the standard Haar measure on F_v (𝒪_v of volume 1; Lebesgue on ℝ; twice Lebesgue on ℂ), |ω|_v is the left Haar measure on G(F_v) given in any F_v-analytic chart φ : U → G(F_v), U ⊂ F_v^d open, by |f(x)|_v dx_1 ⋯ dx_d where φ^*ω = f dx_1 ∧ ⋯ ∧ dx_d.

*Hypotheses:* F_v a local field of characteristic 0; G smooth affine over F_v; ω a gauge form.

*Proof outline:*
1. G(F_v) is an F_v-analytic manifold (inverse function theorem over the complete field F_v) and ω an invariant analytic top form.
2. Charts glue because of the change-of-variables formula |det Dψ|_v for F_v-analytic diffeomorphisms ψ (recorded gap in the nonarchimedean case).
3. Left invariance of ω gives a left Haar measure.

*Prerequisites:* `AA.2/invariant-top-form`, `ReductiveGroupsPartII:RG2.0`.

*API:*
- `GaugeForm.localMeasure` (constructor): The Haar measure |ω|_v on G(F_v).
- `GaugeForm.localMeasure_isHaar` (instance): |ω|_v is a left Haar measure.
- `GaugeForm.localMeasure_smul` (relation): |c ω|_v = |c|_v • |ω|_v.
- `GaugeForm.localMeasure_rightTranslate` (relation): map (· * g) |ω|_v = |det Ad g|_v⁻¹ • |ω|_v (sign convention as in modular-function-parabolic).

*Unit tests:*
- `GaugeForm.localMeasure_ga` (compatibility): For G_a with coordinate T, the image of localMeasure dT under x ↦ x(T) is the standard Haar measure of F_v (𝒪_v of volume 1).
- `GaugeForm.localMeasure_gm_units` (computation): For G_m at a finite place, localMeasure (dT/T) (𝒪_v^×) = 1 - q_v⁻¹.
- `GaugeForm.localMeasure_not_normalized` (non-example): localMeasure (dT/T) on ℚ_p^× is not the normalized idele measure of AA.0/idele-haar: they differ by the factor 1 − p⁻¹ ≠ 1.

*Used by:* AA.2/tamagawa-measure — the local factors; AA.2/weil-volume-formula — volumes of integral points; BorelRegulators:R.6/local-sl-volume — local SL volumes; AA.0/tamagawa-convergence-failure — the G_m form measures.

*Acceptance:* For G_a and ω = dT, |ω|_v is the standard measure. For G_m and ω = dT/T at a finite place, |ω|_v(𝒪_v^×) = 1 - q_v⁻¹.

*Sources:* rosengarten-tamagawa, §1, p. 2; borel-1963, §5.5, p. 21.

#### `AA.2/weil-volume-formula` — Weil's volume formula for integral points (theorem)

Let 𝓗 be a smooth affine group scheme of relative dimension d over 𝒪_v with residue field k_v of order q_v, and ω a gauge form of the generic fibre that extends to a generator of the invariant top forms of 𝓗. Then |ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) · q_v^{-d}.

*Hypotheses:* 𝓗 smooth affine over 𝒪_v; ω extends to a generator over 𝒪_v.

*Proof outline:*
1. Reduction 𝓗(𝒪_v) → 𝓗(k_v) is surjective by Hensel's lemma for smooth schemes.
2. Each fibre is a coset of the first congruence subgroup, which in coordinates adapted to ω is the polydisc (π_v𝒪_v)^d of measure q_v^{-d}, with |f|_v = 1 there.

*Prerequisites:* `AA.2/local-form-measure`, `AA.1/integral-model`, `AA.1/integral-points-level`.

*Acceptance:* For GL_n over ℤ_p: vol(GL_n(ℤ_p)) = #GL_n(𝔽_p) p^{-n²} = ∏_{i=1}^n (1 - p^{-i}). For G_m: 1 - p⁻¹.

*Sources:* rosengarten-tamagawa, §3, p. 25.

#### `AA.2/convergence-factors` — Convergence factors from the character module (construction)

Let X = X*(G_{F̄}) ⊗ ℂ with its continuous finite-image Galois action. For a finite place v, L_v(X, s) = det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹, and the convergence factors are λ_v = L_v(X, 1) at finite v and λ_v = 1 at infinite v. The partial Euler product L^S(X, s) = ∏_{v∉S} L_v(X, s) converges for Re s > 1, and ρ_G = lim_{s→1⁺} (s - 1)^r L^S(X, s) · ∏_{v∈S, v finite} L_v(X, s) with r = rank X*_F(G), whenever this limit exists and is nonzero.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G connected.

*Proof outline:*
1. The Galois action on the character lattice factors through a finite quotient Gal(E/F), E a splitting field (Tau Ceti geometricCharacterGroup with its continuous Galois action).
2. Frobenius at unramified v (Chebotarev roadmap) gives the local factor.
3. When the action is trivial (G with split characters, e.g. GL_n or split tori), L(X, s) = ζ_F(s)^r and ρ_G = (Res_{s=1} ζ_F)^r (Mathlib dedekindZeta_residue).

*Prerequisites:* `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`, `AA.2/rational-characters`, `mathlib:NumberField.dedekindZeta_residue`, `mathlib:NumberField.dedekindZeta_residue_pos`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`.

*API:*
- `Tamagawa.localFactor` (constructor): localFactor v s := det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹.
- `Tamagawa.localFactor_trivial` (simp): If Gal acts trivially on X of rank r, localFactor v s = (1 - q_v^{-s})^{-r}.
- `Tamagawa.leadingCoeff` (data): ρ_G, defined when the limit exists.
- `Tamagawa.leadingCoeff_split` (example): For split characters of rank r, ρ_G = (dedekindZeta_residue F)^r.

*Unit tests:*
- `Tamagawa.localFactor_gm` (computation): For G_m, localFactor v 1 = (1 - q_v⁻¹)⁻¹.
- `Tamagawa.localFactor_semisimple` (degenerate): For semisimple G (for instance SL_n), X = 0 and localFactor v s = 1.
- `Tamagawa.localFactor_res_gm` (non-example): For G = Res_{E/ℚ} G_m with E = ℚ(i), localFactor p 1 = (1 - p⁻¹)⁻¹(1 - χ₄(p)p⁻¹)⁻¹, not (1 - p⁻¹)⁻¹: the inert primes see the nontrivial character.

*Used by:* AA.2/tamagawa-measure — the factors λ_v and the normalizing constant ρ_G; AA.0/tamagawa-convergence-failure — λ_p = (1 - p⁻¹)⁻¹ for G_m.

*Acceptance:* For GL_n, λ_v = (1 - q_v⁻¹)⁻¹ and ρ_G = Res_{s=1} ζ_F. For SL_n, λ_v = 1 and ρ_G = 1.

*Sources:* rosengarten-tamagawa, §3, p. 25; rosengarten-tamagawa, §1, p. 2.

#### `AA.2/tamagawa-measure` — Tamagawa measure (construction)

For a connected affine group G over F of dimension d with gauge form ω, the Tamagawa measure is τ_G = |d_F|^{-d/2} ρ_G^{-1} ∏ʳ_v λ_v |ω|_v on G(𝔸_F), the restricted product (AA.0) of the corrected local measures λ_v|ω|_v, whose volumes λ_v · #𝓗(k_v) · q_v^{-d} on the integral points of a model have an absolutely convergent product; for X*_F(G) = 0 it is |d_F|^{-d/2} ∏ʳ_v |ω|_v.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G connected; ρ_G exists (convergence-factors).

*Proof outline:*
1. Choose an integral model; for almost all v the corrected volumes λ_v #𝓗(k_v) q_v^{-d} have a convergent product (tamagawa-convergence).
2. Renormalize finitely many local factors to volume 1 and apply AA.0/restricted-haar-product, then multiply by the convergent product of the volumes (AA.0/restricted-haar-rescale extended to absolutely convergent infinite products).
3. The result is a left Haar measure on G(𝔸).

*Prerequisites:* `AA.2/convergence-factors`, `AA.2/local-form-measure`, `AA.2/weil-volume-formula`, `AA.0/restricted-haar-product`, `AA.0/restricted-haar-rescale`, `AA.0/tamagawa-convergence-failure`.

*API:*
- `Tamagawa.measure` (constructor): Tamagawa.measure G : Measure (AdelicPoints H).
- `Tamagawa.measure_isHaar` (instance): Tamagawa.measure is a left Haar measure.
- `Tamagawa.measure_eq_product` (characterisation): On a product of finitely many local sets and almost all 𝓗(𝒪_v) it is |d_F|^{-d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v).
- `Tamagawa.measure_ga` (example): For G_a it is |d_F|^{-1/2} • adeleHaar.
- `Tamagawa.measure_res` (functoriality): Compatibility with restriction of scalars (tamagawa-restriction-scalars).

*Unit tests:*
- `Tamagawa.measure_ga_selfdual` (computation): For G_a over ℚ, Tamagawa.measure (ℚ\𝔸 fundamental domain [0,1) × ℤ̂) = 1.
- `Tamagawa.measure_trivial` (degenerate): For the trivial group it is the Dirac measure of mass 1.
- `Tamagawa.measure_not_naive_product` (non-example): For G_m the naive product ∏ |dT/T|_p is not a measure on 𝔸^×: the volumes 1 − p⁻¹ have product 0 because Σ_p 1/p diverges; Tamagawa.measure uses λ_v = (1 − q_v⁻¹)⁻¹ and ρ = Res ζ_F.

*Used by:* AA.2/tamagawa-number — τ(G); BorelRegulators:R.6/norm-one-tamagawa — canonical Tamagawa measure of SL_1(D) with |D_F|^{-dim/2} (request from R.6); BorelRegulators:R.7 — measure normalization when comparing regulator conventions; GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity — Siegel–Weil mass via Tamagawa measures.

*Acceptance:* For G_a, τ = |d_F|^{-1/2} adeleHaar. For G_m over ℚ, τ restricted to 𝔸^1 gives vol(ℚ^×\𝔸^1) = 1 (Tate).

*Sources:* rosengarten-tamagawa, §3, p. 25; borel-1963, §5.5, p. 21.

#### `AA.2/tamagawa-independent-of-form` — Independence of the gauge form (theorem)

τ_G does not depend on the gauge form ω: replacing ω by cω with c ∈ F^× multiplies each |ω|_v by |c|_v, and ∏_v |c|_v = 1.

*Hypotheses:* F a number field; G = Spec H an affine algebraic group over F, H finitely generated.

*Proof outline:*
1. Local scaling (GaugeForm.localMeasure_smul).
2. Product formula (Tau Ceti finprod_normalizedAbsValue_eq_one); only finitely many |c|_v differ from 1, so AA.0/restricted-haar-rescale applies.

*Prerequisites:* `AA.2/tamagawa-measure`, `AA.2/local-form-measure`, `tauceti:TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`, `AA.0/restricted-haar-rescale`.

*Acceptance:* Replacing dT by 2dT on G_a over ℚ leaves τ unchanged.

*Sources:* rosengarten-tamagawa, §1, p. 2.

#### `AA.2/tamagawa-convergence` — Absolute convergence of the corrected volumes (theorem)

For connected reductive G with an integral model 𝓗 smooth with connected reductive fibres away from S, the product ∏_{v∉S} λ_v #𝓗(k_v) q_v^{-d} converges absolutely; for semisimple G the factors are 1 + O(q_v^{-2}).

*Hypotheses:* F a number field; G a connected reductive group over F; 𝓗 reductive over 𝒪_{F,S}.

*Proof outline:*
1. Steinberg's formula #𝓗(k_v) = q_v^{d} ∏_i (1 - ε_i q_v^{-d_i}) for connected reductive groups over finite fields, with exponents d_i ≥ 2 for the semisimple part and d_i = 1 for the torus part, whose contribution is cancelled by λ_v = L_v(X, 1) up to O(q_v^{-2}).
2. ∑_v q_v^{-2} converges.
3. For GL_n and SL_n the convergence is elementary (tamagawa-convergence-gln) and needs no gap.

*Prerequisites:* `AA.2/weil-volume-formula`, `AA.2/convergence-factors`, `AA.1/integral-model`, `AA.2/tamagawa-convergence-gln`.

*Acceptance:* For SL_2: #SL_2(𝔽_q) q⁻³ = 1 - q⁻²; ∏_p (1 - p⁻²) = ζ(2)⁻¹ converges. For GL_1 without the factor λ_v the product diverges (AA.0/tamagawa-convergence-failure).

*Sources:* rosengarten-tamagawa, §3, p. 25.

#### `AA.2/tamagawa-number` — Tamagawa number (definition)

For connected reductive G, τ(G) = vol(G(F)\G(𝔸_F)^1) for the measure on G(𝔸)^1 induced by τ_G and the Lebesgue measure on a_G normalized by the lattice Hom(X*_F(G), ℤ) (through split-centre-decomposition and log-height-split-centre-iso), with counting measure on G(F), as an element of [0, ∞]. Its finiteness is AA.3/tamagawa-number-finite.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Combine tamagawa-measure, automorphic-quotient-measure and the normalization of a_G.

*Prerequisites:* `AA.2/tamagawa-measure`, `AA.2/automorphic-quotient-measure`, `AA.2/log-height-split-centre-iso`.

*API:*
- `Tamagawa.number` (constructor): Tamagawa.number G : ℝ≥0∞.
- `Tamagawa.number_pos` (characterisation): Tamagawa.number G > 0.
- `Tamagawa.number_res` (functoriality): Tamagawa.number (Res_{E/F} G) = Tamagawa.number G.

*Unit tests:*
- `Tamagawa.number_trivial` (degenerate): For the trivial group τ = 1.
- `Tamagawa.number_gm_statement` (computation): τ(G_m) = 1 over any number field (statement; proof in AutomorphicLFunctionsAndLocalFactors:AL.1 via Tate's thesis).
- `Tamagawa.number_not_full_quotient` (non-example): vol(G_m(F)\G_m(𝔸)) = ∞ because the split component ℝ_{>0} is not compact; τ uses the norm-one quotient.

*Used by:* BorelRegulators:R.6/norm-one-tamagawa — τ(SL_1(D)) in Bloch's reformulation (the value is not computed here); GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity — mass formulas.

*Acceptance:* τ(G_a) = 1 and τ(G_m) = 1 (Tate's thesis, AutomorphicLFunctionsAndLocalFactors). τ(SL_2) = 1 (Weil); computing τ for general G is outside this roadmap.

*Sources:* rosengarten-tamagawa, §1, p. 3.

#### `AA.2/tamagawa-restriction-scalars` — Tamagawa measures and restriction of scalars (theorem)

For a finite extension E/F and a connected group G_E over E, the isomorphism Res_{E/F}(G_E)(𝔸_F) ≃ G_E(𝔸_E) of AA.1/base-change-adelic carries τ_{Res_{E/F} G_E} to τ_{G_E}; consequently τ(Res_{E/F} G_E) = τ(G_E).

*Hypotheses:* E/F finite; G_E connected over E.

*Proof outline:*
1. Gauge forms: a gauge form on G_E induces one on Res whose local measures at v are ∏_{w|v} |ω|_w up to the factor |N_{E/F}(𝔡_{E/F})|_v^{d/2} (local discriminants).
2. The discriminant factors combine with |d_F|^{-d[E:F]/2} into |d_E|^{-d/2} (|d_E| = |d_F|^{[E:F]} N(𝔡_{E/F})).
3. Convergence factors are inductive: L_v(Ind X, s) = ∏_{w|v} L_w(X, s), and ρ is preserved.

*Prerequisites:* `AA.2/tamagawa-measure`, `AA.1/base-change-adelic`, `AA.1/base-change-local-factors`, `AA.2/convergence-factors`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`, `AA.2/gauge-form-restriction-discriminant`, `AA.2/artin-factor-induction`.

*Acceptance:* For G_E = G_m: τ(Res_{E/F} G_m) = 1.

*Sources:* rosengarten-tamagawa, §1, p. 2.

#### `AA.2/compact-open-volume` — Volumes of commensurable compact open subgroups (lemma)

For compact open subgroups U, U′ of G(𝔸_{F,f}) (or of G(F_v)) and a left Haar measure μ, μ(U)/μ(U′) = [U : U ∩ U′]/[U′ : U ∩ U′]; in particular all volumes of compact open subgroups are positive rational multiples of one of them.

*Hypotheses:* G(𝔸_{F,f}) as in AA.1.

*Proof outline:*
1. U ∩ U′ has finite index in both (AA.1/compact-open-product).
2. MeasureTheory.Subgroup.index_mul_measure applied to U ∩ U′ in U and in U′.

*Prerequisites:* `AA.1/compact-open-product`, `mathlib:MeasureTheory.Subgroup.index_mul_measure`, `AA.0/restricted-haar-is-haar`.

*Acceptance:* vol(Γ_0(N)-level K_0(N)) = vol(GL_2(ℤ̂)) / [GL_2(ℤ̂) : K_0(N)].

*Sources:* borel-1963, §1.7, p. 8.

#### `AA.2/bruhat-section` — Averaging over a closed subgroup is surjective on compact supports (lemma)

For a closed subgroup H of a locally compact group G and a left Haar measure dh on H, the map P : C_c(G) → C_c(H\G), (Pf)(Hg) = ∫_H f(hg) dh, is surjective, and every f ≥ 0 in C_c(H\G) is Pφ for some φ ≥ 0.

*Hypotheses:* G locally compact; H closed.

*Proof outline:*
1. Choose a compactly supported continuous ψ ≥ 0 on G with Pψ > 0 on the support of a given F ∈ C_c(H\G) (Bruhat function, via compactness of supports in the quotient).
2. Put φ = ψ · (F ∘ π)/(Pψ ∘ π); then Pφ = F.

*Prerequisites:* `mathlib:TopologicalGroup.IsSES.inducedMeasure`.

*Acceptance:* For H = {1}, P is the identity of C_c(G).

*Sources:* arthur-trace-intro, §1, p. 7.

#### `AA.2/quotient-functional-well-defined` — Weil's functional is well defined under the modular condition (lemma)

If Δ_G|_H = Δ_H, then for f ∈ C_c(G), Pf = 0 implies ∫_G f dg = 0; hence Pf ↦ ∫_G f dg is a well-defined positive G-invariant functional on C_c(H\G).

*Hypotheses:* Δ_G|_H = Δ_H.

*Proof outline:*
1. Pick φ with Pφ = 1 on the support of f (bruhat-section); then ∫_G f = ∫_G f(g) ∫_H φ(hg) dh dg.
2. Exchange the integrals and substitute g ↦ h⁻¹g; the modular condition makes the Jacobians cancel, giving ∫_G φ(g) (Pf)(Hg) dg = 0.

*Prerequisites:* `AA.2/bruhat-section`, `mathlib:MeasureTheory.Measure.modularCharacter`.

*Acceptance:* For B ⊂ SL_2(ℝ) the condition fails and the functional is not well defined.

*Sources:* arthur-trace-intro, §1, p. 9.

#### `AA.2/gauge-form-restriction-discriminant` — Gauge forms under restriction of scalars (lemma)

For E/F finite of degree n and a gauge form ω_E on G_E of dimension d, the induced gauge form ω on Res_{E/F} G_E satisfies, at each place v of F, |ω|_v = |d_{E_v/F_v}|_v^{d/2} ∏_{w|v} |ω_E|_w under Res(F_v) ≅ ∏_{w|v} G_E(E_w), where d_{E_v/F_v} is the local discriminant.

*Hypotheses:* E/F finite; ω_E a gauge form.

*Proof outline:*
1. Locally Res(F_v) = ∏_{w|v} G_E(E_w), and the top form of a restriction of scalars is the norm of ω_E composed with the determinant of the trace pairing on a basis of E_v over F_v.
2. The determinant of the trace form in an integral basis is the local discriminant; taking absolute values gives the factor |d|_v^{d/2}.

*Prerequisites:* `AA.2/invariant-top-form`, `AA.2/local-form-measure`, `AA.1/base-change-local-factors`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`.

*Acceptance:* For G_E = G_a and E/F quadratic of discriminant D, the factor is |D|_v^{1/2}.

*Sources:* rosengarten-tamagawa, §1, p. 2.

#### `AA.2/artin-factor-induction` — Inductivity of the convergence factors (lemma)

For E/F finite and a Galois module X of G_{E} (finite image), the induced module Ind X satisfies L_v(Ind X, s) = ∏_{w|v} L_w(X, s) at every finite place v unramified for X, and the leading coefficients at s = 1 agree.

*Hypotheses:* E/F finite; X with finite image.

*Proof outline:*
1. Mackey: the restriction of Ind X to the decomposition group at v is the sum over w | v of the induced modules from the decomposition groups at w.
2. Frobenius at w is Frob_v^{f_w}; det(1 − q_v^{-s f_w} Frob_w | X) equals the determinant on the induced block.

*Prerequisites:* `AA.2/convergence-factors`.

*Acceptance:* For X trivial of rank one, ∏_{w|v} (1 − q_w^{-s})⁻¹ is the local factor of ζ_E.

*Sources:* rosengarten-tamagawa, §3, p. 25.

#### `AA.2/fundamental-domain-exists` — Borel fundamental domains for countable discrete subgroups (lemma)

Let G be a second countable locally compact Hausdorff group and Γ ≤ G a countable discrete subgroup acting by left translation. There is a Borel set D ⊂ G meeting every orbit Γg in exactly one point.

*Hypotheses:* G second countable locally compact Hausdorff; Γ countable and discrete.

*Proof outline:*
1. Choose an open neighbourhood V of 1 with V⁻¹V ∩ Γ = {1}; then translates gV inject into Γ\G.
2. Cover G by countably many translates g_nV (second countability) and put D = ⋃_n (g_nV ∖ ⋃_{m<n} Γg_mV), a Borel set meeting each orbit once.

*Prerequisites:* `mathlib:MeasureTheory.IsFundamentalDomain`.

*Acceptance:* For ℤ ⊂ ℝ, the construction yields a Borel set such as [0, 1).

*Sources:* borel-1963, Definition 4.1, p. 17.

#### `AA.2/tamagawa-convergence-gln` — Corrected volumes for GL_n and SL_n (theorem)

For the standard models of GL_n and SL_n over 𝒪_F and their standard gauge forms, at every finite place v: λ_v · #GL_n(k_v) q_v^{-n²} = ∏_{i=2}^{n} (1 − q_v^{-i}) with λ_v = (1 − q_v^{-1})^{-1}, and #SL_n(k_v) q_v^{-(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{-i}); both products over v converge absolutely.

*Hypotheses:* n ≥ 1.

*Proof outline:*
1. #GL_n(𝔽_q) = ∏_{i=0}^{n−1} (q^n − q^i) = q^{n²} ∏_{i=1}^{n} (1 − q^{-i}); #SL_n(𝔽_q) = #GL_n(𝔽_q)/(q − 1).
2. Apply weil-volume-formula; Σ_v q_v^{-2} converges because Σ_v q_v^{-s} converges for s > 1 (Dedekind zeta).

*Prerequisites:* `AA.2/weil-volume-formula`, `AA.2/convergence-factors`.

*Acceptance:* For SL_2: ∏_p (1 − p⁻²) = ζ(2)⁻¹ = 6/π².

*Sources:* rosengarten-tamagawa, §3, p. 25.

## AA.3. Reduction theory
A minimal `F`-parabolic `P_0 = M_0 N_0` with its simple relative roots determines the standard
parabolics (finitely many, one in each `G(F)`-conjugacy class of `F`-parabolics); the field-generic
Borel–Tits theory behind this is requested from RG2.1. For standard `P` the spaces `a_P`, their
decompositions `a_{P₁} = a_{P₂} ⊕ a_{P₁}^{P₂}`, the roots, `ρ_P`, the simple roots `Δ_P` and the
chamber `a_P^+` follow Arthur §5. An admissible maximal compact `K = ∏ K_v` (hyperspecial for almost
all `v`, Iwasawa everywhere) gives `G(𝔸) = P(𝔸)K` with the integration formula, and
`H_P(nmk) = H_{M_P}(m)`.

Adelic Siegel sets `𝔖(T₁, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) − T₁) > 0}` cover
`G(F)\G(𝔸)` for suitable `T₁` and compact `ω` (Borel–Harish-Chandra, Arthur Theorem 8.1) and have
the Siegel property. Borel's 1963 paper gives the finiteness of `G(F)\G(𝔸_f)/U` for every linear
algebraic group and compact open `U` (reduction to reductive groups by the unipotent class number
one and semidirect products), the component decomposition
`G(F)\G(𝔸)/U ≅ ⊔_i Γ_i\G(F_∞)` with `Γ_i = G(F) ∩ x_i U x_i⁻¹` (which retains the archimedean factor
and the split centre), finite volume of `G(F)\G(𝔸)^1` for connected `G`, the criterion that
`G(F)\G(𝔸)` has finite volume iff `X*_F(G°) = 0`, and the compactness criterion: for connected
reductive `G`, `G(F)\G(𝔸)^1` is compact iff `G` has no proper `F`-parabolic, iff `G(F)` has no
nontrivial unipotent element, iff `G^der` is `F`-anisotropic. Cocompact arithmetic groups contain
no unipotents, and `S`-arithmetic groups are lattices in `G(F_S)`. Heights from a faithful
representation satisfy Arthur's (13.2)–(13.4), are comparable under change of representation (with
the real-group comparison imported from AF.1) and are controlled by `H_0` on Siegel sets.

The fixed-`K` real theory (Bakker–Klingler–Tsimerman §2 with the 2023 erratum) is planned for the
arithmetic quotients `Γ\G/M` that ArithmeticQuotientDefinability and ALS.2 consume: horospherical
coordinates with the left action formula (correcting BKT's "right action"), simple roots and
corner coordinates, Siegel sets for one fixed `K`, their translation rules, the finite cover by
Siegel sets at the finitely many cusps, finite overlaps, separation of inequivalent cusps (with the
quantifier over `γ` restored), deep self-intersections, the comparison of Siegel-set conventions,
the Orr–Schnell containment with its Cartan-compatibility hypothesis and its failure without it,
BGST's pullback, and the orbit-map statements that the Hodge-theoretic application specializes.
Reduced positive forms and the sets `T_{e,C}` compare with Siegel sets of the space of positive
forms (Klingen), and the basis-change statement is corrected to allow a reordering of the basis.

**Depends on:** AA.1, AA.2, ReductiveGroupsPartII RG2.1, RG2.3, RG2.4, LieGroups layer 9,
AutomorphicFormsOnReductiveGroups AF.1, GlobalNumberFields layer 6, Tau Ceti Cholesky and dynamic
parabolics. **Consumed by:** AA.4, AA.5, ArithmeticLocallySymmetricSpaces ALS.0, AutomorphicForms
AF.0, AF.2, AF.3, BorelRegulators R.1 and R.6, ShimuraVarieties V0 and V1, MetaplecticAutomorphicForms
MP.5, AbelianVarietiesIsogenousToNoJacobian MZ0, GeometryOfNumbers GN.3 and GN.4,
AbelianSchemesAndArithmeticModuliPartII F4.

**Planets:** Adelic Siegel set (`AA.3/adelic-siegel-set`); Reduction theory: Siegel covering (`AA.3/siegel-covering-adelic`); Finiteness of class numbers (`AA.3/class-number-finite`); Finite volume of G(F)\G(A)^1 (`AA.3/finite-volume`); Compactness criterion (`AA.3/compactness-anisotropic`); Siegel set (`AA.3/real-siegel-set`).

### AA.3 declarations

#### `AA.3/minimal-parabolic-data` — Minimal rational parabolics and standard parabolics (construction)

Fix a minimal F-parabolic P_0 ⊂ G with Levi decomposition P_0 = M_0 N_0, M_0 the centralizer of a maximal F-split torus S_0. A standard parabolic is an F-parabolic P ⊇ P_0; it has a unique Levi component M_P ⊇ M_0, unipotent radical N_P, and split component A_P = A_{M_P}. The standard parabolics are finite in number, correspond to subsets of the simple relative roots Δ_0, and every F-parabolic is G(F)-conjugate to exactly one of them.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Existence and conjugacy of minimal F-parabolics and maximal split tori, relative roots and the standard parabolics (Borel–Tits, requested from RG2.1).
2. Levi decompositions on points: Tau Ceti dynamic parabolics P(λ) = U(λ) ⋊ L(λ) for an F-cocharacter λ of S_0 in the positive chamber realise each standard parabolic.
3. A_P is the split component of M_P (AA.2/split-centre).

*Prerequisites:* `ReductiveGroupsPartII:RG2.1`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.unipotent`, `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`, `AA.2/split-centre`.

*API:*
- `Reduction.MinimalParabolic` (structure): Structure: P_0, M_0, N_0, S_0 with the Levi decomposition.
- `Reduction.StandardParabolic` (constructor): The finite type of standard parabolics P ⊇ P_0, with M_P, N_P, A_P.
- `Reduction.standardParabolic_equiv_subsets` (equivalence): StandardParabolic ≃ Finset Δ_0.
- `Reduction.exists_unique_standard_conj` (characterisation): Every F-parabolic is G(F)-conjugate to a unique standard parabolic.
- `Reduction.StandardParabolic.le_iff` (relation): P ≤ P′ iff the corresponding subsets satisfy Δ_0^P ⊆ Δ_0^{P′} (with the convention that the subset lists the simple roots of M_P).

*Unit tests:*
- `Reduction.standardParabolic_gl3_card` (computation): For GL_3 there are 4 standard parabolics.
- `Reduction.standardParabolic_anisotropic` (degenerate): If G is F-anisotropic the only standard parabolic is G.
- `Reduction.standardParabolic_not_all_parabolics` (non-example): For GL_2 over ℚ the lower triangular Borel is a parabolic that is not standard; it is conjugate to the standard one by the Weyl element.

*Used by:* AA.3/adelic-siegel-set — P_0, A_0 and Δ_0 in the Siegel set; AA.3/compactness-isotropic — a proper F-parabolic forces noncompactness; AutomorphicFormsOnReductiveGroups:AF.3 — constant terms along standard parabolics; ShimuraVarieties:V0 — rational parabolics for boundary components (RS-04 link AA.3 → V0).

*Acceptance:* For GL_n, P_0 is the upper triangular Borel, standard parabolics are block upper triangular and correspond to compositions of n. For an F-anisotropic group P_0 = G and Δ_0 = ∅.

*Sources:* arthur-trace-intro, §4, p. 22.

#### `AA.3/relative-chamber` — Relative chambers and the spaces a_P (construction)

For standard P, a_P = a_{M_P} (AA.2/real-character-space), with a_0 = a_{P_0}. For P_1 ⊆ P_2 there are split exact sequences giving a_{P_1} = a_{P_2} ⊕ a_{P_1}^{P_2} and dually. The roots Φ_P of (P, A_P) lie in (a_P^G)^*, ρ_P = (1/2) ∑_{α∈Φ_P} (dim 𝔫_α) α, the simple roots Δ_P are the restrictions of Δ_0 ∖ Δ_0^P, and the positive chamber is a_P^+ = {H ∈ a_P : α(H) > 0 for α ∈ Δ_P}.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Restriction of characters X*_F(M_{P_2}) → X*_F(M_{P_1}) is injective; restriction X*(A_{P_1}) → X*(A_{P_2}) is surjective (Arthur §5); tensor with ℝ.
2. Root space decomposition of 𝔫_P under A_P.

*Prerequisites:* `AA.3/minimal-parabolic-data`, `AA.2/real-character-space`, `AA.2/rational-characters-free`, `ReductiveGroupsPartII:RG2.1`.

*API:*
- `Reduction.aP` (constructor): The real vector space a_P for a standard parabolic.
- `Reduction.aP_decomp` (equivalence): a_{P_1} ≃ a_{P_2} × a_{P_1}^{P_2} for P_1 ≤ P_2.
- `Reduction.rho` (data): ρ_P ∈ (a_P^G)^*.
- `Reduction.simpleRoots` (data): Δ_P ⊂ (a_P^G)^*, a basis.
- `Reduction.positiveChamber` (data): a_P^+ = {H | ∀ α ∈ Δ_P, 0 < α H}.

*Unit tests:*
- `Reduction.rho_gl2` (computation): For the Borel of GL_2, ρ = (1/2)(e_1 - e_2).
- `Reduction.aP_top` (degenerate): For P = G and G without rational characters, a_P = 0; in general a_G^G = 0.
- `Reduction.positiveChamber_not_cone_of_all_roots` (non-example): For GL_3, a_0^+ is cut out by the two simple roots; positivity of e_1 - e_3 alone does not imply membership.

*Used by:* AA.3/adelic-siegel-set — the cone condition β(H_0(a) - T_1) > 0; AA.2/modulus-character — δ_P = e^{2ρ_P(H_P)}; AutomorphicSpectralTheory:AS.1 — the positive chamber in Eisenstein series.

*Acceptance:* For GL_n and P_0, a_0 = ℝ^n, a_G = ℝ (diagonal), Δ_0 = {e_i - e_{i+1}}, ρ_0 = ((n-1)/2, …, (1-n)/2). For P = G, a_G^G = 0 and the chamber is a point.

*Sources:* arthur-trace-intro, §5, p. 24; arthur-trace-intro, §5, p. 25.

#### `AA.3/good-maximal-compact` — Admissible maximal compact subgroup of G(𝔸) (definition)

A maximal compact subgroup K = ∏_v K_v of G(𝔸_F) is admissible relative to M_0 if K_v = 𝓗(𝒪_v) is hyperspecial for all but finitely many v, each K_v is a special maximal compact subgroup in good position relative to M_0 at finite v and a maximal compact subgroup of G(F_v) at archimedean v, and G(F_v) = P_0(F_v) K_v for every v.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Choose an integral model; for almost all v it is reductive and 𝓗(𝒪_v) is hyperspecial and in good position (RG2.3 request).
2. At the remaining finite places choose special maximal compacts in good position (RG2.4 Iwasawa), at archimedean places a maximal compact (LieGroups layer 9).
3. The product is compact by AA.1/restricted-product-comparison and Tychonoff.

*Prerequisites:* `AA.1/integral-model`, `AA.1/integral-points-level`, `AA.1/restricted-product-comparison`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

*API:*
- `Reduction.AdmissibleCompact` (structure): Structure: the local K_v with the hyperspecial, special and Iwasawa conditions.
- `Reduction.AdmissibleCompact.toSubgroup` (projection): The compact subgroup ∏_v K_v of G(𝔸).
- `Reduction.AdmissibleCompact.isCompact` (characterisation): toSubgroup is compact.
- `Reduction.AdmissibleCompact.exists` (constructor): An admissible K exists for every minimal parabolic data.

*Unit tests:*
- `Reduction.AdmissibleCompact.gln` (computation): For GL_n over ℚ, O(n) × ∏_p GL_n(ℤ_p) is admissible.
- `Reduction.AdmissibleCompact.anisotropic` (degenerate): For F-anisotropic G the Iwasawa condition is vacuous (P_0 = G).
- `Reduction.AdmissibleCompact.not_all_places_iwahori` (non-example): The Iwahori subgroup (upper triangular modulo p) is a proper subgroup of GL_2(ℤ_p), so a product of Iwahori subgroups is not maximal compact and not admissible.

*Used by:* AA.3/adelic-iwasawa — G(𝔸) = P(𝔸)K; AA.3/H-P — well-definedness of H_P; AutomorphicFormsOnReductiveGroups:AF.2 — K-finite automorphic forms.

*Acceptance:* For GL_n, K = O(n) × ∏_p GL_n(ℤ_p) (Arthur §4). The product of the local K_v is compact only because K_v = 𝓗(𝒪_v) for almost all v.

*Sources:* arthur-trace-intro, §4, p. 23; arthur-trace-intro, §4, p. 24.

#### `AA.3/adelic-iwasawa` — Adelic Iwasawa decomposition and integration formula (theorem)

For admissible K and standard P, G(𝔸_F) = P(𝔸_F)K = N_P(𝔸)M_P(𝔸)^1 A_P(ℝ)^0 K, and for f ∈ L¹(G(𝔸)), ∫_{G(𝔸)} f(x) dx = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)^{-1} dn dm dk for compatible Haar measures.

*Hypotheses:* F a number field; G a connected reductive group over F; K admissible.

*Proof outline:*
1. Local Iwasawa decompositions G(F_v) = P_0(F_v)K_v (RG2.4, LieGroups layer 9), with P_0(𝒪_v)·K_v-compatibility at almost all v, give the adelic one place by place.
2. Decompose P(𝔸) = N_P(𝔸) ⋊ M_P(𝔸) and M_P(𝔸) = M_P(𝔸)^1 × A_P(ℝ)^0 (AA.2/split-centre-decomposition for M_P).
3. Integration formula: quotient-measure for P(𝔸)\G(𝔸) ≅ (P(𝔸)∩K)\K, with the modular function δ_P (AA.2/modular-function-parabolic).

*Prerequisites:* `AA.3/good-maximal-compact`, `AA.3/minimal-parabolic-data`, `AA.2/split-centre-decomposition`, `AA.2/modular-function-parabolic`, `AA.2/quotient-measure`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `ReductiveGroupsPartII:RG2.3`.

*Acceptance:* For GL_n over ℚ this is Gram–Schmidt at ∞ and GL_n(ℚ_p) = P_0(ℚ_p)GL_n(ℤ_p) at p.

*Sources:* arthur-trace-intro, §4, p. 24.

#### `AA.3/H-P` — The map H_P (definition)

For standard P and admissible K, H_P : G(𝔸_F) → a_P is H_P(nmk) = H_{M_P}(m) for n ∈ N_P(𝔸), m ∈ M_P(𝔸), k ∈ K; write H_0 = H_{P_0}.

*Hypotheses:* F a number field; G a connected reductive group over F; K admissible.

*Proof outline:*
1. Well defined: if nmk = n′m′k′ then m⁻¹m′ ∈ M_P(𝔸) ∩ N_P(𝔸)K, so H_{M_P}(m⁻¹m′) vanishes because H_{M_P} kills N_P and compact subgroups.
2. Continuity from the Iwasawa decomposition.

*Prerequisites:* `AA.3/adelic-iwasawa`, `AA.2/log-height`, `AA.3/relative-chamber`.

*API:*
- `Reduction.HP` (constructor): Reduction.HP P : AdelicPoints H → a_P.
- `Reduction.HP_nmk` (simp): HP (n * m * k) = logHeight_{M_P} m.
- `Reduction.HP_left_P` (relation): HP (p * x) = HP p + HP x for p ∈ P(𝔸).
- `Reduction.continuous_HP` (instance): HP is continuous.
- `Reduction.HP_rational` (simp): HP (diagonal γ * x) = HP x for γ ∈ P(F).

*Unit tests:*
- `Reduction.HP_gl2_borel` (computation): For x in P(𝔸), the pairing of HP x with each rational character χ of P is log ‖χ(y)‖ for a point y of P; for GL_2 and the Borel, HP (diag(a, d)) = (log ‖a‖, log ‖d‖).
- `Reduction.HP_top` (degenerate): For P = G, HP = logHeight.
- `Reduction.HP_not_homomorphism` (non-example): HP is not a homomorphism on G(𝔸): for GL_2, HP(w) = 0 for the Weyl element w ∈ K, but HP of a product of upper and lower unipotents can be nonzero.

*Used by:* AA.3/adelic-siegel-set — Siegel sets via H_0; AA.2/modulus-character — δ_P(p) = e^{2ρ_P(H_P(p))}; AutomorphicSpectralTheory:AS.1 — Eisenstein series E(x, φ, λ) built from e^{(λ+ρ_P)(H_P(x))}.

*Acceptance:* For GL_n and P_0, H_0(x) = (log|a_1|, …, log|a_n|) for x = n·diag(a_i)·k. H_G = H_P composed with a_P → a_G.

*Sources:* arthur-trace-intro, §4, p. 24.

#### `AA.3/adelic-siegel-set` — Adelic Siegel sets (definition)

For T_1 ∈ a_0 and a compact subset ω ⊂ N_0(𝔸)M_0(𝔸)^1, the Siegel set is 𝔖(T_1, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) - T_1) > 0 for all β ∈ Δ_0}.

*Hypotheses:* F a number field; G a connected reductive group over F; K admissible.

*Proof outline:*
1. Define as the image of ω × {a : ...} × K under multiplication; it is invariant under A_G(ℝ)^0.

*Prerequisites:* `AA.3/minimal-parabolic-data`, `AA.3/relative-chamber`, `AA.3/H-P`, `AA.3/good-maximal-compact`.

*API:*
- `Reduction.siegelSet` (constructor): Reduction.siegelSet T₁ ω : Set (AdelicPoints H).
- `Reduction.mem_siegelSet` (characterisation): x ∈ siegelSet T₁ ω iff x = p a k with the stated conditions.
- `Reduction.siegelSet_mono` (relation): siegelSet is antitone in T₁ (coordinatewise for Δ_0) and monotone in ω.
- `Reduction.siegelSet_mul_K` (simp): siegelSet T₁ ω * K = siegelSet T₁ ω.
- `Reduction.siegelSet_center` (relation): siegelSet is stable under A_G(ℝ)^0.

*Unit tests:*
- `Reduction.siegelSet_sl2` (computation): For SL_2/ℚ, some Siegel set with compact ω meets every SL_2(ℚ)-orbit in SL_2(𝔸) (at ∞ it contains the standard fundamental domain of SL_2(ℤ)).
- `Reduction.siegelSet_anisotropic` (degenerate): For F-anisotropic G, siegelSet T₁ ω = ω * K.
- `Reduction.siegelSet_not_fundamental_domain` (non-example): A Siegel set is not a fundamental domain: for SL_2/ℚ it meets some of its translates by SL_2(ℚ) (for instance by the Weyl element near i).

*Used by:* AA.3/siegel-covering-adelic — the fundamental-set property; AutomorphicFormsOnReductiveGroups:AF.3 — rapid decay of cusp forms on Siegel sets; MetaplecticAutomorphicForms:MP.5 — convergence of theta integrals estimated on Siegel sets (RT-AREA-automorphic-1/23); AA.3/height-siegel-estimate — height estimates.

*Acceptance:* For SL_2 over ℚ, 𝔖 ∩ SL_2(ℝ) is a classical Siegel set {n a_y k : |x| ≤ c, y > t}. For F-anisotropic G, 𝔖 = ω K, a compact set.

*Sources:* arthur-trace-intro, §8, p. 37.

#### `AA.3/siegel-covering-adelic` — Siegel sets cover G(F)\G(𝔸) (theorem)

There are T_1 and ω such that G(𝔸_F) = G(F) 𝔖(T_1, ω) (Borel–Harish-Chandra).

*Hypotheses:* F a number field; G a connected reductive group over F; K admissible.

*Proof outline:*
1. Reduce to F = ℚ by restriction of scalars (AA.1/base-change-adelic).
2. For GL_n: classical reduction (Hermite–Minkowski) for GL_n(ℝ)/GL_n(ℤ) via reduced forms (reduction-siegel-dictionary) together with class-number finiteness for GL_n(𝔸_f) (class-number-finite), Borel 4.4.
3. For reductive G ⊂ GL_n embedded self-adjointly: G(𝔸) ⊂ GL_n(ℚ) 𝔖_{GL_n}, and the finiteness of G(ℚ)-orbits on GL_n(ℚ)·w ∩ closed orbits (Borel 4.5, 5.4) gives finitely many translates x_i𝔖_{GL_n} ∩ G(𝔸) covering; these are contained in finitely many Siegel sets of G.
4. Connected G: G = H ⋉ N with N unipotent (Borel 4.6).

*Prerequisites:* `AA.3/adelic-siegel-set`, `AA.3/class-number-finite`, `AA.3/reduction-siegel-dictionary`, `AA.1/base-change-adelic`, `mathlib:ModularGroup.exists_smul_mem_fd`, `AA.3/gln-adelic-covering`, `AA.3/self-adjoint-reduction`.

*Acceptance:* For SL_2/ℚ it reduces to ModularGroup.exists_smul_mem_fd at the archimedean place and SL_2(ℚ)SL_2(ℤ̂) = SL_2(𝔸_f).

*Sources:* arthur-trace-intro, Theorem 8.1, p. 37; borel-1963, Theorem 4.6, p. 18.

#### `AA.3/siegel-finiteness-adelic` — Siegel property (theorem)

For a Siegel set 𝔖 = 𝔖(T_1, ω), the set {γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅} is finite.

*Hypotheses:* F a number field; G a connected reductive group over F; K admissible.

*Proof outline:*
1. Reduce to F = ℚ and to GL_n as in siegel-covering-adelic.
2. For GL_n: if γx = y with x, y ∈ 𝔖 then the archimedean components satisfy the classical Siegel property for GL_n(ℤ)-type lattices, and the finite components lie in a fixed compact set, so γ lies in a discrete ∩ compact set (Borel 4.3, 4.4).

*Prerequisites:* `AA.3/adelic-siegel-set`, `AA.1/rational-points-discrete`, `AA.3/real-siegel-finite-overlap`.

*Acceptance:* For SL_2/ℚ, only finitely many γ ∈ SL_2(ℚ) map the Siegel set of siegelSet_sl2 to itself (essentially ±1, ±S, ±T^{±1}, ±ST, ±TS).

*Sources:* borel-1963, Definition 4.1, p. 17; bkt-2020, Proposition 2.7(2), p. 9.

#### `AA.3/class-number-finite` — Finiteness of class numbers (theorem)

For every linear algebraic group G over F and every compact open subgroup U ⊂ G(𝔸_{F,f}), the double coset space G(F)\G(𝔸_{F,f})/U is finite; equivalently G(𝔸_F) = ⋃_{i=1}^h G(F) x_i G(F_∞) U for finitely many x_i.

*Hypotheses:* F a number field; G a linear algebraic group over F; U compact open.

*Proof outline:*
1. Borel 5.1: it suffices to find a compact C ⊂ G(𝔸_f) with G(𝔸_f) = G(F) C U (compact sets lie in finitely many U-cosets).
2. Connected G: reduce to reductive G using unipotent-class-number-one and semidirect-class-number; reduce to F = ℚ by restriction of scalars; then the fundamental set of siegel-covering-adelic has compact finite part.
3. Non-connected G: G(𝔸)/G°(𝔸) is compact (Borel 1.9) and conjugates of compact opens are commensurable (Borel 1.7, AA.1/compact-open-product).

*Prerequisites:* `AA.1/compact-open-product`, `AA.1/base-change-adelic`, `AA.3/unipotent-class-number-one`, `AA.3/semidirect-class-number`, `AA.1/adelic-points-split`.

*Used by:* AA.3/component-decomposition — finitely many components; AA.4/neat-level-exists — finitely many rational intersections; AbelianSchemesAndArithmeticModuliPartII:F4/fixed-level-class-bound — finiteness for unit groups of semisimple endomorphism algebras (request from F4); GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite — finiteness of classes in a genus; ShimuraVarieties:V0 — adelic component finiteness.

*Acceptance:* For G = GL_1, h = h_F (class-number-gl1). For G = SL_n, h = 1 (strong approximation).

*Sources:* borel-1963, Theorem 5.1, p. 19; milne-svi, Lemma 5.12, p. 57.

#### `AA.3/unipotent-class-number-one` — Unipotent groups have class number one (lemma)

For a unipotent group N over F and compact open U ⊂ N(𝔸_f), N(𝔸_f) = N(F)U.

*Hypotheses:* N unipotent over F.

*Proof outline:*
1. For G_a this is density of F in 𝔸_{F,f} (GlobalNumberFields layer 6).
2. Induct on a central composition series with G_a quotients (Borel 2.4, 2.5).

*Prerequisites:* `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `AA.1/adelic-map`.

*Acceptance:* For the unipotent radical of the Borel of GL_2, N(𝔸_f) = N(ℚ)N(ℤ̂).

*Sources:* borel-1963, Corollary 2.5, p. 13.

#### `AA.3/semidirect-class-number` — Class numbers of semidirect products (lemma)

If G = H ⋉ N over F with N unipotent, then every double coset G(F)\G(𝔸_f)/U meets H(𝔸_f), and G(F)\G(𝔸_f)/U is finite if H(F)\H(𝔸_f)/(U ∩ H(𝔸_f)) is finite for all compact open U.

*Hypotheses:* G = H ⋉ N.

*Proof outline:*
1. Borel 2.4 and 2.7, using N(𝔸_f) = N(F)·(open subgroup) (unipotent-class-number-one) and that N(𝔸) is normal with G(𝔸) = H(𝔸) ⋉ N(𝔸) (Borel 1.6).

*Prerequisites:* `AA.3/unipotent-class-number-one`, `AA.1/closed-subgroup-adelic`.

*Acceptance:* For the Borel B = T ⋉ N of GL_2, the class number of B is bounded by that of the torus T.

*Sources:* borel-1963, Proposition 2.7, p. 13.

#### `AA.3/arithmetic-subgroup-of-level` — Arithmetic subgroups attached to a level (definition)

For compact open U ⊂ G(𝔸_{F,f}) and x ∈ G(𝔸_{F,f}), Γ_{x,U} = G(F) ∩ x U x⁻¹, viewed in G(F_∞) through the diagonal. It is a discrete subgroup of G(F_∞); for x, x′ and U, U′ the groups Γ_{x,U} and Γ_{x′,U′} are commensurable after conjugating by a rational element when x′ ∈ G(F) x U.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Discreteness: G(F) is discrete in G(𝔸) (AA.1/rational-points-discrete) and x U x⁻¹ is compact open in G(𝔸_f).
2. Commensurability: compact open subgroups are commensurable (AA.1/compact-open-product).

*Prerequisites:* `AA.1/rational-points-discrete`, `AA.1/compact-open-product`, `AA.1/adelic-points-split`.

*API:*
- `Reduction.levelArithmetic` (constructor): Reduction.levelArithmetic x U : Subgroup (G(F)) := G(F) ∩ x U x⁻¹.
- `Reduction.levelArithmetic_discrete` (instance): Its image in G(F_∞) is discrete.
- `Reduction.levelArithmetic_conj` (relation): levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹ for γ ∈ G(F), u ∈ U.
- `Reduction.levelArithmetic_commensurable` (relation): For U′ ≤ U, levelArithmetic x U′ has finite index in levelArithmetic x U.

*Unit tests:*
- `Reduction.levelArithmetic_gl2` (computation): For GL_2/ℚ, levelArithmetic 1 GL_2(ℤ̂) = GL_2(ℤ).
- `Reduction.levelArithmetic_trivial_group` (degenerate): For the trivial group it is trivial.
- `Reduction.levelArithmetic_not_conj_invariant` (non-example): levelArithmetic x U depends on x and not only on U: for GL_2/ℚ and x = diag(p,1) at the place p, levelArithmetic x GL_2(ℤ̂) = diag(p,1) GL_2(ℤ) diag(p,1)⁻¹ ≠ GL_2(ℤ).

*Used by:* AA.3/component-decomposition — the components Γ_i\G(F_∞); AA.4/neat-level — neatness of all Γ_{x,U}; ArithmeticLocallySymmetricSpaces:ALS.0 — explicit stabilizers and component maps; ShimuraData:D5 — the arithmetic subgroup attached to a level and a component.

*Acceptance:* For GL_2/ℚ, U = GL_2(ℤ̂), x = 1: Γ = GL_2(ℤ). For U = K(N) the principal congruence level, Γ = Γ(N) inside GL_2(ℤ).

*Sources:* milne-svi, Lemma 5.13, p. 57.

#### `AA.3/component-decomposition` — Component decomposition of a level quotient (theorem)

Let x_1, …, x_h represent G(F)\G(𝔸_{F,f})/U (class-number-finite). Then [g_∞] ↦ [(g_∞, x_i)] induces a homeomorphism ⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U, equivariant for the right action of G(F_∞); the archimedean factor and the split centre are retained, and the finite set G(F)\G(𝔸_f)/U is in general not the whole quotient.

*Hypotheses:* F a number field; G a connected reductive group over F; U compact open.

*Proof outline:*
1. Every (g_∞, g_f) is G(F)-equivalent to (γ⁻¹g_∞, x_i u) for unique i (Milne 5.13).
2. Injectivity on each piece: (g_∞, x_i) ∼ (g′_∞, x_i) iff g′_∞ = γ g_∞ with γ ∈ Γ_{x_i,U}.
3. Topology: U is open, so G(F)\G(𝔸)/U is a disjoint union of open pieces, each homeomorphic to Γ_{x_i,U}\G(F_∞).

*Prerequisites:* `AA.3/class-number-finite`, `AA.3/arithmetic-subgroup-of-level`, `AA.1/adelic-points-split`, `AA.1/adelic-points-locally-compact`.

*Used by:* ArithmeticLocallySymmetricSpaces:ALS.0 — the finite decomposition of X_K into arithmetic components; AA.4/level-volume-index — volumes of level quotients; AA.5/gl2-upper-half-plane-component — the GL_2 comparison; ShimuraVarieties:V1 — component input (RS-04 link AA.3 → V1).

*Acceptance:* For GL_1/ℚ and U = ℤ̂^×: ℚ^×\𝔸^×/ℤ̂^× ≃ {±1}\ℝ^× ≅ ℝ_{>0}. For GL_2/ℚ, U = K(N): ⊔ over (ℤ/N)^× of Γ(N)\GL_2(ℝ) (AA.5/gl2-upper-half-plane-component).

*Sources:* milne-svi, Lemma 5.13, p. 57; arthur-trace-intro, §2, p. 13.

#### `AA.3/finite-volume` — Finite volume of G(F)\G(𝔸)^1 (theorem)

For connected G over F, the quotient G(F)\G(𝔸_F)^1 has finite volume for the invariant measure of AA.2/automorphic-quotient-measure (G(𝔸)^1 is unimodular).

*Hypotheses:* F a number field; G connected.

*Proof outline:*
1. Borel 5.8: by class-number-finite, G(𝔸)^1 is a finite union of G(F)·x_i·(G(𝔸)^1 ∩ G(F_∞)U), reducing to Γ\(G(F_∞) ∩ G(𝔸)^1) for arithmetic Γ.
2. The latter has finite volume by Borel–Harish-Chandra (Borel 5.8 via [4, 9.4, 11.8]); at the level of this roadmap: the Siegel set of siegel-covering-adelic meets G(𝔸)^1 in a set of finite measure, because ∫ over the cone of e^{-2ρ_0(H_0(a))} da converges on {β(H_0(a) - T_1) > 0}.
3. Finite volume transfers to the quotient since the fibres over the Siegel set are finite (siegel-finiteness-adelic).

*Prerequisites:* `AA.3/siegel-covering-adelic`, `AA.3/siegel-finiteness-adelic`, `AA.3/class-number-finite`, `AA.2/automorphic-quotient-measure`, `AA.2/norm-one-subgroup`, `AA.2/modular-function-parabolic`, `AA.3/adelic-iwasawa`, `AA.3/siegel-set-finite-measure`.

*Acceptance:* For GL_1, vol(F^×\𝔸^1) < ∞ (GlobalNumberFields layer 6 compactness). For SL_2/ℚ, vol(SL_2(ℚ)\SL_2(𝔸)) = vol(SL_2(ℤ)\SL_2(ℝ)) vol(SL_2(ℤ̂)) < ∞.

*Sources:* borel-1963, Theorem 5.8, p. 22.

#### `AA.3/tamagawa-number-finite` — Tamagawa numbers are finite (lemma)

For connected reductive G, the Tamagawa number τ(G) of AA.2/tamagawa-number is finite and positive.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Finite by finite-volume; positive because the quotient measure of a nonempty open set is positive.

*Prerequisites:* `AA.3/finite-volume`, `AA.2/tamagawa-number`.

*Acceptance:* τ(G_m) = 1 is finite.

*Sources:* rosengarten-tamagawa, §1, p. 3.

#### `AA.3/finite-volume-criterion` — When G(F)\G(𝔸) has finite volume (theorem)

For a linear algebraic group G over F, G(F)\G(𝔸_F) carries a G(𝔸)-invariant measure of finite volume iff X*_F(G°) = 0.

*Hypotheses:* F a number field; G linear algebraic over F.

*Proof outline:*
1. If X*_F(G°) = 0 then G(𝔸)^1 has finite index-compact quotient in G(𝔸) and finite-volume applies (Borel 5.6(i)).
2. If χ ≠ 0, ‖χ‖ maps G(F)\G(𝔸) onto a subgroup of ℝ_{>0} containing an open interval, and the invariant measure pushes forward to a Haar measure on that group, which is infinite.

*Prerequisites:* `AA.3/finite-volume`, `AA.2/rational-characters`, `AA.2/log-height`, `AA.2/split-centre-decomposition`.

*Acceptance:* GL_1(F)\GL_1(𝔸) has infinite volume; SL_n(F)\SL_n(𝔸) has finite volume.

*Sources:* borel-1963, Theorem 5.6(i), p. 21.

#### `AA.3/compactness-anisotropic` — Anisotropic groups have compact quotients (theorem)

For connected reductive G over F whose derived group is F-anisotropic (equivalently, G has no proper F-parabolic subgroup), G(F)\G(𝔸_F)^1 is compact.

*Hypotheses:* F a number field; G a connected reductive group over F; G^der F-anisotropic.

*Proof outline:*
1. Then P_0 = G, Δ_0 = ∅, and a Siegel set is ω K with ω compact in G(𝔸)^1·A_G(ℝ)^0 modulo A_G(ℝ)^0 (adelic-siegel-set).
2. siegel-covering-adelic gives G(𝔸)^1 = G(F)·(compact set).

*Prerequisites:* `AA.3/siegel-covering-adelic`, `AA.3/adelic-siegel-set`, `AA.3/minimal-parabolic-data`, `ReductiveGroupsPartII:RG2.1`.

*Acceptance:* For a definite quaternion algebra D over ℚ, D^×(ℚ)\D^×(𝔸)^1 is compact (AA.5/definite-quaternion-compact). For F^× this recovers compactness of F^×\𝔸^1.

*Sources:* borel-1963, Theorem 5.8, p. 22; arthur-trace-intro, §4, p. 21.

#### `AA.3/compactness-isotropic` — Isotropic groups have noncompact quotients (theorem)

For connected reductive G over F with a proper F-parabolic subgroup, G(F)\G(𝔸_F)^1 is not compact. Precisely: G(F)\G(𝔸)^1 is compact iff G(F) has no nontrivial unipotent element iff G^der is F-anisotropic.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. A proper F-parabolic gives a nontrivial F-split torus S ⊄ Z(G) and a nontrivial unipotent u ∈ N_P(F) (Borel–Tits, RG2.1).
2. Choose a ∈ S(F_v) at an archimedean v with a^n u a^{-n} → 1; the points G(F)·a^{-n} cannot have a convergent subsequence in G(F)\G(𝔸)^1 since otherwise γ_n a^{-n}k_n → x would force a^n u a^{-n} ∈ x⁻¹G(F)x near 1, contradicting discreteness (Mahler-type argument).
3. The equivalences with the unipotent and anisotropy conditions are Borel–Tits (RG2.1).

*Prerequisites:* `AA.3/minimal-parabolic-data`, `AA.1/rational-points-discrete`, `ReductiveGroupsPartII:RG2.1`, `AA.2/norm-one-subgroup`.

*Acceptance:* SL_2(ℚ)\SL_2(𝔸) is not compact; the sequence diag(n, 1/n) at ∞ escapes.

*Sources:* borel-1963, Theorem 5.8, p. 22; arthur-trace-intro, §4, p. 21.

#### `AA.3/cocompact-no-unipotents` — Cocompact arithmetic groups contain no unipotents (theorem)

Let G be connected semisimple over ℚ and Γ = G(ℚ) ∩ U for a compact open U ⊂ G(𝔸_f). If Γ\G(ℝ) is compact then Γ contains no nontrivial unipotent element.

*Hypotheses:* G connected semisimple over ℚ; U compact open.

*Proof outline:*
1. By component-decomposition and finite index arguments, Γ\G(ℝ) is compact iff G(ℚ)\G(𝔸) is compact.
2. Apply compactness-isotropic: a nontrivial unipotent in Γ ⊂ G(ℚ) makes G isotropic, hence the quotient noncompact.

*Prerequisites:* `AA.3/compactness-isotropic`, `AA.3/component-decomposition`.

*Acceptance:* SL_2(ℤ)\SL_2(ℝ) is noncompact and SL_2(ℤ) contains (1 1; 0 1). For a definite quaternion algebra the unit groups are finite and contain no unipotents.

*Sources:* bkt-2020, Remarks 1.4(1), p. 5.

#### `AA.3/s-arithmetic-lattice` — S-arithmetic subgroups are lattices (theorem)

Let G be connected semisimple over F, S a finite set of places containing the archimedean ones, and U^S ⊂ G(𝔸_F^S) compact open. Then Γ_S = G(F) ∩ G(F_S)U^S is a lattice in G(F_S) = ∏_{v∈S} G(F_v), cocompact iff G is F-anisotropic.

*Hypotheses:* G connected semisimple over F; S finite ⊇ archimedean places.

*Proof outline:*
1. G(F)\G(F)G(F_S)U^S is open in G(F)\G(𝔸) and homeomorphic to Γ_S\G(F_S)/... ≃ Γ_S\G(F_S) × U^S/(U^S ∩ ...) up to the compact factor U^S (as in component-decomposition with S in place of the archimedean places).
2. An open subset of a finite-volume space has finite volume (finite-volume); compactness by compactness-anisotropic and compactness-isotropic.

*Prerequisites:* `AA.3/finite-volume`, `AA.3/compactness-anisotropic`, `AA.3/compactness-isotropic`, `AA.1/adelic-points-split`, `AA.1/rational-points-discrete`.

*Acceptance:* SL_2(ℤ[1/p]) is a lattice in SL_2(ℝ) × SL_2(ℚ_p).

*Sources:* rapinchuk-sa, §2.6, p. 16; borel-1963, §8, p. 23.

#### `AA.3/adelic-height` — Height functions on G(𝔸) (definition)

For a faithful F-rational representation r : G → GL_m, the height is ‖x‖_r = ∏_v ‖r(x)_v‖_v with ‖y_v‖_v = max_{ij} |y_{ij,v}|_v at finite v and the Hilbert–Schmidt norm at archimedean v; r is chosen (for instance r ⊕ r^∨) so that {‖x‖ ≤ t} is compact. It satisfies ‖xy‖ ≤ ‖x‖‖y‖, ‖x⁻¹‖ ≤ C‖x‖^N and #{γ ∈ G(F) : ‖γ‖ ≤ t} ≤ C t^N.

*Hypotheses:* F a number field; G a connected reductive group over F; r faithful.

*Proof outline:*
1. Finite product since r(x)_v ∈ GL_m(𝒪_v) for almost all v (AA.1/finite-support-conjugate).
2. Submultiplicativity from that of the local norms; the counting bound from discreteness of G(F) and the compactness of height balls (Arthur (13.4), via Borel).

*Prerequisites:* `AA.1/adelic-points`, `AA.1/finite-support-conjugate`, `AA.1/rational-points-discrete`, `AA.1/adelic-map`, `AA.1/gln-adelic`.

*API:*
- `Reduction.height` (constructor): Reduction.height r : AdelicPoints H → ℝ.
- `Reduction.height_mul_le` (relation): height (x * y) ≤ height x * height y.
- `Reduction.height_inv_le` (relation): ∃ C N, height x⁻¹ ≤ C * height x ^ N.
- `Reduction.isCompact_height_le` (characterisation): {x | height x ≤ t} is compact for a suitable r.
- `Reduction.card_rational_height_le` (relation): #{γ ∈ G(F) | height γ ≤ t} ≤ C t^N.

*Unit tests:*
- `Reduction.height_gl1` (computation): For GL_1 with r(x) = diag(x, x⁻¹), height x⁻¹ = height x.
- `Reduction.height_one` (degenerate): height 1 = 1.
- `Reduction.height_not_finite_only` (non-example): If G(F_∞) is noncompact the height is unbounded on G(𝔸); a height built from finite places only would be bounded on G(F_∞) and fail the compactness of height balls.

*Used by:* AutomorphicFormsOnReductiveGroups:AF.0 — moderate growth and polynomial comparability (RS-04: AA.3 owns the height comparison); AutomorphicFormsOnReductiveGroups:AF.3 — rapid decay |φ(x)| ≤ C‖x‖^{-N} on Siegel sets; AA.3/height-siegel-estimate — height on Siegel sets.

*Acceptance:* For GL_1 over ℚ with r(x) = diag(x, x⁻¹): ‖x‖ = ∏_v max(|x|_v, |x|_v⁻¹).

*Sources:* arthur-trace-intro, §13, p. 70.

#### `AA.3/height-representation-comparison` — Comparison of heights (theorem)

For faithful representations r, r′ of G there are C, N > 0 with ‖x‖_{r′} ≤ C ‖x‖_r^N for all x ∈ G(𝔸_F); and replacing K by another admissible maximal compact subgroup changes nothing, heights being bi-K-invariant up to constants.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Each matrix coefficient of r′ is a polynomial in those of r and r^∨ (faithfulness); at almost all places the integral structures agree so the local factor is 1, at finitely many finite places the polynomial bound gives ‖r′(x)_v‖ ≤ c_v ‖r(x)_v‖^N.
2. At archimedean places import the real-group norm comparison from AF.1 (Bernstein–Krötz §2).

*Prerequisites:* `AA.3/adelic-height`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AA.1/finite-support-conjugate`.

*Acceptance:* For GL_n with r = id and r′ = id ⊕ det⁻¹, ‖x‖_{r′} ≤ ‖x‖_r^{n}‖x⁻¹‖ ≤ C‖x‖^{N}.

*Sources:* arthur-trace-intro, §13, p. 70.

#### `AA.3/height-siegel-estimate` — Heights on Siegel sets (lemma)

On a Siegel set 𝔖(T_1, ω) there are c, C > 0 such that for x = pak, c^{-1} e^{c‖H_0(a)‖} ≤ ‖x‖ ≤ C e^{C‖H_0(a)‖} (any norm on a_0); in particular log‖x‖ and ‖H_0(x)‖ are comparable on 𝔖 ∩ G(𝔸)^1 up to constants.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Write r(pak) = r(p) r(a) r(k): r(p), r(k) lie in compact sets; r(a) is diagonalizable with eigenvalues e^{λ(H_0(a))} for the weights λ of r.
2. Upper bound from the largest weight; lower bound because the weights span a_0^* for faithful r.

*Prerequisites:* `AA.3/adelic-height`, `AA.3/adelic-siegel-set`, `AA.3/H-P`.

*Acceptance:* For SL_2/ℚ at ∞, ‖n a_y k‖ ≍ y^{1/2} + y^{-1/2}.

*Sources:* arthur-trace-intro, §13, p. 70.

#### `AA.3/horospherical-decomposition` — Horospherical decomposition for a fixed maximal compact (construction)

Let G be connected semisimple over ℚ, G = G(ℝ)^+, K ⊂ G maximal compact with Cartan involution θ, and 𝐏 a ℚ-parabolic with unipotent radical 𝐍_P and Levi quotient 𝐋_P. With S_P the split centre of 𝐋_P, A_P = S_P(ℝ)^0 and M_P the real points of ⋂_{χ∈X*(𝐋_P)} ker χ², there is a unique θ-stable real Levi lift of (𝐋_P)_ℝ, giving P = N_P A_P M_P and the diffeomorphism N_P × A_P × (M_P K) → G. Left multiplication by p_0 = n_0 a_0 m_0 acts by (n, a, m) ↦ (n_0 · (a_0m_0) n (a_0m_0)⁻¹, a_0 a, m_0 m).

*Hypotheses:* G connected semisimple over ℚ; K a maximal compact subgroup of G(ℝ)^+; 𝐏 a ℚ-parabolic.

*Proof outline:*
1. θ-stable Levi lift: Borel–Serre 1.9 (cited by BKT).
2. The decomposition G = P K (real Iwasawa decomposition, LieGroups layer 9) and P = N_P ⋊ L_P with L_P = A_P × M_P.
3. The action formula is the conjugation computation; BKT print 'right action', corrected to left action (source issue).

*Prerequisites:* `AA.3/minimal-parabolic-data`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`.

*API:*
- `RealSiegel.HoroData` (structure): Structure: N_P, A_P, M_P K, the homeomorphism horoDecomp : G ≃ₜ N_P × A_P × (M_P K) for fixed K and 𝐏, and the simple roots.
- `RealSiegel.horoDecomp_left_mul` (simp): The left action formula of p_0 = n_0 a_0 m_0.
- `RealSiegel.horoDecomp_conj` (functoriality): Conjugation by g ∈ G(ℚ) carries the decomposition for (𝐏, K) to that for (g𝐏g⁻¹, gKg⁻¹).
- `RealSiegel.horoDecomp_change_K` (relation): For K′ = n K n⁻¹ with n ∈ N_P, the A_P-coordinates agree.

*Unit tests:*
- `RealSiegel.horoDecomp_sl2` (computation): For SL_2(ℝ): (x, a, ±k) ↦ n(x) diag(√a, 1/√a)(±k).
- `RealSiegel.horoDecomp_trivial_parabolic` (degenerate): For 𝐏 = 𝐆, N_P = 1, A_P = 1 and the decomposition is G = M_G K.
- `RealSiegel.horoDecomp_not_right_action` (non-example): The formula (n_0a_0m_0)(n,a,m) describes left multiplication; read as a right action it fails already for SL_2 with n_0 ≠ 1.

*Used by:* AA.3/real-siegel-set — coordinates of Siegel sets; ArithmeticLocallySymmetricSpaces:ALS.2 — Borel–Serre corners; ArithmeticQuotientDefinability — definable charts (Part II route of PAPER-BAKKER-KLINGLER-TSIMERMAN-20).

*Acceptance:* For SL_2(ℝ), K = SO(2), 𝐏 upper triangular: N_P = {n(x)}, A_P = {diag(a^{1/2}, a^{-1/2})}, M_P = {±1}. Changing K changes the Levi lift by conjugation by an element of N_P.

*Sources:* bkt-2020, §2.2, p. 8; bkt-2020, (2.2), p. 8.

#### `AA.3/positive-root-coordinates` — Simple roots of P and truncated tori (construction)

Φ(A_P, N_P) is the set of characters of A_P on Lie N_P; Δ(A_P, N_P) = {α_1, …, α_r} is the unique set of dim A_P linearly independent roots of which every root is a nonnegative integral combination (the simple roots). For t > 0, A_{P,t} = {a ∈ A_P : a^α > t for all α ∈ Δ(A_P, N_P)}, and e_P(a) = (a^{-α_1}, …, a^{-α_r}) is a semialgebraic diffeomorphism A_P ≃ (ℝ_{>0})^r with e_P(A_{P,t}) = (0, 1/t)^r.

*Hypotheses:* as in horospherical-decomposition.

*Proof outline:*
1. Root decomposition of 𝔫_P under A_P; the simple roots come from the relative root system of the Levi (RG2.1 over ℚ).
2. e_P is the composite of the logarithm and the dual basis of Δ.

*Prerequisites:* `AA.3/horospherical-decomposition`, `ReductiveGroupsPartII:RG2.1`.

*API:*
- `RealSiegel.HoroData.simpleRoots` (data): Δ(A_P, N_P) as a Finset of positive characters of A_P.
- `RealSiegel.truncatedTorus` (data): A_{P,t}.
- `RealSiegel.cornerCoord` (equivalence): e_P : A_P ≃ (Fin r → ℝ_{>0}).
- `RealSiegel.cornerCoord_truncated` (simp): e_P '' A_{P,t} = Set.pi univ (fun _ => Ioo 0 t⁻¹).

*Unit tests:*
- `RealSiegel.simpleRoots_sl2` (computation): For SL_2 and the Borel, Δ = {α} with diag(a, a⁻¹)^α = a².
- `RealSiegel.simpleRoots_minimal_rank` (degenerate): For a maximal parabolic of SL_n, Δ has one element.
- `RealSiegel.simpleRoots_not_all_roots` (non-example): For the Borel of SL_3 the root α_1 + α_2 is positive but not simple; truncating by it alone does not give A_{P,t}.

*Used by:* AA.3/real-siegel-set — the truncation A_{P,t}; ArithmeticLocallySymmetricSpaces:ALS.2 — corner coordinates e_P.

*Acceptance:* For SL_3 and the Borel, Δ = {α_1, α_2} and A_{P,t} = {a_1/a_2 > t, a_2/a_3 > t}.

*Sources:* bkt-2020, §2.2, p. 8.

#### `AA.3/real-siegel-set` — Siegel set for a fixed maximal compact (definition)

For a ℚ-parabolic 𝐏, a maximal compact K ⊂ G = G(ℝ)^+, t > 0 and bounded (relatively compact open semialgebraic) U ⊂ N_P, W ⊂ M_P K, the Siegel set associated to 𝐏 and K is 𝔖 = U × A_{P,t} × W ⊂ G in horospherical coordinates. For a connected compact M ⊂ K, a Siegel set of G/M associated to K is the image of such a set; K is fixed once and for all (BKT Definition 2.5 as corrected by the 2023 erratum).

*Hypotheses:* as in horospherical-decomposition; K fixed.

*Proof outline:*
1. Define from horospherical-decomposition and positive-root-coordinates; semialgebraicity from that of the coordinates.

*Prerequisites:* `AA.3/horospherical-decomposition`, `AA.3/positive-root-coordinates`.

*API:*
- `RealSiegel.siegelSet` (constructor): RealSiegel.siegelSet 𝐏 K U t W : Set G.
- `RealSiegel.mem_siegelSet` (characterisation): Membership in horospherical coordinates.
- `RealSiegel.siegelSet_mono` (relation): Monotone in U, W and antitone in t.
- `RealSiegel.siegelSet_quotient` (projection): The image in G/M.

*Unit tests:*
- `RealSiegel.siegelSet_sl2` (computation): For SL_2 and K = SO(2), the image in ℍ is {x + iy : x ∈ U, y > t}.
- `RealSiegel.siegelSet_anisotropic` (degenerate): For 𝐏 = 𝐆 (only possible when 𝐆 is ℚ-anisotropic), a Siegel set is a bounded set W.
- `RealSiegel.siegelSet_needs_fixed_K` (non-example): Siegel sets for different K are not interchangeable: for SL_2, P upper triangular and x ≠ i in ℍ, a Siegel set B_N B_A K_x is not contained in finitely many SL_2(ℤ)-translates of Siegel sets for K_i (erratum §1.6.1).

*Used by:* AA.3/real-siegel-finite-cover — finitely many Siegel sets cover Γ\G/M; ArithmeticQuotientDefinability — the definable structure characterised by fixed-K Siegel charts; AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain — general Siegel-set reduction (request from MZ0); GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness — reduction domains.

*Acceptance:* For SL_2(ℤ)\SL_2(ℝ)/SO(2): {x + iy : |x| < 1, y > t}. With K varying between Siegel sets, the definable structure of BKT Theorem 1.1 is not well defined (erratum).

*Sources:* bkt-2020, Definition 2.3, p. 8; bkt-erratum, §1.1, p. 1.

#### `AA.3/real-siegel-translation` — Translating and conjugating Siegel sets (lemma)

For g ∈ G(ℚ), g𝔖g⁻¹ is a Siegel set associated to g𝐏g⁻¹ and gKg⁻¹. For g ∈ G, 𝔖g is a Siegel set for 𝐏 and g⁻¹Kg, and for g ∈ 𝐏(ℝ), g𝔖 is a Siegel set for 𝐏 and K (exactly, for the sets U a A_{>0} W of the erratum; for Definition 2.3's A_{P,t}, up to containment). Consequently, for γ ∈ 𝐆(ℚ)^+, γ𝔖 is contained in a Siegel set associated to γ𝐏γ⁻¹ and the same K.

*Hypotheses:* as in real-siegel-set.

*Proof outline:*
1. Conjugation transports horospherical coordinates (horoDecomp_conj).
2. Right translation by g changes the base point; left translation by p ∈ P uses the left action formula.
3. For γ ∈ G(ℚ)^+, write γ = p k with p ∈ (γPγ⁻¹)(ℝ) relative to K and combine.

*Prerequisites:* `AA.3/real-siegel-set`, `AA.3/horospherical-decomposition`.

*Acceptance:* For SL_2, γ ∈ SL_2(ℤ) sends {y > t} near the cusp ∞ to a horoball at γ∞.

*Sources:* bkt-2020, Lemma 2.4, p. 8; bkt-erratum, Remark 1.1(1), p. 2.

#### `AA.3/finitely-many-cusps` — Finitely many cusps (theorem)

For an arithmetic subgroup Γ ⊂ 𝐆(ℚ), there are only finitely many Γ-conjugacy classes of ℚ-parabolic subgroups.

*Hypotheses:* G connected semisimple over ℚ; Γ arithmetic.

*Proof outline:*
1. Every ℚ-parabolic is 𝐆(ℚ)-conjugate to a standard one (minimal-parabolic-data).
2. 𝐆(ℚ) = ⊔_{finite} Γ g_i 𝐏(ℚ) for each standard 𝐏 (Borel 7.3: finiteness of G_ℤ\(G/P)_ℚ, via class-number-finite for the adelic form).

*Prerequisites:* `AA.3/minimal-parabolic-data`, `AA.3/class-number-finite`, `AA.3/arithmetic-subgroup-of-level`, `AA.3/parabolic-double-cosets-finite`.

*Acceptance:* For SL_2(ℤ) there is one cusp; for Γ_0(p), two.

*Sources:* bkt-2020, Proposition 2.7(1), p. 9; borel-1963, Theorem 7.3, p. 26.

#### `AA.3/real-siegel-finite-cover` — Finitely many fixed-K Siegel sets cover (theorem)

Let 𝐏_1, …, 𝐏_k represent the Γ-conjugacy classes of ℚ-parabolics and K a fixed maximal compact. There are Siegel sets 𝔖_i = U_i × A_{𝐏_i,t_i} × W_i associated to 𝐏_i and the same K whose images cover Γ\G/M.

*Hypotheses:* G connected semisimple over ℚ; Γ arithmetic; K fixed, M ⊂ K compact.

*Proof outline:*
1. Borel–Ji Proposition 2.5 with base points x_i; the erratum shows the base point can be taken equal to the fixed K for all i, using real-siegel-translation to move each 𝔖_i to K at the cost of enlarging U_i, W_i and shrinking t_i.
2. The adelic covering siegel-covering-adelic projected to the archimedean component gives the same conclusion.

*Prerequisites:* `AA.3/finitely-many-cusps`, `AA.3/real-siegel-set`, `AA.3/real-siegel-translation`, `AA.3/siegel-covering-adelic`, `AA.3/component-decomposition`.

*Acceptance:* For SL_2(ℤ), one Siegel set {|x| ≤ 1/2, y ≥ √3/2} covers.

*Sources:* bkt-2020, Proposition 2.7(1), p. 9; bkt-erratum, §1.1, p. 1.

#### `AA.3/real-siegel-finite-overlap` — Finite overlaps of Siegel sets (theorem)

For Siegel sets 𝔖_1, 𝔖_2 associated to the same K, the set {γ ∈ Γ : γ𝔖_1 ∩ 𝔖_2 ≠ ∅} is finite; the same holds for the relatively compact closures of their unipotent and Levi factors.

*Hypotheses:* as in real-siegel-finite-cover.

*Proof outline:*
1. Borel–Ji Proposition 2.5(2) (Siegel property), via the reduction to GL_n and the finiteness of Γ ∩ (compact) (Borel's Introduction aux groupes arithmétiques §15, not read; the adelic form siegel-finiteness-adelic is the route of this roadmap).

*Prerequisites:* `AA.3/real-siegel-set`, `AA.3/real-siegel-translation`, `AA.1/rational-points-discrete`.

*Acceptance:* For SL_2(ℤ) and the standard Siegel set, finitely many γ (the identity, S, T^{±1}, ST, TS up to sign).

*Sources:* bkt-2020, Proposition 2.7(2), p. 9.

#### `AA.3/cusp-separation` — Inequivalent cusps separate (theorem)

If 𝐏_1 and 𝐏_2 are not Γ-conjugate, then for fixed U_i, W_i and all sufficiently large t_1, t_2, γ𝔖_1 ∩ 𝔖_2 = ∅ for every γ ∈ Γ.

*Hypotheses:* as in real-siegel-finite-cover.

*Proof outline:*
1. By real-siegel-finite-overlap only finitely many γ are relevant; for each, γ𝐏_1γ⁻¹ ≠ 𝐏_2, and deep parts of Siegel sets for different parabolics are disjoint (deep-distinct-parabolics).

*Prerequisites:* `AA.3/real-siegel-finite-overlap`, `AA.3/deep-distinct-parabolics`.

*Acceptance:* For Γ_0(p), the Siegel sets at the two cusps ∞ and 0 are disjoint modulo Γ_0(p) once t is large.

*Sources:* bkt-2020, Proposition 2.7(3), p. 9.

#### `AA.3/deep-cusp-stabilizer` — Deep self-intersections come from the parabolic (theorem)

For fixed U, W and sufficiently large t, a Siegel set 𝔖 for 𝐏 and K satisfies γ𝔖 ∩ 𝔖 = ∅ for every γ ∈ Γ ∖ Γ_𝐏, where Γ_𝐏 = Γ ∩ 𝐏(ℚ).

*Hypotheses:* as in real-siegel-finite-cover.

*Proof outline:*
1. Finitely many candidates γ by real-siegel-finite-overlap; for γ ∉ 𝐏, γ𝐏γ⁻¹ ≠ 𝐏 and deep-distinct-parabolics applies to γ𝔖 (a Siegel set for γ𝐏γ⁻¹, real-siegel-translation).

*Prerequisites:* `AA.3/real-siegel-finite-overlap`, `AA.3/real-siegel-translation`, `AA.3/deep-distinct-parabolics`.

*Acceptance:* For SL_2(ℤ) and t > 1, only the translations ±T^n map the horoball {y > t} to itself.

*Sources:* bkt-2020, Proposition 2.7(4), p. 9.

#### `AA.3/deep-distinct-parabolics` — Deep Siegel sets of distinct parabolics are disjoint (theorem)

For distinct ℚ-parabolics 𝐏_1 ≠ 𝐏_2 and fixed bounded U_i, W_i (one K), the Siegel sets 𝔖_1, 𝔖_2 are disjoint once t_1, t_2 are sufficiently large.

*Hypotheses:* as in real-siegel-finite-cover.

*Proof outline:*
1. In horospherical coordinates of 𝐏_1, points of 𝔖_2 have A_{𝐏_1}-coordinate bounded in the direction of some simple root (Borel–Ji 2.5(5), using the relative Bruhat decomposition of 𝐏_1 and 𝐏_2).

*Prerequisites:* `AA.3/real-siegel-set`, `AA.3/horospherical-decomposition`, `ReductiveGroupsPartII:RG2.1`.

*Acceptance:* For SL_2, the horoballs at two distinct rational cusps are disjoint for large t.

*Sources:* bkt-2020, Proposition 2.7(5), p. 9.

#### `AA.3/siegel-convention-comparison` — Comparison of Siegel-set conventions (theorem)

Fix K. Every Siegel set U × A_{P,t} × W associated to 𝐏 and K is contained in a Siegel set Ω A_{t′} K in Orr's sense for a Siegel triple (𝐏_0, 𝐒_0, K) with 𝐏_0 ⊂ 𝐏 a minimal ℚ-parabolic, and conversely; every Siegel set for K lies in a 𝐆(ℚ)-translate of one for K and a fixed minimal ℚ-parabolic.

*Hypotheses:* as in real-siegel-set.

*Proof outline:*
1. Write m ∈ W as n′a′m′k′ in M_P relative to 𝐏_0 ∩ 𝐋_P; A_P is central in L_P, so u a m k = (u n′)(a a′) m′ (k′ k), and the simple roots of 𝐏_0 are bounded below on a a′ because a′ ranges in a compact set.
2. The last statement: all minimal ℚ-parabolics are 𝐆(ℚ)-conjugate (minimal-parabolic-data) and real-siegel-translation.

*Prerequisites:* `AA.3/real-siegel-set`, `AA.3/real-siegel-translation`, `AA.3/minimal-parabolic-data`.

*Acceptance:* For SL_2 the two conventions coincide.

*Sources:* bkt-2020, §2.2, p. 8.

#### `AA.3/orr-schnell-containment` — Containment of subgroup Siegel sets (theorem)

Let 𝐇 ⊂ 𝐆 be reductive ℚ-groups, (𝐏_H, 𝐒_H, K_H) a Siegel triple for 𝐇 and 𝔖_H = Ω A_t K_H a Siegel set. Let K_G ⊂ 𝐆(ℝ) be maximal compact with K_H ⊂ K_G and whose Cartan involution stabilises 𝐒_H. Then there are a Siegel triple (𝐏_G, 𝐒_G, K_G), a Siegel set 𝔖_G for it and a finite C ⊂ 𝐆(ℚ) with 𝔖_H ⊂ C·𝔖_G; moreover R_u(𝐏_H) ⊂ R_u(𝐏_G) and 𝐒_H = 𝐒_G ∩ 𝐇.

*Hypotheses:* 𝐇 ⊂ 𝐆 reductive over ℚ; K_H ⊂ K_G; θ_{K_G} stabilises 𝐒_H.

*Proof outline:*
1. Orr–Schnell, Theorem 1 (2023), as used by the BKT erratum in place of the original Theorem 3.2; its proof (choice of a cocharacter of 𝐒_H regular for 𝐆 and comparison of root cones) is not read here and is recorded as a source-audit task in the handoff.

*Prerequisites:* `AA.3/siegel-convention-comparison`, `AA.3/real-siegel-set`, `AA.3/minimal-parabolic-data`.

*Acceptance:* For 𝐇 = 𝐆 it is trivial with C = {1}.

*Sources:* bkt-erratum, Proof of Theorem 1.2, p. 3.

#### `AA.3/cartan-subgroup-criterion` — Stability of the subgroup under the Cartan involution suffices (lemma)

In the setting of orr-schnell-containment with K_H ⊂ K_G: if the Cartan involution Θ of 𝐆 for K_G stabilises 𝐇, then Θ|_𝐇 is the Cartan involution of 𝐇 for K_H and Θ stabilises the torus 𝐒_H of every Siegel triple, so the theorem applies. The converse fails for 𝐆 = SL_2, 𝐇 = {(a, db; b, a) : a² − db² = 1} with d a positive non-square rational, K_G = SO_2(ℝ), 𝐒_H = {1}.

*Hypotheses:* as in orr-schnell-containment.

*Proof outline:*
1. A Cartan involution of 𝐆 stabilising 𝐇 restricts to one of 𝐇 (uniqueness of Cartan involutions up to conjugacy fixing K_H).
2. Counterexample: 𝐇(ℝ) is a split torus not stable under transpose-inverse, but 𝐒_H = {1} is.

*Prerequisites:* `AA.3/orr-schnell-containment`.

*Acceptance:* The counterexample: transpose-inverse sends (a, db; b, a) to (a, −b; −db, a), not in 𝐇 for d ≠ 1.

*Sources:* bkt-erratum, Proof of Theorem 1.2, p. 3.

#### `AA.3/rational-siegel-pullback` — Intersecting Siegel sets with a subgroup (theorem)

Let 𝐇 ⊂ 𝐆 be reductive over ℚ, K_H = K_G ∩ 𝐇(ℝ) maximal compact, and assume every K_H-Siegel set lies in finitely many 𝐆(ℚ)-translates of a K_G-Siegel set (the conclusion of orr-schnell-containment). Then for every K_G-Siegel set 𝔖_G there are a K_H-Siegel set 𝔖_H and a finite F ⊂ 𝐇(ℚ) with 𝔖_G ∩ 𝐇(ℝ) ⊂ F 𝔖_H.

*Hypotheses:* as stated, with the forward-containment hypothesis.

*Proof outline:*
1. BGST 2021, Proposition 28.1, replacing Borel–Harish-Chandra 7.5 (erratum §1.5): cover 𝐇(ℝ) by finitely many Γ_H-translates of K_H-Siegel sets (real-siegel-finite-cover for 𝐇), push them into 𝐆-Siegel sets by the hypothesis, and use real-siegel-finite-overlap in 𝐆 to bound the translates meeting 𝔖_G.

*Prerequisites:* `AA.3/orr-schnell-containment`, `AA.3/real-siegel-finite-cover`, `AA.3/real-siegel-finite-overlap`.

*Acceptance:* For 𝐇 = 𝐆 it is trivial.

*Sources:* bkt-2020, §4.5, p. 17; bkt-erratum, §1.5, p. 3.

#### `AA.3/incompatible-morphism-obstruction` — Compact inclusion alone does not give Siegel containment (theorem)

There are inclusions of reductive (even semisimple) ℚ-groups 𝐇 ⊂ 𝐆 with K_H ⊂ K_G for which some 𝐇-Siegel set is not covered by finitely many 𝐆(ℚ)-translates of K_G-Siegel sets; the Cartan compatibility hypothesis of orr-schnell-containment cannot be removed.

*Proof outline:*
1. Orr–Schnell §§B–C construct the examples (recorded in the reviewed extraction; not re-derived here).

*Prerequisites:* `AA.3/orr-schnell-containment`.

*Acceptance:* Any definable-morphism interface built on Siegel sets must carry the Cartan compatibility hypothesis.

*Sources:* bkt-erratum, §1.6.2, p. 4.

#### `AA.3/orbit-map-siegel-preimage` — Preimages of Siegel sets under orbit maps (theorem)

Let 𝐇 ⊂ SL(V) be reductive over ℚ, x_0 ∈ X = SL(V_ℝ)/SO(b_0) with K_H = Stab_{𝐇(ℝ)}(x_0) and the Cartan involution of x_0 stabilising Lie 𝐇, and ι : 𝐇(ℝ)/K_H → X the orbit map. For every Siegel set 𝔖 ⊂ X, ι⁻¹(𝔖) is contained in finitely many Siegel sets of 𝐇(ℝ)/K_H associated to K_H.

*Hypotheses:* as stated.

*Proof outline:*
1. ι⁻¹(𝔖_SL x_0) = (𝔖_SL K_SL ∩ 𝐇(ℝ)) x_0; apply rational-siegel-pullback, whose forward-containment hypothesis is orr-schnell-containment with cartan-subgroup-criterion.

*Prerequisites:* `AA.3/rational-siegel-pullback`, `AA.3/orr-schnell-containment`, `AA.3/cartan-subgroup-criterion`.

*Acceptance:* For 𝐇 = SL(V) it is trivial. The Hodge-theoretic specialization (period domains D and the map to positive forms) belongs to DegeneratingHodgeStructures.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/orbit-map-siegel-image` — Images of Siegel sets under orbit maps (theorem)

In the setting of orbit-map-siegel-preimage, every Siegel set of 𝐇(ℝ)/K_H is mapped by ι into finitely many Siegel sets of X.

*Hypotheses:* as in orbit-map-siegel-preimage.

*Proof outline:*
1. Apply orr-schnell-containment to 𝐇 ⊂ SL(V); Siegel sets of X do not depend on the choice of maximal compact up to rational translates, and c𝔖 for c ∈ SL(V_ℚ) is a Siegel set (real-siegel-translation).

*Prerequisites:* `AA.3/orr-schnell-containment`, `AA.3/real-siegel-translation`.

*Acceptance:* For 𝐇 = SO(Q) of an indefinite form, Siegel sets of the symmetric space map into finitely many Siegel sets of positive forms.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/reduced-form` — Reduced positive forms (definition)

Given an ordered basis e = (e_i) of V_ℚ (integral bases of V_ℤ in BKT), C > 0 and a positive definite symmetric form b on V_ℝ, b is (e, C)-reduced if (1) |b(e_i, e_j)| < C b(e_i, e_i) for all i, j; (2) b(e_i, e_i) < C b(e_j, e_j) for i < j; (3) ∏_i b(e_i, e_i) < C det(b), the Gram determinant in e.

*Hypotheses:* V a finite-dimensional ℚ-vector space; e an ordered basis; C > 0.

*Proof outline:*
1. Define as a predicate on Gram matrices.

*Prerequisites:* `tauceti:TauCeti.cholesky`.

*API:*
- `RealSiegel.IsReduced` (constructor): RealSiegel.IsReduced e C b : Prop for a positive definite matrix b in the basis e.
- `RealSiegel.IsReduced.mono` (relation): IsReduced e C b → C ≤ C′ → IsReduced e C′ b.
- `RealSiegel.IsReduced.smul` (relation): IsReduced e C b ↔ IsReduced e C (λ • b) for λ > 0.
- `RealSiegel.IsReduced.cholesky` (characterisation): In terms of the Cholesky factorization b = Nᵀ D N (TauCeti.cholesky), (e, C)-reducedness bounds N's off-diagonal entries and the ratios of consecutive entries of D.

*Unit tests:*
- `RealSiegel.IsReduced_identity` (computation): The identity matrix of size n is (std, 2)-reduced.
- `RealSiegel.IsReduced_dim_one` (degenerate): In dimension 1 every positive form is (e, C)-reduced for C > 1.
- `RealSiegel.IsReduced_not_ordered` (non-example): diag(4, 1) is not (std, 2)-reduced (condition (2) fails) although diag(1, 4) is.

*Used by:* AA.3/reduction-siegel-dictionary — reduced forms versus Siegel sets; AA.3/siegel-covering-adelic — Hermite–Minkowski reduction for GL_n; AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain — Minkowski-reduced domains.

*Acceptance:* The identity form is (e, 2)-reduced for the standard basis. Rescaling e_i by integers changes C by bounded factors.

*Sources:* bkt-2020, Definition 4.11, p. 17.

#### `AA.3/reduced-form-set` — The set T_{e,C} of reduced forms (construction)

T_{e,C} = {b ∈ X : b is (e, C)-reduced} ⊂ X, the space of positive definite forms on V_ℝ; it is semialgebraic and satisfies T_{ge,C} = g·T_{e,C} for g ∈ GL(V_ℚ).

*Hypotheses:* as in reduced-form.

*Proof outline:*
1. Defined by finitely many polynomial inequalities in the Gram entries.
2. Change of basis transports the inequalities.

*Prerequisites:* `AA.3/reduced-form`.

*API:*
- `RealSiegel.reducedSet` (constructor): RealSiegel.reducedSet e C : Set (PosDefMatrix n).
- `RealSiegel.reducedSet_mono` (relation): Monotone in C.
- `RealSiegel.reducedSet_smul_basis` (functoriality): reducedSet (g • e) C = g • reducedSet e C.

*Unit tests:*
- `RealSiegel.reducedSet_contains_one` (computation): 1 ∈ reducedSet std 2.
- `RealSiegel.reducedSet_dim_one` (degenerate): For n = 1 and C > 1, reducedSet = all positive reals.
- `RealSiegel.reducedSet_not_closed_under_inverse` (non-example): diag(1, 4) ∈ reducedSet std 2 but its inverse diag(1, 1/4) is not.

*Used by:* AA.3/reduction-siegel-dictionary — comparison with Siegel sets; AA.3/basis-change-reducedness — covering by finitely many T_{σe,C″}.

*Acceptance:* T_{e,C} increases with C and exhausts X as C → ∞.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/reduction-siegel-dictionary` — Reduced forms and Siegel sets (theorem)

For an integral ordered basis e of V_ℤ and C > 0, T_{e,C} is contained in a Siegel set of X = SL(V_ℝ)/SO, and every Siegel set of X is contained in T_{e,C} for some e and C (the same for rational bases since T_{ge,C} = g·T_{e,C}).

*Hypotheses:* V_ℤ a lattice in V_ℚ.

*Proof outline:*
1. Write b = Nᵀ D N (Cholesky, Tau Ceti): conditions (1)–(3) bound the entries of N and the successive ratios of D, which are exactly the unipotent and A_{P_0,t} conditions for the upper triangular Borel (Klingen, Proposition 2, p. 18; the original proof is a recorded source-audit task).
2. Conversely a Siegel set has bounded N and ratios bounded below, which gives (1)–(3) with some C.

*Prerequisites:* `AA.3/reduced-form-set`, `AA.3/real-siegel-set`, `tauceti:TauCeti.cholesky`, `tauceti:TauCeti.cholesky_mul_transpose`.

*Acceptance:* For n = 2, reduced forms correspond to the standard Siegel set {|x| ≤ c, y ≥ t} in ℍ.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/gram-diagonal-lower-bound` — Lower bound by diagonal entries (lemma)

Let B be a positive definite real symmetric n × n matrix with diagonal d_k = B_kk and D ≥ 1 with ∏_k d_k ≤ D det B. Then for every real vector a and every k, aᵀ B a ≥ a_k² d_k / D.

*Hypotheses:* B positive definite; ∏ d_k ≤ D det B.

*Proof outline:*
1. By Cramer's rule and Hadamard's inequality applied to the minor, (B⁻¹)_kk ≤ ∏_{j≠k} d_j / det B ≤ D / d_k.
2. Cauchy–Schwarz for the inner product B: a_k² = ⟨a, B⁻¹e_k⟩_B² ≤ (aᵀBa)(B⁻¹)_kk.

*Prerequisites:* `tauceti:TauCeti.cholesky_mul_transpose`.

*Acceptance:* For B diagonal and D = 1 it is the trivial bound.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/gram-offdiagonal-transfer` — Transferring off-diagonal bounds to another basis (lemma)

Let B be the Gram matrix in an ordered basis e′ of a positive definite form b with |B_ab| ≤ C′ d_a, d_a ≤ C′ d_b for a < b and ∏ d_a ≤ C′ det B (C′ ≥ 1). For a fixed basis e_i = ∑_a A_ai e′_a put k_i = max{a : A_ai ≠ 0}, m_i = |A_{k_i,i}|, L_i = ∑_a |A_ai|. Then |b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i) for all i, j.

*Hypotheses:* as stated.

*Proof outline:*
1. Expand b(e_i, e_j) and bound each term by C′ max(d_a, d_b) ≤ C′² d_{k_i}-type bounds using the ordering.
2. Lower-bound b(e_i, e_i) ≥ m_i² d_{k_i}/C′ by gram-diagonal-lower-bound.

*Prerequisites:* `AA.3/gram-diagonal-lower-bound`.

*Acceptance:* For A the identity it reduces to condition (1).

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/basis-change-reducedness` — Basis change with determinant control (theorem)

Let e, e′ be bases of V_ℚ (m = dim V) and C, C′ ≥ 1. If b is (e′, C′)-reduced and ∏_i b(e_i, e_i) ≤ C det(b in e), then b is (σe, C″)-reduced for the ordering σ of e that sorts the values b(e_i, e_i), with C″ depending only on C, C′ and the change-of-basis matrix; hence b lies in one of the m! sets T_{σe,C″}. The printed statement with the fixed ordering e is false.

*Hypotheses:* as stated.

*Proof outline:*
1. Off-diagonal condition (1) from gram-offdiagonal-transfer; (3) is the hypothesis; (2) holds after sorting.
2. Counterexample to the fixed-order version: e′ = (e_1, e_2) standard, e = (e_2, e_1), b = diag(1, 1000).

*Prerequisites:* `AA.3/gram-offdiagonal-transfer`, `AA.3/gram-diagonal-lower-bound`, `AA.3/reduced-form-set`.

*Acceptance:* For e = e′ the statement is trivial with σ = id.

*Sources:* bkt-2020, §4.5, p. 17.

#### `AA.3/gln-real-reduction` — Reduction for GL_n(ℝ) (theorem)

There are C > 0 and a standard Siegel set 𝔖 ⊂ GL_n(ℝ) (with respect to O(n) and the upper triangular Borel) such that GL_n(ℝ) = GL_n(ℤ)·𝔖; equivalently every positive definite form is GL_n(ℤ)-equivalent to an (e, C)-reduced form for the standard basis e.

*Hypotheses:* n ≥ 1.

*Proof outline:*
1. Hermite–Minkowski reduction: choose successive minima vectors to build a basis in which the Gram matrix is reduced (Siegel's theorem, cited by Borel 3.3).
2. Translate reducedness into the Siegel-set conditions through reduction-siegel-dictionary.

*Prerequisites:* `AA.3/reduction-siegel-dictionary`, `AA.3/reduced-form-set`, `mathlib:ModularGroup.exists_smul_mem_fd`.

*Acceptance:* For n = 2 this is the classical reduction of binary forms, giving ModularGroup.exists_smul_mem_fd.

*Sources:* borel-1963, §3.3, p. 15.

#### `AA.3/gln-adelic-covering` — Adelic reduction for GL_n over ℚ (lemma)

For a standard Siegel domain 𝔖 of GL_n(ℝ), GL_n(𝔸_ℚ) = GL_n(ℚ) · (𝔖 × GL_n(ℤ̂)).

*Hypotheses:* n ≥ 1.

*Proof outline:*
1. GL_n(𝔸_f) = GL_n(ℚ)GL_n(ℤ̂) (class number one for GL_n over ℚ, Borel 2.2).
2. Then reduce the archimedean component by gln-real-reduction, using GL_n(ℚ) ∩ GL_n(ℤ̂) = GL_n(ℤ).

*Prerequisites:* `AA.3/gln-real-reduction`, `AA.3/class-number-finite`.

*Acceptance:* For n = 1: 𝔸^× = ℚ^×·(ℝ^× × ℤ̂^×).

*Sources:* borel-1963, Lemma 4.4, p. 17.

#### `AA.3/self-adjoint-reduction` — Reduction for reductive subgroups of GL_n (lemma)

Let G ⊂ GL_n be reductive over ℚ with a(G(ℝ))a⁻¹ self-adjoint for some a ∈ SL_n(ℝ). There are finitely many b_i ∈ GL_n(ℚ) such that ⋃_i (a⁻¹𝔖 GL_n(ℤ̂) b_i ∩ G(𝔸)) is a fundamental set for G(ℚ) in G(𝔸).

*Hypotheses:* G reductive over ℚ; self-adjoint embedding.

*Proof outline:*
1. Realize G as the stabilizer of a point w with closed GL_n-orbit in a rational representation (Borel–Harish-Chandra 3.8).
2. Finiteness: the points of w·GL_n(𝔸_ℚ)(𝔖 GL_n(ℤ̂)) meeting w·GL_n(ℚ) are finite in number (Borel 3.4, 4.3).
3. Combine with gln-adelic-covering.

*Prerequisites:* `AA.3/gln-adelic-covering`, `AA.3/closed-orbit-finiteness`.

*Acceptance:* For G = SL_n the single b = 1 suffices.

*Sources:* borel-1963, Theorem 4.5, p. 17.

#### `AA.3/closed-orbit-finiteness` — Rational points on closed orbits (theorem)

Let G be reductive over F, H ⊂ G a reductive F-subgroup and σ : G → H\G. Then σ_𝔸(G(𝔸)) ∩ (H\G)(F) is a finite union of G(F)-orbits.

*Hypotheses:* G, H reductive.

*Proof outline:*
1. H\G is affine (Matsushima), realized as a closed orbit w·ρ(G) in a rational representation (Borel 5.3).
2. For a fundamental set Ω with property (F3), w·ρ_𝔸(Ω) ∩ F^n is finite (Borel 4.6), which gives finitely many orbits (Borel 5.4).

*Prerequisites:* `AA.3/unipotent-class-number-one`.

*Acceptance:* For G = GL_n acting on quadratic forms, the forms in a genus form finitely many classes.

*Sources:* borel-1963, Theorem 5.4, p. 20.

#### `AA.3/siegel-set-finite-measure` — Siegel sets in G(𝔸)^1 have finite measure (lemma)

For an adelic Siegel set 𝔖 = 𝔖(T₁, ω), the measure of 𝔖 ∩ G(𝔸)^1 is finite.

*Hypotheses:* G connected reductive; ω compact.

*Proof outline:*
1. By the Iwasawa integration formula, the measure of 𝔖 ∩ G(𝔸)^1 is at most vol(ω) vol(K) ∫ e^{−2ρ_0(H_0(a))} da over {a ∈ A_0(ℝ)^0 ∩ G(𝔸)^1 : β(H_0(a) − T₁) > 0}.
2. On the cone shifted by T₁, 2ρ_0 is a positive combination of the simple roots, so the integral of the exponential converges (a product of one-dimensional integrals of e^{−c t} over t > t₀).

*Prerequisites:* `AA.3/adelic-siegel-set`, `AA.3/adelic-iwasawa`, `AA.2/modular-function-parabolic`, `AA.3/relative-chamber`.

*Acceptance:* For SL_2/ℚ, the classical Siegel set {|x| ≤ 1/2, y > t} has hyperbolic area ∫∫ dx dy/y² < ∞.

*Sources:* arthur-trace-intro, §8, p. 38.

#### `AA.3/parabolic-double-cosets-finite` — Finitely many G(𝒪)-orbits on rational flags (theorem)

For connected G and an F-parabolic P, (G/P)(F) is a finite union of orbits of an arithmetic subgroup; equivalently G(F) = ⋃_{i∈I} Γ x_i P(F) with I finite.

*Hypotheses:* G connected; P parabolic over F.

*Proof outline:*
1. G/P is projective, so (G/P)(𝔸) is compact and G(𝔸) = C·P(𝔸) for a compact C (Godement, Borel 7.2).
2. Cover C by finitely many translates of an open compact subgroup and use class-number-finite for P.

*Prerequisites:* `AA.3/class-number-finite`, `AA.3/minimal-parabolic-data`.

*Acceptance:* For SL_2(ℤ) acting on ℙ¹(ℚ) there is one orbit (one cusp).

*Sources:* borel-1963, Theorem 7.3, p. 26.

#### `AA.3/arithmetic-quotient-finite-volume` — Arithmetic quotients have finite volume (theorem)

For connected reductive G over F and Γ = G(F) ∩ U with U ⊂ G(𝔸_{F,f}) compact open, Γ\(G(F_∞)/A_G(ℝ)^0) has finite invariant volume.

*Hypotheses:* G connected reductive; U compact open.

*Proof outline:*
1. By component-decomposition, Γ\(G(F_∞)/A_G(ℝ)^0) is one of finitely many pieces of G(F)\G(𝔸)/A_G(ℝ)^0 U, which is the quotient of G(F)\G(𝔸)^1 by the compact U.
2. finite-volume gives the finiteness.

*Prerequisites:* `AA.3/component-decomposition`, `AA.3/finite-volume`, `AA.2/quotient-norm-one-comparison`.

*Acceptance:* SL_2(ℤ)\SL_2(ℝ) has finite volume.

*Sources:* borel-1963, Theorem 5.6, p. 21.

#### `AA.3/division-algebra-no-unipotent` — Division algebras have no nontrivial unipotent units (lemma)

If D is a division algebra over a field of characteristic 0, then D^× contains no unipotent element other than 1.

*Hypotheses:* D a division algebra.

*Proof outline:*
1. If u is unipotent then (u − 1)^m = 0 for some m; in a division algebra this forces u − 1 = 0.

*Prerequisites:* `mathlib:QuaternionAlgebra`.

*Acceptance:* In Hamilton's quaternions over ℚ every unit other than 1 has a non-nilpotent u − 1.

*Sources:* milne-svi, §3, p. 33.

#### `AA.3/arithmetic-quotient-compact` — Arithmetic quotients of anisotropic groups are compact (theorem)

In the setting of arithmetic-quotient-finite-volume, Γ\(G(F_∞)/A_G(ℝ)^0) is compact iff G^der is F-anisotropic; for an anisotropic inner form SL_1(D) of a central division algebra D, H(F)\H(𝔸_F) and Γ\H(F_∞) are compact.

*Hypotheses:* G connected reductive.

*Proof outline:*
1. Same reduction as arithmetic-quotient-finite-volume, now with compactness-anisotropic and compactness-isotropic.
2. SL_1(D) for a division algebra D has no nontrivial unipotent rational points (division-algebra-no-unipotent: a unipotent u ≠ 1 gives the nilpotent u − 1 ≠ 0 in D).

*Prerequisites:* `AA.3/arithmetic-quotient-finite-volume`, `AA.3/compactness-anisotropic`, `AA.3/compactness-isotropic`, `AA.3/division-algebra-no-unipotent`.

*Acceptance:* For D definite quaternion over ℚ, Γ is finite modulo the centre and Γ\D^×(ℝ)/ℝ_{>0} is compact.

*Sources:* borel-1963, Theorem 5.6(ii), p. 21.

## AA.4. Approximation and level maps
Weak approximation is density of `G(F)` in finitely many local groups; it holds for `G_a`, `GL_n`,
`SL_n` and split tori by elementary arguments, and for simply connected semisimple groups by the
theorem of Kneser, Harder and Chernousov, which is stated here with its torsor form (property
(⋆) of Harpaz–Wittenberg: a torsor under such a group with points at the real places has a
rational point and weak approximation) together with Kneser's local vanishing. Torsors are
comodule algebras trivialized over an algebraic closure. Strong approximation is density of
`G(F)` in `G(𝔸^S)`. It holds for unipotent groups and fails for every nontrivial torus with
finite `S` (Rapinchuk, Proposition 2.1; for `G_m/ℚ`, `ℚ^× ∩ ℤ̂^× = {±1}`). For `G` absolutely
almost simple, it holds iff `G` is simply connected and `G_S` is noncompact (Kneser, Platonov).
Sufficiency is decomposed following Platonov's argument: the reduction to finitely many places, the
`S`-arithmetic lattice property, Borel density, openness of closures of Zariski-dense subgroups
(Cartan's closed-subgroup theorem, a recorded gap), finite index from finite covolume, and the
Kneser–Tits property requested from RG2.4. Necessity uses compactness and, for non-simply-connected
groups, Chebotarev. For semisimple simply connected groups with noncompact factors at `S` it gives
`G(𝔸) = G(F)G(F_S)U`, and for groups with simply connected noncompact derived group the class set
`G(F)\G(𝔸_f)/U` is the class set of the abelianization `D = G/G^der` (Lipnowski–Tsimerman (21)).

Neat elements, levels and their existence are planned here (RT-AREA-automorphic-1/28): Milne's
definition, independence of the representation, stability, torsion-freeness, the convention that
a level is neat when all its rational intersections are, a one-prime congruence criterion
(eigenvalues in `1 + p𝒪` for `p ≥ 3`, or `1 + 4𝒪` for `p = 2`), and the existence of neat normal
open subgroups of finite index in every compact open subgroup.

Level maps start from group theory (Lipnowski–Tsimerman): the nested-level map of double coset
spaces with its fibre surjection `K/K′ →` fibre, the bound `#(H\G/K′) ≤ [K : K′]·#(H\G/K)`, the
bijection for conjugate levels and the index of product levels with finite exceptional support.
On level quotients `X_U = G(F)\G(𝔸)/K_∞U` the maps for `U′ ⊂ U` are finite covering maps at neat
level of degree `[U : U′]` up to the central correction, with the mass formula
`Σ_{y ↦ x} 1/|Γ_y|` at non-neat level and the action groupoid remembering the stabilizers. Hecke
correspondences `X_U ← X_{U ∩ gUg⁻¹} → X_U` and the Cartesian squares (exactly when `U′L = U`)
follow, as do the volume decomposition `vol(G(F)\G(𝔸)^1) = vol(U) Σ_i vol(Γ_i\G(F_∞)^1)` and its
behaviour under finite-index level change.

Khayutin's residual quotient: `G(𝔸)^+` is the image of the adelic points of the simply connected
cover, a normal subgroup containing the commutators, and `G_res = G(F)\G(𝔸)/G(𝔸)^+` is an abelian
topological group. For `G = PB^×` with `B` quaternion over `ℚ`, the reduced norm identifies `G_res`
with `ℚ^×\𝔸^×/𝔸^{×2}` whether or not `B` is split at infinity (correcting the printed "index 2"),
and `G(𝔸)/G(𝔸)^+` is only locally compact (correcting "compact"). The image of a torus `E^×/ℚ^×`
is `ker χ_E`, and limits of pushforwards of joint toral measures to `G_res × G_res` are invariant
under `H^Δ` on a single coset, with `H = G_res` or `ker(χ_{E₀} ∘ Nrd)`, without convergence in
general.

**Depends on:** AA.1, AA.3, ReductiveGroupsPartII RG2.0 and RG2.4, GlobalNumberFields layers 1 and
6, Chebotarev, ClassFieldTheory layers 11–12, GlobalQuadraticForms layer 5. **Consumed by:** AA.5,
ShimuraVarieties V0, V1, V2, ShimuraData D5, ArithmeticLocallySymmetricSpaces ALS.0 and ALS.3,
BorelRegulators R.6, AbelianSchemesAndArithmeticModuliPartII F4, GeometryOfNumbersPartIIToralJoinings,
HeightsRationalPointsPartIIHomogeneousMassey.

**Planets:** Strong approximation (`AA.4/strong-approximation-property`); Strong approximation theorem (`AA.4/strong-approximation-sufficiency`); Existence of neat levels (`AA.4/neat-level-exists`); Level covering maps (`AA.4/level-covering-map`); Residual quotient G_res (`AA.4/residual-quotient`).

### AA.4 declarations

#### `AA.4/weak-approximation-property` — Weak approximation (definition)

An affine algebraic group G over F has weak approximation with respect to a finite set S of places if G(F) is dense in G(F_S) = ∏_{v∈S} G(F_v); it has weak approximation if this holds for every finite S.

*Hypotheses:* F a number field; G affine algebraic over F.

*Proof outline:*
1. Define with the topology of AA.1 on G(F_S) (AA.1/adelic-points-split).

*Prerequisites:* `AA.1/adelic-points-split`, `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

*API:*
- `Approximation.HasWeakApproximation` (constructor): HasWeakApproximation G S : Prop := DenseRange (diagonal G(F) → G(F_S)).
- `Approximation.HasWeakApproximation.mono` (relation): Weak approximation for S implies it for every S′ ⊆ S.
- `Approximation.HasWeakApproximation.prod` (functoriality): Weak approximation for G and H gives it for G × H.
- `Approximation.HasWeakApproximation.of_iso` (functoriality): Invariant under isomorphisms of F-groups.

*Unit tests:*
- `Approximation.hasWeakApproximation_ga` (computation): G_a has weak approximation for every finite S (weakApproximation_denseRange).
- `Approximation.hasWeakApproximation_empty` (degenerate): Every G has weak approximation for S = ∅.
- `Approximation.not_hasWeakApproximation_mu2` (non-example): μ_2 over ℚ fails weak approximation for S = {∞, 2}: the diagonal image {(1,1), (−1,−1)} is not dense in {±1}².

*Used by:* AA.4/weak-approximation-simply-connected — the simply connected case; HeightsRationalPointsPartIIHomogeneousMassey — the property (⋆) for homogeneous spaces (Harpaz–Wittenberg route); AA.4/strong-approximation-sufficiency — approximation at the places of S.

*Acceptance:* G_a has weak approximation (weak approximation for F). μ_2 does not: {±1} is not dense in {±1}^S for |S| ≥ 2.

*Sources:* rapinchuk-sa, §2.4, p. 13.

#### `AA.4/weak-approximation-gln` — Weak approximation for GL_n, SL_n and split tori (theorem)

GL_n, SL_n, G_a and split tori G_m^r over F have weak approximation.

*Hypotheses:* F a number field.

*Proof outline:*
1. G_a: weakApproximation_denseRange.
2. GL_n and G_m^r: GL_n(F_S) is open in M_n(F_S) and M_n(F) is dense, so GL_n(F) = M_n(F) ∩ GL_n(F_S) is dense.
3. SL_n: SL_n(F_v) is generated by elementary matrices e_{ij}(t), each root subgroup ≅ G_a has weak approximation, and products of dense subgroups' approximants approximate products.

*Prerequisites:* `AA.4/weak-approximation-property`, `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`, `AA.1/gln-adelic`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`.

*Acceptance:* SL_2(ℚ) is dense in SL_2(ℝ) × SL_2(ℚ_p).

*Sources:* rapinchuk-sa, Lemma 1.2, proof, p. 3.

#### `AA.4/weak-approximation-simply-connected` — Weak approximation for simply connected groups (theorem)

A connected semisimple simply connected group G over a number field F has weak approximation; more generally (property (⋆)) a torsor under G that has points at all real places has an F-point and satisfies weak approximation.

*Hypotheses:* G semisimple simply connected over F.

*Proof outline:*
1. Kneser–Harder–Chernousov and Platonov–Rapinchuk Theorem 7.8 (recorded gap: not decomposed).
2. The torsor statement combines hasse-principle-simply-connected with weak approximation for G.

*Prerequisites:* `AA.4/weak-approximation-property`, `AA.4/hasse-principle-simply-connected`, `AA.4/weak-approximation-gln`.

*Acceptance:* SL_n and Sp_{2n} have weak approximation (elementary for SL_n: weak-approximation-gln).

*Sources:* harpaz-wittenberg-2020, Théorème 6.1, proof, p. 21.

#### `AA.4/group-torsor` — Torsors under an affine group over a field (definition)

For an affine algebraic group G over a field k (Hopf algebra H), a G-torsor is a nonzero finitely generated commutative k-algebra A with a coaction A → A ⊗ H making Spec A a right G-space such that A ⊗_k k̄ ≅ H ⊗_k k̄ as comodule algebras (equivalently X(k̄) is a principal homogeneous G(k̄)-set). It is trivial if X(k) ≠ ∅.

*Hypotheses:* k a field; G affine algebraic over k.

*Proof outline:*
1. Comodule algebras and base change; triviality iff a k-point exists (then X ≅ G).

*Prerequisites:* `tauceti:TauCeti.HopfAlgebra.points`.

*API:*
- `Approximation.Torsor` (structure): Structure: the algebra, the coaction, the geometric trivialization.
- `Approximation.Torsor.IsTrivial` (data): IsTrivial X : Prop := Nonempty (A →ₐ[k] k).
- `Approximation.Torsor.baseChange` (functoriality): Base change along a field extension k → k′.
- `Approximation.Torsor.trivial_iff_iso` (characterisation): X is trivial iff X is isomorphic to G acting on itself.

*Unit tests:*
- `Approximation.Torsor.self_trivial` (degenerate): G acting on itself is trivial.
- `Approximation.Torsor.mu2_sqrt` (computation): For μ_2 over ℚ and a = 2, the torsor ℚ[x]/(x² − 2) is nontrivial over ℚ: 2 is not a rational square (it becomes trivial over ℚ_7).
- `Approximation.Torsor.not_torsor_two_orbits` (non-example): G_m acting on A¹ by scaling is not a torsor: A¹(k̄) has two orbits.

*Used by:* AA.4/kneser-local-torsor — local triviality; AA.4/hasse-principle-simply-connected — the Hasse principle; HeightsRationalPointsPartIIHomogeneousMassey — fibres of fibrations in Harpaz–Wittenberg's method.

*Acceptance:* G acting on itself is the trivial torsor. For G = μ_2 over ℚ, Spec ℚ[x]/(x² − a) is a torsor, trivial iff a is a square.

*Sources:* harpaz-wittenberg-2020, Lemme 6.3, p. 22.

#### `AA.4/kneser-local-torsor` — Kneser's theorem: local triviality of torsors (theorem)

For G connected semisimple simply connected over a nonarchimedean local field F_v of characteristic 0, every G-torsor over F_v is trivial (H¹(F_v, G) = 1).

*Hypotheses:* F_v nonarchimedean of characteristic 0; G semisimple simply connected.

*Proof outline:*
1. Kneser's theorem (Platonov–Rapinchuk Theorem 6.4; recorded gap).

*Prerequisites:* `AA.4/group-torsor`, `tauceti:TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

*Acceptance:* For SL_1(B) of a quaternion division algebra B over ℚ_p: every element of ℚ_p^× is a reduced norm (Khayutin §2.3).

*Sources:* harpaz-wittenberg-2020, §6.2, p. 22; khayutin-2019, §2.3.

#### `AA.4/hasse-principle-simply-connected` — Hasse principle for simply connected groups (theorem)

For G connected semisimple simply connected over a number field F, a G-torsor over F is trivial iff it is trivial over F_v for every real place v (H¹(F, G) → ∏_{v real} H¹(F_v, G) is bijective).

*Hypotheses:* G semisimple simply connected over F.

*Proof outline:*
1. Kneser–Harder–Chernousov (Platonov–Rapinchuk Theorem 6.6; recorded gap); the nonarchimedean places contribute nothing by kneser-local-torsor.

*Prerequisites:* `AA.4/group-torsor`, `AA.4/kneser-local-torsor`.

*Acceptance:* For SL_1(B) with B definite over ℚ: x ∈ ℚ^× is a reduced norm iff x > 0 (Hasse–Schilling–Maass).

*Sources:* khayutin-2019, §2.3; harpaz-wittenberg-2020, Lemme 6.3, p. 22.

#### `AA.4/strong-approximation-property` — Strong approximation (definition)

An affine algebraic group G over F has strong approximation with respect to a finite set S of places if G(F) is dense in G(𝔸_F^S), the adelic points away from S (equivalently G(F)G(F_S) is dense in G(𝔸_F)).

*Hypotheses:* F a number field; S a finite set of places.

*Proof outline:*
1. Use AA.1/adelic-points-split to identify G(𝔸) = G(F_S) × G(𝔸^S).

*Prerequisites:* `AA.1/adelic-points-split`, `AA.0/split-finite-factors`.

*API:*
- `Approximation.HasStrongApproximation` (constructor): HasStrongApproximation G S : Prop := DenseRange (diagonal G(F) → G(𝔸^S)).
- `Approximation.HasStrongApproximation.mul_open` (characterisation): For every open subgroup U ⊂ G(𝔸^S), G(𝔸^S) = G(F)U.
- `Approximation.HasStrongApproximation.mono` (relation): Strong approximation for S implies it for S′ ⊇ S.
- `Approximation.HasStrongApproximation.classNumber_one` (example): If it holds for S = archimedean places then G(F)\G(𝔸_f)/U is a point for every compact open U.

*Unit tests:*
- `Approximation.hasStrongApproximation_ga` (compatibility): G_a over F has strong approximation for S = archimedean places (GlobalNumberFields layer 6).
- `Approximation.hasStrongApproximation_sl2_rat` (computation): SL_2 over ℚ with S = {∞}: SL_2(ℤ) → SL_2(ℤ/d) surjective for all d (Tau Ceti), equivalent to density of SL_2(ℚ) in SL_2(𝔸_f).
- `Approximation.not_hasStrongApproximation_gm` (non-example): G_m over ℚ fails for S = {∞}: ℚ^× ∩ ℤ̂^× = {±1}, so ℚ^× is discrete in 𝔸_f^× (AA.1/finite-adelic-discreteness-criterion).

*Used by:* AA.4/strong-approximation-theorem — the Kneser–Platonov theorem; AA.4/class-set-abelianization — class sets of groups with simply connected derived group; BorelRegulators:R.6/norm-one-volume — H(𝔸_F) = H(F)H_∞U for SL_1(D) (request from R.6); ShimuraVarieties:V0 — the qualified approximation theorem (RS-04 link AA.4 → V0).

*Acceptance:* G_a has strong approximation for every nonempty S (density of F in 𝔸_{F,f} for S ⊇ archimedean).

*Sources:* rapinchuk-sa, Theorem 2.3, p. 12; borel-1963, §2.6, p. 13.

#### `AA.4/ga-strong-approximation` — Strong approximation for unipotent groups (lemma)

Every unipotent group over F (in particular G_a) has strong approximation with respect to any nonempty finite S containing the archimedean places.

*Hypotheses:* N unipotent over F.

*Proof outline:*
1. G_a: density of F in 𝔸_{F,f} (GlobalNumberFields layer 6).
2. Induction along a central series with G_a quotients, as in AA.3/unipotent-class-number-one.

*Prerequisites:* `AA.4/strong-approximation-property`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `AA.3/unipotent-class-number-one`.

*Acceptance:* The upper unitriangular group of GL_n has strong approximation.

*Sources:* borel-1963, §2.6, p. 13.

#### `AA.4/torus-strong-approximation-failure` — Tori never have strong approximation for finite S (theorem)

For a nontrivial torus T over F and a finite set S of places, T(F) is not dense in T(𝔸^S); the quotient of T(𝔸^S) by the closure of T(F) has infinite exponent. Weak approximation for tori is asserted only for split tori (weak-approximation-gln).

*Hypotheses:* T a nontrivial F-torus; S finite.

*Proof outline:*
1. For G_m over ℚ and S = {∞}: ℚ^× ∩ ℤ̂^× = {±1}, so ℚ^× is closed and discrete in 𝔸_f^× ≠ ℚ^×.
2. General T: the m-th power isogenies and Dirichlet's unit theorem with Chebotarev produce characters of T(𝔸^S)/closure(T(F)) of every order (Rapinchuk Proposition 2.1).

*Prerequisites:* `AA.4/strong-approximation-property`, `AA.1/finite-adelic-discreteness-criterion`, `AA.1/gm-adelic`.

*Acceptance:* G_m over F with S the archimedean places: the closure of F^× in 𝔸_f^× is F^× · (closure of 𝒪_F^×), of infinite index.

*Sources:* rapinchuk-sa, Proposition 2.1, p. 9.

#### `AA.4/zariski-dense-closure-open` — Closures of Zariski-dense subgroups are open (lemma)

Let G be absolutely almost simple over ℚ_p (or over F_v), and Γ ⊂ G(F_v) a Zariski-dense subgroup that is not discrete. Then the closure of Γ is open in G(F_v).

*Hypotheses:* G absolutely almost simple; Γ Zariski dense, nondiscrete.

*Proof outline:*
1. The closure Δ is a p-adic analytic subgroup of positive dimension (Cartan's closed-subgroup theorem; recorded gap).
2. Its Lie algebra is Ad Γ-invariant, hence Ad G-invariant by Zariski density, hence everything by irreducibility of the adjoint representation of an absolutely almost simple group.
3. An analytic subgroup with full Lie algebra is open.

*Prerequisites:* `ReductiveGroupsPartII:RG2.0`.

*Acceptance:* For SL_2(ℤ) ⊂ SL_2(ℤ_p), the closure is SL_2(ℤ_p).

*Sources:* rapinchuk-sa, Lemma 2.7, p. 16.

#### `AA.4/borel-density` — Borel density for S-arithmetic groups (theorem)

For G connected absolutely almost simple over F and S a finite set of places containing the archimedean ones with G_S noncompact, the S-arithmetic group G(𝒪_{F,S}) is infinite and Zariski dense in G.

*Hypotheses:* G absolutely almost simple over F; G_S noncompact.

*Proof outline:*
1. G(𝒪(S)) is a lattice in G_S (AA.3/s-arithmetic-lattice), nondiscrete projection to noncompact factors.
2. Borel's density theorem (Platonov–Rapinchuk Theorem 4.10; recorded gap).

*Prerequisites:* `AA.3/s-arithmetic-lattice`.

*Acceptance:* SL_2(ℤ) is Zariski dense in SL_2.

*Sources:* rapinchuk-sa, Theorem 2.3, remark after it, p. 12.

#### `AA.4/open-finite-covolume-finite-index` — Open subgroups of finite covolume have finite index (lemma)

If Δ is an open subgroup of a locally compact group H such that H/Δ carries a finite H-invariant measure, then Δ has finite index in H.

*Hypotheses:* H locally compact; Δ open.

*Proof outline:*
1. H/Δ is discrete; an invariant measure on a discrete homogeneous space gives every point the same mass, positive; finiteness forces finitely many points.

*Prerequisites:* `AA.2/quotient-measure`, `mathlib:MeasureTheory.Subgroup.index_mul_measure`.

*Acceptance:* ℤ_p ⊂ ℚ_p is open but ℚ_p/ℤ_p has infinite invariant measure.

*Sources:* rapinchuk-sa, §2.6, p. 16.

#### `AA.4/strong-approximation-sufficiency` — Strong approximation: sufficiency (theorem)

Let G be connected, absolutely almost simple and simply connected over a number field F, and S a finite set of places containing the archimedean ones with G_S = ∏_{v∈S} G(F_v) noncompact. Then G has strong approximation with respect to S.

*Hypotheses:* G absolutely almost simple simply connected over F; S ⊇ archimedean places; G_S noncompact.

*Proof outline:*
1. Reduction: strong approximation is equivalent to density of G(𝒪(S ∪ S_1)) in G_{S_1} for every finite S_1 disjoint from S (restricted-product topology).
2. Γ = G(𝒪(S ∪ S_1)) is a lattice in G_{S∪S_1} (AA.3/s-arithmetic-lattice); since G_S is noncompact, Γ is nondiscrete in G_{S_1} and Zariski dense (borel-density).
3. For v ∈ S_1 with G isotropic over F_v: the closure Δ_v of the projection is open (zariski-dense-closure-open) of finite covolume, hence of finite index (open-finite-covolume-finite-index); by Kneser–Tits (requested from ReductiveGroupsPartII RG2.4) G(F_v) has no proper finite-index subgroup, so Δ_v = G(F_v).
4. Several places of S_1, and places where G is F_v-anisotropic (G(F_v) compact): Platonov–Rapinchuk §7.4; this part of the argument is not decomposed here (Platonov–Rapinchuk not freely available) and is recorded in the handoff as a source task.

*Prerequisites:* `AA.4/strong-approximation-property`, `AA.3/s-arithmetic-lattice`, `AA.4/borel-density`, `AA.4/zariski-dense-closure-open`, `AA.4/open-finite-covolume-finite-index`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`, `AA.4/strong-approximation-finite-places`, `AA.4/s-arithmetic-nondiscrete`.

*Acceptance:* SL_n over ℚ with S = {∞}: SL_n(ℤ) is dense in SL_n(ℤ̂), i.e. SL_n(ℤ) → SL_n(ℤ/N) is surjective. For SL_1(B), B definite quaternion over ℚ, S = {∞}: G_S is compact and the theorem does not apply.

*Sources:* rapinchuk-sa, Theorem 2.3, p. 12; rapinchuk-sa, Remark 1 after Theorem 2.3, p. 12.

#### `AA.4/strong-approximation-necessity` — Strong approximation: necessity (theorem)

In the setting of strong-approximation-sufficiency without the hypotheses: if G has strong approximation with respect to S then G_S is noncompact and G is simply connected.

*Hypotheses:* G connected absolutely almost simple over F; S finite.

*Proof outline:*
1. If G_S is compact, G(F) is discrete in G(𝔸) and G_S compact, so G(F) is discrete in G(𝔸^S), which is not discrete; so G(F) is not dense.
2. If G is not simply connected, let π : G̃ → G be the simply connected cover with kernel a nontrivial finite group scheme; Chebotarev produces infinitely many places v with G(F_v)/π(G̃(F_v)) nontrivial, and the image of G(F) cannot be dense in the corresponding product (Rapinchuk §2.3, Proposition 2.2).

*Prerequisites:* `AA.4/strong-approximation-property`, `AA.1/rational-points-discrete`, `tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions`, `tauceti:TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

*Acceptance:* PGL_2 over ℚ fails strong approximation for S = {∞}: det modulo squares separates classes. SL_1(B) with B definite and S = {∞} fails: G_∞ compact.

*Sources:* rapinchuk-sa, §2.3, p. 11.

#### `AA.4/strong-approximation-theorem` — Strong approximation for semisimple groups (theorem)

Let G be connected semisimple simply connected over F and S ⊇ archimedean places finite such that G′(F_S) is noncompact for every F-simple factor G′ of G. Then G(𝔸_F) = G(F)·G(F_S)·U for every compact open U ⊂ G(𝔸_F^S); in particular G(F)\G(𝔸_f)/U is a single point when S is the set of archimedean places.

*Hypotheses:* G semisimple simply connected; each F-simple factor noncompact at S.

*Proof outline:*
1. G = ∏ Res_{F_i/F} G_i with G_i absolutely almost simple simply connected (restriction of scalars, AA.1/base-change-adelic).
2. Apply strong-approximation-sufficiency to each G_i over F_i with the places above S; noncompactness of Res G_i at S is noncompactness of G_i at the places above S.
3. Density gives G(𝔸^S) = G(F)U.

*Prerequisites:* `AA.4/strong-approximation-sufficiency`, `AA.1/base-change-adelic`, `AA.1/base-change-local-factors`.

*Acceptance:* SL_2 over a number field F, S archimedean: class number one for every level.

*Sources:* arthur-trace-intro, Theorem 2.1(a), p. 12.

#### `AA.4/class-set-abelianization` — Class sets of groups with simply connected derived group (theorem)

Let G be connected reductive over F with G^der simply connected and G^der(F_∞) noncompact on each F-simple factor, ν : G → D = G/G^der. For compact open U ⊂ G(𝔸_{F,f}), ν induces a bijection G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U).

*Hypotheses:* F a number field; G a connected reductive group over F; G^der simply connected; G^der(F_∞) noncompact on each simple factor.

*Proof outline:*
1. ν : G(F_v) → D(F_v) is surjective at finite v (fibres are G^der-torsors, trivial by kneser-local-torsor), and its kernel is G^der(F_v).
2. Injectivity: if ν(y) ∈ ν(γ)ν(x)ν(U) then y = γ x g′ u with g′ ∈ G^der(𝔸_f); strong approximation for G^der gives x g′ x⁻¹ ∈ G^der(F)(xUx⁻¹ ∩ G^der(𝔸_f)), so y ∈ G(F) x U.
3. Surjectivity from local surjectivity.

*Prerequisites:* `AA.4/strong-approximation-theorem`, `AA.4/kneser-local-torsor`, `AA.1/adelic-map`, `AA.1/compact-open-product`.

*Acceptance:* For GL_n: GL_n(F)\GL_n(𝔸_f)/GL_n(Ô) ≅ F^×\𝔸_f^×/Ô^× = Cl(F). For B^× with B definite over ℚ, G^der = SL_1(B) is compact at ∞ and the hypothesis fails; indeed class numbers of definite quaternion orders exceed the narrow class number in general.

*Sources:* lipnowski-tsimerman-2018, §3.2.2, (21).

#### `AA.4/neat-element` — Neat elements (definition)

An automorphism α of a finite-dimensional vector space over a subfield of ℂ is neat if its eigenvalues in ℂ generate a torsion-free subgroup of ℂ^×. An element g ∈ G(F) of a linear algebraic group over a number field F is neat if ρ(g) is neat for one faithful F-representation ρ; a subgroup of G(F) is neat if all its elements are.

*Hypotheses:* F a number field (G over ℚ via restriction of scalars); G linear algebraic.

*Proof outline:*
1. Define for automorphisms, then for elements through a faithful representation; well-definedness is neat-representation-independence.

*Prerequisites:* `AA.1/adelic-map`.

*API:*
- `Neat.IsNeatAut` (constructor): IsNeatAut α : Prop for α ∈ GL(V), V over a subfield of ℂ.
- `Neat.IsNeat` (constructor): IsNeat g : Prop for g ∈ G(F), via a chosen faithful representation.
- `Neat.IsNeatSubgroup` (constructor): A subgroup all of whose elements are neat.
- `Neat.IsNeat.pow` (relation): If g is neat then so is g^n.
- `Neat.IsNeat.torsion_eq_one` (characterisation): A neat element of finite order is 1.

*Unit tests:*
- `Neat.isNeat_diag` (computation): diag(2, 1/2) ∈ SL_2(ℚ) is neat.
- `Neat.isNeat_one` (degenerate): 1 is neat.
- `Neat.not_isNeat_rotation` (non-example): The order-3 element (0 −1; 1 −1) of SL_2(ℤ) is not neat; nor is a torsion-free element whose eigenvalue group contains ζ_3, such as (0 −1; 1 1)·(scalar 2) in GL_2(ℚ).

*Used by:* AA.4/neat-level — neat compact open levels; ArithmeticLocallySymmetricSpaces:ALS.0 — freeness at neat level (RT-AREA-automorphic-1/28); ShimuraData:D5 — D5 imports neatness from AA.4; ShimuraVarieties:V0 — existence of neat congruence subgroups imported from AA.4.

*Acceptance:* No nontrivial element of finite order is neat. diag(2, 1/2) ∈ SL_2(ℚ) is neat; diag(−1, −1) is not.

*Sources:* milne-svi, §3, p. 34.

#### `AA.4/neat-representation-independence` — Neatness does not depend on the representation (theorem)

If ρ(g) is neat for one faithful representation ρ of G then σ(g) is neat for every representation σ of G defined over a subfield of ℂ.

*Hypotheses:* G linear algebraic over F.

*Proof outline:*
1. Every representation σ is a subquotient of a direct sum of tensor products of ρ, ρ^∨ (faithfulness, Chevalley).
2. Eigenvalues of σ(g) are products of eigenvalues of ρ(g) and their inverses, hence lie in the group generated by the eigenvalues of ρ(g).

*Prerequisites:* `AA.4/neat-element`.

*Acceptance:* For GL_n the determinant of a neat element is neat.

*Sources:* milne-svi, §3, p. 34.

#### `AA.4/neat-stability` — Neatness is stable under subgroups, conjugation and homomorphisms (lemma)

Subgroups of neat subgroups are neat; conjugates of neat subgroups by elements of G(F) are neat; and for a homomorphism φ : G → G′ of linear algebraic groups the image φ(Γ) of a neat subgroup Γ is neat.

*Hypotheses:* G, G′ linear algebraic over F.

*Proof outline:*
1. Subgroups: by definition.
2. Conjugation preserves eigenvalues.
3. Homomorphisms: σ ∘ φ is a representation of G; apply neat-representation-independence.

*Prerequisites:* `AA.4/neat-representation-independence`.

*Acceptance:* The image of a neat subgroup of SL_2(ℚ) in PGL_2(ℚ) is neat.

*Sources:* milne-svi, §3, p. 34.

#### `AA.4/neat-torsion-free` — Neat groups are torsion free (lemma)

A neat subgroup of G(F) is torsion free.

*Hypotheses:* G linear algebraic.

*Proof outline:*
1. The eigenvalues of an element of finite order are roots of unity, so they generate a finite subgroup, which must be trivial; a diagonalizable (finite-order) element with all eigenvalues 1 is the identity.

*Prerequisites:* `AA.4/neat-element`.

*Acceptance:* Γ(N) ⊂ SL_2(ℤ) is torsion free for N ≥ 3.

*Sources:* milne-svi, §3, p. 34.

#### `AA.4/neat-level` — Neat compact open levels (definition)

A compact open subgroup U ⊂ G(𝔸_{F,f}) is neat if G(F) ∩ x U x⁻¹ is neat for every x ∈ G(𝔸_{F,f}) (convention: all rational intersections, not every element of U).

*Hypotheses:* G linear algebraic over F.

*Proof outline:*
1. Define via the arithmetic groups of AA.3/arithmetic-subgroup-of-level.

*Prerequisites:* `AA.4/neat-element`, `AA.3/arithmetic-subgroup-of-level`.

*API:*
- `Neat.IsNeatLevel` (constructor): IsNeatLevel U : Prop := ∀ x, IsNeatSubgroup (levelArithmetic x U).
- `Neat.IsNeatLevel.mono` (relation): A compact open subgroup of a neat level is neat.
- `Neat.IsNeatLevel.conj` (relation): Conjugates of neat levels are neat.
- `Neat.IsNeatLevel.torsionFree` (characterisation): All levelArithmetic x U are torsion free.

*Unit tests:*
- `Neat.isNeatLevel_U3` (computation): The arithmetic group Γ(3) = SL_2(ℤ) ∩ U(3) of the level U(3) ⊂ GL_2(ℤ̂) is neat.
- `Neat.isNeatLevel_trivial_group` (degenerate): For the trivial group every level is neat.
- `Neat.not_isNeatLevel_GL2Zhat` (non-example): GL_2(ℤ̂) is not neat: it contains −1 ∈ GL_2(ℤ).

*Used by:* AA.4/level-covering-map — free actions at neat level; ArithmeticLocallySymmetricSpaces:ALS.0 — freeness of the action at neat level; ShimuraData:D5 — neat levels imported from AA.4; AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound — level maps without assuming neatness.

*Acceptance:* For GL_n over ℚ, U(N) = ker(GL_n(ℤ̂) → GL_n(ℤ/N)) is neat for N ≥ 3 (neat-criterion-one-prime). GL_n(ℤ̂) is not neat.

*Sources:* milne-svi, §5, p. 58.

#### `AA.4/neat-criterion-one-prime` — A one-prime criterion for neatness (theorem)

Let ρ : G ↪ GL_n be a faithful representation over ℚ (after restriction of scalars) and U ⊂ G(𝔸_f) compact open. If for some prime p ≥ 3 the projection of ρ(U) to GL_n(ℚ_p) lies in 1 + p M_n(ℤ_p) (for p = 2, in 1 + 4M_n(ℤ_2)), then U is neat.

*Hypotheses:* ρ faithful; U compact open; p ≥ 3 (or p = 2 with level 4).

*Proof outline:*
1. For γ ∈ G(ℚ) ∩ xUx⁻¹, ρ(γ) is conjugate in GL_n(ℚ_p) to an element of x_p ρ(U_p) x_p⁻¹, whose eigenvalues λ in ℚ̄_p satisfy |λ − 1|_p ≤ p⁻¹ (resp. 4⁻¹) because they are eigenvalues of conjugates of elements of 1 + pM_n(ℤ_p).
2. The multiplicative group {λ : |λ − 1|_p < p^{-1/(p−1)}} of ℚ̄_p contains no nontrivial root of unity, and it contains the group generated by such eigenvalues.
3. Embedding the eigenvalue group (inside ℚ̄^×) in both ℂ^× and ℚ̄_p^× gives the same abstract group, so it is torsion free.

*Prerequisites:* `AA.4/neat-level`, `AA.4/neat-representation-independence`, `AA.1/compact-open-product`, `AA.4/padic-ball-torsion-free`.

*Acceptance:* U(3) ⊂ GL_2(ℤ̂) is neat; U(2) is not (it contains −1).

*Sources:* milne-svi, Proposition 3.5, p. 34.

#### `AA.4/neat-level-exists` — Neat levels exist (theorem)

Every compact open U ⊂ G(𝔸_{F,f}) contains a neat normal open subgroup of finite index; every arithmetic subgroup of G(F) contains a neat subgroup of finite index defined by congruence conditions (Borel).

*Hypotheses:* G linear algebraic over F.

*Proof outline:*
1. Take U′ = U ∩ ρ⁻¹(1 + pM_n(ℤ_p)) at one prime p ≥ 3: open, normal in U (kernel of reduction modulo p), of finite index; it is neat by neat-criterion-one-prime.
2. For an arithmetic Γ, intersect with the corresponding congruence subgroup.

*Prerequisites:* `AA.4/neat-criterion-one-prime`, `AA.1/compact-open-product`.

*Acceptance:* GL_2(ℤ̂) ⊃ U(3) neat of index #GL_2(ℤ/3) = 48.

*Sources:* milne-svi, Proposition 3.5, p. 34.

#### `AA.4/double-coset-level-map` — Nested-level map on double cosets (construction)

For a group G, H ≤ G and K′ ≤ K ≤ G, π : H\G/K′ → H\G/K, [g] ↦ [g], is well defined and surjective, and for each g the map K/K′ → π⁻¹([g]), kK′ ↦ [gk], is a surjection; no normality is assumed.

*Hypotheses:* G a group; H, K′ ≤ K subgroups.

*Proof outline:*
1. Well defined by DoubleCoset.eq.
2. Surjectivity onto the fibre: an element of the fibre is [x] with x = h g k, and [x] = [g k] at the finer level.

*Prerequisites:* `mathlib:DoubleCoset.Quotient`, `mathlib:DoubleCoset.eq`.

*API:*
- `LevelMaps.levelMap` (constructor): levelMap H hK : DoubleCoset.Quotient H K′ → DoubleCoset.Quotient H K.
- `LevelMaps.levelMap_mk` (simp): levelMap (mk g) = mk g.
- `LevelMaps.levelMap_surjective` (characterisation): levelMap is surjective.
- `LevelMaps.fibreSurj` (data): fibreSurj g : K ⧸ K′.subgroupOf K → levelMap ⁻¹' {mk g}, kK′ ↦ mk (g k), surjective.
- `LevelMaps.levelMap_comp` (functoriality): levelMap for K″ ≤ K′ ≤ K composes.

*Unit tests:*
- `LevelMaps.levelMap_refl` (degenerate): For K′ = K, levelMap is the identity.
- `LevelMaps.levelMap_trivial_H` (computation): For H = ⊥ and finite index, each fibre has exactly [K : K′] elements.
- `LevelMaps.levelMap_fibre_not_index` (non-example): For H = G and [K : K′] = 2 there is one fine class, so the fibre size 1 is not the index 2.

*Used by:* AA.4/double-coset-level-cardinality — the finite-index bound; AA.4/level-covering-map — the underlying map of level quotients; AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound — nested-level double-coset fibre surjection (request from F4).

*Acceptance:* K′ = K gives the identity with singleton fibres. H = 1: fibres are exactly K/K′.

*Sources:* lipnowski-tsimerman-2018, §3.2, (15).

#### `AA.4/double-coset-level-cardinality` — Finite-index bound for level changes (theorem)

For K′ ≤ K of finite index N, every fibre of H\G/K′ → H\G/K has at most N elements; if H\G/K is finite of cardinality h then H\G/K′ is finite of cardinality at most Nh. No normality, freeness or neatness is assumed.

*Hypotheses:* K′ ≤ K, [K : K′] = N finite.

*Proof outline:*
1. fibreSurj is a surjection from a set of size N.
2. The fine quotient is the disjoint union of its fibres over a finite base.

*Prerequisites:* `AA.4/double-coset-level-map`.

*Acceptance:* For H = 1 equality holds; for H = G and N > 1 it is strict.

*Sources:* lipnowski-tsimerman-2018, §3.2.3.

#### `AA.4/double-coset-conjugate-level` — Conjugate levels give equivalent double-coset sets (theorem)

For H, K ≤ G and a ∈ G, [g] ↦ [ga] is a bijection H\G/(aKa⁻¹) ≃ H\G/K with inverse [x] ↦ [xa⁻¹]; a need not normalize H.

*Hypotheses:* G a group.

*Proof outline:*
1. If g′ = h g (a k a⁻¹) then g′a = h (g a) k; the inverse similarly.

*Prerequisites:* `mathlib:DoubleCoset.eq`, `mathlib:DoubleCoset.Quotient`.

*Acceptance:* a = 1 gives the identity.

*Sources:* lipnowski-tsimerman-2018, §3.2.

#### `AA.4/finite-support-product-index` — Index of product subgroups with finite exceptional support (theorem)

For groups H_v with subgroups S_v ≤ H_v equal to H_v outside a finite set B and of finite index for v ∈ B, (∏ H_v)/(∏ S_v) ≃ ∏_{v∈B} H_v/S_v and [∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]; in particular for compact open product levels in G(𝔸_f), [∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v].

*Hypotheses:* S_v = H_v outside finite B.

*Proof outline:*
1. Map a coset to its components; coordinatewise membership; lift finitely many representatives with identity elsewhere.

*Prerequisites:* `AA.1/compact-open-product`, `mathlib:MeasureTheory.Subgroup.index_mul_measure`.

*Acceptance:* [GL_2(ℤ̂) : K_0(N)] = ∏_{p | N} [GL_2(ℤ_p) : K_0(p^{v_p(N)})] = N ∏_{p|N}(1 + 1/p).

*Sources:* lipnowski-tsimerman-2018, §3.2.1, (20).

#### `AA.4/level-quotient` — Level quotients (definition)

For compact open U ⊂ G(𝔸_{F,f}) and a closed subgroup K_∞ ⊂ G(F_∞) (for example a maximal compact subgroup times A_G(ℝ)^0, or trivial), the level quotient is X_U = G(F)\G(𝔸_F)/K_∞U with the quotient topology, together with the right action of G(𝔸_f) by Hecke translation X_{gUg⁻¹} ≃ X_U, [x] ↦ [xg].

*Hypotheses:* F a number field; G a connected reductive group over F; U compact open; K_∞ closed.

*Proof outline:*
1. Quotient of G(𝔸) by the left action of G(F) and right action of K_∞U.
2. Right translation by g carries the K_∞(gUg⁻¹)-orbits to K_∞U-orbits.

*Prerequisites:* `AA.3/component-decomposition`, `AA.1/adelic-points-split`.

*API:*
- `LevelMaps.LevelQuotient` (constructor): LevelQuotient U K∞ : Type, the double quotient with its topology.
- `LevelMaps.LevelQuotient.mk` (constructor): The projection G(𝔸) → LevelQuotient U K∞.
- `LevelMaps.LevelQuotient.rightTranslate` (functoriality): rightTranslate g : LevelQuotient (g U g⁻¹) K∞ ≃ₜ LevelQuotient U K∞.
- `LevelMaps.LevelQuotient.mk_rational` (simp): mk (diagonal γ * x) = mk x.

*Unit tests:*
- `LevelMaps.LevelQuotient.gl1_rat` (computation): For GL_1/ℚ, U = ℤ̂^× (the maximal compact open subgroup) and K∞ = ℝ^×: LevelQuotient is a point.
- `LevelMaps.LevelQuotient.trivial_group` (degenerate): For the trivial group it is a point.
- `LevelMaps.LevelQuotient.not_finite_adelic_only` (non-example): For SL_2/ℚ with K∞ = 1, LevelQuotient is SL_2(ℤ)\SL_2(ℝ) (strong approximation), not the one-point set SL_2(ℚ)\SL_2(𝔸_f)/U.

*Used by:* AA.4/level-covering-map — covering maps between level quotients; AA.4/hecke-cartesian — Hecke correspondences; ArithmeticLocallySymmetricSpaces:ALS.0 — X_K for the symmetric space; ShimuraVarieties:V1 — level maps before complex structures (RS-04 link AA.4 → V1).

*Acceptance:* For K_∞ = 1, X_U ≃ ⊔ Γ_i\G(F_∞) (AA.3/component-decomposition). For GL_2/ℚ and K_∞ = ℝ^× O(2), X_{U(N)} is the modular curve Y(N) as a union of φ(N) copies of Γ(N)\ℍ.

*Sources:* milne-svi, §5, footnote 40, p. 57.

#### `AA.4/level-covering-map` — Covering maps between neat levels (theorem)

Let U′ ⊂ U be compact open with U neat and K_∞ compact modulo A_G(ℝ)^0 containing A_G(ℝ)^0. Then X_{U′} → X_U is a finite covering map whose fibres have exactly [U : U′]·[Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′]⁻¹ elements; when U′ is normal in U it is a Galois covering with group U/U′ acting through its quotient by the image of Z(F) ∩ K_∞U.

*Hypotheses:* F a number field; G a connected reductive group over F; U neat; U′ ⊂ U compact open.

*Proof outline:*
1. The fibre over [g] is the orbit set of the finite stabilizer group G(F) ∩ g K_∞U g⁻¹ acting on the cosets of U′ in U (double-coset-level-map with H the stabilizer).
2. At neat level the stabilizer is a finite torsion-free group modulo the central elements Z(F) ∩ K_∞U, hence acts through that central quotient (neat-torsion-free).
3. Covering property: for U′ normal, U/U′ acts on X_{U′} freely modulo the central part and properly discontinuously; apply Mathlib's quotient covering theorem and Tau Ceti's isCoveringMap_of_comp for non-normal U′.

*Prerequisites:* `AA.4/level-quotient`, `AA.4/double-coset-level-map`, `AA.4/neat-level`, `AA.4/neat-torsion-free`, `mathlib:isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`, `tauceti:IsQuotientCoveringMap.isCoveringMap_of_comp`, `mathlib:ProperlyDiscontinuousSMul`, `AA.4/level-action-free-at-neat`, `AA.4/level-quotient-hausdorff`.

*Acceptance:* For GL_2/ℚ with K_∞ = ℝ^×O(2), U = U(3) and U′ = U(9), the covering has degree [U(3) : U(9)] = 3⁴ = 81; the central correction is trivial because −1 ∉ U(3). Without neatness the map SL_2(ℤ)\ℍ ← Γ(2)\ℍ is not a covering map: it ramifies over the elliptic points i and ρ.

*Sources:* milne-svi, §5, p. 58.

#### `AA.4/level-map-fibre-mass` — Fibre mass of a level map with stabilizers (theorem)

Without neatness, for U′ ⊂ U and x ∈ X_U with finite stabilizer group Γ_x = (G(F) ∩ g K_∞U g⁻¹)/(Z(F) ∩ K_∞U), the fibre of X_{U′} → X_U over x satisfies ∑_{y ↦ x} 1/|Γ_y| = [U : U′]/(|Γ_x|·[Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′]).

*Hypotheses:* F a number field; G a connected reductive group over F; U′ ⊂ U compact open.

*Proof outline:*
1. The fibre is Γ_x\(U/U′) up to the central correction; orbit–stabilizer gives ∑ over orbits of |Γ_x|/|Γ_y| = [U : U′] after removing the central kernel.

*Prerequisites:* `AA.4/level-quotient`, `AA.4/double-coset-level-map`, `AA.4/double-coset-level-cardinality`.

*Acceptance:* For SL_2(ℤ)\ℍ ← Γ_0(2)\ℍ over the elliptic point i (stabilizer of order 2 mod ±1) the masses add to 3/2 = 3/|Γ_i|.

*Sources:* lipnowski-tsimerman-2018, §3.2.

#### `AA.4/level-quotient-groupoid` — Quotient groupoids at non-neat level (construction)

For compact open U, the level groupoid 𝒳_U is the action groupoid of G(F) acting on G(𝔸)/K_∞U; its objects are points of G(𝔸)/K_∞U and its automorphism groups are the finite groups G(F) ∩ x K_∞U x⁻¹. Its set of isomorphism classes is X_U, and a neat U gives automorphism groups equal to the central kernel.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Mathlib's CategoryTheory.ActionCategory for the action of G(F); finiteness of automorphism groups from discreteness and compactness.

*Prerequisites:* `AA.4/level-quotient`, `mathlib:CategoryTheory.ActionCategory`, `AA.1/rational-points-discrete`.

*API:*
- `LevelMaps.levelGroupoid` (constructor): The action groupoid of G(F) on G(𝔸)/K∞U.
- `LevelMaps.levelGroupoid_aut` (characterisation): Aut of the object x is G(F) ∩ x K∞U x⁻¹.
- `LevelMaps.levelGroupoid_isoClasses` (equivalence): Isomorphism classes ≃ LevelQuotient U K∞.
- `LevelMaps.levelGroupoid_finite_aut` (characterisation): Every automorphism group is finite when K∞ is compact modulo the split centre.

*Unit tests:*
- `LevelMaps.levelGroupoid_sl2_i` (computation): For SL_2/ℚ, U = SL_2(ℤ̂), the automorphism group of the object over i has order 4.
- `LevelMaps.levelGroupoid_neat` (degenerate): At neat level all automorphism groups are central.
- `LevelMaps.levelGroupoid_not_space` (non-example): The groupoid is not determined by X_U: Y(1) and the coarse space of the groupoid agree, but the groupoid remembers the stabilizers of orders 4 and 6.

*Used by:* AA.4/level-map-fibre-mass — masses 1/|Aut|; AlgebraicModuliForArithmeticGeometry — stack-theoretic quotients [Γ\X] (stack language imported from that roadmap); AA.5/definite-quaternion-mass — Eichler mass formula.

*Acceptance:* For SL_2/ℚ and U = SL_2(ℤ̂), the automorphism group of the object over i is ⟨S⟩ of order 4.

*Sources:* milne-svi, §5, p. 58.

#### `AA.4/hecke-correspondence` — Hecke correspondences (construction)

For g ∈ G(𝔸_{F,f}) and compact open U, put U_g = U ∩ gUg⁻¹. The Hecke correspondence T_g is X_U ←p₁ X_{U_g} →p₂ X_U with p₁[x] = [x] and p₂[x] = [xg]; it depends only on UgU.

*Hypotheses:* F a number field; G a connected reductive group over F; U compact open; g ∈ G(𝔸_f).

*Proof outline:*
1. p₁ is the level map for U_g ⊂ U; p₂ is the level map for U_g ⊂ gUg⁻¹ followed by right translation by g (LevelQuotient.rightTranslate).

*Prerequisites:* `AA.4/level-quotient`, `AA.4/double-coset-level-map`, `AA.4/hecke-degree-double-coset`.

*API:*
- `LevelMaps.hecke` (constructor): The pair of maps X_{U_g} → X_U.
- `LevelMaps.hecke_fst` (simp): (hecke g).1 (mk x) = mk x.
- `LevelMaps.hecke_snd` (simp): (hecke g).2 (mk x) = mk (x * g).
- `LevelMaps.hecke_degree` (characterisation): At neat level the degree of p₁ is [U : U_g] = degree of the double coset UgU (HeckeCoset.degree_eq_relIndex).

*Unit tests:*
- `LevelMaps.hecke_one` (degenerate): For g = 1 both maps are the identity.
- `LevelMaps.hecke_Tp_degree` (computation): For GL_2/ℚ, U = GL_2(ℤ̂), g = diag(p,1): [U : U_g] = p + 1.
- `LevelMaps.hecke_not_symmetric` (non-example): T_g and T_{g⁻¹} are transposes, not equal in general: for GL_2 with g = diag(p,1), T_{g⁻¹} is T_g composed with translation by the central idele p⁻¹ at p.

*Used by:* AA.4/hecke-cartesian — Cartesian squares; ArithmeticLocallySymmetricSpaces:ALS.3 — Hecke action on cohomology; AA.5/gl1-hecke-action — GL_1 Hecke operators.

*Acceptance:* For GL_2/ℚ and g = diag(p,1) at p: T_g is the classical T_p correspondence on Y_0-type curves, of degree p + 1.

*Sources:* arthur-trace-intro, §2, p. 13.

#### `AA.4/hecke-cartesian` — Cartesian squares of level maps (theorem)

Let U′, L ⊂ U be compact open with U neat and U′L = U. Then the square X_{U′∩L} → X_L, X_{U′∩L} → X_{U′}, X_{U′} → X_U, X_L → X_U is Cartesian (as topological spaces). In particular for U′ normal in U and g ∈ G(𝔸_f), with L = U_g, the Hecke correspondence at level U′ is the pullback of T_g along X_{U′} → X_U.

*Hypotheses:* F a number field; G a connected reductive group over F; U neat; U′L = U.

*Proof outline:*
1. At neat level all maps are coverings with fibres U/U′, L/(U′ ∩ L) (level-covering-map).
2. The fibre-product's fibre over a point of X_L is U/U′; the natural map from L/(U′ ∩ L) is bijective iff U′L = U.
3. A bijective map of coverings over X_L is a homeomorphism.

*Prerequisites:* `AA.4/level-covering-map`, `AA.4/hecke-correspondence`, `tauceti:HeckeCoset.degree_eq_relIndex`.

*Acceptance:* If U′L ≠ U the square is not Cartesian: degrees differ.

*Sources:* milne-svi, §5, p. 58.

#### `AA.4/quotient-volume-decomposition` — Volume of a level quotient (theorem)

With a Haar measure dg_f on G(𝔸_f), dg_∞ on G(F_∞) and the product measure on G(𝔸) (AA.0/restricted-haar-split), vol(G(F)\G(𝔸)^1) = vol(U) ∑_{i} vol(Γ_i\G(F_∞)/A_G(ℝ)^0) for representatives x_i of G(F)\G(𝔸_f)/U, where Γ_i = G(F) ∩ x_iUx_i⁻¹, the measure on G(𝔸)^1 is transported from G(𝔸)/A_G(ℝ)^0 (AA.2/split-centre-decomposition) and G(F_∞)/A_G(ℝ)^0 carries the quotient measure. (G(𝔸)^1 is not G(F_∞)^1 × G(𝔸_f): finite ideles have nontrivial norms.)

*Hypotheses:* F a number field; G a connected reductive group over F; U compact open.

*Proof outline:*
1. G(F)\G(𝔸)^1 ≅ G(F)\G(𝔸)/A_G(ℝ)^0 (AA.2/quotient-norm-one-comparison).
2. AA.3/component-decomposition: G(F)\G(𝔸)/A_G(ℝ)^0 U is the disjoint union of the Γ_i\G(F_∞)/A_G(ℝ)^0, and the fibre over each point is a translate of U.
3. Quotient-measure transitivity gives the product of vol(U) and the archimedean volumes.

*Prerequisites:* `AA.3/component-decomposition`, `AA.2/automorphic-quotient-measure`, `AA.2/quotient-norm-one-comparison`, `AA.2/quotient-measure-transitivity`, `AA.0/restricted-haar-split`.

*Acceptance:* For SL_2/ℚ: vol(SL_2(ℚ)\SL_2(𝔸)) = vol(SL_2(ℤ̂)) vol(SL_2(ℤ)\SL_2(ℝ)). For GL_1/ℚ with the idele measure and U = ℤ̂^×: vol(ℚ^×\𝔸^1) = 1 · vol({±1}\ℝ^×/ℝ_{>0}) = 1.

*Sources:* arthur-trace-intro, (2.1), p. 13.

#### `AA.4/level-volume-index` — Volumes under finite-index level change (theorem)

For compact open U′ ⊂ U, ∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0).

*Hypotheses:* F a number field; G a connected reductive group over F; U′ ⊂ U compact open.

*Proof outline:*
1. Both sides times vol(U′), resp. vol(U), equal vol(G(F)\G(𝔸)^1) (quotient-volume-decomposition); vol(U) = [U : U′] vol(U′) (MeasureTheory.Subgroup.index_mul_measure).

*Prerequisites:* `AA.4/quotient-volume-decomposition`, `mathlib:MeasureTheory.Subgroup.index_mul_measure`, `AA.2/compact-open-volume`.

*Acceptance:* [SL_2(ℤ) : Γ(N)] = vol(Γ(N)\SL_2(ℝ))/vol(SL_2(ℤ)\SL_2(ℝ)) when SL_2(ℚ)\SL_2(𝔸_f)/U(N) is one point.

*Sources:* lipnowski-tsimerman-2018, §3.2.3.

#### `AA.4/plus-subgroup` — The subgroup G(𝔸)^+ from the simply connected cover (definition)

For G connected reductive over F with simply connected cover ρ : G̃ → G^der ⊂ G of the derived group, G(𝔸_F)^+ = ρ(G̃(𝔸_F)), a normal subgroup of G(𝔸_F) containing the commutator subgroup; likewise G(R)^+ for any F-algebra R. For G = PB^× (B a quaternion algebra over ℚ), G̃ = B^(1) is the norm-one group.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. Image of a homomorphism (AA.1/adelic-map).
2. Normal because G acts on G̃ by conjugation lifting conjugation on G^der.
3. Contains commutators because the commutator map G × G → G^der lifts to G̃ (Deligne).

*Prerequisites:* `AA.1/adelic-map`, `tauceti:TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

*API:*
- `Approximation.plusSubgroup` (constructor): plusSubgroup G : Subgroup (AdelicPoints H) := range of the simply connected cover.
- `Approximation.plusSubgroup_normal` (instance): plusSubgroup is normal.
- `Approximation.commutator_le_plusSubgroup` (characterisation): ⁅G(𝔸), G(𝔸)⁆ ≤ plusSubgroup.
- `Approximation.plusSubgroup_gln` (example): For GL_n, plusSubgroup = SL_n(𝔸).

*Unit tests:*
- `Approximation.plusSubgroup_sln` (degenerate): For simply connected G, plusSubgroup = ⊤.
- `Approximation.plusSubgroup_pgl2_quotient` (computation): For PGL_2/ℚ, det induces G(𝔸)/plusSubgroup ≃ 𝔸^×/𝔸^{×2}.
- `Approximation.plusSubgroup_not_derived_points` (non-example): For PGL_2, plusSubgroup ≠ G^der(𝔸) = PGL_2(𝔸): the image of SL_2(ℚ_p) in PGL_2(ℚ_p) has index 4 for odd p.

*Used by:* AA.4/residual-quotient — G_res = G(F)\G(𝔸)/G(𝔸)^+; GeometryOfNumbersPartIIToralJoinings — invariance subgroups of joinings (Part II route of PAPER-KHAYUTIN-19).

*Acceptance:* For G = GL_n, G(𝔸)^+ = SL_n(𝔸). For G = PGL_2, G(𝔸)^+ is the image of SL_2(𝔸), and G(𝔸)/G(𝔸)^+ ≃ 𝔸^×/𝔸^{×2} via det.

*Sources:* khayutin-2019, §2.3.

#### `AA.4/residual-quotient` — The residual quotient G_res (definition)

G_res = G(F)\G(𝔸_F)/G(𝔸_F)^+ = G(𝔸_F)/G(F)G(𝔸_F)^+, an abelian topological group, with π^+ : [G(𝔸)] → G_res the quotient map; the composite G(𝔸) → [G(𝔸)] → G_res is a continuous surjective homomorphism. For G = PB^× over ℚ, G_res is a compact abelian group.

*Hypotheses:* F a number field; G a connected reductive group over F.

*Proof outline:*
1. G(F)G(𝔸)^+ is a normal subgroup (plus-subgroup normal) containing commutators, so the quotient is an abelian group.
2. Compactness for G = PB^×: G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} (reduced-norm-components), which is compact (GlobalNumberFields layer 6: compact norm-one idele class group, with ℝ_{>0} ⊂ 𝔸^{×2}).

*Prerequisites:* `AA.4/plus-subgroup`, `AA.1/rational-points-discrete`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

*API:*
- `Approximation.residualQuotient` (constructor): residualQuotient G : Type, the quotient group G(𝔸) ⧸ (G(F) ⊔ plusSubgroup).
- `Approximation.residualQuotient.commGroup` (instance): residualQuotient is a commutative topological group.
- `Approximation.residualQuotient.piPlus` (projection): piPlus : G(𝔸) →* residualQuotient, continuous and surjective.
- `Approximation.residualQuotient.piPlus_rational` (simp): piPlus (diagonal γ) = 1.

*Unit tests:*
- `Approximation.residualQuotient_sl2` (degenerate): For SL_2 the residual quotient is trivial.
- `Approximation.residualQuotient_pgl2` (computation): For PGL_2/ℚ, residualQuotient ≃ ℚ^×\𝔸^×/𝔸^{×2}.
- `Approximation.residualQuotient_not_G_mod_plus` (non-example): G(𝔸)/G(𝔸)^+ itself is not compact for PGL_2: it is 𝔸^×/𝔸^{×2}, only locally compact (Khayutin E40).

*Used by:* AA.4/residual-joint-limit — limits of pushforwards to G_res × G_res; GeometryOfNumbersPartIIToralJoinings — the residual spectrum in the mixing conjecture; AA.3/component-decomposition — for G with G^der simply connected and noncompact, G_res mod G(F_∞) indexes connected components.

*Acceptance:* For G = SL_2, G_res is trivial. For G = PGL_2 over ℚ, G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} ≅ ∏_p ℤ_p^×/ℤ_p^{×2} (an infinite compact group of exponent 2).

*Sources:* khayutin-2019, Definition 3.1.

#### `AA.4/quaternion-reduced-norm-image` — Reduced norms of a quaternion algebra over ℚ (lemma)

For a quaternion algebra B over ℚ: Nrd(B_p^×) = ℚ_p^× for every prime p; Nrd(B_∞^×) = ℝ^× if B is split at ∞ and ℝ_{>0} otherwise; and Nrd(B^×) = ℚ^× if B is split at ∞, ℚ_{>0} otherwise (Hasse–Schilling–Maass).

*Hypotheses:* B a quaternion algebra over ℚ.

*Proof outline:*
1. Local: over ℚ_p either B_p ≃ M_2 (det is onto) or B_p is the division algebra, whose norm form on the unramified quadratic subfield already represents all units and a uniformizer.
2. Global: x is a reduced norm iff the quinary form Nrd ⊥ ⟨−x⟩ has an isotropic vector with nonzero last coordinate; for x > 0 (or B split at ∞) it is indefinite, hence isotropic by Hasse–Minkowski (GlobalQuadraticForms layer 5), and if the isotropic vector has last coordinate 0 then B is split and det represents x anyway.

*Prerequisites:* `tauceti:QuaternionAlgebra.normForm`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`, `AA.4/kneser-local-torsor`.

*Acceptance:* For B = (−1, −1)_ℚ (Hamilton), every positive rational is a sum of four squares.

*Sources:* khayutin-2019, §2.3.

#### `AA.4/reduced-norm-components` — The reduced norm on the residual quotient (theorem)

For G = PB^× with B a quaternion algebra over ℚ, the reduced norm induces an injective continuous homomorphism of locally compact groups Nrd : G(𝔸)/G(𝔸)^+ → 𝔸^×/𝔸^{×2}, and a bijection (indeed an isomorphism of compact groups) G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} whether or not B is split at ∞. Neither G(𝔸)/G(𝔸)^+ nor 𝔸^×/𝔸^{×2} is compact.

*Hypotheses:* B a quaternion algebra over ℚ; G = PB^×.

*Proof outline:*
1. Kernel of Nrd on G(ℚ_v) modulo squares is the image of B^(1)(ℚ_v) (local surjectivity, quaternion-reduced-norm-image); hence injectivity.
2. Image: all of 𝔸^×/𝔸^{×2} if B is split at ∞, and (ℝ_{>0} × 𝔸_f^×)/𝔸^{×2} otherwise.
3. Modulo rational points: Nrd(B^×) = ℚ^× or ℚ_{>0}; in the definite case ℚ_{>0}\(ℝ_{>0} × 𝔸_f^×)/𝔸^{×2} → ℚ^×\𝔸^×/𝔸^{×2} is bijective because −1 ∈ ℚ^× moves the sign at ∞ (correcting Khayutin's 'index-2 image', E39).

*Prerequisites:* `AA.4/residual-quotient`, `AA.4/quaternion-reduced-norm-image`, `AA.4/plus-subgroup`.

*Acceptance:* For B = M_2(ℚ), G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} via det.

*Sources:* khayutin-2019, §2.3.

#### `AA.4/torus-image-residual` — Images of tori in the residual quotient (theorem)

For a quadratic field E ⊂ B and the torus T = E^×/ℚ^× ⊂ G = PB^×, π^+([T(𝔸)]) is a closed subgroup of G_res and Nrd ∘ π^+([T(𝔸)]) = ker χ_E, where χ_E : ℚ^×\𝔸^×/𝔸^{×2} → {±1} is the quadratic character of E/ℚ.

*Hypotheses:* B quaternion over ℚ; E ⊂ B quadratic.

*Proof outline:*
1. T is ℚ-anisotropic, so [T(𝔸)] is a compact abelian group and its image is closed (Khayutin E10 corrects 'isotropic').
2. Nrd restricted to E^× is the field norm N_{E/ℚ}; its image modulo ℚ^×𝔸^{×2} is ℚ^× N(𝔸_E^×)/…, which is ker χ_E by class field theory (ClassFieldTheory layers 11–12).

*Prerequisites:* `AA.4/reduced-norm-components`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `AA.4/homogeneous-measure-pushforward`.

*Acceptance:* For E = ℚ(i) ⊂ (−1,−1)_ℚ, the image is the kernel of the character of ℚ(i)/ℚ.

*Sources:* khayutin-2019, Proof of Proposition 3.6.

#### `AA.4/residual-joint-limit` — Limit behaviour of the residual spectrum (theorem)

Let B be a quaternion algebra over ℚ, G = PB^×, and for each i let T_i = E_i^×/ℚ^× ⊂ G be the torus of a quadratic field E_i ⊂ B, g_i, s_i ∈ G(𝔸), and μ_i the pushforward to [G(𝔸)] × [G(𝔸)] of the Haar probability measure of [T_i(𝔸)] under t ↦ ([t g_i], [t s_i g_i]). Suppose either the E_i are pairwise distinct (put H = G_res) or all equal one field E_0 (put H = ker(χ_{E_0} ∘ Nrd) < G_res). Then every weak-* limit point of (π^+ × π^+)_* μ_i is an H^Δ-invariant probability measure supported on a single coset of H^Δ; in general (π^+ × π^+)_* μ_i need not converge.

*Hypotheses:* as stated.

*Proof outline:*
1. (π^+ × π^+)_* μ_i is the Haar probability measure on the coset of the closed subgroup π^+([T_i(𝔸)])^Δ through (π^+(g_i), π^+(s_ig_i)) (torus-image-residual).
2. Distinct fields give distinct characters χ_i; since the Pontryagin dual of the compact group ℚ^×\𝔸^×/𝔸^{×2} is discrete, the subgroups ker χ_i converge in the Chabauty topology to the whole group, so limits are invariant under H^Δ = G_res^Δ.
3. Equal fields: the invariance group is constant, H^Δ.
4. Non-convergence: the cosets need not converge, only along subsequences (Remark 3.7).

*Prerequisites:* `AA.4/torus-image-residual`, `AA.4/residual-quotient`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `AA.4/homogeneous-measure-pushforward`, `AA.4/chabauty-limit-kernels`.

*Acceptance:* For E_i = E_0 fixed, limits are supported on a coset of ker(χ_{E_0} ∘ Nrd)^Δ.

*Sources:* khayutin-2019, Proposition 3.6; khayutin-2019, Remark 3.7.

#### `AA.4/strong-approximation-finite-places` — Strong approximation through finitely many places (lemma)

For S containing the archimedean places, G has strong approximation with respect to S iff for every finite set S₁ of places disjoint from S, the S ∪ S₁-arithmetic group G(𝒪(S ∪ S₁)) is dense in G_{S₁} = ∏_{v∈S₁} G(F_v).

*Hypotheses:* S ⊇ archimedean places.

*Proof outline:*
1. Basic open sets of G(𝔸^S) are products of opens at finitely many places S₁ and integral points elsewhere (AA.1/compact-open-product).
2. Density of G(F) in such a set is density of the elements integral outside S ∪ S₁ in the open of G_{S₁}.

*Prerequisites:* `AA.4/strong-approximation-property`, `AA.1/compact-open-product`.

*Acceptance:* For SL_2/ℚ and S = {∞}: density of SL_2(ℤ[1/p]) in SL_2(ℚ_p) for every p.

*Sources:* rapinchuk-sa, §2.6, p. 16.

#### `AA.4/s-arithmetic-nondiscrete` — S-arithmetic groups are not discrete at an extra place (lemma)

If G is absolutely almost simple, G_S is noncompact and S₁ is disjoint from S, then the image of G(𝒪(S ∪ S₁)) in G_{S₁} is not discrete and is infinite.

*Hypotheses:* G_S noncompact.

*Proof outline:*
1. G(𝒪(S ∪ S₁)) is a lattice in G_{S∪S₁} (AA.3/s-arithmetic-lattice) while G(𝒪(S)) is a lattice in G_S.
2. If its image in G_{S₁} were discrete, G(𝒪(S ∪ S₁)) ∩ (G_S × open compact) would be a lattice in G_S of covolume tending to infinity as the compact shrinks, contradicting finiteness of covolume (Platonov–Rapinchuk Lemma 3.17).

*Prerequisites:* `AA.3/s-arithmetic-lattice`.

*Acceptance:* SL_2(ℤ[1/p]) is dense, not discrete, in SL_2(ℚ_p).

*Sources:* rapinchuk-sa, §2.6, p. 16.

#### `AA.4/padic-ball-torsion-free` — Principal units of small radius are torsion free (lemma)

In an algebraic closure of ℚ_p, the multiplicative group {λ : |λ − 1|_p < p^{−1/(p−1)}} contains no root of unity other than 1; in particular eigenvalues of elements of 1 + pM_n(ℤ_p) (p ≥ 3) or 1 + 4M_n(ℤ_2) generate a torsion-free group.

*Hypotheses:* p prime.

*Proof outline:*
1. A primitive ℓ-th root of unity ζ with ℓ prime to p has |ζ − 1|_p = 1.
2. A primitive p^k-th root of unity has |ζ − 1|_p = p^{−1/(p^{k−1}(p−1))} ≥ p^{−1/(p−1)}.
3. The set is a group (ultrametric inequality), and eigenvalues of a matrix in 1 + pM_n(ℤ_p) satisfy |λ − 1|_p ≤ p⁻¹ < p^{−1/(p−1)} for p ≥ 3.

*Prerequisites:* `AA.4/neat-element`.

*Acceptance:* −1 ∈ 1 + 2ℤ_2 but −1 ∉ 1 + 4ℤ_2: the level 4 is needed at p = 2.

*Sources:* milne-svi, Proposition 3.5, p. 34.

#### `AA.4/level-action-free-at-neat` — Free action of finite level groups at neat level (lemma)

For a neat compact open U, a normal open U′ ⊂ U and K_∞ compact modulo A_G(ℝ)^0, the stabilizer in U/U′ of any point of X_{U′} is the image of the central group Z(F) ∩ K_∞U; so U/U′ modulo that image acts freely and properly discontinuously on X_{U′}.

*Hypotheses:* U neat; U′ normal in U.

*Proof outline:*
1. The stabilizer of [g] is the image of G(F) ∩ g K_∞U g⁻¹, a finite group (discrete ∩ compact modulo the split centre).
2. By neatness it is torsion free modulo the central part, hence equal to its central part.
3. Proper discontinuity because U/U′ is finite.

*Prerequisites:* `AA.4/level-quotient`, `AA.4/neat-level`, `AA.4/neat-torsion-free`.

*Acceptance:* For GL_2/ℚ at U(3), U/U(9) acts freely on Y(9).

*Sources:* milne-svi, §5, p. 58.

#### `AA.4/homogeneous-measure-pushforward` — Pushforward of a homogeneous measure to a compact abelian quotient (lemma)

Let C be a compact abelian group, π : G → C a continuous surjective homomorphism, T ≤ G a closed subgroup with Λ ≤ T discrete and Λ\T compact (as for [T(𝔸)] with T anisotropic modulo the centre), and μ the T-invariant probability measure on Λ\T g. If π(Λ) = 1, then π_*μ is the Haar probability measure of the coset π(T)·π(g) of the closed subgroup π(T).

*Hypotheses:* C compact abelian; π continuous surjective homomorphism; Λ\T compact.

*Proof outline:*
1. π_*μ is invariant under π(T).
2. A probability measure on a coset invariant under the subgroup is its Haar measure (uniqueness of Haar measure on the compact group π(T)).
3. π(T) is closed: it is the image of the compact Λ\T under the continuous map induced by π.

*Prerequisites:* `AA.4/residual-quotient`, `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.

*Acceptance:* For T = G, π_*μ is the Haar probability measure of C.

*Sources:* khayutin-2019, Definition 3.1.

#### `AA.4/chabauty-limit-kernels` — Kernels of distinct characters converge to the whole group (lemma)

Let C be a compact abelian group and (χ_i) a sequence of pairwise distinct continuous characters C → {±1}. Then the closed subgroups ker χ_i converge to C in the Chabauty topology; consequently any weak-* limit of probability measures invariant under ker χ_i is C-invariant.

*Hypotheses:* C compact abelian; χ_i pairwise distinct.

*Proof outline:*
1. The Pontryagin dual of C is discrete, so a sequence of distinct characters leaves every finite set.
2. Chabauty–Pontryagin duality: the annihilators ⟨χ_i⟩ converge to the trivial subgroup, hence ker χ_i converges to C.
3. Invariance passes to weak-* limits along Chabauty-convergent subgroups.

*Prerequisites:* `AA.4/residual-quotient`.

*Acceptance:* For C = ℚ^×\𝔸^×/𝔸^{×2}, distinct quadratic characters χ_{E_i} have kernels converging to C.

*Sources:* khayutin-2019, Proof of Proposition 3.6.

#### `AA.4/level-quotient-hausdorff` — Level quotients are Hausdorff (lemma)

For compact open U and K_∞ compact modulo A_G(ℝ)^0 containing A_G(ℝ)^0, the level quotient X_U is Hausdorff and locally compact, and G(F) acts properly discontinuously on G(𝔸)/K_∞U.

*Hypotheses:* U compact open; K_∞ as stated.

*Proof outline:*
1. G(F) is discrete in G(𝔸) (AA.1/rational-points-discrete) and K_∞U is compact modulo the central A_G(ℝ)^0, so for compact sets C, C′ only finitely many γ satisfy γC ∩ C′K_∞U ≠ ∅.
2. A quotient of a locally compact Hausdorff space by a properly discontinuous group action is Hausdorff and locally compact.

*Prerequisites:* `AA.4/level-quotient`, `AA.1/rational-points-discrete`, `mathlib:ProperlyDiscontinuousSMul`.

*Acceptance:* SL_2(ℤ)\ℍ is Hausdorff.

*Sources:* milne-svi, Lemma 5.13, p. 57.

#### `AA.4/hecke-degree-double-coset` — Degree of a Hecke correspondence (lemma)

For compact open U and g ∈ G(𝔸_f), the double coset UgU is the disjoint union of [U : U ∩ gUg⁻¹] left cosets of U, and at neat level p₁ : X_{U ∩ gUg⁻¹} → X_U has degree [U : U ∩ gUg⁻¹] modulo the central correction.

*Hypotheses:* U compact open.

*Proof outline:*
1. UgU/U ≅ U/(U ∩ gUg⁻¹) (orbit–stabilizer for U acting on G/U); Tau Ceti HeckeCoset.degree_eq_relIndex states this for abstract Hecke cosets.
2. Combine with level-covering-map for the inclusion U ∩ gUg⁻¹ ⊂ U.

*Prerequisites:* `tauceti:HeckeCoset.degree_eq_relIndex`, `AA.4/level-covering-map`.

*Acceptance:* For GL_2/ℚ, U = GL_2(ℤ̂), g = diag(p,1): p + 1.

*Sources:* arthur-trace-intro, §2, p. 13.

## AA.5. General-purpose validation
`GL_1`: the adelic quotient is Mathlib's idele class group, `GL_1(𝔸)^1` is the norm-one idele
group, `A_{G_m}(ℝ)^0 = ℝ_{>0}` sits diagonally, and the class set at level `Ô^×` is the class group
(Borel 2.2). Calegari–Geraghty's `X_Q = F^×\𝔸_F^×/U_Q A_∞^0` has components that are compact tori of
dimension `r₁ + r₂ − 1` (their `l₀` for `GL_1`), component group `F^×\𝔸_F^×/U_Q(F ⊗ ℝ)^{×,0}`
(corrected), `H⁰ = ℤ_p[π₀(X_Q)]`, and Hecke and diamond operators acting by translation.

`GL_2/ℚ`: for `K_∞ = ℝ^× SO(2)` and compact open `U`, the level quotient is a disjoint union over
`ℚ_{>0}\𝔸_f^×/det U` of quotients `Γ_c\ℍ` with `Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹`; at principal level
`N` there are `φ(N)` copies of `Γ(N)\ℍ`. The analytic identification with modular curves is
imported from ModularCurvesPartII R12.2.

Definite quaternion algebra `D` over `ℚ`: `D^×(ℚ)\D^×(𝔸)^1` is compact (no unipotents in a division
algebra), class sets are finite, arithmetic groups are finite modulo the centre, and the masses
`Σ 1/|Γ_x|` scale by the index under level change.

**Depends on:** AA.2, AA.3, AA.4, ModularCurvesPartII R12.2, GlobalNumberFields layers 4 and 6.
**Consumed by:** AutomorphicFormsOnReductiveGroups AF.5 and ShimuraVarieties V8 (RS-04 links), so
that analytic automorphic forms and arithmetic cohomology use the same adelic quotient.

**Planets:** GL1 check: idele class group (`AA.5/gl1-adelic-quotient`); GL1 check: tori X_Q (`AA.5/gl1-XQ-components`); GL2 check: upper half-plane (`AA.5/gl2-upper-half-plane-component`); Definite quaternion compactness (`AA.5/definite-quaternion-compact`).

### AA.5 declarations

#### `AA.5/gl1-adelic-quotient` — The GL_1 quotient is the idele class group (theorem)

For G = G_m over a number field F: G(F)\G(𝔸_F) ≃ₜ* IdeleClassGroup F; G(𝔸_F)^1 is the group 𝔸_F^1 of norm-one ideles; A_G(ℝ)^0 = ℝ_{>0} embedded diagonally at the archimedean places; 𝔸_F^× = 𝔸_F^1 × ℝ_{>0}; and F^×\𝔸_F^1 is compact while F^×\𝔸_F^× is not.

*Hypotheses:* F a number field.

*Proof outline:*
1. AA.1/gm-adelic identifies the groups; the quotient topologies agree.
2. X*_F(G_m) = ℤ·id, so H_G = log ‖·‖ and G(𝔸)^1 = 𝔸^1 (AA.2/norm-one-subgroup).
3. A_G = G_m ⊂ Res_{F/ℚ} G_m, so A_G(ℝ)^0 = ℝ_{>0}; split-centre-decomposition.
4. Compactness: GlobalNumberFields layer 6 (or AA.3/compactness-anisotropic, G_m^der = 1).

*Prerequisites:* `AA.1/gm-adelic`, `mathlib:NumberField.IdeleClassGroup`, `AA.2/norm-one-subgroup`, `AA.2/split-centre`, `AA.2/split-centre-decomposition`, `AA.2/quotient-norm-one-comparison`, `AA.3/compactness-anisotropic`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`.

*Acceptance:* For F = ℚ: ℚ^×\𝔸^1 ≃ ℤ̂^×, of ideleHaar volume 1.

*Sources:* arthur-trace-intro, §3, p. 16; borel-1963, §5.8, p. 22.

#### `AA.5/gl1-class-number` — GL_1 class number (lemma)

For G = G_m over F and U = Ô^× = ∏_v 𝒪_v^×, G(F)\G(𝔸_f)/U ≃ Cl(𝒪_F), so its cardinality is the class number of F.

*Hypotheses:* F a number field.

*Proof outline:*
1. The map from finite ideles to fractional ideals, x ↦ ∏ 𝔭_v^{v(x_v)}, is surjective with kernel Ô^× and sends F^× to principal ideals (Borel 2.2; GlobalNumberFields layer 4 finite-idele description of the class group).
2. Compare with AA.3/class-number-finite.

*Prerequisites:* `AA.1/gm-adelic`, `AA.3/class-number-finite`, `mathlib:NumberField.classNumber`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`.

*Acceptance:* For F = ℚ(√−5) the double coset space has 2 elements.

*Sources:* borel-1963, Proposition 2.2, p. 11.

#### `AA.5/gl1-XQ-components` — Geometry of the GL_1 arithmetic quotients X_Q (theorem)

For a finite set Q of finite places with N(v) ≡ 1 mod p^n, let U_Q = K_∞ × ∏_v U_{Q,v}, where K_∞ ≅ (S¹)^{r₂} is the identity component of the maximal compact subgroup of (F ⊗ ℝ)^×, U_{Q,v} = 𝒪_v^× for v ∉ Q and the index-p^n subgroup of 𝒪_v^× for v ∈ Q, and X_Q = F^×\𝔸_F^×/U_Q A_∞^0 with A_∞^0 = A_{G_m}(ℝ)^0. Each connected component of X_Q is a compact torus (S¹)^{r₁+r₂−1}, and π_0(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}, an extension of the narrow class group of F by a quotient of ∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n} (not, in general, the maximal exponent-p^n quotient of the ray class group).

*Hypotheses:* F a number field; Q, p, n as stated.

*Proof outline:*
1. AA.3/component-decomposition for G_m with level U_Q: components are Γ\(F ⊗ ℝ)^×/ℝ_{>0} with Γ = F^× ∩ U_Q a finite-index subgroup of the units.
2. (F ⊗ ℝ)^{×,0}/ℝ_{>0} ≅ ℝ^{r₁+r₂−1} × (S¹)^{r₂}, and Γ acts through a lattice of rank r₁ + r₂ − 1 (Dirichlet's unit theorem, Mathlib Units.unitLattice_rank) on the ℝ^{r₁+r₂−1} factor; the quotient of each component is a compact torus of dimension r₁ + r₂ − 1 after including the S¹ factors.
3. π_0 is the quotient by the identity component (F ⊗ ℝ)^{×,0} (correcting Calegari–Geraghty's description, E160 of the reviewed extraction).

*Prerequisites:* `AA.5/gl1-adelic-quotient`, `AA.3/component-decomposition`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.Units.unitLattice_rank`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `AA.5/gl1-units-lattice`.

*Acceptance:* For F = ℚ, X_Q is finite (r₁ + r₂ − 1 = 0) and π_0(X_Q) = ℚ^×\𝔸^×/U_Q ℝ_{>0} ≅ ℤ̂^×/U_Q. For F real quadratic and Q = ∅, X_Q has h⁺_F components, each a circle.

*Sources:* calegari-geraghty-2018, §8.2, p. 79.

#### `AA.5/gl1-component-dimension` — The invariant l0 for GL_1 (lemma)

Every connected component of X_Q has dimension r₁ + r₂ − 1 = NumberField.Units.rank F, the value of Calegari–Geraghty's invariant l0 for G = GL_1/F; in particular its cohomology vanishes above degree r₁ + r₂ − 1.

*Hypotheses:* F a number field.

*Proof outline:*
1. Dimension of the torus of gl1-XQ-components; r₁ + r₂ = #InfinitePlace F (Mathlib), so the dimension is Units.rank F.

*Prerequisites:* `AA.5/gl1-XQ-components`, `mathlib:NumberField.Units.rank`.

*Acceptance:* For F imaginary quadratic, l0 = 0.

*Sources:* calegari-geraghty-2018, §8.2, p. 78.

#### `AA.5/gl1-H0` — Degree-zero cohomology of X_Q (lemma)

The ℤ_p-module of locally constant functions X_Q → ℤ_p is free on π_0(X_Q): H^0(X_Q, ℤ_p) ≅ ℤ_p[π_0(X_Q)].

*Hypotheses:* as in gl1-XQ-components.

*Proof outline:*
1. X_Q is a finite disjoint union of its connected components (finitely many, by AA.3/class-number-finite), each connected; locally constant functions are constant on components.

*Prerequisites:* `AA.5/gl1-XQ-components`, `AA.3/class-number-finite`.

*Acceptance:* For F = ℚ and Q = ∅, H^0(X, ℤ_p) = ℤ_p (one component).

*Sources:* calegari-geraghty-2018, §8.2, p. 79.

#### `AA.5/gl1-hecke-action` — Hecke and diamond operators for GL_1 (lemma)

For v ∉ Q with uniformizer π_v, the Hecke correspondence T_{π_v} (AA.4/hecke-correspondence for g = π_v at v) is right translation by π_v, acting on π_0(X_Q) by multiplication by the class [π_v]; for v ∈ Q and α ∈ 𝒪_v^×, the diamond operator ⟨α⟩ is right translation by α. Since all operators are translations they act compatibly on H^0 and, through the Künneth decomposition of each torus component, identically on all cohomological degrees.

*Hypotheses:* as in gl1-XQ-components.

*Proof outline:*
1. G_m is abelian, so U_Q π_v U_Q = π_v U_Q and the Hecke correspondence is a single translation.
2. Translation permutes the components by the class of π_v in π_0 and maps each torus component to another by a translation, which acts trivially on the cohomology of the torus up to that permutation.

*Prerequisites:* `AA.4/hecke-correspondence`, `AA.5/gl1-XQ-components`, `AA.5/gl1-H0`.

*Acceptance:* For F = ℚ and Q = ∅, T_p acts on π_0 = point trivially.

*Sources:* calegari-geraghty-2018, §8.2, p. 79.

#### `AA.5/gl2-upper-half-plane-component` — The GL_2/ℚ quotient and the upper half-plane (theorem)

For G = GL_2 over ℚ, K_∞ = ℝ^× SO(2) and U ⊂ GL_2(𝔸_f) compact open, G(ℚ)\G(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ, where Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹ for g_c ∈ GL_2(𝔸_f) with det g_c = c, acting on ℍ by Möbius transformations; for det U = ℤ̂^× there is a single component.

*Hypotheses:* G = GL_2/ℚ; U compact open.

*Proof outline:*
1. GL_2(ℝ)/ℝ^×SO(2) ≃ ℍ^± (Mathlib's glAction), and G(ℚ) is dense in G(ℝ)/G(ℝ)^+ so one may restrict to ℍ and GL_2(ℚ)^+ (Milne 5.11).
2. π_0 = GL_2(ℚ)^+\GL_2(𝔸_f)/U ≃ ℚ_{>0}\𝔸_f^×/det U by class-set-abelianization (SL_2 is simply connected with SL_2(ℝ) noncompact; strong approximation for SL_2).
3. AA.3/component-decomposition then identifies each component; the analytic identification of Γ\ℍ with the modular curve is ModularCurvesPartII R12.2.

*Prerequisites:* `AA.3/component-decomposition`, `AA.4/class-set-abelianization`, `AA.4/strong-approximation-theorem`, `tauceti:Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`, `mathlib:UpperHalfPlane.glAction`, `mathlib:Matrix.GeneralLinearGroup.det`, `ModularCurvesPartII:R12.2`, `AA.4/level-quotient`, `AA.5/gl2-real-quotient`.

*Used by:* AutomorphicFormsOnReductiveGroups:AF.5 — the classical/adelic function dictionary for GL_2 (RS-04 link AA.5 → AF.5); ShimuraVarieties:V8 — underlying GL_2 quotient comparison (RS-04 link AA.5 → V8).

*Acceptance:* For U = GL_2(ℤ̂): SL_2(ℤ)\ℍ (one component). For U = K(N): (ℤ/N)^× copies of Γ(N)\ℍ (gl2-principal-level).

*Sources:* milne-svi, Lemma 5.13, p. 57.

#### `AA.5/gl2-principal-level` — Principal congruence level (lemma)

For U = K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N)), det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}, the components are indexed by (ℤ/N)^×, and each Γ_c is Γ(N) = ker(SL_2(ℤ) → SL_2(ℤ/N)) (Mathlib CongruenceSubgroup.Gamma).

*Hypotheses:* N ≥ 1.

*Proof outline:*
1. ℚ_{>0}\𝔸_f^×/det K(N) ≅ ℤ̂^×/(1 + Nℤ̂) ≅ (ℤ/N)^×.
2. GL_2(ℚ)^+ ∩ K(N) = SL_2(ℤ) ∩ K(N) = Γ(N) (determinant a positive unit of ℤ is 1); other components are conjugate by elements of GL_2(ℤ̂) normalizing K(N) with determinant c.

*Prerequisites:* `AA.5/gl2-upper-half-plane-component`, `mathlib:CongruenceSubgroup.Gamma`, `AA.3/arithmetic-subgroup-of-level`.

*Acceptance:* For N = 1 or 2 there is one component.

*Sources:* milne-svi, Lemma 5.13, p. 57.

#### `AA.5/definite-quaternion-compact` — Compactness for a definite quaternion algebra (theorem)

For a definite quaternion algebra D over ℚ and G = D^×: G(ℚ)\G(𝔸)^1 is compact; G(ℚ)\G(𝔸_f)/U is finite for every compact open U; each Γ_{x,U} = D^× ∩ xUx⁻¹ is finite; and D^×/ℚ^× is discrete in (D ⊗ 𝔸_f)^×/𝔸_f^×.

*Hypotheses:* D a quaternion division algebra over ℚ with D ⊗ ℝ ≅ ℍ (Hamilton).

*Proof outline:*
1. G^der = SL_1(D) is anisotropic: D is a division algebra, so D^× has no nontrivial unipotent elements (a unipotent u gives the nilpotent u − 1 ≠ 0 in D); apply AA.3/compactness-anisotropic.
2. Finiteness of class sets: AA.3/class-number-finite.
3. Γ_{x,U} is discrete in G(ℝ) = ℍ^×, whose image modulo the centre ℝ^× is compact, so Γ_{x,U}/(Γ_{x,U} ∩ ℚ^×) is finite; AA.1/finite-adelic-discreteness-criterion gives the last statement.

*Prerequisites:* `AA.3/compactness-anisotropic`, `AA.3/class-number-finite`, `AA.3/arithmetic-subgroup-of-level`, `AA.1/finite-adelic-discreteness-criterion`, `mathlib:QuaternionAlgebra`, `AA.3/division-algebra-no-unipotent`.

*Acceptance:* For D = (−1, −1)_ℚ and U the units of the Hurwitz order, the class number is 1 and Γ/{±1} has order 12. For M_2(ℚ) (split, not definite) the quotient is not compact.

*Sources:* milne-svi, §3, p. 33.

#### `AA.5/definite-quaternion-mass` — Volume comparison under level change for a definite quaternion algebra (theorem)

For D definite over ℚ and compact open U′ ⊂ U ⊂ (D ⊗ 𝔸_f)^×, with Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U) the finite stabilizers: ∑_{x ∈ Cl(U′)} 1/|Γ′_x| = [U : U′]/[ℚ^× ∩ U : ℚ^× ∩ U′] · ∑_{x ∈ Cl(U)} 1/|Γ_x|, where Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U.

*Hypotheses:* D definite; U′ ⊂ U compact open.

*Proof outline:*
1. G(ℝ)^1 modulo the centre is compact, so vol(Γ_x\G(ℝ)^1) = vol(G(ℝ)^1/ℝ_{>0})/|Γ_x| up to the central correction.
2. Apply AA.4/level-volume-index (equivalently AA.4/level-map-fibre-mass summed over the base).

*Prerequisites:* `AA.5/definite-quaternion-compact`, `AA.4/level-volume-index`, `AA.4/level-map-fibre-mass`, `AA.4/level-quotient-groupoid`.

*Acceptance:* For the Hurwitz order and U′ of index 2 at p = 3 (Eichler order of level 3), the masses scale by [U : U′] = 4 = 3 + 1.

*Sources:* arthur-trace-intro, §2, p. 12.

#### `AA.5/gl2-real-quotient` — GL_2(ℝ) modulo ℝ^× SO(2) (lemma)

GL_2(ℝ)/ℝ^× SO(2) is homeomorphic to ℍ^± = ℂ ∖ ℝ through g ↦ g·i, equivariantly for the Möbius action; GL_2(ℝ)^+ acts transitively on ℍ with stabilizer ℝ^× SO(2) at i.

*Proof outline:*
1. Mathlib's glAction gives the action; transitivity by g = (y^{1/2}, x y^{-1/2}; 0, y^{-1/2}).
2. The stabilizer of i in GL_2(ℝ)^+ is ℝ_{>0}·SO(2) up to ±1; complex conjugation exchanges ℍ and its conjugate.

*Prerequisites:* `mathlib:UpperHalfPlane.glAction`.

*Acceptance:* diag(1, −1) maps i to −i.

*Sources:* milne-svi, Lemma 5.11, p. 56.

#### `AA.5/gl1-units-lattice` — Units at level U_Q form a lattice of rank r₁ + r₂ − 1 (lemma)

For a compact open U ⊂ Ô^×, Γ_U = F^× ∩ U is a finite-index subgroup of 𝒪_F^×, and its image under the logarithmic embedding is a lattice of rank r₁ + r₂ − 1 in the trace-zero hyperplane of ℝ^{r₁+r₂}.

*Hypotheses:* F a number field; U compact open.

*Proof outline:*
1. F^× ∩ Ô^× = 𝒪_F^×, and U has finite index in Ô^×, so Γ_U has finite index in 𝒪_F^×.
2. Dirichlet's unit theorem (Mathlib: the unit lattice has rank Units.rank F); a finite-index subgroup of a lattice is a lattice of the same rank.

*Prerequisites:* `mathlib:NumberField.Units.unitLattice_rank`, `mathlib:NumberField.Units.rank`.

*Acceptance:* For F = ℚ(√2), Γ is generated up to torsion by a power of 1 + √2.

*Sources:* calegari-geraghty-2018, §8.2, p. 79.

## Requests to other roadmaps

- **ReductiveGroupsPartII:RG2.0**: The topology on X(R) = Hom_{alg}(A, R) for an affine scheme of finite type and an arbitrary Hausdorff topological ring R (not only a local field): the weakest topology making all evaluation maps continuous (Conrad, Proposition 2.1), with functoriality in X and in continuous ring maps R → R′ (embeddings, open and closed embeddings, discreteness: Conrad, Example 2.2), compatibility with fibre products, closed immersions to closed embeddings, local compactness when R is locally compact, the topological-group axioms for Hopf algebras, and compactness and openness of 𝒳(𝒪_v) in X(F_v) for affine models over 𝒪_v (Conrad, Example 2.3 and Corollary 3.7). AA.1 evaluates it on 𝔸_F, 𝔸_{F,f}, F_v, 𝒪_v and F ⊗ ℝ. (needed by `AA.1/adelic-points`, `AA.1/restricted-product-comparison`, `AA.1/integral-points-level`, `AA.1/rational-points-discrete`, `AA.1/adelic-map`, `AA.1/closed-subgroup-adelic`, `AA.1/product-adelic`)
- **ReductiveGroupsPartII:RG2.0a**: Weil restriction Res_{E/F} for affine finite-type schemes along a finite separable extension of number fields, with the identification of points Res_{E/F}(X)(R) ≅ X(E ⊗_F R) natural in the F-algebra R and compatible with group structures. (needed by `AA.1/base-change-adelic`, `AA.1/base-change-local-factors`)
- **ReductiveGroupsPartII:RG2.4**: The Cartan decomposition G(E) = K M(E) K for connected reductive G over a nonarchimedean local field E of characteristic 0, with K a special maximal compact subgroup containing representatives of the relative Weyl group, and M = Z_G(A) for a maximal E-split torus A; together with compactness of M(E)/A(E)-modulo-M(E)^1 used to see that M(E) = A(E)·M(E)^1 up to finite index. (needed by `AA.1/local-unimodular-reductive`, `AA.3/adelic-iwasawa`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles**: Local compactness of the finite adele ring FiniteAdeleRing (𝓞 K) K, and the placewise projections as continuous K-algebra maps 𝔸_{K,f} → K_v. (needed by `AA.0/finite-adele-haar`, `AA.1/adelic-points`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient**: Local compactness of the adele ring and the continuity of the diagonal K → 𝔸_K. (needed by `AA.1/adelic-points-locally-compact`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles**: The idele group 𝔸_K^× with Mathlib's units topology is locally compact and Hausdorff, and RestrictedProduct.unitsEquiv is a homeomorphism for the finite part; the idele norm ‖·‖ : 𝔸_K^× → ℝ_{>0} as a continuous homomorphism trivial on K^×; compactness of the norm-one idele class group; density of K in 𝔸_{K,f} (denseRange_algebraMap_finiteAdeleRing). (needed by `AA.0/idele-haar`, `AA.1/gm-adelic`, `AA.2/log-height`, `AA.5/gl1-adelic-quotient`, `AA.4/ga-strong-approximation`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles**: The base-change comparison adeleBaseChangeEquiv : 𝔸_K ⊗_K L ≃A[𝔸_K] 𝔸_L for a finite extension L/K, as a continuous algebra equivalence with the module topology on the source, compatible with the diagonal embeddings and with the decomposition 𝔸_K ⊗_K L = ∏_v (K_v ⊗_K L). (needed by `AA.1/base-change-adelic`, `AA.1/base-change-local-factors`)
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions**: For a real reductive Lie group G(ℝ) (also G(ℂ) viewed as a real group) with maximal compact K: the KAK decomposition G = K·closure(A⁺)·K with Weyl group representatives in K, and the Iwasawa decomposition G = K A N. (needed by `AA.1/local-unimodular-reductive`, `AA.3/adelic-iwasawa`, `AA.3/horospherical-decomposition`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula**: Functoriality of normalized absolute values under a finite extension E/F: |x|_w for x ∈ F_v equals |x|_v^{[E_w:F_v]}, with the local degrees in the exponents, and the product formula, used to compare the gauge-form measures of Res_{E/F} G with those of G. (needed by `AA.2/tamagawa-restriction-scalars`)
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant**: The relative discriminant ideal relDiscr 𝒪_F 𝒪_E and the tower formula |d_E| = |d_F|^{[E:F]} · N(relDiscr), used for the discriminant factors of Tamagawa measures under restriction of scalars. (needed by `AA.2/tamagawa-restriction-scalars`)
- **ReductiveGroupsPartII:RG2.1**: Field-generic Borel–Tits structure theory over a field of characteristic 0 (in particular a number field): existence and G(F)-conjugacy of minimal F-parabolic subgroups and of maximal F-split tori; the relative root system Φ(S_0, G) with positive roots from a minimal parabolic and simple roots Δ_0; the bijection between subsets of Δ_0 and standard parabolics; the relative Bruhat decomposition G(F) = ⊔_w P_0(F) w P_0(F); and the Borel–Tits criterion that a connected reductive group has a proper F-parabolic iff its derived group is F-isotropic iff G(F) contains a nontrivial unipotent element. RG2.1 states these for local fields E; AA.3 needs them over a number field. (needed by `AA.3/minimal-parabolic-data`, `AA.3/compactness-anisotropic`, `AA.3/compactness-isotropic`, `AA.3/relative-chamber`)
- **ReductiveGroupsPartII:RG2.3**: For a connected reductive group over a number field F with an integral model, the statement that the model is reductive (hyperspecial integral points) at all but finitely many places, and that 𝓗(𝒪_v) is then a special maximal compact subgroup in good position relative to a given maximal F_v-split torus coming from a global maximal F-split torus (Tits, Reductive groups over local fields, 3.9.1). (needed by `AA.3/good-maximal-compact`, `AA.3/adelic-iwasawa`)
- **AutomorphicFormsOnReductiveGroups:AF.1**: The comparison of norms on a real reductive group (Bernstein–Krötz §2): for faithful algebraic representations ι, ι′ of G(F_∞) the scale functions ‖g‖_ι and ‖g‖_{ι′} satisfy ‖g‖_{ι′} ≤ C ‖g‖_ι^N; and invariance up to a constant under change of the maximal compact subgroup. AA.3 uses it for the archimedean factor of the adelic height (RT-AREA-automorphic-1/38). (needed by `AA.3/height-representation-comparison`)
- **ReductiveGroupsPartII:RG2.4**: The Kneser–Tits theorem over nonarchimedean local fields of characteristic 0 (RT-AREA-automorphic-1/7): for G simply connected, absolutely almost simple and isotropic over E, define G(E)^+ as the subgroup generated by the E-points of the unipotent radicals of E-parabolics and prove Platonov's theorem G(E) = G(E)^+, Tits's simplicity of G(E)^+ modulo its centre (using the Tits system of the Iwahori–Bruhat decomposition), and the consequence that G(E) has no proper subgroup of finite index and no proper noncentral normal subgroup. This is the sub-stage RG2.4:kneser-tits proposed in RT-AREA-automorphic-1.fixes.md; AA.4 consumes only the finite-index consequence. (needed by `AA.4/strong-approximation-sufficiency`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles**: Strong approximation for the additive group: denseRange_algebraMap_finiteAdeleRing (K dense in 𝔸_{K,f}). (needed by `AA.4/ga-strong-approximation`, `AA.3/unipotent-class-number-one`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences**: Weak approximation for number fields (weakApproximation_denseRange, already in Tau Ceti) and its congruence/sign corollaries. (needed by `AA.4/weak-approximation-gln`)
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence**: For a quadratic extension E/ℚ, the quadratic character χ_E of ℚ^×\𝔸^× with kernel ℚ^× N_{E/ℚ}(𝔸_E^×) (global reciprocity and the norm index [𝔸^× : ℚ^× N 𝔸_E^×] = 2), viewed as a character of ℚ^×\𝔸^×/𝔸^{×2}. (needed by `AA.4/torus-image-residual`, `AA.4/residual-joint-limit`)
- **tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy**: Hasse–Minkowski for quadratic forms over ℚ in five variables, used to show that a positive rational number is a reduced norm of a definite quaternion algebra over ℚ (the Hasse–Schilling–Maass theorem for quaternion algebras). (needed by `AA.4/quaternion-reduced-norm-image`)
- **tauceti:TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions**: Chebotarev density for the splitting field of a finite étale group scheme (infinitely many places with prescribed Frobenius conjugacy class), used for the necessity of simple connectedness in strong approximation (Rapinchuk Proposition 2.2). (needed by `AA.4/strong-approximation-necessity`)
- **ModularCurvesPartII:R12.2**: The analytic identification of Γ(N)\ℍ (and Γ₀, Γ₁ quotients) with the corresponding level quotients, as an isomorphism of analytic spaces with the functorial action, used to identify the GL_2/ℚ adelic component with the upper half-plane quotient. (needed by `AA.5/gl2-upper-half-plane-component`)
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles**: Compactness of the norm-one idele class group IdeleClassGroup.normOne and the description of the identity component of the idele class group, for the GL_1 validation. (needed by `AA.5/gl1-adelic-quotient`, `AA.5/gl1-XQ-components`)

## Recorded gaps

- **Measures of gauge forms on nonarchimedean analytic groups.** Defining |ω|_v on G(F_v) for a nonarchimedean local field F_v needs the F_v-analytic manifold structure of G(F_v) for smooth G and the change-of-variables formula μ(ψ(U)) = ∫_U |det Dψ|_v dμ for F_v-analytic diffeomorphisms ψ between open subsets of F_v^d. Mathlib has the inverse function theorem over complete normed fields and the real change-of-variables theorem, but not its p-adic analogue, and no layer of the atlas plans it (searched: 'analytic manifold', 'p-adic Lie', 'change of variables'). The archimedean case is covered by Mathlib's real change of variables. (needed by `AA.2/local-form-measure`, `AA.2/weil-volume-formula`)
- **Leading coefficient of Artin L-functions at s = 1.** For a connected group G whose character module X*(G_{F̄}) has nontrivial Galois action, the constant ρ_G needs the meromorphic continuation of the Artin L-function L(X, s) to a neighbourhood of s = 1 and the nonvanishing at s = 1 of L(σ, s) for the nontrivial irreducible constituents σ (Brauer induction and the nonvanishing of Hecke L-functions at s = 1). No layer of the atlas plans Artin L-functions of number fields in this generality (atlas search 'Artin L' finds only function-field and Iwasawa layers), and the libraries lack them. The split case (trivial Galois action), which covers GL_n, split tori and every semisimple group, uses only the residue of the Dedekind zeta function (Mathlib). (needed by `AA.2/convergence-factors`, `AA.2/tamagawa-measure`)
- **Orders of finite reductive groups (Steinberg's formula).** Absolute convergence of the Tamagawa product needs #𝓗(k_v) = q_v^d ∏_i (1 - ε_i q_v^{-d_i}) for connected reductive groups over finite fields, or at least #𝓗(k_v) q_v^{-d} = L_v(X, 1)^{-1}(1 + O(q_v^{-2})) uniformly in v (Lang's theorem and the Bruhat decomposition over 𝔽_q). Neither library has it and no atlas layer plans it (searched 'Steinberg', '#G(F_q)', 'Lang's theorem'). The cases GL_n and SL_n are elementary counts. (needed by `AA.2/tamagawa-convergence`)
- **Cartan's closed-subgroup theorem for p-adic analytic groups.** The openness of the p-adic closure of a Zariski-dense subgroup (Rapinchuk Lemma 2.7) uses Cartan's theorem that a closed subgroup of a p-adic analytic group is an analytic subgroup with a Lie algebra, together with the irreducibility of the adjoint representation of an absolutely almost simple group. Neither library has p-adic analytic groups and no atlas layer plans this theorem (searched 'Cartan', 'p-adic Lie', 'analytic group'). (needed by `AA.4/zariski-dense-closure-open`)
- **Borel density theorem.** Zariski density of infinite S-arithmetic subgroups of absolutely almost simple groups with G_S noncompact (Platonov–Rapinchuk Theorem 4.10, cited by Rapinchuk §2.4) is planned in no layer and absent from the libraries; Platonov–Rapinchuk is not freely available and the proof (Furstenberg's projective-measure argument) is not read here. (needed by `AA.4/borel-density`)
- **Kneser's and Harder–Chernousov's Galois-cohomology theorems.** Kneser's vanishing of H¹(F_v, G) for simply connected semisimple G at nonarchimedean v, the Hasse principle of Kneser–Harder–Chernousov and weak approximation for simply connected groups (Platonov–Rapinchuk Theorems 6.4, 6.6, 7.8, cited by Harpaz–Wittenberg §6) are stated here with their exact hypotheses, but their proofs (classification-based, using Bruhat–Tits theory and case-by-case work for E8) are not decomposed: the book is not freely available and no atlas layer plans the classification of simply connected groups over local and global fields. (needed by `AA.4/kneser-local-torsor`, `AA.4/hasse-principle-simply-connected`, `AA.4/weak-approximation-simply-connected`)

## Mistakes found in the sources

- **AdelicAlgebraicGroups/E1** (error, bkt-2020, §4.5, p. 17 of arXiv:1810.04801v2 (JAMS p. 933)). Printed: “Moreover, if b is (e′, C′)-reduced and e is a basis for which condition (3) of Definition 4.11 holds for some C > 0, then b will also be (e, C″)-reduced for some C″ = C″(e, C, e′, C′) > 0.” Correction: b is (σe, C″)-reduced for the permutation σ of e that sorts the values b(e_i, e_i); condition (2) transfers only up to reordering. Reason: Take e′ the standard basis of ℚ², e = (e₂, e₁) and b = diag(1, 1000): b is (e′, 2)-reduced and satisfies (3) in e with C = 2, but condition (2) in the order e requires 1000 < C″·1 for every b in the family diag(1, t), which fails as t grows. Affects: the proof. Known: Not corrected in print or in the 2023 erratum; first recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E3 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E2** (error, bkt-2020, Definition 2.5 and Proposition 2.7, pp. 8–9 of arXiv v2 (JAMS p. 924)). Printed: “Proposition 2.7. [BJ06a, Prop. 2.5] (1) ... There exists Siegel sets Si := Ui × APi,ti × Wi associated to Pi and xi, 1 ≤ i ≤ k, whose images in Γ\G/M cover the whole space.” Correction: Siegel sets for G/M must be associated to one fixed maximal compact K ⊃ M; Proposition 2.7 holds when all Siegel sets use the same K. Reason: For SL₂(ℤ) and x ≠ i in ℍ, a Siegel set B_N B_A K_x is not contained in finitely many translates of Siegel sets for K_i (erratum §1.6.1), so the definable structures for different K differ. Affects: a stated result. Known: Erratum, J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1025, §1.1 and Theorem 1.2(1)
- **AdelicAlgebraicGroups/E3** (misprint, bkt-2020, §2.2, (2.3), p. 8 of arXiv v2 (JAMS p. 923)). Printed: “We recall (see [BJ06a, Lemma 2.3] that the right action of P on itself under the horospherical decomposition is given by (2.3) (n0 a0 mo)(n, a, m) = (n0 · (a0 m0)n(a0 m0)−1, a0 a, m0 m).” Correction: the left action of P on itself (and on G); read m₀ for m_o, and close the parenthesis after [BJ06a, Lemma 2.3]. Reason: The formula computes the product p₀·(n a m), i.e. left multiplication: (n₀a₀m₀)(n a m) = n₀ (a₀m₀ n (a₀m₀)⁻¹)(a₀ a)(m₀ m) since A_P and M_P commute. Affects: nothing. Known: Not corrected in print; first recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E10 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E4** (misprint, bkt-2020, Proposition 2.7(3), p. 9 of arXiv v2 (JAMS p. 924)). Printed: “Suppose that P1 is not Γ-conjugate to P2. Fix Ui, Wi, i = 1, 2. Then γS1 ∩ S2 = ∅ for all t1, t2 sufficiently large.” Correction: Then γ𝔖₁ ∩ 𝔖₂ = ∅ for all γ ∈ Γ, once t₁, t₂ are sufficiently large. Reason: γ is unbound in the printed sentence; the intended uniformity in γ is what Borel–Ji prove and what the proof of the definable structure uses. Affects: nothing. Known: Not corrected in print; first recorded as PAPER-BAKKER-KLINGLER-TSIMERMAN-20/E39 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E5** (error, khayutin-2019, §2.3 'Simply connected cover' (arXiv v3 §2.3; Annals p. 162) and the proof of Proposition 3.6 (arXiv v3 Proposition 18; Annals p. 172)). Printed: “this morphism has full image if B is split at ∞ and the image is the index-2 subgroup Q>0\R>0 × A×f/A×2 otherwise” Correction: The reduced norm induces a bijection G(ℚ)\G(𝔸)/G(𝔸)^+ → ℚ^×\𝔸^×/𝔸^{×2} in both cases. Reason: When B is definite the image ℚ_{>0}\(ℝ_{>0} × 𝔸_f^×)/𝔸^{×2} surjects onto ℚ^×\𝔸^×/𝔸^{×2}: an idele with negative archimedean component is multiplied by −1 ∈ ℚ^× into the positive part. Affects: nothing. Known: Not corrected in print; first recorded as PAPER-KHAYUTIN-19/E39 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E6** (error, khayutin-2019, §2.3, arXiv v3 (Annals p. 162)). Printed: “the reduced norm map Nrd : B× → Gm induces a monomorphism of compact abelian groups Nrd : G(A)/G(A)+ → A×/A×2” Correction: a monomorphism of locally compact abelian groups; neither G(𝔸)/G(𝔸)^+ nor 𝔸^×/𝔸^{×2} is compact (only their quotients by G(ℚ) and ℚ^× are). Reason: 𝔸^×/𝔸^{×2} surjects onto ∏_p ℚ_p^×/ℚ_p^{×2} restricted to almost all units, which is an infinite discrete-by-compact group with infinitely many open cosets of ∏_p ℤ_p^×/ℤ_p^{×2}; it is not compact. Affects: the proof. Known: Not corrected in print; first recorded as PAPER-KHAYUTIN-19/E40 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E7** (misprint, khayutin-2019, Proof of Proposition 3.6 (arXiv v3 Proposition 18; Annals p. 172)). Printed: “Because T(A) is abelian and T is isotropic over Q the homogeneous set [T(A)] is a compact abelian group.” Correction: Because T(𝔸) is abelian and T is anisotropic over ℚ, the homogeneous set [T(𝔸)] is a compact abelian group. Reason: T = E^×/ℚ^× for a quadratic field E is ℚ-anisotropic; compactness of T(ℚ)\T(𝔸) uses anisotropy. Affects: nothing. Known: Not corrected in print; first recorded as PAPER-KHAYUTIN-19/E10 in the reviewed extraction, rechecked here.
- **AdelicAlgebraicGroups/E8** (error, calegari-geraghty-2018, §8.2, arXiv v2 p. 79 (Inventiones p. 403)). Printed: “What, geometrically, is XQ? The component group is the maximal quotient of the ray class group of conductor Q and exponent p^n.” Correction: π₀(X_Q) = F^×\𝔸_F^×/U_Q(F ⊗ ℝ)^{×,0}: an extension of the narrow class group of F by a quotient of ∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}, not the maximal exponent-p^n quotient of the ray class group; correspondingly H⁰(X_Q, ℤ_p) = ℤ_p[π₀(X_Q)]. Reason: Take F = ℚ(√−5), Q = ∅ and p = 3: X_Q has π₀ = F^×\𝔸^×/Ô^×(F ⊗ ℝ)^{×,0} ≅ Cl(F) ≅ ℤ/2, while the maximal quotient of exponent 3^n of the ray class group of conductor 1 is trivial. Affects: nothing. Known: Not corrected in print or in the 2022 Correction (Invent. Math. 227); first recorded as PAPER-CALEGARI-GERAGHTY-18/E160 in the reviewed extraction, rechecked here.

## Proposed sub-layers

- AA.4 now holds four distinct developments (49 nodes): approximation theorems, neat elements and neat levels (moved here by RT-AREA-automorphic-1/28), level maps with Hecke correspondences, and Khayutin's residual quotient. RT-AREA-automorphic-1.fixes.md already proposes the early sub-stage AA.4:neat-levels with consumers ArithmeticLocallySymmetricSpaces:ALS.0, ShimuraData:D5 and ShimuraVarieties:V0. Sub-layers of AA.4: AA.4:approximation (weak-approximation-property, weak-approximation-gln, weak-approximation-simply-connected, group-torsor, kneser-local-torsor, hasse-principle-simply-connected, strong-approximation-property, ga-strong-approximation, torus-strong-approximation-failure, zariski-dense-closure-open, borel-density, open-finite-covolume-finite-index, strong-approximation-finite-places, s-arithmetic-nondiscrete, strong-approximation-sufficiency, strong-approximation-necessity, strong-approximation-theorem, class-set-abelianization); AA.4:neat-levels (neat-element, neat-representation-independence, neat-stability, neat-torsion-free, neat-level, padic-ball-torsion-free, neat-criterion-one-prime, neat-level-exists, level-action-free-at-neat), requiring AA.1 and AA.3 and consumed by AA.4, ALS.0, D5 and V0; AA.4:level-maps (double-coset-level-map, double-coset-level-cardinality, double-coset-conjugate-level, finite-support-product-index, level-quotient, level-quotient-hausdorff, level-covering-map, level-map-fibre-mass, level-quotient-groupoid, hecke-correspondence, hecke-degree-double-coset, hecke-cartesian, quotient-volume-decomposition, level-volume-index); AA.4:residual (plus-subgroup, residual-quotient, quaternion-reduced-norm-image, reduced-norm-components, torus-image-residual, homogeneous-measure-pushforward, chabauty-limit-kernels, residual-joint-limit).
- AA.3 mixes adelic reduction theory (Borel 1963, Arthur §8) with the fixed-K real Siegel-set theory of Bakker–Klingler–Tsimerman and its corrections, which ArithmeticQuotientDefinability and ALS.2 consume separately. Sub-layers of AA.3: AA.3:adelic (minimal-parabolic-data, relative-chamber, good-maximal-compact, adelic-iwasawa, H-P, adelic-siegel-set, siegel-covering-adelic, siegel-finiteness-adelic, class-number-finite, unipotent-class-number-one, semidirect-class-number, arithmetic-subgroup-of-level, component-decomposition, finite-volume, tamagawa-number-finite, finite-volume-criterion, compactness-anisotropic, compactness-isotropic, cocompact-no-unipotents, s-arithmetic-lattice, adelic-height, height-representation-comparison, height-siegel-estimate, gln-real-reduction, gln-adelic-covering, self-adjoint-reduction, closed-orbit-finiteness, siegel-set-finite-measure, parabolic-double-cosets-finite, arithmetic-quotient-finite-volume, division-algebra-no-unipotent, arithmetic-quotient-compact) and AA.3:real-siegel (horospherical-decomposition, positive-root-coordinates, real-siegel-set, real-siegel-translation, finitely-many-cusps, real-siegel-finite-cover, real-siegel-finite-overlap, cusp-separation, deep-cusp-stabilizer, deep-distinct-parabolics, siegel-convention-comparison, orr-schnell-containment, cartan-subgroup-criterion, rational-siegel-pullback, incompatible-morphism-obstruction, orbit-map-siegel-preimage, orbit-map-siegel-image, reduced-form, reduced-form-set, reduction-siegel-dictionary, gram-diagonal-lower-bound, gram-offdiagonal-transfer, basis-change-reducedness).

## Coverage

- **AA.0** — planned. Remaining: Promote the countable-additivity argument for the directed supremum of the level measures (restricted-haar-product, step 2) to its own lemma node. Request local compactness of the finite adeles from GlobalNumberFields layer 4 is open until that layer lands in Tau Ceti.
- **AA.1** — planned. Remaining: The affine-points topology over an arbitrary Hausdorff topological ring is requested from ReductiveGroupsPartII:RG2.0; once RG2.0 is planned, replace the stage prerequisite by its node ids. Split restricted-product-comparison into its set-theoretic bijection (Conrad Theorem 3.6, first sentence) and its topological half.
- **AA.2** — planned. Remaining: Decompose tamagawa-restriction-scalars into the local discriminant computation for gauge forms and the inductivity of the local factors L_v(X, s). Three recorded gaps (p-adic change of variables for gauge-form measures, Artin L-functions at s = 1, Steinberg's order formula) block the general Tamagawa measure; the split-character and semisimple cases are closed modulo the first gap.
- **AA.3** — planned. Remaining: Decompose siegel-covering-adelic into the GL_n step (Hermite–Minkowski reduction through reduced forms), the self-adjoint embedding step (Borel 4.5) and the finiteness of closed orbits (Borel 5.4). Read Borel–Ji (Proposition 2.5), Orr–Schnell (Theorem 1, §§B–C) and Klingen (Proposition 2, p. 18) to replace the inherited statements of the real Siegel-set nodes by freshly checked ones; the proofs of orr-schnell-containment and incompatible-morphism-obstruction are not decomposed. Field-generic Borel–Tits theory is requested from ReductiveGroupsPartII:RG2.1.
- **AA.4** — planned. Remaining: The general case of strong-approximation-sufficiency (several places of S₁, anisotropic places; Platonov–Rapinchuk §7.4) is not decomposed. Recorded gaps: Cartan's closed-subgroup theorem for p-adic analytic groups, Borel density, and the Kneser/Harder–Chernousov Galois-cohomology theorems. Kneser–Tits is requested from ReductiveGroupsPartII:RG2.4 (the RG2.4:kneser-tits sub-stage of RT-AREA-automorphic-1.fixes.md).
- **AA.5** — planned. Remaining: Add the explicit Eichler mass value for the Hurwitz order once GlobalQuadraticForms or a quaternion-order layer supplies the class number of maximal orders.

