# Continuous cohomology of profinite groups, Part II: Massey products and Galois lifting

This roadmap extends **ProfiniteCohomology** from continuous cohomology and its cup products to degree-one Massey products interpreted through finite unipotent groups. Its endpoints are the refined local lifting theorem at every completion, its rank-one twisted version, and a defined triple product in H¹(Q,Z/8) which excludes zero. The finite stabilizer calculations also supply the homogeneous-space proof of number-field mod-p vanishing, whose geometric and global arguments belong to **HeightsRationalPointsPartIIHomogeneousMassey**.

The specification below is definitive. The accompanying suggested file gives statements that can already be expressed using the pinned library carriers. Objects requiring the continuous cochain DGA, filtered-block quotients, or arithmetic Sha interfaces are specified here, without placeholder carriers in that file. Every target remains a proposed library contribution; an elaborated signature is not a proof.

Use Mathlib `ContinuousMap`, `LinearMap`, `ConjClasses`, `FreeGroup` and `PresentedGroup`, Tau Ceti's `upperUnitriangularGroup`, its `superdiagonalSubgroup`, and the parent continuous-cohomology carriers. Use DGAInfinity's dg-category and defining-system carriers. There is one continuous-cohomology theory and one generic Massey-product theory.

## Conventions and supplier interfaces

Write Γ for a profinite group, Γ_K for the absolute Galois group of a field, and H^q for the parent roadmap's continuous cohomology with discrete coefficients. Finite coefficient rings and modules carry the discrete topology. Inhomogeneous cochains have the differential

\[
(df)(g_1,\ldots,g_{q+1})=g_1f(g_2,\ldots,g_{q+1})+
\sum_{i=1}^q(-1)^if(g_1,\ldots,g_ig_{i+1},\ldots,g_{q+1})
+(-1)^{q+1}f(g_1,\ldots,g_q).
\]

Thus d⁰u(g)=g·u−u and d¹a(g,h)=g·a(h)−a(gh)+a(g). For degree-one defining systems use d a_ij=−Σ a_im∪a_mj and value −Σ a_0m∪a_mn. A corner extension class computed with the usual factor-set convention is therefore the **negative** of the attached Massey value. Nonempty and containing zero are separate conditions.

For finite commutative R, write U=UT_(n+1)(R), with indices 0,…,n. Let F_r be the pinned superdiagonal subgroup: g−1 is supported at distance at least r. The paper's U^m is F_(m+1), so U¹=F₂ and U³=F₄. Write e_ij(t)=1+tE_ij. Commutators are xyx⁻¹y⁻¹. Distinguish B=(U¹)^ab, its boundary submodule B_boundary, and the Bogomolov multiplier B_Bog(H). All lifts in this roadmap are continuous **weak** solutions; a lift need not be surjective.

The external contracts are:

- **ProfiniteCohomology**, Layers 0,2,3,5,8,9,10,11,12: discrete modules and continuous sections; explicit C⁰,C¹,C² and comparison maps; long exact sequences; low-degree and graded cups; Hilbert 90/Kummer; all-degree cohomology, restriction/corestriction and Shapiro; general cohomological dimension. Arithmetic values of cd_p(Γ_K) are not assigned to Layer 11.
- **DGAInfinity**, Layers 1 and 8: strict dg-algebra/dg-category carriers and generic matric defining systems/Massey subsets. M.0 and M.9 instantiate these, with a stated convention comparison. The Layer 8 request explicitly includes integral finite-gauge representative invariance; its characteristic-zero exponential gauge interface cannot supply this for F_p or Z/8.
- **ProfiniteProPGroups**, Layer 5: weak finite-kernel embedding problems and the continuous abelian-extension/H² dictionary, including splitting iff the pulled-back obstruction vanishes. Reuse its continuous sections and factor sets.
- **ClassFieldTheory**, Layer 5: local Tate duality for finite modules when the coefficient prime differs from the field characteristic, its evaluation cup, and H²(K,F_p)=H⁰(K,μ_p)^∨. This includes equal-characteristic local fields with p different from their characteristic. Current Tau Ceti already supplies this generality in `ClassFieldTheory.dualityMap0_kummerCoeff_bijective`, `dualityMap1_kummerCoeff_bijective` and `dualityMap2_kummerCoeff_bijective` in `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean`; reuse it through the parent coefficient dictionary. The existing implementation has broader scope than the roadmap's mixed-characteristic perfect-pairing milestone. **HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists** supplies ordinary cd_p(Γ_K)≤1 for a one-local field of characteristic p.
- **ArithmeticGaloisDuality:R02.1**, nodes `pointwise-hom`, `discrete-hom-finitely-generated`, `splitting-torsor` and `connecting-cup-formula`: the existing internal Hom and splitting class, with finite-domain discreteness and the signed connecting formula. Only concrete unipotent specializations are targets here.
- **InverseGaloisAndArithmeticFundamentalGroups:IG.4**, nodes `finite-galois-localization`, `restricted-poitou-tate`, `solution-twisting`, `grunwald-wang-boundary`, `independent-cyclic-eight-lifts`, `wang-cyclic-eight-counterexample`: all-place Sha groups, finite perfect duality, abelian-kernel twisting, the power kernel, and the independent endpoint characters used in M.11. Finite Sha duality has this existing owner.

The current **ProfiniteArithmetic** roadmap uses Mathlib conjugacy classes and Tau Ceti profinite powering. M.3 uses ordinary finite-group powers to specify the additional least-divisor invariant; it introduces no second profinite powering, conjugacy, or continuous outer-automorphism carrier. The current **LocalGaloisGroups** imports the ClassFieldTheory local-duality and mixed-characteristic dimension interfaces; none of those results is replanned here.

Current Tau Ceti also supplies all-degree Shapiro and corestriction and `ContCohomology.explicitCup11_eq_zero_iff`, the continuous Heisenberg-primitive criterion for a zero cup. These remain parent imports. The length-two case below checks compatibility with that criterion; the higher-length lift dictionary is the extension planned here. These current-library observations were checked at commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the pinned baseline `f790474`.

## M.0 — Continuous cochains and degree-one defining systems

Construct `continuousCochainDGA` on C^q_cts(Γ,R)=C(Γ^q,R), with C⁰=R, for a discrete commutative Γ-ring R with continuous action. Define

\[
(f\cup g)(g_1,\ldots,g_{r+s})=
 f(g_1,\ldots,g_r)\,(g_1\cdots g_r)\cdot g(g_{r+1},\ldots,g_{r+s}).
\]

Regard this as a DGA over Z, or over the fixed subring; for trivial Γ-action it is an R-DGA. The target includes strict associativity and unit on arbitrary cochains, d²=0, and d(f∪g)=df∪g+(−1)^r f∪dg. Continuity belongs to the construction. The associated coefficient representation is R as an additive group; the differential need not be linear over R when Γ acts nontrivially on R.

Give these cochain groups and their cohomology the discrete topology. On C(Γ^q,R), compactness of Γ^q and discreteness of R identify it with the compact-open topology. For the parent's low-degree plain-function subquotients, use its discrete wrappers: the inherited pointwise topology can differ.

**API for continuous inhomogeneous cochain algebra.** `continuousCochainDGA` the DGA with the displayed carriers, differential, cup and constant unit. `continuousCochainDGA_d_apply` the inhomogeneous differential on each degree, including d⁰m(g)=g·m−m. `continuousCup_assoc` strict associativity for arbitrary cochains, before assuming they are cycles. `continuousCup_leibniz` the displayed signed differential rule in every pair of degrees. `continuousCochainDGA_pullback` pullback along continuous group homomorphisms and equivariant ring maps is a DGA morphism.

`continuousCochainDGA_cochain_ext` reuses `ContinuousMap.ext`: equality is determined by values on all q-tuples.

**Checks.**

1. **`continuousCochainDGA_degreeZero`:** For Γ=1, the unnormalized complex has C^q=R and alternating differential; H⁰=R and H^q=0 for q>0.
2. **`continuousCup_degree11`:** The (1,1) formula is a(g)·g b(h), and its class is the pinned explicitCup11.
3. **`continuousCup_degree111`:** For arbitrary f,g,h in C¹, both bracketings at (x,y,z) equal f(x)·x g(y)·xy h(z), with no cocycle hypotheses.
4. **`continuousCup_noncycleLeibniz`:** The degree-(1,1) rule contains −f∪dg; the unsigned formula fails over F₃ on a noncocycle of C₃.
5. **`continuousCochainDGA_discreteTopology`:** For Γ=∏_N C₂ with trivial F₂ coefficients, compare discrete H¹ with the canonical object. Finitely many evaluations cannot isolate the zero character in the inherited pointwise topology.

The **canonical continuous-cohomology comparison** identifies this DGA's cohomology with the parent H^q in every degree, as an isomorphism of discrete objects in `TopModuleCat Z`. Explicitly send f to F(g₀,…,g_q)=g₀·f(g₀⁻¹g₁,…,g_(q−1)⁻¹g_q); recover f(h₁,…,h_q) by evaluating F at (1,h₁,h₁h₂,…,h₁⋯h_q). Compact-open currying identifies homogeneous equivariant cochains with the invariant elements of the parent's actual `TopRep.resolutionX` iterated continuous-coinduction complex, with its degree shift. Profinite Γ and its finite powers are locally compact, so uncurry is available. Check the two chain-map identities and identity augmentation. The comparison must agree with the existing explicit degree-zero, degree-one and degree-two discrete comparison maps and carry its cochain cup to the parent's graded cup by translating its Alexander–Whitney formula, including pinned `explicitCup11`.

