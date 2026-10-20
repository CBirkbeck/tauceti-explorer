# Roadmap: overconvergent Hilbert modular forms and p-adic automorphic coefficients

**Summary.** Build analytic automorphic coefficient sheaves from actual differential-frame and period-map torsors, identify their Hilbert presentations, and compare their integral structures with the independently constructed Andreatta–Iovita–Pilloni coefficients. The resulting spaces carry normalized Hecke operators, family Fourier expansions, compact cuspidal restriction maps, and a map to completed ordinary Igusa forms. Analytic induction for reductive Levi groups also gives coefficients on Siegel and Bruhat period domains, on general toroidal tower diamonds, and in the definite unitary Jacquet construction. Algebraic weights, the modular curve, and ordinary forms are tests of these constructions rather than restrictions on their scope.

## Scope and ownership

This roadmap owns analytic specializations of automorphic torsors and the comparisons between the resulting coefficient sheaves. It includes the Hilbert character map, analytic induced representations with their precise conventions, the four Hilbert coefficient presentations, the finite-character and integral comparison, analytic-family boundary and Fourier statements, normalized coefficient correspondences, and the ordinary completion comparison. In higher rank it owns the passage from a supplied analytic reduction to its coefficient sheaf and the convention dictionary between analytic induction and Hodge frames. The definite unitary application includes the specialization from completed functions with coefficients at the other places above (p), followed by the actual Jacquet coefficient sheaf and its arithmetic geometry.

The following are prerequisites and boundaries, not constructions of this roadmap.

- Mathlib supplies tensor products, determinant norms, continuous homomorphisms, representations, module duals, matrices, direct limits, and adic completion. Tau Ceti supplies the narrow class group and general algebraic representation theory. In particular, highest-weight modules and their weight cones are not constructed again here.
- `AlgebraicVectorBundles`, Layers L0A–L0C and L2B, supplies sheaves of modules, finite locally free sheaves, tensor and dual operations, and geometric vector bundles. `AutomorphicBundles`, B0–B4 and their general-data extensions, owns associated algebraic bundles, their canonical and subcanonical extensions, algebraic highest-weight conventions and classical coefficient realizations. Its B5 owns classical Fourier expansions and classical boundary statements. The targets below concern analytic families and the comparison with those objects.
- `HodgeTateAndCanonicalSubgroups`, T3–T6, owns canonical subgroups, the Hilbert period-coordinate estimates, the modified integral differential lattice and its frame torsor, and the logarithmic Hodge–Tate comparison. No alternative canonical subgroup or differential-frame torsor is introduced here. The strict odd-prime domain estimates and the unsplit ramified-generator input are distinguished below.
- `PerfectoidShimuraVarieties`, Layers 1, 3, 5 and 6, owns perfectoid towers, their finite-level quotients, the Hilbert mixed-cover span and Weil pairing, general toroidal tower diamonds, and Bruhat reductions. Its general period-map theorem is a statement about diamonds; it does not assert that every general Shimura tower is a perfectoid space.
- `PerfectoidTowers`, P9.6–P9.13, owns profinite torsor function descent, its all-open smooth-weight extension, fixed module subsheaves and finite locally free effectivity with its stated hypotheses. `AdicSpacesPartII`, R0, supplies completed Banach tensors; `AdicSpacesPartIV`, R5.5–R5.7, supplies smooth-weight products and completed coefficient sheaves. The targets below apply these constructions to the actual analytic representations and compare their site-specific Gauss lattices.
- `LocallyAnalyticDistributions`, L0 and L4, supplies analytic polydiscs, radius `restriction`, completed tensor products, Banach-family and compact-type duality tools. `PadicMeasuresIwasawaAlgebras`, L0a, supplies the compact-group character functor, its points and completed-algebra universal character; the rigid Hilbert weight-space realization and its analytic charts remain a consumer construction here.
- `CompletedCohomology` and `CompletedCohomologyPartII`, Layers 1–3, supply ordered torsion colimits, completion, actions and coefficient tensors. Part II §8.5 treats a definite rank-three specialization. It does not already provide the general-rank, one-varying-(p)-place coefficient space used here. `PadicFamilies` owns the generic Fredholm/eigenvariety machine, ordinary projectors and control theorems. The present roadmap supplies its geometric Banach modules and compact operator, not a second spectral machine.

## Conventions

The algebraic preliminaries permit any number field (F). Hilbert geometry assumes that (F) is totally real, of degree (d≥1), and that (p) is a rational prime, including (2) and primes ramified in (F). Write

```text
O_p = Z_p ⊗_Z O_F,       H_r = {u ∈ O_p^× : u−1 ∈ p^r O_p},
N_p(x) = det_Zp(multiplication by x).
```

Scalars are on the left in the tensor product. Its topology is the finite-module topology over (ℤₚ). Integral formulas do not replace (O_p⊗ O_C) by a product indexed by embeddings at a ramified prime. Generic-fibre splitting over a sufficiently large coefficient field is a separate operation.

Geometric weights are continuous characters of (O_p^×); arithmetic weights are pairs ((w,t)) on (O_p^××ℤₚ^×). The geometric weight associated to the pair is

```text
κ(x) = w(x)^2 t(N_p(x))^(−1).
```

For Hilbert geometry choose prime-to-(p) tame level (N≥4), sufficiently small for the stated moduli schemes, and a complete perfectoid extension (L/ℚₚ) containing the required embeddings and roots of unity. Arithmetic polarization and diagonal quotients are interpreted as quotient stacks, or on the action-free coarse loci supplied by the moduli and tower theorems. The numerical inequality N≥4 alone does not prove freeness of either action. A bounded family has smooth rigid base (U/L) and image contained in an affinoid weight chart. Affinoid norm assertions assume (U=Spa(A,A^+)), with (A) reduced, uniform and equipped with a compatible power-multiplicative nonarchimedean norm. Formal integral base change requires its own flatness and completion hypotheses. The sheaf (O^+) always means geometric power-bounded functions on the indicated site; a completed tensor of chosen integral lattices is not silently identified with it.

The Hilbert action on the period coordinate is the left fractional action with denominator (cz+d). Right-action descent uses the conversion in §1.1, including inversion of the factor. In the Siegel row chart the action is right multiplication on ([I,Z]), with factor (A+ZC). These two conventions are kept separate and explicitly related to their coefficient representations.

An anticanonical radius (ε=0) denotes the ordinary domain. Overconvergence means the filtered colimit over *positive* admitted radii tending to zero. Finite wild level, infinite wild level and tame level zero are distinct objects. Atkin–Lehner transport scales the Hasse radius. A compact operator means a completely continuous operator in the nonarchimedean Banach sense, with finite-rank approximations or the corresponding property-(Pr) formulation; it does not mean real topological compactness of a unit-ball image.

## Exact supplier contracts

From Mathlib use `Algebra.TensorProduct.leftAlgebra`, `Module.Finite.base_change`, `Module.Free.tensor`, `Module.finrank_baseChange`, `moduleTopology`, `IsModuleTopology.continuous_of_linearMap`, and `IsModuleTopology.isTopologicalRing`. `PadicInt.compactSpace` and finite bases give compactness of (O_p). `Algebra.norm`, `Algebra.norm_apply`, `Algebra.norm_eq_prod_embeddings`, `LinearMap.det` and `LinearMap.det_baseChange` supply the determinant norm and its algebraic base change. `NumberField.RingOfIntegers.rank` and `NumberField.isUnit_iff_norm` give the integral rank and the unit-norm restriction. `Units.map`, `ContinuousMonoidHom.comp`, `fst` and `snd`, `Ideal.span` and quotient maps are sufficient for the light weight definitions. The specialization of the norm to (O_p), its continuity, and the character-map sign are the additional assertions here.

For coefficients use `Representation`, its tensor and dual operations, `ContinuousLinearMap`, `Module.Projective` and `SheafOfModules`. These types by themselves provide neither analytic induced representations nor effective descent of Banach representations. For matrix identities use `Matrix.fromCols`, `fromBlocks`, their multiplication identities, `Matrix.isUnit_iff_isUnit_det`, `mul_nonsing_inv`, `nonsing_inv_mul`, `transpose_mul`, and `Matrix.GeneralLinearGroup.det`. General determinant multiplicativity is a library theorem; the target here is the identity for the *actual period-coordinate factors*. For scalar direct limits and completion use `DirectLimit.Ring.of`, `DirectLimit.Ring.lift` and `AdicCompletion`, with topology and sheaf comparison proved separately.

From current Tau Ceti, `NumberField.NarrowClassGroup` and its finite instance supply the polarization-class index. `TauCeti/Algebra/Lie/HighestWeight/Module.lean` supplies highest-weight module generation and weight-cone results; the algebraic representation entering analytic induction is consumed with these results, not reconstructed. `AlgebraicVectorBundles` §L0B–L0C supplies finite locally free tensor/dual identities. Its relative-Spec convention has no bearing on the analytic coefficient equalizer.

The exact geometric contracts are as follows.

| Supplier | Data and theorem consumed | Additional obligation here |
| --- | --- | --- |
| `HodgeTateAndCanonicalSubgroups` T4 §§4.6–4.8 | Anticanonical domains, (z), scaled Atkin–Lehner maps and established period bounds | Keep the odd-prime strict inequality; name equality-endpoint and unsplit ramified refinements when requested |
| Same, T5 §§5.1–5.8 | Modified differential lattice, Igusa frame, analytic (B_m)-torsor, Hodge–Tate lift | Apply the coefficient character, prove all-open invariant functions and compare integral eigenfunctions |
| Same, T6 | Levi Hodge–Tate/de Rham comparison with central cyclotomic twist | Carry that twist through analytic associated coefficients |
| `PerfectoidShimuraVarieties` §§3.4, 5.4–5.10 | Row graph, strict-Iwahori domain, Hilbert deck groups, mixed span, pairing and polarization maps | Coefficient equalizers and their four presentation comparisons |
| Same, §§6.3, 6.12–6.15 | General toroidal diamond and period torsor; Bruhat tubes and reduced de Rham torsors; common cone refinements | Analytic representation, descent category, coefficient functor and specialization |
| `PerfectoidTowers` P9.6–P9.13 | All-open smooth-weight function descent, invariant module subsheaves and finite-rank integral matrix-coboundary effectivity | Specialize to the actual coefficient torsors and compare the analytic/v/pro-Kummer-étale coefficient functions and Gauss lattices |
| `AutomorphicBundles` B0, B2, B3, B4, B5 | Algebraic associated bundles, highest-weight dictionary, canonical/subcanonical extensions, classical weights and expansions | Analytic-family comparison, boundary extension and coefficient-valued expansions |
| `LocallyAnalyticDistributions` L0, L4 | Analytic charts, completed functions, compact restriction and family Banach tools | Impose Borel equivariance and construct the actual geometric Banach sheaf |
| `PadicFamilies` | Spectral construction from a coherent Jacquet module or a property-(Pr) module with compact operator | Establish those inputs, normalizations and arithmetic density for the spaces below |

The all-open scalar weight comparison is supplied by `PerfectoidTowers` P9.11, `WeightExtension.structureSheafEqualizer` and `WeightExtension.integralStructureSheafEqualizer`. Its hypotheses are a mixed-characteristic perfectoid field K, an affinoid smooth rigid or affinoid perfectoid Y/K, an affinoid perfectoid pro-étale profinite Γ-torsor X→Y, and a smooth rigid weight space over a perfectoid extension of K. The invariant sections on the full preimage of every open of Y times the weight space are its O or O⁺ sections, naturally in restriction. The smoothoid analytic/v-site comparison there supplies the rational-open step, and surjectivity on valued points reflects integral bounds. P9.13 supplies `ProEtaleSite.invariant_subsheaf` and `integral_matrix_coboundary_effectivity`; the latter requires an actual integral matrix coboundary and its integral inverse. These assertions are consumed, not new targets here. The analytic AIP B_m-torsor in Layer 5 is not a profinite torsor and needs its separate invariant-function proof.

`AdicSpacesPartIV` R5.7, *affinoid-weight-coefficient-sheaf*, identifies rational completed affinoid coefficient functions with functions on the actual rigid product. Its *coefficient-sheaf-local-equalizer* and *coefficient-sheaf-kiehl* retain their distinct hypotheses; no integral Kiehl theorem or arbitrary global generation is inferred. `AdicSpacesPartIII` R3 supplies the associated module sheaf and rational affinoid Kiehl comparison. These current supplier names distinguish the R0, R3 and R5 owners.

Each use of effectivity below specifies a category and an actual torsor. Finite locally free descent does not imply infinite-rank Banach descent. Scalar extension does not commute with an integral finite-group equalizer merely because it commutes after inverting (p).

## How to read the build

Layer 0 fixes weights and analytic representations, including the unitary application. Layer 1 gives the automorphy and descent convention. Layers 2–3 construct geometric Hilbert coefficients and their integral and overconvergent forms. Layer 4 compares the four geometric/arithmetic presentations. Layer 5 gives the independent AIP construction and comparisons. Layer 6 adds cuspidality, expansions and normalized compact Hecke correspondences. Layer 7 identifies the ordinary completion. Layer 8 applies the same coefficient method to Siegel and general toroidal/Bruhat reductions. Named assertions in the layers are targets to be formalized; a result whose proof needs a stronger geometric input is explicitly stated with that input rather than inferred from a weaker source.

## Layer 0: weights and analytic coefficient representations

### 0.1 The integral algebra at (p) and its norm

Define `Op F p` as the displayed tensor algebra, with its finite-module topology. Prove `compactSpace_Op`, `finrank_Op`, and the compatibility of this topology with multiplication and every (ℤₚ)-linear endomorphism. Its rank is ([F:ℚ]), without an unramified or split hypothesis. Define `normAlgebra F p` by specializing `Algebra.norm` and `normUnits F p` by `Units.map`. Define `unitsToOp` by the right tensor inclusion. Prove `norm_tmul_one`, `continuous_normUnits`, `normUnits_unitsToOp`, and `normUnits_embeddings` after scalar extension to a splitting field. The last is a generic-fibre product over embeddings, not an integral decomposition theorem. These are determinant base-change applications to the algebra used in BHW §6.1, pp.1756–1757; the source of the general determinant identities is Mathlib's norm and determinant API.

**Checks.**

- For `Op`, (F=ℚ) gives (ℤₚ) with its usual topology and rank one. The rank for a quadratic field is two even when (p) ramifies; an integral product of two copies of (ℤₚ) would fail this ramified algebra comparison.
- For `Op`, the sequence (p^n⊗1) tends to zero and is nonzero at each finite (n). The discrete topology fails this check. The unit (1) remains a unit after tensor inclusion.
- For `Op`, at a split prime of (ℚ(i)), e.g. (p=5), the algebra is the product of its two local factors; this is a proved special case, not the definition at all primes.
- For `normAlgebra`, the value on a scalar (a·1) is (a^d), so in degree two a scalar 2 has norm 4, including at p=2 before restricting to units.
- `normAlgebra` sends zero to zero since (d≥1), and sends 1 to 1. Defining it to be the constant unit character would fail the zero test.
- `normAlgebra` sends (−1) to ((−1)^d). In odd degree this is −1, detecting a sign or degree error even though the value on 1 does not.
- For `normUnits`, (F=ℚ) gives the identity on (ℤₚ^×); at p=5 the scalar unit 2 has norm 2.
- In degree two `normUnits` sends the scalar unit 2 at p=5 to 4. A product of only one embedding has the wrong value.
- `normUnits` has unit-valued codomain: the nonunit (p·1) is excluded, although its algebra norm is (p^d). Identity units are included for every field and prime.
- `unitsToOp` preserves the identity and products. In particular the image of η and the image of η⁻¹ multiply to 1, rather than merely to a scalar norm.
- A global unit of norm −1 still has norm −1 after `unitsToOp`; for example −1 over ℚ remains −1 when p=5.
- In a real quadratic field a totally positive nonrational unit has norm +1 but does not become the scalar 1 under `unitsToOp`. Replacing inclusion by the norm loses this test.

Define `principalUnits F p r` as the kernel of reduction on units modulo the ideal generated by (p^r). Prove `mem_principalUnits_iff`, `principalUnits_antitone`, and `open_finiteIndex_principalUnits`. The definition permits (r=0), when the quotient ring is zero and the subgroup is the entire unit group. Its use for analytic characters is BHW §6.1 and AIP-adic §2.1–§2.2, pp.7–9.

**Checks.**

- (H_0=O_p^×), (H_2⊆ H_1), and (1+p^2a∈ H_2) whenever it is a unit; a reversed filtration fails.
- For (F=ℚ) and odd (p), a nontrivial Teichmüller unit lies outside (H_1). At (p=2), (H_1=ℤ₂^×) but (-1∉ H_2).
- The identity is in every (H_r), and the intersection over (r) is the identity by separatedness. The algebra element (p) is never an element of the unit-group carrier.

### 0.2 Weight spaces and the inverse norm convention

Define `GeomWeight F p R` and `ArithWeight F p R` on any topological commutative ring (R) as continuous homomorphisms to (R^×) from (O_p^×) and (O_p^××ℤₚ^×), respectively. `ArithWeight.mk w t` multiplies the two coordinate characters. Its API consists of `arithWeight_restrict_left`, `arithWeight_restrict_right`, `arithWeight_mk_unique`, and compatibility with continuous coefficient-ring maps. Define `hilbertWeightSpace` and `arithmeticWeightSpace` as rigid realizations of these compact-group character functors over (ℚₚ); prove their affinoid finite-character charts, universal characters, point identifications and compatibility with the completed-algebra universal character. This last construction uses the character functor and completed algebras in the supplier contract and finite (H_r)-quotients; rigid representability is a named target here, not an unstated consequence of a set of character points. Sources: BHW Definition 6.1, pp.1756–1757; AIP-adic §2, pp.6–9.

**Checks.**

- `GeomWeight` contains the trivial character and every algebraic character (∏_ττ(x)^{k_τ}) over a field containing the embeddings; a finite-order character can have conductor beyond (H_1).
- `ArithWeight.mk` restricts to (w) on ((x,1)) and to (t) on ((1,y)). Taking (w=1,t≠1) distinguishes arithmetic and geometric character carriers.
- A pair is recovered uniquely from these restrictions, including the trivial pair. A character on a sum of coordinates rather than their product would fail multiplicativity and the restrictions.
- `hilbertWeightSpace` for (F=ℚ) has the usual finite-character components and one open-disc direction. Its arithmetic counterpart has two disc directions; forgetting the second coordinate changes the dimension.
- In the dyadic case the sign character on (-1) distinguishes components. The universal character evaluated at a unit specializes to that unit's character value, not its inverse.
- An affinoid in one finite-character chart does not represent all characters of arbitrary conductor with a fixed analytic radius. The charts must cover rather than identify these loci.
- `GeomWeight` evaluation at a product xy is the product of the values at x and y, and evaluation at 1 is 1; a general continuous function to units fails this law.
- Under a continuous coefficient-ring map, `GeomWeight` carries both algebraic and finite-order characters to their scalar extensions. A coefficient map killing a nonzero scalar cannot be treated as an injection of character values.
- For `ArithWeight`, holding w fixed and changing t changes evaluation at (1,y); holding t fixed and changing w changes evaluation at (x,1). Either coordinate may be nontrivial with the other trivial.
- `ArithWeight.mk` of two trivial characters is trivial. Reconstructing a character from its two restrictions gives its original value on (x,y), since (x,y)=(x,1)(1,y).
- `arithmeticWeightSpace` has a universal character on both compact coordinates; specializing it at (w,t) evaluates to w(x)t(y). Its projection to geometric weights has exponents 2a_τ−v and is not a coordinate projection.

**Coordinate-constructor checks.**

- `ArithWeight.mk w 1` at (x,y) is w(x), independent of y. A constructor interchanging the coordinates fails this check.
- `ArithWeight.mk 1 t` at (x,y) is t(y), independent of x. At F=ℚ,p=5 and t=x, evaluation at (2,3) is 3, not 2.
- `ArithWeight.mk w t` commutes with continuous coefficient change and is reconstructed from its coordinate restrictions; the trivial pair gives the trivial character. A product character w(x)t(y) with a missing factor fails whenever both factors are nontrivial.

Define the continuous homomorphism `weightDualMap` by (x↦(x^2,N_p(x)^{-1})) and `weightMap` by precomposition. Prove `weightMap_mk_apply`, `weightMap_norm_factor`, and `weightMap_totallyPositiveUnit`. The first formula is (κ=w^2(t∘ N_p)^{-1}); hence at an algebraic pair with exponents (a_τ,v) the geometric exponents are (2a_τ-v). This fixes the group-map convention by the formula used in BHW Remark 6.2, p.1757. A non-inverted norm coordinate would give the wrong exponents.

**Checks.**

- For `weightDualMap`, the identity maps to ((1,1)), and (-1) maps to ((1,(-1)^d)). For (F=ℚ), a unit (x) maps to ((x^2,x^{-1})).
- For `weightMap`, (t=1) gives (w^2); (w=1) gives ((t∘ N_p)^{-1}). Both are proved tests in `Suggested.lean`.
- At (p=5,F=ℚ,w(x)=x,t(x)=x), evaluating at (x=2) gives (2), whereas using (N_p) instead of its inverse would give (8). This is the numerical specialization of the two-coordinate tests.
- A global unit (η) of norm (1) has (κ(η)=w(η)^2). If (N(η)=-1), the additional factor is (t(-1)^{-1}); total positivity cannot be dropped from the former assertion without a norm-one hypothesis.

Prove `congruence_unit_norm_one`: for a number field, (N≥4), and a global unit (η≡1 mod NO_F), its integral norm is (1). Indeed the norm is (±1) and is congruent to (1) modulo (N). Prove `weightMap_mk_congruenceUnit` by cancellation. This concerns *all* congruence units, including mixed real signs, and is the input for the central closure in Layer 4. Neither a prime-to-(p) condition nor total positivity is needed for this algebraic norm assertion. The geometric level will separately assume both smallness and (p∤ N). Source: BHW §9.1, pp.1780–1782, with the determinant congruence argument made explicit.

