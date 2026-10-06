# Habiro rings: finite cyclotomic arithmetic descent

This document plans `HabiroRings:HR.3`. It builds on the accepted
[HabiroRings packet](../packets/HabiroRings.json), whose five HR.3 nodes remain
the owners of the general descent principle, the cyclotomic intersection
calculation, the completed-category equivalence, Corollary 2.4 and the fracture
description. The refinement here supplies a finite indexing interface, specifies
the coherent diagram used in that equivalence, verifies its localization
contract, and gives a reconstruction functor and an explicit mapping-space
formula. Its packet is [HabiroRings--HR.3.json](../packets/HabiroRings--HR.3.json).

The pass is complete at target level. The stage is **planned**, with two recorded
gaps: the generic categorical supplier refinements, and signatures requiring
their enhanced carriers. The requests below are part of the plan; their presence
does not establish the requested results. No declaration here claims an
implementation.

## Conventions and the baseline

Let (A) be a commutative ring, (m>0) an integer and (B=A[q]). No
torsion-freeness, noetherian hypothesis, regular-sequence hypothesis or
Λ-structure is imposed. Write (f=q^m-1) and (Phi_d=Phi_d(q)in B). The
positive divisors of (m) form the finite set (T(m)). Divisors of zero are not
used; Mathlib's divisor finset of zero is empty.

(D(B)) denotes the enhanced derived infinity-category of (B)-modules, with
its derived symmetric monoidal tensor. For a finitely generated ideal (I),
(L_I) denotes the Koszul-model derived completion supplied by
`DerivedDeRhamCohomology:DD.1`, and (D_S=widehat D_{I_S}(B)), where

\[
 I_S=(\Phi_d:d\in S).
\]

This is a full reflective subcategory. Its tensor is
(L_{I_S}(M\otimes_B^L N)) and its tensor unit is (L_{I_S}B). Completion of
an algebra means completion in this enhanced monoidal setting, with the
underlying-module comparison from DD.1. Quotients in the proof are derived
cofibres. An ordinary inverse limit of underived quotient rings is not an
unconditional model of this completion.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The statements and definitions of the
following declarations were read at those commits:

| Declaration | Contribution |
| --- | --- |
| `mathlib:Nat.divisors` | Finite positive-divisor set. |
| `mathlib:Nat.primeFactors` | Finite prime-factor set. |
| `mathlib:Nat.factorization` | The multiplicities (v_p(m)). |
| `mathlib:CategoryTheory.Nerve.quasicategory` | The ordinary finite index has a quasicategory nerve. |
| `mathlib:Polynomial.cyclotomic` | The existing cyclotomic-polynomial convention over (A). |
| `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one` | (f=\prod_{d\mid m}\Phi_d). |

The reviewed HR.3 library audit finds divisor and cyclotomic arithmetic partial,
but the derived and E∞-algebra descent target unbuilt. The baseline
quasicategory predicate and the nerve of an ordinary category do not provide
derived completion, presentable stable infinity-categories or operadic algebra
sections. In particular, the nerve of the homotopy category of complexes cannot
replace (D(B)). The ordinary nerve is used only for the indexing poset.

## The imported arithmetic and descent statements

The prerequisite nodes below are imported by their existing ids, rather than
copied into this part. Every id begins with `HabiroRings:HR.3/`.

| Imported id suffix | Role in this refinement |
| --- | --- |
| `the-divisor-poset-and-its-intersections` | Decides which intersections survive and identifies the completion category on each chain. |
| `the-general-descent-principle` | Wagner's finite-cover localization descent principle, including its monoidal conclusion. |
| `the-morphism-level-statement` | The equivalence with the limit of completion categories and the two right-Kan reductions. |
| `the-complete-descent-corollary` | Prime-edge E∞-algebra input and the contractible reconstruction conclusion. |
| `the-fracture-square-pieces` | The rational and prime-completed pieces of Remark 2.5. |

For orientation, the intersection node says that a nonempty subset (S) of
divisors outside every prime-power chain has unit ideal (I_S). Its complete
module category is therefore zero, and its algebra category is terminal. If
(S) has at least two elements and is contained in a maximal (p)-chain with
prime-free initial divisor (d), then

