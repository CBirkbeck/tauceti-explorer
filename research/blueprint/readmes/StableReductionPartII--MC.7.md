# MC.7 — Level Picard parameters and consumer interfaces

This layer makes relative Picard parameters usable without losing the distinction between a relative class and an actual line bundle. It also composes the existing curve-moduli exports into the six contracts required by the routed papers. It builds on the accepted [parent plan](../packets/StableReductionPartII.json), especially `StableReductionPartII:MC.7/level-picard-parameter` and `StableReductionPartII:MC.7/picard-triples-comparison`; neither is defined again here.

The new targets have prefix `StableReductionPartII:MC.7/`. The packet is a complete target-level planning pass and the layer is **planned**, with four explicit supplier/interface gaps. This is not a claim of implementation or proof closure. All node implementation statuses are unchecked. The accompanying [suggested file](../suggested/StableReductionPartII--MC.7.lean) checks only the native fragments identified below.

The [independent review](../reviews/REV-StableReductionPartII--MC.7.md) accepted this plan after corrections on 18 October 2026. Its node verdicts and remaining obligations are recorded in the packet and review report.

## Conventions and boundaries

Fix integers g≥2, N≥3 and d∈Z. The level base is B=Spec Z[1/N,ζ_N], with a chosen primitive Nth root and exact standard symplectic pairing. Write M=M_g[N], f:C→M for the existing fine scheme and universal smooth projective geometrically connected curve, J=Pic⁰_{C/M}, and P^d=Picᵈ_{C/M}. The finite-level inertia-killing theorem and the geometric connectedness theorem are separate MC.4 imports. A similitude frame belongs to the component given by its multiplier, as made explicit in the Yuan export.

Unless a consumer explicitly changes the base letter, T denotes an arbitrary scheme over M. In P^d(T), the morphisms are over M; this is not the set of all B-morphisms T→P^d. C_T denotes the actual pullback family. The big fppf site Sch/T is used throughout. Pic(T) means isomorphism classes of invertible O_T-modules with tensor product; Lines(T) means their groupoid, with only isomorphisms as arrows. Equalities between line-bundle classes do not choose an isomorphism of actual bundles. Fibre degree d is required on every geometric fibre, even when T is disconnected.

The following three objects have different carriers and actions:

| Object | Carrier | Symmetry or ambiguity |
| --- | --- | --- |
| P^d over M | Represented relative degree-d fppf sheaf | J-torsor, without a selected origin when d≠0 |
| LiftClasses_T(p) for a fixed p∈P^d(T) | Fibre of Pic(C_T)→Pic_{C_T/T}(T) | Empty if the obstruction is nonzero; a Pic(T)-torsor if it vanishes |
| Lift_T(p) | Groupoid of actual bundles representing p | G_m automorphism sheaf; after choosing a lift it is equivalent to Lines(T) |

First-order variation of p is another question. Over A=k[ε]/(ε²), Pic(Spec A)=0, but the reduction fibre of P^d_C(A)→P^d_C(k) has dimension g. It records variation of the relative class, not base-line-bundle ambiguity in lifting one fixed class.

The unpointed full-level discussion uses g≥2. The pointed consumer exports use every stable pair 2g−2+n>0, including genus zero and one. Hurwitz stacks, tautological Chow/cohomology constructions, punctured analytic fundamental groups, mapping-class identifications and arithmetic metrics remain in their established consumer owners.

## Library and ownership boundary

Compilation uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual declarations were read, not inferred from their names. Mathlib supplies schemes, `Scheme.fppfTopology`, the category of sheaves, subcanonical Yoneda and `CategoryTheory.Core`. At the Tau Ceti pin, `InvertibleSheaf X` is a full category of module sheaves: its arrows include zero maps. `LineBundleClass X` is its skeleton of isomorphism classes, with a tensor commutative monoid and the exact `mk_eq_mk_iff` and `mk_tensorProduct` comparisons. Its file at this pin does not supply inverses. Taking the core is necessary before calling the fixed-curve carrier a groupoid.

The reviewed `data/library-coverage.json` JacobianChallenge Layers A and C audit was checked. StableReductionPartII has no separate entry there. Existing absolute line-bundle, degree, coherent-cohomology and relative-Picard owners are imported rather than duplicated.

The current read-only checkouts were also inspected: TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current `LineBundle/Class.lean` already has a commutative group on every scheme, without an integrality assumption. `LineBundle/Functoriality.lean` supplies actual pullbacks and their identity/composition comparisons. `PicardFunctor/Rigidified.lean` and `Point.lean` already construct the pointed rigidified class functor and its trivial point; their equivalence with the unpointed relative sheaf is not proved in those files. `LineBundle/Degree.lean` already supplies Euler degree on absolute field-curve classes. None of these is a new target of this layer.

Current AlgebraicVectorBundles L0A–L0C own strong monoidal pullback, duals, rank-one comparisons and determinant coherence. Those layers postdate the atlas snapshot, so the packet records their exact owner under `currentUpstreamImports` and the consuming nodes' `unindexedUpstreamPrerequisites`, following the parent convention. They are not encoded as imaginary pinned declarations. Current ModularCurves 1C, 1D, 2D, 4A, 4B, 9D and 9E supply the elliptic-family and coarse-j targets used below. The existing R09.5 elliptic/coarse-j recovery nodes, with SF.1 finite-quotient-coarse, supply the comparison universal for algebraic-space targets. Upstream CoarseModuliData itself quantifies only over schemes. The coarse j-line and its stronger comparison are not planned again.

## Actual intended carriers

These are mathematical type specifications for the native geometric interfaces. They do not introduce substitute Lean models.

* The domain of the class morphism q is a category fibred in groupoids on Sch/B. Its fibre over T has actual smooth genus-g families, level isomorphisms of finite group schemes, and invertible sheaves on their total spaces. Its arrows pair a curve isomorphism with an isomorphism of the actual pulled-back sheaf. The fixed-curve fibre is the degree cut of Core(InvertibleSheaf X).
* The codomain of q is the **discrete** stack associated to the represented sheaf h_{P^d}. Over a prescribed T→M its points are morphisms T→P^d commuting with the structure maps. The universal comparison with the sheafification of line-bundle classes, rather than a geometric-point bijection, defines q on arbitrary bases.
* For p∈P^d(T), Lift_T(p) has objects L∈InvertibleSheaf(C_T) with equality of their relative class to p, and arrows all line-bundle isomorphisms between those objects. This equality does not rigidify L or choose a local trivialization. Its set of isomorphism classes is the actual fibre of Pic(C_T)→Pic_{C_T/T}(T).
* The obstruction β_T is the particular d₂ boundary of the fppf Leray sequence, with target H²_fppf(T,G_m). It is not an arbitrary function into a group called a Brauer group. Generic sheaf cohomology and Leray already have owners in SF.2; the geometric G_m/site/class comparison is the missing native integration.
* For a fixed curve C/k, A=k[ε]/(ε²) and inclusion i:C→C_A, the framed deformation groupoid consists of actual L on C_A and an isomorphism φ:i*L≅L₀. An arrow a:L≅L′ satisfies φ′ composed with i*a equals φ. The corresponding scheme-point carrier is the fibre of Hom_k(Spec A,P^d_C)→Hom_k(Spec k,P^d_C) over [L₀]. This is a fixed-curve reduction fibre, not the tangent space of all varying triples.

## Transitive supplier audit

The following checks isolate the proof inputs that MC.7 actually uses. Exact supplier targets already exist; they are not requested a second time merely because their implementations are absent.
### JacobianChallengePartII:JC0/relative-degree-components

Smooth projective geometrically connected curves over Noetherian M. Fibre degree is χ(L_t)−χ(O_t); fixed d is tested on every geometric fibre of T, and all comparisons use the relative sheaf.

JacobianChallenge A/B/C own field degree, Riemann–Roch and relative coherent cohomology. A0 owns sheafification/descent. Represented open-and-closed degree pieces and the A0 base-change node give arbitrary-test-scheme restriction. No inference from algebraically closed point sets to a functor equality is used.

Read boundary: BLR9.3/1 p.252 and9.2/13 p.251; exact supplier statements and direct prerequisites read.

### JacobianChallengePartII:JC0/picard-representability

Noetherian M is quasi-projective over the cyclotomic base; f is projective smooth with integral geometric fibres. For a fixed relative polarization H, a degree-d line has polynomial d+n deg(H)+1−g. A uniform twist makes degree at least2g+1, so fibre Riemann–Roch and duality give H¹=0 and global generation. Relative cohomology/base change then gives the same finite-rank pushforward on all tests. Nonzero fibre sections then cut relative effective Cartier divisors; their parameter fibres are projective spaces, not finite sets.

R09.2 supplies fixed-polynomial Hilbert/Quot on all tests; R09.3 supplies descent of quasicoherent ideals/invertible modules. BLR8.2/12 classifies equivalence classes by their Hilbert points, descends the graph to a closed Hilbert locus, and yields the proper faithfully flat quotient and quasi-projectivity. This generic proper-flat quotient is not supplied by the existing finite-locally-free quotient comparison. A precise R09.3 request below records that target; the curve Picard theorem itself is already planned by JC0.