**Checks.**

- For `weightDualMap`, xy maps to the product of the two images, including the inverse norm coordinate. At F=ℚ,p=5, the values at 2 and 3 multiply to (36,1/6), the value at 6.
- For weightMap, multiplying arithmetic characters adds their exponents. The pairs (a,v)=(1,0) and (0,1) give geometric exponents 2 and −1; their product has exponent 1, rather than 3.
- For the two rigid weight spaces, pullback of the universal character to an affinoid chart and then to a point gives that point's character. At p=2 the trivial and sign characters are distinct points even though their restrictions to H₃ agree. This checks both charts' finite components, not only their disc dimensions.

### 0.3 Analytic radii and bounded families

For a continuous character into a uniform Banach (ℚₚ)-algebra with the norm fixed above, define `proWeightRadius` as

```text
T_pro(κ) = sup { ‖κ(u)−1‖ : u ∈ H_r0 },
r0 = 1 for odd p, and r0 = 3 for p = 2.
```

Prove `proWeightRadius_lt_one` using compactness, continuity, a finite set of pro-(p) generators and the spectral norm. Prove invariance under finite characters trivial on (H_{r_0}), and functorial bounds under bounded coefficient maps. State `continuousCharacter_eventuallyAnalytic` as the existence of a sufficiently small analytic unit neighborhood carrying an extension, compatible with restriction. The quantitative input is AIP-adic Proposition 2.8, pp.8–9, with (ε_char=1) at odd (p) and (3) at (p=2) in its character-neighborhood notation. Those (ε_char)'s are not Hasse radii. Do not assert a universal exact radius (p^{-r_0}T_{pro}); in particular the trivial character has (T_{pro}=0) and still extends to a nonzero neighborhood.

**Checks.**

- The trivial character has (T_{pro}=0). A Teichmüller character at odd (p) also has value zero here, even though the supremum over *all* units need not be less than one.
- For (F=ℚ), odd (p), and (κ(x)=x^k), (k≠0), the value is (|pk|_p); at (k=0) it is zero. This detects using the wrong principal subgroup.
- At (p=2), the sign character is trivial on (H_3), while it is nontrivial on (-1). A full-unit supremum and a principal-unit supremum therefore record different information.

Define `boundedWeightFamily` to consist of the smooth rigid base, its morphism to the relevant weight space, containment of its image in an affinoid chart, and a chosen common analytic extension on a specified neighborhood whenever a construction uses one. Prove `boundedWeightFamily.restrict`, `pullback` and `changeRadius`, with the obvious intersection of admitted domains. Smoothness is a property of the base, not a claim that its weight map is smooth. A bounded family gives a common sufficiently small extension after choosing a chart; the extension is not determined by the numerical supremum alone. Sources: BHW §6.1, p.1757; AIP-adic Proposition 2.8 and AIP-cusp §4.1, pp.22–24.

**Checks.**

- A point with any continuous weight is a bounded family and becomes analytic on some sufficiently small neighborhood. It need not be analytic on a neighborhood specified in advance.
- Restricting a family to a rational subdomain preserves its chosen extension, and pulling back to a smooth rigid base preserves the affinoid-image bound. A constant weight map can be bounded without being a smooth morphism.
- A family whose image traverses arbitrarily many conductor charts cannot be assigned one chart merely because each of its points individually has an analytic radius. Coefficient base change with a non-uniform norm is outside the norm assertion.

### 0.4 Finite analytic coefficients and analytic induction

Define `finiteAnalyticCoefficient A H` as a finite projective A-module V, its canonical Banach-module topology, a continuous representation of the specified analytic group H, and analyticity of its orbit maps on the chosen group chart. An integral version additionally records a stable A⁺-lattice. Define `coefficientTensor`, `coefficientDual` and `coefficientBaseChange` using the completed finite-projective tensor product, the contragredient action (hφ)(v)=φ(h⁻¹v), and completed coefficient extension. Prove `coefficientTensor_action`, `coefficientDual_eval`, `coefficientBaseChange_action`, `coefficientTensor_rank` and the finite-projective evaluation isomorphisms. General module tensor and dual identities are supplied; the new assertions check analyticity, topology and specified lattices. Sources: BP §§6.1–6.2, pp.145–150, and the associated-coefficient convention of AutomorphicBundles B0.

**Checks.**

- `finiteAnalyticCoefficient` on the zero module has rank zero; on a trivial line it has rank one and trivial action. A rank-two diagonal action with characters χ₁,χ₂ retains both characters and is not replaced by their determinant.
- `coefficientTensor` of two character lines has character χ₁χ₂; tensoring by the trivial line preserves the representation; tensoring by zero gives zero. These distinguish tensor from direct sum.
- `coefficientDual` of χ has character χ⁻¹, so evaluation is invariant. A unit acting as 2 at p=5 acts as 1/2 on the dual, not 2.
- `coefficientBaseChange` preserves a rank-two direct summand and intertwines its action. A nonflat map preserves finite projectivity after algebraic base change, but integral sheaf equalizers need not commute with it.
- A continuous character of high conductor is not a coefficient analytic on a previously fixed larger chart. A lattice is additional structure; a rational isomorphism need not preserve specified lattices.

For the induction model choose a finite extension E₀/ℚₚ, a split reductive O_E₀-model M, upper Borel B, torus T, and longest Weyl element w₀,M. As in BP §6.2, p.147, the generic-fibre torus has a specified ℚₚ-form, whose maximal compact subgroup is denoted T(ℤₚ). Use the closed subgroup M₁=N̄₁T₁N₁⊂M(O_E₀), with T₁=T(ℤₚ) and the stated normalization of N̄₁ by Tᴹ,⁻. General Shimura Levi applications choose their splitting field and this model; this does not require the original Shimura group to be split over ℚₚ. Over a uniform finite-type Tate E₀-algebra A, define `analyticInduction M1 n κ` as analytic functions on the genuine adic neighborhood M₁Mₙ, satisfying

```text
f(mb) = (w₀,M κ)(b⁻¹) f(m),           (h·f)(m) = f(h⁻¹m).
```

Here κ after Weyl conjugation must be n-analytic on the torus neighborhood. M₁ is not assumed open or Zariski dense. Define `locallyAnalyticInduction` as the locally convex colimit over n. The APIs `analyticInduction.iwahoriChart`, `leftAction`, `restrict`, `positiveAction` and `locallyAnalyticInduction.compactType` identify the coefficient with functions on the opposite-unipotent neighborhood and specify its norm and topology. For t∈Tᴹ,⁺ extend the action using the Iwahori factors: if m=n̄ₘtₘnₘ, evaluate f at t⁻¹n̄ₘt·tₘnₘ. Strictly positive t improves the opposite-unipotent analytic radius and acts compactly at a compatible fixed stage. Over a coefficient field the finite-slope part is independent of a sufficiently small radius. Sources: BP §§6.2.4–6.2.10, pp.148–150. A family finite-slope construction requires the spectral supplier's slope-adapted affinoid hypotheses; no arbitrary family projector is asserted.

Define `analyticDistribution` as BP's compact-open continuous dual of bounded analytic functions on the open-polydisc version M₁Mₙ°. Define `locallyAnalyticDistribution` as its inverse limit. Prove `analyticDistribution.projectiveBanach`, transition maps, `locallyAnalyticDistribution.pairing`, and opposite-semigroup equivariance of the pairing. The ordinary strong Banach dual of the closed-polydisc induction is a separate object and is not asserted projective over an arbitrary affinoid algebra. Source: BP §6.2.20, pp.152–153.

**Checks.**

- For `analyticInduction`, a torus has no unipotent variables and yields a line with the specified inverse Borel character. The identity fixes every function; forward translation changes the character on this line.
- For SL₂, the analytic unipotent coordinate admits all convergent power series on the specified disc. The algebraic highest-weight-k subspace has degree at most k, so z^(k+1) is an analytic nonexample to algebraicity.
- If M₁ is not Zariski dense, functions on its rational points do not determine arbitrary analytic functions on its thickening. That thickening is part of the definition.
- For `locallyAnalyticInduction`, a function analytic only at a deeper stage still represents a colimit element; two representatives agree after a common further `restriction`. The topology is the locally convex colimit topology, not an arbitrary topology on set functions.
- For `analyticDistribution`, zero unipotent dimension gives A. In one variable evaluation at zero kills z but not 1, detecting its moments. Its projectivity concerns the bounded open-polydisc construction.
- For `locallyAnalyticDistribution`, moments must be compatible at every stage. Unrelated Banach functionals do not give a limit element. The action on the dual pairs with the inverse action on functions, not the same forward action.

Prove `algebraicInduction_injective`: for dominant algebraic κ, restriction embeds the supplied algebraic representation Vκ into the analytic induction. Its positive-torus action satisfies ι(t·v)=(w₀,Mκ)(t)·(t·ι(v)). For locally algebraic characters retain the smooth factor with this normalization. For `finiteCharacterInduction_comparison`, require an actual finite-order character w₀,Mχ:M₁→E₀^× trivial on M₁∩Mₙ, whose torus restriction defines χ. Give its one-dimensional factor the trivial Tᴹ,⁺-action. For κ analytic at stage n, multiplication by (w₀,Mχ)⁻¹ identifies `analyticInduction M1 n κ`⊗E₀(w₀,Mχ) with `analyticInduction M1 n (κχ)` as (M₁,Tᴹ,⁺)-modules. These are the analytic inductions, rather than the algebraic representation Vκ. A torus character without this extension to M₁ is not enough. Source: BP §§6.2.9–6.2.11, p.150. Define `inductionProduct` by pointwise multiplication into the product-weight induction, and prove its equivariance, associativity and compatibility with algebraic restriction. This map is not generally a tensor-product isomorphism. Sources: BP §§6.2.11–6.2.19, pp.150–152, and multiplication in the displayed induced model.

**Checks.**

- `inductionProduct` sends 1⊗z−z⊗1 to zero in a one-variable chart. Evaluating the tensor factors at two distinct points detects that this tensor was nonzero.
- Two trivial-weight constants give their scalar product; two character lines give the product character, not either input weight.
- In rank one the product is the product of lines; with a unipotent variable the preceding kernel occurs. A finite character of conductor beyond the chosen stage requires a deeper stage before the comparison applies.
- For the finite-character comparison, choose a primitive cube root ζ in E₀ and m∈M₁ with (w₀,Mχ)(m)=ζ. A function with value 1 at m is sent to value ζ⁻¹=ζ², not ζ. The finite factor has Tᴹ,⁺-eigenvalue 1; assigning a nontrivial eigenvalue there breaks the stated positive-action intertwining.

**Checks.**

- A rank-two finite analytic coefficient restricts to the same action on a smaller chart; a representation with discontinuous orbit maps fails the defining condition. Over a DVR the lattices V⁺ and pV⁺ have the same rational representation but distinct inclusions.
- `coefficientTensor` of ranks two and three has rank six. Its diagonal group action acts on both factors; tensoring two nontrivial character vectors detects an action on only one factor.
- `coefficientTensor` commutes with finite-projective coefficient extension and carries an idempotent summand to that summand's extension. Replacing a direct summand by its ambient free module fails this test.
- `coefficientDual` sends the zero coefficient to zero and the trivial line to itself. A two-character diagonal action gives χ₁⁻¹ and χ₂⁻¹ separately, not the inverse determinant repeated twice.
- The double `coefficientDual` evaluation isomorphism is equivariant: on a character χ it returns χ rather than χ⁻¹. Its pairing on a line with action 2 and dual action 1/2 is multiplication, invariant under the group.
- `coefficientBaseChange` along the identity recovers the action, and two complete extensions agree with their composite. On a nontrivial character vector the eigenvalue is its image in the new algebra.
- `coefficientBaseChange` sends zero to zero and a trivial line to the new algebra's trivial line; it preserves the scalar-extended idempotent projector. Rank functions on disconnected bases need not become constant.
- `locallyAnalyticInduction` on a torus is its prescribed character line. In a unipotent variable, it contains a germ analytic on a deeper disc without requiring extension to every larger disc.
- A `locallyAnalyticInduction` germ with nonzero value at a retained base point remains nonzero after `restriction`; the colimit relation does not collapse all representatives. The zero germ is zero at every stage.
- For `analyticDistribution`, evaluation at 1 and evaluation at 0 differ on z but agree on 1. This detects a dual retaining only the zeroth moment.
- For `analyticDistribution` in zero unipotent dimension the pairing is (a,b)↦ab over A, and coefficient change carries it to the product over the new algebra. Its projective Banach assertion uses the bounded open-disc module, not the unrestricted strong dual.
- In `locallyAnalyticDistribution`, evaluation at a compatible base point defines a compatible family at every stage. Moving the point incompatibly from stage to stage does not.
- `locallyAnalyticDistribution` on a torus is the dual character line, so the character is inverted. A nontrivial character and its dual do not have the same action in general.
- `inductionProduct` sends z⊗z² to z³ in a compatible one-variable chart, with the product Borel character. Multiplication by the trivial-weight constant 1 is the identity; a fixed nontrivial weight space need not contain that constant.

### 0.5 Normalized Siegel coefficients and the induction dictionary

For g≥1 let I⊂GL_g(ℤₚ) be the upper Iwahori and I⁺ its inverse image of the diagonal torus modulo p. Put M_s=1+{E:‖E‖≤p^(−s)}. For rational r>0, choose a diagonal-torus character κ with a multiplicative analytic extension to T(ℤₚ)(M_(r+1)∩T), and require κ and its inverse to have Gauss norm at most one there for the integral and isometric assertions. Such a stage is obtained by increasing r for a bounded family; continuity alone at a previously fixed r is insufficient. Define `siegelAnalyticCoefficient κ r` on G_(r+1)=IM_(r+1), by upper-Borel equivariance f(ℓb)=κ(b)f(ℓ), with κ trivial on upper unipotents. Its finite opposite-unipotent charts use coordinates u_ij/p of radius p^(−r). The norm is the chartwise Gauss norm; `siegelAnalyticCoefficient.integral` is its unit ball. Define `siegelTransposeAction h` for h∈I⁺M_(r+1) by (ρ_D(h)f)(ℓ)=f(hᵀℓ). Prove `siegelTransposeAction.mul`, `isometry`, `integralStable` and `radiusCompatible`. Define `siegelCoefficientProduct` into the product-weight coefficient by pointwise multiplication; prove `siegelCoefficientProduct.equivariant`, `normBound`, `associative` and `integralStable`. A chart trivialization can transport an algebra structure to the underlying function module, but translations of a nontrivial coefficient weight are not algebra automorphisms. Sources: DRW Remark 3.1.9, Definition 3.1.10, Remark 3.1.12 and Definition 3.1.13, pp.22–24; its algebraic comparison is §3.4, pp.37–38.

**Checks.**

- `siegelAnalyticCoefficient` for g=1 is a line; for g=2 it has one unipotent variable and nonconstant analytic functions. The integral lattice uses Gauss coefficients.
- (T^p−T)/p is integral-valued on ℤₚ but has Gauss norm p on the unit disc. Checking only integral rational points gives the wrong lattice.
- The group is IM_(r+1). In normalized coordinate t=u/p, choose a pole a with vₚ(a)=r−1/2, r≥3. The function 1/(t−a) is analytic on the radius-p^(−r) disc but not on the larger radius-p^(−(r−1)) disc needed by IM_r.
- `siegelTransposeAction` of a diagonal h on a line multiplies by κ(h). Using h⁻¹ would invert this value. The transpose reverses products, so successive left pullbacks have the stated representation order.
- `siegelCoefficientProduct` of weights κ,λ has weight κλ; squaring gives κ². A constant function 1 belongs to a fixed nontrivial coefficient space only if it satisfies that space's Borel relation, which it generally does not.
- A finite character nontrivial on the rational principal-unit subgroup of a proposed connected torus disc cannot extend analytically over that disc: its finite-valued analytic extension would be constant. It needs a deeper stage. A multiplicative analytic extension without the two-sided Gauss bound does not give the asserted isometric integral action.

Prove `bpSiegelInduction_comparison` at integer stages n=r+1≥2 on the same entrywise neighborhood, with κ_BP=w₀,M(κ_D⁻¹) and τ(h)=h^(−T). It is the identity on functions and an isometry, and ρ_D(h)=ρ_BP(τ(h)). Integer-stage cofinality compares locally analytic limits. Both the inverse character and the inverse transpose are necessary. Sources: BP §6.2.4 and DRW Definitions 3.1.10 and 3.1.13, by substitution in their equivariance laws. Use this dictionary before the algebraic specialization of Layer 8.

**Checks.**

- `siegelTransposeAction` fixes every coefficient for h=I. In a genus-two chart an admissible nonzero translation changes the coordinate function, so the action is not only a scalar weight action.
- Two successive `siegelTransposeAction` pullbacks equal the action of h₁h₂ because (h₁h₂)ᵀ=h₂ᵀh₁ᵀ. Noncommuting admissible factors distinguish this from the reversed product.
- `siegelCoefficientProduct` sends z⊗z² to z³ and sends a zero factor to zero. Its Gauss norm is bounded by the product of the input norms.
- Multiplication by the trivial-weight constant 1 is the identity for `siegelCoefficientProduct`. Two integral coefficients have integral product, whereas this assertion supplies no algebra unit in each nontrivial weight space.

### 0.6 General analytic vectors, coadmissibility and Jacquet coefficients

These constructions have their general representation-theoretic scope: L/ℚₚ is finite, E is a finite extension of L, and G is a locally L-analytic group. For Jacquet modules G is the L-points of a connected reductive L-group and P=MN is any parabolic. Taking L=ℚₚ and restriction of scalars includes the locally ℚₚ-analytic GL_n(K)-representations in §0.7. No compactness of G or splitness of its reductive group is assumed in the general definitions.

Define `groupAnalyticDistributions H` for a compact open H⊂G as the strong continuous dual D_la(H,E) of locally L-analytic functions, with convolution, δ_hδ_k=δ_hk and the strong topology. Define `frechetSteinStructure A` by a topological isomorphism A≃lim_j A_j, left-Noetherian Banach E-algebras A_j, continuous right-flat transition maps A_(j+1)→A_j and dense projections A→A_j. Define `coadmissibleModule A` by compatible finite A_j-modules M_j with their quotient Banach topologies, isomorphisms A_j⊗̂_(A_(j+1))M_(j+1)≃M_j, and M≃lim_j M_j. The algebra may be noncommutative, and modules here are left modules. Prove `groupDistributions_frechetStein`, constructing a cofinal Banach presentation, `coadmissibleModule.stageRecovery`, `closedKernel`, `hausdorffCokernel`, `finiteSum` and `presentationIndependent`; this gives the abelian category needed for the duality below. A general nonclosed subspace does not define its cokernel without Hausdorff completion. Sources: Emerton-analytic Definitions 1.2.6, 1.2.8 and 1.2.10, pp.22–26, Theorem 1.2.11, pp.26–27, and Corollary 5.3.19, pp.107–108. Compact analytic charts and their duals are supplied; the noncommutative convolution, flat Banach presentation and coadmissible category are targets here.

**Checks.**

- For `groupAnalyticDistributions`, H={1} gives E with ordinary multiplication. For any H, δ_1 is the unit and δ_hδ_(h⁻¹)=δ_1; convolution is not pointwise multiplication of moments.
- For `groupAnalyticDistributions` on additive ℤₚ, δ_aδ_b=δ_(a+b), so its evaluation on x is a+b. Pointwise multiplication of the two evaluations would give ab.
- For noncommuting h,k in a compact open of GL₂(L), `groupAnalyticDistributions` has δ_hδ_k≠δ_kδ_h: a locally analytic function separates hk and kh. Commutativity of a compact weight algebra cannot be transferred to this group distribution algebra.
- For `frechetSteinStructure`, a single left-Noetherian Banach algebra repeated with identity maps is a structure; it need not be commutative. The identity transitions are right flat.
- The analytic functions on an open disc give a `frechetSteinStructure` by a cofinal sequence of closed subdiscs. Their `restriction` maps are dense, and a function on only one small closed disc need not extend to the open disc.
- An inverse system of Banach algebras with a nonflat transition is not a `frechetSteinStructure`, even if its set-theoretic limit is nonempty. Dropping the finite/Noetherian hypothesis would not justify the module-category assertions.
- For the constant algebra E, `coadmissibleModule` means a finite-dimensional E-space with its usual topology. Zero and E² qualify, while an infinite direct sum with no finite-dimensional stage system does not.
- A `coadmissibleModule` with stage modules A_j has limit A; recovery at j gives A_j. Choosing incompatible transition modules is not additional freedom in the definition.
- A closed kernel between `coadmissibleModule` objects remains coadmissible and is recovered stagewise. An arbitrary dense proper submodule is not a substitute for a closed kernel or a Hausdorff quotient.

For a continuous locally convex G-representation V, define `analyticVectors V` as the locally convex colimit of its analytic-vector spaces V_(H-an) over shrinking analytic open subgroups. Each vector has an orbit map that extends analytically on its specified subgroup; the colimit maps inject into V. Prove `analyticVectors.inclusion`, `localOrbitCriterion`, `functoriality`, `restriction` and `conjugation`, and the locally analytic G-action on the colimit. Define `admissibleBanachRepresentation` by a continuous Banach representation whose continuous dual is finite over the bounded-measure algebra D_cont(H,E) for one, equivalently every, compact open H. Prove `admissibleBanach_closedRegularEmbedding`, equivalently a closed H-equivariant embedding V↪C(H,E)^a. Then prove `analyticVectors_stronglyAdmissible`: its analytic vectors embed as a closed subrepresentation of C_la(H,E)^a. Sources: Emerton-analytic Definition 3.5.3, p.64, Proposition–Definition 6.2.3 and Proposition 6.2.4, p.118. D_cont and D_la are different algebras; finite generation over one is not the definition over the other.