\[
 \sqrt{I_S}=\sqrt{(p,\Phi_d)}.
\]

Distinct nontrivial maximal chains are incomparable. For a fixed prime,
different prime-free initial divisors have disjoint cyclotomic support modulo
that prime. These facts come from the parent's imported cyclotomic arithmetic
in `HabiroClassical` and `HabiroRingArithmetic`; this part does not construct a
second polynomial-resultant or mod-(p) library.

The parent corollary takes a (Phi_d)-complete E∞-(B)-algebra (E_d) for
every (d\mid m), and an equivalence

\[
 h_{p,d}: (E_{pd})^\wedge_p\simeq(E_d)^\wedge_p
 \qquad(p\text{ prime},\ pd\mid m).
\]

It reconstructs a unique (f)-complete algebra with the prescribed local
identifications, where uniqueness is the contractibility of the space of such
solutions. The equivalences are over (B). An arbitrary tuple of local
algebras without these comparisons is not the input.

## The finite descent index

The new definition `HabiroRings:HR.3/finite-descent-index` uses the full poset
(Q(m)) of nonempty subsets of (T(m)), ordered by inclusion. For a prime
(p\mid m) and a divisor (d\mid m) with (p\nmid d), define

\[
 C(m,d,p)=\{d,pd,\ldots,p^{v_p(m)}d\}.
\]

Let (P(m)\subset Q(m)) be the full subposet consisting of all singleton
divisors and these maximal chains. A vertex is the subset itself, not a tagged
presentation of a chain. Wagner also allows primes not dividing (m), which
produce singleton chains; the separate singleton term here represents them
without enumerating infinitely many primes. The morphisms are subset
inclusions, not divisibility relations between the individual divisors.

The imported chain-incomparability statement implies that every nonidentity
arrow has singleton source and maximal-chain target. Thus the nerve has no
nondegenerate simplices of dimension at least two. This does not say that the
underlying incidence graph is a tree. At (m=6) that graph has a cycle.

Each prime edge ((p,d)), with (pd\mid m), belongs to a unique maximal
(p)-chain. Indeed write (d=d_0p^i), with (p\nmid d_0). Then (d_0\mid m)
and (0\leq i<v_p(m)). The edge joins consecutive entries (p^i d_0) and
(p^{i+1}d_0). This is the interface that converts incidence comparisons to
the source's prime-edge comparisons.

The proposed namespace is `TauCeti.Habiro.CyclotomicIndex`. Its API is:

| Proposed name | Required statement |
| --- | --- |
| `CyclotomicIndex.primeChain` | Construct the finset (C(m,d,p)); under the stated prime/divisor hypotheses it is a vertex. |
| `CyclotomicIndex.vertices` | Enumerate singletons together with maximal chains at the prime factors of (m). |
| `CyclotomicIndex.mem_vertices` | Membership is exactly singleton-divisor membership or a prime-free maximal-chain presentation. |
| `CyclotomicIndex.vertex_subset` | Every vertex is a subset of (T(m)). |
| `CyclotomicIndex.vertex_nonempty` | Every vertex is nonempty. |
| `CyclotomicIndex.height_one` | If (S\subseteq U\subseteq V) are vertices, then (S=U) or (U=V). |
| `CyclotomicIndex.primeEdge_factorisation` | The pair ((d_0,i)) above is unique, with (i<v_p(m)). |
| `CyclotomicIndex.nerve_quasicategory` | Reuse the existing ordinary-category nerve instance for (P(m)). |

Four unit tests distinguish this definition from the full cube or from a
divisibility category. `CyclotomicIndex.test_one` gives (P(1)=\{\{1\}\}).
`CyclotomicIndex.test_four` gives the four vertices
(\{1\},\{2\},\{4\},\{1,2,4\}). `CyclotomicIndex.test_six` gives the eight
vertices

\[
 \{1\},\{2\},\{3\},\{6\},\{1,2\},\{3,6\},\{1,3\},\{2,6\}.
\]

