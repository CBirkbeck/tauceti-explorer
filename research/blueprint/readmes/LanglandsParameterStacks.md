# The stack of L-parameters, its invariant theory and its perfect complexes

*A blueprint packet for the Tau Ceti Atlas roadmap `LanglandsParameterStacks`,
layers LP0, LP1, LP2 with its three substages, LP3 and LP4. Written by Claude Code,
session `cc-7b31c4`, 24 September 2026, for issue #767.*

*Built on the accepted, independently reviewed integrated decomposition*
`data/decompositions/LanglandsParameterStacks.json` *(review*
`independent-review-REVIEW-EXT-05-EXT-02`*, accepted 16 September 2026): its sixteen*
*node ids, statements, hypotheses, proof steps, acceptance items and locators are kept*
*unchanged. Seventeen nodes are new.*

## What this document is

The stack of L-parameters and its invariant theory: layers LP0, LP1, LP2 with its three
substages, LP3 and LP4. THIRTY-THREE NODES, of which the SIXTEEN of the accepted,
independently reviewed integrated decomposition
data/decompositions/LanglandsParameterStacks.json are kept with their ids, statements,
hypotheses, proof steps, acceptance items, locators and excerpts UNCHANGED, and to which
this packet adds prerequisites resolved to the pinned libraries or to a named supplier,
planets, per-layer coverage, and API outlines with unit tests for the definitions and
constructions. The SEVENTEEN new nodes come from reading, in this session, five bodies
of material the decomposition had located but not read. FS VIII.2 IN FULL gives the
cotangent complex of the parameter stack as Weil-group cohomology with its Poincare
duality, the singularity scheme Sing_{X/S} with the singular-support criterion for
perfectness, the computation of Sing for the parameter stack, the banal case where the
singularity fibre is the nilpotent cone, and the source's own statement that in the non-
banal case it is NOT SURE the resulting notion of nilpotent singular support is the
correct one. The PROOF of Proposition VIII.3.8 gives the reconstruction of a semisimple
cocycle and isolates the continuity step as the single imported input. The PROOF of
Theorem VIII.4.1 gives the invariant function of an excursion datum, the cartesian
reindexing square, the fusion argument for multiplicativity and the unit insertion. FS
VIII.5 IN FULL gives the separatedness of the good-filtration t-structure, the good
filtration of the cocycle algebras, and Propositions VIII.5.10 to VIII.5.13 - the
equivariant vector-bundle machinery that IS the proof of Theorem VIII.5.2, including the
equivalence whose backwards direction shows the hypothesis on pi_1(G-hat)_tors is
NECESSARY - together with the stock-taking that the machinery already settles the tame
and compact-Riemann-surface cases. And CHAPTER X IN FULL answers the decomposition's
open question: the integral spectral action DOES carry the restriction on
pi_1(G-hat)_tors, stated in the first line of Theorem X.0.1, and the dependence runs
from Chapter X back to this roadmap, since X.0.2's proof is finished by combining X.3
with Theorem VIII.5.1. Thirty baseline declarations, all read at the pins, including six
the reviewed audit AUDIT-21 pointed to and that a name search would have missed: the
inertia subgroup of a valuation subring with its own TODO for the wild filtration, the
Stacks 0BR8 homeomorphism criterion, regular sequences as the available form of the lci
condition, the naive cotangent complex, Tau Ceti's continuous cohomology as the abelian
half of the cocycle theory, and its weylModule, which is the Schur-Weyl image of a Young
symmetriser and NOT the induced module LP3 needs. Eleven gaps. Fifteen requests. Three
structural findings, all of them duplicate or direction findings that AUDIT-21's own
records made visible.

Nothing here is formalised. Every node carries `implementationStatus: "unchecked"`,
no Lean was compiled for this job, and the suggested file is a set of signatures and
`example` statements, not a development.

## The sources, and how they were read

### Geometrization of the local Langlands correspondence

- Laurent Fargues, Peter Scholze.
- `https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf`
- SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`, accessed 2026-09-24.
- Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.

- VIII introduction and VIII.1, printed pp. 277-281, re-read: Theorems VIII.0.1 and
  VIII.0.2, the standard-versus-cyclotomic action remark, the proof of Theorem VIII.1.3
  including the discretization, the binomial-series extension and the dimension bound,
  and Lemma VIII.1.4 with its proof IN FULL.
- VIII.2 THE SINGULARITIES OF THE MODULI SPACE, printed pp. 281-285, READ IN FULL - the
  integrated decomposition located these statements but did not read them: Proposition
  VIII.2.1 with its proof, Proposition VIII.2.2 with its proof, Corollary VIII.2.3,
  Section VIII.2.1's unipotent monodromy morphism, Definition VIII.2.6, Theorem
  VIII.2.7, Definition VIII.2.8, Theorem VIII.2.9 with its proof, the computation of
  Sing for the parameter stack, Proposition VIII.2.11 with its proof, and Remarks
  VIII.2.12 and VIII.2.13.
- VIII.3, printed pp. 285-290, READ IN FULL including the proofs: Section VIII.3.1 on
  geometric points, Lemma VIII.3.3 with its proof, Section VIII.3.2's presentation with
  the Haboush argument, Definition VIII.3.4, Proposition VIII.3.7 with its relations and
  ITS PROOF and the discussion of the l-torsion-free quotient, and Proposition VIII.3.8
  WITH ITS PROOF - which the integrated decomposition recorded as unread.
- VIII.4, printed pp. 290-293, READ IN FULL including the proof of Theorem VIII.4.1 -
  which the integrated decomposition recorded as unread: Definition VIII.4.2, the
  relation S_D = S_{D'}, the invariant function f(V,alpha,beta), the cartesian
  reindexing square, the fusion argument for multiplicativity, the unit-insertion
  identification and the maps Theta_n, and Corollary VIII.4.3.
- VIII.5, printed pp. 293-301, READ IN FULL - the integrated decomposition recorded the
  proof of Theorem VIII.5.2 as unread: Theorems VIII.5.1 and VIII.5.2 with the
  reduction, the good-filtration t-structure and Proposition VIII.5.5 with its proof,
  Theorem VIII.5.6 and Corollary VIII.5.7 with its proof, Section VIII.5.2's definition
  of Perf^ind, Propositions VIII.5.10, VIII.5.11, VIII.5.12 and VIII.5.13 with their
  proofs, and the stock-taking remark about compact Riemann surfaces and tame
  parameters.
- Chapter X, printed pp. 339-350, READ IN FULL - the integrated decomposition recorded
  it as unread and asked whether the integral spectral action imposes the restriction on
  pi_1(G-hat)_tors: Theorems X.0.1 and X.0.2 with the compact-support definition, X.1.1
  and X.1.2 with their proofs, Corollary X.1.3, Conjecture X.1.4 and its remarks,
  Definition X.2.1 and the elliptic discussion, and Propositions X.3.1 to X.3.4 with the
  closing combination with Theorem VIII.5.1.

### Moduli of Langlands parameters

- Jean-Francois Dat, David Helm, Robert Kurinczuk, Gilbert Moss.
- `https://arxiv.org/abs/2009.06708`
- SHA-256 `70b647bb5fbf924f20784a5084f7f38c9a2faf88e04690f38d76fc0be2a3213c`, accessed 2026-09-16.
- arXiv:2009.06708v3 [math.NT], 29 February 2024; library PDF, 91 pages. Printed page = PDF page.

- Introduction, printed pp. 2-3 (the three definitions of a parameter over Q_l-bar and
  the GL_2 non-flatness example for the Bellovin-Gee / Booher-Patrikis spaces)
- Theorem 1.3 with its dimension caveat and Theorem 1.4, printed p. 6
- BP-LanglandsParameterStacks, 24 September 2026: NOTHING FURTHER was read in this
  session. The integrated decomposition's reading - abstract, table of contents,
  introduction and Theorems 1.3 and 1.4 - is carried forward unchanged, and the
  dimension-normalisation comparison it records is kept as it stands.

## What this packet does not plan, and why

Material read here that belongs elsewhere is left to its owner (PROTOCOL.md §15).

| Statement | Where | Owner |
| --- | --- | --- |
| The local Weil group, its inertia and wild inertia | — | `tauceti:TauCetiRoadmap/ClassFieldTheory` layer 9 |
| FS VIII.2.4 and VIII.2.5, the Weil–Deligne moduli | printed 282–283 | not planned; its input `[Zhu20, 3.1.8]` is unread |
| FS VIII.4.3 and IX.4.1, the parameter of a Schur object | printed 292, 327 | `ExcursionOperatorsAndSpectralAction:ES5` |
| FS IX.5–IX.7 and X.1.3–X.2, the Hecke and spectral-action side | printed 327–348 | `ExcursionOperatorsAndSpectralAction` |
| Nonabelian `H¹` with unipotent coefficients | — | `AnabelianGeometryAndNonabelianChabauty:NC.3` |
| Integral Weyl and dual-Weyl modules | — | `PotentialAutomorphyInfrastructure:PA.1` |
| The `Z[1/p]` model of the cocycle schemes | — | `SmoothRepresentationsOfLocalGroups:SR.6` |

## LP0 — Weil groups and continuous cocycles

*Coverage: **partial**. 4 nodes.*

L-parameters as CONDENSED 1-cocycles with the condensed coefficient convention; the
cocycle interface - scalar extension, restriction, twisted conjugation and sections -
that the stage text asks for; the discretisation W inside W_E/P with the tame relation
and the unique-extension theorem; and the change-of-choice comparison, which the stage
text calls part of the interface and which the source does not state.

### FS VIII.1.1: L-parameters as condensed 1-cocycles, and the condensed coefficient convention

`LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters` — *definition* · planet **L-parameters as condensed cocycles**

**Statement.**

Fix l != p, the pinned dual group G-hat over Z_l with its STANDARD (pinning-compatible)
W_E-action, factoring over a fixed finite quotient Q. For a Z_l-algebra Lambda, regard
Lambda as the condensed Z_l-algebra Lambda_disc tensor_{Z_l,disc} Z_l, whose value on a
profinite S is the ring of maps S -> Lambda taking values in a finite-type sub-Z_l-
module and continuous. An L-parameter with coefficients in Lambda is a SECTION phi : W_E
-> G-hat(Lambda) semidirect W_E of the projection of condensed groups, equivalently a
condensed 1-COCYCLE phi : W_E -> G-hat(Lambda) for the given action, equivalently a map
W_E -> G-hat(Lambda) semidirect Q lifting W_E -> Q.

**Hypotheses and warnings.**

- The action used is the STANDARD algebraic action compatible with the pinning, not the
  cyclotomically twisted one; Fargues-Scholze note the difference disappears after base
  change to Z_l[sqrt q] and that all results transfer by descent along Z_l[sqrt q]/Z_l
- Lambda is condensed as Lambda_disc tensor_{Z_l,disc} Z_l; for Lambda = Q_l-bar this
  gives Lambda(S) = colim over finite L|Q_l of Cont(S,L)
- A 1-cocycle for a NONTRIVIAL action is not a group homomorphism; the roadmap's warning
  is confirmed by the source's phrasing in terms of sections of the L-group projection
- Concretely, for G-hat -> GL_N a closed embedding, the condition is that the associated
  map W_E -> GL_N(Lambda) is continuous, i.e. the matrix coefficients of its restriction
  to I_E take values in finite-type Z_l-modules and are continuous

**Proof outline.**

1. Fargues-Scholze give the three equivalent descriptions (section of the L-group
   projection; condensed 1-cocycle; lift along W_E -> Q) and the concrete matrix-
   coefficient criterion.
2. The equivalence of the section and cocycle descriptions is the standard translation
   for a semidirect product.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `LParameter` | data | A section phi : W_E -> G-hat(Lambda) semidirect W_E of the projection of condensed groups; equivalently a condensed 1-cocycle. |
| `LParameter.asCocycle` | equivalence | The section and cocycle descriptions agree, by the standard translation for a semidirect product. |
| `LParameter.asLift` | equivalence | Equivalently a map W_E -> G-hat(Lambda) semidirect Q lifting W_E -> Q, since the action factors over the finite quotient Q. |
| `condensedCoefficients` | structure | Lambda is made condensed as Lambda_disc tensor_{Z_l,disc} Z_l; its value on a profinite S is the maps S -> Lambda with values in a finite-type sub-Z_l-module, continuous. |
| `LParameter.matrixCriterion` | characterisation | For a closed embedding G-hat -> GL_N, the condition is that W_E -> GL_N(Lambda) is continuous with matrix coefficients of the restriction to I_E in finite-type Z_l-modules. |
| `standardAction` | structure | The action is the STANDARD pinning-compatible one, not the cyclotomically twisted one; the difference disappears after base change to Z_l[sqrt q]. |

**Where it is used.**

- `LanglandsParameterStacks:LP0/discretization-and-unique-extension` — the unique-extension theorem is about these cocycles
- `LanglandsParameterStacks:LP1/representability-flatness-and-lci` — the scheme represents this functor
- `ExcursionOperatorsAndSpectralAction:ES5` — the parameter attached to a Schur-irreducible object is one of these

**Unit tests.**

- `not_a_homomorphism` — For a nontrivial action a homomorphism W_E -> G-hat(Lambda) is not a cocycle; the two notions must not be conflated.
- `torus_cases` — The three descriptions agree for a split torus and for a nonsplit torus.
- `l_adic_continuity` — For Lambda = Q-bar_l the condensed condition is the usual l-adic continuity.
- `standard_not_twisted` — The action is the standard one; using the cyclotomically twisted action changes the scheme, and the comparison is a descent along Z_l[sqrt q]/Z_l.

**Acceptance.**

- Check the three descriptions agree for a split torus and for a nonsplit torus
- Check that for Lambda = Q_l-bar the condensed structure gives the usual l-adic continuity
- Check that a homomorphism W_E -> G-hat(Lambda) is not in general a cocycle when the action is nontrivial

**Prerequisites.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:Representation`, `mathlib:MonoidHom`, `mathlib:Subgroup`, `mathlib:CommRing`, `tauceti:TauCeti.AbsoluteGaloisGroup`

**Sources.**

- *Definition VIII.1.1, printed p. 278.* “An L-parameter for G, with coefficients in Lambda, is a section phi : W_E -> G-hat(Lambda) semidirect W_E of the natural map of condensed groups G-hat(Lambda) semidirect W_E -> W_E. Equivalently, an L-parameter for G with coefficients in Lambda is a (condensed) 1-cocycle phi : W_E -> G-hat(Lambda) for the given W_E-action on G-hat.”
  Both descriptions, in the source's own words.
- *VIII.1.1, printed p. 278.* “Now let Lambda be any Z_l-algebra. As in the last chapter, we regard it as a condensed Z_l-algebra, as Lambda_disc tensor_{Z_l,disc} Z_l. Its value on a profinite set S is the ring of maps S -> Lambda that take values in a sub-Z_l-module of finite type and are continuous.”
  The coefficient convention, which is what makes 'condensed cocycle' a finiteness
  condition.
- *VIII introduction, printed p. 277.* “We get the dual group G-hat/Z_l, which we endow with its usual 'algebraic' action by W_E; the action thus factors over a finite quotient Q of W_E, and we fix such a quotient Q of W_E. (The difference to the cyclotomically twisted W_E-action disappears after base change to Z_l[sqrt q], and we could thus obtain analogues of all results below for this other action by a simple ...”
  Fixes which action is used and records the relation to the Satake-normalized one.
  The excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.

### FS VIII.1.3 (first half): the discrete dense subgroup W and the unique extension of cocycles

`LanglandsParameterStacks:LP0/discretization-and-unique-extension` — *theorem* · planet **Discretisation and unique extension**

**Statement.**

Fix a quotient W_E -> W'_E by an open subgroup of the wild inertia P_E such that the
W_E-action on G-hat factors over W'_E. Inside W'_E take the discrete dense subgroup W
generated by the image of P_E, a CHOSEN generator tau of the tame inertia and a CHOSEN
Frobenius sigma; then 0 -> I -> W -> sigma^Z -> 0 with 0 -> P -> I -> tau^{Z[1/p]} -> 0,
P a finite p-group, and in W/P the relation sigma^{-1} tau sigma = tau^q holds. Any
condensed 1-cocycle W'_E -> G-hat(Lambda) is determined by its restriction to W (since
G-hat(Lambda) is quasiseparated and W is dense), and conversely every 1-cocycle W ->
G-hat(Lambda) extends UNIQUELY to a condensed 1-cocycle on W'_E.

**Hypotheses and warnings.**

- tau and sigma are CHOICES; the roadmap asks for a change-of-choice comparison, which
  Fargues-Scholze do not spell out
- The relation is stated as sigma^{-1} tau sigma = tau^q in W/P; the opposite convention
  would be sigma tau sigma^{-1} = tau^q, and the source's orientation must be preserved
- The uniqueness of the extension uses that G-hat(Lambda) is QUASISEPARATED and W is
  dense in W'_E
- The existence proof reduces, after a finite extension of E, to the case of trivial
  action and P = 1, then to GL_N, then to: for A in GL_N(Lambda) conjugate to A^q, the
  map n -> A^n on Z extends uniquely to Z-hat^p. The assumption forces all eigenvalues
  at all geometric points of Spec Lambda to be roots of unity of order prime to p; after
  replacing A by a prime-to-p power one reduces to A UNIPOTENT and uses the binomial
  series A^n = sum_{i>=0} binom(n,i)(A-1)^i, which converges because A - 1 is nilpotent
  and defines a map Z_l -> GL_N(Lambda)

**Proof outline.**

1. Fargues-Scholze construct W and record the two exact sequences and the tame relation.
2. Determination by the restriction to W is from density plus quasiseparatedness.
3. For the extension: reduce to trivial action and P = 1 by a finite extension of E;
   embed G-hat into GL_N; reduce to extending n -> A^n from Z to Z-hat^p; use the
   eigenvalue argument to reduce to A unipotent; conclude with the binomial series, which
   gives Z_l -> GL_N(Lambda) and hence Z-hat^p -> Z_l -> GL_N(Lambda).

**Acceptance.**

- Check the binomial-series extension explicitly for a single unipotent Jordan block over F_l
- Check the tame relation orientation on an unramified GL_2 cocycle
- Check independence of the choice of tau and sigma as an isomorphism of moduli functors, which the completion contract requires and the source does not spell out

**Prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Condensed`, `mathlib:Subgroup`, `mathlib:FreeGroup`, `mathlib:ValuationSubring.inertiaSubgroup`, `mathlib:Module.Free`, `mathlib:Representation`

**Sources.**

- *Proof of Theorem VIII.1.3, printed p. 279.* “Inside W'_E, we look at the discrete dense subgroup W in W'_E generated by the image of P_E, a choice of generator of the tame inertia tau, and a choice of Frobenius sigma. Thus, W sits in an exact sequence 0 -> I -> W -> sigma^Z -> 0 where I in turn sits in an exact sequence 0 -> P -> I -> tau^{Z[1/p]} -> 0 where P is a finite p-group. Moreover, in W/P, the elements tau and ...”
  The discretization and the exact orientation of the tame relation. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.
- *Proof of Theorem VIII.1.3, printed p. 280.* “But then n -> A^n extends to a continuous map n -> A^n = (1 + (A-1))^n = sum_{i>=0} binom(n,i) (A-1)^i, defining a map Z_l -> GL_N(Lambda) (and hence Z-hat^p -> Z_l -> GL_N(Lambda)).”
  The topological unipotent binomial-series argument the stage text names, with its
  coefficients.

### Restriction, scalar extension, twisted conjugation and sections: the interface of Z^1

`LanglandsParameterStacks:LP0/functoriality-of-cocycles` — *construction* · planet **The cocycle interface**

**Statement.**

The assignment Lambda -> {condensed 1-cocycles phi : W_E -> G-hat(Lambda)} carries the
operations the stage text names. SCALAR EXTENSION: a map Lambda -> Lambda' of Z_l-
algebras sends a cocycle to a cocycle, functorially, so Z^1(W_E,G-hat) is a functor on
Z_l-algebras and this is what makes it a moduli problem at all. RESTRICTION: for a
closed subgroup or a quotient H of W_E over which the datum makes sense - in particular
for the quotients W_E -> W_E/P and for the discrete dense W inside W_E/P - restriction
of cocycles is a map of functors. TWISTED CONJUGATION: G-hat(Lambda) acts on cocycles by
(g . phi)(w) = g phi(w) (w . g)^{-1}, which is the action whose quotient stack is the
stack of parameters; it is NOT the naive conjugation unless the action of W_E on G-hat
is trivial. SECTIONS: a cocycle is the same as a section of G-hat(Lambda) semidirect W_E
-> W_E, and the three descriptions of Definition VIII.1.1 are exchanged by these
operations compatibly.

**Hypotheses and warnings.**

- Twisted conjugation, not conjugation: the twist by the W_E-action on G-hat is what
  makes the quotient the stack of parameters and what makes the invariant ring the right
  coarse object. The roadmap asks for it by name
- Fargues-Scholze state the three descriptions and use the operations freely; NO
  functoriality statement was located as a numbered statement in anything read, so this
  node is an interface the roadmap demands rather than a theorem of the source
- Restriction along W -> W_E/P is an ISOMORPHISM of functors, which is the unique-
  extension theorem and is the next node, not part of this one
- Scalar extension is along Z_l-algebra maps; the condensed structure on the
  coefficients is transported with it

**Proof outline.**

1. Define the functor on Z_l-algebras and check that a map of algebras sends condensed
   cocycles to condensed cocycles.
2. Define twisted conjugation and check the cocycle identity is preserved.
3. Define restriction along a map of groups compatible with the actions, and check the
   three descriptions are exchanged compatibly.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Z1` | data | The functor Lambda -> condensed 1-cocycles W_E -> G-hat(Lambda). |
| `Z1.baseChange` | functoriality | Scalar extension along Lambda -> Lambda'. |
| `Z1.restrict` | functoriality | Restriction along a compatible map of groups, in particular W -> W_E/P -> W_E. |
| `twistedConjugation` | data | (g . phi)(w) = g phi(w) (w . g)^{-1}; the action whose quotient is the stack of parameters. |
| `twistedConjugation.isConjugation` | example | For a trivial W_E-action this is ordinary conjugation; in general it is not. |
| `sectionEquiv` | equivalence | Cocycles are sections of G-hat(Lambda) semidirect W_E -> W_E, compatibly with all of the above. |

**Where it is used.**

- `LanglandsParameterStacks:LP1/representability-flatness-and-lci` — the scheme represents this functor
- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel` — the decomposition is by the restriction of a cocycle to the wild inertia
- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism` — the invariants are taken for twisted conjugation

**Unit tests.**

- `twisted_not_naive` — For a nontrivial action the twisted action differs from conjugation; using conjugation gives the wrong quotient.
- `base_change_functorial` — Scalar extension is functorial and compatible with twisted conjugation.
- `restriction_is_a_map` — Restriction along W -> W_E/P is a map of functors; that it is an isomorphism is a separate theorem.
- `sections_match` — The section and cocycle descriptions are exchanged compatibly with base change and restriction.

**Acceptance.**

- Check that twisted conjugation reduces to conjugation exactly when the action is trivial
- Check that scalar extension is functorial and that the condensed structure is transported
- Check that restriction along W -> W_E/P is a map of functors, before asking whether it is an isomorphism

**Prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:MonoidHom`, `mathlib:Subgroup`, `mathlib:CommRing`, `mathlib:Condensed`

**Sources.**