Define `admissibleAnalyticRepresentation` by an LB locally analytic representation for which the dual of V_(H-an) is finite over D_an(H,E) on a cofinal analytic-open sequence. Prove `admissibleAnalytic_duality`: this is equivalently the compact-type representation with coadmissible strong dual over D_la(H,E), for a compact open H, independently of H. Prove `admissibleAnalytic_closedKernel`, `hausdorffCokernel` and exactness of the corresponding duality. Sources: Emerton-analytic Definition 6.1.1, pp.110–111, Theorem 6.1.20 and its consequences, pp.116–117. This target is for general locally analytic groups and is not restricted to the arithmetic Π below.

**Checks.**

- For `analyticVectors`, the trivial finite-dimensional representation is unchanged, with its usual topology. Every locally analytic finite-dimensional character is retained, including smooth finite-order characters after shrinking the subgroup.
- For `analyticVectors` of C(ℤₚ,E) under translations, precisely the locally analytic functions occur. A continuous function whose orbit is not locally analytic is not inserted by the colimit; uniform approximation by locally constant functions alone does not make it locally analytic.
- The identity map on V induces the identity on `analyticVectors`, and analytic-vector maps commute with `restriction` to an open subgroup. An orbit analytic only on a smaller subgroup still defines a colimit vector; one fixed large analytic stage would miss it.
- For `admissibleBanachRepresentation`, C(H,E) under the regular action has dual the free rank-one bounded-measure module. A finite direct sum has the corresponding finite rank.
- A finite-dimensional continuous representation of H is an `admissibleBanachRepresentation`; for the trivial group the condition excludes an infinite-dimensional Banach space. Mere continuity is insufficient for admissibility.
- A closed H-stable subspace of C(H,E)^a passes the regular-embedding criterion for `admissibleBanachRepresentation`. An arbitrary algebraic embedding with no closed-image or topology condition is not that criterion.
- For `admissibleAnalyticRepresentation`, C_la(H,E) corresponds to D_la(H,E), and the zero representation corresponds to the zero coadmissible module.
- For the trivial group, `admissibleAnalyticRepresentation` again means finite dimensional. An infinite-dimensional locally convex space with trivial action does not become admissible by declaring every orbit analytic.
- Closed kernels and Hausdorff quotients of `admissibleAnalyticRepresentation` correspond, with arrows reversed, to cokernels and kernels of coadmissible modules. Applying the same covariant arrow order on both sides fails even for E²→E.

For a topologically finitely generated abelian locally L-analytic group Z, define `fullCharacterSpace Z` by the affinoid-valued locally analytic character functor, and construct its strict quasi-Stein rigid representative. With Z≃Z₀×Λ, Z₀ compact and Λ≃ℤ^a, prove `fullCharacterSpace.product`: its representative is the compact locally L-analytic character space times (G_m)^a. The decomposition is an auxiliary choice; prove independence and naturality. Construct the continuous injective Mellin map D_la(Z,E)→O(Ẑ) with dense image, and prove `fullCharacterSpace.compactMellinEquiv` when Z is compact. At noncompact Z it need not be surjective. Sources: Emerton-analytic Proposition 6.4.1, Definition 6.4.2 and Propositions 6.4.5–6.4.6, pp.124–127. The compact functor is supplied; the noncompact rigid product, L-analytic equations when L≠ℚₚ, and topology are the targets here.

When G has topologically finitely generated centre Z, define `essentiallyAdmissibleRepresentation` by a compact-type locally analytic representation V, an extension of the central action to a separately continuous O(Ẑ)-action, and a coadmissible strong dual over O(Ẑ)⊗̂_E D_la(H,E). Record the agreement of the two actions of D_la(Z∩H,E), and the contragredient convention on the dual. Prove `essentiallyAdmissible_independentH`, `admissible_implies_essentiallyAdmissible`, and `essentiallyAdmissible_abelian`. For an abelian G=Z, prove `abelianDual_coherentSheaf`, the contravariant equivalence with coherent sheaves on Ẑ. The tensor algebra's Fréchet–Stein structure uses the good integral models for the character-space exhaustion, not a claim about arbitrary completed tensor products. Sources: Emerton-analytic Proposition 5.3.22, pp.109–110, Proposition 6.4.7 and Definition 6.4.9, pp.127–129, and Proposition 6.4.10 and the abelian example following it, pp.129–130.

**Checks.**

- For `fullCharacterSpace` of the trivial group the representative is a point. For Z=ℤ it is G_m, with every nonzero E-valued image of 1 allowed, not just unit-valued images.
- For `fullCharacterSpace` of K^×, values on a uniformizer and on O_K^× are independent data. Two characters equal on O_K^× but with different uniformizer values give distinct points.
- For a split torus T(K)≃(K^×)^n, `fullCharacterSpace` retains n unramified coordinates. If characters are locally ℚₚ-analytic, its dimension is n([K:ℚₚ]+1), whereas a locally K-analytic character space has a different compact-disc dimension. The choice of analytic field must be stated.
- For `essentiallyAdmissibleRepresentation`, an admissible locally analytic representation qualifies, but the converse need not hold for noncompact centre. With G=ℤ, coherent O(G_m) corresponds to an essential representation and is not a finite-length punctual sheaf.
- With G=ℤ, an `essentiallyAdmissibleRepresentation` supported at one character is a character representation; support at two distinct characters retains both. Replacing its dual by functions only on compact units loses this distinction.
- For compact abelian G, `essentiallyAdmissibleRepresentation` recovers coadmissible distribution modules and coherent sheaves on its character space. An unrelated second central action on the tensor algebra is excluded by the agreement condition.

Let Z⁺⊂Z contain a compact open subgroup and generate Z, and let V be a compact-type continuous Z⁺-representation. Define `finiteSlopePart Zplus V` as the continuous Z⁺-equivariant linear maps O(Ẑ)→V, with the bounded-convergence topology; Z acts on O(Ẑ) through its universal character. Prove `finiteSlopePart.evaluation`, its universal property for locally analytic Z-representations with a Z-stable Banach-subspace exhaustion, `finiteSlopePart.leftExact`, and `finiteSlopePart.characterEigenspace`: evaluation at 1 identifies its χ-eigenspace with V^χ. This construction is not the union of arbitrary slope projectors on a Banach space. Sources: Emerton-Jacquet Definition 3.2.1 and Propositions 3.2.4, 3.2.6 and 3.2.12, pp.796–799.

For G reductive, P=MN, choose the compact open N₀ and positive semigroup M⁺ from a good compact subgroup in the source. Its centre Z_M⁺ contracts N₀ and generates Z_M. Define `positiveJacquetHecke m` on V^N₀ for m∈M⁺ by

```text
  v ↦ [N₀:mN₀m⁻¹]⁻¹ ∑_(n∈N₀/mN₀m⁻¹) n m v.
```

The displayed quotient denotes coset representatives, not a quotient group if the subgroup is not normal. Prove independence of representatives, the semigroup action law and compatibility with shrinking N₀. Define `locallyAnalyticJacquet P V` as the Z_M⁺ finite-slope part of V^N₀, and prove `jacquet_MAction`, `jacquet_independentN0`, `jacquet_leftExact` and `jacquet_essentiallyAdmissible` for essentially admissible V. The construction is for any parabolic, including P=G and anisotropic groups. Prove `jacquet_smoothComparison` with V_N for admissible smooth V, and `jacquet_locallyAlgebraicComparison`: J_P(X⊗_B W)≃X_N⊗_B W^N, with W a finite algebraic representation and B=End_G(W), under the source's smooth admissibility hypotheses on X. Sources: Emerton-Jacquet Definitions 3.4.1–3.4.5 and Proposition 3.4.6, pp.806–807; Theorem 4.2.32, p.828; Propositions 4.3.4 and 4.3.6, p.834. On general locally analytic V this is left exact, not an asserted exact unipotent-coinvariant functor. When P is a Borel of a split group, M=T and the preceding abelian duality gives a coherent character-space sheaf. Label its character δ by pulling the contragredient dual's support through character inversion, so its δ-fibre is dual to the δ-eigenspace of J_B(V); an unmentioned inversion would relabel arithmetic points.

**Checks.**

- For `finiteSlopePart` of a one-dimensional representation on which a generator of ℤ≥0 acts by a nonzero a, the result is the same character line, even when ℤ≥0 is a proper submonoid of ℤ.
- If the generator acts by zero on E, `finiteSlopePart` is zero. If it acts as diag(0,2) on E², the result is the second line; retaining the zero-eigenvalue direction fails this finite-dimensional Fitting test.
- For `finiteSlopePart` at Z={1}, the result is V. In general its χ-eigenspace has the same dimension as V^χ, so a nonzero χ-eigenvector is not removed by an unrelated radius convention.
- `positiveJacquetHecke` of the identity is the identity. On a trivial representation every term equals v and the normalized operator is v; an unnormalized sum would multiply by the index.
- For `positiveJacquetHecke` on GL₂ over K with N₀ upper unipotent O_K and m=diag(ϖ,1), the index is |O_K/ϖ|. On constants the operator is still 1, including when p=2.
- For `positiveJacquetHecke`, replacing a coset representative by n h, h∈mN₀m⁻¹, fixes its term on V^N₀. An arbitrary vector outside V^N₀ need not have this independence. The inverse index exists over E but need not in O_E.
- For `locallyAnalyticJacquet` at P=G, N={1} and the admitted Z_M-action gives back V for essentially admissible V. For a torus this retains the entire noncompact character, including uniformizers.
- For a smooth admissible representation, `locallyAnalyticJacquet` agrees with unipotent coinvariants. For a finite algebraic W it instead gives W^N; for the standard GL₂ representation with upper N, this is its first-coordinate highest-weight line, whereas W_N is its last-coordinate quotient. Their T-characters are different.
- `locallyAnalyticJacquet` takes zero to zero and a closed equivariant injection to an injection. Applying unipotent coinvariants to every analytic representation as its definition would not justify this left exactness or the preceding algebraic-weight test.

### 0.7 Definite unitary completed coefficients and Jacquet geometry

Let F/F⁺ be CM and G/F⁺ be definite at infinity and split as GL_n over F, with n≥2. Suppose every place above p splits in F, choose one varying place wp, and put K=F⁺_wp. Over a sufficiently large coefficient field E, fix algebraic/inertial coefficients ξ⊗τ at the other p-places with a stable O_E-lattice. Choose small U^wp, maximal compact level at the other p-places, hyperspecial level at inert finite places, and unramified split tame level at the places defining the Hecke algebra. Define `unitaryCompletedCoefficient` from the actual automorphic functions

```text
S(U_wp U^wp, ξ⊗τ, O_E/ϖ^k):
  f : G(F⁺)\G(A_F⁺^∞) → (ξ⊗τ)_(O_E/ϖ^k),     f(gu)=u⁻¹f(g),
Π = (lim_k colim_U_wp S(U_wp U^wp, ξ⊗τ, O_E/ϖ^k)) ⊗_(O_E) E.
```

Its API `unitaryCompletedCoefficient.localAction`, `tameHecke`, `integralLattice` and `localRegularity` preserves the GL_n(K)-action and the other p-place coefficients. For a sufficiently small compact open H at wp, prove Π|_H≃C(H,E)^s with s≥1 under the nonempty small-level hypotheses of this arithmetic construction. Prove the integral version first: sufficiently small tame level kills finite stabilizers, the definite double quotient is a finite disjoint union of free H-orbits, and the fixed coefficients at the other p-places give the finite free multiplicity module. This is the general-rank specialization of the completed-function methods. Sources: Ding §4.2.2, pp.66–67, before Proposition 4.14; Breuil–Ding Lemma 6.1 and its proof, author-manuscript pp.83–84, which treats general n despite the paper's rank-three main application.

**Checks.**

- Trivial coefficients at the other p-places recover scalar completed functions. Nontrivial coefficients there survive the limit and are not absorbed into the varying local-group action.
- The order is lim_k colim_U_wp before inverting ϖ. Reversing it can omit continuous functions not fixed at any single finite level, as in §7.1.
- The local model has s≥1; the zero representation is not an example of the nonempty arithmetic construction. Rank n=2 is allowed; a rank-three-only specialization does not suffice.

Construct `unitaryJacquetCoefficients` from the actual locally ℚₚ-analytic vectors of Π: take N₀-invariants, then finite slope for the normalized positive-torus Hecke action, and form the locally analytic Jacquet module. The average includes the inverse of the finite index over E; no integral averaging at a p-power index is used. Its strong dual gives a coherent sheaf on the full locally analytic character space of T(K), including the unramified (G_m)^n-coordinates. Prove `unitaryJacquetCoefficients.coherent`, its tame-Hecke action and character-fibre identification. Apply §0.6 with L=ℚₚ to the restriction-of-scalars group, using admissibility from local regularity and the Borel Jacquet theorem. Label the coherent dual by the character-inversion convention fixed there. This does not identify completed functions with their Jacquet module. Source: Ding §4.2.2, p.66, and the proof of Proposition 4.14, p.67. The general analytic-vector, finite-slope, Jacquet and coherent-duality arguments are those of §0.6; the arithmetic coefficient realization and its Hecke action are the additional targets here.

Define `unitaryCoefficientEigenvariety` as the relative tame-Hecke spectral algebra acting on this coherent sheaf, using the supplied spectral construction. Prove `unitaryEigenvariety_points`: (δ,ω) occurs precisely when Hom_T(δ,J_B(Π_(ℚₚ-an)[m_ω]))≠0, with Hecke eigenspaces interpreted as in that construction. Define `unitaryClassicalPoint` by using the locally algebraic vectors inside the same Π and retaining the refinement character. Prove `unitaryClassicalPoint.eigenvectorCriterion`, `locallyAlgebraicWeight` and `unramifiedTwist`, through the supplied classical automorphic realization. Prove `unitaryEigenvariety_dimension`, `unitaryJacquetSheaf_cohenMacaulay`, and `unitaryEigenvariety_reduced`: for this arithmetic eigenvariety, the dimension is n[K:ℚₚ], it is equidimensional, its coefficient sheaf is Cohen–Macaulay, and it is reduced. Source: Ding Proposition 4.14 and its proof, p.67, with the construction on p.66. Establish the following arithmetic inputs to the supplied spectral and commutative-algebra arguments.

- `unitaryJacquet_fredholmNormalization`: choose an Iwahori-factorized uniform H and a strictly positive central torus element z contracting N₀. Local regularity gives the analytic stages used by Breuil–Hellmann–Schraen, *Une interprétation modulaire*, Proposition 5.3, pp.44–45: property-(Pr) modules V_h over an exhausting family of compact-weight affinoids, completely continuous operators, and continuous maps α_h,β_h whose two composites are the operators at adjacent stages. Their displayed Hecke action is the unnormalized sum. If c_z=[N₀:zN₀z⁻¹], its operator is c_z times §0.6's normalized operator. Transport the Fredholm eigenvalue coordinate by λ↦c_zλ, and more generally transport the positive-semigroup character by its multiplicative index character before comparing point labels. This is an invertible rational rescaling; it preserves support dimension and finite-projective slope modules. It is not an integral unit rescaling at p-power index.
- `unitaryJacquet_projectiveCharts`: on a slope-adapted affinoid cover, the coefficient module M_i is finite projective over a regular compact-weight algebra A_i, and the faithful Hecke image B_i⊂End_(A_i)(M_i) is finite over A_i. Each nonempty irreducible component maps finitely and surjectively onto an open compact-weight affinoid. Obtain this for the actual Π from the preceding factorization, using the supplied Fredholm machine; the local argument is Breuil–Hellmann–Schraen, *Une interprétation modulaire*, Lemma 3.10, Proposition 3.11 and Corollary 3.12, pp.23–26. The compact-weight dimension is n[K:ℚₚ]. No deformation or patching variables from that paper enter the present arithmetic space. These finite-projective charts give equidimensionality and no embedded components of B_i; the finite-module depth argument gives the Cohen–Macaulay property of M_i over B_i, as in *Smoothness and classicality*, Lemma 3.8, p.24.
- `unitaryClassicalPoints_accumulate`: every component contains an accumulation set of sufficiently dominant, regular, noncritical classical refinements. On a bounded slope chart, choose algebraic weights whose successive gaps dominate all the bounded positive-root slopes, then prove that the corresponding analytic eigenvectors factor through the finite algebraic coefficient and its smooth refinement. Algebraic weights satisfying these gap bounds accumulate in the compact-weight charts. Finite surjectivity of the preceding charts transfers the density to each component. Carry along ξ⊗τ at the other p-places. This is the unpatched specialization of the local classicality and density argument in *Une interprétation modulaire*, Theorem 3.19, pp.29–31, used in Ding's proof. An unspecified dense subset of a larger ambient character space is insufficient.
- `unitaryClassicalHecke_semisimple`: on those noncritical classical slope pieces, identify the Hecke action with its classical automorphic realization and prove the required semisimplicity over a sufficiently large characteristic-zero coefficient field. Together with the faithful finite-projective model, this kills a nilpotent Hecke endomorphism on a Zariski-dense family of fibres, and hence on the whole model. Use the no-embedded-component conclusion to pass from generic reducedness on each component to reducedness. Sources: *Une interprétation modulaire*, Corollary 3.20 and its proof, pp.31–33; Chenevier's arXiv version, Proposition 6.4 and Lemma 6.5, pp.20–21, for the reducedness criterion. The latter is numbered Proposition 3.9 in the published version cited by Ding. Semisimplicity, noncritical classicality and componentwise accumulation are arithmetic proof targets here; coherence alone supplies none of them.

**Checks of the arithmetic inputs.**

- For GL₂(ℚ₂), z=diag(2,1) has c_z=2. On a trivial coefficient the normalized operator is 1 and the unnormalized sum is 2. A nonzero eigenvalue a becomes 2a; omitting this change corrupts the refinement label. The scalar is invertible over E and is not a unit of O_E.
- A finite projective M_i of positive rank over a regular A_i has the required weight dimension. Rank zero has empty support. A coherent module A_i/(f) for nonzero f is a counterexample to inferring the same dimension from coherence alone.
- Dominant weights without a quantitative gap need not be noncritical on a fixed slope chart. A classical point on one component does not establish reducedness on another component.
- The algebra A_i[ε]/(ε²) acting faithfully on its regular module has the same underlying character set as A_i but a nonzero nilpotent. Its fibres are not semisimple, so it fails the arithmetic semisimplicity input. Removing embedded components is also essential to a generic-reducedness argument.

**Checks.**

- `unitaryJacquetCoefficients` remembers a character's value on a uniformizer. Characters equal on O_K^× but different there give different weights.
- `unitaryCoefficientEigenvariety` omits an eigensystem with zero Jacquet eigenspace; changing the tame eigenvalue changes the point even at fixed δ. Its point set is not just a compact weight space.
- `unitaryClassicalPoint` requires locally algebraic vectors and a refinement. A locally analytic nonalgebraic vector does not suffice; a smooth unramified twist changes refinement without changing algebraic exponents.
- At n=2,K=ℚₚ the dimension is two, and for [K:ℚₚ]=2 it is four. Coherence alone does not make a nonreduced spectral algebra reduced. The zero representation lacks the positive local multiplicity used in these conclusions.

**Further coefficient checks.**

- `unitaryJacquetCoefficients` for a torus has no unipotent invariant operation but still retains the full locally analytic character, including uniformizers. For a trivial N₀ action the invariant step preserves the space; the finite-slope step still removes vectors outside its defining finite-slope universal property.
- `unitaryJacquetCoefficients` is formed from Π's locally analytic vectors, not from all continuous functions. A continuous vector outside those vectors cannot define a Jacquet eigenvector by decree.
- At n=2,K=ℚₚ, `unitaryCoefficientEigenvariety` has dimension two. Passing to [K:ℚₚ]=2 gives four, while adding the dimension of the full noncompact torus character space as an extra term would give the wrong result.
- `unitaryCoefficientEigenvariety` retains generalized Hecke spectral support and its coherent module; a nonreduced abstract Hecke quotient is not reduced merely because its set of characters is unchanged.
- For `unitaryClassicalPoint`, an algebraic vector tensored with a smooth refined vector has the stated locally algebraic weight and refinement. The zero vector supplies no eigensystem, even though it is locally algebraic.
- An unramified smooth twist of a `unitaryClassicalPoint` changes the character on a uniformizer while retaining its algebraic exponents. A locally analytic weight with a nonintegral infinitesimal exponent is not classical by the definition.

### Examples

For F=ℚ, the pair w=x^a,t=x^v gives geometric exponent 2a−v. For a split quadratic field there are exponents 2a₁−v,2a₂−v and the norm is the product of the two coordinates. The determinant definition works at ramified primes before generic splitting. In higher rank, opposite-unipotent variables explain why analytic induction is usually infinite dimensional despite its finite-dimensional algebraic subrepresentation. The unitary application starts from completed functions; the Siegel application starts from an analytic induction on a period-domain reduction.

### Dependencies

Tensor, determinant, continuous-character, representation and matrix APIs; analytic charts and Banach-family tools; completed limits and actions. The unitary arithmetic geometry also needs the local regularity, Jacquet specialization and density targets in §0.7, using the general foundations of §0.6. Hilbert canonical subgroups are not prerequisites for these representation constructions.


## Layer 1: automorphy and effective coefficient descent

### 1.1 Right cocycles, inversion and change of frame

For a right Γ-action on X and a possibly noncommutative coefficient group C, define `RightAutomorphyCocycle` by a unit-valued function with

```text
J_(γδ)(x) = J_γ(x) J_δ(xγ),       J_1(x)=1,
f(xγ) = ρ(J_γ(x)⁻¹) f(x).
```