Finally `CyclotomicIndex.test_not_pair_four` says that (\{1,4\}) is not a
vertex of (P(4)). It nevertheless survives in (Q(4)), because its ideal is
((q-1,2)). Confusing surviving subsets with prime edges would fail this test.

## The coherent completion diagram

The construction `HabiroRings:HR.3/coherent-completion-diagram` produces

\[
 F_{A,m}:N(Q(m))\longrightarrow\operatorname{CAlg}(\mathrm{Pr}^L_{st}),
 \qquad F(S)=D_S.
\]

Here the outer CAlg denotes presentable symmetric monoidal stable categories;
(operatorname{CAlg}(D_S)) denotes E∞ algebra objects in the category (D_S).
For (S\subseteq U), the transition is (L_{I_U}|D_S). The right-adjoint
inclusions of complete subcategories reverse these arrows. Poset
straightening, coherent adjunctions and adjoint reversal turn them into the
covariant diagram of left adjoints. The completed tensor structure comes from
the compatible monoidal localization theorem, not an independently assigned
tensor on every vertex.

The DD.1 contract includes exact accessibility and
(L_I L_J\simeq L_{I+J}), radical and generator independence, and compatibility
of completion with tensor. These identify the value at (C(m,d,p)) with
(widehat D_{(p,\Phi_d)}(B)). The transition from ({p^i d}) to that chain
is (p)-completion on the (Phi_{p^i d})-complete category. Coherence must
identify composition for every (S\subseteq U\subseteq V), including units
and higher associativity. Equality of functors on isomorphism classes does not
provide this diagram.

The proposed namespace `TauCeti.Habiro.CyclotomicCompletionDiagram` has seven
API items. `obj` returns (D_S) with its completed tensor. `map` returns the
restricted completion functor; `map_id` identifies it with identity when
(S=U), using the localization counit. `map_comp` supplies the coherent
composition comparison for three nested subsets. `unit` returns (L_{I_S}B).
`chain` supplies the above radical-invariant chain identification and the
(p)-completion transition. `algebraSections` returns

\[
 \mathcal S_{A,m}=\lim_{S\in P(m)}\operatorname{CAlg}(D_S)
\]

with its evaluations and mapping spaces. These are the names
`CyclotomicCompletionDiagram.obj`, `.map`, `.map_id`, `.map_comp`, `.unit`,
`.chain` and `.algebraSections` in the packet.

Three tests fix the conventions. `CyclotomicCompletionDiagram.test_one` gives
the single ((q-1))-complete category at (m=1).
`CyclotomicCompletionDiagram.test_four` gives the same
((2,q-1))-complete category at every subset of (Q(4)) of size at least two;
only the maximal chain represents it in (P(4)).
`CyclotomicCompletionDiagram.test_six_empty` gives the zero module category,
and terminal algebra category, at ({1,6}); the ({1,2}) value is the
((2,q-1))-complete category. This detects an incorrect constant-overlap
diagram.

## Verification of the finite localization contract

The lemma `HabiroRings:HR.3/finite-localisation-contract` applies the imported
general descent principle to these actual coefficient categories. It establishes
the following natural statements on enhanced diagram categories:

1. The (Phi_d)-completion functors, (d\mid m), are jointly conservative
   on (widehat D_f(B)).
2. For every (M\in\widehat D_f(B)), the completion-unit augmentation
   (M\to\lim_{S\in Q(m)} L_{I_S}M) is an equivalence.
3. For a coherent local section ((M_S)), its ambient finite limit (M) is
   (f)-complete and each canonical map (L_{I_S}M\to M_S) is an equivalence.

For the first assertion, if all completions of a complete module (N) vanish,
then all derived quotients (N/\Phi_d) vanish. Hence multiplication by every
(Phi_d) is an equivalence. Their product is (f), so (N/f=0); DD.1
derived Nakayama gives (N=0). Applying this to fibres detects equivalences.
This argument works for the arbitrary coefficient ring allowed above.

