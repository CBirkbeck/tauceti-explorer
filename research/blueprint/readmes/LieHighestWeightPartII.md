# Highest weight theory, Part II: nilpotent orbits and weight patterns

This continuation starts after [LieHighestWeight](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/LieHighestWeight). It connects a nilpotent element to an sl2 triple, turns that triple into a filtration on every finite Lie module, and proves that these representationwise dimensions determine its inner conjugacy class. The second endpoint recovers the positive real part of a complex semisimple parameter from its geometric weight patterns. These are the interfaces used in Ciubotaru–Harris, Lemmas 2.4, 6.30, 10.9 and Proposition 10.2, rather than another development of ordinary highest-weight theory.

The source order is not the build order. Layers N0–N4 form the orbit-recognition chain; N5 uses the existing highest-weight and reductive-group foundations and can be built independently of the orbit computations. The integral/p-adic enveloping-algebra and completed-category-O continuations have separate owners and complete successor briefs in the packet and handoff.

## Conventions and existing foundations

Work over an algebraically closed field K of characteristic zero. The orbit theorems use a finite-dimensional semisimple K-Lie algebra L, with the native nondegenerate Killing-form condition, and a connected semisimple algebraic group G with Lie(G) identified with L. Conjugacy means the action of G(K), equivalently its adjoint form. N1 works for any ambient L admitting the given triple. N5's geometric patterns and positive torus parts use K=C; its real functional on weights is a functional on the abstract real weight space, not an ordering on K.

A triple is ordered (h,e,f), with [e,f]=h, [h,e]=2e and [h,f]=−2f. The zero triple is included. The existing Mathlib structure additionally requires h≠0, so it is imported through a zero-inclusive adapter. Representations in the filtration-recognition theorem are all finite **Lie modules**. Half-spin therefore remains available when the chosen G is SO or adjoint; no descent to that group is assumed.

Write M_j=ker(ρ(h)−j) and W_i=Σ_(j≤i) M_j. This filtration is increasing; e raises degree by two. Write d_i=dim(W_i/W_(i−1)) and m_n=d_n−d_(n+2). The d_i are symmetric, finitely supported weight multiplicities; the m_n are nonnegative sl2 multiplicities for n≥0. These three sequences must not be conflated. Each W_i is a vector subspace and is generally not an L-submodule. The existing generic filtered category is used: Mathlib's FilteredObject on ModuleCat with index Z. Reindexing W_(−i) compares it with the finite decreasing filtered-space interface already owned by PadicHodgeTheory:R06.2/filtered-vector-spaces. No generic filtered-space theory or arithmetic input is added here.

Exceptional roots use Bourbaki numbering with Aij=〈αi,αj∨〉, and integral coefficients in the **root** basis. G2 has matrix [[2,−1],[−3,2]]. F4 has the double bond A23=−2,A32=−1, with the chain otherwise simply laced. The E_r edges are (1,3),(3,4),(2,4),(4,5),…,(r−1,r). E6 opposition exchanges 1 with 6 and 3 with 5; it fixes 2 and 4. Opposition is trivial for G2,F4,E7,E8.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists the actual statements read at these pins. Its library inputs already provide sl2 classification, decomposition and integral spectrum; its roadmap inputs provide ordinary Cartan/root, PBW/Verma, highest-weight, character and group structure theory. The current Tau Ceti library additionally supplies the ad-nilpotent Killing-orthogonality and first-bracket facts in Killing/AdNilpotent; reuse those facts. The new N0 endpoint is completion to a triple, not a new proof target for that existing first bracket.

## Layers and dependency order

| Layer | Objects and endpoint | Internal inputs |
| --- | --- | --- |
| N0 | Nilpotent orbits, adapted triples, Jacobson–Morozov, Kostant and neutral-element conjugacy | Existing Lie and reductive-group foundations |
| N1 | Native restriction, increasing filtration, graded inversion and exact tensor/dual laws | N0 adapter |
| N2 | Classical partitions, very-even splitting and half-spin recognition | N0–N1 |
| N3 | Dominant characteristics, root profiles and finite exceptional certificates | N0–N1 |
| N4 | Recognition over a semisimple direct sum | N2–N3 |
| N5 | Highest-weight test, geometric patterns and positive-part recognition | Existing highest-weight and reductive-group foundations |

Each target below has its stable packet id, complete hypotheses, construction or proof plan, direct inputs and acceptance checks. Every definition and construction also has its use-derived API and discriminating tests. All are specifications; no target is claimed formalised.


## N0: Nilpotent orbits and adapted triples

Build a zero-inclusive adapter to the native sl2 triple and the nilpotent adjoint orbit interface. Prove the semisimple Jordan-centralizer reduction, Jacobson–Morozov, algebraic integration of a triple, Kostant transitivity over a fixed nilpotent and conjugacy from the neutral element. Work over any algebraically closed characteristic-zero field, and use current library trace identities rather than replanning them.


### Zero-inclusive sl2 triples

Target `LieHighestWeightPartII:N0/zero-triple` (definition).

A triple (h,e,f) is sl2-or-zero if it is (0,0,0) or satisfies Mathlib IsSl2Triple(h,e,f). Over K this is equivalent to the three equations [e,f]=h, [h,e]=2e, [h,f]=−2f, without a nonzero condition.

Hypotheses: K is an algebraically closed field of characteristic zero. L is any K-Lie algebra.

Construction or proof:

1. If h=0, the last two equations give e=f=0 since 2 is invertible. Otherwise use the native structure.
2. Map triples through Lie homomorphisms using the three equations; noninjective maps can take a nonzero triple to zero.

Direct inputs: `mathlib:IsSl2Triple`.

Use: CH Definition 2.2 and Lemma 2.4: The zero nilpotent participates in the filtration and recognition statements.; N0 restriction and N1 filtration: Construct a zero restriction homomorphism and a filtration concentrated at weight zero.

API:

- `IsSl2TripleOrZero.zero` (constructor): The triple (0,0,0) satisfies the adapter.
- `IsSl2TripleOrZero.iff_relations` (characterisation): It is equivalent to the three bracket equations in characteristic zero.
- `IsSl2TripleOrZero.iff_of_ne_zero` (compatibility): If h≠0, the adapter is equivalent to Mathlib IsSl2Triple.
- `IsSl2TripleOrZero.map` (functoriality): Any K-Lie homomorphism maps adapted triples to adapted triples; identity and composition act as expected.

Tests:

- **zero_triple**: (0,0,0) is adapted but is not Mathlib IsSl2Triple.
- **standard_triple**: The standard E,F,H of sl2 give the native nonzero branch.
- **vanishing_neutral**: (0,e,f) cannot be adapted when e≠0; likewise a central nonzero h with e=f=0 fails.

Check: The adapter agrees exactly with the native structure on h≠0.

Sources: [CH] §2.1, p.6; Definition 2.2 — The filtration includes the zero nilpotent, for which the natural triple must be zero.


### Nilpotent adjoint orbits

Target `LieHighestWeightPartII:N0/nilpotent-orbit` (construction).

Let N(L)={e∈L : ad(e) is nilpotent}. Restrict the adjoint G(K)-action to N(L), and take its native orbit set. On adapted triples use simultaneous Ad-conjugation of all three entries. The nilpotent element map sends the orbit of (h,e,f) to the orbit of e.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form.

Construction or proof:

1. Conjugating ad(e) by Ad(g) preserves a nilpotence exponent.
2. Use the existing group-action orbit relation and quotient, not a new equality relation on underlying elements.
3. The triple equations are preserved because Ad(g) is a Lie automorphism.
4. For the triple-to-nilpotent map, restrict the adjoint module via the pinned sl2 basis constructor; the standard-module decomposition proves the raising operator nilpotent, including the zero branch.

Direct inputs: `LieHighestWeightPartII:N0/zero-triple`, `mathlib:LieAlgebra.ad`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCeti.lieHomOfSl2Basis`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`.

Use: CH Lemmas 2.4 and 10.9: Express the conjugacy conclusion and the equivalence of choosing nilpotents or triples.; N2 very-even separation: Keep SO/adjoint conjugacy distinct from full orthogonal conjugacy.

API:

- `NilpotentOrbit.mk` (constructor): An element with nilpotent adjoint endomorphism gives its orbit class.
- `NilpotentOrbit.eq_iff` (characterisation): Two classes coincide iff some g∈G(K) sends one representative to the other.
- `NilpotentOrbit.nilpotentPart` (projection): The triple orbit maps to the orbit of e and is independent of representative.
- `NilpotentOrbit.centralIsogeny` (compatibility): Surjectivity on K-points of a central isogeny identifies these orbit sets; no rational-point version over a nonclosed field is asserted.

Tests:

- **zero_orbit**: Only e=0 lies in the zero orbit.
- **sl2_two_orbits**: For sl2, there are exactly the zero orbit and the orbit of E.
- **outer_is_not_inner**: For so8 the two very-even SO-orbits in the partition (4,4) are not identified, even though an O-element interchanges them.

Check: Changing G by a central isogeny gives the same orbit relation over K.

Sources: [SOM] §3.1, pp.15–16 — The adjoint action defines nilpotent orbits, and the triple-orbit correspondence includes the zero homomorphism.


### Jordan decomposition and the reduction to distinguished nilpotents

Target `LieHighestWeightPartII:N0/jordan-centralizer` (lemma).

For semisimple L, the Jordan decomposition ad(x)=S+N comes from unique commuting x_s,x_n∈L. If [x,e]=0 or e is an ad(x)-eigenvector, x_s and x_n preserve that condition with the corresponding semisimple eigenvalue and zero nilpotent contribution. For nonzero semisimple s, L^s is reductive with proper semisimple derived algebra; a nilpotent e∈L^s lies in [L^s,L^s].

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate).

Construction or proof:

1. Use nondegenerate Killing form to identify inner derivations; the semisimple/nilpotent Jordan parts of a derivation are derivations (check the generalized-eigenspace bracket rule). Thus their inner elements are x_s,x_n.
2. Place s in a Cartan via maximal torus structure. Roots vanishing on s give the derived semisimple algebra of its centralizer, with the complementary toral center.
3. In the centralizer, any nonzero component in that toral center is semisimple, so nilpotence forces that component to vanish. A nonzero semisimple s cannot be central in L, so the derived centralizer has smaller dimension.