Its API comprises `rightCocycle_one`, `rightCocycle_inv`, `right_cocycle_of_left` and `rightCocycle_gauge`. For a left action with K_(γδ)(x)=K_γ(δx)K_δ(x), put xγ=γ⁻¹x and J_γ(x)=K_(γ⁻¹)(x)⁻¹. For a frame change b:X→C put J′_γ=b(x)⁻¹J_γb(xγ) and f′=ρ(b⁻¹)f. Inversion and product order both matter. This translates BHW Definition 6.5, p.1758, and BP §6.3.1, p.153, into one descent convention; algebraic associated bundles are supplied by AutomorphicBundles B0.

**Checks.**

- For the trivial group there is only the identity factor, and all coefficient functions are allowed. For a trivial action a constant group homomorphism Γ→C is a cocycle; an arbitrary nonmultiplicative function is not.
- Take A=[1,1;0,1], B=[1,0;1,1]. The inverse two-step factor is B⁻¹A⁻¹=[1,−1;−1,2], whereas A⁻¹B⁻¹=[2,−1;−1,1]. This detects a reversed noncommutative cocycle or omitted coefficient inversion.
- A constant frame change conjugates the factor and multiplies vectors by ρ(b⁻¹). For a line and b=2 over ℚ₅, this halves the coordinate; the inverse frame change recovers it.

### 1.2 Analytic coefficient equalizers and functoriality

Define `analyticCoefficientSheaf q ρ J` on a specified analytic, pro-étale, pro-Kummer-étale or diamond v-site as the equalizer of the actual two pullbacks on q_*F_V. Here F_V is the supplied completed coefficient-function sheaf on the actual torsor q:Y→X. Record the site, completion convention and, integrally, the geometric O_Y⁺-lattice. The API is `analyticCoefficientSheaf.section_iff`, `restrict`, `map_intertwiner`, `gauge_equiv` and `pullback_map`. This specializes the supplied invariant-module-subsheaf construction to the analytic coefficient action. Prove `coefficientFunctions_siteComparison` for the actual Siegel and toroidal coefficient torsors: compare the completed coefficient functions, chart restrictions and Gauss lattices on their analytic, pro-Kummer-étale and v-sites. For finite coefficients reduce this comparison to the supplied finite locally free site equivalences; for infinite analytic coefficients use the actual normalized chart module and its proved Banach descent setting. Product-affinoid scalar formulas alone give no general Banach comparison. Sources: BHW Proposition 6.6, pp.1758–1759; Heuer Corollary 1.5, p.3, and Proposition 3.8, p.15, for the line applications.

For finite coefficients with effective finite locally free descent, prove `coefficientDescent_rank`, `coefficientDescent_tensor_iso` and `coefficientDescent_dual_iso`. Intertwiners, gauges and restrictions give maps of equalizers without an effectivity assertion; tensor and dual isomorphisms use finite locally free effectivity. For analytic induction, construct the associated Banach sheaf only in the locally trivial analytic-torsor setting or with a specifically established Banach-descent theorem. No automatic coherence or exactness is claimed. A coarse quotient requires trivial stabilizer actions on coefficient fibres; otherwise use the quotient stack. Integral finite-group descent is effective descent, not averaging unless its order is a unit. Needs: Layer 0 and the site-specific supplier contracts.

**Checks.**

- The identity torsor gives the supplied coefficient sheaf. A trivial rank-r representation on a genuine torsor gives O_X^r after function descent; rank zero gives zero.
- On a trivial torsor, evaluation at the identity section recovers the coefficient. A nontrivial character changes the value at a second torsor point by its inverse, so it is not invariant scalar descent.
- A stabilizer acting by −1 on a line in characteristic zero obstructs unrestricted line descent to the coarse point; a trivial stabilizer action does not. At residue characteristic 2, averaging over a group of order 2 is unavailable.
- A rational finite-group splitting does not prove that its integral equalizer commutes with nonflat base change. Similarly, an infinite-rank coefficient has no finite-coherence conclusion merely from its equalizer definition.

### 1.3 Analytic effectivity of line coefficients

Prove `denseOpenLine_analytic`: on a smooth rigid X, a v-line bundle analytic on a Zariski-dense analytic open is analytic on X. This is Heuer Corollary 1.5, p.3, applied to the coefficient line already constructed on the v-site. An infinite-level perfectoid base is not a smooth rigid base: its line is obtained by pullback and the tower equalizer.

Prove `formalUnitCocycle_analytic`: let 𝔛 be a formal scheme topologically of finite type over O_K, for a complete perfectoid extension K/ℚₚ, and let 𝔛∞→𝔛 be an inverse system of finite étale Galois torsors with profinite group Γ. For a continuous line cocycle in units of the completed formal structural ring, assume its reduction modulo every p^m factors through a finite quotient and gives compatible effective formal lines. The resulting analytic generic-fibre line is the equalizer line. Source: Heuer Definition 3.7 and Proposition 3.8, p.15. Formal units, the finite-type formal base and effective finite-quotient reductions are required; an arbitrary bounded geometric cocycle does not supply these hypotheses.

### Examples

A scalar character can hide a wrong product order. The two unipotent matrices in §1.1 distinguish it before taking determinants. Rational triviality also hides integral information: ℤₚ and pℤₚ both rationalize to ℚₚ, while their inclusions and unit balls differ.

### Dependencies

Layer 0, associated-bundle and finite locally free descent contracts, completed functions on the specified sites, and the two line-effectivity theorems. General Banach effectivity does not follow from finite-rank descent.

## Layer 2: geometric Hilbert coefficient sheaves

### 2.1 Admitted coefficient domains

Define `HilbertCoefficientDomain κ n ε` as the supplied anticanonical domain together with the period-coordinate and weight-extension data required to evaluate κ(cz+d). Choose an actual analytic extension of κ on B_r(Oₚ^×:1) and m≥1 with p^(−m)≤r<1. For the established geometric-position estimate use

```text
0 ≤ ε < 1/(2p^m)       if p≥5,
0 ≤ ε < 1/(3p^m)       if p=3,
0 ≤ ε ≤ 1/(4·2^m)      if p=2.
```

Intersect this range with the canonical-subgroup and coefficient admissibility ranges. The period and canonical generators are supplied by HodgeTateAndCanonicalSubgroups T4; the strict inequalities for odd p are part of that contract. Define `hilbertDomain.restrict`, `forgetLevel` and `atkinLehner`. At finite level n≥1 the latter is AL_n:X_(Γ₀*(p^n))(p^nε)_a→X(ε), with p^nε<1/2 and every canonical quotient used in the map admitted. The same symbol ε on both sides without scaling would describe a different map. At n=0 define the coefficient on X(ε) by AL₁ from X_(Γ₀*(p))(pε)_a. Infinite level uses the structural tower maps. Sources: BHW §5.3, Definitions 5.17 and 6.4, pp.1751–1752,1757–1758; HodgeTateAndCanonicalSubgroups §§4.6–4.8.

Name `hilbertPeriod_endpointExtension` for the additional closed-endpoint assertion at ε=1/(c_pp^m), p≥3, c_p=2 or 3. It requires a proof of the boundary period estimate, beyond the supplied strict-range theorem. Name `hilbertPeriod_unsplitRamifiedGenerator` for the O_F/p^n-linear canonical generator and its congruence with the saturated Hodge–Tate kernel, proved using scalar conormal-degree estimates before generic splitting. At a ramified prime, use this extra input wherever the period-coordinate proof needs it; an embeddingwise integral product decomposition cannot replace it. These extensions preserve the broader desired domain as explicit theorems to prove, without asserting that the existing strict theorem covers equality. Source of the ramified comparison problem: BHW Proposition 5.18 and its proof, pp.1752–1753.

**Checks.**

- For `HilbertCoefficientDomain`, ε=0 is the ordinary domain and satisfies the displayed estimates; the overconvergent colimit later excludes this radius as an index.
- At p=3,m=1, ε=1/12 satisfies the strict bound, ε=1/9 is the endpoint-extension target, and ε=1/3 lies outside both the established and requested closed bounds. At p=2,m=1 the included endpoint is 1/8.
- At n=1,p=5, target ε=1/100 corresponds to source radius 1/20. At n=0 the same AL₁ scaling is still used. Full GL₂(ℤₚ) does not stabilize an anticanonical branch: its Weyl element sends z=0 to infinity.

### 2.2 The Hilbert factor and rational coefficient line

On the infinite cover of an admitted domain define `hilbertFactor γ x = cz(x)+d` for γ=(a,b;c,d) in the appropriate Γ₀(p)-group. Prove `hilbertFactor_unit`, `hilbertFactor_analytic` and `hilbertFactor_leftCocycle`, namely j_(γδ)(x)=j_γ(δx)j_δ(x). The period-coordinate estimate places this factor in the chosen analytic character neighborhood, rather than merely in an abstract fraction field. Define `hilbertWeightFactor κ γ x = κ(j_γ(x))⁻¹`. It acts by inverse multiplication on the coefficient function. Apply the conversion of §1.1 if right descent is used. Sources: BHW Definition 6.5 and Proposition 6.6, pp.1758–1759; the period transformation itself is supplied by T4.

**Checks.**

- For `hilbertFactor`, an upper-unipotent matrix has j=1. For diag(a,d), j=d; diag(a,1) has factor 1, even though its determinant may be a≠1.
- At z=0 a lower-unipotent matrix (1,0;c,1) has j=1, but its first-order dependence on z is c. Replacing j by a determinant loses this dependence.
- For `hilbertWeightFactor` with F=ℚ,p=5,κ(x)=x and γ=diag(1,2), the value is 1/2. With κ=1 it is 1. Two diagonal lower entries 2,3 give coefficient factor 1/6, not 6.
- A matrix outside the admitted subgroup can have denominator zero at a point of the chart. Its character value is not defined by declaring zero a unit; the unit theorem has a domain hypothesis.

Define `geometricHilbertSheaf κ n ε` independently as the O-valued automorphy equalizer on the small geometric infinite cover over the level-n domain. Its APIs are `geometricHilbertSheaf.section_iff`, `locallyFree_one`, `levelPullback`, `radiusPullback`, and their identity/composition laws. At finite n prove rational invertibility by the supplied dense-open line-effectivity criterion on the smooth rigid weight product, using the ordinary differential trivialization. At infinite n identify the equalizer with the pullback of the finite-level line by sheafwise tower descent; do not apply the smooth-rigid criterion to a perfectoid base. Treat n=0 by the preceding AL₁ transport. Sources: BHW Definition 6.5, Proposition 6.6 and Remark 6.7, pp.1758–1759; Heuer Corollary 1.5, p.3.

**Checks.**

- The literal trivial character κ=1 gives O on its own finite-level base; this checks the structural-function descent input.
- An algebraic κ(x)=∏_σ σ(x)^kσ gives the corresponding tensor of Hodge differential lines; the parallel norm character Nₚ^k gives (det ω)^k. It is not the trivial character when k≠0.
- Radius restrictions compose, and forgetting from level n+2 to n factors through n+1. The n=0 map includes AL transport, so it is not an unscaled forgetful map from an anticanonical branch.

**Further factor checks.**

- `hilbertWeightFactor` for the trivial character is identically 1. For κ=x and lower diagonal entries 2 and 3 over ℚ₅, the factors are 1/2 and 1/3, giving 1/6 under composition.
- For κ=x⁻¹, `hilbertWeightFactor` at denominator 2 is 2, detecting the dual convention. If a denominator is zero outside the admitted domain, no character value is assigned to it.

### 2.3 Algebraic specialization

Prove `hilbertAlgebraicSpecialisation`: after generic splitting, the line of algebraic geometric weight κ=∏σ σ^kσ is canonically the analytification of ⊗σ ωσ^kσ on the admitted domain. Negative integers use dual lines. The proof compares the actual Hodge–Tate differential frame with the supplied classical frame and its factor j, rather than declaring the two lines equal because both have rank one. Retain any finite-order nebentype when κ is locally algebraic. Sources: BHW Remark 6.7, p.1759; AIP-adic §4.1 and Proposition 4.3, pp.15–16; AutomorphicBundles B4 supplies the classical line. In the notation ω^1, distinguish the literal character 1 from parallel weight one, which is the norm character.

### Examples

For F=ℚ and κ=x^k, a frame with denominator 2 changes the coefficient by 2^(−k). Multiplying by the kth tensor of the frame cancels the factor. With k=−1 the coefficient instead changes by 2, exactly the dual-line rule. For d>1 a tuple of distinct exponents cannot be represented by a determinant power; the full split torus character is retained.

### Dependencies

Layers 0–1 and the T4 domains and estimates. Algebraic specialization also uses T5's Hodge–Tate differential lift and the classical coefficient line. The equality endpoint and unsplit ramified refinement are named inputs, not consequences of integral splitting.

## Layer 3: integral structures, weights and overconvergence

### 3.1 Geometric integral coefficients and rationalization

Define `integralHilbertSheaf κ n ε` by the same automorphy equalizer inside geometric O⁺ on the actual infinite cover times U. Prove `integralHilbertSheaf.inject`, `integralHilbertSheaf.restrict`, and stability under the action when both κ(j) and its inverse are integral at all valued points. Define its rationalization map to the rational line. Prove `integralHilbertSheaf.rationalise`: this is an isomorphism of sheaves after inverting p, using a local common denominator on quasi-compact inverse images and the all-open coefficient-function descent theorem. It is a sheaf statement, not a claim that inverting p commutes with global sections over every non-quasi-compact open. Source: BHW Definition 6.5, p.1758, with the integral comparison in Theorem 7.14, pp.1764–1765.

The stronger `integralHilbertSheaf.locallyFree_one` is asserted only with base-local unit eigenfunctions trivializing the relevant full-character torsor descent. Rational invertibility alone does not provide them. The independent construction of those integral trivializations and their precise finite-character condition is in Layer 5. This distinction also applies to an infinite-level pullback of an integral lattice.

**Checks.**

- For `integralHilbertSheaf`, κ=1 gives O⁺ once geometric integral function descent is proved. Over a point the lattice is the valuation ring inside its fraction field.
- ℤₚ and pℤₚ are different integral submodules with the same rationalization. A rational comparison cannot select between them.
- On a disjoint union of affinoids, sections p^(−i) on the ith component are locally rationalized integral sections but need no common global denominator. This disproves an unrestricted global-sections rationalization identity.
- A factor equal to p is a rational unit but its inverse is not power bounded. Such a factor does not preserve the O⁺ equalizer lattice and fails the required two-sided unit condition.

### 3.2 Weight pullback and fixed-radius forms

Define `hilbertWeightPullback` for a morphism of bounded weight families and the compatible admitted domain, by pullback of the rational coefficient line. Prove its character specialization, identity, composition and compatibility with radius/level pullbacks. For integral coefficients define `integralHilbertWeightPullback` under a flat formal coefficient change with compatible completed integral function descent, or on an actual AIP formal chart map satisfying its integral base-change theorem. Prove the integral comparison under those hypotheses. A rational base-change isomorphism does not imply arbitrary integral base change. Source: BHW §6.1–§6.2; AIP-cusp Proposition 3.14 and Remark 3.15, pp.17–18, explicitly separate rational base change from the integral finite-group obstruction.

**Checks.**

- `hilbertWeightPullback` along a point recovers the line for that point's character; along the identity it is the same line; two successive changes agree with their composite.
- At the trivial weight it gives the structure sheaf of the new base. A character and its inverse specialize to different coefficient actions at a denominator 2.
- `integralHilbertWeightPullback` along a flat compatible formal chart preserves a unit frame. Reduction modulo p is not flat over ℤₚ and cannot be substituted into this assertion without a separate integral comparison.

For an actual polarization component c and admitted finite or infinite level, define `fixedRadiusHilbertForms κ n ε c` as H⁰ of the specified coefficient sheaf on that domain times U, and `integralFixedRadiusHilbertForms` using the integral lattice. Define the arithmetic versions only after the independent arithmetic presentations of Layer 4. Their APIs are `fixedRadiusHilbertForms.restrictRadius`, `changeLevel`, `weightMap` and `integralInclusion`. These are section modules; projective Banach assertions are later cuspidal theorems with substantially stronger hypotheses. Source: BHW Definitions 6.4–6.5, pp.1757–1758, and §9.1, pp.1780–1781.

**Checks.**

- At trivial weight, the geometric section module is H⁰ of O on that domain, not automatically A; the integral one is H⁰ of O⁺.
- The zero section belongs to every weight, while a constant 1 on the cover fails a nontrivial automorphy relation unless its multiplier is trivial.
- Restricting twice in radius gives the same section as direct `restriction`, and a section killed by an integral inclusion is zero. Infinite wild level is permitted as a section object but has no automatic finite-level Banach theorem.

**Further section and pullback checks.**

- `integralHilbertWeightPullback` along the identity preserves the specified integral frame. Two flat compatible formal changes agree with their composite, including their integral inclusions.
- `integralHilbertWeightPullback` of the trivial weight on a torsor with integral function descent gives the new base's O⁺; multiplying a rational frame by p changes the lattice and cannot be an integral unit trivialization.
- `integralFixedRadiusHilbertForms` for the trivial weight on an affinoid is its actual bounded-function ring; a function with norm greater than 1 is a rational section outside this lattice.
- `integralFixedRadiusHilbertForms` is closed under admitted radius `restriction` and contains zero; an equality after rational inclusion is already an equality in the lattice in the torsion-free setting. For a nontrivial character, a nonzero constant on the cover need not be a section.
- The arithmetic fixed-radius versions remember polarization transport: a pure determinant element acts by κ(d)⁻¹w(d), rather than just κ(d)⁻¹. At w=t=x,F=ℚ,d=2 the former is 1 and the latter 1/2.

### 3.3 The positive-radius colimit

Define `overconvergentHilbertForms κ n c` as the filtered colimit of the fixed-radius modules over positive admitted ε with transition maps restriction toward zero. Define `integralOverconvergentHilbertForms` separately from the integral modules. Prove `overconvergentHilbertForms.representative`, `eventualEquality`, `lift`, `cofinalRadius` and compatibility with level and bounded weight maps. A colimit element has a representative at one positive radius; two representatives agree after shrinking to a common positive radius. Its equality relation does not demand agreement at the larger radius. Source: BHW Definition 6.4, p.1757; AIP-cusp Proposition 3.16, p.18.

**Checks.**

- A fixed-radius form defines a colimit element; its restrictions define the same element. Two forms with the same `restriction` at a smaller positive radius are identified.
- Replacing all positive radii by a cofinal sequence gives the same module. Adjoining ε=0 as a terminal `restriction` target can change the colimit and is not its definition.
- For a constant system A with identity maps the colimit is A, including A=0. A form defined only on the ordinary locus has no positive-radius representative by definition and is not automatically overconvergent.

**Integral colimit checks.**

- `integralOverconvergentHilbertForms` of a constant integral system R⁺ with identity restrictions is R⁺, whose rationalization is R⁺[1/p]. It is not defined to be the latter rational module.
- Two integral representatives agreeing after an admitted smaller positive radius define the same integral colimit class. Representatives need not agree on the larger domain.
- A bounded ordinary section lacking every positive-radius representative is absent from `integralOverconvergentHilbertForms`. Allowing ε=0 as a terminal index would fail this test.

### 3.4 The ramified differential-lattice application

Construct `hilbertModifiedCoefficient` by applying the coefficient character to the supplied modified differential frame rather than to the naive differential lattice. Its API `modifiedCoefficient.frame`, `modifiedCoefficient.hodgeInclusion` and `modifiedCoefficient.ordinaryComparison` records that the lattice has O⁺-rank d, rank one over Oₚ⊗O⁺, and cokernel controlled by Hdg^(1/(p−1)) in the precise integral ideal interpretation of T5. It agrees with the ordinary Rapoport differential module where Hdg is a unit. The same operation gives finite analytic coefficients on the frame torsor. Source: AIP-adic Proposition 4.1, p.15; T5 supplies the lattice and its properties. At a ramified prime, the coefficient construction must use that supplied unsplit module; it does not add a second lattice theorem.

**Checks.**

- At an ordinary point the modified and original differential lattices agree. Away from it their generic fibres can agree while integral lattices differ.
- An Oₚ-linear frame has rank one over Oₚ⊗O⁺ and rank d over O⁺. Treating it as an O⁺-line for d>1 loses components of the character.
- In the unramified split generic fibre the algebraic tuple weights agree with the split Hodge lines. At a ramified integral point this computation does not license an integral product decomposition.

### Examples

The integral comparison is sensitive to a factor p even on a point. Over a positive-radius domain, both the integral function bound and the admissible analytic extension must be checked; shrinking the radius can improve the latter but does not turn every rational isomorphism into a lattice isomorphism. The ordinary restriction in Layer 7 is constructed from these positive-radius modules, not built into their colimit.

### Dependencies

Layers 0–2, all-open geometric coefficient descent, the supplied modified lattice, and formal flat base change when an integral weight map is used. Banach properties, cuspidal vanishing and ordinary completion are separate later targets.

## Layer 4: the four Hilbert presentations and arithmetic descent

### 4.1 Four independently defined equalizers

Fix an arithmetic weight (w,t) and its geometric weight κ. Use the actual towers and groups of PerfectoidShimuraVarieties §§5.4–5.10. Let U_N be all global units congruent to 1 modulo N, without a total-positivity restriction. Let Z∞ be its closure in the central action, embedded by z↦(zI,z²). Write Δ(p^∞N) for the profinite polarization group in the infinite tower, Δ(N) for its finite connected-component quotient, E(p^n)=(Γ₀(p^n)×Δ(p^∞N))/Z∞, and PΓ₀(p^n)=Γ₀(p^n)/Z∞ with the prescribed central interpretation. These are supplied groups and actions, not redefined as convenient abstract quotients. Their distinction is essential when a finite group has p-power order.