For the second assertion, fix a divisor (a). After (L_{\Phi_a}), the cube
has vertices (L_{I_{S\cup\{a\}}}M), with equivalences along the
(a)-coordinate. The stable cubical contraction identifies the punctured
cube's limit with its augmented vertex (L_{\Phi_a}M). Exactness passes
(L_{\Phi_a}) through this finite homotopy limit. Joint conservativity proves
the augmentation is an equivalence. This uses finite limits, never arbitrary
limit preservation by a left adjoint.

For the third assertion, every (M_S) is (f)-complete since (f\in I_S),
and the full complete subcategory is closed under limits. For a fixed (a),
the section equivalences identify (L_{\Phi_a}M_S) with (M_{S\cup\{a\}}).
The same cube contraction gives (L_{\Phi_a}M\simeq M_{\{a\}}). For general
(S), compose these localizations and use (L_I L_J\simeq L_{I+J}) to obtain
(L_{I_S}M\simeq M_S). The maps are those induced by the coherent limiting
cone, so the assertion extends to section morphisms.

The parent equivalence first retains the subposet of all surviving subsets and
then restricts to (P(m)). Both restrictions are justified by right Kan
extension. For an inclusion (j), the pointwise value at (S) is the limit
over ((S\downarrow j)). A discarded subset has an empty slice and terminal
categorical value. An included vertex (S) is initial in its slice, so its
value is unchanged. A surviving nonsingleton not in (P(m)) has exactly one
containing maximal chain, and the slice consists of that chain. The transition
to it is an equivalence by the arithmetic calculation. These facts establish
the direction of Kan extension and prevent a mistaken use of terminal objects
to evaluate general limits. The total limits are invariant under these right
Kan extensions, as requested from E3.

## Reconstruction as a functor

The construction `HabiroRings:HR.3/reconstruction-functor` gives an explicit
inverse

\[
 R_{A,m}:\mathcal S_{A,m}\longrightarrow
 \operatorname{CAlg}(\widehat D_f(B)).
\]

Extend a coherent (P(m))-section to (Q(m)) through the parent equivalences.
Use the canonical lax monoidal right-adjoint inclusions (D_S\hookrightarrow
D(B)) to regard its components as ambient E∞-(B)-algebras. The transition
algebra maps are obtained from the completion units and the section
equivalences. Take their finite homotopy limit in ambient algebras. The
fixed-category algebra-limit theorem identifies its underlying module with the
module limit, and the preceding contract shows that it is (f)-complete and
has the desired completions. In particular, no staticity assertion is needed.

The completion functor (C_{A,m}) sends (E) to ((L_{I_S}E)_S). Cone
universality and the localization contract give natural equivalences

\[
 E\simeq R_{A,m}C_{A,m}E,\qquad
 C_{A,m}R_{A,m}s\simeq s.
\]

Their triangle homotopies are part of the functorial equivalence. Taking limits
of coherent local algebra maps defines reconstruction on morphisms and their
higher homotopies. The solution space for fixed input (s) is the homotopy
fibre of the equivalence (C_{A,m}) on maximal subgroupoids: pairs
((E,C_{A,m}E\simeq s)). It is contractible. This does not assert that the
unmarked algebra (E) has no automorphisms.

The namespace is `TauCeti.Habiro.CyclotomicReconstruction`. Its eight API
declarations are `CyclotomicReconstruction.ofSection` (the limit algebra),
`.complete` (the natural singleton completion identifications respecting all
prime edges), `.map`, `.map_id` and `.map_comp` (the coherent functor laws),
`.unit` ((E\to RC(E))), `.counit` ((CR(s)\to s)) and `.solutionSpace`
(the specified contractible fibre). HR.4 uses this API to glue
Frobenius-twisted local algebras and reconstruct their transition maps.

The four tests are substantive. `CyclotomicReconstruction.test_one` makes
(R) evaluation at the sole component. For `CyclotomicReconstruction.test_prime`,
at (m=p) prime, reconstruction is naturally the homotopy pullback

\[
 E_1\times_{(E_1)^\wedge_p}E_p,
\]

where the map from (E_p) is completion followed by (h_{p,1}).
`CyclotomicReconstruction.test_unit` reconstructs (B^\wedge_f) from the
canonical local completions (B^\wedge_{\Phi_d}), with their canonical common
completion identifications. `CyclotomicReconstruction.test_four` identifies the
comparison on ({1,4}) with (h_{2,1}\circ h_{2,2}). Supplying an unrelated
third comparison there fails the section condition.

