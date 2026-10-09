# R09.5. Coarse spaces and rigidification

An arithmetic moduli stack carries both families and their automorphisms. Its coarse space is a universal algebraic space for maps out of the stack, with the same isomorphism classes over algebraically closed fields. Rigidification removes a specified normal part of the automorphisms while retaining a stack. Auxiliary level structures instead change the objects and restrict their automorphism groups. These three operations have different descent and base-change properties. This layer gives the interfaces needed to pass between them and to extend finite arithmetic correspondences.

The plan has 24 targets and key results, with five new definitions or constructions, 29 API entries, 20 definition tests and six planets. R09.5 is **planned**. The planning pass is complete; the mathematical implementation and the supplier obligations listed below remain unchecked. No target is called closed merely because its signature elaborates.

## Ownership, notation and base change

Work over a scheme S. All stack morphisms and fibre products retain their 2-isomorphisms. Aut_T(x) denotes the entire automorphism sheaf of x over T. A quotient of Isom or automorphism sheaves means the fppf sheaf quotient, not the quotient of the global section sets. Normality permits noncentral subgroups. Finite maps of stacks in a correspondence are representable by algebraic spaces and finite on every test-scheme base change.

The current foundational owner is `SchemeAndStackFoundations:SF.1`. Its nodes supply the definition of coarse moduli space, the finite-inertia Keel–Mori theorem, tame stacks and their local structure. Those targets are imported here. The accepted predecessor packet owns the affine-gerbe leaf `AlgebraicModuliForArithmeticGeometry:R09.5/affine-kernel-rigidification`; the comparison below reuses it. Concrete elliptic rigidifiers, coarse schemes, the j-line and smooth affine relative-curve finite quotients are imported from the current **ModularCurves4C/9D/9E**, not reconstructed.

| Imported owner | Contract used in this layer |
| --- | --- |
| `SchemeAndStackFoundations:SF.1/coarse-moduli-space` | Coarse definition, all algebraic-space targets, geometric-point condition, uniqueness and uniform flat pullback. |
| `SchemeAndStackFoundations:SF.1/keel-mori` | Finite-inertia existence, proper quasi-finite coarse morphism, separated/local finite-type coarse target, O_M≅π_*O_X and flat coarse base change. |
| `SchemeAndStackFoundations:SF.1/tame-stack` | Exact QCoh coarse pushforward and general-base stabilizer linear reductivity. |
| `SchemeAndStackFoundations:SF.1/tame-local-structure` | AOV local finite linearly reductive quotient presentations, arbitrary tame coarse base change and coarse flatness. |
| `SchemeAndStackFoundations:SF.1/finite-group-quotient` | AF finite constant-group scheme quotient. |
| `SchemeAndStackFoundations:SF.1/finite-quotient-coarse` | A finite quotient scheme is also the uniform coarse algebraic space of the quotient stack. |

For the imported Keel–Mori theorem, X is algebraic and locally of finite presentation over S and I_X→X is finite. Its coarse morphism π is proper and quasi-finite, O_M→π_*O_X is an isomorphism, M is separated when X is separated, and M is locally of finite type when S is locally Noetherian. The broad diagonal scope is the SF.1 contract, sourced there to Rydh. The author copy of Conrad, Theorem 1.1, pp.1–2, assumes quasi-compact separated diagonal; it must not silently stand in for the broad theorem.

For the imported tame theorem, X has finite inertia and exact QCoh coarse pushforward. AOV, Theorem 3.2 and Corollary 3.3, pp.1077–1078, identify this with geometric linear reductivity, local finite linearly reductive quotient presentations and arbitrary coarse base change. The general-base finite flat group theory is owned by SF.1. Tau Ceti’s existing linear reductivity predicate applies to affine group schemes over a field and cannot substitute for that general-base theory.

| Operation | Base-change guarantee | Extra condition |
| --- | --- | --- |
| General finite-inertia coarse space | Flat pullback | The finite-inertia existence hypotheses |
| Tame finite-inertia coarse space | Arbitrary pullback on the coarse space | Tameness of the source |
| Rigidification by G | Arbitrary base change with G pulled back | G is closed, flat and finitely presented |
| Ordinary normalization | Smooth pullback and open restriction | Locally finite components; Nagata for finiteness |
| Quasi-compact schematic image | Flat pullback | Quasi-compactness of the map |

Current upstream `TauCetiRoadmap` main was inspected at `3b51bbf9a925f23bca922570bea8d641b6ec712d`, including the nine roadmaps absent from the atlas snapshot. Current Tau Ceti was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The executable prototypes use the required pinned commits: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

## Rigidification and vertical inertia

### Normal inertia subgroups

Target `AlgebraicModuliForArithmeticGeometry:R09.5/normal-inertia-subgroup`; proposed name `TauCeti.ArithmeticModuli.NormalInertiaSubgroup`.

For an algebraic stack X locally of finite presentation over S, a rigidifiable inertia subgroup is a closed subgroup G⊂I_X that is flat and finitely presented over X. For every T→X represented by x, it yields G_x⊂Aut_T(x); every base change identifies the pulled-back subgroup, and every isomorphism x≅y conjugates G_x onto G_y. In particular G_x is normal; centrality is not required. The site-level carrier records normal subgroups of native Aut groups, conjugation, restriction and fppf local membership, with the closed/flat/finitely-presented representability conditions imposed at the algebraic-stack interface.

**Hypotheses.** X is algebraic and locally of finite presentation over S. G is a representable closed subgroup of inertia, flat and finitely presented over X.

**Construction or proof.**

1. Use SF.1/inertia to identify the stabilizer over each object.
2. Pull back the subgroup along every test-scheme arrow, including isomorphisms; compatibility under automorphisms implies normality.
3. Membership is local for the fppf topology because G is a subgroup sheaf; retain this locality in the native pseudofunctor interface.

**API.** Names below are in `TauCeti.ArithmeticModuli`.

- `NormalInertiaSubgroup.subgroup` (projection): Evaluate G at a test object to obtain the subgroup of its native automorphism group.
- `NormalInertiaSubgroup.conjugation` (compatibility): For e:x≅y, transport by Aut.autMulEquivOfIso e maps G_x exactly onto G_y.
- `NormalInertiaSubgroup.restrict_mem` (functoriality): Restriction of an automorphism in G_x belongs to the subgroup at the restricted object.
- `NormalInertiaSubgroup.local_mem` (characterisation): Membership in G_x is equivalent to membership after every arrow of a covering sieve.
- `NormalInertiaSubgroup.bottom` (constructor): The identity subgroup gives a rigidifiable subgroup of every algebraic stack.
- `NormalInertiaSubgroup.top` (constructor): The entire inertia is rigidifiable when the inertia itself is flat and finitely presented.

**Definition tests.**

- `NormalInertiaSubgroup.test_bottom`: In the bottom subgroup, a∈G_x iff a=1.
- `NormalInertiaSubgroup.test_noncentral`: On B(S_3) over a field, the full inertia is allowed although a transposition is not central.
- `NormalInertiaSubgroup.test_not_normal`: The subgroup generated by (0 1) in S_3 is not normal and cannot define a conjugation-compatible inertia subgroup of B(S_3).
- `NormalInertiaSubgroup.test_base_change`: For Bμ_p in characteristic p, the entire finite flat inertia satisfies arbitrary test-scheme restriction, including nonreduced test schemes.

**Uses determining the API.** AOV08 Theorem A.1: Determines exactly which stabilizers are removed by rigidification. Vertical-kernel factorization below: Separates the subgroup geometry from the representability conclusion.

**Acceptance.** Accept varying subgroup schemes and noncentral normal subgroups. A finite relative inertia kernel is not automatically flat; it can be used here only after flatness and finite presentation are checked.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/inertia`, `SchemeAndStackFoundations:SF.1/algebraic-stack`, `mathlib:CategoryTheory.Aut`, `mathlib:CategoryTheory.Functor.mapAut`, `mathlib:CategoryTheory.Aut.autMulEquivOfIso`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:CategoryTheory.IsGroupoid`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Appendix A, setup before Theorem A.1, pp.1086–1087: A flat finitely presented inertia subgroup is equivalent to compatible subgroup families; isomorphism compatibility forces normality.