Define the following coefficient equalizers independently, first inside O⁺ and then inside O. The table specifies the cover, acting group and multiplier in the equivariance relation. The factors are written in the left-pullback convention of BHW; conversion to right descent is exactly §1.1.

| Coefficient | Infinite cover | Group | Multiplier |
| --- | --- | --- | --- |
| `smallGeometricCoefficient κ n` | X*_(Γ*(p^∞)) | Γ₀*(p^n) | κ(j_γ)⁻¹ |
| `fullGeometricCoefficient κ n` | X*_(Γ(p^∞)) | Γ₀(p^n) | κ(j_γ)⁻¹ |
| `intermediateArithmeticCoefficient w t n` | X*_(Γ(p^∞)) | E(p^n) | κ(j_γ)⁻¹ w(x̄) |
| `fullArithmeticCoefficient w t n` | X_(G,Γ(p^∞)) | PΓ₀(p^n) | κ(j_γ)⁻¹ w(det γ) |

Here x̄ is the actual polarization coordinate in E(p^n). Every equalizer is on its own admitted level/radius domain times U. For each define `section_iff`, `integralInclusion`, `radiusMap`, `levelMap` and `weightMap`. Rationalization and integral base change have the hypotheses of Layer 3. No coefficient is defined to be the pullback of another one in the table; the subsequent comparisons are theorems. Sources: BHW Definition 9.1, pp.1780–1781, and Lemma 9.2, pp.1781–1782.

**Checks.**

- For `smallGeometricCoefficient`, κ=1 gives O⁺ or O on the small geometric base. A denominator d=2 at p=5 acts by κ(2)⁻¹. The action of diag(a,1) has no j contribution; replacing it with det γ would change this test.
- For `fullGeometricCoefficient`, κ=1 gives the structural sheaf on the full geometric base, which is not asserted to be the same cover. The mixed-cover comparison of §4.2 must identify its pullback. A scalar zI contributes κ(z)⁻¹, not κ(z²)⁻¹.
- For `intermediateArithmeticCoefficient`, w=t=1 gives its own structural sheaf. For a pure polarization element (1,x̄), the multiplier is w(x̄); for (γ,1) it is κ(j_γ)⁻¹. Dropping w loses the first action even when the period coordinate is unchanged.
- For `fullArithmeticCoefficient`, w=t=1 gives its own structural sheaf. On diag(1,d) the multiplier is κ(d)⁻¹w(d), and on a scalar zI it is κ(z)⁻¹w(z²). At p=5,F=ℚ,w=x,t=x, d=2 gives 1, whereas the geometric multiplier is 1/2.
- All four equalizers contain zero and have identity/composition maps in level and radius. Each trivial-weight structural-sheaf conclusion uses actual function descent; it is not a definition by expected rank.

Prove `arithmeticMultiplier_central`: the last two multipliers are independent of the chosen central representative. On zI the weight factor is

```text
κ(z)⁻¹ w(z²) = t(Nₚ(z)).
```

It is 1 on U_N by `congruence_unit_norm_one`, and on its closure by continuity. It is therefore valid for all congruence units, including those with mixed real signs; the total-positive subgroup need not be dense in that full closure. Prove `arithmeticAction_representativeIndependent` and its cocycle/composition laws on the actual quotients. Source: BHW Lemma 9.2, pp.1781–1782, with the norm argument of §0.2. The statement does not require κ to be trivial on all global units, which would discard legitimate weights.

**Separate presentation checks.**

- `smallGeometricCoefficient` at κ=x⁻¹ sends a denominator 2 to the multiplier 2; `fullGeometricCoefficient` has the same local multiplier on its different cover. Both zero sections satisfy all relations.
- `smallGeometricCoefficient` and `fullGeometricCoefficient` restrict to the specified equalizers after a radius change. Pullback along the mixed span compares them; identifying their function carriers before pullback is not a valid definition.
- `intermediateArithmeticCoefficient` on (1,x̄) has factor w(x̄). For w=1 the polarization coordinate disappears while a nontrivial t still changes κ through the norm.
- `intermediateArithmeticCoefficient` is independent of a central change z from the full congruence-unit closure, including mixed-sign global units. Dropping the closure continuity step proves only the assertion on global points.
- `fullArithmeticCoefficient` on diag(a,1) has factor w(a), although the geometric j-factor is 1. On a scalar zI its factor is t(Nₚ(z)), which is trivial on the central congruence-unit closure.
- `fullArithmeticCoefficient` at the trivial pair has its own structural function equalizer and maps compatibly through every radius `restriction`. It need not have the same underlying base as a geometric presentation.

### 4.2 Geometric comparison and finite polarization descent

Prove `geometricCoverCoefficient_comparison` using the supplied span

```text
X*_(Γ*(p^∞)) ← X*_(Γ*(p^∞)) × Oₚ^× → X*_(Γ(p^∞)).
```

The right map is the actual ℤₚ^×-torsor map. Its additional diagonal factor has j_diag(ε,1)=1. All-open O and O⁺ function descent therefore identifies the two geometric coefficient lines after the corresponding base maps, compatibly with radius and level. Source: BHW Lemma 9.3, pp.1782–1783. Do not assert a direct equality of functions on two different covers.

Define `twistedPolarisationAction ε` on geometric coefficients by ε·_w f=w(ε)(ε⁻¹)*f, for a totally positive global unit in the supplied polarization action. Prove its identity, multiplication and coefficient-stability laws, and `twistedPolarisationAction_factors` through finite Δ(N) after the indicated geometric quotient. Define `finitePolarisationDescent` as the invariant subsheaf of the pulled-back full geometric coefficient under this actual finite action. Prove `intermediateArithmeticCoefficient_comparison`, identifying it with the independently defined intermediate equalizer. Sources: BHW Definition 9.4 and Lemmas 9.5–9.6, pp.1783–1784. The action uses inverse pullback; the finite quotient Δ(N) is distinct from Δ(p^∞N). Integrally, use the effective finite torsor and the section equalizer, not a Reynolds projector when p divides |Δ(N)|.

**Checks.**

- `twistedPolarisationAction` at ε=1 is the identity. Two units ε,η act as w(εη)((εη)⁻¹)*, fixing the inverse-pullback order.
- For trivial w it is inverse geometric pullback. For a scalar eigenfunction of geometric pullback, its eigenvalue is multiplied by w(ε), not w(ε)⁻¹.
- A unit in the kernel of Δ(N) acts trivially only after the supplied level/descent identifications. An arbitrary local unit has no global polarization transport on a fixed moduli component.
- `finitePolarisationDescent` for a trivial group is the pulled-back sheaf; for trivial coefficient weight it is structural-function descent. When the finite group has p-power order the invariant equalizer still makes sense, but division by the group order does not.

**Finite descent checks.**

- `finitePolarisationDescent` on a split finite torsor is recovered by evaluation at its identity section and its actual twisted action. A coefficient with nontrivial polarization character is not a scalar invariant function on the cover.
- `finitePolarisationDescent` in residue characteristic 2 still uses an equalizer for a group of order 2; the formula (1+g)/2 is undefined. A trivial group gives the original sheaf, and the zero coefficient gives zero.

### 4.3 Weil pairing and the arithmetic coefficient

Use the supplied pairing function e_β on the intermediate tower. It is genuinely Oₚ^×-valued there, whereas on the arithmetic quotient only its class modulo the positive-unit closure is intrinsic. Prove `pairingWeight_transform` on the intermediate cover:

```text
(γ,x)* w(e_β) = w(x⁻¹) w(det γ) w(e_β).
```

Then prove `weilPairingCoefficient_comparison`: the map from full arithmetic coefficients to the intermediate presentation is f↦w(e_β)⁻¹π*f, with inverse given after descent by multiplication by w(e_β). Retain the inverse in this map, and prove compatibility with O⁺ whenever the pairing character and its inverse are valuation units, as they are on the admitted compact unit-valued pairing. Source: BHW Lemma 9.7, pp.1784–1785. The use of a raw pairing on the intermediate cover does not define a raw Oₚ^×-valued function on the arithmetic quotient.

**Checks.**

- With w=1 the comparison is ordinary pullback/descent. With F=ℚ,p=5,w=x and e_β=2, it multiplies a coefficient by 1/2; its inverse multiplies by 2.
- For a pure determinant change det γ=3 and x=1, the pairing weight changes by 3. For x=3 and γ=1 it changes by 1/3. These two tests distinguish the two coordinates in the formula.
- Changing the intermediate lift by an element of the positive-unit closure changes the raw pairing, but the combined equivariant expression descends by the stated action. Evaluating the raw pairing on a quotient point without a lift is not defined.

### 4.4 Forms across polarization classes

Define `arithmeticClassForms` by the direct sum of the arithmetic section modules over prime-to-p fractional polarization ideals, modulo the transport relations P_x f−f for global x∈F^×,+∩Oₚ^×. Define its integral and positive-radius versions with the same relations and maps. Prove `polarisationTransport_comp`, `polarisationTransport_principalIdeal`, and `arithmeticClassForms_finiteRepresentatives`, expressing the module using chosen representatives of the supplied finite narrow class group with its prime-to-p representative lemma. Prove `arithmeticClassForms_choiceIndependent`: changing representatives gives a canonical arithmetic transport isomorphism, coherent under further changes and respecting coefficient correspondences. Stabilizers act trivially by the arithmetic cancellation already established. Source: BHW Definitions 9.8 and 9.10 and the intervening discussion, pp.1785–1787. The geometric G* presentation retains conjugate choice-dependent operators where no canonical arithmetic transport is present.

**Checks.**

- For `arithmeticClassForms`, a principal change by x=1 is the identity, and successive global positive x,y give P_xy. An arbitrary element of Oₚ^× with no global positive representative is not a permitted relation.
- For F=ℚ, the narrow class group is trivial and one component suffices. For a field with several narrow classes, dropping every but one component does not give the direct-sum quotient.
- Two choices of representatives of the same class are identified by the supplied positive principal transport. A residual stabilizer must give the identity; an arbitrary unspecified scalar cannot be introduced as a choice isomorphism.

### Examples

At F=ℚ,w=t=x, geometric κ=x, the geometric denominator d contributes d⁻¹, but the arithmetic determinant contributes d. Their product is 1 on diag(1,d). This does not make the geometric coefficient trivial: the two presentations have different groups and comparison pairing. The central cancellation uses z² from det(zI), not z, and uses the norm-one theorem on the full congruence-unit group.

### Dependencies

Layers 0–3, the supplied mixed span, pairing and arithmetic deck groups, all-open integral function descent, and the narrow class group. No finite-group averaging assumption is hidden in the integral comparisons.

## Layer 5: independent AIP coefficients and comparison

### 5.1 AIP analytic eigenfunctions and the formal universal line

Apply the weight character to the actual modified differential-frame torsor of T5. On a normal formal chart, write Hdg_T^(p−1)=Hdg and use the genuine fractional ideal I′_m=p^m Hdg_T^(−p^m), integral on that chart. Its analytic structure group is B_m=Oₚ^×(1+I′_m Res_(O_F/ℤ) G_a). This is a positive-dimensional analytic group, not a profinite group. Define `aipAnalyticCoefficient κ` and `aipIntegralCoefficient κ` independently as the κ⁻¹-eigenfunctions in the direct images of O and O⁺ on that actual torsor. Their APIs `aipCoefficient.eigencondition`, `integralInclusion`, `restrictChart`, `changeWeight` and `translationUnits` retain the torsor, coefficient chart and finite-character factor. Source: AIP-adic §4.1–§4.2, pp.15–16; BHW Definition 7.9, p.1761.

For the formal construction use the AIP universal-character chart over W_F⁰, interval I=[p^k,p^k′], 0≤k≤k′, and r_AIP≥3 with r_AIP+k≥n_AIP≥k′+2 at odd p, and ≥k′+4 at p=2. Put n′=n_AIP−k′−2 or n_AIP−k′−4, respectively. Define `aipUniversalFormalLine` from its actual formal eigenfunctions; prove its invertibility and transition/gluing maps. These are AIP-adic Propositions 4.3 and 4.7, pp.16,18, and §6.1, pp.25–27. The AIP universal-coordinate parameter is not silently set equal to `proWeightRadius`. In the T5 comparison, the analytic character index is m=k+r−1 in its notation; use that index and its one-way containment B_m⊂the ambient character ball, rather than the reverse inclusion.

Prove `aipTranslation_valuationUnit`: at every complete algebraically closed valued point of an admitted torsor, κ(b) and κ(b)⁻¹ belong to the valuation ring, including finite-character values. For the small factor this is the topologically nilpotent congruence of AIP-adic Lemma 4.4, p.16; for the finite factor it follows from finite order. Consequently translation preserves both directions of the integral bound. This does not yet construct a unit eigenfunction on the base.

**Checks.**

- `aipAnalyticCoefficient` at κ=1 is invariant functions, hence O after the invariant-function theorem below; `aipIntegralCoefficient` gives O⁺ with its separate bound theorem.
- For F=ℚ,κ=x, scaling a differential frame s by λ gives f(λs)=λ⁻¹f(s). A constant nonzero function is not an eigenfunction for all λ.
- For `aipUniversalFormalLine`, a local universal eigenframe generates a formal line and specializes to algebraic modified coefficients. The full dyadic sign character is not a W_F⁰ character and is not supplied merely by this universal line.
- A finite p-power root of unity and its inverse have valuation zero, even in a ramified coefficient field. A nonunit scalar p does not satisfy the translation-unit theorem.
- A rational eigengenerator need not be an integral unit eigengenerator. The universal formal line theorem cannot simply be applied to every finite-character twist on every positive formal neighborhood.

**Separate AIP coefficient checks.**

- `aipAnalyticCoefficient` at an algebraic character xᵏ evaluates a differential frame to its homogeneous inverse kth power; k=−1 gives the dual action. A nontrivial finite character remains visible even when the universal small character is trivial.
- `aipAnalyticCoefficient` on a split torsor is recovered from its value at the identity frame. Restricting that frame to a smaller admitted chart preserves the section, rather than introducing an unrelated basis.
- `aipIntegralCoefficient` contains the trivial-character constant 1 and excludes p⁻¹ at a point. Its bound is tested on every valued point, rather than only on rational points of a selected field.
- Translating `aipIntegralCoefficient` by a finite-character value ζ or ζ⁻¹ preserves its bound because both are units; multiplying by p⁻¹ does not preserve the unit ball. An integral lattice rescaled by p is a distinct lattice with the same rationalization.
- `aipUniversalFormalLine` has a local basis and its transition units satisfy the cocycle law. Changing a local basis by an integral unit preserves the formal line; changing it by p gives only a rational basis change.
- Specializing `aipUniversalFormalLine` at the trivial universal character gives the formal structural line. Twisting by the dyadic sign character requires the independent finite factor, so that twist is not silently another universal-coordinate specialization.

### 5.2 Structure invariants on the analytic frame torsor

Prove `aipTorsor_structureInvariants`: for the actual analytic B_m-torsor f_U over the full weight product, (f_U*O)^(B_m)=O and (f_U*O⁺)^(B_m)=O⁺ as sheaves on every open. Prove `aipTorsor_valuedPointLift` and `aipTorsor_reflectsBounds`: after the torsor's local trivialization, a complete valued point of the base lifts after a finite separable extension of its completed residue field, and evaluation upstairs detects the base integral bound. Triviality over a separable extension follows from the étale-locally trivial smooth analytic torsor; it is not inferred from a profinite-torsor theorem. The proof uses the identity section locally, descent across the actual Čech relation, all valued points, and the all-open compatibility of Layer 1. Source: the analytic torsor in AIP-adic Proposition 4.2, pp.15–16, and the comparison argument of BHW §7.2, pp.1762–1765. The all-open and geometric O⁺ conclusion is an explicit extension of that argument, not an invocation of a finite-group averaging result.

### 5.3 The finite character and integral generators

Let H be the torsion part in the AIP unit decomposition, using q=p for odd p and q=4 for p=2. Retain its projection through G=(O_F/p²O_F)^×, as in AIP-adic Lemma 2.4, pp.7–8. For the normalized finite Igusa cover h:IG₂→X, define `aipFiniteCharacter χ` as the coherent χ⁻¹-eigencomponent of h_*O, with its independent integral intersection inside h_*O⁺. Define `aipFullFormalCoefficient` as the universal formal line tensored with that finite-character factor, with coherent completion as in the actual model. The APIs are aipFiniteCharacter.eigencondition, aipFiniteCharacter.ordinaryLine, aipFiniteCharacter.rationalPullback, aipFullFormalCoefficient.restrict, aipFullFormalCoefficient.weightSpecialisation and aipFullFormalCoefficient.glue. The rational factor is invertible; the full formal factor is coherent and invertible on the ordinary locus. Its integral formal invertibility on an entire positive neighborhood is not stated without an additional theorem. Source: AIP-adic §6.4 and Theorem 6.7, p.29. If the actual level-two Igusa construction requires ε≤p^(−3), impose that extra bound as well as the period bound.

On a cover where a chosen section σ splits IG₂, define `finiteCharacterGenerator χ σ` by e_(χ,σ)(σa)=χ(a)⁻¹. Prove `finiteCharacterGenerator.unit`, `evaluate_section`, and `change_section`: e_(χ,σa)=χ(a)e_(χ,σ). These are assertions on the split finite cover and its unit-valued functions. For a function g on a further cover whose chosen Igusa section changes by a(y₁,y₂) on the full Čech relation, prove the descent criterion g(y₂)=χ(a(y₁,y₂))⁻¹g(y₁). The simplified factor d_γ mod p² describes only the specified Γ₀* intermediate action, not the whole Čech relation. A unit generator after pullback is not automatically a generator descending on the base.

Name `finiteCharacter_integralBaseGenerator` for the necessary additional theorem: locally on the base in the intended integral site, the full finite-character descent datum is an O⁺-unit coboundary compatible with the actual normalized-Igusa model, its weight product and restrictions. Name `aipFullIntegral_modelComparison` for identification of that formal integral generic fibre with the independently defined geometric O⁺ equalizer. The proof must supply the full Čech compatibility and integral localization; rational finite étale base change does not imply this integral tensor/equalizer statement. These targets are prerequisites of any assertion of positive-radius full-character integral local freeness.

**Checks.**

- `aipFiniteCharacter` for χ=1 contains invariant structural functions; a nontrivial χ has nonconstant equivariance on a split fibre. At p=2, χ(−1)=−1 is retained even though it is invisible to the W_F⁰ universal factor.
- `finiteCharacterGenerator` is 1 along σ. At a with χ(a)=−1 its value is −1; replacing σ by σa multiplies the generator by −1. A generator with χ rather than χ⁻¹ has the wrong general character relation.
- A finite-character eigenfunction upstairs can be a unit without being invariant or descending as a base scalar. Under a nontrivial change of section its transition unit is χ(a), not 1.
- `aipFullFormalCoefficient` specializes rationally to the product of the universal and finite-character lines. On the ordinary formal locus the finite factor is invertible; the same conclusion on a positive formal annulus requires `finiteCharacter_integralBaseGenerator`.
- Integrality of χ(a) and its inverse supplies translation stability but no averaging idempotent when the finite group has p-power order. This separates valuation-unit multipliers from base-local unit eigenfunctions.

**Finite-factor checks.**

- `aipFiniteCharacter` has integral constant 1 for χ=1 and the nontrivial sign relation for χ(−1)=−1. A rational character projector with a p-denominator is excluded from the integral construction.
- The rational `aipFiniteCharacter` pulls back to a line on a split analytic Igusa torsor. Its integral intersection is formed using geometric O⁺; no nonflat integral tensor interchange is part of this test.
- `finiteCharacterGenerator` takes value 1 at σ and χ(a)⁻¹ at σa. For a third root ζ≠ζ⁻¹ this distinguishes the inverse character, unlike a sign-only test.
- Changing σ to σa multiplies `finiteCharacterGenerator` by χ(a), and changing back multiplies by χ(a)⁻¹. The full overlap relation, rather than only one subgroup's d-entry formula, is required for descent.
- `aipFullFormalCoefficient` at trivial finite character recovers the universal formal line. At trivial universal character it retains the finite formal factor; rationally both products are invertible.
- On the ordinary locus `aipFullFormalCoefficient` is formally invertible. On a positive formal annulus its coherence and rational invertibility do not by themselves imply integral freeness: that conclusion requires the named integral coboundary and model comparison.
- Model countercheck for the base-generator claim: on |p|≤|T|≤1 the cover y²=T with its sign character splits after pullback to itself and has a unit-valued eigenfunction on the split fibre. Its descended integral sign line requires the bound |a|·|T|^(1/2)≤1 on sections ay. Near a point of irrational radius, invertible base functions have local norm |c||T|ᵏ, k integral, so none is a unit eigengenerator of exactly this bound. Freeness after a splitting cover does not give the needed base-local O⁺ generator.

### 5.4 Perfectoid–AIP coefficient comparisons

Prove `geometricAip_comparison`: evaluation on the supplied Hodge–Tate lift gives an isomorphism from the independently constructed AIP analytic coefficient to the geometric Hilbert coefficient. Prove `geometricAip_integralComparison` for their geometric O⁺ eigenfunction lattices by reflecting bounds on every valued point of the actual frame torsor and using full Čech descent. Both directions must preserve the pointwise bound; a rational line isomorphism alone is insufficient. This integral equalizer comparison does not assert the stronger formal-model local-freeness target of §5.3.

Require the actual T5 common range ε≤p^(−(m+1)) and all the other character/canonical bounds, with scaled AL_n at finite level, AL₁ at n=0 and structural pullback at infinite level. For example, at p=5,m=1 the comparison bound 1/25 is stronger than the period bound 1/10. Identify the ratio of actual lifts through the open embedding into the modified differential bundle; its factor is cz+d. Source: BHW Theorem 7.14, pp.1764–1765, with the integral proof's torsor and valuation inputs spelled out; T5 §5.8 supplies the lift and the corrected character index.

