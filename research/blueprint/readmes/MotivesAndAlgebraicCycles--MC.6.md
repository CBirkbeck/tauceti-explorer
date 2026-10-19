# MC.6 — Motivic Galois groups and periods

This layer constructs the group attached to a **proved neutral fibre functor**, the torsor comparing two fibres, and the formal period torsor of rational Nori motives. Its examples compute the Artin group as a proconstant absolute Galois group and the pure Tate group as the multiplicative group. The category, its abelianness, exact faithful realizations, rigidity and correct symmetry are inputs that must be established before applying reconstruction.

The abstract reconstruction has independent uses in geometric Satake and in changing fibre functors in crystalline representation theory. It is built before the Nori application and has no dependency on MC.5. The relative theorem over a rigid coefficient category and the neutral theorem over a field have different inputs: choosing finite vector spaces as the coefficient category does not supply the local representability lemma needed in the neutral case.

The packet is a complete **target-level plan**, with coverage `planned`. It imports the 28 existing MC.6 targets by stable ID and adds twelve targets below. The precise supplier contracts and three recorded obligations prevent a claim of closure. Every target has implementation status `unchecked`; elaboration of the suggested statements establishes their types, not their proofs. MC.7, its conjecture register and the surrounding cycles/motives layers are outside this part.

## Conventions and ownership

For abstract neutral reconstruction, $k$ is any field. For Artin and Tate motives, $k\subset\mathbb C$ is a geometric base field and coefficients are $\mathbb Q$. The formal period algebra and the comparison torsor in the main Nori application are taken over the geometric base $\mathbb Q$; this avoids confusing the rational Betti fibre with a $k$-valued de Rham fibre. A chosen embedding and algebraic closure inside $\mathbb C$ are retained in the Artin example.

All comodules are **right** comodules. A finite-piece algebra acts on the **left**. Composition $a\circ b$ means first $b$, then $a$. A tensor automorphism is a monoidal natural automorphism, including its unit constraint; it is not an arbitrary natural linear automorphism. We use ordinary symmetric finite vector spaces. A Tate exponent is not a cohomological parity: $L=1(-1)$ has Hodge type $(1,1)$, weight $2$, and ordinary self-symmetry $+1$.

The owner of affine Hopf/group-scheme dictionaries, known-group representation/comodule equivalences, diagonalizable groups, finite-type linear embeddings and reductivity criteria is TauCetiRoadmap **ReductiveGroups**, layers 0, 1, 4 and 6. Its known-group Tannakian dictionary does not start with an arbitrary category and construct a representing Hopf algebra. MC.6 owns that additional reconstruction, its comparison torsors, and its Nori period application. It imports the existing rational Maschke theorem; it does not replan semisimple algebra theory.

MC.5 supplies the diagram category, its universal property, comparison of pair diagrams, corrected good-pair tensor structure, Tate localization and rigidity. The Artin/Tate contracts require the rational category over each geometric base $k\subset\mathbb C$, not only the $\mathbb Q$ base used for the main period application. Its definition of Nori motives is used once. ComplexComparisonPartII:C5 supplies the actual geometric de Rham–Betti comparison, including all pairs and their connecting maps; a comparison limited to smooth proper varieties cannot feed this layer. The existing upstream ModularCurves §0E supplies effective affine faithfully flat descent; SF.1 retains only the auxiliary arbitrary-heap quotient request. The precise contracts are collected below.

The six displayed planets for this part are **Neutral Tannaka reconstruction**, **Relative Tannaka reconstruction**, **Fibre comparison torsor**, **Formal period torsor**, **Artin motivic Galois group**, and **Tate motivic Galois group**. They replace the legacy six selections when the parts are assembled; they do not add six more planets to the installed layer. The existing proposal to separate an early abstract stage from the period stage is retained as a maintainer installation action. Until installed, Satake imports the individual abstract targets rather than the entire motivic stage.

## Sources and locators

Page numbers below are the printed page labels **of the linked author PDF**, not the PDF viewer's page index. In particular, the corrected book has different pagination from both Springer and the 2017 author v6. The packet records file hashes and the sections actually read.