### Rigidification of an algebraic stack

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`; proposed name `TauCeti.ArithmeticModuli.Rigidification.stack`.

Given X and a rigidifiable G⊂I_X, construct X▹G by replacing the Isom sheaf between x and y over T by its fppf quotient Isom_X(x,y)/G_x, where G_x acts by precomposition, and then stackifying the resulting prestack. Normality identifies the right and left actions and makes composition well defined. The map ρ:X→X▹G has the same locally presented objects and kills precisely G. X▹G is an algebraic stack locally of finite presentation over S. The sheaf quotient is essential: its T-sections need not equal the quotient of the T-section sets.

**Hypotheses.** The hypotheses of normal-inertia-subgroup. All Hom quotients are taken as fppf sheaves before object descent.

**Construction or proof.**

1. Define the normal Hom congruence using precomposition, with coherence under every restriction. Use native CategoryTheory.Quotient only for its fibrewise precursor.
2. The free G_x-action on the Isom algebraic space has an algebraic-space fppf quotient; use SF.1 categorical quotient descent.
3. Sheafify quotient morphisms, then use SF.1/stackification for effective object descent.
4. An fppf local lift identifies a fibre with BG_x. Algebraicity follows from SF.1/algebraic-stack and the gerbe atlas; smoothness of the gerbe is treated below.

**API.** Names below are in `TauCeti.ArithmeticModuli`.

- `Rigidification.stack` (constructor): Construct the groupoid-valued stack X▹G.
- `Rigidification.map` (constructor): The restriction-compatible morphism ρ:X→X▹G.
- `Rigidification.quotientHom` (data): The fppf quotient sheaf Isom_X(x,y)/G_x on the slice over the test object.
- `Rigidification.homSheaf` (equivalence): For lifted x,y, Isom_{X▹G}(ρx,ρy) is isomorphic to Rigidification.quotientHom x y.
- `Rigidification.locallyObjects` (characterisation): Every object of X▹G lifts to X on a covering sieve.
- `Rigidification.isStack` (instance): The constructed pseudofunctor has effective object descent and Hom sheaves; its fibres are groupoids.

**Definition tests.**

- `Rigidification.test_trivial`: Rigidifying by the identity inertia subgroup is equivalent to X.
- `Rigidification.test_cyclic_four`: For the constant cyclic group C4 and its order-two subgroup, BC4▹C2≃BC2; one residual order-two automorphism remains.
- `Rigidification.test_mu_p`: In characteristic p, Bμ_p▹μ_p≃Spec(k), although μ_p is not smooth.
- `Rigidification.test_sheaf_quotient`: For the squaring quotient G_m/μ_2 over R, the fppf quotient is G_m and -1 is a quotient section although it has no square root in R. Sectionwise cosets do not give the quotient sheaf.

**Uses determining the API.** Rom05 Theorem 5.1: Gives universal factorization of stack morphisms killing a fixed compatible subgroup. AOV08 Proposition 3.6: Removes selected stabilizers before constructing local finite quotient presentations. Finite correspondences below: Provides the representable remainder only under flat relative inertia hypotheses.

**Acceptance.** Do not replace the stack by an orbit set. The quotient on global sections is asserted only for point-site fixtures, never for an arbitrary test scheme.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/normal-inertia-subgroup`, `SchemeAndStackFoundations:SF.1/stackification`, `SchemeAndStackFoundations:SF.1/categorical-geometric-quotient`, `SchemeAndStackFoundations:SF.1/algebraic-stack`, `mathlib:CategoryTheory.Quotient`, `mathlib:CategoryTheory.Quotient.lift`, `mathlib:CategoryTheory.Pseudofunctor.sheafHom`, `SchemeAndStackFoundations:SF.1`, `mathlib:CategoryTheory.IsGroupoid`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1 and proof, pp.1087–1089: Quotient Isom sheaves are composed and stackified; the resulting algebraic stack has the prescribed stabilizer kernel.

### Universal property of rigidification

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal`; proposed name `TauCeti.ArithmeticModuli.Rigidification.universal`.

For every stack Y in groupoids over S, precomposition with ρ induces an equivalence of Hom groupoids Hom_S(X▹G,Y) ≃ Hom_S(X,Y)_{G=1}, where the right side is the full subgroupoid of morphisms whose induced automorphism maps kill G on every test object. Thus such a morphism has a factorization together with a comparison 2-isomorphism; the groupoid of factorizations with that fixed comparison is contractible. This is a statement about morphisms and compatible 2-morphisms, not equality of chosen factors.

**Hypotheses.** X,G,ρ as in rigidification. Y satisfies stack descent; algebraicity of Y is unnecessary.

**Construction or proof.**

1. A G-killing functor factors on every quotient Hom sheaf; its restriction coherence descends.
2. Apply stackification universality to extend to objects and morphisms of X▹G.
3. Modifications descend because they satisfy the same Hom-sheaf compatibility. Full faithfulness gives uniqueness relative to the supplied comparison.

**Acceptance.** Retain nontrivial automorphisms of factors and comparison 2-isomorphisms. A target algebraic space is one special case, not the universal target class.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `SchemeAndStackFoundations:SF.1/stackification`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans`, `mathlib:CategoryTheory.Pseudofunctor.StrongTrans.Modification`, `mathlib:CategoryTheory.Quotient.lift`.

**Sources.** [Rom05](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf), Theorem 5.1(i) and proof, pp.224–225: Universal factorization for a compatible fixed subgroup; the general varying subgroup is supplied by AOV. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Appendix A quotient-Hom construction and Remark A.2, pp.1087–1089: The construction and uniqueness imply the full stack-valued universal property when combined with stackification.

### Stabilizers after rigidification

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`; proposed name `TauCeti.ArithmeticModuli.Rigidification.stabilizer_kernel`.

For x∈X(T), the map Aut_T(x)→Aut_T(ρx) is an epimorphism of fppf group sheaves with kernel G_x; consequently Aut_T(ρx)≅Aut_T(x)/G_x as fppf sheaves. This need not be a surjection on T-valued automorphisms.

**Hypotheses.** X,G,ρ as in rigidification.

**Construction or proof.**

1. Specialize the quotient-Hom formula to x=y.
2. Identify the identity fibre with G_x by the normal congruence.
3. The quotient-sheaf construction gives local surjectivity; multiplication is inherited from composition.

**Acceptance.** BC4/C2 has residual stabilizer C2. The G_m/μ_2 example prevents a global-section surjectivity claim.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `mathlib:CategoryTheory.Quotient.functor_map_eq_iff`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1(b), p.1087: Stabilizer map is surjective as a sheaf with the chosen kernel.

### Geometry of the rigidification morphism

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-geometry`; proposed name `TauCeti.ArithmeticModuli.Rigidification.geometry`.

ρ is an fppf gerbe, smooth and of finite presentation as a morphism of algebraic stacks. It is proper when G→X is finite, and étale when G→X is étale. If X is Deligne–Mumford, then X▹G is Deligne–Mumford and ρ is étale. Smoothness of ρ does not say that G is smooth or that ρ is representable. When G is nontrivial, ρ is not representable.

**Hypotheses.** X,G,ρ as in rigidification. The proper and étale assertions have the extra subgroup hypotheses stated.

**Construction or proof.**

1. After an fppf local lift y=ρx, identify X×_{X▹G}T with BG_x, as in AOV pp.1088–1089.
2. Apply the classifying-stack geometry supplied by SF.1; B of a flat finitely presented group is smooth as a stack even if its torsor atlas is merely flat.
3. For finite G use finite diagonal and universal closedness of the gerbe to get properness. For étale G use étale stack charts.
4. For a DM source its flat finitely presented inertia subgroup is unramified and hence étale; the quotient Isom spaces remain unramified.

**Acceptance.** Bμ_p→Spec(k) is a smooth stack morphism in characteristic p. BC2→Spec(k) is an étale gerbe with nontrivial inertia, not a representable finite étale morphism.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1(a) and final paragraph, pp.1087–1089: Gerbe description and local BG model give smoothness; finite and étale subgroup cases give proper and étale maps. [Rom05](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf), Theorem 5.1(ii)–(iii), pp.224–225: DM and properness assertions for the fixed-subgroup case.

### Base change of rigidification

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`; proposed name `TauCeti.ArithmeticModuli.Rigidification.base_change`.

For any morphism S′→S, (X×_S S′)▹(G×_S S′)≃(X▹G)×_S S′, compatibly with ρ and quotient Hom sheaves. More generally, pulling the gerbe ρ back along T→X▹G gives the rigidification by the pulled-back subgroup. No flatness or tameness assumption on S′→S is needed.

**Hypotheses.** X,G,ρ as in rigidification. The subgroup is pulled back with the stack, not held fixed as a group of global sections.

**Construction or proof.**

1. Flatness and finite presentation of the subgroup survive arbitrary base change.
2. Compare quotient Hom sheaves and use effective stack descent; alternatively use the universal property on the base-changed gerbe.
3. The comparison respects the map from X and is unique relative to it.

**Acceptance.** Specialize to a nonreduced base extension. Keep this assertion distinct from the flat-only base-change theorem for a general coarse space.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-geometry`, `SchemeAndStackFoundations:SF.1/two-fibre-product`.

**Sources.** [Rom05](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf), Theorem 5.1, last assertion before the proof, p.224: Fixed-subgroup rigidification commutes with base change. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Appendix A, pp.1087–1089: The subgroup-family and quotient-sheaf construction gives the varying-subgroup comparison.

### Nested rigidifications

Target `AlgebraicModuliForArithmeticGeometry:R09.5/nested-rigidification`; proposed name `TauCeti.ArithmeticModuli.Rigidification.nested`.

Suppose H⊂G⊂I_X are compatible closed normal subgroup stacks flat and finitely presented over X, and the descended quotient G/H on X▹H is also closed, flat and finitely presented. Then (X▹H)▹(G/H)≃X▹G, compatibly with the maps from X. On stabilizers the composite removes exactly G; the order of removal is governed by H⊂G and cannot be interchanged for arbitrary unrelated subgroups.