Prove `arithmeticAip_comparison` by the independent finite Δ(N)-descent and the Weil-pairing comparison of Layer 4, rather than defining arithmetic AIP coefficients by the desired isomorphism. In the AIP arithmetic notation use ν_AIP=w and its norm variable w_AIP=t⁻¹, so its geometric weight is exactly κ. Prove `aipComparison_natural`: all comparisons commute with admissible radius, finite/infinite level and bounded weight pullback, with integral pullback only under its stated conditions. Prove uniqueness among coefficient maps compatible with the actual frame evaluation and descent. Sources: BHW Definition 9.11 and Theorem 9.12, pp.1787–1788.

### 5.5 Frobenius and restriction

Prove `aipFrobenius_restriction` on the actual formal models: if i:M_(r+1)→M_r is the inclusion and φ is the canonical-subgroup quotient Frobenius map, there is an isomorphism i*ω^κ_un≃φ*ω^κ_un, compatible with the specified model, weights and iterates. This is AIP-adic Theorem 6.7(3), p.29, constructed in §6.2, p.27, from Proposition 4.8, p.19. The map on modified differential frames is induced by the quotient isogeny and sends the source frame to p times its image in the quotient differential module, in the source's convention. It is not an identification by the literal identity on differentials, nor a statement equating two numerical radii. Prove `aipFrobenius_iterate`, `aipFrobenius_weightMap` and compatibility with the analytic coefficient comparison in their common admitted range. Integral compatibility is relative to the modified lattices and actual isogeny map.

### Examples

At an algebraic weight the comparison evaluates a homogeneous function on a genuine differential frame, giving the expected Hodge tensor. At a finite torsion weight, a split Igusa generator takes root-of-unity values and is a unit upstairs, but its changes of section must still be descended. The full-character comparison and full-character integral local freeness therefore have different proof requirements. Frobenius compatibility tracks the isogeny frame map; it does not remove this distinction.

### Dependencies

Layers 0–4; T5's actual modified lattice, torsor and Hodge–Tate lift; AIP character charts and finite normalized Igusa cover; all-open descent and valued-point bounds. Formal positive-radius integral local freeness additionally requires the two named integral-generator/model-comparison targets.

## Layer 6: cusps, expansions and compact Hecke operators

### 6.1 Cuspidality and analytic-family Koecher extension

On the toroidal admitted domain with boundary D, define `hilbertCuspSheaf κ` as ω^κ⊗I_D, with the supplied subcanonical interpretation when D is an effective Cartier divisor. Define `fixedRadiusHilbertCuspForms` as its H⁰ and `overconvergentHilbertCuspForms` as its positive-radius colimit. Define integral variants using the actual integral coefficient lattice and its boundary ideal. The API `hilbertCuspSheaf.inclusion`, `cuspForms_boundaryKernel`, `cuspForms_radiusMap`, `cuspForms_weightMap` and `cuspForms_classDescent` must retain the domain and arithmetic transport. At a boundary divisor the cusp condition is vanishing, rather than merely extension across the boundary. Sources: AIP-cusp §§3.5–3.6, pp.18–21; AIP-adic §8.3, pp.35–36. The classical subcanonical bundle itself is supplied by AutomorphicBundles B3.

**Checks.**

- `hilbertCuspSheaf` at trivial weight is I_D, not O. If D is nonempty, the constant section 1 is not cuspidal; if D is empty, cusp and ordinary coefficient sheaves agree.
- `fixedRadiusHilbertCuspForms` is the kernel of boundary `restriction`, contains zero, and maps into the corresponding full form module. For a local boundary parameter q, q is cuspidal whereas 1+q is not.
- `overconvergentHilbertCuspForms` has positive-radius representatives and identifies eventual equalities. A section only on the ordinary locus is not a colimit representative. Integral cuspidality is preserved by admitted `restriction` without first dividing by p.

Prove `hilbertFamily_Koecher` for d>1: on the admitted Hilbert family, deleting the cusps from the toroidal model does not change the full coefficient sections. Reduce near the boundary to ordinary finite Igusa structural functions, use the normal arithmetic minimal model and its codimension-at-least-two missing locus, then pass through torsion levels, formal completion and the coefficient equalizer. This supplies the analytic-weight and p-level adapter; the classical B5 Koecher principle by itself is not that adapter. Source: AIP-adic Proposition 8.4 and proof, pp.36–37. The proof requires normality of the actual finite Igusa rings and the correct codimension after their finite map, not only a codimension statement on the base. At d=1, punctured-disc functions can have poles and no such unrestricted extension is asserted. Koecher extension does not say that the extended section vanishes at the cusps.

**Further cuspidal checks.**

- For `hilbertCuspSheaf`, changing the boundary ideal from (q) to (q²) changes the local sheaf: q is in the first and not the second. Omitting the boundary ideal gives the full coefficient sheaf instead.
- A local algebraic coefficient frame identifies `hilbertCuspSheaf` with that frame times I_D. Rescaling the frame by a unit preserves the vanishing condition, while a meromorphic boundary factor changes it.
- For `fixedRadiusHilbertCuspForms`, at empty boundary its module equals the full section module; at nonempty boundary the constant section at trivial weight is excluded. Boundary `restriction` detects the constant term on the Tate chart.
- Restriction of `fixedRadiusHilbertCuspForms` to a smaller admitted radius preserves the boundary kernel and its weight action. At a nontrivial coefficient the boundary value lies in its coefficient line, rather than in an arbitrarily identified scalar ring.
- For `overconvergentHilbertCuspForms`, restrictions of q times a local frame have the same colimit class. Representatives becoming equal after further positive-radius `restriction` are identified without requiring equality on the larger domain.
- A compatible ordinary cuspidal section without any positive-radius extension is not in `overconvergentHilbertCuspForms` by definition. On a constant zero system the colimit is zero; the colimit condition adds no ordinary-only representatives.
- The integral `hilbertCuspSheaf` is the intersection of rational cuspidality with the specified lattice. On a trivial frame q is integral, whereas p⁻¹q need not be; integral vanishing alone does not bound coefficients.
- The integral `fixedRadiusHilbertCuspForms` contains zero and maps injectively to rational forms on a torsion-free model. Reduction modulo p may kill a nonzero p-multiple, so reduction is not this injection.
- The integral `overconvergentHilbertCuspForms` is formed before rationalization; q and its positive-radius restrictions agree in it. A rational section with no integral representative is not inserted merely because it is cuspidal.

### 6.2 Integral boundary vanishing and its coefficient consequence

Prove `hilbertCusp_torsionHigherVanishing`: for the arithmetic Hilbert toroidal-to-minimal map ρ, boundary D and a torsion invertible sheaf L on the arithmetic toroidal model, R^iρ_*(L(−D))=0 for all i>0. Here torsion means L^e≃O for some positive e; e need not be prime to p. Include the formal completions and admissible models used near ordinary cusps. Away from the cusps the map is an isomorphism, so the issue is precisely the arithmetic toric boundary quotient. Source: AIP-adic proof of Theorem 8.2, p.35, which explicitly extends the trivial-line toric vanishing of AIP-cusp Proposition 6.4, pp.32–33, to torsion invertible sheaves.

The proof is not generic acyclicity of a positive-unit group. On the toric chart choose the positive U-invariant support function h, with ample divisor D_h=−Σa_ρD_ρ. For an integer ℓ larger than all a_ρ, floor(D_h/ℓ)=−D. The finite flat power map has a U-equivariant monomial splitting, independent of division by ℓ, which injects boundary-twisted cohomology as a direct summand of cohomology with an ample twist. Descend the splitting to the formal quotient and increase the ample twist to apply Serre vanishing. For torsion L choose a power compatible with its finite order and carry its transition data through this splitting. The monomial splitting, rather than a trace divided by ℓ, is essential in characteristic p. Sources: AIP-cusp Proposition 6.2, Lemma 6.3 and Proposition 6.4, pp.32–33; AIP-adic Theorem 8.2, pp.35–36.

Prove `cuspidalCoefficient_pushforwardVanishing` on the actual AIP formal map and finite Igusa level: for the small character, reduce modulo p where the admitted small analytic character is trivial, apply structural boundary vanishing, and use p-torsion-freeness, compatible completion and formal functions to obtain R^qρ_*Ω^κ(−D)=0 for q>0. For a full universal arithmetic weight use the semi-local completed weight algebra and reduction at its maximal ideals, where the residual character gives a torsion line, as in AIP-adic Theorem 8.2. This retains every cohomological degree. Finite component descent after inverting p is exact, while an integral argument must use the actual finite torsor/model; it cannot divide by a p-power group order. Sources: AIP-cusp Theorem 3.17, Proposition 3.20 and the proof of Proposition 3.22, pp.18–21; AIP-adic Theorem 8.2, pp.35–36.

**Checks.**

- For the identity toroidal-to-minimal map, e.g. the smooth genus-one boundary model, higher direct images vanish for the elementary reason that the map is the identity. This is compatible with, but does not prove, the higher-dimensional target.
- The trivial line L=O is included, as is a torsion line of order p. A proof using division by that order fails the latter case.
- In residue characteristic 2, a toric power map of even degree still has the monomial direct-summand map; a normalized trace by its degree does not exist. No equal-characteristic analytic Q_p-family theorem is claimed: the characteristic-p calculation is an input on the special fibre.

### 6.3 Tame Hecke correspondences with their actual degrees

For an integral ideal a prime to pN, use the actual cyclic a-isogeny correspondence from polarization ca to c. Define `tameHilbertHecke a` by

```text
H⁰(X_ca,ω^κ) --π₂*--> H⁰(C_a,π₂*ω^κ)
  --θ_a--> H⁰(C_a,π₁*ω^κ) --(1/q_a)Tr_π₁--> H⁰(X_c,ω^κ),
q_a = |O_F/a|.
```

The coefficient map θ_a is in the displayed direction, supplied by the actual prime-to-p isogeny and Hodge–Tate diagram. Prove `tameHilbertHecke.integral`, `cusp`, `radius`, `weight`, `level` and `classTransport`. The integer q_a is a p-adic unit, so this normalization preserves the integral lattice. Source: BHW Lemma 10.1 and Definition 10.2, pp.1788–1789. Compatibility across class representatives uses Layer 4 rather than an arbitrary identification of polarization modules.

Prove `tameHilbertHecke_constant`: at trivial weight the constant 1 is multiplied by deg(π₁)/q_a. For a prime ideal l this degree is q_l+1. For general a, count primitive rank-one direct summands of (O_F/a)²; its degree is |P¹(O_F/a)|. For a=∏l^e this is ∏q_l^(e−1)(q_l+1), with empty product 1 at a=O_F. The counting statement is an elementary finite-local-ring calculation attached to this correspondence. Thus the prime-ideal formula is not asserted for composite ideals. The normalization remains 1/q_a in all cases.

**Checks.**

- `tameHilbertHecke` at the unit ideal is the identity: degree and q are both 1. Substituting q+1 here would incorrectly multiply by 2.
- At a prime of norm q=2 away from p, the trivial-weight constant goes to 3/2. Normalizing by the degree would instead give 1.
- At a=l² of residue norm q, degree is q²+q and q_a=q²; the constant becomes 1+1/q, not 1+1/q². This retains the general-ideal definition while testing its actual correspondence.
- The coefficient is pulled from ca to the correspondence, then transported toward π₁ and traced to c. Reversing θ_a changes the type and does not give this operator.

### 6.4 Wild Hecke correspondences and diamonds

For a prime ideal pfr above p, put q_pfr=|O_F/pfr|, e_pfr=v_pfr(p), and n≥1. Use the actual level l=ne_pfr+1 correspondence recording an anticanonical D with D[pfr^(ne_pfr)]=C[pfr^(ne_pfr)]. Define `wildHilbertHecke pfr` by q_pfr⁻¹Tr_π₁ θ_pfr π₂*, where π₁ has degree q_pfr and θ_pfr:π₂*ω^κ→π₁*ω^κ is induced by u_ϖ=diag(ϖ,1) in the tower action. Prove `wildCoefficientMap.integral`, `uniformizerIndependent`, and compatibility with the actual conjugation j(γ)=u_ϖγu_ϖ⁻¹ and coordinate z↦ϖz. For γ=[a,b;c,d], this is j(γ)=[a,ϖb;ϖ⁻¹c,d], so its denominator at ϖz is again cz+d. Compute this conjugation after inverting p; its restriction lands in the stated integral level group because c is divisible by ϖ. Sources: BHW Lemma 10.3 and Definition 10.4, pp.1789–1790.

For the algebraic denominator used by `hilbertFactor`, define `HilbertAutomorphy.lowerFactor γ z=γ₁₀z+γ₁₁` on two-by-two matrices over a commutative ring R. Its APIs `lowerFactor_one`, `lowerFactor_diagonal` and `wild_factor_conjugation` retain the coordinate and the lower row. For the last identity let ϖ∈Rˣ: `lowerFactor (diag(ϖ,1) γ diag(ϖ⁻¹,1)) (ϖz)=lowerFactor γ z`. In the geometric application R is the generic-fibre coefficient algebra, in which a local uniformizer is invertible; it is not a unit in the integral local ring. This polynomial-coordinate identity is the normalization in the proof of BHW Lemma 10.3, p.1790, before applying κ.

**Denominator checks.**

- The identity and every upper unipotent have `lowerFactor` equal to 1; diag(a,d) gives d for every z. Substituting the determinant would give ad instead.
- A lower unipotent [1,0;c,1] gives 1+cz. At c=25,z=5 it gives 126, detecting loss of the coordinate term.
- Over ℚ₅, with ϖ=5 and γ=[1,0;25,1], the correct conjugation gives [1,0;5,1] and the new coordinate 25, hence 126. Reversing the conjugation gives [1,0;125,1] and denominator 3126. The original and transformed denominators are units, so this discrepancy persists on integral coefficient eigenfunctions.

Prove `wildHilbertHecke.partialRadiusImprovement`: π₂ improves the relevant partial Hasse bounds in the source's permitted range. It need not improve every p-place's bound. Prove compatibility with radius, weight, arithmetic class transport and cusps. At tame level n=0 construct the corresponding map only via the admitted AL transport; it is not the above n≥1 correspondence with n deleted. At infinite level construct the functorial coefficient correspondence, without claiming the finite-level Banach compactness theorem. Sources: BHW §10.2–§10.4, pp.1789–1792; AIP-cusp Corollaries 3.25–3.26, pp.21–22.

Define `hilbertDiamond` from the actual tame-level automorphism and its inverse coefficient pullback in the supplied classical Hecke convention. Prove `hilbertDiamond.one`, `mul`, `inv`, `cuspStable` and `coefficientComparison`. This is distinct from multiplying a polarization by a totally positive global unit and distinct from central representative cancellation. Sources: the level/Hecke functoriality of AutomorphicBundles B5; AIP-cusp §§3.7–4.1, pp.21–24, applies that functoriality to these coefficients. The action is specified on the actual level moduli, not on an arbitrary abstract group named a diamond group.

**Checks.**

- `wildHilbertHecke` sends 1 to 1 at trivial coefficient weight, because π₁ has degree q_pfr and the coefficient map is the identity on constants. The integral map before dividing by q_pfr is not the normalized rational operator.
- For F=ℚ the quotient correspondence takes radius ε to ε/p. For several p-places, one partial operator need not improve the other coordinates.
- At a totally ramified p-place, the extra level is ne+1, not n+1 unless e=1. A unit multiple of ϖ gives the same descended coefficient map after its specified transport.
- `hilbertDiamond` at the identity is the identity, a unit followed by its inverse gives the identity, and a nontrivial nebentype section has its prescribed character value. A pure global polarization change is not declared the same tame-level automorphism.

Prove `aipComparison_HeckeEquivariant` for tame, wild and tame-level automorphism correspondences, using the independently defined operators and the same coefficient-map directions and trace constants. Prove that it preserves integral renormalized operators and boundary ideals. Source: BHW Proposition 10.8, pp.1791–1792. Rational equivariance is not a proof that unnormalized wild U preserves the lattice.

**Further diamond checks.**

- For `hilbertDiamond`, the coefficient multiplier is the inverse pullback prescribed by the actual level automorphism. A primitive nebentype of order three distinguishes a character value from its inverse, whereas a sign-only example does not.
- Composing two `hilbertDiamond` maps gives the map for the product of the actual tame-level automorphisms, preserving both the coefficient lattice and boundary ideal. A global polarization unit has a different moduli action and cannot be substituted for such an automorphism.

### 6.5 Family Fourier expansions and their comparison

For each admitted unramified cusp c, choose a toroidal/Tate uniformization, an Igusa generator and the finite-character trivialization on the cover where it exists. Define `familyHilbertQExpansion c` by evaluation of the actual coefficient section on that Tate object. Its values lie in the completed positive-exponent series module with cusp exponent lattice M_c and coefficient line D_c^κ; a scalar series is obtained only after trivializing this line. Impose the usual support condition relative to a cone, and the positive-unit equivariance on exponents and on D_c^κ. Prove `familyQExpansion_changeFrame`, `radius`, `level`, `weight`, and `algebraicSpecialisation`, and independence of the fan after common refinement. The algebraic specialization agrees with the supplied classical expansion, with arithmetic parameters ν=w and w_AIP=t⁻¹. Source: AIP-adic §8.4, pp.36–37, ordinary Katz–Hida restriction and expansions, together with the classical expansion of AutomorphicBundles B5. The construction on the p-level analytic family is a target here; an assertion about algebraic weights alone does not supply it.

Prove `familyQExpansion_injective` under the following explicit coverage hypotheses: chosen cusp lifts meet every connected ordinary component at the actual finite Igusa level, the relevant analytic coefficient components are normal, and their ordinary loci are dense. Vanishing of all these expansions forces the section to vanish. The proof uses the finite Igusa componentwise expansion theorem, completed character descent, and analytic continuation from the dense ordinary locus. Prove `familyQExpansion_cusp_iff`: with the same component coverage and all relevant boundary cusps, all constant terms vanish precisely for cusp forms. Prove `aipComparison_qExpansion`: evaluation under the independent comparison gives the same coefficient-line-valued expansion, including the finite character and pairing twist. Source: AIP-adic Proposition 8.4 and the following paragraph, p.37, supplemented by the stated componentwise extension of the classical principle. Counting connected components only on the base is not sufficient to assert coverage at an Igusa cover.

**Checks.**

- `familyHilbertQExpansion` of 1 at trivial weight is 1; of a local q-parameter is q. Their constant terms distinguish full and cusp forms.
- Replacing a chosen frame by λ changes the coefficient coordinate by κ(λ)⁻¹. At κ=x,p=5,λ=2 this is 1/2. An intrinsic scalar-valued expansion without a coefficient-line choice would fail this transformation.
- At an algebraic weight the expansion specializes to the classical one, while a finite-character twist changes its Igusa transformation. Omitting that finite factor gives the wrong family even if the algebraic powers agree.
- If cusp lifts miss a connected Igusa component, the stated injectivity proof cannot detect functions supported on that component. This identifies a missing coverage hypothesis; it is not a claim that every such function is automatically a section of the chosen weight equalizer.

### 6.6 Cuspidal Banach modules and compact restrictions

For an admissible open affinoid U in arithmetic weight space, a common analytic character stage n_an, finite wild level, and sufficiently small positive partial Hasse radii 0<v_i<1/p^(n_an), construct `hilbertCuspBanach U v`. Use cofinal global-Hasse minimal affinoid neighborhoods inside the partial-Hasse region, with the actual toroidal pushforward of the cuspidal coefficient. Prove `hilbertCuspBanach.propertyPr` and `hilbertCuspBanach.specialisationSurjective` at coefficient-field points. Property (Pr) means a continuous direct summand of an orthonormalizable Banach module, not finite projectivity as an algebraic module. Sources: AIP-cusp Propositions 3.21–3.24, pp.20–21, and Theorem 4.4, p.24; AIP-adic Corollary 8.3, p.36. The use of a global-Hasse affinoid neighborhood is essential: the footnote to the proof of Proposition 3.22 does not establish that every partial-Hasse region is affinoid.

Prove `hilbertCuspBanach_weightBaseChange` for a bounded family obtained by completed extension from such a weight affinoid, under flatness or the specific cohomology/base-change hypotheses guaranteeing that the Čech resolution and cuspidal pushforward commute with that extension. This is the additional adapter needed for an arbitrary smooth bounded weight map; pointwise specialisation or property (Pr) alone does not give all base changes.

Define `cuspRadiusRestriction` from the wider positive neighborhood to a strictly contained cofinal neighborhood, retaining relative compactness over U. Prove `cuspRadiusRestriction_completelyContinuous` by local analytic restriction, finite-rank approximation and the finite coherent pushforward, then by passing to its Banach direct summand. Its API has identity/composition maps, coefficient specialization and compatibility with cuspidal Hecke maps. Sources: AIP-cusp Proposition 3.24 and Corollary 3.27, pp.21–22; the local analytic restriction theorem is supplied by LocallyAnalyticDistributions. Source and target must both be the finite-level positive-radius Banach modules just constructed.

**Checks.**

- `hilbertCuspBanach` over a point is the usual cuspidal Banach space, and its zero subspace is allowed. Property (Pr) permits infinitely many orthonormal coordinates; it is not the assertion of finite dimension.
- A field-point specialization is surjective under the cohomological hypotheses. A nonflat integral specialization is not covered by this rational Banach assertion.
- `cuspRadiusRestriction` in a normalized analytic coordinate sends Σa_nT^n to Σa_nρ^nT^n for a strict contraction |ρ|<1; truncations tend to it in operator norm. At |ρ|=1, coefficient tails need not tend uniformly to zero, so the same compactness proof fails.
- Infinite wild level, ε=0 and a noncompact inclusion outside the cofinal affinoid system are not inputs to this theorem. Taking the identity radius map does not make it completely continuous on an infinite-dimensional module.

