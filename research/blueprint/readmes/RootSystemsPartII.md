# Integral dominance and finite diagram folding

This continuation of [RootSystems](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/RootSystems) turns a strict integral dominance comparison between invariant dominant weights into a single positive root-orbit increment. Its application to a coroot system supplies the combinatorial choice needed by Kisin–Zhou, Proposition 5.2.3, pp. 49–50 of the author preprint. The geometry of the curve, relative root subgroups and descent over finite fields belongs to its geometric consumer.

The four layers cover integral dominance, orthogonal folding, the adjacent even-A and component-cycle adapters, and transport of the integral chamber and cone. The endpoint keeps the actual integral lattice and its central component. Affine Demazure/Newton reduction and modular representation bounds have separate mathematical inputs and outputs; their precise split briefs and complete item assignments appear below. The assigned roadmap id is `RootSystemsPartII`.

## Conventions and library boundary

In RS2.1–RS2.4, Φ is a finite reduced crystallographic root system in its real span E, with base Δ={α\_i}. Its coroot evaluations are those of the pinned `RootPairing`. Write Q for the integer root span, Q⁺ for the **existing** `TauCeti.posRootCone`, and L for a specified subgroup with Q⊆L and integral coroot evaluations. No choice of the full weight lattice is forced. Dominant means membership in `TauCeti.dominantChamber`, including its walls. Root and coroot conventions are interchanged by `RootPairing.Base.flip`. The Cartan convention is row root and column coroot: a_ij=⟨α\_i,α\_j∨⟩.

A based automorphism σ is the existing `RootPairing.Aut` preserving the simple support; on E it has finite order because it permutes a finite spanning root set. The form on E is the canonical positive form, obtained from the sum of products of coroot evaluations. Its σ-invariance follows by reindexing that sum. When length formulas use squared length 2 for original simply-laced roots, rescale positively on each component, with the same scale on a σ-cycle; this changes no coroot pairing. Root orbits are finite SETS of distinct elements. Orbit sums, orbit averages, and roots restricted to a fixed subspace need not have the same normalization. No root multiplicities or nonreduced relative roots enter the finite fold.

The rank-zero system is allowed. The last target removes the spanning assumption on the ambient weight space; its central directions are retained in the conclusion. For reductive cocharacters use Φ equal to the **coroot** system. Positivity then tests against the original simple roots, and Q is the actual coroot lattice inside the cocharacter lattice.

General weight lattices, fundamental weights and their dictionary with Lie highest-weight theory remain upstream interfaces. This plan does not recreate those structures, the finite Dynkin classification, the numbered diagram automorphisms, the pinned type-A model, dominant representatives, the positive cone or chambers. The exact pinned declarations used below already supply them to the extent needed here. In particular, finite dominant intervals are available from `TauCeti.finite_setOf_dominant_sub_mem_posRootCone`; finiteness of an entire translated positive cone is never asserted. The coweight dominance order of ReductiveGroupsPartII (RG2.1, used on the inertia coinvariants X_\*(T)\_I in RG2.4) is the same flipped cone, so RS2.1 gives it its API and no second order; that roadmap plans neither the Stembridge step nor folding.

The mathematical baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no dedicated RootSystems or LieHighestWeight layer audit; its silence is not evidence of absence. The pinned statements, current library and current upstream RootSystems and LieHighestWeight documents were inspected. Their lattice-ownership wording differs, as already recorded in the reviewed RootSystems link packet. The explicit subgroup/pointwise-integrality formulation here requires no new general lattice owner.

## Layer overview

| Layer | Output | Inputs |
|---|---|---|
| RS2.1 | Integral order API and ordinary Stembridge step | Existing positive cone, chamber, finite roots, obtuse-sum and Cartan signs |
| RS2.2 | Orthogonal orbit-sum fold and fixed Weyl group | RS2.1; existing finite root and inversion APIs |
| RS2.3 | Adjacent A_(2n), component cycles, the case split for based automorphisms and the general finite fold | RS2.2; existing finite Dynkin classification, diagram trees and pinned type-A model |
| RS2.4 | Invariant chamber/cone transport and existential coroot step | RS2.1 and RS2.3 |

Every target below is a mathematical goal, with implementation status unchecked. “Closed” in the packet records a complete target-level prerequisite chain, not a proof in Lean. The suggested file follows the compact statement-only shape: real-bodied light definitions over existing carriers, endpoint theorem statements and examples. The folded root systems and their full APIs remain targets in this reader; the suggested file introduces no placeholder folded data or preliminary theory merely to state them.

## RS2.1: Integral dominance and the Stembridge step

Use the pinned positive root cone to define the integral dominance relation on an explicitly retained lattice. Establish its coefficient, translation and duality API, keeping rational dominance separate. Prove the positive-root step between distinct dominant integral endpoints by the maximal eligible root argument; apply the same theorem to the coroot pairing. The positive cone, chambers, root strings and their existing library proofs are inputs.

Stage dependencies: `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-1-root-combinatorics-positive-roots-lowering-inversions-exchange`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`.

### Integral root dominance

Target `RootSystemsPartII:integral-order` (definition).

For x,y in the weight space, RootLE(Δ,x,y) means y−x ∈ TauCeti.posRootCone(Φ,Δ). On L this is integral root dominance. Coroot dominance is this very definition for the flipped pairing and flipped base. No global order instance is imposed on the ambient module.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.

Construction or proof:

1. Wrap the existing additive submonoid; reflexivity and transitivity use zero and addition in it.
2. Pointedness gives antisymmetry. Simple-root independence gives the coefficientwise criterion when both differences are in Q.
3. Restrict to L or its σ-fixed subgroup without changing the cone. The rational cone is used only for a comparison implication.

Uses: Rapoport Lemma 2.3, pp. 157–158 — Specifies the integer coefficient budgets for an eligible root.; KZ25 Proposition 5.2.3, pp. 49–50; KPZ26 routed R01 — One shared integral coroot order for both continuations.; ReductiveGroupsPartII RG2.1 (minuscule coweights and the dominance order) and RG2.4 (dominant inertia-coinvariant cocharacters) — Their coweight order is membership of the difference in the posRootCone of the flipped base, that is RootLE for the flipped pairing; RG2.4 applies it on X_\*(T)\_I, the carrier of Kisin–Zhou §5.2.

API:

- `rootLE_iff` (characterisation): RootLE(Δ,x,y) iff y−x=Σ\_i n_i α\_i for natural n_i.
- `rootLE_partialOrder` (relation): The relation is reflexive, transitive and antisymmetric; use an explicit relation or a wrapper type.
- `rootLE_add_right` (compatibility): RootLE(x+z,y+z) iff RootLE(x,y).
- `rootLE_map` (functoriality): A based root-pairing equivalence transports RootLE in both directions.
- `rootLE_coefficients` (characterisation): For x=Σ a_i α\_i and y=Σ b_i α\_i with integer coordinates, RootLE(x,y) iff a_i≤b_i for every i.
- `rootLE_rational` (compatibility): Integral dominance implies rational-cone dominance; the converse requires the integral simple coefficients, not just membership of the ambient lattice.
- `rootLE_flip_iff_coweight_dominance` (compatibility): For the flipped pairing and flipped base, RootLE(λ,μ) holds iff μ−λ is a natural combination of simple coroots: the coweight dominance order that ReductiveGroupsPartII RG2.1 fixes as its convention. No second order is defined.

Discriminating unit tests:

- **rootLE_PGL2_parity**: In X_\*=Z with the positive coroot 2, 0≤\_Q 2 but 0 is not ≤\_Q 1, although 1 is in the positive rational coroot cone.
- **rootLE_zero_rank**: With Δ empty, RootLE(x,y) iff x=y, including any independent central directions.
- **rootLE_A2**: In A2 root coordinates, (0,1)≤\_Q(1,1), whereas (1,0) and (0,1) are incomparable.
- **rootLE_existing_cone**: For every x,y the relation agrees literally with membership in the pinned posRootCone; no real cone closure is taken.

Checks:

- No saturation of the root lattice is introduced.
- The dual formulation uses roots as coroot increments and coroot functionals as original-root evaluations.

Direct prerequisites: `tauceti:TauCeti.posRootCone`, `tauceti:TauCeti.mem_posRootCone`, `tauceti:TauCeti.isPointed_posRootCone`, `mathlib:RootPairing.Base`, `mathlib:RootPairing.Base.flip`.

Sources: [Rap00] §1, pp. 153–154; rank-one cases in §2, pp. 156–157. The order uses nonnegative integral coroot sums and retains the cocharacter lattice congruence.

### Stembridge positive-root step

Target `RootSystemsPartII:stembridge-step` (theorem).

For distinct dominant integral λ,μ∈L with RootLE(λ,μ), there is β∈Φ⁺ with λ+β dominant and RootLE(λ+β,μ). Consequently λ<\_Qλ+β≤\_Qμ. This assertion remains valid in an ambient weight space with central directions: its proof uses only the simple-coroot tests.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.

Construction or proof:

1. Write μ−λ=Σ n_i α\_i. Positive roots with coordinates m_i≤n_i form a finite nonempty set: a simple root with n_i>0 belongs to it. Choose a maximal member β in the integral root order.
2. For each simple α\_i, maximality implies either β+α\_i is not a root or m_i=n_i. If the sum is not a root, the contrapositive of the obtuse-sum lemma, with the nonopposite-root hypothesis checked, gives ⟨β,α\_i∨⟩≥0.
3. If m_i=n_i, write λ+β=μ−Σ\_(j≠i)(n_j−m_j)α\_j and use dominance of μ and nonpositive off-diagonal Cartan entries. This proves every simple-coroot inequality.
4. The remaining coefficients n_i−m_i give the upper bound; β is positive and nonzero, so pointedness makes the lower bound strict. Integrality and membership in L follow from Q⊆L.

Checks:

- All positive-root and finiteness hypotheses used in choosing a maximum are explicit.
- A2 λ=0, μ=α1+α2 admits the highest root; either simple root alone fails dominance.
- For the coroot version apply the same argument to the flipped pairing; PGL2 does not admit the increment 1.

Direct prerequisites: `RootSystemsPartII:integral-order`, `tauceti:TauCeti.exists_root_eq_sum_nat_of_mem_posRoots`, `mathlib:RootPairing.root_add_root_mem_of_pairingIn_neg`, `mathlib:RootPairing.Base.cartanMatrix_le_zero_of_ne`, `tauceti:TauCeti.exists_intCast_eq_coroot'_of_mem_posRootCone`, `mathlib:RootPairing.Base`.