- *Definition VIII.1.1, printed p. 278.* “An L-parameter for G, with coefficients in Lambda, is a section phi : W_E -> G-hat(Lambda) semidirect W_E of the natural map of condensed groups G-hat(Lambda) semidirect W_E -> W_E. Equivalently, an L-parameter for G with coefficients in Lambda is a (condensed) 1-cocycle phi : W_E -> G-hat(Lambda) for the given W_E-action on G-hat.”
  The two descriptions the operations of this node move between. Read directly from
  Geometrization.pdf in this session; the hash reproduces the recorded value. No
  functoriality statement is made in the source, and this node says so.
- *Theorem VIII.0.1, printed p. 277.* “There is a scheme Z^1(W_E,G-hat) over Z_l whose Lambda-valued points, for a Z_l-algebra Lambda, are the condensed 1-cocycles phi : W_E -> G-hat(Lambda).”
  That the assignment is a FUNCTOR on Z_l-algebras is presupposed by the
  representability statement; scalar extension is exactly that functoriality.

### The choices of tame generator and Frobenius, and why the result does not depend on them

`LanglandsParameterStacks:LP0/change-of-discretization` — *comparison*

**Statement.**

The discretisation W inside W_E/P is built from the image of P_E, a CHOSEN generator tau
of the tame inertia and a CHOSEN Frobenius sigma. Fargues-Scholze fix these choices once
and never revisit them. The independence of the construction is nevertheless implicit
and can be stated exactly: Z^1(W_E/P,G-hat) is DEFINED WITHOUT REFERENCE TO W, and the
restriction map Z^1(W_E/P,G-hat) -> Z^1(W,G-hat) is an isomorphism of functors by the
unique-extension theorem; therefore any two discretisations W and W' give canonically
isomorphic affine schemes, the isomorphism being restriction-then-extension. The stage
text calls a change-of-choice comparison 'part of the interface', and this node is that
statement. Fargues-Scholze make the same point for the excursion algebra: the l-torsion-
free quotient of Exc(W,G-hat) has a universal property stated over W_E/P, and they
conclude that IT IS INDEPENDENT OF THE DISCRETIZATION W of W_E/P.

**Hypotheses and warnings.**

- No explicit comparison isomorphism of moduli functors is stated in anything read; the
  statement above is assembled from the unique-extension theorem and is recorded as an
  obligation of this layer, not as a quoted theorem
- The independence is CANONICAL, because both restrictions are isomorphisms onto the
  same functor; there is no choice of comparison to make
- For the excursion algebra Fargues-Scholze state the independence explicitly, but only
  for the l-TORSION-FREE QUOTIENT, and they say they do not know whether passing to that
  quotient is necessary. So even there the independence of Exc(W,G-hat) itself is open
- The tame relation is sigma^{-1} tau sigma = tau^q in W/P; the opposite convention
  sigma tau sigma^{-1} = tau^q is the other normalisation and the source's orientation
  must be preserved through any change of choice

**Proof outline.**

1. Note that Z^1(W_E/P,G-hat) is defined without reference to any discretisation.
2. Apply the unique-extension theorem to both W and W' to get isomorphisms onto
   Z^1(W_E/P,G-hat).
3. Compose to get the canonical comparison, and check it respects twisted conjugation,
   hence descends to the quotient stack and to the invariants.
4. For the excursion algebra, quote the source's own independence statement for the
   l-torsion-free quotient.

**Acceptance.**

- Check that the comparison is canonical and requires no further choice
- Check that it respects twisted conjugation and the invariants
- Check that the tame relation's orientation is preserved
- Check that the source's independence statement for Exc is only for the l-torsion-free quotient

**Prerequisites.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Subgroup`, `mathlib:FreeGroup`, `mathlib:CommRing`

**Sources.**

- *Proof of Theorem VIII.1.3, printed p. 279.* “a choice of generator of the tame inertia tau, and a choice of Frobenius sigma”
  The choices, made once and never revisited. Read directly from the hash-verified PDF
  in this session.
- *After Proposition VIII.3.7, printed p. 289.* “In particular, the l-torsion free quotient of Exc(W,G-hat) is independent of the discretization W of W_E/P. We do not know whether it is necessary to pass to the l-torsion free quotient for the final assertion.”
  The only independence statement the source makes, and its own caveat.
- *Theorem VIII.0.1, printed p. 277.* “To prove the theorem, following [DHKM20] and [Zhu20] we define discrete dense subgroups W inside W_E/P by discretizing the tame inertia, and the restriction Z^1(W_E/P,G-hat) -> Z^1(W,G-hat) is an isomorphism, where the latter is clearly an affine scheme.”
  That the restriction is an isomorphism, which is what makes the comparison
  canonical.

**What remains in this layer.**

- The local Weil group itself, with its inertia and wild inertia and their topologies,
  is taken as given. AUDIT-21 records that NEITHER LIBRARY HAS A WEIL GROUP: Mathlib has
  the decomposition and inertia subgroups of a valuation subring with an explicit TODO
  for higher ramification groups, so no wild inertia, and Tau Ceti has the absolute
  Galois group and ramification groups for FUNCTION fields only. It is requested from
  the upstream class-field-theory roadmap, which AUDIT-21 names as the atlas's owner.
- The functoriality statements of the cocycle interface are NOT numbered statements of
  the source; they are the interface the stage text demands and the packet says so.
- The change-of-choice comparison is assembled from the unique-extension theorem and is
  not quoted; Fargues-Scholze fix tau and sigma once and never revisit them.
- Nonabelian 1-cocycles with twisted conjugation are absent from both libraries;
  AUDIT-21 records that the substantial abelian theory - groupCohomology and Tau Ceti's
  continuous cohomology with inflation, restriction, corestriction, Shapiro and cup
  products - is all abelian-coefficient.

## LP1 — Representability and local complete intersection geometry

*Coverage: **partial**. 8 nodes.*

The decomposition of the parameter space by the kernel on wild inertia;
representability, flatness and the relative complete intersection of dimension dim G;
the dimension bound Lemma VIII.1.4; the independent construction of Dat-Helm-Kurinczuk-
Moss with its dimension-normalisation difference; the discreteness of the derived
cocycle algebra; the cotangent complex as Weil-group cohomology with its duality; the
singularity scheme and the singular-support criterion for perfectness; and the banal
case, where the singularity fibre is the nilpotent cone.

### FS VIII.1.3 (decomposition): the parameter space splits into open and closed pieces by the kernel on wild inertia

`LanglandsParameterStacks:LP1/decomposition-by-wild-kernel` — *lemma*

**Statement.**

Any condensed 1-cocycle phi : W_E -> G-hat(Lambda) is trivial on an open subgroup of the
wild inertia P_E, and P_E acts on G-hat through a finite quotient. For gamma in P_E
acting trivially on G-hat, the locus where phi(gamma) = 1 is OPEN AND CLOSED. Hence the
moduli space of L-parameters decomposes as a disjoint union of open and closed subspaces
according to the kernel of phi on P_E, i.e. Z^1(W_E,G-hat) is the union of the open and
closed affine subschemes Z^1(W_E/P,G-hat) as P runs through open subgroups of the wild
inertia.

**Hypotheses and warnings.**

- The open-and-closed claim is proved by embedding G-hat into GL_N and using that A = 1
  is a CONNECTED COMPONENT of the locus of A in GL_N with A^{p^r} = 1, checked by
  observing that the tangent space at A = 1 is trivial
- Triviality on an open subgroup of P_E is a consequence of the condensed/continuity
  condition; it does NOT mean the parameter factors through a finite quotient of W_E,
  exactly as the roadmap warns
- The union over P is not quasicompact; each piece is of finite type but the whole is
  only a disjoint union of affine schemes of finite type

**Proof outline.**

1. Use the condensed condition to see that phi|_{P_E} is trivial on an open subgroup.
2. For gamma in P_E acting trivially on G-hat, embed G-hat into GL_N and use the
   connected-component/tangent-space argument to see that {phi(gamma) = 1} is open and
   closed.
3. Conclude the decomposition by the kernel of phi on P_E.

**Acceptance.**

- Check the open-and-closed statement for G-hat = GL_1 and a nontrivial finite wild image
- Check that a parameter with finite wild ramification need not factor through a finite quotient of W_E
- Check non-quasicompactness of the union

**Prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Subgroup`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Condensed`

**Sources.**

- *Proof of Theorem VIII.1.3, printed p. 279.* “Moreover, for any gamma in P_E acting trivially on G-hat, the locus where phi(gamma) = 1 is open and closed: Taking a closed embedding G-hat -> GL_N, this follows from A = 1 being a connected component of the locus of all A in GL_N such that A^{p^r} = 1, as can be checked by observing that the tangent space at A = 1 is trivial.”
  The exact argument for the open-and-closed decomposition.
- *Theorem VIII.0.1, printed p. 277.* “The scheme Z^1(W_E,G-hat) is a union of open and closed affine subschemes Z^1(W_E/P,G-hat) as P runs through open subgroups of the wild inertia subgroup of W_E, and each Z^1(W_E/P,G-hat) is a flat local complete intersection over Z_l of dimension dim G.”
  The global structure statement.

### FS VIII.1.3: Z^1(W_E,G-hat) is a disjoint union of finite-type affine schemes, flat and a relative complete intersection of dimension dim G

`LanglandsParameterStacks:LP1/representability-flatness-and-lci` — *theorem* · planet **Representability, flatness and the lci property**

**Statement.**

There is a scheme Z^1(W_E,G-hat) over Z_l parametrizing L-parameters, a disjoint union
of affine schemes of finite type over Z_l, FLAT and a RELATIVE COMPLETE INTERSECTION of
dimension dim G = dim G-hat. Equivalently, the Artin stack [X/G-hat] with X =
Z^1(W,G-hat) is flat and a relative complete intersection of dimension 0 over Z_l.

**Hypotheses and warnings.**

- The dimension is the RELATIVE dimension over Z_l; compare the absolute-dimension
  normalization in Dat-Helm-Kurinczuk-Moss (see the separate node)
- The deformation theory used is: for Lambda a field, the obstruction group is H^2(W,
  g-hat tensor_{Z_l} Lambda), the tangent space H^1, the infinitesimal automorphisms
  H^0, all with the W-action twisted by the local 1-cocycle phi
- The numerical input is that the PRIME-TO-P cohomological dimension of W is 2 and the
  Euler characteristic of any representation is 0; this reduces everything to bounding
  all fibres of [X/G-hat] -> Spec Z_l by dimension at most 0
- X is naturally defined over Z[1/p] and the discretization W is independent of l, so it
  suffices to bound the fibre over F_l-bar and then use constructibility of fibre
  dimension
- The characteristic-l bound uses that the stack of 1-cocycles of the prime-to-l inertia
  I^l is smooth with each component a quotient of Spec F_l-bar by a centralizer
  C_{phi^{I^l}} in G-hat, a smooth group whose identity component is reductive by [PY02,
  Theorem 2.1]

**Proof outline.**

1. Decompose by the wild kernel and fix W_E -> W'_E; identify Z^1(W'_E,G-hat) with
   Z^1(W,G-hat), an affine scheme of finite type since W is discrete and finitely
   generated.
2. Pass to the Artin stack [X/G-hat] and compute its deformation theory with the twisted
   W-action.
3. Use cd_{p'}(W) = 2 and vanishing Euler characteristic to reduce to a fibre-dimension
   bound.
4. Reduce to the fibre over F_l-bar by constructibility; map to the stack of
   I^l-cocycles, which is smooth with reductive-identity-component centralizers; fix
   phi^{I^l} and bound the closed subscheme X_{phi^{I^l}} by dim C_{phi^{I^l}}, mapping
   with finite fibres to maps W_E/I^l = Z_l semidirect sigma^Z -> C-tilde/phi^{I^l}(I^l).

**Acceptance.**

- Check flatness for G = GL_2 and l dividing q^2 - 1, the case where the naive Bellovin-Gee/Booher-Patrikis space fails to be flat
- Check the dimension dim G on a split torus
- Check the deformation-theoretic Euler characteristic computation for W

**Prerequisites.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Flat`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:MvPolynomial`, `mathlib:CommRing`

**Sources.**

- *Theorem VIII.1.3, printed p. 279.* “There is a scheme Z^1(W_E,G-hat) over Z_l parametrizing L-parameters for G, which is a disjoint union of affine schemes of finite type over Z_l. It is flat and a relative complete intersection of dimension dim G = dim G-hat.”
  Exact statement, with the relative-dimension normalization.
- *Proof of Theorem VIII.1.3, printed p. 280.* “Now note that by direct computation the prime-to-p cohomological dimension of W is 2, and the Euler characteristic of any representation is equal to 0. Thus, this analysis shows that we only have to prove that all fibres of [X/G-hat] -> Spec Z_l are of dimension at most 0.”
  The numerical heart of the proof.
- *Proof of Theorem VIII.1.3, printed p. 280.* “By deformation theory, that stack is smooth and each connected component is a quotient of Spec F_l-bar by the centralizer group C_{phi^{I^l}} in G-hat_{F_l-bar}, which is a smooth group, whose identity component is reductive by [PY02, Theorem 2.1].”
  The characteristic-l input, naming the imported reductivity-of-centralizers theorem.

### Dat-Helm-Kurinczuk-Moss: the independent construction, and a normalisation difference in the stated dimension

`LanglandsParameterStacks:LP1/independent-source-and-dimension-normalisation` — *comparison*

**Statement.**

Dat-Helm-Kurinczuk-Moss construct a moduli space of Langlands parameters W_F -> ^L G for
G-hat a split reductive group scheme over Z[1/p] with a W_F-action, show it is locally
of finite type and flat over Z[1/p] and a REDUCED local complete intersection,
parameterize connected and irreducible components, and study the GIT quotient by G-hat.
Their Theorem 1.3 states that Z^1(W_F^0, G-hat) is SYNTOMIC (flat and locally a complete
intersection) over Z^1(P_F,G-hat), generically smooth, of PURE ABSOLUTE DIMENSION
dim(G-hat), with the explicit caveat that dim G-hat = dim G + 1 whenever G-hat is the
Langlands dual of a reductive G over F, since the base scheme of G-hat has dimension 1.
Theorem 1.4: if the centre of G-hat is smooth, all summands in their decomposition are
connected.

**Hypotheses and warnings.**

- Their base is Z[1/p] rather than Z_l, and the flatness is over Z[1/p]
- Their dimension statement is ABSOLUTE and equals dim G + 1; Fargues-Scholze's Theorem
  VIII.1.3 states RELATIVE dimension dim G over Z_l. These agree once the one-
  dimensional base is accounted for, and Dat-Helm-Kurinczuk-Moss flag the discrepancy
  explicitly. Any restatement must say which normalisation it uses
- They additionally assert REDUCEDNESS, which is not part of Fargues-Scholze Theorem
  VIII.1.3 as stated
- Their Theorem 1.4's connectedness conclusion needs the centre of G-hat to be SMOOTH
- They record a concrete failure of the naive approach: for G = GL_2 and l dividing q^2
  - 1, the analogue of the Bellovin-Gee / Booher-Patrikis space FAILS TO BE FLAT over
  W(F_l-bar), so it does not recover universal framed deformation rings

**Proof outline.**

1. Dat-Helm-Kurinczuk-Moss reduce to TAME parameters for a tame action preserving a Borel
   pair (their Section 3), study that case in Section 2, and deduce Theorem 1.3 = their
   Theorem 4.1.
2. Fargues-Scholze follow the same discretization idea, attributing it to [DHKM20] and
   [Zhu20]: 'following [DHKM20] and [Zhu20] we define discrete dense subgroups W in W_E/P
   by discretizing the tame inertia, and the restriction Z^1(W_E/P,G-hat) -> Z^1(W,G-hat)
   is an isomorphism'.
3. NOTE: only the abstract, the introduction (printed pp. 2-3) and the statements of
   Theorems 1.3 and 1.4 were read; no proof from Dat-Helm-Kurinczuk-Moss was read.

**Acceptance.**

- Check the GL_2, l | q^2 - 1 non-flatness example against the flatness of Z^1
- Check the dimension normalisation on a split torus: relative dimension dim T versus absolute dimension dim T + 1
- Check reducedness, which Fargues-Scholze do not assert

**Prerequisites.** `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `ReductiveGroupsPartII:RG2.5`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Flat`

**Sources.**

- *Theorem 1.3 and the caveat after it, printed p. 6.* “The scheme Z^1(W_F^0, G-hat) is syntomic (flat and locally a complete intersection) over Z^1(P_F, G-hat), generically smooth, of pure absolute dimension dim(G-hat). Beware that dim G-hat = dim G + 1 whenever G-hat is the Langlands dual group of a reductive group G over F, since the base scheme of G-hat has dimension 1.”
  The independent statement together with the explicit dimension-normalisation
  warning, which differs from the relative-dimension phrasing in Fargues-Scholze
  VIII.1.3.
- *Abstract, printed p. 1.* “We construct a moduli space of Langlands parameters W_F -> ^L G, and show that it is locally of finite type and flat over Z[1/p], and that it is a reduced local complete intersection.”
  Their global statement, including reducedness.
- *Introduction, printed p. 2.* “For instance, when G = GL_2, and l divides q^2 - 1 (where q denotes the order of the residue field of F), the analogue of the spaces constructed by Bellovin-Gee and Booher-Patrikis fails to be flat over W(F_l-bar).”
  A concrete integral pathology of the naive construction, useful as an acceptance
  test.
- *VIII introduction, printed p. 277.* “To prove the theorem, following [DHKM20] and [Zhu20] we define discrete dense subgroups W in W_E/P by discretizing the tame inertia, and the restriction Z^1(W_E/P,G-hat) -> Z^1(W,G-hat) is an isomorphism, where the latter is clearly an affine scheme.”
  Fargues-Scholze's own attribution of the discretization method.

### FS VIII.3.5: the derived cocycle algebra is discrete

`LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme` — *theorem* · planet **The derived cocycle algebra is discrete**

**Statement.**

In the derived infinity-category D(Z_l), the map colim over (n, F_n -> W) of
O(Z^1(F_n,G-hat)) -> O(Z^1(W,G-hat)) is an isomorphism. Both sides carry natural
animated Z_l-algebra structures and the map is a morphism of such; hence it is an
isomorphism of animated Z_l-algebras. In particular the derived object A = colim ... is
DISCRETE: A = pi_0 A.

**Hypotheses and warnings.**

- The index category {(n, F_n -> W)} of maps from finite free groups to W is SIFTED,
  since it admits coproducts; this is needed for the colimit to compute the animated
  algebra
- The left-hand side is the UNIVERSAL animated Z_l-algebra A with a 1-cocycle W ->
  G-hat(A); the right-hand side is pi_0 A
- The argument is: the deformation-theoretic computation in the proof of Theorem
  VIII.1.3 shows A is a DERIVED complete intersection, and since pi_0 A has the correct
  dimension, A = pi_0 A. This is exactly the amplitude comparison the completion
  contract asks for, and it is NOT an argument from equality of geometric points
- This statement is on underlying complexes; the refinement incorporating the G-hat-
  action is Theorem VIII.3.6 and needs the l-does-not-divide-|pi_1(G-hat)_tors|
  hypothesis

**Proof outline.**

1. Identify the colimit with the universal animated Z_l-algebra carrying a 1-cocycle from
   W.
2. Apply the deformation theory of the proof of VIII.1.3 to see that A is a derived
   complete intersection.
3. Compare dimensions: pi_0 A has the correct dimension, so A is discrete.

**Acceptance.**

- Check the amplitude argument on a split torus, where everything is explicit
- Check that equality of geometric points would not suffice
- Check that the index category is sifted

**Prerequisites.** `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:abstract`, `DerivedDeRhamCohomology:DD.0`, `mathlib:FreeGroup`, `mathlib:CommRing`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Proposition VIII.3.5 and proof, printed p. 288.* “The left-hand side defines an animated Z_l-algebra, in fact the universal animated Z_l-algebra A with a 1-cocycle W -> G-hat(A), and the right-hand side is given by pi_0 A. Now the deformation-theoretic arguments from the proof of Theorem VIII.1.3 show that A is a derived complete intersection, but as pi_0 A has the correct dimension, we get A = pi_0 A.”
  The full proof; this is the source's amplitude calculation comparing the derived and
  classical cocycle objects.
- *VIII.3.2, printed p. 287.* “Consider the category {(n, F_n -> W)} consisting of maps from finite free groups to W, with maps given by commutative diagrams F_n -> F_m -> W; this is a sifted index category (as it admits coproducts).”
  The siftedness of the index category, needed for the animated-algebra statement.

### FS VIII.1.4: the dimension bound for maps out of Z/l^m Z semidirect Z into a smooth group

`LanglandsParameterStacks:LP1/dimension-bound-lemma` — *lemma*

**Statement.**

Let H be a smooth group scheme over F-bar_l whose identity component is REDUCTIVE. Then
the affine scheme parametrizing group maps Z/l^m Z semidirect Z -> H, where the
generator sigma of Z acts on Z/l^m Z by multiplication by q, is of dimension AT MOST dim
H. The proof: the image of the generator tau of Z/l^m Z is a UNIPOTENT element of H; by
finiteness of the number of unipotent conjugacy classes one stratifies the scheme by the
conjugacy class of the image of tau; and for each fixed class, sigma must conjugate tau
into tau^q, so the dimension of the stratum is at most the dimension of the conjugacy
class of tau (the choices for tau) plus its codimension (the choices for sigma given
tau), which is dim H.

**Hypotheses and warnings.**

- The identity component of H must be REDUCTIVE, which in the application is Prasad-Yu's
  theorem on the centraliser of a prime-to-l inertia parameter; that theorem was NOT
  read
- Finiteness of the number of unipotent conjugacy classes is quoted from Lusztig and
  from Fried-Goresky-? as cited; it was not read
- The counting is exactly dim(class) + codim(class) = dim H, and it is the whole content
  of the bound
- The generator's image is unipotent because it has l-power order in characteristic l

**Proof outline.**

1. Note that the image of the generator of Z/l^m Z is unipotent.
2. Stratify by the conjugacy class of that image, using finiteness of the number of
   unipotent classes.
3. On each stratum, count: the class of tau contributes its dimension, and the condition
   that sigma conjugate tau to tau^q cuts the choices of sigma down to a coset of the
   centraliser, of dimension the codimension of the class.
4. Add: dim(class) + codim(class) = dim H.

**Acceptance.**

- Check the count dim(class) + codim(class) = dim H
- Check that the image of the generator is unipotent and why
- Check that reductivity of the identity component is used, and where it is imported from

**Prerequisites.** `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `ReductiveGroupsPartII:RG2.5`, `mathlib:RootPairing`, `mathlib:Representation`, `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- *Lemma VIII.1.4, printed pp. 280-281.* “Let H be a smooth group scheme over F-bar_l whose identity component is reductive. Then the affine scheme parametrizing maps of groups Z/l^m Z semidirect Z -> H, where sigma acts on Z/l^m Z via multiplication by q, is of dimension at most dim H.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Lemma VIII.1.4, printed p. 281.* “The image of the generator of Z/l^m Z is a unipotent element of H. By finiteness of the number of unipotent conjugacy classes, we can stratify the scheme according to the conjugacy class of the image of tau. But for each fixed conjugacy class, one has to choose the image of sigma so as to conjugate tau into tau^q: This bounds the dimension of each stratum by the dimension of ...”
  The proof, quoted verbatim. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.

### FS VIII.2.1-VIII.2.3: the cotangent complex of the parameter stack is Weil-group cohomology

`LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory` — *theorem* · planet **The cotangent complex of the parameter stack**

**Statement.**

For any parameter phi : W_E -> G-hat(Lambda) semidirect Q, corresponding to x :
Spec(Lambda) -> [Z^1(W_E,G-hat)/G-hat], one has x^* L^dual_{[Z^1(W_E,G-hat)/G-hat]} =
RGamma(W_E, (g-hat tensor Z_l Lambda)_phi)[1], where the subscript phi denotes the
twisted W_E-action deduced from phi. Moreover, for M a free Lambda-module of finite rank
with a condensed W_E-action, RGamma(W_E,M) is a PERFECT complex of Lambda-modules and
there is a canonical isomorphism RGamma(W_E,M)^dual = RGamma(W_E, M^dual(1))[2].
Consequently x^* L_{[Z^1(W_E,G-hat)/G-hat]} = RGamma(W_E, (g-hat tensor
Lambda)^dual_phi(1))[1].

**Hypotheses and warnings.**

- The identification of the cotangent complex WOULD BE immediate by deformation theory
  if the moduli problem were defined on all ANIMATED Z_l-algebras; what makes it a
  theorem is that the classical moduli problem represents the right derived one, which
  follows from the lci statement of dimension 0. The source says so in as many words
- The duality RGamma(W_E,M)^dual = RGamma(W_E,M^dual(1))[2] is Poincare duality applied
  to Div^1 -> *, or can be proved by hand by comparing W_E-cohomology with W-cohomology
  for a discretisation
- The twist (1) is a Tate twist; the shift is by 2, reflecting that W_E has
  cohomological dimension 2 in this normalisation
- This is the statement the roadmap asks for under 'its tangent complex by cocycle
  cohomology'; the derived MAPPING STACK over the finite pinned-action quotient, which
  the stage text also names, is NOT in Fargues-Scholze
- g-hat = Lie G-hat, and the action is the twisted adjoint one

**Proof outline.**

1. Observe that the moduli problem, extended to animated Z_l-algebras, is a derived local
   complete intersection of expected dimension 0 by the cohomological dimension of W_E.
2. Use the classical lci statement of dimension 0 to conclude that the classical moduli
   problem represents the derived one, so deformation theory computes the cotangent
   complex.
3. Prove the perfectness and the duality for RGamma(W_E,M) by Poincare duality for Div^1
   -> *, or by hand through a discretisation.
4. Combine to get the dual statement with the Tate twist.

**Acceptance.**

- Check that the identification is NOT immediate and that the lci statement is what licenses it
- Check the duality isomorphism, including the Tate twist and the shift by 2
- Check that the cotangent complex is concentrated in the expected degrees, so that H^0, H^1 and H^2 are the centraliser, the deformations and the obstructions

**Prerequisites.** `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`, `DerivedDeRhamCohomology:DD.0`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:groupCohomology`, `mathlib:Module.Free`, `mathlib:Representation`, `tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor`