Specialize the generic degree-one defining system to this DGA. Its entries are continuous 1-cochains a_ij, excluding (0,n), whose adjacent entries are fixed cocycles a_i and whose differential is the negative cup sum above. Its value is a continuous 2-cocycle; its class is transported by the canonical comparison. The class-level product ranges over representatives as well as higher entries.

**API for continuous defining systems.** `continuousDefiningSystem` specialization equivalence from the generic DGA object to continuous entries with the displayed equations. `continuousDefiningSystem_entry` entry a_ij, its continuity, and its adjacent-entry and differential equations. `continuousDefiningSystem_value` the canonical H² class of the signed corner cocycle. `continuousMasseyProduct` the subset of H² formed from all defining systems for the input classes. `continuousDefiningSystem_pullback` restriction carries a defining system and its value to their pullbacks.

`continuousDefiningSystem_ext` identifies systems over the same adjacent cocycles when all permitted cochain entries agree; their equation and continuity fields are propositions.

**Checks.**

1. **`continuousMassey_lengthTwo`:** For n=2 the product is the singleton {−a₀∪a₁}.
2. **`continuousMassey_zeroInputs`:** All zero entries give a system of value zero; this asserts membership, not that every possible value is zero.
3. **`continuousMassey_finiteDiscrete`:** For finite Γ, every cochain is continuous and the interface is the ordinary inhomogeneous DGA specialization.
4. **`continuousMassey_empty`:** For n=3 a defining system exists exactly when both adjacent cup classes vanish; no H² value is assigned if one does not.

The **changes of adjacent representatives** theorem proves that definedness and zero-membership depend only on the H¹ classes. Specialize the requested DGAInfinity integral finite-gauge theorem. Write a defining system as a strictly upper-triangular degree-one matrix A with corner entry zero, so dA+A² is supported only in the corner. For a′_i=a_i+du_i choose G=1+U of degree zero with adjacent entries U_i,i+1=u_i and finite geometric-series inverse. Then A′=G⁻¹AG+G⁻¹dG has the new adjacent entries, and its curvature is G⁻¹(dA+A²)G, the same corner curvature. Clearing the corner entry of A′ changes its value by a coboundary. The inverse gauge gives equality of H² value sets. All operations are finite sums and products, hence preserve continuity over F_p and Z/8 as well; no division is needed. The concrete adjacent-character conjugation formula is a target of M.9. In the constant-coefficient case every adjacent H¹ class has its unique continuous homomorphism representative, since d⁰=0. For twisted coefficients that uniqueness fails, and M.9 retains the actual adjacent cocycles in its bijection.

*Inputs:* PC0,2,3,10,12 and DGAInfinity1,8, including the explicit integral-gauge request. *Source:* Harpaz–Wittenberg (HW), Introduction pp. 1–2 for defining systems; Notation 2.1 and Proposition 2.2, p. 5, for their unitriangular interpretation; Definition 3.2, p. 9, concerns the outer exponent. The all-degree comparison and strict cochain laws are explicit interface targets motivated by these passages.

## M.1 — Unitriangular quotients and Dwyer correspondence

Start with the pinned UT carrier and transvection identities. Prove **ordered unitriangular factorization**, over every commutative ring: every element is uniquely an ordered product of e_ij(t), in increasing distance j−i and then increasing i. The parameters are determined recursively; they are not all the raw entries of the final matrix. Over F_p prove **exact superdiagonal commutators**, [F_r,F_s]=F_(r+s) for r,s≥1. The pinned library already supplies the forward inclusion. For the reverse inclusion express every permitted e_ij(t) as [e_(i,i+r)(t),e_(i+r,j)(1)], then generate by the ordered factorization. This identifies the paper's derived series and removes an indexing ambiguity in M.2.

Construct A=U/U¹ with its adjacent-entry isomorphism to the additive R^n and the central corner Z={e_0n(t)}. For finite R these are finite discrete quotients. The corner-zero section of U→U/Z determines u∈H²(U/Z,R); its factor set is the positive corner sum.

**API for adjacent-entry quotient.** `adjacentQuotient` the quotient A and coordinate isomorphism with Multiplicative(R^n). `adjacentMap_apply` the i-th coordinate is g_(i,i+1). `adjacentMap_ker` the kernel is exactly U¹. `adjacentQuotient_baseChange` ring maps commute with the quotient and every coordinate.

**Checks.**

1. **`adjacentQuotient_multiply`:** Adjacent coordinates of gh are g_(i,i+1)+h_(i,i+1), even when the 02-coordinate has a cross term.
2. **`adjacentQuotient_UT3`:** In size three the kernel consists exactly of the corner transvections.
3. **`adjacentQuotient_zeroRing`:** For the zero ring both U and A have one element.

**API for unitriangular corner extension.** `cornerExtension` the finite central extension and its normalized corner-zero section. `cornerInclusion_apply` t maps to 1+tE₀n; the inclusion is injective. `cornerExtension_factorSet` the section factor set has the displayed positive sum. `cornerExtension_class` the class u in canonical H²(U/Z,R), natural under coefficient maps.

**Checks.**

1. **`cornerExtension_UT3`:** For [[1,a,c],[0,1,b],[0,0,1]], the section gives factor set a b′.
2. **`cornerExtension_injective`:** 1+tE₀n=1 iff t=0.
3. **`cornerExtension_UT4`:** A transvection e₀₂(t) with t≠0 is not central in UT₄: it has nontrivial commutator with e₂₃(1).

The **Dwyer defining-system correspondence** is a bijection, for fixed adjacent cocycles and n≥2, between their defining systems and continuous lifts of the corresponding α:Γ→A to U/Z. Matrix multiplication is precisely the defining-system equation. Entrywise continuity is equivalent to continuity into these finite quotients. The assigned value is −α̃* u, with the sign checked on the corner-zero section.

The **Dwyer lifting criteria** then say: the product is defined iff α lifts to U/Z; it contains zero iff α lifts to U. Pull back the corner extension and use the PPG5 splitting criterion. The second statement is an existence statement among quotient lifts: an individual defining lift can have nonzero obstruction while another has zero obstruction.

**`orderedTransvections_UT3`:** The product e₀₁(a)e₁₂(b)e₀₂(c) has 02-entry c+ab; raw entries cannot be the parameters in this order.

**`dwyer_sign_lengthTwo`:** For n=2 the value is −α₀∪α₁, while the pulled-back extension class is +α₀∪α₁.

*Inputs:* M.0, pinned UT/transvection/filtration APIs, PC3 and PPG5. *Source:* HW Proposition 2.2 and Corollary 2.3, pp. 4–5; Michailov (3.1)–(3.2), pp. 4–5, for the exact finite-field commutators. *Acceptance:* an n=2 system gives the negative cup value; at n=3, quotient-lift definedness requires both adjacent cups to vanish; the zero system gives the trivial full lift. These checks must use the parent H² rather than a new quotient of cochains.

## M.2 — Abelianized stabilizers and explicit conjugation

For p prime and n≥2 identify B=U¹/U³=(U¹)^ab with the F_p-space on distance-two and distance-three matrix entries. Its dimension is 2n−3. Multiplication adds these coordinates because products of two distance-two terms have distance at least four. Exact commutators identify the kernel with the derived subgroup; the ordered factorization gives surjectivity. Conjugation factors through A.

**API for abelianized unitriangular stabilizer.** `stabilizerAbelianization` the quotient B with its F_p-module structure and basis. `stabilizerAbelianization_coord` the coordinate at (i,j) is the entry g_ij for j−i=2 or 3. `stabilizerAbelianization_action` the action A→GL(B) induced by conjugation in U. `stabilizerAbelianization_rank` the basis has exactly 2n−3 elements.

**Checks.**

1. **`stabilizerAbelianization_n2`:** UT₃ gives B=F_p, represented by its 02 corner.
2. **`stabilizerAbelianization_n3`:** UT₄ gives basis e₀₂,e₀₃,e₁₃ and dimension three.
3. **`stabilizerAbelianization_distanceFour`:** Every e_ij(t) of distance at least four maps to zero.
4. **`stabilizerAbelianization_actionFactors`:** Representatives of the same A coset induce identical linear maps on B.

The **stabilizer action formula** sends a basis vector e_kl under the adjacent generator e_ij to e_kl+e_il when j=k, to e_kl−e_kj when i=l, and leaves it fixed otherwise; terms of distance at least four vanish. Use this actual action on B and its contragredient on duals. It is not a trivial module merely because B is abelian.

For n≥3 define B_boundary as the span of e_02,e_03,e_(n−3),n,e_(n−2),n. It is A-stable. At n=3 the repeated corner is counted once, giving B_boundary=B of dimension three; for n>3 it has dimension four.

**API for boundary stabilizer submodule.** `boundarySubmodule` the actual submodule generated by the four displayed vectors. `boundarySubmodule_inclusion` the injective A-equivariant inclusion in B. `boundarySubmodule_basis` the deduplicated basis and its dimension in the two ranges. `boundarySubmodule_dualMap` restriction B^D→B_boundary^D is equivariant for the contragredient cyclotomic action.