**Further Banach and restriction checks.**

- For `hilbertCuspBanach`, an orthonormalizable free module satisfies (Pr), as does its continuous direct summand. This does not mean a Banach module with a countable orthonormal basis is finite projective as an algebraic module.
- At a field-valued point of an admitted open weight affinoid, `hilbertCuspBanach` specializes onto the cusp space of that weight. An arbitrary closed weight subspace or nonflat integral reduction does not meet the stated specialization theorem.
- The zero coefficient gives zero `hilbertCuspBanach`, and the trivial coefficient with nonempty boundary still imposes the cusp condition. Replacing it by all bounded functions would admit the constant 1 and fail this test.
- For `cuspRadiusRestriction`, an identity radius change gives the identity map, but it is not asserted completely continuous on an infinite-dimensional Banach module. The compactness theorem requires strict relative containment.
- For `cuspRadiusRestriction` on a local one-variable analytic chart from radius R to r<R, the degree-j monomial has `restriction` bound (r/R)^j. The tail tends to zero, giving the finite-rank approximation; at r=R it does not.
- Two `cuspRadiusRestriction` maps compose to the direct `restriction`, preserving vanishing of the boundary constant term. The map on the full infinite wild-level section module is not covered by the finite-level Banach theorem.

### 6.7 A controlling operator and integral renormalization

Define `hilbertControllingOperator` on arithmetic class forms as the commuting product ∏_(pfr|p)U_pfr^(e_pfr), including the supplied polarization transports. Prove `controllingOperator_factorisation` through restriction from the v-neighborhood to the cofinal v/p-neighborhood followed by bounded correspondences, in the actual partial-radius order; this is the map S(v)→S(v/p)→S(v). Prove `hilbertControllingOperator_completelyContinuous` on the cusp Banach modules. Individual U_pfr need not be compact in all p-directions. Sources: AIP-cusp Corollary 3.27, p.22, Proposition 4.5, pp.24–25; BHW §10.4, pp.1791–1792. Since ∑e_pfr f_pfr=d, the product trace normalization is p^(−d). This finite-slope input is available regardless of whether an eigenvalue is ordinary.

Prove `wildHecke_renormalizedIntegral`: q_pfr U_pfr preserves the integral cusp lattice, and `controllingOperator_renormalizedIntegral`: p^d times the controlling operator preserves it, on the stated admitted domains. This is a sufficient denominator bound obtained from the integral coefficient maps and traces; no optimal bound or unrenormalized integral stability is asserted. Source: BHW Lemma 10.3 and §10.4. Ordinary projectors and slope decompositions are consumers of this input, as specified in the ownership section.

**Checks.**

- For `hilbertControllingOperator`, F=ℚ gives the usual U_p with normalization p⁻¹. A split quadratic field gives the product of its two partial operators and normalization p⁻².
- For a totally ramified extension of degree d, the product is U_pfr^d, not one copy of U_pfr, and has normalization p⁻ᵈ. This detects omitting ramification exponents.
- At weight zero the product sends 1 to 1 on full forms; on cusp forms the constant 1 is absent when the boundary is nonempty. The compactness statement uses cusp modules and a strict radius improvement, not this constant calculation.
- q_pfr U_pfr and p^d U are integral even when dividing the trace by q_pfr is not. In characteristic p the normalized division is unavailable; only the special-fibre integral maps before division can be considered.

### Examples

For a prime tame ideal of norm 2 away from p, the normalized operator on constants is 3/2. For a wild prime the corresponding degree equals the denominator, and the constant is 1. For a tame prime-square ideal the degree and norm are different again. These computations fix the normalizations before invoking compactness. The compact controlling operator uses every p-direction, while partial operators remain useful as bounded correspondences and in finite-slope data.

### Dependencies

Layers 0–5, toroidal boundary and minimal models, actual isogeny correspondences and trace maps, family cohomological vanishing and analytic restriction. The all-degree vanishing theorem, Igusa-component coverage and global-Hasse affinoid choice are required inputs to the Banach and expansion results.

## Layer 7: completed ordinary Igusa forms

### 7.1 Complete the torsion-level functions before inverting p

On each actual ordinary formal affine patch with finite Igusa levels IG_i, define `ordinaryCompletedFunctionsPlus` by the p-adically complete ring

```text
V⁺ = lim_m colim_i H⁰(IG_i, O/p^m),       V = V⁺[1/p].
```

Define `ordinaryCompletedFunctions` by the second expression, and sheafify the affine construction on the ordinary formal site. Prove `ordinaryCompletedFunctionsPlus.projection`, `complete`, `separated`, `torsionFree` in the torsion-free model setting, and `ordinaryCompletedFunctions.action`. The action and restriction maps are obtained compatibly at torsion levels before taking the limit. For a nonaffine open, use the sheaf or a compatible Čech construction; do not replace it with a global colimit identity that would require a separate acyclicity theorem. Sources: BHW §6.3, pp.1759–1760, and AIP-adic §8.4, p.37, on the ordinary Katz–Hida interpretation. The required algebraic limit operations are supplied, but this geometric sheaf/completion identification is a target here.

**Checks.**

- For `ordinaryCompletedFunctionsPlus`, a constant tower of a p-adically complete ring R gives R. Before inverting p, a tower of integral lattices is not the same object as its rational function ring.
- For the finite sets ℤ/p^iℤ, lim_m colim_i Maps(ℤ/p^iℤ,ℤ/p^mℤ) is C(ℤₚ,ℤₚ). The function x↦x is included: modulo p^m it factors through level m.
- That function does not belong to colim_i Maps(ℤ/p^iℤ,ℤₚ), since it is not locally constant. This computes the failure of interchanging the two limits.
- On a non-quasi-compact disjoint union, functions can require levels increasing from component to component. Sheafification handles this; one uniform global level need not exist.
- `ordinaryCompletedFunctions` of ℤₚ is ℚₚ, while its plus part remains ℤₚ. For a zero ring the constructions give the zero ring; no nonempty-tower multiplicity theorem is inferred in that case.

**Further completed-function checks.**

- `ordinaryCompletedFunctionsPlus` for a constant complete torsion-free ring R_i=R is R. For the tower of locally constant functions on ℤ/p^iℤ, the identity function x↦x is present after the prescribed torsion-level completion although no single integral finite stage contains it.
- Projections of `ordinaryCompletedFunctionsPlus` modulo p^m are compatible in m. An unrelated function at each precision does not define an inverse-limit element, and p-adic separatedness discards a putative element zero at every precision.
- `ordinaryCompletedFunctionsPlus` over a torsion-free model contains p as a nonzero element, while p is not invertible in its unit ball. Starting with the rational rings would make the quotients by p^m zero and fail this check.
- `ordinaryCompletedFunctions` for a constant R is R[1/p]; p has an inverse there. This distinguishes the rational object from its integral lattice, including on a one-point patch over a DVR.
- For `ordinaryCompletedFunctions`, an element has a uniformly bounded denominator p^a across its compatible completed integral data. Allowing denominators to grow with m is not its definition by localization after the inverse limit.
- The local action on `ordinaryCompletedFunctions` carries x↦x on the additive test tower to its translated function, rather than fixing every completed function as though it factored through the trivial quotient. Zero and constants transform as prescribed by that tower action.

### 7.2 Weighted ordinary equalizers

Define `ordinaryWeightedFormsPlus κ` as the κ⁻¹-equalizer for the Oₚ^× action on the completed integral sheaf, and `ordinaryWeightedForms κ` using V. Define arithmetic ordinary forms by the same independent intermediate/full arithmetic relations, finite Δ(N)-descent and Weil-pairing twist as Layer 4. Their APIs are `ordinaryWeightedForms.section_iff`, `integralInclusion`, `weightMap`, `levelMap` and `arithmeticComparison`. Weight extension and completed coefficient tensors use the actual site and integral base-change hypotheses, not an interchange of infinite equalizers with arbitrary tensor products. Sources: BHW §6.3, pp.1759–1760, and §9.1; AIP-adic §8.4, p.37.

**Checks.**

- `ordinaryWeightedFormsPlus` at κ=1 is the invariant completed integral ring, not all functions on the Igusa torsor. For a trivial torsor, evaluation at a section gives its base ring.
- For a character line, translating a chosen generator by u multiplies its coordinate by κ(u)⁻¹. At κ=x,u=2,p=5 the value is 1/2; this is the same inverse as in the positive-radius coefficient.
- A finite-character weight of conductor p^a cannot be forced into a shallower finite Igusa level before completion. The completed sheaf can realize the character through sufficiently deep stages.
- The arithmetic pairing twist survives completion. Replacing arithmetic ordinary forms by the untwisted geometric invariant ring loses the determinant character when w is nontrivial.

**Further weighted ordinary checks.**

- For `ordinaryWeightedFormsPlus`, κ=1 on a split torsor is the base bounded-function ring; the constant p⁻¹ is outside it on a nonzero bounded patch. The zero section is present at every weight.
- A translation by u with κ(u)=ζ of order three multiplies `ordinaryWeightedFormsPlus` coordinates by ζ⁻¹, detecting the inverse even when a sign test would not. Both ζ and its inverse preserve the lattice.
- For `ordinaryWeightedForms`, a split torsor and a unit character identify the rational module with the base rational functions by evaluation at the chosen section. Choosing a different section changes this trivialization by κ(u)⁻¹.
- `ordinaryWeightedForms` at κ=1 consists of descended invariant functions, whereas a nontrivial finite character requires its actual deeper Igusa-level relation. Completion does not erase that character.
- `ordinaryWeightedForms` allows p⁻¹ times an integral weighted section, but its lattice `ordinaryWeightedFormsPlus` need not contain that multiple. An arithmetic determinant twist remains in the relation on both modules after rationalization.

### 7.3 The analytic completion comparison

Prove `ordinaryIgusa_completionComparison` on each ordinary patch under explicit model hypotheses. Start with the genuine formally smooth ordinary Rapoport model over a discrete valuation base, its finite étale surjective Igusa covers and torsion-free complete rings R_i. After any extension to a nondiscrete perfectoid base, require the actual integral comparison R_i=A_i° with the power-bounded rings of the analytic generic fibres, and require the transition inclusions to be isometric. Let A∞ be the separated spectral completion of colim_i A_i with the supplied analytic infinite-tower realization. Then prove

```text
lim_m colim_i R_i/p^m  ≃  A∞°,
(lim_m colim_i R_i/p^m)[1/p]  ≃  A∞.
```

Prove `ordinaryIgusa_completionComparison.isometric`, restriction naturality and local-group equivariance, then sheafify. The proof compares the p^m neighborhoods with the spectral unit balls and proves density before completion. Neither an assertion that IG∞ is automatically perfectoid nor the generic fibre of an unspecified formal limit suffices. Sources: BHW §6.3 and its ordinary comparison discussion, pp.1759–1760; Heuer Proposition 3.8, p.15, for descent from a formal unit cocycle. The exact integral-model comparison after nondiscrete base extension is a named additional target `ordinaryIgusa_powerBoundedModel`; it is not a consequence of reducedness of a special fibre.

In particular O_(C_p)/p is not reduced: an element with valuation strictly between 0 and 1 can be nonzero modulo p and nilpotent. Thus the discrete-base criterion using a reduced special fibre cannot be applied without change after extension to O_(C_p). Prove `ordinaryWeightedLattice_modelComparison` separately for the weighted integral equalizer and any completed tensor lattice claimed to model it. This includes compatibility with finite-character generators and formal cocycle reduction modulo each p^m. Source: the hypotheses and method of Heuer Proposition 3.8, not a blanket equality between geometric O⁺ and a completed lattice tensor.

### 7.4 Restriction from positive radii

Define `ordinaryRestriction` from each fixed positive-radius form to the weighted completed ordinary functions by evaluating on the actual ordinary Igusa tower and using the completion comparison. Prove independence of the positive-radius representative, giving `overconvergent_to_ordinary`, and its integral, cuspidal, finite/infinite-level and bounded-weight compatibility. Prove `ordinaryAip_comparison` by the independent ordinary AIP formal construction, formal unit-cocycle effectivity, `ordinaryIgusa_powerBoundedModel` and `ordinaryWeightedLattice_modelComparison`. Retain the arithmetic finite-group descent and pairing throughout. Sources: BHW §6.3, pp.1759–1760; AIP-adic §8.4, p.37; Heuer Proposition 3.8, p.15. No surjectivity from all ordinary forms to positive-radius forms, no ordinary control theorem and no finite-slope classicality assertion is part of this comparison.

Prove `ordinaryRestriction_Hecke` and `ordinaryRestriction_qExpansion` for the actual normalized correspondences and coefficient-line-valued expansions of Layer 6. Include diamond and polarization transport compatibility. Evaluation and trace commute on finite correspondences, then the maps are passed through completion and the weight equalizer with their stated continuity hypotheses. A compatible diagram at each torsion level is needed; formal similarity of two formulas for U is not enough. Sources: BHW Proposition 10.8 and §6.3; AIP-adic §§8.4–8.5, pp.37–38.

**Ordinary restriction checks.**

- `ordinaryRestriction` at trivial weight is actual evaluation/`restriction` of functions on the ordinary tower and fixes the constant 1. At a nontrivial weight it retains the inverse character and does not become the untwisted `restriction` of base scalars.
- An integral section of norm at most one has `ordinaryRestriction` in the bounded weighted lattice under the stated model comparisons. Multiplication by p⁻¹ gives a rational section and need not preserve that lattice.
- Two positive-radius representatives equal after further positive `restriction` have the same `ordinaryRestriction`; thus the map factors through the colimit. A bounded ordinary function without a positive-radius extension has no preimage supplied by this assertion.

### Examples

The function x↦x on ℤₚ records information at every torsion precision but never factors through a single finite quotient as an ℤₚ-valued function. It is the basic reason to complete the torsion colimits in the displayed order. The analogous geometric statement compares the actual ordinary tower's completed functions with analytic bounded functions only after its integral models and spectral unit balls have been identified.

### Dependencies

Layers 0–6, finite ordinary Igusa covers, formal affine and Čech descent, the spectral completion of the analytic tower, and formal unit-cocycle effectivity. The power-bounded-model and weighted-lattice comparison targets are required for integral ordinary claims.

## Layer 8: Siegel and general toroidal analytic coefficients

### 8.1 Applying the supplied row chart and changing symplectic basis

Use the supplied row-graph chart over a commutative ring R, indexed by any finite set, including the empty set. For γ=[A,B;C,D], its factor and coordinate are J_γ(Z)=A+ZC and Zγ=J_γ(Z)⁻¹(B+ZD), on the unit-determinant locus. The row normalization, coordinate composition and ordered factor identity are the existing `HodgeTate.siegelGraphChart_act` and `HodgeTate.hodgeFrame_transform` contracts of PerfectoidShimuraVarieties §3.4. They are prerequisites rather than new graph-geometry targets. The identity is [I,Z]γ=J_γ(Z)[I,Zγ], and for δ=[E,F;G,H] the factor for γδ is J_γ(Z)(E+(Zγ)G), in that order. All inverse-denominator uses require unit determinants. Matrix identities over a general commutative ring use units, not a division-ring convention that treats a singular matrix as invertible.

Define `antidiagonalDualFactor W A C Z = W(A+ZC)ᵀW` over every commutative ring and finite matrix index. Prove `antidiagonalDualFactor_add` by expanding the sum, `antidiagonalDualFactor_basisChange` under the stated reversal-basis conversion, and `antidiagonal_dual_factor`, the additional convention identity for the reversal matrix W with W²=I and WZᵀW=Z:

```text
W(A+ZC)ᵀW = WAᵀW + (WCᵀW)Z.
```

The transposed lower block is before Z. It is the dual-factor dictionary, not a replacement of J by a scalar determinant. For the standard-to-antidiagonal basis change P=diag(I,W), use Z=Z_std W and (A,B,C,D)_DRW=(A,BW,WC,WDW)_std. Its factor is exactly A_std+Z_std C_std. Sources: DRW §2.3–§2.4, pp.15–17, for its form and chart convention; the corrected quotient-frame convention is supplied by PerfectoidShimuraVarieties §3.4.

**Checks.**

- At rank one W=1 and the formula is the ordinary scalar transpose identity. At rank zero all matrices and determinants have the unique empty-index values; the determinant is 1, not 0.
- With W=[0,1;1,0], Z=[0,1;0,0] and C=[0,0;3,0], WZᵀW=Z. The left side for A=I is diag(1,4), while I+Z(WCᵀW)=diag(4,1). The wrong factor order is visibly false.
- For the light `antidiagonalDualFactor`, W=0 gives zero for every A,C,Z, although W=0 is not an admissible dual-frame change unless the index is empty. For the basis conversion, (ZW)(WC)=ZC since W²=I. Omitting either W changes the factor for a noncommuting pair of matrices. The rank-one dual factor and the incorrect rank-two order are checked in `Suggested.lean`.

### 8.2 The coefficient action on a Siegel period domain

Assume g≥1, odd p, and fine tame level N≥3 prime to p. Work over C_p, retaining all Weil-pairing components of the full infinite tower. Let K be the full inverse image of the diagonal torus of GSp_(2g)(𝔽_p), so its similitude image is ℤₚ^×. This is broader than the named strict subgroup with c≡1 modulo p; a fixed-pairing fibre has only K∩ker(c) as deck group. Use the actual full-tower quotient of the supplier to form Y_w=π_HT⁻¹(Fl_w^×) and X_w=Y_w/K, w>0 rational, where each period coordinate is within p^(−w) of ℤₚ. This is a period-domain definition, independent of a canonical-subgroup theorem. A quantitative canonical/anticanonical interpretation additionally requires the actual T3 comparison, including p>2g and its range c_g+n−1<w≤n, c_g=(2g−1)p/(2g(p−1)). No uniform strict inequality follows just by replacing pointwise bounds on a non-quasi-compact domain by their supremum. Sources: DRW Definition 2.5.3, p.19; supplier §§1.30,3.4 and T3's quantitative Siegel comparison.

Prove `siegelFactor_neighbourhood`: for Z=Z₀+E, Z₀ integral, ‖E‖≤p^(−w), and γ∈K, put J₀=A+Z₀C. Then J₀∈I⁺_GLg, C∈p Mat_g(ℤₚ), and

```text
‖J−J₀‖ ≤ p^(−(w+1)),         J ∈ I⁺_GLg M_(w+1).
```

Both the factor and its transpose inverse lie in the acting neighborhood of the normalized coefficient module. Prove the corresponding analytic bound on each chart and integral determinant unit property. The estimate follows from J−J₀=EC and the strict-Iwahori block congruences, and is stronger than merely saying det J is a unit. Sources: DRW §2.1, pp.7–9, Definition 2.5.3, p.19, and Remark 3.1.15, p.25. The approximation Z₀ need not itself be a Lagrangian point: it is only used for this norm estimate.

Use the supplier's quotient Hodge frame s of O^(2g)/W_std≃ω_(A∨)≃ω_A, with γ*s=sJ. Its natural transport to W_std∨ is instead a frame of ω_A(−1) with factor c(γ)⁻¹J. The variable pairing generator transforms by c(γ) and restores the untwisted quotient-frame law only when it is included. Fixing a system of roots of unity in the coefficient field does not make the full tower action preserve that pairing generator. The frame itself, its transform and the distinction between these two linearizations are supplied by §3.4, not reproved here.

### 8.3 Scalar and finite algebraic coefficients

Define `siegelScalarCoefficient χ w` as the equalizer of analytic scalar functions on Y_w with γ*f=χ(det J_γ)⁻¹f, where χ has a specified local analytic extension on all occurring determinant factors. Define its geometric O⁺ equalizer with the two-sided valuation-unit condition. The API `siegelScalarCoefficient.section_iff`, `radiusMap`, `weightMap` and `integralInclusion` follows Layer 1 with the actual determinant factor. Prove `siegelDeterminantHodge_specialisation`: at χ=x^m, m∈ℤ, the rational line is (det ω)^m on X_w, with negative m interpreted by the dual line. Indeed det s transforms by det J and f(det s)^m is invariant. This applies the supplied Hodge frame; it does not introduce a second frame transformation theorem. Sources: DRW equation (5), p.20, and §3.1, pp.23–25; the quotient-frame correction is in the supplier contract.

Define `siegelAlgebraicCoefficient ρ w` using an actual finite algebraic representation ρ of the Hodge Levi and its right frame torsor, with relation (qg,v)∼(q,ρ(g)v) and f(qg)=ρ(g)⁻¹f(q). Prove `siegelAlgebraicCoefficient_comparison` with the supplied classical automorphic bundle, retaining every extra Levi/similitude character. Tensor, dual and restriction compatibility are comparison theorems for these two constructions, not new general vector-bundle operations. Sources: AutomorphicBundles B2–B4 and DRW §3.1, pp.23–25; the factor convention is the displayed relation.

**Checks.**

- `siegelScalarCoefficient` at χ=1 is structural-function descent. At χ=x and det J=6, the coefficient multiplier is 1/6; the determinant frame multiplies by 6 and their product is invariant.
- At m=−1 the coefficient multiplier is det J, and its bundle is (det ω)⁻¹. Replacing m by −m would exchange this check with the previous one.
- `siegelAlgebraicCoefficient` at rank zero is the zero bundle; at the trivial line it is O. A rank-two diagonal representation keeps two characters, while its determinant line keeps only their product.
- For γ=diag(I,uI), c(γ)=u and J=I. The quotient frame is fixed, but the naturally linearized W∨ frame changes by u⁻¹. Treating a fixed Tate trivialization as equivariant under all K fails when u≠1.

**Further finite algebraic coefficient checks.**