**Hypotheses.** Both rigidifications are defined with the listed geometric subgroup conditions.

**Construction or proof.**

1. Use the first quotient-Hom formula to identify the residual subgroup G/H.
2. A stack morphism from X kills G iff it factors through X▹H and kills G/H.
3. Apply the universal property twice, including the factor comparison 2-isomorphisms.

**Acceptance.** For C8 with subgroups C2⊂C4, two successive quotients give BC2, matching BC8▹C4.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Appendix A construction and Remark A.2, pp.1087–1089: Successive normal Hom quotients and uniqueness yield this formal consequence; it is not separately numbered in the source.

### Coarse spaces are preserved by rigidification

Target `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse`; proposed name `TauCeti.ArithmeticModuli.Rigidification.coarse`.

X admits a coarse moduli space π:X→M iff X▹G does; the same M works, and π factors through ρ. The two coarse morphisms have the same universal algebraic-space targets and geometric isomorphism classes. This does not make X▹G fine: it can retain stabilizers and nontrivial forms.

**Hypotheses.** X,G,ρ as in rigidification. Coarse moduli space means the SF.1 definition, universal among all algebraic spaces.

**Construction or proof.**

1. Every map to an algebraic space kills all automorphisms, so the universal property identifies the categories of such maps.
2. Over an algebraically closed field, an fppf gerbe with a flat finitely presented band has a local lift and a rational point on a nonempty finite-type local cover; its objects form one isomorphism class over each image.
3. Combine categorical universality and the geometric-point bijection.