**Checks.**

1. **`boundarySubmodule_n3`:** At n=3 the 03 corner occurs twice in the list but once in the basis.
2. **`boundarySubmodule_n4`:** At n=4 the basis is e₀₂,e₀₃,e₁₄,e₂₄ and has dimension four.
3. **`boundarySubmodule_n5Proper`:** At n=5, e₁₃ is in B and outside B_boundary.
4. **`boundarySubmodule_stable`:** At n>3, the left block is changed only through the adjacent coordinate a₂, and the right block only through a_(n−3).

The **sparse triangular conjugation** theorem chooses S with diagonal1 and only first-superdiagonal entries a_i. Its inverse has (i,j) entry (−1)^(j−i)∏_(i≤l<j)a_l. For Q∈U¹ and M=SQS⁻¹,

\[
M_{ij}=Q_{ij}+\sum_{m=i+2}^{j-1}(-1)^{j-m}
 (Q_{im}a_m-a_iQ_{i+1,m+1})\prod_{l=m+1}^{j-1}a_l.
\]

Empty sums are zero and empty products one. In particular distance-two entries stay fixed and M_(i,i+3)=Q_(i,i+3)−Q_(i,i+2)a_(i+2)+a_iQ_(i+1,i+3). This exact formula supplies the fixed-class arguments, beyond the action on B.

Define **reversal inverse-transpose** τ(g)=(P g⁻¹P⁻¹)^t, where P reverses the indices. It is an involutive automorphism and τ(e_ij(t))=e_(n−j),(n−i)(−t). It preserves the filtration and intertwines the A-actions on B and on conjugacy classes of U¹. The chosen sparse section need not intertwine it on matrices; the discrepancy disappears on conjugacy classes.

**API for reversal inverse-transpose.** `unitriangularReversal` the involutive group automorphism τ. `unitriangularReversal_transvection` τ(e_ij(t))=e_(n−j),(n−i)(−t). `unitriangularReversal_filtration` τ carries each U^m onto itself. `unitriangularReversal_quotient` the induced A and B maps satisfy τ(a·b)=τ(a)·τ(b).

**Checks.**

1. **`unitriangularReversal_square`:** τ²g=g, including at p=2.
2. **`unitriangularReversal_UT4`:** e₀₂(t) goes to e₁₃(−t).
3. **`unitriangularReversal_sparse`:** In UT₃ with both adjacent entries one, inverse-transpose reversal has a nonzero 02 entry, so it is not the sparse section of its A-image.

*Inputs:* M.1. *Source:* HW (4.1)–(4.2), p. 12; Remark 4.8 and the following unnumbered definition of the boundary module, p. 15; Remark 4.10 and (4.8), p. 15; Remark 4.11, p. 15. *Acceptance:* compare the sparse formula with direct multiplication at distance three over F₃, retaining the minus sign; reversal twice is identity.

## M.3 — Nilpotent support and outer exponents

Expose reusable support submodules N_d in the full matrix algebra: M_ij=0 whenever j<i+d. Thus N₀ is the upper triangular subalgebra, N₁ is strictly upper triangular, N_rN_s⊆N_(r+s), and N_d=0 for d>n. Relate membership in F_r to g−1∈N_r. The pinned filtration proof contains this support argument privately; this target is its usable public linear-algebra interface, not another filtration.

**API for superdiagonal support submodules.** `superdiagonalSupport` the submodule N_d of matrices. `mem_superdiagonalSupport` membership is the displayed entry-vanishing condition. `superdiagonalSupport_mul` m∈N_r and N∈N_s imply MN∈N_(r+s). `superdiagonalSupport_filtration` g∈U^m iff g−1∈N_(m+1), using the existing subgroup.

**Checks.**

1. **`superdiagonalSupport_zero`:** N₀ contains the identity and is not the strictly upper triangular submodule.
2. **`superdiagonalSupport_maximum`:** N_n is the corner line and N_(n+1)=0.
3. **`superdiagonalSupport_product`:** E₀₂E₂₄=E₀₄ belongs to N₄, while E₂₄E₀₂=0.
4. **`superdiagonalSupport_pinned`:** N₁ contains g−1 for every pinned upper-unitriangular g.

The **derived-subgroup exponent bound** is: if 2p^m>n then every g∈U¹ satisfies g^(p^m)=1. Apply the characteristic-p binomial identity in the commutative subalgebra generated by g−1, not in an arbitrary noncommutative pair of matrices. Its p^m-th power is supported at distance at least 2p^m. At p=3,n=6, g=1+E_02+E_24+E_46 has order9; this checks the strict inequality in the bound.

Define the **outer exponent** of a finite group H of exponent d as the least positive divisor e|d for which the power action on Mathlib `ConjClasses H` factors through (Z/e)^×. Reduction of units is surjective for divisors of d, and d itself is admissible. Record factorization and minimality separately.

**API for outer exponent.** `outerExponent` the least positive admissible divisor of exp(H). `outerExponent_dvd` outerExponent(H) divides exp(H). `outerExponent_powerAction` power permutations factor through units modulo outerExponent(H). `outerExponent_minimal` every admissible divisor e is at least outerExponent(H). `outerExponent_isomorphism` isomorphic finite groups have the same invariant.

**Checks.**

1. **`outerExponent_C2`:** outerExponent(C₂)=1 because its unit group acts trivially.
2. **`outerExponent_C4`:** outerExponent(C₄)=4: inversion is nontrivial and cannot factor through units modulo 1 or 2.
3. **`outerExponent_C6`:** outerExponent(C₆)=3 although exp(C₆)=6.
4. **`outerExponent_trivial`:** The trivial group has outer exponent one.

The **small-rank outer powering** theorem, for 2≤n≤6, factors the power action on U¹-conjugacy classes through (Z/p)^×. For odd p its outer exponent is p; for p=2 its literal least-divisor value is1. At p=3,n=6, compute (g−1)³=g_02g_24g_46 E_06, so conjugating g⁴ by e_26(g_24g_46) returns g. At p=2,n=4,5,6 split g into blocks of sizes4 and n−3. Its block-diagonal part and the complementary off-diagonal part are involutions, so g and g⁻¹ are conjugate. This proves factorization even when the ordinary exponent is4.

**`smallRankPowering_p3Corner`:** For Q=1+E₀₂+E₂₄+E₄₆ over F₃, Q⁴ differs from Q in 06, so omitting the cubic corner is false.

*Inputs:* M.1, the pinned matrix algebra and conjugacy classes. *Source:* HW Definition 3.2, p. 9; Lemmas4.6–4.7, pp. 14–15. The literal characteristic-two correction is recorded in the source findings; consumers use factorization, which is unchanged.

## M.4 — Bogomolov vanishing for the derived stabilizer

For finite H define B_Bog(H) as the kernel of H²(H,Q/Z)→∏_A H²(A,Q/Z), with A ranging over abelian subgroups and with trivial coefficients. Prove that bicyclic subgroups suffice. Cyclic subgroups alone do not suffice: H²(C₂²,Q/Z) contains a nonzero alternating class whose cyclic restrictions vanish.

**API for bogomolov multiplier.** `bogomolovMultiplier` the indicated additive subgroup of H²(H,Q/Z). `mem_bogomolovMultiplier` a class belongs iff every abelian restriction is zero. `bogomolovMultiplier_bicyclic` the equivalent kernel testing at most two cyclic factors. `bogomolovMultiplier_pullback` pullback along any homomorphism of finite groups preserves the subgroup; abelian subgroups have abelian image. `bogomolovMultiplier_iso` group isomorphisms induce inverse isomorphisms of these kernels.

**Checks.**

1. **`bogomolovMultiplier_abelian`:** For abelian H the subgroup is zero, because H itself is one of the tests.
2. **`bogomolovMultiplier_cyclicTestsFail`:** For H=C₂×C₂, the nontrivial alternating H²(H,Q/Z) class restricts to zero on every cyclic subgroup but is not in B_Bog(H).
3. **`bogomolovMultiplier_finiteComparison`:** The ordinary kernel maps to the continuous kernel under the finite-discrete H² isomorphism.

Construct the **commutativity-preserving exterior square** H⋏H using the existing free/presented-group carriers, with left conjugation {}^xy=xyx⁻¹. Its generators x⋏y obey

\[
(xx')\curlywedge y=({}^xx'\curlywedge{}^xy)(x\curlywedge y),\qquad
x\curlywedge(yy')=(x\curlywedge y)({}^yx\curlywedge{}^yy'),
\]

and x⋏y=1 when x and y commute. The map κ(x⋏y)=[x,y] is onto [H,H] and has central kernel. Include the universal property for crossed pairings killing commuting pairs, not only a presentation.

**API for commutativity-preserving exterior square.** `cpExteriorSquare` the presented group H⋏H. `cpExteriorSquare_generator` the canonical pairing H×H→H⋏H, killing commuting pairs. `cpExteriorSquare_lift` every crossed pairing killing commuting pairs factors uniquely through a homomorphism. `cpExteriorSquare_commutator` the surjective κ to [H,H], with central kernel. `cpExteriorSquare_map` a homomorphism H→K induces H⋏H→K⋏K and commutes with κ.