Direct inputs: `mathlib:LieAlgebra.IsKilling`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `mathlib:LieDerivation.IsKilling.exists_eq_ad`, `mathlib:Module.End.exists_isNilpotent_isSemisimple`.


Check: For sl3, the centralizer of diag(1,1,−2) has derived algebra sl2; a nilpotent commuting with it has zero central component.

Sources: [BAL] §5, proof of Theorem 5.1, pp.14–15 — The induction uses Jordan stability and the proper derived centralizer; these algebraic steps also work over K.


### Jacobson–Morozov theorem

Target `LieHighestWeightPartII:N0/jacobson-morozov` (theorem).

Every e∈N(L) extends to an adapted triple (h,e,f). Conversely e and f in every adapted triple are ad-nilpotent, and ad(h) is diagonalizable with integer eigenvalues. The zero e has only the zero triple.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate).

Construction or proof:

1. Induct on dim L. If L^e contains a nonzero semisimple element, apply the Jordan-centralizer reduction and induction in its derived algebra.
2. In the remaining case every element of L^e is ad-nilpotent. The Killing pairing of e with L^e vanishes, so e lies in im(ad e); choose h with [h,e]=2e and replace h by its semisimple part.
3. Apply pinned Engel to the centralizer acting faithfully on L, so it is nilpotent and Kh+L^e is solvable. The solvable algebra Kh+L^e acts triangularly by Lie’s theorem; operators from L^e are strictly triangular. Thus tr(ad h·ad x)=0 for x∈L^e, giving h∈im(ad e). Project a preimage f to the ad(h)-eigenspace −2 to obtain [e,f]=h.
4. The resulting sl2 action on L has nilpotent raising/lowering operators and diagonalizable integral h by pinned sl2 theory. Each argument is algebraic over K; no analytic integration or complex-field transfer is used.

Direct inputs: `LieHighestWeightPartII:N0/zero-triple`, `LieHighestWeightPartII:N0/jordan-centralizer`, `mathlib:LieAlgebra.IsKilling`, `tauceti:TauCeti.iSup_eigenspace_toEnd_intCast_eq_top`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`, `mathlib:LieModule.exists_nontrivial_weightSpace_of_isSolvable`, `mathlib:LieModule.isNilpotent_iff_forall`.


Check: Zero is included; in sl2, E extends to the standard triple.

Sources: [BAL] Theorem 5.1 and its proof, pp.13–15 — Provides the Killing-form induction. Restrict strict triangularity to L^e, correcting the sentence recorded as E4.


### Algebraic integration of a triple and inner invariance

Target `LieHighestWeightPartII:N0/triple-integration` (theorem).

An adapted triple determines a rational homomorphism SL2,K→G with differential E↦e,F↦f,H↦h; the zero triple gives the trivial homomorphism. In every finite L-module, any Ad(g) twist is isomorphic to the original module. In particular the triple restricted characters are invariant under simultaneous Ad(G(K))-conjugation.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form. M is a finite-dimensional K-Lie module for L; representations mean Lie modules, including those not descending to a chosen non-simply-connected G.

Construction or proof:

1. Embed G as a closed subgroup of GL(V) using ReductiveGroups Layer 1. Decompose the restricted sl2-module V into standard modules and integrate their explicit polynomial SL2 actions.
2. Check the two unipotent one-parameter subgroups lie in G: for a nilpotent X in Lie(G), the finite polynomial exp(tX) preserves the defining ideal. The left-invariant derivation attached to X preserves that ideal, so all Taylor coefficients of each defining function along exp(tX) vanish; factorials are invertible. The upper and lower unipotent subgroups generate SL2, so the integrated map has image in G.
3. For inner invariance it suffices, by root subgroups and Bruhat, to handle the simple-root SL2 subgroups of G. In any finite L-module their raising/lowering operators are nilpotent by pinned sl2 decomposition; their finite exponentials implement the adjoint twist. Multiply these intertwiners.
4. All identities are finite polynomial identities over K. The proof does not assume that an arbitrary L-module descends to the selected group G.

Direct inputs: `LieHighestWeightPartII:N0/zero-triple`, `tauceti:TauCeti.lieHomOfSl2Basis`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `mathlib:LieDerivation.exp`.


Check: The Weyl element in this SL2 sends h to −h. For G=SO(8), inner twists of a Lie half-spin module are isomorphic although the module does not descend to SO(8).

Sources: [BAL] Corollary 5.2, p.13 — The source integrates the sl2 map; the plan spells out its algebraic closed-subgroup justification.; [CH] Definition 2.2, p.6; Appendix, Lemma 10.9, p.35 — Conjugacy must act consistently on every Lie module, including half-spin modules.


### Kostant conjugacy for a fixed nilpotent

Target `LieHighestWeightPartII:N0/kostant-conjugacy` (theorem).

For adapted triples (h,e,f) and (h′,e,f′), there is u∈Z_G(e)(K) simultaneously carrying h to h′ and f to f′. Consequently the map from adapted-triple orbits to nilpotent orbits is a bijection.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form.

Construction or proof:

1. For e=0 use the zero branch. Otherwise decompose L under the first triple. L^e has nonnegative h-weights and u=L^e∩[L,e] is precisely its positive-weight part.
2. The difference h′−h belongs to u. Successively remove its lowest positive-weight component using exp(ad x) for x in that component, dividing by its nonzero weight. Higher commutators raise degree, so the process terminates. Each factor comes from an element of Z_G(e)(K) by triple integration applied to the nilpotent x.
3. After matching h, the difference of the f entries lies both in L^e and in h-weight −2, so vanishes. Combine this fiber transitivity with Jacobson–Morozov and equivariance.

Direct inputs: `LieHighestWeightPartII:N0/jacobson-morozov`, `LieHighestWeightPartII:N0/triple-integration`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `LieHighestWeightPartII:N0/nilpotent-orbit`, `mathlib:LieDerivation.exp`.


Check: The conjugator fixes the chosen e, not merely its orbit.

Sources: [BAL] Proposition 5.4, Remark 5.6 and Lemma 5.7, pp.15–17 — The positive centralizer and uniqueness of f prove fiber transitivity. Finite exponentials replace a generic unipotent closed-orbit theorem.


### Conjugacy from the neutral element

Target `LieHighestWeightPartII:N0/neutral-conjugacy` (theorem).

Two adapted triples in L are Ad(G(K))-conjugate iff their neutral elements h,h′ are Ad(G(K))-conjugate. Thus dominant characteristic elements classify triple orbits.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form.

Construction or proof:

1. Reduce to h=h′; zero is immediate. Let L_j be its integer eigenspaces. The map ad(e):L_0→L_2 is surjective by sl2 decomposition, so the Z_G(h)^0-orbit of e is open in the affine space L_2.
2. The same holds for e′. Characteristic zero ensures separability for the orbit tangent calculation. Two open orbits in irreducible L_2 intersect, and hence coincide. After matching e, f is unique because L^e has no negative h-weights.

Direct inputs: `LieHighestWeightPartII:N0/triple-integration`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.


Check: In sl2 the neutral characteristic is 0 or the dominant element H.

Sources: [DG] §3, Lemmas 2–3, pp.4–5 — The fixed-characteristic orbit is open in degree two; this supplies uniqueness without using a Bala–Carter classification.; [SOM] §3.1, pp.15–16 — The characteristic determines the nilpotent orbit.


## N1: Representation filtrations and graded multiplicities

Restrict finite Lie modules through the native sl2 basis constructor. Construct the increasing eigenfiltration W_i, identify its graded quotient with the weight-i eigenspace, and recover sl2 multiplicities by d_n−d_(n+2). Prove strictness, levelwise exactness and tensor/dual compatibility in the existing filtered-object vocabulary. Zero is a single jump at zero.


### Restriction along an adapted triple

Target `LieHighestWeightPartII:N1/restriction` (construction).

An adapted triple gives the native Lie homomorphism sl2(K)→L with images H↦h,E↦e,F↦f. Pull back any finite Lie module M along it using the existing Lie-module restriction. The zero triple gives the trivial sl2 action.

Hypotheses: K is an algebraically closed field of characteristic zero. L is any K-Lie algebra. M is a finite-dimensional K-Lie module for L; representations mean Lie modules, including those not descending to a chosen non-simply-connected G.

Construction or proof:

1. Apply the pinned basis-to-Lie-hom constructor with the bracket equations.
2. Use existing restriction of scalars for Lie modules; uniqueness is equality on the three basis vectors.

Direct inputs: `LieHighestWeightPartII:N0/zero-triple`, `tauceti:TauCeti.lieHomOfSl2Basis`, `mathlib:LieModule.toEnd`.

Use: N1 graded comparison: Use the pinned sl2 decomposition without replanning it.; N2 Jordan partitions: Translate standard-module sl2 summands into nilpotent Jordan blocks.

API:

- `Sl2TripleOrZero.restrict` (constructor): The restricted module has H,E,F actions respectively ρ(h),ρ(e),ρ(f).
- `Sl2TripleOrZero.restrict_map` (functoriality): An L-module map is an sl2-module map after restriction; identities and composition are preserved.
- `Sl2TripleOrZero.restrict_native` (compatibility): For the standard triple of sl2, restriction along its identity homomorphism is the original module.
- `Sl2TripleOrZero.restrict_zero` (simp): For the zero triple every sl2 element acts by zero.

Tests:

- **restriction_zero**: A two-dimensional trivial L-module restricts to two copies of the sl2 trivial module.
- **restriction_standard**: The sl2 standard module restricts to Sl2Std(K,1), with H-weights 1,−1.
- **restriction_sign**: For the standard nonzero triple of sl2, swapping E and F while fixing H violates [E,F]=H. Replacing H by −H as well gives a valid swapped triple.

Check: This is a comparison with the native restriction operation, not a second representation carrier.

Sources: [CH] Definition 2.2, p.6; Appendix proof of Lemma 10.9, p.35 — The representation is read as an sl2 representation via the triple.


### The increasing weight filtration of a triple

Target `LieHighestWeightPartII:N1/weight-filtration` (construction).

For an adapted triple t and a finite L-module M, put M_j=ker(ρ(h)−j·id), j∈Z, and W_i^t(M)=Σ_{j≤i}M_j as K-submodules of M. Use the native Mathlib filtered-object category with index Z. The family is increasing, zero for i sufficiently negative, and M for i sufficiently positive. Reindexing by i↦−i agrees with the existing decreasing finite filtered-space convention; this node owns only the filtration supplied by a triple.

Hypotheses: K is an algebraically closed field of characteristic zero. L is any K-Lie algebra. M is a finite-dimensional K-Lie module for L; representations mean Lie modules, including those not descending to a chosen non-simply-connected G.

Construction or proof:

1. For a nonzero triple use the pinned integral eigenspace direct sum; for the zero triple M_0=M and all other M_j vanish.
2. Finite dimension bounds the finite set of nonzero eigenspaces. Inclusions of subspaces give the existing functor into MonoOver(M), with underlying module unchanged.
3. The pieces are vector subspaces, not generally L-submodules; raising and lowering have degrees +2 and −2.

Direct inputs: `LieHighestWeightPartII:N0/zero-triple`, `LieHighestWeightPartII:N1/restriction`, `tauceti:TauCeti.iSup_eigenspace_toEnd_intCast_eq_top`, `tauceti:TauCeti.exists_int_of_hasEigenvalue`, `mathlib:CategoryTheory.FilteredObject`.

Use: CH Lemma 2.4: Compare dimension functions over all representations.; CH Appendix Tables 2–4: Take successive quotients before interpreting printed numeric entries.

API:

- `Sl2WeightFiltration.step` (projection): The step is the sum of native LinearMap eigenspaces at integers j≤i.
- `Sl2WeightFiltration.mono` (structure): For i≤k, W_i⊆W_k, giving a native FilteredObject.
- `Sl2WeightFiltration.map` (functoriality): Every L-linear map sends W_i into W_i; the induced maps satisfy identity and composition.
- `Sl2WeightFiltration.zero` (simp): For t=0, W_i=0 when i<0 and W_i=M when i≥0.
- `Sl2WeightFiltration.decreasingComparison` (compatibility): The decreasing filtration Fil^n=W_(−n) agrees with the object of PadicHodgeTheory:R06.2/filtered-vector-spaces whenever that generic finite-filtered category is used; no generic category is reconstructed here.

Tests:

- **trivial_jump**: For the one-dimensional trivial module the only graded jump is at 0.
- **standard_steps**: For Sl2Std(K,1), dim W_i is 0 for i<−1, 1 for −1≤i<1, and 2 for i≥1.
- **adjoint_steps**: For the sl2 adjoint module, dim W_(−2)=1, dim W_(−1)=1, dim W_0=2, dim W_2=3; these are not the graded multiplicities 1,0,1,0,1.

Check: W is increasing, bounded and exhaustive; its underlying object is precisely M.

Sources: [CH] Definition 2.2 and Lemma 2.4, pp.6–7 — The source uses the increasing sum of h-eigenspaces, not the lowering monodromy convention.


### Graded pieces and recovery of sl2 multiplicities

Target `LieHighestWeightPartII:N1/graded-comparison` (theorem).

There is a natural K-linear isomorphism gr_i W=W_i/W_(i−1)≅M_i, induced by the eigenspace inclusion. Write d_i=dim gr_i W. Then d_i=d_(−i), d_i is finitely supported, and for n≥0 the multiplicity of Sl2Std(K,n) in the restricted module is m_n=d_n−d_(n+2)≥0. Conversely d_i=Σ_{n≥|i|, n≡i mod2}m_n. Thus equal cumulative dimension functions, equal graded dimension functions, and isomorphic restricted sl2 modules are equivalent.

Hypotheses: K is an algebraically closed field of characteristic zero. L is any K-Lie algebra. M is a finite-dimensional K-Lie module for L; representations mean Lie modules, including those not descending to a chosen non-simply-connected G.

Construction or proof:

1. Split W_i as W_(i−1)⊕M_i using the direct eigenspace decomposition.
2. In Sl2Std(K,n) every weight n,n−2,…,−n has multiplicity one. Subtract the two counts at n and n+2 to isolate m_n.
3. Use finite support to recover W dimensions by cumulative sums, or d_i by successive differences. Nonnegativity follows from actual multiplicities, not from subtraction in natural numbers alone.

Direct inputs: `LieHighestWeightPartII:N1/weight-filtration`, `tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`, `tauceti:TauCeti.finrank_eigenspace_toEnd_neg`.


Check: For V(2)⊕2V(0), d_0=3,d_2=1 and m_0=2,m_2=1; cumulative dim W_0=4.

Sources: [CH] Appendix proof of Lemma 10.9, p.35 — Restriction is determined by its weight multiplicities; this node states the explicit inversion and fixes the filtration/graded distinction.


### Exact tensor and dual compatibility

Target `LieHighestWeightPartII:N1/tensor-exactness` (theorem).

The assignment M↦(M,W^t) is exact and compatible with tensor products and duals: module morphisms are strict; a short exact sequence stays exact at every W_i; W_i(M⊗N)=Σ_{a+b=i}im(W_aM⊗W_bN), equivalently the sum for a+b≤i; W_i(M*)=Ann(W_(−i−1)M); the tensor unit has its single jump at 0. The comparisons preserve associativity, symmetry, unit and evaluation maps.

Hypotheses: K is an algebraically closed field of characteristic zero. L is any K-Lie algebra. M,N are finite-dimensional L-modules.

Construction or proof:

1. A module map commutes with h and hence respects each eigenspace. Surjectivity and injectivity are checked separately on the integral eigenspaces, which proves strictness and levelwise exactness.
2. On tensors the eigenvalues add; on the contragredient dual they change sign. Sum the relevant eigenspaces.
3. The resulting comparisons are the identity on underlying tensors and the ordinary evaluation map, so their coherence follows on pure tensors. No assertion that the category of all filtered spaces is abelian is needed.

Direct inputs: `LieHighestWeightPartII:N1/weight-filtration`, `LieHighestWeightPartII:N1/graded-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-2-weights-of-a-module-and-their-integrality`.


Check: V(1)⊗V(1) has graded dimensions 1,2,1 at −2,0,2; duality fixes the filtration of the unit.

Sources: [CH] §2.1–§2.2, pp.6–7, Definition 2.2 — The filtration is representation-indexed; the stated tensor and dual laws follow from its eigenvalue construction.


## N2: Classical recognition and half-spin tests

Recover classical nilpotent partitions from the standard module, prove the invariant-form parity constraints and the O-to-SO splitting criterion, and distinguish the very-even pair by a fixed Lie half-spin module. State the finite test family in each classical type with the actual Lie weight lattice; do not require descent of half-spin to SO.


### Classical triples and partitions with invariant forms

Target `LieHighestWeightPartII:N2/classical-partitions` (theorem).

For L=sl(V), so(V,B) or sp(V,B), the restricted standard module decomposes as ⊕_{n≥0}V(n)⊗U_n, so e has Jordan blocks of size n+1 with multiplicity dim U_n. In type A all partitions of dim V occur. For orthogonal B, each even block size has even multiplicity; for alternating B, each odd block size has even multiplicity. These partitions classify the GL/SL, O, or Sp triple orbits, respectively. For SO(2r), an O-orbit splits into two SO-orbits exactly when its partition is very even (every block size even and each multiplicity even); otherwise it remains one orbit.

Hypotheses: K is an algebraically closed field of characteristic zero. V is finite-dimensional; in orthogonal and symplectic cases B is nondegenerate and respectively symmetric or alternating; the classical semisimple rank hypotheses exclude abelian so2.

Construction or proof:

1. The standard V(n) has one Jordan block of size n+1 for E. Its invariant bilinear form is unique up to scalar and is symmetric for even n and alternating for odd n (solve the E,F recurrence in the standard weight basis).
2. The B-pairing between distinct isotypic summands vanishes by sl2 irreducibility. On V(n)⊗U_n it is the tensor product of that standard invariant form and a nondegenerate form on U_n. Over K, such forms are classified by dimension; alternating multiplicity forms have even dimension. This proves existence and O/Sp uniqueness without importing a book classification table.
3. In the orthogonal centralizer a symmetric multiplicity factor has an element of determinant −1, whose determinant on V(n)⊗U_n is (−1)^(n+1). Such a factor exists exactly when some odd block size occurs. If all block sizes are even, every orthogonal centralizer element has determinant +1, and index two gives the split. In type A, adjust a GL conjugator to determinant one by a scalar, using algebraic closedness.

Direct inputs: `LieHighestWeightPartII:N1/restriction`, `LieHighestWeightPartII:N1/graded-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.