Sources: [Rap00] §2, Lemma 2.3 and equations (2.10)–(2.13), pp. 157–158. Dominant endpoints with an integral positive-coroot difference admit a positive-coroot step; the proof chooses a maximal eligible root.

## RS2.2: Orthogonal diagram folding

Define sums over distinct root orbits. For finite simply-laced systems with orthogonal simple orbits, construct the folded reduced crystallographic root system with its simple-orbit base and Cartan entries. Identify its Weyl group with the subgroup fixed under diagram conjugation, using the existing inversion and chamber-stabilizer API. Include identity, A3 reversal and D4 triality checks.

Stage dependencies: `RootSystemsPartII:RS2.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-2-the-weyl-group-as-a-coxeter-system`.

### Distinct root-orbit sums

Target `RootSystemsPartII:orbit-sum` (definition).

For a based automorphism σ of Φ and α∈Φ, OrbitSum(σ,α)=Σ\_(β∈Oσ(α)) β, where Oσ(α) is the SET of distinct iterates. It lies in E^σ. Repeated elements of a chosen period are discarded before summation. For simple orbits O write β\_O=Σ\_(α\_i∈O)α\_i.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- σ preserves Δ and L. On the root span it has finite order because it permutes a spanning finite set.

Construction or proof:

1. Take the finite set of iterates of the existing index permutation and sum the root vectors.
2. The permutation σ cycles that set, proving invariance; changing the representative leaves the set unchanged.
3. For positive α, all orbit members are positive; their coefficient sums are nonnegative and not all zero, so the sum is a nonzero member of the existing cone.

Uses: Stem08 Claims 1 and 4, pp. 2–3 — Indexes actual roots of the folded system.; KZ25 Proposition 5.2.3, pp. 49–50 — Selects one σ-invariant increment with the correct integer normalization.

API:

- `orbitSum_mem_fixed` (structure): σ(OrbitSum(σ,α))=OrbitSum(σ,α).
- `orbitSum_representative` (simp): Replacing α by σ^kα leaves OrbitSum unchanged.
- `orbitSum_fixed` (simp): If σα=α then OrbitSum(σ,α)=α.
- `orbitSum_period` (compatibility): If σ^mα=α with m>0, summing all m iterates gives (m/|Oσ(α)|)·OrbitSum; equality without the factor requires a minimal period.
- `orbitSum_positive` (relation): For positive α, OrbitSum is nonzero and in Q⁺.
- `orbitSum_equiv` (functoriality): A based equivalence conjugating σ to τ takes each OrbitSum(σ,α) to OrbitSum(τ,fα).

Discriminating unit tests:

- **orbitSum_identity**: For σ=id every root has singleton orbit and OrbitSum=α.
- **orbitSum_A2**: Reversal of A2 sends α1 to α2; its simple orbit sum is α1+α2, not half of that vector.
- **orbitSum_triality_period**: D4 triality sums the three distinct outer roots once, even when the supplied period is six; the sum of six successive iterates is twice OrbitSum.
- **orbitSum_collision**: In A2 the fixed highest-root orbit and the two-member simple-root orbit have the same sum α1+α2.

Checks:

- An orbit sum is neither an average nor an orbit-length-weighted sum.
- Different orbits may have the same sum in the adjacent even-A case; no injectivity of the root-orbit-to-vector map is promised.

Direct prerequisites: `mathlib:RootPairing.Aut`, `mathlib:RootPairing.Base`, `tauceti:TauCeti.exists_root_eq_sum_nat_of_mem_posRoots`, `tauceti:TauCeti.isPointed_posRootCone`.

Sources: [Stem08] definition of β\_j, p. 1, and Claim 4, p. 3. The simple folded roots use sums over blocks of the orbit partition. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Folding with orthogonal simple orbits

Target `RootSystemsPartII:orthogonal-fold` (construction).

Assume Φ is finite and simply laced and any two distinct simple roots in one σ-orbit are orthogonal. On E^σ, the set Ψ={OrbitSum(σ,α):α∈Φ}, with duplicates removed, is a finite reduced crystallographic root system with base B={β\_O:O a simple orbit}. The form is the restricted canonical positive form, with positive componentwise rescaling constant on σ-cycles when normalizing lengths. Such rescaling leaves all coroot pairings unchanged. With original roots normalized to squared length 2, (β\_O,β\_O)=2|O| and ⟨β\_O,β\_T∨⟩=−N_OT/|T| for O≠T, where N_OT counts edges between the two blocks.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- Φ is simply laced on each component, with the normalization constant across components permuted by σ.
- Simple σ-orbits are pairwise orthogonal within each orbit.

Construction or proof:

1. The sums β\_O are linearly independent and span the fixed space: invariant simple coefficients are constant on orbits. Counting neighbors at a fixed node of T proves the displayed Cartan entries are integers and nonpositive.
2. For each O, the commuting product ∏\_(i∈O)s_i restricts to reflection in β\_O. These products preserve the set of root-orbit sums.
3. Descend the positive height of a root-orbit sum by such reflections using positive definiteness. If all resulting orbit roots become negative, the original orbit consists of the simple roots of that block. Thus every orbit sum is in the reflection orbit of a β\_O.
4. Conversely those reflection orbits are orbit sums. This gives the generated finite root system, its base, reducedness and crystallographic axiom; Stembridge Claim 4 also proves all original root orbits are orthogonal under these finite hypotheses.

Uses: RS2.4 invariant step — Supplies a finite root system to which the ordinary Stembridge lemma applies.; Stem08 Claim 3, pp. 2–3 — Its simple-reflection comparison is the input to the fixed-Weyl-group theorem.

API:

- `orthogonalFold_roots` (characterisation): Ψ is exactly the image of the root-orbit sum map; positivity is the image of Φ⁺.
- `orthogonalFold_base` (data): The simple roots are exactly the distinct sums β\_O, indexed by simple orbits.
- `orthogonalFold_cartan` (compatibility): The Cartan entries and squared norms are those in the statement, for the row-root/column-coroot convention.
- `orthogonalFold_reflection` (compatibility): Reflection in β\_O agrees on E^σ with the product of the commuting simple reflections in O.
- `orthogonalFold_identity` (equivalence): For σ=id the resulting based root system is the original one on E.
- `orthogonalFold_equiv` (functoriality): Based isometries conjugating the automorphisms induce based equivalences of the folds.

Discriminating unit tests:

- **orthogonalFold_A3**: A3 reversal has β1=α1+α3, β2=α2 with norms 4 and 2; their off-diagonal Cartan entries are −2 and −1 respectively, and Ψ has eight roots.
- **orthogonalFold_D4**: For D4 triality, let β\_o be the outer sum and β\_c the central root. Their off-diagonal pairings are −3 and −1 respectively, with norms 6 and 2; Ψ has twelve roots of type G2.
- **orthogonalFold_A2_excluded**: A2 reversal violates the simple-orbit orthogonality hypothesis and must use the adjacent adapter.
- **orthogonalFold_identity**: An identity automorphism returns the original positive roots and simple roots, including the empty root system.

Checks:

- This construction is not applied to adjacent simple orbits, nor to affine or indefinite systems.
- The Cartan denominator is |T| (column-coroot convention), not |O|.

Direct prerequisites: `RootSystemsPartII:orbit-sum`, `mathlib:RootPairing.Base`, `mathlib:RootPairing.Base.IsPos.induction_on_reflect`, `mathlib:RootPairing.RootForm`, `mathlib:RootPairing.posRootForm_rootFormIn_posDef`, `mathlib:RootPairing.Base.cartanMatrix_le_zero_of_ne`, `tauceti:RootPairing.weylGroupToPerm_injective`, `tauceti:TauCeti.heightLinearMap_sum_nsmul_root`.

Sources: [Stem08] condition (1), p. 1; Claims 1 and 3, pp. 2–3; Claim 4, p. 3. Under orthogonality of simple orbits, orbit sums give the finite folded roots and their reflection group is the fixed Weyl subgroup.

### Weyl group of an orthogonal fold

Target `RootSystemsPartII:fixed-weyl-group` (theorem).

For the orthogonal fold, restriction gives an isomorphism W(Φ)^σ ≃ W(Ψ). Its inverse sends the simple reflection of β\_O to ∏\_(i∈O)s_i. Here W(Φ)^σ is the fixed subgroup under conjugation by σ, not the pointwise stabilizer of E^σ.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- The hypotheses of orthogonal-fold hold.

Construction or proof:

1. The reflection comparison proves that the block products act as the folded simple reflections.
2. For a nonidentity fixed w choose a simple inversion using the pinned simple-descent theorem. Its entire simple σ-orbit consists of inversions. The reflections in that block commute and fix the other simple roots of the block, so each successive multiplication removes one inversion, by the pinned inversion-cardinality theorem. The total drop is |O|. The block product is fixed by σ; induct on inversion cardinality. No unplanned parabolic normal-form theorem is used.
3. Restriction is injective on the fixed subgroup: choose a strictly dominant vector and sum its finite σ-orbit to get a strictly dominant fixed vector. Existence of the first vector follows by solving the nonsingular simple-coroot matrix on E. An element trivial on E^σ fixes this vector, so the existing chamber stabilizer theorem and empty-wall theorem imply that element is identity. Restriction contains every folded simple reflection and every fixed element is a product of block reflections, giving the isomorphism.

Checks:

- A3 reversal gives a fixed group of order eight; D4 triality gives order twelve.
- The argument concerns finite Weyl groups and does not import a p-adic Iwahori–Weyl carrier.

Direct prerequisites: `RootSystemsPartII:orthogonal-fold`, `tauceti:RootPairing.weylGroupToPerm_injective`, `tauceti:RootPairing.finite_weylGroup`, `tauceti:TauCeti.exists_mem_support_mem_inversions_of_ne_one`, `tauceti:TauCeti.ncard_inversions_mul_ofIdx_of_mem`, `tauceti:TauCeti.stabilizer_eq_closure_wallReflections`, `tauceti:TauCeti.wallReflections_eq_empty_of_mem_openDominantChamber`.

Sources: [Stem08] condition (1), p. 1; Claims 1 and 3, pp. 2–3; Claim 4, p. 3. Under orthogonality of simple orbits, orbit sums give the finite folded roots and their reflection group is the fixed Weyl subgroup.

## RS2.3: Adjacent folding and component cycles

Construct the orbit-sum B_n model for A_(2n) reversal, including the doubled middle pairing and nonunique short-root lifts. Build diagonal transport for cycles of irreducible components and their return automorphisms, including norm scaling and unchanged Cartan pairings. Prove the case split for a based automorphism of an irreducible system: it is the identity on a nonsimply-laced type, and its simple orbits are orthogonal except for the reversal of A_(2n). Combine this, read off the existing finite Dynkin classification, with orthogonal folding to obtain the fold for every based finite reduced crystallographic root-system automorphism.