**Checks.**

1. **`cpExteriorSquare_abelian`:** For abelian H every generator is killed, so H⋏H=1.
2. **`cpExteriorSquare_commutatorSign`:** κ(x⋏y)=xyx⁻¹y⁻¹ agrees with the pinned transvection convention; it is not x⁻¹y⁻¹xy.
3. **`cpExteriorSquare_Heisenberg`:** In UT₃(F_p), κ(e₀₁(a)⋏e₁₂(b))=e₀₂(ab), which can be nontrivial.

The **Bogomolov character duality** gives B_Bog(H)≃Hom(kerκ,Q/Z), naturally. Derive it through a free presentation, the quotient by commuting wedges, and extension of characters into the divisible Q/Z. This uses the existing character-module extension theorem; it does not assume a Schur covering group already constructed. Testing abelian subgroup restrictions identifies exactly the characters killing commuting wedges.

Prove **unitriangular endpoint collection** for G=F_ℓ≤UT_m(F_p), ℓ≥1. In G⋏G collect every word, ordered by increasing endpoint gap and then starting index, into powers of

\[
c_{ik}=e_{i,i+\ell}(1)\curlywedge e_{i+\ell,k}(1),\qquad k-i\ge2\ell.
\]

Every allowed chaining wedge with endpoints i,k equals c_ik^(ab). To compare intermediate indices expand the wedge of the commuting pair e_ij e_rk and e_jk e_ir, with r=k−ℓ. Swapping two endpoint factors introduces terms of greater gap, so collection terminates. Their κ-images are the identically ordered matrix transvections e_ik(a_ik); unique matrix factorization forces every coefficient in a kernel word to vanish. If 2ℓ≥m, G is abelian and both the relevant kernel and square are already trivial.

The **derived-stabilizer Bogomolov vanishing** theorem follows for U¹=F₂ and every n≥2. In sizes three and four U¹ is abelian, cyclic at size three. In size five it is nonabelian: [e₀₂(1),e₂₄(1)]=e₀₄(1)≠1. Use the general gap-two endpoint-collection theorem in that case as well. This is the finite algebraic input; identifying geometric unramified Brauer groups with this multiplier belongs to the homogeneous-space roadmap.

**`derivedStabilizer_UT5_nonabelian`:** The two displayed distance-two transvections lie in U¹ and their corner commutator is nonidentity over every F_p. The suggested file retains a noncommuting-pair check on the pinned carrier.

**`cpEndpointCollection_lastDiagonal`:** The degree-(m−1) subgroup is the nontrivial corner line; its exterior square is trivial because it is abelian.

*Inputs:* M.1, PC3, existing `FreeGroup`, `PresentedGroup` and `CharacterModule.dual_surjective_of_injective`. *Sources:* Moravec §2, pp. 3–4, Lemma 3.1 and Theorem 3.2, pp. 4–6, §4 opening pp. 9–10; Michailov Theorem 3.1 CasesI–II, pp. 5–8; HW Proposition 4.1 proof, p. 12. The normal form uses permitted gap-ℓ generators, correcting the CaseII index slip.

## M.5 — Cyclic cohomology and fixed conjugacy classes

For finite G and a G-module M define H¹_cyc(G,M) as the restriction kernel over every cyclic subgroup. For a cocycle b, membership is equivalent to b(σ)∈(σ−1)M for every σ. This is a finite-group restriction kernel, distinct from the arithmetic all-place Sha groups.

**API for cyclically trivial first cohomology.** `cyclicH1` the kernel subgroup of canonical H¹. `mem_cyclicH1_iff` the displayed pointwise coboundary criterion, independent of representative. `cyclicH1_restrict` restriction H≤G carries cyclically trivial classes to cyclically trivial classes. `cyclicH1_coeff` equivariant coefficient maps carry the kernel to the corresponding kernel.

**Checks.**

1. **`cyclicH1_cyclicGroup`:** For cyclic G the kernel is zero because one factor tests G itself.
2. **`cyclicH1_trivialAction`:** For trivial action, b(σ)∈(σ−1)M says b(σ)=0 for all σ, so the kernel is zero.
3. **`cyclicH1_cyclicImage`:** If the action factors through a cyclic quotient then the kernel is zero: it kills the action kernel and descends to that quotient.

Construct **conjugacy-power evaluation** as follows. Let finite H have exponent d, an outer G-action and a cyclotomic character χ on μ_d; put D=Hom(H^ab,μ_d) with the contragredient cyclotomic action. If σ[h]=[h^χ(σ)], then h̄ is a χ(σ)-eigenvector. Along Z→G,1↦σ, it defines an invariant map D→μ_d with **trivial target action**. Evaluating the resulting H¹ class at1 gives b(σ)(h̄). It is independent of cocycle and conjugacy representatives. A unit lift from the outer exponent gives the same powering condition.

**API for conjugacy-power evaluation.** `conjugacyPowerEvaluation` the character H¹(G,D)→μ_d for the specified σ and conjugacy class. `conjugacyPowerEvaluation_cocycle` on b it is b(σ)(h̄), with additive zero corresponding to multiplicative one. `conjugacyPowerEvaluation_class` cohomologous b and conjugate h give the same value. `conjugacyPowerEvaluation_outer` a unit lift of χ modulo the outer exponent gives the same powering test.

**Checks.**

1. **`conjugacyPowerEvaluation_trivialCyclotomic`:** For χ=1, the allowed h̄ are ordinary σ-fixed vectors.
2. **`conjugacyPowerEvaluation_targetAction`:** The target of H¹(Z,μ_d) has trivial action here; retaining its original cyclotomic action gives the wrong invariant condition.
3. **`conjugacyPowerEvaluation_zero`:** The zero cohomology class evaluates to the identity root of unity on every allowed conjugacy class.

The **pointwise scalar maps** lemma says that for linear T,T₀:V→W over any field, T(v)∈F·T₀(v) for every v implies T=cT₀ for one scalar c. Factor through imT₀; in rank at least two compare independent images and their sum, then compare every other image with one of those. The zero and rank-one cases are included.

Prove **fixed second-diagonal lifts**: an a-fixed vector b in span e_(i,i+2) has the sparse representative Q=1+Σ b_iE_(i,i+2) commuting exactly with the sparse lift S of a. The fixedness equations −b_i a_(i+2)+a_i b_(i+1)=0 kill every correction in M.2's formula.

Next prove **boundary fixed-class generation**: images of a-fixed conjugacy classes span a subgroup containing B_boundary^a. For e_03 use the source's cases a₃=0, a₃≠0 with a₂=0, and a₂≠0; the last uses b_i=a_i a_(i+1) and Q_03=a₂. In the product for Q retain e_03(a₂). Reversal handles the other boundary. This is generation, not surjectivity from fixed classes.

The **boundary dual cyclic vanishing** theorem is H¹_cyc(G,B_boundary^D)=0 for every subgroup G≤A×F_p^×, where the second coordinate gives the cyclotomic twist. Restrict to the p-Sylow kerχ; restriction is injective by the prime-to-p index formula. For n>3 each of the two boundary blocks factors through a cyclic additive coordinate. At n=3 use the dual exact sequence with a two-dimensional trivial submodule; cyclic triviality forces a pointwise scalar condition, and the scalar lemma makes the cocycle a coboundary.

Finally prove **length-four and length-five fixed-class generation**: for n=4,5 the images span all B^a. At n=4 the boundary already contains every distance-three direction. At n=5 isolate the middle e_14 direction. If an endpoint vanishes, use the size-five subgroup obtained by deleting that endpoint. Otherwise choose a fixed second-diagonal b with at least one of b₀b₁,b₂b₃,b₀b₃ nonzero. For Q over b+e_14, U³ is central in U¹ and

\[
\Theta_Q(\bar x)=x^{-1}QxQ^{-1}:B\longrightarrow U^3
\]

is onto. Its values on e_24,e_25,e_35,e_02,e_03,e_13 are respectively e_04(b₀),e_05(b₀),e_15(b₁),e_04(−b₂),e_05(−b₃),e_15(−b₃). Hence that fiber is one conjugacy class, fixed by a. Subtract the generated second-diagonal direction to obtain the missing middle direction.

*Inputs:* M.2–M.3, PC2,3,5,8,10. *Source:* HW Definition 4.3, p. 13; §3 pairing, pp. 9–10; Lemmas4.12–4.15, pp. 16–18; Proposition 6.1, pp. 23–24. *Acceptance:* retain the nontrivial cyclotomic action before Sylow restriction, and test the n=3 repeated-boundary case independently.

## M.6 — Sharpness and explicit obstruction modules

The **length-six fixed-class failure** has p=2,n=6,a=(1,1,0,0,0,1). The fixed space B^a has basis e_02,e_46,e_03,e_14,e_25,e_36, but the span of fixed-class images is the five-dimensional subspace with 25-coordinate zero. For a commuting lift T of a, the low-distance equations force Q_13=Q_24=Q_35=0 and then Q_25=0. Solve the remaining linear equations for enough representatives to span the other five directions. A finite check over the 4096 matrices with fixed B-image finds 1036 admitting such a commuting lift and confirms this span.