## Mapping spaces and prime-edge coherence

The theorem `HabiroRings:HR.3/prime-edge-mapping-spaces`, with proposed name
`cyclotomicPrimeEdgeMappingSpace`, states the universal property on morphisms
explicitly. Let (E,F) be (f)-complete E∞-(B)-algebras, presented by their
singleton completions and actual equivalences (h^E,h^F). Put

\[
 V=\prod_{d\mid m}\operatorname{Map}_B(E_d,F_d),\qquad
 W=\prod_{p\text{ prime},\ pd\mid m}
      \operatorname{Map}_B((E_{pd})^\wedge_p,(F_d)^\wedge_p).
\]

Here Map means the algebra mapping space in the supplied enhanced model. For
(g=(g_d)\in V) define

\[
 u(g)_{p,d}=g_d^\wedge_p\circ h^E_{p,d},\qquad
 v(g)_{p,d}=h^F_{p,d}\circ g_{pd}^\wedge_p.
\]

There is a natural equivalence of spaces

\[
 \operatorname{Map}_B(E,F)\simeq
 V\times_{W\times W}W^{\Delta^1},
\]

using ((u,v)) and endpoint evaluation. Thus a point is a family of local
maps together with a specified path on every prime edge. The formula also
describes higher homotopies. Equality on components of mapping spaces, or
existence of an unspecified homotopy on each overlap, would discard part of
the morphism datum. A reconstructed map is an equivalence exactly when every
singleton local map is an equivalence.

To prove the formula, compute transformations of coherent sections in the
parent categorical limit. At every chain choose its component at the
prime-free divisor; the space of making this choice with its identifications
is contractible. Eliminating the chain-component map converts its incidence
conditions to the successive prime-edge paths. Height one means that no
nonidentity composites impose an additional triangle condition. The same
argument in all simplicial dimensions gives an equivalence of spaces, not
just a bijection of homotopy classes. Joint conservativity proves the final
equivalence criterion.

At (m=1), (W) is terminal and the formula reduces to the sole local mapping
space. At a prime (m=p) it includes one compatibility path. At (m=6) it has
four local map factors and four edge paths. The cycle in the incidence graph
does not require an additional object-level cocycle or a fifth relation on
maps. It still permits higher topology in the mapping space; the assertion
does not make that space discrete.

## Supplier contracts and ownership

The parent review left four generic higher-categorical inputs without exact
owning targets. The packet proposes an ownership refinement within
EnhancedDerivedSheaves, retaining the actual cyclotomic application in HR.3.
Existing E0 and E5 packets define restricted straightening, operadic algebra
objects and presentable categories, but their statements do not supply all
the following contracts. Each request names its consuming nodes.

* **`EnhancedDerivedSheaves:E0`:** straightening/unstraightening for the finite
  poset nerves (Q(m)), its surviving subposet, (P(m)), their slices and
  products with an interval, with evaluation and naturality. Supply limits as
  coherent sections, their mapping-space universal property, and stable finite
  cubical contraction. The latter says that an augmented finite cube with
  equivalences in one direction is Cartesian; prove it by fibres, using the
  dual of HA 1.2.4.15. This specializes E0's existing enhancement scope.
* **`EnhancedDerivedSheaves:E3`:** coherent localization adjunctions, units,
  counits, mates and their composition/pasting laws. Supply the dual of its
  full-inclusion left-Kan theorem: right Kan values are limits over
  ((S\downarrow j)), with uniqueness and invariance of the total limit on
  categories and transformations. The empty, initial-object and unique-chain
  slices described above are required cases.
* **`EnhancedDerivedSheaves:E5:abstract`:** compatible monoidal localization
  (HA 2.2.1.9). For an accessible localization whose tensor satisfies
  (L(x\otimes y)\simeq L(Lx\otimes y)), construct the localized monoidal
  category, unit (L1), tensor (L(x\otimes y)), coherent nested-localization
  functors and lax monoidal right-adjoint inclusions. Supply both
  (operatorname{CAlg}(\lim D_S)\simeq\lim\operatorname{CAlg}(D_S)) for these
  varying monoidal categories, via operadic sections, and limits of algebras
  in a fixed category created on underlying objects (HA 3.2.2.1, 3.2.2.3).
  The fixed-category result alone does not prove the varying-category result.
