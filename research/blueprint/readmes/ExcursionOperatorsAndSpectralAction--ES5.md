# Excursion operators and the spectral action — the parameter assignment and its functoriality

*A blueprint packet for the Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`,
part `ES5` (layers ES5, ES6, ES6:functoriality, ES6:duality). Written by Claude Code,
session `cc-7b31c4`, 24 September 2026, for issue #727.*

## What this document is

The proved semisimple parameter assignment and its functorial properties, layers ES5,
ES6, ES6:duality and ES6:functoriality. This roadmap has NO integrated decomposition, so
every one of the sixteen nodes of this packet was written from Fargues-Scholze read
directly in this session, from a file whose SHA-256 reproduces the recorded value byte
for byte. The sections read are VII.7, VIII.3, VIII.4, IX.1, IX.2, IX.4, IX.5, IX.6 and
IX.7 in full, together with X.2. ES5 plans Schur-irreducibility in the CONDENSED sense,
with Proposition IX.1.2's description of what that structure is; the excursion character
of a Schur object, with the two families of relations of Proposition VIII.3.7 and the
continuity that the condensed Schur condition buys; the abstract parameter of Corollary
VIII.4.3; the geometric one of Definition/Proposition IX.4.1; the parameter
phi_{(G,b,pi)} of an irreducible smooth representation, transported through Proposition
VII.7.2's fully faithful left adjoint to i_b^*, with phi_pi at b = 1; and invariance
under isomorphism together with CONDITIONAL transport along algebraically closed
extensions - the roadmap forbids assuming that base change preserves Schur-
irreducibility, and this packet does not. ES6 plans the coefficient policy: the standing
hypothesis of Section IX.6 that the order of pi_0 Z(G) be invertible, imposed on every
centre-level diagram and for every participating group, together with the excursion-
algebra variant that Fargues-Scholze assert and never write out. ES6:functoriality plans
IX.6.1 to IX.6.5 with their proofs - isogenies through the push-pull identity and the
Satake compatibility, products through the product Hecke diagram and Proposition
VII.7.10, Weil restriction through the nonabelian Shapiro comparison of excursion
algebras and the finite-index free subgroup F_n x_W W', the spectral centre of a torus
through local class field theory, and the diagonal embedding - plus the closing
paragraph on twisting and central characters and a node for the z-embedding apparatus
the roadmap makes an obligation of this layer. ES6:duality plans the two representation-
level halves of Proposition IX.5.3. Twenty-three baseline declarations, all read at the
pins. Eleven gaps, each with a next source action; the deepest are that the STATEMENT of
Proposition VIII.3.8 is damaged in the extraction and is therefore requested rather than
restated, that V. Lafforgue's continuity argument was not read, and that local class
field theory is in NEITHER pinned library although the whole torus case rests on it.
Twenty-one requests. Three structural findings.

Nothing here is formalised. Every node carries `implementationStatus: "unchecked"`,
no Lean was compiled for this job, and the suggested file is a set of signatures and
`example` statements, not a development.

## The source, and how it was read

- **Geometrization of the local Langlands correspondence**, Laurent Fargues, Peter Scholze.
- `https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf`
- SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`, accessed 2026-09-24.
- Author-hosted 356-page PDF (MPIM Bonn); corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.

The file was downloaded and hashed in this session and the hash reproduces the value
recorded in `references/CATALOGUE.json` byte for byte. The text was extracted by
inflating the PDF's object streams and reading its text operators; printed pages were
recovered from the running heads. Sections read:

- VII.7, printed pp. 272-276: Proposition VII.7.2 with its proof - the left adjoint to
  i_b^* and the equivalence that is its unit - Proposition VII.7.3, Proposition VII.7.7,
  Definition VII.7.8, Proposition VII.7.9 and Proposition VII.7.10 with the Hom formula
  for exterior tensor products. These belong to VStackSheavesAndLisseCategories and are
  cited, not planned.
- VIII.3, printed pp. 286-290: Section VIII.3.1 on geometric points and the description
  of semisimple parameters as closed orbits, Lemma VIII.3.3, Section VIII.3.2's
  presentation of O(Z^1(W_E,G-hat)) with Haboush's theorem and the universal
  homeomorphism, Definition VIII.3.4 of Exc(W,G-hat), the relations of Proposition
  VIII.3.7 with the discussion of the l-torsion-free quotient, and the proof of
  Proposition VIII.3.8. The statement of Proposition VIII.3.8 itself is damaged in the
  extraction and is recorded as a gap.