- For `siegelAlgebraicCoefficient`, a character χ of the determinant gives its determinant line, while a representation with an additional similitude character also keeps that character. The element diag(I,uI) distinguishes the extra character although J=I.
- For `siegelAlgebraicCoefficient`, tensoring a character line and its dual gives the trivial line. The standard rank-g Levi representation remains rank g; replacing it by its determinant would fail this rank test for g≥2.
- A finite algebraic `siegelAlgebraicCoefficient` has no unbounded collection of unipotent power-series basis vectors. The larger induced analytic representation does; confusing the finite bundle with the full induced sheaf fails the algebraic comparison.

### 8.4 The determinant eigenline and induced analytic sheaf

On existing algebraic carriers define `determinantLineMap χ` by the S-linear map S→(GL_g(R)→S), a↦[ℓ↦aχ(det ℓ)], for commutative rings R,S and a character R^×→S^×. Prove `determinantLineMap_injective` by evaluation at I, and `determinantLineMap_translation` by evaluating at hᵀℓ: it multiplies this line by χ(det h). The global algebraic formula is valid only when χ is defined on R^×; the analytic geometric use evaluates the same formula on the actual Iwahori neighborhood with its local χ extension. It does not assume every local weight extends to all GL_g(C_p). Sources: DRW §3.1, pp.23–25, and the determinant/Borel relation; determinant multiplicativity itself is supplied by Mathlib.

**Checks.**

- The trivial χ gives the constant function a. Evaluation at I returns a for every χ, including the zero scalar a=0, and proves injectivity without any nonvanishing hypothesis on a.
- With R=S=ℚ and χ the identity, diag(2,3) gives determinant-line value 6 at a=1. A product of diagonal characters with the wrong exponent gives a different value.
- An upper-unipotent matrix [1,7;0,1] has determinant 1 and value a. This distinguishes the determinant character from an individual matrix entry.

For a bounded smooth family of r-analytic diagonal-torus characters κ, rational w>1+r, define `siegelAnalyticSheaf κ w` from the normalized coefficient Cκ,w on IM_(w+1), its transpose action, the actual cover Y_w→X_w, and γ*F=ρ_D(J_γ)⁻¹F. Define `siegelIntegralAnalyticSheaf` with the chartwise Gauss lattice. The APIs `siegelAnalyticSheaf.restrictRadius`, `changeWeight`, `coefficientMap` and `integralInclusion` use the all-open completed coefficient descent from Layer 1. The quantitative factor bound of §8.2 places every J_γ in the required acting group; there is no arbitrary shrink to an unrelated smaller coefficient module. Sources: DRW Definition 3.1.10, Definition 3.1.13 and Definition 3.1.14, pp.23–25.

Prove `siegelDeterminantLine_injective`: for κ=χ∘det, the determinant formula gives a rank-one subobject identified with `siegelScalarCoefficient`, not the entire induced sheaf in genus at least two. Prove `siegelAlgebraicInduction_injective` for dominant polynomial k₁≥⋯≥k_g≥0 by the supplied algebraic representation and the dictionary κ_BP=w₀(κ_D⁻¹), ρ_D(h)=ρ_BP(h^(−T)). This embeds the finite classical coefficient in the analytic coefficient on the same admitted domain. Determinant powers (m,…,m), m≥0, are special cases; negative determinant powers already belong to the finite line comparison and are not asserted polynomial. Sources: DRW §3.1 and BP §6.2.11, pp.150–151; finite algebraic coefficient conventions are supplied by AutomorphicBundles B2.

**Checks.**

- `siegelAnalyticSheaf` at g=1 is the corresponding character line. At g=2 its coefficient has a nonconstant unipotent variable, so the determinant eigenline cannot exhaust it.
- `siegelIntegralAnalyticSheaf` uses the Gauss unit ball; a rational-point integral-valued polynomial such as (T^p−T)/p is not automatically in it. The transpose action preserves this lattice by the exact neighborhood theorem.
- The trivial-weight induced sheaf still has analytic unipotent functions in higher rank; it is not identified with O merely because its Borel weight is trivial. Its determinant-line subobject is O.
- At an algebraic polynomial weight, the finite-dimensional subrepresentation has bounded polynomial degree; a higher-degree analytic monomial lies outside it. A negative determinant exponent uses a dual line instead of the polynomial-injection theorem.

**Further analytic-sheaf lattice checks.**

- `siegelIntegralAnalyticSheaf` contains the Gauss-integral monomials in a normalized opposite-unipotent coordinate. On a unit normalized disc it excludes p⁻¹ and (T^p−T)/p; testing only ℤₚ-valued rational points would admit the latter incorrectly.
- Under `restriction` to a strictly smaller admitted normalized disc, `siegelIntegralAnalyticSheaf` preserves its Gauss unit ball. An action outside the proved factor neighborhood is not granted lattice stability merely from a unit determinant.
- The determinant line in `siegelIntegralAnalyticSheaf` is integral when its character and inverse take unit values on every acting factor. A rational determinant eigenfunction multiplied by p⁻¹ is not an integral unit frame.

### 8.5 Atkin–Lehner and the other graph chart

Prove `atkin_lehner_chart` over every commutative ring R, for a scalar q and a finite matrix index:

```text
[I,Z] [0,I;−qI,0] = [−qZ,I].
```

This is an identity into the second row-graph chart. It does not require Z to be invertible and does not introduce Z⁻¹. The block matrix is invertible when q is a unit; at q=p it is invertible over ℚₚ but not over ℤₚ. Construct `siegelAtkinLehner_coefficientTransport` only after the actual tower correspondence and both chart domains have been supplied, using this chart change and the relevant torsor frame map. Source: DRW Remark 3.6.2, p.43; the displayed block multiplication fixes the sign and domain. A matrix identity alone is not a geometric domain or canonical-subgroup comparison.

**Checks.**

- At g=1,q=2,Z=3, the row is [−6,1], fixing both the sign and the second-chart orientation.
- At Z=0 the row is [0,I], a valid second-chart point even though Z has no inverse. At q=0 the algebraic identity still holds, but it gives no invertible tower action.
- In characteristic 2 the minus sign equals plus, while over ℚ it is distinguished by the preceding computation. At rank zero the formula has the unique empty row-matrix interpretation.

### 8.6 General toroidal and datum-specific analytic coefficients

For a general Shimura datum (G,X), neat level, smooth admissible cone decomposition Σ and a finite splitting field containing the reflex field, use the toroidal tower diamond and the G^c- and Levi M_μ^c-torsors supplied in PerfectoidShimuraVarieties §6.3. Define `toroidalAnalyticCoefficient` on a specified v/pro-Kummer-étale coefficient site by pulling the actual Hodge–Tate torsor to its supplied analytic reduction and applying an analytic representation of that reduction. Its API `toroidalCoefficient.section_iff`, `coefficientMap`, `radiusRestriction`, `levelPullback` and `commonRefinement` retains G^c, the opposite Hodge/de Rham parabolics and the site. At finite level assert descent only in the effectivity category actually established: finite locally free coefficients, a locally trivial analytic Banach torsor, or an explicitly proved Banach-descent setting. A general infinite-rank equalizer is not asserted coherent. Sources: BP Theorem 4.4.40, pp.79–80, and §6.3.1, p.153; the geometric torsors are supplied, while their analytic representation sheaves are the target here.

Prove `toroidalAlgebraicCoefficient_comparison` for a finite algebraic Levi representation by comparing with the supplied canonical toroidal bundle through the Hodge–Tate/de Rham torsor identification. On the μ-central weight-j summand retain the cyclotomic factor ℚₚ(j) in the supplier's orientation: the comparison of graded local-system and de Rham pieces is Gr_j(W_p⊗Ô)(j)≃Gr^j(W_dR)⊗Ô. Apply that convention to associated bundles, rather than delete the factor after choosing roots of unity. Prove compatibility with tensor products, duals, canonical extension and level/common-cone-refinement correspondences. General G(ℚₚ) Hecke maps compare levels and cone refinements; they do not act on every fixed toroidal Σ. Sources: BP Theorem 4.4.40 and its preceding comparison, pp.79–80; T6 and AutomorphicBundles supply the general period and canonical bundles.

Define `reducedDomainCoefficient` on any supplied datum-specific period domain with an actual analytic reduction H and representation V by this same coefficient construction. Prove `reducedDomainCoefficient.section_iff`, `changeRepresentation`, `pullback`, `changeReduction` and `algebraicComparison` on compatible torsor diagrams. Prove its identification with the finite algebraic automorphic bundle whenever V extends to the Levi representation and the Hodge–Tate/de Rham twist is supplied. This gives, for example, unitary period-domain coefficients when their actual reduction and domain have been constructed. It does not assert a canonical ordinary neighborhood or canonical subgroup for every Shimura datum. Sources: BP §4.4.38–§4.4.40, pp.79–80, and §6.3.1, p.153.

**Checks.**

- `toroidalAnalyticCoefficient` of a trivial finite line is O on the specified site; of the zero representation it is zero. A nontrivial μ-central character retains its Tate twist in the algebraic comparison.
- `reducedDomainCoefficient` on an identity torsor is the supplied coefficient-function sheaf, and on a split H-torsor is recovered by evaluation at the identity section. An arbitrary Banach representation without a stated analytic action/effectivity theorem does not supply a coherent finite-level bundle.
- A general Shimura datum without a known perfectoid representative still has the supplied tower diamond. Replacing the diamond by an assumed perfectoid space would make this general instance unavailable.
- A Hecke element requiring a new cone decomposition is handled after common refinement, not by an asserted automorphism of the original fixed toroidal compactification.

**Further toroidal coefficient checks.**

- `toroidalAnalyticCoefficient` of a rank-two diagonal algebraic representation retains its two character lines and their separate central weights. Its determinant is only a rank-one coefficient and cannot replace it.
- Pulling `toroidalAnalyticCoefficient` through two admissible cone refinements agrees with pulling through their composite. A Hecke map whose cones do not match requires the supplied common refinement before this test can be formed.
- `reducedDomainCoefficient` of zero is zero and of a finite trivial line is the structural sheaf. With a nontrivial analytic character its equivariance is inverse frame action, even on a domain lacking an ordinary interpretation.
- A change of analytic reduction induces the stated `reducedDomainCoefficient` comparison only when it intertwines the actual representations and torsor maps. A datum with no chosen reduction supplies no such coefficient by fiat.
- At central weight j=1, the algebraic comparison for `reducedDomainCoefficient` retains ℚₚ(1); at j=0 the factor is trivial. Choosing a basis of roots of unity does not make the first Galois-equivariant factor trivial.

### 8.7 Bruhat-domain families in all cohomological degrees

In the quasi-split abelian-type setting, choose a finite splitting field F with a compatible reductive O_F-model, rational Borel and torus, neat tame level and toroidal Σ. For K_p=K_(p,m′,0), m′>0, w∈ᵐW and n≥0, use the supplied étale de Rham reduction M_(dR,n,Kp) on U_(w,n)=(π_HT,Kp^tor)⁻¹(]C_(w,k)[_(n,n)K_p). Its group is H=K_(p,w,Mμ)^c M_(μ,n)^c. The precursor reduction requires 0≤m−n≤m′−1; the family uses its m=n pushout. Enlarge F so the μ-cyclotomic image lies in the reduction group, as the supplier requires. These are the actual groups and torsor of BP Propositions 4.6.9, 4.6.12 and 4.6.14, pp.92–95, rather than a guessed congruence subgroup.

For a complete finite-type Tate pair (A,A⁺)/(F,O_F) and n-analytic ν_A:T^c(ℤₚ)→A^×, define `bruhatCoefficientFamily` by analytic functions on that reduced de Rham torsor times Spa(A,A⁺), with

```text
κ_A = −w₀,M wν_A − (w₀,M wρ + ρ),
f(mb) = (w₀,M κ_A)(b⁻¹) f(m).
```

The weights use BP additive notation and the same positive roots. Define `bruhatDistributionFamily` using the bounded-open-polydisc distributions of §0.4 and the shift κ_A+2ρ_nc; equivalently retain the dual coefficient with its −2ρ_nc bundle twist as in BP §6.3.1. Prove `bruhatCoefficientFamily.radiusMap`, `levelMap`, `changeCoefficient` and `bruhatDistributionFamily.radiusMap`, `levelMap`, `changeCoefficient`, with their identity and composition laws. Prove `bruhatCoefficient_algebraicInjection` when the resulting algebraic κ is M_μ-dominant, and the distribution comparison to V_(κ+2ρ_nc)∨ with its corresponding convention. A finite character χ of conductor b≤m′,n gives the étale twist `bruhatCoefficient_finiteCharacter`. Sources: BP §6.3.1 and Propositions 6.3.6–6.3.7, pp.153–154.

Prove `bruhatCoefficient_locallyProjectiveBanach` and its distribution analogue under the actual finite-flat trivializing-cover hypotheses. In the Hodge-type pregood affinoid setting with perfect Σ, these covers are supplied by BP Proposition 4.6.15, p.95; beyond that setting they must be supplied or proved for the chosen affinoid. The rational finite group descent in the proof uses invertible group order. Then prove `bruhatCoefficient_cohomologyComparison`: on an open that is a finite union of quasi-Stein opens, RΓ_et equals RΓ_an for both coefficient and distribution families, in all degrees, with the projective Banach derived model specified in BP Corollary 6.3.4. Sources: BP Proposition 6.3.3 and Corollary 6.3.4, pp.153–154. No integral projectivity theorem is inferred by the same finite-group averaging argument.

**Checks.**

- `bruhatCoefficientFamily` at M=T has no unipotent variables but still has the full Weyl/root character shift. Setting ν=0 need not make κ=0 when the root correction is nonzero.
- At m′=1 the precursor range forces m=n; the pair m=0,n=1 is outside it. At n=0 only a genuinely 0-analytic character is admitted, rather than every continuous weight.
- `bruhatDistributionFamily` in zero unipotent dimension is the corresponding dual line with its stated shift. Removing 2ρ_nc changes the algebraic comparison when the noncompact roots are present.
- At an algebraic dominant κ the finite canonical coefficient injects, but nonalgebraic analytic functions remain in the larger family. A finite-character twist beyond min(m′,n) needs a deeper level/stage.
- The cohomology comparison includes H⁰ as well as every H^i for i>0. Local projectivity on the chosen affinoids and the finite quasi-Stein-union condition are hypotheses of the derived statement, not consequences of merely having a coefficient equalizer.

**Further Bruhat coefficient checks.**

- `bruhatCoefficientFamily` on a trivialized reduction is the analytic induction with its displayed inverse Weyl-conjugated Borel character. A nontrivial torus character therefore changes the line even when there are no unipotent variables.
- At a dominant algebraic κ, `bruhatCoefficientFamily` contains the supplied finite algebraic coefficient and also higher analytic monomials in positive unipotent dimension. Equating the whole analytic family with that finite coefficient fails this test.
- `bruhatDistributionFamily` pairs with the bounded open-polydisc analytic coefficient and has compatible moments under radius change. Independently chosen moments at successive radii do not give a locally analytic distribution.
- For `bruhatDistributionFamily`, the weight κ_A+2ρ_nc is retained under scalar extension. If ρ_nc≠0, replacing that weight by κ_A gives a different algebraic dual; if there are no noncompact roots the shift vanishes, as it should.
- At ν=0, an SL₂ root datum with w=1 and w₀=s has κ=−(sρ+ρ)=0; with w=s it has κ=−2ρ. Thus the zero input need not mean zero output weight. The distribution weight in each case further includes 2ρ_nc in the same positive-root convention.

### Examples

The empty matrix index tests the algebraic identities but is not a genus-zero Siegel moduli claim. In genus one the inverse denominator recovers a line coefficient; in higher genus a determinant eigenline is only one subrepresentation of the induced analytic coefficient. For a general Shimura variety, the μ-central Tate twist and the change of cone decomposition remain visible even when a particular local frame makes a formula look scalar. The Bruhat family uses an explicit reduced de Rham torsor and interpolates higher-degree as well as degree-zero coefficient cohomology.

### Dependencies

Layers 0–1; supplied row-graph and quotient Hodge-frame identities, period-domain quotients and reduced torsors; classical automorphic bundles and the general Hodge–Tate/de Rham twist. Local projective Banach assertions also use the actual finite trivializing covers. A canonical-domain interpretation needs the separate quantitative canonical-subgroup comparison.

## Downstream consumers

The Hilbert Banach modules and completely continuous controlling operator are inputs to finite-slope spectral varieties and classicality/control results in PadicFamilies. The arithmetic and ordinary comparisons identify the coefficients used in Katz–Hida and perfectoid constructions without identifying all ordinary forms with overconvergent forms. Fourier and boundary maps provide the interfaces needed for congruences, eigenform comparison and integral Hecke actions. The general Levi inductions, reduced toroidal coefficient sheaves and derived cohomology comparison are inputs to higher Coleman theory in all degrees. The definite unitary coefficient construction supplies its own arithmetic Jacquet eigenvariety with the full local torus character and the proven dimension/depth/density requirements.

## References

- **BHW.** Christopher Birkbeck, Ben Heuer and Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Annales de l'Institut Fourier 73 (2023), 1709–1794. [Published article](https://aif.centre-mersenne.org/articles/10.5802/aif.3560/). The locators above use printed journal pages: §§6–7, pp.1756–1765; §9, pp.1780–1788; §10, pp.1788–1792.
- **AIP-adic.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, *The adic, cuspidal, Hilbert eigenvarieties*, Research in the Mathematical Sciences 3 (2016), article 34. [Author manuscript](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Locators use manuscript pages, especially §2, pp.6–9; §4, pp.15–19; §6, pp.25–29; §8, pp.34–38.
- **AIP-cusp.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, *On overconvergent Hilbert modular cusp forms*, Astérisque 382 (2016), 163–193. [Author manuscript](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf). Locators use the manuscript's 1–35 numbering: §§3–4, pp.17–25, and Appendix §6, pp.31–33.
- **BP.** George Boxer and Vincent Pilloni, *Higher Coleman theory*. [Revised author manuscript](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Locators refer to the 180-page version: general toroidal comparison §§4.4.38–4.4.40, pp.79–80; reduced torsors §§4.6.8–4.6.15, pp.92–95; analytic induction §6.2, pp.148–153; coefficient families §6.3, pp.153–154.
- **DRW.** Hansheng Diao, Giovanni Rosso and Ju-Feng Wu, *Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism*, [arXiv:2106.00094v3](https://arxiv.org/abs/2106.00094v3), 9 April 2026. Chart/frame locators are §§2.3–2.5, pp.15–20; normalized analytic coefficients and their sheaves are §3.1, pp.23–25; the algebraic comparison is §3.4, pp.37–38. The quotient-frame and Tate-linearization convention here is the explicit supplier convention, not an unqualified identification of a fixed dual-Lagrangian frame.
- **Ding.** Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publications mathématiques de l'IHÉS (2025). [Published article](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-025-00156-2/). The definite unitary construction and Proposition 4.14 are §4.2.2, pp.66–67 in the article PDF.
- **Heuer.** Ben Heuer, *Line bundles on rigid spaces in the v-topology*, [arXiv:2012.07918v2](https://arxiv.org/abs/2012.07918v2). Corollary 1.5, p.3, and Proposition 3.8, p.15, are used with their smooth-rigid and formal-unit hypotheses, respectively.

- **Emerton-analytic.** Matthew Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, [author manuscript](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf), draft dated 19 September 2011, 146 pages. Locators use its printed pages: Fréchet–Stein structures and coadmissibility §1.2, pp.22–27; analytic vectors Definition 3.5.3, p.64; distribution algebras §5.3, pp.101–110; admissibility and duality §6.1–§6.2, pp.110–119; full character spaces and essential admissibility §6.4, pp.124–130.
- **Emerton-Jacquet.** Matthew Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Annales scientifiques de l'École normale supérieure 39 (2006), 775–839. [Published article](https://www.numdam.org/articles/10.1016/j.ansens.2006.08.001/). Finite slope is §3.2, pp.796–799; the general parabolic construction is §3.4, pp.806–808; essential admissibility is Theorem 4.2.32, p.828; smooth and locally algebraic comparisons are Propositions 4.3.4 and 4.3.6, p.834.
- **Breuil–Ding.** Christophe Breuil and Yiwen Ding, *Higher ℒ-invariants for GL₃(ℚₚ) and local-global compatibility*, Cambridge Journal of Mathematics 8 (2020), 775–951. [Author manuscript](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compaGL3.pdf). Lemma 6.1, pp.83–84 in this manuscript, gives the general-rank integral local regularity used above.
- **Breuil–Hellmann–Schraen, Une interprétation modulaire.** *Une interprétation modulaire de la variété trianguline*, Math. Ann. 367 (2017), 1587–1645. [Author final manuscript](https://math.univ-lyon1.fr/homes-www/schraen/BHS1final.pdf). The local projective models are §§3.4–3.5, pp.23–26; density and reducedness are Theorem 3.19 and Corollary 3.20, pp.29–33; the analytic-stage construction is Proposition 5.3, pp.44–45. Only the specified local arguments are specialized here, without their patching variables.
- **Breuil–Hellmann–Schraen, Smoothness and classicality.** *Smoothness and classicality on eigenvarieties*, Invent. Math. 209 (2017), 197–274. [Author manuscript](https://math.univ-lyon1.fr/homes-www/schraen/BHS2.pdf). Lemma 3.8, p.24 in this version, is the finite-projective Cohen–Macaulay argument.
- **Chenevier.** Gaëtan Chenevier, *Une correspondance de Jacquet–Langlands p-adique*, [arXiv:math/0301032v1](https://arxiv.org/abs/math/0301032v1), 5 January 2003. Proposition 6.4 and Lemma 6.5, pp.20–21, give the semisimple-fibre and no-embedded-component reducedness criterion. These locators are for this version; Ding cites the published Duke Math. J. 126 (2005), 161–194, with different numbering.