The **nonzero cyclic restriction kernel** uses n=4,p=2,G=C₂² acting through s=(1,1,0,1),t=(1,0,1,1) in A. On the dual of B, in coordinate order (02,03,13,14,24), the cocycle equations for x=b(s),y=b(t), together with x∈(s−1)B^∨,y∈(t−1)B^∨,x+s y∈(st−1)B^∨, leave eight cocycles and four coboundaries. Thus H¹_cyc(G,B^∨)=F₂, whereas the boundary dual kernel is zero. Derive the inverse-transpose action; identifying the dual with the original representation without that calculation fails this test.

Construct V=F₂a⊕F₂b⊕F₂c⊕F₂d⊕F₂e with Q=C₂(s)×C₄(t)×C₂(r), r acting trivially, and

\[
N_s(b)=d+e,\ N_s(c)=e,\quad
N_t(a)=d,\ N_t(b)=d+e,
\]

all other basis images zero, s=1+N_s,t=1+N_t. All squares and pairwise products of N_s,N_t vanish.

**API for five-dimensional obstruction module.** `fiveDimensionalObstructionModule` the representation Q→GL₅(F₂) with the displayed basis. `fiveDimensionalObstructionModule_action` the generator action matrices and their normal-form product. `fiveDimensionalObstructionModule_dual` the contragredient action on the dual basis. `fiveDimensionalObstructionModule_eval` evaluation is equivariant for these two actions.

**Checks.**

1. **`fiveDimensionalObstructionModule_s`:** s(b)=b+d+e and s(c)=c+e.
2. **`fiveDimensionalObstructionModule_t`:** t(a)=a+d, t(b)=b+d+e.
3. **`fiveDimensionalObstructionModule_kernel`:** r and t² act trivially; t² is nevertheless a nonidentity element of Q.

The **explicit cyclically trivial class** is β(s^it^jr^l)=(i+j mod2)b*. It is a cocycle because b* is invariant. For parities (i,j)=(1,0),(0,1) use d*,e* as cyclic coboundary witnesses; for (0,0),(1,1) β is zero. A global coboundary with d*,e* coefficients u,v would require simultaneously v=0,u=1 and u=0. Thus [β] is nonzero in H¹_cyc(Q,V^∨).

Construct the **auxiliary quartic cocycle** γ(s)=a,γ(t)=b+c,γ(r)=0, with

\[
\gamma(s^it^jr^l)=ia+s^i\sum_{0\le h<j}t^h(b+c).
\]

The commuting-generator relation is N_s(b+c)=N_t(a)=d; the s² and t⁴ norms vanish. Its b-coordinate is j mod2 and γ(t²)=d+e. Keeping C₄ is essential even though its action factors through C₂.

**API for auxiliary quartic cocycle.** `quarticAuxiliaryCocycle` the displayed Q→V cocycle. `quarticAuxiliaryCocycle_normalForm` its formula on s^i t^j r^l. `quarticAuxiliaryCocycle_cocycle` γ(uv)=γ(u)+uγ(v). `quarticAuxiliaryCocycle_bCoord` the b-coordinate is j mod 2.

**Checks.**

1. **`quarticAuxiliaryCocycle_tSquare`:** γ(t²)=d+e, despite the trivial t²-action.
2. **`quarticAuxiliaryCocycle_sSquare`:** γ(s²)=0 and γ(r)=0.
3. **`quarticAuxiliaryCocycle_C2Fails`:** Replacing C₄(t) by C₂(t) would require (1+t)(b+c)=0, but this is d+e≠0.

*Inputs:* M.2,M.5. *Source:* HW Remark 4.17, p. 18, Example 6.3 and the end of §6, p. 24; Remark 3.4, p. 10, motivates the explicit module and cocycles. The latter formulas are a directly checked algebraic completion recorded by extraction items144–146; they are not asserted to be printed in HW, nor to construct its geometric example or Hochschild–Serre differential. *Acceptance:* enumerate all16 elements of Q for cyclic triviality, all256 products for the cocycle equation, and all32 potential dual coboundaries for nontriviality.

## M.7 — Refined nonarchimedean lifting

For n≥3,1≤r,s≤n−2 define P=P_(r,s) by last-column generators e_i,n(t),0≤i≤r, and first-row generators e_0,j(t),n−s≤j≤n. Their common corner occurs once. The subgroup is U-normal, contains Z, and P/Z has dimension r+s. When r+s≤n−1, P is additive elementary abelian of dimension r+s+1; cross products of its strictly upper-triangular supports vanish.

**API for two-boundary unitriangular subgroup.** `twoBoundarySubgroup` the subgroup P_(r,s) of the existing U. `twoBoundarySubgroup_coordinates` first-row and last-column coordinates, with a single corner coordinate. `twoBoundarySubgroup_quotient` p/Z≃F_p^(r+s). `twoBoundarySubgroup_abelian` for r+s≤n−1 the coordinate map P≃F_p^(r+s+1) is additive. `twoBoundarySubgroup_normal` normality in U and the induced U/P action on P when P is abelian.

**Checks.**

1. **`twoBoundarySubgroup_n3`:** For n=3,r=s=1, P has coordinates 02,03,13, not four coordinates.
2. **`twoBoundarySubgroup_cornerIntersection`:** The first-row and last-column spans meet exactly in Z.
3. **`twoBoundarySubgroup_abelianBoundary`:** At r+s=n−1, P is abelian although conjugation by U can act nontrivially.
4. **`twoBoundarySubgroup_overlapRange`:** If r+s≥n, a pair e₀j,e_jn occurs and has nontrivial corner commutator; do not assert abelianness in that range.

Assume r+s=n−1. A continuous α̃:Γ→U/Z pulls back the conjugation sequence 0→Z→P→P/Z→0, with Z trivial. Conjugation factors through U/P since P is abelian. Import the finite-domain splitting torsor and its γ∈H¹(Γ,Hom(P/Z,Z)). Its zero class is equivalent to an equivariant splitting.

**API for twisted boundary module sequence.** `twistedBoundarySequence` the finite equivariant short exact sequence for α̃. `twistedBoundarySequence_action` the action is conjugation by any U-lift of α̃(g). `twistedBoundarySequence_splittingClass` the imported splitting-torsor H¹ class. `twistedBoundarySequence_restrict` restriction of Γ commutes with the coefficient sequence and class.

**Checks.**

1. **`twistedBoundarySequence_trivial`:** For α̃=1 the action is trivial and the splitting class is zero.
2. **`twistedBoundarySequence_central`:** Changing the representative of α̃(g) by a corner element does not alter the action.
3. **`twistedBoundarySequence_finiteHom`:** The Hom is continuous and discrete because P/Z is finite; no assertion of discreteness for arbitrary infinite discrete domains is used.

The **finite connecting-cup comparison** specializes the existing supplier formula: for a section s and a cocycle c, d(s c)=γ∪c, so δ[c]=[γ]∪[c]; after flipping evaluation this is (−1)^m[c]∪[γ] in degree m. In degree one it is −[c]∪[γ]. Keep this sign through obstruction cancellation. The Hom coefficient object is discrete here because P/Z is finite; no unrestricted discreteness claim is made.

The **easy local obstruction vanishing** theorem gives H²(K,F_p)=0 if charK=p, or if charK≠p and μ_p(K)={1}. Use HL.2's ordinary characteristic-p bound in the first case and CFT5 duality in the second. It follows that every U/Z character lifts to U in these cases.

For a nonarchimedean K with charK≠p and μ_p⊂K, prove **nonsplit local obstruction cancellation**. If γ≠0, local duality makes δ:H¹(K,P/Z)→H²(K,Z) onto: the latter is one-dimensional and the cup pairing detects γ. Choose c with δ[c]=−ob(α̃), lift c to P-valued cochains and correct by a Z-cochain. The resulting U character has the original image in U/P. The chosen α̃ into U/Z is allowed to change.

For the split case construct explicit retractions. Let W=F_p^(n+1), W^m the columns supported in0,…,m and W*_m the rows supported in n−m,…,n. Every additive retraction P→Z is ρ_(u,v)(Q)=u(Q−1)v, with u₀=v_n=1. Equality of normalized pairs is equality of u modulo W*_(n−r−1) and of v modulo W^(n−s−1).

**API for boundary retraction coordinates.** `boundaryRetraction` the linear map ρ_(u,v):P→Z. `boundaryRetraction_corner` its restriction to Z is the identity for u₀=v_n=1. `boundaryRetraction_surjectiveParametrization` every additive retraction has such a normalized pair. `boundaryRetraction_eq_iff` two normalized pairs agree exactly modulo the two displayed filtrations.

**Checks.**

1. **`boundaryRetraction_standard`:** For u=(1,0,…,0),v=(0,…,0,1), ρ is the corner entry.
2. **`boundaryRetraction_invisible`:** Changing u only after index r or v only before index n−s leaves ρ unchanged.
3. **`boundaryRetraction_overlap`:** The corner contributes once; an external direct sum of the row and column would give the wrong coefficient on e₀n.
4. **`boundaryRetraction_arbitrary`:** An arbitrary retraction is obtained by independently prescribing its values on the r+s noncorner basis vectors.

The **retraction stabilizer splitting** theorem defines S as the stabilizer of ρ under conjugation. Then P≤S and