Stage dependencies: `RootSystemsPartII:RS2.2`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`.

### Adjacent folding of even A type

Target `RootSystemsPartII:adjacent-even-A-fold` (construction).

For n≥1, realize A_(2n) in the coordinate-sum-zero subspace of R^(2n+1), with σ(e_a−e_b)=e_(2n+2−b)−e_(2n+2−a). Put f_i=e_i−e_(2n+2−i), 1≤i≤n. The distinct orbit sums are exactly {±f_i, ±f_i±f_j : i<j}; their base is f_i−f_(i+1) (i<n), f_n. This is the B_n root model, with the rank-one case identified directly with A1. Every f_i has squared norm 2.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- The based irreducible system is A_(2n) and σ is its nonidentity reversal. Coordinate indices here are one-based.

Construction or proof:

1. Transport (Φ,Δ,σ) to the pinned model. By diagram-automorphism-orbits Φ has type A_(2n) and σ reverses the numbered simple roots. RootPairing.Base.equivOfCartanMatrixEq along that numbering identifies Φ with the real base change of TauCeti.DynkinType.typeASimplyConnectedRootDatum (2n), base to base. Over ℝ that base change spans, its simple roots being the rows of the invertible Cartan matrix, and its base and reducedness come from the pinned base-change lemmas. It carries σ to the base change of TauCeti.DynkinType.typeAGraphAut (2n): both are based automorphisms reversing the simple roots, and an automorphism of a spanning system is determined by the simple roots. In that model the roots are e_a−e_b and the graph automorphism is the displayed σ. A root e_a−e_b with neither index central gives ±(f_i−f_j), ±(f_i+f_j) or the fixed root ±f_i. A pair of roots meeting the central index n+1 also sums to ±f_i. These cases exhaust all roots.
2. The f_i are orthogonal. Thus the listed set is closed under its reflections, has the B_n Cartan matrix, and the stated base has the required signed integral expansions. This verifies the finite reduced crystallographic root axioms directly.
3. For i<n the simple orbit is orthogonal. For the middle adjacent orbit, α\_n+α\_(n+1)=f_n has squared norm 2 rather than 4. Compute its coroot by the Euclidean pairing formula.
4. For an invariant weight with original simple-coroot values d_i=d_(2n+1−i), the folded simple-coroot values are d_i (i<n) and 2d_n.

Uses: RS2.3 general fold — Handles precisely the irreducible component type not covered by orthogonal folding.; KZ25 Proposition 5.2.3, p. 50 — Supplies the two-member lift when a short restricted-root representative is needed; group root-subgroup normalization remains the geometric consumer’s obligation.

API:

- `evenAFold_roots` (characterisation): Orbit sums are exactly ±f_i and ±f_i±f_j, with no roots ±2f_i.
- `evenAFold_base` (data): Its simple roots are f_i−f_(i+1) and f_n; each is the sum of the corresponding simple σ-orbit.
- `evenAFold_pairings` (compatibility): Invariant original simple-coroot values d_i become d_i off the middle and 2d_n at the middle.
- `evenAFold_lifts` (constructor): For f_i choose either the fixed root e_i−e_(2n+2−i) or the orbit of e_i−e_(n+1); the latter has two distinct members.
- `evenAFold_transport` (functoriality): A based equivalence to the real base change of the pinned type-A_(2n) datum, intertwining σ with its graph automorphism, transports the fold and its root set; the result is independent of the equivalence up to the induced based equivalence.

Discriminating unit tests:

- **evenAFold_A2**: For n=1, the fold consists of ±(α1+α2). An invariant weight with original pairings (1,1) has folded pairing 2.
- **evenAFold_A4**: For n=2 the fold has eight roots; f1−f2 is long and f2 is short with squared norms 4 and 2. Its off-diagonal Cartan entries in that order are −2,−1.
- **evenAFold_no_double**: In A2, 2(α1+α2) is not an orbit-sum root, excluding a nonreduced BC1 replacement.
- **evenAFold_short_lift**: In A4, the orbit {e1−e3,e3−e5} and the fixed root e1−e5 both give f1; the orbit-to-root map is not injective.

Checks:

- The orbit-sum root system has type B_n in these coordinates; the reduced restricted-root or orbit-average normalization can give a different convention.
- A fixed root and a two-member root orbit can both lift the same short folded root.

Direct prerequisites: `RootSystemsPartII:orbit-sum`, `RootSystemsPartII:diagram-automorphism-orbits`, `mathlib:RootPairing.Base`, `mathlib:RootPairing.Base.equivOfCartanMatrixEq`, `tauceti:TauCeti.DynkinType.typeASimplyConnectedRootDatum`, `tauceti:TauCeti.DynkinType.hasCartanType_typeASimplyConnectedRootDatum`, `tauceti:TauCeti.DynkinType.typeAGraphAut`, `tauceti:TauCeti.DynkinType.indexEquiv_typeAGraphAut_typeASimpleIndex`, `tauceti:TauCeti.rootPairingBaseChange`, `tauceti:TauCeti.rootPairingBaseChangeBase`, `tauceti:TauCeti.isReduced_rootPairingBaseChange`, `mathlib:RootPairing.RootForm`, `mathlib:RootPairing.posRootForm_rootFormIn_posDef`.

Sources: [Stem08] condition (1), p. 1, delimiting the scope of Claims 1–4, pp. 2–3. The adjacent middle pair violates the orthogonality hypothesis; the coordinate proof in this node supplies the missing case rather than citing those claims outside their hypotheses. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Diagonal transport around a component cycle

Target `RootSystemsPartII:component-cycle` (construction).

Let C,σC,…,σ^(c−1)C be a cycle of irreducible components, c≥1, and τ=σ^c|C. The map D(u)=Σ\_(r=0)^(c−1)σ^r u is a linear equivalence E_C^τ → (⊕\_(r<c)E_(σ^r C))^σ, inverse to projection to E_C. It takes τ-orbit sums to σ-orbit sums and multiplies squared norms by c. It identifies the simple-orbit cones and preserves all resulting Cartan pairings.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- Use the canonical σ-invariant form; distinct component spaces are orthogonal.
- Components are connected components of the finite simple Cartan graph.

Construction or proof:

1. Distinct connected simple blocks are orthogonal. Positive-root descent shows every root belongs to one block: reflecting a simple root never leaves its connected block. The blocks span E, so they give an orthogonal direct sum of root systems, each irreducible by the connected-diagram criterion.
2. A fixed vector is determined by its projection u onto the first block; the other projections are σ^r u and the closing condition is τu=u. This proves the formula, inverse and equivariance.
3. A τ-root orbit of size d yields a σ-orbit of size cd because roots in distinct components are distinct. Regroup that orbit sum to obtain D of the τ-orbit sum.
4. Orthogonality and σ-isometry give (D u,D v)=c(u,v); the common factor cancels from the coroot pairing formula. Simple coefficients transport without division.

Uses: RS2.3 general folding — Reduces arbitrary permutations of components to irreducible return automorphisms.; RS2.4 invariant dominance — Transports integer cone budgets and coroot evaluations without a lattice saturation.

API:

- `componentCycle_inverse` (equivalence): Projection onto C is inverse to D on the fixed spaces.
- `componentCycle_orbitSum` (compatibility): D(OrbitSum(τ,α))=OrbitSum(σ,α) for α in C.
- `componentCycle_form` (compatibility): The pulled-back restricted bilinear form is c times the form on E_C.
- `componentCycle_base` (data): D takes the τ-simple-orbit sums bijectively to the σ-simple-orbit sums in that cycle.
- `componentCycle_cone` (compatibility): D identifies the two positive integral cones, with unchanged natural coefficients.
- `componentCycle_equiv` (functoriality): Changing the starting component conjugates τ and commutes with diagonal transport by the corresponding power of σ.

Discriminating unit tests:

- **componentCycle_B2_swap**: Exchange two B2 components. The return map is identity, the fold has eight roots, all squared norms double, and the oriented B2 Cartan matrix is unchanged.
- **componentCycle_length_one**: For c=1 the map D is the identity on the return-map fixed space.
- **componentCycle_return_triality**: For a cycle of two D4 components whose return map is triality, outer-root orbits have six members and the fold is a uniformly norm-scaled G2, not a doubled root multiset.
- **componentCycle_no_cycles**: For the empty root system there are no component cycles and the direct sum is the zero space.

Checks:

- This construction permits nonsimply-laced components, including exchange of two identical B2 components.
- A component cycle is reduced using its RETURN map, not by assuming σ is identity on the chosen component.

Direct prerequisites: `RootSystemsPartII:orbit-sum`, `mathlib:RootPairing.Base`, `mathlib:RootPairing.Base.IsPos.induction_on_reflect`, `mathlib:RootPairing.RootForm`, `mathlib:RootPairing.posRootForm_rootFormIn_posDef`, `tauceti:RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`.

Sources: [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Simple orbits of a based automorphism

Target `RootSystemsPartII:diagram-automorphism-orbits` (theorem). Added by the independent review.

Let Φ be a nonempty irreducible finite reduced crystallographic real root system with base Δ, and τ a based automorphism, so that τ permutes Δ preserving every Cartan entry. (a) If Φ is not simply laced, τ fixes every simple root and is therefore the identity. (b) If Φ is simply laced, either every simple τ-orbit consists of pairwise orthogonal simple roots, or Φ has type A_(2n) for some n≥1 and τ acts on the Bourbaki-numbered simple roots as the reversal α\_i ↦ α\_(2n+1−i). In the second case {α\_n,α\_(n+1)} is the only simple orbit containing two nonorthogonal roots, and the other orbits {α\_i,α\_(2n+1−i)} are orthogonal.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, irreducible and nonempty, with base Δ.
- τ is a root-pairing automorphism whose index permutation maps the simple support onto itself.

Construction or proof:

1. On Δ, τ is an automorphism of the Dynkin diagram preserving all Cartan entries, hence root lengths; the diagram is a finite tree. Distinct nonadjacent simple roots have Cartan entry zero and are orthogonal.
2. Part (a): in types B_n, C_n, F4 and G2 the diagram is a path, whose only automorphisms are the identity and the reversal. The reversal either moves the unique multiple edge onto a simple edge or exchanges its two endpoints of different lengths, so it is not Cartan-preserving. Hence τ fixes Δ, which spans E, so τ is the identity.
3. Part (b): a tree automorphism preserves the center of the tree, a vertex or an edge. If τ fixes a vertex c, it preserves the distance to c; adjacent vertices of a tree lie at distances from c that differ by one, so no τ-orbit contains two adjacent simple roots, and every simple orbit is orthogonal.
4. Otherwise the center is an edge whose endpoints τ exchanges, and the diagram is two exchanged isomorphic halves joined by it. Every valid type other than A has exactly one branch node (D, E) or exactly one multiple edge (B, C, F4, G2), which such a symmetry would duplicate. So the type is A_m, the path has a central edge only for m=2n, and the only path automorphism exchanging it is the reversal.
5. The type is read off through existsUnique_dynkinType and its relabelling; under any relabelling, τ becomes a member of the numbered symmetry group, by the entrywise criterion. The reversal commutes with itself, so the conclusion does not depend on the relabelling chosen.

Checks:

- A3 reversal fixes the central vertex: its orbits {α1,α3} and {α2} are orthogonal.
- A4 reversal exchanges the central edge {α2,α3}, the one nonorthogonal orbit; {α1,α4} is orthogonal.
- D4 triality, the D_n fork exchange and the E6 symmetry fix the branch node, so all their orbits are orthogonal.
- In B2 and G2 the exchange of the two nodes transposes the Cartan matrix, so it is not a based automorphism.

Direct prerequisites: `mathlib:RootPairing.Aut`, `mathlib:RootPairing.Base`, `tauceti:TauCeti.isTree_diagramGraph_cartanMatrix`, `tauceti:TauCeti.diagramGraph_adj`, `tauceti:TauCeti.existsUnique_dynkinType`, `tauceti:TauCeti.HasCartanType`, `tauceti:TauCeti.DynkinType.cartanMatrix`, `tauceti:TauCeti.DynkinType.mem_diagramSymmetry_iff`.

The suggested file states part (a) as `indexEquiv_eq_self_of_multiple_edge` and the dichotomy of part (b) as `simpleOrbit_pairing_eq_zero_or_typeA_even`; the reversal in the exceptional case is stated here only.

Sources: [Stem08] p. 1: definition of a diagram automorphism and condition (1). Stembridge defines a diagram automorphism as a permutation of the simple roots preserving their inner products and isolates orthogonality of simple orbits as condition (1). The determination of which automorphisms of finite irreducible types satisfy it is derived here from the pinned numbered Cartan matrices; it is not stated in the note. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The finite fold that repairs the inference needs this case split; it is derived here, not attributed to the paper.

### Finite folding for every based diagram automorphism

Target `RootSystemsPartII:general-fold` (construction).

For any finite reduced crystallographic Φ and based automorphism σ, the SET Ψ of distinct root-orbit sums in E^σ, with simple roots the simple-orbit sums β\_O, is a finite reduced crystallographic root system. It is the orthogonal direct sum of the return-map folds transported by D on component cycles. Every positive folded root is the sum of a positive root orbit. This is a theorem about orbit sums, with no assertion that orbit averages or restricted roots use the same normalization.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- σ is based; its preservation of the full Cartan matrix excludes length-exchanging graph permutations.

Construction or proof:

1. Use component-cycle to reduce to one irreducible system with its return-map automorphism.
2. Apply diagram-automorphism-orbits to the return map. On a nonsimply-laced component it is the identity, and the fold is the original system. On a simply-laced component its simple orbits are orthogonal, except for the reversal of A_(2n). D4 transpositions and three-cycles fall in the orthogonal case.
3. Apply orthogonal-fold in the orthogonal cases and adjacent-even-A-fold in the exceptional case.
4. Transport along D, then take the orthogonal direct sum. The roots of an orthogonal direct sum are the union of the roots of its summands, not arbitrary sums across unrelated component cycles. Positivity and the stated base follow from the transported simple coefficients.

Uses: RS2.4 invariant orbit-sum step — Provides the single finite folded root system for all allowed σ.; KZ25 Proposition 5.2.3, pp. 49–50 — Closes the combinatorial choice before any relative root subgroup or finite-field geometry is invoked.

API:

- `generalFold_roots` (characterisation): The folded root set is exactly the image of distinct orbit sums; every positive folded root has a positive original-root lift.
- `generalFold_base` (data): The base is indexed by simple σ-orbits with β\_O as its root vector.
- `generalFold_cases` (compatibility): The fold agrees, under the indicated based equivalences, with the orthogonal, adjacent-A, identity or component-cycle models.
- `generalFold_equiv` (functoriality): Based equivalences intertwining automorphisms induce based equivalences of the folds, preserving the orbit-sum vectors.
- `generalFold_empty` (simp): The fold of the empty system is the empty system on zero space.
- `generalFold_integral_root_span` (compatibility): The folded root lattice embeds in the invariant original root lattice by its simple-orbit sums; the reverse inclusion is the invariant-cone-transport theorem of RS2.4.

Discriminating unit tests:

- **generalFold_nonSimplyLaced**: The identity fold of B2 is B2; its length-exchanging graph reversal is rejected by the Cartan-preservation hypothesis.
- **generalFold_disjoint_cycles**: For A1⊕A1 with identity automorphism, α1+α2 is not a root of the fold; exchanging the two components instead gives the A1 fold with simple root α1+α2.
- **generalFold_adjacent**: A4 reversal uses the eight-root B2 orbit-sum model, including the short root f2.
- **generalFold_triality**: D4 triality uses the twelve-root G2 model with Cartan product 3.

Checks:

- Covers rank zero, identity, component permutations, D4 triality and adjacent even-A reversal.
- Swapping long and short vertices of B2, G2 or F4 is not an allowed based Cartan automorphism.

Direct prerequisites: `RootSystemsPartII:orthogonal-fold`, `RootSystemsPartII:adjacent-even-A-fold`, `RootSystemsPartII:component-cycle`, `RootSystemsPartII:diagram-automorphism-orbits`.

Sources: [Stem08] condition (1), p. 1; Claims 1 and 3, pp. 2–3; Claim 4, p. 3. Under orthogonality of simple orbits, orbit sums give the finite folded roots and their reflection group is the fixed Weyl subgroup. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

## RS2.4: Invariant dominance and coroot orbit steps

Prove forward weight-lattice integrality and equivalence of chambers under folding, with the adjacent pairing factor of two explicit. Identify the invariant integral positive root cone with the folded cone by coefficient uniqueness. Apply the ordinary Stembridge step in the fold to select a suitable positive orbit sum. Export the theorem to actual reductive cocharacter lattices while retaining central directions; distinguish the existential choice from summing arbitrary individually eligible increments.

Stage dependencies: `RootSystemsPartII:RS2.1`, `RootSystemsPartII:RS2.3`.

### Invariant integral weights in the folded chamber

Target `RootSystemsPartII:invariant-weight-transport` (theorem).

If λ∈E^σ has integral original simple-coroot values, then it is integral for the folded system Ψ. Its folded simple-coroot value at β\_O is the common original value d_O when the simple orbit is orthogonal, and 2d_O in the transported adjacent-middle even-A case. Therefore λ is original-dominant iff it is folded-dominant. The image of the invariant original weight lattice need not equal the full folded weight lattice.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- Use general-fold and its inherited form. For the reverse chamber equivalence, no assertion of reverse integrality is made.

Construction or proof:

1. σ-invariance makes the original coroot evaluations constant on each simple orbit.
2. For an orthogonal orbit O with common squared root length l², (β\_O,β\_O)=|O|l² and 2(λ,β\_O)=|O|l²d_O. The ratio is d_O.
3. For the adjacent even-A orbit use the explicit doubled pairing. Component cycles scale numerator and denominator equally.
4. The multiplier is always a positive integer (1 or 2). This proves forward integrality and equivalence of signs, and hence equivalence of closed chambers. It does not divide a folded integral value by 2.

Checks:

- In A2 reversal, original pairings (1,1) yield folded pairing 2. The folded weight of pairing 1 has no invariant original-integral preimage.
- Works on chamber walls (zero values); strict regularity is not required.

Direct prerequisites: `RootSystemsPartII:general-fold`, `tauceti:TauCeti.dominantChamber`, `mathlib:RootPairing.RootForm`, `mathlib:RootPairing.posRootForm_rootFormIn_posDef`.

Sources: [Stem08] condition (1), p. 1; Claims 1 and 3, pp. 2–3; Claim 4, p. 3. Under orthogonality of simple orbits, orbit sums give the finite folded roots and their reflection group is the fixed Weyl subgroup. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Invariant integral cone transport

Target `RootSystemsPartII:invariant-cone-transport` (theorem).

For δ∈E^σ, δ∈Q⁺(Φ,Δ) iff δ=Σ\_O n_O β\_O with n_O∈N, equivalently δ∈Q⁺(Ψ,B). The coefficients are unique. In particular, for original-integral invariant endpoints, integral dominance agrees with folded integral dominance. Also Q(Φ)^σ is exactly the embedded folded root lattice.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- Use general-fold and the identification of its simple root vectors inside E.

Construction or proof:

1. Expand δ in the linearly independent original simples. Applying σ permutes these coefficients; invariance and uniqueness force them to be constant on each orbit.
2. Regroup the sum once per distinct simple orbit; n_O is that common coefficient, with no division by |O|.
3. Conversely expand each β\_O as its defining sum; natural coefficients stay natural. The same argument with integer coefficients gives the root-lattice equality.

Checks:

- A2 reversal: c(α1+α2) has folded coefficient c, not 2c and not c/2.
- Rational-cone comparability without integral coefficients does not meet the theorem’s integral-cone hypothesis.
- The comparison is between root lattices and their cones, not an identification of the full invariant weight lattice with the folded weight lattice.

Direct prerequisites: `RootSystemsPartII:integral-order`, `RootSystemsPartII:general-fold`, `mathlib:RootPairing.Base`, `tauceti:TauCeti.mem_posRootCone`.

Sources: [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Existential dominant orbit-sum step

Target `RootSystemsPartII:invariant-step` (theorem).

Let λ,μ∈L be distinct σ-fixed dominant integral weights with RootLE(λ,μ). There exists α∈Φ⁺ such that β=OrbitSum(σ,α) is nonzero, λ+β is σ-fixed, dominant and in L, and λ<\_Qλ+β≤\_Qμ. The choice is existential; it is not valid to sum an arbitrary orbit of individually allowable roots.

Hypotheses:

- Finite reduced crystallographic real root system Φ spanning E, with base Δ; rank zero is allowed.
- A chosen integral subgroup L satisfies Q(Φ) ⊆ L and every coroot takes integral values on L. Dominance is the existing closed simple-coroot chamber.
- σ is based and preserves L.

Construction or proof:

1. Use invariant-weight-transport and invariant-cone-transport to regard the endpoints as dominant integral weights of the finite folded system. Apply stembridge-step there.
2. Use generalFold_roots to lift the positive folded root to a positive original root orbit. Sign is constant on an original orbit because σ is based, so a positive folded root cannot come from a negative orbit.
3. Its orbit sum lies in Q⊆L and is σ-fixed. Transport the dominant condition and the remaining integral cone budget back to Φ. Positivity makes the lower comparison strict.
4. For cocharacters apply the statement to the COROOT system, with λ tested by the original roots. A choice of a short relative-root lift in an adjacent case, and all maps of root subgroups, are separate consumer interfaces.

Checks:

- A2 reversal and endpoints 0,α1+α2 admit the simple two-member orbit.
- D4 triality regression: λ=2ρ and μ=λ+θ, θ=α1+2α2+α3+α4 with central node 2. The orbit of α1+α2 gives individually dominant bounded increments, but its sum α1+3α2+α3+α4 exceeds θ. The fixed highest root is a suitable alternative.
- The theorem supplies a finite coroot increment, not the geometric curve of KZ25 Proposition 5.2.3.

Direct prerequisites: `RootSystemsPartII:stembridge-step`, `RootSystemsPartII:invariant-weight-transport`, `RootSystemsPartII:invariant-cone-transport`, `RootSystemsPartII:general-fold`, `RootSystemsPartII:orbit-sum`, `tauceti:TauCeti.isPointed_posRootCone`.

Sources: [Rap00] §2, Lemma 2.3 and equations (2.10)–(2.13), pp. 157–158. Dominant endpoints with an integral positive-coroot difference admit a positive-coroot step; the proof chooses a maximal eligible root. [Stem08] condition (1), p. 1; Claims 1 and 3, pp. 2–3; Claim 4, p. 3. Under orthogonality of simple orbits, orbit sums give the finite folded roots and their reflection group is the fixed Weyl subgroup. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

### Coroot step with central directions retained

Target `RootSystemsPartII:ambient-coroot-export` (theorem).

Let P be a finite reduced crystallographic real root pairing in finite-dimensional perfectly paired weight spaces V,V\*, not necessarily spanned by the roots. Let σ be a P-automorphism preserving the base, and let λ,μ in a σ-stable subgroup L⊆V be fixed, dominant, integral on simple coroots, and distinct with μ−λ∈Q⁺. Assume Q⊆L. Then the conclusion of invariant-step holds in V. Apply P=the flipped real root pairing of a reductive root datum to obtain the integral positive-COROOT orbit step on its actual cocharacter lattice, preserving the common central component.

Hypotheses:

- Finiteness, reducedness and crystallographicity concern the root set.
- The ambient pairing is perfect; the induced finite root system on its real span has the canonical positive form. No finite-order assumption on σ on extra central directions is imposed.

Construction or proof:

1. Put E=span_R Φ and Z=the common kernel of all simple-coroot functionals. The symmetrized Cartan form is positive definite on E, hence the simple-coroot evaluation matrix on its simple basis is nonsingular. Solve this finite linear system to get V=E⊕Z and projection p preserving every simple-coroot evaluation. This uses only root-span positivity; it does not assert the canonical form is positive definite on V.
2. The decomposition is σ-stable: σ preserves roots and their coroot pairings. Thus pλ,pμ are fixed and retain the endpoint simple-coroot values. Since μ−λ∈E, pμ−pλ=μ−λ≠0.
3. Apply invariant-step on E with its full integral weight subgroup. The projected endpoints need not belong to the original L; their integral coroot values are all that is used.
4. The resulting increment β is in Q⊆L. Adding it to the ORIGINAL λ keeps the Z-component and lies below the ORIGINAL μ with the same integral difference budget. All simple-coroot values agree with those on E.
5. For a cocharacter lattice apply the entire construction to the dual pairing and the dual base. Work on the real span only inside this proof; the output is the sum of actual coroots in the original lattice.
6. For a σ-stable lattice with torsion, such as the inertia coinvariants X_\*(T)\_I that ReductiveGroupsPartII RG2.4 orders by its coweight dominance, apply the theorem to the image modulo torsion in X_\*(T)\_I⊗R. The coefficient budget of μ−λ lies in the free coroot lattice, which maps injectively to the real span, and the increment is a sum of actual coroots. So λ plus that increment lies in the original lattice, is σ-fixed and dominant, and satisfies both cone comparisons there.

Checks:

- A torus has no distinct comparable endpoints: with no coroots the order is equality, even if σ acts nontrivially on its cocharacter lattice.
- For GL2, λ=(c,c), μ=(c+1,c−1) differ by the coroot (1,−1); the step retains sum of coordinates 2c. No quotient by the center is substituted for the integral cocharacter lattice.
- For PGL2, the positive coroot remains 2 in X_\*=Z; the adapter does not admit the rational half-coroot.
- Torsion: the step lifts from the image of X_\*(T)\_I in X_\*(T)\_I⊗R to X_\*(T)\_I itself. No claim is made that the real displacement determines a class with torsion.

Direct prerequisites: `RootSystemsPartII:invariant-step`, `mathlib:RootPairing.posRootForm_rootFormIn_posDef`, `mathlib:RootPairing.Base`, `mathlib:RootPairing.Base.flip`.

Sources: [Rap00] §2, Lemma 2.3 and equations (2.10)–(2.13), pp. 157–158. Dominant endpoints with an integral positive-coroot difference admit a positive-coroot step; the proof chooses a maximal eligible root. [KZ25] §5.2, proof of Proposition 5.2.3, pp. 49–50; derived replacement for its orbit-sum inference. The consumer requires an invariant positive-coroot increment. The explicit folding adapters and the existential strengthening below are derived here, rather than attributed as statements proved at this locator.

## Worked checks of the endpoint

**A2 with reversal.** With α1 and α2 of squared norm 2 and mutual pairing −1, the simple orbit sum f=α1+α2 has squared norm 2. An invariant weight with original simple-coroot values (d,d) pairs to 2d with f∨. Thus an invariant original-integral weight lands in the even part of the folded weight lattice; surjectivity onto the full A1 weight lattice fails. For endpoints 0 and f, the folded Stembridge step is f. It can be lifted either by the fixed highest root or by the adjacent simple pair. The second lift is available when the geometric short restricted-root convention calls for it.

**D4 with triality.** Number the central node 2 and cycle the outer nodes 1,3,4. The folded simple roots β\_o=α1+α3+α4 and β\_c=α2 have squared norms 6 and 2. Their off-diagonal pairings are −3 and −1 in that order. This is the twelve-root G2 fold. A supplied period six is harmless only if distinct orbit elements are used: summing six iterates instead would double β\_o.

For a regression against the erroneous generic summation inference, let λ=2ρ, μ=λ+θ, θ=α1+2α2+α3+α4. All simple-coroot values of λ equal 2; θ has values (0,1,0,0), so both endpoints are dominant and triality-fixed. The root α1+α2 has values (1,1,−1,−1); after adding to λ the values are (3,3,1,1), all nonnegative. Its three translates are individually eligible and bounded by θ. Their sum has coordinates (1,3,1,1), exceeding the central budget 2. The fixed root θ itself gives a suitable orbit. The endpoint theorem selects an orbit; it does not certify all individually eligible choices.

**Central directions and parity.** In the PGL2 cocharacter lattice Z, the positive coroot is 2; the difference 1 passes the positive rational-cone test but fails the integral test. In GL2, (c,c)≤(c+1,c−1) has difference the coroot (1,−1); the selected step keeps the central coordinate sum 2c. In a torus there are no distinct comparable endpoints. These are tests of the lattice interface as well as of the finite root computation.

## Source correction and its scope

The author preprint of Kisin–Zhou, proof of Proposition 5.2.3, pp. 49–50, passes from individually bounded translates to an orbit-sum bound. The D4 calculation above shows that the generic implication requires a stronger choice argument. This was already recorded and independently confirmed as `PAPER-KISIN-ZHOU-25/E12`. RS2.2–RS2.4 provide that argument by applying the ordinary lemma to the folded **coroot** system after checking its integral chamber and cone. This finding concerns the proof inference; it asserts no counterexample to the geometric proposition. The Annals landing page and an erratum search were checked on 18 October 2026, but the final text could not be obtained from Annals or Project Euclid. All page citations for Kisin–Zhou in this document refer to the inspected author PDF.

## Exact baseline leaves

Each name in this table was checked in its source at the stated pin. `RootPairing.Base` includes the simple-root and simple-coroot independence fields. Generated structure projections need not appear in the declaration index. Only the existing declaration is cited; its implementation is not a new node here.

| Declaration | Supplies |
|---|---|
| [`tauceti:TauCeti.posRootCone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Additive submonoid of natural simple-root sums, already the required integral cone; no new cone construction. |
| [`tauceti:TauCeti.mem_posRootCone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Membership is an expression as a finite sum of natural multiples of simple roots. |
| [`tauceti:TauCeti.isPointed_posRootCone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Pointedness, hence antisymmetry of the translated cone relation. |
| [`tauceti:TauCeti.exists_root_eq_sum_nat_of_mem_posRoots`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Every positive root has natural simple-root coordinates. |
| [`tauceti:TauCeti.heightLinearMap_sum_nsmul_root`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Height of a natural simple-root sum is its total coefficient sum. |
| [`tauceti:TauCeti.exists_intCast_eq_coroot'_of_mem_posRootCone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Positive.lean) | Integral simple-root sums have integral coroot evaluations. |
| [`tauceti:TauCeti.dominantChamber`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Chamber.lean) | Existing closed chamber; it is tested by nonnegative simple-coroot evaluations. |
| [`tauceti:TauCeti.finite_setOf_dominant_sub_mem_posRootCone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/DominantCone.lean) | Finiteness of the dominant integral weights below a fixed weight in the integral cone. Cited by the reader as the existing finite-interval interface; no node needs it as a prerequisite. |
| [`mathlib:RootPairing.Base`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Base.lean) | A finite base, its linearly independent simple roots/coroots and signed integral expansions. |
| [`mathlib:RootPairing.Base.flip`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Base.lean) | The base of the dual pairing with unchanged simple index support. |
| [`mathlib:RootPairing.Base.IsPos.induction_on_reflect`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Base.lean) | Positive-root descent to a simple root; used in folding and in reducing to a connected component. |
| [`mathlib:RootPairing.root_add_root_mem_of_pairingIn_neg`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Finite/Lemmas.lean) | Two nonopposite roots with negative integral Cartan pairing have a root as their sum; positivity excludes the opposite-root exception. |
| [`mathlib:RootPairing.Base.cartanMatrix_le_zero_of_ne`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean) | Distinct simple roots have nonpositive Cartan pairing; finite crystallographic hypotheses retained. |
| [`mathlib:RootPairing.Aut`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Hom.lean) | Existing root-pairing automorphisms with weightMap and indexEquiv; a based automorphism is one preserving the base support. |
| [`mathlib:RootPairing.RootForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Finite/CanonicalBilinear.lean) | Canonical form: the sum over all roots of products of coroot evaluations. Its invariance under a root-pairing automorphism is derived by reindexing that finite sum; no pinned lemma states it. |
| [`mathlib:RootPairing.posRootForm_rootFormIn_posDef`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean) | Positive definiteness of the canonical form on the real root span; no nondegeneracy assertion on additional central directions. |
| [`tauceti:RootPairing.finite_weylGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean) | Finite Weyl group on a finite spanning root system. |
| [`tauceti:RootPairing.weylGroupToPerm_injective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean) | Faithfulness on the root indices when roots span; used only on the semisimple span. |
| [`tauceti:TauCeti.existsUnique_dynkinType`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.lean) | Classification of a nonempty irreducible finite reduced crystallographic spanning root system by a valid Dynkin type. |
| [`tauceti:TauCeti.exists_mem_support_mem_inversions_of_ne_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Inversions/StrongExchange.lean) | A nonidentity finite Weyl-group element has a simple inversion. |
| [`tauceti:TauCeti.ncard_inversions_mul_ofIdx_of_mem`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Inversions/Exchange.lean) | Multiplying on the right by an inverted simple reflection decreases inversion cardinality by one. |
| [`tauceti:TauCeti.stabilizer_eq_closure_wallReflections`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean) | Stabilizer of a dominant vector is generated by its wall reflections. |
| [`tauceti:TauCeti.wallReflections_eq_empty_of_mem_openDominantChamber`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean) | An interior chamber point has no wall reflections, hence has trivial Weyl stabilizer. |
| [`tauceti:TauCeti.isTree_diagramGraph_cartanMatrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FiniteType/Diagram.lean) | For a nonempty irreducible finite reduced crystallographic spanning root system over a characteristic-zero domain, the Dynkin diagram of a base is a tree. |
| [`tauceti:TauCeti.diagramGraph_adj`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FiniteType/Diagram.lean) | Two indices are adjacent in the diagram of an integer matrix exactly when they are distinct and both entries between them are nonzero; for a base, distinct nonadjacent simple roots have zero Cartan entry. |
| [`tauceti:TauCeti.DynkinType.cartanMatrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/DynkinType.lean) | The Bourbaki-numbered Cartan matrix of each Dynkin type, read for the case inspection of diagram symmetries. |
| [`tauceti:TauCeti.HasCartanType`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/DynkinType.lean) | A base has Cartan type t when one simultaneous relabelling of its simple roots by Fin t.rank matches its Cartan matrix with that of t. |
| [`tauceti:TauCeti.DynkinType.mem_diagramSymmetry_iff`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/DiagramPermutations.lean) | A node permutation lies in the symmetry group of a numbered Dynkin type exactly when it preserves every entry of the numbered Cartan matrix. |
| [`tauceti:RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/FiniteType/Irreducible.lean) | A spanning crystallographic root pairing over a characteristic-zero field whose base has a connected Dynkin diagram is irreducible. |
| [`tauceti:TauCeti.DynkinType.typeASimplyConnectedRootDatum`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean) | The pinned integral root datum of type A_n on Fin n → ℤ with the dot-product pairing; its roots are the classical e_a − e_b (a ≠ b), simple roots first. |
| [`tauceti:TauCeti.DynkinType.hasCartanType_typeASimplyConnectedRootDatum`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean) | The pinned type-A_n datum with its Bourbaki-numbered base has Cartan type A n. |
| [`tauceti:TauCeti.DynkinType.typeAGraphAut`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean) | The graph automorphism of the pinned type-A_n datum: e_a ↦ −e_(rev a) on the classical model, hence e_a − e_b ↦ e_(rev b) − e_(rev a). |
| [`tauceti:TauCeti.DynkinType.indexEquiv_typeAGraphAut_typeASimpleIndex`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean) | On the Bourbaki-numbered simple root indices the graph automorphism is the reversal i ↦ rev i. |
| [`tauceti:TauCeti.rootPairingBaseChange`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/BaseChange.lean) | Base change of a dot-product root pairing on the standard lattices along an injective algebra map (here ℤ → ℝ), keeping the reflection permutation. |
| [`tauceti:TauCeti.rootPairingBaseChangeBase`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/BaseChange.lean) | The base of a base-changed pairing, supported on the same indices as the original base. |
| [`tauceti:TauCeti.isReduced_rootPairingBaseChange`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/BaseChange.lean) | Base change along an injective map into a domain preserves reducedness. |
| [`mathlib:RootPairing.Base.equivOfCartanMatrixEq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean) | An equivalence of root pairings built from a relabelling of simple roots that preserves the Cartan matrix, the target being finite, spanning and reduced. |

## Independent continuation briefs

The five routes share the integral order but have three distinct outputs. The finite folding proof uses only finite root combinatorics. The affine direction needs an extended affine action, Bruhat/Demazure and twisted Newton reduction; the modular direction needs integral representations and characteristic-p root operators. Neither direction is a prerequisite of finite folding, and neither representation theory nor an affine action is needed to state its endpoint theorem. PROTOCOL §9 and the issue explicitly authorize planning the first direction and proposing separate design jobs for the others.

### Dominant subtraction, Demazure products and affine Newton reduction

Retain the routed candidate id RootSystemsPartIIDominanceAndDemazure for the affine/normalized-subtraction continuation, parent tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems, area grouptheory. Import RS2.1 integral dominance once, the upstream RootSystems and LieHighestWeight interfaces where actually supplied, and the proposed ReductiveGroupsPartII RG2.1/RG2.4 full affine-action/relative-root adapters. Design DA.1 parabolic representatives, support and shrunken chambers (He21 /9,/22,/28); DA.2 the feasible-set construction and least dominant normalized subtraction on the FULL coweight lattice P∨, with ordinary-difference comparison, dominant representative bound, iterated law and auxiliary coweights (/53–/60,/62); DA.3 Demazure product, associativity/unit, Bruhat monotonicity, support/length factorization and support preservation (/37–/40,/81), plus Zhu H04 longest double-coset involution indexing; DA.4 twisted reduction, RedMin, twisted Coxeter and minimal finite-Coxeter-part classes (/29,/30,/114–/116), together with all 21 He18 items: κ in Ω/(1−θ)Ω, Newton by twisted powers, straight classes, standard triples, axis/gradient and partial-conjugation reductions, guarded finite minima and unguarded finite class fibres via Ω-transport; DA.5 the shrunken sign/length identities and numerical Newton tests (/71,/73,/74,/96,/98,/101). Full affine central translations and possible torsion kernels must survive. Do not assume a semidirect splitting or faithful affine action. Enforce the Ω finite-fibre guard only on finite-minima claims, not on finite-class-fibre claims. Keep arithmetic B(G) comparison with BunG, and generic Hecke/KL module theory with SmoothRepresentationsPartIIParahoricCenters. Essential tests: s\*s=s, singular A2, A1 lattice parity, central GL2 length zero, ordinary/inverted Gm, affine s0 nonstraight, empty/infinite parabolics, the stated minuscule exception, and the ^2A2 obstruction to lifting a normalized subtraction to the original lattice. Read source proofs and existing suppliers afresh in that design job; this brief certifies no supplier implementation. A sixth paper, Le–Le Hung–Levin–Morra (PAPER-LE-LEHUNG-LEVIN-ETAL-23), routes 26 further items to this candidate (M10, N02–N21, N24, N26, N75, N76, N80: extended affine Weyl group, admissible pairs and opposition). Its paper review was still open when this design ran, so they are not in routingAssignment; the affine design takes them once that review accepts the route.

### Minuscule weights and modular representation bounds

Propose RootSystemsPartIIMinusculeBounds, parent tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems, area grouptheory. Import RootSystemsPartII:RS2.1 for KPZ R01, all finite root/classical coordinate data from upstream, and group-root-vector/modular-action interfaces from ReductiveGroups and its integral-representation continuation after checking their exact scopes. Design MB.1 root-datum minuscule weights, lifted fundamental weights and independence of lifts, geodesic weights, mod-p abelian-type coweights and dominance-detecting minuscule test sets in types A,B,C,D-real,D-quaternionic (R02,R13–R18,R31 and the three named lattice/geodesic items); MB.2 signed representation bounds and Cartan bounds (R11,R20–R24, l-alpha-reflection-identity, k-le-l-inequality), including the off-derived vanishing and end-wall case; MB.3 root-curve bound R05 and the D4 FM-versus-curve Cartan gap R27. Account for every item through routingAssignment. Preserve the distinction between actual weight incidence and modular root-operator action, signs in k_(−α), and characteristic-dependent l_α. Repair the source/extraction issues identified in the KPZ brief: dominant minuscule sums, the missing D end-weight family for α\_j with j≤n−4, and the incorrect equivalence of weight incidence with nonzero modular action. Essential tests: A1 signed bounds, half-integral B spin weights, both D end nodes, D4 bound 3 versus 2, and failure of the source B-type μ=(2,1,1) test set. These are design requirements, not an assertion that the routed source claims have all been verified in this finite-folding job.

The broad candidate name `RootSystemsPartIIDominanceAndDemazure` is retained for the proposed affine direction. The assigned `RootSystemsPartII` id and filenames remain those of this job. The older `RootSystemsDominancePartII` alias is consolidated into the single RS2.1 order. The maintainer applies the split and aliases; no independent supplier is created merely by naming it here.

### Complete routing ledger

The five input routes contain 80 stable items. Nine are covered here (eight Kisin–Zhou items and the shared KPZ integral order), fifty belong to the affine proposal and twenty-one to the modular proposal. All source items are assigned exactly once; several source items can use the same current node. The 26 items that Le–Le Hung–Levin–Morra route to the affine candidate are outside the five briefed routes and are listed with the affine brief above. The other direction briefs are requirements for their own source-proof and supplier audits, not a claim of mathematical closure for those directions.

| Source item | Owner / target |
|---|---|
| `PAPER-KISIN-ZHOU-25/C03` | `RootSystemsPartII:stembridge-step` |
| `PAPER-KISIN-ZHOU-25/C14` | `RootSystemsPartII:orbit-sum` |
| `PAPER-KISIN-ZHOU-25/C15` | `RootSystemsPartII:orthogonal-fold`, `RootSystemsPartII:fixed-weyl-group` |
| `PAPER-KISIN-ZHOU-25/C16` | `RootSystemsPartII:adjacent-even-A-fold` |
| `PAPER-KISIN-ZHOU-25/C17` | `RootSystemsPartII:component-cycle`, `RootSystemsPartII:general-fold` |
| `PAPER-KISIN-ZHOU-25/C18` | `RootSystemsPartII:invariant-weight-transport`, `RootSystemsPartII:invariant-cone-transport` |
| `PAPER-KISIN-ZHOU-25/C19` | `RootSystemsPartII:invariant-step`, `RootSystemsPartII:ambient-coroot-export` |
| `PAPER-KISIN-ZHOU-25/C25` | `RootSystemsPartII:integral-order` |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R01` | `RootSystemsPartII:integral-order` |
| `PAPER-HE-21/9` | `RootSystemsPartIIDominanceAndDemazure` — Parabolic subgroups and minimal representatives |
| `PAPER-HE-21/22` | `RootSystemsPartIIDominanceAndDemazure` — Finite and σ-saturated support |
| `PAPER-HE-21/28` | `RootSystemsPartIIDominanceAndDemazure` — Shrunken Weyl chamber |
| `PAPER-HE-21/29` | `RootSystemsPartIIDominanceAndDemazure` — Length-decreasing twisted conjugation |
| `PAPER-HE-21/30` | `RootSystemsPartIIDominanceAndDemazure` — Reduction to minimal length |
| `PAPER-HE-21/37` | `RootSystemsPartIIDominanceAndDemazure` — Demazure product |
| `PAPER-HE-21/38` | `RootSystemsPartIIDominanceAndDemazure` — Associativity and unit of Demazure product |
| `PAPER-HE-21/39` | `RootSystemsPartIIDominanceAndDemazure` — Bruhat monotonicity of Demazure product |
| `PAPER-HE-21/40` | `RootSystemsPartIIDominanceAndDemazure` — Demazure support and length factorizations |
| `PAPER-HE-21/53` | `RootSystemsPartIIDominanceAndDemazure` — Feasible dominant subtraction set is nonempty |
| `PAPER-HE-21/54` | `RootSystemsPartIIDominanceAndDemazure` — Common lower bound for two feasible coweights |
| `PAPER-HE-21/55` | `RootSystemsPartIIDominanceAndDemazure` — Least dominant feasible coweight |
| `PAPER-HE-21/56` | `RootSystemsPartIIDominanceAndDemazure` — Normalized dominant subtraction |
| `PAPER-HE-21/57` | `RootSystemsPartIIDominanceAndDemazure` — Agreement with ordinary dominant difference |
| `PAPER-HE-21/58` | `RootSystemsPartIIDominanceAndDemazure` — Dominant representative bounds normalized subtraction |
| `PAPER-HE-21/59` | `RootSystemsPartIIDominanceAndDemazure` — Iterated normalized subtraction |
| `PAPER-HE-21/60` | `RootSystemsPartIIDominanceAndDemazure` — Auxiliary fundamental coweight sum |
| `PAPER-HE-21/62` | `RootSystemsPartIIDominanceAndDemazure` — Descent set forces dominant shifted coweight |
| `PAPER-HE-21/71` | `RootSystemsPartIIDominanceAndDemazure` — Shrunken-chamber sign and first length cancellation |
| `PAPER-HE-21/73` | `RootSystemsPartIIDominanceAndDemazure` — Inversion containment gives length cancellation |
| `PAPER-HE-21/74` | `RootSystemsPartIIDominanceAndDemazure` — Left minimality and second additive length identity |
| `PAPER-HE-21/81` | `RootSystemsPartIIDominanceAndDemazure` — Support survives the Demazure construction |
| `PAPER-HE-21/96` | `RootSystemsPartIIDominanceAndDemazure` — Minuscule exception in the two Newton bounds |
| `PAPER-HE-21/98` | `RootSystemsPartIIDominanceAndDemazure` — Two-rho sufficient Newton bound |
| `PAPER-HE-21/101` | `RootSystemsPartIIDominanceAndDemazure` — Sufficiently large fundamental ray |
| `PAPER-HE-21/114` | `RootSystemsPartIIDominanceAndDemazure` — Twisted Coxeter elements |
| `PAPER-HE-21/115` | `RootSystemsPartIIDominanceAndDemazure` — Finite Coxeter part has zero Newton vector |
| `PAPER-HE-21/116` | `RootSystemsPartIIDominanceAndDemazure` — Minimal elements of a finite-Coxeter-part class |
| `PAPER-HE-18/C1` | `RootSystemsPartIIDominanceAndDemazure` — Twisted Kottwitz class |
| `PAPER-HE-18/C2` | `RootSystemsPartIIDominanceAndDemazure` — Newton vector by a twisted power |
| `PAPER-HE-18/C3` | `RootSystemsPartIIDominanceAndDemazure` — Newton invariance and arithmetic classifier |
| `PAPER-HE-18/C4` | `RootSystemsPartIIDominanceAndDemazure` — Length-nonincreasing twisted reduction |
| `PAPER-HE-18/C5` | `RootSystemsPartIIDominanceAndDemazure` — Affine twisted RedMin |
| `PAPER-HE-18/C6` | `RootSystemsPartIIDominanceAndDemazure` — Straight twisted elements |
| `PAPER-HE-18/C7` | `RootSystemsPartIIDominanceAndDemazure` — Straight-class arithmetic classification |
| `PAPER-HE-18/C8` | `RootSystemsPartIIDominanceAndDemazure` — Standard affine reduction triple |
| `PAPER-HE-18/C9` | `RootSystemsPartIIDominanceAndDemazure` — Reduction to a standard triple |
| `PAPER-HE-18/C10` | `RootSystemsPartIIDominanceAndDemazure` — Finite Ω-cosets under an explicit guard |
| `PAPER-HE-18/C11` | `RootSystemsPartIIDominanceAndDemazure` — Finite minimal elements in a guarded Newton fibre |
| `PAPER-HE-18/C12` | `RootSystemsPartIIDominanceAndDemazure` — Finite conjugacy-class fibres without the finite-minima guard |
| `PAPER-HE-18/C13` | `RootSystemsPartIIDominanceAndDemazure` — Newton affine axis |
| `PAPER-HE-18/C14` | `RootSystemsPartIIDominanceAndDemazure` — Gradient descent to an axis alcove |
| `PAPER-HE-18/C15` | `RootSystemsPartIIDominanceAndDemazure` — Finite-parabolic partial conjugation reduction |
| `PAPER-HE-18/C16` | `RootSystemsPartIIDominanceAndDemazure` — Axis-alcove parabolic factorization |
| `PAPER-HE-18/R5` | `RootSystemsPartIIDominanceAndDemazure` — Minimal finite-parabolic elements are globally minimal |
| `PAPER-HE-18/R6` | `RootSystemsPartIIDominanceAndDemazure` — Central-Newton minimal elements lie in a standard pair |
| `PAPER-HE-18/C17` | `RootSystemsPartIIDominanceAndDemazure` — Finite minimal representatives after Ω transport |
| `PAPER-HE-18/N19` | `RootSystemsPartIIDominanceAndDemazure` — Finite affine errors separate distinct translation slopes |
| `PAPER-HE-18/C18` | `RootSystemsPartIIDominanceAndDemazure` — Newton displacement for a possibly nonfaithful affine action |
| `PAPER-ZHU-17/H04` | `RootSystemsPartIIDominanceAndDemazure` — Longest double-coset involution indexing |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R02` | `RootSystemsPartIIMinusculeBounds` — Mod-p abelian-type coweight |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R05` | `RootSystemsPartIIMinusculeBounds` — Root-curve length bound |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R11` | `RootSystemsPartIIMinusculeBounds` — Representation root bound |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R13` | `RootSystemsPartIIMinusculeBounds` — Dominance-detecting minuscule test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R14` | `RootSystemsPartIIMinusculeBounds` — Type A dominance test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R15` | `RootSystemsPartIIMinusculeBounds` — Type B dominance test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R16` | `RootSystemsPartIIMinusculeBounds` — Type C dominance test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R17` | `RootSystemsPartIIMinusculeBounds` — Type D-real dominance test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R18` | `RootSystemsPartIIMinusculeBounds` — Type D-quaternionic dominance test set |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R20` | `RootSystemsPartIIMinusculeBounds` — Geodesic minuscule-weight formula for the negative root bound |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R21` | `RootSystemsPartIIMinusculeBounds` — Cartan representation bound |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R22` | `RootSystemsPartIIMinusculeBounds` — Cartan bound vanishes off the derived torus |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R23` | `RootSystemsPartIIMinusculeBounds` — Cartan bound from negative simple-root lengths |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R24` | `RootSystemsPartIIMinusculeBounds` — Type D-quaternionic Cartan bound on an end wall |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R27` | `RootSystemsPartIIMinusculeBounds` — D4 FM-versus-curve Cartan gap |
| `PAPER-KISIN-PAPPAS-ZHOU-26/R31` | `RootSystemsPartIIMinusculeBounds` — Root-datum minuscule weight |
| `PAPER-KISIN-PAPPAS-ZHOU-26/l-alpha-reflection-identity` | `RootSystemsPartIIMinusculeBounds` — Proposition 4.2.10(1) |
| `PAPER-KISIN-PAPPAS-ZHOU-26/k-le-l-inequality` | `RootSystemsPartIIMinusculeBounds` — Inequality (4.2.12): k_α ≤ l_α |
| `PAPER-KISIN-PAPPAS-ZHOU-26/lifted-fundamental-weights` | `RootSystemsPartIIMinusculeBounds` — Lattices P, P^∨ and lifted fundamental weights Ω, Ω^min |
| `PAPER-KISIN-PAPPAS-ZHOU-26/dominance-via-fundamental-weights` | `RootSystemsPartIIMinusculeBounds` — Remark 4.2.14: independence of lifts and dominance criterion |
| `PAPER-KISIN-PAPPAS-ZHOU-26/geodesic-weights` | `RootSystemsPartIIMinusculeBounds` — Dynkin geodesics and the weights ϖ\_α |

## Sources and completion tests

- **[Rap00]** Michael Rapoport; Lemma 2.3 credited to John R. Stembridge, proof to Jean-Loup Waldspurger. [A positivity property of the Satake isomorphism](https://people.math.uni-bonn.de/rapoport/preprints/satake.pdf). Manuscripta Mathematica 101 (2000), 153–166; author PDF, read 18 October 2026. Read: §1, pp. 153–154: integral coroot order; §2, pp. 156–158: PGL2 and Lemma 2.3, including the complete maximal-root proof.
- **[Stem08]** John R. Stembridge. [Folding by Automorphisms](https://websites.umich.edu/~jrs/papers/folding.pdf). Author note dated 20 August 2008, 4 pages; read 18 October 2026. Read: pp. 1–3: condition (1), equations (2)–(4), Claims 1, 3 and 4 with their proofs; finite case only used.
- **[KZ25]** Mark Kisin and Rong Zhou. [Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties](https://www.dpmms.cam.ac.uk/~rz240/l-indep_v2.pdf). 63-page revised author preprint l-indep_v2.pdf; bibliographic final: Annals of Mathematics 202 (2025), 1077–1156. All locators here refer to the author preprint, not the uninspected final text. Read 18 October 2026. Read: §5.2, Proposition 5.2.3 and its proof, pp. 49–52; Corollary 5.2.7, pp. 52–53. Combinatorial step read directly, geometric statements used only to identify the interface.

A completed implementation must provide the six definition/construction APIs and all twenty-four discriminating tests above, the seven theorem targets, and their compatibility with the pinned root-pairing vocabulary. In particular it must pass the adjacent-A factor-of-two, D4 period-six, component-return-map, central-lattice and arbitrary-orbit rejection checks. No theorem is accepted with a rationalized cone, an averaged orbit sum, an unjustified surjection of weight lattices, or a faithful-action assumption on an unrelated central quotient.

The planet set is the named target list in the packet: two planets in RS2.1, three in RS2.2, three in RS2.3 and three in RS2.4. The RS2.3 case split for based automorphisms is a supporting theorem, not a planet. The ambient coroot export is a target of RS2.4 accompanying its three central planets. Each finite layer is planned with no unresolved mathematical gap or external request. The two independent directions require their own design jobs if the split is accepted.
