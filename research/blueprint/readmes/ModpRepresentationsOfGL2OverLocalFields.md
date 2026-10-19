# Smooth mod p representations of GL₂ over a local field

Roadmap id: `ModpRepresentationsOfGL2OverLocalFields` · area: `langlands` · parent: none.

This is the definitive target-level roadmap. Its packet records the dependency graph and atlas planets;
its suggested Lean file gives a compact selection of statements expressible at the pinned libraries.
Every target has implementation status `unchecked`. A successful elaboration of a statement with a
placeholder proof is not an implementation of that target.

The two endpoints are a local Gelfand–Kirillov dimension **upper bound** and an integral description
of a projective cover modulo the square of the principal-congruence augmentation ideal. Along the way,
the roadmap supplies finiteness criteria, ordinary parts and their induced approximation, tame weight
coordinates, explicit nonuniform Iwahori algebra, and multiplicity-preserving first-order enlargements.
The Q_p finite-length arguments and the unramified higher-degree arguments have separate hypotheses.
The 52 BHHMS and 18 CDN items routed here are all accounted for in the route table below.

Generic smooth categories and induction, completed group algebras, compact duality, the Q_p
classification, Gabriel blocks and the Montreal functor retain their existing owners. In particular,
“blocks” in the roadmap title identifies an input, rather than a second plan for R30.5.

## Conventions and scope

For MP.0–MP.2, F is a finite extension of Q_p, G=GL₂(F), K=GL₂(O_F), and a uniformizer varpi_F
is fixed. E/Q_p is the coefficient field, O its ring of integers, m its maximal ideal, and k its
finite residue field. These are distinct from F and O_F. Smooth torsion means m-primary torsion:
V is the union of its V[m^j]. Admissibility tests both an open compact subgroup and j. Finite type
means finite generation over the abstract group ring; finite presentation uses compact induction,
or equivalently the augmented Iwasawa algebra, as specified in MP.0. A finite O-module means a
finitely generated O-module. A torsion finite O-module has finite O-length; an integral lattice need
not have finite cardinality.

Write G′=G/⟨varpi_F I₂⟩ when the central uniformizer must act trivially. The Serre-weight compact
inductions I(sigma) in MP.1 are representations of this quotient, with that chosen extension of
sigma to KZ. There is no conclusion here that arbitrary finite-type representations of GL₂(F),
without the quotient or finiteness hypotheses, are admissible or have finite length.

For MP.3–MP.9, F/Q_p is unramified of degree f≥1, q=p^f, J=Z/fZ, and k contains the residue
embeddings. Fix sigma_i=sigma_0∘(x↦x^{p^i}); the permutation pi on weight tuples is
(pi lambda)_i=lambda_{i−1}. Write lambda_i=(a_i,b_i), r_i=a_i−b_i, eta_i=(1,0) at index i,
and alpha_i=(1,−1) there. X^0(T) consists of the pairs (c_i,c_i). The coordinate lattice
Lambda_W=X*(T)/X^0(T) is Z^J, while Lambda_R=(2Z)^J. Thus a root-lattice coordinate
nu=2n has lift ((n_i,−n_i)); adding nu to a highest weight always means this lift. Labelled
finite-group weights are taken modulo (p−pi)X^0(T). The strict depth condition is

\[
  N<r_i+1<p-N\quad\Longleftrightarrow\quad N\le r_i\le p-N-2.
\]

All embedding indices are cyclic. In the translation formula, the parity at **i+1** selects the
branch at i. Negative integers use Euclidean division by two. For inertial parameters, extend
the chosen embedding to the indicated unramified splitting field and enlarge k accordingly.
The geometric-Frobenius Artin convention and the absence of an extra eta shift in tau(s,nu)
are part of MP.3, not an implicit change of notation.

Let K₁ be the principal congruence subgroup, I the upper Iwahori, I₁ its pro-p radical,
Z₁=Z(K)∩K₁, and H=I/I₁ the diagonal residue torus. The character chi_lambda is the action
of I on the I₁-fixed line of F(lambda); chi^s swaps its two diagonal entries. In character
expressions alpha_i(diag(a,d))=sigma_i(a/d); the same subscript on a highest-weight root
has the root-lattice meaning just fixed. The displayed scalar/weight context distinguishes them.
For a pro-p subgroup U, m_U is the augmentation ideal in k[[U]] and V[m_U^n] means the
subspace annihilated by its n-th power. For compact covers it means quotienting by that power.
Proj_Gamma and Inj_Gamma refer to the finite group Gamma=GL₂(k_F); Proj_{K/Z₁} is a
pseudocompact cover and Inj_{K/Z₁} a smooth injective envelope. They are different carriers.

V^∨ is the compact contragredient dual of a discrete finite-field representation; V* in the
smooth-dual criterion is Hom_k(V,k) with its compact pointwise topology. Schikhof O-linear
continuous duality is used only with its complete torsion-free hypotheses. Dual actions use
inverse group elements. Endomorphism rings use ordinary composition; Hom(T_tau,T_sigma)
is a **right** End(T_tau)-module by precomposition. In MP.8, subscripts (−)_{K₁} mean
coinvariants. They must not be replaced by superscript invariants.

The saturated Iwahori and §6 extension calculations assume p>3. The auxiliary character
multiplicity assertion about W_{chi,3} is restricted to p>5 for the reason recorded in E1.
Every stricter bound in a target remains in force. For integral MP.8, E/Q_p is unramified,
O=W(k), and p>2. Uniformity is used for a uniform open subgroup, never silently asserted
for I₁/Z₁.

## Baseline and ownership

The pinned libraries are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The following statements and hypotheses were read
at these pins. They are inputs, not targets to implement again.

| Declaration | Module | Role |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | A monoid representation as a monoid homomorphism to linear endomorphisms. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finite generation of a module; reused for finite type rather than defined again. |
| `mathlib:IsFiniteLength` | `Mathlib/RingTheory/FiniteLength.lean` | Finite length as an inductive finite extension of simple factors; isFiniteLength_iff_isNoetherian_isArtinian identifies it with the noetherian/artinian criterion. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | The multivariable polynomial algebra over a commutative semiring, specialised here to fields. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set. |
| `mathlib:Ideal.Quotient.mk` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | The canonical ring homomorphism R→R/I; quotient ring instances are in the same module. |
| `mathlib:ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Krull dimension valued in WithBot N∞, including the zero-ring convention. |
| `tauceti:TauCeti.exists_isProjectiveCover_of_finiteDimensional` | `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean` | Over a finite-dimensional algebra over a field every module has a projective cover. This supplies finite Gamma covers, not completed compact-group covers. |

The reviewed `data/library-coverage.json` has no entry for this new roadmap. Its nearby
ProfiniteProPGroups and PadicMeasures audits were checked before planning. Current Tau Ceti and
TauCetiRoadmap main were also read: the former now has `completedGroupAlgebra` and
`IsCompactModule.completedGroupAlgebraModule`, absent at the pins. Their current existence is
recorded as an upstream note, while the pinned dependency is the existing ProfiniteProPGroups
roadmap. No current-only declaration is counted as a pinned baseline. Searches for ordinary-parts
and GK-dimension APIs in the pinned and current libraries did not locate those targets.

The current upstream roadmaps were checked in addition to the older atlas snapshot, including
the later roadmaps named in WORKERS.md. No target in those added roadmaps is claimed here.
The following ownership boundaries determine the dependency graph:

| Existing owner | Input retained there | Boundary here |
| --- | --- | --- |
| SmoothRepresentationsOfLocalGroups SR.0, SR.2 | O-linear smooth categories, invariants, compact/parabolic induction, generic envelopes and derived-category input | Precise extra compact-analytic and degree-one contracts are requested below; no local replacement category |
| ProfiniteProPGroups layer 9 | Completed group algebras, augmentation and compact module actions | MP.0 adds the noncompact augmented algebra; MP.4 computes this Iwahori |
| QuiverRepresentations layer 3 | Finite-dimensional algebra structure, injective envelopes, projective covers and general projective lifting | Complete-DVR lifting is a Part II request; MP.5 owns the GL₂-specific projective decomposition; compact K-covers are separate |
| PadicLocalLanglandsForGL2Qp R30.2, R30.3, R30.5, R30.6 | Q_p classification, non-Q_p supersingular warning, Montreal functor, Gabriel blocks and projective envelopes | Finite-length criteria and compact-induction calculations are here; block Ext/projectivity inputs remain imports |
| CompletedCohomologyPartII CC.3 | Pontryagin/Schikhof conventions, qualified biduality and automorphic coefficient duality | GK uses its compact dual; no second automorphic duality plan |
| NoncommutativeAndEquivariantIwasawa NE.0 | Uniform graded algebra, canonical grade, noetherian and Lazard infrastructure | Saturated nonuniform PBW/grade and amalgam coherence require the stronger stated contract; the Heisenberg presentation is here |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 | Serre-weight compact induction and its Hecke algebra | The Barthel–Livné finite-codimension step is requested explicitly; k[T]-freeness alone does not replace it |
| LocalFieldsRamification layer 4; ClassFieldTheory layer 7 | Tame inertia, fundamental characters, arithmetic/geometric local Artin maps | Only the GL₂ tame parameter and weight formula are new targets |
| DeformationAndDerivedPatchingAlgebra R03.3 | Regular sequences, complete intersections and Cohen–Macaulay dimension | Apply the input to the explicit disjoint-variable crossing equations |

In particular, R30.5 supplies the Ext-zigzag block relation for fixed central character, the
compact projective generator P, E=End(P) with its topology, and the finite-block-support
anti-equivalence. Hom(P,pi^∨) carries the right E-action by precomposition and the inverse uses
the completed tensor with P followed by duality. A theorem for finite-dimensional algebras alone
would not supply this topological locally finite block statement. CC.3 already owns the
Schikhof-dual automorphic application routed from CDN §4.

## Layers and targets

Each target below gives its complete intended statement, source locator, dependency boundary,
proof work, and checks. API items are proposed interface names; their tests are mathematical
acceptance statements. They do not claim existing Lean declarations. Minor calculations stay
inside proof work rather than becoming a chain of auxiliary nodes.

## MP.0 — Smooth finiteness and augmented Iwasawa algebras

Planets: Torsion admissibility, Augmented Iwasawa algebra, Smooth finite presentation, Amalgam coherence.

<a id="MP-0-torsion-admissibility"></a>

### MP.0/torsion-admissibility — Admissibility on primary torsion representations

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/torsion-admissibility`. Implementation: `unchecked`.

Let O be the integers of a finite extension E/Q_p, with maximal ideal m and residue field k. In the existing
O-linear smooth category for a p-adic Lie group H, restrict to objects V in which every vector is killed by a
power of m. Call V torsion-admissible when V^U[m^j] has finite O-length for every compact open U and j≥1; call
it locally torsion-admissible when each O[H]v is torsion-admissible. Finite generation and finite length
retain the existing module predicates over O[H].

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §1.1.1–1.1.2, pp. 9–11.

Interface:

- `torsionAdmissible_iff` (characterisation): V is torsion-admissible exactly when every V^U[m^j] has finite length.
- `bounded_admissible_iff` (compatibility): If m^aV=0, torsion-admissibility equals finite generation of V^U over O for each U.
- `locallyAdmissible_cyclic` (characterisation): Local admissibility can be checked on all cyclic O[H]-submodules; a finite sum of admissible subobjects is admissible.

Unit tests:

- `divisible_trivial` (computation): With H trivial, E/O is torsion-admissible, although it is not finite over O.
- `infinite_trivial_sum` (non-example): An infinite direct sum of copies of k with trivial H-action is not admissible.
- `finite_torsion` (compatibility): Every finite-length O-module with smooth H-action is admissible and locally admissible.

Check:

- Bounded-exponent objects agree with ordinary admissibility over O/m^j; no global exponent is required.

Proof work:

1. Take the full subcategory of primary torsion objects of the supplied smooth category.
2. Define bounded torsion invariants as the intersection of U-fixed vectors and the kernel of m^j, and apply the existing length predicate.

Dependencies:

- `SmoothRepresentationsOfLocalGroups:SR.0`
- `mathlib:Module.Finite`
- `mathlib:IsFiniteLength`

Uses:

- `CDN, Théorème 1.26`: Distinguishes finite presentation from admissibility in category C.
- [MP.4/gk-dimension](#MP-4-gk-dimension): Ensures compact duals over k are finitely generated.

<a id="MP-0-augmented-iwasawa-algebra"></a>

### MP.0/augmented-iwasawa-algebra — The augmented Iwasawa algebra

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/augmented-iwasawa-algebra`. Implementation: `unchecked`.

For p-adic Lie H and compact open U, form A_H=O[H]⊗_{O[U]}O[[U]] as a left O[H]-module. It has a unique
associative O-algebra structure extending both O[H] and O[[U]], with the tensor relations identifying the two
O[U] actions. For another compact open U′ there is a canonical algebra isomorphism commuting with the H and
completed compact subgroup maps. Every smooth primary torsion O[H]-module extends uniquely to A_H.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §1.1.1, p. 10; [SHOTTON20](https://www.maths.dur.ac.uk/users/jack.g.shotton/papers/coherence.pdf), Proposition 3.2, pp. 7–8; Lemma 3.5, p. 8.

Interface:

- `augmentedAlgebra.compact` (compatibility): For compact H, A_H is canonically O[[H]].
- `augmentedAlgebra.changeOpen` (equivalence): The identifications for U,U′,U′′ satisfy the cocycle identity.
- `smoothModule.extend` (universal-property): An H-equivariant O-linear map of smooth torsion modules is A_H-linear for their unique extensions.

Unit tests:

- `compact_case` (compatibility): Taking U=H for compact H recovers O[[H]].
- `trivial_group` (computation): A_{1}=O and extension of a torsion module is its original scalar action.
- `discrete_case` (computation): For discrete H, U={1} gives A_H=O[H], including its generally noncommutative multiplication.

Check:

- The tensor expression is a module description; multiplication is the crossed group algebra multiplication, not componentwise tensor multiplication.

Proof work:

1. Use coset representatives H/U to express finite sums with coefficients in O[[U]].
2. For two compact opens pass to a common open normal subgroup of their intersection; continuity on finite quotients makes multiplication and comparison independent of representatives.
3. For a vector choose an open subgroup fixing it and a coefficient exponent killing it; the completed coefficients then act through a finite quotient.

Dependencies:

- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `SmoothRepresentationsOfLocalGroups:SR.0`

Uses:

- `CDN, Proposition 1.3`: Coherence is a ring property of A_H.
- [MP.0/finite-presentation](#MP-0-finite-presentation): Translates smooth finite presentation into a module presentation over A_H.

<a id="MP-0-finite-presentation"></a>

### MP.0/finite-presentation — Finite presentation in the smooth category

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/finite-presentation`. Implementation: `unchecked`.

For smooth primary torsion V, finite presentation means that there are compact opens U_1,U_2 and smooth finite
O-length representations W_i of U_i with an exact sequence c-Ind_{U_1}^H W_1 → c-Ind_{U_2}^H W_2 → V → 0.
Finite generation is equivalent to being a quotient of one such compact induction, and to finite generation
over A_H. Finite presentation is equivalent to finite presentation as an A_H-module; it is not defined as
finite presentation over the abstract group ring O[H].

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §1.1.2, pp. 10–11; [SHOTTON20](https://www.maths.dur.ac.uk/users/jack.g.shotton/papers/coherence.pdf), Lemma 2.4, p. 3; Lemma 3.6, pp. 8–9; Proposition 3.8, pp. 9–10.

Interface:

- `finitePresentation_iff_augmented` (equivalence): Smooth finite presentation is equivalent to an A_H-module finite presentation.
- `finiteType_iff_compactInduction` (characterisation): Finite type is equivalent to a surjection from one c-Ind_U^H W with finite O-length W.
- `finitePresentation_restrict_finiteIndex` (compatibility): For a finite-index open H′≤H, V is finitely generated/presented iff its restriction is, with the same smooth conventions.

Unit tests:

- `trivial_group_presentation` (compatibility): For H={1}, smooth finite presentation of a primary torsion O-module is equivalent to finite O-length, since O is a noetherian DVR.
- `compact_induction` (computation): For finite O-length W, c-Ind_U^H W is finitely presented.
- `zero_presentation` (degenerate): The zero representation has the empty compact-induction presentation and is finitely presented.

Check:

- All three finite-generation formulations agree; the presentation uses compact induction with open support modulo U_i.

Proof work:

1. Use smoothness and primary torsion to put finitely many generators in a finite O-length compact-open-stable submodule.
2. Compact induction generates that module under H.
3. Use the completed compact group algebra presentation to identify the finite-relation condition with finite presentation over A_H.

Dependencies:

- [MP.0/augmented-iwasawa-algebra](#MP-0-augmented-iwasawa-algebra)
- [MP.0/torsion-admissibility](#MP-0-torsion-admissibility)
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`

Uses:

- `CDN, Théorèmes 1.21 and 1.26`: Supplies the two independent finiteness predicates.
- [MP.2/category-c](#MP-2-category-c): Defines the admissible finitely presented subcategory.

<a id="MP-0-finiteness-calculus"></a>

### MP.0/finiteness-calculus — Exact-sequence and finite-index calculus

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/finiteness-calculus`. Implementation: `unchecked`.

In a short exact sequence 0→V_1→V_2→V_3→0 of smooth primary torsion H-representations: finite type is
extension-stable; if V_1,V_3 are finitely presented then V_2 is finitely presented; if V_2 is finitely
presented and V_1 finite type then V_3 is finitely presented; if V_2 is finite type and V_3 finitely presented
then V_1 is finite type. Finite type and finite presentation are preserved and reflected by restriction to a
finite-index open subgroup.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.2, p. 11; [SHOTTON20](https://www.maths.dur.ac.uk/users/jack.g.shotton/papers/coherence.pdf), Lemmas 2.6–2.8, pp. 3–5.


Check:

- Do not assert that every submodule of a finitely presented representation is finitely presented.

Proof work:

1. Lift finite compact-open-stable generating modules through the surjection.
2. Apply exact compact induction and the snake lemma to the resulting presentations.
3. Use the finite double-coset Mackey formula for finite-index restriction.

Dependencies:

- [MP.0/finite-presentation](#MP-0-finite-presentation)
- `SmoothRepresentationsOfLocalGroups:SR.2`

<a id="MP-0-amalgam-coherence"></a>

### MP.0/amalgam-coherence — Coherence for amalgams of compact open groups

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/amalgam-coherence`. Implementation: `unchecked`.

If a p-adic Lie group H is an amalgam U_1*_{U_0}U_2 of two compact open subgroups over their open
intersection, A_H is left coherent. Consequently the finitely presented smooth primary torsion
H-representations form an abelian subcategory. This applies to SL_2(F); for GL_2(F) use H_0={g:det g∈O_F^×},
its amalgam decomposition, and the index-two subgroup H_0 of G′=GL_2(F)/⟨varpi_F I_2⟩. Thus finitely presented
G′-representations form an abelian subcategory.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.3, p. 11; [SHOTTON20](https://www.maths.dur.ac.uk/users/jack.g.shotton/papers/coherence.pdf), Proposition 4.3, Corollary 4.4 and Theorem 4.5, p. 11; Theorem 5.1 and Corollary 5.2, p. 12.


Check:

- The conclusion is left coherence, not noetherianity of the noncompact augmented algebra.

Proof work:

1. Identify A_H with the amalgam of O[[U_1]] and O[[U_2]] over O[[U_0]].
2. The compact group rings are noetherian and free, hence flat, over the open-subgroup ring; apply the amalgam coherence theorem specified in the request.
3. Use coherence to close finitely presented modules under kernels and cokernels, then the finite-index calculus for G′.

Dependencies:

- [MP.0/finiteness-calculus](#MP-0-finiteness-calculus)
- `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`
- `NoncommutativeAndEquivariantIwasawa:NE.0`

<a id="MP-0-scalar-extension"></a>

### MP.0/scalar-extension — Hom base change and residue fields of irreducibles

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/scalar-extension`. Implementation: `unchecked`.

If k is a finite field, L/k a field extension, V a finitely generated k[H]-module and W any k[H]-module, the
natural map Hom_H(V,W)⊗_k L→Hom_H(V⊗L,W⊗L) is an isomorphism. For an admissible irreducible smooth k[H]-module
pi, End_H(pi) is a finite extension k′/k, pi is absolutely irreducible as a k′-representation, and its scalar
extension to an algebraic closure decomposes over the embeddings k′→kbar into pairwise nonisomorphic
absolutely irreducible representations.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Lemmas 1.6–1.7, p. 12.


Check:

- Finite generation of V is needed in the Hom statement; admissibility of pi is needed in the irreducible statement.

Proof work:

1. A finite generating family embeds Hom into a finite product of W; write the intertwining equations on that family and descend each finite collection of coefficients.
2. Admissibility puts the division endomorphism algebra inside the endomorphisms of finite-dimensional invariants; apply the finite-division-ring theorem.
3. Separate the embeddings of its finite centre after scalar extension and apply Schur descent.

Dependencies:

- [MP.0/torsion-admissibility](#MP-0-torsion-admissibility)
- `mathlib:Module.Finite`

<a id="MP-0-five-term-presentation"></a>

### MP.0/five-term-presentation — The five-term finite-presentation criterion

Kind: `lemma`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/five-term-presentation`. Implementation: `unchecked`.

In an exact sequence A→B→C→D→E of smooth primary torsion G′-representations, if A,B,D,E are finitely presented
then C is finitely presented. Here G′=GL_2(F)/⟨varpi_F I_2⟩ and F/Q_p is any finite extension.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Lemma 2.9, p. 27.


Check:

- The citation is Lemma 2.9; the adjacent number (2.10) labels a displayed equation.

Proof work:

1. Compute coker(A→B) and ker(D→E) inside the abelian finitely presented subcategory.
2. Exactness expresses C as an extension of these two objects.

Dependencies:

- [MP.0/amalgam-coherence](#MP-0-amalgam-coherence)
- [MP.0/finiteness-calculus](#MP-0-finiteness-calculus)

<a id="MP-0-obstruction-space"></a>

### MP.0/obstruction-space — The compact-induction obstruction space

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.0/obstruction-space`. Implementation: `unchecked`.

Let F/Q_p be finite, G=GL_2(F), K=GL_2(O_F), and let W be a finite-dimensional smooth k[KZ]-module with
central character. For a G-equivariant quotient q:c-Ind_{KZ}^G W→V set P^+={(a,b;0,1):a∈O_F\{0}, b∈O_F},
w=(0,1;varpi_F,0). Let I^+(W) be the span of standard generators [g,v] with g∈P^+,v∈W, and I^−(W)=wI^+(W). Put
Delta(W,V)=q(I^+(W))∩q(I^−(W)) inside V. It is stable under IZ and w. It is an obstruction attached to this
specified presentation, distinct from the finite Diamond invariant module D_1(rho).

Sources: [HU12](https://arxiv.org/pdf/0904.3991v3), §3.1.1, p. 17; §3.3, p. 30; §4.1.2, pp. 34–35.

Interface:

- `obstructionSpace.membership` (characterisation): v belongs to Delta(W,V) iff it has both a positive-cell lift and a negative-cell lift under q.
- `obstructionSpace.normaliser` (structure): IZ and w preserve Delta, with the inherited actions from V.
- `obstructionSpace.map` (functoriality): A G-map V→V′ compatible with the chosen presentations induces the restriction Delta(W,V)→Delta(W,V′), and these maps preserve identities and composition.

Unit tests:

- `free_presentation_obstruction` (degenerate): For q the identity of c-Ind_{KZ}^G W, Delta=0 by the two-cell direct-sum decomposition.
- `trivial_quotient_obstruction` (computation): For W=k with trivial action and q the augmentation to the trivial G-line, both cell images are k, so Delta=k.
- `obstruction_not_right_exact` (non-example): The preceding augmentation has Delta(source)=0 and Delta(target)=k; the induced obstruction map is not surjective.

Check:

- Quotient functoriality does not imply right exactness: the augmentation from a compact induction to a trivial line has zero source obstruction and nonzero target obstruction.

Proof work:

1. Use the explicit two-cell coset decomposition to split the compact induction as I^+(W)⊕I^−(W).
2. Take the intersection of their images in V; the Iwahori decomposition preserves each image and w exchanges them, since w² is central.
3. Equivariant quotient maps preserve this intersection, so define its functorial map without asserting exactness for arbitrary sequences.

Dependencies:

- `SmoothRepresentationsOfLocalGroups:SR.2`
- [MP.0/finite-presentation](#MP-0-finite-presentation)

Uses:

- `Hu Theorem 4.3 and Lemma 4.5`: Converts finite generation of relations into a finite-dimensional obstruction.
- [MP.2/obstruction-finiteness](#MP-2-obstruction-finiteness): Provides the decreasing numerical measure in the finite-length induction.

## MP.1 — Finite-length criteria over Q_p

Planets: Proper-quotient finiteness, Cosocle finite-length criterion, Smooth-dual finite-length criterion.

<a id="MP-1-proper-quotient"></a>

### MP.1/proper-quotient — Proper quotients of Serre-weight compact induction

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/proper-quotient`. Implementation: `unchecked`.

For F=Q_p, k finite of characteristic p and any Serre weight sigma with the prescribed central action, every
proper quotient of I(sigma)=c-Ind_{KZ}^{GL_2(Q_p)} sigma has finite length. The compact induction itself is
infinite-dimensional and has infinite length.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.17 and Remark 1.18, p. 16.


Check:

- F=Q_p is essential; do not turn Remark 1.18 into a theorem for general F.

Proof work:

1. Use the polynomial Hecke action k[T] on I(sigma) and the Barthel–Livné finite-codimension result for pro-p-Iwahori invariants of a nonzero submodule.
2. A proper quotient is generated by a finite-dimensional invariant space, and the Hecke polynomial relation yields finite length using the supplied Q_p classification.
3. Descend along the finite scalar extension by the Hom and irreducibility dictionary.

Dependencies:

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`
- [MP.0/scalar-extension](#MP-0-scalar-extension)
- `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

<a id="MP-1-serre-filtration"></a>

### MP.1/serre-filtration — A finite-type filtration by Serre-weight inductions

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/serre-filtration`. Implementation: `unchecked`.

For F/Q_p finite and G′=GL_2(F)/⟨varpi_F I_2⟩, a smooth k[G′]-representation V is finite type iff it has a
finite filtration whose successive factors are quotients of Serre-weight compact inductions I(sigma).

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.19, p. 17.


Check:

- The construction does not require F=Q_p.

Proof work:

1. Choose a finite generating subspace stable under the compact group KZ/⟨varpi_F I_2⟩.
2. It has finite length; induce its simple filtration and take the images in V.
3. Conversely finite-type factors and extension stability give finite type.

Dependencies:

- [MP.0/finite-presentation](#MP-0-finite-presentation)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`

<a id="MP-1-finite-type-presentation"></a>

### MP.1/finite-type-presentation — Finite type implies finite presentation over Q_p

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/finite-type-presentation`. Implementation: `unchecked`.

For F=Q_p and G′ as above, every smooth finite-type k[G′]-representation is finitely presented.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.20, p. 17.


Check:

- The theorem has residue-field coefficients and F=Q_p.

Proof work:

1. Use the Serre filtration; a factor equal to I(sigma) is finitely presented.
2. A proper quotient has finite length, and its irreducible factors are finitely presented by the Q_p classification.
3. Apply extension stability along both filtrations.

Dependencies:

- [MP.1/serre-filtration](#MP-1-serre-filtration)
- [MP.1/proper-quotient](#MP-1-proper-quotient)
- [MP.0/finiteness-calculus](#MP-0-finiteness-calculus)
- `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`

<a id="MP-1-central-ext"></a>

### MP.1/central-ext — Central characters and finite Ext support

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/central-ext`. Implementation: `unchecked`.

For G′=GL_2(Q_p)/⟨p I_2⟩, every irreducible smooth representation over a finite field k of
characteristic p has a central character over k. If pi has finite length and a central character and
pi′ is irreducible with central character, Ext^1_G(pi,pi′) is finite-dimensional over k and is
nonzero for only finitely many isomorphism classes of pi′.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Lemmas 1.22–1.23, pp. 17–18.

Check:

- Central characters are part of the Ext statement, not consequences for all smooth representations.

Proof work:

1. The centre of G′ is Z_p^×. Its central pro-p subgroup has nonzero invariants in every nonzero smooth characteristic-p representation; irreducibility makes it act trivially. The remaining F_p^× action splits over k, so a central eigenspace is all of the irreducible representation. This gives a k-valued character, rather than merely a character over an extension.
2. Use the supplied finite block list and the finite Ext computation within a block.
3. Induct on the length of pi using the Ext long exact sequence.

Dependencies:

- `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`
- `PadicLocalLanglandsForGL2Qp:R30.5/blocks`
- [MP.0/scalar-extension](#MP-0-scalar-extension)

<a id="MP-1-cosocle-length"></a>

### MP.1/cosocle-length — Finite length detected by the cosocle

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/cosocle-length`. Implementation: `unchecked`.

Let G′=GL_2(Q_p)/⟨p I_2⟩ and V be a finite-type smooth k[G′]-representation. Then V has finite length if and
only if Hom_G′(V,pi′) is finite-dimensional for every irreducible pi′ and vanishes for all but finitely many
isomorphism classes pi′. This is the finite-cosocle formulation of the admissible-cosocle criterion; it does
not posit an algebraic maximal semisimple quotient for an arbitrary infinite-length object.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Theorem 1.21, p. 17.


Check:

- Neither finite type alone nor the same statement for arbitrary F is asserted.

Proof work:

1. Reduce the finite filtration to quotients of I(sigma).
2. If a Serre-induction factor is infinite-length it retains I(sigma). Infinitely many pairwise distinct simple Hecke quotients of I(sigma), together with finite Ext support for the finite-length preceding factors, contradict finite support of Hom(V,pi′). Conversely finite length gives finite-dimensional Hom and finite support by the irreducible classification.
3. Finite length implies admissibility of the semisimple quotient by the Q_p irreducible classification.

Dependencies:

- [MP.1/proper-quotient](#MP-1-proper-quotient)
- [MP.1/serre-filtration](#MP-1-serre-filtration)
- [MP.1/central-ext](#MP-1-central-ext)
- `PadicLocalLanglandsForGL2Qp:R30.5/blocks`

<a id="MP-1-smooth-dual-length"></a>

### MP.1/smooth-dual-length — Finite length detected by smooth vectors in the dual

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.1/smooth-dual-length`. Implementation: `unchecked`.

Let G′=GL_2(Q_p)/⟨p I_2⟩ and V a finite-type smooth k[G′]-representation. Give V^*=Hom_k(V,k) its
compact pointwise topology and contragredient action; let (V^*)^sm be its smooth vectors. Then V has
finite length iff dim_k (V^*)^sm is finite. Moreover, every finite-type infinite-length V admits a
nonzero map V→I(sigma) for some Serre weight sigma.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Theorem 1.24 and Lemma 1.25, pp. 18–19; [DEG](https://math.uchicago.edu/~emerton/pdffiles/localizationGL2Qp.pdf), Lemma 4.2.1, pp. 48–49 (p≥5); [KOHLHAASE17](https://esaga.uni-due.de/f/jan.kohlhaase/Kohlhaase_Smooth_Duality.pdf), Proposition 3.9 and Remark 3.10, pp. 18–19.

Check:

- The smooth part of the compact dual, not the full algebraic dual dimension, is tested.

Proof work:

1. Finite-length Q_p representations are admissible. Their compact dual M is finite over the noetherian k[[U]] for compact analytic U. Its smooth part is a k[[U]]-submodule, hence finitely generated; one open normal subgroup fixes its finitely many generators. It is therefore finite-dimensional over k, by the finite group algebra of the quotient. This is the elementary argument in Kohlhaase Remark 3.10.
2. For infinite length, use the Serre-induction filtration inductively to find a nonzero map from its infinite-length subobject into I(sigma). The resulting nonzero Hom-space is torsion-free over k[T] because I(sigma) is free over k[T], and is thus infinite-dimensional. Ext^1 from the preceding finite-length quotient into I(sigma) is finite-dimensional in the verified prime range. Its connecting map cannot be injective, giving V→I(sigma) nonzero. The recorded gap is exactly this Ext input at p=2,3.
3. Finite-support functionals in the compact dual of I(sigma) are smooth and dense, using the compact-induction coset decomposition and the finite weight action. If (V*)^sm is finite-dimensional it is closed, so the continuous dual map I(sigma)*→V* has finite-dimensional image. Dualising its nonzero image gives a finite-dimensional subrepresentation of I(sigma), impossible by the compact-induction rigidity argument.

Dependencies:

- [MP.1/finite-type-presentation](#MP-1-finite-type-presentation)
- [MP.1/cosocle-length](#MP-1-cosocle-length)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`
- `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`
- `PadicLocalLanglandsForGL2Qp:R30.6`
- `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`
- `CompletedCohomologyPartII:CC.3/qualified-biduality`
- `SmoothRepresentationsOfLocalGroups:SR.0`

## MP.2 — Admissible finite presentation and ordinary parts

Planets: Ordinary parts, Ordinary-parts vanishing, Admissible finite presentation, Ordinary-parts approximation.

<a id="MP-2-ordinary-parts"></a>

### MP.2/ordinary-parts — Emerton ordinary parts for GL_2(F)

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/ordinary-parts`. Implementation: `unchecked`.

Let B=TN be the upper Borel of G=GL_2(F) and bar B its lower opposite. On admissible smooth primary torsion
representations, use unnormalised smooth induction Ind_{bar B}^G and construct its right adjoint Ord_B. For
N_0=N∩GL_2(O_F) and T^+ contracting N_0, the construction is the locally T-finite part of Hom_{O[T^+]}(O[T],
V^{N_0}), where T^+ acts on invariants through the Hecke trace operators. It is independent of the contracting
compact subgroup, left exact, and has the adjunction counit Ind_{bar B}^G Ord_B(V)→V.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §1.5.2, p. 20; Emerton I §3.1–3.3 and Theorem 4.4.6, pp. 14–24, 36–38; [EMERTON1](https://www.math.uchicago.edu/~emerton/pdffiles/ord-one.pdf), Definitions 3.1.3, 3.1.7–3.1.9, pp. 14–17; Theorem 4.4.6, pp. 36–38.

Interface:

- `ordinaryParts.adjunction` (universal-property): Hom_G(Ind_{bar B}^G U,V) ≅ Hom_T(U,Ord_B V), naturally for admissible U,V.
- `ordinaryParts.unit` (compatibility): For admissible U the unit U→Ord_B Ind_{bar B}^G U is an isomorphism.
- `ordinaryParts.counit` (functoriality): The evaluation counit commutes with equivariant maps and with coefficient reduction in the qualified inverse system used below.

Unit tests:

- `induction_unit` (compatibility): Ord_B Ind_{bar B}^G U recovers U, with its original T action.
- `zero_ordinary` (degenerate): Ord_B(0)=0 and its counit is the zero map.
- `borel_orientation` (non-example): For distinct smooth characters chi_1,chi_2 of F^×, Ord_B(Ind_B^G(chi_1⊗chi_2))=chi_2⊗chi_1. Thus the upper-Borel induction cannot replace lower-Borel induction in the unit without Weyl conjugation.

Check:

- The upper Borel defines ordinary parts and the lower Borel defines induction; no modulus or square-root twist is inserted.

Proof work:

1. Form N_0 invariants with the contracting-monoid Hecke action.
2. Invert the contracting monoid by the Hom construction and restrict to the locally T-finite smooth subrepresentation.
3. Use the open Bruhat cell to identify maps from induction with maps into these ordinary parts.

Dependencies:

- `SmoothRepresentationsOfLocalGroups:SR.2`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- [MP.0/torsion-admissibility](#MP-0-torsion-admissibility)

Uses:

- `CDN, Proposition 1.30`: Computes ordinary parts on ordinary irreducibles.
- [MP.2/ordinary-counit](#MP-2-ordinary-counit): Constructs an induced approximation to each C object.

<a id="MP-2-ordinary-values"></a>

### MP.2/ordinary-values — Ordinary parts on ordinary constituents away from Q_p

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/ordinary-values`. Implementation: `unchecked`.

Assume F≠Q_p. For every admissible smooth primary torsion T-representation U, Ord_B Ind_{bar B}^G
U≅U and R^1 Ord_B(Ind_{bar B}^G U)=0. For a smooth torsion character chi of F^×,
Ord_B(St⊗chi∘det)=chi⊗chi and R^1Ord_B of this twist is zero; both Ord_B(chi∘det) and
R^1Ord_B(chi∘det) vanish.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Proposition 1.30, pp. 20–21; [HAUSEUX](https://julien-hauseux.perso.math.cnrs.fr/pdf/extensions.pdf), Corollary 4.2.4, pp. 34–35; [EMERTON2](https://www.math.uchicago.edu/~emerton/pdffiles/ord-two.pdf), Remark 3.7.3, p. 23; Theorem 4.2.12, p. 30 (Q_p boundary check).

Check:

- The derived-degree-one assertion is false over Q_p for a character and for generic principal series.

Proof work:

1. Use the open Bruhat cell and the ordinary-parts unit for degree zero on induction. Hauseux Corollary 4.2.4(ii) gives H^1Ord_B(Ind_{bar B}^G U)=0 when F≠Q_p.
2. Use the natural injection R^1Ord_B→H^1Ord_B on locally admissible representations (Emerton II Remark 3.7.3). This transfers vanishing without assuming an unproved equality of delta functors.
3. For Steinberg, its B-restriction is the compactly supported function model on N, twisted by chi; the regular N_0-function modules have no positive continuous cohomology. For a character, contraction by diag(p,1) acts on degree-one N_0-cohomology through a multiple of p^{[F:Q_p]−1}; it is locally nilpotent on primary torsion when [F:Q_p]>1. The degree-zero trace on a character is locally nilpotent as well. Localising the Hecke action gives the stated vanishings.
4. The Q_p calculation in Emerton II Theorem 4.2.12 is a boundary check only: its nonzero character and principal-series H^1 terms explain the restriction on F.

Dependencies:

- [MP.2/ordinary-parts](#MP-2-ordinary-parts)
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `SmoothRepresentationsOfLocalGroups:SR.2`

<a id="MP-2-obstruction-finiteness"></a>

### MP.2/obstruction-finiteness — Finite obstruction and admissible length

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/obstruction-finiteness`. Implementation: `unchecked`.

Let k be a finite characteristic-p field, with scalar extension to kbar permitted. For a finite-type smooth
G=GL_2(F) representation V with central character and a finite-dimensional generating KZ-submodule W⊂V, the
natural presentation c-Ind_{KZ}^G W→V has finitely generated kernel iff Delta(W,V) is finite-dimensional. This
finite-kernel property holds for one such W iff it holds for every such W. If sigma is an irreducible
KZ-weight and V is an admissible proper quotient of its compact induction with finite-dimensional
Delta(sigma,V), then V has finite length.

Sources: [HU12](https://arxiv.org/pdf/0904.3991v3), Hu Theorem 4.3, pp. 33–34; Proposition 4.4 and Lemma 4.5, pp. 34–36; Proposition 3.30 and Corollary 3.31, pp. 30–31.


Check:

- Properness and admissibility are essential in the final assertion: the entire compact induction has zero obstruction and infinite length.

Proof work:

1. Bound supports of a finite family of kernel generators in the radial coset decomposition; projection to the opposite half shows the obstruction lies in finitely many finite-dimensional radial spaces.
2. Conversely lift a basis of the finite obstruction in bounded radius. Subtract its translates to lower the support radius of any relation, proving the relations are finitely generated. Use the finite filtration of W to pass from an irreducible weight to general W.
3. For an admissible quotient choose an irreducible subrepresentation. The obstruction of that subrepresentation injects and is nonzero; the quotient obstruction is a quotient of the original. Thus its dimension strictly decreases. Admissibility passes to quotients in characteristic zero, so induction gives finite length.
4. Use finite coefficient extension and descent to transfer the algebraically closed coefficient argument to k.

Dependencies:

- [MP.0/obstruction-space](#MP-0-obstruction-space)
- [MP.0/finiteness-calculus](#MP-0-finiteness-calculus)
- [MP.0/scalar-extension](#MP-0-scalar-extension)
- `SmoothRepresentationsOfLocalGroups:SR.0`

<a id="MP-2-category-c"></a>

### MP.2/category-c — Admissible finitely presented representations

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/category-c`. Implementation: `unchecked`.

For any finite F/Q_p set G=GL_2(F). Let C_O(G) be the full subcategory of smooth primary torsion
O[G]-representations that are both torsion-admissible and finitely presented in the compact-induction sense.
Its objects have finite length and it is stable under subobjects, quotients and extensions. For F=Q_p it
equals the finite-length category. For F≠Q_p its irreducible constituents, after finite scalar extension, are
characters, twists of Steinberg and principal series, with no supersingular constituent.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Theorem 1.26, p. 19, and Lemma 1.29, p. 20; [VIGNERAS11](https://www.researchgate.net/publication/292473119_Le_foncteur_de_Colmez_pour_GL2_F), Propositions 5.5(i) and 5.6(i), pp. 550–551; Proposition 5.8, p. 551; [HU12](https://arxiv.org/pdf/0904.3991v3), Theorem 4.3, Lemma 4.5 and Corollary 3.31, pp. 31, 33–36.

Interface:

- `categoryC.finiteLength` (characterisation): Every object of C_O(G) has finite length.
- `categoryC.serre` (structure): Subobjects, quotients and extensions of C objects are again C objects.
- `categoryC.qp` (equivalence): For F=Q_p, C_O(G) is the full finite-length smooth primary torsion category.

Unit tests:

- `character_object` (computation): Every smooth finite-order k-valued character chi∘det belongs to C.
- `steinberg_object` (computation): A smooth k-valued twist of Steinberg belongs to C.
- `supersingular_boundary` (non-example): For F≠Q_p a supersingular irreducible over kbar does not belong to C, even if admissible.

Check:

- Finite length and finite presentation are equivalent here only for F=Q_p.

Proof work:

1. Finite presentation bounds the coefficient exponent, so reduce through its finite residue-coefficient filtration. Admissibility implies local finiteness for the centre; enlarge coefficients so each finite generating KZ-module has a central-character composition series.
2. The obstruction-space criterion passes finite-dimensional obstruction to the irreducible-weight induction factors. Apply admissible finite-obstruction length to each factor, then the Hu–Vignéras filtration argument to obtain finite length.
3. Vignéras Proposition 5.5(i) gives admissibility and finite presentation for finite-length subobjects; combine quotient admissibility and the presentation calculus to obtain the Serre property.
4. For Q_p import finite presentation and admissibility of irreducibles. For F≠Q_p import Schraen–Wu to exclude supersingulars, then use the ordinary constituent classification and coefficient descent.

Dependencies:

- [MP.0/torsion-admissibility](#MP-0-torsion-admissibility)
- [MP.0/finite-presentation](#MP-0-finite-presentation)
- `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`
- `PadicLocalLanglandsForGL2Qp:R30.2/no-correspondence-beyond-qp`
- [MP.2/obstruction-finiteness](#MP-2-obstruction-finiteness)
- [MP.0/finiteness-calculus](#MP-0-finiteness-calculus)

Uses:

- `CDN, Lemmas 1.31–1.33`: Finite length permits induction through ordinary constituents.
- [MP.2/ordinary-banach](#MP-2-ordinary-banach): Controls reductions of admissible unitary lattices.

<a id="MP-2-ordinary-counit"></a>

### MP.2/ordinary-counit — Exact ordinary parts and the finite-error counit

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/ordinary-counit`. Implementation: `unchecked`.

Assume F≠Q_p. On C_O(GL_2(F)), Ord_B is exact and Ord_B(V) is a finite O-module. If Ord_B(V)=0 then V is a
finite O-module. For every V in C, the kernel and cokernel of the counit Ind_{bar B}^G Ord_B(V)→V are finite
O-modules.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Lemmas 1.31–1.32 and Proposition 1.33, p. 21.


Check:

- Finite O-module error is stronger than finite representation length; principal series are finite-length but generally infinite-dimensional.

Proof work:

1. Induct on the finite length filtration in C and use R^1Ord_B=0 on ordinary constituents to get exactness and O-finiteness.
2. Zero ordinary parts eliminates principal-series and Steinberg constituents, leaving finite-dimensional characters.
3. Apply Ord_B to the counit and the unit identity: its kernel and cokernel have zero ordinary parts and lie in C, so are finite O-modules.

Dependencies:

- [MP.2/category-c](#MP-2-category-c)
- [MP.2/ordinary-values](#MP-2-ordinary-values)
- [MP.2/ordinary-parts](#MP-2-ordinary-parts)

<a id="MP-2-ordinary-banach"></a>

### MP.2/ordinary-banach — An induced approximation of an admissible Banach lattice

Kind: `application`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.2/ordinary-banach`. Implementation: `unchecked`.

Assume F≠Q_p. Let Pi be an admissible unitary E-Banach representation of GL_2(F), and Theta a stable
open bounded O-lattice such that Theta/varpi_E Theta belongs to C_O(G). There is a finite O-module
sigma with continuous T-action and a continuous G-equivariant map Ind_{bar B}^G(sigma)→Theta whose
kernel and cokernel are finite O-modules; here induction is continuous induction on the integral
complete coefficient module.

Sources: [CDN23](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), Corollary 1.34, p. 21.

Check:

- Theta is separated and complete and the induction in this statement is continuous, not the smooth induction of a discrete lattice.

Proof work:

1. Apply ordinary parts to Theta/varpi_E^n and take the compatible inverse limit.
2. Use exactness and Nakayama to prove that the resulting T-module sigma is finite over O.
3. Pass the finite-error counits to the inverse limit with the surjectivity and bounded-error checks of the source.

Dependencies:

- [MP.2/ordinary-counit](#MP-2-ordinary-counit)
- `CompletedCohomologyPartII:CC.3/qualified-biduality`
- `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`
- `SmoothRepresentationsOfLocalGroups:SR.2`

## MP.3 — Tame weights and extension coordinates

Planets: Regular Serre weights, Extension-graph coordinates, Serre-weight extension graph, Tame Serre-weight set, Diamond socle modules.

<a id="MP-3-weight-coordinates"></a>

### MP.3/weight-coordinates — Regular weights and alcove depth

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`. Implementation: `unchecked`.

Assume F/Q_p is unramified of degree f≥1, residue field k_F=F_{p^f}, and a finite coefficient field k
containing all embeddings of k_F. Index embeddings by J=Z/fZ, with Frobenius cycling them. A weight
lambda=((a_i,b_i)) has r_i=a_i−b_i; F(lambda)=⊗_i (Sym^{r_i} k^2 ⊗ det^{b_i})^{(i)} when 0≤r_i≤p−1. The
regular region used here has 0≤r_i≤p−2. Define lambda to be N-deep by N<r_i+1<p−N for every i. The weight
lattice modulo central weights is Z^J, with basis eta_i and root sublattice (2Z)^J; alpha_i maps to 2eta_i.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), §2.1–2.2, pp. 11–14; §2.4, pp. 15–17.

Interface:

- `Weight.deep_iff` (characterisation): For integral N≥0, N-deep means N≤r_i≤p−N−2 for all i.
- `Weight.centralTwist` (compatibility): Adding (c_i,c_i) changes only the determinant twist, and preserves r_i and depth.
- `Weight.rootCoordinate` (projection): The simple root alpha_i has coordinate 2eta_i in Z^J.

Unit tests:

- `depth_three` (computation): For p=17 and every r_i=3, the weight is 3-deep.
- `depth_boundary` (non-example): For p=17, r_0=2 prevents 3-depth, even if all other r_i=6.
- `central_twist` (compatibility): Weights ((5,0)) and ((8,3)) have the same depth; the latter representation is a determinant twist, not the same labelled weight.

Check:

- The prime-boundary inequalities are strict in r_i+1, not in r_i.

Proof work:

1. Use the supplied finite GL_2(k_F) Serre-weight classification and fix the embedding and determinant conventions.
2. Express the regular region and depth as the stated integer inequalities.

Dependencies:

- `mathlib:Representation`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`

Uses:

- `BHHMS, §6.2–6.4`: States every genericity range for extension and multiplicity theorems.
- [MP.8/projective-lattice](#MP-8-projective-lattice): The lattice construction needs exactly 3-deep weights.

<a id="MP-3-translation-map"></a>

### MP.3/translation-map — The extension-graph coordinate map

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.3/translation-map`. Implementation: `unchecked`.

Let lambda=((a_i,b_i)) be regular and Lambda_W^lambda={omega∈Z^J : 0≤r_i+omega_i≤p−2 for every i}. Write
uniquely omega_i=2n_i+delta_i with delta_i∈{0,1}. Define t_lambda(omega), modulo (p−pi)X^0(T), by its i-th
pair: (a_i+n_i+delta_i,b_i−n_i) when delta_{i+1}=0, and (b_i−1−n_i,a_i+n_i+delta_i−p+1) when delta_{i+1}=1.
Indices are cyclic. Let Sigma={∑_{i∈A}eta_i:A⊆J}. Two lattice points are adjacent when their difference is
±eta_i for one i.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Equation (14), p. 16; Lemma 2.4.6 and Remark 2.4.7, p. 17.

Interface:

- `weightTranslation.zero` (simp): t_lambda(0) is represented by lambda.
- `weightTranslation.regular` (characterisation): omega lies in Lambda_W^lambda iff the resulting weight is regular; depth is transported from lambda+omega.
- `weightTranslation.rootShift` (compatibility): For nu=2n in (2Z)^J, let its root-lattice lift be ((n_i,−n_i))_i. Then t_{lambda+lift(nu)}(omega)=t_lambda(omega+nu) in the central quotient.
- `weightAdjacent_iff` (characterisation): Adjacency is symmetric, excludes equality, and changes exactly one coordinate by one.

Unit tests:

- `negative_parity` (computation): For f=1,p=17,lambda=(5,0),omega=−1, n=−1,delta=1 and the representative is (0,−11).
- `positive_parity` (computation): For f=1,p=17,lambda=(5,0),omega=1 the representative is (−1,−10).
- `cyclic_branch` (computation): For f=2,p=17,lambda=((5,0),(6,0)),omega=(1,0), the representative is ((6,0),(−1,−10)); the branch at 1 reads parity at 0.
- `adjacency_not_distance_two` (non-example): 0 and 2eta_0 are not adjacent, while 0 and −eta_0 are adjacent.
- `origin_test` (compatibility): For omega=0 every branch is the first and both entries of lambda are unchanged.

Check:

- Changing the central representative of lambda gives the same labelled Serre weight up to its prescribed central twist.

Proof work:

1. Apply Euclidean division by 2, including negative coordinates.
2. Evaluate the piecewise representative and pass to the central-weight quotient.
3. The residue class delta at i+1 selects the branch at i; the current-coordinate parity remains in the formula itself.

Dependencies:

- [MP.3/weight-coordinates](#MP-3-weight-coordinates)

Uses:

- `BHHMS, Lemmas 2.4.4 and 2.4.6`: Turns extensions into signed-coordinate steps.
- [MP.6/box-module](#MP-6-box-module): Labels each constituent of the rectangular modules without ambiguity.

<a id="MP-3-change-origin-ext"></a>

### MP.3/change-origin-ext — Change of origin and extensions between regular weights

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.3/change-origin-ext`. Implementation: `unchecked`.

For omega∈Lambda_W^mu and a lift lambda of t_mu(omega), put w_omega in {±1}^J with its i-th sign
selected by the parity of omega_{i+1}. Then t_lambda(omega′)=t_mu(w_omega^{-1}omega′+omega), with
the corresponding domains identified. This change of origin preserves adjacency. For
omega,omega′∈Lambda_W^mu, dim_k Ext^1_{GL_2(k_F)}(F(t_mu(omega)),F(t_mu(omega′))) is 1 when they are
adjacent and 0 otherwise.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemmas 2.4.4 and 2.4.6, Remark 2.4.7, p. 17; BP Corollary 5.6; [BP12](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/supersingular.pdf), Corollary 5.6, pp. 37–38.

Check:

- Ext is taken for the finite group, not for K or the Iwahori.

Proof work:

1. Substitute the parity representatives into (14); the parity-dependent sign corrects the origin change.
2. It is a coordinatewise signed translation, hence preserves adjacency.
3. Reduce Ext to omega=0 and apply the explicit rank-one finite-group Ext computation supplied in the request.

Dependencies:

- [MP.3/translation-map](#MP-3-translation-map)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`

<a id="MP-3-tame-weight-set"></a>

### MP.3/tame-weight-set — Tame Galois weights

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.3/tame-weight-set`. Implementation: `unchecked`.

Let rho:G_F→GL_2(k) be tame. Write s=(s_i) in (S_2)^J, let r be the order of s_0s_{f−1}⋯s_1, put f′=rf, and
fix an extension of the chosen residue embedding to the unramified extension F′/F of degree r. Let
omega_{f′}:I_F→k^× be the residue of the inverse local Artin map on inertia followed by that embedding; Artin
sends a uniformizer to geometric Frobenius. Extend s_i and nu_i periodically and put
a_j=s_1^{-1}⋯s_j^{-1}(nu_j), with the empty product at j=0. Define tau(s,nu) on inertia as the sum of the two
characters omega_{f′}^{sum_{j=0}^{f′−1}p^j a_{j,c}}, c=1,2. Suppose rho|_{I_F}≅tau(s,mu) and mu−eta is 1-deep,
where eta_i=(1,0). Define W(rho)={F(t_{mu−eta}(s omega)):omega∈Sigma}. This is independent of the inertial
presentation and equals the obvious Serre-weight set.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- For inertial parameters k also contains the residue field of the unramified splitting extension F′, of degree at most two over F.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Definition 2.3.1, pp. 13–14; Proposition 2.4.2, p. 16.

Interface:

- `tameWeights.membership` (characterisation): sigma∈W(rho) iff it is F(t_{mu−eta}(s omega)) for some omega∈Sigma.
- `tameWeights.parameterIndependence` (compatibility): Equivalent tame inertial presentations give the same weight set.
- `tameWeights.finite` (structure): W(rho) is a nonempty finite set with at most 2^f elements; in the generic situation the labels are distinct.
- `tameParameter.exponents` (characterisation): The c-th character of tau(s,nu) has exponent sum p^j(s_1^{-1}⋯s_j^{-1}nu_j)_c, modulo p^{f′}−1; no additional eta is added when nu is the input.

Unit tests:

- `split_rank_one` (computation): For f=1, s=1 and mu−eta=(5,0),p=17, the two labels are F(5,0) and F(−1,−10).
- `empty_subset` (degenerate): The empty subset gives F(mu−eta), so W(rho) is never empty.
- `weyl_sign` (non-example): Replacing s=−1 by +1 for f=1 changes the second argument from −eta_0 to eta_0 and must not silently preserve the representative.
- `fundamental_character_normalisation` (compatibility): For f=1,s=1,nu=(a,b), tau is omega_1^a⊕omega_1^b under the geometric-Frobenius Artin convention.

Check:

- This definition is only for tame rho; it does not substitute a semisimplified weight set for a general wild extension.

Proof work:

1. Construct the fundamental tame character using the local Artin input and the marked tame inertia quotient. The unramified extension has degree the order of the product permutation, so the two displayed characters descend as an inertial parameter.
2. Identify the resulting set with obvious weights; use invariance under the inertial parameter relations to descend.

Dependencies:

- [MP.3/translation-map](#MP-3-translation-map)
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Uses:

- `BHHMS, Corollary 6.3.13`: Selects the protected socle constituents in maximal injective truncations.
- [MP.7/local-gk-bound](#MP-7-local-gk-bound): States exactly which K-socle weights occur.

<a id="MP-3-diamond-socle"></a>

### MP.3/diamond-socle — The finite Diamond socle modules

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.3/diamond-socle`. Implementation: `unchecked`.

For a finite set D of pairwise nonisomorphic Serre weights let D_0(D) be the largest submodule of
Inj_{GL_2(k_F)}(⊕_{sigma∈D}sigma) whose multiplicity of every sigma∈D is one. It has socle ⊕_D sigma
and splits into D_{0,sigma}(D) with irreducible socle sigma. For tame generic rho put
D_0(rho)=D_0(W(rho)) and D_1(rho)=D_0(rho)^{I_1}, inflated to I. Only this K-module and its Iwahori
invariants are needed; no choice of the extra normaliser action of a full basic diagram is included.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), BP Proposition 13.1, pp. 75–76 of author copy; BHHMS §6.3, p. 63; §6.4, pp. 72–73; [BP12](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/supersingular.pdf), Proposition 13.1 and Corollary 13.2, pp. 75–76.

Interface:

- `diamondSocle.maximal` (universal-property): Every finite GL_2(k_F)-module with this socle and protected multiplicities embeds in D_0(D), compatibly after choosing its socle embedding.
- `diamondSocle.summands` (structure): D_0(D)=⊕_D D_{0,sigma}(D), with socle D_{0,sigma}=sigma.
- `diamondInvariants.restrict` (compatibility): D_1(rho) is exactly the I_1-fixed submodule of D_0(rho), with the inherited I action.

Unit tests:

- `empty_weights` (degenerate): D_0(∅)=0 and its I_1 invariants vanish.
- `all_simples` (computation): If D is the entire set of simple GL_2(k_F)-modules, D_0(D)=⊕_D sigma; no extra constituent can occur.
- `invariant_action` (compatibility): I_1 acts trivially on D_1, while its nontrivial I/I_1 character labels are retained.

Check:

- The definition uses maximality within a fixed finite injective hull, not all K-extensions with the same socle.

Proof work:

1. Use finite-dimensional injective envelopes; sums of submodules preserving the protected multiplicities preserve them by length additivity.
2. Take the resulting largest submodule and its injective-summand decomposition.
3. Take I_1 invariants with their I/I_1 character action.

Dependencies:

- [MP.3/tame-weight-set](#MP-3-tame-weight-set)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- `SmoothRepresentationsOfLocalGroups:SR.0`

Uses:

- `BHHMS, Corollary 6.3.15`: Identifies K_1 invariants in the multiplicity-preserving enlargement.
- [MP.7/diamond-connected](#MP-7-diamond-connected): Supplies the semisimple I-character set for connectedness.

## MP.4 — Iwahori filtrations and Gelfand–Kirillov dimension

Planets: Gelfand–Kirillov dimension, Pro-p Iwahori valuation, Graded Iwahori algebra, Crossing quotient, Truncated Iwahori projectives, Iwahori GK bound.

<a id="MP-4-gk-dimension"></a>

### MP.4/gk-dimension — Gelfand–Kirillov dimension of an admissible representation

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/gk-dimension`. Implementation: `unchecked`.

For compact p-adic analytic H, coefficient field k of characteristic p and finite k[[H]]-module M, set
j_H(M)=inf{n≥0:Ext^n_{k[[H]]}(M,k[[H]])≠0}, with j_H(0)=∞; use Ext in left modules, valued as right modules.
For admissible smooth V of a p-adic Lie group G, choose an open uniform pro-p H and its finitely generated
compact contragredient dual M=V^∨. Define dim_G(V)=dim_{Q_p}H−j_H(M), independent of H, and dim_G(0)=−∞. For
uniform H this equals the dimension of the graded support of gr M over gr k[[H]].

Hypotheses and conventions:

- G is a p-adic Lie group and V is an admissible smooth representation over a finite characteristic-p field. Use uniform open pro-p subgroups for canonical dimension; a nonuniform subgroup requires the separate filtered-ring hypotheses.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), §5.1, pp. 46–47, including equation (36).

Interface:

- `gkDimension.openRestriction` (compatibility): Restriction to any open subgroup preserves dim_G V.
- `gkDimension.uniformSupport` (characterisation): For uniform H, dim_H V equals Krull dimension of the support of gr(V^∨).
- `gkDimension.growth` (characterisation): For H_n the p-power filtration, invariant growth has exponent dim_H V: dim_k V^{H_n} is bounded above and below by positive constants times p^{n dim_H V} for nonzero V.

Unit tests:

- `zero_gk` (degenerate): The zero representation has dimension −∞, distinct from a nonzero finite-dimensional representation.
- `trivial_line_gk` (computation): A nonzero trivial k-line has GK dimension zero.
- `regular_dual_gk` (computation): The smooth dual of k[[Z_p^d]] has dimension d, since its compact dual is free of rank one.

Check:

- The zero value is −∞; the numerical dimension belongs to the smooth representation via its compact dual.

Proof work:

1. Use a uniform open subgroup and a good adic filtration on its finite dual module.
2. Apply the filtered canonical-dimension comparison to its commutative polynomial graded algebra.
3. Compare the invariant-growth exponents under finite-index restriction to prove independence of H.

Dependencies:

- `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-auslander-regularity`
- `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-graded-polynomial`
- `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`
- `CompletedCohomologyPartII:CC.3/qualified-biduality`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `NoncommutativeAndEquivariantIwasawa:NE.0`

Uses:

- `BHHMS, Corollary 5.3.5`: Converts a graded annihilator into the bound f.
- [MP.7/local-gk-bound](#MP-7-local-gk-bound): Measures the final local representation.

<a id="MP-4-dimension-comparisons"></a>

### MP.4/dimension-comparisons — Quotient and central-regular-sequence dimension comparison

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/dimension-comparisons`. Implementation: `unchecked`.

If a closed normal analytic subgroup N of a p-adic Lie group G acts trivially on an admissible smooth V, then
dim_G V=dim_{G/N}V. In addition let H be analytic pro-p without p-torsion, A=k[[H]], and suppose gr_m A is
Auslander-regular. If a homogeneous central regular sequence z_1,…,z_r generates J, gr_m A/J is a polynomial
ring in dim H−r variables, and J annihilates gr M for a finite A-module M, then dim H−j_A(M) equals the
support dimension of gr M over gr A/J.

Hypotheses and conventions:

- All compact groups in the comparison are p-adic analytic; modules are finitely generated over the displayed completed group algebras. The central-regular-sequence statement requires its explicit regularity and graded-support hypotheses.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemmas 5.1.2–5.1.3, pp. 47–48.


Check:

- Do not use the commutative support formula for a noncommutative graded ring without killing the central regular sequence.

Proof work:

1. The normal-subgroup equality follows from invariant growth through the quotient and cofinal open subgroup filtrations.
2. Compare filtered and graded Ext grades by the requested filtered homological theorem.
3. For the central regular sequence use the change-of-rings Ext spectral sequence: grade shifts by r, exactly cancelling the dimension drop.

Dependencies:

- [MP.4/gk-dimension](#MP-4-gk-dimension)
- `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`
- `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-auslander-regularity`
- `NoncommutativeAndEquivariantIwasawa:NE.0`

<a id="MP-4-iwahori-valuation"></a>

### MP.4/iwahori-valuation — The nonuniform pro-p Iwahori valuation

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/iwahori-valuation`. Implementation: `unchecked`.

Assume p>3 and F/Q_p unramified of degree f. Put K=GL_2(O_F), K_1=1+pM_2(O_F), I the upper Iwahori, I_1 its
pro-p radical, Z_1=Z∩I_1, and P=I_1∩SL_2(F)≅I_1/Z_1. On g=((1+pa,b),(pc,1+pd))∈P define
omega(g)=min{1+v_p(a),1/2+v_p(b),1/2+v_p(c),1+v_p(d)}. It is a saturated p-valuation. The logarithm identifies
its valued Lie algebra with O_F⊗_{Z_p}{((pa,b),(pc,−pa)):a,b,c∈Z_p}; e,f have degree 1/2 and h degree 1.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), §5.3, pp. 50–51; Lemma 5.3.1 and proof, pp. 51–52.

Interface:

- `iwahoriValuation.log` (equivalence): Log and exp identify P with the displayed trace-zero matrix lattice and preserve omega.
- `iwahoriValuation.pPower` (characterisation): omega(g^p)=omega(g)+1, with omega(1)=∞.
- `iwahoriValuation.centreQuotient` (compatibility): For p>2, dividing I_1 by its central scalar part gives P, compatible with torus conjugation.

Unit tests:

- `upper_root_order` (computation): The upper unipotent matrix with entry 1 has omega=1/2.
- `lower_root_order` (computation): The lower unipotent matrix with entry p has omega=1/2.
- `diagonal_order` (computation): diag(1+p,(1+p)^{-1}) has omega=1.
- `identity_order` (degenerate): The identity has omega=∞, not zero.

Check:

- P is not uniform; the half-integral degrees must survive until the final rescaling.

Proof work:

1. Use the p-adic matrix logarithm and exponential on this valuation range.
2. Compute diagonal and off-diagonal orders of products, commutators and pth powers.
3. Use the determinant-one condition to identify the logarithm image and check saturation with the p>3 bound.

Dependencies:

- `NoncommutativeAndEquivariantIwasawa:NE.0/p-valuation`
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- [MP.3/weight-coordinates](#MP-3-weight-coordinates)

Uses:

- `BHHMS, Proposition 5.3.3`: Identifies the group-algebra filtration.
- [MP.4/graded-iwahori](#MP-4-graded-iwahori): Produces a Heisenberg graded Lie algebra rather than an abelian one.

<a id="MP-4-graded-iwahori"></a>

### MP.4/graded-iwahori — The graded pro-p Iwahori algebra

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/graded-iwahori`. Implementation: `unchecked`.

For P=I_1/Z_1 and p>3, let A=k[[P]] and m its augmentation ideal. In characteristic p, gh−1≡(g−1)+(h−1) mod
m², g^{-1}−1≡−(g−1) mod m², and g^p−1∈m^p. If w is the induced Lazard valuation then m^{2j}={x:w(x)≥j} for
j∈(1/2)N. After doubling degrees, gr_m A≅⊗_{i∈J}U_k(h_i), where h_i has basis e_i,f_i,h_i in degrees 1,1,2 and
sole nonzero bracket [e_i,f_i]=h_i. For H=I/I_1, the conjugation weights are alpha_i,alpha_i^{-1},1. This ring
is Auslander-regular, the h_i form a central regular sequence, and its quotient by them is k[e_i,f_i:i∈J].

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 5.3.2 and Proposition 5.3.3, pp. 52–53; equations (42)–(43) and Theorem 5.3.4(i), pp. 53–54.


Check:

- The full graded ring is noncommutative: [e_i,f_i]=h_i survives before the central quotient.

Proof work:

1. Prove the elementary augmentation congruences by expansion.
2. Use the requested saturated-group Lazard enveloping comparison and the ordered basis to compare adic and valuation monomials.
3. Compute the Lie brackets after coefficient splitting. PBW gives central regularity and the polynomial quotient; the enveloping-algebra homological theorem gives Auslander regularity.

Dependencies:

- [MP.4/iwahori-valuation](#MP-4-iwahori-valuation)
- `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`
- `NoncommutativeAndEquivariantIwasawa:NE.0`

<a id="MP-4-crossing-algebra"></a>

### MP.4/crossing-algebra — The crossing quotient algebra

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/crossing-algebra`. Implementation: `unchecked`.

For a field k and finite index set J, define C_J(k)=k[X_i,Y_i:i∈J]/(X_iY_i:i∈J). Its Krull dimension is |J|
and it is a commutative Cohen–Macaulay complete intersection. In the graded Iwahori algebra, the two-sided
ideal I_P generated by h_i and e_if_i has quotient C_J(k), equivariantly for H; all generators of I_P have
degree two and trivial H-character.

Hypotheses and conventions:

- The commutative algebra is defined for any field k and finite J, including J empty. Its comparison with the graded Iwahori algebra uses unramified F/Q_p of degree |J|, k containing the residue embeddings and p>3.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Theorem 5.3.4(ii), p. 54.

Interface:

- `crossingAlgebra.mk` (constructor): The polynomial quotient map sends X_iY_i to zero and is surjective.
- `crossingAlgebra.gradedQuotient` (equivalence): gr A/I_P is H-equivariantly isomorphic to C_J(k).
- `crossingAlgebra.dimension` (characterisation): ringKrullDim C_J(k)=|J|. The complete-intersection and Cohen–Macaulay assertions are further properties of the same target.

Unit tests:

- `no_indices` (degenerate): C_∅(k)≅k and has dimension zero.
- `one_crossing` (computation): C_{1}(k)=k[X,Y]/(XY), X,Y are nonzero and XY=0.
- `different_indices` (non-example): For distinct i,j, X_iY_j is nonzero in C_J(k).
- `one_dimensional` (computation): For |J|=1 the dimension is one, not two.

Check:

- The ideal kills X_iY_i only for matching indices; cross-index monomials remain.

Proof work:

1. Take the polynomial quotient after killing the central h_i.
2. The pairwise disjoint-variable monomials X_iY_i form a regular sequence in the polynomial ring; its dimension drops from 2|J| to |J|.
3. Match the torus weights and use faithfully flat finite field extension when k initially lacks residue embeddings.

Dependencies:

- `mathlib:MvPolynomial`
- `mathlib:Ideal.span`
- `mathlib:Ideal.Quotient.mk`
- [MP.4/graded-iwahori](#MP-4-graded-iwahori)
- `DeformationAndDerivedPatchingAlgebra:R03.3`
- `mathlib:ringKrullDim`

Uses:

- `BHHMS, Corollary 5.3.5`: Bounds the support of a dual module annihilated by I_P.
- [MP.4/iwahori-gk-bound](#MP-4-iwahori-gk-bound): Supplies the dimension f of the controlling commutative quotient.

<a id="MP-4-iwahori-truncations"></a>

### MP.4/iwahori-truncations — Truncated projective Iwahori modules

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/iwahori-truncations`. Implementation: `unchecked`.

For p>3 and a smooth character chi:I→k^×, define W_{chi,n}=Proj_{I/Z_1}(chi)/m_{I_1}^n for n≥1 in the
pseudocompact category. With I=I_1⋊H, it is the finite smooth module chi⊗_k(k[[I_1/Z_1]]/m^n), where I_1 acts
by left multiplication and H by conjugation. Its canonical quotient to chi identifies W_{chi,1}=chi. For n=2,3
these are the first radical layers of the projective cover, not its socle truncations.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Equation (45) and following paragraph, p. 56.

Interface:

- `iwahoriTruncation.one` (simp): W_{chi,1}≅chi, compatibly with the projective-cover quotient.
- `iwahoriTruncation.transition` (functoriality): For m≤n there is a surjection W_{chi,n}→W_{chi,m}; its kernel is m^m Proj(chi)/m^n Proj(chi).
- `iwahoriTruncation.dimension` (characterisation): dim W_{chi,2}=1+2f and dim W_{chi,3}=1+4f+2f².

Unit tests:

- `first_layer` (compatibility): W_{chi,1} is the character chi rather than the full projective cover.
- `rank_one_second_layer` (computation): For f=1, dim W_{chi,2}=3.
- `rank_one_third_layer` (computation): For f=1, dim W_{chi,3}=7; omitting the central commutator generator incorrectly gives 6.

Check:

- The same m_{I_1} action factors through I_1/Z_1 and keeps the I/I_1 characters.

Proof work:

1. Use the compact-group projective-cover input specified in the request.
2. Twisting the trivial projective by chi identifies the cover with the completed group algebra on I_1/Z_1.
3. Take the augmentation-power quotient with the semidirect I-action.

Dependencies:

- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- [MP.4/graded-iwahori](#MP-4-graded-iwahori)

Uses:

- `BHHMS, Lemmas 6.1.1–6.1.2`: Computes character extensions and embeddings between truncations.
- [MP.4/iwahori-gk-bound](#MP-4-iwahori-gk-bound): Tests absence of new copies of socle characters through degree two.

<a id="MP-4-iwahori-gk-bound"></a>

### MP.4/iwahori-gk-bound — A multiplicity criterion for GK dimension

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.4/iwahori-gk-bound`. Implementation: `unchecked`.

Assume p>3, F/Q_p unramified of degree f, and V an admissible smooth k-representation of I/Z_1.
Suppose that for each character chi with Hom_I(chi,V)≠0, precomposition with W_{chi,3}→chi
identifies Hom_I(chi,V) with Hom_I(W_{chi,3},V). Then I_P annihilates gr_m(V^∨) and dim_I
V=dim_{I/Z_1}V≤f.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Corollary 5.3.5, pp. 54–55.

Check:

- Only an upper bound is proved; no lower bound or equality f is inferred.

Proof work:

1. Dualise the Hom hypothesis to the equality of each cosocle-character multiplicity through the third augmentation truncation. Since the trivial H-character part of gr_2 A is spanned by h_i and e_if_i, these operators kill every homogeneous degree-zero generator of gr M.
2. First use centrality of h_i to deduce h_i gr M=0 from generation in degree zero. In the quotient by all h_i the algebra is commutative, so the images of e_if_i are now central too and their vanishing on the same generators kills all of gr M. This proves I_P gr M=0.
3. Apply the central-regular-sequence grade comparison and the crossing-algebra dimension |J|=f. The central subgroup Z_1 acts trivially, so the quotient comparison identifies this with the dimension for I.

Dependencies:

- [MP.4/crossing-algebra](#MP-4-crossing-algebra)
- [MP.4/dimension-comparisons](#MP-4-dimension-comparisons)
- [MP.4/iwahori-truncations](#MP-4-iwahori-truncations)

## MP.5 — Finite and first-order extension modules

Planets: Iwahori character extensions, Borel injective envelopes, Finite projective weight structure.

<a id="MP-5-iwahori-extensions"></a>

### MP.5/iwahori-extensions — Iwahori character extensions and truncation embeddings

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.5/iwahori-extensions`. Implementation: `unchecked`.

For p>3, Ext^1_{I/Z_1}(chi,chi′) is nonzero exactly when chi′=chi alpha_i or chi alpha_i^{-1} for some i, and
then has dimension one. Write E_{chi′,chi} for its nonsplit extension 0→chi′→E→chi→0. It is K_1-trivial iff
chi′=chi alpha_i. Every nonzero map W_{chi′,2}→W_{chi,3} for such chi′ is injective. For p>5, every chi′≠chi
has multiplicity at most one in W_{chi,3}; the additional bound excludes the f=1,p=5 collision recorded in the
source issues.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemmas 6.1.1–6.1.2, p. 56; equation (44), p. 55.


Check:

- For p=5,f=1, alpha_0²=alpha_0^{-2} is a nontrivial character occurring twice; this is a test against the unqualified printed claim.

Proof work:

1. Read Ext^1 from the first graded augmentation layer and determine which root direction factors through I/K_1.
2. Use PBW and multiplication by the corresponding root generator to prove injectivity through the next radical layer.
3. For the distinct nontrivial-character assertion compare the degree≤2 torus exponents, with the p>5 qualification.

Dependencies:

- [MP.4/iwahori-truncations](#MP-4-iwahori-truncations)
- [MP.4/graded-iwahori](#MP-4-graded-iwahori)
- `SmoothRepresentationsOfLocalGroups:SR.0`

<a id="MP-5-borel-injectives"></a>

### MP.5/borel-injectives — Finite Borel injectives and their conjugates

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.5/borel-injectives`. Implementation: `unchecked`.

Let B(k_F)=T(k_F)N(k_F). For a character chi of T(k_F), put I_chi=Ind_{T(k_F)}^{B(k_F)}chi, the injective
envelope of chi for the finite Borel. Its socle and cosocle are chi; every other constituent is chi
alpha_0^{-j}, 0<j<q−1, once. Writing j=∑j_i p^i, the unique proper submodule with cosocle chi alpha_0^{-j} has
constituents chi alpha_0^{-ell} with 0≤ell_i≤j_i. Inflate to I and define J_chi by conjugation with
w=((0,1),(p,0)); its socle/cosocle are chi^s and its other factors chi^s alpha_0^j with the same digit order.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 6.1.3 and Corollary 6.1.4, pp. 57–58.

Interface:

- `borelInjective.socleCosocle` (characterisation): Both the socle and cosocle of I_chi are chi; its dimension is q.
- `borelInjective.digitSubmodule` (characterisation): For 0<j<q−1 the proper submodule with cosocle chi alpha_0^{-j} has dimension ∏_i(j_i+1).
- `conjugateInjective.factors` (compatibility): Conjugation switches the torus character by s and reverses the alpha exponent signs.

Unit tests:

- `one_digit` (computation): For f=1 and 0<j<p−1 the indicated proper submodule has length j+1.
- `two_digits` (computation): For p=7,f=2,j=1+2p the submodule has length (1+1)(2+1)=6, not j+1=16.
- `duplicate_endpoint` (non-example): The character chi occurs twice in I_chi, at socle and cosocle, so I_chi is not multiplicity-free.

Check:

- J_chi usually does not factor through B(k_F), although I_chi does.

Proof work:

1. The finite Borel injective is induced from its prime-to-p torus and has the polynomial function model on the unipotent radical.
2. Use digitwise monomial bases and translations to determine submodules.
3. Conjugate the action by the normalising matrix w; its square is central, so the resulting central character is well defined.

Dependencies:

- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- [MP.3/weight-coordinates](#MP-3-weight-coordinates)

Uses:

- `BHHMS, Proposition 6.2.2`: Induction of digit-ordered submodules builds rectangular K-modules.
- [MP.6/induced-extension-control](#MP-6-induced-extension-control): Provides modules with controlled Iwahori cosocles.

<a id="MP-5-finite-weight-hulls"></a>

### MP.5/finite-weight-hulls — Finite principal series and finite injective hulls

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.5/finite-weight-hulls`. Implementation: `unchecked`.

For lambda with 0<r_i<p−1, Ind_I^K chi_lambda^s is multiplicity-free with factors
F(t_lambda(−eta_A)), A⊆J. If 0<r_i<p−2, the distinct factors of Inj_{GL_2(k_F)}F(lambda) are
F(t_lambda(∑a_i eta_i)), a_i∈{−1,0,1}. For such a factor sigma_a, the unique multiplicity-free
submodule I(F(lambda),sigma_a) with cosocle sigma_a and F(lambda) once has factors indexed by
b_i∈{0,a_i}, and length 2^{|{i:a_i≠0}|}.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 6.2.1, pp. 58–59; BP Corollary 3.12; [BP12](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/supersingular.pdf), Corollary 3.12, p. 26.

Interface:

- `finiteWeightInterval.endpoints` (characterisation): I(sigma,tau) has simple socle sigma, simple cosocle tau and [I:sigma]=1.
- `finiteWeightInterval.unique` (universal-property): Within the finite injective envelope, the submodule with these endpoint and multiplicity properties is unique.
- `finiteWeightInterval.factors` (characterisation): For tau=sigma_a the constituents are sigma_b with b_i in {0,a_i}, each once.

Unit tests:

- `equal_endpoints` (degenerate): I(sigma,sigma)=sigma.
- `single_neighbour` (computation): If exactly one a_i is nonzero then I(sigma,sigma_a) is the nonsplit extension of length two.
- `two_directions_interval` (non-example): For two nonzero a_i the interval has length four with two incomparable middle constituents, rather than a length-three chain.

Check:

- The whole injective hull is not declared multiplicity-free.

Proof work:

1. Apply the finite GL_2 principal-series constituent formula and rewrite it with t_lambda.
2. Use the finite-group injective hull formula; the quoted set does not assert multiplicity one for the entire hull.
3. Use the unique multiplicity-free submodule with given socle/cosocle and the extension-graph order.

Dependencies:

- [MP.3/change-origin-ext](#MP-3-change-origin-ext)
- [MP.5/borel-injectives](#MP-5-borel-injectives)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- `tauceti:TauCeti.exists_isProjectiveCover_of_finiteDimensional`

Uses:

- [MP.6/diamond-box](#MP-6-diamond-box): Defines the finite interval module with prescribed socle and cosocle.
- [MP.9/cyclic-hom](#MP-9-cyclic-hom): The first-order analogue supplies unique multiplicity-free quotient maps.

<a id="MP-5-projective-adjoint"></a>

### MP.5/projective-adjoint — Adjoint tensor and finite projective weight structure

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.5/projective-adjoint`. Implementation: `unchecked`.

Put Gamma=GL_2(k_F) and A_i=sl_2(k) with action through the i-th residue embedding. For a 2-deep
lambda, A_i⊗F(lambda)≅F(lambda−alpha_i)⊕F(lambda)⊕F(lambda+alpha_i); the same decomposition holds
for the corresponding algebraic highest-weight modules before restriction. For a 3-deep lambda and
sigma=F(lambda), A_i⊗P_sigma≅P_{F(lambda−alpha_i)}⊕P_sigma⊕P_{F(lambda+alpha_i)}. Tensoring
sigma→soc P_sigma and cosoc P_sigma→sigma with A_i identifies the full socle and cosocle of this
tensor. Also [P_sigma:sigma]=2^f, whereas [P_{F(lambda±alpha_i)}:sigma]=0. If Ptilde_sigma is its
projective O[Gamma]-lift, then after a finite unramified coefficient extension splitting Gamma,
Ptilde_sigma[1/p] is a sum of exactly 2^f pairwise nonisomorphic absolutely irreducible
representations.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3. The 2-deep clause means 2≤r_i≤p−4; the projective clauses require 3≤r_i≤p−5. For the integral clause O=W(k); enlarge k unramified only for the asserted absolute splitting.

Sources: [LMS22](https://www.math.univ-paris13.fr/~morra/MultiplicityOne.pdf), Proposition 3.3, pp. 7–8, with item (2) of LMS22-CORR; [LMS22-CORR](https://www.math.univ-paris13.fr/~morra/corrige.pdf), Item (2)(a)–(b), p. 1; [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Final paragraph of Lemma 4.1.2, p. 27; Lemma 6.3.7 p. 63; equation (56) p. 81; Lemma 7.3.2 p. 82; Proposition 7.4.1 pp. 84–85; [BP12](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/supersingular.pdf), Lemmas 3.4–3.5, pp. 20–21; Lemma 3.8, pp. 22–23.

Check:

- A_i has dimension three, so dim(A_i⊗P_sigma)=3 dim P_sigma; its endpoints are the three shifted simple weights, not three copies of sigma.
- At a shifted character, the corrected LMS tensor formula uses R_mu and cannot be replaced automatically by a projective cover. Our 3-deep restriction excludes that case.
- For f=1, the lift has two distinct characteristic-zero constituents and [P_sigma:sigma]=2; multiplicity-freeness of its rational lift does not imply multiplicity-freeness of P_sigma.

Proof work:

1. Compute the rank-one Clebsch–Gordan highest-weight vectors for Sym^2⊗L(lambda_i), retaining the determinant twist. The 2-deep bounds put all three highest weights in the restricted alcove, and tensoring the other embedding factors gives the simple-module formula.
2. Tensoring with A_i preserves projectives because tensoring with its dual is an exact right adjoint. Identify the simple cosocle and hence the projective summands by Hom reciprocity and the corrected LMS22 Proposition 3.3(2). Every shifted weight here is a noncharacter; the corrected R_{mu} is therefore the claimed projective cover. Duality gives the socle statement.
3. Use the two exact sequences of BP12 Lemmas 3.4–3.5 in each digit, with Lemma 3.8 for the neighbouring factors, to compute the diagonal Cartan multiplicity 2^f. The finite-hull labels exclude the root-shifted projectives from contributing sigma under the 3-deep bounds.
4. Import lifting of projectives by idempotents and Brauer reciprocity from the precise QuiverRepresentations Part II contract. The explicit principal-series and cuspidal Brauer-character calculation for Gamma makes the reduction of each characteristic-zero irreducible multiplicity-free. Thus the sigma decomposition numbers are zero or one, and the diagonal Cartan multiplicity 2^f counts exactly 2^f distinct constituents of the lift; this is the last paragraph of BHHMS Lemma 4.1.2.

Dependencies:

- [MP.3/weight-coordinates](#MP-3-weight-coordinates)
- [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls)
- `tauceti:TauCeti.exists_isProjectiveCover_of_finiteDimensional`
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`

<a id="MP-5-first-order-weight-hulls"></a>

### MP.5/first-order-weight-hulls — First-order Serre-weight hulls

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.5/first-order-weight-hulls`. Implementation: `unchecked`.

Let p>2, A=k[[K/Z_1]]/m_{K_1}² and Gamma=GL_2(k_F). For a 2-deep Serre weight sigma and tau in JH(Inj_A
sigma), a submodule V of this hull with cosoc V=tau and [V:sigma]=1 is unique and multiplicity-free. If tau
already occurs in Inj_Gamma sigma, then K_1 acts trivially on V and V is the finite interval I(sigma,tau).
Dually, for a 2-deep tau a quotient of Proj_A tau with simple socle sigma and [V:tau]=1 is unique. If Q is a
quotient of Proj_A tau, [Q:tau]=1, and every simple socle constituent lies in JH(Proj_Gamma tau), then Q is
multiplicity-free and K_1-trivial. For distinct regular Serre weights sigma,sigma′, inflation identifies
Ext^1_Gamma(sigma,sigma′) with Ext^1_{K/Z_1}(sigma,sigma′), also with Ext^1_A(sigma,sigma′). Self-Ext vanishes
for regular sigma when f≥2; when f=1 require 0≤r≤p−3 for this self-Ext assertion.

Hypotheses and conventions:

- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [HW22](https://arxiv.org/pdf/2009.09640v4), HW22 Theorem 2.23 and Corollaries 2.25–2.26, p. 17; Theorem 2.30 and Corollary 2.31, p. 20; [HW22](https://arxiv.org/pdf/2009.09640v4), Lemma 2.10, p. 12.


Check:

- The 2-deep condition means 2≤r_i≤p−4; this statement does not assert uniqueness of arbitrary K-extensions with prescribed constituents.

Proof work:

1. Filter the first-order injective envelope by its K_1 invariants and the adjoint H^1(K_1/Z_1,k) factors.
2. For an old constituent, the finite-Ext graph excludes a surviving new K_1 layer under the single-sigma condition; identify the finite interval.
3. For new constituents use the unique shifted interval extension; its old and new constituent sets are disjoint, giving multiplicity-freeness.
4. Dualise for projective quotients. Embed Q into the sum of its simple-socle quotients; the old-constituent hypothesis makes every such quotient K_1-trivial.

Dependencies:

- [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls)
- [MP.3/change-origin-ext](#MP-3-change-origin-ext)
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`

## MP.6 — Diamond boxes and multiplicity-preserving enlargements

Planets: Rectangular K-modules, Diamond boxes, Adjoint tensor filtration, First-order Diamond enlargement.

<a id="MP-6-box-module"></a>

### MP.6/box-module — Rectangular multiplicity-free K-modules

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/box-module`. Implementation: `unchecked`.

Let epsilon_i∈{±1}, B_i≥0 and d_i=(1+epsilon_{i−1})/2, with cyclic indices. Assume B_i≡1−d_i mod 2.
If epsilon_i=−1 require B_i≤r_i≤p−2−d_i; if epsilon_i=1 require B_i≤p−2−r_i≤p−2−d_i. There exists a
multiplicity-free K/Z_1-module V(lambda,epsilon,B) with factors sigma_a=F(t_lambda(∑epsilon_i a_i
eta_i)), 0≤a_i≤B_i, such that the unique submodule with cosocle sigma_a has exactly the factors
sigma_b for 0≤b_i≤a_i. Its socle is F(lambda). The target is existence with this structure, not a
claim that arbitrary extensions with these factors are unique.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 6.2.2, pp. 59–60; [HU10](https://arxiv.org/pdf/0909.0527v3), Lemma 2.13(i), arXiv v3 pp. 14–15 (journal Lemma 2.12(i), cited in BHHMS Proposition 6.2.2).

Interface:

- `boxModule.factors` (characterisation): JH(V) is the indicated box, each with multiplicity one; length V=∏_i(B_i+1).
- `boxModule.lowerInterval` (characterisation): The submodule generated below cosocle sigma_a has exactly the coordinatewise lower interval b≤a.
- `boxModule.socle` (compatibility): soc_K V=F(lambda), corresponding to the origin a=0.

Unit tests:

- `negative_unit_box` (computation): For all epsilon_i=−1 and all B_i=1, V has length 2^f and agrees with the finite principal-series structure.
- `mixed_parity` (non-example): For f=2,epsilon=(+1,−1), the required parities are B_0 odd and B_1 even; using same-index signs reverses them.
- `lower_interval_count` (computation): A constituent with coordinate a=(1,2) generates a lower-interval submodule of length 6, when these bounds satisfy the hypotheses.

Check:

- The parity involves epsilon_{i−1}, not epsilon_i.

Proof work:

1. For all-negative signs induce the digit-ordered submodule of J_chi with digit bounds (B_i−1)/2.
2. Use the principal-series labels to identify a box of side B_i+1.
3. For f≥2, use Hu10 Lemma 2.13(i) in the read v3: in Ind_I^K E_j(chi), a constituent U_tau lies under W_omega exactly when J(lambda)⊆J(theta)∪{j−1}. For each covering relation J(lambda)=J(theta)⊔{j−1}, this gives the required nonsplit edge. Combine the 2^{f−1} such edges with finite-weight adjacency. For f=1 the two-character Frobenius/cosocle argument supplies the edge directly, as in BHHMS Lemma 6.3.1.
4. Change origin to treat mixed signs; d_i shifts precisely the predecessor parity condition.

Dependencies:

- [MP.5/borel-injectives](#MP-5-borel-injectives)
- [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls)
- [MP.3/change-origin-ext](#MP-3-change-origin-ext)

Uses:

- `BHHMS, Proposition 6.2.4`: Determines the K_1 augmentation-torsion filtration.
- [MP.6/diamond-box](#MP-6-diamond-box): The unit boxes give D_{lambda,epsilon}.

<a id="MP-6-box-torsion"></a>

### MP.6/box-torsion — K_1 invariance and the box torsion filtration

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/box-torsion`. Implementation: `unchecked`.

If V is finite-dimensional smooth over K with soc_K V=F(lambda), 2<r_i<p−3, [V:F(lambda)]=1 and every factor
of V occurs in Inj_{GL_2(k_F)}F(lambda), then K_1 acts trivially. For V(lambda,epsilon,B), retain the
predecessor parity and strengthen the bounds: epsilon_i=−1 requires 3+2⌊B_i/2⌋≤r_i≤p−4; epsilon_i=1 requires
3≤r_i≤p−4−2⌊B_i/2⌋. Then for 0≤n−1≤∑⌊B_i/2⌋, V[m_{K_1}^n] has cosocle ⊕sigma_a over 0≤a_i≤B_i with each a_i
odd or equal to B_i, and ∑⌊a_i/2⌋=n−1. Its submodule is the union of the corresponding lower intervals.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 6.2.3 and Proposition 6.2.4, pp. 60–61.


Check:

- The floor sum counts the K_1 depth; ordinary box rank ∑a_i gives the wrong filtration.

Proof work:

1. Reduce the invariance assertion to modules of irreducible cosocle and use the precise first-order K-extension theorem of HW22 requested below.
2. For the box, a lower-interval submodule is K_1-trivial exactly when its labels occupy the first layer given by the displayed floor condition.
3. Induct on n by removing that layer and applying the shifted box description.

Dependencies:

- [MP.6/box-module](#MP-6-box-module)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- `SmoothRepresentationsOfLocalGroups:SR.0`
- [MP.5/first-order-weight-hulls](#MP-5-first-order-weight-hulls)

<a id="MP-6-induced-extension-control"></a>

### MP.6/induced-extension-control — Cosocles and Ext control after Iwahori induction

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/induced-extension-control`. Implementation: `unchecked`.

Write chi=chi_lambda. For chi′=chi alpha_i^{-1}, Ind_I^K E_{chi′,chi} and Ind_I^K chi have the same cosocle.
For chi′=chi alpha_i and 0<r_j<p−3, Ind_I^K E_{chi′,chi} is multiplicity-free; if 2<r_j<p−3, Ind_I^K W_{chi,2}
is multiplicity-free. Under the latter bounds, put sigma_chi=F(lambda). The unique nonzero map
P_{sigma_chi}→Ind_I^K E_{chi alpha_i,chi} up to scalar has image with JH equal to the intersection of the two
JH sets. For every quotient Q of this induced extension with [Q:sigma_chi]=0, Ext^1_K(tau,sigma_chi)=0 for
every tau∈JH(Q).

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemmas 6.3.1 and 6.3.3–6.3.5, pp. 61–63.


Check:

- Keep positive and negative root directions separate in the cosocle and Ext assertions.

Proof work:

1. Use Frobenius reciprocity and the socle of the conjugate Borel injective to compute the negative-root cosocle.
2. For the positive root use the finite box formula to prove multiplicity-freeness.
3. Projectivity of P_sigma and the constituent intersection determine its image. A hypothetical Ext into sigma forces an overlapping constituent in the image and quotient, contradicting multiplicity one.

Dependencies:

- [MP.5/iwahori-extensions](#MP-5-iwahori-extensions)
- [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls)
- [MP.6/box-module](#MP-6-box-module)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`

<a id="MP-6-diamond-box"></a>

### MP.6/diamond-box — The modules D_{lambda,epsilon}

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/diamond-box`. Implementation: `unchecked`.

For a 1-deep lambda and epsilon∈{−1,0,1}^J set J_epsilon={i:epsilon_i≠0} and
D_{lambda,epsilon}=I(F(lambda),F(t_lambda(∑epsilon_i eta_i))). Its factors are F(t_lambda(∑_{i∈A}epsilon_i
eta_i)), A⊆J_epsilon, with the Boolean lower-interval submodule order. It has length 2^{|J_epsilon|}, socle
F(lambda), and the indicated full-support cosocle. For epsilon=−1 it is Ind_I^K chi_lambda^s; for 2-generic
semisimple rho each D_{0,sigma}(rho) is of this form with all epsilon_i=±1.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Equation (48), Remark 6.3.6, p. 63.

Interface:

- `diamondBox.factors` (characterisation): JH(D_{lambda,epsilon}) is the labelled Boolean box of subsets of J_epsilon.
- `diamondBox.endpoints` (characterisation): soc D=F(lambda) and cosoc D=F(t_lambda(∑epsilon_i eta_i)).
- `diamondBox.principalSeries` (compatibility): D_{lambda,−1}≅Ind_I^K chi_lambda^s.

Unit tests:

- `zero_signs` (degenerate): D_{lambda,0}=F(lambda) and has length one.
- `one_direction` (computation): For exactly one nonzero sign D is the nonsplit length-two extension with the indicated socle and cosocle.
- `two_directions` (computation): For two nonzero signs D has four constituents and two incomparable middle submodules, rather than a single uniserial chain.

Check:

- The zeros of epsilon remove directions; the all-zero case is a single Serre weight.

Proof work:

1. Choose the unique multiplicity-free submodule in the finite injective hull with the specified cosocle.
2. Read its factors and submodules from the finite-weight hull theorem.
3. Match the semisimple Diamond socle decomposition with the signed unit boxes.

Dependencies:

- [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls)
- [MP.3/diamond-socle](#MP-3-diamond-socle)

Uses:

- `BHHMS, Proposition 6.3.10`: Computes the adjoint-tensor filtration.
- [MP.6/maximal-enlargement](#MP-6-maximal-enlargement): Identifies the K_1 invariants of the maximal first-order enlargement.

<a id="MP-6-adjoint-tensor"></a>

### MP.6/adjoint-tensor — Tensoring Diamond boxes by an adjoint factor

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/adjoint-tensor`. Implementation: `unchecked`.

For 2<r_i<p−4, D_{lambda,epsilon}⊗F(alpha_j) is multiplicity-free with constituents F(t_lambda(2u
eta_j+∑_{i∈A}epsilon_i eta_i)), u∈{−1,0,1}, A⊆J_epsilon. Its socle has the three labels 2u eta_j,
and its cosocle has the three labels 2u eta_j+∑epsilon_i eta_i. If lambda is 4-deep and epsilon_j≠0,
it has an increasing three-step filtration with graded pieces D_{lambda+epsilon_j alpha_j,epsilon},
D_{lambda,epsilon}, D_{lambda−epsilon_j alpha_j,epsilon}; the first embedding has cokernel socle
F(lambda)⊕F(t_lambda(−2epsilon_j eta_j)). If epsilon_j=0 the tensor is the direct sum of the three
root shifts. If lambda is 5-deep every adjacent pair of its constituents appears in a nonsplit
length-two subquotient in one orientation.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemmas 6.3.7–6.3.9 and Proposition 6.3.10, pp. 63–68.

Check:

- The nontrivial extensions between successive pieces are necessary; the three-step filtration is not a splitting.

Proof work:

1. Use the rank-one adjoint tensor decomposition of a sufficiently interior Serre weight.
2. The length-two case is explicit: for 4-deep lambda and V the nonsplit extension of F(t_lambda(epsilon eta_j)) by F(lambda), V⊗F(alpha_j) has three successive nonsplit length-two factors with (socle,cosocle) labels (2epsilon,3epsilon), (0,epsilon), (−2epsilon,−epsilon), all along eta_j. Both extensions between successive factors are nonsplit; in particular the epsilon constituent is absent from the socle after quotienting by the 2epsilon constituent (Lemma 6.3.9, pp. 64–66).
3. Compute factors and endpoints by tensoring the finite injective hull and reading the translation labels.
4. For a single adjacent extension, Lemma 6.3.9 computes all three length-two layers; in f=1 and positive sign use the injective-hull exact sequence, not a principal-series embedding.
5. Glue these local extension calculations across the Boolean box to obtain the three-step filtration and the 5-deep extension-graph assertion.

Dependencies:

- [MP.6/diamond-box](#MP-6-diamond-box)
- [MP.3/change-origin-ext](#MP-3-change-origin-ext)
- [MP.6/induced-extension-control](#MP-6-induced-extension-control)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- [MP.5/projective-adjoint](#MP-5-projective-adjoint)

<a id="MP-6-maximal-enlargement"></a>

### MP.6/maximal-enlargement — The maximal first-order enlargement of a Diamond box

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/maximal-enlargement`. Implementation: `unchecked`.

Assume lambda is 7-deep and epsilon∈{±1}^J. Put W_{−epsilon}={F(t_lambda(−∑_{i∈A}epsilon_i eta_i)):A⊆J}. Let W
be the largest submodule of Inj_{K/Z_1}F(lambda)[m_{K_1}²] with [W:tau]=delta_{F(lambda),tau} for
tau∈W_{−epsilon}. Then W is multiplicity-free, W^{K_1}=D_{lambda,epsilon}, and 0→D_{lambda,epsilon}→W→⊕_i
D_{lambda+epsilon_i alpha_i,epsilon}→0 is exact. Its cosocle has labels 2epsilon_j eta_j+∑epsilon_i eta_i, one
for each j. The unique submodule with cosocle sigma_a has exactly those constituents sigma_b of W with
0≤b_i≤a_i, where sigma_a=F(t_lambda(∑epsilon_i a_i eta_i)).

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Theorem 6.3.11, pp. 68–69.

Interface:

- `diamondEnlargement.maximal` (universal-property): Every submodule of the fixed injective truncation preserving the protected multiplicities lies in W.
- `diamondEnlargement.invariants` (compatibility): W^{K_1}=D_{lambda,epsilon}, and m_{K_1}²W=0.
- `diamondEnlargement.quotient` (characterisation): W/D_{lambda,epsilon}≅⊕_i D_{lambda+epsilon_i alpha_i,epsilon}.

Unit tests:

- `rank_one_length` (computation): For f=1, W has length four: D has length two and its unique shifted-box quotient has length two.
- `protected_opposite` (non-example): An opposite-direction neighbour F(t_lambda(−epsilon_j eta_j)) cannot occur in W.
- `not_K1_trivial` (non-example): For f≥1, W is strictly larger than W^{K_1}; replacing the injective m² truncation by its invariants loses the quotient.

Check:

- The quotient by D is a sum of shifted boxes, not a splitting of W itself.

Proof work:

1. Inside the finite first-order injective truncation, sums preserve the protected multiplicities, giving the largest W.
2. Compute K_1 invariants using the finite Diamond box.
3. Embed W/D into D⊗H^1(K_1/Z_1,k); identify H^1 with the sum of adjoint factors and apply the tensor filtration to obtain exactly the allowed shifted boxes.
4. The box submodule order supplies the cosocle and lower-interval description.

Dependencies:

- [MP.6/adjoint-tensor](#MP-6-adjoint-tensor)
- [MP.6/box-torsion](#MP-6-box-torsion)
- [MP.3/diamond-socle](#MP-3-diamond-socle)
- `NoncommutativeAndEquivariantIwasawa:NE.0/lazard-exterior-cohomology`
- `SmoothRepresentationsOfLocalGroups:SR.0`

Uses:

- `BHHMS, Corollary 6.3.13`: Builds the individual V_sigma with disjoint constituents.
- [MP.7/local-gk-bound](#MP-7-local-gk-bound): Controls multiplicities in the first K_1-thickening.

<a id="MP-6-socle-enlargement"></a>

### MP.6/socle-enlargement — Multiplicity-preserving enlargement of a tame socle

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.6/socle-enlargement`. Implementation: `unchecked`.

Let tame rho have mu−eta 8-deep, and let tau=⊕_{sigma∈W(rho)}sigma^{m_sigma}, m_sigma≥1. The largest submodule
V⊂Inj_{K/Z_1}tau[m_{K_1}²] preserving these W(rho)-multiplicities splits as ⊕V_sigma^{m_sigma}. Distinct
V_sigma have disjoint JH sets. If sigma=F(lambda) corresponds to its signed Diamond box,
V_sigma^{K_1}=D_{0,sigma}(rho), and its constituents are the sigma_a with a_i≥0 and ∑⌊a_i/2⌋≤1 within the
corresponding box support (a_i≤3); its submodule order is the lower-interval order. Hence
V^{K_1}=⊕D_{0,sigma}(rho)^{m_sigma}.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Corollaries 6.3.13 and 6.3.15, pp. 69–71.


Check:

- The invariants carry m_sigma; no multiplicity-one assumption on the original K-socle is inserted.

Proof work:

1. Apply the maximal-enlargement construction to each socle weight.
2. The 8-deep tame weight combinatorics identify the protected opposite box and exclude overlap between distinct socle summands.
3. Take K_1 invariants of each summand and keep the original multiplicities.

Dependencies:

- [MP.6/maximal-enlargement](#MP-6-maximal-enlargement)
- [MP.3/tame-weight-set](#MP-3-tame-weight-set)
- [MP.3/diamond-socle](#MP-3-diamond-socle)

## MP.7 — Multiplicity one and the local dimension bound

Planets: Connected Iwahori characters, Iwahori multiplicity one, Local Gelfand–Kirillov bound.

<a id="MP-7-connected-characters"></a>

### MP.7/connected-characters — Connected semisimple Iwahori character sets

Kind: `definition`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/connected-characters`. Implementation: `unchecked`.

A semisimple smooth I-representation V is connected in the sense used here when, for distinct characters
chi,chi″ occurring in V with chi″ in soc_I(W_{chi,3}), there exists a character chi′ occurring in V such that
Ext^1_{I/Z_1}(chi,chi′)≠0 and Ext^1_{I/Z_1}(chi′,chi″)≠0. The predicate depends only on the set of characters,
not on their multiplicities. It is a condition on completing length-two extension paths, not ordinary
connectedness of an undirected graph.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Definition 6.4.2, p. 72; Lemma 6.4.3, pp. 72–73.

Interface:

- `iwahoriConnected.setInvariant` (characterisation): Two semisimple modules with the same character set have the same connectedness predicate.
- `iwahoriConnected.middle` (projection): For each qualifying distinct endpoint pair the predicate produces a middle character in V with both nonzero Ext groups.
- `iwahoriConnected.twist` (compatibility): Twisting all characters by a fixed smooth character preserves the predicate.

Unit tests:

- `singleton_connected` (degenerate): A single character, with any positive multiplicity, is connected.
- `missing_middle` (non-example): For f=1,p=17, {1,alpha_0²} is not connected: alpha_0² occurs in soc W_{1,3} but alpha_0 is absent.
- `three_step_set` (computation): For f=1,p=17, {1,alpha_0,alpha_0²} is connected.
- `multiplicity_irrelevant` (compatibility): Replacing each character by two copies preserves connectedness.

Check:

- A singleton satisfies the condition vacuously; a disconnected graph of isolated characters can also satisfy it.

Proof work:

1. Read the character occurrences from the semisimple module and impose the displayed quantified condition.
2. Use the two root steps from the Iwahori Ext computation to recognise the required middle character.

Dependencies:

- [MP.4/iwahori-truncations](#MP-4-iwahori-truncations)
- [MP.5/iwahori-extensions](#MP-5-iwahori-extensions)

Uses:

- `BHHMS, Proposition 6.4.6`: Forces maps out of W_{chi,3} to kill every nontrivial bottom character.
- [MP.7/diamond-connected](#MP-7-diamond-connected): Checks the hypothesis for D_1(rho).

<a id="MP-7-induced-socle-vanishing"></a>

### MP.7/induced-socle-vanishing — Vanishing on an induced Loewy-three socle

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/induced-socle-vanishing`. Implementation: `unchecked`.

Let chi=chi_lambda with 2<r_i<p−3. Suppose a finite-length smooth I-module W has both socle and cosocle chi,
soc W properly contained in rad W, and rad W/soc W semisimple. For a nonzero quotient Q of Ind_I^K W with
[Q:F(lambda)]=1, the adjunction map W→Q|_I vanishes on soc W=chi.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 6.4.1, pp. 71–72.


Check:

- Loewy length three and the equal endpoint character are both used.

Proof work:

1. If the socle survives, reduce to a quotient with irreducible K-socle F(lambda) using its finite injective hull.
2. Break the middle layer into positive and negative root extensions; induction and the multiplicity-one hypothesis force contradictory surviving copies of F(lambda).

Dependencies:

- [MP.6/induced-extension-control](#MP-6-induced-extension-control)
- [MP.6/box-torsion](#MP-6-box-torsion)
- [MP.5/iwahori-extensions](#MP-5-iwahori-extensions)

<a id="MP-7-diamond-connected"></a>

### MP.7/diamond-connected — Connectedness of tame Diamond invariants

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/diamond-connected`. Implementation: `unchecked`.

For tame rho with mu−eta 6-deep, D_1(rho) is connected. Consequently any semisimple I-module with its
character set, with arbitrary positive multiplicities, is connected.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 6.4.3, pp. 72–73, restricted to the tame input needed here.


Check:

- Only the tame specialization is required; the wild nonsplit recipe is outside this target.

Proof work:

1. Describe JH(D_0(rho)) by the signed box −1≤a_i≤2.
2. A two-step endpoint difference cannot use the same embedding twice without leaving that box.
3. For distinct embeddings switch one coordinate at a time; the intermediate principal series still meets W(rho), hence its character lies in D_1(rho).

Dependencies:

- [MP.7/connected-characters](#MP-7-connected-characters)
- [MP.3/diamond-socle](#MP-3-diamond-socle)
- [MP.6/diamond-box](#MP-6-diamond-box)
- [MP.3/change-origin-ext](#MP-3-change-origin-ext)

<a id="MP-7-hom-second-layer"></a>

### MP.7/hom-second-layer — No new maps from the second Iwahori radical layer

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/hom-second-layer`. Implementation: `unchecked`.

Let pi be an admissible smooth G-representation. Assume pi[m_{K_1}²] embeds into ⊕_{sigma∈S}
Dtilde_sigma^{m_sigma}, m_sigma≥1, with soc_K Dtilde_sigma=sigma. Assume Dtilde=⊕_S Dtilde_sigma is
multiplicity-free and every constituent tau satisfies chi_tau≠chi_tau^s, equivalently 1<dim_k tau<q. For each
chi=chi_lambda occurring in pi^{I_1} with 2<r_i<p−3, the quotient W_{chi,2}→chi gives
Hom_I(chi,pi)≅Hom_I(W_{chi,2},pi). For every chi′ in pi^{I_1} with Ext^1_{I/Z_1}(chi,chi′)≠0 there is no
embedding E_{chi′,chi}→pi.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Conditions (a)–(b), p. 73; Lemma 6.4.4 and Corollary 6.4.5, pp. 74–75.


Check:

- The w action is essential; do not state the conclusion for arbitrary admissible K-modules.

Proof work:

1. A map not factoring through chi produces an adjacent-character extension inside the multiplicity-free first-order control module.
2. Use Frobenius reciprocity to find a repeated finite-group constituent, contrary to the disjoint multiplicity-one condition.
3. Use the action of the matrix w normalising I_1 to exchange root directions; the ambient representation is a G-representation, not merely a K-module.

Dependencies:

- [MP.6/induced-extension-control](#MP-6-induced-extension-control)
- [MP.4/iwahori-truncations](#MP-4-iwahori-truncations)

<a id="MP-7-hom-third-layer"></a>

### MP.7/hom-third-layer — Multiplicity one through the third Iwahori layer

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/hom-third-layer`. Implementation: `unchecked`.

Let pi be an admissible smooth G-representation. Assume pi[m_{K_1}²] embeds into ⊕_{sigma∈S}
Dtilde_sigma^{m_sigma}, m_sigma≥1, with soc_K Dtilde_sigma=sigma. Assume Dtilde=⊕_S Dtilde_sigma is
multiplicity-free and every constituent tau satisfies chi_tau≠chi_tau^s, equivalently 1<dim_k tau<q. Assume
additionally that pi^{I_1} is connected. For chi=chi_lambda in pi^{I_1} with 2<r_i<p−3, the natural quotient
W_{chi,3}→chi induces Hom_I(chi,pi)≅Hom_I(W_{chi,3},pi).

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 6.4.6, p. 75.


Check:

- The character genericity here implies p>5, so the small-prime multiplicity collision cannot enter this proof.

Proof work:

1. Connectedness and the embeddings W_{chi′,2}→W_{chi,3} force the map to vanish on all bottom characters distinct from chi.
2. The remaining image lies in pi[m_{K_1}²]. Project to a single Dtilde_sigma that sees its chi-socle.
3. Its induced K-image has multiplicity one in F(lambda), contradicting the Loewy-three socle-vanishing theorem unless the original map factors through chi.

Dependencies:

- [MP.7/hom-second-layer](#MP-7-hom-second-layer)
- [MP.7/connected-characters](#MP-7-connected-characters)
- [MP.7/induced-socle-vanishing](#MP-7-induced-socle-vanishing)
- [MP.5/iwahori-extensions](#MP-5-iwahori-extensions)

<a id="MP-7-local-gk-bound"></a>

### MP.7/local-gk-bound — The local Gelfand–Kirillov bound

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.7/local-gk-bound`. Implementation: `unchecked`.

Assume p>3, F/Q_p unramified of degree f, k sufficiently large, and tame rho:G_F→GL_2(k) with inertial
parameter tau(s,mu) such that mu−eta is 8-deep. Let pi be an admissible smooth k-representation of GL_2(F)
with a central character. Suppose (i) JH(soc_K pi)=W(rho) as sets, allowing positive multiplicities; (ii)
[pi[m_{K_1}²]:sigma]=[soc_K pi:sigma] for every sigma∈W(rho); and (iii) JH(pi^{I_1})=JH(D_1(rho)) as sets.
Then dim_{GL_2(F)}pi≤f.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.
- Assume p>3 for the saturated Iwahori and the §6 extension calculations. Any stronger displayed depth or prime bound is retained; the auxiliary W_{chi,3} character multiplicity claim uses p>5.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Theorem 6.4.7, p. 76; introductory sufficient specialization Theorem 1.4, pp. 5–6.


Check:

- The conclusion is ≤f. The hypotheses neither assume nor prove equality of GK dimension with f.

Proof work:

1. A mod-p central character is trivial on the pro-p centre Z_1, so pi factors through the required centre quotient.
2. The socle multiplicity hypothesis embeds the first-order thickening into the maximal enlargement, whose constituents satisfy the first-order control conditions.
3. Use D_1 connectedness and third-layer multiplicity one for each Iwahori socle character.
4. Apply the Iwahori GK bound and open-subgroup invariance of GK dimension.

Dependencies:

- [MP.6/socle-enlargement](#MP-6-socle-enlargement)
- [MP.7/diamond-connected](#MP-7-diamond-connected)
- [MP.7/hom-third-layer](#MP-7-hom-third-layer)
- [MP.4/iwahori-gk-bound](#MP-4-iwahori-gk-bound)

## MP.8 — Bockstein maps and projective-cover lattices

Planets: Coinvariant Bockstein map, Adjoint contraction automorphism, Projective-cover lattice, Projective truncation lattice.

<a id="MP-8-bockstein"></a>

### MP.8/bockstein — The infinitesimal action and coinvariant Bockstein sequence

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/bockstein`. Implementation: `unchecked`.

Assume p>2 and E/Q_p unramified with O=W(k). Let V° be a K/Z_1-stable finite free O-lattice in a continuous
finite-dimensional E-representation, with K_1 acting trivially on V°/p. For x∈sl_2(k_F), v∈V°/p, choose lifts
and set beta_{V°}(x⊗v)=p^{-1}(rho(exp(p x_tilde))v_tilde−v_tilde) mod p. This gives a well-defined k-linear
map sl_2(k_F)⊗_{F_p}(V°/p)→V°/p and an exact sequence sl_2(k_F)⊗(V°/p)→^{beta}V°/p→^{p}(V°/p²)_{K_1}→V°/p→0.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), §7.1 and Lemma 7.1.1, pp. 76–77.

Interface:

- `latticeBockstein.liftIndependent` (characterisation): beta is independent of both lifts and equivariant under K.
- `latticeBockstein.trivialFactor` (compatibility): For a lattice T on which K_1 acts trivially, beta_{V°⊗T}=beta_{V°}⊗id_{T/p}.
- `latticeBockstein.adjoint` (compatibility): For sl_2(O_F)⊗_{Z_p}O with adjoint action, beta(x⊗y)=[x,y].

Unit tests:

- `trivial_lattice` (degenerate): If K_1 acts trivially on V°, beta=0 and the coinvariant sequence reduces to 0→V°/p→V°/p²→V°/p→0 after its initial zero map.
- `bracket_sign` (computation): For the adjoint lattice, beta(e⊗f)=h, with e upper, f lower and h=diag(1,−1).
- `bracket_diagonal` (computation): For that lattice beta(h⊗e)=2e, not −2e or zero.

Check:

- The sequence uses coinvariants; replacing them by invariants reverses the right-exactness argument.

Proof work:

1. Use exp(p x) to identify sl_2(O_F)/p with the Frattini quotient of K_1/Z_1.
2. Changing lifts changes the numerator only by p²; linearity follows from the Frattini identity.
3. The kernel of multiplication by p into coinvariants is exactly the span of the (g−1) relations divided by p.

Dependencies:

- `NoncommutativeAndEquivariantIwasawa:NE.0/lazard-exterior-cohomology`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `mathlib:Representation`

Uses:

- `BHHMS, Proposition 7.3.1`: Computes the coinvariants of the modified adjoint lattice.
- [MP.8/sublattice-bockstein](#MP-8-sublattice-bockstein): Controls passage to a preimage lattice.

<a id="MP-8-sublattice-bockstein"></a>

### MP.8/sublattice-bockstein — Bockstein exactness for preimage lattices

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/sublattice-bockstein`. Implementation: `unchecked`.

With V° as in the Bockstein construction and W⊂V°/p a K-submodule, let V_1° be its preimage in V°. Then
sl_2(k_F)⊗_{F_p}W→^{beta}V°/p→^{p}(V_1°/p²V°)_{K_1}→W→0 is exact. The inclusions W⊂V°/p and V_1°⊂V° give a
commutative comparison with the original Bockstein sequence.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 7.1.4, pp. 78–79.


Check:

- The middle lattice quotient is V_1°/p²V°, not V_1°/p²V_1°.

Proof work:

1. Restrict the lift computation to vectors reducing into W.
2. The same (g−1) relations identify the kernel; use right exactness of coinvariants for the last two maps.
3. The two choices of lifts can be shared, which proves commutativity of the comparison.

Dependencies:

- [MP.8/bockstein](#MP-8-bockstein)

<a id="MP-8-adjoint-psi"></a>

### MP.8/adjoint-psi — The adjoint contraction automorphism

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/adjoint-psi`. Implementation: `unchecked`.

For a 2-deep weight lambda=(a,b) of GL_2/k with r=a−b, let L(lambda) be the algebraic highest-weight
module and v_lambda a highest-weight vector. Fix d_lambda:L(lambda)→sl_2(k)⊗L(lambda) by
d_lambda(v_lambda)=2e⊗f v_lambda+r h⊗v_lambda. Put psi_lambda=([−,−]⊗id)∘(id⊗d_lambda). On the
summands L(lambda+alpha),L(lambda),L(lambda−alpha), its eigenvalues are respectively −2r,4,2(r+2),
hence it is invertible. For a Serre weight sigma=F(lambda) with every component 2-deep, choose
nonzero d_{sigma,i} in each embedding component. Their sum d_sigma gives an invertible
Psi=([−,−]⊗id)∘(id⊗d_sigma) on sl_2(k_F)⊗_{F_p}sigma.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 7.2.1 and Proposition 7.2.2, pp. 79–81.

Interface:

- `adjointContraction.normalisation` (characterisation): d_lambda sends the chosen highest-weight vector to 2e⊗fv_lambda+r h⊗v_lambda.
- `adjointContraction.eigenvalues` (characterisation): psi has eigenvalues −2r,4,2(r+2) on the plus, middle and minus summands in that order.
- `adjointContraction.embeddingSum` (compatibility): After splitting sl_2(k_F) over k, Psi is the direct sum of nonzero scalar multiples of the psi_lambda_i tensor identities on other factors.

Unit tests:

- `interior_eigenvalues` (computation): For p=11,r=3, the three eigenvalues are 5,4,10, all nonzero in F_11.
- `zero_boundary` (non-example): At r=0 the plus eigenvalue vanishes; invertibility cannot be extended to that boundary.
- `upper_boundary` (non-example): At r=p−2 the minus eigenvalue vanishes.
- `component_rescaling` (compatibility): Rescaling one d_{sigma,i} by a nonzero scalar preserves invertibility, while setting it to zero destroys invertibility on that embedding summand.

Check:

- The coefficient field has characteristic p and 2≤r≤p−4; no characteristic-zero eigenspace argument is substituted.

Proof work:

1. Apply the 2-deep algebraic adjoint decomposition of MP.5/projective-adjoint and use the displayed highest-weight vector to normalise d_lambda. No 3-deep projective or Diamond-box tensor statement is needed for this clause.
2. Calculate psi on highest-weight vectors of each of its three irreducible summands.
3. The 2-deep bounds make all three scalars nonzero. Split by embeddings to obtain Psi, allowing any nonzero scalar in each chosen component.

Dependencies:

- [MP.3/weight-coordinates](#MP-3-weight-coordinates)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- [MP.5/projective-adjoint](#MP-5-projective-adjoint)

Uses:

- `BHHMS, Proposition 7.3.1`: Ensures the adjoint Bockstein image spans the required quotient.
- [MP.8/projective-lattice](#MP-8-projective-lattice): Controls coinvariants of the lattice glued along P_sigma.

<a id="MP-8-projective-lattice"></a>

### MP.8/projective-lattice — The projective-cover fibre-product lattice

Kind: `construction`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/projective-lattice`. Implementation: `unchecked`.

Assume p>2, E/Q_p unramified, O=W(k), and sigma=F(lambda) 3-deep. Let P_sigma be the finite
GL_2(k_F) projective cover of sigma and Ptilde_sigma its finite free projective O[GL_2(k_F)] lift.
Put R_1=Ptilde_sigma, R_2=sl_2(O_F)⊗_{Z_p}Ptilde_sigma=⊕_i R_{2,i}. Fix the projective decomposition
R_{2,i}/p≅P_sigma⊕P_{F(lambda−alpha_i)}⊕P_{F(lambda+alpha_i)} and its inclusion
iota_i:P_sigma→R_{2,i}/p. Let iota=(iota_i)_i and R_2′ be the preimage of iota(P_sigma) in R_2.
Define R={(x_1,x_2)∈R_1⊕R_2:x_2 mod p=iota(x_1 mod p)}. It is a K-stable full O-lattice in
(1⊕sl_2(F))⊗_{Q_p}Ptilde_sigma[1/p]. The partial fibre products L_j impose the same conditions only
for i≤j, beginning at L_{−1}=R_1; L_{f−1} identifies with R.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), §7.3, equations (56)–(57), pp. 81–83; introductory equation (7), p. 8.

Interface:

- `projectiveLattice.membership` (characterisation): (x_1,x_2) belongs to R iff every component reduction equals iota_i(x_1 mod p).
- `projectiveLattice.full` (structure): p(R_1⊕R_2)⊂R⊂R_1⊕R_2; R[1/p]=(R_1⊕R_2)[1/p].
- `projectiveLattice.partial` (compatibility): L_j=L_{j−1}×_{P_sigma}R_{2,j}′ with the prescribed reduction maps, and L_{f−1}≅R.

Unit tests:

- `single_embedding` (computation): For f=1, R consists of pairs with x_2 mod p=iota_0(x_1 mod p), giving the first partial fibre product.
- `diagonal_compatibility` (non-example): For f=2, distinct input vectors u≠v in P_sigma placed in the two iota_i components cannot both match the same x_1.
- `rational_rank` (compatibility): rank_O R=(1+3f)dim_k P_sigma; imposing the reduction condition changes the index, not the rational rank.
- `partial_initial` (degenerate): With no adjoint component L_{−1}=Ptilde_sigma.

Check:

- The compatibility is one diagonal copy of P_sigma across all embeddings. It does not allow unrelated reductions in the individual components.

Proof work:

1. Obtain each decomposition (56) and its chosen middle-summand injection from MP.5/projective-adjoint; projective lifting itself is the separate complete-DVR supplier contract.
2. Lift a finite-group projective via idempotent lifting over the complete unramified DVR, using the request for that integral API.
3. Use the rank-one adjoint projective decomposition to choose each iota_i.
4. Take preimages and the displayed fibre product inside a finite free module; it contains p(R_1⊕R_2), so is full and finite free.
5. Projection to partial sums gives the successive L_j description and its final identification with R.

Dependencies:

- `tauceti:TauCeti.exists_isProjectiveCover_of_finiteDimensional`
- [MP.8/adjoint-psi](#MP-8-adjoint-psi)
- [MP.8/sublattice-bockstein](#MP-8-sublattice-bockstein)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- [MP.5/projective-adjoint](#MP-5-projective-adjoint)

Uses:

- `BHHMS, Theorem 7.3.3 and Corollary 7.3.4`: Lifts the first K_1-radical truncation of the projective cover.
- [MP.9/endomorphism-ring](#MP-9-endomorphism-ring): Compares integral and characteristic-zero endomorphisms.

<a id="MP-8-lattice-coinvariants"></a>

### MP.8/lattice-coinvariants — Coinvariants and reduction of the glued lattice

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/lattice-coinvariants`. Implementation: `unchecked`.

With the 3-deep projective lattice data, (R_2′/pR_2′)_{K_1}≅P_sigma, and the induced map
R_2′/p→iota(P_sigma) is this quotient. There is a K-equivariant short exact sequence
0→R_2/pR_2→R/pR→P_sigma→0; its right map induces (R/pR)_{K_1}≅P_sigma. Tensoring the socle inclusion
sigma→P_sigma with sl_2(k_F) identifies its image with the full socle of sl_2(k_F)⊗P_sigma; the dual
projection gives the full cosocle.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 7.3.1, Lemma 7.3.2 and Theorem 7.3.3, pp. 82–84.

Check:

- Both coinvariant isomorphisms use subscripts K_1. The source extraction that reads invariants at Proposition 7.3.1 must be corrected.

Proof work:

1. Apply the sublattice Bockstein sequence and the Psi automorphism to compute the first coinvariant quotient.
2. For R use pR∩pR_2=p²R_2 to identify the kernel of reduction onto P_sigma.
3. Express each kernel vector as a finite sum of (g−1)-terms using the R_2′ coinvariant calculation.
4. Use the projective tensor decomposition and dimension of its semisimple endpoint to identify the socle and cosocle.

Dependencies:

- [MP.8/projective-lattice](#MP-8-projective-lattice)
- [MP.8/adjoint-psi](#MP-8-adjoint-psi)
- [MP.8/sublattice-bockstein](#MP-8-sublattice-bockstein)
- [MP.5/projective-adjoint](#MP-5-projective-adjoint)

<a id="MP-8-projective-truncation"></a>

### MP.8/projective-truncation — The first radical truncation of a projective cover

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.8/projective-truncation`. Implementation: `unchecked`.

For the 3-deep sigma above, cosoc_K(R/pR)=sigma and R/pR≅Proj_{K/Z_1}(sigma)/m_{K_1}² as K-representations. In
particular dim_k(R/pR)=(3f+1)dim_k P_sigma. The same object is L_{f−1}/pL_{f−1} in the introductory
iterated-gluing notation.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Corollary 7.3.4, p. 84; Theorem 1.7, p. 8.


Check:

- The cover is for K/Z_1, retaining its finite reductive quotient action; K_1/Z_1 is not its replacement.

Proof work:

1. The coinvariant isomorphism and Nakayama give simple cosocle sigma and a surjection from its K/Z_1 projective cover.
2. The exact sequence has K_1-trivial outer terms, hence m_{K_1}² kills R/pR.
3. Compare dimensions using the 3f-dimensional Frattini quotient of K_1/Z_1 to show the induced projective-truncation surjection is an isomorphism.

Dependencies:

- [MP.8/lattice-coinvariants](#MP-8-lattice-coinvariants)
- [MP.8/projective-lattice](#MP-8-projective-lattice)
- `SmoothRepresentationsOfLocalGroups:SR.0`
- `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-graded-polynomial`

## MP.9 — Endomorphisms and relative projectivity

Planets: Commutative truncation endomorphisms, Cyclic Hom modules, Relative projectivity of quotients.

<a id="MP-9-endomorphism-ring"></a>

### MP.9/endomorphism-ring — Endomorphisms of the first projective truncation

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.9/endomorphism-ring`. Implementation: `unchecked`.

If sigma=F(lambda) with 2<r_i<p−4 for every i, then End_K(Proj_{K/Z_1}sigma/m_{K_1}²) is commutative
of k-dimension 2^f(f+1).

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 7.4.1, pp. 84–85.

Check:

- Commutativity of characteristic-zero endomorphisms alone is insufficient without the reduction-surjectivity dimension check.

Proof work:

1. After a finite unramified splitting coefficient extension, MP.5/projective-adjoint decomposes Ptilde_sigma[1/p] into 2^f distinct absolutely irreducible finite-group representations. Tensoring with the trivial factor and the f distinct algebraic adjoint factors gives 2^f(f+1) pairwise distinct irreducible K-representations in R[1/p].
2. Its integral endomorphism ring is torsion-free and commutative.
3. Compute the sigma multiplicity in R/pR as 2^f(f+1); projective-cover Hom identifies it with the endomorphism dimension. The reduction map on endomorphisms is therefore surjective. The finite projective self and shifted Cartan multiplicities are supplied by MP.5/projective-adjoint. Finite scalar extension preserves these Hom dimensions and detects commutativity, so the conclusion descends to the original coefficient field.

Dependencies:

- [MP.8/projective-truncation](#MP-8-projective-truncation)
- [MP.8/projective-lattice](#MP-8-projective-lattice)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- [MP.5/projective-adjoint](#MP-5-projective-adjoint)
- [MP.0/scalar-extension](#MP-0-scalar-extension)

<a id="MP-9-cyclic-hom"></a>

### MP.9/cyclic-hom — Cyclic Hom modules between projective truncations

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.9/cyclic-hom`. Implementation: `unchecked`.

Assume 5<r_i<p−7 and let T_sigma=R_sigma/pR_sigma. For every Serre weight tau in JH(T_sigma),
Hom_K(T_tau,T_sigma) is cyclic as a right End_K(T_tau)-module under precomposition.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Lemma 7.4.2, p. 85.


Check:

- The action is precomposition on the source, not postcomposition on the target.

Proof work:

1. Use the unique multiplicity-free quotient I(tau,sigma) of T_sigma with socle tau and sigma once, supplied by the dual first-order-weight-hull theorem (HW22 Theorem 2.30). The strong bounds ensure the required weights remain 2-deep.
2. Lift its tau-socle map from T_tau using projectivity in k[[K/Z_1]]/m_{K_1}²-modules.
3. The lifted map has cokernel with no tau constituent. Projectivity then shows every map factors by precomposition with an endomorphism of T_tau.

Dependencies:

- [MP.9/endomorphism-ring](#MP-9-endomorphism-ring)
- [MP.8/projective-truncation](#MP-8-projective-truncation)
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`
- [MP.5/first-order-weight-hulls](#MP-5-first-order-weight-hulls)

<a id="MP-9-relative-projectivity"></a>

### MP.9/relative-projectivity — Relative projectivity of all quotients

Kind: `theorem`. Target id: `ModpRepresentationsOfGL2OverLocalFields:MP.9/relative-projectivity`. Implementation: `unchecked`.

Assume 5<r_i<p−7. For every quotient Q of T_sigma and every subquotient Q′ of Q, precomposition with T_sigma→Q
induces Hom_K(Q,Q′)≅Hom_K(T_sigma,Q′). If cosoc_K Q′≅sigma, there is a K-equivariant surjection Q→Q′.
Equivalently Q is projective in the smallest full abelian subcategory of k[[K/Z_1]]/m_{K_1}²-modules generated
by its subquotients.

Hypotheses and conventions:

- F/Q_p is unramified of degree f≥1; J=Z/fZ; k is a finite characteristic-p splitting coefficient field containing k_F.
- K=GL_2(O_F), K_1=ker(K→GL_2(k_F)), I is the upper Iwahori, I_1 its pro-p radical, and Z_1=Z(K)∩K_1. The prime and depth bounds in the statement take precedence.

Sources: [BHHMS23](https://arxiv.org/pdf/2009.03127v7), Proposition 7.4.3 and Remark 7.4.4, pp. 85–86.


Check:

- Projectivity is relative to the abelian subcategory generated by Q; no global projectivity of arbitrary quotients is asserted.

Proof work:

1. Use a projective truncation T_tau for every simple constituent tau. Its Hom into Q is generated by the fixed cyclic map.
2. Commutativity of End(T_tau) shows that every map into a subquotient Q′ kills the kernel of T_sigma→Q.
3. This gives the Hom isomorphism. A map to Q′ nonzero on its simple cosocle is surjective by finite-length Nakayama.

Dependencies:

- [MP.9/cyclic-hom](#MP-9-cyclic-hom)
- [MP.9/endomorphism-ring](#MP-9-endomorphism-ring)
- [MP.8/projective-truncation](#MP-8-projective-truncation)

## Dependency contracts and completion

All ten layers are **planned**, with zero layers declared closed. The target-level pass is complete:
every routed item, definition and key theorem has an owned target or an exact import. The independent
review accepts this plan with its explicit supplier contracts and small-prime proof obligation.
Closing a layer requires establishing its targets and discharging the relevant contracts; no target
is claimed to be formalised.

### Contract 1: `SmoothRepresentationsOfLocalGroups:SR.0`

Import the existing O-linear smooth category and its invariant submodules. Extend it to supply
injective envelopes of finite-socle smooth modules for compact analytic K/Z_1, their finite m_{K_1}²
truncations, pseudocompact projective covers under duality, and the
admissible-smooth/finite-compact-dual criterion for arbitrary analytic H. Also supply admissibility
of subquotients and coefficient-extension compatibility over a DVR.

Needed by: [MP.0/torsion-admissibility](#MP-0-torsion-admissibility), [MP.0/augmented-iwasawa-algebra](#MP-0-augmented-iwasawa-algebra), [MP.2/ordinary-parts](#MP-2-ordinary-parts), [MP.2/ordinary-values](#MP-2-ordinary-values), [MP.3/diamond-socle](#MP-3-diamond-socle), [MP.4/gk-dimension](#MP-4-gk-dimension), [MP.4/iwahori-truncations](#MP-4-iwahori-truncations), [MP.5/iwahori-extensions](#MP-5-iwahori-extensions), [MP.6/box-torsion](#MP-6-box-torsion), [MP.6/maximal-enlargement](#MP-6-maximal-enlargement), [MP.8/projective-truncation](#MP-8-projective-truncation), [MP.5/first-order-weight-hulls](#MP-5-first-order-weight-hulls), [MP.2/obstruction-finiteness](#MP-2-obstruction-finiteness), [MP.1/smooth-dual-length](#MP-1-smooth-dual-length).

### Contract 2: `SmoothRepresentationsOfLocalGroups:SR.2`

Import compact induction from compact opens, exactness, finite-index Mackey restriction, and
unnormalised smooth induction from the lower Borel. Part II must supply the locally admissible
derived-functor category and the canonical injection R^1Ord_B→H^1Ord_B built from continuous
N_0-cohomology (Emerton II Remark 3.7.3); no full comparison is needed for the vanishing argument
here. For Banach lattices supply continuous induction and its compatible inverse limits.

Needed by: [MP.0/finite-presentation](#MP-0-finite-presentation), [MP.0/finiteness-calculus](#MP-0-finiteness-calculus), [MP.2/ordinary-parts](#MP-2-ordinary-parts), [MP.5/borel-injectives](#MP-5-borel-injectives), [MP.8/bockstein](#MP-8-bockstein), [MP.0/obstruction-space](#MP-0-obstruction-space), [MP.2/ordinary-values](#MP-2-ordinary-values), [MP.2/ordinary-banach](#MP-2-ordinary-banach).

### Contract 3: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`

Import the existing completedGroupAlgebra inverse-limit construction and compact-module action,
including compact subgroup change, finite quotients and augmentation ideals. These are now in
current Tau Ceti but were absent at the required pins; do not implement them in this roadmap.

Needed by: [MP.0/augmented-iwasawa-algebra](#MP-0-augmented-iwasawa-algebra), [MP.4/iwahori-valuation](#MP-4-iwahori-valuation), [MP.4/iwahori-truncations](#MP-4-iwahori-truncations), [MP.5/first-order-weight-hulls](#MP-5-first-order-weight-hulls).

### Contract 4: `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`

Import finite-dimensional algebra injective envelopes, essentiality, radical/socle duality,
tensor/Hom adjunction and Krull–Schmidt decomposition. Part II must lift finite group-algebra
projectives over a complete DVR by idempotents, with reduction and Hom base change and Brauer
reciprocity. This is general algebra; the GL_2-specific adjoint and projective-character
calculations are owned by MP.5/projective-adjoint. The field-valued baseline cover theorem alone
does not supply these integral inputs.

Needed by: [MP.0/amalgam-coherence](#MP-0-amalgam-coherence), [MP.3/change-origin-ext](#MP-3-change-origin-ext), [MP.3/diamond-socle](#MP-3-diamond-socle), [MP.5/borel-injectives](#MP-5-borel-injectives), [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls), [MP.6/box-torsion](#MP-6-box-torsion), [MP.6/induced-extension-control](#MP-6-induced-extension-control), [MP.6/adjoint-tensor](#MP-6-adjoint-tensor), [MP.8/adjoint-psi](#MP-8-adjoint-psi), [MP.8/projective-lattice](#MP-8-projective-lattice), [MP.9/endomorphism-ring](#MP-9-endomorphism-ring), [MP.9/cyclic-hom](#MP-9-cyclic-hom), [MP.5/first-order-weight-hulls](#MP-5-first-order-weight-hulls), [MP.5/projective-adjoint](#MP-5-projective-adjoint).

### Contract 5: `DeformationAndDerivedPatchingAlgebra:R03.3`

Import the regular-sequence/Cohen–Macaulay dimension API: in k[X_i,Y_i] for finite J, the
disjoint-variable sequence X_iY_i is regular, and quotienting a polynomial ring by a length-|J|
regular sequence is Cohen–Macaulay with dimension |J|.

Needed by: [MP.4/crossing-algebra](#MP-4-crossing-algebra).

### Contract 6: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`

Import the marked tame inertia quotient, its fundamental residue characters over unramified
extensions, and Frobenius compatibility. The Artin normalisation in MP.3 also requires the existing
ClassFieldTheory local reciprocity input, specified separately below.

Needed by: [MP.3/tame-weight-set](#MP-3-tame-weight-set).

### Contract 7: `NoncommutativeAndEquivariantIwasawa:NE.0`

Part II: the Lazard enveloping comparison for saturated finite-rank p-valued groups without assuming
uniformity; PBW and Auslander regularity of the resulting nilpotent graded enveloping algebra;
filtered Ext/grade comparison and grade shift by a central regular sequence; coherence of an amalgam
of noetherian completed compact group rings flat over their common open subgroup ring (Shotton
Proposition 4.3 and Corollary 4.4, pp. 11–12; Theorem 4.5 is the abelian-category consequence). The
existing ordered-series and mod-p Auslander statements are uniform-only, so cannot be substituted
directly.

Needed by: [MP.0/amalgam-coherence](#MP-0-amalgam-coherence), [MP.4/gk-dimension](#MP-4-gk-dimension), [MP.4/dimension-comparisons](#MP-4-dimension-comparisons), [MP.4/graded-iwahori](#MP-4-graded-iwahori).

### Contract 8: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`

Extend the existing Serre-weight compact-induction input over Q_p with Barthel–Livné finite
codimension of I_1 invariants of a nonzero submodule, the step used in CDN Proposition 1.17. The
k[T] Hecke algebra and freeness alone do not prove proper-quotient finite length.

Needed by: [MP.1/proper-quotient](#MP-1-proper-quotient).

### Contract 9: `PadicLocalLanglandsForGL2Qp:R30.6`

Part II: for a finite-length smooth pi with fixed central character and a Serre-weight induction
I(sigma), Ext^1(pi,I(sigma)) has finite k-dimension. DEG Lemma 4.2.1 supplies this for p≥5;
reconcile the p=2,3 cases before removing the recorded gap. Fixed-character reduction follows CDN
footnote 19 because Hom(pi,I(sigma))=0.

Needed by: [MP.1/smooth-dual-length](#MP-1-smooth-dual-length).

### Contract 10: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Use geometricArtinMap, defined by inversion from the arithmetic-normalised local Artin map, and the
inverse of its restriction to the abelianised inertia/unit quotient. Compose reduction and the
chosen residue embedding to obtain the fundamental character; require the norm/Frobenius convention
of MP.3.

Needed by: [MP.3/tame-weight-set](#MP-3-tame-weight-set).

### Open proof obligation: Small-prime Ext input for the smooth-dual criterion

CDN Theorem 1.24 is stated without a lower prime bound. The primary DEG text read here assumes p≥5,
and its Lemma 4.2.1 supplies the crucial Ext^1(pi,I(sigma)) finiteness only in that range. A proof
or a separate primary reference for p=2,3 is still required; the R30.6 request records the exact
input. The theorem is a source-backed target, not a claim of a closed proof chain.

Affects: [MP.1/smooth-dual-length](#MP-1-smooth-dual-length).

The small-prime obligation is local to MP.1/smooth-dual-length. It does not enter the tame
unramified dimension bound or the projective-lattice calculations. The proposed Part II extensions
keep generic infrastructure with its existing owner. No higher-tier ownership move is proposed.

## Source findings and versions

The independent review confirmed E1–E4 at their recorded locators and added the known author
correction E5. Each finding is scoped to the exact version read. The small-prime citation gap
in E3 is an open proof input; it does not assert that the theorem is false.

### E1 — error in BHHMS23

**Locator.** arXiv:2009.03127v7 equation (44), p. 55 and Lemma 6.1.1(i), p. 56; same lemma in 115-page author copy, p. 59

**Source claim in our words.** Under p>3 the text says each nontrivial character relative to chi occurs at most once in W_{chi,3}.

**Correction or missing input.** For the auxiliary multiplicity statement impose p>5. At p=5,f=1 two independent degree-two vectors have the same nontrivial character. The Ext and root-embedding statements used here remain separately stated for p>3.

**Reason.** Take p=5,f=1. The torus root character alpha has order four, so alpha²=alpha^{-2}≠1. PBW gives independent degree-two vectors e² and f² in the quotient through degree two, both of that weight. Thus the relevant character multiplicity is two. The later hypothesis 2<r_i<p−3 already forces p≥7, so the final local theorem is unaffected.

**Effect.** a stated result

**Known correction.** new

**Independent review.** confirmed: Confirmed from the v7 graded character formula and the author-copy lemma: for p=5,f=1 the PBW monomials e² and f² are independent and have the same nontrivial torus weight. The root Ext and embedding claims do not use this repeated degree-two weight.

Correction search:

- arXiv version history through v7, read 2026-10-19
- Herzig publication page and current GK.pdf author copy, read 2026-10-19; the same claim remains there
- Breuil publication page, checked 2026-10-19; no correction for this title found
- Springer DOI 10.1007/s00222-023-01202-8 article landing page; publisher PDF returned a bot-check page, so this finding is scoped to the read preprint and author copy

### E2 — misprint in BHHMS23

**Locator.** arXiv:2009.03127v7 proof of Corollary 7.3.4, p. 84

**Source claim in our words.** Three projective-cover subscripts across two quotient expressions in the proof use K_1/Z_1 where the K/Z_1 cover is required.

**Correction or missing input.** Use the K/Z_1 projective cover of sigma, as in the corollary statement.

**Reason.** The cover must retain the finite GL_2(k_F) action and have coinvariants P_sigma. A cover indexed by K_1/Z_1 loses that simple K-cosocle and does not give the dimension (3f+1)dim P_sigma used in the proof.

**Effect.** the proof

**Known correction.** new

**Independent review.** confirmed: Confirmed in the v7 page image/text: three K_1/Z_1 labels occur across two quotient expressions. All must be K/Z_1, as fixed by the preceding surjection, the corollary statement and the subsequent dimension comparison.

Correction search:

- arXiv version history through v7
- Herzig and Breuil publication lists, checked 2026-10-19; no erratum for this title found
- Publisher landing page checked; PDF unavailable to this session. Finding scoped to v7.

### E3 — gap in CDN23

**Locator.** Published PDF, proof of Lemma 1.25, pp. 18–19 and footnote 19; hence the reverse implication of Theorem 1.24, p. 18

**Source claim in our words.** The Ext-finiteness step invokes Dotto–Emerton–Gee without imposing a lower bound on p in the surrounding statement.

**Correction or missing input.** Supply the small-prime Ext-finiteness input for p=2,3, or state this proof first for p≥5 and treat the small primes separately. MP.1 keeps the full statement as a target and records the unresolved input.

**Reason.** The DEG primary text read here explicitly assumes p≥5 in its introduction; Lemma 4.2.1 proves the needed finite-length/finite-generation Ext finiteness within that scope. CDN footnote 19 resolves the central-character issue but does not remove the prime restriction. This is a proof-reference scope gap, not a counterexample to Theorem 1.24.

**Effect.** the proof

**Known correction.** new

**Independent review.** confirmed: Confirmed as a proof-reference scope gap only. The published CDN proof invokes the DEG finite Ext input, whose read primary text assumes p≥5. Footnote 19 fixes central characters, not p=2,3. The full target is retained with the explicit small-prime obligation.

Correction search:

- CDN published Cambridge article and PDF, read 2026-10-19; no correction linked on the landing page
- Colmez author CDN5.pdf and the article title with erratum/corrigendum search, checked 2026-10-19
- DEG arXiv:2207.04671 listing and Emerton author copy, checked 2026-10-19; p≥5 remains explicit
- Gee author copy search result also explicitly assumes p≥5; no p=2,3 replacement reference located

### E4 — misprint in HU12

**Locator.** arXiv:0904.3991v3, proof of Proposition 4.4, p. 36, first intersection after the finite-presentation assumption

**Source claim in our words.** The first intersection uses I^+(W_2,V) in both factors.

**Correction or missing input.** The second factor is I^−(W_2,V), as in the inclusion immediately below and in Lemma 4.5.

**Reason.** The cited criterion controls the positive/negative obstruction. Repeating the positive cell gives the whole positive image, which is not the obstruction. The next displayed inclusion and the final sentence already use the intended opposite signs. The page was checked visually as well as in the extracted text.

**Effect.** nothing

**Known correction.** new

**Independent review.** confirmed: Confirmed visually on v3 p. 36: the first displayed obstruction repeats the positive cell, whereas the following inclusion and Lemma 4.5 use the positive/negative intersection. The intended finite-presentation argument is unchanged.

Correction search:

- arXiv:0904.3991 version listing through v3 and its p. 36, checked 2026-10-19
- Article-title and arXiv-id searches with erratum/corrigendum/correction, checked 2026-10-19; no correction located. Finding is scoped to v3; the journal text was not collated.

### E5 — error in LMS22

**Locator.** Author copy Proposition 3.3(2), pp. 7–8; corrected by LMS22-CORR item (2), p. 1

**Source claim in our words.** The projective tensor formula identifies every translated summand with the projective cover of its shifted Serre weight, including a possible character boundary.

**Correction or missing input.** Use the translated module R_{mu+nu}; it is the indicated projective cover when the shifted weight is not a character. The corrigé also removes the extra condition that the starting highest weight be noncentral.

**Reason.** At a character boundary the standard R-module can contain an additional projective constituent, so the unrestricted identification with one cover is invalid. All shifts in MP.5/projective-adjoint are noncharacters under its 3-deep bounds; that specialization is valid.

**Effect.** a stated result

**Known correction.** Le–Morra–Schraen, author corrigé for Multiplicity one at full congruence level, item (2)(a)–(b), https://www.math.univ-paris13.fr/~morra/corrige.pdf

**Independent review.** confirmed: Read Proposition 3.3 with the authors’ correction item (2); the corrected summands and noncharacter qualification are explicit. The added target uses exactly that qualified case.

Correction search:

- Morra author publication page and separate corrige.pdf, read 2026-10-19; item (2) explicitly corrects Proposition 3.3.

Read versions:

- [preprint](https://arxiv.org/pdf/2009.03127v7): Invent. Math. 234 (2023), 1–128; locators use arXiv:2009.03127v7, 9 June 2023. Read 2026-10-19. SHA-256 `8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a`.
- [author copy](https://www.math.toronto.edu/~herzig/GK.pdf): 115-page author copy, Lemma 6.1.1 p. 59 read; bibliography/formatting differs from v7. Read 2026-10-19. SHA-256 `b72458bd849101318871fe68f37f6ff2c0c9beac5e7f0e38bcfc6db34aff51dc`.
- [published](https://link.springer.com/article/10.1007/s00222-023-01202-8): Invent. Math. 234 (2023), 1–128; landing page read, PDF request returned a bot-check HTML page; no claim to have collated the version-of-record text. Read 2026-10-19.
- [published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf): Forum Math. Pi 11 (2023), e16, 1–62; published text. Read 2026-10-19. SHA-256 `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`.
- [author copy](https://math.uchicago.edu/~emerton/pdffiles/localizationGL2Qp.pdf): 64-page DEG author copy; p≥5 in introduction, Lemma 4.2.1 pp. 48–49. Read 2026-10-19. SHA-256 `45177d930d238c3df6c0a59146454143b1782886d6d9776cc241e7f84a17d690`.
- [preprint](https://arxiv.org/pdf/0904.3991v3): Hu, arXiv:0904.3991v3, 2 July 2010; proof of Proposition 4.4, p. 36 checked visually. Read 2026-10-19. SHA-256 `cd4bf2768c7b5cb8768b200cc2d2ef56ba49e8b0144f09af82c7b6e37e10610e`.
- [author copy](https://www.math.univ-paris13.fr/~morra/MultiplicityOne.pdf): J. Inst. Math. Jussieu 21 (2022), no. 2, 637–658; locators use author copy and its separate corrigé. Read 2026-10-19. SHA-256 `7a685d6e2b8ec29836970ba7dfa8b9ef6366e3e4fbb3a8dddcfd9e8452fab8bb`.
- [author copy](https://www.math.univ-paris13.fr/~morra/corrige.pdf): Two-page author correction, item (2), p. 1. Read 2026-10-19. SHA-256 `052f77ff37581f92ebdd9a5aeb0940cac6961b1c657ebababb2ec5d13bdd7a3e`.
- [preprint](https://arxiv.org/pdf/0909.0527v3): J. Algebra 324 (2010), 1577–1615; locators use arXiv:0909.0527v3, 19 March 2010. Read 2026-10-19. SHA-256 `f6f13dac6cfd541e2a5ed371ec8da9a3c398c703f5f1a8fee0b9814be3e1bf33`.

## Routed-item coverage

This table is an ownership index, not a substitute for the statements above. Keys refer to the
existing extraction records; no extracted prose is reproduced. A key that maps to a theorem's
proof work is intentionally kept within that target rather than made a separate auxiliary node.

### BHHMS: 52 routed items

| Item key | Destination | Disposition |
| --- | --- | --- |
| `gk-dim` | [MP.4/gk-dimension](#MP-4-gk-dimension) | planned here |
| `graded-iwahori` | [MP.4/graded-iwahori](#MP-4-graded-iwahori) | planned here |
| `gk-bound` | [MP.4/iwahori-gk-bound](#MP-4-iwahori-gk-bound) | planned here |
| `connected-socle` | [MP.7/connected-characters](#MP-7-connected-characters) | planned here |
| `iwahori-mult-one` | [MP.7/hom-third-layer](#MP-7-hom-third-layer) | planned here |
| `local-gk` | [MP.7/local-gk-bound](#MP-7-local-gk-bound) | planned here |
| `lattice-L` | [MP.8/projective-lattice](#MP-8-projective-lattice), [MP.8/projective-truncation](#MP-8-projective-truncation) | planned here |
| `lambda-lattice` | [MP.3/weight-coordinates](#MP-3-weight-coordinates), [MP.3/translation-map](#MP-3-translation-map) | planned here |
| `change-of-origin` | [MP.3/change-origin-ext](#MP-3-change-origin-ext) | planned here |
| `ext-adjacent-weights` | [MP.3/change-origin-ext](#MP-3-change-origin-ext) | planned here |
| `gk-quotient` | [MP.4/dimension-comparisons](#MP-4-dimension-comparisons) | planned here |
| `gk-central-regular` | [MP.4/dimension-comparisons](#MP-4-dimension-comparisons) | planned here |
| `lie-valuation` | [MP.4/iwahori-valuation](#MP-4-iwahori-valuation) | planned here |
| `group-ring-congruences` | [MP.4/graded-iwahori](#MP-4-graded-iwahori) | planned here |
| `filtration-valuation` | [MP.4/graded-iwahori](#MP-4-graded-iwahori) | planned here |
| `W-chi-n` | [MP.4/iwahori-truncations](#MP-4-iwahori-truncations) | planned here |
| `ext-iwahori` | [MP.5/iwahori-extensions](#MP-5-iwahori-extensions) | planned here |
| `W-injective` | [MP.5/iwahori-extensions](#MP-5-iwahori-extensions) | planned here |
| `inj-borel` | [MP.5/borel-injectives](#MP-5-borel-injectives) | planned here |
| `J-chi` | [MP.5/borel-injectives](#MP-5-borel-injectives) | planned here |
| `jh-principal-series` | [MP.5/finite-weight-hulls](#MP-5-finite-weight-hulls) | planned here |
| `multfree-V` | [MP.6/box-module](#MP-6-box-module) | planned here |
| `K1-invariance` | [MP.6/box-torsion](#MP-6-box-torsion) | planned here |
| `V-mK1` | [MP.6/box-torsion](#MP-6-box-torsion) | planned here |
| `cosocle-ind-E` | [MP.6/induced-extension-control](#MP-6-induced-extension-control) | planned here |
| `ind-multfree` | [MP.6/induced-extension-control](#MP-6-induced-extension-control) | planned here |
| `jh-image` | [MP.6/induced-extension-control](#MP-6-induced-extension-control) | planned here |
| `ext-vanishing` | [MP.6/induced-extension-control](#MP-6-induced-extension-control) | planned here |
| `D-lambda-eps` | [MP.6/diamond-box](#MP-6-diamond-box) | planned here |
| `jh-D-tensor` | [MP.6/adjoint-tensor](#MP-6-adjoint-tensor) | planned here |
| `soc-cosoc-D-tensor` | [MP.6/adjoint-tensor](#MP-6-adjoint-tensor) | planned here |
| `V-tensor-filtration` | [MP.6/adjoint-tensor](#MP-6-adjoint-tensor) | planned here |
| `D-tensor-filtration` | [MP.6/adjoint-tensor](#MP-6-adjoint-tensor) | planned here |
| `max-W` | [MP.6/maximal-enlargement](#MP-6-maximal-enlargement) | planned here |
| `V-sigma` | [MP.6/socle-enlargement](#MP-6-socle-enlargement) | planned here |
| `V-mK1-D0` | [MP.6/socle-enlargement](#MP-6-socle-enlargement) | planned here |
| `iwahori-vanishing` | [MP.7/induced-socle-vanishing](#MP-7-induced-socle-vanishing) | planned here |
| `D1-connected` | [MP.7/diamond-connected](#MP-7-diamond-connected) | planned here |
| `W2-iso` | [MP.7/hom-second-layer](#MP-7-hom-second-layer) | planned here |
| `no-embedding` | [MP.7/hom-second-layer](#MP-7-hom-second-layer) | planned here |
| `bockstein-exact` | [MP.8/bockstein](#MP-8-bockstein) | planned here |
| `beta-sl2` | [MP.8/bockstein](#MP-8-bockstein) | planned here |
| `bockstein-sub` | [MP.8/sublattice-bockstein](#MP-8-sublattice-bockstein) | planned here |
| `psi-lambda-iso` | [MP.8/adjoint-psi](#MP-8-adjoint-psi) | planned here |
| `Psi-iso` | [MP.8/adjoint-psi](#MP-8-adjoint-psi) | planned here |
| `lattice-R` | [MP.8/projective-lattice](#MP-8-projective-lattice) | planned here |
| `R2prime-K1` | [MP.8/lattice-coinvariants](#MP-8-lattice-coinvariants) | planned here |
| `socle-sl2-P` | [MP.8/lattice-coinvariants](#MP-8-lattice-coinvariants) | planned here |
| `R-exact` | [MP.8/lattice-coinvariants](#MP-8-lattice-coinvariants) | planned here |
| `end-commutative` | [MP.9/endomorphism-ring](#MP-9-endomorphism-ring) | planned here |
| `hom-cyclic` | [MP.9/cyclic-hom](#MP-9-cyclic-hom) | planned here |
| `quotient-projectivity` | [MP.9/relative-projectivity](#MP-9-relative-projectivity) | planned here |

### CDN: 18 routed items

| Item key | Destination | Disposition |
| --- | --- | --- |
| `1.1-smooth-torsion` | [MP.0/torsion-admissibility](#MP-0-torsion-admissibility), [MP.0/augmented-iwasawa-algebra](#MP-0-augmented-iwasawa-algebra) | planned here |
| `1.1-finiteness-notions` | [MP.0/torsion-admissibility](#MP-0-torsion-admissibility), [MP.0/finite-presentation](#MP-0-finite-presentation) | planned here |
| `1.1-prop-shotton-ext` | [MP.0/finiteness-calculus](#MP-0-finiteness-calculus) | planned here |
| `1.1-prop-shotton-coherent` | [MP.0/amalgam-coherence](#MP-0-amalgam-coherence) | planned here |
| `1.2-rationality` | [MP.0/scalar-extension](#MP-0-scalar-extension) | planned here |
| `1.2-galois-orbits` | `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles` | imported from existing owner |
| `1.3-Ichi` | `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-on-irreducibles` | imported from existing owner |
| `1.4-prop-BL-rigidity` | [MP.1/proper-quotient](#MP-1-proper-quotient) | planned here |
| `1.4-prop-filtration` | [MP.1/serre-filtration](#MP-1-serre-filtration), [MP.1/finite-type-presentation](#MP-1-finite-type-presentation) | planned here |
| `1.4-thm-cosocle` | [MP.1/cosocle-length](#MP-1-cosocle-length) | planned here |
| `1.4-finiteness-lemmas` | [MP.1/central-ext](#MP-1-central-ext) | planned here |
| `1.4-thm-LTappli` | [MP.1/smooth-dual-length](#MP-1-smooth-dual-length) | planned here |
| `1.5-category-C` | [MP.2/category-c](#MP-2-category-c) | planned here |
| `1.5-thm-schraen-wu` | `PadicLocalLanglandsForGL2Qp:R30.2/no-correspondence-beyond-qp` | imported from existing owner |
| `1.5-ord-functor` | [MP.2/ordinary-parts](#MP-2-ordinary-parts), [MP.2/ordinary-values](#MP-2-ordinary-values), [MP.2/ordinary-counit](#MP-2-ordinary-counit), [MP.2/ordinary-banach](#MP-2-ordinary-banach) | planned here |
| `1.5-jordan-holder-ord` | [MP.2/category-c](#MP-2-category-c) | planned here |
| `in-gabriel` | `PadicLocalLanglandsForGL2Qp:R30.5/blocks` | imported from existing owner |
| `in-schikhof` | `CompletedCohomologyPartII:CC.3/qualified-biduality`, `CompletedCohomologyPartII:CC.3/coefficient-module-duality`, `CompletedCohomologyPartII:CC.3/iwasawa-action-on-homology` | imported from existing owner |

Extraction corrections:

- `PAPER-BREUIL-ETAL-23/local-gk`: The local source theorem gives an upper bound ≤f. Equality is not inferred without a separate nonvanishing/lower-bound input.
- `PAPER-BREUIL-ETAL-23/R2prime-K1`, `PAPER-BREUIL-ETAL-23/R-exact`: The primary statements are about K_1 coinvariants. The extraction uses invariant superscripts; this roadmap uses the correct coinvariant quotient and its right-exact maps.
- `PAPER-BREUIL-ETAL-23/lattice-L`, `PAPER-BREUIL-ETAL-23/lattice-R`: The introductory partial fibre products and §7 fibre product are the same construction at the last step: L_{f−1}=R. This is not a version change.
- `PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/in-gabriel`: R30.5 owns the smooth locally finite block category, including the pseudocompact topology, right endomorphism-module variance, and finite block support. The finite-algebra quiver theorem alone is insufficient.
- `PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/in-schikhof`: CC.3 already owns compact coefficient duality and the automorphic application. Distinguish torsion Pontryagin duals from torsion-free complete Schikhof duals and retain the contragredient action.

## Bibliography and reading record

Locators above use the edition named here, including its page numbering. All statements and proof work are paraphrases.

### BHHMS23

Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra, Benjamin Schraen. [Gelfand–Kirillov dimension and mod p cohomology for GL_2](https://arxiv.org/pdf/2009.03127v7). Invent. Math. 234 (2023), 1–128; locators use arXiv:2009.03127v7, 9 June 2023.

Read for this plan: Introduction pp. 2–10; §2 pp. 11–18; §5–7 pp. 46–86; Final paragraph of Lemma 4.1.2, p. 27 (finite projective lift constituents).

Read PDF SHA-256: `8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a`.

### CDN23

Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł. [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum Math. Pi 11 (2023), e16, 1–62; published text.

Read for this plan: §1.1–1.5 pp. 9–23; Lemma 2.9 pp. 26–28; §4 p. 40–41; bibliography pp. 56–62.

Read PDF SHA-256: `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`.

### SHOTTON20

Jack Shotton. [The category of finitely presented smooth mod p representations of GL_2(F)](https://www.maths.dur.ac.uk/users/jack.g.shotton/papers/coherence.pdf). Doc. Math. 25 (2020), 143–157; 12-page author copy.

Read for this plan: §2–3 pp. 1–9; §4–5 pp. 11–12.

Read PDF SHA-256: `852bb5c8084cde5d723057fd7e4980cb7e77451b3cae472dcd1c1746e26dbab5`.

### BP12

Christophe Breuil, Vytautas Paškūnas. [Towards a modulo p Langlands correspondence for GL_2](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/supersingular.pdf). Mem. Amer. Math. Soc. 216 (2012), no. 1016; locators use author copy.

Read for this plan: Lemmas 3.4–3.5 pp. 20–21 and Lemma 3.8 pp. 22–23; Corollary 3.12 p. 26; Corollaries 5.6–5.7 pp. 37–38; Proposition 13.1 and Corollary 13.2 pp. 75–76; Proposition 14.7 p. 83 and Theorem 14.8 p. 84.

Read PDF SHA-256: `a63c41e222e226f1019282f6b7dab7078afe61f908572f1b0f90523f7fdf2d51`.

### EMERTON1

Matthew Emerton. [Ordinary parts of admissible representations of p-adic reductive groups I. Definition and first properties](https://www.math.uchicago.edu/~emerton/pdffiles/ord-one.pdf). Astérisque 331 (2010), 355–402; locators use 42-page author copy.

Read for this plan: §3.1 pp. 14–17; Proposition 3.2.4 p. 21; §3.3 pp. 22–24; Proposition 4.3.4 pp. 33–34; Theorem 4.4.6 pp. 36–38.

Read PDF SHA-256: `4300be5ff118fb60556b2b478281631d7fd2eb5147c0d192a859e41ad6fb0429`.

### EMERTON2

Matthew Emerton. [Ordinary parts of admissible representations of p-adic reductive groups II. Derived functors](https://www.math.uchicago.edu/~emerton/pdffiles/ord-two.pdf). Astérisque 331 (2010), 403–459; author copy.

Read for this plan: §3.7, Remark 3.7.3 p. 23; Theorem 4.2.12 p. 30 and surrounding GL_2(Q_p) computations.

Read PDF SHA-256: `3ecb1ba39a611ad931caf29d2f5215ca7d72d3ffdf9f58a04ec4f27faa67c00a`.

### HAUSEUX

Julien Hauseux. [Extensions entre séries principales p-adiques et modulo p de G(F)](https://julien-hauseux.perso.math.cnrs.fr/pdf/extensions.pdf). Author copy, Corollary 4.2.4 pp. 34–35.

Read for this plan: Corollary 4.2.4 and proof pp. 34–35.

Read PDF SHA-256: `10cc9747f598036eeb05c589f1e8e06e1d0d3e750a686ce9511701267b66ab66`.

### DEG

Andrea Dotto, Matthew Emerton, Toby Gee. [Localization of smooth p-power torsion representations of GL_2(Q_p)](https://math.uchicago.edu/~emerton/pdffiles/localizationGL2Qp.pdf). 64-page author copy; its introduction assumes p≥5.

Read for this plan: Introduction p. 1; Lemma 4.2.1 and Proposition 4.2.2 pp. 48–49.

Read PDF SHA-256: `45177d930d238c3df6c0a59146454143b1782886d6d9776cc241e7f84a17d690`.

### HW22

Yongquan Hu, Haoran Wang. [On the mod p cohomology for GL_2: the non-semisimple case](https://arxiv.org/pdf/2009.09640v4). arXiv:2009.09640v4, 20 July 2022.

Read for this plan: Genericity convention p. 8; Lemma 2.10 p. 12; Theorem 2.23, Corollaries 2.25–2.26 p. 17; Theorem 2.30 and Corollary 2.31 p. 20.

Read PDF SHA-256: `018c887761324a2134c614c3328d2aa4d25e9a8640c6c0e8fe704d9a99e795b1`.

### VIGNERAS11

Marie-France Vignéras. [Le foncteur de Colmez pour GL(2,F)](https://www.researchgate.net/publication/292473119_Le_foncteur_de_Colmez_pour_GL2_F). Arithmetic Geometry and Automorphic Forms, ALM 19 (2011), 531–557; author-uploaded public full text.

Read for this plan: Theorem 5.3(e)–(f), Proposition 5.5 pp. 549–550 and Proposition 5.6, Remark 5.7 and Proposition 5.8 p. 551.

### HU12

Yongquan Hu. [Diagrammes canoniques et représentations modulo p de GL_2(F)](https://arxiv.org/pdf/0904.3991v3). J. Inst. Math. Jussieu 11 (2012), 67–118; locators use arXiv:0904.3991v3, 2 July 2010.

Read for this plan: §3.1.1 pp. 17–18; §3.3 pp. 30–32; Theorem 4.3 pp. 33–34; Proposition 4.4 and Lemma 4.5 pp. 34–36; Corollary 4.7 p. 37.

Read PDF SHA-256: `cd4bf2768c7b5cb8768b200cc2d2ef56ba49e8b0144f09af82c7b6e37e10610e`.

### KOHLHAASE17

Jan Kohlhaase. [Smooth duality in natural characteristic](https://esaga.uni-due.de/f/jan.kohlhaase/Kohlhaase_Smooth_Duality.pdf). Adv. Math. 317 (2017), 1–49; locators use author copy.

Read for this plan: Proposition 3.9 and Remark 3.10, pp. 18–19.

Read PDF SHA-256: `7950a05ee57ab100abd005c300af8c02872d88cd220b4da87d1417db56ac9421`.

### HU10

Yongquan Hu. [Sur quelques représentations supersingulières de GL_2(Q_{p^f})](https://arxiv.org/pdf/0909.0527v3). J. Algebra 324 (2010), 1577–1615; locators use arXiv:0909.0527v3, 19 March 2010.

Read for this plan: Lemma 2.13(i) and proof, pp. 14–15; neighbouring conventions pp. 12–14 (numbered Lemma 2.12(i) in BHHMS’s journal citation).

Read PDF SHA-256: `f6f13dac6cfd541e2a5ed371ec8da9a3c398c703f5f1a8fee0b9814be3e1bf33`.

### LMS22

Daniel Le, Stefano Morra, Benjamin Schraen. [Multiplicity one at full congruence level](https://www.math.univ-paris13.fr/~morra/MultiplicityOne.pdf). J. Inst. Math. Jussieu 21 (2022), no. 2, 637–658; locators use author copy and its separate corrigé.

Read for this plan: Proposition 3.3 and proof, pp. 7–8, read with item (2) of the author corrigé.

Read PDF SHA-256: `7a685d6e2b8ec29836970ba7dfa8b9ef6366e3e4fbb3a8dddcfd9e8452fab8bb`.

### LMS22-CORR

Daniel Le, Stefano Morra, Benjamin Schraen. [Corrigé for Multiplicity one at full congruence level](https://www.math.univ-paris13.fr/~morra/corrige.pdf). Two-page author correction, item (2), p. 1.

Read for this plan: Item (2)(a)–(b), p. 1.

Read PDF SHA-256: `052f77ff37581f92ebdd9a5aeb0940cac6961b1c657ebababb2ec5d13bdd7a3e`.

## Suggested Lean and review checks

The suggested file follows WORKERS.md's 2026-10-12 target-level shape, which supersedes the older
per-declaration prototype requirement. It has real-bodied integer depth, translation and adjacency
predicates and the polynomial crossing ideal/quotient; API signatures, dimension, and their examples
use existing Mathlib carriers. The Serre-weight interpretation of those coordinates and the
Cohen–Macaulay/Iwahori comparisons remain the complete document targets above. In particular,
there is no fake smooth category, Prop-valued theory parameter, or data definition with a placeholder
body. Heavy APIs and their tests are fully specified in the document rather than encoded with
unavailable carriers.

The suggested file elaborated through `lean-check` at the required pins on 2026-10-19, with
placeholder-proof warnings as its only warnings. The packet checker and deliverable-file checks
are recorded in the handoff. Independent review checked every target and baseline citation,
E1’s small-prime collision, E3’s citation range, the weight/Artin conventions, nonuniform filtration,
and the compact-cover versus finite-cover distinction. The added finite projective input uses the
authors’ correction to LMS22. The explicit supplier contracts and small-prime Ext obligation remain
to be discharged before any layer can be called closed.