Check: For sp4, (3,1) is forbidden while (2,2) occurs. For so8, (4,4) splits into two SO-orbits, while (3,3,1,1) does not.

Sources: [CH] Appendix, proof of Lemma 10.9, p.35 — The classical argument identifies block dimensions with restricted sl2 summands and isolates very-even splitting. The present proof spells out invariant forms instead of treating the cited inaccessible book as read.


### Half-spin separation of the very-even pair

Target `LieHighestWeightPartII:N2/half-spin-separation` (theorem).

For a very-even partition in so(2r), r is even. Choose ascending positive odd neutral coordinates 0<a1≤…≤ar and simple roots ±ε1+ε2, ε3−ε2,…,εr−ε_(r−1). The two dominant characteristics are (a1,a2,…,ar) and (−a1,a2,…,ar). In the fixed Lie half-spin module S+ whose weights are half-sign vectors with an even number of minus signs, their largest nonzero graded weights are A=½Σa_j and A−a1. Thus their filtration dimension functions differ.

Hypotheses: K is an algebraically closed field of characteristic zero. L is split so(2r), r≥4, and the partition is very even.

Construction or proof:

1. Over the algebraic closure, construct the half-spin highest-weight Lie module L(½Σ ε_j) from highest-weight classification. Compute its weights by the minuscule D_r Weyl orbit: the even-minus half-sign vectors. For K=ℂ compare this with the exterior-algebra half-spin construction supplied by SpinRepresentations Layer 5.
2. The two orthogonal orbit branches differ by changing exactly one coordinate sign. Maximizing over the even-minus sign vectors gives A for the all-positive point; after the first sign change parity requires losing at least a1, and changing the first sign achieves it.
3. Use graded comparison to pass from differing maximal graded weight to differing cumulative functions. This is a Lie representation (or a representation of Spin), not a claim of descent to SO.

Direct inputs: `LieHighestWeightPartII:N2/classical-partitions`, `LieHighestWeightPartII:N1/graded-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`.


Check: In so8, partition (4,4) gives a=(1,1,3,3), and the maxima in S+ are 4 and 3. Partition (2,2,2,2) gives 2 and 1.