\[
M\in S\iff u(M-1)\in W^*_{n-r-1}\quad\hbox{and}\quad (M-1)v\in W^{n-s-1}.
\]

Since n−s−1=r, the first row is supported after r and the second column at most r. Consequently u(M−1)(N−1)v=0 for M,N∈S. Thus the same scalar formula extends ρ to a homomorphism S→Z. Its kernel maps isomorphically to S/Z, giving a section. An equivariant retraction places α̃ in S/Z and yields a U lift.

The **refined local lifting theorem** combines these cases: for every nonarchimedean local K, every p and n≥3, every Γ_K→U/P_(r,s) with r+s=n−1 which lifts to U/Z also lifts to U. The prescribed U/P character is retained. This is stronger than ordinary local Massey vanishing and is the interface the global homogeneous-space argument consumes.

*Inputs:* M.1–M.2, PC5,8,11, CFT5, HL.2 and the named AGD R02.1 finite-Hom/splitting/cup nodes. *Source:* HW Definition 5.2, Proposition 5.3, Lemma 5.5 and its proof, pp. 18–22. *Acceptance:* n=3,r=s=1 has three boundary coordinates; the split case constructs an actual section, while the nonsplit case checks the negative obstruction sign and equality only in U/P.

## M.8 — Real places and ordinary local vanishing

Prove the **real-place C₂ pairing** for every finite-dimensional F₂[C₂]-module C. Put t=σ−1, so t²=0. Then H¹(C₂,C)=ker t/im t, and evaluation induces a perfect pairing

\[
H^1(C_2,C^*)\times H^1(C_2,C)\longrightarrow H^2(C_2,F_2)=F_2.
\]

This follows by taking annihilators in the finite vector-space dual: (im t)^⊥=ker t*, (ker t)^⊥=im t*. It uses ordinary positive-degree cohomology, agreeing with Tate cohomology in these degrees.

The **archimedean refined lifting** theorem has the same conclusion as M.7. Over C the group is trivial. Over R at odd p a map C₂→the finite p-group U/Z is trivial. Over R at p=2 repeat the two cases of M.7 using the displayed C₂ pairing for nonsplit cancellation; the split retraction argument is unchanged.

Deduce **local Massey vanishing** for every local field K, every prime p and n≥3: if a degree-one F_p product is defined, project its U/Z lift to U/P and apply refined lifting. Dwyer's full-lift criterion gives zero-membership. The theorem covers real and complex completions as well as nonarchimedean fields.

*Inputs:* M.1,M.7 and parent explicit cyclic cohomology. *Source:* HW Proposition 5.3, p. 19, and its all-place use in the proof of Theorem 5.1, p. 22; the C₂ linear-algebra argument supplies the archimedean proof. *Acceptance:* for the trivial one-dimensional C₂-module both sides of H¹ pair as F₂; for the free rank-one F₂[C₂]-module both H¹ groups vanish. This prevents importing nonarchimedean duality at the real place without justification.

## M.9 — Filtered modules and twisted Dwyer correspondence

Let R be finite commutative and N₀,…,N_n finite R-modules with continuous Γ-actions χ_i. Use M_ij=Hom_R(N_j,N_i), with g·f=χ_i(g)fχ_j(g)⁻¹ and composition as the coefficient pairing. Continuous cochains with these pairings form a strict dg-category, specializing DGAInfinity1. Its degree-one matric defining systems use the same negative differential and value convention as M.0.

**API for continuous hom coefficient category.** `continuousHomDGCategory` the DG category with the displayed Hom complexes. `continuousHomDGCategory_action` the coefficient action is χ_i f χ_j⁻¹. `continuousHomDGCategory_comp` the translated composition-cup formula on cochains. `continuousHomDGCategory_definingSystem` the specialization of DGAInfinity defining systems and their values.

**Checks.**

1. **`continuousHomDGCategory_trivialRankOne`:** With all N_i=R and trivial actions this is the ordinary continuous cochain algebra.
2. **`continuousHomDGCategory_characterRatio`:** For rank-one F_p modules, the action on M_ij is the character χ_iχ_j⁻¹.
3. **`continuousHomDGCategory_zeroObject`:** If N_i=0, every incoming or outgoing Hom group at that object is zero.
4. **`continuousHomDGCategory_translation`:** The cup of a_ij and a_jk at (g,h) is a_ij(g) composed with g·a_jk(h); dropping the translated action does not give the twisted equation.

For W=⊕N_i, W_i=⊕_(j≤i)N_j, construct T(W) as the group of filtration-preserving automorphisms. Diagonal blocks give T→∏Aut_R(N_i), with its diagonal section; let U be its kernel and U¹ the subgroup acting identically on W_i/W_(i−2). Then

\[
A(W)=T/U^1=(\bigoplus_i M_{i,i+1})\rtimes\prod_i\operatorname{Aut}_R(N_i).
\]

Do not require freeness or rank one for these constructions. On choosing bases for free rank-one modules, U(W) becomes the existing upper-unitriangular group and U¹(W) its degree-two superdiagonal subgroup. T(W) becomes the larger invertible upper-triangular group.

**API for filtered block automorphisms.** `filteredAutomorphismGroup` the subgroup T(W) of linear automorphisms. `filteredAutomorphism_diagonal` the split surjection to the product of graded-piece automorphism groups. `filteredUnipotentKernel` u(W) and U¹(W), normal subgroups of T(W). `filteredAutomorphism_block` block coordinates and their multiplication by composition. `filteredAutomorphism_rankOne` for free rank-one N_i, the unipotent kernel is the pinned upperUnitriangularGroup.

`filteredAutomorphism_ext` gives equality from equality of every block N_j→N_i, using the existing direct-sum and linear-map extensionality APIs.

**Checks.**

1. **`filteredAutomorphism_diagonalSection`:** The diagonal of the block-diagonal section is the original tuple of automorphisms.
2. **`filteredAutomorphism_UT`:** For all N_i=F_p with chosen bases, U¹ consists of zero adjacent matrix entries.
3. **`filteredAutomorphism_zeroSummand`:** A zero N_i contributes no block coordinates and its automorphism group is trivial.
4. **`filteredAutomorphism_notFree`:** For R=Z/4 and N₀=Z/2,N₁=Z/4, use Hom_R(N₁,N₀); do not silently identify every block with R.

Given actual adjacent cocycles a_i, the **twisted adjacent character** is α(g)=((a_i(g)),(χ_i(g))). It is a homomorphism because its first component satisfies the crossed-homomorphism law. Replacing a by a+d⁰u conjugates α by (−u,1), with this sign fixed.

**API for twisted adjacent character.** `twistedAdjacentQuotient` the split semidirect quotient A(W). `twistedAdjacentCharacter` the homomorphism α attached to χ and fixed cocycles. `twistedAdjacentCharacter_apply` its two coordinates are a(g) and χ(g). `twistedAdjacentCharacter_change` the displayed conjugation formula for a+d⁰u.

**Checks.**

1. **`twistedAdjacentCharacter_trivial`:** For trivial diagonal characters this is the adjacent-entry homomorphism of M.1.
2. **`twistedAdjacentCharacter_coboundary`:** Starting from a=0, conjugation by (−u,1) gives the cocycle d⁰u, not its negative.
3. **`twistedAdjacentCharacter_zeroModules`:** If every adjacent Hom is zero, α is exactly the diagonal character.

Let Z(W)=Hom_R(N_n,N₀) in the corner. It is T-normal, central in U, and its T-action is χ₀ fχ_n⁻¹. The corner extension class lies in H²(T/Z,M_0n) with this actual action. It is generally not a central extension of T/Z by a trivial module.

**API for twisted corner extension.** `twistedCornerExtension` the extension with kernel the actual Hom module M_0n. `twistedCornerInclusion` the injective corner transvection map, normal in T. `twistedCornerConjugation` diagonal conjugation acts by d₀ f d_n⁻¹. `twistedCornerExtension_class` the canonical extension class with its induced coefficient action.

**Checks.**

1. **`twistedCornerExtension_trivialRankOne`:** With trivial diagonal action, restriction to U is the ordinary corner extension.
2. **`twistedCornerExtension_notCentral`:** Over F₃, diagonal d₀=−1,d_n=1 negates a nonzero corner; Z is not central in T.
3. **`twistedCornerExtension_zeroHom`:** If Hom_R(N_n,N₀)=0, the quotient by Z changes no elements.

The **twisted Dwyer correspondence** fixes χ and the actual a_i. Lifts α_Λ:Γ→T/Z of this α correspond bijectively to defining systems by

\[
a_{ij}(g)=(\alpha_\Lambda)_{ij}(g)\chi_j(g)^{-1},
\qquad (\alpha_\Lambda)_{ij}(g)=a_{ij}(g)\chi_j(g).
\]

Block multiplicativity gives exactly the conjugation-action cup equation. The value is −α_Λ* u. The **twisted class-level lifting criteria** then prove definedness iff α lifts to T/Z and zero-membership iff it lifts to T, independently of the chosen representatives; lift the conjugating adjacent element to T to transport lifts.

A required negative test takes Γ=C₂,R=F₃,N₀ sign and N₁,N₂,N₃ trivial. The nonzero coboundary a_01(σ)=1 and all other entries zero form a system representing zero classes, but its adjacent character differs from the character constructed from zero cocycles. A bijection over the latter cannot include this system. This pins the fixed-representative hypothesis.