* **`EnhancedDerivedSheaves:E5:presentability`:** coherent adjoint reversal
  between (mathrm{Pr}^R_{st}) and ((\mathrm{Pr}^L_{st})^{op}), and finite
  categorical limits of presentable stable categories with exact
  colimit-preserving functors. These are their (\mathrm{Cat}_\infty) limits;
  colimits and stability are componentwise. HTT 5.5.3.4, 5.5.3.5 and
  5.5.3.12–13 supply the source statements.
* **`DerivedDeRhamCohomology:DD.1`:** accessible exact finite-ideal Koszul
  completion, the reflective adjunction, generator/radical independence,
  coherent (L_I L_J\simeq L_{I+J}), tensor compatibility, completeness closed
  under limits, derived Nakayama, the zero unit-ideal category and the
  underlying-module comparison for completed E∞ algebras. These specialize
  DD.1's generic completion scope. EDS E4 owns the sheaf application, not a
  second generic construction.

This proposes a rescope of existing foundational stages, rather than placing
a second generic categorical theory inside the cyclotomic application. The
broader parent arbitrary-poset-site principle would additionally require
straightening in its site's size range and appropriate accessibility and
presentability hypotheses. The finite construction here verifies these for
the supplied accessible completion categories and does not establish that
broader extension.

## Coverage, acceptance and sources

All HR.3 targets have a route: the new index and imported arithmetic cover
intersections; the coherent diagram and localization-contract lemma cover the
actual coefficient categories and joint conservativity; the imported
morphism-level theorem covers right-Kan reduction and categorical descent;
the imported corollary and fracture nodes cover the object reconstruction and
its rational/prime pieces. The reconstruction and mapping-space nodes make
the inverse and full universal property usable by HR.4. The dependency graph
imports E0/E3/E5 and DD.1 without reversing their supplier direction.

The three new planets are **Cyclotomic descent diagram**, **Cyclotomic
reconstruction**, and **Cyclotomic descent mapping spaces**. With the parent's
two HR.3 planets, the assembled layer has five, within the six-planet limit.

Acceptance requires all 23 API statements and 11 definition/construction unit
tests above, naturality on morphisms, the two distinct algebra-limit
comparisons, and the exact supplier contracts. The bounded finite-index and
Kan-slice checks for (1\leq m\leq60) agree with the stated examples; they are
checks of combinatorial conventions, not proofs of categorical descent. The
packet checker reports no errors or warnings. The suggested file elaborates
at pinned Mathlib, with only its expected proof-placeholder warnings. Its
actual Lean signatures cover the finite index. Each missing derived/operadic
signature and test is instead recorded by name and mathematical statement in
the suggested file, with its missing carrier and supplier. Closing this gap
requires genuine enhanced APIs; an opaque carrier or a vacuous proposition
does not close it.

The public sources read on 5 October 2026 are Wagner,
[*q-Hodge complexes over the Habiro ring*, arXiv v2](https://arxiv.org/pdf/2510.04782v2),
§1.22(c)–(d) and §2.1–2.6, and Lurie's author PDFs of
[*Higher Algebra*, 18 September 2017](https://www.math.ias.edu/~lurie/papers/HA.pdf)
and [*Higher Topos Theory*, 9 April 2017](https://www.math.ias.edu/~lurie/papers/HTT.pdf).
The packet records their checksums and exact reading bounds. HA 1.2.4.15 and
2.2.1.9 and the cited HTT presentability/limit results were read with their
proofs. HTT 3.2.0.1 and HA 3.2.2.1 were read at statement level; their long
proofs were not audited here. No source text needed for the finite application
was inaccessible. The parent remains the source for the companion-paper
cyclotomic arithmetic and its reviewed source corrections; those nodes and
findings are not duplicated. No additional source mistake was established by
this pass.