**Sources.**

- *Proposition VIII.2.1, printed p. 281.* “For any parameter phi : W_E -> G-hat(Lambda) semidirect Q corresponding to x : Spec(Lambda) -> [Z^1(W_E,G-hat)/G-hat], x^* L^dual_{[Z^1(W_E,G-hat)/G-hat]} = RGamma(W_E, (g-hat tensor Z_l Lambda)_phi)[1] where (g-hat tensor Lambda)_phi is g-hat tensor Lambda equipped with the twisted action of W_E deduced from phi.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Proposition VIII.2.1, printed p. 281.* “This would be clear if we defined the moduli problem on all animated Z_l-algebras, by deformation theory. Then the cohomological dimension of W_E would imply that this moduli problem is a derived local complete intersection, of expected dimension 0. However, we proved that Z^1(W_E,G-hat)/G-hat is a local complete intersection Artin stack of dimension 0, hence it represents the ...”
  Why it is a theorem and not a definition - the classical-to-derived comparison the
  roadmap insists on. The excerpt is truncated at a word boundary; the full passage is
  on the printed page named in the locator.
- *Proposition VIII.2.2 and Corollary VIII.2.3, printed pp. 281-282.* “Let M be a free Lambda-module of finite rank equipped with a condensed action of W_E. Then RGamma(W_E,M) is a perfect complex of Lambda-modules and there is a canonical isomorphism RGamma(W_E,M)^dual = RGamma(W_E, M^dual(1))[2]. ... x^* L_{[Z^1(W_E,G-hat)/G-hat]} = RGamma(W_E, (g-hat tensor Lambda)^dual_phi(1))[1].”
  The duality and the dual form of the cotangent complex, quoted verbatim.

### FS VIII.2.6-VIII.2.9: the singularity scheme, singular support, and perfectness

`LanglandsParameterStacks:LP1/singularities-and-singular-support` — *definition* · planet **Singular support on the parameter stack**

**Statement.**

Let A -> B be SYNTOMIC, that is flat and a local complete intersection, and X = Spec B
-> S = Spec A the associated map of affine schemes. The scheme Sing_{X/S} -> X
represents the functor T/X -> H^{-1}(L_{X/S} tensor^L_{O_X} O_T); locally on X, L_{X/S}
is a complex of vector bundles [E^{-1} -> E^0] and Sing_{X/S} is the kernel of V(E^{-1})
-> V(E^0), so that O(Sing_{X/S}) = Sym^*_B H^{-1}(L^dual_{B/A}). It is an X-group scheme
with a G_m-action, and the image of Sing_{X/S} minus the zero section in X is the
complement of the smooth locus. For N in D^b_coh(X), the graded algebra Ext^*_B(N,N) is
naturally an O(Sing_{X/S})-algebra through H^{-1}(L^dual_{B/A}) = HH^2(B/A) ->
Ext^2_B(N,N), giving a G_m-equivariant quasi-coherent sheaf End(N) on Sing_{X/S}. If S
is regular, End(N) is COHERENT, and the SINGULAR SUPPORT of N is the support of End(N),
a closed conical subset of Sing_{X/S}. Then N is a PERFECT COMPLEX if and only if
SingSupp(N) is contained in the zero section.

**Hypotheses and warnings.**

- The construction needs A -> B SYNTOMIC and, for coherence of End(N), S REGULAR; both
  hypotheses are used and neither may be dropped
- Sing_{X/S} is built from H^{-1} of the cotangent complex, that is from the DUAL of the
  cotangent complex in degree -1; it is the standard singularity scheme of Arinkin-
  Gaitsgory
- Theorem VIII.2.7 is quoted from Gulliksen and from Arinkin-Gaitsgory Appendix D;
  Theorem VIII.2.9 from Arinkin-Gaitsgory Theorem 4.2.6, whose proof Fargues-Scholze
  reproduce through a result of Jorgensen and the Gorenstein property of X. NONE of
  those references was read
- In the case at hand Sing[Z^1(W_E,G-hat)/G-hat] = [Z^1(W_E,G-hat)/G-hat] x_{*/G-hat}
  [g-hat/G-hat], where [g-hat/G-hat] is regarded as a vector bundle on */G-hat
- This is the machinery behind the NILPOTENT SINGULAR SUPPORT condition that FS
  Conjecture X.3.5 imposes; that conjecture is not planned anywhere

**Proof outline.**

1. Define Sing_{X/S} by the functor it represents, and compute it locally as the kernel
   of a map of vector bundles.
2. Make Ext^*_B(N,N) an O(Sing_{X/S})-algebra through the Hochschild map.
3. Quote Gulliksen and Arinkin-Gaitsgory for coherence when S is regular, and define the
   singular support as the support.
4. Prove that perfectness is equivalent to the singular support lying in the zero
   section, using that X is Gorenstein and Jorgensen's projective-dimension criterion.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Sing` | data | Sing_{X/S}, representing T -> H^{-1}(L_{X/S} tensor O_T), with O(Sing) = Sym^* H^{-1}(L^dual). |
| `Sing.isGroupScheme` | structure | An X-group scheme with a G_m-action. |
| `Sing.smoothLocus` | characterisation | The image of Sing minus the zero section is the complement of the smooth locus. |
| `EndSheaf` | data | End(N) on Sing, from Ext^*_B(N,N) as an O(Sing)-algebra through HH^2(B/A) -> Ext^2(N,N). |
| `EndSheaf.coherent` | structure | Coherent when S is REGULAR; this is Gulliksen and Arinkin-Gaitsgory and is imported. |
| `SingSupp` | data | The support of End(N), a closed conical subset. |
| `isPerfect_iff` | characterisation | N is perfect iff SingSupp(N) lies in the zero section. |

**Where it is used.**

- `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone` — the banal case computes this support explicitly
- `LanglandsParameterStacks:LP4/generation-and-module-comparison` — perfectness of the objects generating Perf is what the criterion tests
- `ExcursionOperatorsAndSpectralAction:ES3` — FS Conjecture X.3.5's nilpotent singular support condition is stated with this notion

**Unit tests.**

- `smooth_iff_zero_section` — Sing is the zero section exactly over the smooth locus.
- `regularity_needed` — Coherence of End(N) uses that S is regular; without it the definition of the support is not available.
- `perfect_iff_zero` — A non-perfect coherent complex has singular support meeting a nonzero point.
- `parameter_stack_computation` — For the parameter stack, Sing is the fibre product with [g-hat/G-hat] over */G-hat.

**Acceptance.**

- Check that Sing_{X/S} is the zero section exactly on the smooth locus
- Check that End(N) is coherent only under the regularity hypothesis on S
- Check the equivalence with perfectness on an explicit non-perfect coherent complex
- Check the computation of Sing for the parameter stack as a fibre product over */G-hat