Sources: [CH] Appendix, proof of Lemma 10.9, p.35 — The half-spin test separates the two very-even orbits; use graded support and the corrected chain orientation.


### Recognition in the classical simple types

Target `LieHighestWeightPartII:N2/classical-recognition` (theorem).

In a classical simple L, equal W_i dimensions in the standard module determine the adapted triple orbit, except for a very-even pair in type D. In type D adjoining one fixed half-spin highest-weight Lie module to the test family determines the orbit. Hence equality for every finite L-module implies inner conjugacy.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form. L has classical simple type A, B, C or D; use the explicit standard realization supplied by classification.

Construction or proof:

1. Use graded inversion to recover the sizes and counts of all Jordan blocks.
2. Apply the invariant-form classification; in the single split case apply half-spin separation, then transport through the chosen Lie isomorphism.

Direct inputs: `LieHighestWeightPartII:N2/classical-partitions`, `LieHighestWeightPartII:N2/half-spin-separation`, `LieHighestWeightPartII:N1/graded-comparison`, `LieHighestWeightPartII:N0/neutral-conjugacy`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.


Check: No collection restricted to SO-descending standard tensor powers is substituted for the stated Lie test family.

Sources: [CH] Appendix, Lemma 10.9, p.35, classical part — The standard representation, supplemented by half-spin precisely for the split orthogonal case, supplies a finite test family.


## N3: Exceptional root certificates and appendix profiles

Use dominant labels 0,1,2, opposition and nonnegative sl2 multiplicities as necessary conditions. Construct exact adjoint root profiles, certify injectivity on the finite candidate sets independently for G2,F4,E6,E7,E8, and deduce exceptional adjoint separation. Decode all 91 CH table rows by checked profiles and cumulative sums, with root-vector witnesses for the supplied representatives; printed orbit names remain row keys. The separation proof needs no full orbit enumeration.


### Necessary conditions on a dominant characteristic

Target `LieHighestWeightPartII:N3/dominant-characteristic` (theorem).

Conjugate an adapted triple so that h lies in a fixed dominant Cartan chamber. Its simple-root labels a_i=α_i(h) are integers in {0,1,2}, and a is fixed by opposition −w0. For its adjoint grading d_m=dim L_m, d_m=d_(−m) and d_m≥d_(m+2) for every integer m≥0.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form. L is simple and a Cartan and positive system are fixed.

Construction or proof:

1. Use triple integration to put h in a maximal torus and then in the dominant chamber; integral eigenvalues give nonnegative integral labels.
2. For a simple root α with α(h)>2, the lowering f kills its root vector: f has degree −2 and its negative-root components cannot subtract a positive root from the simple α to leave a root of positive degree. But lowering is injective in positive weights in every sl2 summand. This contradiction gives the upper bound 2.
3. The SL2 Weyl element sends h to −h; uniqueness in the dominant chamber identifies h with −w0 h and hence a with its opposition permutation.
4. Apply the adjoint sl2 multiplicity formula for the inequality.

Direct inputs: `LieHighestWeightPartII:N0/triple-integration`, `LieHighestWeightPartII:N1/graded-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-2-weights-of-a-module-and-their-integrality`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`, `tauceti:TauCeti.oppositionPerm`.


Check: For E6, opposition imposes a1=a6 and a3=a5 in Bourbaki numbering; a2 and a4 are fixed.

Sources: [SOM] §3.1, pp.15–16 — Dominant neutral elements have labels 0,1,2.; [DG] §2, pp.2–3 — Weighted diagrams encode the dominant neutral element; opposition and multiplicity inequalities are explicit necessary consequences of sl2 theory.


### Adjoint grading from integral root coefficients

Target `LieHighestWeightPartII:N3/root-profile` (construction).

For exceptional type T, let Φ_T be the finite root set in its Bourbaki simple-root lattice Z^r. For a∈Z^r define D_T(a)_m=r·δ_(m,0)+#{c∈Φ_T : Σ_i c_i a_i=m}. Regard D_T(a) as a finitely supported Z→N function. For a characteristic a this is exactly the adjoint graded multiplicity function, with no nilpotent classification input.

Hypotheses: K is an algebraically closed field of characteristic zero. T is G2,F4,E6,E7 or E8; r is its rank. The Cartan convention is Aij=〈αi,αj∨〉; root coefficients, not coroot coefficients, are used.

Construction or proof:

1. Use the finite integral root data supplied by RootSystems Layer 6, compared with the pinned Cartan matrices. Count integer dot products over that root set, then add the Cartan zero-weight rank.
2. Identify each root space with a one-dimensional adjoint eigenspace and the Cartan with its r-dimensional zero-weight summand.
3. For computation, generate roots by simple reflections c_j↦c_j−Σ_i c_i Aij, all other coordinates unchanged. Prove this finite set is the supplied root set using its reflection closure and generation, rather than trusting an unbounded search.

Direct inputs: `tauceti:TauCeti.DynkinType.cartanMatrix`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`.

Use: N3 exceptional recognition: Produce profiles from root data without a classification table.; CH Appendix Tables 2–4: Decode each row as a graded count, and recover increasing filtration dimensions by cumulative sum.

API:

- `AdjointRootProfile.coeff` (projection): The coefficient is the exact rank-plus-root count formula.
- `AdjointRootProfile.total` (relation): Σ_m D_T(a)_m=r+|Φ_T|.
- `AdjointRootProfile.neg` (relation): D_T(a)_(−m)=D_T(a)_m, by the root involution c↦−c.
- `AdjointRootProfile.adjoint` (compatibility): For a characteristic, D_T(a)_m=dim ker(ad h−m).

Tests:

- **zero_profile**: At a=0 the coefficients are dim L at 0 and zero elsewhere.
- **principal_g2**: For G2, a=(2,2), the nonnegative coefficients at m=0,…,10 are 2,0,2,0,1,0,1,0,1,0,1, totaling 14 after reflection.
- **principal_f4**: For F4 principal a=(2,2,2,2), D_0=4 and the total dimension is 52, whereas dim W_0=28. Omitting the Cartan term fails this test.
- **root_coroot_orientation**: G2 uses [[2,−1],[−3,2]] (short root first), and F4 has A23=−2,A32=−1; transposing or reindexing requires the corresponding explicit root-coordinate comparison.

Check: Every profile has total sum dim L and is symmetric in m; at a=0 it is concentrated at 0.

Sources: [CH] Appendix, Tables 2–4, pp.35–37 — The printed numbers are interpreted as graded adjoint dimensions.; [DG] §2, pp.2–3 — Root evaluations on the characteristic calculate the grading.


### Finite certificates for exceptional characteristics

Target `LieHighestWeightPartII:N3/candidate-certificate` (construction).

For T exceptional, C_T is the finite subset of {0,1,2}^r consisting of opposition-fixed labels a satisfying D_T(a)_m≥D_T(a)_(m+2) for all m≥0. Implement the test over 0≤m≤B_T where B_T=2·max_{c∈Φ_T}Σ_i|c_i|; outside that range coefficients vanish. A certificate records the exact finite root set, its comparison to the pinned root datum, and the list of distinct pairs (a,D_T(a)) for a∈C_T, with injectivity checked by integer equality.

Hypotheses: K is an algebraically closed field of characteristic zero. Use the same T, root coefficients, Cartan convention and profile as the preceding node.

Construction or proof:

1. Enumerate the 3^r label vectors, filter by the explicit opposition permutation, then by the finite nonnegative sl2 multiplicity tests.
2. All computations are exact integer addition, multiplication, counting and comparison; no floating arithmetic or probabilistic exclusion is used.
3. An independent scratch computation gives |C_T|=7,28,34,274,245 in the order G2,F4,E6,E7,E8. These are candidate counts, not orbit counts. Formal certification remains the theorem in the next node.

Direct inputs: `LieHighestWeightPartII:N3/root-profile`, `LieHighestWeightPartII:N3/dominant-characteristic`, `tauceti:TauCeti.oppositionPerm`.

Use: N3 candidate-profile injectivity: Reduce separation to a transparent finite check.; N3 E6/E7 cases: Give direct certificates, without inferring Levi conjugacy from E8 conjugacy.

API:

- `CharacteristicCandidates.mem` (characterisation): Membership is the conjunction of labels 0/1/2, opposition invariance and the stated finite inequalities.
- `CharacteristicCandidates.sound` (compatibility): Every dominant characteristic of an adapted triple belongs to the finite set.
- `CharacteristicCandidates.bound` (relation): All profile coefficients outside [−B_T,B_T] vanish, justifying the finite loop.
- `CharacteristicCandidates.check` (data): The certificate checker recomputes profiles from the root set and compares every unequal pair; any corrupted root or profile record is rejected.

Tests:

- **candidate_zero**: The zero vector belongs to C_T and has the zero-nilpotent profile.
- **candidate_counts**: Root counts are 12,48,72,126,240; candidate counts are 7,28,34,274,245.
- **e6_opposition_essential**: Without opposition, E6 has 212 labels passing only the sl2 inequalities and 123 distinct profiles, hence collisions; with opposition only 34 labels remain and their profiles are all distinct.
- **candidates_not_orbits**: G2 has 7 candidates but only 5 nilpotent orbits including zero. Membership is a necessary test, not an existence theorem.

Check: Every actual dominant triple characteristic belongs to C_T; no converse or completeness of the candidate list is asserted.

Sources: [DG] §2, pp.2–3; §3, Lemmas 2–3, pp.4–5 — Weighted diagrams and the adjoint grading motivate the finite check. The larger necessary-diagram certificate here is an explicitly derived alternative, not a theorem asserted in de Graaf.; [CH] Appendix, Lemma 10.9, p.35 — The exceptional proof needs separation; a superset of possible characteristics suffices.


### Exceptional profile injectivity certificate

Target `LieHighestWeightPartII:N3/candidate-profile-injective` (theorem).

For each T=G2,F4,E6,E7,E8 and a,b∈C_T, equality D_T(a)=D_T(b) implies a=b. The theorem checks the entire finite candidate set, including zero, against the existing integral root datum. It neither assumes nor proves that all candidates are realised by triples.

Hypotheses: All definitions and root-data comparisons are those of the preceding two nodes.

Construction or proof:

1. Prove equality of the root enumeration with the pinned Bourbaki root model.
2. For each finite candidate set, compute the profile vectors on [−B_T,B_T]. Sort or compare them by exact integer equality and verify there is no equal pair with unequal labels.
3. Evaluate this checker within the proof assistant against the finite input; the scratch Python check is independent evidence only. Counts of distinct profiles are respectively 7,28,34,274,245.