- VIII.4, printed pp. 290-293: the categorical hypotheses including that W is taken
  DISCRETE, Theorem VIII.4.1, Definition VIII.4.2 with the relation S_D = S_{D'} and the
  invariant function, the proof of Theorem VIII.4.1, and Corollary VIII.4.3.
- IX.1, printed pp. 320-321: Proposition IX.1.1 and Proposition IX.1.2 with its proof -
  what the condensed structure on D_lis(Bun_G,Lambda) is, and that it is relatively
  discrete on compact objects.
- IX.2, printed pp. 321-323: the construction of the Hecke operators, Proposition
  IX.2.1, Theorem IX.2.2 with the duality identities D_BZ(T_V(A)) = T_{sw
  V-dual}(D_BZ(A)), Corollary IX.2.3 and Corollary IX.2.4. These belong to
  HeckeStacksAndLocalShtukas and are cited, not planned.
- IX.4, printed p. 327: Definition/Proposition IX.4.1 with its one-line proof.
- IX.5, printed pp. 327-330: Proposition IX.5.1 with its proof, the component
  decomposition, the map Z^geom -> Z(G(E),Lambda), Theorem IX.5.2 with its proof, the
  construction of D^geom and D^spec, and Proposition IX.5.3 with its proof. The parts of
  this section other than IX.5.3's second sentence are planned in the ES0 part of this
  roadmap.
- IX.6, printed pp. 330-333: the standing coefficient hypothesis and the excursion-
  algebra variant; Theorem IX.6.1 with its proof; Proposition IX.6.2 with its proof;
  Proposition IX.6.3 with its proof; Section IX.6.4's description of D_lis(Bun_T,Lambda)
  and Proposition IX.6.4 with its proof; Proposition IX.6.5 with its proof; and the
  closing paragraph on central characters, twisting and z-extensions.
- IX.7, printed pp. 334-338: Definition IX.7.1, Section IX.7.1's twisted Levi inclusion,
  Theorem IX.7.2 with its proof - read for the z-embedding apparatus it uses - Corollary
  IX.7.3 with its proof, and Theorem IX.7.4. These belong to ES7:parabolic and ES7:GLn-
  comparison and are cited, not planned.
- X.2, printed pp. 346-348: Definition X.2.1 and the elliptic discussion, read because
  ES4 consumes the parameter assignment there. Planned in the ES0 part of this roadmap.

## What this packet does not plan, and why

Material inside the sections read that belongs to other layers is left to them rather
than duplicated here (PROTOCOL.md section 15). The ES0 part of this roadmap, written in
the same session, plans the first group; the rest await their own jobs.

| Statement | Printed page | Owner |
| --- | --- | --- |
| VIII.4.1, VIII.4.2 and the excursion relations | 290–292 | `ES0` (part ES0) |
| IX.5.1 and the component decomposition | 327–329 | `ES1:finite-ramification` (part ES0) |
| IX.5.2 and the map to the classical Bernstein centre | 329 | `ES1:spectral-center`, `ES0:classical-center` (part ES0) |
| IX.5.3, first sentence: the commuting duality square | 329 | `ES4` (part ES0) |
| X.0–X.3, the spectral action | 339–350 | `ES2`, `ES3`, `ES4` (part ES0) |
| Definition IX.7.1 and Theorems IX.7.2, IX.7.3 | 334–338 | `ES7:parabolic` |
| Theorem IX.7.4, the `GL_n` comparison | 338 | `ES7:GLn-comparison` |
| VII.7.2 and VII.7.10, the stratum embedding and exterior products | 272–276 | `VStackSheavesAndLisseCategories:VS4`, `VS5` |
| VIII.3.1–VIII.3.8, the coarse moduli space and the character theorem | 286–290 | `LanglandsParameterStacks:LP0`, `LP2:semisimple-characters` |
| IX.1.2 and IX.2.2, the condensed structure and the Hecke duality identities | 320–322 | `HeckeStacksAndLocalShtukas:HS1`, `HS4` |

## ES5 — The proved semisimple parameter assignment

*Coverage: **partial**. 6 nodes.*

Schur-irreducibility in the CONDENSED sense with what the condensed structure is; the
excursion character of a Schur object with its relations and its continuity; the
abstract semisimple parameter of FS VIII.4.3; the geometric one of FS IX.4.1; the
parameter phi_{(G,b,pi)} of an irreducible smooth representation through
VStackSheavesAndLisseCategories' fully faithful stratum embedding, with phi_pi at b = 1;
and invariance under isomorphism with conditional transport along algebraically closed
extensions. This roadmap has NO integrated decomposition, so every node was written from
Fargues-Scholze read in this session.

### Schur-irreducibility: End(A) = L as CONDENSED algebras

`ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object` — *definition* · planet **Schur-irreducible objects**

**Statement.**

Let L be an algebraically closed field over Z_l[sqrt q]. An object A in D_lis(Bun_G,L)
is SCHUR-IRREDUCIBLE if End(A) = L AS CONDENSED ALGEBRAS. The condensed structure is the
one Proposition IX.1.2 describes: for A compact and B arbitrary,
Hom_{D_lis(Bun_G,Lambda)}(A,B) is a condensed animated Lambda-module RELATIVELY DISCRETE
over Z_l, so on compact objects the condensed structure is simply the relatively
discrete one, and in general it is induced from that. Schur-irreducibility in this sense
is what the excursion character of ES5 is extracted from.

**Hypotheses and warnings.**

- The identity is of CONDENSED algebras, not of abstract algebras. The abstract
  condition is strictly weaker and does not give a continuous parameter; the whole point
  of the condensed enhancement here is that it forces continuity
- L must be ALGEBRAICALLY CLOSED and an algebra over Z_l[sqrt q]. The square root of q
  trivialises the cyclotomic twist in the Satake normalisation
- Schur-irreducibility is not irreducibility: no t-structure is involved, A may be any
  object of D_lis, and shifts of an irreducible object are Schur-irreducible
- EXTENSION OF SCALARS DOES NOT AUTOMATICALLY PRESERVE IT. The roadmap is explicit on
  this point, and nothing in the source asserts otherwise; coefficient transport is a
  separate statement with its own hypothesis
- The condensed enhancement of D_lis(Bun_G,Lambda) is HeckeStacksAndLocalShtukas:HS1's
  and VStackSheavesAndLisseCategories' and is imported, not constructed here

**Proof outline.**

1. Take the condensed enhancement of D_lis(Bun_G,Lambda), which on compact objects is the
   relatively discrete condensed structure by Proposition IX.1.2 and in general is
   induced from it.
2. Say that A is Schur-irreducible if the unit L -> End(A) is an isomorphism of condensed
   L-algebras.
3. Record that this is what makes every excursion operator act on A by a scalar.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsSchurIrreducible` | data | The unit L -> End(A) is an isomorphism of CONDENSED L-algebras. |
| `IsSchurIrreducible.condensed` | structure | The identity is of condensed algebras; the abstract version is a strictly weaker condition and is not this one. |
| `IsSchurIrreducible.scalar` | characterisation | Every endomorphism of A is a scalar, and every natural endomorphism of the identity acts on A by a scalar; this is what turns the excursion operators into a character. |
| `IsSchurIrreducible.shift` | functoriality | Stable under shift; no t-structure is involved. |
| `IsSchurIrreducible.ofIrreducibleSmooth` | example | An irreducible smooth L-representation of G_b(E), transported by VS4's fully faithful embedding, gives a Schur-irreducible object. |
| `IsSchurIrreducible.notStableUnderBaseChange` | structure | Base change to a larger algebraically closed field is NOT asserted to preserve it; the transport statement carries the hypothesis explicitly. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object` — the character is extracted from the scalars
- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf` — the parameter is attached to such an object
- `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components` — Schur-irreducible objects of an elliptic component act by scalars given by an unramified twist

**Unit tests.**

- `condensed_not_abstract` — There are objects with End(A) = L abstractly but not as condensed algebras; only the condensed condition is used.
- `stable_under_shift` — A[n] is Schur-irreducible when A is.
- `irreducible_smooth_gives_schur` — For pi irreducible smooth, the object of D_lis(Bun_G,L) it corresponds to under VS4's embedding is Schur-irreducible.
- `no_free_base_change` — Base change of a Schur-irreducible object along L -> L' need not be Schur-irreducible; a development that assumes it is has assumed the roadmap's forbidden step.

**Acceptance.**

- Check that the abstract and the condensed conditions differ, and that only the condensed one is used
- Check that a shift of a Schur-irreducible object is Schur-irreducible
- Check that for an irreducible smooth representation of G_b(E) the corresponding object is Schur-irreducible, which is what ES5's representation-level assignment needs
- Check that no claim is made that base change to a larger algebraically closed field preserves the condition

**Prerequisites.** `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS4`, `HeckeStacksAndLocalShtukas:HS1`, `SmoothRepresentationsOfLocalGroups:SR.0`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:Module.End`, `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- *Definition/Proposition IX.4.1, printed p. 327.* “Let L be an algebraically closed field over Z_l[sqrt q], and let A in D_lis(Bun_G,L) be a Schur-irreducible object, i.e. End(A) = L as condensed algebras.”
  The definition, quoted verbatim, with the CONDENSED qualification. Read directly
  from Geometrization.pdf in this session; the file's SHA-256 reproduces the value
  recorded in references/CATALOGUE.json.
- *Proposition IX.1.2, printed p. 320.* “For A in D_lis(Bun_G,Lambda)^omega and B in D_lis(Bun_G,Lambda), the condensed animated Lambda-module Hom_{D_lis(Bun_G,Lambda)}(A,B) is relatively discrete over Z_l.”
  What the condensed structure IS on the objects the Schur condition is applied to.
- *After Proposition IX.1.2, printed p. 320.* “In other words, the condensed structure on D_lis(Bun_G,Lambda) can also be defined as the relatively discrete condensed structure when restricted to compact objects, and in general induced from this. In particular, when restricting attention to the compact objects D_lis(Bun_G,Lambda)^omega, it is simply the relatively discrete condensed structure.”
  The consequence that makes the Schur condition checkable on compact objects.

### The excursion character of a Schur object, with its relations and its continuity

`ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object` — *construction* · planet **The excursion character**

**Statement.**

Let A be Schur-irreducible, so End(A) = L. Evaluating the excursion operators at A
gives, for every n >= 1, a map Theta_n(A) : O((G-hat semidirect Q)^n // G-hat) ->
Map(W_E^n, L), linear over O(Q^n) -> Map(W_E^n, L). These maps satisfy the two families
of relations of FS Proposition VIII.3.7: the squares induced by PULLBACK along a map g :
{1,...,m} -> {1,...,n}, and the squares induced by the MULTIPLICATION maps (G-hat
semidirect Q)^m -> (G-hat semidirect Q)^n that multiply, in each fibre over i, the terms
of g^{-1}(i) in their induced order. They are maps of CONDENSED SETS, because A is
Schur-irreducible in the condensed sense and the Hecke action is continuous. This family
is the input of Proposition VIII.3.8.

**Hypotheses and warnings.**

- The target is Map(W_E^n, L) as CONDENSED SETS; this is the whole difference between a
  family of relations and a genuine parameter, and it is where the condensed Schur
  condition is consumed
- The relations are Proposition VIII.3.7's two commuting squares, pullback and
  multiplication; the multiplication map orders the terms of g^{-1}(i) by their ordering
  as a subset of {1,...,m}, and the ordering matters
- The maps are indexed by n >= 1 and land over O(Q^n) -> Map(W_E^n, Lambda); the
  O(Q^n)-linearity is part of the datum
- Fargues-Scholze also record that the l-torsion-free quotient of Exc(W,G-hat) is the
  universal flat Z_l-algebra carrying such maps over W_E/P, that this makes it
  independent of the discretisation W, that the l-torsion of Exc(W,G-hat) is always
  nilpotent so the passage is a universal homeomorphism, and that they DO NOT KNOW
  whether passing to the l-torsion-free quotient is necessary
- One does not need to construct a parameter here: the passage from the character to the
  parameter is Proposition VIII.3.8, which is LanglandsParameterStacks:LP2:semisimple-
  characters' statement

**Proof outline.**

1. Evaluate each excursion operator at A; by Schur-irreducibility the result is a scalar
   in L.
2. Assemble the scalars into maps Theta_n(A) out of the invariant functions on (G-hat
   semidirect Q)^n // G-hat, using ES0's unit-insertion identification.
3. Verify the pullback and multiplication relations of Proposition VIII.3.7, which hold
   because the excursion operators satisfy them before evaluation.
4. Verify that the maps are maps of condensed sets: this uses the condensed form of the
   Schur condition and the condensed Weil action on the Hecke functors.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `excursionCharacter` | data | Theta_n(A) : O((G-hat semidirect Q)^n // G-hat) -> Map(W_E^n, L) for n >= 1, obtained by evaluating the excursion operators at A. |
| `excursionCharacter.linear` | structure | Linear over O(Q^n) -> Map(W_E^n, L); the O(Q^n)-linearity is part of the datum, not a consequence. |
| `excursionCharacter.pullback` | relation | The square induced by pullback along g : {1,...,m} -> {1,...,n} commutes. |
| `excursionCharacter.multiplication` | relation | The square induced by the multiplication map commutes, the terms of g^{-1}(i) being multiplied in their induced order. |
| `excursionCharacter.condensed` | structure | The maps are maps of CONDENSED sets; this is where the condensed Schur condition is consumed and is what makes the resulting parameter continuous. |
| `excursionCharacter.universalProperty` | universal-property | The l-torsion-free quotient of Exc(W,G-hat) is universal for such families; in particular the family does not depend on the discretisation W. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf` — Proposition VIII.3.8 turns the character into a parameter
- `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter` — the same construction in the abstract categorical setting
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding` — the torus computation evaluates exactly this character on the two-leg datum

**Unit tests.**

- `two_leg_relation` — On I of size two with V = std tensor std-dual, the relations force the character to be a trace.
- `ordering_matters` — The multiplication relation orders the terms of g^{-1}(i) as a subset of {1,...,m}; another order gives a different and false relation.
- `continuity_from_condensed` — The maps are condensed because A is Schur-irreducible in the condensed sense; with the abstract condition continuity fails and no parameter results.
- `no_parameter_yet` — The construction produces a family of maps, not a homomorphism out of W_E; the passage is Proposition VIII.3.8's.

**Acceptance.**

- Check the relations on a two-leg datum
- Check that the ordering in the multiplication maps is the induced one and that changing it changes the relation
- Check that continuity is a consequence of the condensed Schur condition and not an extra assumption
- Check that no parameter is constructed at this stage

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `ExcursionOperatorsAndSpectralAction:ES0`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:semisimple-characters`, `LanglandsParameterStacks:LP0`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:Condensed`, `mathlib:CommRing`, `mathlib:RingHom`, `mathlib:MonoidHom`

**Sources.**

- *Proposition VIII.3.7 and the discussion after it, printed pp. 288-289.* “commutes, where both vertical maps are the natural pullback maps. On the other hand, g also induces a map (G-hat semidirect Q)^m -> (G-hat semidirect Q)^n, multiplying in every fibre over i = 1,...,n the terms in g^{-1}(i) (ordered by virtue of their ordering as a subset of {1,...,m}). This map is equivariant under diagonal G-hat-conjugation, and hence descends to the ...”
  The two families of relations, quoted verbatim, with the ordering convention. Read
  directly from the hash-verified PDF in this session. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *After Proposition VIII.3.7, printed p. 289.* “The l-torsion free quotient of Exc(W,G-hat) is also the universal flat Z_l-algebra A' equipped with maps Theta'_n : O((G-hat semidirect Q)^n // G-hat) -> Map((W_E/P)^n, A') for n >= 1, linear over O(Q^n) -> Map((W_E/P)^n, A'), satisfying the same relations as in Proposition VIII.3.7, where the right-hand side denotes the maps of CONDENSED SETS. In particular, the l-torsion ...”
  The universal property the character realises, and the independence of the
  discretisation it buys. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *After Proposition VIII.3.7, printed p. 289.* “We do not know whether it is necessary to pass to the l-torsion free quotient for the final assertion. Note that if l does not divide the order of pi_1(G-hat)_tors, then Exc(W,G-hat) = O(Z^1(W_E/P,G-hat))^{G-hat} is flat over Z_l. Moreover note that the l-torsion in Exc(W,G-hat) is always nilpotent, so passing to this quotient is a universal homeomorphism.”
  An open question the source states about its own construction, recorded so that a
  formalisation does not silently assume the stronger statement.

### FS VIII.4.3: a Schur object of an abstract Hecke category has a unique semisimple parameter

`ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter` — *theorem* · planet **The abstract semisimple parameter**

**Statement.**

Assume Lambda = L is an algebraically closed field and X in C an object with End(X) = L,
where C carries the categorical data of FS VIII.4: functorially in finite sets I, a
monoidal Rep_{Z_l}(Q^I)-linear functor Rep_{Z_l}((G-hat semidirect Q)^I) ->
End(C)^{BW^I} for a DISCRETE group W. Then there is, UP TO G-hat(L)-CONJUGATION, a
UNIQUE semisimple L-parameter phi_X : W -> G-hat(L) semidirect W such that for all
excursion data D = (I,V,alpha,beta,(gamma_i)) the endomorphism S_D(X) in End(X) = L, X =
T_1(X) -> T_V(X) -> T_V(X) -> T_1(X) = X, is given by the composite L -> V -> V -> L in
which the middle map is (V(phi_X(gamma_i)))_{i in I}.

**Hypotheses and warnings.**

- Uniqueness is UP TO CONJUGATION and only among SEMISIMPLE parameters; the excursion
  operators see no more than the semisimplification
- W is DISCRETE here. The statement for W_E, with continuity, is the geometric one below
  and needs the condensed Schur condition
- The corollary is deduced from Theorem VIII.4.1 'using the description of geometric
  points', that is, from Section VIII.3.1's description of the L-valued points of
  Z^1(W_E,G-hat)_L // G-hat as the closed G-hat-orbits, which are the semisimple
  parameters
- The statement is about an abstract C; the roadmap requires it to be usable without
  Bun_G, and this packet keeps it separate from the geometric statement
- The source's own display writes the target as G-hat(L) semidirect W; in the geometric
  statement it is G-hat(L) semidirect Q. The two agree because the action of W_E on
  G-hat factors over the fixed finite quotient Q

**Proof outline.**

1. Attach to X the family of scalars given by the excursion operators, which is the
   excursion character.
2. Verify the relations of Proposition VIII.3.7 for that family.
3. Apply Proposition VIII.3.8, using the description of the geometric points of the
   coarse moduli space as the closed orbits, to get a semisimple parameter unique up to
   conjugation.

**Acceptance.**

- Check that uniqueness fails without semisimplicity, by exhibiting two parameters with the same semisimplification
- Check the abstract statement on the category of perfect complexes on a point
- Check that the group is discrete here and that no continuity is claimed

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES0`, `LanglandsParameterStacks:LP2:semisimple-characters`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP2:excursion-presentation`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`

**Sources.**

- *Corollary VIII.4.3, printed pp. 292-293.* “Assume that Lambda = L is an algebraically closed field and X in C is an object with End(X) = L. Then there is, up to G-hat(L)-conjugation, a unique semisimple L-parameter phi_X : W -> G-hat(L) semidirect W such that for all excursion data D = (I,V,alpha,beta,(gamma_i)), the endomorphism S_D(X) in End(X) = L is given by the composite L -> V -> V -> L.”
  The abstract statement, quoted verbatim. Read directly from the hash-verified PDF in
  this session.
- *Before Corollary VIII.4.3, printed p. 292.* “In particular, using the description of geometric points, Theorem VIII.4.1 implies the following proposition.”
  How it is deduced: from the algebra map of VIII.4.1 together with the description of
  geometric points of Section VIII.3.1.
- *Section VIII.3.1, printed p. 287.* “For any algebraically closed field L over Z_l, the L-valued points of Z^1(W_E,G-hat)_L // G-hat are in bijection with the closed G-hat-orbits in Z^1(W_E,G-hat)_L. We want to describe L-valued points with closed G-hat-orbit as the 'semisimple' parameters.”
  What 'semisimple' means here and why the coarse moduli space sees exactly those. The
  development of that description is LanglandsParameterStacks' and is requested, not
  planned.

### FS IX.4.1: the semisimple L-parameter of a Schur-irreducible object of D_lis(Bun_G,L)

`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf` — *theorem* · planet **The parameter of a Schur-irreducible object**

**Statement.**

Let L be an algebraically closed field over Z_l[sqrt q], and let A in D_lis(Bun_G,L) be
a SCHUR-IRREDUCIBLE object, that is End(A) = L as condensed algebras. Then there is a
UNIQUE semisimple L-parameter phi_A : W_E -> G-hat(L) semidirect Q such that for all
excursion data (I,V,alpha,beta,(gamma_i)_{i in I}) - a finite set I, V in Rep((G-hat
semidirect Q)^I), alpha : 1 -> V restricted to G-hat, beta : V restricted to G-hat -> 1
and gamma_i in W_E - the endomorphism of A given by A = T_1(A) --alpha--> T_V(A)
--(gamma_i)--> T_V(A) --beta--> T_1(A) = A is the SCALAR L --alpha--> V
--(V(phi_A(gamma_i)))--> V --beta--> L.

**Hypotheses and warnings.**

- Uniqueness is up to G-hat(L)-conjugation and among semisimple parameters only, exactly
  as in the abstract statement; the source labels this a Definition/Proposition because
  the parameter is DEFINED by the displayed identity
- The gamma_i range over W_E itself, not over a discrete subgroup; the passage is by the
  wild cutoff of Proposition IX.5.1 and the discretisation, and continuity is delivered
  by the condensed Schur condition through Proposition VIII.3.8
- The whole proof in the source is one sentence: 'By the arguments of Section VIII.4, we
  can build excursion data as required for Proposition VIII.3.8.'
- By the component decomposition of FS IX.5, a Schur-irreducible A lies in exactly one
  factor D^c_lis(Bun_G,L) and its parameter phi_A lies in that connected component c of
  Z^1(W_E,G-hat)_L
- The theorem holds in EVERY characteristic different from p. The roadmap says
  explicitly not to import the good-prime condition of ES3, and the source's variant
  remark at the head of IX.6 confirms it

**Proof outline.**

1. Build the excursion data required by Proposition VIII.3.8 from the Hecke action on
   D_lis(Bun_G,L), as in Section VIII.4.
2. Evaluate them at A; by Schur-irreducibility each acts by a scalar, giving the
   excursion character with its relations and its continuity.
3. Apply Proposition VIII.3.8 to obtain a unique semisimple continuous parameter up to
   conjugation.

**Acceptance.**

- Check that the parameter is characterised by the displayed identity and is not constructed by any other route
- Check that the condensed Schur condition is what gives continuity
- Check that the parameter lies in the connected component the object lies in
- Check that no good-prime hypothesis is used

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `ExcursionOperatorsAndSpectralAction:ES5/abstract-semisimple-parameter`, `ExcursionOperatorsAndSpectralAction:ES0`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`, `LanglandsParameterStacks:LP2:semisimple-characters`, `LanglandsParameterStacks:LP0`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS3`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:Representation`, `mathlib:Condensed`

**Sources.**

- *Definition/Proposition IX.4.1, printed p. 327.* “Let L be an algebraically closed field over Z_l[sqrt q], and let A in D_lis(Bun_G,L) be a Schur-irreducible object, i.e. End(A) = L as condensed algebras. Then there is a unique semisimple L-parameter phi_A : W_E -> G-hat(L) semidirect Q such that for all excursion data (I,V,alpha,beta,(gamma_i)_{i in I}) consisting of a finite set I, V in Rep((G-hat semidirect Q)^I), alpha : ...”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Proof of Definition/Proposition IX.4.1, printed p. 327.* “By the arguments of Section VIII.4, we can build excursion data as required for Proposition VIII.3.8.”
  The whole proof, one sentence long.
- *After the component decomposition, printed p. 329.* “Note in particular that any Schur-irreducible object A in D_lis(Bun_G,Lambda) necessarily lies in one of these factors, given by some connected component c of Z^1(W_E,G-hat)_Lambda; and then the L-parameter phi_A of A necessarily lies in this connected component.”
  Where the parameter sits. The decomposition itself is planned in the ES0 part of
  this roadmap, on ES1:finite-ramification.
- *Head of Section IX.6, printed p. 330.* “All results admit an obvious variant replacing the spectral Bernstein center by an excursion algebra when this assumption is omitted, and in particular the claims about L-parameters of Schur-irreducible objects work in any characteristic (different from p, of course).”
  That this theorem needs no hypothesis on pi_0 Z(G) and no good-prime condition.

### FS IX.4-IX.7: the parameter phi_{(G,b,pi)} of an irreducible smooth representation, and phi_pi at b = 1

`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation` — *construction* · planet **The parameter of an irreducible smooth representation**

**Statement.**

For b in B(G) and an irreducible smooth L-representation pi of G_b(E), transport pi
through the FULLY FAITHFUL embedding D(G_b(E),L) = D_lis(Bun^b_G,L) -> D_lis(Bun_G,L).
By FS Proposition VII.7.2 the functor i_b^* : D_lis(Bun_G,Lambda) ->
D_lis(Bun^b_G,Lambda) = D_lis([*/G_b(E)],Lambda) admits a LEFT ADJOINT, given by pi_{b!}
q_b^*, whose unit is the equivalence id = i_b^* pi_{b!} q_b^* arising from base change
and from the identification of the pullback of i_b along pi_b with [*/G_b(E)] x M_b. The
resulting object is Schur-irreducible, so the previous node attaches to it a unique
semisimple parameter, written phi_{(G,b,pi)}; at b = 1, where the embedding is j_!, it
is written phi_pi. The construction must be shown INDEPENDENT of the eligible embedding
at the level of the centre.

**Hypotheses and warnings.**

- The embedding is only 'determined FOR EXAMPLE by the left adjoint to i_b^*': the
  source notes that in the D_lis-setting there is no general i_{b!}-functor, although it
  can be defined in the present situation, and that ALL these maps induce the SAME map
  to the Bernstein centre. Independence is therefore part of the construction and is not
  automatic
- That the transported object is Schur-irreducible is a statement about the CONDENSED
  endomorphism algebra of the actual representation category, and the roadmap demands it
  be proved there rather than assumed
- pi is irreducible and SMOOTH, over an algebraically closed L over Z_l[sqrt q]
- The statement is valid in every characteristic different from p
- Proposition VII.7.2 is VStackSheavesAndLisseCategories:VS4's and is imported unproved;
  its proof reduces to the generators c-Ind^{G_b(E)}_K for K open pro-p and uses Theorem
  VII.2.10

**Proof outline.**

1. Take the left adjoint pi_{b!} q_b^* to i_b^* of Proposition VII.7.2, whose unit is an
   equivalence, so that the functor is fully faithful.
2. Transport pi to an object of D_lis(Bun_G,L) and show its condensed endomorphism
   algebra is L.
3. Apply the parameter theorem to that object and call the result phi_{(G,b,pi)}; write
   phi_pi at b = 1.
4. Show that any other eligible embedding induces the same map on centres, hence the same
   parameter.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `stratumEmbedding` | data | The left adjoint pi_{b!} q_b^* to i_b^*, fully faithful because its unit is an equivalence. |
| `stratumEmbedding.noGeneralShriek` | structure | There is no general i_{b!} in the D_lis setting; it exists in this situation, and the source says so. |
| `stratumEmbedding.centreIndependent` | structure | All eligible embeddings induce the same map to the Bernstein centre, so the parameter does not depend on the choice. |
| `parameterOfRepresentation` | data | phi_{(G,b,pi)} : W_E -> G-hat(L) semidirect Q, the parameter of the transported object. |
| `parameterOfRepresentation.atBasepoint` | data | phi_pi at b = 1, where the embedding is j_!. |
| `schurOfIrreducible` | characterisation | For pi irreducible smooth, the transported object has condensed endomorphism algebra L; this must be proved on the representation category. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies` — the isogeny statement is about parameters of Schur-irreducible constituents
- `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals` — the duality statement is about parameters of irreducible smooth representations
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic` — the parabolic-induction statement compares phi_{pi-tilde} with phi_pi

**Unit tests.**

- `basepoint_case` — At b = 1 the embedding is j_! and the parameter is phi_pi.
- `independence_of_embedding` — Two eligible embeddings give the same parameter; a construction depending on the choice is not well posed.
- `schur_is_proved_not_assumed` — The Schur condition for the transported object is a statement about the condensed endomorphisms of the representation category.
- `any_characteristic` — The construction is valid for every l different from p; importing ES3's good-prime condition would be an error.

**Acceptance.**

- Check full faithfulness through the unit being an equivalence
- Check that the Schur condition is verified on the representation category and not assumed
- Check independence of the eligible embedding
- Check the case b = 1, where the embedding is j_!

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `HeckeStacksAndLocalShtukas:HS1`, `mathlib:Representation`, `mathlib:CategoryTheory.Adjunction`, `tauceti:TauCeti.IsSmoothDiscrete`, `tauceti:TauCeti.SmoothDiscreteTopRep`

**Sources.**

- *Proposition VII.7.2, printed p. 272.* “For any b in B(G) with locally closed immersion i_b : Bun^b_G -> Bun_G, the functor i_b^* : D_lis(Bun_G,Lambda) -> D_lis(Bun^b_G,Lambda) = D_lis([*/G_b(E)],Lambda) admits a left adjoint, given by pi_{b!} q_b^* : D_lis([*/G_b(E)],Lambda) -> D_lis(Bun_G,Lambda). The unit of the adjunction is given by the equivalence id = i_b^* pi_{b!} q_b^* arising from base change, and the ...”
  The embedding the construction uses, quoted verbatim. Read directly from the hash-
  verified PDF in this session. It is VStackSheavesAndLisseCategories:VS4's statement
  and is imported. The excerpt is truncated at a word boundary; the full passage is on
  the printed page named in the locator.
- *Definition IX.7.1, printed p. 334.* “the fully faithful embedding D(G_b(E),Lambda) = D_lis(Bun^b_G,Lambda) -> D_lis(Bun_G,Lambda) determined for example by the left adjoint to i_b^*, where i_b : Bun^b_G -> Bun_G is the locally closed embedding (see Proposition VII.7.2). (Recall that in the D_lis-setting, we do not have a general i_{b!}-functor, although it can be defined in the present situation. All these maps ...”
  The source's own statement that the embedding is not unique and that independence
  holds at the level of the centre - which is exactly the obligation the roadmap
  attaches to this construction. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *Proof of Corollary IX.7.3, printed p. 337.* “let mu : G_m -> G be a cocharacter with dynamical parabolic P and let b = mu(pi) in B(G). Then G_b = M, and we can build a sheaf A in D_et(Bun_G,Lambda) concentrated on Bun^b_G, given by the representation pi.”
  The same transport used in practice, on a non-basic stratum.

### Invariance under isomorphism, and transport along algebraically closed extensions

`ExcursionOperatorsAndSpectralAction:ES5/invariance-and-coefficient-transport` — *theorem* · planet **Invariance and coefficient transport**

**Statement.**

The parameter phi_A depends only on the isomorphism class of A: an isomorphism A = A' of
Schur-irreducible objects gives phi_A conjugate to phi_{A'}, because the excursion
operators are natural endomorphisms of the identity and therefore correspond under any
isomorphism. For a map L -> L' of algebraically closed fields over Z_l[sqrt q], IF the
base change A_{L'} remains Schur-irreducible, then phi_{A_{L'}} is the base change of
phi_A, because the excursion operators commute with coefficient extension and the
characterising identity is preserved. IT IS NOT ASSERTED that base change preserves
Schur-irreducibility, and the roadmap forbids assuming it.

**Hypotheses and warnings.**

- The transport statement is CONDITIONAL on Schur-irreducibility being retained; that
  hypothesis cannot be discharged in general and the roadmap says so in as many words
- Invariance under isomorphism is a consequence of the excursion operators being NATURAL
  endomorphisms of the identity functor, which is the distinction the ES0 part insists
  on
- Nothing in Fargues-Scholze states either half of this node as a numbered statement;
  both are obligations the roadmap adds, and the packet records that rather than
  manufacturing a locator
- Uniqueness being only up to conjugation, all the statements are statements about
  conjugacy classes

**Proof outline.**

1. Invariance: an isomorphism A = A' intertwines the actions of every natural
   endomorphism of the identity, so the two families of scalars agree and the parameters
   are conjugate.
2. Transport: base change commutes with the Hecke functors and hence with the excursion
   operators, so the characterising identity for phi_A base-changes to the characterising
   identity for phi_{A_{L'}}, provided End(A_{L'}) = L'.
3. Record that the proviso is a hypothesis, not a lemma.

**Acceptance.**

- Check that invariance follows from naturality and not from any property of the parameter
- Check that the transport statement carries its hypothesis explicitly
- Check that no statement is made about whether base change preserves Schur-irreducibility

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES5/schur-irreducible-object`, `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES0`, `LanglandsParameterStacks:LP2:semisimple-characters`, `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:Condensed`, `mathlib:RingHom`

**Sources.**

- *Definition/Proposition IX.4.1, printed p. 327.* “Then there is a unique semisimple L-parameter phi_A : W_E -> G-hat(L) semidirect Q such that for all excursion data ... the endomorphism ... is given by the scalar ...”
  The characterising identity, which is what both halves of this node argue from.
  Fargues-Scholze state neither the isomorphism-invariance nor the coefficient
  transport separately, and this packet does not claim a locator for them.
- *Head of Section IX.6, printed p. 330.* “the claims about L-parameters of Schur-irreducible objects work in any characteristic (different from p, of course).”
  The only coefficient statement the source makes about this assignment: it is about
  the characteristic, not about extension of the field.

**What remains in this layer.**

- The STATEMENT of Proposition VIII.3.8 - the passage from an excursion character to a
  semisimple parameter - is damaged in the text extraction used here: its enumerated
  items (i), (ii) and (iii) were not recovered, only the third item's two commuting
  squares and the proof. The packet therefore REQUESTS the statement from
  LanglandsParameterStacks:LP2:semisimple-characters rather than restating it, and
  records the damage as a gap.
- V. Lafforgue's Proposition 11.7 and Lemma 11.10, from which the continuity of the
  parameter is deduced in the proof of VIII.3.8, were NOT read.
- The roadmap requires that the Schur condition be proved on the actual representation
  category of G_b(E) - that an irreducible smooth representation gives an object with
  condensed endomorphism algebra L - and that independence of the eligible stratum
  embedding be proved at the level of the centre. Fargues-Scholze assert the second in a
  parenthesis in Definition IX.7.1 and do not prove it in anything read; the first is
  not stated at all. Both are open obligations.
- Neither the invariance under isomorphism nor the coefficient transport is a numbered
  statement of the source; the packet argues both from the characterising identity and
  says so.
- Section VIII.3.1's description of geometric points as closed G-hat-orbits, on which
  Corollary VIII.4.3 rests, is quoted and not proved; it belongs to
  LanglandsParameterStacks.

## ES6 — Functorial properties of the assignment

*Coverage: **partial**. 1 node.*

The standing coefficient hypothesis of FS IX.6 and the excursion-algebra variant that
replaces it, recorded as the policy the whole layer follows: centre-level diagrams carry
the invertibility of the order of pi_0 Z(G) for every participating group, parameter-
level statements carry none.

### The standing coefficient hypothesis of FS IX.6, and the excursion-algebra version without it

`ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams` — *comparison*

**Statement.**

Throughout Section IX.6 Fargues-Scholze assume FOR SIMPLICITY that the order of pi_0
Z(G) is INVERTIBLE IN Lambda, which is the hypothesis of Theorem IX.5.2 and is what
makes the spectral Bernstein centre Z^spec(G,Lambda) available. They state that ALL the
results of the section admit an obvious variant replacing the spectral Bernstein centre
by an EXCURSION ALGEBRA when the assumption is omitted, and that in particular the
claims about L-parameters of Schur-irreducible objects work in ANY CHARACTERISTIC
different from p. The roadmap turns this into a policy for the whole layer: impose the
invertibility hypothesis on every centre-level diagram, and for each participating group
separately, wherever IX.5.2 is used; and prove the excursion-algebra version of the same
diagram without it, which yields the field-valued statements for all l different from p.

**Hypotheses and warnings.**

- The hypothesis must be imposed for EVERY participating group, not only for G: in
  IX.6.1 both G and G', in IX.6.2 both factors, in IX.6.3 both G and G'. The source
  states it once for G and says nothing about the others; this is the roadmap's
  sharpening and this packet carries it as a hypothesis on each statement
- Fargues-Scholze write out NONE of the excursion-algebra variants. Each variant that a
  formalisation uses must be restated and reproved; the phrase 'obvious variant' is not
  a proof
- The parameter statements themselves - the ones about Schur-irreducible objects - need
  no hypothesis on pi_0 Z(G) at all, which is why ES5's nodes carry none
- This is a policy node and not a theorem: it fixes which hypothesis appears where in
  the rest of the layer

**Proof outline.**

1. Record the standing hypothesis of IX.6 and the scope over which it is in force.
2. For each diagram in the layer, note whether it is a centre-level diagram - and
   therefore needs the hypothesis for every participating group - or a parameter-level
   statement, which does not.
3. For each centre-level diagram, record the excursion-algebra variant obtained by
   replacing Z^spec by Exc(W,G-hat) throughout, and note that the source does not write
   it out.

**Acceptance.**

- Check that every centre-level statement in this packet carries the hypothesis for each participating group
- Check that no parameter-level statement carries it
- Check that the excursion-algebra variants are restated rather than quoted

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES0`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:integral-invariants`, `LanglandsParameterStacks:LP2:semisimple-characters`, `mathlib:CommRing`, `mathlib:FreeGroup`

**Sources.**

- *Head of Section IX.6, printed p. 330.* “In this section, we check various basic properties of the correspondence. Throughout, we assume for simplicity that the order of pi_0 Z(G) is invertible in Lambda. All results admit an obvious variant replacing the spectral Bernstein center by an excursion algebra when this assumption is omitted, and in particular the claims about L-parameters of Schur-irreducible objects work ...”
  The standing hypothesis and the variant, quoted verbatim. Read directly from the
  hash-verified PDF in this session. The excerpt is truncated at a word boundary; the
  full passage is on the printed page named in the locator.
- *Theorem IX.5.2, printed p. 329.* “Assume that the order of pi_0 Z(G) is invertible in Lambda. There is a natural map Z^spec(G,Lambda) -> Z^geom(G,Lambda) compatible with the above decomposition into connected components.”
  Where the hypothesis comes from. Theorem IX.5.2 itself is planned in the ES0 part of
  this roadmap, on ES1:spectral-center.

**What remains in this layer.**

- Fargues-Scholze write out NONE of the excursion-algebra variants; each one a
  formalisation uses has to be restated and reproved, and this packet does not restate
  them either - it records which statements need them.
- The source imposes the hypothesis only for G. That it must also be imposed for the
  other participating groups in IX.6.1, IX.6.2 and IX.6.3 is the roadmap's sharpening,
  carried here as a hypothesis on each statement, and is not justified by any text read.
- This layer is a parent whose atlas inputs are only its own two children; it has one
  node, and the mathematics is in the children.

## ES6:functoriality — Isogenies, products, restriction, tori and characters

*Coverage: **partial**. 7 nodes.*

FS IX.6.1 to IX.6.5 with their proofs: maps inducing an isomorphism of adjoint groups,
products, Weil restriction with the nonabelian Shapiro comparison of excursion algebras,
the spectral centre of a torus through local class field theory, and the diagonal
embedding for a torus; together with the closing paragraph on twisting and central
characters, and a node for the z-embedding apparatus the roadmap makes an obligation of
this layer.

### FS IX.6.1: maps inducing an isomorphism of adjoint groups

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies` — *theorem* · planet **Isogeny compatibility**

**Statement.**

Let G' -> G be a map of reductive groups inducing an ISOMORPHISM OF ADJOINT GROUPS,
inducing a dual map G-hat -> G-hat', and let pi : Bun_{G'} -> Bun_G. Then for any A in
D_lis(Bun_G,Lambda) the square relating Z^spec(G-hat',Lambda) -> End(pi^* A) and
Z^spec(G-hat,Lambda) -> End(A) commutes. In particular, if Lambda = L is an
algebraically closed field, A is SCHUR-IRREDUCIBLE and A' is a SCHUR-IRREDUCIBLE
CONSTITUENT of pi^* A, then phi_{A'} is the composite of phi_A with G-hat -> G-hat'.

**Hypotheses and warnings.**

- The conclusion is about a Schur-irreducible CONSTITUENT of pi^* A. The pullback need
  not itself be Schur-irreducible, and the roadmap insists the constituent hypothesis be
  retained
- The centre-level square needs the standing hypothesis of IX.6 for BOTH G and G'; the
  parameter-level consequence does not
- The proof computes pi_* T_{V'}(pi^* A) and identifies it with T_V(A tensor pi_*
  Lambda), so the identification of the Hecke operators is up to the twist by pi_*
  Lambda; that twist is invisible on excursion operators because those are endomorphisms
  of the identity
- The identification of H_* S'_{V'} uses the COMPATIBILITY OF GEOMETRIC SATAKE with a
  map G -> G' inducing isomorphisms of adjoint groups, as in the proof of Theorem
  VI.11.1; that compatibility is GeometricSatakeAndFusion's and is imported
- The map on dual groups goes the OTHER WAY, G-hat -> G-hat', so the parameter of the
  constituent is the parameter of A pushed forward, not pulled back

**Proof outline.**

1. Consider any excursion operator for G', given by (I, V', alpha, beta, (gamma_i)).
2. Form the diagram relating Hck^I_{G'} and Hck^I_G over Bun_{G'} and Bun_G and note that
   to compute an endomorphism of A it is enough to compute pi_* T_{V'}(pi^* A).
3. Compute pi_* T_{V'}(pi^* A) = h_{2*}(h_1^* A tensor H_* S'_{V'}) and identify H_*
   S'_{V'} = h_1^* pi_* Lambda tensor S'_V by writing H as the composite Hck^I_{G'} ->
   Hck^I_G x_{Bun_G} Bun_{G'} -> Hck^I_G, whose first map is locally over Bun_{G'}
   isomorphic to Gr^I_{G'} -> Gr^I_G, and applying the projection formula.
4. The identification is functorial in V' and in I and lives over Bun_G x (Div^1)^I, so
   it gives the desired equality of excursion operators.

**Acceptance.**

- Check that the constituent hypothesis is retained and that pi^* A need not be Schur-irreducible
- Check the direction of the dual map
- Check that the twist by pi_* Lambda does not affect excursion operators
- Check the appeal to the Satake compatibility of Theorem VI.11.1

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `HeckeStacksAndLocalShtukas:HS4`, `HeckeStacksAndLocalShtukas:HS1`, `BunGAndNewtonStrata:BG0`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:MonoidHom`

**Sources.**

- *Theorem IX.6.1, printed p. 330.* “Let G' -> G be a map of reductive groups inducing an isomorphism of adjoint groups, inducing a dual map G-hat -> G-hat', and pi : Bun_{G'} -> Bun_G. Then for any A in D_lis(Bun_G,Lambda) the diagram Z^spec(G-hat',Lambda) -> End(pi^* A), Z^spec(G-hat,Lambda) -> End(A) commutes. In particular, if Lambda = L is an algebraically closed field, A is Schur-irreducible and A' is a ...”
  The statement, quoted verbatim, with the constituent hypothesis. Read directly from
  the hash-verified PDF in this session. The excerpt is truncated at a word boundary;
  the full passage is on the printed page named in the locator.
- *Proof of Theorem IX.6.1, printed pp. 330-331.* “We are interested in computing an endomorphism of A; in particular, it is enough to compute pi_* T_{V'}(pi^* A). But pi_* T_{V'}(pi^* A) = pi_* h'_{2*}(h'^*_1 pi^* A tensor S'_{V'}) = h_{2*} H_*(H^* h_1^* A tensor S'_{V'}) = h_{2*}(h_1^* A tensor H_* S'_{V'}) = h_{2*}(h_1^* A tensor h_1^* pi_* Lambda tensor S'_V) = T_V(A tensor pi_* Lambda).”
  The computation, and the twist by pi_* Lambda that it produces.
- *Proof of Theorem IX.6.1, printed p. 331.* “Here, to identify H_* S_{V'}, we write H as the composite Hck^I_{G'} -> Hck^I_G x_{Bun_G} Bun_{G'} -> Hck^I_G. The first map is locally (over Bun_{G'}) isomorphic to the map Gr^I_{G'} -> Gr^I_G and hence pushforward takes S_{V'} to the pullback of S_V, by the compatibility of the geometric Satake equivalence with the map G -> G' inducing isomorphisms of adjoint groups, as in ...”
  The Satake input, which belongs to GeometricSatakeAndFusion and is imported. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.