For one-dimensional F_p modules and r+s=n−1 construct the **rank-one twisted boundary subgroup** as the internal sum of the last-column and first-row Hom spaces. Their intersection is Z(W), counted once. It is T-normal, abelian of dimension r+s+1, and has quotient by Z of dimension r+s. Bases identify it with M.7's subgroup while retaining the diagonal-character action.

**API for rank-one twisted boundary subgroup.** `twistedTwoBoundarySubgroup` the T-normal internal-sum subgroup P(W). `twistedTwoBoundarySubgroup_intersection` the two boundary summands intersect in Z(W). `twistedTwoBoundarySubgroup_rank` the dimension is r+s+1, and the quotient dimension is r+s. `twistedTwoBoundarySubgroup_baseChange` after choosing bases its support is exactly the ordinary two-boundary subgroup, with diagonal character action retained.

**Checks.**

1. **`twistedTwoBoundarySubgroup_n3`:** At n=3,r=s=1, the three summands are M₀₂,M₀₃,M₁₃.
2. **`twistedTwoBoundarySubgroup_character`:** The corner transforms by χ₀χ_n⁻¹, and is not in general a trivial Γ-module.
3. **`twistedTwoBoundarySubgroup_dimension`:** The direct sum of both full listed boundaries has dimension r+s+2 and cannot be isomorphic to this subgroup.

**`twistedDwyer_representativeCounterexample`:** Take Γ=C₂,R=F₃,N₀ sign and N₁,N₂,N₃ trivial. A nonzero adjacent coboundary a₀₁(σ)=1, other entries zero, represents zero classes but does not lie over α constructed using all-zero adjacent cocycles.

*Inputs:* M.0,M.1,M.7, DGAInfinity1,8, PPG5 and the existing internal-Hom action. *Source:* HW §7, pp. 24–28, especially Proposition 7.3 and (7.3), pp. 26–27. *Acceptance:* trivial χ recovers M.1 including its sign; the corner action is χ₀χ_n⁻¹ in rank one, and may be nontrivial.

## M.10 — Rank-one twisted local lifting

The **prime-to-p character descent** theorem takes the number-field extension L/k fixed by the joint diagonal-character kernel. Because each character has image in F_p^×, the extension is finite Galois of degree prime to p and makes all N_i constant. For every finite p-primary k-module M, every place v and q≥0,

\[
H^q(k_v,M)\longrightarrow\prod_{w\mid v}H^q(L_w,M)
\]

is injective. The sum of local corestrictions composed with restriction is multiplication by [L:k], an automorphism of a p-primary group. Use all completions in this argument; do not assume an arbitrary individual completion has the full global degree. Include real and complex places.

Prove **rank-one twisted refined lifting**: for n≥3,r+s=n−1 and one-dimensional F_p Galois modules, every Γ_(k_v)→T/P with the prescribed diagonal χ which lifts to T/Z lifts to T. Since P is abelian the given character has an obstruction in H²(k_v,P) with its pulled-back action. At every w over v the characters become trivial, so M.7–M.8 kill the restricted obstruction. Injectivity kills the original obstruction, and PPG5 supplies the continuous lift.

*Inputs:* M.8–M.9, PC5,10 and PPG5. *Source:* the local descent argument in the proof of HW Theorem 7.4, pp. 27–28. The global rank-one number-field vanishing theorem itself belongs to the homogeneous-space continuation. *Acceptance:* p=2 gives a trivial diagonal extension; p odd allows complex places over real ones, with the same all-completion corestriction identity.

## M.11 — The defined nonvanishing Z/8 triple over Q

Use IG.4's independent endpoint characters χ_01,χ_23:Γ_Q→Z/8 lifting the quadratic characters of Q(√p), Q(√(2q)), for distinct primes p,q≡1 mod8. Their joint fixed field L has degree64 and exactly the three quadratic subfields specified by that supplier. No independence is inferred merely from choosing two arbitrary cyclic-eight lifts.

In U₈=UT₄(Z/8), let P₈ be the additive subgroup on coordinates02,03,12,13 and D₈=U₈¹ the subgroup on02,03,13. The endpoint quotient C=U₈/P₈=(Z/8)² on01,23 has its commuting-transvection section, so U₈=P₈⋊C. Conjugation gives the C-module sequence 0→D₈→P₈→Z/8⟨12⟩→0, with trivial quotient. Pull back along the endpoint characters. These auxiliary coefficients are twisted even though the final Massey inputs have constant coefficients.

**API for cyclic-eight unitriangular modules.** `cyclicEightModuleSequence` the actual pulled-back sequence D₈→P₈→Z/8. `cyclicEightModuleSequence_coordinates` the three and four coordinate bases in the stated order. `cyclicEightEndpointSplitting` the section C→U₈ giving U₈=P₈⋊C. `cyclicEightModuleSequence_action` conjugation by e₀₁ and e₂₃, and the induced Γ_Q action.

**Checks.**

1. **`cyclicEightModules_rank`:** P₈ has 8⁴ elements and D₈ has 8³, so their quotient has eight elements.
2. **`cyclicEightModules_endpointSplit`:** e₀₁(a)e₂₃(b)=e₂₃(b)e₀₁(a) and its C-coordinates are (a,b).
3. **`cyclicEightModules_middleNonconstant`:** e₀₁ conjugates e₁₂ to e₁₂e₀₂, so the middle-coordinate section is not C-equivariant.
4. **`cyclicEightModules_distinctBoundary`:** This P₈ contains the middle 12 coordinate; it is distinct from the two-boundary P_(1,1) of UT₄ over F_p.

The **cyclic-eight dual boundary** theorem computes the dual corner sequence 0→μ₈²→D₈^D→μ₈→0. Under Kummer coordinates over any K/Q, the boundary of −1 is ([16q⁴],[p⁴]). Compute the contragredient endpoint action together with the cyclotomic action on μ₈; the coordinate order matters.

Construct the **Wang class in the dual stabilizer** w as the image of ([16],[1]) in H¹(Q,D₈^D). It lies in the imported all-place Sha¹ and is nonzero. Away from2 the pair is locally zero. At2 it equals the boundary just computed, since p and q are Q₂-squares. Globally it is neither zero nor that boundary, the only possible nonzero boundary from μ₈(Q)={±1}; valuations distinguish the second coordinate.

**API for wang class in the dual stabilizer.** `dualWangClass` the class w in the imported Sha¹ kernel. `dualWangClass_kummer` its H¹ representative is the image of ([16],[1]). `dualWangClass_local` away from 2 it is zero; at 2 it is killed by the displayed boundary. `dualWangClass_ne_zero` the global class is nonzero by the two-element boundary-image calculation.

**Checks.**

1. **`dualWangClass_oddPlace`:** At every odd place 16 is an eighth power, so the pair is zero before mapping to D₈^D.
2. **`dualWangClass_dyadic`:** At Q₂ the Kummer pair need not be zero in μ₈² cohomology; it is zero after the boundary quotient.
3. **`dualWangClass_global`:** A Q₂-boundary witness does not give a Q-boundary witness: the second coordinate [p⁴] is globally nonzero.

The **eighth-power kernel over L** theorem identifies W=Sha¹(L,μ₈)=C₂ generated by [16]. At places above2, L_w contains √(2q) and hence √2, an eighth root of16. At other places local roots come from the imported Wang factorization. Globally an eighth root would force √2,√−2 or i into L, contradicting its three quadratic subfields. The imported zero-or-C₂ theorem then identifies W; its unique nonzero element makes the Gal(L/Q)-action trivial.

The **invariant dual Sha coordinates** comparison identifies Sha¹(L,D₈^D)=W³ in order(02,03,13), and Sha¹(L,P₈^D)=W⁴ in order(02,03,12,13). For endpoint generators s=e_01,t=e_23, a triple is invariant precisely when

\[
s a_{13}=a_{03}a_{13},\ s a_{0j}=a_{0j}\ (j=2,3),\quad
 t a_{02}=a_{02}a_{03}^{-1},\ t a_{i3}=a_{i3}\ (i=0,1).
\]

A quadruple satisfies s a_1j=a_0j a_1j and s a_0j=a_0j for j=2,3; t a_i2=a_i2 a_i3⁻¹ and t a_i3=a_i3 for i=0,1. These are the descent-invariance equations, incorporating both field and coefficient actions. Restriction of coefficients deletes coordinate12.

The **Wang class has no dual Sha lift** theorem follows from these equations. The restriction of w is ([16],[1],[1]). Any invariant quadruple lifting it would have s a_12=[16]a_12, impossible because W has trivial action and [16]≠1. A global Sha class would restrict to an invariant class, so this rules out a global preimage.

Use the imported finite perfect pairings Sha²(Q,M)×Sha¹(Q,M^D)→Q/Z, natural in M. The preceding nonsurjectivity dualizes to the **nonzero second-Sha coefficient kernel**: choose 0≠η∈Sha²(Q,D₈) whose image in Sha²(Q,P₈), and hence in H²(Q,P₈), is zero. This step needs finite arithmetic duality, not just finite-group character duality.