Direct inputs: `LieHighestWeightPartII:N3/candidate-certificate`, `LieHighestWeightPartII:N3/root-profile`.


Check: E6 and E7 are checked in their own root sets; no Levi-restriction shortcut.

Sources: [CH] Appendix, Lemma 10.9 and Tables 2–4, pp.35–37 — This is a new finite-certificate proof of the required exceptional separation, not a claim that the source states candidate-set injectivity.; [DG] §2–§3, pp.2–5 — Provides the weighted-diagram interpretation used to formulate the check.


### Exceptional adjoint separation

Target `LieHighestWeightPartII:N3/exceptional-separation` (theorem).

If L is simple exceptional and two adapted triples have equal adjoint graded multiplicities (equivalently equal W_i dimensions on L for every i), then the triples are Ad(G(K))-conjugate. Thus the adjoint module alone is a test family in every exceptional type, including E6 and E7.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form.

Construction or proof:

1. Move both neutral elements to the same dominant Cartan. Their labels lie in C_T by necessary conditions.
2. Identify their adjoint profiles with D_T. The finite certificate makes the labels equal, and a simple-root basis then makes the neutral elements equal.
3. Apply neutral-element conjugacy to finish.

Direct inputs: `LieHighestWeightPartII:N3/dominant-characteristic`, `LieHighestWeightPartII:N3/root-profile`, `LieHighestWeightPartII:N3/candidate-profile-injective`, `LieHighestWeightPartII:N0/neutral-conjugacy`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`, `LieHighestWeightPartII:N1/graded-comparison`.


Check: The result covers the zero triple and all five exceptional types.

Sources: [CH] Appendix, Lemma 10.9, p.35 — The adjoint test separates exceptional triples. The plan supplies direct E6/E7 arguments in place of the unsupported E8-to-Levi inference.


### Certified interpretation of the appendix tables

Target `LieHighestWeightPartII:N3/appendix-table-interface` (construction).

For each of the 91 row labels in CH v1 Tables 2–4 (E8:70, F4:16, G2:5 including zero), provide a checked characteristic and a root-vector triple certificate. Printed Bala–Carter names are opaque row keys here; the verified assertion is that the supplied representative has the stated characteristic and profile, not a theorem identifying that key with the semantic Bala–Carter classification. The exported datum is its finitely supported adjoint graded profile D_T(a). Its cumulative filtration dimension is F_i=Σ_{j≤i}D_T(a)_j. Published row values and external SLA data are untrusted inputs to a checker, not axioms, and the record does not assert a full Bala–Carter classification.

Hypotheses: K is an algebraically closed field of characteristic zero. Use precisely CH arXiv v1 table labels and Bourbaki root conventions.

Construction or proof:

1. Obtain diagram and root-vector witness candidates from the public de Graaf/SLA material. Convert F4 numbering before comparison (the list in SLA before its permutation is Bourbaki). Check the three bracket equations in a rational Chevalley model and transport through the existing split root model; zero uses the zero triple.
2. For each row recompute D_T(a) from roots. Compare the printed nonnegative entries after the graded/cumulative correction, filling negative entries by symmetry; prove vanishing beyond the bound.
3. Export cumulative sums and their finite differences. Separation uses the larger candidate certificate and does not rely on completeness or names of these 91 rows. E6/E7 use the same formula, without attributing nonexistent tables to CH.

Direct inputs: `LieHighestWeightPartII:N3/root-profile`, `LieHighestWeightPartII:N3/candidate-profile-injective`, `LieHighestWeightPartII:N0/zero-triple`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

Use: CH Tables 2–4: Make the appendix usable without the Fil/gr convention error.; Consumers of exceptional weight patterns: Read finite profiles and cumulative sums through an API instead of treating printed tables as formal facts.

API:

- `ExceptionalTableRow.profile` (projection): The row profile is D_T(a), with the native finite-support carrier.
- `ExceptionalTableRow.cumulative` (data): F_i=Σ_{j≤i}d_j, eventually zero/M on the two ends.
- `ExceptionalTableRow.difference` (relation): F_i−F_(i−1)=d_i as integers.
- `ExceptionalTableRow.adjoint` (compatibility): The checked triple witness identifies the row with the native eigenspace dimensions.

Tests:

- **table_zero**: The zero E8/F4/G2 rows have coefficient 248/52/14 at 0 and zero elsewhere.
- **principal_dimensions**: Principal profiles have zero multiplicities equal to rank and maximal degrees 58,22,10 for E8,F4,G2, with total dimensions 248,52,14.
- **filtration_header_rejected**: The F4 principal row begins 4,0,4 as graded counts; treating them as nested filtration dimensions must be rejected. Its cumulative F_0 is 28.
- **independent_data_counts**: As a numerical cross-check, SLA has nonzero counts 4,15,20,44,69; after adding zero its profiles are pairwise distinct for counts 5,16,21,45,70. These orbit counts are not substituted for candidate-set counts.

Check: The checker accepts every correctly converted row or produces an exact discrepancy; data ingestion never supplies the orbit-separation proof.

Sources: [CH] Tables 2–4, pp.35–37 — All printed rows are targets of the arithmetic verifier, with headers corrected to graded dimensions.; [DG] §3, pp.4–5 — A proposed characteristic can be certified by explicit degree ±2 root-vector witnesses.; [SLA] SLAfcts.nilporbs, exceptional branches — An independent source of candidate diagrams and root-vector triples; no database assertion is trusted without checking.


## N4: Semisimple filtration recognition

Assemble the classical and exceptional tests through fixed simple factors. Prove that simultaneous adjoint conjugacy, equality of all representation filtration dimensions and isomorphic sl2 restrictions are equivalent, including the zero algebra and zero triple. Record a finite representation test family and preserve factor labels.


### Conjugacy recognition from all representation filtrations

Target `LieHighestWeightPartII:N4/filtration-recognition` (theorem).

For two adapted triples t,t′ in semisimple L, the following are equivalent: (1) simultaneous Ad(G(K))-conjugacy; (2) for every finite-dimensional L-module M and i∈Z, dim W_i^t(M)=dim W_i^t′(M); (3) for every such M their restricted sl2 modules are isomorphic. It suffices in (2) to test the pullbacks of the classical standard modules, one chosen Lie half-spin per type-D factor, and the adjoint module of each exceptional factor.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). G is a connected semisimple algebraic K-group with a specified identification Lie(G)≅L; its action is Ad(G(K)), equivalently that of the adjoint form.

Construction or proof:

1. Use complete reducibility of the adjoint module to decompose L as a finite direct sum of simple ideals; the connected adjoint group is the product of the corresponding adjoint groups. This is a fixed-factor decomposition, so no outer permutation of isomorphic factors is allowed.
2. Pull back each finite module of one factor along its projection, making the other ideals act trivially. The global dimension hypothesis then yields that factor’s classical or exceptional recognition hypothesis.
3. Take the product of the factor conjugators and lift it to G(K) through its central isogeny to the adjoint form. Conversely inner invariance identifies restrictions; graded comparison identifies (2) and (3). Treat the empty product L=0 by the zero triple.

Direct inputs: `LieHighestWeightPartII:N2/classical-recognition`, `LieHighestWeightPartII:N3/exceptional-separation`, `LieHighestWeightPartII:N0/triple-integration`, `LieHighestWeightPartII:N1/graded-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.


Check: A half-spin test is legal even for adjoint G; the quantifier is on L-modules. Factor-selective modules prevent two isomorphic simple factors from being silently permuted.

Sources: [CH] Lemma 2.4, pp.6–7; Appendix Lemma 10.9, p.35 — The simple result is assembled over simple factors, with all finite Lie modules as tests.


## N5: Highest weights and geometric weight patterns

Prove the root-coset and highest-weight half-integrality tests. Define finite geometric modulus patterns for q>1 and the positive part of a complex torus element using its character lattice. Supply algebraic characters with each allowed dominant leading weight by a regular semi-invariant argument, then prove that algebraic characters separate Weyl orbits and equal representation-indexed patterns force conjugacy of positive real parts. Phases and the choice of isogeny lattice are explicit.


### Half-integrality on a root-lattice coset

Target `LieHighestWeightPartII:N5/root-coset-half-integrality` (lemma).

Let X be an abelian group, Q⊆X the subgroup generated by a finite set of simple roots, ν:X→R an additive functional, and λ∈X. If ν(Q)⊆½Z, then ν(μ)∈½Z iff ν(λ)∈½Z for every μ∈λ+Q. More generally the same assertion holds with any additive subgroup of R in place of ½Z. Membership in ½Z means 2ν(x) is an integer.

Hypotheses: X is the actual chosen weight lattice, or X*(T) when applying the result to algebraic G-representations; do not identify them across isogenies.

Construction or proof:

1. Express μ−λ as an integer combination of simple roots. Additive subgroup closure gives ν(μ)−ν(λ)∈½Z.
2. Use subgroup closure under addition and subtraction for the two implications.

Direct inputs: additive subgroup closure and elementary abelian-group algebra.


Check: For A1 with α=2ω and ν(α)=1/2, ν(ω)=1/4, so the standard highest-weight module does not have half-integral values; the adjoint highest weight α does.

Sources: [CH] §6.12, Lemma 6.30, p.24 — Every module weight differs from its highest weight by the root lattice; the algebraic coset argument is isolated here.


### The highest-weight half-integrality test

Target `LieHighestWeightPartII:N5/highest-weight-test` (theorem).

For L semisimple, fix a root base and real linear functional ν on its real weight space. Assume ν(α_i)∈½Z for every simple root. For any dominant integral highest weight λ and its finite irreducible L(λ), every weight μ of L(λ) has ν(μ)∈½Z iff ν(λ)∈½Z. The statement also applies to algebraic G-representations using their genuine character lattice; no dominance of ν is required.

Hypotheses: K is an algebraically closed field of characteristic zero. L is a finite-dimensional semisimple K-Lie algebra (equivalently, in this setting, its Killing form is nondegenerate). ν is a real functional on the abstract weight lattice tensored with R, not an ordering of elements of K.

Construction or proof:

1. Highest-weight theory places every occurring μ in λ+Q and guarantees that λ itself occurs.
2. Apply the coset lemma in one direction; use occurrence of λ in the other.
3. For an irreducible algebraic G-module in characteristic zero, differentiation stays irreducible: a Lie-stable subspace is a sum of Cartan weight spaces and hence T-stable, while the root subgroups act by finite exponentials of their derivatives and preserve it. Torus and root-subgroup generation makes it G-stable. Distinct algebraic torus characters have distinct derivatives in characteristic zero. Apply the Lie result with the module’s actual torus weights.

Direct inputs: `LieHighestWeightPartII:N5/root-coset-half-integrality`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-2-weights-of-a-module-and-their-integrality`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.


Check: The root-integrality hypothesis is necessary; do not strengthen it silently to full weight-lattice half-integrality.

Sources: [CH] §6.12, Lemma 6.30, p.24 — The highest weight alone tests all weights, once simple-root pairings are half-integral.


### Geometric weight patterns

Target `LieHighestWeightPartII:N5/weight-pattern` (definition).

Fix q>1 real. For a finite-dimensional complex space V and a semisimple invertible operator A such that every eigenvalue has modulus q^(i/2) for some i∈Z, define n_A:Z→N by the algebraic multiplicity of eigenvalues of modulus q^(i/2). It has finite support and total dim V. For a semisimple s∈G(C) geometric in every finite algebraic representation τ, the representation-indexed weight pattern is (τ,i)↦n_(τ(s))(i). Isomorphic representations have the same function.

Hypotheses: The modulus uses the usual complex absolute value; q is fixed and strictly greater than 1. G is a connected complex semisimple algebraic group; τ is finite-dimensional and algebraic.

Construction or proof:

1. The map i↦q^(i/2) is injective. Group eigenvalues by their absolute values; geometricity ensures that every eigenvalue is counted once.
2. For semisimple A its algebraic eigenspace dimensions equal its eigenvalue multiplicities. Use this comparison rather than defining a new generalized-eigenspace theory.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

Use: CH Proposition 10.2: Compare the positive real parts of two parameters.; CH §10.1, subsequent parameter applications: Express the representationwise geometric weight data without adding local Galois or automorphic theory here.

API:

- `WeightPattern.coeff` (projection): The coefficient is the sum of multiplicities of all eigenvalues with the specified modulus.
- `WeightPattern.total` (relation): Σ_i n_A(i)=dim V.
- `WeightPattern.directSum` (compatibility): Patterns add under direct sums, and the unit has coefficient one at 0.
- `WeightPattern.tensor` (compatibility): Patterns convolve under tensor products: n_(A⊗B)(i)=Σ_(j+k=i)n_A(j)n_B(k).
- `WeightPattern.dual` (compatibility): The contragredient pattern reflects indices: n_(A∨)(i)=n_A(−i).
- `WeightPattern.conjugate` (functoriality): Similarity of A, or group conjugacy of s, preserves its pattern; these identifications respect representation isomorphisms.

Tests:

- **pattern_unit**: Every operator on the zero space gives zero; the one-dimensional trivial representation gives the delta function at 0.
- **pattern_sl2_standard**: diag(q^(1/2),q^(−1/2)) in SL2 gives coefficients one at 1 and −1 in the standard representation.
- **pattern_phase_loss**: diag(i,−i) and identity in SL2 have equal patterns in every algebraic representation (all weights are 0), but are not conjugate as semisimple elements.
- **pattern_tensor**: The tensor square of the standard SL2 example has multiplicities 1,2,1 at weights 2,0,−2.

Check: A pattern remembers absolute values and multiplicities, not the full complex spectrum.

Sources: [CH] §10.1, p.32, definition of weight patterns and Proposition 10.2 — The pattern records modulus weights in each representation, discarding unitary phases.


### Positive real part in a complex torus

Target `LieHighestWeightPartII:N5/positive-real-part` (construction).

For a complex algebraic torus T with character lattice X, let T_pos=Hom(X,R_(>0))⊆T(C). For s∈T(C), define r(s) by χ(r(s))=|χ(s)| for every χ∈X, and u(s)=s/r(s), whose character values have modulus one. For a semisimple group element choose a maximal torus; r(s) is well-defined up to group conjugacy, equivalently Weyl orbit after a fixed torus choice.

Hypotheses: T is a complex algebraic torus; G is connected complex semisimple for the group-conjugacy assertion.

Construction or proof:

1. The character description of a split complex torus identifies its points with Hom(X,C×). Absolute value is multiplicative, so it defines the positive part without a logarithm or a lattice-basis choice.
2. Weyl automorphisms commute with absolute value on characters. Maximal-torus conjugacy and semisimple conjugacy in a fixed torus therefore make its Weyl orbit independent of choices.
3. In an algebraic representation, the eigenvalues of τ(r(s)) are the moduli of the T-weight values at s, counted with the same weight multiplicities.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

Use: CH Proposition 10.2: Specify exactly what equal weight patterns determine.; N5 character separation: Convert weight patterns into traces of a positive torus point.

API:

- `PositivePart.character` (characterisation): χ(r(s))=|χ(s)| for every character χ, which uniquely determines r(s).
- `PositivePart.mul` (functoriality): r(st)=r(s)r(t), with the identity and inverses preserved inside a fixed torus.
- `PositivePart.weyl` (functoriality): r(w·s)=w·r(s) for w in the Weyl group.
- `PositivePart.eigenvalues` (compatibility): The multiset of eigenvalues of τ(r(s)) is the multiset of eigenvalue moduli of τ(s).

Tests:

- **positive_compact**: If every character value has modulus 1, r(s)=1; compact phases are discarded.
- **positive_sl2**: For diag(z,z^−1), r(s)=diag(|z|,|z|^−1).
- **positive_weyl**: The SL2 Weyl involution replaces |z| with its inverse; both represent the same group-conjugacy class.
- **positive_not_full_parameter**: For z=i the positive part is identity although diag(i,−i) is not identity.

Check: The construction uses X*(T) of the actual group; it is compatible with central isogenies on their given character lattices.

Sources: [CH] §10.1, Proposition 10.2, p.32 — The real part strips off the compact torus factor and is only defined up to Weyl conjugacy.


### Algebraic characters with a prescribed leading weight

Target `LieHighestWeightPartII:N5/algebraic-highest-weight-existence` (theorem).

Let G be connected complex semisimple, T a maximal torus, and choose positive roots. For every dominant λ in the actual lattice X*(T), there exists a finite algebraic G-module V_λ whose formal character is the orbit sum of λ plus an integer combination of orbit sums of strictly lower dominant weights. The λ-weight has multiplicity one, all other weights lie in λ minus the positive-root monoid, and the character is W-invariant. This existence statement is the group-to-character bridge; it does not assume that every finite Lie module descends to G.

Hypotheses: Use opposite Borels B−=TU− and B+=TU+ and the chosen character lattice, without replacing it by the simply connected weight lattice.

Construction or proof:

1. In the native coordinate Hopf algebra O(G), consider regular functions satisfying f(gb)=λ(b)^(-1)f(g) for b∈B−. Define f_λ on the dense open cell U+TU− by f_λ(u+tu−)=λ(t)^(-1). This is an auxiliary subspace of O(G), not a new induced-representation carrier.
2. Extend f_λ over each simple-reflection translate of the open cell. The SL2 root-subgroup identity makes the extra coordinate occur with exponent ⟨λ,α∨⟩≥0. Bruhat dimensions show that the omitted cells have codimension at least two. Extension across that remainder can be proved on translates of U+TU−: each chart is affine space times a torus, so its coordinate algebra is a Laurent polynomial UFD. A reduced denominator would have an irreducible divisor meeting the already covered open set, a contradiction. Thus the rational function is regular on every chart and glues globally; this argument does not assume an unprovided general Hartogs theorem.
3. Use local finiteness of the coordinate comodule to take the finite-dimensional G-span V_λ of f_λ. Restriction to the open cell is injective. Its right-B−-equivariance identifies that restriction with polynomial functions on U+ times λ(t)^(-1); under left T-translation the coordinate weights subtract positive roots. Hence all weights are ≤λ and its λ-weight space consists of constants, of dimension one. The normalizer of T makes the character W-invariant, yielding the claimed orbit-sum triangularity.
4. Every finite algebraic module has a finite composition series, and traces and formal characters add in short exact sequences. Consequently the triangular characters of V_λ lie in the span of simple algebraic characters. No assertion of Lie-module descent, Borel–Weil cohomology, or a positive-characteristic Weyl formula is needed.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`.


Check: For SL2 the construction permits λ=ω and gives leading weights ±ω; for PGL2 λ=ω is not in X*(T), whereas λ=2ω is legal. The boundary exponent is zero for λ=0 and negative for an antidominant simple-root pairing, detecting the dominance condition.

Sources: [JAN] Part II, Proposition II.2.2 p.176, Proposition II.2.6 pp.178–179 and Corollary II.2.7 p.179 — The existence proof extends a regular semi-invariant by simple-root SL2 identities. Only the finite coordinate-comodule span and its leading weight are needed here.; [MIL] §20.3–20.4 pp.102–103 and §20.27–20.28 p.107 — The algebraic highest-weight and character-basis statements use the true character lattice of G; the proof input is expanded from Jantzen.


### Characters separate Weyl orbits in a torus

Target `LieHighestWeightPartII:N5/character-separation` (theorem).

Let G be connected complex semisimple, T a maximal torus, W its Weyl group, and x,y∈T(C). If tr τ(x)=tr τ(y) for every irreducible finite algebraic G-representation τ, then x and y are W-conjugate. The highest weights range over the dominant weights in X*(T), so the statement holds for any isogeny form.

Hypotheses: Use algebraic representations, not arbitrary abstract representations of G(C).

Construction or proof:

1. The preceding existence theorem gives triangular algebraic characters for every dominant weight in X*(T). Dominance induction expresses every W-orbit sum as a linear combination of these characters. A finite composition series expresses each of their characters as a sum of simple algebraic characters, so the simple algebraic characters span C[X*(T)]^W.
2. Invariant Laurent polynomials separate finite W-orbits: if the two orbits are disjoint, choose a Laurent polynomial taking 0 on one finite orbit and 1 on the other by interpolation of the finitely many distinct torus points. Average its W-translates and divide by |W|.
3. Equal irreducible characters therefore force equal invariant functions and exclude disjoint orbits. This finite-group argument requires no general GIT quotient theorem.