Hilbert/Quot regularity and limit inputs remain the exact R09.2/SF.0 owner obligations. For smoothness use fibre H²=0 (BLR8.4/2); identity component is degree0 (BLR9.2/13). In this curve case fixed-degree boundedness follows from the uniform twist and the resulting finite-rank evaluation quotient; the full higher-dimensional boundedness assertions of BLR8.2/13,14 are unnecessary. The proper flat divisor relation has locally constant fibre Hilbert polynomial over its quasi-compact Noetherian parameter scheme, hence finitely many polynomials, as required by8.2/12. No principal polarization, abelian properness or autoduality proof is required for this degree-component statement.

Read boundary: Fresh BLR8.2/1,5, Lemma6, Proposition7, Theorem8 and Theorem12 pp.210–221;8.4/2 p.232;9.3/1 p.252. Exact R09.2 and R09.3 nodes and proof steps inspected.

### JacobianChallengePartII:JC0/picard-torsors

C→M itself is a surjective smooth fppf cover. Its base-changed family has a diagonal section; d times its divisor, with inverse tensor powers for d<0, gives the required local origin.

Tensor, difference and their torsor inverse identities descend as morphisms of represented sheaves. The local origin proves a J-torsor, not a canonical global degree-d line bundle.

Read boundary: Fresh BLR9.3/1 p.252; exact JC0 torsor node read.

### JacobianChallengePartII:JC4/actual-to-relative-obstruction

Proper flat finite presentation and universal global functions hold for every f_T, even for arbitrary T. Apply the general first clause of JC4; its Pic⁰(J), autoduality and field-only Brauer clauses are not used.

SF.2 owns derived cohomology on sites, functorial Leray and H¹(G_m)=Pic. R¹f_*G_m is the sheafification of U↦Pic(C_U), hence the A0 relative Picard sheaf; universal functions identify f_*G_m with G_m. Read the five-term sequence, including its d₂ boundary and pullback naturality. A0 kernel and section-splitting supply the earlier exactness and pointed specialization. No general H² classification of gerbes or Azumaya comparison is needed.

Read boundary: Fresh BLR8.1 pp.203–205, Proposition4; exact JC4, A0 obstruction and SF.2 Leray/Hilbert90 statements and proofs inspected.

### JacobianChallengePartII:JC6/picard-lie-cohomology

For fixed-curve infinitesimals the integral Noetherian supplier base is Spec k. Dual numbers are its test scheme, not a base to which the integral hypothesis is incorrectly applied.

The split unit sequence with kernel1+εO gives H¹(O); H² of a curve vanishes. A constant k-point gives the pointed comparison over A and Pic(A)=0. H¹ has dimension g by the existing coherent-curve owner.

The separate stable-family semiabelian proof remains owned by NeronModelsAndSemistableAbelianVarieties:R11.4 and its recorded normalization inputs; this is not needed for smooth fixed-curve degree components.

Read boundary: Fresh BLR8.4/1 pp.231–232 and Yuan Lemma3.4 pp.43–44; exact JC6 hypotheses inspected.

### AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery

The trivial elliptic moduli problem is affine relatively representable. Work locally over D(3) with full level3 and over D(2) with full level4; the rigidifier schemes have affine invariant quotient charts. No one global rigidifier or arbitrary coarse base-change theorem is used.

Upstream CoarseModuliData quantifies over scheme targets. R09.5 already plans the required stronger comparison: quotient-stack charts plus SF.1 finite-quotient-coarse give universality among algebraic spaces, then unique comparisons glue. R09.5/coarse-j-line-recovery imports the explicit9E coefficient-ring result, including characteristics2 and3. Only after this bridge may MC.4 coarse uniqueness be applied.

The concrete quotient-stack and all-algebraic-space comparison bindings remain the recorded R09.5 owner obligations. SF.1 finite-group-quotient uses the finite-group geometric/categorical quotient theorem (Rydh), not merely transitivity on prime ideals. No new coarse-j target is planned here.

Read boundary: Exact R09.5 elliptic/coarse-j recovery and SF.1 finite-group quotient/coarse statements and proofs; current ModularCurves README9D/9E and Suggested.lean CoarseModuliData read.

The representability audit exposes one narrower proof-input request. BLR §8.2 Theorem 12, pp.220–221, uses a proper flat finitely presented relation, with finitely many fibre Hilbert polynomials and a chosen strong quasi-projective embedding. R09.3's existing finite locally free quotient comparison does not cover this. The requested Noetherian-base version constructs the effective fppf quotient, identifies the relation with the kernel pair, and gives a strongly projective faithfully flat quotient map and strongly quasi-projective quotient. The proof classifies relation fibres by the R09.2 Hilbert scheme and descends the graph as a closed Hilbert locus using R09.3 ideal descent. Divisor-to-Picard fibres can be positive-dimensional projective spaces, so substituting a finite quotient is invalid. This request extends the generic supplier proof, not the already planned JC0 Picard theorem.

In particular, no JC7 universal-level-Jacobian node is used to found MC.4: the generic JC0/JC4 inputs remain independent of fine moduli. The relative Jacobian identity section is never used as a section of the original curve. The stable semiabelian identity-component theorem is not needed for the smooth degree-component construction; it appears only in the separately qualified stable Hodge export.

## Targets

The following thirteen targets supplement the two inherited MC.7 nodes. Each source match and proof is stated in original mathematical prose. Definition APIs are derived from their listed uses; tests are intended to distinguish incorrect carriers or missing hypotheses.
### fine-family-functions — Universal global functions for the level family

**Theorem.** Let f:C→M be the universal smooth projective genus-g curve on the fixed symplectic level component M=M_g[N] over B=Spec Z[1/N,ζ_N]. For every scheme T→M, including non-Noetherian and nonreduced T, the canonical unit O_T→(f_T)_*O_{C_T} is an isomorphism. The identifications for identity and composite base changes agree with the structure-sheaf pullback maps. In particular Γ(C_T,O)^×=Γ(T,O)^× canonically.

**Hypotheses.** g≥2, N≥3; N invertible and a primitive ζ_N fixed. f is the smooth projective universal family supplied by MC.4; its geometric fibres are connected.

**Dependencies.** `StableReductionPartII:MC.4/fine-level-scheme`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Proof or construction.**

1. Apply the imported universal-functions statement for prestable curves, or its independent proper-flat-finite-presentation criterion in Stacks Lemma36.32.6. Smooth connected geometric curve fibres are geometrically reduced and connected.
2. The criterion has no Noetherian-base assumption: its proof uses perfect proper-flat cohomology (Lemma36.32.5) and H⁰(C_s,O)=κ(s) for geometrically reduced connected proper fibres (Lemma33.9.3(7)). Its conclusion already quantifies over all base changes, so it does not merely compare closed fibres.
3. All maps are the canonical units; naturality of the unit and uniqueness of inverses give identity/composition coherence. Take global sections and units.

**Acceptance checks.**

* Specialize to T with nilpotents and to a non-Noetherian affine scheme without adding reducedness or local-Noetherianity.
* For a geometrically disconnected proper family the conclusion can fail: two copies of T give O_T×O_T; connectedness is essential.