**Acceptance.** BC4▹C2 still has coarse Spec(k) and residual C2. A common coarse space supplies no universal elliptic family.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-geometry`, `SchemeAndStackFoundations:SF.1/coarse-moduli-space`.

**Sources.** [Rom05](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf), Theorem 5.1(iv), pp.224–225: The original and rigidified stacks have the same coarse moduli space. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1 and Remark A.2, pp.1087–1089: The gerbe and universality extend the same conclusion to varying normal subgroup stacks.

### Rigidification by vertical inertia

Target `AlgebraicModuliForArithmeticGeometry:R09.5/vertical-kernel-rigidification`; proposed name `TauCeti.ArithmeticModuli.Rigidification.vertical_kernel`.

For a morphism f:X→Y of algebraic stacks, let G=I_{X/Y}=ker(I_X→f*I_Y). If this kernel is a closed subgroup flat and finitely presented over X, there is a factorization X→X▹G→Y with a comparison 2-isomorphism, and the final map is representable by algebraic spaces. The rigidification has the universal property of killing the vertical inertia. No such factorization by this construction is asserted when the relative inertia is not flat.

**Hypotheses.** X is locally of finite presentation over S. G=I_{X/Y} has the stated closedness, flatness and finite-presentation conditions. Y is algebraic.

**Construction or proof.**

1. Kernel normality and base-change compatibility put G in normal-inertia-subgroup.
2. f kills G, hence factors by the universal property.
3. On the quotient stabilizer sheaves the remaining map is injective on every test scheme. Its base change to any scheme over Y is an algebraic stack with trivial inertia, hence an algebraic space by SF.1/setoid-criterion. This proves the representability definition; geometric-point injectivity alone is insufficient.

**Acceptance.** For BC4→BC2 induced by the quotient, the final factor is BC2→BC2. For a monomorphism of groups, the kernel is trivial and the original classifying-stack map is representable. Finite inertia alone is insufficient to justify flatness of G.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/normal-inertia-subgroup`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-universal`, `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`, `SchemeAndStackFoundations:SF.1/inertia`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`, `SchemeAndStackFoundations:SF.1/setoid-criterion`, `SchemeAndStackFoundations:SF.1/two-fibre-product`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1(b), p.1087: The subgroup quotient has exactly the specified stabilizer kernel. [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Lemma 101.6.2 (04YY), §6: Representability is equivalent to trivial relative inertia, using automorphism sheaves on all test schemes.

### Recovery of affine-kernel gerbe rigidification

Target `AlgebraicModuliForArithmeticGeometry:R09.5/affine-gerbe-recovery`; proposed name `TauCeti.ArithmeticModuli.Rigidification.affine_gerbe`.

For a morphism of affine fpqc gerbes over a field, when its stabilizer kernel is flat and finitely presented so that the general construction applies, the intermediate affine gerbe of R09.5/affine-kernel-rigidification is equivalent to X▹G, with the same factorization and quotient Isom sheaves. The comparison imports the prior affine construction and its field-extension descent. It does not assert that every representable final gerbe morphism is full on Isom sheaves.

**Hypotheses.** The hypotheses of the imported affine-kernel node. The kernel additionally meets the general rigidification subgroup hypotheses.

**Construction or proof.**

1. On a common fpqc neutralizing field extension both constructions quotient the same normal stabilizer subgroup.
2. Compare their quotient Isom sheaves and factor comparisons.
3. Descend the equivalence by the imported affine-gerbe descent and universal property.

**Acceptance.** The C4→C2 quotient retains residual C2. A faithful group inclusion gives a representable remainder without a surjection of all Isom sheaves.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/vertical-kernel-rigidification`, `AlgebraicModuliForArithmeticGeometry:R09.5/affine-kernel-rigidification`.

**Sources.** [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Appendix A, pp.1087–1089: The general quotient-Hom construction specializes to the affine neutral model; the earlier packet owns that specialization.

### Auxiliary levels and stabilizer quotients

Target `AlgebraicModuliForArithmeticGeometry:R09.5/auxiliary-level-comparison`; proposed name `TauCeti.ArithmeticModuli.auxiliary_level_comparison`.

A representable auxiliary-level morphism p:L→X identifies Aut(ℓ) with the stabilizer subgroup of Aut(pℓ) preserving the chosen level. It removes automorphisms by taking a subgroup and changes the objects; rigidification X→X▹G keeps locally lifted objects and takes the quotient Aut(x)/G_x. These operations coincide only after an additional comparison is proved. A rigidifier with trivial level-preserving automorphisms gives an algebraic-space moduli object if its full sheaf-valued inertia is trivial, but a coarse space merely records geometric isomorphism classes. Concrete elliptic rigidifiers are imported from ModularCurves4C; abelian and PEL levels remain downstream consumers.

**Hypotheses.** p is representable; all automorphism assertions are about sheaves. To infer an algebraic space, trivial inertia is proved on all test schemes.

**Construction or proof.**

1. Apply representability to inject Aut(ℓ) into Aut(pℓ) and identify the preserving subgroup using the moduli definition.
2. Compare with the epimorphism and kernel for rigidification.
3. Use SF.1/setoid-criterion only after the full inertia vanishes; import the concrete representability and Galois-rigidifier hypotheses from ModularCurves4C.

**Acceptance.** Spec(k)→BC2 is a finite étale representable level cover; BC2→Spec(k) is a nonrepresentable gerbe. Equal coarse j-invariants of quadratic twists do not identify their families over k. Do not call the Legendre family a Galois rigidifier.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`, `SchemeAndStackFoundations:SF.1/setoid-criterion`, `tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`.

**Sources.** [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3b51bbf9a925f23bca922570bea8d641b6ec712d/TauCetiRoadmap/ModularCurves/README.md), §4C, rigidifiers and Katz–Mazur 4.7.0; §9D, Galois rigidifiers: Representable rigidifiers provide actual moduli schemes; Galois rigidifiers are an extra condition for finite quotient constructions. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Theorem A.1(b), p.1087: Rigidification takes a stabilizer quotient rather than a level-preserving subgroup.

## Finite correspondences and descent

### Finite correspondences over a base

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`; proposed name `TauCeti.ArithmeticModuli.FiniteCorrespondence`.

For separated Deligne–Mumford stacks X,Y of finite type over a locally Noetherian S and with finite inertia, a finite correspondence is a span X←p Z→q Y over S, with both p and q representable by algebraic spaces and finite. Morphisms are equivalences of the middle stacks with compatible 2-isomorphisms on both legs. The correspondence is not defined as its image in X×_S Y: the middle stack and its multiplicities are retained. Since Y is separated over S, the joint map Z→X×_S Y is finite: factor through the graph over X and use the proper quasi-finite diagonal of Y. This supplies a finite-algebra presentation for descent.

**Hypotheses.** X,Y are separated finite-type DM stacks over locally Noetherian S, with finite inertia. Both legs, not just one, are representable and finite.

**Construction or proof.**

1. Use SF.1/two-fibre-product and representable-stack-morphism to specify the span groupoid.
2. The graph factorization over X identifies the joint map as a composite of the base change of p and a base change of the separated DM diagonal of Y; both are finite.
3. On scheme charts use native IsFinite and its base-change/composition instances.

**API.** Names below are in `TauCeti.ArithmeticModuli`.

- `FiniteCorrespondence.apex` (projection): The middle stack, with both legs and their common S-map.
- `FiniteCorrespondence.identity` (constructor): The identity span X←X→X.
- `FiniteCorrespondence.transpose` (constructor): Exchange the two legs, retaining the same middle stack.
- `FiniteCorrespondence.compose` (constructor): Compose X←Z→Y and Y←W→V using Z×_Y W.
- `FiniteCorrespondence.baseChange` (functoriality): Pull back the whole span along S′→S, including both legs.
- `FiniteCorrespondence.jointFinite` (characterisation): Under the separated DM endpoint hypotheses the map to X×_S Y is finite.

**Definition tests.**

- `FiniteCorrespondence.test_identity`: The identity span has middle X and both legs equal to the identity.
- `FiniteCorrespondence.test_double_point`: Over Spec(k), the span with middle Spec(k×k) and both structure maps has degree two on each leg although its image is the single point.
- `FiniteCorrespondence.test_two_legs`: The span A1_k←id A1_k→Spec(k) is not a finite correspondence: the right leg is not finite.
- `FiniteCorrespondence.test_empty`: The empty middle scheme defines a finite correspondence between any two endpoint schemes; its composition is empty.

**Uses determining the API.** Coarse-span descent below: Both finite legs induce finite maps on the coarse spaces, with possible degree change. Arithmetic correspondence extension below: Retaining the middle stack separates finite-algebra descent from schematic closure.

**Acceptance.** Retain distinct spans with the same image but different degree. There is no obligation for the joint map to be a monomorphism.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1/separation-properness-spaces`, `mathlib:AlgebraicGeometry.IsFinite`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Definition 101.37.1, pp.80–81, and representable morphisms in §6: Finiteness is the representable property; properness and representability are separate conditions. [SpacesDescent](https://stacks.math.columbia.edu/download/spaces-descent.pdf), Lemmas 74.11.23 and 74.11.29: Finite and finite locally free legs admit local checks needed for descent; the span is the arithmetic application here.

### Composition and change of base of finite correspondences

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-composition`; proposed name `TauCeti.ArithmeticModuli.FiniteCorrespondence.composition`.

Composition of finite correspondences by the two-fibre product has representable finite legs. It is associative up to the canonical associator equivalence, has identity spans as units, and commutes with arbitrary change of base. If all legs are finite locally free, the composite legs are finite locally free as well. These are stack-level statements; a coarse-space operation is not asserted to preserve the middle fibre product.

**Hypotheses.** Correspondences have the endpoint and leg hypotheses of finite-correspondence.

**Construction or proof.**

1. Each projection of Z×_Y W is a base change of one of the finite legs.
2. Compose with the remaining finite leg; use stability under base change and composition.
3. Use the universal properties of two-fibre products for associators, units and base-change comparisons.

**Acceptance.** Composing two degree-two double-point spans over a point has a four-point middle scheme. For Spec(k)→BC2←Spec(k), the middle stack fibre product is C2 while the fibre product of the coarse middles is one point.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `mathlib:CategoryTheory.Limits.pullback`, `mathlib:AlgebraicGeometry.IsFinite`.

**Sources.** [SpacesDescent](https://stacks.math.columbia.edu/download/spaces-descent.pdf), §11, Lemmas 74.11.23 and 74.11.29: Local finite and finite locally free properties reduce the stated stability checks to schemes. [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), §6 and §37, pp.80–81: Representable morphism properties are checked on base-changed algebraic spaces.

### Effective fpqc descent of finite spans

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-fpqc`; proposed name `TauCeti.ArithmeticModuli.FiniteCorrespondence.fpqc_descent`.

For an fpqc cover S′→S, finite correspondences between the fixed endpoints X,Y over S form a groupoid equivalent to finite correspondences between X_{S′},Y_{S′} supplied with an isomorphism over S′×_S S′ satisfying the identity and triple-overlap cocycle, including the 2-isomorphisms on both legs. A descended span is unique up to unique isomorphism compatible with the specified descent identification. Finite locally free legs descend too.

**Hypotheses.** The endpoint hypotheses of finite-correspondence. An actual fpqc descent datum is supplied on the middle stack and both legs, not merely matching geometric isomorphism classes.

**Construction or proof.**

1. Regard the joint finite map as a commutative quasi-coherent finite algebra on X×_S Y.
2. Descend this algebra, its multiplication and unit using SF.2/quasi-coherent-algebra-descent and the stack chart version of SF.1/stack-quasi-coherent.
3. Recover the middle via relative Spec; descend each leg and the leg compatibility 2-isomorphisms.
4. Finiteness and finite local freeness are fpqc local on the target. Descend morphisms by full faithfulness of algebra descent.

**Acceptance.** A nontrivial quadratic étale algebra and its split fpqc pullback descend with its nontrivial cocycle. Matching local coarse points without a cocycle does not construct a descended family.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`, `SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `SchemeAndStackFoundations:SF.1/space-fppf-descent`, `SchemeAndStackFoundations:SF.0/relative-spec`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [SpacesDescent](https://stacks.math.columbia.edu/download/spaces-descent.pdf), Proposition 74.4.1 and Lemmas 74.11.23 (0426), 74.11.29 (042C): Effective quasi-coherent descent and fpqc local finite properties supply the finite-algebra argument; extend through stack charts.

### Finite spans induce finite coarse spans

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`; proposed name `TauCeti.ArithmeticModuli.FiniteCorrespondence.coarse_finite`.

A finite correspondence X←Z→Y as above induces M_X←M_Z→M_Y between the Keel–Mori coarse spaces, and both induced maps are finite. Formation of these maps commutes with flat change of the common base. Arbitrary base change is valid when each of X,Y,Z is tame. Neither preservation of degree nor preservation of middle fibre products follows in general.

**Hypotheses.** X,Y are separated finite-type DM stacks over locally Noetherian S, with finite inertia. The middle Z and both legs satisfy finite-correspondence; Z is then separated, finite type and has finite inertia. The arbitrary-base assertion requires tameness of all three stacks.

**Construction or proof.**

1. Use SF.1/keel-mori for the three coarse spaces and categorical universality for the induced maps.
2. For the left induced map, π_X∘p=ar p∘π_Z is proper. After any base change, surjectivity of π_Z descends universal closedness to ar p; separatedness and finite type come from the endpoint/coarse separation and local finite-type results.
3. After passage to an algebraically closed field, the classes in a coarse fibre are images of the finite fibre of p after choosing an isomorphism in X; this yields finitely many geometric points, hence quasi-finiteness for the finite-type coarse map.
4. Apply the algebraic-space theorem proper plus quasi-finite implies finite. Repeat for q; use coarse uniqueness for flat or tame base-change compatibility.

**Acceptance.** The representable finite étale map Spec(k)→BC2 has degree two but its map of coarse spaces has degree one. The coarse middle of Spec(k)×_{BC2}Spec(k) has two points, unlike the fibre product of its one-point coarse endpoints.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`, `SchemeAndStackFoundations:SF.1/keel-mori`, `SchemeAndStackFoundations:SF.1/tame-local-structure`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1/separation-properness-spaces`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Lemma 101.37.6, p.81: A surjective proper stack cover allows descent of universal closedness in a commuting triangle. [StacksFinite](https://stacks.math.columbia.edu/tag/0A4X), Lemma 30.21.1 (02OG) and algebraic-space Lemma 76.35.1 (0A4X): Proper quasi-finite morphisms are finite; the algebraic-space signature is requested from SF.1. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Corollary 3.3(a), p.1078: Tame coarse moduli maps retain their moduli property under arbitrary base change.

### Finite flat descent through a tame coarse space

Target `AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent`; proposed name `TauCeti.ArithmeticModuli.tame_finite_flat_descent`.

Let π:X→M be the coarse space of a locally Noetherian tame algebraic stack with finite inertia. For a representable finite locally free p:Z→X, let A=p_*O_Z. If every stabilizer at a closed geometric point of X acts trivially on the fibre of A, then B=π_*A is a finite locally free commutative O_M-algebra, the adjunction π*B→A is an isomorphism of algebras, and Z≃X×_M Spec_M(B). The descended finite locally free morphism has the same rank. The condition is on the entire finite algebra, including its stabilizer action; a coarse geometric point bijection is insufficient.

**Hypotheses.** X is locally Noetherian, tame, and has finite inertia. p is representable finite locally free. All closed geometric stabilizers act trivially on A fibres.

**Construction or proof.**

1. Exact coarse QCoh pushforward and O_M≅π_*O_X make this tame coarse morphism a good moduli space in Alper’s sense.
2. Apply Alper Theorem 10.3 to the vector bundle A.
3. Full faithfulness of pullback on vector bundles descends multiplication and unit; faithfulness verifies associativity, commutativity and the unit identities.
4. Use relative Spec and its base-change comparison to obtain the cartesian square and rank preservation.

**Acceptance.** A pulled-back finite locally free M-algebra descends with the same algebra and rank. For the atlas Spec(k)→BC2, the fibre algebra has the nontrivial permutation action and does not satisfy the hypothesis. Do not extend the closed-fibre criterion to all coherent sheaves: Alper Remark 10.4 gives a counterexample.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/tame-stack`, `SchemeAndStackFoundations:SF.1/keel-mori`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `SchemeAndStackFoundations:SF.1/space-quasi-coherent`, `SchemeAndStackFoundations:SF.0/relative-spec`, `SchemeAndStackFoundations:SF.0/qcoh-algebra`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [Alper13](https://www.numdam.org/item/10.5802/aif.2833.pdf), Theorem 10.3 and Remark 10.4, pp.2386–2387: Vector bundles descend exactly when closed geometric stabilizers act trivially; the coherent-sheaf extension fails. [AOV08](https://www.numdam.org/item/10.5802/aif.2378.pdf), Definition 3.1 and Theorem 3.2, pp.1077–1078: Tame finite-inertia stacks have exact coarse QCoh pushforward.

## Normalization, closure and arithmetic extensions

### Normalization of a Deligne–Mumford stack

Target `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`; proposed name `TauCeti.ArithmeticModuli.DMNormalization.stack`.

Let X be a locally Noetherian DM stack. Choose an étale scheme atlas U→X, set R=U×_X U, and normalize U and R in the total rings of fractions of their reductions. Smooth normalization compatibility gives R^ν≅R×_U U^ν≅U^ν×_U R and the normalized étale groupoid. Its quotient X^ν has a representable integral map ν_X:X^ν→X, and for every smooth scheme chart V→X its pullback is the ordinary normalization V^ν. This characterizes the construction up to unique comparison isomorphism. On scheme charts use the imported SF.0 ordinary-normalization adapter to Mathlib’s relative normalization of the disjoint generic points; normalizing the identity map would be incorrect.

**Hypotheses.** X is locally Noetherian and DM; more generally require the locally finite-component condition of Stacks Lemma 101.46.1. Ordinary normalization removes nilpotents before integral closure.

**Construction or proof.**

1. Import ordinary scheme normalization and smooth base-change compatibility from SF.0 and the native qcqs relative-normalization API.
2. Lift source, target, inverse and composition on the normalized groupoid using the smooth comparisons; construct the unit from the base-changed identity section.
3. Verify groupoid axioms by normalization uniqueness and use SF.1/groupoid-space plus stack quotient.
4. Integral representability and chart characterization descend; compare two atlases on their common refinement.

**API.** Names below are in `TauCeti.ArithmeticModuli`.

- `DMNormalization.stack` (constructor): The normal DM stack X^ν with its map ν_X to X.
- `DMNormalization.map` (projection): The representable integral normalization morphism ν_X.
- `DMNormalization.smoothChart` (compatibility): For a smooth V→X, the pullback of ν_X is ordinary V^ν→V.
- `DMNormalization.mapOfGeneric` (functoriality): Maps preserving generic points of components lift uniquely to normalizations.
- `DMNormalization.normalIso` (characterisation): If X is normal, ν_X is an isomorphism.
- `DMNormalization.schemeComparison` (compatibility): For scheme X, the construction agrees with SF.0’s generic-point adapter to Scheme.Hom.normalization.

**Definition tests.**

- `DMNormalization.test_node`: For Spec(k[x,y]/(xy)), the normalization is Spec(k[x]) ⨿ Spec(k[y]); the node has two points above it.
- `DMNormalization.test_normal_stack`: For a finite constant group H over a field, BH is normal and its normalization morphism is an equivalence; inertia is retained.
- `DMNormalization.test_nilpotents`: The normalization of Spec(k[ε]/ε²) is Spec(k), unlike relative normalization of its identity map.
- `DMNormalization.test_scheme_comparison`: For an integral affine scheme Spec(A), the atlas construction agrees with Spec of the integral closure of A in Frac(A).

**Uses determining the API.** Normalized finite correspondences below: Produces a normal middle stack without changing an already-normal generic correspondence. Coarse-space arithmetic models: Imports integral closure from the libraries and adds only its DM descent.

**Acceptance.** Do not assert functoriality for an arbitrary map sending a component to a nongeneric point. Finiteness requires the additional Nagata condition below. No arbitrary nonflat base-change theorem for ordinary normalization is included.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`, `SchemeAndStackFoundations:SF.1/groupoid-space`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationPullback`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Lemmas 101.46.1–101.46.2 and Definition 101.46.3 (0GMI–0GMK), pp.96–97: Normalization is glued from smooth charts and is representable integral. [SpacesMorph](https://stacks.math.columbia.edu/download/spaces-morphisms.pdf), Lemma 67.49.5 (07U4), pp.106–108: Normalization of spaces commutes with smooth maps and is functorial for maps preserving component generic points.

### Finite normalization over a Nagata base

Target `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`; proposed name `TauCeti.ArithmeticModuli.DMNormalization.finite`.

If X is a finite-type DM stack over a locally Noetherian Nagata scheme S, then ν_X is finite. In particular this holds over a locally Noetherian excellent base. The statement includes purely inseparable finite generic field extensions in the imported finite-normalization adapter; separability is not needed for finiteness. A generic finite field extension requires its own integral-closure normalization rather than ordinary normalization of X.

**Hypotheses.** X is finite type and DM over locally Noetherian Nagata S.

**Construction or proof.**

1. Étale finite-type scheme charts over S are Nagata.
2. Apply SF.0/nagata-normalization-finite to their ordinary normalizations.
3. Use the chart characterization and target-local descent of finite morphisms to prove ν_X finite.

**Acceptance.** Separate finite normalization from generic étaleness: the latter needs separability. Normalization can fail to be finite outside the Nagata hypotheses.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`, `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`, `mathlib:AlgebraicGeometry.IsFinite`.

**Sources.** [SpacesMorph](https://stacks.math.columbia.edu/download/spaces-morphisms.pdf), Lemma 67.49.11, p.109; scheme input Morphisms Lemma 29.55.11: Normalization over a Nagata base is finite, checked on étale charts.

### Schematic closure in a Deligne–Mumford stack

Target `AlgebraicModuliForArithmeticGeometry:R09.5/dm-schematic-closure`; proposed name `TauCeti.ArithmeticModuli.DMSchematicClosure.stack`.

For a quasi-compact morphism f:Z→X of locally Noetherian DM stacks, define its schematic image C⊂X to be the smallest closed substack through which f factors. For a smooth chart U→X the corresponding closed subscheme is cut out by ker(O_U→(f_U)_*O_{Z_U}); these ideal sheaves descend to X. For a quasi-compact immersion of an object over a dense open base this is its schematic closure. The construction retains scheme structure and commutes with flat base change. No nonflat comparison is asserted.

**Hypotheses.** f is quasi-compact; X,Z are locally Noetherian DM stacks. The closure use requires a specified immersion into the ambient stack.

**Construction or proof.**

1. Use native Scheme.Hom.image and its kernel ideal sheaf on scheme charts, after an étale chart of the source if needed.
2. Flat base change of the kernel identifies ideals on both projections of the atlas overlap. Descend the quasi-coherent ideal using SF.1 stack QCoh descent.
3. Minimality and factorization are local on the target; prove independence of charts.
4. For flat base change use the same kernel comparison.

**API.** Names below are in `TauCeti.ArithmeticModuli`.

- `DMSchematicClosure.stack` (constructor): The schematic image C with its closed immersion into X.
- `DMSchematicClosure.factor` (constructor): The canonical factor Z→C and its composite equality with f.
- `DMSchematicClosure.minimal` (universal-property): Every closed substack D⊂X containing f also contains C.
- `DMSchematicClosure.flatBaseChange` (compatibility): The image of f after flat base change is the pullback of C.
- `DMSchematicClosure.schemeComparison` (compatibility): For a scheme morphism the construction is exactly Scheme.Hom.image.

**Definition tests.**

- `DMSchematicClosure.test_nilpotents`: The schematic image of id on Spec(k[ε]/ε²) is the entire nonreduced scheme.
- `DMSchematicClosure.test_closed_point`: The image of Spec(k)→Spec(k[ε]/ε²) given by ε↦0 is the reduced closed point, with ideal (ε).
- `DMSchematicClosure.test_nonflat`: Spec(Z[1/p])→Spec(Z) has schematic image Spec(Z); after reduction mod p the source is empty and its image is empty.
- `DMSchematicClosure.test_scheme_comparison`: For a scheme morphism f, the defining immersion and factor agree with f.imageι and f.toImage.

**Uses determining the API.** Extension of an immersed generic correspondence below: Specifies the schematic closure before finiteness and normalization are checked. Arithmetic integral-model comparison: Retains nilpotents and provides the exact flat base-change boundary.

**Acceptance.** Do not replace the schematic image by a reduced topological closure. Do not replace a finite span by its image, since this can lose multiplicity.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `mathlib:AlgebraicGeometry.Scheme.Hom.image`, `mathlib:AlgebraicGeometry.Scheme.Hom.toImage`, `mathlib:AlgebraicGeometry.Scheme.Hom.imageι`, `mathlib:AlgebraicGeometry.Scheme.Hom.toImage_imageι`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Definition 101.38.1 (0CMI), Lemmas 101.38.3 (0CPU) and 101.38.5 (0CMK), pp.81–83: Smallest closed substacks exist; quasi-compact schematic image is compatible with flat pullback.

### When closure preserves finite correspondences

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure`; proposed name `TauCeti.ArithmeticModuli.finite_schematic_closure`.

Let S be integral locally Noetherian excellent, let U⊂S be dense open, and let X,Y be separated finite-type DM stacks over S with finite inertia. Suppose a finite correspondence C_U between X_U and Y_U has a quasi-compact joint immersion C_U→X_U×_U Y_U. Let C be its schematic closure in X×_S Y. If both projections C→X and C→Y are representable, proper and quasi-finite, then they are finite, so C is a finite correspondence extending C_U. Properness follows, for example, if both endpoint stacks are proper over S; quasi-finiteness is an additional condition. This procedure is for immersed spans and cannot replace finite-algebra extension for a general multiple-cover span.

**Hypotheses.** All conditions in the statement, including the joint immersion and quasi-finiteness of both projections. U is used rather than an unqualified generic fibre so that C_U embeds as the open-base restriction of C.

**Construction or proof.**

1. Construct the closure and restrict to U; an immersion already closed over U has its original schematic image there. The joint map of a finite span is finite, so the given immersion is closed over U.
2. If X,Y are proper over S, the product projections and closed-substack inclusions give properness of both legs.
3. Apply the requested algebraic-space proper quasi-finite finiteness theorem on each target chart; descend finiteness.

**Acceptance.** For S=Spec(k[t]), the closure of the graph x=1/t from U=D(t) into X=S and Y=A1_S is Spec(k[t,1/t]); the projection to S is quasi-finite but not proper and is not finite. A proper closure can have positive-dimensional special fibres; properness alone is insufficient. The double-point span over a point cannot be extended by its one-point schematic image.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/dm-schematic-closure`, `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), §38, pp.81–83; §37, pp.80–81: Schematic closure and properness provide the geometric hypotheses, with no automatic quasi-finiteness claim. [StacksFinite](https://stacks.math.columbia.edu/tag/0A4X), Lemma 30.21.1 (02OG) and algebraic-space Lemma 76.35.1 (0A4X): The proper quasi-finite criterion then proves finite representable legs.

### Normal finite extensions of immersed correspondences

Target `AlgebraicModuliForArithmeticGeometry:R09.5/normalized-correspondence`; proposed name `TauCeti.ArithmeticModuli.normalized_finite_correspondence`.

Under finite-closure, the middle C has finite normalization C^ν because it is finite type over excellent S. Composing C^ν→C with the two finite legs gives a normal finite correspondence. If C_U is normal, its restriction to U is the original C_U; otherwise the restriction is its normalization. No preservation of rank on special fibres or commutation with arbitrary base change is asserted.

**Hypotheses.** The finite-closure hypotheses, including proper quasi-finite representable projections. C_U normal is required to retain the original open-base middle.

**Construction or proof.**

1. Use dm-normalization-finite and composition of representable finite morphisms.
2. Use the smooth/open chart comparison to commute normalization with restriction to U.
3. For normal C_U the normalized restriction is isomorphic to C_U.

**Acceptance.** A nodal middle acquires two branches under normalization. A normal étale open-base correspondence is retained. Nonflat specialization need not commute with normalization.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure`, `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`, `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-composition`.

**Sources.** [StacksMorph](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), Lemma 101.46.2 and Definition 101.46.3, pp.96–97: The smooth chart characterization allows restriction to an open and produces a normal middle. [SpacesMorph](https://stacks.math.columbia.edu/download/spaces-morphisms.pdf), Lemma 67.49.11, p.109: Nagata finiteness preserves finite legs after composing normalization.

## Elliptic and relative-curve comparisons

### Elliptic coarse-space and base-change recovery

Target `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`; proposed name `TauCeti.ArithmeticModuli.elliptic_coarse_recovery`.

For the affine elliptic moduli problems P covered by ModularCurves9D, stackify the problem over the elliptic moduli stack and use the level-3 and level-4 Galois rigidifier charts of ModularCurves4C/9D. Their quotient-stack presentations identify the imported coarse scheme M(P), regarded as an algebraic space, with the SF.1 coarse space. The comparison is compatible with the imported M(P)/H≅M(P/H) theorem. Import all four Katz–Mazur 8.1.6 cases for M(P_{R′})→M(P)×_R R′: P representable; R→R′ flat; 6 invertible in R; or P=P′/G for representable P′ and finite G whose order is invertible in R′. The final condition is on the target ring and must not be replaced by tameness over R.

**Hypotheses.** P satisfies the affine-moduli and Galois-rigidifier hypotheses in the imported ModularCurves9D statement. All concrete moduli objects, representing schemes and quotient constructions remain owned by ModularCurves.

**Construction or proof.**

1. Over D(3) use the full level-3 Galois rigidifier, and over D(2) use the full level-4 one. Import representability and the quotient-stack presentation.
2. Use SF.1/finite-quotient-coarse for universality among all algebraic spaces, not only schemes, on each chart.
3. Glue the unique coarse-space comparisons on overlaps; import the finite quotient and four-case base-change statements rather than reprove them.

**Acceptance.** Recover the imported M(P)/H comparison under its exact hypotheses. Keep the nonflat target-order-invertible case of Katz–Mazur 8.1.6 even when source tameness is unavailable. The Legendre family is excluded as a Galois rigidifier.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/coarse-moduli-space`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `SchemeAndStackFoundations:SF.1/stackification`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

**Sources.** [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3b51bbf9a925f23bca922570bea8d641b6ec712d/TauCetiRoadmap/ModularCurves/README.md), §9D, constructions with full level 3/4, Katz–Mazur 8.1.5–8.1.6 and Suggested.lean: Concrete coarse schemes, quotient compatibility and four separate base-change hypotheses are already planned there. [Conrad05](https://math.stanford.edu/~conrad/papers/coarsespace.pdf), Theorem 3.1, pp.5–6; Theorem 4.2 and Corollary 4.3, pp.7–10: Finite quotient universality includes algebraic-space targets; stack coarse spaces glue under the stabilizer-preserving descent conditions.

### The coarse j-line over arbitrary rings

Target `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`; proposed name `TauCeti.ArithmeticModuli.coarse_j_line_recovery`.

The coarse space of the elliptic moduli stack is the imported j-line of ModularCurves9E over Z, and its imported arbitrary-ring version over R agrees with the stack coarse space. The cases in characteristics 2 and 3 use the explicit integral invariant/coarse-point results already owned by 9E; they do not follow from the tame base-change theorem. The coarse j-line is not a fine moduli scheme and carries no universal elliptic curve representing all families.

**Hypotheses.** Use the elliptic-stack carrier and exact integral j-invariant/coarse-space hypotheses of ModularCurves9E.

**Construction or proof.**

1. Use elliptic-coarse-recovery for the comparison away from the small characteristics.
2. At 2 and 3 import the explicit 9E invariant and geometric-point calculations, then apply coarse uniqueness among algebraic spaces.
3. Compare families with the same j-invariant but different descent forms to distinguish coarse and fine moduli.

**Acceptance.** Include geometric fibres in characteristics 2 and 3. A nontrivial quadratic twist over a field of characteristic different from 2 has the same j-invariant but need not be isomorphic over that field.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`, `SchemeAndStackFoundations:SF.1/coarse-moduli-space`, `SchemeAndStackFoundations:SF.1/fine-moduli-space`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`.

**Sources.** [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3b51bbf9a925f23bca922570bea8d641b6ec712d/TauCetiRoadmap/ModularCurves/README.md), §9E, the integral j-line and its arbitrary-ring coarse property: The concrete j-line, including characteristics 2 and 3, is imported and compared rather than planned again.

### Recovery of finite quotients of smooth relative curves

Target `AlgebraicModuliForArithmeticGeometry:R09.5/finite-curve-quotient-recovery`; proposed name `TauCeti.ArithmeticModuli.finite_curve_quotient_recovery`.

For a smooth affine relative curve C over a regular locally Noetherian base S with the finite group action and categorical quotient hypotheses of ModularCurves9D, identify the coarse space of [C/H] with the imported C/H. Import the 9D smooth-relative-dimension-one quotient theorem without adding an order-invertibility hypothesis. Its wild cases are not justified by tameness or exactness of arbitrary invariants, and no arbitrary-base-change strengthening is added here.

**Hypotheses.** All hypotheses of the imported smooth affine relative-curve finite-quotient theorem in ModularCurves9D. The finite group quotient exists with the imported categorical and orbit hypotheses.

**Construction or proof.**

1. Use SF.1/finite-quotient-coarse for [C/H]→C/H.
2. Identify the quotient already constructed in ModularCurves9D by categorical uniqueness.
3. Import its smooth-curve theorem, without recreating quotient or smoothness nodes in this packet.

**Acceptance.** A translation action of C_p on A1 in characteristic p has quotient coordinate t^p−t and a smooth quotient, although C_p is not linearly reductive. A nontrivial stabilizer can remain upstairs while the quotient curve is smooth.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

**Sources.** [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3b51bbf9a925f23bca922570bea8d641b6ec712d/TauCetiRoadmap/ModularCurves/README.md), §9D, finite group quotients of smooth affine relative curves; Suggested.lean, smoothOfRelativeDimension_one_of_isCategoricalQuotient: Both the finite curve quotient and its smoothness milestone are owned by the existing roadmap.

## Native library interfaces and prototype boundary

The pinned libraries already contain relative scheme normalization, schematic images, finite-morphism stability, finite invariant-ring integrality and orbit control on primes, field linear reductivity, pseudofunctors, strong transformations, modifications and effective stack descent. The declaration table below records actual source statements read at the pins. These are imports, not new roadmap definitions.

| Pinned declaration | Interface used |
| --- | --- |
| `mathlib:CategoryTheory.Pseudofunctor` | Pseudofunctors including invertible unit and composition constraints. |
| `mathlib:CategoryTheory.Pseudofunctor.StrongTrans` | Stack morphism prototypes with component functors and invertible restriction coherence. |
| `mathlib:CategoryTheory.Pseudofunctor.StrongTrans.Modification` | Actual compatible two-morphisms; native scoped category on strong transformations. |
| `mathlib:CategoryTheory.Pseudofunctor.IsStack` | Effective object descent plus the Hom-sheaf condition; groupoid fibres must be imposed separately. |
| `mathlib:CategoryTheory.Pseudofunctor.sheafHom` | The actual sheaf of fibre morphisms on the slice site, retaining all restriction coherence. |
| `mathlib:CategoryTheory.Aut` | Automorphism group of an object, with native composition convention. |
| `mathlib:CategoryTheory.Functor.mapAut` | Functor-induced group homomorphism on automorphism groups. |
| `mathlib:CategoryTheory.Aut.autMulEquivOfIso` | Transport of automorphisms by an isomorphism, giving conjugation. |
| `mathlib:CategoryTheory.Quotient` | Quotient of a category by a Hom congruence; use only as the fibrewise prestack precursor, then sheafify and stackify. |
| `mathlib:CategoryTheory.Quotient.lift` | Functor out of the native quotient when the Hom relation is killed. |
| `mathlib:CategoryTheory.Quotient.functor_map_eq_iff` | Equality in a quotient by a congruence is exactly the original relation. |
| `mathlib:CategoryTheory.Limits.pullback` | Native categorical pullback, with both projections and the commutativity equation. |
| `mathlib:AlgebraicGeometry.IsFinite` | Affine morphism with finite algebra on affine opens; stable under composition and base change. |
| `mathlib:AlgebraicGeometry.IsFinite.SpecMap_iff` | Finite spectrum morphism iff the ring homomorphism is finite. |
| `mathlib:AlgebraicGeometry.IsFinite.iff_isProper_and_isAffineHom` | Native scheme finite iff proper and affine, not a theorem that all proper quasi-finite space maps are finite. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | Relative normalization of a quasi-compact quasi-separated morphism using the integral closure in its pushforward algebra. It is not ordinary normalization when the morphism is the identity. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.toNormalization` | Factor from the original source to relative normalization. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.fromNormalization` | Integral morphism from relative normalization to the original target. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc` | Universal factor from relative normalization to an integral target in a compatible factorization. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationPullback` | Comparison from normalization of a pulled-back qcqs map to the pullback of its normalization; is an isomorphism under smooth base change. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.image` | Native schematic image, the subscheme cut out by the kernel ideal sheaf. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.imageι` | Closed immersion of the native schematic image into the target. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.toImage` | Native factor through the schematic image. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.toImage_imageι` | The factor followed by the image immersion is the original morphism. |
| `mathlib:Algebra.IsInvariant.isIntegral` | Finite-group invariant extension is integral. This does not alone supply a quotient universal among algebraic spaces. |
| `mathlib:Algebra.IsInvariant.exists_smul_of_under_eq` | Primes above the same invariant-ring prime lie in one finite-group orbit. |
| `tauceti:TauCeti.linearlyReductiveAffineGroupSchemeProperty` | Linear reductivity for affine group schemes over a field via the Hopf-algebra antiequivalence; not the finite flat group-scheme theory over an arbitrary base. |
| `tauceti:TauCeti.Comodule.fixedSubcomodule` | Fixed vectors specified by the coaction equation; used to compare trivial stabilizer actions with invariant modules. |
| `mathlib:CategoryTheory.IsGroupoid` | Every morphism in the given category is an isomorphism; retains the original Cat category structure while requiring groupoid fibres. |

The suggested file gives actual native normal inertia subsheaves, quotient-Hom and stackification signatures, local object lifting, stabilizer kernels, and the Hom-category universal property. It retains the native restriction coherence and modification categories. Its `FiniteCorrespondence` is the scheme specialization and preserves both legs and their base equation. Its `DMNormalization` and `DMSchematicClosure` adapters use the existing scheme constructions. In particular the relative-normalization adapter does **not** assert that normalizing the identity is ordinary normalization.

Geometric conditions have not been replaced by arbitrary proposition fields. The missing algebraic-stack and space carriers, closed/flat/finitely-presented subgroup conditions, geometric gerbe/coarse theorems, DM extensions and concrete modular comparisons are explicitly listed in the suggested file’s omission ledger. Each untyped API or test is named there with its exact mathematical contract. The native S3 and C4 examples are stabilizer-algebra fixtures; the Bμ_p and nonreduced-scheme realizations require the algebraic-stack binding. The quadratic squaring example checks the obstruction to lifting a section; the full fppf quotient-sheaf identification remains a named geometric fixture.

## Supplier contracts and remaining work

**`SchemeAndStackFoundations:SF.1`.** Supply the following additions in the SF.1 direction (Scheme and stack foundations, Part II, if the packaged layer is fixed): (1) a free flat finitely presented group-algebraic-space action has an algebraic-space fppf quotient with effective quotient-sheaf base change; quotient-stack-algebraic already owns the free-action algebraic-space criterion, so extend its interface rather than add a duplicate; (2) for any flat finitely presented group algebraic space G over T, BG→T is a smooth finitely presented stack morphism, proper for finite G and étale for étale G; do not require G smooth; (3) proper locally quasi-finite algebraic-space morphisms are finite (Stacks 76.35.1, 0A4X), giving in particular the finite separated DM diagonal used in the joint-span map; (4) relative Spec of a commutative quasi-coherent algebra on an algebraic stack, the representable affine equivalence, arbitrary base-change comparison and fpqc algebra descent, extending the existing scheme SF.0 relative-spec and SF.1 stack-quasi-coherent interfaces.

**`tauceti:TauCetiRoadmap/ModularCurves#4c-rigidifiers-and-km-470`.** Import its representing schemes and exact elliptic rigidifier/level hypotheses, particularly the full level-3 and level-4 Galois rigidifiers. Provide the natural moduli-to-quotient-stack chart comparison. Keep all concrete level definitions and representability theorems in ModularCurves.

**`tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.** Import M(P), M(P)/H≅M(P/H), all four Katz–Mazur 8.1.6 base-change conditions including order invertible only in the target ring, and the finite smooth affine relative-curve quotient theorem over a regular locally Noetherian base. The quotient-stack atlas comparison supplies the algebraic-space universal property via SF.1. Do not replan quotient existence or smoothness here.

**`tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`.** Import the integral coarse j-line and the arbitrary-ring coarse j-line theorem, including the explicit small-characteristic invariant and geometric-point results at 2 and 3. Bind them to the elliptic stack and the SF.1 coarse-space universal property without a tame-source assumption.

**Existing coarse and tame suppliers require their recorded proof inputs.** The current SF.1 packet has an independent review with needs_changes. Its Keel–Mori proof records missing AF finite-flat-groupoid quotient and stabilizer-reflecting étale descent inputs; its tame-local-structure proof needs residual gerbes, extension of finite linearly reductive stabilizers, corrected cotangent-complex obstructions, Artin approximation and the separable-lift input of AOV Proposition 3.7. Import these existing node contracts but do not mark their proof obligations solved. The broader finite-inertia theorem uses the Rydh scope recorded by SF.1; Conrad Theorem 1.1 alone assumes quasi-compact separated diagonal.

**Additional SF.1 quotient, gerbe, finite and relative-Spec interfaces.** Supply the following additions in the SF.1 direction (Scheme and stack foundations, Part II, if the packaged layer is fixed): (1) a free flat finitely presented group-algebraic-space action has an algebraic-space fppf quotient with effective quotient-sheaf base change; quotient-stack-algebraic already owns the free-action algebraic-space criterion, so extend its interface rather than add a duplicate; (2) for any flat finitely presented group algebraic space G over T, BG→T is a smooth finitely presented stack morphism, proper for finite G and étale for étale G; do not require G smooth; (3) proper locally quasi-finite algebraic-space morphisms are finite (Stacks 76.35.1, 0A4X), giving in particular the finite separated DM diagonal used in the joint-span map; (4) relative Spec of a commutative quasi-coherent algebra on an algebraic stack, the representable affine equivalence, arbitrary base-change comparison and fpqc algebra descent, extending the existing scheme SF.0 relative-spec and SF.1 stack-quasi-coherent interfaces.

**Native geometric signatures await the algebraic-stack and space carriers.** Pinned and current Mathlib/Tau Ceti contain native pseudofunctors, stack descent and schemes, but no general algebraic-stack/algebraic-space/inertia/coarse-space carrier. The suggested file gives native site-level normal subgroup and rigidification signatures, and scheme finite-span and image/relative-normalization adapters. Its omission ledger identifies every geometric condition or declaration not expressible on those carriers. Elaborating these reduced signatures does not establish geometric algebraicity, flatness, finite presentation, coarse descent or any omitted test. Bind the signatures and all geometric fixtures to SF.1 before a package claims full type coverage.

**Concrete modular quotient-stack and coarse comparison bindings.** The current upstream ModularCurves4C/9D/9E README and Suggested.lean were read; their concrete mathematics is imported. Their declarations are roadmap signatures, not pinned library implementations. The natural quotient-stack chart comparison and the all-algebraic-space universal-property bindings are the requested interfaces. Katz–Mazur was not independently read for this job: no cleared copy is listed, so the book claims are attributed through the current upstream roadmap, with the exact chapter/theorem numbers it gives.

## Source corrections and version discipline

The statements use the corrected mathematical forms. The published AOV paper and its published 2014 corrigendum were read; arXiv has only the 2007 v1, which was used for collation. Romagny’s rigidification source is the 2005 journal-paginated author copy, §5, pp.224–225. The shorter 2003 group-actions preprint has no §5 and is not a citation for Theorem 5.1. All source wording here is original paraphrase; the packet records exact versions, hashes and access dates.

- `AlgebraicModuliForArithmeticGeometry/E-R09.5-Lie` (error), Lemma 2.14, second proof, pp.1072–1073, published 2008 version: The second proof uses the Lie algebra to control local group-scheme lifting. Correction: Discard that proof and use the first cotangent-complex proof. Check: For nonreduced local groups the cotangent complex has a further term; the Lie-algebra replacement misses it. Existing correction/status: AOV14 published corrigendum, p.945.
- `AlgebraicModuliForArithmeticGeometry/E-R09.5-torsor-obstruction` (error), Proposition 3.6 proof, p.1080, published 2008 version: The torsor obstruction is treated using H² with Lie(G). Correction: Use Ext¹(Lg*L_{B_kG_p}, I^n/I^{n+1})=0 for the obstruction. Do not infer uniqueness of torsor deformations; nonreduced linearly reductive torsors can deform. Check: The missing cotangent term does not obstruct extension but contributes to deformations. Existing correction/status: AOV14 published corrigendum, p.945.
- `AlgebraicModuliForArithmeticGeometry/E-R09.5-subgroup-pullback` (misprint), Appendix A setup, published p.1087; also arXiv math/0703310v1 Appendix A: For an arrow over T→T′, the displayed formula takes T′×_T Aut_T(ξ), and similarly for G. Correction: Aut_T(ξ)≅T×_{T′}Aut_{T′}(ξ′), and G_ξ≅T×_{T′}G_{ξ′}. Check: The given base map is T→T′; the printed fibre product needs an unspecified reversed map. The cartesian object pullback determines the corrected orientation. Existing correction/status: Present in both versions inspected; no correction for this formula is in AOV14. This is a typing correction, not a claim that Theorem A.1 fails.
- `AlgebraicModuliForArithmeticGeometry/E-R09.5-local-chart-base` (misprint), Proposition 3.6 statement, p.1080, published 2008 version: The local chart is displayed as [V/G]≃U×_S𝓜, even though U maps to the coarse space M. Correction: Use U×_M 𝓜 for the stack pullback; the notation distinguishes 𝓜 (stack) from M (coarse space). Check: The stack over U should be the pullback of 𝓜→M along U→M. Its product over the original S has the wrong fibres; the proof uses the coarse-base pullback. Existing correction/status: The intended coarse-to-stack pullback is used throughout the proof and Theorem 3.2. AOV14 does not list this notation correction.
- `AlgebraicModuliForArithmeticGeometry/E-R09.5-isom-bound-variables` (misprint), Appendix A proof, p.1088, paragraph verifying algebraicity of the Isom sheaf: After choosing lifts ξ,η of two objects over T, the paragraph refers to Isom_T(ξ,f*ξ′)/G_ξ with f,ξ′ unbound in that paragraph. Correction: Use Isom_T(ξ,η)/G_ξ for the selected two lifts. Check: The two objects just chosen are both over T; the earlier cross-base formula has been carried into this same-base paragraph. Existing correction/status: No correction to this bound-variable slip is in AOV14; the quotient-Hom construction determines the intended formula.

## Sources and acceptance of the layer

- [Tame stacks in positive characteristic](https://www.numdam.org/item/10.5802/aif.2378.pdf), Dan Abramovich, Martin Olsson, Angelo Vistoli; Ann. Inst. Fourier 58(4) (2008), 1057–1091; version of record. Read: §2.1–2.2, Definitions 2.2 and Propositions 2.3–2.5; Theorem 3.2, Corollaries 3.3–3.5, Propositions 3.6–3.7 and proofs; Appendix A, pp.1086–1089.
- [Corrigendum to: Tame stacks in positive characteristic](https://www.numdam.org/item/10.5802/aif.2869.pdf), Dan Abramovich, Martin Olsson, Angelo Vistoli; Ann. Inst. Fourier 64(3) (2014), 945–946; version of record. Read: Entire corrigendum, pp.945–946.
- [Group actions on stacks and applications](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf), Matthieu Romagny; Michigan Math. J. 53 (2005), 209–236; author-served published pagination. Read: §5, Theorem 5.1, Remarks 5.2 and proof, pp.224–225.
- [The Keel–Mori theorem via stacks](https://math.stanford.edu/~conrad/papers/coarsespace.pdf), Brian Conrad; Author copy dated 27 November 2005, 12 pages. Read: Theorem 1.1 and §§2–5: finite flat covers, AF groupoid quotients, stabilizer-preserving étale descent and limit passage.
- [Good moduli spaces for Artin stacks](https://www.numdam.org/item/10.5802/aif.2833.pdf), Jarod Alper; Ann. Inst. Fourier 63(6) (2013), 2349–2402; version of record. Read: Theorem 4.16, pp.2367–2368; Theorem 10.3, Remark 10.4 and proof, pp.2386–2387.
- [Morphisms of algebraic stacks](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf), The Stacks Project authors; PDF snapshot ed88ff78, compiled 14 July 2026; read 9 October 2026. Read: §6, Lemma 101.6.2 (04YY); §37, Definition 101.37.1 and Lemmas 101.37.2–101.37.6, pp.80–81; §38, Definition 101.38.1 and Lemmas 101.38.3–101.38.5, pp.81–83; §46, Lemmas 101.46.1–101.46.2 and Definition 101.46.3, pp.96–97.
- [Morphisms of algebraic spaces](https://stacks.math.columbia.edu/download/spaces-morphisms.pdf), The Stacks Project authors; PDF snapshot ed88ff78, compiled 14 July 2026; read 9 October 2026. Read: §49, Lemmas 67.49.1, 67.49.4–67.49.5 (07U4) and 67.49.11, pp.105–109.
- [Descent on algebraic spaces](https://stacks.math.columbia.edu/download/spaces-descent.pdf), The Stacks Project authors; PDF snapshot ed88ff78, compiled 14 July 2026; read 9 October 2026. Read: §4, Proposition 74.4.1; §11, Lemmas 74.11.23 (0426) and 74.11.29 (042C): descent of finite and finite locally free morphisms.
- [Finite morphisms and proper morphisms](https://stacks.math.columbia.edu/tag/0A4X), The Stacks Project authors; Live tag pages, accessed 9 October 2026. Read: Lemma 76.35.1 (0A4X), proof of the algebraic-space proper quasi-finite criterion; scheme Lemma 37.44.1 (02LS) and Lemma 30.21.1 (02OG).
- [Modular curves roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3b51bbf9a925f23bca922570bea8d641b6ec712d/TauCetiRoadmap/ModularCurves/README.md), Tau Ceti Project contributors; Current TauCetiRoadmap main, commit 3b51bbf9a925f23bca922570bea8d641b6ec712d. Read: §4C: rigidifiers and Katz–Mazur 4.7.0; §9D: coarse moduli schemes, Katz–Mazur 8.1.5–8.1.6, finite smooth curve quotients; §9E: integral and arbitrary-base coarse j-line; corresponding Suggested.lean signatures.

The six planets are **Normal inertia subgroups**, **Rigidification**, **Rigidification universal property**, **Vertical inertia rigidification**, **Finite correspondences** and **Stack normalization**. No source citation or bookkeeping check is a planet.

Acceptance of R09.5 requires the general normal-subgroup quotient to retain residual inertia; the universal property to include 2-morphisms; the vertical-kernel factor to be representable only under the subgroup geometry; and the coarse/tame imports to have the exact base-change hypotheses. Finite spans must keep both legs, multiplicities and cocycles, while closure must check properness and quasi-finiteness. Normalization must use generic-point integral closure and retain inertia. Elliptic recovery must include all four 9D base-change cases and the integral 9E fibres at 2 and 3. The suggested file elaboration verifies reduced native signatures; the listed geometric omissions and supplier proof obligations prevent a closed-stage claim.