Direct inputs: `LieHighestWeightPartII:N5/algebraic-highest-weight-existence`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`.


Check: For PGL2 only even SL2 highest weights are legal; nevertheless their characters separate PGL2 torus Weyl orbits.

Sources: [MIL] §20.27–20.28, p.107 — Triangular algebraic characters span the invariant character algebra.; [CH] §10.1, Proposition 10.2, p.32 — The proof invokes determination of the positive parameter by all representation characters; the invariant-character argument makes this input explicit.


### Recognition of the positive real part

Target `LieHighestWeightPartII:N5/real-part-recognition` (theorem).

Fix q>1. If semisimple s,s′∈G(C) are q-geometric in every finite algebraic representation and have identical representation-indexed weight patterns, then their positive real parts r(s),r(s′) are conjugate in G(C), equivalently W-conjugate after moving them into a fixed T. It suffices to compare patterns on irreducibles. No conjugacy of s and s′ themselves is asserted.

Hypotheses: G is connected complex semisimple; positive parts and patterns use the preceding definitions.

Construction or proof:

1. For each irreducible τ, compute tr τ(r(s))=Σ_i n_(τ(s))(i)·q^(i/2), using the positive-part eigenvalue comparison. The equal-pattern hypothesis makes these traces equal for s and s′.
2. Apply character separation in the fixed torus. Direct-sum additivity explains why irreducibles suffice.

Direct inputs: `LieHighestWeightPartII:N5/weight-pattern`, `LieHighestWeightPartII:N5/positive-real-part`, `LieHighestWeightPartII:N5/character-separation`.


Check: The compact-phase SL2 example in the pattern tests is allowed and shows why the conclusion concerns only positive real parts.

Sources: [CH] §10.1, Proposition 10.2, p.32 — All geometric weight patterns determine the real part up to Weyl action.


## Exceptional computation and acceptance

The finite check is deliberately stronger than the assertion about realised characteristics. Enumerate all 3^r vectors a with entries 0,1,2. Keep only opposition-fixed a, compute the exact root profile, and test d_m≥d_(m+2) for every m≥0 within the explicit finite support bound. Then compare every remaining pair of profile vectors. Necessary conditions place every genuine characteristic in this finite set; equality of profiles therefore forces equality of characteristics if this checker succeeds. Surplus candidates cause no problem. There is no inference that a candidate is realised, and no dependence on completeness of an external nilpotent-orbit database.

| Type | Roots | Label vectors | Opposition-fixed | Candidates | Distinct candidate profiles |
| --- | ---: | ---: | ---: | ---: | ---: |
| G2 | 12 | 9 | 9 | 7 | 7 |
| F4 | 48 | 81 | 81 | 28 | 28 |
| E6 | 72 | 729 | 81 | 34 | 34 |
| E7 | 126 | 2187 | 2187 | 274 | 274 |
| E8 | 240 | 6561 | 6561 | 245 | 245 |

These values were independently recomputed using exact integer arithmetic during design. The proof-assistant certificate and the comparison of the enumerated roots to the existing finite integral root datum are implementation targets, not claims about this arithmetic experiment. Omitting opposition in E6 leaves 212 candidates and only 123 distinct profiles; the symmetry condition is essential for this certificate. Independently, the public SLA weighted diagrams, with zero added, give 5,16,21,45,70 profiles in G2,F4,E6,E7,E8, with no collisions. Those are database orbit counts, not the candidate counts above. Independent review also matched all 91 numeric profiles printed in CH Tables 2–4 against profiles recomputed from the pinned SLA diagrams (5 G2, 16 F4, 70 E8, including zero). This comparison checks the numeric profiles; root-vector triple witnesses remain construction targets, and the printed names remain opaque row keys.

For reproducibility the arithmetic algorithm starts with the simple unit vectors, closes under the reflections that change only coordinate j by subtracting Σ_i c_i Aij, and uses the root sets of sizes in the table. In the formal implementation termination is supplied by the existing finite root datum and equality to this closure is proved; a terminating scratch search by itself supplies neither fact. Profile entries are root dot-product counts plus rank at degree zero. Check symmetry, the total dimensions 14,52,78,133,248, and principal maximal degrees 10,22,22,34,58. These checks detect numbering and Cartan-term errors before testing injectivity.

## Supplier contracts

The following are ordinary existing-roadmap inputs. A request records the exact interface needed, rather than another implementation of its objects. These contracts are open as implementation interfaces; all six layers have a complete target-level plan.

- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`: The invariant form on each standard sl2 irreducible is unique up to scalar and symmetric in even highest weight, alternating in odd highest weight. The pinned decomposition/classification is reused; only this invariant-form application is needed.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition`: Cartan/root-space decomposition for a finite semisimple algebra, simple-root sl2 subalgebras, one-dimensional root spaces, generalized-eigenspace bracket rule and placement of semisimple elements in a Cartan. Supply the ordinary root-vector bases used in the finite appendix checks.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-2-weights-of-a-module-and-their-integrality`: Honest Cartan weight spaces, integral weights and tensor/dual weight laws for finite modules. No new weight-space or eigenspace carrier is built here.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`: Weights of L(λ) lie in λ plus the root lattice and λ occurs. Import ordinary PBW/Verma theory rather than planning it here.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`: Finite-dimensional irreducibles for every dominant integral Lie weight, including D_r half-spin; this is Lie-module classification, not a claim that these modules all descend to an algebraic group. The narrow algebraic-character existence bridge is proved in N5.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`: Weyl complete reducibility. Applied to the adjoint module this decomposes a semisimple algebra as a finite direct sum of simple ideals, with factor projections used in N4.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`: Formal Lie characters, leading dominant orbit sums and highest-weight weight multiplicities; this contract does not assert algebraic-group descent. Compute the minuscule D_r half-spin weights over K using the actual Lie weight lattice.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`: The normalized Chevalley system and the Serre-presentation isomorphism Matrix.ToLieAlgebra(K,Aᵀ)≅L for simple L, where Aij=αi(hj) is the root-row/coroot-column Cartan matrix, assembled componentwise for semisimple L. The transpose is required because the Serre constructor uses [Hi,Ej]=CMij Ej. This supplies the Lie-algebra isomorphism from a classical root type to its standard model and the root-generator bracket conventions for finite appendix witnesses; a root-system isomorphism alone is not a Lie-algebra isomorphism.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`: The native reductive Lie decomposition into center and semisimple derived algebra, used after identifying a semisimple centralizer from its roots. Do not assert complete reducibility for arbitrary modules over an abelian center.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`: Finite algebraic representation/comodule category with tensor and dual operations, the coordinate comodule and its local finiteness (every element is contained in a finite-dimensional subcomodule), and a faithful closed immersion of an affine algebraic group into GL(V).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`: Lie(G), differentiation of rational representations, and the adjoint action identified with the native Lie bracket. Compatibility with morphisms, centralizers and base change.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`: Closed centralizers, identity components and algebraic group quotients. For the fixed-h orbit argument use the ordinary orbit tangent map and characteristic-zero separability; the open-orbit calculation is proved in N0/neutral-conjugacy, not assumed as a nilpotent-orbit classification.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`: Tori and their genuine character/cocharacter lattices, T(C)=Hom(X*(T),C×), semisimple/unipotent Jordan decomposition for group elements.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`: Connected semisimple groups, adjoint and simply connected forms, central isogenies and their surjectivity on algebraically closed K-points; decomposition of the adjoint form along simple factors.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`: Maximal torus conjugacy, Weyl action and conjugacy of semisimple elements in a fixed torus, root subgroups and Bruhat generation. N5 also uses the open-cell product U+×T×U−, root-subgroup SL2 coordinate identities and the Bruhat-cell dimension formula (the open cell and its simple-reflection translates miss codimension at least two). These are ordinary Bruhat structure inputs; the regular semi-invariant extension and its character application are proved in N5. These are ordinary group structure inputs; the triple-specific integration is built in N0.
- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`: The dominant chamber as a fundamental domain, uniqueness of a dominant representative and longest-element chamber action.
- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`: Classification of irreducible reduced root systems and the A/B/C/D or exceptional case split. Lie-algebra realization is imported separately from LieHighestWeight Layer 7.
- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`: Finite Bourbaki integral root models, simple-root coefficient vectors, generation by simple reflections and the explicit D_r roots, fundamental weights and even-sign Weyl action. The half-spin weight formula is proved using these coordinates in N2 and compared with the existing complex spin owner. Compare orientation with the pinned DynkinType.cartanMatrix.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`: Over C, the existing exterior/Clifford half-spin Lie modules, their exact Cartan identification, parity-labelled half-sign weights and comparison with fundamental highest weights. For arbitrary K the required Lie half-spin is already imported from LieHighestWeight Layers 4/6; no field extension of the complex spin-group construction is requested.

## Pinned library declarations