The long exact sequence supplies the **middle character** χ_12∈H¹(Q,Z/8) with δχ_12=η. Trivial quotient action identifies its class with an actual continuous additive character. Every local boundary is zero, while the global boundary is nonzero.

**API for middle character with local zero obstruction.** `middleCharacter` an existential choice of χ₁₂ with the displayed boundary. `middleCharacter_boundary` δχ₁₂=η≠0 in the twisted D₈ coefficients. `middleCharacter_localBoundary` every completion has zero boundary. `middleCharacter_continuous` the parent trivial-action H¹ comparison gives an actual continuous Γ_Q→Z/8 character.

**Checks.**

1. **`middleCharacter_nonzero`:** χ₁₂ is nonzero because its boundary is nonzero.
2. **`middleCharacter_globalNoP`:** χ₁₂ cannot be in the image of H¹(Q,P₈), by exactness.
3. **`middleCharacter_localP`:** For each place v the restricted χ₁₂ belongs to the image of H¹(Q_v,P₈).

Prove the **locally solvable global embedding gap** for χ=(χ_01,χ_12,χ_23). Since U₈=P₈⋊C, lifting the fixed endpoint character is equivalent to a crossed homomorphism to P₈. Its adjacent middle coordinate is χ_12 exactly when χ_12 lies in the image of H¹(P₈)→H¹(Z/8). Equality of quotient H¹ classes is equality of characters because the quotient action is trivial. Exactness now gives a full U₈ lift at every completion and no global full lift.

Finally prove the **defined nonvanishing Z/8 triple** theorem. Local full lifts make both adjacent cup products vanish at all completions. IG.4's Grunwald–Wang boundary gives Sha¹(Q,μ₈)=0, and its finite duality gives Sha²(Q,Z/8)=0. Therefore the two cups vanish globally. Choose continuous primitives, obtaining a genuine global triple defining system. If its product contained zero, M.1's full-lift criterion would produce the forbidden global U₈ lift. This separately proves definedness and exclusion of zero.

*Inputs:* M.0–M.1, PC2,5,9, PPG5 and the six named IG.4 nodes. *Source:* HW Theorem 7.5 and Lemmas7.6–7.7, pp. 28–31; (7.4), p. 30; diagram(7.6), p. 31. *Acceptance:* distinguish Sha¹(Q,μ₈)=0 from Sha¹(L,μ₈)=C₂; distinguish the twisted auxiliary D₈ sequence from the constant final Z/8 inputs; verify the middle character is nonzero because its boundary is nonzero.

## The independent negligible-class continuation

The negligible-class direction has a separate design, **ProfiniteCohomologyPartIINegligibleClasses**, extending the same parent. It is independent of the Massey/unipotent targets. Its endpoint is Merkurjev–Scavia Theorem 1.3: for finite H, finite H-module A and F containing μ_(e(A)e(H)), the universally negligible H² subgroup equals the subgroup generated by cor_(H′)^H(a∪c), a∈A^(H′),c∈H²(H′,Z). The quantifier is every extension K/F and every continuous Γ_K→H, not evaluation only at F.

The split proposal assigns all53 routed extraction items exactly once:

| Layer | Work assigned | Extraction item numbers |
|---|---|---|
| N.0 | Universal solvability, negligibility, generic extension/detection, rational-variable injectivity, versality, functoriality and transgression | 4,5,11,12,13,15,23,24,25,26,27,35,124,125 |
| N.1 | Integral cyclic carry, connecting normalization, compatible Kummer reduction and cyclic negligibility | 22,67,126,127,128 |
| N.2 | Inverse twist, evaluation, ι,γ,β, root sequences, Kummer character lift and signed diagram | 38,39,40,41,42,44,45,46,47,48,49 |
| N.3 | Cup–corestriction generators, generated subgroup, connecting-class corollary and annihilator independence | 50,51,54,55,56 |
| N.4 | Affine divisor exactness, permutation invariants, stabilizer characters, corrected invariant-generator lemma, constants and its negative test | 57,58,59,60,61,62,63,64,65,66 |
| N.5 | Both classification inclusions, field independence, stabilizer-only/Kummer generators and sharp roots boundary | 69,70,71,72,73,74,134 |
| N.6 | All-fields characteristic-p Artin–Schreier/dévissage bound | 122 |

The design uses PC5,6,9,10 for connecting maps, transgression, restriction/corestriction and rational-coefficient vanishing; PPG5 for weak embedding problems; IG.0/IG.4 for Galois algebras; SF.1/SF.2 for quotient/étale foundations. Full Hochschild–Serre and its signed comparison remain ArithmeticGaloisDuality:R02.2; finite universal coefficients and Tor₁ remain its D7. The all-fields characteristic-p arithmetic statement generalizes the HL.2 local supplier once, while PC11 keeps the general dimension invariant and dévissage. No second continuous H², connecting map, Tor object or embedding-problem carrier is assigned.

Require nB=0,e(H)|e and μ_ne⊂F in the corrected invariant-generator lemma. Use factoriality of affine polynomial rings for divisors. Keep the real missing-roots example and H=A=C₂ over Q as negative tests; in the latter the generated group is C₂ while the negligible group is zero. The independent design must read the corrected extraction and source findings E1–E8 and verify all proof inputs. The present source reading covers only Merkurjev–Scavia's introduction pp. 1–4, so this allocation is a design brief, not a completed proof plan for that direction.

## Sources and version-scoped corrections

The sources are used for exact objects and proof inputs, with all results above stated in our own words:

- Y. Harpaz and O. Wittenberg, [The Massey vanishing conjecture for number fields](https://arxiv.org/pdf/1904.06512v2), arXiv:1904.06512v2, revision9December2021, **33-page preprint pagination**. Published in Duke Mathematical Journal172(2023),1–41, doi10.1215/00127094-2022-0004. The published full text was not obtained; the findings below concern the preprint only.
- I. M. Michailov, [Bogomolov multipliers for unitriangular groups](https://arxiv.org/pdf/1308.3408v2), v2,11-page PDF; §§2–3 supply the specialized finite-group calculation.
- P. Moravec, [Unramified Brauer groups of finite and infinite groups](https://arxiv.org/pdf/1203.3190), §2,pp. 3–4; Lemma 3.1/Theorem 3.2,pp. 4–6; opening of §4,pp. 9–10, for the natural commutativity-preserving presentation and character duality.
- A. Merkurjev and F. Scavia, [Galois representations modulo p that do not lift modulo p²](https://arxiv.org/pdf/2410.12560v1), introduction pp. 1–4, used to delimit the separate design.

All were accessed 18 October 2026 and independently reread at the relevant locators on 19 October 2026. The packet records hashes for the three proof sources and precise reading ranges for both passes. The source locators use their own PDF pagination rather than the publisher pagination. The HW findings below concern the specified 33-page preprint; the full publisher text was not obtained, and no claim is made about an error surviving in the published version.

The packet records twelve findings, independently confirmed at the specified preprint locators on 19 October 2026. No linked HW correction was located in its arXiv history or the author's publication page; searches for a Michailov correction likewise located none. This records the correction searches without asserting priority or that a preprint finding persists in the published version.

| Finding | Locator in the text read | Correction used here |
|---|---|---|
| E1 | HW Lemma 5.5,p. 19 | Discrete Hom needs finite-domain scope in these applications; general pointwise Hom stays at AGD R02.1. A functional on a direct sum of permutation modules can have nonopen stabilizer. |
| E2 | HW Proposition 7.3,p. 26 | The defining-system bijection fixes adjacent cocycles. Class-level existence is invariant by conjugation. |
| E3 | HW Definition 3.2,p. 9 and Lemma 4.7,p. 14 | Small-rank powering factors modulo p; the least divisor is1 at p=2. |
| E4 | HW Lemma 4.7 proof,p. 14 | The proof needs the divides-nine upper bound from Lemma 4.6; a multiple-of-nine assertion does not supply it, even though the exponent here is in fact9. |
| E5 | HW Lemma 4.13 proof,p. 17 | The factor e_03 has parameter a₂, consistent with the defined Q. |
| E6 | HW Proposition 6.1 proof,p. 23 | Deleting one endpoint of the size-six group gives a size-five group. |
| E7 | HW §7,p. 28 | The two boundary Hom sums are internal and intersect in the corner. |
| E8 | HW Proposition 5.3,p. 19 and all-place use,p. 22 | Supply the real/complex proof, including the real p=2 pairing. |
| E9 | HW Proposition 5.3 proof,p. 19 | The easy-case lift targets U. |
| E10 | HW Proposition 5.3 proof,p. 21 | Keep row u and column v in the order ρ_(u,v). |
| E11 | Michailov §3,p. 5 | γ_(m−1)(UT_m) is the corner; γ_m is trivial. The displayed earlier triviality fails already for UT₃. |
| E12 | Michailov Theorem 3.1 CaseII,p. 8 | A minimal-gap wedge uses two distance-ℓ transvections, both inside the group. |

## Completion criteria

The library development completes this roadmap when the continuous comparisons commute with the parent cups, both fixed-system correspondences and class-level lifting criteria hold with the stated signs, all finite stabilizer calculations pass their checks, refined lifting holds at every local field and every number-field completion for rank-one twists, and the concrete Z/8 triple is proved both defined and nonvanishing. The homogeneous-space global theorem and the independent negligible-class classification have the owners stated above.