| Key | Version used | Targets and limits |
| --- | --- | --- |
| DM | Deligne–Milne, [*Tannakian Categories*](https://www.jmilne.org/math/xnotes/tc.pdf), corrected author TeX version, 15 August 2012 | Proposition 1.13, p.12; Theorem 2.11 and 2.12–2.16, pp.20–24; 2.20–2.23, pp.24–27; Example 2.30, p.27; Theorem 3.2 and Remark 3.3, pp.30–31. Section 6's Artin example is about absolute Hodge motives and is not used as a Nori equivalence. |
| HMS-paper | Huber–Müller-Stach, [*On the relation between Nori motives and Kontsevich periods*](https://arxiv.org/pdf/1105.0865v5), arXiv:1105.0865v5 | Sections 2–3, pp.9–13; Appendix A, pp.14–16; diagram-category Appendix B. The full comparison algebra is identified only after Tate localization. |
| HMS-book | Huber–Müller-Stach, [*Periods and Nori Motives*](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf), author annotated edition, 1 July 2025 | Universal property: Theorem 7.1.13, Corollary 7.1.15 and §7.4, pp.142–144, 167–170. Modified good-pair products: §9.3, pp.222–225. Artin computation: §9.4, pp.229–231; corrected descent and subquotient argument: §9.5, pp.231–239. Pure Tate: Definition 10.3.1 and Lemma 10.3.2, p.250. |
| FS | Fargues–Scholze, [*Geometrization of the local Langlands correspondence*](https://arxiv.org/pdf/2102.13459v4), v4 | Proposition VI.10.2, pp.232–234, supplies the relative route; VI.10.3 and the opening of VI.11, pp.234–236, specify its Satake consumer. The printed reflection-only coequalizer hypothesis remains a separate obligation. |
| Zhu | Zhu, [*Affine Grassmannians and the geometric Satake in mixed characteristic*](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Annals 185 (2017), 403–492 | §2.5, pp.454–455: consumer of neutral reconstruction, group recognition and tensor functoriality. Its appeal to MV07 is not a proof supplied here of all of Satake. |
| GLX | Gleason–Lim–Xu, [*The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/pdf/2208.07195v3), accepted v3, 10 November 2025 | §5.1, paragraphs 13–14, pp.31–32: consumer of fibre-group inner twisting. The crystalline equivalence and the identification of the monodromy group stay with their p-adic owners. |

The [author errata page](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch.html) must accompany HMS-book. Its corrections to good-pair products, Artin subquotients and restriction/corestriction matter here. The reviewed source issue E48 corrects the Tate-weight sign in Lemma 10.3.2. E49 records a false Dedekind-coefficient extension in HMS-paper Remark 2.7; the rational theorem remains valid. This review checked the annotated author edition; its locators are not asserted to match an uninspected version of record. No source passages are reproduced.

## Existing library boundary

The pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. There is no MC.6 layer record in `data/library-coverage.json`; no reviewed implementation claim is inferred from its absence. The declarations below were checked in their pinned source.

| Existing interface | What it supplies; what still belongs to this layer |
| --- | --- |
| `CategoryTheory.Abelian`, `Linear`, `Functor.Faithful`, `RigidCategory` | Components of the input datum. They do not package neutrality or construct a representing group. |
| `CategoryTheory.Monad.monadicOfHasPreservesReflectsGSplitCoequalizers` in `Mathlib/CategoryTheory/Monad/Monadicity.lean` | Ordinary Beck, with separate existence, preservation and reflection requirements. Use it after obtaining the relative adjunction. |
| `CategoryTheory.Ind` in `Mathlib/CategoryTheory/Limits/Indization/Category.lean` | The Ind category and filtered colimits. The monoidal extension, internal coefficient coalgebra and finite-factorization comparison are part of the retained reconstruction targets. |
| `MonoidAlgebra.exists_leftInverse_of_injective` in `Mathlib/RepresentationTheory/Maschke.lean` | Rational Maschke: equivariant injections split for finite groups because their orders are invertible in the coefficient field. It supplies the Artin summand step. |
| `Bialgebra`, `HopfAlgebra` | Actual algebraic structures. Rigidity must produce an antipode compatible with the **existing** bialgebra, rather than an unrelated Hopf structure on the same type. |
| `TauCeti.FGComoduleCat` and its monoidal/symmetric instances | Finite underlying comodules over an already supplied coalgebra/bialgebra. Their carrier universe can agree with that of the field, as in the compact suggested theorem. |
| `TauCeti.FGComoduleCat.instRigidCategory` | Requires a supplied commutative **Hopf** algebra. It cannot be used to infer that an arbitrary bialgebra is Hopf. |
| `TauCeti.Tannaka.tensorAutFunctor` | Tensor automorphisms of scalar extension on a supplied bialgebra's finite comodules, functorially in value algebras. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | For a supplied commutative Hopf algebra over a field, the known-Hopf points functor agrees with tensor automorphisms, with the stated universe lift. Apply this after constructing the abstract coefficient Hopf algebra and proving the comodule equivalence. |

Current TauCetiRoadmap main was also checked read-only, including the complete ReductiveGroups target list and suggested file and the nearby SemisimpleAlgebras document. A search across its current README and suggested files found no separate owner of arbitrary neutral reconstruction or Nori Artin/Tate comparison. The current Tau Ceti group-functor implementation still starts with the Hopf algebra. No existing upstream targets are replanned here. Exact inspected revisions and the source audit are in the packet and handoff.

## The abstract build

### Neutral reconstruction and recognition

Start with `neutral-fibre-datum`. For an object $X$, write $\langle X\rangle_\oplus$ for the full subcategory of subquotients of finite sums $X^n$. This is the finite **additive** hull, not the tensor subcategory generated by $X,X^\vee$. Faithful exactness bounds lengths by $\dim\omega X$.

The retained target `neutral-finite-subcategory-representability` constructs $P_X\in\langle X\rangle_\oplus$. In $\operatorname{Hom}(\omega X,X)$, take the subobject preserving all $Y\subset X^n$; descending intersections stabilize because the fibre has finite dimension. DM 2.12 identifies its fibre with
\[
 A_X=\{a\in\operatorname{End}_k(\omega X):a^{\oplus n}(\omega Y)\subset\omega Y
       \text{ for every }Y\subset X^n\}.
\]
DM Lemma 2.13 gives $\langle X\rangle_\oplus\simeq A_X\text{-Mod}_{fd}$, carrying $P_X$ to the regular left module and the fibre to the underlying vector space. This lemma supplies the representer; it is not inferred from a supposed representing group.

Finite sums $X\oplus Y$ make the hulls filtered. Restriction gives algebra maps in the direction whose duals form a filtered coalgebra system. The target `neutral-reconstruction-coalgebra` takes
\[
 B=\mathop{\rm colim}_X A_X^\vee
\]
and assembles $C\simeq\operatorname{Comod}_{fd}(B)$ over vector spaces. Finite coefficients and finite systems of coaction equations permit enlarging the index when comparing maps. Tensor products in $C$ induce multiplication on $B$, the unit object supplies its unit, and symmetry gives commutativity. Duals give the antipode. The known-Hopf dictionary then identifies the affine group $\operatorname{Spec}B$ with $R\mapsto\operatorname{Aut}^\otimes(\omega_R)$ for **all** commutative $k$-algebras $R$. This is `neutral-tannaka-reconstruction` (DM Theorem 2.11, pp.20–24).

Keep three finiteness statements separate:

- DM 2.20$a$: $G$ is finite iff a single object generates every object by finite **sums and subquotients**.
- DM 2.20$b$: $G$ is of finite type iff there is a **tensor generator**, allowing finite sums, subquotients and tensor expressions in $X,X^\vee$.
- DM Corollary 2.22: in characteristic zero, $G$ is connected iff, for each object with nontrivial action, its additive hull is not stable under tensor products. “Nontrivial action” does not mean “nonzero vector space”. In characteristic $p$, $\mu_p$ is connected and has finite tensor-generated representation data, so the characteristic-zero test cannot be exported unchanged.

The target `tannaka-functoriality` supplies DM Proposition 2.21, p.25, at the level of reconstructed neutral data. An exact symmetric tensor functor $U:D\to C$ with a specified comparison of fibres gives $G_C\to G_D$. It is faithfully flat exactly when $U$ is fully faithful and its image is closed under ambient subobjects; it is a closed immersion exactly when every object of $C$ is a subquotient of an object $U(Y)$. Both criteria concern group schemes over all value algebras. They supply the transition quotients and the Artin/Tate quotients below; they are independent of characteristic-zero reductivity.

The proalgebraic approximation uses full tensor-generated subcategories and their finite-type groups. The finite algebra $A_X$ of an additive hull is not itself a coordinate Hopf algebra of such a group. The whole group is an inverse limit of the tensor-generated quotients. Reductivity is then a separate owner: in characteristic zero, DM 2.23 gives **pro-reductivity** from semisimplicity; finite type and the upstream ReductiveGroups hypotheses must be established before claiming reductivity in Satake.

Checks include the trivial category, the weight-one line in $\operatorname{Rep}(\mathbf G_m)$, the nonsemisimple regular $C_p$-representation in characteristic $p$, and the zero additive hull. They discriminate exactness, tensor versus additive generation and inappropriate semisimplicity assumptions.

### Relative reconstruction

Use `relative-reconstruction-datum` before the retained four relative targets. The coefficient category $A$ is essentially small, rigid and symmetric monoidal; it need not be an abelian category over a field. $C$ has a coherent tensor action $V\odot Y$, and $F:C\to A$ is conservative, strong symmetric monoidal and $A$-linear. Its filtered full pieces $C_i$ are stable under the action and the stated split coequalizers. The precise representing datum is
\[
 \operatorname{Hom}_{C_i}(V\odot X_i,Y)
   \simeq\operatorname{Hom}_A(V,F_iY),
\]
natural in $V,Y$, compatibly with action coherence. A bare assertion equating a Hom set to an object of $A$ does not specify this datum.

This gives $L_i(V)=V\odot X_i\dashv F_i$. With the symmetric identification $F_iL_i(V)\simeq A_i\otimes V$, $A_i=F(X_i)$, the monad multiplication defines a possibly noncommutative algebra $A_i$ and the comparison uses left $A_i$-modules. Transposition along the dual gives **right** $A_i^\vee$-comodules. For $B=M_2(k)$, $X_i=B$ with its regular left action, the recovered multiplication must have $E_{12}E_{21}=E_{11}$; the opposite multiplication gives $E_{22}$. That example fixes the side convention beyond a commutative test.

The printed FS VI.10.2 assumes existence and reflection of $F$-split coequalizers. Pinned Beck additionally requires preservation. Every operational relative target below, including `relative-beck-sufficient`, explicitly requires preservation by each $F_i$ and by the full inclusions of pieces, in addition to existence and reflection. No implication from reflection to preservation is claimed. The reflection-only statement stays as an explicit obligation. This is not a claimed counterexample to FS.

In the sufficient theorem, Beck gives the finite-piece equivalences. The tensor product extends to $\operatorname{Ind}(A)$ by filtered colimits. An internal right $H$-comodule **in $A$** is an object $M\in A$ with $\rho:M\to M\otimes H$ in $\operatorname{Ind}(A)$, satisfying counit and coassociativity; morphisms commute with $\rho$. It is not an arbitrary ind-object with a coaction. Compactness of representables factors $\rho$ through a finite $A_i^\vee$; enlarging $i$ makes the finite counit and coassociativity equations hold at that stage. The same argument factors morphism-intertwining equations. This supplies the essential-surjectivity and full-faithfulness checks in `relative-coalgebra-assembly`. The same target constructs the internal coefficient presentation $c_Y:F(Y)^\vee\otimes F(Y)\to H$, with morphism relations and balancing for the $A$-action. For $V\odot Y$, balancing contracts $V^\vee\otimes V$ by evaluation. In particular, when $C=A$ and $F$ is the identity, it yields $H=1$; an unbalanced ordinary coend would not suffice.

The tensor monad's split-coequalizer presentation shows that each piece is generated from $X_i$ by $A$-tensors and these coequalizers. Tensoring by a $C$-object preserves the presentations: their image under $F$ is split, tensor preserves splitting, and reflection detects the resulting coequalizer. Thus an index containing $X_i\otimes X_j$ contains $C_i\otimes C_j$. The adjoint of the tensor of the two units gives $X_k\to X_i\otimes X_j$, hence multiplication
\[
 H\otimes H\longrightarrow H,\qquad H=\mathop{\rm colim}_iF(X_i)^\vee.
\]
The existing bialgebra target proves its unit, associativity, commutativity and compatibility with the coalgebra. It becomes Hopf only after rigidity of $C$ produces the antipode. On coefficients inversion sends $c_Y(\varphi,v)$ to $c_{Y^\vee}(v,\varphi)$, using the bidual identification and symmetry. Duality preserves the morphism and $A$-balancing relations, while evaluation and coevaluation give both convolution identities. An index can be enlarged to contain $Y^\vee$; it is not assumed that $X_i^\vee$ already lies in $C_i$. Finite matrix-monoid representations test the necessity of that last hypothesis. Finite-support graded spaces test that no single global finite representer is assumed; weight-bounded pieces assemble to the group-like coalgebra $k[\mathbb Z]$.

## Comparing fibres and their groups

The retained `tensor-iso-scheme` represents $\operatorname{Isom}^\otimes(\omega_R,\eta)$, where $\eta$ is an exact faithful fibre functor taking values in finite projective $R$-modules. DM Theorem 3.2 constructs its coordinate algebra from the filtered $P_X^\vee$; tensor comparison equations are included, not just invertible matrices at each object. For faithful flatness take the cofinal indices $X\oplus1$, where evaluation $P_{X\oplus1}\to1$ is surjective. Dualizing and applying $\eta$ gives a unit inclusion with finite projective quotient; this remains injective after every base change and makes the flat filtered colimit faithful. An arbitrary $P_X$ need not surject onto the unit. Its coordinate algebra is faithfully flat over $R$, and `tensor-iso-torsor` proves the torsor isomorphism for all value algebras. Pointwise simple transitivity on a set of existing points alone would not prove faithful flatness or local existence.

For $T=\operatorname{Isom}^\otimes(\omega_R,\eta)$, write $G=\operatorname{Aut}^\otimes(\omega)$. Precomposition gives a right $G_R$-action. Over a faithfully flat algebra with a section $t$, the new group is identified with $G$ by $g\mapsto t\circ g\circ t^{-1}$. A change $t_2=t_1\circ h$ changes this by $\operatorname{Int}(h)$. Descent gives `fibre-inner-form`, the twist by the same $G$-torsor under conjugation. This is the generic fibre-group input needed by GLX; it does not establish their separate p-adic identifications. A frame torsor for a projective module $E$ tests the construction: it twists $GL_n$ to $\operatorname{Aut}(E)$. When $G$ is commutative the conjugation twist of the group is trivial, even if the torsor has no base section.

The retained abstract heap is a ternary operation, allowed to have empty carrier. Recovering acting groups requires **nonemptiness**. For affine heaps over a field, use nonemptiness of the scheme, hence faithful flatness to the field, not the stronger condition of a rational point. For a particular value algebra $R$, identifying the acting groups with the left/right groups of the heap of $R$-points requires that this point set be nonempty. The scheme torsor and its actions remain defined when it is empty. The auxiliary quotient theorem has a source obligation to SGA 3 VII.1.4. The main period proof has its acting tensor automorphism groups already, so it does not depend on that quotient construction.

## The Nori period application

Let $D^+_{\rm mod}$ be the **corrected** effective good-pair diagram from MC.5, and $D_{\rm mod}$ its integer-Tate localization. Denote the extended fibre functors by $T_{dR},T_B$. The paper's all-pair representations are degreewise: the exterior/cross-product map for one pair of arbitrary degrees is not always a Künneth isomorphism. Transfer the algebra structure through good-pair diagram comparison, where each pair is concentrated in its designated degree. Include the unit and all product, connecting and excision edges.

For two finite-dimensional diagram representations, set
\[
 A_{dR,B}=\mathop{\rm colim}_{F\subset D\ {
 finite}}\operatorname{Hom}(T_{dR}|F,T_B|F)^\vee.
\]
The equivalent symbol presentation has generators $[v,x,\lambda]$, $x\in T_{dR}(v)$, $\lambda\in T_B(v)^\vee$, modulo bilinearity and the edge relation
\[
 [w,T_{dR}(e)x,\mu]=[v,x,\mu\circ T_B(e)]\quad(e:v\to w).
\]
At a finite diagram this is a quotient of the direct **sum of coefficient spaces** by the dual edge relations. Treating it as an unconstrained product of Hom-duals gives the wrong vector space. Unital multiplicative structures on the good-pair diagram define the algebra product.

The identification with the comparison algebra uses finite-dimensional duality over a **field**. Its integral analogue needs care. For finite projective fibres over a Dedekind domain $R$, the finite symbol module $P_F$ has dual equal to the space of compatible maps, so the comparison map is the bidual map $P_F\to P_F^{\vee\vee}$. Its target is $P_F/(P_F)_{tors}$: the finite torsion-free quotient is projective ([Stacks, Lemma 15.22.11, Tag 0AUW](https://stacks.math.columbia.edu/tag/0AUW)). Passing to the filtered colimit gives $P\to P/P_{tors}$. This is an isomorphism exactly when $P$ is torsion-free.

For a counterexample to the unqualified extension in HMS-paper Remark 2.7, p.10, take $p\to q$ and let both representations have fibre $\mathbb Z$ at each vertex and arrow multiplication by $2$. Compatible map families are $(a,a)$, but
\[
 P_F=(\mathbb Z e_p\oplus\mathbb Z e_q)/\langle2(e_q-e_p)\rangle
      \simeq\mathbb Z\oplus\mathbb Z/2.
\]
The comparison map kills $e_q-e_p$. Its nonvanishing is detected by $e_p\mapsto0$, $e_q\mapsto1$ modulo $2$. The free even symmetric tensor completion gives the same obstruction as an algebra:
\[
 \mathbb Z[x,y]/(2(y-x))\longrightarrow\mathbb Z[t],\qquad x,y\longmapsto t.
\]
All fibres remain free of rank one. Source issue E49 is scoped to the inspected arXiv v5. The rational Nori application below is unaffected.


For rational pairs, formal effective symbols are $[X,Y,i,\omega,\gamma]$, with de Rham class $\omega$ and rational singular homology class $\gamma$. Bilinearity, change of variables and the triple boundary relation are the three defining families. Products use
\[
 (X,Y)\times(X',Y')=(X\times X',\;Y\times X'\cup X\times Y').
\]
The connecting map in cohomology is paired with the boundary in homology. The shared MC.5 parity convention affects both inverse Künneth maps, so the two signs cancel in the coefficient product: for odd classes whose individual evaluations are $2,3$, the paired product is $6$, not $-6$. The formal period presentation is algebraic and does not use numerical integration to impose extra relations.

Let $\mathcal L$ be the formal symbol of $dz/z$ against the positive unit loop on $(\mathbf G_m,\{1\},1)$. Write
\[
 P=P_{eff}[\mathcal L^{-1}],\quad
 A_{eff}=A(T_{dR}^+,T_B^+),\quad
 A_{full}=A(T_{dR},T_B).
\]
The effective coefficient equivalence sends $\mathcal L$ to $\ell\in A_{eff}$. The full comparison theorem must construct the **actual** coefficient inclusion $j:A_{eff}\to A_{full}$ before identifying it as a localization. It must not take the target to be a freely supplied localization of an unrelated effective ring.

The retained full-adapter API has the following mathematical contracts. For the degree-zero embedding $i:D^+\to D$, let $\alpha:T_{dR}^+\simeq i^*T_{dR}$, $\beta:T_B^+\simeq i^*T_B$ be the specified extension comparisons.

1. `NoriPeriod.finiteHomRestrict` sends a full finite comparison $a$ to the family $\beta_v^{-1}\circ a_{(v,0)}\circ\alpha_v$, compatibly with finite-diagram inclusions.
2. `NoriPeriod.comparisonIncl` is dual restriction: $j(\operatorname{ofFinite}(F,\lambda))=\operatorname{ofFinite}(iF,\lambda\circ\operatorname{res}_F)$. Product and unit compatibility are proved on coefficients.
3. `NoriPeriod.comparisonLocalization` states that $A_{full}$, with the specific $A_{eff}$-algebra structure $j$, is the localization away from $\ell$. A tensor comparison with unit Tate coefficient extends uniquely to all integer powers by the rank-one inverse; all full comparisons restrict this way. This verifies the localization property over arbitrary commutative value algebras.
4. `NoriPeriod.fullEquiv` is $E:P\simeq A_{full}$, with $E(\operatorname{ofEff}x)=j(e_{eff}(x))$ and $E(\mathcal L^{-1})=j(\ell)^{-1}$. Its target is fixed by the two extended representations.
5. The second fibre functor and the complex comparison extend through the same universal property, preserving products, units and localization. The comparison on arbitrary pairs is a named supplier contract, not a consequence of neutral abstract reconstruction.

Apply reconstruction to the full, proven neutral Nori category. On
\[
 X=\operatorname{Isom}^\otimes(T_{dR},T_B)
\]
the **left** group is $G_B=\operatorname{Aut}^\otimes(T_B)$, and the **right** group is $G_{dR}=\operatorname{Aut}^\otimes(T_{dR})$, with actions $b\circ x$ and $x\circ d$. Its heap law is
\[
 (a,b,c)\longmapsto a\circ b^{-1}\circ c.
\]
This order is checked by types: each $a,b,c$ maps de Rham to Betti. Prepending a de Rham automorphism would be ill-typed. Both torsor isomorphisms and faithful flatness transport to $\operatorname{Spec}P$ through $E$. The coordinate coactions are
\[
 P\to\mathcal O(G_B)\otimes P,
 \qquad P\to P\otimes\mathcal O(G_{dR}).
\]
The heap coaction has middle factor with the appropriate opposite structure; commutative coordinate algebras permit the usual identification, but the composition order still matters.

The complex comparison $\phi:T_{dR,\mathbb C}\simeq T_{B,\mathbb C}$ is a $\mathbb C$-point of the torsor. Its evaluation is
\[
 \operatorname{per}([v,x,\lambda])=\lambda(\phi_v(x)),
 \quad\operatorname{per}(\mathcal L)=2\pi i,
 \quad\operatorname{per}(\mathcal L^{-1})=(2\pi i)^{-1}.
\]
This gives the coefficient, product, boundary, localization and both coaction compatibilities exported to PS.2 and PS.9. It asserts neither a rational point of the torsor nor injectivity of $\operatorname{per}$. Faithful flatness of a torsor is not the numerical period conjecture; that conjecture belongs to the conjecture layer outside this job. No universal ordinary group law on period numbers follows from the formal torsor.

## The two computed subcategories

### Artin

`artin-diagram-category` is first the degree-zero diagram category of finite étale $k$-schemes, with fibre $\mathbb Q^{X(\mathbb C)}$. Its ambient inclusion is proved separately. For finite Galois $K/k$ with group $\Gamma$, the embedding set is a $\Gamma$-torsor; commuting translations identify its diagram endomorphism algebra with $\mathbb Q[\Gamma]$. All finite $\Gamma$-sets are obtained from cosets and finite disjoint unions. Rational linear combinations and idempotents are essential: the category is not restricted to actual maps of finite sets. Rational Maschke supplies all finite representations as summands of sums of the regular one.

Compatibility with products gives $\Delta(g)=g\otimes g$ on the group algebra. The dual is the function Hopf algebra $\mathbb Q^\Gamma$. Passing over all finite Galois extensions gives
\[
 \operatorname{Art}(k)\simeq
 \operatorname{Rep}^{\rm cont}_{\mathbb Q,fd}(\Gamma_k),\qquad
 G_{Art}=\varprojlim_K\Gamma_{K/k,\mathbb Q},\qquad
 \mathcal O(G_{Art})=\mathop{\rm colim}_K\mathbb Q^{\Gamma_{K/k}}.
\]
Continuity means the rational representation space is discrete. Compactness of $\Gamma_k$ makes the image finite. The group scheme functor is an inverse limit of finite constant **schemes**, not the abstract set $\Gamma_k$ returned unchanged on every value algebra. For $\Gamma=C_2$ and $R=\mathbb Q\times\mathbb Q$, its points are $C_2\times C_2$.

Fullness of `artin-nori-embedding` needs the MC.5 étale realization contract (HMS-book Example 9.1.13, p.213). It sends every ambient Nori morphism between finite-étale $H^0$ objects to a Galois-equivariant map after scalar extension to $\mathbb Q_\ell$. The Betti matrix is rational, so equivariance descends to $\mathbb Q$; the Artin–Galois equivalence lifts it to an Artin morphism, and the faithful Betti fibre proves equality. The finite-diagram calculation alone would not establish fullness for all ambient morphisms.

For ambient subquotient closure, use the **corrected** restriction/corestriction and finite-descent statements requested from MC.5. A Nori motive becomes a sum of units over $\bar k$ iff it is Artin. The unit is ambient simple because its faithful exact fibre is one-dimensional; sums of units are therefore closed under ambient subquotients. Apply this after base change and descend with HMS Corollary 9.5.5. This is the argument that establishes ambient closure: semisimplicity within a full subcategory alone does not suffice. The corrected author discussion dated 26 June 2025, pp.238–239, addresses precisely this problem.

The resulting fully faithful subquotient-closed tensor inclusion induces a faithfully flat quotient $G_{mot}(k,\mathbb Q)\to G_{Art}$ by DM 2.21$a$. Neither the full geometric motivic exact sequence nor connectedness of the geometric motivic group is an input here.

### Pure Tate

Put $L^n=1(-n)$, with negative powers from MC.5's Tate localization. The pure Tate category is the smallest replete full subcategory closed under finite sums and subquotients containing these powers. It is not extension-closed by definition.

The Betti fibre of $L^n$ is one-dimensional, so $L^n$ is simple. The Hodge realization on Tate objects, requested from MC.5, has type $(n,n)$; morphisms between distinct powers vanish. Tensoring with $L^{-n}$ gives $\operatorname{End}(L^n)=\mathbb Q$. A subquotient of a finite sum of these ambient simples is a sum of the same simples. Thus
\[
 \operatorname{Tate}(k)\simeq \operatorname{Vect}^{\mathbb Z}_{fd}(\mathbb Q)
\]
with finite support, $L^n$ in degree $n$, and ordinary symmetry. The inverse sends $(V_n)$ to the finite sum of copowers $V_n\otimes_{\mathbb Q}L^n$. Fixing the positive Betti loop generator identifies its total fibre with the forgetful fibre. No equivalence with André motives and no global motivic weight filtration is needed to prove this smaller example.

A tensor automorphism is scalar $a_n$ in each degree. The unit and tensor laws say $a_0=1$, $a_{m+n}=a_ma_n$. The inverse degree forces $a_1\in R^\times$, hence $a_n=a_1^n$. This is natural for every commutative $\mathbb Q$-algebra $R$. Therefore
\[
 G_{Tate}=\mathbf G_{m,\mathbb Q},\qquad
 \mathcal O(G_{Tate})=\mathbb Q[t,t^{-1}],\quad
 \Delta(t)=t\otimes t,\quad\varepsilon(t)=1,\quad S(t)=t^{-1}.
\]
A nonreduced check uses $R=\mathbb Q[\epsilon]/(\epsilon^2)$: $1+\epsilon$ acts on $L^n$ by $1+n\epsilon$, including negative $n$. On $1\oplus L$ the action is $\operatorname{diag}(1,a)$; the endomorphism algebra is $\mathbb Q\times\mathbb Q$, not $M_2(\mathbb Q)$. $L$'s self-braiding is $+1$, so an exponent-based Koszul sign would fail.

This inclusion likewise gives a faithfully flat Tate quotient of the full motivic group. Extending the category by all ambient extensions yields the **mixed** Tate category; its group can have a unipotent part. The present computation proves no vanishing of all ambient $\operatorname{Ext}^1$ groups. In HMS-book Lemma 10.3.2, the displayed weight-indexed twist has the opposite sign to Definition 10.2.4: with the conventions here, $\operatorname{gr}^W_{2r}$ is a sum of $1(-r)=L^r$. Finding E48 records this independently reviewable misprint in paraphrase.

## Supplier contracts and remaining proof obligations

The dependency chains of the target catalogue end in the pinned declarations, the retained node IDs, the following requested suppliers, or the recorded obligations. The packet remains `complete`/`planned`, rather than `closed`.

1. **MC.5, diagram and tensor interface.** Import the existing `completion-universal-factorisation`, `completion-tensor-assembly` and `completion-rigidity-proof`, together with the canonical diagram/category and localization targets. The universal-property target already cites a proof; the annotated edition locators checked here are Theorem 7.1.13/Corollary 7.1.15, pp.142–144, and §7.4, pp.167–170. The requested addition is the rational Nori category over every geometric base $k⊂\mathbb C$ used by Artin/Tate, since the current rigidity completion is stated only over $\mathbb Q$. This contract includes the category and Betti fibre; it does not import `completion-two-fibres`, which consumes the present fibre-functor extension. For the product-coboundary map use the corrected modified diagram: adjoin inverse excision edges for an open $U\subset Y\subset X$, then compose the inverse-excision, functoriality and boundary edges as in §9.3, pp.222–224. The new edges are represented by inverses of already represented isomorphisms, so the diagram category is unchanged. Check the signs on both cohomologies and the unit. This repairs a supplier; it does not create a second Nori category in MC.6.
2. **MC.5, Artin descent interface.** Provide base change with Betti and tensor compatibility, finite descent of motives/maps, corrected corestriction, and the geometric-triviality descent criterion. For finite $K/k$, $\operatorname{cores}\operatorname{res}(M)=M\otimes H^0(\operatorname{Spec}K)$. The other composition has a functorially split map to the identity and, when $K/k$ is Galois, is the sum of the conjugate motives; it is not the tensor product with a fixed trivial finite vector space on arbitrary motives. Use corrected HMS Lemma 9.5.1, Propositions 9.5.2–9.5.3 and Corollary 9.5.5, pp.231–236. Also supply the exact faithful $\ell$-adic realization of rational Nori motives from pair étale cohomology, compatible with Betti scalar extension, connecting maps, products and integer Tate powers. On a finite étale scheme its $H^0$ is the canonical permutation Galois representation (Example 9.1.13, p.213). This input proves ambient Artin fullness. The full geometric motivic exact sequence is not required here.
3. **MC.5, Tate separation interface.** Extend a faithful Hodge realization of pairs through the universal property, retaining the underlying Betti fibre and type $(n,n)$ on $L^n$, compatibly with tensor and localization (HMS Example 9.1.12, p.213). Record its geometric mixed-Hodge supplier explicitly; the upstream abstract HodgeStructures roadmap alone does not construct the mixed Hodge structure of a pair. Only this restricted use is required for MC.6; a full motivic weight filtration is not hidden in the example.
4. **ComplexComparisonPartII:C5.** Supply comparison for arbitrary pairs, including singular ones, their functorial and connecting edges, inverse excision edges, products with the shared signs, and the unit; extend through integer Tate powers. Smooth-proper comparison alone is insufficient. This is the geometric input to fibre extension, period evaluation and $2\pi i$.
5. **Existing descent and the SF.1 quotient request.** Reuse upstream ModularCurves §0E for effective faithfully flat descent of affine schemes, morphisms, group objects, group laws and actions. Over the affine value bases here, a faithfully flat algebra map is an fpqc cover. Its §0D supplies the finite-étale/Galois-set input for Artin. Only the independent recovery of acting groups of an arbitrary nonempty affine heap remains requested from SF.1: it needs the effective quotient result cited by HMS Appendix A.6 as SGA 3 VII.1.4; its primary proof has not been read. This auxiliary obligation is separate from the main fibre torsor route.
6. **SchemeAndStackFoundations:SF.2, cohomological data.** Retain the MC.6 portion of the main packet’s request for rational singular homology/cohomology and algebraic de Rham cohomology of arbitrary pairs, with finite-dimensionality, triple maps and products. This is an additional cohomological contract beyond the current étale-site layer; coordinate it with C5’s separate comparison contract.
7. **ReductiveGroups, layer 1.** Import its existing finite-dimensional closed-immersion representation and coefficient-generation criterion for finite-type affine groups. This supplies the finite-type direction of `tannaka-finiteness-recognition`; MC.6 does not replan the representation theorem.

Three obligations remain visible: the reflection-only FS hypothesis versus the sufficient preservation version; the auxiliary affine-heap quotient proof; and installation of the existing early-abstract-stage split before a stage-level Satake import. The last is a graph installation action, not a new mathematical theorem. No cycle through MC.5 is introduced by the abstract targets. The full localized comparison is specified by actual coefficient maps above; absent implementation of those heavy carriers is not disguised by admitted data in Lean.

## Target catalogue and definition tests

All IDs in this catalogue have prefix `MotivesAndAlgebraicCycles:MC.6/`. Targets marked **retained** keep their existing node and API names in [the original packet](../packets/MotivesAndAlgebraicCycles.json); their nodes are not duplicated in the part packet. Mentions of good-pair diagrams use the modified excision-enlarged path diagram described above, with its represented inverse edges. The definitions' API and tests below are the planning contracts, not claims that those declarations already exist. For retained theorem proof sketches, the abstract, fibre-comparison and period builds above fix the route; the effective direct dependencies and proof sketches below include the independent review refinements. Apply those refinements at assembly before using the original node.

### Retained targets

#### `torsor` — Torsors in the sense of a ternary operation (heaps)

**Definition; retained.** A torsor in the sense of Baer and Kontsevich, called a heap below to keep it apart from Mathlib's torsor under a given group, is a set X with a map (x, y, z) ↦ (x, y, z) from X × X × X to X such that (1) (x, y, y) = x and (y, y, x) = x for all x, y in X, and (2) ((x, y, z), u, v) = (x, (u, z, y), v) = (x, y, (z, u, v)) for all x, y, z, u, v in X, where the middle term reverses the order of u, z, y. A morphism of heaps is a map commuting with the ternary operations. For a group G the operation (g, h, k) = g h⁻¹ k makes G a heap (Lemma A.2). For a heap X and an element e of X, the operations g·h = (g, e, h) and g⁻¹ = (e, g, e) make X a group G_e with neutral element e, and the heap operation is recovered as (g, h, k) = g h⁻¹ k in G_e (Lemma A.3). The empty set is a heap; a heap becomes a group only after a point is chosen.

**Hypotheses.** The ternary operation is defined on the whole set, with no basepoint chosen; the set may be empty. The group structure G_e of Lemma A.3 requires a chosen element e of X.

**Source.** HMS.2014, Appendix A, Definition A.1, Lemma A.2 and Lemma A.3 (pages 14 to 15), arXiv:1105.0865v5.

**Direct dependencies.** `mathlib:Group`, `mathlib:Torsor`.

**Uses.** MotivesAndAlgebraicCycles:MC.6/torsor-groups: Proposition A.4 builds the left and right groups of a heap from pairs of its elements MotivesAndAlgebraicCycles:MC.6/affine-torsor: a torsor in the category of affine schemes is a heap on S-valued points for every S MotivesAndAlgebraicCycles:MC.6/iso-torsor: the scheme of tensor isomorphisms carries the heap operation f g⁻¹ h Huber and Mueller-Stach, Corollary 3.4 and Remark 3.5: the torsor structure on formal periods is a heap structure given by P → P ⊗ P ⊗ P

**API.**

- `Heap` (data): A type with a ternary operation satisfying the two axioms of Definition A.1; named Heap because Mathlib's Torsor is a torsor under a given group.
- `Heap.op_self_right` (simp): (x, y, y) = x.
- `Heap.op_self_left` (simp): (y, y, x) = x.
- `Heap.op_assoc_left` (relation): ((x, y, z), u, v) = (x, y, (z, u, v)).
- `Heap.op_assoc_middle` (relation): (x, (u, z, y), v) = (x, y, (z, u, v)).
- `Heap.Hom` (structure): Morphisms of heaps, maps commuting with the ternary operation, with identity and composition.
- `Heap.ofGroup` (constructor): The heap on a group G with (g, h, k) = g h⁻¹ k.
- `Heap.toGroup` (constructor): For a heap X and e in X, the group structure on X with g·h = (g, e, h), unit e and g⁻¹ = (e, g, e).
- `Heap.toGroup_op` (characterisation): In the group Heap.toGroup at e, (g, h, k) = g h⁻¹ k.
- `Heap.ofGroup_toGroup_one` (equivalence): Pointing the heap of a group G at 1 gives back G with its multiplication.
- `Heap.ofTorsor` (compatibility): A Mathlib torsor P under a group G is a heap with (p, q, r) = (p /ₛ q) • r; for G acting on itself it is Heap.ofGroup.
- `Heap.Hom.ofGroupHom` (functoriality): A group homomorphism is a morphism of the associated heaps, compatibly with composition.

**Checks.**

- `Heap.ofGroup_int_op` (computation): In the heap of the additive group of the integers, (5, 2, 3) = 5 − 2 + 3 = 6.
- `Heap.empty` (degenerate): The empty type with the empty operation is a heap and carries no group structure, so a heap is not a pointed group.
- `Heap.toGroup_ofGroup_one` (characterisation): For a group G, the multiplication of Heap.toGroup (Heap.ofGroup G) at 1 is the multiplication of G.
- `Heap.not_mul_mul` (non-example): On Z/3 the operation (x, y, z) ↦ x + y + z is not a heap operation: (0, 1, 1) = 2 ≠ 0.
- `Heap.middle_reversed` (non-example): In the heap of Z/3, (x, (z, u, y), v) = (x, y, (z, u, v)) fails for x = y = v = 0, z = 1, u = 0: the left side is 2 and the right side is 1; the reversal in axiom (2) is needed.

#### `tensor-automorphism-group` — The tensor automorphism group of a diagram category, and the motivic Galois group

**Construction; retained.** Let T be a unital graded multiplicative representation, in finite dimensional vector spaces over a field k, of a graded diagram with commutative product structure and unit, and suppose the diagram category C(T) is rigid. Identify C(T) with the finite dimensional comodules over A(T), with f_T the forgetful functor. Then A(T) is a commutative Hopf algebra, the functor sending a commutative k-algebra R to the group of tensor automorphisms of f_T ⊗ R is represented by the affine group scheme G(T) = Spec A(T), and C(T) is equivalent, compatibly with f_T, to the finite dimensional representations of G(T). For Nori motives, MM_Nori = C(D_Nori, H*) with H* relative singular cohomology is rigid (Theorem 1.14), and G_mot = G(H*) = Spec A(D_Nori, H*) is the motivic Galois group; it is attached to the singular cohomology fibre functor.

**Hypotheses.** T is a unital graded multiplicative representation (Definition B.14) over a field, so that A(T) is a commutative bialgebra (Proposition B.16). C(T) is rigid; for Nori motives this is Theorem 1.14, the node MC.5/nori-rigidity. The fibre functor is f_T; another fibre functor gives another group, related to this one by the torsor of MC.6/tensor-iso-torsor.

**Source.** HMS.2014, Theorem 1.14 with its proof (page 8) and Theorem B.10 (page 18), arXiv:1105.0865v5; HMS.2014, Lemma 3.2 (page 12), arXiv:1105.0865v5.

**Direct dependencies.** `MotivesAndAlgebraicCycles:MC.5/nori-motives`, `MotivesAndAlgebraicCycles:MC.5/nori-rigidity`, `MotivesAndAlgebraicCycles:MC.5/diagram-category`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`, `MC.6/rigid-bialgebra-is-hopf`, `tauceti:TauCeti.FGComoduleCat`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.FGPointRepresentationCat`, `tauceti:TauCeti.fgPointRepresentationCategoryEquivalence`, `MC.6/neutral-tannaka-reconstruction`.

**Uses.** MotivesAndAlgebraicCycles:MC.6/period-torsor: the formal periods are a torsor under G_mot MotivesAndAlgebraicCycles:MC.6/tensor-iso-scheme: the scheme of tensor isomorphisms carries actions of the two such groups by composition MotivesAndAlgebraicCycles:MC.6/pro-algebraic-approximation: G(T) is the limit of the algebraic groups of finite subdiagrams PeriodsAndSpecialValues:PS.9: the motivic Galois group and its coaction are consumed by the mixed Tate period layer

**API.**

- `DiagramCategory.tensorAutGroup` (data): The affine group scheme Spec A(T) representing tensor automorphisms of f_T.
- `DiagramCategory.tensorAutGroup_represents` (characterisation): Its functor of points is naturally isomorphic to the tensor automorphism group functor of f_T, through the pinned Tannakian isomorphism.
- `DiagramCategory.tensorAutGroup_point` (universal-property): Every tensor automorphism of f_T ⊗ R is the action of a unique R-point; pointing and reconstructing are inverse.
- `DiagramCategory.equivRep` (equivalence): C(T) is equivalent, compatibly with f_T and the tensor structures, to the finite dimensional representations of the group.
- `DiagramCategory.tensorAutGroup.map` (functoriality): A morphism of diagrams with representations, compatible with the multiplicative structures, induces a homomorphism of the groups in the opposite direction, compatibly with composition.
- `MotivicGalois` (data): G_mot = Spec A(D_Nori, H*), the tensor automorphism group of singular cohomology on Nori motives.
- `MotivicGalois.twistCharacter` (example): The object 1(−1) is a character of G_mot.

**Checks.**

- `tensorAutGroup_point_rat` (characterisation): A tensor automorphism of f_T over k is a k-rational point of G(T).
- `tensorAutGroup_unit` (degenerate): For the diagram consisting of the unit vertex alone with T(1) = k, A(T) = k and G(T) is the trivial group.
- `motivicGalois_twist_character` (computation): Under the equivalence with representations, 1(−1) is a one dimensional representation of G_mot, that is, a character.
- `tensorAutGroup_two_fibre_functors` (non-example): The group built from the de Rham fibre functor is not identified with G_mot by the construction; only the torsor between them is canonical.

#### `comparison-algebra` — The comparison algebra of two representations

**Definition; retained.** Let D be a graded diagram with commutative product structure and unit, and T_1, T_2 two unital graded multiplicative representations of D in finite dimensional vector spaces over Q (the source works over Q; the construction uses only that Q is a field). The comparison algebra is A_{1,2} = colim_F Hom(T_1|F, T_2|F)^∨, the filtered colimit over finite subdiagrams F of the duals of the spaces of families of linear maps T_1(p) → T_2(p), p in F, commuting with the edges of F. It is a commutative Q-algebra, with multiplication induced as for the tensor structure of the diagram category (Proposition B.16) with Hom(T_1|F, T_2|F) in place of End(T|F). Precomposition by End(T_1|F) gives a right source action and its coordinate coaction A_{1,2}→A_{1,2}⊗A_1. Postcomposition by End(T_2|F) gives a left target action and coaction A_{1,2}→A_2⊗A_{1,2}. These statements use ordinary functional composition. For T_1=T_2=T the algebra is A(D,T).

**Hypotheses.** T_1 and T_2 are unital graded multiplicative representations (Definition B.14) of the same graded diagram with commutative product structure and unit, in finite dimensional Q-vector spaces; the source says only 'two representations', and the multiplicativity is needed for the ring structure (finding E36). The colimit is over the filtered system of finite subdiagrams, ordered by inclusion.

**Source.** HMS.2014, Section 2, the setting paragraph, Definition 2.1, Lemma 2.2 and Example 2.3 (page 9), arXiv:1105.0865v5.

**Direct dependencies.** `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`, `MotivesAndAlgebraicCycles:MC.5/diagram`, `mathlib:Coalgebra`.

**Proof plan.**

1. Define Hom(T_1|F, T_2|F) as the subspace of the product of the Hom(T_1(p), T_2(p)), p in F, cut out by the edges of F, its dual, and the filtered colimit.
2. Construct the multiplication by repeating the construction of the tensor structure in Proposition B.16 with homomorphisms in place of endomorphisms, using the isomorphisms T_i(f × g) ≅ T_i(f) ⊗ T_i(g) of both representations; the source calls this the hard part.
3. Construct the two coactions from composition with endomorphisms of T_1|F and of T_2|F, and check compatibility with the multiplication.
4. Record that for T_1 = T_2 = T the construction is A(D, T) with its multiplication.

**Uses.** MotivesAndAlgebraicCycles:MC.6/periods-equal-comparison-algebra: the space of periods of a diagram is identified with this algebra MotivesAndAlgebraicCycles:MC.6/tensor-iso-scheme: its spectrum represents the tensor isomorphisms between the two fibre functors MotivesAndAlgebraicCycles:MC.6/iso-torsor: its spectrum carries the heap structure MotivesAndAlgebraicCycles:MC.6/period-point: the comparison isomorphism is an algebra map from it to the complex numbers

**API.**

- `ComparisonAlgebra` (data): The comparison algebra of two unital graded multiplicative representations of a diagram.
- `ComparisonAlgebra.ofFinite` (constructor): The canonical map from Hom(T_1|F, T_2|F)^∨ to A_{1,2} for a finite subdiagram F.
- `ComparisonAlgebra.exists_finite` (characterisation): Every element comes from some finite subdiagram, and the maps ofFinite are compatible with inclusions of subdiagrams.
- `ComparisonAlgebra.mul` (structure): The commutative multiplication induced by the tensor structure.
- `ComparisonAlgebra.comul` (structure): The source-group coaction A_{1,2}→A_{1,2}⊗A_1 is dual to precomposition x∘g_1.
- `ComparisonAlgebra.rightCoaction` (structure): The target-group coaction A_{1,2}→A_2⊗A_{1,2} is dual to postcomposition g_2∘x. This retained API name does not indicate the action side.
- `ComparisonAlgebra.diagonal` (characterisation): For T_1 = T_2 = T it is A(D, T), the Hopf algebra of the tensor automorphism group when C(T) is rigid.

**Checks.**

- `ComparisonAlgebra.self` (compatibility): For T_1 = T_2 = T, A_{1,2} is A(D, T).
- `ComparisonAlgebra.finite_single` (computation): For a finite subdiagram F with one vertex p and only its identity edge, Hom(T_1|F, T_2|F)^∨ is T_1(p) ⊗ T_2(p)^∨, of dimension dim T_1(p) · dim T_2(p).
- `ComparisonAlgebra.unit_diagram` (degenerate): For the diagram consisting of the unit vertex alone with T_1(1) = T_2(1) = Q, A_{1,2} = Q.
- `ComparisonAlgebra.exists_finite_test` (characterisation): Every element of A_{1,2} is the image of an element of Hom(T_1|F, T_2|F)^∨ for some finite subdiagram F.
- `ComparisonAlgebra.points_are_isos` (non-example): Under the neutral Tannakian hypotheses of MC.6/tensor-iso-scheme, algebra maps A_{1,2} → Q correspond to tensor isomorphisms. Outside that setting an effective rank-one Tate coordinate admits evaluation at zero, which is not a tensor isomorphism.

#### `period-space-of-a-diagram` — The space of periods of a diagram

**Definition; retained.** Let T_1 and T_2 be two representations of a diagram in finite dimensional vector spaces. The space of periods of the pair is the vector space generated by symbols consisting of a vertex, an element of the first representation at that vertex and an element of the dual of the second representation at that vertex, modulo linearity in the two elements and the change of variables relation attached to each edge. It is a commutative algebra, with multiplication given on generators by the product of vertices and the tensor products of the two entries, and there is a natural map from it to the comparison algebra.

**Hypotheses.** T_1 and T_2 are representations of the same diagram in finite dimensional Q-vector spaces; for the multiplication they are unital graded multiplicative representations of a graded diagram with commutative product structure and unit (finding E36). The change of variables relation is attached to each edge f : p → p′ and equates (p′, T_1(f)(ω), γ) with (p, ω, T_2(f)^∨(γ)) for ω in T_1(p) and γ in T_2(p′)^∨.

**Source.** HMS.2014, Definition 2.4, Proposition 2.5 and the construction of Ψ after it (page 9), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/comparison-algebra`, `MotivesAndAlgebraicCycles:MC.5/diagram`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`.

**Uses.** MotivesAndAlgebraicCycles:MC.6/periods-equal-comparison-algebra: the theorem says the natural map is an isomorphism MotivesAndAlgebraicCycles:MC.6/formal-periods: the algebra of formal periods is the instance for the diagram of pairs with de Rham and singular cohomology

**API.**

- `PeriodSpace` (data): The space of periods of a pair of representations of a diagram.
- `PeriodSpace.gen` (constructor): The generator attached to a vertex and two elements.
- `PeriodSpace.mul` (structure): The commutative multiplication on generators.
- `PeriodSpace.toComparison` (compatibility): The natural algebra map to the comparison algebra.
- `PeriodSpace.relations` (characterisation): The two families of relations, linearity and change of variables.

**Checks.**

- `PeriodSpace.linearity` (characterisation): The generator is linear in each of its two entries.
- `PeriodSpace.change_of_variables` (characterisation): For an edge f : p → p′, (p′, T_1(f)ω, γ) = (p, ω, T_2(f)^∨γ); this is the relation that makes the space a quotient and not a free object.
- `PeriodSpace.multiplication_on_generators` (computation): The product of two generators is the generator at the product vertex with the tensor products of the entries.
- `PeriodSpace.single_vertex` (degenerate): For the diagram with one vertex p and its identity edge, the space of periods is T_1(p) ⊗ T_2(p)^∨.

#### `periods-equal-comparison-algebra` — The space of periods is the comparison algebra

**Theorem; retained.** Over a field k, the coefficient map Ψ:P(T_1,T_2)→A_{1,2}, [p,v,λ]↦(f↦λ(f_p(v))), is an isomorphism of vector spaces, and of commutative algebras for unital graded multiplicative representations. For the analogous module presentations over a Dedekind domain R with finite projective fibres, a finite subdiagram F instead gives Hom(T_1|F,T_2|F)=P_F∨ and A_F=P_F∨∨≃P_F/(P_F)_tors. For the full diagram, Ψ identifies A_{1,2} with P/P_tors. Thus the integral map is an isomorphism precisely when the period module is torsion-free; finite projective fibres alone do not imply this. Under the multiplicative hypotheses this is the quotient algebra by its R-torsion ideal.

**Hypotheses.** For the main period theorem k is a field; both fibres are finite-dimensional and the diagrams agree. For the integral comparison use the same coefficient-module/edge-relation presentations over a Dedekind domain R, with finite projective fibres. For the algebra assertion the diagram has a unital graded commutative product and both representations are unital graded multiplicative. Torsion means annihilation by a nonzero element of the coefficient domain; it is not removed from the symbol presentation by definition.

**Source.** HMS.2014, Theorem 2.6 and Remark 2.7, p.10, arXiv:1105.0865v5; STACKS.TORSION, Section 15.22, Lemmas 15.22.2 and 15.22.11 (Tags 0549 and 0AUW); HTML, no page numbers.

**Direct dependencies.** `MC.6/period-space-of-a-diagram`, `MC.6/comparison-algebra`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`.

**Proof plan.**

1. Reduce to a finite subdiagram F. The dual of the coefficient quotient P_F is exactly the space of edge-compatible linear-map families, so the canonical coefficient map is P_F→P_F∨∨. Over a field finite-dimensional duality makes this an isomorphism.
2. Over a Dedekind domain P_F is finitely generated. Its torsion-free quotient is finite projective by Stacks Lemma 15.22.11 (Tag 0AUW), hence reflexive; all maps to R kill torsion. Consequently the bidual map is the quotient by torsion, rather than necessarily an isomorphism.
3. Filtered colimits preserve the quotient maps, and torsion commutes with these colimits: an annihilating relation for a represented element holds at some later finite stage. Hence colim_F(P_F/(P_F)_tors)=P/P_tors. Multiplicativity is checked on the coefficient generators, and torsion is an ideal.
4. Counterexample: for p→q, let both representations have Z at each vertex and arrow 2. Compatible map families are (a,a), while P_F=Z e_p⊕Z e_q /〈2(e_q−e_p)〉. The coefficient map kills the nonzero class e_q−e_p, detected by e_p↦0,e_q↦1 in Z/2. The free symmetric tensor completion, all vertices even and rank one, has period algebra Z[x,y]/(2(y−x)) and comparison algebra Z[t], x,y↦t. Thus adding multiplicativity does not repair the claim.

**Checks.**

- `PeriodComparison.field` (computation): For a single vertex with fibres k^m and k^n, Ψ is the usual isomorphism k^m⊗(k^n)∨≃Hom(k^m,k^n)∨, of dimension mn.
- `PeriodComparison.integral_torsion` (counterexample): For the two-vertex rank-one Z diagram with common arrow 2, P=Z⊕Z/2, A=Z and Ψ kills the nonzero order-two difference e_q−e_p. The homomorphism e_p↦0,e_q↦1 into Z/2 detects its nonvanishing.
- `PeriodComparison.integral_tensor` (counterexample): The free even symmetric tensor completion has P=Z[x,y]/(2(y−x)), A=Z[t], and Ψ(x)=Ψ(y)=t. Modulo 2 the class y−x is nonzero, so the algebra map is also not injective.
- `PeriodComparison.integral_saturated` (computation): Replacing the common arrow 2 by 1 gives the saturated relation e_q=e_p, hence P=A=Z and Ψ is an isomorphism.

#### `formal-periods` — Formal periods

**Definition; retained.** The space of effective formal periods is the vector space over the rational numbers generated by symbols consisting of a variety over the rational numbers, a subvariety, a class in relative algebraic de Rham cohomology in degree d and a class in relative singular homology in degree d, modulo three families of relations: linearity in the last two entries; for every morphism of pairs, the equality of the symbol formed with the pullback of a de Rham class and the symbol formed with the pushforward of the homology class; and for every triple of nested subvarieties, the equality of the symbol formed with the connecting map in homology and the symbol formed with the connecting map in de Rham cohomology. It becomes an algebra by the product of pairs with the exterior product of the two entries. The space of formal periods is the localisation of the effective one at the period of the pair given by the multiplicative group, the point one, the logarithmic differential form and the unit circle. Write P_eff=P^+, L=(G_m,{1},dX/X,S^1) in P_eff and P=P_eff[L^-1]. Export the canonical map P_eff -> P and the explicit inverse of its image of L; L*L^-1=L^-1*L=1. The single algebra/presentation already planned here is imported by PeriodsAndSpecialValues:PS.2, which owns its integration/evaluation contract and verifies the localization rather than defining a duplicate formal-period algebra.

**Hypotheses.** The base field is the rational numbers. The relative de Rham and singular homology groups are those of the pair, in the same degree d. The localisation is at the single displayed element.

**Source.** HMS.2014, Definition 2.8, p.10, with Remark 2.9, p.11, arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/period-space-of-a-diagram`, `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`, `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `SchemeAndStackFoundations:SF.2`, `mathlib:IsLocalization.Away.invSelf`, `mathlib:IsLocalization.Away.mul_invSelf`, `mathlib:Polynomial.not_isUnit_X`, `mathlib:LaurentPolynomial.T_add`.

**Proof plan.**

1. List the generators and the three families of relations, in the order the source gives them.
2. Define the algebra structure by the product of pairs, with the union of the two mixed products as the subvariety and the exterior products of the two entries.
3. Define the localisation at the displayed period.
4. Record that the definition is a variant of Kontsevich's, which restricts to smooth varieties with a normal crossings divisor, uses top degree differential forms rather than cohomology classes, and imposes the third relation only in a special case.

**Uses.** MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra: the theorem identifies this algebra with the comparison algebra of de Rham and singular cohomology MotivesAndAlgebraicCycles:MC.6/period-torsor: the torsor statement is about this algebra PeriodsAndSpecialValues:PS.2: constructs the evaluation in C on this algebra and traces relations through the torsor and integral presentations; it imports this definition

**API.**

- `FormalPeriods.eff` (data): The algebra P^+ of effective formal periods.
- `FormalPeriods` (data): The algebra P of formal periods, the localisation of P^+ at the period of the multiplicative group.
- `FormalPeriods.gen` (constructor): The generator attached to a variety X over Q, a closed subvariety D, a class ω in H^d_dR(X, D) and a class γ in H_d(X(C), D(C), Q).
- `FormalPeriods.gen_add_left` (simp): Linearity of the generator in ω, and likewise in γ.
- `FormalPeriods.gen_pullback` (relation): Relation (2): for f : X → X′ with f(D) ⊂ D′, gen(X, D, f^*ω′, γ) = gen(X′, D′, ω′, f_*γ).
- `FormalPeriods.gen_boundary` (relation): Relation (3): for Z ⊂ Y ⊂ X, gen(Y, Z, ω, ∂γ) = gen(X, Y, δω, γ).
- `FormalPeriods.mul_gen` (simp): gen(X, D, ω, γ) · gen(X′, D′, ω′, γ′) = gen(X × X′, D × X′ ∪ X × D′, ω ∧ ω′, γ × γ′).
- `FormalPeriods.twoPiI` (data): The element gen(G_m, {1}, dX/X, S^1), invertible in P.
- `FormalPeriods.ofEff` (constructor): The localisation map P^+ → P.
- `FormalPeriods.tateInverse` (data): The element L^-1 in P, obtained from pinned IsLocalization.Away.invSelf for the effective Tate symbol L.
- `FormalPeriods.tate_mul_inverse` (simp): ofEff(L)*tateInverse=1, by the pinned localization API.
- `FormalPeriods.tate_inverse_mul` (simp): tateInverse*ofEff(L)=1.

**Checks.**

- `FormalPeriods.twoPiI_isUnit` (computation): The formal period of (G_m, {1}, dX/X, S^1) is a unit in P.
- `FormalPeriods.gen_pullback_test` (characterisation): For a morphism of pairs f, gen(X, D, f^*ω′, γ) = gen(X′, D′, ω′, f_*γ).
- `FormalPeriods.unit` (degenerate): gen(Spec Q, ∅, 1, [point]) is the unit of P^+, the pair (Spec Q, ∅) in degree 0 being the unit vertex.
- `FormalPeriods.mul_gen_test` (compatibility): The product of two generators is the generator of the product pair, with subvariety D × X′ ∪ X × D′, form ω ∧ ω′ and chain γ × γ′.
- `FormalPeriods.tate_inverse_test` (computation): In P, ofEff(L)*tateInverse=1 and tateInverse*ofEff(L)=1; merely naming the Tate symbol in P_eff fails to supply this contract.
- `FormalPeriods.effective_tate_nonunit` (non-example): In the rank-one Tate algebra model P_eff=Q[t], t is not a unit. Thus Q[t] cannot be the coordinate ring of the rank-one Tate G_m-torsor with its prescribed coordinate: the required inverse is absent.
- `FormalPeriods.tate_laurent_model` (computation): In the localized rank-one model Q[t,t⁻¹], t·t⁻¹=t⁻¹·t=1. This checks the integer Tate inverse; the actual Nori pure-Tate category and G_m computation are the separate pure-tate targets of this part.

#### `formal-periods-equal-comparison-algebra` — Formal periods are the comparison algebra of de Rham and singular cohomology

**Theorem; retained.** Let D be the diagram of pairs over Q, T_1 = H*_dR algebraic de Rham cohomology and T_2 = H* singular cohomology with rational coefficients. Then the algebra of formal periods P agrees with the space of periods P_{1,2} of these two representations and with their comparison algebra A_{1,2}: the three are canonically isomorphic Q-algebras, P = P_{1,2} = A_{1,2}, the ring structure on the comparison algebra of the diagram of all pairs being that of the diagram of good pairs, to which it is canonically identified. The identification first gives P_eff ≃ A^eff_{1,2}, carrying L to its comparison class chi_{1,2}; applying the pinned localization-of-an-algebra-equivalence API gives P_eff[L^-1] ≃ A^eff_{1,2}[chi_{1,2}^-1]=A_{1,2}. Export that localized identification to PS.2 and the full tensor-isomorphism torsor theorem; the effective identification alone does not identify Spec(P_eff) with the full torsor. Here A_{1,2} means the comparison algebra of the two extended representations on the full integer-Tate diagram, not merely the localization of an unspecified effective ring. NoriPeriod.comparisonLocalization identifies that actual full algebra as the localization for the canonical coefficient inclusion, and NoriPeriod.fullEquiv is the resulting canonical algebra equivalence from P.

**Hypotheses.** The base field is Q and D is the diagram of pairs of Definition 1.1, localised at (G_m, {1}, 1). The two representations are algebraic de Rham cohomology and singular cohomology of pairs, in the degree of the vertex; the comparison isomorphism plays no part in the identification. On the diagram of all pairs the two cohomologies are not graded multiplicative representations, so the algebra structures are taken through the diagram of good pairs (finding E37), with the graded multiplicative structures of the exterior and cross products and the product of pairs (PairDiagram.ProductCompatible in the legacy prototype of the original roadmap (the compact MC.6 suggested file does not implement this interface)): for other structures the products of P_eff and of A_{1,2} need not agree on generators. Use the convention already fixed in MC.5/nori-tensor-category: the inverse de Rham Künneth map is (-1)^{ij} times the exterior product, and the inverse singular map evaluates to (-1)^{ij} times the product of the two evaluations. Both signs are necessary and cancel in the comparison coefficient, leaving the formal-period product unsigned. For the full comparison-algebra adapter, use D^+ of good pairs, its geometric product and unit (Spec Q, empty, 0), and the two unital graded multiplicative structures with the common MC.5 sign. In the legacy prototype ProductCompatible now records unit_eq and unital₁, unital₂ as well as mul_eq and the two signed product laws. Both Tate fibres at g=(G_m,{1},1) have rank one. Extend these same representations by MC.5/diagram-localisation; do not supply unrelated representations on the full diagram. These are mathematical supplier contracts, not assumptions of effective rigidity.

**Source.** HMS.2014, Theorem 2.10 with its proof (page 11), arXiv:1105.0865v5; HMS.2014, Definition B.14, pp.20–21, with the convention recorded in MC.5/nori-tensor-category (E29); arXiv:1105.0865v5; HMS.2014, Theorem 2.10, p.11; Lemma B.21 and Proposition B.22, pp.25–26; arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/formal-periods`, `MC.6/periods-equal-comparison-algebra`, `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`, `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`, `mathlib:IsLocalization.algEquivOfAlgEquiv`.

**Proof plan.**

1. Effective case: identify the generators and the three families of relations of P^+ with those of P^eff_{1,2}, using that H_d(X(C), D(C), Q) is the dual of H^d(X(C), D(C), Q); relation (2) is change of variables along the functoriality edges and relation (3) along the coboundary edges.
2. Route the algebra structure through good pairs: the comparison algebras of all pairs and of good pairs are identified (the analogue for two representations of Corollary 1.7, MC.5/diagram-comparison), and on good pairs both cohomologies are graded multiplicative, so Theorem 2.6 applies as a statement about algebras (finding E37).
3. Apply Theorem 2.6 (MC.6/periods-equal-comparison-algebra) to obtain P^eff_{1,2} = A^eff_{1,2} and check that the resulting identification with P^+ is multiplicative on generators, where it is the Künneth product. On a product of degree i and degree j the two inverse Künneth signs contribute (-1)^{2ij}=1; omitting only one of them would give the wrong product for two odd pairs.
4. On each finite set F of effective good vertices, restrict full comparison matrices along v -> (v,0) and conjugate by the canonical degree-zero extension isomorphisms. Dualizing this restriction and passing to the filtered colimit defines the coefficient inclusion j:A^eff_{1,2}->A^full_{1,2}; multiplicativity follows from the induced product structures. See the typed NoriPeriod.finiteHomRestrict and comparisonIncl contracts.
5. Let ell=e_eff(L). A tensor comparison on the effective diagram whose Tate coefficient is a unit extends uniquely to integer Tate powers: use powers of its rank-one Tate map and the inverse dual map for negative powers. This construction is compatible with functoriality, connecting and localization edges; conversely every full comparison restricts and makes ell a unit. Apply this to arbitrary commutative Q-algebras and the finite-coefficient description to prove IsLocalization.Away ell A^full for precisely j. This is the comparison-algebra analogue of B.22 used in Theorem 2.10; it is not supplied by the general Mathlib localization equivalence.
6. Compose localization of e_eff with the unique equivalence between A^eff[ell^-1] and A^full over j. Obtain E=NoriPeriod.fullEquiv, E(ofEff x)=j(e_eff x), and E(L^-1)=j(ell)^-1. This construction identifies the actual full diagram comparison algebra before the full-category torsor interpretation.

**API.**

- `FormalPeriods.localizeComparison` (compatibility): For an effective Q-algebra identification e:P_eff ≃ A_eff, the imported IsLocalization.algEquivOfAlgEquiv induces P ≃ Localization.Away(e(L)), compatibly with the canonical maps on every effective element. This is the localization step in the existing comparison theorem, not a new general localization theory.
- `FormalPeriods.localizeComparison_ofEff` (simp): The induced localized comparison sends ofEff(x) to the canonical image of e(x), for every effective element x, in particular the Tate class.
- `PairDiagram.ProductCompatible.signs_cancel` (compatibility): For a parity a in Z/2 and u,v in Q, ((-1)^a u)((-1)^a v)=uv. The de Rham and singular inverse Künneth maps must use the same MC.5 sign for the coefficient product to agree with the unsigned formal-period product.
- `NoriPeriod.finiteHomRestrict` (functoriality): For F finite in D^+, res_F:Hom(T_dR^full|iF,T_B^full|iF)->_Q Hom(T_dR^+|F,T_B^+|F), with (res_F a)_v = beta_v^-1 o a_(v,0) o alpha_v. Here alpha:T_dR^+ ~= i^*T_dR^full and beta:T_B^+ ~= i^*T_B^full are MC.5 degree-zero extension isomorphisms. Compatible with every inclusion F subset Fprime.
- `NoriPeriod.comparisonIncl` (constructor): j:A_eff ->_Q-alg A_full, whose underlying linear map satisfies j(ofFinite F lambda)=ofFinite(iF)(lambda o res_F). The full algebra is ComparisonAlgebra of the specified MC.5 extensions, with induced multiplicative structures.
- `NoriPeriod.effectiveEquiv` (comparison): e_eff:P_eff ~=_Q-alg A_eff, sending a good-pair symbol (v,omega,gamma) to the coefficient a |-> gamma(a_v omega); all-pair symbols are transported through the existing diagram comparison. The Tate symbol maps to ell.
- `NoriPeriod.comparisonLocalization` (characterisation): For precisely the A_eff-algebra structure induced by comparisonIncl j, IsLocalization.Away ell A_full, where ell=effectiveEquiv(L). In particular j(ell) is a unit. The map and algebra are fixed before this theorem.
- `NoriPeriod.fullEquiv` (comparison): E:P ~=_Q-alg A_full is localization of effectiveEquiv followed by the comparisonLocalization identification. For every x:P_eff, E(ofEff x)=j(e_eff x). It identifies the actual full comparison algebra, not just Localization.Away(e_eff L).
- `NoriPeriod.fullEquiv_tateInverse` (simp): j(ell)*E(L^-1)=1=E(L^-1)*j(ell). This and fullEquiv_ofEff pin the map on the localization generators.

**Checks.**

- `NoriPeriod.finite_coefficient_square` (compatibility): For every finite F, its coefficient lambda and every inclusion F subset Fprime, both paths to A_full equal the coefficient dual to res_F. At a singleton v this is conjugation by alpha_v,beta_v, not a freely chosen algebra map.
- `NoriPeriod.fullEquiv_generator` (computation): For a good pair v, E(ofEff[v,omega,gamma]) is the full degree-zero coefficient a |-> gamma(beta_v^-1(a_(v,0)(alpha_v omega))).
- `NoriPeriod.fullEquiv_tate_inverse` (computation): E(L^-1)*j(ell)=1, and a map fixing all effective generators but sending L^-1 to 0 fails this identity. In the rank-one model the map is Q[t,t^-1]~=Q[t,t^-1] with t and t^-1 fixed.

#### `fibre-functor-extension` — A second representation extends to a fibre functor

**Lemma; retained.** Let T_1 and T_2 be two representations of the same diagram in finite dimensional Q-vector spaces, and φ : T_1 ⊗ K → T_2 ⊗ K an isomorphism of representations after extension of scalars to a field K containing Q. Then T_2 extends to a fibre functor, a faithful exact Q-linear functor to finite dimensional Q-vector spaces, on the diagram category C(T_1). If T_1 and T_2 are unital graded multiplicative representations and φ is compatible with the multiplicative structures, the extension is a tensor functor (finding E36). For the full Nori application apply this lemma on D^full with T_1=T_B^full, T_2=T_dR^full and the inverse extended comparison. This gives an actual faithful exact Q-linear symmetric tensor fibre functor omega_dR on MM_Nori and a complex tensor natural isomorphism Phi:omega_dR tensor C ~= omega_B tensor C, restricting to the supplied cohomology comparison on every integer-Tate vertex.

**Hypotheses.** T_1 and T_2 are representations of the same diagram in finite dimensional Q-vector spaces. φ is an isomorphism of representations after extension of scalars to a field K containing Q; it is part of the data. For the tensor statement, T_1 and T_2 are unital graded multiplicative representations and φ is compatible with the multiplicative structures; the source does not say this (finding E36). The universal property of C(T_1) is used as stated in Proposition B.8; its proof is in von Wangenheim's work, not obtained (gap). In the Nori specialization use the existing MC.5 full localized category, its singular fibre omega_B and rigidity, the geometric unit and unital signed good-pair products, and the common rank-one Tate fibres. The complex all-pairs comparison comes from ComplexComparisonPartII:C5 and is restricted to good pairs before extension.

**Source.** HMS.2014, Section 3, the setting paragraph and Lemma 3.1 with its proof (page 12), arXiv:1105.0865v5; HMS.2014, Lemma 3.1 with proof, p.12; Theorem 1.14, p.8; Lemma B.21 and Proposition B.22, pp.25–26; arXiv:1105.0865v5; HMS.2017.corr2025, Theorem 7.1.13, Corollary 7.1.15, pp.142–144, and Propositions 7.4.1–7.4.2, pp.168–169.

**Direct dependencies.** `MotivesAndAlgebraicCycles:MC.5/diagram-category`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`, `MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation`, `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `MotivesAndAlgebraicCycles:MC.5/nori-rigidity`, `ComplexComparisonPartII:C5`.

**Proof plan.**

1. Form the abelian category A of pairs (V_1, V_2) of finite dimensional Q-vector spaces with an isomorphism V_1 ⊗ K → V_2 ⊗ K, and observe that T_1, T_2 and φ define a representation T of the diagram in A.
2. The projection p_1 : A → Q-Mod is faithful and exact and p_1 ∘ T = T_1, so the universal property of the diagram category gives a faithful exact functor C(T_1) → A over p_1.
3. Compose with the projection p_2 to obtain the extension of T_2; it is exact since p_2 is, and faithful since a morphism whose second component vanishes has, after conjugating by the isomorphisms over K, vanishing first component, and f_{T_1} is faithful.
4. Under the multiplicative hypotheses, A is a tensor category with the componentwise tensor product, T is a graded multiplicative representation in it, and the multiplicative universal property (Proposition B.16) makes the functor, and so the extension of T_2, a tensor functor.
5. Extend the effective good-pair representations to D^full by MC.5: at (v,n) use T(v) tensor T(g)^{tensor n}, with dual powers for n<0. Extend the comparison by the same tensor powers, using its inverse dual for negative powers. On (v,0) recover the given effective comparison after alpha_v,beta_v.
6. Use the abelian category of pairs of rational vector spaces with an isomorphism after complex base change, now with the componentwise tensor product. Its two projections, together with the multiplicative universal property, extend both rational fibres and the same comparison natural isomorphism to the category. Apply this with the Betti representation first, so the base category is the already rigid MM_Nori. Do not infer effective rigidity or ask for a new neutral context.
7. Applying the construction with the representations exchanged gives an equivalence C(T_dR^full) ~= MM_Nori. The universal property and generation by diagram objects identify both composites with the identity, compatibly with tensor structures. Transport the existing MC.5 rigidity across this equivalence when the generic tensor-isomorphism theorem is formulated on C(T_dR^full).

**API.**

- `NoriPeriod.fullRepresentations` (data): T_dR^full,T_B^full:D^full -> Vec_Q are exactly the MC.5 integer-Tate extensions of the good-pair cohomologies, with their induced unital signed product structures. Their degree-zero restrictions are alpha,beta above. No independent representation is an input.
- `NoriPeriod.fullComparison` (constructor): phi_full:T_dR^full tensor C ~=tensor T_B^full tensor C is the Tate-power extension of phi_good. It restricts along i to phi_good via alpha,beta; on negative Tate powers it is the inverse dual tensor power.
- `NoriPeriod.deRhamFibre` (data): omega_dR:MM_Nori -> Vec_Q is faithful, exact, Q-linear and symmetric monoidal. For the full universal diagram lift U:D^full->MM_Nori, eta_dR:omega_dR o U ~= T_dR^full. The singular fibre omega_B and eta_B:omega_B o U ~= T_B^full are the existing MC.5 suppliers.
- `NoriPeriod.fibreComparison` (comparison): Phi:omega_dR tensor C ~=tensor omega_B tensor C, with (eta_B tensor C) o (Phi U) = phi_full o (eta_dR tensor C). This pins the comparison on every localized diagram generator and hence on subquotients of finite sums.
- `NoriPeriod.categoryEquiv` (comparison): A Q-linear exact symmetric tensor equivalence C(T_dR^full) ~= MM_Nori, commuting with the diagram lifts and both rational fibre functors up to the specified isomorphisms. In particular C(T_dR^full) is rigid because MM_Nori is, not because the effective category is assumed rigid.

**Checks.**

- `NoriPeriod.fibre_degree_zero` (compatibility): On (v,0), the two fibre identifications and Phi recover exactly phi_v, for both functoriality and connecting edges. A natural isomorphism multiplied by 2 fails the unit condition.
- `NoriPeriod.fibre_negative_tate` (computation): On (unit,-1), Phi is the inverse dual of the rank-one Tate comparison. The evaluation and coevaluation diagrams commute; using the original scalar instead of its inverse fails unless its square is 1.
- `NoriPeriod.full_not_effective_rigid` (non-example): For the effective Tate model with coefficients Q[t], the permitted tensor endomorphism t|->0 has no inverse. After adjoining t^-1 only unit scalars remain. The full neutral context cannot be replaced by an assumed effective one.

#### `iso-torsor` — The scheme of tensor isomorphisms is a torsor

**Theorem; retained.** In the setting of MC.6/tensor-iso-scheme, inversion f ↦ f⁻¹ is an isomorphism of affine schemes X_{1,2} → X_{2,1}, and the composite X_{1,2} × X_{1,2} × X_{1,2} → X_{1,2} × X_{2,1} × X_{1,2} → X_{1,2}, (f, g, h) ↦ f ∘ g⁻¹ ∘ h, makes X_{1,2} an affine heap in the sense of MC.6/affine-torsor; likewise X_{2,1}. The composition actions of G_1 and G_2 are compatible with the heap operation, and whenever X_{1,2}(R) is nonempty, G_2(R) and G_1(R) identify with its left and right heap groups. The scheme actions and torsor identities remain defined even when X_{1,2}(R) is empty.

**Hypotheses.** The diagram category of the first representation is neutral Tannakian, and the second representation is extended to it as a tensor fibre functor (MC.6/fibre-functor-extension under the multiplicative hypothesis of finding E36). The schemes are the spectra of the comparison algebras, as in MC.6/tensor-iso-scheme.

**Source.** HMS.2014, Theorem 3.3 with its proof (page 13), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/affine-torsor`, `MC.6/torsor-groups`, `MC.6/tensor-iso-scheme`, `MC.6/tensor-automorphism-group`.

**Proof plan.**

1. Construct the inversion map X_{1,2} → X_{2,1} on points and check that it is an isomorphism of affine schemes with inverse the inversion X_{2,1} → X_{1,2}.
2. Construct the ternary operation as the composite in the source's diagram: inversion in the middle factor followed by the composition maps of MC.6/tensor-iso-scheme.
3. Check the two heap axioms on R-points for every R, where they are identities of composition of tensor isomorphisms: f f⁻¹ h = h, f g⁻¹ g = f, and (f g⁻¹ h) u⁻¹ v = f (u h⁻¹ g)⁻¹ v = f g⁻¹ (h u⁻¹ v).
4. Check the action/heap identities on R-points for all R. If X_{1,2}(R) has a point, use it to identify G_2(R) and G_1(R) with the left and right groups of that nonempty heap. For an empty set of R-points this group-recovery assertion is omitted. The scheme torsor statement follows from tensor-iso-torsor by fpqc descent, not from nonemptiness of every point set.

**Checks.** The torsor structure is basepoint free, which is essential because there is no canonical isomorphism between de Rham and singular cohomology over the rationals. The inversion identifies the two schemes of isomorphisms, so the choice of order of the two fibre functors is immaterial. The identities are checked at the level of affine schemes and not only on rational points. The planned heap and point-representability interfaces require the complete neutral Tannakian context, not arbitrary graded multiplicative representations or a comparison alone. A torsor can have no R-point. Pointwise heap-group reconstruction is asserted only after nonemptiness, whereas the scheme torsor is fpqc locally inhabited.

#### `period-torsor` — The spectrum of the formal periods is a torsor under the motivic Galois group

**Theorem; retained.** Let T_1 = H*_dR and T_2 = H* on the diagram of pairs over Q, with the comparison isomorphism over C. The algebra of formal periods P carries a natural map P → P ⊗ P ⊗ P making Spec P an affine heap: through P = A_{1,2} it is the heap X_{1,2} = Iso⊗(H*_dR, H*) of MC.6/iso-torsor. The motivic Galois group G_mot = Aut⊗(H*) of MC.6/tensor-automorphism-group acts on Spec P by composition, compatibly with the heap map, and Spec P is a G_mot-torsor, faithfully flat over Q; the tensor automorphism group of de Rham cohomology acts on the other side. On period matrices the heap map is P_{ij} ↦ Σ_{k,l} P_{ik} ⊗ P⁻¹_{kl} ⊗ P_{lj}. Fix ordinary functional composition: for f:omega_dR->omega_B, the Betti group acts on the left by b.f=b o f and the de Rham group on the right by f.d=f o d. Thus the canonical Betti coaction has type P -> O(G_mot) tensor_Q P, and the de Rham coaction has type P -> P tensor_Q O(G_dR). These explicit formulas fix the convention independently of diagrammatic composition notation in the source.

**Hypotheses.** The base field is Q; the diagram is the diagram of pairs; T_1 is de Rham and T_2 singular cohomology. Supply PairDiagram.PeriodComparison for all effective pairs (request ComplexComparisonPartII:C5), including pullback and connecting-map compatibility, unitality and multiplicativity; supply the good-pair product structure P, graded multiplicative structures M_1 and M_2, and PairDiagram.ProductCompatible relating them to the actual exterior and cross products. The Tannakian input is taken on MM_Nori = C(D_Nori, H*), which Theorem 1.14 proves neutral Tannakian; de Rham cohomology is extended to it by MC.6/fibre-functor-extension with the roles of the two representations exchanged, and X_{2,1} is identified with X_{1,2} by inversion (finding E39). G_mot is the tensor automorphism group of singular cohomology, as in Theorem 1.14.

**Source.** HMS.2014, Corollary 3.4 with its proof and Remark 3.5 (page 13); Theorem 0.2 (page 2), arXiv:1105.0865v5; HMS.2014, Lemma 3.2, p.12; Theorem 3.3, Corollary 3.4 and Remark 3.5, p.13; arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/iso-torsor`, `MC.6/tensor-iso-torsor`, `MC.6/formal-periods-equal-comparison-algebra`, `MC.6/tensor-automorphism-group`, `MC.6/fibre-functor-extension`, `MotivesAndAlgebraicCycles:MC.5/nori-motives`, `ComplexComparisonPartII:C5`, `MotivesAndAlgebraicCycles:MC.5/nori-rigidity`.

**API.**

- `NoriPeriod.formalHeap` (data): The affine heap on P transported along E: h_P:P->_Q-alg P tensor P tensor P satisfies h_A o E = (E tensor E tensor E) o h_P. On R-points its operation is (f,g,h)|->f o g^-1 o h.
- `NoriPeriod.bettiCoaction` (functoriality): rho_B:P->_Q-alg O(G_mot) tensor P, the left Betti coaction induced by b.f=b o f on full tensor-isomorphism points. Its group algebra is canonically A(D^full,T_B^full), identified with the existing MC.5 Nori Hopf algebra through the common diagram and signed fibre structure.
- `NoriPeriod.deRhamCoaction` (functoriality): rho_dR:P->_Q-alg P tensor O(G_dR), the right de Rham coaction induced by f.d=f o d. Both coactions are transported through E from the full comparison algebra; their identities hold over every commutative Q-algebra, not only at the complex period point.
- `NoriPeriod.fullTorsor` (characterisation): P is faithfully flat over Q, rho_B and rho_dR are counital/coassociative and commute, and (b,f)|->(b o f,f) and (f,d)|->(f,f o d) are scheme isomorphisms G_mot x X ~= X x X ~= X x G_dR with the indicated coordinate orders.

**Checks.**

- `NoriPeriod.tate_torsor` (computation): For the rank-one model P=Q[t,t^-1], rho_B(t)=u tensor t, rho_dR(t)=t tensor v and h_P(t)=t tensor t^-1 tensor t. The inverse coordinate transforms inversely. Q[t] fails both inverse identities.
- `NoriPeriod.action_order` (compatibility): On a rank-two free tensor fibre over Q, take b=[[1,1],[0,1]], d=[[1,0],[1,1]], f=I. The left Betti and right de Rham actions give b f d=[[2,1],[1,1]], whereas d b=[[1,1],[1,2]]. This detects silently swapping the named groups or reversing functional composition; the two actions commute because they act on different sides.
- `NoriPeriod.heap_identity` (characterisation): For every commutative Q-algebra R and every full comparison f, h(f,f,f)=f, including the unit and all negative Tate powers. The compatibility is through E, rather than through an unrelated heap chosen on the same ring.

#### `torsor-groups` — The left and right groups of a nonempty heap

**Construction; retained.** Let X be a nonempty heap. On X × X put μ_l((a, b), (c, d)) = ((a, b, c), d). Then μ_l is associative with left neutral elements (x, x); the relation (a, b) ∼_l μ_l((a, b), (x, x)), x in X, is an equivalence relation, μ_l descends to G_l = (X × X)/∼_l, and G_l is a group with inverse [(a, b)]⁻¹ = [(b, a)], acting on X on the left by [(a, b)]·x = (a, b, x); this action is simply transitive and the heap operation factors through it. For e in X the map x ↦ [(x, e)] is a group isomorphism from the group G_e of Lemma A.3 to G_l, with inverse [(a, b)] ↦ (a, b, e). Symmetrically μ_r((a, b), (c, d)) = (a, (b, c, d)) defines a group G_r acting simply transitively on the right.

**Hypotheses.** X is a nonempty heap; for the empty heap the quotient is empty and is not a group (finding MotivesAndAlgebraicCycles/E42). The construction chooses no point; a point e is used only to compare G_l with G_e.

**Source.** HMS.2014, Appendix A, Proposition A.4 with its proof (pages 15 to 16), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/torsor`, `mathlib:Torsor`.

**Uses.** MotivesAndAlgebraicCycles:MC.6/affine-torsor-groups: Proposition A.6 forms the same quotient in affine schemes MotivesAndAlgebraicCycles:MC.6/iso-torsor: for the scheme of tensor isomorphisms the left and right groups are, on points, the two tensor automorphism groups acting by composition

**API.**

- `Heap.leftGroup` (data): The group G_l = (X × X)/∼_l of a nonempty heap.
- `Heap.leftGroup.mk` (constructor): The class [(a, b)] of a pair.
- `Heap.leftGroup.mul_mk` (simp): [(a, b)]·[(c, d)] = [((a, b, c), d)].
- `Heap.leftGroup.inv_mk` (simp): [(a, b)]⁻¹ = [(b, a)].
- `Heap.leftGroup.smul_mk` (simp): [(a, b)]·x = (a, b, x).
- `Heap.leftTorsor` (compatibility): A nonempty heap is a Mathlib torsor under its left group, with x /ₛ y = [(x, y)].
- `Heap.leftGroupEquiv` (equivalence): For e in X, the group isomorphism x ↦ [(x, e)] from Heap.toGroup at e to the left group.
- `Heap.rightGroup` (data): The group G_r, acting simply transitively on the right.
- `Heap.leftGroup.map` (functoriality): A morphism of nonempty heaps induces a homomorphism of left groups, compatibly with identities and composition.

**Checks.**

- `Heap.leftGroup_ofGroup` (compatibility): For a group G, [(a, b)] ↦ a b⁻¹ is a group isomorphism from the left group of Heap.ofGroup G to G, under which the action is left multiplication.
- `Heap.leftGroup_int_mk` (computation): In the heap of the integers, [(5, 2)] = [(3, 0)] in the left group; both act by adding 3.
- `Heap.leftGroup_unique` (degenerate): The left group of a one-element heap is the trivial group.
- `Heap.leftGroup_mk_not_injective` (non-example): For a heap with at least two elements the map from X × X to G_l is not injective: (a, b) and ((a, b, x), x) have the same class, so G_l is not the set of pairs.

#### `affine-torsor` — Torsors in the category of affine schemes

**Definition; retained.** Let R be a commutative ring. An affine heap over R (a torsor in the category of affine R-schemes in the sense of Definition A.5) is an affine R-scheme X = Spec A with a morphism X × X × X → X of R-schemes, products taken over R, which on S-valued points is a heap for every R-algebra S; equivalently the two heap axioms hold as identities of morphisms of schemes. Dually it is an R-algebra homomorphism A → A ⊗_R A ⊗_R A whose induced operation on the S-points Hom(A, S) is a heap operation for every R-algebra S. A morphism of affine heaps is an algebra homomorphism compatible with these maps.

**Hypotheses.** X is affine over the base ring R and products are fibre products over R. No section of X over R is assumed; X may have no R-point.

**Source.** HMS.2014, Appendix A, Definition A.5 (page 16), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/torsor`, `mathlib:AlgebraicGeometry.AffineScheme`, `mathlib:CommAlgCat`, `mathlib:HopfAlgebra`.

**Uses.** MotivesAndAlgebraicCycles:MC.6/iso-torsor: the scheme of tensor isomorphisms between two fibre functors is an affine heap (Theorem 3.3) MotivesAndAlgebraicCycles:MC.6/period-torsor: the formal periods carry a map P → P ⊗ P ⊗ P making Spec P an affine heap MotivesAndAlgebraicCycles:MC.6/affine-torsor-groups: Proposition A.6 attaches affine group schemes to a nonempty affine heap

**API.**

- `AffineHeap` (data): A commutative R-algebra A with an R-algebra map A → A ⊗ A ⊗ A whose operation on S-points is a heap for every R-algebra S.
- `AffineHeap.points` (projection): For an R-algebra S, the heap of S-valued points Hom(A, S).
- `AffineHeap.points_map` (functoriality): An R-algebra map S → S' induces a heap morphism on points, compatibly with identities and composition.
- `AffineHeap.ext` (extensionality): Two affine heap structures on A are equal when their operations on S-points agree for all S.
- `AffineHeap.ofHopf` (constructor): The affine heap of a commutative Hopf algebra, with operation g h⁻¹ k on points.
- `AffineHeap.Hom` (structure): Morphisms: algebra maps compatible with the ternary maps, with identity and composition.

**Checks.**

- `AffineHeap.ofHopf_points` (compatibility): For a commutative Hopf algebra H, the operation of AffineHeap.ofHopf H on S-points is (g, h, k) ↦ g h⁻¹ k in the group of algebra maps H → S under convolution.
- `AffineHeap.zero` (degenerate): The zero algebra, the empty scheme, is an affine heap with no point over any nonzero S.
- `AffineHeap.additive` (computation): On Spec R[t] the map t ↦ t ⊗ 1 ⊗ 1 − 1 ⊗ t ⊗ 1 + 1 ⊗ 1 ⊗ t is an affine heap structure, the heap of the additive group.
- `AffineHeap.not_mul` (non-example): On Spec R[t, t⁻¹] the map t ↦ t ⊗ t ⊗ t is not an affine heap structure: on points it is (x, y, z) ↦ x y z, which fails (x, y, y) = x.

#### `affine-torsor-groups` — A nonempty affine torsor carries affine group schemes on both sides

**Theorem; retained.** Let X be a nonempty affine heap over a field k. Then there are affine group schemes G_l and G_r over k acting on X on the left and on the right such that X is a G_l-torsor and a G_r-torsor; G_l is the quotient of X × X by the equivalence relation of Proposition A.4, formed as an affine scheme, and G_r likewise.

**Hypotheses.** X is a nonempty affine heap over a field; for the empty heap the statement fails (finding E42). The quotient of X × X by the relation R = X × X × X, with p₀(a, b, x) = (a, b) and p₁(a, b, x) = ((a, b, x), x), is taken from SGA 3, Exposé VII, Theorem 1.4, which was not obtained (gap).

**Source.** HMS.2014, Appendix A, Proposition A.6 with its proof (page 16), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/affine-torsor`, `MC.6/torsor-groups`, `mathlib:AlgebraicGeometry.AffineScheme`, `SchemeAndStackFoundations:SF.1`.

**Proof plan.**

1. Form R = X × X × X with the maps p₀ and p₁; p₀ is flat, being a base change of X over the field.
2. Show that (p₀, p₁) : R → (X × X) × (X × X) is a closed immersion, a graph-type morphism into a separated scheme, and that on T-points its image is an equivalence relation for every T, by Proposition A.4 applied to T-points.
3. Apply the quotient theorem of SGA 3 (gap) to obtain the affine quotient G_l = (X × X)/R, and descend μ_l and the action to morphisms of schemes.
4. Check the group scheme axioms and that (g, x) ↦ (g x, x) is an isomorphism G_l × X → X × X, from Proposition A.4 on T-points; G_r is the mirror image.

**Checks.** For the affine heap of an affine group scheme G, the groups G_l and G_r are G acting by left and right translation. The theorem is not on the path to the period torsor: there the two groups are the tensor automorphism groups of the two fibre functors, acting by composition, and no quotient is formed. The hypothesis that X be nonempty is needed.

#### `rigid-bialgebra-is-hopf` — A commutative bialgebra with a rigid comodule category is a Hopf algebra

**Lemma; retained.** Let B be a commutative bialgebra over a field k such that the tensor category of finite dimensional B-comodules is rigid. Then, for every commutative k-algebra R, every tensor endomorphism of the forgetful functor extended to R is an automorphism; hence the affine monoid scheme Spec B, which represents these tensor endomorphisms, is a group scheme, and B has a unique antipode making it a commutative Hopf algebra.

**Hypotheses.** B is a commutative bialgebra over a field k, and its finite dimensional comodules, with the tensor product of the bialgebra and the forgetful functor, form a tensor category. That category is rigid.

**Source.** DM.TC, Proposition 1.13 (page 12) and the end of the proof of Theorem 2.11 (pages 23 to 24), in the corrected version of 2012; HMS.2014, Theorem 1.14 with its proof (page 8) and Theorem B.10 (page 18), arXiv:1105.0865v5.

**Direct dependencies.** `mathlib:Bialgebra`, `mathlib:HopfAlgebra`, `mathlib:CategoryTheory.RigidCategory`, `mathlib:CategoryTheory.yoneda`, `tauceti:TauCeti.FGComoduleCat`, `tauceti:TauCeti.FGComoduleCat.instRigidCategory`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`.

**Checks.** With the pinned converse, rigidity of the comodule category and existence of an antipode are equivalent for commutative bialgebras over a field. The bialgebra k[t] with t group-like has a non-rigid comodule category, the one-dimensional comodule with coaction 1 ↦ 1 ⊗ t having no dual, and k[t] has no antipode. The lemma is what makes Nori's category a category of representations of a group and not only of a monoid.

#### `very-good-pairs-generate-periods` — Formal periods are generated by very good pairs

**Theorem; retained.** The algebra of formal periods is unchanged if, in its definition, the generators (X, D, ω, γ) are restricted to those with X affine of dimension d, D of dimension d − 1 and X ∖ D smooth, with ω in H^d_dR(X, D) and γ in H_d(X(C), D(C), Q), and the relations to those coming from the diagram of very good pairs.

**Hypotheses.** The base field is Q; the restricted generators are those of the diagram of very good pairs of Definition 1.1(3) in the case X of dimension d and D of dimension d − 1. The comparison of the diagram categories of very good pairs and of all pairs is the one of MC.5/diagram-comparison.

**Source.** HMS.2014, Corollary 2.11 with its proof (page 11), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/formal-periods-equal-comparison-algebra`, `MC.6/periods-equal-comparison-algebra`, `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`, `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`.

**Checks.** The restriction to very good generators is what makes the algebra of Kontsevich-Zagier periods generated by explicit data. The corollary is about formal periods; the statement about their complex values (Corollary 2.12) belongs to PeriodsAndSpecialValues:PS.2. The pairs of the second kind in Definition 1.1(3), X = Y of dimension less than i, have zero cohomology and contribute no generator.

#### `tensor-iso-scheme` — The scheme of tensor isomorphisms between two fibre functors on a diagram category

**Construction; retained.** In the setting of Section 3, with T_1 and T_2 unital graded multiplicative representations of the same diagram over Q, a multiplicative comparison isomorphism over a field K ⊃ Q and C(T_1) neutral Tannakian, let T_2 also denote its extension to a tensor fibre functor on C(T_1) (MC.6/fibre-functor-extension). The functor on commutative Q-algebras R ↦ Iso⊗(T_1 ⊗ R, T_2 ⊗ R) is represented by the affine scheme X_{1,2} = Spec A_{1,2}, and likewise X_{2,1} = Spec A_{2,1}. Composition gives X_{1,2}×X_{2,1}→G_2 by (x,y)↦x∘y and X_{2,1}×X_{1,2}→G_1 by (y,x)↦y∘x. The target group G_2 acts on the left, G_2×X_{1,2}→X_{1,2}, by postcomposition, and the source group G_1 on the right, X_{1,2}×G_1→X_{1,2}, by precomposition.

**Hypotheses.** T_1 and T_2 are unital graded multiplicative representations over Q and the comparison isomorphism is compatible with the multiplicative structure (finding E36). C(T_1) is neutral Tannakian, and G_1, G_2 are as in MC.6/tensor-automorphism-group.

**Source.** HMS.2014, Lemma 3.2 and the paragraph after it (pages 12 to 13), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/comparison-algebra`, `MC.6/fibre-functor-extension`, `MC.6/tensor-automorphism-group`, `MC.6/rigid-bialgebra-is-hopf`, `MotivesAndAlgebraicCycles:MC.5/diagram-category`, `mathlib:Polynomial.aeval`, `mathlib:IsLocalization.Away.algebraMap_isUnit`.

**Proof plan.**

1. Describe the R-points of Spec A_{1,2}: algebra maps A_{1,2} → R are compatible families, over finite subdiagrams F, of R-linear maps T_1|F ⊗ R → T_2|F ⊗ R commuting with the edges and respecting the product structure, by the duality defining A_{1,2}.
2. Identify such families with tensor morphisms f_{T_1} ⊗ R → T_2 ⊗ R on C(T_1), using that C(T_1) is generated by the objects attached to vertices (Proposition B.9) and its description by finite comodules.
3. Show that every tensor morphism is an isomorphism, by rigidity and Deligne and Milne's Proposition 1.13 (the second step of MC.6/rigid-bialgebra-is-hopf), so that the functor of tensor isomorphisms is represented by Spec A_{1,2}.
4. Composition gives the target coaction A_{1,2}→A_2⊗A_{1,2} and source coaction A_{1,2}→A_{1,2}⊗A_1; the two opposite-order composition maps are dual to A_2→A_{1,2}⊗A_{2,1} and A_1→A_{2,1}⊗A_{1,2}.

**Uses.** MotivesAndAlgebraicCycles:MC.6/iso-torsor: the heap structure is defined on this scheme MotivesAndAlgebraicCycles:MC.6/period-point: the comparison isomorphism is a complex point of it MotivesAndAlgebraicCycles:MC.6/period-torsor: Spec P is identified with it

**API.**

- `Diagram.Rep.TannakianPair` (data): A typed package of the existing hypotheses: unitality of both multiplicative representations, rank-one unit fibre, rigidity of C(T_1), and a specified tensor isomorphism after a specified field extension. This supplies the second tensor fibre functor through MC.6/fibre-functor-extension; it does not assume the representability conclusion.
- `TensorIsoScheme` (data): The comparison-algebra coordinate carrier; its spectrum represents tensor isomorphisms only after supplying the neutral Tannakian hypotheses, not for arbitrary effective multiplicative diagrams.
- `TensorIsoScheme.represents` (characterisation): With Diagram.Rep.TannakianPair supplied, R-points correspond to tensor isomorphisms over R. Without rigidity an effective multiplicative endomorphism may be noninvertible.
- `TensorIsoScheme.compLeft` (structure): The morphism G_2×X_{1,2}→X_{1,2}, (g,x)↦g∘x, dually the target-group coaction A_{1,2}→A_2⊗A_{1,2}.
- `TensorIsoScheme.compRight` (structure): The morphism X_{1,2}×G_1→X_{1,2}, (x,g)↦x∘g, dually the source-group coaction A_{1,2}→A_{1,2}⊗A_1.
- `TensorIsoScheme.toAut` (structure): The morphism X_{1,2}×X_{2,1}→G_2, (x,y)↦x∘y; the reversed composition has target G_1.
- `TensorIsoScheme.self` (compatibility): For T_1 = T_2 it is the group scheme G_1 with its multiplication.
- `TensorIsoScheme.map` (functoriality): Base change along Q-algebra maps R → R′ acts on points compatibly with composition.

**Checks.**

- `TensorIsoScheme.self_test` (degenerate): For T_1 = T_2 = T, X_{1,1} = G(T) = Spec A(D, T).
- `TensorIsoScheme.points_Q` (characterisation): A Q-point of X_{1,2} is a tensor isomorphism T_1 → T_2 over Q, and the scheme has one exactly when such an isomorphism exists.
- `TensorIsoScheme.compose_inverse` (computation): For x:T_1→T_2, x∘x⁻¹ is the unit of G_2 and x⁻¹∘x is the unit of G_1. The action g_2∘x and action x∘g_1 are defined, fixing the side by types.
- `TensorIsoScheme.not_group` (non-example): There is no distinguished identity or canonical group law on X_{1,2} without a chosen comparison section. A chosen section supplies a group law from the heap. The intrinsic binary composition uses X_{1,2}×X_{2,1} with target G_2 or the reversed factors with target G_1.
- `TensorIsoScheme.effective_zero_point` (non-example): Evaluation at zero is a Q-algebra map Q[t] → Q with t ↦ 0. Thus multiplicativity alone permits a noninvertible rank-one coordinate.
- `TensorIsoScheme.localized_excludes_zero` (compatibility): Every ring homomorphism Localization.Away(t) → Q sends the canonical image of t to a nonzero scalar, because the image of the localized unit remains a unit.

#### `tensor-iso-torsor` — Tensor morphisms between fibre functors form a torsor

**Theorem; retained.** Let C be a neutral Tannakian category over a field k with fibre functor ω and G = Aut⊗(ω), and let η be a fibre functor on C with values in a commutative k-algebra R. Then the functor Hom⊗(ω, η) on R-algebras is represented by an affine scheme faithfully flat over Spec R, every tensor morphism from ω to η is an isomorphism, and Hom⊗(ω, η) is a G-torsor over R. The G_R-action is on the right by precomposition. The category may be any neutral datum: use neutral-tannaka-reconstruction to reach the finite-comodule model before applying the known-Hopf dictionary.

**Hypotheses.** C is neutral Tannakian over the field k with fibre functor ω; η is exact, faithful, k-linear and tensor, with values in finitely generated projective R-modules. Deligne and Milne's Remark 3.3(b) allows C to be replaced by the finite dimensional representations of G with its forgetful functor.

**Source.** DM.TC, Theorem 3.2(a) with its proof, and Remark 3.3 (pages 30 to 31), in the corrected version of 2012; HMS.2014, Lemma 3.2, proof (page 12), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/neutral-fibre-datum`, `MC.6/neutral-tannaka-reconstruction`, `MC.6/rigid-bialgebra-is-hopf`, `tauceti:TauCeti.FGComoduleCat`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Proof plan.**

1. Use neutral reconstruction to reach the finite-comodule model, then the ind-algebra (P_X∨)_X of DM Theorem 3.2; its image under the first fibre is O(G). Applying η represents the tensor-morphism functor.
2. Every η(P_X∨) is finite projective, so its filtered colimit is flat. For faithful flatness restrict to the cofinal indices X⊕1, whose additive hull contains the unit. At these indices the fibre of the evaluation P_(X⊕1)→1 contains the identity coefficient and is surjective; exact faithfulness reflects the surjection. No such surjection is asserted for an arbitrary X.
3. Dualize this surjection. The sequence 0→1→P_(X⊕1)∨→Q_X→0 is exact with Q_X in the category. Applying η gives finite projective quotient, so the sequence splits as R-modules. The colimit contains R purely; after any base change it contains the base ring. Together with flatness this proves faithful flatness.
4. Rigidity makes each tensor morphism invertible (DM Proposition 1.13). The map T×G_R→T×T, (t,g)↦(t,t∘g), has inverse (t,u)↦(t,t⁻¹∘u). Faithful flatness makes T a right fpqc G_R-torsor.

**Checks.** For η = ω the torsor is G itself, trivial. For C(T_1) with η the extension of T_2 and R = Q, the theorem makes X_{1,2} = Spec A_{1,2} faithfully flat over Q and a G_1-torsor; applied with the roles of T_1 and T_2 exchanged it makes it a G_2-torsor. The theorem is the general form of the tensor isomorphism torsors the layer exports; the unipotent path torsors of AnabelianGeometryAndNonabelianChabauty:NC.2 are special cases.

#### `pro-algebraic-approximation` — Finite subdiagrams give the motivic Galois group as a pro-algebraic group

**Theorem; retained.** Let C(T) be a rigid diagram category over a field k as in MC.6/tensor-automorphism-group. For a finite subdiagram F let X_F be the direct sum of the objects attached to the vertices of F and C_F the full subcategory of C(T) whose objects are the subquotients of objects P(X_F, X_F^∨), P a polynomial with natural number coefficients. Then C_F is a neutral Tannakian category with algebraic Tannaka group G_F, a closed subgroup of GL(f_T(X_F ⊕ X_F^∨)); for F ⊂ F′ the restriction G_{F′} → G_F is faithfully flat; and G(T) is the projective limit of the G_F, that is, A(T) is the directed union of the finitely generated Hopf subalgebras A_F = O(G_F).

**Hypotheses.** C(T) is rigid over a field k, as in MC.6/tensor-automorphism-group. F runs through the finite subdiagrams of the diagram, ordered by inclusion.

**Source.** DM.TC, Propositions 2.14, 2.20 and 2.21 (pages 22 to 25), in the corrected version of 2012; HMS.2014, Proposition B.7 and Proposition B.9 (pages 17 to 18), arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/tensor-automorphism-group`, `MotivesAndAlgebraicCycles:MC.5/diagram-category`, `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`, `MC.6/tannaka-finiteness-recognition`, `MC.6/tannaka-functoriality`.

**Proof plan.**

1. Import the general tensor-generator/finite-type recognition criterion from MC.6/tannaka-finiteness-recognition. Keep here the inverse system attached to finite diagram pieces and its motivic application.
2. C_F is a rigid abelian tensor subcategory with tensor generator X_F ⊕ X_F^∨, so its Tannaka group is algebraic (Deligne and Milne, Proposition 2.20(b)) and embeds in GL of the fibre of the generator.
3. For F ⊂ F′ the inclusion C_F → C_{F′} is fully faithful and closed under subquotients, so G_{F′} → G_F is faithfully flat (Proposition 2.21(a)).
4. Every object of C(T) is a subquotient of a finite sum of objects attached to vertices (Proposition B.9), hence lies in some C_F; by Deligne and Milne's Proposition 2.14 the coordinate ring is the colimit of the coordinate rings of the C_F, so A(T) is the directed union of the A_F.
5. Conclude that G(T) is the projective limit of the algebraic groups G_F.

**Checks.** For a finite diagram the group G(T) = G_D is algebraic. Each G_F is a closed subgroup of a general linear group, through the representation on f_T(X_F ⊕ X_F^∨). The finite pieces A(F, T) of Nori's colimit are coalgebras, not Hopf algebras; the Hopf subalgebras are the A_F of the tensor subcategories they generate.

#### `period-point` — The comparison isomorphism as a complex point of the period torsor

**Construction; retained.** Let φ : H*_dR ⊗ C → H* ⊗ C be the comparison isomorphism between algebraic de Rham and singular cohomology of pairs of varieties over Q, natural in morphisms of pairs, compatible with connecting maps, unital and compatible with products (request ComplexComparisonPartII:C5). Then φ defines a complex point of X_{1,2} = Iso⊗(H*_dR, H*), that is, a Q-algebra homomorphism per : A_{1,2} → C sending the class of (p, ω, γ) to γ(φ_p(ω)). Composed with P = A_{1,2} (MC.6/formal-periods-equal-comparison-algebra) it is a ring homomorphism P → C, sending L^-1 to the inverse of the nonzero period of L. This is the complex evaluation map of the period torsor that the layer exports to PeriodsAndSpecialValues; its injectivity is the period conjecture and is not asserted.

**Hypotheses.** The comparison is an isomorphism between the de Rham and singular-cohomology representations of the effective diagram of all pairs after extension of scalars to C (request ComplexComparisonPartII:C5; finding E36): natural for morphisms of pairs, compatible with the connecting maps of triples, sending the period of (Spec Q, ∅, 1, [pt]) to 1, and compatible with the exterior-product and cross-product pairings. In the suggested file this is the typed contract PairDiagram.PeriodComparison. After restriction to good pairs with the specified PairDiagram.ProductCompatible structures, it is an isomorphism of unital graded multiplicative representations. The all-pairs pairing laws alone do not assert a single-degree Künneth isomorphism for every pair. A family of complex-linear isomorphisms natural for pullbacks alone does not qualify. On good pairs the graded multiplicative structures of de Rham and singular cohomology are those of the exterior and cross products, with the product of good pairs the product of pairs (finding E37; PairDiagram.ProductCompatible in the legacy prototype of the original roadmap (the compact MC.6 suggested file does not implement this interface)). For these structures the comparison is a tensor isomorphism, and the products of P_eff and of A_{1,2} agree on generators. With the MC.5 convention, both inverse Künneth maps carry (-1)^{ij} for degrees i,j; the two signs cancel in the period product. PairDiagram.ProductCompatible records these signs explicitly rather than changing the supplied exterior or cross products. Its geometric unit is the point pair, and both graded multiplicative structures are unital. These inputs are included explicitly in ProductCompatible; they are needed for the full neutral context, in addition to the signed Künneth laws. No rational point of X_{1,2} is asserted. At the Tate pair, PairHomology.gm_finrank supplies the rank-one calculation and PeriodData supplies nonzero dlog and circle. These hypotheses, together with the comparison isomorphism, justify period_tate_ne_zero and extension through the Tate localization; nonzero vectors in arbitrary finite-dimensional dual spaces would not suffice.

**Source.** HMS.2014, Introduction, the paragraph after Theorem 0.2 (page 2), arXiv:1105.0865v5; HMS.2014, The paragraph before Corollary 2.12 (page 11), arXiv:1105.0865v5; HMS.2014, Lemmas 3.1 and 3.2, p.12; Theorem 3.3 and Corollary 3.4, p.13; arXiv:1105.0865v5; HMS.2014, Lemma B.21 and Proposition B.22, pp.25–26; Theorem 1.14, p.8; arXiv:1105.0865v5; HMS.2014, Definition 1.1, p.4; Theorem 1.6 and its proof, pp.4–5; Definition B.14, pp.20–21; arXiv:1105.0865v5.

**Direct dependencies.** `MC.6/tensor-iso-scheme`, `MC.6/formal-periods-equal-comparison-algebra`, `ComplexComparisonPartII:C5`, `mathlib:IsLocalization.Away.lift`, `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `MotivesAndAlgebraicCycles:MC.5/nori-rigidity`, `MC.6/fibre-functor-extension`.

**Proof plan.**

1. On the effective diagram, use the typed comparison to send each generator (p, omega, gamma) to gamma(phi_p(omega)). Naturality for maps of pairs and compatibility with the connecting maps give the two edge relations; linearity, unitality and product compatibility give a Q-algebra homomorphism P_eff -> C. This construction needs no tensor-isomorphism representability or rigidity of the effective category.
2. Transport this effective evaluation through the effective algebra identification P_eff = A^eff_{1,2} of MC.6/formal-periods-equal-comparison-algebra. On good pairs, PairDiagram.PeriodComparison.toTensorIsoOver records its compatibility with the specified multiplicative structures; it does not by itself identify Spec(A^eff_{1,2}) with an isomorphism torsor.
3. The period of L is nonzero: the Tate cohomology and homology fibres are one-dimensional, phi is a linear isomorphism there, and dlog and circle are nonzero. Extend uniquely to P = P_eff[L^-1] through IsLocalization.Away.lift, sending L^-1 to the inverse of its period.
4. For the torsor interpretation, use MC.5/diagram-localisation and full Nori rigidity to extend the two fibre functors and their tensor comparison to the full Tate-localized category. Only in that neutral Tannakian setting apply MC.6/fibre-functor-extension and MC.6/tensor-iso-scheme (HMS Lemmas 3.1 and 3.2) and the full comparison-algebra identification. The localized evaluation then gives the complex point of the full torsor, with the generator values already established.
5. Define per_A=periodPoint.formal o E^-1:A_full->C. Its good-pair values and its Tate-inverse value show that under full tensor-isomorphism representability it corresponds to NoriPeriod.fibreComparison. Transport the heap and actions along E. The targets NoriPeriod.point_heap and NoriPeriod.point_action below consume the actual full fibre functors and MC.5 rigidity, with no independently supplied effective TannakianPair. The legacy effective helpers retain their additional context and are not the Nori application.

**Uses.** PeriodsAndSpecialValues:PS.2: the evaluation of formal periods in C and the tracing of relations through the torsor PeriodsAndSpecialValues:PS.9: the motivic period map on the mixed Tate subcategory MotivesAndAlgebraicCycles:MC.6/period-torsor: the torsor of formal periods has this complex point

**API.**

- `periodPoint` (data): The effective complex evaluation A^eff_{1,2} → C from the typed unital multiplicative comparison and the good-pair products. Its Tate-localized extension is periodPoint.formal, the intended full torsor point; effective rigidity is not inferred.
- `periodPoint_gen` (simp): On the class of (p, ω, γ), for a good pair p, it is the period γ(φ_p(ω)).
- `periodPoint_heap` (characterisation): Legacy conditional effective helper, with its separately supplied effective Diagram.Rep.TannakianPair. It is not used as the full Nori application; that application is the README target NoriPeriod.point_heap.
- `periodPoint.formal` (compatibility): For a typed comparison φ, the ring homomorphism P → C equal to γ(φ_p(ω)) on generators: the period point on P_eff = A^eff_{1,2}, extended through the localisation P = P_eff[L^-1] because the period of L is nonzero. PeriodsAndSpecialValues:PS.2 identifies it with integration.
- `periodPoint_action` (relation): Legacy conditional effective helper, with its separately supplied effective Diagram.Rep.TannakianPair. It is not used as the full Nori application; that application is the README target NoriPeriod.point_action.
- `periodPoint_tate_inverse` (compatibility): For a ring homomorphism per:P->C with per(ofEff(L))=2πi, per(tateInverse)=(2πi)^-1. periodPoint.formal of a typed comparison is such a homomorphism once PS.2 shows that the period of L is 2πi. No injectivity is needed and nothing is constructed.
- `PairDiagram.PeriodComparison.toTensorIsoOver` (constructor): A typed comparison, restricted to good pairs whose multiplicative structures are those of the exterior and cross products, is a tensor isomorphism H*_dR ⊗ C ≅ H* ⊗ C of graded multiplicative representations: the complex point the torsor formalism needs (finding E36).
- `periodPoint.formal_gen` (simp): periodPoint.formal(ofEff(X, D, ω, γ)) = γ(φ(ω)) for every effective pair.
- `periodPoint.formal_eq_periodPoint` (compatibility): On effective good-pair generators, the full formal evaluation equals the effective comparison-algebra evaluation. This does not identify the effective spectrum with the full tensor-isomorphism torsor.
- `periodPoint.formal_tateInverse` (simp): periodPoint.formal(tateInverse) is the inverse of the period of L, with no normalisation assumed.
- `PairDiagram.PeriodComparison.period_tate_ne_zero` (characterisation): The period of L = (G_m, {1}, dX/X, S^1) under a typed comparison is nonzero, since the comparison is an isomorphism of one-dimensional spaces there and dX/X and [S^1] are nonzero.
- `NoriPeriod.point` (constructor): per_A:A_full->_Q-alg C is periodPoint.formal o E^-1. Under the full representability equivalence it is precisely Phi:omega_dR tensor C ~=tensor omega_B tensor C, not just an arbitrary complex point.
- `NoriPeriod.point_generator` (simp): per_A(E(ofEff[v,omega,gamma]))=gamma(phi_v omega) for every effective good pair; via the all-pairs presentation it holds for every effective symbol. per_A(E(L^-1))=period_phi(L)^-1.
- `NoriPeriod.point_heap` (characterisation): On the full formal heap, h(per,per,per)=per for per=periodPoint.formal. No effective-rigidity or separate neutral-context parameter is present.
- `NoriPeriod.point_action` (characterisation): For every x:P->_Q-alg C there are unique b in G_mot(C) and d in G_dR(C) with x=b o Phi and x=Phi o d under full representability. Explicitly b=x o Phi^-1, d=Phi^-1 o x. Evaluation on P is transported through E, and the actions use bettiCoaction and deRhamCoaction above.

**Checks.**

- `periodPoint_unit` (degenerate): For every typed comparison φ, the value of periodPoint.formal on the class of the unit vertex (Spec Q, ∅) in degree 0 with ω = 1 and γ the class of the point is 1.
- `periodPoint_mul` (compatibility): For every typed comparison φ and compatible multiplicative structures, periodPoint is multiplicative on A_{1,2}: the value on a product is the product of the values.
- `periodPoint_twist_not_rational` (non-example): For a typed comparison whose period of (G_m, {1}, dX/X, S^1) is 2πi, as for the integration pairing, the value is not real; so the point does not come from a rational point of X_{1,2}.
- `periodPoint_heap_test` (characterisation): For every typed comparison, the heap operation applied to (φ, φ, φ) returns φ. The effective Lean example is conditional on the separately supplied neutral Tannakian context; use the localized Nori heap for the intended application.
- `periodPoint_tate_inverse_test` (computation): Given a ring homomorphism per:P->C and the integration normalization per(ofEff(L))=2πi, per(tateInverse)=(2πi)^-1 and per(ofEff(L))*per(tateInverse)=1. The test takes per as given; periodPoint.formal of a typed comparison is such a map once PS.2 normalises the period of L (periodPoint.formal_tateInverse_test).
- `periodPoint.formal_tateInverse_test` (computation): For a typed comparison whose period of L is 2πi, periodPoint.formal sends L^-1 to (2πi)^-1 and L*L^-1 to 1.
- `PeriodComparison.doubled_not_comparison` (non-example): Twice a typed comparison is still a family of linear isomorphisms natural for pullbacks, but it is not a typed comparison: its unit period would be 2. The contract that the previous prototype stored accepted it.
- `NoriPeriod.point_representation` (characterisation): Evaluate the full point on a degree-zero good coefficient and on L^-1. The values are gamma(phi_v omega) and period_phi(L)^-1; these force its representing comparison to restrict to phi_good and to use inverse Tate powers.
- `NoriPeriod.point_action_identity` (compatibility): For x=per, the unique Betti and de Rham elements are both identity; for x=b o Phi the unique de Rham element is Phi^-1 o b o Phi. Omitting this conjugation incorrectly identifies the two rational group forms.
- `NoriPeriod.integration_inverse` (computation): After the consumer PS.2 proves period_phi(L)=2*pi*i, per(L^-1)=(2*pi*i)^-1 and per(L)*per(L^-1)=1. The supplier uses nonvanishing before this integration normalization, so no injectivity or rational point is assumed.

#### `relative-finite-piece-reconstruction` — Relative finite-piece reconstruction

**Construction; retained.** Under the strengthened relative hypotheses below, under the relative reconstruction data, L_i:A→C_i, V↦V⊗X_i, is left adjoint to F_i. Use symmetry to identify its monad with V↦A_i⊗V, where A_i=F(X_i) has the multiplication transported from that monad. The comparison gives C_i≃LeftMod_A(A_i)≃RightComod_A(A_i∨), compatibly with F_i. Modules and comodules have underlying objects in A, not arbitrary objects of Ind(A). Keeping the unswapped expression V⊗A_i instead uses right modules over the opposite multiplication.

**Hypotheses.** The complete relative-reconstruction-datum is supplied: essentially small rigid symmetric coefficient category A, coherent A-action on C, conservative A-linear strong symmetric monoidal F, and the small filtered full exhaustion with enriched representers X_i. Each piece has, and F_i both preserves and reflects, the coequalizers of all F_i-split pairs. Each full inclusion C_i→C_j preserves the chosen coequalizers. These are the strengthened sufficient hypotheses. The printed reflection-only FS VI.10.2 formulation remains the separately recorded gap; it is not a premise sufficient for the operational conclusions here.

**Source.** FS.2021.v4, VI.10.2, pp.232–233, first proof paragraph.

**Direct dependencies.** `mathlib:CategoryTheory.Monad.monadicOfHasPreservesReflectsGSplitCoequalizers`, `mathlib:CategoryTheory.RigidCategory`, `mathlib:CategoryTheory.Equivalence`, `MC.6/relative-reconstruction-datum`.

**Proof plan.**

1. Use rigidity of A and the representing property to identify Hom(V⊗X_i,Y) with Hom(V,F_iY), naturally in V,Y. The A-linearity of F identifies F_iL_i with tensor by F(X_i).
2. Transport the adjunction unit and multiplication through the symmetric identification F_iL_i(V)≅A_i⊗V, fixing left modules and right dual-coalgebra comodules. At the regular-left-module test the multiplication is that of B, whereas the unswapped tensor-on-the-right convention gives Bᵒᵖ. Invoke the pinned ordinary Beck theorem only after providing its split-coequalizer preservation/reflection instances (the recorded adapter obligation). Do not plan Barr–Beck again.
3. Duality of the underlying A-object identifies the A_i action with an A_i∨ coaction; associativity/unit correspond to coassociativity/counit. Record comparison naturality on changing i.

**Uses.** GeometricSatakeAndFusion:GS4:integral-dual-group: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**API.**

- `relativePieceLeftAdjoint` (data): The A-linear functor V↦V⊗X_i and L_i⊣F_i.
- `relativePieceMonad` (characterisation): Via symmetry F_iL_i(V)≅A_i⊗V as monads, including the unit and multiplication defining A_i=F(X_i); this convention yields left A_i-modules.
- `relativePieceComparison` (compatibility): C_i≃RightComod_A(A_i∨) over A by transposing the left A_i-action; natural compatibility with the filtered inclusions.

**Checks.**

- `relativePiece_regular` (computation): At the finite-piece adjunction level, take A=Vect_fd(k), C_i the finite left modules over a finite-dimensional k-algebra B and X_i=B. With the monad written A_i⊗V, the recovered algebra is B and the comparison is over the same underlying vector spaces. For B=M₂(k), its transported product satisfies E₁₂E₂₁=E₁₁; the opposite product would give E₂₂.
- `relativePiece_needs_representer` (non-example): The forgetful functor from finite-dimensional, finite-support Z-graded vector spaces to Vect_fd(k) is exact and faithful but has no representing object on the entire category: a proposed representer has finitely many weights and cannot represent the fibre of a line in a missing weight. Thus it cannot be used as one represented finite piece. Its filtered weight-bounded pieces can still satisfy the relative theorem.
- `relativePiece_duality` (compatibility): For a finite left B-module V, the right B∨-coaction transposed from the left action obeys (id_V⊗ev_b)ρ(v)=b·v for every b∈B, where ev_b(φ)=φ(b), and (id_V⊗ev_1)ρ=id_V. On the regular B-module, evaluating twice at E₁₂,E₂₁ agrees with left multiplication by E₁₁, detecting an erroneous reversal.

#### `relative-coalgebra-assembly` — Filtered reconstruction coalgebra

**Construction; retained.** Under the strengthened relative hypotheses below, for the relative finite-piece system, H=colim_i F(X_i)∨ in Ind(A) is a coalgebra. The coactions F(Y)→F(Y)⊗F(X_i)∨ for Y∈C_i are compatible, independent of a sufficiently large i, and induce C≃Comod_A(H). Comod_A(H) means H-comodules whose underlying object lies in A, viewed through A→Ind(A).

**Hypotheses.** The complete relative-reconstruction-datum is supplied: essentially small rigid symmetric coefficient category A, coherent A-action on C, conservative A-linear strong symmetric monoidal F, and the small filtered full exhaustion with enriched representers X_i. Each piece has, and F_i both preserves and reflects, the coequalizers of all F_i-split pairs. Each full inclusion C_i→C_j preserves the chosen coequalizers. These are the strengthened sufficient hypotheses. The printed reflection-only FS VI.10.2 formulation remains the separately recorded gap; it is not a premise sufficient for the operational conclusions here.

**Source.** FS.2021.v4, VI.10.2, p.233, middle proof paragraphs.

**Direct dependencies.** `MC.6/relative-finite-piece-reconstruction`, `mathlib:CategoryTheory.Ind`.

**Proof plan.**

1. For i≤j, restrict the representing functor and dualize the induced algebra map to obtain the coalgebra transition F(X_i)∨→F(X_j)∨.
2. Form the filtered colimit using the existing Ind category. Define Δ and ε on finite pieces and check independence on overlaps.
3. This target constructs the needed Ind adapter: extend tensor by filtered colimits in each variable and embed A as compact representables. Define the internal right-comodule category with underlying objects in A; bare Ind is only its carrier, not an existing comodule theorem.
4. Transpose the finite-piece module comparison to get the compatible coaction on each F(Y). For an H-comodule M∈A, compactness factors M→M⊗H through M⊗A_i∨. Tensor preserves filtered colimits; the counit and coassociativity equations involve finitely many maps from the compact object M, and therefore hold after enlarging i. The finite-piece equivalence then supplies an object of C. The identical factorization argument for intertwining equations proves fullness; faithfulness follows at a common finite piece.
5. For every Y define c_Y:F(Y)∨⊗F(Y)→H from its coaction. These maps are dinatural in Y and balanced for the A-action: under F(V⊙Y)≃V⊗F(Y), c_(V⊙Y) contracts V∨⊗V by evaluation before applying c_Y. The finite-piece regular-module presentations show that these maps generate H with exactly the morphism, linearity and A-action balancing relations. This internal coefficient presentation is part of the construction and supplies the rigid-antipode proof.

**Uses.** GeometricSatakeAndFusion:GS4:integral-dual-group: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**API.**

- `relativeReconstructionCoalgebra` (data): H=colim_i F(X_i)∨ with Δ and ε.
- `relativeReconstructionCoaction` (data): For Y∈C, the compatible map F(Y)→F(Y)⊗H.
- `relativeCoalgebraComparison` (compatibility): C≃Comod_A(H) commuting with the forgetful functors to A.
- `relativeCoefficient` (universal-property): The dinatural maps c_Y:F(Y)∨⊗F(Y)→H present H by matrix coefficients, morphism relations and A-action balancing. For f:Y→Z, c_Z(λ,F(f)v)=c_Y(F(f)∨λ,v). Under F(V⊙Y)≃V⊗F(Y), c_(V⊙Y) contracts V∨⊗V before c_Y. The induced coalgebra and tensor multiplication agree with the finite-piece construction.

**Checks.**

- `relativeCoalgebra_constant` (degenerate): For a constant finite-piece system the colimit is the same coalgebra and the comparison is the finite-piece comparison.
- `relativeCoaction_overlap` (compatibility): For Y in C_i and C_j, the two coactions agree after passage to a common upper piece and to H.
- `relativeCoalgebra_finite_coefficients` (characterisation): For an H-comodule with underlying finite-dimensional vector space, its finitely many matrix coefficients and coassociativity relations lie in one sufficiently large piece.
- `relativeCoefficient_action_balance` (computation): For C=A and F=id_A, take the single enriched representer 1. The reconstruction gives H=1 and c_Y is evaluation F(Y)∨⊗F(Y)→1. The A-action balancing relation forces this; an unbalanced ordinary coend of the underlying functor is not the claimed reconstruction.

#### `relative-bialgebra-reconstruction` — Relative Tannaka reconstruction

**Construction; retained.** Under the strengthened relative hypotheses below, the relative reconstruction coalgebra H has a commutative unital multiplication compatible with Δ and ε; thus H is a bialgebra object in Ind(A), and C≃Comod_A(H) is a symmetric monoidal equivalence over A. No antipode is asserted without rigidity of C.

**Hypotheses.** The complete relative-reconstruction-datum is supplied: essentially small rigid symmetric coefficient category A, coherent A-action on C, conservative A-linear strong symmetric monoidal F, and the small filtered full exhaustion with enriched representers X_i. Each piece has, and F_i both preserves and reflects, the coequalizers of all F_i-split pairs. Each full inclusion C_i→C_j preserves the chosen coequalizers. These are the strengthened sufficient hypotheses. The printed reflection-only FS VI.10.2 formulation remains the separately recorded gap; it is not a premise sufficient for the operational conclusions here.

**Source.** FS.2021.v4, VI.10.2, pp.233–234.

**Direct dependencies.** `MC.6/relative-coalgebra-assembly`, `mathlib:CategoryTheory.BimonObj`.

**Proof plan.**

1. For each i,j choose k containing X_i⊗X_j. Generation under A-tensors and F-split coequalizers then gives C_i⊗C_j⊂C_k.
2. The tensor product of the units 1→F(X_i),1→F(X_j) induces X_k→X_i⊗X_j. Dualizing and taking the filtered colimit gives H⊗H→H; the tensor unit gives 1→H.
3. Check independence of k and associativity, symmetry, and unit on a common finite piece. Check that multiplication and unit are coalgebra maps and that the comparison respects tensor products and symmetry.
4. Use the bialgebra conclusion in the proposition. The premature Hopf label in the proof is the already confirmed PAPER-FARGUES-SCHOLZE-21/E108; do not duplicate its errata record.

**Uses.** GeometricSatakeAndFusion:GS4:integral-dual-group: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**API.**

- `relativeReconstructionBialgebra` (data): H with multiplication, unit, comultiplication and counit; commutative multiplication.
- `relativeReconstruction_monoidal` (compatibility): The coalgebra comparison is symmetric monoidal over A.
- `relativeReconstruction_mul_piece` (characterisation): Multiplication on pieces is dual to X_k→X_i⊗X_j.

**Checks.**

- `relativeBialgebra_matrix_monoid` (non-example): Finite-dimensional comodules of O(M_n), n≥1, reconstruct that commutative bialgebra. It has no antipode, since a singular matrix cannot have an inverse.
- `relativeBialgebra_unit` (degenerate): For C=A and F=id with representing unit, reconstruct the tensor unit bialgebra.
- `relativeBialgebra_tensor_coaction` (compatibility): The reconstructed coaction on F(Y⊗Z) equals the product of the coactions on F(Y) and F(Z), including the tensor-unit coaction.

#### `relative-rigid-antipode` — Rigidity and the reconstruction antipode

**Theorem; retained.** Under the strengthened relative hypotheses below, if C is also rigid in relative reconstruction, the bialgebra H has an antipode and the comparison identifies C with the rigid category of H-comodules in A. This is an internal relative statement, not the already pinned fixed-Hopf reconstruction theorem.

**Hypotheses.** The complete relative-reconstruction-datum is supplied: essentially small rigid symmetric coefficient category A, coherent A-action on C, conservative A-linear strong symmetric monoidal F, and the small filtered full exhaustion with enriched representers X_i. Each piece has, and F_i both preserves and reflects, the coequalizers of all F_i-split pairs. Each full inclusion C_i→C_j preserves the chosen coequalizers. These are the strengthened sufficient hypotheses. The printed reflection-only FS VI.10.2 formulation remains the separately recorded gap; it is not a premise sufficient for the operational conclusions here. Every object of C is dualizable.

**Source.** FS.2021.v4, VI.10.2, p.234, final rigidity paragraph.

**Direct dependencies.** `MC.6/relative-bialgebra-reconstruction`.

**Proof plan.**

1. Use the coefficient presentation from relative-coalgebra-assembly. The strong monoidal functor identifies F(Y∨) with F(Y)∨ and F(Y∨)∨ with F(Y) via biduality. Define S on c_Y(φ⊗v) to be c_(Y∨)(v⊗φ); this tensor notation denotes the categorical symmetry and biduality morphisms.
2. Duality sends a morphism relation for f:Y→Z to the corresponding relation for f∨:Z∨→Y∨, so the formula respects all coefficient relations and defines S:H→H in Ind(A). Enlarge the index to contain Y∨ when needed; do not assume X_i∨∈C_i. The same evaluation identities preserve the A-action balancing relations, using the dual coefficient object V∨.
3. Apply the coefficient relations to evaluation and coevaluation. The two triangle identities yield μ(S⊗id)Δ=uε and μ(id⊗S)Δ=uε on every c_Y, hence on H. Transport duals across the monoidal equivalence. This uses neither the false identification F(X_i)∨=Hom(X_i⊗X_i,1) nor a pre-existing Hopf instance.

**Uses.** GeometricSatakeAndFusion:GS4:integral-dual-group: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**Checks.**

- `relativeAntipode_gm` (computation): For the graded-vector-space fibre functor the Hopf algebra is k[t,t⁻¹], with S(t)=t⁻¹.
- `relativeAntipode_no_rigidity` (non-example): The matrix-monoid test cannot be passed as a rigid source: its noninvertible representations have no tensor duals.

#### `neutral-finite-subcategory-representability` — Finite-subcategory representability

**Construction; retained.** For X∈C, let <X> be the full subcategory of subquotients of finite direct sums X^n. There is P_X∈<X> such that A_X=ω(P_X) is the subalgebra of End_k(ωX) preserving ωY⊂(ωX)^n for every subobject Y⊂X^n. The fibre functor gives <X>≃Mod_fd(A_X), with P_X corresponding to the regular left A_X-module; hence ω|<X> is represented by P_X. This is the additional neutral representability lemma, not a consequence of just setting A=Vect in the relative theorem.

**Hypotheses.** k is an arbitrary field; C is an essentially small k-linear abelian rigid symmetric monoidal category with End(1)=k. ω:C→Vect_fd(k) is a chosen exact faithful k-linear symmetric monoidal functor. Neutrality, including the specified k-valued functor, is an assumption, not inferred from existence of a functor over an extension field.

**Source.** DM.TC, 2.12 and Lemma 2.13, pp.21–22.

**Direct dependencies.** `mathlib:CategoryTheory.Abelian`, `mathlib:CategoryTheory.Linear`, `mathlib:CategoryTheory.Functor.Faithful`, `mathlib:ModuleCat`, `MC.6/neutral-fibre-datum`.

**Proof plan.**

1. Exact faithfulness and finite-dimensional fibres imply finite length. In Hom(ωX,X), take the largest subobject preserving every Y⊂X^n; DM 2.12 identifies it also as the smallest subobject whose fibre contains id_ωX. This is P_X.
2. Lemma 2.13 identifies its fibre with the simultaneous stabilizer algebra A_X. Finite presentations and exactness construct the inverse M↦P_X⊗_{A_X}M via cokernels, proving the equivalence.
3. The regular module represents the underlying-vector-space functor. Direct sums X⊕Y give a filtered system of such full subcategories covering C. Tensor products are not assumed to remain in <X>.

**Uses.** GeometricSatakeAndFusion:GS4:rational-reductivity: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**API.**

- `neutralFiniteHull` (data): Full subcategory of subquotients of X^n, closed under finite sums, subobjects and quotients.
- `neutralStabilizerAlgebra` (data): A_X⊂End_k(ωX) preserving every ωY⊂(ωX)^n.
- `neutralFiniteRepresenter` (data): P_X with ωP_X=A_X and natural Hom(P_X,Y)≅ωY for Y∈<X>.
- `neutralFiniteHullEquivalence` (compatibility): <X>≃Mod_fd(A_X), taking P_X to the regular module and commuting with the fibre functor.

**Checks.**

- `neutralRepresenter_vect` (computation): In Vect_fd(k), X=k gives P_X=k and A_X=k; <X> is all finite-dimensional vector spaces.
- `neutralHull_not_tensor_closed` (non-example): In Rep_k(G_m), X the weight-one character has <X> consisting of weight-one sums, so X⊗X of weight two is absent.
- `neutralRepresenter_nonsemisimple` (non-example): For the regular representation of a constant cyclic group of order p over a field of characteristic p, the stabilizer algebra is the nonsemisimple group algebra; local representability does not assume semisimplicity.
- `neutralHull_zero` (non-example): In ModuleCat k over a field, the subquotient-sum hull of the zero module contains no object isomorphic to the one-dimensional module k. This rejects replacing the finite hull by the entire ambient category.

#### `neutral-reconstruction-coalgebra` — Neutral reconstruction coalgebra

**Construction; retained.** For a neutral pair (C,ω), B=colim_<X> End(ω|<X>)∨ is a k-coalgebra, with a canonical equivalence C≃Comod_fd(B) over Vect_fd(k). The symmetric tensor structure of C induces on B a commutative unital bialgebra structure. For every commutative k-algebra R, tensor endomorphisms of ω⊗R identify naturally with k-algebra maps B→R.

**Hypotheses.** k is an arbitrary field; C is an essentially small k-linear abelian rigid symmetric monoidal category with End(1)=k. ω:C→Vect_fd(k) is a chosen exact faithful k-linear symmetric monoidal functor. Neutrality, including the specified k-valued functor, is an assumption, not inferred from existence of a functor over an extension field.

**Source.** DM.TC, Propositions 2.14 and 2.16, Example 2.15, pp.22–24.

**Direct dependencies.** `MC.6/neutral-finite-subcategory-representability`, `mathlib:Bialgebra`, `tauceti:TauCeti.FGComoduleCat`, `MC.6/neutral-fibre-datum`.

**Proof plan.**

1. Apply the finite-subcategory equivalence, take duals of its finite-dimensional endomorphism algebras, and form the filtered colimit (DM 2.14).
2. The comparison sends every object to its canonical coaction, compatible with the fibre functor. Tensor product gives a functor Comod(B)×Comod(B)→Comod(B) over vector spaces and hence a coalgebra map B⊗B→B by DM 2.16; tensor coherence gives commutative multiplication and a unit.
3. DM 2.15 identifies natural endomorphisms of the scalar-extended fibre functor with linear maps B→R; the tensor and unit conditions become multiplicativity and unitality.

**Uses.** GeometricSatakeAndFusion:GS4:rational-reductivity: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**API.**

- `neutralReconstructionCoalgebra` (data): The filtered colimit B with its coalgebra structure and comparison functor.
- `neutralReconstructionBialgebra` (data): The commutative multiplication and unit induced by the specified tensor structure.
- `neutralTensorEndRepresentable` (characterisation): End^⊗(ω⊗R)≅Hom_k-alg(B,R), naturally in R.

**Checks.**

- `neutralCoalgebra_vect` (computation): The identity fibre functor on finite-dimensional vector spaces gives B=k.
- `neutralEnd_basechange` (compatibility): For k-algebras R→S, B→R→S corresponds to scalar extension of the same tensor endomorphism.
- `neutralCoalgebra_symmetry` (non-example): In characteristic zero, the odd line with Koszul symmetry cannot be sent by an ordinary symmetric fibre functor to its ungraded one-dimensional vector space; using the wrong symmetry invalidates reconstruction.

#### `neutral-tannaka-reconstruction` — Neutral Tannaka reconstruction

**Theorem; retained.** For a neutral pair (C,ω) over any field k, Aut^⊗(ω) is represented by an affine k-group scheme G=Spec(B), and the canonical functor C→Rep_fd(G) is a k-linear symmetric monoidal equivalence compatible with ω. Construct B from ω; do not assume an existing representing group or Hopf algebra as input.

**Hypotheses.** k is an arbitrary field; C is an essentially small k-linear abelian rigid symmetric monoidal category with End(1)=k. ω:C→Vect_fd(k) is a chosen exact faithful k-linear symmetric monoidal functor. Neutrality, including the specified k-valued functor, is an assumption, not inferred from existence of a functor over an extension field.

**Source.** DM.TC, Theorem 2.11, pp.20–24; Proposition 1.13, p.12.

**Direct dependencies.** `MC.6/neutral-reconstruction-coalgebra`, `MC.6/rigid-bialgebra-is-hopf`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.fgPointRepresentationCategoryEquivalence`, `MC.6/neutral-fibre-datum`.

**Proof plan.**

1. Use the neutral bialgebra and the natural representability of tensor endomorphisms, for all commutative k-algebras R.
2. Duals make every monoidal natural endomorphism invertible: use DM 1.13 on the rigid category of finite projective R-modules containing the scalar-extended fibres. Yoneda turns inverse/composition into the antipode and group law.
3. After constructing B, import the pinned known-Hopf functorial comparison and representation/comodule dictionary. That theorem is a consistency identification, not a substitute for the construction of B or the local representability lemma.
4. Recover the existing diagram case by its exact faithful rigid fibre functor. Nori rigidity is checked only in the late application.

**Uses.** GeometricSatakeAndFusion:GS4:rational-reductivity: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**Checks.**

- `neutralTannaka_vect` (computation): Vect_fd(k) reconstructs the trivial group.
- `neutralTannaka_graded` (computation): Finite-support Z-graded vector spaces with ordinary symmetry reconstruct G_m; the weight n line corresponds to t^n (DM 2.30).
- `neutralTannaka_needs_neutrality` (non-example): A fibre functor available only over k′ does not supply a k-valued point or neutral k-reconstruction.

#### `tannaka-finiteness-recognition` — Tannakian finiteness criteria

**Theorem; retained.** For the affine group G reconstructed from (C,ω): (a) G is finite over k iff some X has every Y∈C a subquotient of a finite sum X^n; (b) G is of finite type over k iff some X tensor-generates C, meaning every Y is a subquotient of P(X,X∨) for a polynomial P in two variables with nonnegative integer coefficients. Finite type and finite group are different assertions.

**Hypotheses.** k is an arbitrary field; C is an essentially small k-linear abelian rigid symmetric monoidal category with End(1)=k. ω:C→Vect_fd(k) is a chosen exact faithful k-linear symmetric monoidal functor. Neutrality, including the specified k-valued functor, is an assumption, not inferred from existence of a functor over an extension field.

**Source.** DM.TC, Proposition 2.20, pp.24–25.

**Direct dependencies.** `MC.6/neutral-tannaka-reconstruction`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

**Uses.** GeometricSatakeAndFusion:GS4:rational-reductivity: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**Checks.**

- `tannakaFiniteType_gm` (non-example): G_m is finite type and generated tensorially by its weight-one representation, but not finite: its infinitely many weights cannot all be subquotients of powers X^n for a fixed X.
- `tannakaFinite_constant` (computation): A constant finite group has the finite regular representation as a subquotient-sum generator, even when its representations are not semisimple.

#### `tannaka-connectedness-recognition` — Tannakian connectedness criterion

**Theorem; retained.** In characteristic zero, the reconstructed affine group G is connected iff for every nontrivial representation X the subquotient-sum hull <X> is not stable under tensor products. Nontrivial means that G acts nontrivially, not merely that X≠0. Equivalently C has no nontrivial finite tensor subcategory. Apply only with the characteristic-zero hypothesis; finite connected group schemes in positive characteristic invalidate this unqualified extension.

**Hypotheses.** k is an arbitrary field; C is an essentially small k-linear abelian rigid symmetric monoidal category with End(1)=k. ω:C→Vect_fd(k) is a chosen exact faithful k-linear symmetric monoidal functor. Neutrality, including the specified k-valued functor, is an assumption, not inferred from existence of a functor over an extension field. char(k)=0.

**Source.** DM.TC, Proposition 2.21(a) and Corollary 2.22, p.25; FS.2021.v4, VI.11, p.236.

**Direct dependencies.** `MC.6/neutral-finite-subcategory-representability`, `MC.6/tannaka-finiteness-recognition`, `MC.6/tannaka-functoriality`.

**Proof plan.**

1. By DM 2.21(a), a full tensor subcategory closed under subobjects corresponds to a faithfully flat quotient of G.
2. DM 2.20(a) identifies the finite subquotient-sum generators with finite quotient groups. In characteristic zero all finite group schemes are étale; connectedness is equivalent to having no nontrivial finite quotient.
3. Use DM 2.22 to obtain the criterion. In the Satake application the weight growth A_μ,A_2μ,… rules out the prohibited finite hull; that geometric verification stays with GS4.

**Uses.** GeometricSatakeAndFusion:GS4:rational-reductivity: Import from the proposed early abstract MC.6 supplier under accepted PAPER-ZHU-17 routes 8 and 11; do not import the late motivic period chain.

**Checks.**

- `tannakaConnected_gm` (computation): For G_m over characteristic zero a nonzero weight produces unbounded multiples under tensor powers, and the criterion detects connectedness.
- `tannakaConnected_charp` (non-example): Over characteristic p the nontrivial finite connected group α_p has a finite-dimensional regular generator; connected does not imply the characteristic-zero criterion.

### Additional targets

#### `neutral-fibre-datum` — Neutral fibre data

**Definition; additional.** A neutral fibre datum over a field k consists of an essentially small k-linear abelian rigid symmetric monoidal category C, a specified isomorphism k ≃ End_C(1), and a k-linear exact faithful strong symmetric monoidal functor ω:C→Vect_fd(k). The symmetry is the one that ω preserves. This datum contains neither a representing group nor a Hopf algebra.

**Hypotheses.** k is a field; category and Hom universes are fixed; Vect_fd(k) consists of finite-dimensional k-vector spaces with ordinary tensor symmetry.

**Source.** DM.TC, Theorem 2.11 and Definition 2.19, pp.20,24.

**Direct dependencies.** `mathlib:CategoryTheory.Abelian`, `mathlib:CategoryTheory.Linear`, `mathlib:CategoryTheory.RigidCategory`, `mathlib:CategoryTheory.Functor.Faithful`.

**Proof plan.**

1. Use existing Abelian, Linear, RigidCategory and monoidal-functor structures; exactness means preserving short exact sequences.
2. Identify End(1) with k by the specified scalar map and check its compatibility with ω.
3. Supply scalar extension ω_R(X)=R⊗_kω(X), with its induced strong symmetric monoidal structure, for every commutative k-algebra R.

**Uses.** MotivesAndAlgebraicCycles:MC.6/neutral-finite-subcategory-representability: Supply the finite-length and exact-faithful input without presupposing a Hopf algebra. GeometricSatakeAndFusion:GS4:rational-reductivity: Record the exact neutrality and symmetry hypotheses that Satake must prove.

**API.**

- `NeutralFibreData.baseChange` (functoriality): For each k-algebra R, ω_R is a strong symmetric monoidal functor into finite projective R-modules; algebra maps induce coherent base change.
- `NeutralFibreData.finiteLength` (characterisation): Every object has finite length, bounded by dim_k ω(X), using exact faithfulness.
- `NeutralFibreData.reflectIso` (compatibility): A morphism whose fibre is invertible is invertible; a zero fibre detects the zero object.
- `NeutralFibreData.tensorEquiv` (equivalence): A k-linear symmetric monoidal equivalence carrying ω to ωprime transports the datum and all tensor automorphism functors.

**Checks.**

- `neutral_vect` (computation): Vect_fd(k) with the identity functor is neutral and reconstructs the trivial group.
- `neutral_super_sign` (non-example): Super vector spaces in characteristic different from 2 with Koszul symmetry and ordinary forgetful functor fail symmetric compatibility on the odd line: its self-symmetry is minus the identity.
- `neutral_projectives` (non-example): Finite free Z-modules are not an abelian category: multiplication by 2 is both a monomorphism and an epimorphism there but is not invertible. Moreover Z is not a field, so this is not the field-valued datum.
- `neutral_not_semisimple` (boundary): Rep_fd(F_p,C_p) with its forgetful fibre is neutral even though the regular representation is not semisimple.

#### `relative-reconstruction-datum` — Relative reconstruction data

**Definition; additional.** Let A be an essentially small rigid symmetric monoidal category. A relative reconstruction datum consists of a symmetric monoidal category C with coherent tensor A-action, a conservative A-linear strong symmetric monoidal functor F:C→A, and a small filtered full exhaustion C_i of C stable under A-action and F-split coequalizers. Each C_i has X_i and A-enriched representability: Hom_Ci(V⊙X_i,Y) ≃ Hom_A(V,F_iY), natural in V∈A and Y∈C_i and compatible with the action. Require existence and reflection of the indicated coequalizers. Preservation is an additional named hypothesis for the strengthened theorem, not part of the printed FS datum.

**Hypotheses.** F-split means that the image parallel pair is part of a split coequalizer diagram in A. Transition functors are full inclusions compatible with F; objects of A are viewed as compact representables in Ind(A). The tensor on Ind(A) is the filtered-colimit-preserving extension of that on A.

**Source.** FS.2021.v4, Proposition VI.10.2 and first proof paragraph, pp.232–233.

**Direct dependencies.** `mathlib:CategoryTheory.RigidCategory`, `mathlib:CategoryTheory.Ind`.

**Proof plan.**

1. Spell out action associator and unit, the symmetric interchange with C tensor, and F(V⊙Y) ≃ V⊗F(Y), with their coherence squares.
2. The representing isomorphism is a natural bijection of Hom sets for every V, not a claimed isomorphism between a set and an A-object.
3. Use filtered inclusions to define comparison maps of representers; construct the Ind tensor extension in the proof of the existing coalgebra-assembly target.

**Uses.** MotivesAndAlgebraicCycles:MC.6/relative-finite-piece-reconstruction: Pin the action/adjunction and left-module/right-comodule conventions. GeometricSatakeAndFusion:GS4:integral-dual-group: Provide relative reconstruction over the rigid coefficient category, without imposing a field or abelianness on A.

**API.**

- `RelativeReconstructionData.action` (structure): Coherent functor A×C→C with action unit/associativity and the tensor-interchange constraints preserved by F.
- `RelativeReconstructionData.representerAdjunction` (universal-property): The natural Hom bijections define L_i(V)=V⊙X_i left adjoint to F_i, including unit and counit and both triangle identities.
- `RelativeReconstructionData.transition` (functoriality): For C_i⊂C_j, representer comparison X_j→X_i corresponds to the unit element in F(X_i), and yields A_j→A_i and A_i∨→A_j∨ compatibly with composition.
- `RelativeReconstructionData.internalComodule` (data): An H-comodule in A is M∈A with ρ:M→M⊗H in Ind(A) satisfying the counit and coassociativity equations; morphisms intertwine ρ.
- `RelativeReconstructionData.preservation` (compatibility): The strengthened variant explicitly provides PreservesColimit for each F_i-split parallel pair. Reflection is a different instance.

**Checks.**

- `relative_matrix_side` (computation): For A=Vect_fd(k), C_i=B-Mod_fd with B=M₂(k) and X_i=B, symmetry gives the left tensor monad B⊗V; its product has E12·E21=E11, detecting B opposite.
- `relative_no_global_representer` (non-example): The forgetful functor on finite-support Z-graded finite vector spaces has no global finite representer, since a line in a weight outside its finite support has nonzero fibre and no maps from it.
- `relative_weight_pieces` (computation): For a finite weight set S, the direct sum of one line in each weight represents the restricted fibre; the local algebra is k^S and the dual coalgebras assemble to k[Z].
- `relative_no_antipode` (non-example): Finite representations of the affine matrix monoid have the relative reconstruction data but are not rigid; their coefficient bialgebra is not asserted to be Hopf.

#### `relative-beck-sufficient` — Relative reconstruction with preserved split coequalizers

**Theorem; additional.** For the relative reconstruction datum with F_i preserving as well as reflecting all F_i-split coequalizers, the existing finite-piece, coalgebra-assembly and bialgebra targets give a canonical commutative bialgebra H=colim_i F(X_i)∨ in Ind(A) and a symmetric monoidal equivalence C≃Comod_A(H) over A. If C is rigid, its dualities give an antipode on the same H. This theorem makes no assertion that the extra preservation follows from the reflection-only formulation of FS VI.10.2.

**Hypotheses.** The complete action/enriched-representer/filtered-exhaustion datum of relative-reconstruction-datum is supplied. Each F_i preserves F_i-split coequalizers, and the full inclusions preserve the chosen coequalizers.

**Source.** FS.2021.v4, Proposition VI.10.2, pp.232–234.

**Direct dependencies.** `MC.6/relative-reconstruction-datum`, `MC.6/relative-finite-piece-reconstruction`, `MC.6/relative-coalgebra-assembly`, `MC.6/relative-bialgebra-reconstruction`, `MC.6/relative-rigid-antipode`, `mathlib:CategoryTheory.Monad.monadicOfHasPreservesReflectsGSplitCoequalizers`.

**Proof plan.**

1. Invoke the existing Mathlib Beck theorem on L_i⊣F_i with its separate Has, Preserves and Reflects instances; transport its algebra comparison through F_iL_i(V)≃F(X_i)⊗V.
2. For a dualizable A_i, transpose the left A_i-action to a right A_i∨-coaction. The algebra product is the one transported from the monad, not an assumed commutative product.
3. Extend tensor to Ind(A) by filtered colimits. Compactness factors any coaction of an A-object through some A_i∨; after enlarging i, the counit/coassociativity equations hold there. Compactness also factors morphism-intertwining equations. Thus the filtered comparison is essentially surjective and fully faithful.
4. The Beck presentation by split coequalizers is preserved by tensoring with A and, via conservativity and strong monoidality, by tensoring with C-objects. Choose k containing X_i⊗X_j to prove C_i⊗C_j⊂C_k, then use the existing bialgebra/antipode targets.

**Checks.** For weight-bounded graded objects H is the direct sum of group-like coefficient lines, with multiplication e_m e_n=e_(m+n), not the pointwise product of finite endomorphism algebras. For the matrix monoid only the bialgebra conclusion holds; rigidity must precede an antipode. The ordinary Beck theorem itself is imported, not replanned.

#### `fibre-inner-form` — Changing the fibre functor twists the group

**Theorem; additional.** For neutral (C,ω) over k and a fibre functor η over a k-algebra R, let G=Aut⊗(ω) and T=Isom⊗(ω_R,η). Then T is a right G_R-torsor and Aut⊗(η) is the twist of G_R by T for conjugation. Over any faithfully flat R-algebra S with t∈T(S), the isomorphism G_S→Aut⊗(η)_S sends g to t∘g∘t⁻¹. Replacing t by t∘h changes this isomorphism by conjugation by h. Hence over a field the two groups are pure inner forms; no rational point of T is asserted.

**Hypotheses.** η is k-linear exact faithful strong symmetric monoidal with finite projective R-valued fibres. Composition is ordinary functional composition; T carries right source-group action by precomposition.

**Source.** DM.TC, Theorem 3.2 and Remark 3.3, pp.30–31; GLX.2025.v3, Section 5.1, paragraph 14, p.32.

**Direct dependencies.** `MC.6/neutral-fibre-datum`, `MC.6/tensor-iso-torsor`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.

**Proof plan.**

1. Use the existing tensor-isomorphism scheme and torsor theorem to obtain a faithfully flat trivialization.
2. Define conjugation over the trivialization and compute its transformation on double overlaps: if t₂=t₁∘h then conjugation through t₂ equals conjugation through t₁ after Int(h).
3. Descend the affine group and its action using the existing fpqc affine descent supplier; identify it with Aut⊗(η) by the functor of points.

**Checks.** For η=ω_R the identity section gives the original group. For commutative G conjugation is trivial, so the group twist is canonically G_R even when the fibre torsor is nontrivial. For GL_n the torsor of frames of a rank-n projective module E twists GL_n to Aut_R(E); do not claim every frame torsor has an R-point.

#### `artin-diagram-category` — Artin Nori motives

**Definition; additional.** For a field k embedded in C, define Art(k) as the rational diagram category of finite étale k-schemes with H⁰_B(X)=Q^{X(C)}, maps by pullback and tensor product induced by X×_kY. Equivalently use zero-dimensional reduced pair vertices in degree zero. Retain its faithful exact fibre, finite direct sums, subquotients and tensor duals. Its fully faithful subquotient-closed inclusion into the full Nori category is a separate target, not a definition.

**Hypotheses.** k has characteristic zero and a chosen embedding k→C; choose an algebraic closure inside C. Finite étale schemes include disjoint unions; rational coefficients and the ordinary degree-zero symmetry are fixed.

**Source.** HMS.2017.corr2025, Definitions 9.4.1–9.4.2 and calculation, pp.229–230.

**Direct dependencies.** `MotivesAndAlgebraicCycles:MC.5/diagram-category`, `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.

**Proof plan.**

1. Restrict the MC.5 diagram-category construction and product to zero-dimensional schemes. A relative pair reduces to X minus Y and has cohomology only in degree zero.
2. Use the identity and evaluation on finite sets to supply tensor unit and products. Rigidity follows from the computed finite Galois Hopf algebras.

**Uses.** MotivesAndAlgebraicCycles:MC.6: Compute the Artin acceptance example and identify the ambient motivic Galois quotient.

**API.**

- `ArtinNori.ofFiniteEtale` (constructor): Finite étale X gives an object with fibre Q^{Hom_k(X,C)}; a scheme map gives the contravariant cohomology map.
- `ArtinNori.product` (compatibility): H⁰_B(X×Y)≃H⁰_B(X)⊗H⁰_B(Y), preserving unit and ordinary symmetry.
- `ArtinNori.finiteGalois` (equivalence): At a finite Galois extension K/k, the diagram category generated by finite Gal(K/k)-sets is equivalent over Q-vector spaces to finite left Q[Gal(K/k)]-modules.
- `ArtinNori.embedding` (functoriality): The natural faithful exact symmetric monoidal functor to MM_Nori(k,Q) is the functor whose fullness and ambient subquotient closure artin-nori-embedding proves.

**Checks.**

- `artin_split` (computation): For X=Spec(k) disjoint-union Spec(k), the fibre is Q² with trivial Galois action; this object alone generates the trivial group.
- `artin_quadratic` (computation): For a quadratic Galois K/k the fibre of Spec(K) is the two-dimensional permutation representation; rational projectors (1±σ)/2 split it into unit and nontrivial sign lines.
- `artin_regular` (computation): For finite Galois K/k with group Γ, the fibre is the regular permutation space Q^Γ and the centralizer of right translations is the left regular Q[Γ]; it is not the full matrix algebra.
- `artin_nongalois` (boundary): A nonnormal finite extension L/k gives the permutation representation on embeddings Γ/H after passing to a Galois closure; its field automorphism group alone is insufficient.

#### `artin-galois-equivalence` — Artin motives and finite-image Galois representations

**Theorem; additional.** Art(k) is symmetrically monoidally equivalent over its Betti fibre to finite-dimensional continuous rational representations of Γ_k=Gal(kbar/k), with the rational vector spaces given the discrete topology. Every such representation factors through a finite quotient. At finite Galois K/k, the diagram endomorphism algebra is Q[Γ] with Δ(g)=g⊗g and ε(g)=1, so its dual coordinate algebra is Q^Γ.

**Hypotheses.** The Artin diagram and rational coefficients of artin-diagram-category are fixed.

**Source.** HMS.2017.corr2025, Section 9.4, pp.229–230.

**Direct dependencies.** `MC.6/artin-diagram-category`, `mathlib:MonoidAlgebra.exists_leftInverse_of_injective`.

**Proof plan.**

1. For Γ=Gal(K/k), use the simply transitive embedding set of K and its commuting translation actions to compute the endomorphism algebra, including its multiplication side.
2. Every finite Γ-set is a disjoint union of Γ/H; invariant functions identify Q^{Γ/H} inside Q^Γ. All finite representations are quotients and, by rational Maschke, direct summands of finite sums of the regular representation. Import that semisimplicity, not a new Artin–Wedderburn theory.
3. Products of finite sets give the diagonal coproduct on Q[Γ]; dualize. Pass through Galois closures and the filtered union of finite Galois extensions. Continuity and compactness of Γ_k imply that the image in discrete GL(V) is finite.

**Checks.** At a nonabelian finite quotient, left versus right regular multiplication is tested by noncommuting group elements. Morphisms are Γ-equivariant linear maps; restricting to maps of finite sets would omit rational projectors.

#### `artin-nori-embedding` — Artin motives form a Nori subcategory

**Theorem; additional.** The natural functor Art(k)→MM_Nori(k,Q) is fully faithful, exact and symmetric monoidal, with image closed under ambient subobjects and quotients. An object of MM_Nori(k,Q) belongs to this image exactly when its base change to kbar is a finite sum of units. Consequently the image is the smallest replete full abelian tensor subcategory generated by H⁰_Nori of finite étale k-schemes.

**Hypotheses.** MC.5 supplies the full rational Nori category over k⊂C, the diagram universal property, the restriction/corestriction and finite-descent contract, and the ℓ-adic realization with finite-étale permutation compatibility specified in the request.

**Source.** HMS.2017.corr2025, Example 9.1.13, p.213; Proposition 9.4.3, p.231; corrected Proposition 9.5.3 and Corollary 9.5.5, pp.232–236; 26 June 2025 repair, pp.238–239.

**Direct dependencies.** `MC.6/artin-galois-equivalence`, `MotivesAndAlgebraicCycles:MC.5`, `MotivesAndAlgebraicCycles:MC.5/completion-universal-factorisation`.

**Proof plan.**

1. The diagram universal property gives the faithful exact tensor functor from Art(k). Every ambient Nori morphism between its finite-étale generators acts under the ℓ-adic realization as a Γ_k-equivariant map. Its Betti matrix has rational coefficients; equivariance after Q→Q_ℓ therefore implies rational equivariance, since scalar extension is injective. The Artin–Galois equivalence lifts that matrix to an Artin morphism, and faithfulness of the Betti fibre proves equality. Extend through finite sums and rational projectors. Without the realization contract, functoriality of H⁰ alone would not prove fullness for all ambient Nori morphisms.
2. Use corrected Proposition 9.5.3 and Corollary 9.5.5: triviality after algebraic extension descends to a finite extension and exhibits the motive as a summand of a power of H⁰(Spec K). Do not use the false formula res cores(M)=M⊗H⁰(Spec(K⊗_kK)) for arbitrary M.
3. The unit of the Nori category is simple since its faithful exact fibre is one-dimensional; finite sums of it are ambient semisimple. Base-changing any quotient of an Artin object therefore gives a sum of units, and descent gives an Artin quotient; duality handles subobjects. Semisimplicity of a full subcategory alone would not prove this.

**Checks.** The proof does not infer ambient subquotient closure merely from semisimplicity inside Art(k). No exact sequence involving the full geometric motivic group is needed as an input to the Artin quotient. Ambient fullness uses the specified ℓ-adic realization and rational scalar descent; it is not inferred merely from the diagram endomorphism calculation.

#### `artin-galois-group` — The proconstant Artin motivic Galois group

**Theorem; additional.** For the Betti fibre on Art(k), Aut⊗(ω_B|Art(k)) is the proconstant Q-group scheme lim_K Gal(K/k)_Q, with coordinate Hopf algebra colim_K Q^{Gal(K/k)}. The inclusion of Art(k) induces a faithfully flat morphism G_mot(k,Q)→Γ_k,Q. This is a proalgebraic group scheme; its functor on a disconnected Q-algebra is not defined by assigning the abstract set Γ_k to every algebra.

**Hypotheses.** K ranges over finite Galois extensions in the chosen kbar; the ambient Nori group is reconstructed from its proven neutral fibre.

**Source.** HMS.2017.corr2025, Section 9.4, p.230; repaired proof of Theorem 9.1.16, pp.236–239; DM.TC, Proposition 2.21(a), p.25.

**Direct dependencies.** `MC.6/artin-galois-equivalence`, `MC.6/artin-nori-embedding`, `MC.6/neutral-tannaka-reconstruction`, `MC.6/tannaka-functoriality`.

**Proof plan.**

1. Compute each finite constant group from the function Hopf algebra, using artin-galois-equivalence.
2. Take the compatible inverse limit of finite group schemes and apply the existing neutral reconstruction to identify all tensor automorphisms naturally in value algebras.
3. Apply DM Proposition 2.21 to the fully faithful subquotient-closed inclusion; this proves faithful flatness without assuming a period conjecture.

**Checks.** Over algebraically closed k the group is trivial. For a finite quotient C₂ and R=Q×Q, R-points are C₂×C₂: independent components detect an incorrectly constant set-valued functor. For k=Q no assertion of a finite-type algebraic group is made.

#### `pure-tate-subcategory` — The pure Tate tensor subcategory

**Definition; additional.** Let L=1(−1)=H¹_Nori(G_m,{1}) in the full rational Nori category. For n∈Z put L^n=1(−n), using duals for n<0. Define Tate(k) to be the smallest replete full subcategory containing all L^n and closed under finite sums, subobjects and quotients. Tensor products and duals preserve it by exactness and the invertibility of L. This is the pure Tate subcategory; it is not defined by adjoining every ambient extension.

**Hypotheses.** k⊂C; the full Nori category and its exact faithful tensor Betti fibre are supplied by MC.5. A Hodge realization separating Tate powers, with type(n,n) on L^n, is supplied as specified in the MC.5 request. Only this separation is used, not a global weight filtration or André semisimplicity.

**Source.** HMS.2017.corr2025, Definition 10.3.1 and Lemma 10.3.2, pp.250–251; Example 9.1.12, p.213; DM.TC, Example 2.30, p.27.

**Direct dependencies.** `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`, `MotivesAndAlgebraicCycles:MC.5/nori-tensor-category`, `MotivesAndAlgebraicCycles:MC.5`.

**Proof plan.**

1. Use the MC.5 Tate localization for integer powers, coherence maps L^m⊗L^n≃L^(m+n), and L⁰≃1.
2. One-dimensional faithful exact fibres make every L^n simple. Hodge types imply Hom(L^m,L^n)=0 for m≠n, while End(L^n)=Q by tensoring with the inverse and End(1)=Q.
3. Subquotients of a finite sum of these ambient simple objects split into the same simples. Thus finite sums already describe Tate(k); do not prove vanishing of all Ext¹ groups in the ambient mixed category.

**Uses.** MotivesAndAlgebraicCycles:MC.6: Compute the Tate acceptance example and fix the exponent convention for the period class L. PeriodsAndSpecialValues:PS.2: Use the integer Tate inverse in the formal period ring, with period(L)=2πi.

**API.**

- `PureTate.power` (constructor): For n∈Z the object L^n belongs to Tate(k), with coherent power-zero, addition and duality isomorphisms.
- `PureTate.homPower` (characterisation): Hom(L^m,L^n)=0 if m≠n and End(L^n)≃Q; all maps between finite sums are block matrices by degree.
- `PureTate.sumDecomposition` (characterisation): Every object is a finite direct sum of Tate powers, uniquely up to degreewise multiplicity; subobjects and quotients remain such sums.
- `PureTate.coefficients` (functoriality): M↦(Hom(L^n,M))_n gives finite-support graded rational spaces; tensor on coefficients is the finite convolution of degrees.
- `PureTate.mixedBoundary` (relation): The extension-closed category generated by Tate(k) is the mixed Tate category. No equality with Tate(k) and no G_m calculation for that larger category is asserted.

**Checks.**

- `tate_tensor_inverse` (computation): L⊗L⁻¹≃1 and the degree-one and degree-minus-one fibres multiply to degree zero; restricting to nonnegative degrees would fail.
- `tate_two_weights` (computation): End(1⊕L)=Q×Q and Hom(1,L)=0; replacing it by M₂(Q) would erase the Tate grading.
- `tate_even_symmetry` (computation): The self-braiding of L is +1 because the faithful symmetric Betti fibre sends it to the ordinary swap on the tensor square of a one-dimensional rational space, which is the identity. Tate-exponent degree one introduces no Koszul minus sign; Hodge weight 2 is consistent with this convention.
- `tate_extension_boundary` (non-example): The nontrivial two-dimensional unipotent representation of G_a, with unit subobject and unit quotient, shows why extension closure cannot be silently inserted into a tensor-generated semisimple subcategory definition. This is an abstract categorical counterexample, not a claimed Nori realization.

#### `pure-tate-graded-equivalence` — Pure Tate motives are finite graded vector spaces

**Theorem; additional.** There is a Q-linear symmetric monoidal equivalence Tate(k)≃Vect_fd^Z(Q) over the total Betti fibre, with finite support in Z and ordinary symmetry. It sends L^n to the degree-n line. The inverse sends (V_n) to the finite sum of copowers V_n⊗_Q L^n. There is no Koszul sign from the Tate-exponent grading.

**Hypotheses.** The definition and Tate separation of pure-tate-subcategory are supplied. Fix the Betti generator of L from the positively oriented loop to identify the total fibre with the ordinary forgetful fibre; alternative choices transport the equivalence coherently.

**Source.** HMS.2017.corr2025, Lemma 10.3.2 and proof, p.250; DM.TC, Example 2.30, p.27.

**Direct dependencies.** `MC.6/pure-tate-subcategory`.

**Proof plan.**

1. Use the computed Hom spaces of Tate powers to identify maps with degree-preserving block matrices.
2. Finite semisimplicity gives essential surjectivity and the finite-support decomposition.
3. Power-addition maps identify tensor with convolution. The faithful symmetric Betti fibre sends the braiding on Tate lines to ordinary interchange; on the square of a one-dimensional fibre it is the identity. Thus Tate-exponent grading contributes no Koszul sign. Check the total Betti fibre comparison on generators and then on sums.

**Checks.** For M=L⁻¹⊕1²⊕L² the dimension vector is 1 at −1, 2 at 0 and 1 at 2, and dim ω(M)=4. Maps cannot mix degrees, while tensor does add degrees.

#### `pure-tate-galois-group` — The Tate group is the multiplicative group

**Theorem; additional.** For every commutative Q-algebra R, tensor automorphisms of the Betti fibre restricted to Tate(k) are naturally Rˣ: a∈Rˣ acts on L^n by a^n, and every tensor automorphism has this form. Thus the coordinate Hopf algebra is Q[t,t⁻¹], Δ(t)=t⊗t, ε(t)=1, S(t)=t⁻¹, and the group is G_m,Q. The full motivic group maps faithfully flatly to this Tate quotient.

**Hypotheses.** The pure Tate equivalence and ambient subquotient closure are fixed; all value algebras, including disconnected and nonreduced ones, are tested.

**Source.** DM.TC, Example 2.30, p.27; Proposition 2.21(a), p.25; HMS.2017.corr2025, Definition 10.3.1 and Lemma 10.3.2, p.250.

**Direct dependencies.** `MC.6/pure-tate-graded-equivalence`, `MC.6/neutral-tannaka-reconstruction`, `MC.6/tannaka-functoriality`.

**Proof plan.**

1. Naturality on each finite-dimensional pure degree and all its linear maps forces a scalar a_n; monoidality gives a_(m+n)=a_ma_n and the unit forces a_0=1.
2. The inverse-degree line forces a_1 to be a unit and a_n=a_1^n. Conversely these scalars define a tensor automorphism and commute with value-algebra maps.
3. Use the existing G_m affine Hopf dictionary rather than rebuilding the diagonalizable-group theory. Apply DM 2.21(a) to the full ambient subquotient-closed Tate inclusion.

**Checks.** At R=Q, a=2 acts by 2 on L and 1/2 on L⁻¹. At R=Q[ε]/(ε²), a=1+ε acts by 1+nε on L^n for every integer n; checking only rational points would omit this test. On 1⊕L the action is diag(1,a), not an arbitrary invertible 2×2 matrix.

#### `tannaka-functoriality` — Tensor functors and morphisms of reconstructed groups

**Theorem; additional.** Let (C,ω) and (D,η) be neutral Tannakian data over any field k. An exact k-linear strong symmetric monoidal functor U:D→C with a specified tensor isomorphism ω∘U≃η induces f:G_C→G_D. The map f is faithfully flat iff U is fully faithful and every subobject of U(Y) in C is isomorphic as a subobject to U(Y′) for a subobject Y′⊂Y in D. The map f is a closed immersion iff every object of C is a subquotient of U(Y) for some Y∈D.

**Hypotheses.** Both neutral data include their k-valued exact faithful fibres; the comparison of fibres is part of the input. The subobject condition concerns ambient C-subobjects of image objects, not just the intrinsic subobjects of the essential image. No characteristic-zero or semisimplicity assumption is imposed.

**Source.** DM.TC, Proposition 2.21(a)–(b) and proof, p.25, corrected author version 2012.

**Direct dependencies.** `MC.6/neutral-fibre-datum`, `MC.6/neutral-tannaka-reconstruction`.

**Proof plan.**

1. Use neutral reconstruction to transfer U to restriction of finite-dimensional representations along f; the specified fibre isomorphism defines f naturally on all commutative k-algebras.
2. Use DM Proposition 2.21(a). If f is faithfully flat, descent of invariant subspaces and of intertwiners gives both conditions. Conversely factor f through its scheme-theoretic image; the map onto that image is faithfully flat by the Hopf-subalgebra theorem over a field. For a proper closed image, the finite-dimensional subspace-stabilizer construction in the proof of 2.21(b) supplies an image-stable subspace not stable under G_D; full faithfulness together with the ambient-subobject condition excludes this. Thus the image is G_D. These finite coefficient-space steps are part of the categorical criterion, not a test on dense k-points.
3. For the closed-immersion criterion, DM Proposition 2.21(b) identifies surjectivity on coordinate algebras with generation of every finite coefficient space by representations restricted from G_D. Subquotients of finite sums suffice, and finite sums are already included among the objects Y of D.

**Checks.**

- `tannakaFunctor_trivial_quotient` (computation): The inclusion Vect_fd(k)→Rep_fd(k,C_2) as trivial representations is fully faithful and ambient-subobject closed, and induces the faithfully flat quotient C_2→1.
- `tannakaFunctor_closed_subgroup` (computation): For char(k)≠2, restriction from G_m to μ_2 satisfies the subquotient-generation criterion and induces the closed immersion μ_2→G_m. It is not full: the weight-zero and weight-two lines acquire nonzero morphisms after restriction.
- `tannakaFunctor_nonreduced` (non-example): In characteristic p the closed immersion μ_p→G_m is detected by the coordinate quotient k[t,t⁻¹]→k[t]/(t^p−1); μ_p(kbar)={1} does not identify it with the trivial subgroup scheme.

## Suggested Lean boundary

The accompanying [suggested file](../suggested/MotivesAndAlgebraicCycles--MC.6.lean) imports Mathlib and individual existing Tau Ceti modules. Its light `MC6Suggested.comparisonCoefficient` is the actual functional on the existing linear-map carrier, with value λ(f(v)); it is a finite coefficient helper of the retained comparison-algebra/period-space targets, not a replacement for those algebras. Its three proved coefficient examples check the zero vector, a nonzero scalar comparison and an off-diagonal coefficient. The light additive `integralPeriodDetector` sends $(a,b)$ to $b$ modulo $2$; its examples verify that the edge relation $(-2,2)$ maps to zero while the claimed torsion class $(-1,1)$ does not. Its double does map to zero. These are arithmetic checks of the E49 counterexample, not an implementation of an integral period module. They are intentionally limited to carriers available at the pins.

`exists_antipode_of_rigid_finite_comodules` is the retained rigidity-to-antipode milestone: it asks for a linear antipode obeying both convolution identities for the given bialgebra. Its proof is admitted as a roadmap theorem. No Hopf instance is an input. The known-Hopf functor comparison is checked as an import. The suggested file does not invent neutral, relative, Nori, torsor or graded-category stand-ins, does not admit data, and does not assert numerical period injectivity. The full target catalogue, all API specifications and all further worked examples remain above.