- [`mathlib:IsSl2Triple`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Sl2.lean): The three sl2 bracket relations together with h≠0; excludes the zero triple.
- [`mathlib:LieModule.toEnd`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/OfAssociative.lean): The native Lie homomorphism taking x to its action on a Lie module.
- [`mathlib:LieAlgebra.ad`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/OfAssociative.lean): The adjoint action as a Lie homomorphism to module endomorphisms.
- [`mathlib:LieAlgebra.IsKilling`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Killing.lean): Nondegeneracy of the Killing form, used as the finite-dimensional characteristic-zero semisimplicity hypothesis.
- [`mathlib:CategoryTheory.FilteredObject`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtration/Basic.lean): An underlying object with a filtration by monomorphisms, with its existing category and commuting morphisms.
- [`tauceti:TauCeti.iSup_eigenspace_toEnd_intCast_eq_top`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Sl2/Spectrum.lean): For a nonzero sl2 triple, finite modules over an algebraically closed characteristic-zero field are sums of integer eigenspaces.
- [`tauceti:TauCeti.exists_int_of_hasEigenvalue`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Sl2/Spectrum.lean): Eigenvalues of a triple neutral element in a finite module are integers; the actual declaration has weaker general ring hypotheses.
- [`tauceti:TauCeti.finrank_eigenspace_toEnd_neg`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Sl2/WeightMultiplicity.lean): Finite modules over characteristic-zero fields have equal multiplicities at opposite weights.
- [`tauceti:TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Sl2/Decomposition.lean): Decomposition of finite sl2 modules into standard highest-weight modules, over an algebraically closed characteristic-zero field.
- [`tauceti:TauCeti.lieHomOfSl2Basis`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Sl2/Basic.lean): Constructs a Lie homomorphism from an sl2 basis and images satisfying the bracket relations, including zero images.
- [`tauceti:TauCeti.DynkinType.cartanMatrix`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/DynkinType.lean): Bourbaki-ordered integral Cartan matrices, with Aij=〈αi,αj∨〉.
- [`tauceti:TauCeti.oppositionPerm`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/Opposition.lean): The permutation of a chosen root base induced by −w0, with root and coroot compatibility.
- [`mathlib:LieModule.isNilpotent_iff_forall`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Engel.lean): Engel’s theorem: for a Noetherian Lie algebra, its module is nilpotent iff every action endomorphism is nilpotent. Applied to the centralizer acting on the finite adjoint module, it yields a faithful nilpotent and hence solvable algebra.
- [`mathlib:LieDerivation.IsKilling.exists_eq_ad`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Derivation/Killing.lean): Every derivation of a finite-dimensional Killing Lie algebra over a field is inner; no algebraic closedness hypothesis is required.
- [`mathlib:Module.End.exists_isNilpotent_isSemisimple`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/JordanChevalley.lean): Over a perfect field, a finite-dimensional endomorphism has commuting nilpotent and semisimple parts in its generated algebra.
- [`mathlib:LieModule.exists_nontrivial_weightSpace_of_isSolvable`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/LieTheorem.lean): Lie’s theorem with solvability and the native IsTriangularizable hypothesis; over the present algebraically closed field finite endomorphisms split, supplying this hypothesis. Apply recursively to quotients to triangularize.
- [`mathlib:LieDerivation.exp`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Derivation/Basic.lean): A nilpotent derivation exponentiates to a native Lie equivalence in characteristic zero, given the rational module structure; finite sums rather than analytic exponentials.

## Sources and corrected conventions

All source statements above are in the roadmap author’s own words. Page numbers refer to the identified source versions, not to journal pagination of a revision that was not collated.

- **[CH]** Dan Ciubotaru; Michael Harris, [On the generalized Ramanujan and Arthur conjectures over function fields](https://arxiv.org/pdf/2311.15300v1). arXiv:2311.15300v1, 26 November 2023; printed page numbering. Annals 204 (2026), 545–601 is a distinct, uncollated revision. Read 2026-10-18. SHA-256 `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103`. Relevant locators: §§2.1–2.2, pp.6–7, especially Definition 2.2 and Lemma 2.4; §6.12, p.24, Lemma 6.30; §10.1, p.32, Proposition 10.2; Appendix, pp.35–37, Lemma 10.9 and Tables 2–4.
- **[BAL]** Ana Bălibanu, [Part I: Geometry of semisimple Lie algebras](https://people.math.harvard.edu/~ana/part1.pdf). Undated author notes, author-hosted copy; printed page numbering. Read 2026-10-18. SHA-256 `e6c3e0d0a7ef0df8a162940e302dfbea5d10cf4d2c2872728033346d6501ed38`. Relevant locators: §5, pp.13–17, Theorem 5.1, Corollary 5.2, Proposition 5.4, Lemma 5.7; algebraic arguments adapted to any algebraically closed field of characteristic zero.
- **[SOM]** Eric Sommers, [Nilpotent orbits and Weyl group representations](https://www.math.utah.edu/~ptrapa/sommers-preliminary-notes.pdf). Preliminary notes, 17 July 2009. Read 2026-10-18. SHA-256 `4efd401e9f7ed75cd1ec83d6a7f51e5be744ed15c08e72a8651462649fa54dc8`. Relevant locators: §§2.1–2.4, pp.11–13, Theorem 2.4.1; §3.1, pp.15–16, characteristic diagrams, Dynkin–Kostant–Malcev and labels 0,1,2.
- **[DG]** Willem A. de Graaf, [Computing with nilpotent orbits in simple Lie algebras of exceptional type](https://arxiv.org/pdf/math/0702193v2). arXiv:math/0702193v2, 14 December 2007; published LMS Journal of Computation and Mathematics 11 (2008), 280–297. Read 2026-10-18. SHA-256 `8f78bc359826032475efa37b4c53958b25bfe136286774c8dd55bf1cdcd059e6`. Relevant locators: §2, pp.2–3, weighted Dynkin diagrams; §3, pp.4–5, Lemmas 2–3 and fixed-characteristic orbit argument.
- **[SLA]** Willem A. de Graaf and SLA contributors, [SLA nilpotent-orbit data, nilporb.gi](https://raw.githubusercontent.com/gap-packages/sla/30b585c78be885925776f01522fdce036d45e661/gap/nilporb.gi). GAP SLA commit 30b585c78be885925776f01522fdce036d45e661; an independent numerical cross-check, not a proof oracle. Read 2026-10-18. SHA-256 `d22e9f2d770cf3b02628474b893cdcbcf8564ef0c468806b298d4f93b16d0f50`. Relevant locators: SLAfcts.nilporbs: weighted diagrams for G2, F4, E6, E7, E8; F4 list before its GAP-numbering permutation.
- **[MIL]** J. S. Milne, [Reductive Groups](https://www.jmilne.org/math/CourseNotes/RG.pdf). Author notes, version 2.00, 10 March 2018; not the Algebraic Groups book. Read 2026-10-18. SHA-256 `f5d282908082622f39627e6850395fccebd4f0ed9c47eba3209deda286235291`. Relevant locators: §20.3–20.6, pp.102–103; §20.16–20.18, pp.104–105; §20.27–20.31, pp.107–108; §17.59, p.80, read while following a cross-reference; its Picard-group claim is corrected below.
- **[JAN]** Jens Carsten Jantzen, [Representations of Algebraic Groups](https://doi.org/10.1090/surv/107). Second edition, AMS Mathematical Surveys and Monographs 107 (2003); maintainer-cleared reference copy, read in place. Read 2026-10-18. SHA-256 `5772b172cd315a4710220880e2dc9fb83fe2d512e5fb760c2f0f24a297222839`. Relevant locators: Part II §§2.1–2.7, pp.175–179: regular semi-invariants, highest weights, and the rank-one extension proof in Proposition II.2.6.

The Collingwood–McGovern book cited by CH is not a source read for this plan. The classical proof is developed from standard sl2 modules and invariant forms; the freely readable notes and de Graaf supply the remaining orbit arguments. Jantzen’s maintainer-cleared second edition was read in place for the algebraic-character bridge; no file or passage from that book is reproduced. No inaccessible source is presented as verified.

- **LieHighestWeightPartII/E1** (arXiv:2311.15300v1, Definition 2.2 p.6 versus Appendix p.35 and Tables 2–4 pp.35–37): Interpret the entries and the finite maximal support as graded multiplicities. Keep the recognition hypothesis in cumulative dimensions and relate it by finite differences. For the F4 principal element the nonnegative sequence starts 4,0,4, which cannot be nested dimensions; an increasing exhaustive filtration is nonzero in all sufficiently large degrees. Already recorded and independently confirmed as PAPER-CIUBOTARU-HARRIS-26/E4; correction in the published revision not established.
- **LieHighestWeightPartII/E2** (arXiv:2311.15300v1, Appendix proof of Lemma 10.9, p.35): Check the E6 and E7 root systems directly. The candidate-profile certificate supplies this without relying on orbit labels. A grading on the Levi adjoint summand does not specify the grading of the other E8 summands. Conjugacy in E8 also need not be conjugacy in the Levi. Already recorded and independently confirmed as PAPER-CIUBOTARU-HARRIS-26/E6; no assertion about the later Annals revision.
- **LieHighestWeightPartII/E3** (arXiv:2311.15300v1, Appendix so(2n) paragraph, p.35): For ascending a1≤…≤ar use ε3−ε2,…,εr−ε_(r−1) after the two fork roots; otherwise reverse the coordinate ordering. For (1,1,3,3), pairing ε2−ε3 gives −2, contradicting dominance in the printed chamber. The half-spin maxima remain 4 and 3. Already recorded and independently confirmed as PAPER-CIUBOTARU-HARRIS-26/E17; no assertion about the later Annals revision.
- **LieHighestWeightPartII/E4** (Author-hosted part1.pdf, §5, proof of Theorem 5.1, p.15; bytes identified in sourceVersions): Only operators from the nilpotent centralizer L^e are strictly triangular; ad h is upper triangular. This gives the required trace zero for ad h·ad x, x∈L^e. In a nonzero triple ad h has eigenvalue 2 on e, so cannot be strictly triangular. The corrected trace argument proves the intended step. No correction found in the checked author-hosted copy; not an exhaustive novelty claim.
- **LieHighestWeightPartII/E5** (Reductive Groups v2.00 (10 March 2018), §20.29–20.30, p.108): Restrict that simple-module formula to characteristic zero; in positive characteristic the displayed expression is a Weyl-module character, not generally a simple-module character. N5 only uses characteristic zero and triangular characters. For SL2 in characteristic p>0, the simple module of highest weight pω is the two-dimensional Frobenius twist of the standard module. The displayed Weyl expression instead has dimension p+1. No corresponding entry found in the author’s course-note errata on 2026-10-18; no claim of novelty or of the wording of another edition.
- **LieHighestWeightPartII/E6** (Reductive Groups v2.00 (10 March 2018), §17.59, p.80): Keep the assertion for SL_n. For PGL2 over C the Picard group is nontrivial; none of the roadmap uses a factoriality claim for O(PGL_n). The extension proof works on translates of the open-cell Laurent polynomial charts. The source’s own §20.29 says that a semisimple group has trivial Picard group exactly when it is simply connected, while PGL2 is not simply connected (§17.60). Thus the asserted universal PGL_n vanishing is already incompatible with those statements. No corresponding entry found in the checked author errata; no exhaustive novelty claim.

## Suggested file boundary and completion checks

The companion suggested file contains the real-bodied zero adapter, eigenfiltration and native eigenspace multiplicity, together with Jacobson–Morozov and the filtration/half-integrality milestones that can already be stated on pinned carriers. The algebraic-group orbit interfaces, finite exceptional certificate data, half-spin comparisons and algebraic representation-indexed pattern constructions remain full README targets. Introducing placeholder types for those constructions would hide the actual supplier contracts. The suggested file is a compact signature file, not a second development or an exhaustive list of API declarations.

Acceptance requires every N0–N5 target stated here, every definition/construction API and test, the root-data comparison and finite injectivity proofs, all table-row checks, the SO/Spin distinction and the exact factor-selective semisimple argument. Checking the suggested signatures is a carrier/interface check and does not establish these mathematical targets.