### FS IX.6.2: products of groups give products of parameters

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/products` — *theorem* · planet **Product compatibility**

**Statement.**

If G = G_1 x G_2 is a product of two reductive groups over E, then the square relating
Z^spec(G_1,Lambda) tensor Z^spec(G_2,Lambda) -> Z^geom(G_1,Lambda) tensor
Z^geom(G_2,Lambda) and Z^spec(G,Lambda) -> Z^geom(G,Lambda) commutes. In particular, if
Lambda = L is an algebraically closed field and A_1, A_2 in D_lis(Bun_{G_i},L) are
SCHUR-IRREDUCIBLE, and A is a SCHUR-IRREDUCIBLE CONSTITUENT of the exterior tensor
product A_1 box A_2, then phi_A = (phi_{A_1}, phi_{A_2}) : W_E -> G-hat(L) = G-hat_1(L)
x G-hat_2(L).

**Hypotheses and warnings.**

- Again the conclusion is for a Schur-irreducible CONSTITUENT of the exterior product;
  the exterior product need not itself be Schur-irreducible
- The categorical input is Proposition VII.7.10: for compact A_i, the exterior tensor
  product A_1 box A_2 is compact, such objects form a class of compact generators, and
  RHom(A_1,B_1) tensor RHom(A_2,B_2) -> RHom(A_1 box A_2, B_1 box B_2) is an
  isomorphism. That proposition is VStackSheavesAndLisseCategories:VS5's and is imported
- The centre-level square needs the standing hypothesis of IX.6 for BOTH factors
- The whole proof in the source is: 'The statement can be checked using excursion
  operators, and the proof is a straightforward diagram chase, noting that everything
  decomposes into products.' It is short because the product Hecke diagram decomposes,
  which is the fact that must be supplied

**Proof outline.**

1. Note that Bun_{G_1 x G_2} = Bun_{G_1} x Bun_{G_2} and that the Hecke correspondence
   for the product is the product of the Hecke correspondences.
2. Check the statement on excursion operators: an excursion datum for the product
   decomposes into data for the factors.
3. Conclude by the diagram chase, using Proposition VII.7.10 to know that the exterior
   products generate and that the Hom formula holds.

**Acceptance.**

- Check the constituent hypothesis
- Check that the product Hecke diagram is the product of the two, which is what makes the chase work
- Check the Hom formula of Proposition VII.7.10, which is the categorical input
- Check the hypothesis on pi_0 Z(G_i) for both factors

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS5`, `VStackSheavesAndLisseCategories:VS3`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `BunGAndNewtonStrata:BG0`, `mathlib:Representation`, `mathlib:TensorProduct`, `mathlib:DirectSum`