**Source.** [The Stacks Project: Picard and curve interfaces](https://stacks.math.columbia.edu), Lemma36.32.6 (0E0L); Lemma36.32.5 (0E62); Lemma33.9.3(7) (0BUG). The all-base-change unit isomorphism follows from proper flat finite presentation and geometrically reduced connected fibres. [Tau Ceti roadmaps: existing curve, bundle and modular-curve owners](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27), StableReduction Layer3, prestable-family convention. The existing owner includes universal global functions; this node verifies its use for the level family.

### level-picard-sheaf-comparison — All-base comparison for degree-Picard parameters

**Theorem.** For f:C→M as above and d∈Z, let P=P^d be the degree-d scheme of MC.7/level-picard-parameter and J=P^0. On the big fppf site Sch/M, h_P is naturally the degree-d subsheaf of a_fppf(T↦Pic(C_T)). This is also the sheafification of Pic(C_T)/f_T*Pic(T), with the degree condition imposed on every geometric fibre. P is smooth separated quasi-projective over M, J acts by tensor, and (a,x)↦(x,a·x) identifies J×_M P with P×_M P. Difference is δ(x,y)=y⊗x⁻¹. All these comparisons and actions commute with arbitrary base change, including identity/composition coherence. They make no assertion that P(T) is the pointwise quotient of globally defined line bundles.

**Hypotheses.** Same fixed-component hypotheses as fine-family-functions; d is a fixed integer. The Noetherian scheme M and its projective smooth connected family satisfy the exact JC0 representability hypotheses. Degree d is imposed on all components of T; variable locally constant degree belongs to the full disjoint union of components.

**Dependencies.** `StableReductionPartII:MC.7/level-picard-parameter`, `StableReductionPartII:MC.7/fine-family-functions`, `JacobianChallengePartII:JC0/degree-locally-constant`, `JacobianChallengePartII:JC0/relative-degree-components`, `JacobianChallengePartII:JC0/picard-representability`, `JacobianChallengePartII:JC0/picard-torsors`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change`, `mathlib:AlgebraicGeometry.Scheme.fppfTopology`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology.yonedaEquiv`.

**Proof or construction.**

1. Apply the exact JC0 degree and representability nodes to the Noetherian base M. For their proof route, BLR9.3/1 reduces to8.2/1,5 and8.4/2; the supplier audit records the Hilbert/divisor/quotient inputs with their owners rather than replanning them.
2. A0 gives the two sheafification descriptions and its arbitrary-base-change theorem. A base-changed representing object represents the restricted sheaf by Yoneda, so arbitrary T does not require a new representability theorem over non-Noetherian bases.
3. For the JC0 torsor, the smooth surjection C→M is an fppf cover and its pullback family has the diagonal section. Its divisor d·Γ (inverse tensor powers for d<0) gives a local degree-d origin. Tensor/difference yield the displayed isomorphism locally; equality and inverses descend in the represented sheaves.
4. Transfer the already defined tensor, inverse and pullback coherence through representability. Fix the orientation δ(x,y)=y−x so the torsor identity is δ(x,a·x)=a.

**Acceptance checks.**

* P^0 has its canonical zero, while P^1 has no chosen origin from this construction. A canonical class of degree2g−2 does not choose a degree-one class.
* On T=T₀⊔T₁ a class of degrees0 and1 is not a P^d(T)-point for any single d.
* Base change of the action/difference square agrees for two successive morphisms and on dual numbers.

**Source.** [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §9.3 Theorem1 p.252, proof citing8.2/1,5 and8.4/2; §9.2 Corollary13 p.251. The existing curve Picard theorem supplies represented degree components and their torsor structure. [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §4.3.2 pp.74–75. The degree pieces are used as relative parameters; this comparison specifies their sheaf meaning on general bases. [Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3), §6.1 printed/PDF pp.23–24, relative Picard and Pic¹ discussion. DGH uses represented degree pieces and their difference map on the universal fine-level family; this is a second consumer of the relative sheaf comparison.

### actual-triples-groupoid — Actual triples and their class morphism

**Definition.** For a B-scheme T let Trip^d_N(T) be the groupoid of triples (f_T:X→T,η,L): X/T is a smooth projective geometrically connected genus-g curve, η is the fixed-pairing full level N on its Jacobian, and L is an invertible O_X-module of degree d on every geometric fibre. A morphism (X,η,L)→(X′,η′,L′) is a T-isomorphism u:X≅X′ preserving η together with an isomorphism L≅u*L′. Pullback makes a category fibred in groupoids, with its actual tensor/pullback coherence. The functor forgetting L takes values in the fine level moduli groupoid, which is equivalent to the discrete sheaf h_M; sending L to its relative class gives a morphism of fppf stacks q:Trip^d_N→h_P. The fixed-curve fibre is the degree-d full subgroupoid of Core(InvertibleSheaf X), not the full category of module maps and not its set of isomorphism classes.

**Hypotheses.** g≥2,N≥3, chosen ζ_N and exact pairing component; d∈Z. All morphisms of line bundles in this groupoid are isomorphisms. Fineness/rigidity of the level curve is imported, not postulated for arbitrary unlevelled curves.

**Dependencies.** `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.4/level-rigidity`, `StableReductionPartII:MC.4/full-level`, `StableReductionPartII:MC.7/level-picard-sheaf-comparison`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `AlgebraicModuliForArithmeticGeometry:R09.3/space-fpqc-quasicoherent-descent`, `mathlib:CategoryTheory.Core`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

Current upstream imports: `AlgebraicVectorBundles:L0A`, `AlgebraicVectorBundles:L0B`, `AlgebraicVectorBundles:L0C`.

**Proof or construction.**

1. Use the parent fine curve/level groupoid. Attach native invertible sheaves and invertible module maps by the existing line-bundle stack, retaining scalar automorphisms.
2. Compose isomorphisms with the canonical pullback-composition isomorphism. Pullback of a triple uses the actual cartesian square and the line-bundle pullback of the bundle owner. Degree descent is JC0 through the sheaf comparison.
3. Curve-family and level descent are parent imports; invertible-module descent is R09.3/SF.1. The class map q is compatible with these data, since relative Picard classes are functorial.
4. On a fixed X identify the groupoid with the core of the degree-d subcategory; equality of native LineBundleClass is only existence of an isomorphism. No claim that the core itself is discrete follows.

**Uses that determine the API.**

* PAPER-YUAN-26/137; consumer-yuan below: Turn a geometric parameter point into an isomorphism class of actual triples while retaining the distinct general-base groupoid.
* lift-gerbe, lift-torsor and infinitesimal-points below: Take genuine fibres of q, with scalar automorphisms and base-change functors, rather than a quotient set.

**API.**

* `actualTriples_pullback`: For a:T′→T, pull back the curve, level and invertible sheaf; the canonical identity and composite isomorphisms satisfy their cocycle constraints.
* `actualTriples_morphism`: An arrow consists exactly of a level-preserving curve isomorphism and an isomorphism of the pulled-back invertible sheaves.
* `actualTriples_relativeClass`: q is a cartesian/fppf stack morphism to the discrete represented sheaf h_P and commutes with arbitrary pullback.
* `actualTriples_fixedCurveCore`: Fixing a level curve identifies its line-bundle fibre with the degree-d part of the native core; the absolute class comparison agrees with LineBundleClass.mk.
* `actualTriples_scalarAut`: Every automorphism of a triple is scalar multiplication by a unique unit of Γ(T,O_T), by level rigidity and fine-family-functions.
* `actualTriples_tensor`: Tensor gives Trip^d×_{h_M}Trip^e→Trip^{d+e}; its image under q is the represented relative tensor law.

**Discriminating tests.**

* `scalar-inertia`: Over an algebraically closed field k and a level curve, a fixed L has automorphism group k×. For k=C this group is nontrivial although the corresponding h_P-point has trivial inertia.
* `base-twist`: For a fixed level genus-two curve C/C, T=P¹_C and L_T the pullback of a degree-d line bundle L on C, L_T and L_T⊗f_T*O_T(1) are distinct isomorphism classes of triples with the same q-image. Restriction to a constant point of C proves distinctness.
* `noninvertible-map`: The zero endomorphism of an invertible sheaf on a nonempty curve is a morphism in the native full module subcategory but is not an arrow of Trip^d_N.
* `tensor-class`: At a fixed curve the class of L⊗K agrees with multiplication in the pinned LineBundleClass commutative monoid; this does not require its missing inverse operation.

**Acceptance checks.**

* Verify each API item and each discriminating test below.
* Comparison with h_P is a stack morphism with groupoid-valued source and discrete target; no equivalence is asserted on T.

**Source.** [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.1 pp.203–205, Picard functor and rigidification discussion. Relative classes forget line-bundle automorphisms and base twists. [The Stacks Project: Picard and curve interfaces](https://stacks.math.columbia.edu), Lemma108.9.1, tag0DME. The Picard stack maps to its sheaf of classes with local lifts and local isomorphisms. [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §4.3.2 pp.73–75. The triples motivating the parameter space contain actual line bundles; the geometric-field qualification must be preserved.

### lift-gerbe — The groupoid of lifts of a relative class

**Construction.** For T→M and p∈P^d(T), define Lift_T(p) as the fibre of q over p: objects are actual invertible sheaves L on C_T whose relative class is p, and arrows are invertible sheaf isomorphisms. Its restriction to Sch/T is fppf locally nonempty and any two objects are fppf locally isomorphic; the automorphism sheaf of any object is canonically G_m,T. Thus it is the G_m-banded gerbe of lifts, with pullback Lift_T(p)|_{T′}≃Lift_{T′}(p|_{T′}). This description asserts the local properties directly and needs no general classification of gerbes by H².

**Hypotheses.** The fixed level family and degree-d component of the preceding nodes. p is a sheaf point; existence of a global lift is not a hypothesis.

**Dependencies.** `StableReductionPartII:MC.7/actual-triples-groupoid`, `StableReductionPartII:MC.7/fine-family-functions`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`.

**Proof or construction.**

1. Use the fixed level-family identification to take the genuine groupoid fibre of q, not the fibre of a purported bijection of sets.
2. Sheafification provides an fppf cover on which p is represented by a line bundle. Equality of two sheafified classes gives local equality of absolute isomorphism classes after refinement, hence local line-bundle isomorphisms.
3. The automorphism sheaf of a line bundle on C_U is Γ(C_U,O)^× for every U/T; fine-family-functions identifies this with Γ(U,O)^×, compatibly with restriction.
4. Pullback of line bundles, their isomorphisms and the relative class furnishes the cartesian equivalence with its identity/composition constraints.

**Uses that determine the API.**

* lift-obstruction below: Specify the actual lift problem detected by the Leray boundary, without assuming Azumaya or general gerbe-classification theorems.
* lift-torsor below; PAPER-YUAN-26/137: Separate the local groupoid from its global objects and their isomorphism classes.

**API.**

* `picardLift_objects`: An object over U/T is an actual L on C_U together with equality of its relative class with p|_U.
* `picardLift_localNonempty`: Every p has lifts on an fppf cover; any pair of local lifts becomes isomorphic after a further fppf cover.
* `picardLift_band`: For any lift L over U, its automorphism sheaf on Sch/U is G_m,U, naturally in U.
* `picardLift_baseChange`: Restriction along T′→T is equivalent to Lift_{T′}(p|_{T′}); equivalences respect identities and composite pullbacks.

**Discriminating tests.**

* `geometric-field`: For algebraically closed k the fibre has an object, every two objects are isomorphic, and its scalar automorphism group is k×; it is equivalent to BG_m(k), not a discrete singleton.
* `pointed-normalization`: A section σ:T→C_T gives each p a normalized lift L_norm with σ*L_norm≅O_T, unique up to unique rigidification-preserving isomorphism. Every unnormalized lift is isomorphic to L_norm⊗f_T*N for some base line bundle N. For the constant family over P¹_C, N=O(1) gives a lift not isomorphic to L_norm, although their relative classes agree.
* `base-twist-locality`: Over P¹_C, the nonisomorphic lifts differing by O(1) become isomorphic over the standard affine trivializing cover. This tests local isomorphism without global uniqueness.

**Acceptance checks.**

* A nonempty fibre can have many global isomorphism classes and nontrivial inertia; neither property contradicts local isomorphism.
* No global Poincaré line bundle is inferred from local nonemptiness.

**Source.** [The Stacks Project: Picard and curve interfaces](https://stacks.math.columbia.edu), Lemma108.9.1, tag0DME, proof of local nonemptiness and local isomorphism. The gerbe property follows from the definition of the sheafified Picard functor. [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.1 Proposition4 and rigidification discussion pp.204–205. Scalars and descent account for the distinction between a relative class and an actual line bundle.

### lift-obstruction — The obstruction to a global line-bundle lift

**Theorem.** For every T→M there is the functorial exact sequence 0→Pic(T)→Pic(C_T)→Pic_{C_T/T}(T)→H²_fppf(T,G_m)→H²_fppf(C_T,G_m). Its boundary β_T is the Leray differential d₂^{0,1} after identifying f_{T,*}G_m=G_m. For p∈P^d(T), β_T(p)=0 if and only if Lift_T(p) has a global object. Pullback carries β_T(p) to β_{T′}(p|_{T′}). The target is cohomological H², without any identification with Azumaya classes. A section of C_T/T makes β_T zero by the imported splitting; no section of the relative Jacobian is treated as a section of C_T.

**Hypotheses.** Arbitrary T→M; fine-family-functions holds universally for f_T. Pic means actual line bundles up to isomorphism; the relative Picard term is the fppf sheaf, not a pointwise quotient.

**Dependencies.** `StableReductionPartII:MC.7/fine-family-functions`, `StableReductionPartII:MC.7/level-picard-sheaf-comparison`, `StableReductionPartII:MC.7/lift-gerbe`, `JacobianChallengePartII:JC4/actual-to-relative-obstruction`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`, `SchemeAndStackFoundations:SF.1/torsor-cohomology`, `SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence`, `SchemeAndStackFoundations:SF.2/hilbert-90`.

**Proof or construction.**

1. Use the general proper-flat/universal-functions clause of JC4/actual-to-relative-obstruction. The other clauses concerning Pic⁰(J) and autoduality are not prerequisites of this specialization.
2. Identify f_*G_m with G_m as sheaves on the big fppf base site, using the universal unit isomorphism on every U/T. Identify H¹(G_m) with the Picard group via SF.1.
3. Read the low-degree Leray sequence with R¹f_*G_m the relative Picard sheaf. Its transgression gives the boundary and its naturality. A0 supplies exactness/injectivity at the earlier terms.
4. Exactness at the relative Picard term says precisely that p is the class of an actual L. This is global nonemptiness of Lift_T(p), not a chosen lift. For a section use A0/section-picard-split.

**Acceptance checks.**

* State every sheaf and cohomology site in the exact sequence and check naturality for arbitrary T′→T.
* Zero obstruction yields existence, not a canonical bundle or a trivial automorphism group.
* The specialization does not import JC4 autoduality or a section of a Jacobian as a curve section.

**Source.** [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.1 Proposition4 pp.204–205 and preceding Leray sequence p.203. The obstruction is the low-degree cohomological boundary under universal global functions.

### lift-torsor — Picard torsor of global lifts

**Construction.** For p∈P^d(T), let LiftClasses_T(p)={a∈Pic(C_T): a maps to p}. This is the set of isomorphism classes of Lift_T(p). Pic(T) acts by n·a=a⊗f_T*n. The action is free, and for any a,b in the fibre there is a unique n with n·a=b. Therefore the fibre is empty exactly when β_T(p)≠0; when β_T(p)=0 it is a Pic(T)-torsor, with no chosen origin. A chosen actual lift L₀ gives a groupoid equivalence Lines(T)→Lift_T(p), N↦L₀⊗f_T*N, as well as a Pic(T)-equivariant bijection Pic(T)→LiftClasses_T(p). These statements are natural for pullback of a specified L₀. Lines(T) means the groupoid Core(InvertibleSheaf T).

**Hypotheses.** Arbitrary T→M, p∈P^d(T). The torsor assertion includes nonemptiness precisely under β_T(p)=0; the unpointed fibre is not made into a group.

**Dependencies.** `StableReductionPartII:MC.7/lift-obstruction`, `StableReductionPartII:MC.7/lift-gerbe`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel`, `AlgebraicModuliForArithmeticGeometry:R09.3/space-fpqc-quasicoherent-descent`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

Current upstream imports: `AlgebraicVectorBundles:L0A`, `AlgebraicVectorBundles:L0B`, `AlgebraicVectorBundles:L0C`.

**Proof or construction.**

1. Tensor by a pullback line bundle does not change the sheafified relative class, so it defines the action. The kernel theorem gives injectivity of f_T*:Pic(T)→Pic(C_T), hence freeness.
2. For two classes a,b in the fibre, b⊗a⁻¹ lies in the kernel. A0 identifies it with a unique class from Pic(T), giving transitivity and the unique difference in the stated orientation.
3. For a chosen L₀, tensor/pullback gives the displayed functor on actual line bundles. Essential surjectivity follows from the same kernel descent. Full faithfulness uses descent of homomorphisms between pullback invertible sheaves: locally trivialize N,N′ and apply O_T≅f_*O_C; the Hom sheaves and their invertible sections then agree.
4. Tensor associativity, pullback monoidality and their coherence belong to the bundle owner. They give equivariance, the change-of-origin translation formula, and compatibility with successive base changes.

**Uses that determine the API.**

* PAPER-YUAN-26/137; MC.7/picard-triples-comparison: Explain why geometric-field points classify triples up to isomorphism and why the same sentence fails for arbitrary T.
* infinitesimal-points below: Distinguish global base twists from first-order variation of the relative class.

**API.**

* `liftClasses_action`: n∈Pic(T) acts by tensor with f_T*n, with unit/associativity and degree preservation.
* `liftClasses_difference`: For a,b in one fibre there is exactly one n∈Pic(T) such that b=a⊗f_T*n.
* `liftClasses_nonempty`: LiftClasses_T(p) is nonempty if and only if β_T(p)=0.
* `liftClasses_chooseOrigin`: A specified lift L₀ identifies Pic(T) equivariantly with LiftClasses_T(p); the origin maps satisfy Φ_{L₀⊗f_T*N}([M])=Φ_{L₀}([N]+[M]), so a fixed lift has new coordinate equal to its old coordinate minus [N].
* `liftGroupoid_neutralization`: A specified L₀ gives Lines(T)≃Lift_T(p), naturally on every U/T, preserving the G_m-band.
* `liftClasses_baseChange`: Pullback gives a map of lift fibres equivariant for Pic(T)→Pic(T′); identity and composition agree. A bijection is not asserted for arbitrary base change.
* `liftClasses_pointedNormalization`: If σ:T→C_T is given, L↦L⊗f_T*(σ*L)⁻¹ is the A0 normalized representative; its σ-rigidification removes the scalar ambiguity.

**Discriminating tests.**

* `nontrivial-base-Picard`: For C/C a fixed level genus-two curve, T=P¹_C and a pullback L₀, the lifts L₀⊗f*O(n) are pairwise nonisomorphic for n∈Z. They all map to one p; the difference between n and m is O(m−n).
* `field-scalar`: For T=Spec k with k algebraically closed, Pic(T)=0, so the lift-class fibre is a singleton, while the actual lift groupoid has automorphism group k×.
* `section-normalization`: For the same constant family with a constant section σ, all L₀⊗f*O(n) have the same normalized representative. Their σ-rigidified normalized objects are uniquely isomorphic.
* `empty-fibre-convention`: The theorem is conditional on β=0 for nonemptiness: an empty fibre with β≠0 is never assigned a torsor structure with an inhabited carrier.

**Acceptance checks.**

* Do not confuse this Pic(T)-torsor of lifts with the J_T-torsor P^d_T of relative degree-d classes.
* A global lift changes the entire groupoid to Lines(T), not to a discrete copy of Pic(T).

**Source.** [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.1 Proposition4 and rigidification/descent discussion pp.204–205. Kernel and scalar descent give the ambiguity of a global representative by a line bundle from the base. [The Stacks Project: Picard and curve interfaces](https://stacks.math.columbia.edu), Lemma108.9.1 (0DME). Local equality of lifts retains their invertible-sheaf isomorphisms.

### infinitesimal-points — Fixed-curve infinitesimal Picard points

**Theorem.** Let k be algebraically closed with N invertible, C/k a fixed smooth projective geometrically connected genus-g≥2 curve with fixed full level, and L₀ an actual degree-d line bundle. Put A=k[ε]/(ε²), C_A=C×Spec A. The fibre of P^d_C(A)→P^d_C(k) over [L₀] is canonically, using the constant lift of L₀ as origin, the additive k-vector space H¹(C,O_C), of dimension g. It is also the set of isomorphism classes of pairs (L,φ), where L is a line bundle on C_A and φ:L|_C≅L₀, and arrows respect φ. Each framed object has automorphism group 1+εk≅(k,+). Thus a fixed geometric point can have many infinitesimal lifts even though Pic(Spec A)=0. Curve, level and special-fibre bundle stay fixed; this does not compute the tangent space of the full varying-curve stack.

**Hypotheses.** Algebraically closed k; fixed curve C, fixed level η, actual L₀ and its constant pullback. The JC6 Lie theorem is applied with integral Noetherian base Spec k, not with nonreduced base Spec A.

**Dependencies.** `StableReductionPartII:MC.7/lift-torsor`, `JacobianChallengePartII:JC6/picard-lie-cohomology`, `JacobianChallengePartII:JC0/picard-torsors`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Proof or construction.**

1. Tensor by the inverse of the constant lift of L₀ identifies the degree-d reduction fibre with the infinitesimal kernel at zero in J_C. Apply JC6 at Spec k and its dual-number definition of Lie to identify this with H¹(C,O_C).
2. Concretely 1+εO_C is additively O_C and the split reduction sequence of units identifies the kernel of Pic(C_A)→Pic(C) with H¹(C,O_C). Constants lift all units, so a chosen reduction framing does not change the set of isomorphism classes.
3. C has a k-point, giving a constant section over A. The A0 pointed splitting identifies relative classes with absolute classes modulo Pic(A), and Pic(A)=0 because A is local. This relates the actual framed problem to P^d_C(A), without applying an integral-base theorem to Spec A.
4. Framed automorphisms are units reducing to1: by universal functions these are exactly1+εk. Genus gives dim_k H¹(C,O_C)=g from the existing coherent-curve owner.

**Acceptance checks.**

* For genus2 the reduction fibre is a two-dimensional k-vector space and is not a singleton.
* The constant deformation is zero and adding a class means tensoring its infinitesimal line bundle.
* Changing a reduction framing is absorbable by a constant scalar, but scalar units reducing to1 remain automorphisms.

**Source.** [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.4 Theorem1 pp.231–232. The dual-number unit sequence identifies the Lie algebra of the Picard functor with H¹ of the structure sheaf. [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.3 Lemma3.4 pp.43–44. The Lie/cohomology comparison is the algebraic input used for the Hodge comparison, with an integral Noetherian original base.

### consumer-av — Curve-family export for symplectic L-functions

**Application.** For each g≥2, the smooth unpointed curve stack M_g and its universal smooth projective family, after base change to Z[1/|G|] for G=Sp_{2r}(F_ℓ) as in Abdurrahman–Venkatesh, supply the curve-family base of their §5.1 Hurwitz problem. For every T-point h of that Hurwitz stack, the underlying curve is the pullback of the universal M_g-curve along its forgetful map h→M_g. This identification is cartesian and coherent under arbitrary base change; it retains the category-valued curve automorphisms before any level is added.

**Hypotheses.** g≥2 for this unpointed stable-range export. Fix r≥1 and a finite field F_ℓ of odd cardinality, as in the consumer; invert |Sp_{2r}(F_ℓ)| on the curve-moduli base. The consumer supplies its own connected-fibre G-cover problem, cyclotomic twist and forgetful morphism.

**Dependencies.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.1/hilbert-quotient`.

**Proof or construction.**

1. Apply the parent universal property to the underlying smooth proper curve family in the Hurwitz object. Over a scheme the curve is projective by the genus≥2 canonical-polarization input of MC.0/MC.1.
2. Base change the universal curve along the consumer forgetful morphism to obtain the same curve over its Hurwitz groupoid. The cartesian equivalence is the classifying-family equivalence, natural on arrows as well as objects.
3. The central deck transformations, connected-cover condition, possible failure of étaleness of the Hurwitz forgetful map, cyclotomic multiplier and symplectic local system are defined by SymplecticLFunctionsModSquares. They are not consequences of the curve fine-level scheme.

**Acceptance checks.**

* Over a test scheme and after a second pullback the classifying curve is canonically the same family.
* A central deck automorphism in AV Example5.1 is not removed by replacing the consumer stack with a curve full-level scheme.
* No assertion of an unmarked genus-one DM stack or étaleness of the Hurwitz map is made.

**Source.** [Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://arxiv.org/pdf/2303.13436v1), §§5.1–5.2 pp.39–41, including Example5.1. The argument uses a universal curve over a Hurwitz groupoid, with central cover automorphisms still present.

Routed catalogue items: `PAPER-ABDURRAHMAN-VENKATESH-25/54`.

### consumer-clp — Pointed stable-stack export for tautological operations

**Application.** For all ordered stable pairs (g,n) with 2g−2+n>0, the parent supplies the smooth proper Deligne–Mumford stack M̄_g,n/Z of relative dimension3g−3+n, its dense smooth-curve open M_g,n and universal stable family, relabelling of the n ordered marks, forget-and-stabilize, and separating/nonseparating clutching. The normalization of the reduced total boundary is the finite disjoint union of the one-edge vertex-product quotient stacks, retaining the constant finite graph-automorphism groups. After base change to C or to the relevant étale-cohomology base these maps and their coherent compositions are the geometric input of Canning–Larson–Payne §2.1.

**Hypotheses.** Stable pairs, with marks ordered, disjoint and in the smooth locus of each curve. The consumer supplies Chow/cohomology theories, graph invariants and their push-pull formalism.

**Dependencies.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `StableReductionPartII:MC.2/forget`, `StableReductionPartII:MC.3/separating-clutching`, `StableReductionPartII:MC.3/nonseparating-clutching`, `StableReductionPartII:MC.3/boundary-normalization`.

**Proof or construction.**

1. Use the parent definition with ordered marks and its stack theorem on the whole stable range, including genus0 and genus1. Relabelling is induced by permuting the tuple, with the permutation law on the actual sections.
2. Compose the existing forget/stabilization and clutching morphisms; pullback of their universal families identifies them with the consumer operations. Parent contraction coherence handles successive forgetting.
3. For the boundary use the normalization node, not the unnormalized image of a clutching map. Descent by the constant graph-automorphism group retains branch exchange and self-intersection data.
4. The consumer MotivicStructuresInModuliOfCurves owns STEs, motivic/cohomological structures, cycle maps, graph complexes and every push-pull theorem. This export supplies their domain stacks and algebraic maps only.

**Acceptance checks.**

* (g,n)=(0,3) gives a point and (0,4) has three distinct normalized boundary points.
* At a curve with two nodes of the same one-edge type the normalization distinguishes the two chosen nodes.
* The branch-exchange group is the constant order-two group; in characteristic2 it is not replaced by μ₂.

**Source.** [Extensions of tautological rings and motivic structures in the cohomology of M̄_g,n](https://arxiv.org/pdf/2307.08830v3), Introduction pp.1–2; §2.1 pp.4–5. The tautological extensions are defined through relabelling, forgetting and gluing operations on pointed moduli stacks.

Routed catalogue items: `PAPER-CANNING-LARSON-PAYNE-24/2`, `PAPER-CANNING-LARSON-PAYNE-24/3`.

### consumer-chen — Elliptic-stack and coarse-scheme comparison

**Application.** For every coefficient field k, the smooth one-pointed genus-one stack M_1,1,k of the parent is equivalent to the elliptic-curve stack Ell/k of current ModularCurves4A–4B, compatibly with the marked universal curve and arbitrary base change. Its coarse algebraic space is therefore canonically the existing coarse j-line A¹_k=Spec k[j] of ModularCurves9E. The comparison is characterized by the coarse classifying maps. It supplies Chen’s elliptic stack and its distinct coarse scheme M(1), without putting a universal elliptic curve on the coarse scheme.

**Hypotheses.** The one mark is a section; smooth proper geometric genus-one fibres. Import current ModularCurves1C,1D,2D,4A,4B,9D,9E and the exact R09.5 elliptic/coarse-j recovery nodes. The SF.1 finite-quotient-coarse bridge supplies universality among algebraic spaces; the scheme-target universal property of upstream CoarseModuliData alone does not.

**Dependencies.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `StableReductionPartII:MC.2/genus-one-base`, `StableReductionPartII:MC.4/coarse-space`, `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`, `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`, `tauceti:TauCetiRoadmap/ModularCurves#4a-moduli-problems-over-ellr`, `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`.

**Proof or construction.**

1. Use ModularCurves1C for the pointed Weierstrass presentation and 1D for the canonical scheme-level group law, including arbitrary-base-change compatibility. Use 2D (KM2.5.1, isGroupHom_of_mapsZero) to show pointed isomorphisms preserve that law and to prove uniqueness of a compatible group structure. Forgetting the group law while retaining the identity section is then quasi-inverse to this construction, naturally under base change.
2. The marked family is identified with the elliptic universal family by the classifying equivalence, not by a coarse-point bijection.
3. Use R09.5/elliptic-coarse-recovery: the full level3 rigidifier on D(3) and level4 rigidifier on D(2) give the quotient-stack charts imported from ModularCurves4C/9D. SF.1/finite-quotient-coarse upgrades their invariant quotients to coarse spaces universal for algebraic-space targets. The unique comparisons glue on overlaps. R09.5/coarse-j-line-recovery then identifies this coarse space with the coefficient-ring j-line already owned by9E, including its explicit characteristic2/3 results. Transport through the stack equivalence and use MC.4/coarse uniqueness. This proves the latter is a scheme; scheme-target universality alone would not justify the comparison.
4. No proof of coarse-j representability or its invariant-ring computations is added here. Hurwitz/Nielsen/Higman/Markoff constructions remain in InverseGaloisAndArithmeticFundamentalGroups:IG.5.

**Acceptance checks.**

* Over k of characteristic2 or3 use the coefficient-ring9E theorem, not commutation of arbitrary coarse-space formation with base change.
* The stack retains automorphisms of elliptic curves with a marked identity, whereas the j-line is a scheme.
* A map to the j-line does not provide a universal elliptic family; the universal curve belongs to M_1,1.

**Source.** [Nonabelian level structures, Nielsen equivalence, and Markoff triples](https://arxiv.org/pdf/2011.12940v2), Introduction pp.2–3, notation M(1). The consumer distinguishes the elliptic moduli stack from its coarse scheme. [Tau Ceti roadmaps: existing curve, bundle and modular-curve owners](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27), ModularCurves README1C,1D,2D,4A,4B,9D,9E; Suggested.lean coarseJLine_int and coarseJLine. The elliptic-family category and coarse j-line already have owners; only their comparison with the parent stack is added.

Routed catalogue items: `PAPER-CHEN-24/1`.

### consumer-dgh — Fine-level and Picard export for DGH

**Application.** Fix g≥2,N≥3 and a primitive Nth root over Q̄. On the corresponding exact symplectic component, M_g[N] is a regular geometrically irreducible quasi-projective variety of dimension3g−3 with a universal smooth projective curve f:C→M. The Torelli map τ:M→A_g[N] uses the same level and pairing, and Jac(C/M)≅τ*U_g as principally polarized abelian schemes with level; this is the cartesian square (6.1). The smooth Torelli map has finite geometric fibres (at most two), not an asserted globally finite morphism. The section-free Abel map a₁:C→P¹ and the difference map P¹×_M P¹→J are defined without a section of f and commute with every base change. These compose the moduli/Picard interface used in DGH §6.1.

**Hypotheses.** Characteristic zero, fixed exact pairing component, g≥2,N≥3. The ppav fine scheme/universal family, principal polarization and strong-Torelli input are the exact suppliers of MC.6.

**Dependencies.** `StableReductionPartII:MC.4/full-level`, `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.4/level-connectedness`, `StableReductionPartII:MC.6/smooth-torelli`, `StableReductionPartII:MC.6/torelli-finite-fibres`, `StableReductionPartII:MC.6/jacobian-hodge-comparison`, `StableReductionPartII:MC.7/level-picard-sheaf-comparison`, `JacobianChallengePartII:JC2/section-free-abel-map`.

**Proof or construction.**

1. Choose the pairing component on both curve and ppav moduli before applying the fine universal properties. Smoothness and connectedness from the separate MC.4 nodes imply geometric irreducibility; regularity/quasi-projectivity and dimension come from fineness.
2. MC.6/smooth-torelli, with its existing ppav and Jacobian suppliers, identifies the actual pulled-back abelian family with Jac(C/M). Yoneda gives the square on arbitrary test schemes, not only on Q̄-points.
3. Use MC.6/torelli-finite-fibres with its sign qualification. In genus2 all curves are hyperelliptic and the map is injective on geometric points; in the nonhyperelliptic range the two signs can be distinct.
4. Specialize the JC2 diagonal-divisor Abel map to the universal family and the already imported JC0 torsor difference to P¹. The orientation is a₁(y)−a₁(x). JC5/JC7 own the universal Faltings–Zhang tuple, so that construction is not repeated here.

**Acceptance checks.**

* The Jacobian square commutes after dual-number base change and identifies the same principal polarization and level, rather than merely isomorphic geometric fibres.
* The construction uses P¹ before choosing a degree-one origin; a curve section is not supplied by the identity section of J.
* Preserve finite-to-one versus finite, and check genus2 separately from nonhyperelliptic curves.

**Source.** [Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3), §6.1 pp.23–24, diagram(6.1) and degree-Picard discussion. The exact inputs are regular irreducible level moduli, the cartesian Jacobian square, finite-to-one Torelli, and the section-free Pic¹ difference construction.

Routed catalogue items: `PAPER-DIMITROV-GAO-HABEGGER-21/10`, `PAPER-DIMITROV-GAO-HABEGGER-21/12`.

### consumer-landesman-litt — Pointed-family export for canonical representations

**Application.** For a stable pair (g,n), let B be a connected complex variety and π:C→B a smooth proper genus-g curve with n ordered pairwise disjoint sections. Its classifying morphism B→M_g,n,C is characterized by a cartesian equivalence of the marked family with the universal family, naturally under scheme base change. The consumer’s versality condition is exactly that this morphism is dominant and étale. Neither existence of such a presentation for every family nor versality of an arbitrary family is asserted.

**Hypotheses.** 2g−2+n>0; B a connected complex variety; sections disjoint. The base letter B here denotes the consumer variety, not the fixed cyclotomic base of the unpointed level convention.

**Dependencies.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`.

**Proof or construction.**

1. Restrict the parent stable pointed stack and universal curve to their smooth open and base change to C. Apply the classifying property to the actual ordered sections.
2. The cartesian equivalence is natural on marked-curve isomorphisms and all scheme pullbacks. Express the consumer’s dominant-étale predicate on this classifying morphism without deriving it from smoothness of π.
3. MappingClassGroupsAndCanonicalRepresentations owns removal of the section divisor, the punctured family, dominant étale charts used in its arguments, analytification, stack fundamental groups and mapping-class identifications. The coarse space cannot replace this stack in those constructions.

**Acceptance checks.**

* The constant family with (g,n)=(0,4) over a positive-dimensional B has a classifying map to a point of M_0,4, hence is not versal.
* The ordered sections and their labels survive the classifying equivalence; permutation is a specified operation.
* Unmarked genus1 is outside the stable range; marked genus1 and stable genus0 pairs are included.

**Source.** [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4), Notation1.10.1–1.10.3 pp.10–11. The consumer works with marked families over connected complex bases and defines versality via a dominant étale map to the moduli stack.

Routed catalogue items: `PAPER-LANDESMAN-LITT-24/9`.

### consumer-yuan — Stable, level and Picard export for Yuan

**Application.** For g>1 the smooth/stable curve stacks and universal families of MC.0–MC.2, together with their separate coarse schemes from MC.4 (projective for the stable unpointed space), supply Yuan §3.1.1. On each fixed symplectic level component with N≥3 invertible, the fine smooth scheme and the stable extension after a finite dominant cover are the MC.4/MC.6 exports used in the fine-level compactification discussion. For degree-d triples in §4.3.2, fix ζ_N over an algebraically closed field k. Yuan permits symplectic similitude multiplier c∈(Z/N)×; his parameter is therefore the finite disjoint union P^d_sim=⊔_c P^d_c, not just the exact c=1 component. Precomposition by diag(c⁻¹I_g,I_g) identifies the c-component with the exact component; precomposition by diag(cI_g,I_g) is the inverse. For every algebraically closed extension F/k, P^d_sim(F) is bijective to isomorphism classes of Yuan’s actual degree-d level-N triples over F. For a general T, use q and its obstruction/torsor of lifts instead. The algebraic Lie/Hodge comparison in Lemma3.4 is imported on its integral Noetherian stable-family bases; its metric assertion is outside this export.

**Hypotheses.** g>1; in the level/Picard clause, N≥3 invertible and primitive ζ_N fixed. The stable extension is after the cover/normalization of MC.6; no moduli interpretation by naive nodal full torsion frames is used. For Lemma3.4 the original base is integral Noetherian; geometric constant-field conventions in §4.3.2 use the chosen embedding k̄→K̄.

**Dependencies.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `StableReductionPartII:MC.4/coarse-space`, `StableReductionPartII:MC.4/full-level`, `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.6/level-stable-compactification`, `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.6/jacobian-hodge-comparison`, `StableReductionPartII:MC.7/level-picard-parameter`, `StableReductionPartII:MC.7/picard-triples-comparison`, `StableReductionPartII:MC.7/actual-triples-groupoid`, `StableReductionPartII:MC.7/lift-obstruction`, `StableReductionPartII:MC.7/lift-torsor`, `StableReductionPartII:MC.7/level-picard-sheaf-comparison`, `JacobianChallengePartII:JC6/picard-lie-cohomology`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `StableReductionPartII:MC.4/projective-coarse`.

**Proof or construction.**

1. Compose the smooth/stable stack universal properties with their coarse classifying maps, keeping the universal family on the stack. MC.4/projective-coarse makes the stable unpointed coarse algebraic space a projective scheme. Its smooth-curve open is the smooth coarse scheme, using coarse restriction under open (hence flat) base change. Apply the exact finite-cover stable-compactification export on each smooth level component; stable boundary existence is a parent supplier, not inferred from the Picard scheme.
2. For a frame η with e(ηv,ηw)=ζ_N^{c⟨v,w⟩}, precompose η with diag(c⁻¹I_g,I_g) to obtain an exact frame; the inverse precomposition gives multiplier c. This works over any base with ζ_N and separates the finitely many constant multiplier components. Apply the same change of frame to the pulled-back universal curves and degree-Picard schemes.
3. For F algebraically closed, use the existing parent geometric-point comparison on each component. Its surjectivity follows by finding an F-point in an fppf cover carrying a lift; uniqueness of the line-bundle class uses Pic(F)=0. Scalar automorphisms remain in the triple groupoid. Disjoint union gives the stated similitude comparison.
4. For arbitrary T apply the exact obstruction and lift-torsor nodes. For Lemma3.4, use JC6 Lie(J/S)≅R¹π_*O and stable-curve duality to obtain π_*ω≅e*Ω¹_J/S and then its determinant. MC.5 owns determinant formation, MC.6 owns the smooth universal comparison; metric compatibility remains the arithmetic/analytic consumer’s work.
5. The routed Picard item requires the geometric triple comparison, not a new proof of Lemma4.8 or a rational-field isotriviality criterion. Do not infer descent of an actual line bundle to a smaller nonclosed field from descent of its sheaf class.

**Acceptance checks.**

* For N=3 there are two multiplier components c=1,2; the exact component alone does not parametrize all the permitted frames.
* Over algebraically closed F the lift-class fibre is a singleton with scalar inertia F×; over T=P¹_C the base-twist test refutes the unqualified global-bundle interpretation.
* In a one-variable function-field application read the bars in k̄ and K̄ geometrically; no rational-field descent theorem is smuggled into the geometric-point bijection.
* The stable family lies over the covering compactification, and the boundary is not claimed to carry ordinary full N-torsion of an abelian Jacobian.
* The determinant Hodge line λ and the rank-g Hodge vector bundle E have distinct types.

**Source.** [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.1 p.41; §3.1.3 Lemma3.4 pp.43–44; pp.45–46 and p.57; §4.3.2 pp.73–75. The routed uses need stack/coarse separation, a covered stable extension, the algebraic Hodge comparison, and Picard parameters for triples allowing all similitude multipliers. [Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8), §8.4 Theorem1 pp.231–232; §9.4 Theorem1 p.259. Lie/cohomology and the stable semiabelian identity component are existing Jacobian/Néron suppliers.

Routed catalogue items: `PAPER-YUAN-26/69`, `PAPER-YUAN-26/85`, `PAPER-YUAN-26/134`, `PAPER-YUAN-26/137`.

## Consumer ownership and composition checks

| Consumer | Added contract | Exact boundary |
| --- | --- | --- |
| Abdurrahman–Venkatesh | Underlying curve and its universal pullback over the Hurwitz groupoid | SymplecticLFunctionsModSquares owns connected G-covers, central deck inertia, cyclotomic twist and the Hurwitz forgetful map |
| Canning–Larson–Payne | Stable pointed stacks, ordered operations and normalized boundary | MotivicStructuresInModuliOfCurves owns STEs, Chow/cohomology push-pull and graph complexes |
| Chen | Smooth M_1,1≃Ell and its coarse scheme via current ModularCurves9E | InverseGaloisAndArithmeticFundamentalGroups:IG.5 owns nonabelian level/Hurwitz and Markoff arithmetic |
| Dimitrov–Gao–Habegger | Fixed-component regular irreducible fine scheme, cartesian Jacobian square and section-free Pic¹ difference | JC0–JC2 own relative Picard/Jacobian constructions; JC5/JC7 own universal Faltings–Zhang; MC.6 owns Torelli |
| Landesman–Litt | Marked-family classification and its dominant-étale versality predicate | MappingClassGroupsAndCanonicalRepresentations owns punctures, analytification, stack fundamental groups and mapping classes |
| Yuan | Stable/coarse separation, covered stable extension, all multiplier components and geometric triple classes | MC.4–MC.6 and JC6/Néron R11.4 own geometric suppliers; arithmetic owners retain metrics and bigness |

For every row, the claimed family comparison is cartesian on all test schemes and natural on arrows. Checking only algebraically closed points is insufficient for that claim. The geometric-point bijection occurs only in the explicitly restricted triple comparison. The actual framed dual-number and P¹ base-twist tests above distinguish these statements.

The six application nodes close the composition specifications at target level. They do not close the imported proofs: parent category-valued descent/DM and pointed/boundary obligations affect the relevant stack exports; R09.5 retains the concrete quotient-stack and algebraic-space coarse comparison bindings for the Chen export; rigidity/connectedness and strong Torelli affect fine-level/DGH; projective coarse and covered stable-extension inputs affect Yuan. The packet records those dependencies directly and retains their gaps. The all-characteristic compactified-Torelli/bigness theorem and Yuan's metric equality are not asserted by these contracts.

## Native suggested-file coverage

The standard compact shape is used: four real-bodied light definitions, two comparison statements and four examples. `representedFppf` uses the actual subcanonical fppf Yoneda sheaf of a supplied scheme; `parameterFiber` is its actual point fibre over a prescribed morphism. Neither supplies the particular M or P^d. `lineGroupoid` is the actual core of the pinned invertible-sheaf category; `lineClass` uses the actual pinned skeleton map. The two comparison statements identify equality of absolute classes with existence of a groupoid arrow, and tensor classes with the native multiplication. These are carrier checks, not the degree-Picard representability theorem.

The four examples check restriction by scheme composition, the equation defining a parameter fibre, the trivial line-bundle class, and the passage from an actual isomorphism to a groupoid arrow. All use the native carriers. The file elaborated with `lean-check` at the two recorded pins on 2026-10-18, with six expected placeholder-proof warnings and no errors or other warnings. No mathematical proof completion is claimed.

The following names are full reader targets without Lean declarations at the pins:

* `fineFamily_functions` (StableReductionPartII:MC.7/fine-family-functions): The required native smooth-projective genus-g level-family predicate and universal family are not at the pins.
* `levelPicard_representedComparison` (StableReductionPartII:MC.7/level-picard-sheaf-comparison): The relative degree-d fppf Picard sheaf and its represented scheme are owner targets, not pinned carriers.
* `actualTriples_stackAndClass` (StableReductionPartII:MC.7/actual-triples-groupoid): The varying curve/level groupoid, degree predicate, actual line-bundle pullback and their stack comparison are not supplied at the pins.
* `picardLift_groupoid` (StableReductionPartII:MC.7/lift-gerbe): Requires the actual relative class map and its native groupoid fibre on Sch/T.
* `picardLift_obstruction` (StableReductionPartII:MC.7/lift-obstruction): Requires the geometric G_m sheaf and actual fppf site pushforward/class comparison; an arbitrary H²-valued function is not this boundary.
* `picardLift_classesTorsor` (StableReductionPartII:MC.7/lift-torsor): Requires actual Pic(T) and relative class fibre with its pullback tensor action. The current library group exists after the pin; the pin supplies only the class monoid.
* `picardLift_neutralization` (StableReductionPartII:MC.7/lift-torsor): Requires actual line-bundle pullback and its fully faithful comparison, not an assumed abstract groupoid equivalence.
* `picard_fixedCurveInfinitesimals` (StableReductionPartII:MC.7/infinitesimal-points): Requires the actual relative Picard scheme and its dual-number reduction map, plus the coherent-cohomology comparison.
* `consumer_av_contract` (StableReductionPartII:MC.7/consumer-av): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_clp_contract` (StableReductionPartII:MC.7/consumer-clp): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_chen_contract` (StableReductionPartII:MC.7/consumer-chen): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_dgh_contract` (StableReductionPartII:MC.7/consumer-dgh): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_landesman_litt_contract` (StableReductionPartII:MC.7/consumer-landesman-litt): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.
* `consumer_yuan_contract` (StableReductionPartII:MC.7/consumer-yuan): Requires the exact native moduli stacks/schemes, family equivalences and morphisms in this consumer composition; none is replaced with proposition fields.

Every API item and discriminating test of the three new definitions/constructions remains specified in its target above. Their absence from the compact file is a carrier limitation recorded by name, not an abstract proposition field or a model of a different problem. The current library's newer absolute Picard group and rigidified functor are credited, while the file remains pinned.

## Gaps, import requests and acceptance

**Generic proper-flat quotient in the Picard representability proof.** BLR8.2/12 has been read, and its Hilbert-scheme/graph-descent proof is traced to the R09.2/R09.3 owners. The current exact finite-quotient comparison has a narrower domain. The R09.3 request specifies the missing generic target with every hypothesis; until that owner supplies it, this transitive proof chain is a planned import rather than closed.

**Native geometric carriers and comparison proofs at the atlas pins.** The pinned Scheme fppf topology, represented sheaves, Core of native invertible sheaves and absolute class comparison elaborate in the compact suggested file. The pins lack the specified smooth-curve/level moduli, relative Picard degree sheaf with representability, relative class map on native line bundles, geometric G_m and Leray site bridge, and their degree/lift/deformation comparison interfaces. Abstract sheaf cohomology already exists and is owned by SF.2; it is not a missing general H² theory. The README gives actual intended carriers and named unexpressed targets, including Pic(T)-torsor and framed dual-number fibres. Native construction of these suppliers is required before those signatures can be stated; synthetic models are not substitutes.

**Inherited category-valued curve, level and Torelli supplier closure.** The six exports are mathematical compositions of exact existing nodes, not proofs of every supplier. The parent still records category-valued arbitrary-base curve-family descent/DM representability, pointed induction and integral boundary-normalization inputs; full-level Serre rigidity and Teichmüller/symplectic monodromy ownership; the concrete quotient-stack and algebraic-space coarse bindings retained by R09.5 for the level3/4 elliptic charts; and the strong-Torelli sign/hyperelliptic owner extension. Generic JC0 remains independent of fine-level moduli; no JC7 universal-level node is used to found MC.4. These owner proof obligations are retained with their precise application scopes in consumerContracts and the reader.

**Inherited stable extension, projective coarse and stable Hodge supplier closure.** Yuan’s stable-family export additionally depends on MC.4/projective-coarse and MC.6/level-stable-compactification: the parent records their integral relative-Serre/fixed-determinant and finite-cover graph/normalization inputs. The stable Hodge clause imports JC6 and Néron R11.4, whose all-geometric-nodal normalization bridge remains an owner obligation. The all-characteristic compactified-Torelli/Hodge-bigness theorem and the metric part of Yuan Lemma3.4 are not required by the four routed moduli items and are not asserted closed here.

The eleven supplier requests are the new proper-flat quotient proof input and ten existing-owner import contracts. They are listed precisely here so that an implementation does not mistake a stage citation for a built declaration.

* `AlgebraicModuliForArithmeticGeometry:R09.3`: Supply the proper-flat effective quotient used in BLR8.2 Theorem12 pp.220–221, restricted to Noetherian S as needed by JC0: X→S strongly quasi-projective, R⇉X a proper flat finitely presented equivalence relation with finitely many fibre Hilbert polynomials for a chosen finite-rank vector-bundle projective embedding. Construct X/R as the fppf sheaf quotient, strongly quasi-projective over S, with X→X/R strongly projective faithfully flat and R≅X×_{X/R}X. Derive it from R09.2 Hilbert representability plus descent of the graph/ideal along the universal relation. R09.3/r093-finite-quotient-comparison is limited to finite locally free relations and does not cover the positive-dimensional divisor fibres. This is a proof-input extension; JC0 Picard representability, degree components and torsors are already planned and are not requested again.
* `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`: Import its prestable-family universal-functions contract, including the quantification over every scheme base change. The all-base criterion is independently checked against Stacks0E0L here; no new stable-curve definition is requested.
* `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`: Import the existing absolute Picard group/line-bundle tensor convention; current Tau Ceti already implements the group, while only its commutative monoid is present at the compilation pin. Do not replan inverses or base-line-bundle classes.
* `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`: Import dim_k H¹(C,O_C)=g, fibre duality, and H²=0 for proper smooth curves, used for fixed-curve infinitesimals and the already owned Picard proof.
* `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`: Import the pointed Weierstrass-presentation theorem and the unique-variable-change description of pointed isomorphisms. The canonical group law and its uniqueness are imported separately from ModularCurves1D and2D.
* `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`: Import the canonical scheme-level elliptic group law on a pointed Weierstrass family, descended through the 1C presentation, with identity, inverse and arbitrary-base-change compatibility.
* `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`: Import only KM2.5.1 (isGroupHom_of_mapsZero): pointed scheme morphisms between elliptic families are uniquely group homomorphisms. Its application to the identity proves uniqueness of the compatible group structure; do not reconstruct the genus-one Picard-duality package here.
* `tauceti:TauCetiRoadmap/ModularCurves#4a-moduli-problems-over-ellr`: Import the existing category fibred in groupoids of elliptic curves over coefficient rings; identify it with the parent smooth M_1,1 via the marked identity.
* `tauceti:TauCetiRoadmap/ModularCurves#4b-the-weierstrass-presentation`: Import effective local Weierstrass presentation/descent of elliptic families and their arrows. The comparison transports the marked universal family, not only geometric isomorphism classes.
* `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`: Import current upstream IsCoarseJLine/coarseJLine over each coefficient ring, with its classifying map and j normalization. Import R09.5/elliptic-coarse-recovery and coarse-j-line-recovery, using the SF.1 finite-quotient-coarse algebraic-space universal property on the level3/4 charts, before applying uniqueness to the parent coarse algebraic space. The invariant-ring theorem is existing upstream work and is not replanned.
* `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Import relative stable-curve duality, rank/base-change for R¹f_*O and f_*ω, and the algebraic Hodge duality used in the existing Jacobian comparison. Metric equalities are not part of this import.

Acceptance requires the genuine represented-sheaf comparison on arbitrary test schemes; the scalar, base-twist, pointed-normalization and genus-two infinitesimal checks; the cohomological boundary and correct nonempty-torsor hypothesis; all six consumer maps with their level/marking/base restrictions; exact existing-owner imports; and native interface elaboration once those geometric carriers are supplied. No generic owner theory is duplicated in MC.7.

Four new planets are Picard stack of level triples, Picard lifting obstruction, Picard torsor of lifts, and Infinitesimal Picard points. Together with the parent MC.7 planets they remain within the six-planet limit; no layer restructure is proposed.

## Source versions and reading limits

All sources below were read on 2026-10-18 at the bounded target locators, in the named versions. These are target receipts rather than section summaries. No source passage is reproduced. BLR was read in the maintainer-cleared original; the reference URL identifies the work and makes no claim that it is freely downloadable. No other copy of a restricted book was used.

* **[Néron Models](https://link.springer.com/book/10.1007/978-3-642-51438-8)**, Siegfried Bosch; Werner Lütkebohmert; Michel Raynaud. Springer, 1990; maintainer-cleared original, printed page numbers. Read: §8.1 Proposition 4 pp.204–205 and universal cohomological flatness pp.205–206; §8.2 Theorems 1,5,8,12, Lemma 6 and Proposition 7, pp.210–221; uniform regularity Proposition 10 pp.217–218; §8.4 Theorem 1 and Proposition 2 pp.231–232; §9.2 Corollary 13 p.251; §9.3 Theorem 1 and Remark 2 p.252; §9.4 Theorem 1 p.259 and Proposition 4/proof p.260.
* **[The Stacks Project: Picard and curve interfaces](https://stacks.math.columbia.edu)**, The Stacks Project Authors. Online version read 2026-10-18; tags are permanent locators. Read: Lemma 36.32.6 tag 0E0L, proof via Lemma 36.32.5 tag 0E62 and Lemma 33.9.3(7) tag 0BUG; Lemma 108.9.1 tag 0DME, local-object and local-isomorphism proof; Lemma 109.11.2 tag 0E6L, arbitrary-base-change cohomology for reduced connected curves.
* **[Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://arxiv.org/pdf/2303.13436v1)**, Amina Abdurrahman; Akshay Venkatesh. arXiv:2303.13436v1, 2023. Read: §§5.1–5.2 pp.39–41, including Example 5.1. SHA-256: `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306`.
* **[Extensions of tautological rings and motivic structures in the cohomology of M̄_g,n](https://arxiv.org/pdf/2307.08830v3)**, Samir Canning; Hannah Larson; Sam Payne. arXiv:2307.08830v3. Read: Introduction pp.1–2; §2.1 pp.4–5. SHA-256: `fa320b35fc8b063ac09335da85ed133329dfbef1357b78f22d0a8d58ad5107a1`.
* **[Nonabelian level structures, Nielsen equivalence, and Markoff triples](https://arxiv.org/pdf/2011.12940v2)**, William Chen. arXiv:2011.12940v2, June 2021; catalogue key PAPER-CHEN-24. Read: Introduction pp.2–3, M(1) as the coarse scheme of M_1,1. SHA-256: `f60283b0b406554c064e3135b18d4446617aed05eb74f7b8d7b66a2f453980cc`.
* **[Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3)**, Vesselin Dimitrov; Ziyang Gao; Philipp Habegger. arXiv:2001.10276v3, 31 March 2021. Read: §6.1 pp.23–24: level moduli, relative Jacobian, diagram (6.1), Pic¹ and difference. SHA-256: `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`.
* **[Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4)**, Aaron Landesman; Daniel Litt. arXiv:2205.15352v4. Read: Notation 1.10.1–1.10.3 pp.10–11. SHA-256: `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`.
* **[Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf)**, Xinyi Yuan. Author manuscript, 21 August 2024; no claim of collation with Annals 203 (2026). Read: §3.1.1 p.41; §3.1.3 Lemma 3.4 pp.43–44; Fine-level/stable-compactification discussion pp.45–46; use of van Geemen–Oort Theorem 2.1 p.57; §4.3.2 pp.73–75, degree-d triples and their geometric-point comparison; overlines checked visually. SHA-256: `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.
* **[Tau Ceti roadmaps: existing curve, bundle and modular-curve owners](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27)**, Tau Ceti contributors. TauCetiRoadmap main commit 0d144d044dacebca17b654695b6f1ad58f159b27, read 2026-10-18. Read: JacobianChallenge README Layers A–F; StableReduction README Layers 2–3; AlgebraicVectorBundles README L0A–L0C and Suggested.lean: tensor, pullback, dual and coherence ownership; ModularCurves README 1C,1D,2D,4A,4B,9D,9E and Suggested.lean coarseJLine_int/coarseJLine: existing elliptic-family and coarse-j-line targets.

The source-issue list is empty for these bounded readings: no new source error is asserted. The use of a sheaf in place of an unqualified general-base triple functor is a necessary qualification, and Yuan explicitly suffices with the algebraically closed comparison. The named author/preprint copies have not been collated against their published versions. Existing parent errata and supplier gaps are neither deleted nor re-adjudicated by this continuation.