**Prerequisites.** `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `DerivedDeRhamCohomology:DD.0`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Module.Flat`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Triangulated.TStructure`

**Sources.**

- *Definition VIII.2.6, printed p. 283.* “Suppose now that A -> B is syntomic, i.e. flat and a local complete intersection. Let X = Spec B -> S = Spec A be the associated map of affine schemes. The scheme Sing_{X/S} -> X represents the functor T/X -> H^{-1}(L_{X/S} tensor^L_{O_X} O_T). ... Explicitly, Sing_{X/S} is the affine scheme with O(Sing_{X/S}) = Sym^*_B H^{-1}(L^dual_{B/A}). This is an X-group scheme equipped ...”
  The definition, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Theorem VIII.2.7 and Definition VIII.2.8, printed p. 283.* “([Gul74, Theorem 3.1], [AG15, Appendix D]) For N in D^b_coh(X), the quasi-coherent sheaf End(N) on Sing_{X/S} is coherent. Definition VIII.2.8. The singular support of N, SingSupp(N), is the support of End(N) as a closed conical subset of Sing_{X/S}.”
  The coherence theorem and the definition of the singular support, quoted verbatim.
- *Theorem VIII.2.9, printed p. 283.* “([AG15, Theorem 4.2.6]) The following are equivalent: (i) N is a perfect complex, (ii) SingSupp(N) is contained in the zero section of Sing_{X/S}.”
  The perfectness criterion, quoted verbatim.
- *After Theorem VIII.2.9, printed p. 284.* “Sing_{[Z^1(W_E,G-hat)/G-hat]} = [Z^1(W_E,G-hat)/G-hat] x_{*/G-hat} [g-hat/G-hat] where g-hat = Lie G-hat and [g-hat/G-hat] is seen here as a vector bundle on */G-hat = [Spec Z_l / G-hat].”
  The computation in the case at hand.

### FS VIII.2.10-VIII.2.13: in the banal case the singularity fibre is the nilpotent cone

`LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone` — *theorem* · planet **The banal case and the nilpotent cone**

**Statement.**

For x in [Z^1(W_E,G-hat)/G-hat](L) one has x^* Sing_{[Z^1(W_E,G-hat)/G-hat]}
tensor_{Z_l} L = N_{G-hat} tensor_{Z_l} L, the nilpotent cone, in the following two
cases: (i) L is an algebra over Q-bar_l; (ii) if n = f_{E'/E} with W_{E'} = ker(W_E ->
Out(G-hat)), then q^{en} - 1 is not divisible by l for any exponent e of G-hat. The
proof of (ii): the assumption implies that l is a VERY GOOD PRIME for G-hat, so the
Chevalley isomorphism g-hat // G-hat = t-hat // W holds and g-hat is self-dual; then x^*
Sing tensor L = H^0(W_E, g-hat tensor L(1)) with the action twisted by phi, and for v in
that subspace sigma . v and q v lie in the same adjoint orbit, so v is conjugate to q^n
v; the morphism g-hat -> g-hat // G-hat = A^m given by m homogeneous polynomials of
degrees the exponents of the root system then forces the image of v to be zero, so v
lies in the nilpotent cone. The supremum of the exponents is the COXETER NUMBER h, so
the condition holds if for instance l > q^{hn} - 1.

**Hypotheses and warnings.**

- Condition (ii) is a BANALITY condition; Fargues-Scholze say they have not tried to
  optimise it and that with Dat-Helm-Kurinczuk-Moss's results on G-hat-banal primes one
  can probably do much better
- In the NON-BANAL case things become more complicated and the Arinkin-Gaitsgory
  condition of nilpotent singular support becomes important; the source says so, and
  adds that this is also the case when interesting congruences between smooth
  irreducible representations of G(E) occur
- The appearance of g-hat^dual is, in the source's own words, another indication that
  the hypothesis that l not divide the order of pi_1(G-hat)_tors may be important: that
  hypothesis determines the isomorphism class of g-hat as a representation of the
  adjoint group within the isogeny class. And when l is a bad prime the nilpotent cone
  is not well behaved - there may be infinitely many nilpotent orbits - and the authors
  say they ARE NOT SURE whether the resulting notion of nilpotent singular support is
  the correct one
- The Chevalley isomorphism and the exponents of the root system are imported from the
  structure theory of reductive groups

**Proof outline.**

1. Reduce to computing H^0(W_E, g-hat tensor L(1)) with the twisted action.
2. For v in that space, deduce from the W_E-equivariance that v and q^n v are adjoint-
   conjugate.
3. Apply the Chevalley map to A^m given by homogeneous invariants of degrees the
   exponents, and conclude that the image of v vanishes.
4. Conclude that v is nilpotent.

**Acceptance.**

- Check that (ii) implies l is very good and that the Chevalley isomorphism is used
- Check the bound l > q^{hn} - 1 with h the Coxeter number
- Check that the conclusion fails outside the banal range, and that the source records uncertainty there
- Check the self-duality of g-hat that the very-good hypothesis provides

**Prerequisites.** `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `ReductiveGroupsPartII:RG2.5`, `mathlib:RootPairing`, `mathlib:Representation`, `mathlib:CoxeterSystem`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Proposition VIII.2.11, printed pp. 284-285.* “x^* Sing_{[Z^1(W_E,G-hat)/G-hat]} tensor_{Z_l} L = N_{G-hat} tensor_{Z_l} L in the following two cases: (i) L is an algebra over Q-bar_l, (ii) if n = f_{E'/E} with W_{E'} = ker(W_E -> Out(G-hat)), then q^{en} - 1 is not divisible by l for any exponent e of G-hat.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Proposition VIII.2.11, printed p. 285.* “Assumption (ii) implies that l is a very good prime for G-hat and in particular the Chevalley isomorphism g-hat // G-hat = t-hat // W holds, and there is an isomorphism g-hat = g-hat^dual. ... There is a morphism g-hat -> g-hat // G-hat = t-hat // W = A^m_{Z_l} given by m homogeneous polynomials of degrees the exponents of the root system. This implies that the image of v in ...”
  The proof, quoted verbatim. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *Remarks VIII.2.12 and VIII.2.13, printed p. 285.* “In the non-banal case things become more complicated and the Arinkin-Gaitsgory condition of nilpotent singular support becomes important. ... The appearance of g-hat^dual here is another indication that the assumption that l does not divide the order of pi_1(G-hat)_tors may be important ... when l is a bad prime, then the nilpotent cone is not well-behaved (for example, there ...”
  The source's own statement of what is not known, which this packet carries rather
  than smoothing over. The excerpt is truncated at a word boundary; the full passage
  is on the printed page named in the locator.

**What remains in this layer.**

- Prasad-Yu's theorem on the reductivity of the identity component of a centraliser,
  used at the crucial characteristic-l step of the dimension bound, was NOT read; the
  integrated decomposition recorded the same.
- Theorem VIII.2.7 (Gulliksen, Arinkin-Gaitsgory Appendix D) and Theorem VIII.2.9
  (Arinkin-Gaitsgory 4.2.6, via Jorgensen) are imported and were not read.
- Zhu's paper on the stack of arithmetic Langlands parameters is cited by Fargues-
  Scholze alongside Dat-Helm-Kurinczuk-Moss, is in the maintainer's library, and remains
  ENTIRELY UNREAD; Proposition VIII.2.5 uses [Zhu20, Lemma 3.1.8].
- The DERIVED MAPPING STACK over the finite pinned-action quotient, and the import of
  the cotangent construction from DerivedDeRhamCohomology:DD.0, which the stage text
  asks for, are not in Fargues-Scholze; what the source gives is the cotangent complex
  of the classical stack, planned here, together with the argument that the classical
  stack already represents the derived moduli problem.
- Dat-Helm-Kurinczuk-Moss was read only at the level of the abstract, the introduction
  and Theorems 1.3 and 1.4, exactly as in the integrated decomposition; nothing further
  was read in this session.

## LP2 — Coarse quotient and excursion presentation

*Coverage: **partial**. 1 node.*

The aggregate layer, with one node recording WHY the three substages are separate: the
universal homeomorphism is unconditional and gives a bijection on geometric points,
which is all the parameter statement needs, while the isomorphism, the cohomology
vanishing and the base change need the hypothesis on pi_1(G-hat)_tors.

### Why the three substages of LP2 are separate, and what each may assume

`LanglandsParameterStacks:LP2/three-way-separation` — *comparison*

**Statement.**

LP2 is an aggregate of three substages, and the roadmap's reason for keeping them apart
is a hypothesis, not a convenience. LP2:excursion-presentation owns Exc(W,G-hat) and the
UNIVERSAL HOMEOMORPHISM onto the invariant algebra; that statement holds over any
coefficients and needs no restriction on l. LP2:semisimple-characters owns FS
Proposition VIII.3.8, the bijection between excursion characters over an algebraically
closed L of characteristic different from p and conjugacy classes of continuous
semisimple L-parameters; that statement is made over W_E and carries NO good-prime
hypothesis, because the geometric points of Exc(W,G-hat) and of the coarse quotient
agree even when the comparison map is only a universal homeomorphism. LP2:integral-
invariants owns the STRONGER statement that the comparison is an ISOMORPHISM, together
with the vanishing of higher cohomology and base change of invariants, and those require
that l NOT DIVIDE the order of pi_1(G-hat)_tors. Keeping the three apart is what stops
the parameter statement from inheriting a restriction it does not need.

**Hypotheses and warnings.**

- A universal homeomorphism induces a bijection on geometric points; that is exactly why
  LP2:semisimple-characters can be proved from the excursion presentation without the
  integral theorem, and it is the mathematical content of the separation
- The hypothesis that l not divide the order of pi_1(G-hat)_tors is USED and, by
  Proposition VIII.5.11's backwards direction, is NECESSARY for the generation
  statement; so it cannot be dropped from LP2:integral-invariants
- The l-torsion of Exc(W,G-hat) is always NILPOTENT, so passing to the l-torsion-free
  quotient is itself a universal homeomorphism; this is why the difference between Exc
  and the invariant algebra is invisible on points but visible on functions
- This is a policy node and not a theorem; it records which hypothesis appears where in
  the three substages

**Proof outline.**

1. Record the universal homeomorphism of LP2:excursion-presentation and that it is a
   bijection on geometric points.
2. Record that Proposition VIII.3.8 is stated over W_E and needs only that bijection.
3. Record that the isomorphism, the cohomology vanishing and the base change of
   LP2:integral-invariants need the hypothesis on pi_1(G-hat)_tors, and that Proposition
   VIII.5.11 shows it is necessary.

**Acceptance.**

- Check that no statement in LP2:semisimple-characters carries a hypothesis on l beyond l different from p
- Check that every statement in LP2:integral-invariants carries the hypothesis on pi_1(G-hat)_tors
- Check that the l-torsion of Exc is nilpotent, so that the two algebras have the same points

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `mathlib:CommRing`, `mathlib:PrimeSpectrum.isHomeomorph_comap`

**Sources.**

- *Section VIII.3.2, printed p. 287.* “By Haboush's theorem on geometric reductivity [Hab75] it follows that the map colim over (n, F_n -> W) of O(Z^1(F_n,G-hat))^{G-hat} -> O(Z^1(W,G-hat))^{G-hat} on G-hat-invariants is a universal homeomorphism of finite type Z_l-algebras, and an isomorphism after inverting l.”
  The unconditional statement, which is what LP2:semisimple-characters rests on. Read
  directly from the hash-verified PDF in this session.
- *Definition VIII.3.4 and after, printed p. 287.* “We see in particular that the geometric points of Exc(W,G-hat) and Z^1(W,G-hat) // G-hat agree.”
  The one sentence that makes the separation work.
- *Theorem VIII.5.1, printed p. 293.* “Assume that l does not divide the order of pi_1(G-hat)_tors.”
  The hypothesis that LP2:integral-invariants carries and that the other two substages
  do not.

**What remains in this layer.**

- The layer has no content of its own beyond the separation policy; its substages carry
  the mathematics.
- The atlas records LP2's inputs as its own three substages and gives it no consumer, so
  the separation is visible only in the text and not in the link graph.

## LP2:excursion-presentation — Unrestricted excursion algebra

*Coverage: **partial**. 4 nodes.*

The excursion algebra as a colimit of invariant cocycle algebras over the sifted index
category of finite free groups mapping to W; the canonical map to the invariant algebra
and its being a UNIVERSAL HOMEOMORPHISM by Haboush, an isomorphism only after inverting
l; the universal property by generators and relations; the invariant function of an
excursion datum with the independence, the cartesian reindexing square, the fusion
multiplicativity and the unit insertion - all read in full in this session; and the map
to the Bernstein centre of a categorical datum.

### FS VIII.3.3-VIII.3.4: the excursion algebra and the universal homeomorphism onto the invariant algebra

`LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism` — *construction* · planet **The excursion algebra**

**Statement.**

For each n with a map F_n -> W one has a G-hat-equivariant map O(Z^1(F_n,G-hat)) ->
O(Z^1(W,G-hat)), where Z^1(F_n,G-hat) = G-hat^n with appropriately twisted diagonal
G-hat-conjugation. The map colim over (n,F_n -> W) of O(Z^1(F_n,G-hat)) ->
O(Z^1(W,G-hat)) is an isomorphism of algebras WITH G-hat-action, because a 1-cocycle
from W is uniquely specified by a compatible collection of 1-cocycles from all F_n -> W.
By HABOUSH'S THEOREM on geometric reductivity, the induced map on G-hat-invariants
Exc(W,G-hat) := colim O(Z^1(F_n,G-hat))^{G-hat} -> O(Z^1(W,G-hat))^{G-hat} is a
UNIVERSAL HOMEOMORPHISM of finite-type Z_l-algebras, and an ISOMORPHISM AFTER INVERTING
l. In particular the geometric points of Exc(W,G-hat) and of Z^1(W,G-hat) // G-hat
agree.

**Hypotheses and warnings.**

- Without further hypotheses the map on invariants is only a universal homeomorphism,
  NOT an isomorphism; it becomes an isomorphism after inverting l, and integrally only
  under the hypothesis of Theorem VIII.3.6
- The input is Haboush's theorem [Hab75] on geometric reductivity, which was not read
- Z^1(F_n,G-hat) = G-hat^n with SIMULTANEOUS TWISTED G-hat-conjugation, the twisting
  being by the n given automorphisms
- P must be an open subgroup of the wild inertia with the property that the W_E-action
  on G-hat factors over W_E/P

**Proof outline.**

1. Identify Z^1(F_n,G-hat) with G-hat^n under twisted simultaneous conjugation.
2. Show the colimit map is an isomorphism of G-hat-algebras, since a cocycle on W is
   determined by compatible cocycles on all F_n -> W.
3. Apply Haboush's geometric reductivity to pass to invariants, getting a universal
   homeomorphism of finite-type Z_l-algebras, an isomorphism after inverting l.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Exc` | data | Exc(W,G-hat) = colim over (n, F_n -> W) of O(Z^1(F_n,G-hat))^{G-hat}. |
| `Exc.cocycleSpace` | data | Z^1(F_n,G-hat) = G-hat^n with appropriately twisted diagonal G-hat-conjugation; the isomorphism with G-hat^n is what makes the pieces finite type. |
| `Exc.index` | structure | The index category {(n, F_n -> W)} is SIFTED, since it admits coproducts; that is what lets the colimit be computed without a Cech resolution. |
| `Exc.toInvariants` | data | The canonical map Exc(W,G-hat) -> O(Z^1(W,G-hat))^{G-hat}. |
| `Exc.universalHomeomorphism` | structure | That map is a UNIVERSAL HOMEOMORPHISM of finite-type Z_l-algebras, by Haboush geometric reductivity, and an isomorphism after inverting l. It is NOT an isomorphism in general. |
| `Exc.samePoints` | characterisation | The geometric points of Exc(W,G-hat) and of Z^1(W,G-hat)//G-hat agree, which is all that LP2:semisimple-characters needs. |

**Where it is used.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra` — the universal property is stated for this algebra
- `ExcursionOperatorsAndSpectralAction:ES0` — the excursion operators of the Hecke side map out of it
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem` — the integral theorem upgrades the universal homeomorphism to an isomorphism

**Unit tests.**

- `not_an_isomorphism_in_general` — The comparison map is only a universal homeomorphism integrally; asserting an isomorphism without the hypothesis on pi_1(G-hat)_tors is the error the roadmap names.
- `iso_after_inverting_l` — After inverting l the map is an isomorphism, because the representation theory of G-hat is then semisimple.
- `free_group_rank_one` — For n = 1 and the trivial action, Z^1(F_1,G-hat) = G-hat with conjugation, and the invariants are the class functions.
- `sifted_index` — The index category admits coproducts, hence is sifted; a colimit taken over a non-sifted index would not compute the same algebra.

**Acceptance.**

- Check the universal homeomorphism is not an isomorphism in an integral example at a bad prime
- Check the identification Z^1(F_1,G-hat) = G-hat with twisted conjugation
- Check agreement of geometric points

**Prerequisites.** `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:FreeGroup`, `mathlib:CommRing`, `mathlib:MvPolynomial`, `mathlib:PrimeSpectrum.isHomeomorph_comap`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *VIII.3.2, printed p. 287.* “By Haboush's theorem on geometric reductivity [Hab75] it follows that the map colim_{(n,F_n -> W)} O(Z^1(F_n,G-hat))^{G-hat} -> O(Z^1(W,G-hat))^{G-hat} on G-hat-invariants is a universal homeomorphism of finite type Z_l-algebras, and an isomorphism after inverting l.”
  The exact strength of the unconditional statement, which the stage text insists on.
- *Definition VIII.3.4 and the sentence after it, printed p. 287.* “The algebra of excursion operators (for Z^1(W,G-hat)) is Exc(W,G-hat) = colim_{(n,F_n -> W)} O(Z^1(F_n,G-hat))^{G-hat}. We see in particular that the geometric points of Exc(W,G-hat) and Z^1(W,G-hat) // G-hat agree.”
  The definition and the geometric-point consequence.

### FS VIII.3.7: the excursion algebra by generators and relations

`LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra` — *theorem* · planet **The universal property of Exc**

**Statement.**

Fix a finite quotient Q of W_E over which the W_E-action on G-hat factors, and let
(G-hat semidirect Q)^n // G-hat be the GIT quotient under simultaneous conjugation. Then
Exc(W,G-hat) is the UNIVERSAL Z_l-algebra A equipped with maps Theta_n : O((G-hat
semidirect Q)^n // G-hat) -> Map(W^n,A) for n >= 1, LINEAR OVER O(Q^n) -> Map(W^n,A),
subject to: for every map g : {1,...,m} -> {1,...,n} the induced square commutes,
together with the further multiplication/reindexing relations of VIII.3.3.

**Hypotheses and warnings.**

- The maps Theta_n must be linear over O(Q^n) -> Map(W^n,A); dropping this linearity
  changes the universal object
- The relations are indexed by maps g of finite sets, i.e. they are reindexing
  relations, plus the multiplication relations spelled out in the same subsection
- n runs over n >= 1
- The quotient (G-hat semidirect Q)^n // G-hat is the GIT quotient by SIMULTANEOUS
  conjugation

**Proof outline.**

1. Fargues-Scholze verify that the algebra defined by the colimit satisfies this
   universal property.
2. NOTE: the proof was read only at the level of the statement and the displayed
   relations; the verification ('which thus has the desired universal property', printed
   p. 290) was not read in detail.

**Acceptance.**

- Check the universal property on a split torus, where the relations should be transparent
- Check that omitting the O(Q^n)-linearity changes the answer
- Check the reindexing relation for the diagonal map {1,2} -> {1}

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `ReductiveGroupsPartII:RG2.5`, `mathlib:CommRing`, `mathlib:RingHom`, `mathlib:FreeGroup`, `mathlib:MvPolynomial`

**Sources.**

- *Proposition VIII.3.7, printed p. 288.* “The algebra of excursion operators Exc(W,G-hat) is the universal Z_l-algebra A equipped with maps Theta_n : O((G-hat semidirect Q)^n // G-hat) -> Map(W^n,A) for n >= 1, linear over O(Q^n) -> Map(W^n,A), subject to the following relations. If g : {1,...,m} -> {1,...,n} is any map, the induced diagram ... commutes.”
  The universal property with its linearity condition and reindexing relations.

### FS VIII.4.1-VIII.4.2: excursion operators give a map from Exc(W,G-hat) to the Bernstein centre of a categorical datum

`LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center` — *theorem* · planet **Exc acts on a Bernstein centre**

**Statement.**

Given the categorical data of Section VIII.4 (a category C with a monoidal action of
Rep((G-hat semidirect Q)^I) valued in W^I-equivariant endofunctors, functorially in I),
there is a natural map of algebras Exc(W,G-hat) = colim over (n,F_n -> W) of
O(Z^1(F_n,G-hat))^{G-hat} -> End(id_C), the Bernstein centre of C. The map is
constructed from excursion data D = (I, V, alpha, beta, (gamma_i)_{i in I}) with I a
finite set, V in Rep_{Z_l}((G-hat semidirect Q)^I), alpha : 1 -> V restricted to the
DIAGONAL copy of G-hat, beta : V restricted to G-hat -> 1, and gamma_i in W. This is
essentially due to V. Lafforgue.

**Hypotheses and warnings.**

- alpha and beta are maps of representations of the DIAGONAL G-hat inside G-hat^I inside
  (G-hat semidirect Q)^I; the restriction functor is to Rep_{Z_l}(G-hat)
- The gamma_i lie in the DISCRETIZED group W, not in W_E; passing to W_E is the content
  of Proposition VIII.3.8 and of the uniform-wild-subgroup statement IX.5.1
- The target is End(id_C), i.e. the Bernstein centre of the categorical datum; no
  representation-theoretic correspondence is assumed
- Fargues-Scholze attribute the construction essentially to V. Lafforgue [Laf18]

**Proof outline.**

1. Construct the excursion operator attached to an excursion datum as the composite A =
   T_1(A) -> T_V(A) -> T_V(A) -> T_1(A) = A using alpha, the (gamma_i), and beta.
2. Check the relations of Proposition VIII.3.7 for these operators, which gives a map out
   of the universal algebra.
3. NOTE: only the statement of Theorem VIII.4.1, Definition VIII.4.2 and the location of
   Corollary VIII.4.3 were read; the construction and verification were not.

**Acceptance.**

- Check that the excursion operator for I a singleton and V trivial is the identity
- Check the relations for a map of finite sets on an explicit datum
- Check that no parameter is produced at this stage, only operators

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Representation`

**Sources.**

- *Theorem VIII.4.1, printed p. 291.* “Given the above categorical data, there is a natural map of algebras Exc(W,G-hat) = colim_{(n,F_n -> W)} O(Z^1(F_n,G-hat))^{G-hat} -> End(id_C) to the Bernstein center of C (i.e., the algebra of endomorphisms of the identity of C).”
  The universal-property statement that makes the excursion algebra usable by
  consumers.
- *Definition VIII.4.2 and the sentence after it, printed p. 291.* “An excursion datum is a tuple D = (I, V, alpha, beta, (gamma_i)_{i in I}) consisting of a finite set I, an object V in Rep_{Z_l}((G-hat semidirect Q)^I) with maps alpha : 1 -> V|_{Rep_{Z_l}(G-hat)}, beta : V|_{Rep_{Z_l}(G-hat)} -> 1 and elements gamma_i in W. Here, the restriction Rep_{Z_l}((G-hat semidirect Q)^I) -> Rep_{Z_l}(G-hat) is the restriction to the diagonal copy of G-hat.”
  The exact form of an excursion datum, including the diagonal restriction.

### FS VIII.4.2: the invariant function of a datum, and independence of the realising representation

`LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence` — *construction* · planet **The invariant function of an excursion datum**

**Statement.**

A triple (V, alpha, beta) with V in Rep_{Z_l}((G-hat semidirect Q)^I) and alpha : 1 ->
V, beta : V -> 1 on the DIAGONAL restriction determines an element f = f(V,alpha,beta)
in O(G-hat \ (G-hat semidirect Q)^I / G-hat), the functions on the quotient by diagonal
left and right multiplication: for g_i in G-hat semidirect Q the composite 1 -> V -> V
-> 1 is an element of the base ring, and equivariance of alpha and beta under the
diagonal G-hat-action makes it a function on the double quotient. If two excursion data
share I and the (gamma_i) and there is a map g : V -> V' carrying alpha to alpha' and
beta' to beta, then the two operators AGREE. Hence the assignment factors through f,
giving Theta_I : O(G-hat \ (G-hat semidirect Q)^I / G-hat) -> Map(W^I, End(id_C)); the
square induced by pullback along a map of finite sets is CARTESIAN; Theta is
multiplicative by a 'convolution product = fusion product' argument on a disjoint union;
and UNIT INSERTION (g_1,...,g_n) -> (1,g_1,...,g_n) identifies the n+1-leg function ring
with O((G-hat semidirect Q)^n // G-hat), turning the Theta_I into the algebra maps
Theta_n of the universal property.

**Hypotheses and warnings.**

- The double quotient is by DIAGONAL left and right multiplication; f is not a function
  on the product
- The comparison of two data needs a map g carrying alpha forward AND beta backward; one
  direction does not suffice
- The reindexing square is CARTESIAN, which is stronger than commutative and is what the
  colimit presentation needs
- The last compatibility, with the multiplication maps induced by g : {1,...,m} ->
  {1,...,n}, is quoted by Fargues-Scholze from V. Lafforgue's Lemma 10.1 and equation
  (10.5) and the resulting Proposition 10.8(iii) and Definition-Proposition 11.3(d);
  THAT REFERENCE WAS NOT READ
- This node supplies what the decomposition recorded as missing: 'Theorem VIII.4.1's
  construction of the excursion operators and Corollary VIII.4.3 were NOT read; only the
  statements of VIII.4.1 and Definition VIII.4.2'

**Proof outline.**

1. Evaluate the composite 1 -> V -> V -> 1 at a tuple to get an element of the base ring,
   and use equivariance to descend it to the double quotient.
2. Compare two data through g : V -> V' by a ladder of commuting squares, so that the
   operator depends only on f.
3. Check that the reindexing square is cartesian.
4. Prove multiplicativity by the exterior product on I disjoint I followed by pullback
   along the fold map.
5. Insert the unit in the zeroth slot to get the algebra maps Theta_n, and quote
   Lafforgue for their compatibility with the multiplication maps.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `invariantFunction` | data | f(V,alpha,beta) in O(G-hat \ (G-hat semidirect Q)^I / G-hat). |
| `invariantFunction.doubleQuotient` | structure | It lives on the quotient by DIAGONAL left and right multiplication. |
| `operatorDependsOnlyOnF` | characterisation | Two data related by g : V -> V' carrying alpha forward and beta backward give the same operator. |
| `Theta` | data | Theta_I : O(G-hat \ (G-hat semidirect Q)^I / G-hat) -> Map(W^I, End(id_C)). |
| `Theta.cartesian` | structure | The square induced by pullback along a map of finite sets is CARTESIAN. |
| `Theta.unitInsertion` | equivalence | Inserting 1 in the zeroth slot identifies the (n+1)-leg ring with O((G-hat semidirect Q)^n // G-hat), giving the algebra maps Theta_n. |

**Where it is used.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra` — the relations of the universal property are these relations
- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center` — the map out of Exc is assembled from these
- `ExcursionOperatorsAndSpectralAction:ES0` — the Hecke-side excursion operators are exactly this construction

**Unit tests.**

- `double_quotient` — f descends to the double quotient by equivariance; a function on the plain product does not.
- `independence_needs_both` — The comparison requires g to carry alpha forward and beta backward.
- `cartesian_square` — The reindexing square is cartesian, not merely commutative.
- `fusion_multiplicativity` — Multiplicativity is proved on a disjoint union of leg sets and then pulled back along the fold map.

**Acceptance.**

- Check that f lives on the double quotient and not on the product
- Check that the comparison needs both directions of g
- Check that the reindexing square is cartesian
- Check that the multiplicativity argument is the fusion one and uses a disjoint union of leg sets

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:MvPolynomial`, `mathlib:CommRing`, `mathlib:RingHom`

**Sources.**

- *After Definition VIII.4.2, printed p. 291.* “Now note that (V,alpha,beta) give rise to an element f = f(V,alpha,beta) in O(G-hat \ (G-hat semidirect Q)^I / G-hat), the quotient under diagonal left and right multiplication. Indeed, given any g_i in G-hat semidirect Q, one can form the composite 1 -> V -> V -> 1, giving an element of the base ring; as alpha and beta are equivariant for the diagonal G-hat-action, this indeed gives an element f.”
  The construction, quoted verbatim. Read directly from the hash-verified PDF in this
  session; this closes the decomposition's record that VIII.4's construction was not
  read.
- *After Definition VIII.4.2, printed p. 291.* “We note that if we have two excursion data D and D' with same finite set I and elements gamma_i in W, and a map g : V -> V' taking alpha to alpha' and beta' to beta (by post- and pre-composition), then S_D = S_{D'}.”
  The independence statement, quoted verbatim.
- *Proof of Theorem VIII.4.1, printed p. 292.* “We want to check that Theta_I is a map of algebras. For this, we use a version of 'convolution product = fusion product' in this situation. ... For any n >= 0, we can identify O(G-hat \ (G-hat semidirect Q)^{{0,...,n}} / G-hat) tensor_{O(Q^{{0,...,n}})} O(Q^{{1,...,n}}) = O((G-hat semidirect Q)^n // G-hat) via pullback under (g_1,...,g_n) -> (1,g_1,...,g_n).”
  Multiplicativity and unit insertion, quoted verbatim.

**What remains in this layer.**

- Haboush's theorem on geometric reductivity, which gives the universal homeomorphism,
  was NOT read.
- V. Lafforgue's Lemma 10.1 and equation (10.5), and the resulting Proposition 10.8(iii)
  and Definition-Proposition 11.3(d), on which the last compatibility of the relations
  rests, were NOT read. The integrated decomposition recorded the same, and this packet
  has now read everything in Fargues-Scholze's own proof except that citation.
- The relation that inverts the last generator is left as an exercise by the source,
  with a hint; it is not proved in anything read.

## LP2:semisimple-characters — Geometric characters without a good-prime exclusion

*Coverage: **partial**. 3 nodes.*

Semisimplicity of a parameter, its equivalence with closedness of the orbit and with
G-hat-complete reducibility in the non-connected sense; the bijection of Proposition
VIII.3.8 between excursion characters and conjugacy classes of semisimple parameters;
and ITS PROOF, read in full in this session - the reconstruction of a semisimple cocycle
of discrete groups, and the continuity step.

### FS VIII.3.1-VIII.3.2: semisimplicity of a parameter and closedness of its orbit

`LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits` — *definition* · planet **Semisimple parameters and closed orbits**

**Statement.**

For L an algebraically closed field over Z_l, an L-parameter phi : W_E -> G-hat(L)
semidirect W_E is SEMISIMPLE if whenever the image of phi is contained in a parabolic
subgroup of G-hat semidirect W_E, it is contained in a Levi subgroup of that parabolic.
Concretely: if some G-hat(L)-conjugate phi' of phi factors through P-hat(L) semidirect
W_E, then there is g in P-hat(L) with g phi' g^{-1} = i_{L M} pr_{L M} composed with
phi'. Dat-Helm-Kurinczuk-Moss Proposition 4.13: for an L-parameter phi, semisimplicity
is equivalent to the G-hat-orbit of phi in Z^1(W_E,G-hat)_L being CLOSED.

**Hypotheses and warnings.**

- L must be ALGEBRAICALLY CLOSED and an algebra over Z_l; the roadmap asks for
  characteristic different from p, which is the standing l != p hypothesis
- Parabolic and Levi subgroups are taken in G-hat semidirect W_E, not in G-hat; the
  standard parabolics correspond to finite W_E-stable subsets of the simple roots of
  G-hat
- The equivalence with closedness of the orbit is quoted from [DHKM20, Proposition
  4.13], which was NOT read
- Semisimplicity is NOT the same as a full Weil-Deligne parameter with monodromy; the
  roadmap's warning is consistent with FS's separate treatment of Weil-Deligne
  parameters in VIII.2 (Definition VIII.2.4 for Q_l-algebras)

**Proof outline.**

1. Fargues-Scholze give the definition and its concrete reformulation in terms of
   standard parabolics.
2. Proposition VIII.3.2 lists equivalent conditions, the first being closedness of the
   G-hat-orbit; it is attributed to Dat-Helm-Kurinczuk-Moss.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsSemisimple` | data | phi is semisimple if whenever its image lies in a parabolic of G-hat semidirect W_E it lies in a Levi of that parabolic. |
| `IsSemisimple.parabolicsSurject` | structure | The parabolics considered are those SURJECTING onto W_E; up to conjugation they are P-hat semidirect W_E for a standard parabolic of the quasisplit inner form. |
| `IsSemisimple.closedOrbit` | characterisation | phi is semisimple iff its G-hat(L)-orbit in Z^1(W_E,G-hat)_L is CLOSED; equivalently the Zariski closure of its image is G-hat-completely reducible. |
| `coarsePoints` | characterisation | The L-points of Z^1(W_E,G-hat)_L // G-hat are in bijection with the closed G-hat-orbits, hence with semisimple parameters up to conjugation. |
| `completeReducibility` | structure | Complete reducibility is taken in the non-connected sense of Bate-Martin-Roehrle Section 6, since G-hat semidirect W_E is not connected. |

**Where it is used.**

- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection` — the bijection is with conjugacy classes of these
- `ExcursionOperatorsAndSpectralAction:ES5` — the parameter of a Schur-irreducible object is semisimple in this sense
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem` — the coarse quotient is the moduli of these

**Unit tests.**

- `closed_orbit_iff` — Semisimplicity is equivalent to closedness of the orbit; a definition that does not give this equivalence is wrong.
- `torus_case` — For a torus every parameter is semisimple and the orbit is a point.
- `non_semisimple_example` — A parameter whose image lies in a Borel but in no torus is not semisimple, and its orbit is not closed.
- `nonconnected_convention` — Complete reducibility is in the non-connected sense; the connected-group definition does not apply to G-hat semidirect W_E.

**Acceptance.**

- Check the definition for an unramified GL_2 parameter that is a nonsplit extension
- Check that closedness of the orbit fails for a non-semisimple parameter
- Check that a semisimple parameter is not a Weil-Deligne pair

**Prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:Subgroup`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Definition VIII.3.1, printed p. 286.* “Let L be an algebraically closed field over Z_l. An L-parameter phi : W_E -> G-hat(L) semidirect W_E is semisimple if whenever the image of phi is contained in a parabolic subgroup of G-hat semidirect W_E then it is contained in a Levi subgroup of this parabolic subgroup.”
  Verbatim definition.
- *Proposition VIII.3.2, printed p. 286.* “Let L be an algebraically closed field over Z_l and phi : W_E -> G-hat(L) semidirect W_E a parameter. The following are equivalent: (i) The G-hat-orbit of phi in Z^1(W_E,G-hat)_L is closed.”
  The closed-orbit characterisation, with its attribution to [DHKM20, Proposition
  4.13].

### FS VIII.3.8: excursion characters determine a unique conjugacy class of semisimple parameters

`LanglandsParameterStacks:LP2:semisimple-characters/character-bijection` — *theorem* · planet **Excursion characters and semisimple parameters**

**Statement.**

Let L be an algebraically closed field over Z_l. Then the following are in CANONICAL
BIJECTION: (i) semisimple L-parameters phi : W_E -> G-hat(L) semidirect W_E up to
G-hat(L)-conjugation; (ii) L-valued points of Z^1(W_E,G-hat) // G-hat; (iii) collections
of Z_l-algebra maps Theta_n : O((G-hat semidirect Q)^n // G-hat) -> Map(W_E^n, L) for n
>= 1, LINEAR over O(Q^n) -> Map(W_E^n,L), compatible with the reindexing squares for
every map g : {1,...,m} -> {1,...,n} and with the further displayed relations.

**Hypotheses and warnings.**

- L algebraically closed over Z_l; the statement is about CONJUGACY CLASSES, not about
  individual parameters
- In (iii) the maps are defined on W_E^n, not on the discretization W^n; this is the
  passage 'to W_E in place of W_E/P, where there is no natural (finite type) algebra
  anymore' that Fargues-Scholze flag before stating the proposition
- The linearity over O(Q^n) is again part of the data
- This statement does NOT require the hypothesis that l does not divide
  |pi_1(G-hat)_tors|; that hypothesis enters only in Theorem VIII.3.6 / VIII.5.1. The
  roadmap's insistence on keeping the two apart is confirmed by the source's ordering

**Proof outline.**

1. Fargues-Scholze deduce the bijection from the excursion presentation of VIII.3.7
   together with the identification of geometric points of Exc(W,G-hat) with those of
   Z^1(W,G-hat) // G-hat (which holds unconditionally by the universal homeomorphism),
   and from the closed-orbit characterisation of semisimplicity.
2. NOTE: only the statement of Proposition VIII.3.8 and the paragraph introducing it were
   read; its proof was not.

**Acceptance.**

- Check the bijection for a split torus
- Check that the excursion character determines the conjugacy class and not the parameter
- Check independence of the discretization and of the finite-wild choice, which the stage text requires and the source does not display

**Prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `mathlib:Condensed`, `mathlib:CommRing`, `mathlib:Representation`

**Sources.**

- *Proposition VIII.3.8, printed p. 290.* “Let L be an algebraically closed field over Z_l. Then the following are in canonical bijection. (i) Semisimple L-parameters phi : W_E -> G-hat(L) semidirect W_E, up to G-hat(L)-conjugation. (ii) L-valued points of Z^1(W_E,G-hat) // G-hat. (iii) Collections of maps of Z_l-algebras Theta_n : O((G-hat semidirect Q)^n // G-hat) -> Map(W_E^n, L) for n >= 1, linear over O(Q^n) -> ...”
  Exact statement of the three-way bijection over W_E. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *Before Proposition VIII.3.8, printed p. 290.* “Regarding the passage to W_E in place of W_E/P, where there is no natural (finite type) algebra anymore, we still have the following result.”
  Records that the W_E-version is a statement about characters, not about a finite-
  type algebra.

### FS VIII.3.8's proof: reconstructing a semisimple cocycle, and where its continuity comes from

`LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection` — *theorem* · planet **Reconstruction and continuity**

**Statement.**

The bijection of Proposition VIII.3.8 is proved in three steps. First, (i) and (ii) -
semisimple parameters up to conjugation, and L-points of the coarse quotient - are
already known to be in natural bijection, by the identification of the L-points of
Z^1(W_E,G-hat)_L // G-hat with the closed G-hat-orbits and of those with the semisimple
parameters. Second, the recipe attaching to a parameter its family of evaluations gives
a canonical map from (ii) to (iii). Third, given data as in (iii), FORGETTING THE
CONTINUITY of all the maps one sees that the data give rise to a semisimple 1-cocycle
phi : W_E -> G-hat(L) OF DISCRETE GROUPS, up to conjugation; what remains is to see that
if the data in (iii) are maps of CONDENSED SETS then phi is too - a condition
independent of the representative of the conjugacy class - and this follows from the
proof of V. Lafforgue's Proposition 11.7, in particular the choice of FINITELY MANY
elements gamma_1,...,gamma_n of W_E such that phi(gamma) is determined by the closed
G-hat-orbit in (G-hat semidirect Q)^{n+1} determined by (gamma_1,...,gamma_n,gamma)
through Theta_{n+1}.

**Hypotheses and warnings.**

- The reconstruction of the cocycle from the character is the DISCRETE statement;
  continuity is a separate and harder step and is the one that is imported
- V. Lafforgue's Proposition 11.7 and Lemma 11.10 were NOT read in this session; they
  are the only substantive external input to this layer, and the decomposition recorded
  the proof of VIII.3.8 as unread
- The continuity condition does not depend on the representative of the conjugacy class,
  which is what makes the statement well posed
- The finitely many elements gamma_1,...,gamma_n depend on the parameter; what Lafforgue
  provides is that finitely many suffice
- No good-prime hypothesis enters anywhere in this argument, which is the point of
  keeping this layer separate from LP2:integral-invariants

**Proof outline.**

1. Identify (i) and (ii) through closed orbits.
2. Map (ii) to (iii) by evaluating the invariant functions on tuples.
3. From data as in (iii), forget continuity and reconstruct a semisimple 1-cocycle of
   discrete groups up to conjugation.
4. Recover continuity from Lafforgue's finite determination of phi(gamma) by a closed
   orbit in (G-hat semidirect Q)^{n+1}.

**Acceptance.**

- Check that the reconstruction step is purely about discrete groups
- Check that continuity is imported and is the only external input
- Check that the continuity condition is independent of the representative
- Check that no hypothesis on l beyond l different from p is used

**Prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `mathlib:Condensed`, `mathlib:CommRing`, `mathlib:Representation`

**Sources.**

- *Proof of Proposition VIII.3.8, printed p. 290.* “We already know that (i) and (ii) are in natural bijection. The recipe above gives a canonical map from (ii) to (iii). Now take data as in (iii). Forgetting the continuity of all maps, we see that data as in (iii) gives rise to a semisimple 1-cocycle phi : W_E -> G-hat(L) (of discrete groups), up to conjugation.”
  The first three steps of the proof, quoted verbatim. Read directly from the hash-
  verified PDF in this session; the decomposition recorded this proof as unread.
- *Proof of Proposition VIII.3.8, printed p. 290.* “We need to see that if the data in (iii) are maps of condensed sets, then phi is also a map of condensed sets (this condition does not depend on the representative of its conjugacy class). This follows from the proof of [Laf18, Proposition 11.7], in particular the choice of finitely many elements gamma_1,...,gamma_n in W_E such that phi(gamma) is determined by the closed ...”
  The continuity step and its single external input, quoted verbatim. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.

**What remains in this layer.**

- V. Lafforgue's Proposition 11.7 and Lemma 11.10, which supply the continuity of the
  reconstructed cocycle, were NOT read. That is now the ONLY substantive unread input of
  this layer.
- Dat-Helm-Kurinczuk-Moss Proposition 4.13, the closed-orbit characterisation of
  semisimplicity, was not read; the source's own Section VIII.3.1 and Lemma VIII.3.3
  were, and they give the same statement through the limit criterion.
- The stage text asks in addition for independence of the finite-wild and discretisation
  choices. Proposition VIII.3.8 delivers it only implicitly, by being stated over W_E;
  the explicit comparison is planned in LP0's change-of-discretisation node and is an
  obligation there.
- Bate-Martin-Roehrle Section 6, from which the non-connected notion of complete
  reducibility is taken, was not read.

## LP2:integral-invariants — The stronger spectral-coordinate theorem

*Coverage: **partial**. 3 nodes.*

The integral invariant theorem under the hypothesis that l not divide the order of
pi_1(G-hat)_tors, with the cohomology vanishing and the base change; the evaluations
over W_E/P as maps of condensed sets, with the universal property of the l-torsion-free
quotient and the independence of the discretisation it buys; and the unipotent monodromy
morphism, which marks the boundary between a semisimplification and a full Weil-Deligne
parameter.

### FS VIII.3.6 and VIII.5.1: the integral invariant theorem under l not dividing |pi_1(G-hat)_tors|

`LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem` — *theorem* · planet **The integral invariant theorem**

**Statement.**

Assume l does not divide the order of pi_1(G-hat)_tors. Then colim over (n,F_n -> W) of
O(Z^1(F_n,G-hat)) -> O(Z^1(W,G-hat)) is an isomorphism in the presentable stable
infinity-category Ind Perf(*/G-hat); in particular Exc(W,G-hat) ->
O(Z^1(W,G-hat))^{G-hat} is an ISOMORPHISM. Equivalently (Theorem VIII.0.2), H^i(G-hat,
O(Z^1(W_E/P,G-hat))) = 0 for i > 0 and the formation of O(Z^1(W_E/P,G-hat))^{G-hat}
commutes with ANY BASE CHANGE. All of these results also hold with Q_l-coefficients
WITHOUT the assumption on l.

**Hypotheses and warnings.**

- The hypothesis is that l does NOT divide the order of pi_1(G-hat)_tors; it is required
  for the integral statements and is dropped only in the Q_l-coefficient case
- The statement is an isomorphism in Ind Perf(*/G-hat), i.e. it incorporates the G-hat-
  action; the underlying-complex statement without the action is Proposition VIII.3.5
  and needs no hypothesis
- The higher-cohomology vanishing and the base-change compatibility of invariants are
  the two concrete consequences recorded in Theorem VIII.0.2
- The reduction of VIII.5.1 to the characteristic-l statement VIII.5.2 uses that the map
  is an isomorphism after inverting l (semisimplicity of Rep G-hat over Q_l) and true on
  underlying complexes by VIII.3.5, so only the mod-l statement remains

**Proof outline.**

1. Reduce Theorem VIII.5.1 to Theorem VIII.5.2 over L = F_l-bar: the colimit claim
   amounts to colim RGamma(G-hat, O(Z^1(F_n,G-hat)) tensor V) -> RGamma(G-hat,
   O(Z^1(W,G-hat)) tensor V) being an isomorphism for all V in Rep G-hat; it holds after
   inverting l by semisimplicity, and on underlying complexes by VIII.3.5, so it suffices
   mod l.
2. Prove the characteristic-l statement using the good-filtration t-structure and the
   fixed-point/Donkin results of VIII.5.3.
3. NOTE: the proof of Theorem VIII.5.2 itself (printed pp. 296-301) was not read.

**Acceptance.**

- Check the base change of invariants from Z_l to F_l-bar on a split torus
- Exhibit a G-hat with l dividing |pi_1(G-hat)_tors| and check that the conclusion can fail, or record that no such example is displayed in the source
- Check the rational version without the hypothesis

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`, `mathlib:FreeGroup`, `mathlib:CommRing`, `mathlib:RootPairing`, `mathlib:groupCohomology`

**Sources.**

- *Theorem VIII.5.1, printed p. 293.* “Assume that l does not divide the order of pi_1(G-hat)_tors. Then the map colim_{(n,F_n -> W)} O(Z^1(F_n,G-hat)) -> O(Z^1(W,G-hat)) is an isomorphism in the presentable stable infinity-category Ind Perf(*/G-hat).”
  The integral theorem with its exact hypothesis.
- *Theorem VIII.0.2, printed p. 277.* “Then H^i(G-hat, O(Z^1(W_E/P,G-hat))) = 0 for i > 0 and the formation of the invariants O(Z^1(W_E/P,G-hat))^{G-hat} commutes with any base change.”
  The vanishing and base-change consequences the stage text asks for.
- *VIII introduction, printed p. 278.* “All of these results also hold with Q_l-coefficients, without the assumption on l.”
  Confirms that the rational statements are separate and unrestricted, as the stage
  text requires.

### FS VIII.2.1: the unipotent monodromy map, and why a semisimplification is not a Weil-Deligne parameter

`LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map` — *comparison*

**Statement.**

Fix an isomorphism I_E/P_E = Z-hat^p. There is a G-hat_{Q_l}-EQUIVARIANT 'unipotent
monodromy' morphism M : Z^1(W_E,G-hat)_{Q_l} -> N_{G-hat_{Q_l}}, where N_{G-hat_{Q_l}}
is the nilpotent cone inside g-hat_{Q_l}. This is what records the monodromy of a
parameter in characteristic zero, and it is the extra datum that a WEIL-DELIGNE
parameter carries and that a semisimple parameter does not. The coarse quotient
Z^1(W_E,G-hat) // G-hat sees only SEMISIMPLE parameters, by the closed-orbit
description; so a point of the coarse quotient is a SEMISIMPLIFICATION and never
determines the monodromy. The roadmap's instruction to 'distinguish semisimplification
from a full Weil-Deligne parameter with monodromy' is exactly this distinction, and the
instruction that 'no Galois pseudorepresentation for GL_n alone defines the general
reductive quotient' is the corresponding warning on the other side.

**Hypotheses and warnings.**

- The monodromy map exists only after inverting l: it is defined on
  Z^1(W_E,G-hat)_{Q_l}. There is no integral counterpart in anything read
- The map lands in the NILPOTENT CONE, and it is G-hat-equivariant, so it descends to a
  map of stacks but NOT to a map on the coarse quotient, since the nilpotent cone's
  coarse quotient is a point
- Fargues-Scholze's Definition VIII.2.4 of a Weil-Deligne parameter is made for Q_l-
  ALGEBRAS ONLY; that restriction is part of the statement and was located but its
  surrounding text was not read beyond the definition's position
- The identification I_E/P_E = Z-hat^p is a CHOICE, like the choice of tame generator in
  LP0
- This node is a boundary marker: it records what the coarse quotient does not see, and
  it does not construct the Weil-Deligne moduli

**Proof outline.**

1. Fix the isomorphism I_E/P_E = Z-hat^p and record the monodromy morphism to the
   nilpotent cone.
2. Observe that it is G-hat-equivariant and defined only rationally.
3. Record that the coarse quotient parametrises closed orbits, hence semisimple
   parameters, and therefore cannot see the monodromy.

**Acceptance.**

- Check that the monodromy map is defined only after inverting l
- Check that it lands in the nilpotent cone and is equivariant
- Check that two parameters with the same semisimplification and different monodromy have the same image in the coarse quotient
- Check that the Weil-Deligne definition of the source is for Q_l-algebras only

**Prerequisites.** `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `ReductiveGroupsPartII:RG2.5`, `mathlib:RootPairing`, `mathlib:Representation`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Section VIII.2.1, printed p. 282.* “Fix an isomorphism I_E/P_E = Z-hat^p. There is a G-hat_{Q_l}-equivariant 'unipotent monodromy' morphism M : Z^1(W_E,G-hat)_{Q_l} -> N_{G-hat_{Q_l}} where N_{G-hat_{Q_l}} is the nilpotent cone inside g-hat_{Q_l}.”
  The monodromy map, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Section VIII.3.1, printed p. 285.* “For any algebraically closed field L over Z_l, the L-valued points of Z^1(W_E,G-hat)_L // G-hat are in bijection with the closed G-hat-orbits in Z^1(W_E,G-hat)_L.”
  Why the coarse quotient sees only semisimplifications.

### FS VIII.3.7's second half: the universal property over W_E/P, and independence of the discretisation

`LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity` — *theorem* · planet **Evaluations over W_E and independence**

**Statement.**

The l-TORSION-FREE QUOTIENT of Exc(W,G-hat) is also the UNIVERSAL FLAT Z_l-algebra A'
equipped with maps Theta'_n : O((G-hat semidirect Q)^n // G-hat) -> Map((W_E/P)^n, A')
for n >= 1, linear over O(Q^n) -> Map((W_E/P)^n, A'), satisfying the same relations as
in Proposition VIII.3.7, where the right-hand side denotes the maps of CONDENSED SETS,
A' being relatively discrete over Z_l. In particular the l-torsion-free quotient of
Exc(W,G-hat) is INDEPENDENT OF THE DISCRETISATION W of W_E/P. Fargues-Scholze add that
they DO NOT KNOW whether it is necessary to pass to the l-torsion-free quotient for that
assertion; that if l does not divide the order of pi_1(G-hat)_tors then Exc(W,G-hat) =
O(Z^1(W_E/P,G-hat))^{G-hat} is FLAT over Z_l; and that the l-torsion in Exc(W,G-hat) is
always NILPOTENT, so passing to the quotient is a universal homeomorphism. The proof
that the second description is equivalent uses that Map((W_E/P)^n,A') injects into
Map(W^n,A') by density of W, and that the l-torsion-free quotient of Exc injects into
O(Z^1(W_E/P,G-hat))^{G-hat} since the two agree after inverting l, so only integrality
has to be checked.

**Hypotheses and warnings.**

- This supplies exactly what the stage text calls 'transition maps under shrinking P and
  continuity of evaluations on W_E': the evaluations are maps of CONDENSED SETS on
  (W_E/P)^n, not merely maps on W^n
- The independence of the discretisation is asserted only for the l-TORSION-FREE
  QUOTIENT, and the source says it does not know whether that is necessary. A
  formalisation must not silently upgrade it
- Under the good-prime hypothesis Exc is flat and the question disappears; without it
  the l-torsion is nilpotent so nothing changes on points, only on functions
- The universal property is for FLAT Z_l-algebras A', which is a restriction on the
  class of test objects and is part of the statement

**Proof outline.**

1. State the second universal property, over (W_E/P)^n and with condensed-set targets.
2. Show that it is a priori stronger, since Map((W_E/P)^n,A') injects into Map(W^n,A') by
   density.
3. Show that the l-torsion-free quotient of Exc injects into the invariant algebra, since
   the two agree after inverting l, so only integrality must be checked; conclude that
   the property already holds there.
4. Record the flatness under the good-prime hypothesis and the nilpotence of the
   l-torsion in general.

**Acceptance.**

- Check that the second description is over W_E/P and with condensed targets
- Check that the independence claim is only for the l-torsion-free quotient
- Check that the l-torsion is nilpotent, so the passage is a universal homeomorphism
- Check that the test objects are FLAT Z_l-algebras

**Prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP0/change-of-discretization`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `mathlib:CommRing`, `mathlib:Module.Flat`, `mathlib:Condensed`, `mathlib:FreeGroup`

**Sources.**

- *After Proposition VIII.3.7, printed p. 289.* “The l-torsion free quotient of Exc(W,G-hat) is also the universal flat Z_l-algebra A' equipped with maps Theta'_n : O((G-hat semidirect Q)^n // G-hat) -> Map((W_E/P)^n, A') for n >= 1, linear over O(Q^n) -> Map((W_E/P)^n,A'), satisfying the same relations as in Proposition VIII.3.7, where the right-hand side denotes the maps of condensed sets. In particular, the l-torsion free ...”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *After Proposition VIII.3.7, printed p. 289.* “We do not know whether it is necessary to pass to the l-torsion free quotient for the final assertion. Note that if l does not divide the order of pi_1(G-hat)_tors, then Exc(W,G-hat) = O(Z^1(W_E/P,G-hat))^{G-hat} is flat over Z_l. Moreover note that the l-torsion in Exc(W,G-hat) is always nilpotent, so passing to this quotient is a universal homeomorphism.”
  The caveats, quoted verbatim - an open question the source states about its own
  construction.
- *Proof of Proposition VIII.3.7, printed p. 289.* “The second description is a priori stronger as Map((W_E/P)^n,A') injects into Map(W^n,A') as W inside W_E/P is dense. The l-torsion free quotient of Exc(W,G-hat) injects into O(Z^1(W_E/P,G-hat))^{G-hat} (as we have an isomorphism after inverting l), and by density of W inside W_E/P the elements of Map(W^n,Exc(W,G-hat)) map to elements of Map((W_E/P)^n, ...”
  The proof, quoted verbatim. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.

**What remains in this layer.**

- The source states that it DOES NOT KNOW whether passing to the l-torsion-free quotient
  is necessary for the independence of the discretisation. That open question is carried
  here and not smoothed over.
- Fargues-Scholze's Definition VIII.2.4 of a Weil-Deligne parameter is for Q_l-ALGEBRAS
  only; the surrounding text of Section VIII.2.1 was read for the monodromy morphism but
  the definition's own development was not.
- No example was found in the source showing that the invariant theorem FAILS when l
  divides the order of pi_1(G-hat)_tors; what the source does show, through the
  backwards direction of Proposition VIII.5.11, is that the GENERATION statement fails,
  which is planned in LP3 and LP4.
- The transition maps under SHRINKING P, as opposed to the evaluations at a fixed P,
  were not located as a proved statement.

## LP3 — Integral reductive invariant theory

*Coverage: **partial**. 6 nodes.*

Good filtrations, the good-filtration t-structure and its SEPARATEDNESS - which is the
whole reason for introducing it, the standard t-structure being far from separated; the
good filtration of O(G) and hence of the cocycle algebras; the equivariant vector-bundle
machinery of Propositions VIII.5.10 to VIII.5.13, READ IN FULL in this session,
including the equivalence that makes the hypothesis on pi_1(G^circ)_tors NECESSARY; the
fixed-point theory for prime-to-l group actions; the Donkin subgroup property with the
characteristic-two counterexample; and the stock-taking that the machinery already
settles the tame and compact-Riemann-surface cases, leaving only the wild part.

### FS VIII.5.1: good filtrations, the good-filtration t-structure, and the cocycle algebra's good filtration

`LanglandsParameterStacks:LP3/good-filtration-t-structure` — *construction* · planet **The good-filtration t-structure**

**Statement.**

For G reductive over an algebraically closed field of characteristic l: V admits a good
filtration if and only if H^i(G,V tensor nabla_lambda) = 0 for i > 0 for all lambda
(Donkin). The good-filtration dimension of V is the minimal i with H^j(G, V tensor
nabla_lambda) = 0 for all lambda and j > i; every finite-dimensional representation has
finite good filtration dimension. On Ind Perf(*/G), compactly generated by bounded
complexes of G-representations, the GOOD FILTRATION T-STRUCTURE has connective part {M :
H^i(G, M tensor nabla_lambda) = 0 for i > 0 for all lambda} and coconnective part {M :
H^i(G, M tensor Delta_lambda) = 0 for i < 0 for all lambda}; it is SEPARATED, unlike the
standard t-structure. O(G) with the G x G-action admits a good filtration (Koppinen,
Donkin), hence for any map F_n -> Aut(G) the G-representation O(Z^1(F_n,G)) admits a
good filtration.

**Hypotheses and warnings.**

- The tensor-product stability of good filtrations is the theorem of Donkin and Mathieu;
  the vanishing H^i(G,V) = 0 for i > 0 when V has a good filtration reduces to V =
  nabla_lambda and is Kempf's vanishing theorem. Neither was read
- Perf(*/G) is NOT stable under the truncation operations of the good-filtration
  t-structure; Fargues-Scholze warn about this explicitly
- The existence of the t-structure follows from Lurie's Higher Algebra Proposition
  1.4.4.11
- The standard t-structure on Ind Perf(*/G) is FAR FROM SEPARATED because of infinite
  cohomological dimension; separatedness of the good-filtration t-structure is what
  makes it usable
- Corollary VIII.5.7 uses that Z^1(F_n,G) = G^n with simultaneous twisted conjugation,
  that O(G^n) has a good filtration as a G^{2n}-representation, and stability of good
  filtrations under tensor products on restricting to the diagonal G inside G^{2n}

**Proof outline.**

1. Donkin's criterion characterises good filtrations by Ext-vanishing against the
   costandard modules.
2. Define the good-filtration dimension and the t-structure; existence by Lurie 1.4.4.11.
3. Separatedness: if M is infinity-connective then so is RGamma(G, M tensor
   nabla_lambda), hence zero; since this detects M = 0, the t-structure is separated.
4. O(G) has a good G x G-filtration by Koppinen/Donkin; restricting O(G^n) from G^{2n} to
   the diagonal G and using tensor stability gives Corollary VIII.5.7.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HasGoodFiltration` | data | V has a good filtration iff H^i(G, V tensor nabla_lambda) = 0 for i > 0 and all lambda (Donkin). |
| `goodFiltrationDimension` | data | The minimal i with H^j(G, V tensor nabla_lambda) = 0 for all lambda and j > i; finite for every finite-dimensional representation (Touze-van der Kallen). |
| `goodFiltrationTStructure` | data | The t-structure on IndPerf(*/G) whose connective part is generated under colimits by the nabla_lambda. |
| `goodFiltrationTStructure.separated` | structure | It is SEPARATED, unlike the standard t-structure, which fails to be because of infinite cohomological dimension. This is the whole reason for introducing it. |
| `perfNotStable` | structure | Perf(*/G) inside IndPerf(*/G) is NOT stable under the truncation operations of this t-structure; statements are made about connectivity, not about truncations. |
| `OG.goodFiltration` | example | O(G) has a good G x G-filtration (Koppinen, Donkin), whence O(Z^1(F_n,G)) has a good G-filtration for the twisted simultaneous conjugation. |

**Where it is used.**

- `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation` — the Donkin property is stated in these terms
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem` — the vanishing and base-change statements are proved with this t-structure
- `LanglandsParameterStacks:LP4/generation-and-module-comparison` — the generation statement is proved by connectivity arguments in it

**Unit tests.**

- `separatedness` — The good-filtration t-structure is separated; the standard one is not, and the proof of the integral theorem needs separatedness.
- `perf_not_closed_under_truncation` — Perf(*/G) is not stable under the truncations; a development that assumes it is has assumed something false.
- `OG_has_good_filtration` — O(G) has a good G x G-filtration; this is the imported Koppinen-Donkin theorem and is what makes O(G^n) good.
- `char_zero_degenerate` — In characteristic zero every representation has a good filtration and the t-structure is the standard one; the integral content disappears.

**Acceptance.**

- Check Donkin's criterion for SL_2 and a Weyl module in characteristic l
- Check that Perf(*/G) is not stable under the truncations
- Check the good filtration of O(Z^1(F_1,G)) = O(G) under twisted conjugation

**Prerequisites.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:Representation`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:RootPairing`, `mathlib:Module.Free`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `tauceti:TauCeti.YoungTableau.weylModule`

**Sources.**

- *Definition VIII.5.4 and the paragraph after it, printed pp. 294-295.* “(i) An object M in Ind Perf(*/G) lies in the connective part of the t-structure if for all lambda one has H^i(G, M tensor nabla_lambda) = 0 for i > 0; equivalently, if M has good filtration dimension <= 0. (ii) An object M in Ind Perf(*/G) lies in the coconnective part of the t-structure if for all lambda one has H^i(G, M tensor Delta_lambda) = 0 for i < 0. ... We warn the ...”
  The t-structure with the explicit warning about Perf. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *Corollary VIII.5.7 and proof, printed p. 295.* “For any map F_n -> Aut(G), the G-representation O(Z^1(F_n,G)) admits a good filtration. Proof. Note that Z^1(F_n,G) = G^n, where the G-action is that of simultaneous twisted conjugation (by the n given automorphisms of G). But O(G^n) admits a good filtration as representation of G^{2n}, and restricting to G in G^{2n} it remains good by stability under tensor products.”
  The statement that feeds the integral invariant theorem, with its full proof.

### FS VIII.5.14 and VIII.5.19: fixed points of a prime-to-l group action are reductive with prime-to-l component group

`LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions` — *theorem* · planet **Fixed points of prime-to-l actions**

**Statement.**

Let L be algebraically closed of characteristic l > 0 and G a linear algebraic group
over L with G^circ reductive and pi_0 G of order prime to l. Let P be a FINITE group of
order PRIME TO l acting on G and H = G^P. Then H is a smooth linear algebraic group,
H^circ is reductive, and pi_0 H is of order prime to l. Moreover (VIII.5.19), if P is in
addition SOLVABLE and pi_1(G^circ)_tors has order prime to l, then also
pi_1(H^circ)_tors has order prime to l.

**Hypotheses and warnings.**

- P must be FINITE of order PRIME TO l; the smoothness of fixed points of a finite group
  of order prime to the characteristic is the standard fact used
- Reductivity of H^circ is quoted from [PY02, Theorem 2.1]
- The prime-to-l order of pi_0 H is proved using the good-filtration dimension theory:
  O(product over P minus {1} of G) has a good G-filtration, and by [TvdK10, Corollary
  1.5] every G-equivariant finitely generated module over it has finite good filtration
  dimension, so H^i(G,M) = 0 for large i; a subgroup H' of H with pi_0 H' = Z/lZ would
  give RGamma(G,O(G/H')) = RGamma(H',L) = RGamma(Z/lZ,L) with cohomology in all positive
  degrees, a contradiction
- Fargues-Scholze note the pi_0 argument 'probably uses unnecessarily heavy machinery'
  and that for solvable P it follows from Steinberg's theorem by reducing to cyclic P
  and simply connected G
- VIII.5.19's proof is a case-by-case run through the classification of simple groups
  and their automorphisms

**Proof outline.**

1. Reduce to G connected; smoothness and affineness of fixed points is standard;
   reductivity of H^circ is [PY02, Thm. 2.1].
2. For pi_0 H: consider the action of G on the product over P minus {1} of G with Theta-
   twisted conjugation on each factor, whose coordinate algebra has a good G-filtration;
   apply [TvdK10, Cor. 1.5] to bound good filtration dimensions; G/H is a closed orbit; a
   Z/lZ in pi_0 H would give unbounded cohomology, a contradiction.
3. For VIII.5.19: induct to P = Z/pZ cyclic of prime order p != l, pass to the derived
   group and its simply connected cover, assume G simple, and run through types A, B, C,
   D (with triality) and the exceptional groups.

**Acceptance.**

- Check the statement for P = Z/2Z acting on SL_2 by an involution
- Check that the prime-to-l hypothesis on |P| cannot be dropped (see the characteristic-two example of Remark VIII.5.18)
- Check pi_1 preservation in type A under an outer involution

**Prerequisites.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:Subgroup`, `tauceti:TauCeti.fixedSubgroup`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- *Proposition VIII.5.14, printed p. 301.* “Let L be an algebraically closed field of characteristic l > 0, and let G be a linear algebraic group over L such that G^circ is reductive and pi_0 G is of order prime to l. Assume that P is a finite group of order prime to l acting on G and let H = G^P be the fixed points. Then H is a smooth linear algebraic group, H^circ is reductive, and pi_0 H is of order prime to l.”
  Exact statement with all three hypotheses.
- *Proposition VIII.5.19, printed p. 310.* “Assume that G^circ is reductive and that P is a finite solvable group of order prime to l acting on G with fixed points H = G^P. If pi_1(G^circ)_tors is of order prime to l, then also pi_1(H^circ)_tors is of order prime to l.”
  The compatibility that lets the prime-to-l fundamental-group hypothesis survive the
  fixed-point construction.

### FS VIII.5.15, VIII.5.17 and Remark VIII.5.18: the Donkin property, generation of Perf, and the characteristic-two counterexample

`LanglandsParameterStacks:LP3/donkin-subgroup-and-generation` — *theorem* · planet **The Donkin subgroup property**

**Statement.**

Assume in addition that P is SOLVABLE. Then H^circ inside G^circ is a DONKIN SUBGROUP:
for any representation V of G^circ admitting a good G^circ-filtration, V|_{H^circ}
admits a good H^circ-filtration; equivalently, for any W of H^circ with a good
filtration, Ind_{H^circ}^{G^circ} W admits a good G^circ-filtration. Proposition
VIII.5.17 lists six equivalent assertions, including (v) the image of Perf(*/G^circ) ->
Perf(*/H^circ) generates under cones and retracts, and (vi) the same for Perf(*/G) ->
Perf(*/H). Remark VIII.5.18 shows the prime-to-l hypothesis on |P| cannot be weakened to
'quasi-semisimple' or even pinning-preserving automorphisms, and that the precise form
of the centre matters: for G = (SL_2 x SL_2)/mu_2 with the switching automorphism, H =
PGL_2 x (mu_2 x mu_2)/mu_2, and if l = 2 the nontrivial character of H is NOT generated
by Perf(*/G) under cones and retracts.

**Hypotheses and warnings.**

- SOLVABILITY of P is assumed for VIII.5.15 and VIII.5.17; Fargues-Scholze say it is
  'the only case relevant to us'
- The equivalence of the good-filtration and the induced-filtration formulations is
  Proposition VIII.5.3 applied to H^circ
- Remark VIII.5.18's example shows the failure is at l = 2 for a group whose centre is
  (SL_2 x SL_2)/mu_2; the obstruction is that for A in Perf(*/H) in the image of
  Perf(*/G), the summand A_1 with nontrivial central character has perfect homotopy
  invariants for the Z/2Z inside PGL_2
- Fargues-Scholze note that in a previous version assertion (vi) was proved by an
  exhaustive case analysis, and that the individual assertions 'do not generally allow
  simple reductions to the case that G is simply connected and the precise form of the
  center matters'

**Proof outline.**

1. VIII.5.15: use Proposition VIII.5.3 to see the two formulations are equivalent, then
   prove the Donkin property using the good-filtration t-structure.
2. VIII.5.17: prove (i),(iii),(v) equivalent and (ii),(iv),(vi) equivalent; (v) is
   equivalent to the bar resolution ... -> Ind Ind W -> Ind W -> W -> 0 being a
   resolution in Ind Perf(*/H^circ).
3. NOTE: only the statements, the list (i)-(vi), Remark VIII.5.18 and the opening of the
   proof of VIII.5.17 were read; the proofs of VIII.5.15 and VIII.5.17 were not.

**Acceptance.**

- Reproduce the characteristic-two example and check that the nontrivial character of H is not generated
- Check the Donkin property for a Levi subgroup, which the theorem generalises
- Check the equivalence of (v) and (vi)

**Prerequisites.** `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- *Theorem VIII.5.15, printed p. 302.* “The subgroup H^circ in G^circ is a Donkin subgroup. In other words, for any representation V of G^circ that admits a good G^circ-filtration, also V|_{H^circ} admits a good H^circ-filtration. Equivalently, for any representation W of H^circ that admits a good H^circ-filtration, also Ind_{H^circ}^{G^circ} W admits a good G^circ-filtration.”
  The Donkin subgroup property, under the standing solvability assumption.
- *Remark VIII.5.18, printed p. 308.* “The following example shows that the hypothesis that P is of order prime to l is important, and cannot be weakened to 'quasi-semisimple' automorphisms (preserving a Borel and a torus) or even automorphisms fixing a pinning; also, the example shows that the precise form of the center is critical. If G = (SL_2 x SL_2)/mu_2 with the automorphism switching the two factors, then H ...”
  The characteristic-two counterexample that the roadmap names as a guard against
  removing the prime-to-l assumptions. The excerpt is truncated at a word boundary;
  the full passage is on the printed page named in the locator.

### FS VIII.5.5-VIII.5.7: separatedness of the good-filtration t-structure, and O(Z^1(F_n,G))

`LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG` — *theorem*

**Statement.**

The good-filtration t-structure on IndPerf(*/G) is SEPARATED. This is the point of
introducing it: the standard t-structure on IndPerf(*/G) is FAR FROM SEPARATED, because
of infinite cohomological dimension, which is the main issue the integral theorem has to
address. The proof is short: for M in IndPerf(*/G), to see M = 0 it suffices that
RGamma(G, M tensor nabla_lambda) = 0 for all lambda; and if M is infinitely connective
for the good-filtration t-structure then so is each RGamma(G, M tensor nabla_lambda),
hence zero. Further, the G x G-representation O(G), for left and right multiplication,
ADMITS A GOOD FILTRATION (Koppinen, Donkin); consequently, for any map F_n -> Aut(G),
the G-representation O(Z^1(F_n,G)) admits a good filtration, because Z^1(F_n,G) = G^n
with G acting by simultaneous TWISTED conjugation, O(G^n) has a good filtration as a
representation of G^{2n}, and restricting along G -> G^{2n} it remains good by stability
of good filtrations under tensor products, the induced representations of G^{2n} being
tensor products of induced representations of the factors.

**Hypotheses and warnings.**

- Separatedness is the property the standard t-structure lacks and is what the argument
  needs; the source says the failure of the standard one is the main issue to be
  addressed
- Perf(*/G) inside IndPerf(*/G) is NOT stable under the truncation operations of this
  t-structure, so statements are about connectivity and not about truncations
- The good filtration of O(G) is quoted from Koppinen and Donkin; NEITHER WAS READ.
  Stability of good filtrations under tensor products is Donkin-Mathieu and was not read
  either
- The twisting by the n given automorphisms is what makes Z^1(F_n,G) rather than G^n
  with plain conjugation; the restriction argument is along the diagonal-ish map G ->
  G^{2n} determined by the twists

**Proof outline.**

1. Prove separatedness by testing against the nabla_lambda and using that infinite
   connectivity passes to cohomology.
2. Quote Koppinen and Donkin for the good G x G-filtration of O(G).
3. Identify Z^1(F_n,G) with G^n under twisted simultaneous conjugation.
4. Restrict the good G^{2n}-filtration of O(G^n) along G -> G^{2n} and use tensor
   stability.

**Acceptance.**

- Check that the standard t-structure is not separated and that the good-filtration one is
- Check that Perf is not stable under truncation
- Check the identification Z^1(F_n,G) = G^n with twisted simultaneous conjugation
- Check that tensor stability of good filtrations is an imported theorem

**Prerequisites.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:Representation`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:FreeGroup`, `mathlib:RootPairing`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- *Proposition VIII.5.5, printed p. 295.* “The good filtration t-structure on IndPerf(*/G) is separated. We note that the standard t-structure on IndPerf(*/G) is far from separated, due to issues of infinite cohomological dimension (which is the main issue we have to address).”
  The statement and why it matters, quoted verbatim. Read directly from the hash-
  verified PDF in this session.
- *Theorem VIII.5.6, printed p. 295.* “([Kop84],[Don88]) The G x G-representation O(G) (via left and right multiplication) admits a good filtration.”
  The imported theorem, quoted verbatim.
- *Corollary VIII.5.7, printed p. 295.* “For any map F_n -> Aut(G), the G-representation O(Z^1(F_n,G)) admits a good filtration. Proof: Note that Z^1(F_n,G) = G^n, where the G-action is that of simultaneous twisted conjugation (by the n given automorphisms of G). But O(G^n) admits a good filtration as representation of G^{2n}, and restricting to G inside G^{2n} it remains good by stability under tensor products.”
  The consequence for the cocycle algebras, quoted with its proof.

### FS VIII.5.10-VIII.5.13: when equivariant perfect complexes are generated by representations

`LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind` — *theorem* · planet **Equivariant perfect complexes and generation**

**Statement.**

Let G have reductive identity component and pi_0 G of order prime to l, acting on X =
Spec A with A admitting a good G-filtration, and let Perf^ind(X/G) inside Perf(X/G) be
the full subcategory generated under cones and retracts by the image of Perf(*/G). THE
CRITERION (VIII.5.10): for M in Perf(X/G) of good-filtration dimension <= 0, M lies in
Perf^ind(X/G) if and only if for all N in Perf(X/G) of good-filtration dimension <= 0,
also M tensor_A N has good-filtration dimension <= 0. THE KEY RESULT (VIII.5.11): for G
acting on itself by conjugation and i : * -> G the unit, the following are EQUIVALENT:
(i) the order of pi_1(G^circ)_tors is not divisible by l; (ii) i_* L lies in
Perf^ind(G/G); (iii) the inclusion Perf^ind(G/G) inside Perf(G/G) is an EQUALITY. The
backwards direction shows that (i) is REALLY REQUIRED. THE TWISTED FORM (VIII.5.12): if
in addition the orders of pi_0 G and pi_1(G^circ)_tors are prime to l and
sigma_1,...,sigma_n are automorphisms of G, then for G acting on G^n by g .
(g_1,...,g_n) = (g g_1 sigma_1(g)^{-1}, ..., g g_n sigma_n(g)^{-1}), the inclusion
Perf^ind(G^n/G) inside Perf(G^n/G) is an equality. THE FIBRE-PRODUCT FORM (VIII.5.13):
for a derived fibre product X = X-tilde x_G * over the adjoint action with the unit, the
map L tensor^L_{O(G)} A-tilde -> A is an isomorphism in IndPerf(*/G); and if moreover
Perf(X-tilde/G) = Perf^ind(X-tilde/G) and A-tilde is connective for the good-filtration
t-structure, then so is A and Perf(X/G) = Perf^ind(X/G).

**Hypotheses and warnings.**

- Proposition VIII.5.11's backwards direction is what shows the hypothesis on
  pi_1(G^circ)_tors is NECESSARY, not merely convenient; Fargues-Scholze say they use
  mainly the forward implication but keep the converse for exactly this reason
- The proof of the converse constructs a central extension G-tilde -> G with simply
  connected derived group whose kernel has order divisible by l, and compares f_*
  O(G-tilde) with i_* L
- The criterion VIII.5.10 uses Touze-van der Kallen's finiteness of good-filtration
  dimension, and the separatedness of the good-filtration t-structure; neither is proved
  here, the first being imported
- In positive characteristic these objects are usually NOT COMPACT in D(X/G), even for G
  reductive; the source warns of this explicitly
- VIII.5.12 is the case the parameter space needs: Z^1(F_n,G-hat) is exactly G-hat^n
  with that twisted action, so the tame case and the compact-Riemann-surface case follow
  at once, and only the WILD part remains
- These propositions ARE the proof of Theorem VIII.5.2, which the integrated
  decomposition recorded as unread

**Proof outline.**

1. Prove the criterion VIII.5.10 by writing the derived tensor product as a colimit with
   extra degeneracies and using finiteness of good-filtration dimension and
   separatedness.
2. Prove VIII.5.11 (ii) implies (i) by the central extension with kernel of order
   divisible by l; prove (i) implies (iii) by resolving the structure sheaf of the
   diagonal and generating O_{G/G} in Perf((G x G)/G).
3. Deduce VIII.5.12 by applying VIII.5.11 to G^n and pulling back along the
   multiplication map q.
4. Deduce VIII.5.13 from VIII.5.11, which makes the derived tensor product finitary and
   hence conservative after forgetting the G-action.

**Acceptance.**

- Check that the hypothesis on pi_1(G^circ)_tors is necessary, by the backwards direction
- Check that Perf(X/G) objects need not be compact in D(X/G) in positive characteristic
- Check the twisted action in VIII.5.12 against the definition of Z^1(F_n,G)
- Check that the tame and compact-Riemann-surface cases follow, and that only the wild part remains

**Prerequisites.** `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:Module.Flat`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- *Proposition VIII.5.10, printed p. 297.* “Assume that G^circ is reductive and pi_0 G of order prime to l, and G acts on X = Spec(A) such that A admits a good G^circ-filtration. Let M in Perf(X/G) and assume that M, without its A-action, has good G^circ-filtration dimension <= 0. Then M in Perf^ind(X/G) if and only if for all N in Perf(X/G) that have good G^circ-filtration dimension <= 0, also M tensor_A N has good ...”
  The criterion, quoted verbatim. Read directly from the hash-verified PDF in this
  session; this and the following propositions are the proof of Theorem VIII.5.2,
  which the integrated decomposition recorded as unread. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *Proposition VIII.5.11, printed p. 297.* “Assume that G^circ is reductive and pi_0 G is of order prime to l. Let G act on itself via conjugation. Let i : * -> G be the inclusion of the unit element. The following are equivalent. (i) The order of pi_1(G^circ)_tors is not divisible by l. (ii) The object i_* L in Perf(G/G) lies in Perf^ind(G/G). (iii) The inclusion Perf^ind(G/G) inside Perf(G/G) is an equality.”
  The key equivalence, quoted verbatim, with the source's own remark that the
  backwards direction shows (i) is really required.
- *Proposition VIII.5.12, printed p. 299.* “Let sigma_1,...,sigma_n be automorphisms of G, and let G act on G^n via g . (g_1,...,g_n) = (g g_1 sigma_1(g)^{-1},...,g g_n sigma_n(g)^{-1}). Then the inclusion Perf^ind(G^n/G) inside Perf(G^n/G) is an equality.”
  The twisted form, which is exactly the cocycle situation.
- *After Proposition VIII.5.13, printed p. 301.* “These results are already sufficient to handle the case of the space of L-parameters of a compact Riemann surface. ... In fact, the same argument applies for tame L-parameters of local fields. It remains to deal with the wild part.”
  What the machinery already gives and what is left, quoted verbatim.

### What the equivariant machinery already settles, and what the wild part costs

`LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder` — *comparison*

**Statement.**

Fargues-Scholze pause after Proposition VIII.5.13 to record what has been achieved: the
results so far are ALREADY SUFFICIENT to handle the space of L-parameters of a COMPACT
RIEMANN SURFACE, which is a fibre product X = G^{2g} x_G * of the kind Proposition
VIII.5.13 treats, so that Perf(X/G) = Perf^ind(X/G) and A is identified with the
excursion algebra; and the SAME ARGUMENT applies for TAME L-parameters of local fields.
What remains is the WILD PART, and that is what Section VIII.5.3 on fixed-point
subgroups is for: the wild inertia P acts on G-hat through a finite group of order prime
to l, and one has to know that the fixed-point subgroup H = G^P is smooth with reductive
identity component and prime-to-l component group, and - under solvability - that it is
a Donkin subgroup.

**Hypotheses and warnings.**

- This is a boundary marker, not a theorem: it records which part of the integral
  theorem is elementary given the equivariant machinery and which part needs the fixed-
  point theory
- The compact-Riemann-surface case is a fibre product of G^{2g} over G along the
  commutator map with the unit, and is the classical Betti geometric Langlands parameter
  space; that it comes out of the same machinery is worth recording
- The tame case needs no fixed-point theory because P = 1, so Z^1 is a fibre product of
  powers of G-hat
- The wild case is where solvability of P enters, and the solvability hypothesis is
  preserved throughout Section VIII.5.3

**Proof outline.**

1. Identify the compact-Riemann-surface parameter space as a derived fibre product of the
   shape VIII.5.13 treats.
2. Apply VIII.5.12 and VIII.5.13 to get Perf = Perf^ind and the identification with the
   excursion algebra.
3. Observe that the tame case of a local field has the same shape, since P = 1.
4. Record that the wild case requires the fixed-point theory of Section VIII.5.3.

**Acceptance.**

- Check that the Riemann-surface case is a fibre product of the treated shape
- Check that the tame case needs no fixed-point theory
- Check that the wild case is where solvability of P is used

**Prerequisites.** `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:FreeGroup`

**Sources.**

- *After Proposition VIII.5.13, printed p. 301.* “These results are already sufficient to handle the case of the space of L-parameters of a compact Riemann surface. Indeed, this is a certain fibre product X -> G^{2g}, * -> G, and the preceding propositions apply to show Perf(X/G) = Perf^ind(X/G), and identify A with the excursion algebra. In fact, the same argument applies for tame L-parameters of local fields. It remains to ...”
  The stock-taking, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Section VIII.5.3, printed p. 301.* “We will need to know some properties of the fixed points H = G^P of reductive groups G under a (finite) group P of automorphisms of G of order prime to l. (Our choice of notation P is motivated by the later application to the wild inertia group.)”
  Why the fixed-point section exists at all.

**What remains in this layer.**

- ALL SIX modular-representation-theoretic inputs remain unread and none is in the
  maintainer's library, exactly as the integrated decomposition recorded: Donkin's Ext-
  vanishing criterion, Donkin-Mathieu tensor stability, Kempf vanishing, Koppinen-Donkin
  on O(G), Touze-van der Kallen's finiteness of good-filtration dimension, and Prasad-Yu
  on fixed-point reductivity. NEXT SOURCE ACTION: obtain Jantzen, Representations of
  Algebraic Groups, second edition, Part II Chapter 4.
- The proofs of Theorem VIII.5.15 and Proposition VIII.5.17, and Lemma VIII.5.16, were
  read only in their opening lines; the integrated decomposition recorded the same and
  nothing further was read in this session.
- Highest-weight, Weyl and dual-Weyl modules over a reductive group scheme over Z are
  used as given. AUDIT-21 is precise about the gap: Tau Ceti's highest-weight theory is
  for Lie algebras in characteristic zero, which is exactly the case this layer says is
  not enough, and its weylModule is the Schur-Weyl image of a Young symmetriser for
  GL_n, not H^0(G/B, L(lambda)) or its dual.
- AUDIT-21 also records PotentialAutomorphyInfrastructure:PA.1 as a duplicate,
  constructing integral Weyl and dual-Weyl modules with their highest-weight
  filtrations; a request is filed.

## LP4 — Perfect complexes on parameter stacks

*Coverage: **partial**. 4 nodes.*

The generation of Perf on the parameter stack by representation bundles and the module
description of IndPerf; the action of Rep(G-hat) that makes those statements meaningful;
the compact-support factorisation through one finite-wild piece, which the stage text
requires of consumers and which is Chapter X's definition; and the universal property of
the colimit theorem for exact monoidal functors, in both its rational and its integral
forms.

### FS VIII.5.1 (last two clauses): generation of Perf on the parameter stack and the module description of Ind Perf

`LanglandsParameterStacks:LP4/generation-and-module-comparison` — *theorem* · planet **Generation and the module description**

**Statement.**

Assume l does not divide the order of pi_1(G-hat)_tors. Then the infinity-category
Perf(Z^1(W,G-hat)/G-hat) is GENERATED UNDER CONES AND RETRACTS by the image of
Perf(*/G-hat), and Ind Perf(Z^1(W,G-hat)/G-hat) identifies with the infinity-category of
MODULES over O(Z^1(W,G-hat)) in Ind Perf(*/G-hat). Equivalently (Theorem VIII.0.2),
Perf(Z^1(W_E/P,G-hat)/G-hat) is generated under cones, shifts and retracts by the image
of Rep(G-hat), and Ind Perf(Z^1(W_E/P,G-hat)) is equivalent to modules over
O(Z^1(W_E/P,G-hat)) in Ind Perf(BG-hat). All of this also holds with Q_l-coefficients
without the hypothesis on l.

**Hypotheses and warnings.**

- The hypothesis l does not divide |pi_1(G-hat)_tors| is needed for the integral
  statement; the rational statement is unconditional
- Perfect complexes on X/G are the DUALIZABLE objects of the quasicoherent derived
  infinity-category D(X/G); in positive characteristic these are usually NOT compact in
  D(X/G), even for reductive G - Fargues-Scholze warn about this
- The criterion for M in Perf(X/G) to lie in the subcategory generated by Perf(*/G) is
  Proposition VIII.5.8: the natural map colim[... -> M tensor^L A tensor^L M^* -> M
  tensor^L M^*] -> M tensor_A M^* in Ind Perf(*/G) is an isomorphism
- The statement is for a single finite-wild piece Z^1(W_E/P,G-hat); the union over P is
  NOT quasicompact, so a consumer must factor through one piece, as the roadmap notes

**Proof outline.**

1. Reduce to the characteristic-l statement VIII.5.2 as in the integral invariant
   theorem.
2. Use Proposition VIII.5.8's criterion together with the good-filtration machinery and
   the Donkin/fixed-point results of VIII.5.3.
3. NOTE: the proof (printed pp. 296-301 and 308-314) was not read; only the statements
   and Proposition VIII.5.8 were.

**Acceptance.**

- Check generation for a split torus, where everything is explicit
- Check that perfect complexes are not compact in D(X/G) in characteristic l
- Check that the non-quasicompactness of the union over P forces a compact-support factorisation for each object of a consumer category

**Prerequisites.** `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `VStackSheavesAndLisseCategories:VS2`, `ReductiveGroupsPartII:RG2.5`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Representation`

**Sources.**

- *Theorem VIII.5.1, printed p. 293.* “Moreover, the infinity-category Perf(Z^1(W,G-hat)/G-hat) is generated under cones and retracts by Perf(*/G-hat), and Ind Perf(Z^1(W,G-hat)/G-hat) identifies with the infinity-category of modules over O(Z^1(W,G-hat)) in Ind Perf(*/G-hat).”
  The two clauses that this stage owns.
- *VIII.5.2, printed p. 295.* “We warn the reader that, being in positive characteristic, these objects are usually not compact in D(X/G), even when G is reductive.”
  A scope caveat that must be preserved when restating the module comparison.
- *Proposition VIII.5.8, printed p. 296.* “Let M in Perf(X/G), with dual M^* and internal endomorphisms M tensor_A M^* in Perf(X/G). Then M is in Perf^{ind}(X/G) if and only if the natural map colim[... -> M tensor^L A tensor^L M^* -> M tensor^L M^*] -> M tensor_A M^* in Ind Perf(*/G) is an isomorphism.”
  The generation criterion actually used.

### FS X.0: the parameter stack is not quasicompact, and what compact support means for a consumer

`LanglandsParameterStacks:LP4/compactly-supported-actions` — *definition* · planet **Compactly supported actions**

**Statement.**

Z^1(W_E,G-hat) is NOT QUASICOMPACT: it has infinitely many connected components. It can
be written as the INCREASING UNION of the open and closed QUASICOMPACT subschemes
Z^1(W_E/P,G-hat), indexed by the open subgroups P of the wild inertia. An action of
Perf(Z^1(W_E,G-hat)/G-hat) on a stable infinity-category C is COMPACTLY SUPPORTED if for
all X in C the functor Perf(Z^1(W_E,G-hat)/G-hat) -> C induced by acting on X factors
over some Perf(Z^1(W_E/P,G-hat)/G-hat). The condition is OBJECT BY OBJECT: no single P
is asked to work for all of C. This is the factorisation the LP4 stage text requires of
a consumer, and it is what makes the equivalence of the spectral-action theorem correct
on a non-quasicompact base.

**Hypotheses and warnings.**

- The exhausting subschemes are OPEN AND CLOSED as well as quasicompact, which is what
  the decomposition by the kernel on wild inertia gives; that is LP1's lemma
- Compact support is per object; a uniform P over all of C is a strictly stronger and
  false condition
- The definition belongs to LP4 as the universal algebraic input, and NOT to the
  consumer: the LP4 stage text says 'LP4 does not assume ES's spectral action; it
  supplies its universal algebraic input'
- The decomposition recorded that FS Chapter X was unread and that this factorisation
  had not been located as a proved statement; it is Definition-level material at the
  head of Chapter X, printed p. 339, and is quoted here

**Proof outline.**

1. Record the non-quasicompactness and the exhaustion by the quasicompact open and closed
   Z^1(W_E/P,G-hat).
2. Define a compactly supported action by the per-object factorisation condition.
3. Match the indexing with LP1's decomposition by the kernel on wild inertia.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `notQuasicompact` | structure | Z^1(W_E,G-hat) has infinitely many connected components. |
| `exhaustion` | data | The increasing union of the open, closed and quasicompact Z^1(W_E/P,G-hat). |
| `IsCompactlySupported` | data | For every X in C the functor given by acting on X factors over some Perf(Z^1(W_E/P,G-hat)/G-hat). |
| `IsCompactlySupported.objectwise` | structure | P may depend on X; a uniform P is a different and stronger condition. |
| `matchesWildDecomposition` | compatibility | The indexing is LP1's decomposition of Z^1 by the kernel on the wild inertia. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES2` — the rational spectral action is asserted to be compactly supported
- `ExcursionOperatorsAndSpectralAction:ES3` — the integral theorem is an equivalence with compactly supported actions
- `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property` — the universal property is stated for such actions

**Unit tests.**

- `objectwise_not_uniform` — The factorisation is per object; a uniform P is false in general.
- `open_and_closed` — The exhausting pieces are open AND closed, which is what LP1's decomposition gives.
- `needed_for_the_equivalence` — Dropping compact support breaks the spectral-action equivalence: an action on the whole non-quasicompact stack is more data than a Hecke family.

**Acceptance.**

- Check that the condition is object by object
- Check that the exhausting pieces are open and closed as well as quasicompact
- Check that the indexing matches LP1's decomposition

**Prerequisites.** `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `VStackSheavesAndLisseCategories:VS2`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Head of Chapter X, printed p. 339.* “Note that Z^1(W_E,G-hat) is not quasicompact, as it has infinitely many connected components; it can be written as the increasing union of open and closed quasicompact subschemes Z^1(W_E/P,G-hat). We say that an action of Perf(Z^1(W_E,G-hat)/G-hat) on a stable infinity-category C is compactly supported if for all X in C the functor Perf(Z^1(W_E,G-hat)/G-hat) -> C (induced by ...”
  The definition, quoted verbatim. Read directly from the hash-verified PDF in this
  session; the integrated decomposition recorded Chapter X as unread and this
  factorisation as not located. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.

### FS X.0.1, X.1.1 and X.3.1: the colimit theorem's universal property for exact monoidal functors

`LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property` — *theorem* · planet **The universal property of the colimit theorem**

**Statement.**

The finite-free-group colimit theorem has the universal property the LP4 stage text asks
for, and the answer to the question the integrated decomposition left open is that THE
INTEGRAL VERSION DOES IMPOSE the restriction that l not divide the order of
pi_1(G-hat)_tors. Precisely: (RATIONAL, FS X.1.1) for H reductive over a field L of
characteristic zero with an action of a finite group Q, S an anima over BQ and C an
idempotent-complete small stable L-linear infinity-category, giving FUNCTORIALLY IN
FINITE SETS I an exact Rep_L(Q^I)-linear MONOIDAL functor Rep_L((H semidirect Q)^I) ->
End_L(C)^{S^I} is EQUIVALENT to giving an L-linear action of Perf(Map_{/BQ}(S,B(H
semidirect Q))). (INTEGRAL, FS X.0.1) assuming l does not divide the order of
pi_1(G-hat)_tors, the same holds over the ring of integers Lambda in a finite extension
of Q_l(sqrt q), with S = BW_E and with COMPACTLY SUPPORTED actions of
Perf(Z^1(W_E,G-hat)_Lambda/G-hat). (X.3.1) over a discrete valuation ring the statement
is true for the SIFTED-COLIMIT APPROXIMATION Perf(Map)-natural, because the naive
analogue fails.

**Hypotheses and warnings.**

- THE ANSWER TO THE DECOMPOSITION'S QUESTION: Theorem X.0.1 states the hypothesis
  'Assume that l does not divide the order of pi_1(G-hat)_tors' in its own first line.
  So the restriction does NOT belong only to the consumer; the integral spectral action
  itself carries it. The rational statement, for Lambda a field over Q_l(sqrt q), holds
  for any prime l
- The proof of X.0.2 is finished by COMBINING the propositions of X.3 with THEOREM
  VIII.5.1, which is LP2:integral-invariants' and LP4's own theorem. So the dependence
  runs from Chapter X back to this roadmap, not the other way
- 'Functorially in the finite set I' means a map on total spaces over Fin of the
  corresponding coCartesian fibrations; a compatible family of functors is not the datum
- Integrally the naive statement is FALSE: the analogue of Lemma X.1.2 fails, and one
  must use the sifted-colimit approximation. That is X.3's subject and is the reason the
  integral theorem is stated the way it is
- The reduction from W_E to a discretisation is by the proof of Proposition IX.5.1
  together with a choice of discretisation, which is LP0's material used from outside

**Proof outline.**

1. State the rational equivalence X.1.1 for an abstract anima S over BQ.
2. State the integral one X.0.1 with its hypothesis and with compactly supported actions.
3. Record that integrally one must pass to the sifted-colimit approximation, since the
   naive analogue fails.
4. Record that the proof is completed by combining X.3's propositions with Theorem
   VIII.5.1.

**Acceptance.**

- Check that the integral statement carries the hypothesis on pi_1(G-hat)_tors and the rational one does not
- Check that the functoriality in I is coCartesian
- Check that the integral statement is for the approximation and not for Perf of the mapping stack
- Check that Theorem VIII.5.1, this roadmap's own theorem, is what finishes the proof

**Prerequisites.** `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/compactly-supported-actions`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `VStackSheavesAndLisseCategories:VS2`, `ReductiveGroupsPartII:RG2.5`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`, `mathlib:FreeGroup`, `mathlib:Representation`

**Sources.**

- *Theorem X.0.1, printed p. 339.* “Assume that l does not divide the order of pi_1(G-hat)_tors. Let C be a small idempotent-complete Lambda-linear stable infinity-category. Then giving, functorially in the finite set I, an exact Rep_Lambda(Q^I)-linear monoidal functor Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(C)^{B W_E^I} is equivalent to giving a compactly supported Lambda-linear action of ...”
  The integral theorem WITH its hypothesis, quoted verbatim. Read directly from the
  hash-verified PDF in this session. The integrated decomposition asked whether the
  integral spectral action imposes the restriction that l not divide
  |pi_1(G-hat)_tors|; this sentence answers that it does. The excerpt is truncated at
  a word boundary; the full passage is on the printed page named in the locator.
- *Theorem X.1.1, printed p. 341.* “Let C be an idempotent-complete small stable L-linear infinity-category. Giving, functorially in finite sets I, an exact Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I) -> End_L(C)^{S^I} is equivalent to giving an L-linear action of Perf(Map_{/BQ}(S, B(H semidirect Q))) on C.”
  The rational universal property for EXACT MONOIDAL functors, which is what the stage
  text asks to be established.
- *Head of Section X.3 and Proposition X.3.1, printed p. 348.* “Unfortunately, the naive analogue of Theorem X.1.1 is not true, the problem being that the analogue of Lemma X.1.2 fails. However, the rest of the argument still works ... Giving, functorially in finite sets I, an exact Rep_R(Q^I)-linear monoidal functor ... is equivalent to giving an R-linear action of Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural on C.”
  Why the integral statement is about the sifted-colimit approximation.
- *End of Section X.3, printed p. 350.* “Combining this with Theorem VIII.5.1, we have finished the proof of Theorem X.0.2. In particular, this gives the spectral action on D_lis(Bun_G).”
  That Chapter X's theorem is completed by THIS roadmap's Theorem VIII.5.1, which
  fixes the direction of the dependence.

### The action of Rep(G-hat) on Perf of the finite-wild quotient, and generation by representation bundles

`LanglandsParameterStacks:LP4/rep-action-on-perf` — *construction* · planet **Rep(G-hat) acting on Perf**

**Statement.**

On each finite-wild piece, Perf(Z^1(W_E/P,G-hat)_Lambda / G-hat) carries an action of
Rep_Lambda(G-hat) by tensoring with the pullback of a representation along the structure
map to */G-hat; equivalently, the exact monoidal functor Perf(*/G-hat) ->
Perf(Z^1(W_E/P,G-hat)/G-hat) makes the target a module category over the source. Under
the hypothesis that l not divide the order of pi_1(G-hat)_tors, Theorem VIII.5.1 says
the target is GENERATED UNDER CONES AND RETRACTS by the image of Perf(*/G-hat) - that
is, by the REPRESENTATION BUNDLES - and that IndPerf(Z^1(W,G-hat)/G-hat) identifies with
the modules over O(Z^1(W,G-hat)) in IndPerf(*/G-hat). The generation statement is what
makes every object of Perf reachable from representations, and the module description is
what makes the whole category computable from the cocycle algebra.

**Hypotheses and warnings.**

- The hypothesis on pi_1(G-hat)_tors is NECESSARY for the generation statement, by the
  backwards direction of Proposition VIII.5.11; this is not a convenience
- The generation is under CONES AND RETRACTS - shifts are included in cones - and the
  roadmap adds shifts explicitly; the idempotent-completion is what the retracts provide
- The module description follows from the generation by Barr-Beck-Lurie, since the
  forgetful functor is then conservative; that deduction is in the proof that Theorem
  VIII.5.2 implies Theorem VIII.5.1
- Objects of Perf(X/G) are in general NOT COMPACT in D(X/G) in positive characteristic,
  even for G reductive; so 'generated' here does not mean 'compactly generated by'
- Everything is stated on a FINITE-WILD PIECE; the passage to the whole parameter stack
  is by the compact-support condition of the previous node

**Proof outline.**

1. Define the action of Rep(G-hat) by pullback along the structure map and tensor.
2. Quote Theorem VIII.5.1 for the generation under cones and retracts.
3. Deduce the module description by Barr-Beck-Lurie from the generation and
   conservativity.
4. Record that both statements are on a finite-wild piece and that the global statement
   needs compact support.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `repAction` | data | Rep_Lambda(G-hat) acts on Perf(Z^1(W_E/P,G-hat)/G-hat) by pullback along the structure map and tensor. |
| `repAction.monoidal` | structure | The functor Perf(*/G-hat) -> Perf(Z^1(W_E/P,G-hat)/G-hat) is exact and monoidal, making the target a module category. |
| `generation` | characterisation | Under l not dividing \|pi_1(G-hat)_tors\|, the target is generated under cones and retracts by the image. |
| `generation.necessary` | structure | The hypothesis is necessary, by the backwards direction of Proposition VIII.5.11. |
| `indPerfModules` | equivalence | IndPerf identifies with the modules over O(Z^1(W,G-hat)) in IndPerf(*/G-hat), by Barr-Beck-Lurie. |
| `notCompact` | structure | Objects of Perf(X/G) are usually not compact in D(X/G) in positive characteristic; 'generated' is not 'compactly generated by'. |

**Where it is used.**

- `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property` — the universal property is stated for this action
- `ExcursionOperatorsAndSpectralAction:ES2` — the rational spectral action restricts along the representation bundles
- `ExcursionOperatorsAndSpectralAction:ES3` — the integral spectral action is an action of this category

**Unit tests.**

- `hypothesis_necessary` — Without l not dividing |pi_1(G-hat)_tors| the generation fails; Proposition VIII.5.11 shows so.
- `cones_and_retracts` — Generation is under cones and retracts; dropping retracts changes the subcategory.
- `modules_from_generation` — The module description is deduced from generation by Barr-Beck-Lurie, not assumed.
- `not_compact_in_D` — In positive characteristic these objects are not compact in D(X/G).

**Acceptance.**

- Check that the action is by pullback-and-tensor and is monoidal
- Check that generation is under cones AND retracts
- Check that the module description follows from generation by Barr-Beck-Lurie
- Check that objects of Perf need not be compact in D in positive characteristic

**Prerequisites.** `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/compactly-supported-actions`, `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `VStackSheavesAndLisseCategories:VS2`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.Functor.Monoidal`

**Sources.**

- *Theorem VIII.5.1, printed p. 293.* “Moreover, the infinity-category Perf(Z^1(W,G-hat)/G-hat) is generated under cones and retracts by Perf(*/G-hat), and IndPerf(Z^1(W,G-hat)/G-hat) identifies with the infinity-category of modules over O(Z^1(W,G-hat)) in IndPerf(*/G-hat).”
  The two clauses this node is about, quoted verbatim. Read directly from the hash-
  verified PDF in this session.
- *Proof that Theorem VIII.5.2 implies Theorem VIII.5.1, printed p. 293.* “For the other half, note first that if Perf(B G-hat) generates Perf(Z^1(W,G-hat)/G-hat), then it follows by Barr-Beck-Lurie [Lur16, Theorem 4.7.4.5] that IndPerf(Z^1(W,G-hat)/G-hat) is the infinity-category of modules over O(Z^1(W,G-hat)) in IndPerf(B G-hat).”
  How the module description follows from the generation.
- *Section VIII.5.2, printed p. 295.* “We warn the reader that, being in positive characteristic, these objects are usually not compact in D(X/G), even when G is reductive. Let Perf^ind(X/G) inside Perf(X/G) be the full subcategory generated under cones and retracts by the image of Perf(*/G).”
  The warning about compactness, and the definition of the generated subcategory.

**What remains in this layer.**

- The decomposition's open question is now answered: Theorem X.0.1 states 'Assume that l
  does not divide the order of pi_1(G-hat)_tors' in its first line, so the INTEGRAL
  spectral action itself carries the restriction; the rational statement, over a field
  over Q_l(sqrt q), holds for any prime l. The restriction is therefore not merely the
  consumer's.
- Integrally the naive universal property is FALSE - the analogue of Lemma X.1.2 fails -
  and Proposition X.3.1 is stated for the sifted-colimit approximation
  Perf(Map)-natural. A formalisation that states the integral universal property for
  Perf of the mapping stack has stated something false.
- The proof of the generation and module clauses of Theorem VIII.5.1 is now planned,
  through LP3's Propositions VIII.5.10 to VIII.5.13; what remains unread there are the
  imported modular-representation inputs, recorded under LP3.
- The stage text names VS2's coefficient interpretation as an input; nothing in Fargues-
  Scholze's Chapter VIII or X states a compatibility with it, and this packet files it
  as a request rather than inventing one.

## Baseline: what the pinned libraries already have

Mathlib `082e2d3`, Tau Ceti `f790474`. The reviewed audit **AUDIT-20** (reviewed as
`REV-AUDIT-20`, 17 September 2026, 240 targets checked, 89 corrections) covers every
layer of this roadmap and returns **not built** for each. Two of its targets are
recorded as *partial*, and both are cited below rather than planned: `ES0`'s algebra
of natural endomorphisms of the identity, which is Mathlib's `CategoryTheory.CatCenter`,
and `ES3`'s coefficient hypothesis, which the pinned root pairings can state. Every
declaration below was read at the pins before being cited.

| Declaration | Module | Why it is baseline |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Representations of a group on a module. Rep((G-hat semidirect Q)^I), the nabla_lambda of the good-filtration theory, the twisted adjoint module (g-hat)_phi and the representation bundles that generate Perf are all this notion. |
| `mathlib:MonoidHom` | `Mathlib/Algebra/Group/Hom/Defs.lean` | Group homomorphisms. A parameter is a cocycle, not a homomorphism, but the sections of the L-group projection and the maps F_n -> W indexing the excursion colimit are homomorphisms, and the distinction is exactly what LP0's first node fixes. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups. The inertia and wild inertia of W_E, the open P inside the wild inertia, the discrete dense W inside W_E/P, the parabolic and Levi subgroups of G-hat semidirect W_E and the fixed-point subgroup G^P are subgroups. |
| `mathlib:ValuationSubring.inertiaSubgroup` | `Mathlib/RingTheory/Valuation/RamificationGroup.lean` | THE INERTIA SUBGROUP of a valuation subring, at the pins, together with the decomposition subgroup. AUDIT-21 records this as the partial half of LP0's first target: the inertia is available, but the file's own TODO says 'Define higher ramification groups in lower numbering', so the WILD inertia is not, and there is no Weil group anywhere in either library. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | Free groups with their universal property. The excursion algebra is a colimit over (n, F_n -> W), and AUDIT-21 records this as the indexing half of that construction, the cocycle spaces themselves being absent. |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. The cocycle algebras O(Z^1(F_n,G-hat)), the invariant algebras, the excursion algebra and the test objects of its universal property are commutative rings. |
| `mathlib:RingHom` | `Mathlib/Algebra/Ring/Hom/Defs.lean` | Ring homomorphisms. The Theta_n of the universal property are maps of Z_l-algebras, and the comparison Exc -> O(Z^1)^{G-hat} is one. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Polynomial algebras. O(Z^1(F_n,G-hat)) = O(G-hat^n) is a quotient of a polynomial algebra, and the finite presentation of the cocycle scheme is by equations in such a ring. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes. Z^1(W_E/P,G-hat) is an affine scheme of finite type, Z^1(W_E,G-hat) is a disjoint union of such, and Sing_{X/S} is an affine X-group scheme. |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness. Z^1(W_E/P,G-hat) is FLAT over Z_l, the excursion algebra is flat under the good-prime hypothesis, and the universal property of its l-torsion-free quotient is for FLAT test algebras. |
| `mathlib:RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | REGULAR SEQUENCES, at the pins. AUDIT-21 records that Mathlib has no named local-complete-intersection predicate, but that the lci structure CAN be stated as a quotient by a regular sequence; this is the pinned notion that statement would use. |
| `mathlib:Algebra.Extension.H1Cotangent` | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean` | The naive cotangent complex, at the pins. The full cotangent complex is absent, but H^{-1} of it is what Sing_{X/S} is built from, and the deformation theory of the parameter stack is a statement about it. |
| `mathlib:groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` | Group cohomology of a linear representation, at the pins, with functoriality and the low-degree description. AUDIT-21 records this as the partial half of LP3's last target: the vanishing FS VIII.5.1 asserts is for the ALGEBRAIC group cohomology H^i(G-hat, O(Z^1)) of a reductive group scheme, which is a different functor and is absent. |
| `mathlib:PrimeSpectrum.isHomeomorph_comap` | `Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean` | THE STACKS 0BR8 CRITERION, at the pins: a ring map with nil kernel, every element of whose target has a positive power in the image, induces a homeomorphism of spectra. AUDIT-21 names this as the usual route to a universal-homeomorphism statement, which is exactly what the comparison Exc -> O(Z^1)^{G-hat} is. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | t-structures on a triangulated category, at the pins, as the abstract notion only. The GOOD-FILTRATION t-structure is defined against it, and AUDIT-21 records that good filtrations themselves are absent. |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` | The Karoubi envelope. 'Generated under cones and RETRACTS' is an idempotent-completion statement, and the categories of Chapter X are idempotent-complete by hypothesis. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories. Perf(*/G-hat) acts monoidally on Perf of the parameter stack, and the universal property of the colimit theorem is for exact MONOIDAL functors. |
| `mathlib:CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean` | Monoidal functors, the data the universal property quantifies over. |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences. Theorems X.0.1, X.1.1 and X.3.1 assert that two data are equivalent, and VIII.5.1's module clause is an equivalence of categories. |
| `mathlib:CategoryTheory.CatCenter` | `Mathlib/CategoryTheory/Center/Basic.lean` | `abbrev CatCenter := End (1_C)`, at the pins: the Bernstein centre of a category, which is the target of the map out of the excursion algebra in FS VIII.4.1. |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | Condensed objects, at the pins. A parameter is a CONDENSED cocycle, the coefficient ring is made condensed as Lambda_disc tensor_{Z_l,disc} Z_l, and the evaluations of the excursion algebra over W_E/P are maps of condensed sets. |
| `mathlib:CondensedMod` | `Mathlib/Condensed/Module.lean` | Condensed modules, the ambient category for the condensed coefficient convention. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The finite-type condition in the condensed coefficient convention, and the free modules of finite rank in the duality statement for RGamma(W_E,M), are of this kind. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | Root pairings, at the pins, with RootPairing.flip for the dual root datum. The exponents of the root system, the Chevalley isomorphism g-hat // G-hat = t-hat // W, the dominant weights indexing the nabla_lambda and pi_1(G-hat) as the quotient of the character lattice by the root lattice are all root-datum data. |
| `mathlib:CoxeterSystem` | `Mathlib/GroupTheory/Coxeter/Basic.lean` | Coxeter systems. The Coxeter number h, which bounds the exponents in the banality condition of FS VIII.2.11, is a Coxeter-theoretic invariant. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean` | Reductive affine group schemes, at the pins. G-hat, the fixed-point subgroup's identity component and the groups H of Section VIII.5.3 are objects of this category; the DUAL group as such is ReductiveGroupsPartII:RG2.5's and is absent from both libraries. |
| `tauceti:TauCeti.fixedSubgroup` | `TauCeti/GroupTheory/FixedSubgroup.lean` | Fixed subgroups of endomorphisms of ABSTRACT groups, at the pins. AUDIT-21 records this as the nearest available notion to the fixed-point SUBGROUP SCHEME G^P that LP3 needs, which is absent along with its smoothness and reductivity. |
| `tauceti:TauCeti.YoungTableau.weylModule` | `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean` | Tau Ceti's weylModule, at the pins. AUDIT-21 records precisely what it is and is not: the Schur-Weyl functor image of a Young symmetriser for GL_n, NOT the induced module H^0(G/B, L(lambda)) or its Weyl-module dual for a reductive group scheme over Z, which is what LP3's first target asks for. |
| `tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor` | `TauCeti/RepresentationTheory/Homological/ContCohomology/ContinuousCohomologyIso.lean` | Continuous cohomology of a topological group acting on a topological module, at the pins, with inflation, restriction, corestriction, Shapiro, cup products and long exact sequences. AUDIT-21 records it as the ABELIAN half of LP0's second target: RGamma(W_E,M) for M abelian is expressible, while the NONABELIAN 1-cocycles with twisted conjugation that a parameter is are absent. |
| `tauceti:TauCeti.AbsoluteGaloisGroup` | `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean` | The absolute Galois group with its Krull topology, at the pins. AUDIT-21 records that Tau Ceti has it together with ramification groups for places of a FUNCTION field, but nothing for local fields and no Weil group; W_E is requested from the upstream class-field-theory roadmap. |

Confirmed **absent** at both pins by AUDIT-20 and by direct search, and therefore not
cited: the Bernstein centre of a locally profinite group, the Weil group of a local
field as a topological group, the Langlands dual group, stable infinity-categories and
their Ind-completions, perfect complexes on a stack, animated rings and animated groups,
anima, derived mapping stacks, good filtrations and Donkin's theorem, and the Bernstein
decomposition. Everything this packet needs from those notions is requested from another
roadmap rather than cited as baseline.

## Gaps

Twelve. The first two are the standing caveats on this packet; the rest each carry a
next source action.

### 1. What this packet closed, and what it did not: the integrated decomposition's reading extended

This packet is built on the accepted, independently reviewed decomposition
data/decompositions/LanglandsParameterStacks.json, whose sixteen node ids, statements,
hypotheses, proof steps, acceptance items and locators are kept unchanged. What this
session added to the READING, and hence to the plan: FS VIII.2 IN FULL, which the
decomposition located but did not read, giving four new nodes - the cotangent complex,
the singularity scheme and singular support, the banal case and the nilpotent cone, and
the monodromy boundary; the PROOF of Proposition VIII.3.8, which the decomposition
recorded as unread, giving the reconstruction-and-continuity node; the PROOF of Theorem
VIII.4.1 including the invariant function, the cartesian square, the fusion argument and
unit insertion, which the decomposition recorded as unread; FS VIII.5 IN FULL including
Propositions VIII.5.10 to VIII.5.13, which the decomposition recorded as the unread
heart of the integral theorem, giving two new LP3 nodes; and CHAPTER X IN FULL, which
the decomposition recorded as unread, giving two new LP4 nodes and answering its open
question. What was NOT added: nothing further was read of Dat-Helm-Kurinczuk-Moss, and
Zhu remains entirely unread.

### 2. ANSWERED: the integral spectral action does carry the restriction on pi_1(G-hat)_tors

The integrated decomposition recorded as a gap: 'check specifically whether the integral
spectral action there imposes the additional restriction that l does not divide
|pi_1(G-hat)_tors| (the roadmap says this restriction belongs to its consumer and is
never removed by the existence of these categories)'. Chapter X was read in full in this
session and the answer is that IT DOES: Theorem X.0.1 opens 'Assume that l does not
divide the order of pi_1(G-hat)_tors', and only the variant over a FIELD over Q_l(sqrt
q) is stated for any prime l. Moreover the proof of Theorem X.0.2 is finished by
combining the propositions of Section X.3 with Theorem VIII.5.1, which is this roadmap's
own theorem, so the dependence runs from Chapter X back to LP3 and LP4 and not the other
way. The corresponding node LP4/colimit-theorem-and-monoidal-universal-property records
this. One further point the decomposition could not know: INTEGRALLY the naive universal
property is FALSE, because the analogue of Lemma X.1.2 fails, and Proposition X.3.1 is
stated for the sifted-colimit approximation.

### 3. V. Lafforgue's continuity argument is now the only unread input of LP2:semisimple-characters

The proof of Proposition VIII.3.8 was read in full in this session. Three of its four
steps are elementary given the rest of the chapter: the bijection of (i) with (ii)
through closed orbits, the recipe from (ii) to (iii), and the reconstruction from (iii)
of a semisimple 1-cocycle OF DISCRETE GROUPS up to conjugation. The fourth step, that
the reconstructed cocycle is CONTINUOUS when the data are maps of condensed sets, is
quoted from the proof of [Laf18, Proposition 11.7], in particular the choice of finitely
many gamma_1,...,gamma_n in W_E such that phi(gamma) is determined by the closed orbit
in (G-hat semidirect Q)^{n+1} through Theta_{n+1}, cf. [Laf18, Lemma 11.10]. V.
LAFFORGUE WAS NOT READ. Since continuity is the entire reason for carrying the condensed
structure through LP0, this is the deepest unread dependence of the LP2 substages. NEXT
SOURCE ACTION: read [Laf18] Section 11, in particular Proposition 11.7 and Lemma 11.10.

### 4. All six modular-representation-theoretic inputs of LP3 remain unread and none is in the library

LP3 rests on Donkin's Ext-vanishing criterion for good filtrations, Donkin and Mathieu
on tensor stability, Kempf vanishing, Koppinen and Donkin on the good G x G-filtration
of O(G), Touze-van der Kallen's finiteness of good-filtration dimension, and Prasad-Yu
on the reductivity of a fixed-point identity component. The integrated decomposition
searched the maintainer's library and found none of them, and nothing changed in this
session. What DID change is that Fargues-Scholze's own use of them is now read in full:
Propositions VIII.5.10 to VIII.5.13 and Corollary VIII.5.7 are planned here, so it is
now exactly visible which statement each imported theorem is used for. NEXT SOURCE
ACTION: obtain Jantzen, Representations of Algebraic Groups, second edition, Part II
Chapter 4, which collects Kempf vanishing and the Donkin-Mathieu theorem, and Prasad-Yu.

### 5. Zhu's paper is in the maintainer's library and remains entirely unread

Fargues-Scholze cite Zhu alongside Dat-Helm-Kurinczuk-Moss as an independent
construction, and use [Zhu20, Lemma 3.1.8] in Proposition VIII.2.5 - a proposition this
packet does NOT plan, precisely because the lemma it rests on was not read. The
integrated decomposition verified the file's presence and hash and read nothing but its
first page. Nothing was read in this session either. NEXT SOURCE ACTION: read Zhu's
Section 2 on the representation space and Section 3 on the stack of arithmetic Langlands
parameters, including Lemma 3.1.8, and compare hypotheses and dimension normalisations
with FS VIII.1.3 and DHKM Theorem 1.3.

### 6. FS Proposition VIII.2.5 is not planned, because its input was not read

Section VIII.2 contains Propositions VIII.2.4 and VIII.2.5 on Weil-Deligne parameters
and their relation to the moduli space, of which VIII.2.5 uses [Zhu20, Lemma 3.1.8].
This packet reads and plans the rest of VIII.2 - the cotangent complex, the duality, the
singularity scheme, the singular-support criterion, the computation of Sing for the
parameter stack, the banal case and the two remarks - but does NOT plan VIII.2.4 or
VIII.2.5, and the node LP2:integral-invariants/weil-deligne-and-the-monodromy-map says
so: it records the monodromy morphism and the boundary it marks, and states that the
Weil-Deligne moduli is not constructed here. NEXT SOURCE ACTION: read FS printed pp.
282-283 together with Zhu Lemma 3.1.8.

### 7. The derived mapping stack the LP1 stage text asks for is not in Fargues-Scholze

LP1's stage text asks to 'Construct the derived mapping stack over the finite pinned-
action quotient, its tangent complex by cocycle cohomology, and the comparison with the
classical cocycle scheme where the source proves it underived.' What the source gives,
and what this packet plans, is the last two: Proposition VIII.2.1 computes the cotangent
complex of the CLASSICAL stack as RGamma(W_E,(g-hat)_phi)[1], and its proof is exactly
the underived comparison - the classical stack, being lci of dimension zero, represents
the derived moduli problem. The derived mapping stack itself is Chapter X's
Map_{/BQ}(S,B(H semidirect Q)), which this packet touches only through LP4's universal
property. NEXT SOURCE ACTION: none in Fargues-Scholze; the construction would come from
EnhancedDerivedSheaves:E5:animation and DerivedDeRhamCohomology:DD.0.

### 8. Change-of-discretisation independence remains an obligation, and the source records its own open question

The integrated decomposition recorded this and nothing in this session changed it, but
the picture is now sharper. For the SCHEME the independence is canonical and is planned
here: Z^1(W_E/P,G-hat) is defined without reference to W and the restriction is an
isomorphism, so any two discretisations give canonically isomorphic schemes. For the
EXCURSION ALGEBRA Fargues-Scholze state the independence explicitly - but only for the
l-TORSION-FREE QUOTIENT, and they add 'We do not know whether it is necessary to pass to
the l-torsion free quotient for the final assertion.' So the independence of
Exc(W,G-hat) itself is an OPEN QUESTION OF THE SOURCE, not a gap in the reading. The
l-torsion is always nilpotent, so nothing changes on points. NEXT SOURCE ACTION: check
Dat-Helm-Kurinczuk-Moss Section 3 and Zhu Section 3, both of which set up the
discretisation explicitly.

### 9. Haboush's theorem, on which the universal homeomorphism rests, was not read

The comparison Exc(W,G-hat) -> O(Z^1(W,G-hat))^{G-hat} is a universal homeomorphism 'by
Haboush's theorem on geometric reductivity [Hab75]'. That theorem was not read. AUDIT-21
records that Mathlib has no named universal-homeomorphism property but that one can be
stated with MorphismProperty.universally, and that it proves the Stacks 0BR8 criterion -
a ring map with nil kernel each of whose target elements has a positive power in the
image induces a homeomorphism of spectra, PrimeSpectrum.isHomeomorph_comap - which is
the usual route to such a statement. That declaration is cited here so the route is
visible. NEXT SOURCE ACTION: read Haboush, or a modern account of geometric reductivity,
and check that the hypotheses of the 0BR8 criterion are what the invariant-theoretic
argument supplies.

### 10. The relation left as an exercise in the proof of Proposition VIII.3.7

The universal property of the excursion algebra is by generators and relations, and the
source proves that the relations listed generate all required ones EXCEPT one: 'We leave
it as an exercise to see that this relation, corresponding to F_n -> F_n which is the
identity on the first n-1 generators and inverts the n-th generator, is in fact enforced
by the others. (Hint: Look at the part of Theta_{n+1} corresponding to
(gamma_1,...,gamma_n,gamma_n^{-1}) and use that under multiplication of the last two
variables, this maps to (gamma_1,...,gamma_{n-1},1), which arises from
(gamma_1,...,gamma_{n-1}).)' The exercise is not done in the source and is not done
here; it is recorded so that a formalisation does not take the relation list as complete
without proving it. NEXT SOURCE ACTION: none; do the exercise.

### 11. No example shows the integral invariant theorem fails at a bad prime, but the generation statement provably does

The integrated decomposition recorded that no example was found showing the conclusion
of the integral invariant theorem fails when l divides the order of pi_1(G-hat)_tors.
That remains true. What this session adds is the neighbouring fact, now planned in LP3:
Proposition VIII.5.11's BACKWARDS direction shows that if l divides the order of
pi_1(G^circ)_tors then Perf^ind(G/G) is a PROPER subcategory of Perf(G/G), so the
generation statement of Theorem VIII.5.1 genuinely fails. Fargues-Scholze say they keep
the converse for exactly this reason. And Remark VIII.5.18's characteristic-two example,
G = (SL_2 x SL_2)/mu_2 with the switching automorphism, is the guard against weakening
the prime-to-l hypotheses in the Donkin statement.

## Requests to other roadmaps

| Supplier | What is needed |
| --- | --- |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | THE LOCAL WEIL GROUP W_E as a topological group, with its inertia and wild inertia subgroups, their topologies, the tame quotient and the normalised degree map. AUDIT-21 names this upstream layer as the atlas's owner of the carrier - localWeilGroup K as the preimage of Z in Z-hat, the Weil topology characterised by inertia being an open subgroup with its profinite topology, and local compactness - and records that LP0 states the same carrier as something it USES. A direct search confirms there is no Weil group anywhere in either pinned library and no wild inertia. |
| `ReductiveGroupsPartII:RG2.5` | The integral pinned dual group G-hat over Z_l with its W_E-action factoring over a finite quotient Q, the semidirect L-group with its projection and action law, the change-of-pinning equivalence and the Levi inclusions. Every object of this roadmap is built from it, and AUDIT-21 records that there is no L-group in either library. |
| `EnhancedDerivedSheaves:E5:abstract` | Stable infinity-categories, their idempotent completions, endofunctor categories and equivariant objects - the setting in which Perf, IndPerf and the universal properties of Chapter X are stated. |
| `EnhancedDerivedSheaves:E5:presentability` | Presentability and Ind-completion, and Barr-Beck-Lurie: the module description of IndPerf(Z^1/G-hat) is deduced from the generation statement by Barr-Beck-Lurie, and the good-filtration t-structure lives on a presentable stable category. |
| `EnhancedDerivedSheaves:E5:animation` | ANIMATION: animated rings and derived affine schemes, without which the statement that the classical moduli problem represents the derived one cannot even be made. AUDIT-21 records that there are no animated or simplicial rings in either library. |
| `DerivedDeRhamCohomology:DD.0` | The cotangent complex and derived exterior powers, in the generality the singularity scheme needs. Sing_{X/S} is built from H^{-1} of the cotangent complex of a syntomic map, and the stage text names DD.0 as the source of the construction. |
| `VStackSheavesAndLisseCategories:VS2` | The coefficient interpretation the LP4 stage text names as an input. Nothing read states a compatibility between Perf of the parameter stack and VS2's coefficients; the request records the edge the roadmap asserts. |
| `SmoothRepresentationsOfLocalGroups:SR.6` | The integral finite-wild COCYCLE SCHEMES over Z[1/p] and the explicit comparison with LP1's Z_l models, together with the finiteness of the induced map of coarse quotients and of reduced excursion algebras. AUDIT-21 records SR.6 as a duplicate of LP0, LP1 and LP2:integral-invariants: the two are different integral models of the same scheme and the same invariant quotients, and PROTOCOL.md section 15 says the shared construction is planned once. |
| `GlobalShtukasAndFunctionFieldLanglands:GS.5` | The GLOBAL reconstruction of continuous semisimple L-parameters from characters of the excursion algebra, over a function field. AUDIT-21 records GS.5 as a duplicate of LP2:semisimple-characters, being the global form of FS Proposition VIII.3.8. The reconstruction argument is the same; a restructuring job should decide which layer owns it. |
| `AnabelianGeometryAndNonabelianChabauty:NC.3` | Torsor-valued NONABELIAN H^1 of Galois groups with unipotent coefficients, and its representable Selmer varieties. AUDIT-21 records NC.3 as a duplicate of LP0's nonabelian-cocycle target: it is the same foundation over another class of coefficient groups, and neither library has nonabelian 1-cocycles with twisted conjugation. |
| `PotentialAutomorphyInfrastructure:PA.1` | Integral algebraic coefficient modules with WEYL AND DUAL-WEYL MODULES and their highest-weight filtrations. AUDIT-21 records PA.1 as a duplicate of LP3's first target, being the integral highest-weight theory this layer states, for the groups of its automorphic application. |
| `ExcursionOperatorsAndSpectralAction:ES0` | The consumer side of FS VIII.4.1: the categorical datum - a Lambda-linear category with a monoidal Hecke action functorial in finite sets - that the map out of Exc(W,G-hat) lands in. LP2:excursion-presentation supplies the algebra; ES0 supplies the category and the operators. |
| `ExcursionOperatorsAndSpectralAction:ES2` | The rational spectral action, which consumes LP4's universal property. The direction of the dependence matters: FS finish the proof of Theorem X.0.2 by combining Chapter X's propositions with THIS roadmap's Theorem VIII.5.1. |
| `ExcursionOperatorsAndSpectralAction:ES3` | The integral spectral action, which consumes LP3's good-filtration theory and LP4's generation statement and carries the same hypothesis on pi_1(G-hat)_tors. |
| `ExcursionOperatorsAndSpectralAction:ES5` | The parameter assignment, which consumes LP2:semisimple-characters' bijection and nothing stronger; keeping the good-prime hypothesis out of that layer is exactly what lets ES5 hold for every l different from p. |

## Structural findings

### 1. SmoothRepresentationsOfLocalGroups:SR.6 builds a second integral model of the same cocycle schemes

*Kind: `duplicate-layer`.*

The reviewed audit AUDIT-21 records SR.6 as a duplicate of THREE layers of this roadmap.
Its note on LP0: 'SR.6 also chooses W_F^0 and the normal wild filtration P_F^e and
builds cocycle schemes for them, comparing with LP1's Z_ell models.' On LP1: 'SR.6
constructs integral finite-wild cocycle schemes over Z[1/p] and explicitly compares them
with LP1's Z_ell models; the two are different integral models of the same scheme.' On
LP2:integral-invariants: 'SR.6 proves finiteness of the induced map of coarse quotients
and of reduced excursion algebras for the same invariant quotients.' Two different
integral models of the same scheme, each with its own discretisation and its own
invariant quotients, are exactly what PROTOCOL.md section 15 says should be planned
once. The difference is the base: Z[1/p] against Z_l. That is a real difference and may
justify both, but it should be a deliberate decision recorded in one place rather than
two layers independently building cocycle schemes. This packet plans the Z_l model,
which is Fargues-Scholze's, and files a request to SR.6; a restructuring job should
decide whether SR.6 imports LP1's model and base-changes, or whether LP1 imports SR.6's
and inverts l.

### 2. Three other layers own pieces of this roadmap's foundations

*Kind: `duplicate-layer`.*

AUDIT-21 records three further duplicates, and each names a genuine owner. (1)
tauceti:TauCetiRoadmap/ClassFieldTheory layer 9 is 'the atlas's owner of the local Weil
group itself: the carrier localWeilGroup K as the preimage of Z in Z-hat, the Weil
topology characterized by inertia being an open subgroup with its profinite topology,
and local compactness. LP0 states the same carrier as something it uses, so the
construction should come from there rather than be rebuilt.' This packet does exactly
that and files the request. (2) AnabelianGeometryAndNonabelianChabauty:NC.3 'constructs
torsor-valued nonabelian H^1 of Galois groups with unipotent coefficients and its
representable Selmer varieties. That is the same nonabelian-cocycle foundation as T1,
over another class of coefficient groups.' Nonabelian 1-cocycles with twisted
conjugation are absent from both libraries and are needed by both layers; they should be
built once, in whichever layer a restructuring job chooses, and imported. (3)
PotentialAutomorphyInfrastructure:PA.1 owns integral Weyl and dual-Weyl modules with
their highest-weight filtrations, which is LP3's first target for the groups of its own
application. A restructuring job should settle all three ownerships together, since they
are the three foundations this roadmap does not want to own.

### 3. Chapter X depends on this roadmap, not the other way round, and the link graph should say so

*Kind: `link-direction`.*

The LP4 stage text says 'LP4 does not assume ES's spectral action; it supplies its
universal algebraic input', and the atlas records LP4 as an input of
ExcursionOperatorsAndSpectralAction:ES2, ES3 and ES4. Reading Chapter X in full confirms
the direction and makes it precise: the proof of Theorem X.0.2 ends 'Combining this with
Theorem VIII.5.1, we have finished the proof of Theorem X.0.2', and Theorem VIII.5.1 is
this roadmap's LP2:integral-invariants and LP4 theorem. So Chapter X consumes Chapter
VIII and not conversely. Two consequences for the link graph. First, ES2's, ES3's and
ES4's hypotheses are INHERITED from here: Theorem X.0.1 carries 'l does not divide the
order of pi_1(G-hat)_tors' because Theorem VIII.5.1 does. The roadmap's own remark that
the restriction 'belongs to its consumer and is never removed by the existence of these
categories' is therefore only half right - the consumer cannot remove it, but neither
does the consumer introduce it. Second, LP4's stage text names
VStackSheavesAndLisseCategories:VS2's coefficient interpretation as an input, and
nothing in Chapters VIII or X states any compatibility with it; either the edge should
be justified or the sentence narrowed.