**Sources.**

- *Proposition IX.6.2, printed p. 331.* “If G = G_1 x G_2 is a product of two groups, then the diagram Z^spec(G_1,Lambda) tensor Z^spec(G_2,Lambda) -> Z^geom(G_1,Lambda) tensor Z^geom(G_1,Lambda), Z^spec(G,Lambda) -> Z^geom(G,Lambda) commutes. In particular, if Lambda = L is an algebraically closed field and A_1, A_2 in D_lis(Bun_{G_i},L) are Schur-irreducible, and A is a Schur-irreducible constituent of A_1 box A_2, ...”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The extraction prints the upper-right corner of the source's display as
  Z^geom(G_1) tensor Z^geom(G_1); the second factor is plainly Z^geom(G_2) and the
  packet records this as a typographical point rather than a mathematical one. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Proof of Proposition IX.6.2, printed p. 331.* “The statement can be checked using excursion operators, and the proof is a straightforward diagram chase, noting that everything decomposes into products.”
  The whole proof.
- *Proposition VII.7.10, printed p. 276.* “Let G_1 and G_2 be two reductive groups over E, and let G = G_1 x G_2. Consider the exterior tensor product box : D_lis(Bun_{G_1},Lambda) x D_lis(Bun_{G_2},Lambda) -> D_lis(Bun_G,Lambda). For all compact objects A_i, the exterior tensor product A_1 box A_2 is compact, these objects form a class of compact generators, and for all further objects B_i the natural map ...”
  The categorical input, which belongs to VStackSheavesAndLisseCategories and is
  imported. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### FS IX.6.3: Weil restriction of scalars and the nonabelian Shapiro comparison

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction` — *theorem* · planet **Weil-restriction compatibility**

**Statement.**

Let G = Res_{E'|E} G' for a reductive group G' over a finite SEPARABLE extension E' of
E. Choose P an open subgroup of the wild inertia of W_{E'} inside W_E, and let W' inside
W_{E'}/P be the preimage of W inside W_E/P. Then there are canonical identifications
Bun_{G'} = Bun_G, Z^1(W_E,G-hat)/G-hat = Z^1(W_{E'},G-hat')/G-hat' and Exc(W,G-hat) =
Exc(W',G-hat'), and the square relating Z^spec(G',Lambda) -> Z^geom(G',Lambda) and
Z^spec(G,Lambda) -> Z^geom(G,Lambda) commutes. In particular, L-parameters are
compatible with Weil restriction.

**Hypotheses and warnings.**

- E'|E must be finite and SEPARABLE
- The identification of the excursion algebras is the one Fargues-Scholze single out as
  the most nontrivial. It rests on the isomorphism of affine schemes
  Z^1(F_n,G-hat)//G-hat = Z^1(F_n x_W W', G-hat')//G-hat', on the fact that F_n x_W W'
  is a SUBGROUP OF FINITE INDEX of F_n and is therefore itself a finitely generated free
  group, and on the consequent fact that restricting to those maps F_n -> W which factor
  over W' produces the SAME COLIMIT
- The Weil embedding is CHOSEN: G-hat = product over embeddings E' -> E-bar of G-hat',
  and one picks out an embedding E' -> E-bar and hence a projection G-hat -> G-hat' when
  regarding W_{E'} inside W_E as a subgroup. The roadmap requires that choice to be
  carried through the statement
- The geometric side uses that Hck^I_{G'} -> Hck^I_G x_{(Div^1)^I} (Div'^1)^I is a
  CLOSED IMMERSION, compatibly with a similar closed immersion of Beilinson-Drinfeld
  Grassmannians
- V' is inflated from a representation of (G-hat' semidirect W_{E'})^I to (G-hat
  semidirect W_{E'})^I and then INDUCED to (G-hat semidirect W_E)^I; that is the
  nonabelian Shapiro step

**Proof outline.**

1. Identify Bun_{G'} with Bun_G and the two stacks of parameters.
2. Identify the excursion algebras: use Exc(W,G-hat) = colim over (n, F_n -> W) of
   O(Z^1(F_n,G-hat))^{G-hat} and the isomorphism Z^1(F_n,G-hat)//G-hat = Z^1(F_n x_W
   W',G-hat')//G-hat', noting that F_n x_W W' is of finite index in F_n and hence
   finitely generated free, so that restricting to maps factoring over W' gives the same
   colimit.
3. Given an excursion operator for G' with V' a representation of (G-hat' semidirect
   W_{E'})^I, inflate V' to (G-hat semidirect W_{E'})^I and induce to (G-hat semidirect
   W_E)^I to get V.
4. Geometrically this is the commutative diagram of Hecke correspondences with Hck^I_{G'}
   -> Hck^I_G x (Div^1)^I over (Div'^1)^I a closed immersion; conclude by a diagram
   chase.

**Acceptance.**

- Check that E'|E is required to be separable
- Check that F_n x_W W' is of finite index in F_n and therefore free of finite rank, which is what makes the colimit comparison work
- Check that the Weil embedding is chosen and that the projection G-hat -> G-hat' depends on it
- Check the closed-immersion claim for the Hecke stacks

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `HeckeStacksAndLocalShtukas:HS4`, `BunGAndNewtonStrata:BG0`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:FreeGroup`, `mathlib:Subgroup`, `mathlib:Representation`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Proposition IX.6.3, printed p. 331.* “If G = Res_{E'|E} G' is a Weil restriction of scalars of some reductive group G' over a finite separable extension E' of E. Choose P to be an open subgroup of the wild inertia of W_{E'} inside W_E, and let W' inside W_{E'}/P be the preimage of W inside W_E/P. Then there are canonical identifications Bun_{G'} = Bun_G, Z^1(W_E,G-hat)/G-hat = Z^1(W_{E'},G-hat')/G-hat' and ...”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Proof of Proposition IX.6.3, printed p. 332.* “The most nontrivial of these identifications is the identification Exc(W,G-hat) = Exc(W',G-hat'). One way to understand this is to use the presentation Exc(W,G-hat) = colim over (n, F_n -> W) of O(Z^1(F_n,G-hat))^{G-hat} and the natural isomorphism Z^1(F_n,G-hat) // G-hat = Z^1(F_n x_W W', G-hat') // G-hat' of affine schemes, noting that F_n x_W W' inside F_n is a subgroup of ...”
  The excursion-algebra comparison, quoted verbatim - the step the roadmap calls the
  nonabelian Shapiro equivalence. The excerpt is truncated at a word boundary; the
  full passage is on the printed page named in the locator.
- *Proof of Proposition IX.6.3, printed p. 332.* “Note that G-hat semidirect W_E contains G-hat semidirect W_{E'} as a subgroup, and this admits a surjection onto G-hat' semidirect W_{E'} (noting that G-hat = product over E' -> E-bar of G-hat', where we picked out an embedding E' -> E-bar and hence a projection G-hat -> G-hat' when we regarded W_{E'} inside W_E as a subgroup). In this way, one can inflate V' to a ...”
  The chosen Weil embedding and the inflate-then-induce recipe. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.
- *Proof of Proposition IX.6.3, printed p. 332.* “More precisely, we note that Hck^I_{G'} -> Hck^I_G x_{(Div^1)^I} (Div'^1)^I is a closed immersion (compatibly with a similar closed immersion of Beilinson-Drinfeld Grassmannians). Now the claim follows from a diagram chase.”
  The geometric side.

### FS IX.6.4: the spectral centre of a torus is the classical Bernstein centre of T(E)

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center` — *theorem* · planet **The spectral centre of a torus**

**Statement.**

Let G = T be a torus over E. Then D_lis(Bun_T,Lambda) = product over b in B(T) of
D(T(E),Lambda), and in particular Z^geom(T,Lambda) = product over b in B(T) of
Z(T(E),Lambda), where Z(T(E),Lambda) = lim over open subgroups K of T(E) of
Lambda[T(E)/K] is the classical Bernstein centre of T(E). There is a NATURAL ISOMORPHISM
Z^spec(T,Lambda) = lim over K inside T(E) of Lambda[T(E)/K].

**Hypotheses and warnings.**

- The description of Z^geom(T,Lambda) as a PRODUCT over B(T) reflects that Bun_T has one
  stratum for each element of B(T) and that they are all open and closed; that is
  BunGAndNewtonStrata's geometry and is imported
- The proof RESOLVES T by products of INDUCED TORI, reduces to T induced, and then by
  Weil restriction of scalars to T = G_m; so it consumes IX.6.1, IX.6.2 and IX.6.3 and
  cannot be proved before them
- The case T = G_m is LOCAL CLASS FIELD THEORY: Z^1(W_E,G_m) = Hom(E^times,G_m). Neither
  Mathlib nor Tau Ceti has local class field theory at the pins, so this is requested
  from the upstream Tau Ceti class-field-theory roadmap
- Lambda[T(E)/K] is the group algebra of the finite - indeed profinite, but the limit is
  over open K so each quotient is discrete - quotient, and the limit is over open
  subgroups K of T(E)

**Proof outline.**

1. Resolve T by products of induced tori.
2. Reduce to T induced, and then by Weil restriction of scalars to T = G_m, using IX.6.3.
3. For T = G_m, apply local class field theory: Z^1(W_E,G_m) = Hom(E^times,G_m), which
   gives the asserted description of the spectral centre.

**Acceptance.**

- Check the reduction to induced tori and then to G_m
- Check that local class field theory is the input in the G_m case and that it is not available in the pinned libraries
- Check that Z^geom(T,Lambda) is a product over B(T) and not a single copy

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:integral-invariants`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2`, `SmoothRepresentationsOfLocalGroups:SR.0`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:MonoidHom`, `mathlib:MulChar`, `mathlib:MonoidAlgebra`, `mathlib:CommRing`, `mathlib:Units.map`

**Sources.**

- *Section IX.6.4, printed p. 333.* “If G = T is a torus, then D_lis(Bun_T,Lambda) = product over b in B(T) of D(T(E),Lambda) and in particular Z^geom(T,Lambda) = product over b in B(T) of Z(T(E),Lambda) where Z(T(E),Lambda) is the Bernstein center of T(E); explicitly, this is Z(T(E),Lambda) = lim over K inside T(E) of Lambda[T(E)/K] where K runs over open subgroups of T(E).”
  The geometric side for a torus, quoted verbatim. Read directly from the hash-
  verified PDF in this session.
- *Proposition IX.6.4, printed p. 333.* “There is a natural isomorphism Z^spec(T,Lambda) = lim over K inside T(E) of Lambda[T(E)/K].”
  The statement, quoted verbatim.
- *Proof of Proposition IX.6.4, printed p. 333.* “One can resolve T by products of induced tori and then reduce to the case that T is induced, and then by Weil restrictions of scalars to T = G_m. In that case Z^1(W_E,G_m) = Hom(E^times,G_m) by local class field theory, giving the result.”
  The proof, and the appeal to local class field theory, which neither pinned library
  has.

### FS IX.6.5: for a torus the spectral-to-geometric map is the diagonal embedding

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding` — *theorem* · planet **Tori and local class field theory**

**Statement.**

Under the identifications Z^spec(T,Lambda) = lim over K inside T(E) of Lambda[T(E)/K]
and Z^geom(T,Lambda) = product over b in B(T) of lim over K of Lambda[T(E)/K], the map
Z^spec(T,Lambda) -> Z^geom(T,Lambda) is the DIAGONAL EMBEDDING. In particular the
L-parameters constructed here for tori are THE USUAL L-parameters: for a smooth
character chi of T(E), phi_chi is the parameter local class field theory attaches to
chi, with the fixed geometric-Frobenius normalisation.

**Hypotheses and warnings.**

- The map is the diagonal, so it is the SAME element of the Bernstein centre on every
  Newton stratum; that is the precise sense in which the assignment is insensitive to b
  for a torus
- The proof resolves T by induced tori and uses Theorem IX.6.1, Proposition IX.6.2 and
  Proposition IX.6.3 to reduce to T = G_m
- For T = G_m it is ENOUGH to compute the excursion operators corresponding to I =
  {1,2}, V = std tensor std-dual and the TAUTOLOGICAL maps alpha : 1 -> std tensor std-
  dual and beta : std tensor std-dual -> 1, and the computation is then an easy
  consequence of Section II.2.1 - the explicit line-bundle computation on the Fargues-
  Fontaine curve, which is RelativeFarguesFontaine's and BunGAndNewtonStrata's, not read
  here
- The normalisation of the class-field correspondence must be fixed: the roadmap
  requires the geometric-Frobenius normalisation, which is the same one used in IX.7.1's
  degree map

**Proof outline.**

1. Resolve T by induced tori and use IX.6.1, IX.6.2 and IX.6.3 to reduce to T = G_m.
2. For T = G_m compute the excursion operator for I = {1,2}, V = std tensor std-dual and
   the tautological unit and counit.
3. Conclude from the computation of Section II.2.1.
4. Deduce that the parameters constructed for tori agree with the usual ones.

**Acceptance.**

- Check that the map is the diagonal and not one component
- Check the two-leg computation on G_m
- Check that the geometric-Frobenius normalisation is fixed and used
- Check that Section II.2.1 is the input for the G_m case

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-spectral-center`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/weil-restriction`, `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `LanglandsParameterStacks:LP0`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:MonoidHom`, `mathlib:MulChar`, `mathlib:MonoidAlgebra`, `mathlib:LinearMap.trace`

**Sources.**

- *Proposition IX.6.5, printed p. 333.* “Under the above identifications Z^spec(T,Lambda) = lim over K of Lambda[T(E)/K] and Z^geom(T,Lambda) = product over b in B(T) of lim over K of Lambda[T(E)/K], the map Z^spec(T,Lambda) -> Z^geom(T,Lambda) is the diagonal embedding.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Proposition IX.6.5, printed p. 333.* “We may resolve T by induced tori and use Theorem IX.6.1, Proposition IX.6.2 and Proposition IX.6.3 to reduce to the case of T = G_m. It is enough to compute the excursion operators corresponding to I = {1,2}, V = std tensor std-dual and the tautological maps alpha : 1 -> std tensor std-dual and beta : std tensor std-dual -> 1. It is then an easy consequence of Section II.2.1.”
  The proof, and the explicit two-leg computation the roadmap asks for.
- *After Proposition IX.6.5, printed p. 333.* “Proposition IX.6.5 in particular shows that the L-parameters we construct for tori are the usual L-parameters”
  The conclusion: agreement with local class field theory.

### FS IX.6, final paragraph: twisting, central characters and the reduction by z-extensions

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting` — *theorem* · planet **Central characters and twisting**

**Statement.**

Proposition IX.6.5, together with Theorem IX.6.1 and Proposition IX.6.2, implies that
L-parameters are COMPATIBLE WITH CENTRAL CHARACTERS - in the case of CONNECTED CENTRE -
and with TWISTING, by applying Theorem IX.6.1 to the map Z_G -> G, where Z_G is the
centre, and to the quotient of G by its derived group. To deduce compatibility with
central characters IN GENERAL, one reduces to the case of connected centre using
Z-EXTENSIONS, as in Kaletha, Section 5.

**Hypotheses and warnings.**

- The connected-centre case is the one the argument gives directly; the general case
  needs a z-extension and is NOT proved in anything read here beyond the citation
- The z-extension apparatus - the existence of a z-embedding G -> G' with G' of
  connected centre and torus quotient D, the injectivity of B(G) -> B(G'), and the
  surjectivity of Z'(E) -> D(E) - is used again, and in more detail, in the proof of
  Theorem IX.7.2, which belongs to ES7:parabolic. The roadmap makes the z-embedding and
  rational-point-surjectivity lemmas OBLIGATIONS OF THIS LAYER on BunGAndNewtonStrata's
  reductive carriers, and explicitly says they are not an assumed functorial local
  Langlands correspondence
- Kaletha's Section 5, cited as [Kal18], was NOT read in this session
- The text recovered from the extraction reads 'by applying Theorem IX.6.1 to the maps
  Z_G -> G and G -> G/D where Z_G is the center and G -> D is the quotient by the
  derived group'; the second map is the projection to the torus quotient by the derived
  group, and the packet states it that way rather than reproducing an ambiguous fragment

**Proof outline.**

1. Apply Theorem IX.6.1 to Z_G -> G to get compatibility with central characters when the
   centre is connected.
2. Apply Theorem IX.6.1 to the quotient of G by its derived group, a torus, and use
   Proposition IX.6.5 to identify the resulting parameter through local class field
   theory; this gives compatibility with twisting.
3. For a general centre, choose a z-embedding G -> G' with Z(G') connected and torus
   quotient D, prove B(G) -> B(G') injective and Z'(E) -> D(E) surjective, and reduce.

**Acceptance.**

- Check that the direct argument needs the centre to be connected
- Check that twisting is obtained from the torus quotient together with the torus case
- Check that the z-extension lemmas are obligations of this layer and not imported from a functorial local Langlands correspondence
- Check that Kaletha's Section 5 is an unread external input

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/products`, `ExcursionOperatorsAndSpectralAction:ES6/coefficient-policy-for-the-functorial-diagrams`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2`, `ReductiveGroupsPartII:RG2.5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `LanglandsParameterStacks:LP0`, `mathlib:Representation`, `mathlib:MonoidHom`, `mathlib:RootPairing`, `mathlib:Subgroup`

**Sources.**

- *After Proposition IX.6.5, printed p. 333.* “Proposition IX.6.5 in particular shows that the L-parameters we construct for tori are the usual L-parameters, and together with Theorem IX.6.1 and Proposition IX.6.2 implies that L-parameters are compatible with central characters (in case of connected center) and twisting, by applying Theorem IX.6.1 to the maps Z_G -> G and G -> G/D where Z_G is the center and G -> D is the ...”
  The whole paragraph, quoted as recovered. Read directly from the hash-verified PDF
  in this session. The excerpt is truncated at a word boundary; the full passage is on
  the printed page named in the locator.
- *Proof of Theorem IX.7.2, printed p. 335.* “Take a z-embedding G -> G' as in [Kal18, Section 5], with quotient a torus D, so that the center Z(G') is connected. Then Bun_G = Bun_{G'} x_{Bun_D} {*} and the map B(G) -> B(G') is injective. To see the latter, by the description of the stacks, it suffices to see that for all b in B(G) with image b' in B(G'), the map G'_{b'}(E) -> D(E) is surjective. But for any b in B(G), ...”
  The z-extension apparatus in the form in which it is actually used. The theorem it
  serves is ES7:parabolic's; the lemmas about z-embeddings are, by the roadmap's own
  instruction, obligations of this layer. The excerpt is truncated at a word boundary;
  the full passage is on the printed page named in the locator.

### Z-embeddings: the reduction to connected centre, and the surjectivity it needs

`ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding` — *definition*

**Statement.**

A Z-EMBEDDING of a reductive group G over E, in the sense of Kaletha's Section 5, is an
embedding G -> G' with QUOTIENT A TORUS D such that the centre Z(G') is CONNECTED.
Fargues-Scholze use it twice: to reduce compatibility with central characters to the
connected-centre case (IX.6, final paragraph), and to reduce Theorem IX.7.2 to a
quasisplit group. The properties they use are: Bun_G = Bun_{G'} x_{Bun_D} {*}; the map
B(G) -> B(G') is INJECTIVE; and for every b in B(G) the map G'_{b'}(E) -> D(E) is
SURJECTIVE, which itself follows because G_b -> G'_{b'} is again a z-embedding with
quotient D and because Z'(E) -> D(E) is surjective for the central torus Z' of G'_{b'}.
The roadmap makes these lemmas obligations of THIS layer, on BunGAndNewtonStrata's
reductive carriers, and says explicitly that they are not an assumed functorial local
Langlands correspondence.

**Hypotheses and warnings.**

- The quotient is a TORUS and the centre of the target is CONNECTED; both are part of
  the definition and both are used
- The injectivity of B(G) -> B(G') is DEDUCED from the surjectivity of G'_{b'}(E) ->
  D(E), not assumed; the deduction goes through the description of the stacks
- The surjectivity Z'(E) -> D(E) is quoted from Kaletha's Fact 5.5, which was NOT read
  in this session
- The construction of a z-embedding for a given G is also quoted from Kaletha's Section
  5 and is not carried out in anything read here
- The roadmap requires that z-embeddings be CONSTRUCTED AND COMPARED here rather than
  being assumed, and that the rational-point surjectivity be proved on
  BunGAndNewtonStrata's carriers

**Proof outline.**

1. Define a z-embedding as an embedding G -> G' with torus quotient D and Z(G')
   connected.
2. From the description of Bun_G as a fibre product, deduce Bun_G = Bun_{G'} x_{Bun_D}
   {*}.
3. Show that for every b in B(G) the map G'_{b'}(E) -> D(E) is surjective, using that G_b
   -> G'_{b'} is a z-embedding with quotient D and that Z'(E) -> D(E) is surjective.
4. Deduce that B(G) -> B(G') is injective.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsZEmbedding` | data | G -> G' with quotient a torus D and Z(G') connected. |
| `IsZEmbedding.connectedCentre` | structure | The centre of the target is connected; that is the point of the construction. |
| `IsZEmbedding.bunFibreProduct` | characterisation | Bun_G = Bun_{G'} x_{Bun_D} {*}. |
| `IsZEmbedding.surjectiveOnPoints` | structure | G'_{b'}(E) -> D(E) is surjective for every b, because G_b -> G'_{b'} is again a z-embedding and Z'(E) -> D(E) is surjective. |
| `IsZEmbedding.injectiveOnB` | projection | B(G) -> B(G') is injective; this is deduced from the surjectivity, not assumed. |
| `IsZEmbedding.exists` | constructor | Every reductive G admits a z-embedding; this is Kaletha's construction and is an external input. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting` — the general central-character statement reduces to the connected-centre case through it
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic` — the proof of Theorem IX.7.2 reduces to quasisplit G through it
- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies` — the reduction uses that the parameters are compatible with the map G -> G'

**Unit tests.**

- `torus_quotient` — The quotient is a torus; an embedding with a non-torus quotient is not a z-embedding.
- `connected_centre_of_target` — Z(G') is connected; without it the reduction achieves nothing.
- `injectivity_is_deduced` — B(G) -> B(G') is injective, and the proof goes through surjectivity on rational points; assuming injectivity directly skips the content.
- `existence_is_external` — The existence of a z-embedding is Kaletha's and is not proved in anything read here.

**Acceptance.**

- Check that the quotient is a torus and the target has connected centre
- Check the fibre-product description of Bun_G
- Check the surjectivity on rational points and the injectivity it gives
- Check that the existence of a z-embedding is an external input

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/tori-diagonal-embedding`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2`, `ReductiveGroupsPartII:RG2.5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:Representation`, `mathlib:MonoidHom`, `mathlib:Subgroup`, `mathlib:RootPairing`

**Sources.**

- *After Proposition IX.6.5, printed p. 333.* “To deduce compatibility with central characters in general, one can reduce to the case of connected center using z-extensions [Kal18, Section 5].”
  The first use. Read directly from the hash-verified PDF in this session.
- *Proof of Theorem IX.7.2, printed p. 335.* “Take a z-embedding G -> G' as in [Kal18, Section 5], with quotient a torus D, so that the center Z(G') is connected. Then Bun_G = Bun_{G'} x_{Bun_D} {*} and the map B(G) -> B(G') is injective. To see the latter, by the description of the stacks, it suffices to see that for all b in B(G) with image b' in B(G'), the map G'_{b'}(E) -> D(E) is surjective. But for any b in B(G), ...”
  The properties used, quoted verbatim. The theorem this serves is ES7:parabolic's;
  the lemmas are, by the roadmap's instruction, obligations of this layer. The excerpt
  is truncated at a word boundary; the full passage is on the printed page named in
  the locator.

**What remains in this layer.**

- Local class field theory - the identification Z^1(W_E,G_m) = Hom(E^times,G_m), on
  which the whole torus case rests - is in NEITHER pinned library. A direct search of
  the pinned index found no Artin map, no local reciprocity map and no class field
  theory of any kind. It is requested from the upstream Tau Ceti class-field-theory
  roadmap.
- Section II.2.1, the explicit line-bundle computation on the Fargues-Fontaine curve
  that finishes the G_m case of Proposition IX.6.5, was NOT read. NEXT SOURCE ACTION:
  read FS II.2.1.
- The compatibility of geometric Satake with a map G -> G' inducing an isomorphism of
  adjoint groups, quoted in the proof of Theorem IX.6.1 'as in the proof of Theorem
  VI.11.1', was not read; Theorem VI.11.1 belongs to GeometricSatakeAndFusion.
- Kaletha's Section 5 and Fact 5.5, from which both the construction of a z-embedding
  and the surjectivity Z'(E) -> D(E) are quoted, were NOT read.
- The roadmap asks that the actual maps of Bun and Hecke correspondences be constructed
  and their kernels compared BEFORE any character is evaluated. The source's proofs are
  diagram chases at the level of the correspondences and do not discuss kernels; that
  comparison is an obligation with no locator.
- The upper-right corner of the display in Proposition IX.6.2 is printed in the
  extraction as Z^geom(G_1,Lambda) tensor Z^geom(G_1,Lambda); the second factor must be
  Z^geom(G_2,Lambda). A reviewer should confirm against the printed page.

## ES6:duality — Contragradients with the correct proof return

*Coverage: **partial**. 2 nodes.*

The representation-level halves of FS Proposition IX.5.3: compatibility of the parameter
assignment with Bernstein-Zelevinsky duals, from the commuting square of ES4 and the
Chevalley involution; and with smooth duals, immediately for supercuspidals and through
parabolic induction in general.

### FS IX.5.3: L-parameters are compatible with Bernstein-Zelevinsky duals

`ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals` — *theorem* · planet **Compatibility with Bernstein-Zelevinsky duals**

**Statement.**

The formation of L-parameters for irreducible smooth representations of G(E) is
COMPATIBLE WITH PASSAGE TO BERNSTEIN-ZELEVINSKY DUALS. This is deduced from the
commuting square of Proposition IX.5.3 relating the involution D^spec of
Z^spec(G,Lambda) induced by the CHEVALLEY INVOLUTION of G-hat and the involution D^geom
of Z^geom(G,Lambda) induced by the Bernstein-Zelevinsky duality functor D_BZ on
D_lis(Bun_G,Lambda). The commutation itself follows from the construction of the
excursion operators and from Proposition VI.12.1.

**Hypotheses and warnings.**

- The square is the ES4 statement; this node is its representation-level consequence,
  which the roadmap assigns here and not to ES4
- The Chevalley involution must be PRESERVED in the dual parameter; the roadmap says so
  explicitly. On Z^1(W_E,G-hat) the Chevalley involution of G-hat induces an involution,
  and only AFTER passing to the quotient by the conjugation action of G-hat may one
  forget the inner automorphism appearing in Proposition VI.12.1
- The Hecke-side input is Theorem IX.2.2: for the automorphism sw of Rep(G-hat^I) given
  by Proposition VI.12.1 there are natural isomorphisms D_BZ(T_V(A)) = T_{sw
  V-dual}(D_BZ(A)) and RHom_lis(T_V(A),Lambda) = T_{sw V-dual} RHom_lis(A,Lambda). That
  theorem is HeckeStacksAndLocalShtukas' and is imported
- Proposition VI.12.1 was NOT read in this session; it is GeometricSatakeAndFusion's and
  is the only substantive input

**Proof outline.**

1. Use the square of Proposition IX.5.3 relating D^spec and D^geom.
2. Apply it to the object attached to an irreducible smooth representation by ES5's
   construction.
3. Read off that the parameter of the Bernstein-Zelevinsky dual is the Chevalley
   involution applied to the parameter.

**Acceptance.**

- Check that the Chevalley involution is preserved and that the inner automorphism may be dropped only after passing to the quotient
- Check the Hecke-side identity D_BZ(T_V(A)) = T_{sw V-dual}(D_BZ(A))
- Check that the statement is about irreducible smooth representations and not about arbitrary objects

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-a-schur-irreducible-sheaf`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES4`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `VStackSheavesAndLisseCategories:VS5`, `VStackSheavesAndLisseCategories:VS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `HeckeStacksAndLocalShtukas:HS1`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:Representation`, `mathlib:RootPairing`

**Sources.**

- *Proposition IX.5.3, printed p. 329.* “The formation of L-parameters for irreducible smooth representations of G(E) is compatible with passage to Bernstein-Zelevinsky duals, and to smooth duals.”
  The statement's second sentence, which is this layer's. The commuting square in the
  first sentence belongs to ES4 and is planned in the ES0 part of this roadmap. Read
  directly from the hash-verified PDF in this session.
- *Before Proposition IX.5.3, printed p. 329.* “The Bernstein-Zelevinsky duality functor D_BZ on D_lis(Bun_G,Lambda) induces an involution D^geom of Z^geom(G,Lambda). On the other hand, on Z^1(W_E,G-hat), the Chevalley involution of G-hat induces an involution; after passing to the quotient by the conjugation action of G-hat, we can also forget about the inner automorphism appearing in Proposition VI.12.1.”
  The two involutions, and the exact sense in which the inner automorphism may be
  dropped.
- *Theorem IX.2.2, printed p. 322.* “Moreover, for the automorphism sw of Rep_Lambda(G-hat^I) given by Proposition VI.12.1, there are natural isomorphisms D_BZ(T_V(A)) = T_{sw V-dual}(D_BZ(A)), RHom_lis(T_V(A),Lambda) = T_{sw V-dual} RHom_lis(A,Lambda).”
  The Hecke-side compatibility that makes the duality argument work. It belongs to
  HeckeStacksAndLocalShtukas and is imported.

### FS IX.5.3: smooth duals - immediate for supercuspidals, and via parabolic induction in general

`ExcursionOperatorsAndSpectralAction:ES6:duality/smooth-duals` — *theorem* · planet **Compatibility with smooth duals**

**Statement.**

The formation of L-parameters is also compatible with passage to SMOOTH DUALS. For
SUPERCUSPIDAL representations the Bernstein-Zelevinsky dual agrees with the smooth dual,
so the statement is immediate from the previous node. IN GENERAL the claim for smooth
duals FOLLOWS FROM THE COMPATIBILITY WITH PARABOLIC INDUCTION proved later, that is from
FS Corollary IX.7.3, which belongs to ES7:parabolic. The two halves are therefore not
independent, and the general statement is a LATE RETURN in the roadmap's sense.

**Hypotheses and warnings.**

- The general smooth-dual statement DEPENDS on ES7:parabolic. The roadmap says so and
  adds that ES7:parabolic itself imports only ES6:functoriality, not this return - so
  the dependence must not be made circular
- The supercuspidal case is where the two dualities agree; for a general irreducible
  smooth representation they differ, and the difference is exactly what parabolic
  induction controls
- The representation-theoretic duality and induction theorem the roadmap names as an
  additional import - Aubert-Zelevinsky duality and its interaction with induction - is
  SmoothRepresentationsOfLocalGroups' and is not proved anywhere read here
- Fargues-Scholze's proof of this half is a single sentence

**Proof outline.**

1. For supercuspidal pi, note that the Bernstein-Zelevinsky dual agrees with the smooth
   dual and apply the previous node.
2. For general irreducible pi, use the compatibility with parabolic induction of
   Corollary IX.7.3 together with the representation-theoretic relation between the two
   dualities and induction.

**Acceptance.**

- Check that the supercuspidal case is the one where the two duals agree
- Check that the general case depends on ES7:parabolic and that the dependence is not circular
- Check that the representation-theoretic duality and induction theorem is an import

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:duality/bernstein-zelevinsky-duals`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `VStackSheavesAndLisseCategories:VS5`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- *Proof of Proposition IX.5.3, printed p. 330.* “For the final part, it now follows that the formation of L-parameters is compatible with passage to Bernstein-Zelevinsky duals. For supercuspidal representations, this agrees with the smooth dual. In general, the claim for smooth duals follows from the compatibility with parabolic induction proved below.”
  The proof, quoted verbatim - three sentences, the last of which creates the
  dependence on ES7:parabolic. Read directly from the hash-verified PDF in this
  session.
- *Corollary IX.7.3, printed p. 337.* “In particular, the formation of L-parameters is compatible with parabolic induction: If Lambda = L is an algebraically closed field, pi is irreducible and pi-tilde is an irreducible subquotient of the unnormalised induction Ind^{G(E)}_{P(E)} pi, then phi_{pi-tilde} is conjugate to the composite W_E -> M-hat(L) semidirect W_E -> G-hat(L) semidirect W_E, involving the cyclotomic twist.”
  The statement this node depends on. It belongs to ES7:parabolic and is imported.

**What remains in this layer.**

- Proposition VI.12.1, which identifies the switching involution sw of Rep(G-hat^I) with
  the Chevalley involution up to an inner automorphism, was NOT read. It is
  GeometricSatakeAndFusion's and is the only substantive input to the duality argument.
- The general smooth-dual statement depends on FS Corollary IX.7.3, which belongs to
  ES7:parabolic and is not planned anywhere yet. Until that layer is planned, this half
  rests on an unplanned supplier.
- The representation-theoretic duality and induction theorem that the roadmap names as
  an additional import - the relation between Aubert-Zelevinsky duality and parabolic
  induction - is not proved in anything read and is requested from
  SmoothRepresentationsOfLocalGroups.
- The commuting square itself is planned in the ES0 part of this roadmap, on ES4; this
  packet cites it as a prerequisite by stage.

## Baseline: what the pinned libraries already have

Mathlib `082e2d3`, Tau Ceti `f790474`. `data/library-coverage.json` has no reviewed entry for
this roadmap, so the pinned declaration index was searched directly and each
declaration below was read at the pins before being cited.

| Declaration | Module | Why it is baseline |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Representations of a group on a module. The V of an excursion datum, the smooth representations of G_b(E) whose parameters are constructed here, and the inflate-then-induce recipe of the Weil-restriction argument are all this notion. |
| `mathlib:MonoidHom` | `Mathlib/Algebra/Group/Hom/Defs.lean` | Group homomorphisms. An L-parameter is a continuous 1-cocycle W_E -> G-hat(L) semidirect Q; for a torus it is a homomorphism, and the identification Z^1(W_E,G_m) = Hom(E^times,G_m) of Proposition IX.6.4 is a statement about this type. |
| `mathlib:MulChar` | `Mathlib/NumberTheory/MulChar/Basic.lean` | Multiplicative characters. The smooth characters of T(E) whose parameters Proposition IX.6.5 identifies with the usual ones, and the characters of E^times that local class field theory produces, are of this kind. |
| `mathlib:Units.map` | `Mathlib/Algebra/Group/Units/Hom.lean` | Functoriality of unit groups. E^times and its quotients by open subgroups are the objects the torus case is stated in terms of. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Monoid algebras. Lambda[T(E)/K], whose limit over open K is both the classical Bernstein centre of a torus and, by Proposition IX.6.4, its spectral centre. |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. The excursion algebra, the spectral centre, the invariant rings O((G-hat semidirect Q)^n // G-hat) and the Bernstein centres are commutative rings. |
| `mathlib:RingHom` | `Mathlib/Algebra/Ring/Hom/Defs.lean` | Ring homomorphisms. Every square in Section IX.6 is a square of algebra maps, and the excursion character is a family of maps of Z_l-algebras. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | Free groups. The excursion algebra is a colimit over (n, F_n -> W); the Weil-restriction comparison turns on the fact that a finite-index subgroup F_n x_W W' of F_n is itself finitely generated free. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups. The open subgroup P of the wild inertia, the discrete dense W inside W_E/P, the finite-index F_n x_W W', the open K inside T(E) and the central torus Z' of a z-embedding are subgroups. |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | Condensed objects. Schur-irreducibility is an identity of CONDENSED algebras and the excursion character is a family of maps of CONDENSED sets; without the condensed structure the parameter is not continuous. The condensed enhancement of D_lis is imported from the sheaf roadmaps. |
| `mathlib:CondensedMod` | `Mathlib/Condensed/Module.lean` | Condensed modules. Proposition IX.1.2's relatively discrete condensed animated Lambda-modules Hom(A,B) are of this kind after truncation. |
| `mathlib:Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean` | Endomorphism rings. End(A) = L is the Schur condition, and End(pi^* A) and End(Ind pi) are the targets of the squares of Section IX.6. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Adjunctions. The embedding of a stratum's category is the LEFT ADJOINT to i_b^* of Proposition VII.7.2, and it is fully faithful because its unit is an equivalence; the alpha and beta of an excursion datum are unit and counit. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories. The Hecke datum is a monoidal functor out of Rep((G-hat semidirect Q)^I), and the exterior tensor product of Proposition VII.7.10 is a monoidal comparison. |
| `mathlib:CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean` | Monoidal functors. The categorical datum of FS VIII.4, which the abstract parameter theorem quantifies over, is one. |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Rigid monoidal categories. Dualisability of V in the Satake category gives T_V its adjoints, and the switching involution sw and the Chevalley involution of the duality statements act on duals. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Basic.lean` | Tensor products. Z^spec(G_1,Lambda) tensor Z^spec(G_2,Lambda) is the source of the square of Proposition IX.6.2, and the Hom formula of Proposition VII.7.10 is an isomorphism of tensor products. |
| `mathlib:DirectSum` | `Mathlib/Algebra/DirectSum/Basic.lean` | Direct sums. The decomposition of D_lis(Bun_T,Lambda) over B(T), and the decomposition of a pullback or an exterior product into Schur-irreducible constituents, are stated in these terms. |
| `mathlib:LinearMap.trace` | `Mathlib/LinearAlgebra/Trace.lean` | Traces of endomorphisms. The two-leg excursion datum with V = std tensor std-dual computes a trace, and that is the computation the torus case and the GL_n comparison both run. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | Root pairings. The Chevalley involution, the dual map G-hat -> G-hat' attached to a map inducing an isomorphism of adjoint groups, and the derived group and centre of a reductive group are root-datum notions; the dual group itself is GeometricSatakeAndFusion:GS4's and ReductiveGroupsPartII:RG2.5's. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes. Z^1(F_n,G-hat) and its quotients Z^1(F_n,G-hat)//G-hat are affine schemes, and the Weil-restriction comparison is an isomorphism of affine schemes. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/SmoothDiscrete.lean` | Smooth discrete actions. The irreducible smooth representations of G_b(E) to which parameters are attached are of this kind at the pins. This is a genuine baseline and is NOT the equivalence with sheaves on a stratum, which is VStackSheavesAndLisseCategories:VS4's. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | `TauCeti/RepresentationTheory/SmoothDiscrete.lean` | The category of smooth discrete representations. The Bernstein centre of a torus, and the categories D(G_b(E),Lambda) that the strata are identified with, live over this category. |

Confirmed **absent** at both pins, and therefore not cited: **local class field theory**
in any form — a search of the pinned index found no Artin map, no local reciprocity map
and no class field theory, and Tau Ceti's only `Weil` declarations are about Weil
divisors — the local Weil group as a topological group, the Langlands dual group, stable
infinity-categories and their Ind-completions, perfect complexes on a stack, and the
classical Bernstein decomposition. Everything this packet needs from those notions is
requested from another roadmap rather than cited as baseline.

## Gaps

Eleven, each with a next source action.

### 1. This roadmap has no integrated decomposition; every node was written from the source read in this session

There is no file for ExcursionOperatorsAndSpectralAction in data/decompositions/, no
draft in research/expansion/drafts/, no external contribution and no reviewed audit in
data/library-coverage.json. All sixteen nodes of this packet were written from Fargues-
Scholze read directly, from Geometrization.pdf whose SHA-256 reproduces the recorded
value byte for byte; the text was extracted by inflating the PDF's object streams and
reading its text operators, and every printed page was read off the running heads. The
companion part of this roadmap, covering ES0 to ES4, was written in the same session
from the same reading. A reviewer of this packet is checking a first reading and not a
refinement of a reviewed one.

### 2. The statement of Proposition VIII.3.8 is damaged in the text extraction, so this packet requests it rather than restating it

Proposition VIII.3.8 is the statement that turns an excursion character into a
semisimple parameter, and the whole of ES5 rests on it. On printed pages 289 and 290 the
extraction used here renders its enumerated items (i), (ii) and (iii) as a broken run of
display fragments; what was recovered cleanly is the third item's two commuting squares
- the one induced by pullback and the one induced by multiplication, both with target
Map(W_E^n,L) - and the proof, which says that (i) and (ii) are in natural bijection,
that the recipe gives a canonical map from (ii) to (iii), and that data as in (iii)
gives a semisimple 1-cocycle phi : W_E -> G-hat(L) of discrete groups up to conjugation,
whose continuity follows from V. Lafforgue's Proposition 11.7 and Lemma 11.10. Rather
than reconstruct an enumerated statement that was not read, this packet files the whole
proposition as a request to LanglandsParameterStacks:LP2:semisimple-characters, which
owns it. NEXT SOURCE ACTION: read printed pages 289-290 of Geometrization.pdf in a
viewer and record the three items verbatim.

### 3. V. Lafforgue's continuity argument was not read

The proof of Proposition VIII.3.8 establishes continuity of the resulting cocycle by
citing 'the proof of [Laf18, Proposition 11.7], in particular the choice of finitely
many elements gamma_1,...,gamma_n in W_E such that phi(gamma) is determined by the
closed G-hat-orbit in (G-hat semidirect Q)^{n+1} determined by
(gamma_1,...,gamma_n,gamma) via Theta_{n+1}, cf. [Laf18, Lemma 11.10]'. V. Lafforgue,
Chtoucas pour les groupes reductifs et parametrisation de Langlands globale, J. Amer.
Math. Soc. 31 (2018), was NOT read in this session. Since continuity is the entire
reason for carrying the condensed structure through ES5, this is the deepest unread
dependence of this part. NEXT SOURCE ACTION: read [Laf18] Section 11, in particular
Proposition 11.7 and Lemma 11.10.

### 4. Local class field theory is in neither pinned library, and the whole torus case rests on it

The proof of Proposition IX.6.4 reduces to T = G_m and then says 'In that case
Z^1(W_E,G_m) = Hom(E^times,G_m) by local class field theory, giving the result.' A
direct search of the pinned declaration index for both libraries found no Artin map, no
local reciprocity map, no class field theory and no Weil group: the only matches for
'Weil' in Tau Ceti are Weil divisors, and Mathlib has nothing under ArtinMap, classField
or localReciprocity. So Propositions IX.6.4 and IX.6.5, and with them the identification
of the parameters of characters of a torus with the usual ones, rest entirely on a
request to the upstream Tau Ceti class-field-theory roadmap. NEXT SOURCE ACTION: none in
this source; the statement must come from tauceti:TauCetiRoadmap/ClassFieldTheory layers
8 and 9, with the geometric-Frobenius normalisation fixed.

### 5. FS Section II.2.1, which finishes the G_m case of Proposition IX.6.5, was not read

The proof of Proposition IX.6.5 reduces to computing the excursion operator for I of
size two with V = std tensor std-dual and the tautological unit and counit, and
concludes: 'It is then an easy consequence of Section II.2.1.' Section II.2.1 is the
explicit computation with line bundles on the Fargues-Fontaine curve and was not read in
this session. The roadmap asks for exactly that computation - 'Compute the two-leg
standard/dual excursion using the explicit line-bundle calculation' - so this is the one
place where the layer's own text names a calculation that this packet cannot yet
exhibit. NEXT SOURCE ACTION: read FS Section II.2.1, printed pages in Chapter II; it is
also RelativeFarguesFontaine's and BunGAndNewtonStrata's material.

### 6. Kaletha's Section 5, from which the z-embedding apparatus is quoted, was not read

Both the existence of a z-embedding G -> G' with connected centre and torus quotient,
and the surjectivity Z'(E) -> D(E) quoted as Fact 5.5, come from T. Kaletha, Regular
supercuspidal representations (or the Section 5 of the paper Fargues-Scholze cite as
[Kal18]). Neither was read here. The roadmap makes these lemmas obligations of
ES6:functoriality rather than imports, so a formalisation cannot simply cite them; the
node for them records exactly which properties are used and which are external. NEXT
SOURCE ACTION: read [Kal18] Section 5 and Fact 5.5 and decide whether to plan them here
or route them to ReductiveGroupsPartII.

### 7. Proposition VI.12.1 was not read, and it is the only substantive input to the duality statements

The involution D^spec is defined using the Chevalley involution 'after passing to the
quotient by the conjugation action of G-hat, we can also forget about the inner
automorphism appearing in Proposition VI.12.1', the proof of Proposition IX.5.3 says the
commutation 'follows easily from the construction of excursion operators and Proposition
VI.12.1', and Theorem IX.2.2's duality identities are stated 'for the automorphism sw of
Rep(G-hat^I) given by Proposition VI.12.1'. Proposition VI.12.1 lives in the geometric
Satake chapter, belongs to GeometricSatakeAndFusion, and was not read. NEXT SOURCE
ACTION: read FS VI.12.

### 8. The Schur condition for an irreducible smooth representation is nowhere stated in the source

ES5's own text requires: 'Prove the Schur/condensed scalar-endomorphism fact on the
actual representation category and independence of the eligible embedding at the center
level.' Fargues-Scholze use the transported object freely - for example in the proof of
Corollary IX.7.3, where a sheaf concentrated on a stratum is built from a representation
- and assert the independence of the embedding in a parenthesis in Definition IX.7.1
('All these maps will induce the same map to the Bernstein center'), but neither
statement is proved in anything read here, and the first is not even stated. Both are
open obligations of this layer with no locator. NEXT SOURCE ACTION: none in this source;
the statements have to be formulated against VStackSheavesAndLisseCategories:VS4's
identification and proved.

### 9. The roadmap's demand to compare kernels before evaluating characters has no counterpart in the source

ES6:functoriality's text opens: 'Construct the actual maps of Bun/Hecke correspondences
and compare their kernels before evaluating any character.' The proofs of IX.6.1, IX.6.2
and IX.6.3 are computations with those correspondences - a push-pull identity, a diagram
chase, and a closed immersion of Hecke stacks - but none of them discusses kernels, and
no statement in anything read compares them. This is an obligation the roadmap adds; the
packet records it rather than inventing a statement to satisfy it.

### 10. The excursion-algebra variants of Section IX.6 are not written out anywhere

The head of IX.6 says all its results 'admit an obvious variant replacing the spectral
Bernstein center by an excursion algebra when this assumption is omitted'. Not one of
the five variants is written out, and the roadmap requires them: 'Prove their excursion-
algebra versions without that restriction, yielding the field-valued statements for all
l not equal to p.' This packet records which statements need a variant and does not
manufacture the variants; a continuation must state and prove each one.

### 11. The display in Proposition IX.6.2 is misprinted in the extraction

The extraction used here renders the upper-right corner of the square in Proposition
IX.6.2 as Z^geom(G_1,Lambda) tensor Z^geom(G_1,Lambda), with the first factor repeated.
The second factor is plainly Z^geom(G_2,Lambda), and the packet states it that way. This
is recorded as an artefact of the extraction rather than an error in the source; a
reviewer should confirm against the printed page. Nothing else in the node depends on
it.

## Requests to other roadmaps

| Supplier | What is needed |
| --- | --- |
| `LanglandsParameterStacks:LP2:semisimple-characters` | Proposition VIII.3.8: the passage from a family of maps Theta_n : O((G-hat semidirect Q)^n // G-hat) -> Map(W_E^n, L) of CONDENSED sets, satisfying the pullback and multiplication relations of Proposition VIII.3.7, to a semisimple continuous L-parameter W_E -> G-hat(L) semidirect Q, unique up to conjugation. This is the single statement on which the whole of ES5 rests. Its enumerated statement is damaged in the extraction used here, so this packet does not restate it; and the continuity step is quoted by Fargues-Scholze from V. Lafforgue's Proposition 11.7 and Lemma 11.10. |
| `LanglandsParameterStacks:LP0` | The scheme Z^1(W_E,G-hat), the Weil group W_E itself, the description of its L-valued points, the open subgroups of the wild inertia and the discretisation of W_E/P. Also Section VIII.3.1's description of the L-valued points of the coarse moduli space Z^1(W_E,G-hat)_L // G-hat as the CLOSED G-hat-orbits, which is what makes 'semisimple' the right word in Corollary VIII.4.3. |
| `LanglandsParameterStacks:LP2:excursion-presentation` | The excursion algebra Exc(W,G-hat) with its presentation as a colimit over (n, F_n -> W), the invariant rings O((G-hat semidirect Q)^n // G-hat), the relations of Proposition VIII.3.7, and the universal property of the l-torsion-free quotient. The Weil-restriction comparison of Proposition IX.6.3 is an argument about that presentation. |
| `LanglandsParameterStacks:LP2:integral-invariants` | The integral invariant-function theory of the parameter stack, which is what Z^spec(G,Lambda) is for a general Z_l[sqrt q]-algebra Lambda, and the component decomposition it carries. Every centre-level square of Section IX.6 is a square of maps out of it. |
| `HeckeStacksAndLocalShtukas:HS1` | The condensed enhancement of D_lis(Bun_G,Lambda): the condensed infinity-category structure of Section IX.1, Proposition IX.1.2's relative discreteness on compact objects, and the condensed W_E^I-equivariant objects. Schur-irreducibility is an identity of CONDENSED algebras, and the continuity of the parameter comes from nothing else. |
| `HeckeStacksAndLocalShtukas:HS4` | The Hecke functors T_V given coCartesianly in the finite set I, the fusion compatibility, and Theorem IX.2.2's duality identities D_BZ(T_V(A)) = T_{sw V-dual}(D_BZ(A)) and RHom_lis(T_V(A),Lambda) = T_{sw V-dual} RHom_lis(A,Lambda). The first is what every excursion datum is built from; the second is the Hecke-side input of the duality statements of ES6:duality. |
| `GeometricSatakeAndFusion:GS4:integral-dual-group` | The dual group G-hat with its Q-action, the category Rep((G-hat semidirect Q)^I) over the coefficients used here, the CHEVALLEY INVOLUTION, Proposition VI.12.1's identification of the switching involution sw, and the compatibility of geometric Satake with a map G -> G' inducing an isomorphism of adjoint groups (quoted in the proof of Theorem IX.6.1 'as in the proof of Theorem VI.11.1'). |
| `ReductiveGroupsPartII:RG2.5` | The integral pinned dual group and the L-group with its projection and action law, its change-of-pinning equivalence and Levi inclusions, and its compatibility with products, central isogenies and restriction of scalars. Theorem IX.6.1, Proposition IX.6.2 and Proposition IX.6.3 are exactly statements about those three compatibilities on the automorphic side, and they need the dual-side ones to be available first. |
| `VStackSheavesAndLisseCategories:VS3` | The Ind-category of D_lis(Bun_G,Lambda) and its compact objects, and the relation between them. Proposition IX.1.2 is a statement about compact objects, and the Schur condition is checked there. |
| `VStackSheavesAndLisseCategories:VS4` | The identification D(G_b(E),Lambda) = D_lis(Bun^b_G,Lambda) and Proposition VII.7.2's LEFT ADJOINT pi_{b!} q_b^* to i_b^*, whose unit is an equivalence. ES5's assignment of a parameter to an irreducible smooth representation is the transport along that embedding and has no other definition. |
| `VStackSheavesAndLisseCategories:VS5` | Bernstein-Zelevinsky duality D_BZ on D_lis(Bun_G,Lambda), and Proposition VII.7.10's statement that exterior tensor products of compact objects are compact, generate, and satisfy the Hom formula. The first is the geometric involution of ES6:duality; the second is the categorical input of Proposition IX.6.2. |
| `SmoothRepresentationsOfLocalGroups:SR.0` | The category of smooth representations of a locally profinite group over the allowed coefficients, and irreducibility in it. The objects to which ES5 attaches parameters are irreducible smooth representations of G_b(E). |
| `SmoothRepresentationsOfLocalGroups:SR.1` | The normalisation conventions for induction and for the modulus character. Proposition IX.6.5 fixes the geometric-Frobenius normalisation of local class field theory, and the roadmap requires that the dictionary with the local-group owner's conventions be explicit. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Parabolic induction and its interaction with duality. The general smooth-dual statement of ES6:duality is deduced from compatibility with parabolic induction together with the representation-theoretic relation between the two dualities. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | The classical Bernstein centre and its block description. Z(T(E),Lambda) = lim over open K of Lambda[T(E)/K] is the object Proposition IX.6.4 identifies with the spectral centre of a torus. |
| `BunGAndNewtonStrata:BG0` | Bun_G, the set B(G) and the strata Bun^b_G, with the sigma-centralisers G_b and the pure-inner-twisting formalism. Proposition IX.6.4's product decomposition over B(T), the injectivity of B(G) -> B(G') for a z-embedding, and every statement about a stratum rest on them. |
| `BunGAndNewtonStrata:BG1` | The Newton and Kottwitz invariants and the identification B(T) = pi_1(T)_Gamma for a torus, which is what indexes the product in Section IX.6.4. |
| `BunGAndNewtonStrata:BG2` | Bun_G as an Artin v-stack and the description of Bun_G as a fibre product Bun_{G'} x_{Bun_D} {*} for a z-embedding G -> G' with torus quotient D, which is the geometric half of the z-embedding apparatus. |
| `EnhancedDerivedSheaves:E5:abstract` | Small idempotent-complete Lambda-linear stable infinity-categories and their endofunctor categories, over which the abstract statement of Corollary VIII.4.3 quantifies. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence` | LOCAL CLASS FIELD THEORY, in the form the identification Z^1(W_E,G_m) = Hom(E^times,G_m) of Proposition IX.6.4 needs, with the GEOMETRIC-FROBENIUS normalisation that Proposition IX.6.5 and the degree map of Section IX.7.1 both use. A direct search of the pinned declaration index found no Artin map and no local reciprocity map in either Mathlib 082e2d3 or Tau Ceti f790474, so the whole torus case of this layer rests on this request. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | The local Weil group W_E as a topological group, with its inertia and wild inertia subgroups and the normalised degree map sending geometric Frobenius to 1. Every parameter in this packet is a continuous cocycle on it, and the pinned libraries have no Weil group. |

## Structural findings

### 1. ES6, like ES1, is a parent layer with no external supplier, while ES0 supplies its own child

*Kind: `link-direction`.*

Within this one roadmap the parent-child edges run in two directions. ES0's recorded
inputs are six external stages and ES0 SUPPLIES its child ES0:classical-center. ES6's
recorded inputs, by contrast, are its own two children ES6:duality and
ES6:functoriality, and ES6 has no external supplier and no consumer at all. The same
holds for ES1. The consequence for a reader of the link graph is that ES6 - the layer
whose text states the whole functoriality programme, including the coefficient policy
that governs both children - appears to rest on nothing. This packet gives ES6 one node,
the coefficient policy, whose prerequisites are ES1:spectral-center, ES0, ES1:finite-
ramification, LP2:excursion-presentation, LP2:integral-invariants and LP2:semisimple-
characters; none of those edges exists. The companion ES0 packet of this session files
the same finding for ES1. A kind:link or kind:restructure job should settle the
convention for parent layers across this roadmap and then draw the edges the texts
require.

### 2. ES5 and ES6:duality both use suppliers the atlas does not record

*Kind: `missing-links`.*

ES5's recorded inputs are ES0, ES1:finite-ramification, LP2:semisimple-characters, SR.0
and VS4. Its nodes here additionally need HeckeStacksAndLocalShtukas:HS1 - without the
condensed enhancement the Schur condition cannot even be stated - HS4,
GeometricSatakeAndFusion:GS4:integral-dual-group, LanglandsParameterStacks:LP0 and
LP2:excursion-presentation, VStackSheavesAndLisseCategories:VS3 and VS5, and
BunGAndNewtonStrata:BG0 and BG1. ES6:duality's recorded inputs are ES5,
ES6:functoriality, ES7:parabolic and VS5; its nodes additionally need GS4:integral-dual-
group, whose Proposition VI.12.1 is the only substantive input to the whole argument,
and HS4 for Theorem IX.2.2's duality identities, and ES4, where the commuting square
itself lives. ES6:functoriality's recorded inputs are ES5, GS4:integral-dual-group, HS4
and ReductiveGroupsPartII:RG2.5; its nodes additionally need BunGAndNewtonStrata:BG0,
BG1 and BG2, and local class field theory, which no stage of this atlas supplies at all.
A kind:link job should draw these; the class-field-theory dependence in particular is a
link from a proposed roadmap to an upstream Tau Ceti roadmap and may need a new kind of
edge.

### 3. Local class field theory has no owner anywhere in this family, and two layers of this roadmap stop dead without it

*Kind: `new-layer`.*

Propositions IX.6.4 and IX.6.5 - the torus case, and with it the statement that the
parameters this roadmap constructs for tori are the usual ones - rest on the single
identification Z^1(W_E,G_m) = Hom(E^times,G_m). A direct search of the pinned
declaration index found nothing of the kind in either library: Mathlib 082e2d3 has no
Artin map and no local reciprocity map, and Tau Ceti f790474's only 'Weil' declarations
are about Weil divisors. Nor does any stage of any roadmap in this family claim it:
LanglandsParameterStacks:LP0 owns Weil groups and continuous cocycles, but the
reciprocity isomorphism is arithmetic, not cocycle-theoretic. The upstream Tau Ceti
roadmap ClassFieldTheory has layers 8 and 9 - the local class-field correspondence and
the local Weil group - and they are the natural owners. What is missing is an edge, and
possibly a Part II: the statement needed here is the reciprocity map with a FIXED
geometric-Frobenius normalisation, compatible with the degree map used in Section
IX.7.1, and that normalisation is exactly the sort of thing an upstream layer states
loosely and a consumer needs pinned. A kind:link job should draw the edges; if layer 8
does not fix the normalisation, a ClassFieldTheory Part II should.

