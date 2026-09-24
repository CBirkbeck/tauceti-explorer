# Excursion operators and the spectral action — layers ES0 to ES4

*A blueprint packet for the Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`,
part `ES0` (layers ES0, ES0:classical-center, ES1, ES1:finite-ramification,
ES1:spectral-center, ES2, ES3, ES4). Written by Claude Code, session `cc-7b31c4`,
24 September 2026, for issue #726.*

## What this document is

Centres, excursion operators and the spectral action, layers ES0 to ES4. This roadmap
has NO integrated decomposition - no file in data/decompositions/, no draft, no external
contribution - so every one of the twenty-six nodes of this packet was written from
Fargues-Scholze read directly in this session, from a file whose SHA-256 reproduces the
recorded value byte for byte, with the text extracted by inflating the PDF's object
streams and every printed page read off the running heads. The sections read are VIII.4
in full, VIII.5's statements, IX.4, IX.5 in full, the head of IX.6, IX.7 in full and the
whole of Chapter X. The packet covers: the Bernstein centre of a category as End(id_C),
with the distinction between a natural endomorphism of the identity and an endomorphism
of one object; excursion data and operators, the invariant function they factor through,
the reindexing, multiplication and unit-insertion relations, and Theorem VIII.4.1's
algebra map Exc(W,G-hat) -> End(id_C); the discretisation route by which a theory stated
for a DISCRETE group reaches W_E, through the wild cutoff of IX.5.1 and a discretisation
of the tame inertia; the map from the geometric centre to the classical Bernstein centre
and the description of the latter as a limit over levels; the spectral centre, the
geometric centre and the Hecke-compatible part; Proposition IX.5.1 with its proof in
full and the component decomposition it produces, a sum on compact objects and a product
on Ind-categories; Theorem IX.5.2 and the excursion-algebra fallback that survives
without its coefficient hypothesis; compact support over a parameter stack that is an
infinite disjoint union; Theorem X.1.1 and Lemma X.1.2 each with its proof in full, and
Corollary X.1.3, the rational spectral action; the failure of X.1.2 integrally, the
sifted-colimit approximation that replaces it, Propositions X.3.1 to X.3.4 and Theorems
X.0.1 and X.0.2; and, for ES4, the duality square of IX.5.3 and the elliptic material of
X.2 with its decomposition over the basic elements of B(G). Several statements a reader
might expect here are deliberately NOT planned, because the roadmap assigns them
elsewhere: FS Definition/Proposition IX.4.1 and its abstract form Corollary VIII.4.3
belong to ES5, the representation-level consequences of IX.5.3 to ES6:duality, and
Definition IX.7.1 with Theorems IX.7.2, IX.7.3 and IX.7.4 to ES7:parabolic and ES7:GLn-
comparison. All of them were read in this session and their locators are recorded in the
handoff note for whoever takes those layers. Twenty-six baseline declarations, all read
at the pinned commits. Eleven gaps, each with a next source action. Seventeen requests.
Three structural findings. A reviewed library audit DOES exist for this roadmap:
AUDIT-20, reviewed as REV-AUDIT-20 on 17 September 2026 (240 targets checked, 89
corrections), covers every layer of ExcursionOperatorsAndSpectralAction and returns the
verdict NOT BUILT for each of them. Two targets are recorded as PARTIAL and are cited
here rather than planned: ES0's algebra of natural endomorphisms of the identity, which
is Mathlib's `CategoryTheory.CatCenter`, and ES3's coefficient hypothesis, which the
pinned root pairings can state.

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

- VIII.4 Excursion operators, printed pp. 290-293: the categorical hypotheses including
  that W is taken DISCRETE, Theorem VIII.4.1 with its attribution to V. Lafforgue,
  Definition VIII.4.2, the relation S_D = S_{D'}, the invariant function
  f(V,alpha,beta), the cartesian reindexing square, the fusion argument for
  multiplicativity, the unit-insertion identification and the maps Theta_n, and
  Corollary VIII.4.3.
- VIII.5, printed p. 293: Theorem VIII.5.1 and Theorem VIII.5.2, read for their
  statements only, because the proof of IX.5.2 and the proof of X.0.2 both invoke
  VIII.5.1. Their own decomposition belongs to LanglandsParameterStacks.
- IX.4, printed p. 327: Definition/Proposition IX.4.1 with its one-line proof, read
  because ES5 owns it and because this packet must not duplicate it.
- IX.5 The Bernstein center, printed pp. 327-330: the non-quasicompactness of the
  parameter stack, Proposition IX.5.1 with its proof in full, the definition of D^P_lis,
  the universal homeomorphism and the component decomposition on compact objects and on
  Ind-categories, the remark that a Schur-irreducible object lies in one factor, the map
  Z^geom -> Z(G(E),Lambda) with its attribution to Helm-Moss, Theorem IX.5.2 with its
  proof, the construction of D^geom and D^spec, and Proposition IX.5.3 with its proof.
- IX.6, printed p. 330 (head of section only): the standing hypothesis on pi_0 Z(G) and
  the statement that all results admit a variant with an excursion algebra when it is
  omitted. The rest of IX.6 - isogenies, products, Weil restriction and tori - was read
  but belongs to ES6:functoriality and is NOT planned here.
- IX.7, printed pp. 334-338: Definition IX.7.1, Theorem IX.7.2 with its proof, Corollary
  IX.7.3 with its proof, and Theorem IX.7.4 with its proof. These were read to route
  them, and they belong to ES7:parabolic and ES7:GLn-comparison; only the description of
  the classical Bernstein centre as a limit over levels, quoted from the proof of
  IX.7.2, is taken into this packet.
- X.0, printed pp. 339-340: the non-quasicompactness of Z^1(W_E,G-hat), the definition
  of a compactly supported action, Theorem X.0.1, the reduction using the proof of
  IX.5.1 and a discretisation, and Theorem X.0.2.
- X.1 Rational coefficients, printed pp. 340-346: the construction of Map_{/BQ}(S,B(H
  semidirect Q)) and its presentation as a quotient of an affine derived scheme, Theorem
  X.1.1 with its proof in full, Lemma X.1.2 with its proof in full, Corollary X.1.3 with
  its proof, Conjecture X.1.4, Remark X.1.5, Examples X.1.6 and X.1.7 and Remark X.1.8,
  and the construction of the eigensheaf Aut_phi.
- X.2 Elliptic parameters, printed pp. 346-348: Definition X.2.1 with its deformation-
  theoretic footnote, the vanishing on non-basic strata, the decomposition over basic
  elements, the supercuspidality statement, the description when Z(G-hat)^Gamma is
  finite, Conjecture X.2.2, and the Hecke formula T_V(pi) = sum of Act_{W_i}(pi) tensor
  sigma_i.
- X.3 Integral coefficients, printed pp. 348-350: the failure of the analogue of Lemma
  X.1.2, the definition of the sifted-colimit approximation, Propositions X.3.1, X.3.2,
  X.3.3 and X.3.4 each with its proof, the closing sentence combining them with Theorem
  VIII.5.1, and Conjecture X.3.5.

## What this packet does not plan, and why

Three bodies of material inside the sections read belong to layers outside this part,
and are deliberately left to them rather than duplicated here (PROTOCOL.md section 15).
Their locators are recorded in the handoff note so that whoever takes those layers does
not have to find them again.

| Statement | Printed page | Owner |
| --- | --- | --- |
| Corollary VIII.4.3, the abstract semisimple parameter of a Schur object | 292–293 | `ES5` |
| Definition/Proposition IX.4.1, the same statement for `D_lis(Bun_G,L)` | 327 | `ES5` |
| IX.5.3's second sentence, on duals of irreducible smooth representations | 329 | `ES6:duality` |
| IX.6.1–IX.6.5, isogenies, products, Weil restriction and tori | 330–333 | `ES6:functoriality` |
| Definition IX.7.1 and Theorems IX.7.2, IX.7.3 | 334–338 | `ES7:parabolic` |
| Theorem IX.7.4, the `GL_n` comparison | 338 | `ES7:GLn-comparison` |
| Conjectures X.1.4, X.2.2 and X.3.5 | 344, 347, 350 | conjectural; no layer plans them |

## ES0 — Centers and excursion algebra

*Coverage: **partial**. 6 nodes.*

The Bernstein centre of a category as End(id_C) with its centrality and scalar
structure; excursion data and operators (VIII.4.2); the invariant function
f(V,alpha,beta) and the independence of the realising representation; the reindexing,
multiplication and unit-insertion relations; Theorem VIII.4.1; and the discretisation
route by which the discrete theory reaches W_E. This roadmap has NO integrated
decomposition, so every node was written from Fargues-Scholze read in this session.

### The Bernstein centre of a category: what Mathlib already has, and the enhanced version that is missing

`ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category` — *definition* · planet **The Bernstein centre of a category**

**Statement.**

For a Lambda-linear category C the BERNSTEIN CENTRE of C is End(id_C). Mathlib ALREADY
HAS THIS at the pinned commit: `CategoryTheory.CatCenter C` is by definition `End
(1_C)`, it is commutative, `CatCenter.app` evaluates a central element at an object,
`CatCenter.naturality` records the naturality from which centrality follows, and
`Linear.toCatCenter` gives the ring map R -> CatCenter C for an R-linear category.
Fargues-Scholze use exactly this name for exactly this object: Theorem VIII.4.1 produces
a map of algebras to 'the Bernstein center of C (i.e., the algebra of endomorphisms of
the identity of C)'. WHAT IS MISSING, and what this node owns, is the ENHANCED version:
for a stable Lambda-linear enhancement the relevant object is the DEGREE-ZERO part pi_0
End(id), which the proof of IX.5.1 writes Z(D^P_lis(Bun_G,Lambda)^omega) = pi_0 End(id),
together with its condensed structure. The reviewed audit AUDIT-20 records this target
as PARTIAL for precisely this reason.

**Hypotheses and warnings.**

- The 1-categorical construction is NOT planned here: it is `CategoryTheory.CatCenter`
  at Mathlib 082e2d3, together with its `app`, `naturality`, `ext` and `mul_app` lemmas
  and the scalar map `Linear.toCatCenter`. The reviewed audit AUDIT-20 calls this target
  partial, and PROTOCOL.md section 15 forbids planning it again
- What is missing at the pins is the enhanced version: pi_0 of the endomorphism spectrum
  of the identity of a STABLE Lambda-linear infinity-category, and its condensed
  structure. That is what the excursion algebra maps to and what this node owns
- The centre is an invariant of the CATEGORY, not of any group; the comparison with the
  classical Bernstein centre of a locally profinite group is ES0:classical-center's, and
  AUDIT-20 records that the classical Bernstein centre does not exist in either library
- Centrality is automatic from naturality, and is already proved at the pins as
  `CatCenter.naturality`
- Lambda is a Z_l[sqrt q]-algebra throughout this roadmap, and C is Lambda-linear, so
  the scalar structure is `Linear.toCatCenter`

**Proof outline.**

1. Cite the pinned `CategoryTheory.CatCenter` for the 1-categorical notion, its
   commutativity, `app` and the scalar map.
2. Define the degree-zero centre of a stable Lambda-linear enhancement as pi_0 of the
   endomorphisms of the identity, and check that it recovers the pinned notion on the
   homotopy category.
3. Record the condensed structure it inherits from the condensed enhancement of
   D_lis(Bun_G,Lambda), which is what makes the excursion character continuous.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CatCenter` | data | PINNED. `CategoryTheory.CatCenter C = End (1_C)`, commutative, at Mathlib 082e2d3. Cited, not planned. |
| `CatCenter.app` | projection | PINNED. Evaluation at an object; this is the pinned form of the one-object/all-objects distinction. |
| `CatCenter.naturality` | structure | PINNED. Naturality, from which centrality follows. |
| `Linear.toCatCenter` | structure | PINNED. `R ->+* CatCenter C` for an R-linear category; the Lambda-algebra structure of the centre. |
| `centreOfStableEnhancement` | data | MISSING: pi_0 End(id) for a stable Lambda-linear enhancement, which is what Theorem VIII.4.1's target is in the geometric setting. |
| `centreOfStableEnhancement.toCatCenter` | compatibility | MISSING: it agrees with the pinned `CatCenter` of the homotopy category; this is the compatibility the audit's partial verdict asks for. |
| `centreOfStableEnhancement.condensed` | structure | MISSING: the condensed structure inherited from the condensed enhancement of D_lis(Bun_G,Lambda), without which no excursion character is continuous. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center` — the excursion algebra maps into it
- `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers` — the geometric centre is this construction applied to D_lis(Bun_G,Lambda)
- `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center` — the comparison with the classical Bernstein centre starts from it

**Unit tests.**

- `agrees_with_pinned_CatCenter` — On the homotopy category the degree-zero centre of a stable enhancement is the pinned `CategoryTheory.CatCenter`; a definition that does not is wrong.
- `naturality_is_required` — A family of endomorphisms that is not natural is not central; `CatCenter.app` and `CatCenter.naturality` already make this precise at the pins.
- `scalar_at_a_schur_object` — If End(X) = Lambda then evaluation at X gives an algebra map out of the centre; this is the mechanism the parameter assignment of ES5 uses.
- `degree_zero` — For a stable C the target of Theorem VIII.4.1 is pi_0 of the endomorphisms of the identity; using the whole spectrum changes the statement.

**Acceptance.**

- Check that the 1-categorical notion is the pinned `CatCenter` and is cited rather than redefined
- Check that the degree-zero centre of a stable enhancement recovers `CatCenter` of the homotopy category
- Check that an endomorphism of one object does not give a central element, which `CatCenter.app` already makes precise
- Check that evaluation at a Schur-irreducible object gives a character of the centre, the mechanism ES5 uses

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `VStackSheavesAndLisseCategories:VS4`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.CatCenter.app`, `mathlib:CategoryTheory.CatCenter.naturality`, `mathlib:CategoryTheory.Linear.toCatCenter`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.NatTrans`, `mathlib:CategoryTheory.Preadditive`, `mathlib:Module.End`, `mathlib:Condensed`

**Sources.**

- *Theorem VIII.4.1, printed p. 291.* “there is a natural map of algebras Exc(W, G-hat) -> End(id_C) to the Bernstein center of C (i.e., the algebra of endomorphisms of the identity of C).”
  Fargues-Scholze's own name for End(id_C). Read directly from Geometrization.pdf in
  this session; the file's SHA-256 reproduces the value recorded in
  references/CATALOGUE.json.
- *Proof of Proposition IX.5.1, printed p. 328.* “Theorem VIII.4.1 gives a canonical map of algebras Exc(W, G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega) = pi_0 End(id_{D^P_lis(Bun_G,Lambda)^omega}).”
  The degree-zero part, and the notation Z(-) for it, exactly as the excursion
  algebra's target.
- *Proof of Proposition IX.5.1, printed p. 328.* “Exc(W, G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega) = pi_0 End(id_{D^P_lis(Bun_G,Lambda)^omega})”
  The degree-zero part, which is the enhanced notion this node owns. The 1-categorical
  notion is already `CategoryTheory.CatCenter` at the pins and is cited, not planned.

### FS VIII.4.2: excursion data and the excursion operators S_D

`ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator` — *definition* · planet **Excursion data and operators**

**Statement.**

An EXCURSION DATUM is a tuple D = (I, V, alpha, beta, (gamma_i)_{i in I}) consisting of
a finite set I, an object V in Rep_{Z_l}((G-hat semidirect Q)^I) with maps alpha : 1 ->
V restricted to Rep_{Z_l}(G-hat) and beta : V restricted to Rep_{Z_l}(G-hat) -> 1, and
elements gamma_i in W for i in I; the restriction Rep_{Z_l}((G-hat semidirect Q)^I) ->
Rep_{Z_l}(G-hat) is the restriction to the DIAGONAL copy of G-hat inside G-hat^I inside
(G-hat semidirect Q)^I. Such a datum gives an endomorphism of the identity functor of C,
S_D : id = T_1 --T_alpha--> T_V --(gamma_i)_{i in I}--> T_V --T_beta--> T_1 = id.
Varying the gamma_i, this gives a map W^I -> End(id_C).

**Hypotheses and warnings.**

- V is a representation of the I-FOLD product (G-hat semidirect Q)^I, but alpha and beta
  are maps to and from the restriction to the DIAGONAL copy of G-hat; conflating the two
  makes the datum meaningless
- W is a DISCRETE group. Fargues-Scholze say so explicitly: 'In order to avoid
  topological problems, we work in the setting of the discrete subgroup W inside W_E/P;
  in fact, we can take here any discrete group W.' The passage to the Weil group itself
  is not part of this definition
- The categorical datum is a monoidal Rep_{Z_l}(Q^I)-linear functor Rep_{Z_l}((G-hat
  semidirect Q)^I) -> End(C)^{BW^I}, given FUNCTORIALLY IN FINITE SETS I; a family of
  functors without that functoriality is not the datum, and the finite-set functoriality
  is HeckeStacksAndLocalShtukas:HS4's
- The middle arrow is the action of the tuple (gamma_i) through the W^I-equivariant
  structure of T_V, which in the geometric application is the CONDENSED Weil action of
  HS1

**Proof outline.**

1. Fargues-Scholze isolate the categorical data - a Lambda-linear category C with a
   monoidal Hecke action functorial in finite sets, over a DISCRETE group W - and define
   the excursion datum against it.
2. The operator is the composite of T_alpha, the action of the tuple (gamma_i) and
   T_beta.
3. Varying the gamma_i gives a map W^I -> End(id_C).

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ExcursionDatum` | data | (I, V, alpha, beta, (gamma_i)) with V in Rep((G-hat semidirect Q)^I), alpha and beta unit and counit for the DIAGONAL restriction, and gamma_i in the discrete group W. |
| `ExcursionDatum.diagonalRestriction` | structure | alpha and beta are maps to and from the restriction of V to the diagonal copy of G-hat; this is what makes the composite an endomorphism of the identity. |
| `excursionOperator` | data | S_D = T_beta o (gamma_i)_* o T_alpha : id -> id, the four-step composite through T_V. |
| `excursionOperator.varyGamma` | functoriality | Varying the gamma_i gives W^I -> End(id_C); this is the map the excursion algebra is built from. |
| `heckeDatum` | data | The categorical input: a monoidal Rep(Q^I)-linear functor Rep((G-hat semidirect Q)^I) -> End(C)^{BW^I}, functorial in finite sets I. |
| `heckeDatum.discreteW` | structure | W is a discrete group in the abstract theory; topology enters only through the discretisation of ES0's comparison node. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES0/invariant-function-attached-to-a-datum` — the function is extracted from (V,alpha,beta)
- `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center` — the algebra map is assembled from these operators
- `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup` — the wild subgroup is chosen so that all these operators factor

**Unit tests.**

- `trivial_datum` — For I a point and V the unit, S_D is the identity; anything else is a normalisation error.
- `two_leg_std_dual` — For I of size two, V = std tensor std-dual with the unit and counit, the operators determine the trace of the associated representation.
- `diagonal_not_product` — alpha and beta are maps to and from the DIAGONAL restriction; using the full product representation gives maps that do not compose to an endomorphism of the identity.
- `discrete_group` — W is discrete in this definition; a version quantifying over all of W_E with its topology is the statement of a different, later, step.

**Acceptance.**

- Check the trivial datum I a point, V = 1: the operator is the identity
- Check the two-leg datum with V = std tensor std-dual and the unit and counit, the datum that determines a trace
- Check that alpha and beta are maps to and from the DIAGONAL restriction, not the whole product
- Check that W is taken discrete here, and that nothing in this definition mentions a topology

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `EnhancedDerivedSheaves:E5:abstract`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:Representation`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Adjunction`

**Sources.**

- *Definition VIII.4.2, printed p. 291.* “An excursion datum is a tuple D = (I,V,alpha,beta,(gamma_i)_{i in I}) consisting of a finite set I, an object V in Rep_{Z_l}((G-hat semidirect Q)^I) with maps alpha : 1 -> V|_{Rep_{Z_l}(G-hat)}, beta : V|_{Rep_{Z_l}(G-hat)} -> 1 and elements gamma_i in W, i in I. Here, the restriction ... is the restriction to the diagonal copy of G-hat inside G-hat^I inside (G-hat semidirect Q)^I.”
  The definition, quoted with the diagonal restriction. Read directly from the hash-
  verified PDF in this session.
- *After Definition VIII.4.2, printed p. 291.* “These give rise to an endomorphism of the identity functor of C, as follows. S_D : id = T_1 --T_alpha--> T_V --(gamma_i)_{i in I}--> T_V --T_beta--> T_1 = id. Varying the gamma_i, this gives a map W^I -> End(id_C) to the endomorphisms of the identity functor on C.”
  The operator as a four-step composite, and the resulting map out of W^I.
- *Before Theorem VIII.4.1, printed pp. 290-291.* “In order to avoid topological problems, we work in the setting of the discrete subgroup W inside W_E/P; in fact, we can take here any discrete group W. Let Lambda be a discrete Z_l-algebra and let C be a Lambda-linear category. Assume that functorially in finite sets I, we are given a monoidal Rep_{Z_l}(Q^I)-linear functor Rep_{Z_l}((G-hat semidirect Q)^I) -> End(C)^{BW^I} : V -> T_V.”
  The exact categorical hypotheses, including that W is DISCRETE and that the functor
  is given functorially in finite sets.

### FS VIII.4: the operator depends only on the invariant function f(V,alpha,beta), not on V

`ExcursionOperatorsAndSpectralAction:ES0/invariant-function-attached-to-a-datum` — *construction* · planet **The invariant function of an excursion datum**

**Statement.**

A triple (V, alpha, beta) determines an element f = f(V,alpha,beta) in O(G-hat \ (G-hat
semidirect Q)^I / G-hat), the functions on the quotient by diagonal left and right
multiplication: for g_i in G-hat semidirect Q, i in I, the composite 1 --alpha--> V
--(g_i)_{i in I}--> V --beta--> 1 is an element of the base ring, and since alpha and
beta are equivariant for the diagonal G-hat-action this is a function on the double
quotient. If two excursion data D = (I,V,alpha,beta,(gamma_i)) and D' =
(I,V',alpha',beta',(gamma_i)) share I and the gamma_i and there is a map g : V -> V'
taking alpha to alpha' and beta' to beta, then S_D = S_{D'}. Hence the assignment
factors through f and defines Theta_I : O(G-hat \ (G-hat semidirect Q)^I / G-hat) ->
Map(W^I, End(id_C)).

**Hypotheses and warnings.**

- The double quotient is by DIAGONAL left and right multiplication; f is not a function
  on (G-hat semidirect Q)^I itself
- The comparison of D and D' requires a map g : V -> V' carrying alpha to alpha' AND
  beta' back to beta - one arrow in each direction of composition - and the proof is
  that the resulting ladder of squares commutes
- This is the step the roadmap calls 'independence of the representation realizing the
  function': two representations realising the same invariant function give the same
  operator
- The presentation of the invariant ring is LanglandsParameterStacks:LP2:excursion-
  presentation's, not this roadmap's

**Proof outline.**

1. Given (V,alpha,beta), evaluate the composite 1 -> V -> V -> 1 at a tuple (g_i) to get
   an element of the base ring.
2. Use equivariance of alpha and beta under the diagonal G-hat-action to see that this is
   a function on the double quotient.
3. Given g : V -> V' as above, write the ladder of four squares comparing S_D and S_{D'}
   and observe that it commutes, so S_D = S_{D'}.
4. Conclude that the assignment D -> S_D factors through f, giving Theta_I.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `invariantFunction` | data | f(V,alpha,beta) in O(G-hat \ (G-hat semidirect Q)^I / G-hat), obtained by evaluating the composite on a tuple. |
| `invariantFunction.doubleQuotient` | structure | f lives on the quotient by DIAGONAL left and right multiplication, which is what the equivariance of alpha and beta buys. |
| `operatorDependsOnlyOnF` | characterisation | S_D depends only on I, the gamma_i and f; two realisations related by g : V -> V' give the same operator. |
| `Theta` | data | Theta_I : O(G-hat \ (G-hat semidirect Q)^I / G-hat) -> Map(W^I, End(id_C)), the factored assignment. |
| `Theta.presentation` | structure | The source of Theta_I is the invariant ring whose presentation LanglandsParameterStacks:LP2:excursion-presentation owns; this roadmap consumes it. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES0/excursion-relations-and-the-algebra-map` — the relations are stated for Theta, not for individual data
- `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center` — the algebra map is Theta assembled over all I
- `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition` — the idempotents that cut out the components are invariant functions

**Unit tests.**

- `independence_of_realisation` — Two triples with a map g as in the source give the same operator; a construction that depends on V is not this one.
- `double_quotient` — f is a function on the double quotient; a function on the plain product is not invariant and does not descend.
- `trivial_function` — The constant function 1 gives the identity endomorphism.
- `needs_both_directions` — The comparison needs g to carry alpha forward AND beta backward; assuming only one direction does not give S_D = S_{D'}.

**Acceptance.**

- Check that f is well defined on the double quotient and not merely on the product
- Check the comparison D against D' on a concrete pair of representations realising the same function
- Check that Theta_I is a map of sets before any algebra structure is claimed

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:Representation`, `mathlib:MvPolynomial`, `mathlib:CommRing`

**Sources.**

- *After Definition VIII.4.2, printed p. 291.* “We note that if we have two excursion data D = (I,V,alpha,beta,(gamma_i)) and D' = (I,V',alpha',beta',(gamma_i)) with same finite set I and elements gamma_i in W, and a map g : V -> V' taking alpha to alpha' and beta' to beta (by post- and pre-composition), then S_D = S_{D'}.”
  The independence statement, quoted verbatim. Read directly from the hash-verified
  PDF in this session.
- *After Definition VIII.4.2, printed p. 291.* “Now note that (V,alpha,beta) give rise to an element f = f(V,alpha,beta) in O(G-hat \ (G-hat semidirect Q)^I / G-hat), the quotient under diagonal left and right multiplication. Indeed, given any g_i in G-hat semidirect Q, one can form the composite 1 -> V -> V -> 1, giving an element of the base ring; as alpha and beta are equivariant for the diagonal G-hat-action, this indeed gives an element f.”
  The construction of the invariant function, quoted verbatim.

### FS VIII.4: reindexing, multiplication and unit insertion for the excursion operators

`ExcursionOperatorsAndSpectralAction:ES0/excursion-relations-and-the-algebra-map` — *theorem* · planet **The excursion relations**

**Statement.**

The maps Theta_I are compatible with REINDEXING: for a map g : I -> J of finite sets the
square relating Theta_I and Theta_J, induced by pullback along g, is CARTESIAN. They are
compatible with MULTIPLICATION: for f_1, f_2 in O(G-hat \ (G-hat semidirect Q)^I /
G-hat) with exterior product f_1 box f_2 in O(G-hat \ (G-hat semidirect Q)^{I disjoint
I} / G-hat) one has Theta_{I disjoint I}(f_1 box f_2)((gamma_i, gamma'_i)) =
Theta_I(f_1)((gamma_i)) Theta_I(f_2)((gamma'_i)), and pulling back along the fold map I
disjoint I -> I gives Theta_I(f_1 f_2) = Theta_I(f_1) Theta_I(f_2). Finally UNIT
INSERTION: for each n there is an identification of O(G-hat \ (G-hat semidirect
Q)^{{0,...,n}} / G-hat) tensored down over O(Q^{{0,...,n}}) with O((G-hat semidirect
Q)^n // G-hat) by pullback along (g_1,...,g_n) -> (1,g_1,...,g_n), translating
Theta_{{0,...,n}} into maps of Z_l-algebras Theta_n : O((G-hat semidirect Q)^n // G-hat)
-> Map(W^n, End(id_C)) over O(Q^n) -> Map(W^n, Lambda), compatible with pullback and
with the multiplication maps induced by maps g : {1,...,m} -> {1,...,n}.

**Hypotheses and warnings.**

- The reindexing square is CARTESIAN, which is stronger than commutativity and is what
  makes the colimit presentation work
- The multiplicativity argument is a version of 'convolution product = fusion product':
  the product of two functions is computed on a DISJOINT UNION of leg sets and then
  pulled back along the fold map. This is the geometric input and is
  HeckeStacksAndLocalShtukas' fusion
- Unit insertion is the identification (g_1,...,g_n) -> (1,g_1,...,g_n); it is what
  turns the I-indexed family into an algebra over the invariants of a power of the
  L-group
- The last compatibility - with the multiplication maps induced by g : {1,...,m} ->
  {1,...,n} - is quoted by Fargues-Scholze from V. Lafforgue's Lemma 10.1 and equation
  (10.5) and the resulting Proposition 10.8(iii) and Definition-Proposition 11.3(d).
  THOSE REFERENCES WERE NOT READ HERE
- The roadmap asks in addition for twisted conjugation for nonsplit G; in the source
  that is carried by the semidirect factor Q throughout, and is not a separate statement

**Proof outline.**

1. Reindexing: pull back along g : I -> J and check that the resulting square of function
   rings and of maps out of W^I and W^J is cartesian.
2. Multiplication: form the exterior product on I disjoint I, evaluate on a pair of
   tuples, and pull back along the fold map.
3. Unit insertion: identify the function ring on {0,...,n} legs with the invariants on n
   legs by inserting 1 in the zeroth slot, obtaining the algebra maps Theta_n.
4. Compatibility with multiplication maps: quote V. Lafforgue's relations.

**Acceptance.**

- Check that the reindexing square is cartesian and not merely commutative
- Check multiplicativity on a pair of explicit functions on one leg
- Check unit insertion by comparing Theta_1 with Theta_{{0,1}}
- Check that the Lafforgue relations are an external input, not proved in this source

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/invariant-function-attached-to-a-datum`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `LanglandsParameterStacks:LP2:excursion-presentation`, `HeckeStacksAndLocalShtukas:HS4`, `HeckeStacksAndLocalShtukas:HS1`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:CommRing`, `mathlib:MvPolynomial`, `mathlib:RingHom`

**Sources.**

- *Proof of Theorem VIII.4.1, printed p. 292.* “... Map(W^I, End(id_C)) ... O(G-hat \ (G-hat semidirect Q)^J / G-hat) --Theta_J--> Map(W^J, End(id_C)), induced by pullback along g, is cartesian.”
  The reindexing square, with the word 'cartesian'. Read directly from the hash-
  verified PDF in this session; the surrounding display is damaged in the text
  extraction and only the assertion of cartesianness was recovered cleanly.
- *Proof of Theorem VIII.4.1, printed p. 292.* “We want to check that Theta_I is a map of algebras. For this, we use a version of 'convolution product = fusion product' in this situation. Namely, given f_1, f_2 in O(G-hat \ (G-hat semidirect Q)^I / G-hat), we can build their exterior product f_1 box f_2 in O(G-hat \ (G-hat semidirect Q)^{I disjoint I} / G-hat). Then one easily checks Theta_{I disjoint I}(f_1 box ...”
  Multiplicativity through fusion, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.
- *Proof of Theorem VIII.4.1, printed p. 292.* “For any n >= 0, we can identify O(G-hat \ (G-hat semidirect Q)^{{0,...,n}} / G-hat) tensor_{O(Q^{{0,...,n}})} O(Q^{{1,...,n}}) = O((G-hat semidirect Q)^n // G-hat) via pullback under (g_1,...,g_n) -> (1,g_1,...,g_n). This translates Theta_{{0,...,n}} into maps of Z_l-algebras Theta_n : O((G-hat semidirect Q)^n // G-hat) -> Map(W^n, End(id_C)) over O(Q^n) -> Map(W^n, Lambda).”
  Unit insertion, quoted verbatim.
- *Proof of Theorem VIII.4.1, printed p. 292.* “Arguing also as in [Laf18, Lemma 10.1, equation (10.5)] and the resulting [Laf18, Proposition 10.8(iii), Definition-Proposition 11.3(d)], one sees that the maps Theta_n are also compatible with the multiplication maps induced by such maps g, thus finishing the proof of Theorem VIII.4.1.”
  The external input. V. Lafforgue's paper was NOT read in this session, and this
  packet records that as a gap.

### FS VIII.4.1: the excursion algebra maps to the Bernstein centre

`ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center` — *theorem* · planet **Exc(W,G-hat) acts on the Bernstein centre**

**Statement.**

Given the categorical data - a Lambda-linear category C with a monoidal
Rep_{Z_l}(Q^I)-linear functor Rep_{Z_l}((G-hat semidirect Q)^I) -> End(C)^{BW^I} given
functorially in finite sets I, for a DISCRETE group W - there is a natural map of
algebras Exc(W, G-hat) = colim over (n, F_n -> W) of O(Z^1(F_n, G-hat))^{G-hat} ->
End(id_C) to the Bernstein centre of C, that is, the algebra of endomorphisms of the
identity of C. Fargues-Scholze attribute the result essentially to V. Lafforgue.

**Hypotheses and warnings.**

- Exc(W,G-hat) is the COLIMIT over pairs (n, F_n -> W) of a free group on n generators
  mapping to W, of the G-hat-invariant functions on the scheme of 1-cocycles; that
  presentation is LanglandsParameterStacks:LP2:excursion-presentation's content and is
  imported here
- W is DISCRETE; the passage to W_E is separate
- The target is the Bernstein centre of C in the categorical sense, End(id_C); the
  comparison with the classical Bernstein centre of a group is ES0:classical-center
- The map is an ALGEBRA map, which is the content of the relation node, not a formal
  consequence of the construction
- The theorem is essentially due to V. Lafforgue [Laf18], as the source says

**Proof outline.**

1. Construct the excursion operators from excursion data (Definition VIII.4.2).
2. Factor the assignment through the invariant function, giving Theta_I.
3. Prove the reindexing, multiplication and unit-insertion relations, so that the Theta_n
   assemble into an algebra map out of the colimit presentation of Exc(W,G-hat).

**Acceptance.**

- Check that the map is an algebra map and not merely a map of sets
- Check the colimit presentation on a free group of rank one, where Z^1(F_1,G-hat) is G-hat itself
- Check naturality in C by comparing two categories with compatible Hecke data

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/excursion-relations-and-the-algebra-map`, `ExcursionOperatorsAndSpectralAction:ES0/invariant-function-attached-to-a-datum`, `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `LanglandsParameterStacks:LP2:excursion-presentation`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:FreeGroup`, `mathlib:Representation`, `mathlib:CommRing`

**Sources.**

- *Theorem VIII.4.1, printed p. 291.* “Given the above categorical data, there is a natural map of algebras Exc(W, G-hat) = colim over (n, F_n -> W) of O(Z^1(F_n, G-hat))^{G-hat} -> End(id_C) to the Bernstein center of C (i.e., the algebra of endomorphisms of the identity of C).”
  The statement with the colimit presentation spelled out. Read directly from the
  hash-verified PDF in this session.
- *Before Theorem VIII.4.1, printed p. 291.* “The goal of this section is to prove the following theorem; this is essentially due to V. Lafforgue [Laf18].”
  The attribution, which the packet carries so that a reader knows the external
  dependence.
- *After Theorem VIII.4.1, printed p. 291.* “To prove Theorem VIII.4.1, we construct explicit 'excursion operators'. These are associated to the following data.”
  That the proof is by explicit construction, which is the preceding three nodes.

### How the discrete theory reaches W_E: discretisation of the tame inertia after a wild cutoff

`ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group` — *comparison*

**Statement.**

The abstract excursion formalism of FS VIII.4 is stated for a DISCRETE group W,
explicitly in order to avoid topological problems. It is applied to the Weil group in
two steps. First, for an open subgroup P of the wild inertia of W_E one restricts to the
full subcategory D^P_lis(Bun_G,Lambda)^omega of compact objects on which P^I acts
trivially on every T_V, which is possible for every compact object by Proposition
IX.5.1. Second, one PICKS A DISCRETE DENSE SUBGROUP W inside W_E/P, 'by discretizing the
tame inertia, as before'. Theorem VIII.4.1 then gives the canonical map Exc(W, G-hat) ->
Z(D^P_lis(Bun_G,Lambda)^omega). This is how the roadmap's requirement of continuity in
the Weil variables is met in the source: not by a continuity theorem about a map out of
W_E, but by a cutoff followed by a discretisation.

**Hypotheses and warnings.**

- A discrete dense subgroup W inside W_E/P is CHOSEN; the source says the choice is by
  discretising the tame inertia. Independence of the choice is not proved here and is
  not claimed
- The cutoff by P depends on the compact object, by Proposition IX.5.1, so the
  discretisation is available only after restricting to D^P_lis(Bun_G,Lambda)^omega
- The condensed structure is still what makes the cutoff argument work: the proof of
  IX.5.1 uses that a relatively discrete condensed animated Z_l-algebra receiving
  Z_l[W_E] factors over Z_l[W_E/P] for some P
- Chapter X repeats the same two steps: 'the proof of Proposition IX.5.1 shows that we
  may replace W_E by W_E/P in the statement of Theorem X.0.1. Choosing moreover a
  discretization W inside W_E/P, we reduce to the following variant'

**Proof outline.**

1. Restrict to D^P_lis(Bun_G,Lambda)^omega for an open subgroup P of the wild inertia,
   using Proposition IX.5.1.
2. Choose a discrete dense subgroup W inside W_E/P by discretising the tame inertia.
3. Apply Theorem VIII.4.1 over W and take the union over P.

**Acceptance.**

- Check that the discrete theory is not applied directly to W_E
- Check that the cutoff precedes the discretisation and that its existence is Proposition IX.5.1
- Check that the same two steps are what reduce Theorem X.0.1 to Theorem X.0.2

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `HeckeStacksAndLocalShtukas:HS1`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS4`, `LanglandsParameterStacks:LP0`, `mathlib:Condensed`, `mathlib:ProfiniteGrp`, `mathlib:Subgroup`

**Sources.**

- *Before Theorem VIII.4.1, printed pp. 290-291.* “In order to avoid topological problems, we work in the setting of the discrete subgroup W inside W_E/P; in fact, we can take here any discrete group W.”
  Why the abstract theory is discrete. Read directly from the hash-verified PDF in
  this session.
- *Proof of Proposition IX.5.1, printed p. 328.* “Pick W inside W_E/P a discrete dense subgroup, by discretizing the tame inertia, as before. Then Theorem VIII.4.1 gives a canonical map of algebras Exc(W, G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega).”
  The discretisation step and the resulting map, quoted verbatim.
- *Before Theorem X.0.2, printed p. 340.* “Before starting the proof, we note that the proof of Proposition IX.5.1 shows that we may replace W_E by W_E/P in the statement of Theorem X.0.1. Choosing moreover a discretization W inside W_E/P, we reduce to the following variant.”
  The same two steps used again in Chapter X.

**What remains in this layer.**

- V. Lafforgue's [Laf18] Lemma 10.1 and equation (10.5), and the resulting Proposition
  10.8(iii) and Definition-Proposition 11.3(d), on which the last compatibility in the
  proof of Theorem VIII.4.1 rests, were NOT read. The packet records the dependence and
  does not reproduce the argument.
- Proposition VIII.3.8, which the proof of IX.4.1 invokes to produce the parameter from
  the excursion data, was not read; it belongs to LanglandsParameterStacks and is
  consumed by ES5, not here.
- The display defining Theta_I and the cartesian square on printed p. 292 is damaged in
  the text extraction used here; only the assertion of cartesianness was recovered
  cleanly, and a reviewer should confirm the diagram against the printed page.
- Corollary VIII.4.3, the abstract Schur-irreducibility statement, was read but is NOT
  planned here: the roadmap assigns FS Definition/Proposition IX.4.1 and its abstract
  form to ES5. This packet deliberately leaves that node to ES5 rather than duplicating
  it.
- The roadmap also asks this layer to compare the degree-zero centre with the ordinary
  smooth-representation Bernstein centre 'in the exact domain where used'. The map
  itself is planned in ES0:classical-center; what is not established anywhere read is a
  description of its image.

## ES0:classical-center — A coefficient-qualified comparison return

*Coverage: **partial**. 2 nodes.*

The map Z^geom(G,Lambda) -> Z(G(E),Lambda) induced by the fully faithful embedding of
the open stratum's category, presented by Fargues-Scholze as a generalisation of Helm-
Moss; and the description of the classical Bernstein centre as the limit over levels of
the centres of the Hecke algebras, with its l-adic separatedness.

### FS IX.5: the geometric centre maps to the classical Bernstein centre of G(E)

`ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center` — *theorem* · planet **The geometric centre maps to the classical one**

**Statement.**

By the FULLY FAITHFUL functor D(G(E),Lambda) -> D_lis(Bun_G,Lambda) there is a map of
algebras Z^geom(G,Lambda) -> Z(G(E),Lambda) to the usual Bernstein centre of smooth
G(E)-representations on Lambda-modules. Fargues-Scholze present the resulting theory as
a GENERALISATION OF RESULTS OF HELM-MOSS [HM18]; in the GL_n case the induced map on
spectral centres is shown in IX.7.3 to agree with the usual one and to refine to the
integral Bernstein centre, recovering Helm-Moss.

**Hypotheses and warnings.**

- The fully faithful embedding D(G(E),Lambda) = D_lis(Bun^1_G,Lambda) ->
  D_lis(Bun_G,Lambda) is VStackSheavesAndLisseCategories:VS4's theorem and is imported,
  not proved here
- The source of the map is the GEOMETRIC centre Z^geom(G,Lambda) = End(id) of
  D_lis(Bun_G,Lambda); the composite from the SPECTRAL centre, which Fargues-Scholze
  call Psi_G, is Definition IX.7.1 and belongs to ES7:parabolic, not to this layer
- The target is the classical Bernstein centre of a locally profinite group, which
  SmoothRepresentationsOfLocalGroups owns
- The comparison is stated for arbitrary Lambda over Z_l[sqrt q]; the characteristic-
  zero block dictionary this stage is named for is the separate statement of the next
  node

**Proof outline.**

1. Take the fully faithful embedding of the open stratum's category.
2. An endomorphism of the identity of D_lis(Bun_G,Lambda) restricts to one of the
   identity of the essential image, hence gives an element of the classical Bernstein
   centre.
3. Check that the assignment is a map of algebras.

**Acceptance.**

- Check that full faithfulness is what makes the restriction well defined
- Check that the source is the geometric and not the spectral centre
- Check the GL_n case, where the resulting map is identified with the classical one in IX.7.3

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation`, `tauceti:TauCeti.IsSmoothDiscrete`, `tauceti:TauCeti.SmoothDiscreteTopRep`

**Sources.**

- *Before Theorem IX.5.2, printed p. 329.* “Using excursion operators, we get the following result on the 'Bernstein center'. This is a generalization of results of Helm-Moss, [HM18], noting that by the fully faithful functor D(G(E),Lambda) -> D_lis(Bun_G,Lambda), there is a map of algebras Z^geom(G,Lambda) -> Z(G(E),Lambda) to the usual Bernstein center of smooth G(E)-representations on Lambda-modules.”
  The map and its attribution, quoted verbatim. Read directly from the hash-verified
  PDF in this session.
- *Proof of Theorem IX.7.4, printed p. 338.* “In particular, it follows that the map Z^spec(GL_n, Q-bar_l) -> Z(GL_n(E), Q-bar_l) to the Bernstein center agrees with the usual map. But this refines to a map Z^spec(GL_n, Z_l[sqrt q]) -> Z(GL_n(E), Z_l[sqrt q]) to the integral Bernstein center, recovering a result of Helm-Moss [HM18].”
  What the comparison delivers in the one case where it is identified with the
  classical map. The GL_n theorem itself is ES7:GLn-comparison's, not this layer's.

### FS IX.7.2: the classical Bernstein centre is the limit of the centres of the Hecke algebras, and is l-adically separated

`ExcursionOperatorsAndSpectralAction:ES0:classical-center/the-classical-center-as-a-limit-over-levels` — *theorem* · planet **The classical centre as a limit over levels**

**Statement.**

For a locally profinite group G_b(E) the centre of the derived category of smooth
representations is the limit over compact open subgroups of the centres of the level
Hecke algebras, Z(D(G_b(E),Lambda)) = lim over K inside G_b(E) of Z(Lambda[K \ G_b(E) /
K]). When Lambda is killed by a power of l this ring is l-ADICALLY SEPARATED, and
Fargues-Scholze use exactly that to reduce statements about the centres to torsion
coefficients and 'to avoid the subtleties of D_lis in place of D_et'. Over complex
coefficients this limit is the classical Bernstein centre whose block description
SmoothRepresentationsOfLocalGroups:SR.3 owns, and the coefficient dictionary between the
two descriptions is what this layer must supply.

**Hypotheses and warnings.**

- The identification is of the centre of the DERIVED category with the limit of the
  centres of the Hecke algebras; over a field of characteristic zero this is Bernstein's
  description, which is NOT proved in Fargues-Scholze and must come from
  SmoothRepresentationsOfLocalGroups:SR.3
- l-adic separatedness is asserted for Lambda killed by a power of l and is what
  licenses the reduction to torsion coefficients
- The reduction is used in the source to avoid the difference between D_lis and D_et; a
  formalisation that does not carry the coefficient hypothesis loses that licence
- This layer is a RETURN: the roadmap says neither the ES0 operator construction nor the
  characteristic-l parameter theorem of ES5 imports it

**Proof outline.**

1. Identify the centre of the derived category of smooth representations with the limit
   over levels of the centres of the Hecke algebras.
2. Observe that for Lambda killed by a power of l the limit is l-adically separated.
3. Over complex coefficients, match the limit with the block description of the classical
   Bernstein centre imported from SR.3.

**Acceptance.**

- Check that the limit is over compact open subgroups and that the transition maps are the idempotent truncations
- Check l-adic separatedness for Lambda killed by a power of l
- Check that the complex block description is imported and not reproved
- Check that nothing in ES0 or ES5 depends on this node

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation`, `mathlib:MonoidAlgebra`, `mathlib:Module.End`, `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- *Proof of Theorem IX.7.2, printed p. 335.* “... we can assume that Lambda is killed by a power of l ..., as the result for Lambda = Z_l[sqrt q] implies it in general, and the right-hand side Z(D(G_b(E),Lambda)) = lim over K inside G_b(E) of Z(Lambda[K \ G_b(E) / K]) is l-adically separated in that case. This means we can avoid the subtleties of D_lis in place of D_et.”
  The identification and the separatedness, quoted verbatim. Read directly from the
  hash-verified PDF in this session. The theorem whose proof this is belongs to
  ES7:parabolic; only this description of the classical centre is taken here.
- *Section IX.6.4, printed p. 333.* “Z(T(E),Lambda) = lim over K inside T(E) of Lambda[T(E)/K], where K runs over open subgroups of T(E).”
  The same description in the torus case, where it is explicit. The torus statements
  themselves are IX.6.4-IX.6.5 and belong to ES6:functoriality.

**What remains in this layer.**

- The complex block description of the classical Bernstein centre is Bernstein's
  theorem. It is NOT proved in anything read here, and the roadmap routes it to
  SmoothRepresentationsOfLocalGroups:SR.3. Until SR.3 supplies it, the characteristic-
  zero dictionary this layer is named for has an unproved half.
- Helm-Moss [HM18] was not read. Fargues-Scholze describe their result as a
  generalisation of it and recover it for GL_n in IX.7.4; neither statement was checked
  against the original.
- Definition IX.7.1's maps Psi_G and Psi^b_G, which compose this layer's map with the
  spectral-to-geometric one, belong to ES7:parabolic. They were read in this session and
  are recorded in the handoff for that job, but are not planned here.
- No statement about the image or the kernel of the map to the classical centre was
  located in anything read.

## ES1 — Spectral center and finite ramification

*Coverage: **partial**. 1 node.*

The spectral centre as functions on the parameter stack, the geometric centre as End(id)
of D_lis(Bun_G,Lambda), the Hecke-compatible part, and the decomposition of both along
the connected components of a stack that is explicitly not quasicompact.

### The spectral centre, the geometric centre and the Hecke-compatible part

`ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers` — *definition* · planet **The spectral and geometric centres**

**Statement.**

For a Z_l[sqrt q]-algebra Lambda the SPECTRAL CENTRE Z^spec(G,Lambda) is the ring of
global functions on the stack of L-parameters, O(Z^1(W_E,G-hat)_Lambda / G-hat),
presented through the excursion algebra Exc(W,G-hat) = colim over (n, F_n -> W) of
O(Z^1(F_n,G-hat))^{G-hat}. The GEOMETRIC CENTRE Z^geom(G,Lambda) is the Bernstein centre
of D_lis(Bun_G,Lambda), that is End(id) of that category. The HECKE-COMPATIBLE PART
Z^geom_Hecke(G,Lambda) inside Z^geom(G,Lambda) consists of those central elements z for
which, for every finite set I, every V in Rep(G-hat^I) and every A, the actions of z on
A and on T_V(A) agree. Both centres decompose according to the connected components of
Z^1(W_E,G-hat), and Theorem IX.5.2 says the spectral-to-geometric map respects that
decomposition and factors over the Hecke-compatible part.

**Hypotheses and warnings.**

- The spectral centre is functions on the parameter STACK, and its excursion
  presentation is LanglandsParameterStacks' content; this node fixes notation and the
  component decomposition, and plans neither
- The geometric centre is the CATEGORICAL Bernstein centre End(id) of
  D_lis(Bun_G,Lambda), not the classical Bernstein centre of a group
- The Hecke-compatible part is a subring cut out by a commutation condition; that the
  spectral map lands in it is a theorem (IX.5.2) and not a definition
- Lambda is a Z_l[sqrt q]-algebra with l different from p; the square root of q is what
  trivialises the cyclotomic twist in the Satake normalisation
- Z^1(W_E,G-hat) is NOT quasicompact: it is an infinite disjoint union, written as the
  increasing union of the open and closed quasicompact Z^1(W_E/P,G-hat). Every statement
  about its functions must respect that

**Proof outline.**

1. Import the excursion presentation of the spectral centre from
   LanglandsParameterStacks.
2. Define the geometric centre as End(id) of D_lis(Bun_G,Lambda) and the Hecke-compatible
   part by the commutation condition.
3. Record the decomposition of both according to the connected components of the
   parameter stack.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Zspec` | data | Z^spec(G,Lambda) = O(Z^1(W_E,G-hat)_Lambda / G-hat), presented through Exc(W,G-hat). |
| `Zgeom` | data | Z^geom(G,Lambda) = End(id) of D_lis(Bun_G,Lambda), the CATEGORICAL Bernstein centre. |
| `ZgeomHecke` | data | The subring of elements whose action commutes with every Hecke operator. |
| `ZgeomHecke.isSubring` | structure | It is a subring of Z^geom; that the spectral map lands in it is Theorem IX.5.2 and not part of this definition. |
| `componentDecomposition` | structure | Both centres decompose over pi_0 of Z^1(W_E,G-hat), which is infinite. |
| `coefficients` | structure | Lambda is a Z_l[sqrt q]-algebra with l different from p. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map` — the map between them is Theorem IX.5.2
- `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center` — the composite to the classical centre starts from Z^geom
- `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components` — the summands are indexed by connected components of the parameter stack

**Unit tests.**

- `geometric_is_categorical` — Z^geom is End(id) of a category, not Z(G(E)); the comparison is a separate theorem.
- `hecke_compatible_is_proper` — Z^geom_Hecke is in general a proper subring; the factorisation through it is content.
- `sqrt_q_needed` — Lambda must contain a square root of q; without it the cyclotomic twist is not trivialised.
- `not_quasicompact` — Z^1(W_E,G-hat) is an infinite disjoint union; a construction that assumes quasicompactness is wrong, and this is why compact support appears in ES2.

**Acceptance.**

- Check that the geometric centre is End(id) and not the classical Bernstein centre
- Check that the Hecke-compatible part is a subring and is proper in general
- Check the component decomposition on a torus, where the components are indexed by the characters of the level quotients
- Check that the parameter stack is not quasicompact

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/bernstein-center-of-a-category`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:integral-invariants`, `LanglandsParameterStacks:LP0`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS3`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:CommRing`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Before Proposition IX.5.1, printed p. 327.* “As before, there is the problem that the stack Z^1(W_E,G-hat)/G-hat of L-parameters is not quasicompact, but an infinite disjoint union. We can now actually decompose D_lis(Bun_G,Lambda) into a direct product according to the connected components of Z^1(W_E,G-hat).”
  The non-quasicompactness and the resulting decomposition, quoted verbatim. Read
  directly from the hash-verified PDF in this session.
- *Theorem IX.5.2, printed p. 329.* “There is a natural map Z^spec(G,Lambda) -> Z^geom(G,Lambda) compatible with the above decomposition into connected components. Moreover, for all finite sets I, all V in Rep(G-hat^I), and all A in D_lis(Bun_G,Lambda), the diagram commutes, so the map factors over Z^geom_Hecke(G,Lambda) inside Z^geom(G,Lambda).”
  The statement in which all three objects appear and which fixes their relation.
- *Theorem VIII.4.1, printed p. 291.* “Exc(W, G-hat) = colim over (n, F_n -> W) of O(Z^1(F_n, G-hat))^{G-hat}”
  The excursion presentation of the spectral centre.

**What remains in this layer.**

- The excursion presentation of the spectral centre and the universal homeomorphism onto
  the invariant functions are LanglandsParameterStacks:LP2:excursion-presentation's and
  LP0's; they are cited and not proved.
- This layer has no external suppliers in the atlas at all - its only recorded inputs
  are its own two sub-layers - although its content quotes LanglandsParameterStacks and
  VStackSheavesAndLisseCategories throughout. That is recorded as a structural finding.
- Nothing read describes pi_0 of Z^1(W_E,G-hat) explicitly for a general group, so the
  index set of the decomposition is named and not computed.

## ES1:finite-ramification — Objectwise cutoffs and components

*Coverage: **partial**. 2 nodes.*

Proposition IX.5.1 with its proof in full - the uniform open wild-inertia subgroup for
each compact object - and the component decomposition it produces: a direct sum on
compact objects, a direct product on the Ind-categories, with the source's own warning
about the difference between the two.

### FS IX.5.1: one open wild-inertia subgroup works for all legs and all representations

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup` — *theorem* · planet **The uniform wild-inertia subgroup**

**Statement.**

Let A in D_lis(Bun_G,Lambda)^omega be any COMPACT object. Then there is an OPEN SUBGROUP
P of W_E, contained in the WILD INERTIA subgroup, such that for all finite sets I and
all V in Rep((G-hat semidirect Q)^I), the object T_V(A) in D_lis(Bun_G,Lambda)^{B W_E^I}
lies in the full infinity-subcategory D_lis(Bun_G,Lambda)^{B(W_E/P)^I} inside
D_lis(Bun_G,Lambda)^{B W_E^I}.

**Hypotheses and warnings.**

- P depends on the compact object A but is UNIFORM in I and in V; that uniformity is the
  content, and it is what the roadmap warns must not be asserted for noncompact objects
- P is an open subgroup OF THE WILD INERTIA, not merely of W_E
- Full faithfulness of D_lis(Bun_G,Lambda)^{B(W_E/P)^I} -> D_lis(Bun_G,Lambda)^{B W_E^I}
  follows from full faithfulness of f^* for f : Bun_G x [*/W_E^I] -> Bun_G x
  [*/(W_E/P)^I], hence from f_sharp Lambda = Lambda with the projection formula, which
  after pullback to a v-cover Spa C amounts to the VANISHING OF THE Lambda-HOMOLOGY OF
  P^I - and that uses P pro-p and l different from p
- The reduction to a single V uses that if P^I acts trivially on T_V(A) and on T_W(A)
  then it acts trivially on T_{V tensor W}(A) = T_V(T_W(A)), by looking at the W_E^{I
  disjoint I}-action and restricting to the diagonal; one then takes V a tensor
  generator and reduces to I a point
- The existence of P then comes from the CONDENSED structure: for any relatively
  discrete condensed animated Z_l-algebra R with a map Z_l[W_E] -> R, the map factors
  over Z_l[W_E/P] for some P. The argument restricts to the inertia I_E, uses
  compactness to land in a finitely generated Z_l-submodule, and then that Aut_{Z_l}(R)
  is profinite and locally pro-l
- This layer is the canonical owner of the statement: the HeckeStacksAndLocalShtukas
  packet filed it here as a request rather than planning it

**Proof outline.**

1. Show that the equivariant subcategory for W_E/P is full inside the one for W_E, via
   f_sharp Lambda = Lambda and the projection formula, which reduces to the vanishing of
   the Lambda-homology of the pro-p group P^I.
2. Show that the set of V for which P^I acts trivially on T_V(A) is closed under tensor
   product, using T_{V tensor W} = T_V o T_W and the diagonal restriction of the W_E^{I
   disjoint I}-action.
3. Reduce to exterior tensor products and then to I a point, and take V a tensor
   generator of Rep_{Z_l}(G-hat semidirect Q).
4. Produce P from the condensed structure: (D_lis(Bun_G,Lambda)^omega)^{BW_E} is the
   union over P of the (W_E/P)-equivariant subcategories, because a relatively discrete
   condensed animated Z_l-algebra receiving Z_l[W_E] receives it through some Z_l[W_E/P].

**Acceptance.**

- Check that P depends on A but not on I or V
- Check that the homology vanishing needs P pro-p and l different from p
- Check the tensor-closure step, which is what allows the reduction to a generator
- Check that the statement is for COMPACT objects only

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS4`, `LanglandsParameterStacks:LP0`, `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:ProfiniteGrp`, `mathlib:CategoryTheory.Adjunction`, `mathlib:Module.Projective`

**Sources.**

- *Proposition IX.5.1, printed p. 327.* “Let A in D_lis(Bun_G,Lambda)^omega be any compact object. Then there is an open subgroup P inside W_E of the wild inertia subgroup such that for all finite sets I and all V in Rep((G-hat semidirect Q)^I), the object T_V(A) in D_lis(Bun_G,Lambda)^{B W_E^I} lies in the full infinity-subcategory D_lis(Bun_G,Lambda)^{B(W_E/P)^I} inside D_lis(Bun_G,Lambda)^{B W_E^I}.”
  The statement with the uniformity in I and V, quoted verbatim. Read directly from
  the hash-verified PDF in this session. This node is the canonical owner: the
  HeckeStacksAndLocalShtukas packet of this session filed it here as a request rather
  than planning it.
- *Proof of Proposition IX.5.1, printed pp. 327-328.* “First, note that indeed the functor D_lis(Bun_G,Lambda)^{B(W_E/P)^I} -> D_lis(Bun_G,Lambda)^{B W_E^I} is fully faithful; this follows from fully faithfulness of the pullback functor f^*, which in turn follows from f_sharp Lambda = Lambda (and the projection formula for f_sharp), which can be deduced via base change from the case of [*/W_E^I] -> [*/(W_E/P)^I], or after pullback ...”
  The full-faithfulness step, which is where l different from p enters. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.
- *Proof of Proposition IX.5.1, printed p. 328.* “Now note that if P^I acts trivially on T_V(A) and on T_W(A) for two V,W, then it also acts trivially on T_{V tensor W}(A) = T_V(T_W(A)) = T_W(T_V(A)). Using reductions to exterior tensor products, we can also reduce to I a point. Then if V is a tensor generator, it follows that it suffices that P acts trivially on T_V(A).”
  The tensor-closure and generator reduction.
- *Proof of Proposition IX.5.1, printed p. 328.* “as for any relatively discrete condensed animated Z_l-algebra R with a map Z_l[W_E] -> R, the map factors over Z_l[W_E/P] for some P. Indeed, we may restrict to Z_l[I_E], and then (as I_E is compact) the image is contained in some finitely generated Z_l-submodule R_0 inside R, so we can assume that R is finite over Z_l; but then Aut_{Z_l}(R) is profinite, and locally pro-l.”
  Where P comes from: the condensed structure of the endomorphisms, not a finiteness
  assumption on the parameter stack.

### FS IX.5: the component decomposition of the compact objects, and the product on Ind-categories

`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition` — *theorem* · planet **The component decomposition**

**Statement.**

Fix an open subgroup P of the wild inertia of W_E and let D^P_lis(Bun_G,Lambda)^omega
inside D_lis(Bun_G,Lambda)^omega be the full subcategory of all A such that P^I acts
trivially on T_V(A) for all V in Rep((G-hat semidirect Q)^I). Picking a discrete dense W
inside W_E/P, Theorem VIII.4.1 gives Exc(W,G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega).
Since Exc(W,G-hat) -> O(Z^1(W_E/P,G-hat)_Lambda)^{G-hat} is a UNIVERSAL HOMEOMORPHISM
there are idempotents corresponding to the connected components of
Z^1(W_E/P,G-hat)_Lambda, and their action gives D^P_lis(Bun_G,Lambda)^omega = direct sum
over c in pi_0 Z^1(W_E/P,G-hat)_Lambda of D^c_lis(Bun_G,Lambda)^omega. Taking the union
over all P gives D_lis(Bun_G,Lambda)^omega = direct sum over c in pi_0
Z^1(W_E,G-hat)_Lambda of D^c_lis(Bun_G,Lambda)^omega, and on Ind-categories a DIRECT
PRODUCT D_lis(Bun_G,Lambda) = product over c of D^c_lis(Bun_G,Lambda). Any Schur-
irreducible object necessarily lies in ONE of these factors, and its L-parameter lies in
that connected component.

**Hypotheses and warnings.**

- That Exc(W,G-hat) -> O(Z^1(W_E/P,G-hat)_Lambda)^{G-hat} is a UNIVERSAL HOMEOMORPHISM
  is imported from LanglandsParameterStacks; it is what supplies the idempotents, since
  a universal homeomorphism induces a bijection on connected components
- The decomposition is a DIRECT SUM on compact objects and a DIRECT PRODUCT on the Ind-
  categories. The roadmap is explicit that one must not assert a single finite-wild
  cutoff for every noncompact object
- The union over P is an increasing union, matching the increasing union of quasicompact
  opens in the parameter stack
- The statement that a Schur-irreducible object lies in a single factor is what lets ES5
  speak of the component of its parameter

**Proof outline.**

1. For fixed P, transport the idempotents of the invariant ring through the universal
   homeomorphism and through Theorem VIII.4.1's algebra map.
2. Split D^P_lis(Bun_G,Lambda)^omega by those idempotents.
3. Take the union over P, using Proposition IX.5.1 to see that every compact object lies
   in some D^P_lis.
4. Pass to Ind-categories, where the direct sum becomes a direct product.

**Acceptance.**

- Check that the idempotents come from connected components and that a universal homeomorphism suffices for this
- Check that the decomposition is a sum on compacts and a product on Ind-categories
- Check that a Schur-irreducible object lies in exactly one factor
- Check that no claim is made about a single cutoff for noncompact objects

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP2:excursion-presentation`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS4`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CommRing`

**Sources.**

- *Proof of Proposition IX.5.1, printed p. 328.* “Fix some open subgroup P of the wild inertia subgroup of W_E, and let D^P_lis(Bun_G,Lambda)^omega inside D_lis(Bun_G,Lambda)^omega be the full infinity-subcategory of all A such that P^I acts trivially on T_V(A) for all V in Rep((G-hat semidirect Q)^I).”
  The definition of the finite-wild piece, quoted verbatim. Read directly from the
  hash-verified PDF in this session.
- *Proof of Proposition IX.5.1, printed p. 328.* “As Exc(W,G-hat) -> O(Z^1(W_E/P,G-hat)_Lambda)^{G-hat} is a universal homeomorphism, there are in particular idempotents corresponding to the connected components of Z^1(W_E/P,G-hat)_Lambda. Their action on D^P_lis(Bun_G,Lambda)^omega then induces a direct sum decomposition.”
  Where the idempotents come from, quoted verbatim.
- *Proof of Proposition IX.5.1, printed p. 328.* “Taking now a union over all P, we get a direct sum decomposition D_lis(Bun_G,Lambda)^omega = sum over c in pi_0 Z^1(W_E,G-hat)_Lambda of D^c_lis(Bun_G,Lambda)^omega. On the level of Ind-categories, this gives a direct product D_lis(Bun_G,Lambda) = product over c of D^c_lis(Bun_G,Lambda).”
  The sum and the product, quoted verbatim - the distinction the roadmap insists on.
- *After the decomposition, printed p. 329.* “Note in particular that any Schur-irreducible object A in D_lis(Bun_G,Lambda) necessarily lies in one of these factors, given by some connected component c of Z^1(W_E,G-hat)_Lambda; and then the L-parameter phi_A of A necessarily lies in this connected component.”
  The consequence ES5 and ES4 both use.

**What remains in this layer.**

- The vanishing of the Lambda-homology of P^I, on which the full-faithfulness step
  rests, is quoted rather than proved; it needs P pro-p and l different from p.
- That Exc(W,G-hat) -> O(Z^1(W_E/P,G-hat)_Lambda)^{G-hat} is a universal homeomorphism
  is imported from LanglandsParameterStacks and was not read in this session.
- The roadmap asks for the component decomposition of the Ind-category as a product AND
  a warning that noncompact objects need not have a single finite-wild cutoff. The
  source gives the product; the warning is the roadmap's own and no counterexample was
  located.

## ES1:spectral-center — The conditional invariant-coordinate map

*Coverage: **partial**. 2 nodes.*

Theorem IX.5.2 - the natural map from the spectral to the geometric centre when the
order of pi_0 Z(G) is invertible, compatible with components and factoring through the
Hecke-compatible part - together with the excursion-algebra fallback that survives when
the hypothesis is dropped.

### FS IX.5.2: the spectral centre acts, compatibly with components and with the Hecke operators

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map` — *theorem* · planet **The spectral centre acts**

**Statement.**

Assume that the order of pi_0 Z(G) is INVERTIBLE IN Lambda. There is a natural map
Z^spec(G,Lambda) -> Z^geom(G,Lambda) compatible with the decomposition into connected
components. Moreover, for all finite sets I, all V in Rep(G-hat^I) and all A in
D_lis(Bun_G,Lambda), the triangle relating the actions of Z^spec(G,Lambda) on End(A) and
on End(T_V(A)) commutes, so the map factors over Z^geom_Hecke(G,Lambda) inside
Z^geom(G,Lambda).

**Hypotheses and warnings.**

- The hypothesis that the order of pi_0 Z(G) be invertible in Lambda is essential; the
  roadmap says the spectral-centre tests must retain it, and the variant without it is
  the next node
- The map is deduced from the component decomposition, from the map Exc(W,G-hat) ->
  Z(D^P_lis(Bun_G,Lambda)^omega) of the previous layer, and from THEOREM VIII.3.6, which
  is the modular-representation-theoretic input of Chapter VIII. Theorem VIII.3.6 is
  proved in FS VIII.5, in the refined form of Theorem VIII.5.1, and belongs to
  LanglandsParameterStacks
- Commutation with the Hecke operators follows from the construction of the excursion
  operators and from the commutation of the Hecke operators among themselves
- Nothing here asserts that the map is injective or surjective; only that it exists,
  respects components and is Hecke-compatible

**Proof outline.**

1. Assemble the component decomposition of the previous layer.
2. Use the map Exc(W,G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega) on each finite-wild piece
   together with Theorem VIII.3.6, which identifies the colimit of invariant rings with
   the functions on the parameter stack.
3. Deduce commutation with the Hecke operators from the construction of the excursion
   operators.

**Acceptance.**

- Check that the invertibility hypothesis is used and locate where
- Check the commutation square on a compactly induced object
- Check that the map factors over the Hecke-compatible part and that no surjectivity is claimed
- Check that Theorem VIII.3.6 is an imported input

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES0/excursion-algebra-to-bernstein-center`, `LanglandsParameterStacks:LP2:integral-invariants`, `LanglandsParameterStacks:LP3`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:CategoryTheory.Functor.Monoidal`

**Sources.**

- *Theorem IX.5.2, printed p. 329.* “Assume that the order of pi_0 Z(G) is invertible in Lambda. There is a natural map Z^spec(G,Lambda) -> Z^geom(G,Lambda) compatible with the above decomposition into connected components. Moreover, for all finite sets I, all V in Rep(G-hat^I), and all A in D_lis(Bun_G,Lambda), the diagram commutes, so the map factors over Z^geom_Hecke(G,Lambda) inside Z^geom(G,Lambda).”
  The statement with the coefficient hypothesis, quoted verbatim. Read directly from
  the hash-verified PDF in this session.
- *Proof of Theorem IX.5.2, printed p. 329.* “This follows from the decomposition into connected components, the map Exc(W,G-hat) -> Z(D^P_lis(Bun_G,Lambda)^omega) above, and Theorem VIII.3.6. The statement about commutation with Hecke operators follows from the construction of excursion operators and the commutation of Hecke operators.”
  The whole proof: three lines, naming Theorem VIII.3.6, which is Chapter VIII's
  modular-representation input and is not this roadmap's.
- *Theorem VIII.5.1, printed p. 293.* “Assume that l does not divide the order of pi_1(G-hat)_tors. Then the map colim over (n, F_n -> W) of O(Z^1(F_n,G-hat)) -> O(Z^1(W,G-hat)) is an isomorphism in the presentable stable infinity-category IndPerf(*/G-hat). Moreover, Perf(Z^1(W,G-hat)/G-hat) is generated under cones and retracts by Perf(*/G-hat), and IndPerf(Z^1(W,G-hat)/G-hat) identifies with the modules over ...”
  The refinement of Theorem VIII.3.6 proved in FS VIII.5, quoted because the proof of
  IX.5.2 rests on it and because ES3 rests on it again. It belongs to
  LanglandsParameterStacks:LP3 and is not planned here. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.

### Without the invertibility hypothesis the excursion-algebra map survives

`ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition` — *comparison*

**Statement.**

Every result of this circle admits a variant in which the spectral Bernstein centre
Z^spec(G,Lambda) is replaced by an ALGEBRA OF EXCURSION OPERATORS when the hypothesis
that the order of pi_0 Z(G) be invertible in Lambda is omitted; Fargues-Scholze say so
in as many words at the head of IX.6, and use the same replacement inside the proof of
Theorem IX.7.2 when l divides the order of pi_0 Z(G). In particular the map Exc(W,G-hat)
-> Z(D^P_lis(Bun_G,Lambda)^omega) of ES1:finite-ramification exists with no hypothesis
on pi_0 Z(G), and the claims about L-parameters of Schur-irreducible objects work in any
characteristic different from p. This is the fallback the roadmap requires be kept
available for ES5.

**Hypotheses and warnings.**

- The fallback replaces the SOURCE of the map, not its target: one keeps Exc(W,G-hat)
  rather than O(Z^1(W_E,G-hat)_Lambda / G-hat)
- It is the identification of the two, not the existence of the map, that needs the
  coefficient hypothesis
- Fargues-Scholze state the variant as a general remark and do not write out any of the
  variants; a formalisation must therefore restate each one it uses
- The parameter statements for Schur-irreducible objects hold in every characteristic
  different from p; that is ES5's, and this node only records that they do not depend on
  the hypothesis

**Proof outline.**

1. Note that ES1:finite-ramification's map out of Exc(W,G-hat) is constructed with no
   hypothesis on pi_0 Z(G).
2. Restate each consequence with Exc(W,G-hat) in place of the spectral centre.
3. Record that it is the comparison of Exc(W,G-hat) with the functions on the parameter
   stack that carries the hypothesis.

**Acceptance.**

- Check that the construction of the map does not use the hypothesis
- Check that ES5's parameter assignment does not use it
- Check that the variant statements are not written out in the source and must be restated

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP2:integral-invariants`, `mathlib:CommRing`, `mathlib:FreeGroup`

**Sources.**

- *Head of Section IX.6, printed p. 330.* “Throughout, we assume for simplicity that the order of pi_0 Z(G) is invertible in Lambda. All results admit an obvious variant replacing the spectral Bernstein center by an excursion algebra when this assumption is omitted, and in particular the claims about L-parameters of Schur-irreducible objects work in any characteristic (different from p, of course).”
  The fallback, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Theorem IX.7.2, printed p. 335.* “we can assume that Lambda is killed by a power of l (if l divides the order of pi_0 Z(G), replacing the left-hand side with an algebra of excursion operators)”
  The same replacement used in practice.

**What remains in this layer.**

- Theorem VIII.3.6, which the three-line proof of IX.5.2 invokes, was read only in the
  refined form of Theorem VIII.5.1 and only as a statement. It belongs to
  LanglandsParameterStacks:LP3.
- The roadmap asks in addition for compatibility with coefficient change and for passage
  between finite-wild pieces. Neither was located as a statement in anything read; the
  source proves the map exists and is Hecke-compatible and says no more.
- Fargues-Scholze state the excursion-algebra fallback as a general remark and write out
  none of the variants; each variant a formalisation uses must be restated and reproved.
- No injectivity or surjectivity statement for the map was located.

## ES2 — Rational categorical action

*Coverage: **partial**. 4 nodes.*

The definition of a compactly supported action over a parameter stack that is an
infinite disjoint union; Theorem X.1.1 with its proof in full; Lemma X.1.2 with its
proof in full; and Corollary X.1.3, the rational spectral action, with its uniqueness
characterisation.

### FS X.0: the parameter stack is not quasicompact, and what a compactly supported action is

`ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions` — *definition* · planet **Compactly supported spectral actions**

**Statement.**

Z^1(W_E,G-hat) is NOT quasicompact: it has infinitely many connected components. It can
be written as the INCREASING UNION of the open and closed quasicompact subschemes
Z^1(W_E/P,G-hat), indexed by the open subgroups P of the wild inertia. An action of
Perf(Z^1(W_E,G-hat)/G-hat) on a stable infinity-category C is COMPACTLY SUPPORTED if for
all X in C the functor Perf(Z^1(W_E,G-hat)/G-hat) -> C induced by acting on X factors
over some Perf(Z^1(W_E/P,G-hat)/G-hat). The condition is OBJECT BY OBJECT: no single P
is asked to work for all of C.

**Hypotheses and warnings.**

- Compact support is a condition on each object separately; a uniform P over all of C is
  a strictly stronger and false condition
- The exhausting subschemes Z^1(W_E/P,G-hat) are OPEN AND CLOSED and quasicompact; the
  union is increasing as P shrinks
- The indexing by open subgroups of the wild inertia is the same indexing as the finite-
  wild pieces of ES1:finite-ramification, and the two are matched by Proposition IX.5.1
- The notion is what makes the equivalence of Theorem X.0.1 correct: without it the two
  sides do not match, because a Perf-action on a non-quasicompact stack carries more
  data than a Hecke family

**Proof outline.**

1. Record the non-quasicompactness of Z^1(W_E,G-hat) and its exhaustion by the
   quasicompact open and closed Z^1(W_E/P,G-hat).
2. Define a compactly supported action by the object-by-object factorisation condition.
3. Match the indexing with the finite-wild pieces of ES1:finite-ramification.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `parameterStack.notQuasicompact` | structure | Z^1(W_E,G-hat) has infinitely many connected components. |
| `parameterStack.exhaustion` | data | The increasing union of the open, closed and quasicompact Z^1(W_E/P,G-hat) over open P inside the wild inertia. |
| `IsCompactlySupported` | data | For every X in C, the functor Perf(Z^1(W_E,G-hat)/G-hat) -> C given by acting on X factors over some Perf(Z^1(W_E/P,G-hat)/G-hat). |
| `IsCompactlySupported.objectwise` | structure | The subgroup P may depend on X; a uniform P is a different and stronger condition. |
| `matchesFiniteWild` | compatibility | The indexing matches the finite-wild pieces of ES1:finite-ramification through Proposition IX.5.1. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational` — the rational action is asserted to be compactly supported
- `ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action` — the integral theorem is an equivalence with compactly supported actions
- `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components` — a single component is one piece of the exhaustion

**Unit tests.**

- `objectwise_not_uniform` — The factorisation is required per object; a uniform P over all of C is false in general.
- `open_and_closed` — The exhausting subschemes are open AND closed, so the idempotents of ES1:finite-ramification exist.
- `matches_IX51` — On D_lis(Bun_G,Lambda)^omega compact support is exactly the conclusion of Proposition IX.5.1.
- `needed_for_the_equivalence` — Dropping compact support breaks Theorem X.0.1: a Perf-action on the whole non-quasicompact stack is more data than a Hecke family.

**Acceptance.**

- Check that the condition is object by object and not uniform
- Check that the exhausting subschemes are open and closed as well as quasicompact
- Check that the corresponding condition on D_lis(Bun_G,Lambda)^omega is exactly Proposition IX.5.1

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `LanglandsParameterStacks:LP0`, `LanglandsParameterStacks:LP4`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Head of Chapter X, printed p. 339.* “Note that Z^1(W_E,G-hat) is not quasicompact, as it has infinitely many connected components; it can be written as the increasing union of open and closed quasicompact subschemes Z^1(W_E/P,G-hat). We say that an action of Perf(Z^1(W_E,G-hat)/G-hat) on a stable infinity-category C is compactly supported if for all X in C the functor Perf(Z^1(W_E,G-hat)/G-hat) -> C (induced by ...”
  The definition, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### FS X.1.1: a Hecke family functorial in finite sets IS an action of Perf of the mapping stack

`ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem` — *theorem* · planet **The universal action theorem**

**Statement.**

Let H be a reductive group over a field L of characteristic 0 with an action of a finite
group Q, and let S be any anima over BQ. Let C be an idempotent-complete small stable
L-linear infinity-category. Giving, FUNCTORIALLY IN FINITE SETS I, an exact
Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I) -> End_L(C)^{S^I} is
EQUIVALENT to giving an L-linear action of Perf(Map_{/BQ}(S, B(H semidirect Q))) on C.
Given such an action one recovers the functors by precomposing the exact monoidal
functor Perf(Map_{/BQ}(S, B(H semidirect Q))) -> End_L(C) with the natural exact
Rep_L(Q^I)-linear symmetric monoidal functor given by the I-fold tensor product of the
functor Rep_L(H semidirect Q) -> Perf(Map_{/BQ}(S, B(H semidirect Q)))^S that assigns to
each s in S pullback along evaluation at s.

**Hypotheses and warnings.**

- L has CHARACTERISTIC ZERO. The integral analogue is false as stated, because Lemma
  X.1.2 fails; that is ES3
- The equivalence is of ANIMA of data, not a bijection of isomorphism classes: the proof
  compares the anima F_1(S) of actions with the anima F_2(S) of functorial monoidal
  functors. The roadmap insists on exactly this
- 'Functorially in the finite set I' means a map on total spaces over Fin of the
  corresponding coCartesian fibrations, as the source says at the head of Chapter X
- The mapping stack Map_{/BQ}(S,B(H semidirect Q)) is the fpqc quotient of an affine
  derived scheme by a power of H; for S = BW this recovers [Z^1(W,G-hat)_L / G-hat] by
  Proposition VIII.3.5, which is LanglandsParameterStacks' statement
- A key formal input is that for an idempotent-complete small stable L-linear C, exact
  L-linear functors out of Rep_L((H semidirect Q)^I) are the same as exact functors out
  of Perf(B(H semidirect Q)^I), since perfect complexes are freely generated by the
  exact category of representations

**Proof outline.**

1. Both F_1 and F_2 take sifted colimits in S to limits: for F_2 because S -> S^I
   commutes with sifted colimits, for F_1 by Lemma X.1.2.
2. Reduce to S a finite set, where the map S -> BQ factors over a point and Map_{/BQ}(S,
   B(H semidirect Q)) = B H^S.
3. Use Perf(B(H semidirect Q)^I) tensor over Perf(BQ^I) with Perf(L) = Perf(BH^I), which
   follows from highest weight theory, to replace Rep_L((H semidirect Q)^I) by
   Rep_L(H^I).
4. Observe that the data is a map Hom(I,S) = S^I -> Fun^{ex,mon}_L(Rep_L(H^I), End_L(C))
   functorial in I; the left-hand side is representable, so by the Yoneda lemma the data
   is an exact L-linear monoidal functor Rep_L(H^S) -> End_L(C), which extends uniquely
   to Perf(BH^S).

**Acceptance.**

- Check the theorem for C the perfect complexes on a point, where both sides are representations
- Check that the functoriality in I is coCartesian and not a compatible family
- Check that the comparison is of anima and not of sets of isomorphism classes
- Check that the theorem is stated for an abstract C and is independent of Bun_G

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP4`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:Representation`

**Sources.**

- *Theorem X.1.1, printed p. 341.* “Let C be an idempotent-complete small stable L-linear infinity-category. Giving, functorially in finite sets I, an exact Rep_L(Q^I)-linear monoidal functor Rep_L((H semidirect Q)^I) -> End_L(C)^{S^I} is equivalent to giving an L-linear action of Perf(Map_{/BQ}(S, B(H semidirect Q))) on C.”
  The universal action theorem, quoted verbatim. Read directly from the hash-verified
  PDF in this session.
- *Proof of Theorem X.1.1, printed pp. 341-342.* “For any S, we have the anima F_1(S) of L-linear actions of Perf(Map_{/BQ}(S,B(H semidirect Q))) on C, and the anima F_2(S) of functorial exact monoidal functors ... and a natural map F_1(S) -> F_2(S) functorial in S. Both functors take sifted colimits in S to limits.”
  That the comparison is of ANIMA and how the reduction runs.
- *Proof of Theorem X.1.1, printed p. 342.* “The latter data is equivalent to maps Hom(I,S) = S^I -> Fun^{ex,mon}_L(Rep_L(H^I), End_L(C)) functorially in I. Both sides here are functors in I, and on the left-hand side we have a representable functor. By the Yoneda lemma, it follows that this data is equivalent to L-linear exact monoidal functors Rep_L(H^S) -> End_L(C).”
  The Yoneda step, which is the heart of the proof.
- *Head of Chapter X, printed p. 339.* “Below, 'functorially in the finite set I' means a map on total spaces over Fin of the corresponding coCartesian fibrations.”
  What the functoriality means, which the roadmap warns must not be weakened to a
  compatible family.

### FS X.1.2: in characteristic zero, Perf of the mapping stack commutes with all colimits

`ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits` — *lemma*

**Statement.**

The functor taking an anima S over BQ to Perf(Map_{/BQ}(S, B(H semidirect Q))), regarded
as an idempotent-complete stable infinity-category, commutes with SIFTED COLIMITS; more
precisely, as a functor into L-linear symmetric monoidal idempotent-complete stable
infinity-categories, it commutes with ALL COLIMITS.

**Hypotheses and warnings.**

- This is the step that FAILS integrally, and its failure is the whole reason ES3 needs
  a different statement
- Sifted colimits agree with or without the symmetric monoidal structure by Lurie's
  Corollary 3.2.3.2, which the source cites
- The filtered case is proved by presenting Map_{/BQ}(S_i, B(H semidirect Q)) as X_i/G_i
  with X_i an affine derived L-scheme and G_i = H^{S'_i} PRO-REDUCTIVE, so that Rep(G_i)
  is SEMISIMPLE; characteristic zero enters exactly there
- The pushout case uses Barr-Beck-Lurie to identify IndPerf(X_i/G) with the
  O(X_i)-modules in IndPerf(BG), and then that O(X_1) tensor_{O(X_0)} O(X_2) -> O(X) is
  an isomorphism, checked after the conservative forgetful functor to D(L)

**Proof outline.**

1. Filtered colimits: write Map_{/BQ}(S_i,B(H semidirect Q)) = X_i/G_i for affine derived
   X_i and pro-reductive G_i, and show colim Perf(X_i/G_i) -> Perf(X/G) is an
   equivalence. For X a point this is the filtered colimit of Rep(G_i), which is
   semisimple. In general Perf(X/G) is generated by Rep(G): take the top nonvanishing
   cohomology sheaf, lift a surjection from a representation using semisimplicity, and
   reduce the projective amplitude until the object is a vector bundle, where the
   sequence splits because the obstruction lies in an H^1 that vanishes.
2. Disjoint unions are immediate.
3. Pushouts: identify the tensor product of the Ind-categories with modules over O(X_1)
   tensor_{O(X_0)} O(X_2) in IndPerf(BG), and check that this maps isomorphically to O(X)
   after the conservative forgetful functor.

**Acceptance.**

- Check that semisimplicity of Rep(G) is used and that it needs characteristic zero
- Check the generation argument, which is where the perfect amplitude is reduced
- Check that the pushout case uses Barr-Beck-Lurie and conservativity
- Check that the analogous integral statement fails

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP4`, `mathlib:CategoryTheory.Equivalence`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Module.Projective`, `mathlib:Representation`

**Sources.**

- *Lemma X.1.2, printed p. 342.* “The functor taking an anima S over BQ to Perf(Map_{/BQ}(S, B(H semidirect Q))), regarded as an idempotent-complete stable infinity-category, commutes with sifted colimits. More precisely, as a functor into L-linear symmetric monoidal idempotent-complete stable infinity-categories, it commutes with all colimits.”
  The lemma, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Lemma X.1.2, printed p. 342.* “Assume first that all X_i = Spec L are a point. Then note that Perf(BG) is generated by Rep(G), which is easily seen to be the filtered colimit colim Rep(G_i), and (by writing it as a limit of reductive groups) is seen to be semisimple.”
  Where characteristic zero enters: semisimplicity of the representation theory of a
  pro-reductive group.
- *Proof of Lemma X.1.2, printed p. 343.* “On the level of Ind-categories, IndPerf(X_i/G) is the infinity-category of O(X_i)-modules in IndPerf(BG): This is a consequence of Barr-Beck-Lurie and the fact observed above that Perf(BG) generates Perf(X_i/G), so that the forgetful functor IndPerf(X_i/G) -> IndPerf(BG) is conservative.”
  The pushout step.
- *Head of Section X.3, printed p. 348.* “Unfortunately, the naive analogue of Theorem X.1.1 is not true, the problem being that the analogue of Lemma X.1.2 fails.”
  The source's own statement that this lemma is the obstruction integrally.

### FS X.1.3: the rational spectral action of Perf of the stack of L-parameters

`ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational` — *theorem* · planet **The rational spectral action**

**Statement.**

Let L be a field over Q_l(sqrt q). There is a natural COMPACTLY SUPPORTED L-linear
action of Perf(Z^1(W_E,G-hat)_L / G-hat) on D_lis(Bun_G,L)^omega, UNIQUELY CHARACTERISED
by the requirement that restricting along the Rep_L(Q^I)-linear maps Rep_L((G-hat
semidirect Q)^I) -> Perf(Z^1(W_E,G-hat)_L / G-hat)^{B W_E^I} it induces the HECKE
ACTION, which gives functorially in the finite set I exact Rep_L(Q^I)-linear functors
Rep_L((G-hat semidirect Q)^I) -> End_L(D_lis(Bun_G,L)^omega)^{B W_E^I}.

**Hypotheses and warnings.**

- The action is on the COMPACT objects D_lis(Bun_G,L)^omega and is COMPACTLY SUPPORTED
  in the sense of ES2's definition node
- Uniqueness is by the characterisation through the Hecke action; the roadmap warns
  against asserting a spectral action with unproved properties, and this is precisely
  what forbids it
- The proof reduces to the subcategories D^P_lis(Bun_G,L)^omega for open subgroups P of
  the wild inertia of W_E ACTING TRIVIALLY ON G-hat - so P is chosen to satisfy two
  conditions, not one - and then replaces W_E by W_E/P throughout and restricts to a
  discretisation W
- One uses Z^1(W,G-hat) = Z^1(W_E/P,G-hat) for the discretisation W inside W_E/P, so
  that Theorem X.1.1's output is an action of Perf of the right stack
- L is a FIELD over Q_l(sqrt q); the ring-of-integers and general integral statements
  are ES3

**Proof outline.**

1. Reduce to D^P_lis(Bun_G,L)^omega for P an open subgroup of the wild inertia acting
   trivially on G-hat, using Proposition IX.5.1.
2. Replace W_E by W_E/P and restrict the Hecke action to a discretisation W inside W_E/P.
3. Apply Theorem X.1.1 to get an action of Perf(Z^1(W,G-hat)_L/G-hat), and use
   Z^1(W,G-hat) = Z^1(W_E/P,G-hat) to read it as an action of
   Perf(Z^1(W_E/P,G-hat)_L/G-hat).
4. Assemble over P; the result is compactly supported by construction.

**Acceptance.**

- Check that the action is on compact objects and is compactly supported
- Check that the uniqueness characterisation determines it, so that no further property may be asserted freely
- Check the reduction to D^P_lis, which is where the finite-ramification layer is consumed
- Check that P is required to act trivially on G-hat as well as to be open in the wild inertia

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`, `ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits`, `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group`, `LanglandsParameterStacks:LP4`, `LanglandsParameterStacks:LP2:integral-invariants`, `VStackSheavesAndLisseCategories:VS4`, `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS4`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Representation`

**Sources.**

- *Corollary X.1.3, printed p. 343.* “Let L be a field over Q_l(sqrt q). There is a natural compactly supported L-linear action of Perf(Z^1(W_E,G-hat)_L/G-hat) on D_lis(Bun_G,L)^omega, uniquely characterized by the requirement that by restricting along the Rep_L(Q^I)-linear maps Rep_L((G-hat semidirect Q)^I) -> Perf(Z^1(W_E,G-hat)_L/G-hat)^{B W_E^I} it induces the Hecke action.”
  The rational spectral action with its uniqueness characterisation, quoted verbatim.
  Read directly from the hash-verified PDF in this session.
- *Proof of Corollary X.1.3, printed p. 343.* “We can reduce to the subcategories D^P_lis(Bun_G,L)^omega inside D_lis(Bun_G,L) for open subgroups P of the wild inertia of W_E, acting trivially on G-hat. Then we can replace W_E by W_E/P throughout. In that case, restricting the given Hecke action to W inside W_E/P, Theorem X.1.1 gives an action of Perf(Z^1(W,G-hat)_L/G-hat), and Z^1(W,G-hat) = Z^1(W_E/P,G-hat), so we get the desired action.”
  The proof in full: three sentences, and exactly where Proposition IX.5.1 is
  consumed.

**What remains in this layer.**

- The roadmap also asks for the agreement of the degree-zero part of the action with the
  map of ES1, and for a comparison of representation bundles with the Satake and Hecke
  operations. Neither is stated separately in anything read: Corollary X.1.3's
  uniqueness characterisation is the only link between the action and the Hecke data,
  and the degree-zero comparison is left implicit. Those obligations are open.
- Proposition VIII.3.5, which identifies Map_{/BQ}(BW,B(G-hat semidirect Q)) with
  [Z^1(W,G-hat)_L/G-hat], was read only as a citation; it is LanglandsParameterStacks'.
- Conjecture X.1.4, the categorical form of the geometric Langlands conjecture, and
  Examples X.1.6 and X.1.7 were read but are conjectural and are deliberately not
  planned. The roadmap says the existence of the action does not construct an
  equivalence.
- The eigensheaf construction Aut_phi = E_phi * W_psi, and the fact that it is a Hecke
  eigensheaf, were read; they are consequences of the action and belong with the
  elliptic material of ES4 and with the conjectural part, and no node claims them.

## ES3 — Integral categorical action

*Coverage: **partial**. 6 nodes.*

The failure of Lemma X.1.2 integrally and the sifted-colimit approximation that replaces
it; Propositions X.3.1, X.3.2, X.3.3 and X.3.4 each with its proof; and Theorems X.0.1
and X.0.2, the integral spectral action, under the hypothesis that l does not divide the
order of pi_1(G-hat)_tors.

### FS X.3: the sifted-colimit approximation Perf(Map)-natural, and why the naive integral statement is false

`ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation` — *definition* · planet **The sifted-colimit approximation**

**Statement.**

Over a discrete valuation ring R the naive analogue of Theorem X.1.1 is NOT TRUE,
because the analogue of Lemma X.1.2 fails: the functor S -> Perf(Map_{/BQ}(S, B(H
semidirect Q))) does not commute with sifted colimits in S. One therefore replaces it by
its BEST APPROXIMATION THAT DOES. The infinity-category of anima over BQ is the
animation of the category of sets equipped with a Q-torsor, and is freely generated
under sifted colimits by the FINITE sets equipped with a Q-torsor; so the sifted-colimit
approximation is the animation of the restriction of S -> Perf(Map_{/BQ}(S, B(H
semidirect Q))) to those finite sets. It is written Perf(Map_{/BQ}(S, B(H semidirect
Q)))-natural, is an R-linear idempotent-complete small stable infinity-category, and
maps to Perf(Map_{/BQ}(S, B(H semidirect Q))).

**Hypotheses and warnings.**

- This is a DEFINITION by animation of a restriction, not a stack-theoretic
  construction: the source says it is 'like the infinity-category of perfect complexes
  on some (nonexistent) derived stack'
- H is a SPLIT reductive group over a discrete valuation ring R, with an action of a
  finite group Q; the rational statement allowed any reductive H over a characteristic-
  zero field
- The freeness statement - anima over BQ is freely generated under sifted colimits by
  finite sets with a Q-torsor - is what makes the animation well defined
- The comparison map Perf(Map)-natural -> Perf(Map) is not an equivalence in general;
  finding the cases where it is, is the work of X.3.2 and X.3.3
- The superscript in the source refers to the notation of Lurie's Section 5.5.8 for
  sifted colimits

**Proof outline.**

1. Restrict S -> Perf(Map_{/BQ}(S,B(H semidirect Q))) to finite sets equipped with a
   Q-torsor.
2. Animate that restriction, using that anima over BQ is freely generated under sifted
   colimits by those finite sets.
3. Record the comparison functor to the unapproximated Perf(Map).

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `PerfNatural` | data | Perf(Map_{/BQ}(S,B(H semidirect Q)))-natural, the animation of the restriction of Perf(Map) to finite sets with a Q-torsor. |
| `PerfNatural.onFiniteSets` | characterisation | On a finite set with a Q-torsor it agrees with Perf(Map) by construction; everything else is determined by animation. |
| `PerfNatural.siftedColimits` | structure | It commutes with sifted colimits in S by construction; Perf(Map) does not. |
| `PerfNatural.compare` | data | The comparison functor Perf(Map)-natural -> Perf(Map), not an equivalence in general. |
| `PerfNatural.notAStack` | structure | There is no derived stack whose perfect complexes these are; the notation is deliberate. |
| `splitH` | structure | H is SPLIT reductive over a discrete valuation ring R, unlike the rational statement. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action` — the integral universal theorem is stated for this approximation
- `ExcursionOperatorsAndSpectralAction:ES3/free-group-case` — the free-group case is where the comparison functor is fully faithful
- `ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action` — the final theorem needs the comparison to be an equivalence for the parameter stack

**Unit tests.**

- `finite_sets_agree` — On finite sets with a Q-torsor the approximation is Perf(Map); a definition that differs there is wrong.
- `differs_in_general` — The comparison functor is not an equivalence in general, which is exactly why X.3.3 has content.
- `reason_is_X12` — The approximation exists because Lemma X.1.2 fails integrally; a treatment that does not say so has not identified the difficulty.
- `split_over_a_dvr` — H is split reductive over a discrete valuation ring here; the rational theorem's hypotheses are different.

**Acceptance.**

- Check that the approximation agrees with Perf(Map) on finite sets with a Q-torsor, by construction
- Check that the two differ in general, and that this is why the integral theorem is stated for the approximation
- Check that the failure of Lemma X.1.2 is the reason

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits`, `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor`, `mathlib:Representation`

**Sources.**

- *Head of Section X.3, printed p. 348.* “We want to construct the spectral action with integral coefficients. Unfortunately, the naive analogue of Theorem X.1.1 is not true, the problem being that the analogue of Lemma X.1.2 fails. However, the rest of the argument still works, and gives the following result.”
  Why the integral statement must differ. Read directly from the hash-verified PDF in
  this session.
- *Head of Section X.3, printed p. 348.* “However, we can consider the best approximation to it that does commute with sifted colimits. Note that the infinity-category of anima over BQ is the animation of the category of sets equipped with a Q-torsor; it is freely generated under sifted colimits by the category of finite sets equipped with a Q-torsor. Thus, the sifted-colimit approximation to S -> Perf(Map_{/BQ}(S,B(H ...”
  The definition, quoted verbatim. The excerpt is truncated at a word boundary; the
  full passage is on the printed page named in the locator.
- *Head of Section X.3, printed p. 348.* “with the idea in mind that it is like the infinity-category of perfect complexes on some (nonexistent) derived stack Map_{/BQ}(S,B(H semidirect Q))-natural, gotten as a (co-)sifted limit approximation. Thus Perf(Map_{/BQ}(S,B(H semidirect Q)))-natural is an R-linear idempotent-complete small stable infinity-category, mapping to Perf(Map_{/BQ}(S,B(H semidirect Q))).”
  That the approximation is not the perfect complexes of any stack, and the comparison
  functor.

### FS X.3.1: the universal action theorem over a discrete valuation ring

`ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action` — *theorem* · planet **The integral universal action theorem**

**Statement.**

Let C be an R-linear idempotent-complete small stable infinity-category. Giving,
FUNCTORIALLY IN FINITE SETS I, an exact Rep_R(Q^I)-linear monoidal functor Rep_R((H
semidirect Q)^I) -> End_R(C)^{S^I} is EQUIVALENT to giving an R-linear action of
Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural on C. Given such an action one gets the
functors by composing the exact monoidal functor Perf(Map)-natural -> End_R(C) with the
natural exact Rep_R(Q^I)-linear symmetric monoidal functor given by the I-fold tensor
product of Rep_R(H semidirect Q) -> Perf(Map)-natural^S, defined by pullback along
evaluation at s when S is a finite set, and in general by ANIMATION.

**Hypotheses and warnings.**

- The target of the action is the APPROXIMATION Perf(Map)-natural, not Perf(Map); with
  Perf(Map) the statement is false
- The comparison functor Rep_R(H semidirect Q) -> Perf(Map)-natural^S is defined by
  evaluation only for FINITE S, and in general by animation; this is not a formality
- Fargues-Scholze prove the statement by citing the proof of Theorem X.1.1: 'This
  follows from the proof of Theorem X.1.1.' Every step of that proof that did not use
  characteristic zero is reused, and the only step that did - Lemma X.1.2 - has been
  designed away by the approximation
- R is a discrete valuation ring and H is split reductive over it

**Proof outline.**

1. Rerun the proof of Theorem X.1.1 with the approximation in place of Perf(Map).
2. The reduction to finite S is now definitional, since the approximation is the
   animation of the restriction to finite sets.
3. The Yoneda step and the identification of exact functors out of Rep_R with exact
   functors out of Perf are unchanged.

**Acceptance.**

- Check that the statement is about the approximation and not about Perf(Map)
- Check that the comparison functor is defined by animation for general S
- Check that the proof reuses X.1.1 and that the only step avoided is Lemma X.1.2

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`, `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:Representation`

**Sources.**

- *Proposition X.3.1, printed p. 348.* “Let C be an R-linear idempotent-complete small stable infinity-category. Giving, functorially in finite sets I, an exact Rep_R(Q^I)-linear monoidal functor Rep_R((H semidirect Q)^I) -> End_R(C)^{S^I} is equivalent to giving an R-linear action of Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural on C.”
  The integral universal action theorem, quoted verbatim with the approximation. Read
  directly from the hash-verified PDF in this session.
- *Proposition X.3.1, printed p. 349.* “assigning to each s in S pullback along evaluation at s, Map_{/BQ}(S,B(H semidirect Q)) -> B(H semidirect Q); more precisely, it is defined in this way if S is a finite set, and in general by animation.”
  The qualification on the comparison functor.
- *Proof of Proposition X.3.1, printed p. 349.* “This follows from the proof of Theorem X.1.1.”
  The whole proof.

### FS X.3.2: the approximation commutes with all colimits, by highest weight theory

`ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits` — *theorem* · planet **The approximation commutes with colimits**

**Statement.**

The functor S -> Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural, from anima over BQ to
symmetric monoidal idempotent-complete stable R-linear infinity-categories, commutes
with ALL COLIMITS.

**Hypotheses and warnings.**

- It commutes with sifted colimits BY DEFINITION; the content is disjoint unions, and
  for those one may factor S -> BQ over a point, so that Map_{/BQ}(S,B(H semidirect Q))
  = B H^S
- The content is then that Perf(BH^{S_1}) tensor_{Perf(R)} Perf(BH^{S_2}) ->
  Perf(BH^{S_1 disjoint S_2}) is an equivalence, and this follows from HIGHEST WEIGHT
  THEORY: for any split reductive H, highest weight theory filters Perf(BH) in terms of
  copies of Perf(R) enumerated by highest weights
- Highest weight theory over R is where the integral argument needs input the rational
  one did not; it is LanglandsParameterStacks:LP3's good-filtration and Donkin material,
  and is not planned here
- H must be SPLIT for highest weight theory to apply in this form

**Proof outline.**

1. Sifted colimits hold by definition of the approximation.
2. Reduce to disjoint unions of finite sets with a Q-torsor, where the map to BQ factors
   over a point and the mapping stack is B H^S.
3. Show that Perf(BH^{S_1}) tensor_{Perf(R)} Perf(BH^{S_2}) -> Perf(BH^{S_1 disjoint
   S_2}) is an equivalence by highest weight theory.

**Acceptance.**

- Check that sifted colimits are definitional and disjoint unions are the content
- Check that highest weight theory is the input and that it needs H split
- Check that the corresponding rational statement used semisimplicity instead

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`, `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Module.Free`

**Sources.**

- *Proposition X.3.2, printed p. 349.* “The functor S -> Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural from anima over BQ to symmetric monoidal idempotent-complete stable R-linear infinity-categories commutes with all colimits.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Proposition X.3.2, printed p. 349.* “As the functor commutes with sifted colimits by definition, it suffices to show that when restricted to finite sets S equipped with Q-torsors, it commutes with disjoint unions. ... Thus, one has to see that for two finite sets S_1, S_2, the functor Perf(BH^{S_1}) tensor_{Perf(R)} Perf(BH^{S_2}) -> Perf(BH^{S_1 disjoint S_2}) is an equivalence. But this follows easily from ...”
  The proof, and the appeal to highest weight theory that the rational argument did
  not need. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### FS X.3.3: for a free group the approximation is fully faithful with image generated by Rep_R(H)

`ExcursionOperatorsAndSpectralAction:ES3/free-group-case` — *theorem* · planet **The free-group case**

**Statement.**

Assume S = BF_n is the classifying space of a free group. Then the functor
Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural -> Perf(Map_{/BQ}(S, B(H semidirect Q)))
is FULLY FAITHFUL, and its essential image is the idempotent-complete stable infinity-
subcategory GENERATED BY THE IMAGE OF Rep_R(H). Concretely, representing BF_n -> BQ by a
map F_n -> Q with images sigma_1,...,sigma_n, the mapping stack is [H^n / H] for the
(sigma_1,...,sigma_n)-TWISTED DIAGONAL CONJUGATION action, and the approximation is the
compact objects in the modules over O(H^n) in IndPerf(BH).

**Hypotheses and warnings.**

- The conjugation action on H^n is TWISTED by the images sigma_i of the generators in Q;
  the untwisted diagonal conjugation is the split case only
- The identification of the approximation with compact modules over O(H^n) in
  IndPerf(BH) is EQUIVALENT to the claim, by Barr-Beck-Lurie, which gives a description
  of the full subcategory of Perf([H^n/H]) generated by Perf(BH)
- The reduction to n = 1 uses O(H^n) = O(H) tensor ... tensor O(H) in IndPerf(BH); the
  case n = 1 is the circle, presented as a pushout of a point along two maps
- For n = 1 one computes Perf(BH) tensor_{Perf(BH^2)} Perf(BH) where the two implicit
  maps H -> H^2 are the diagonal and the sigma_1-twisted diagonal

**Proof outline.**

1. Represent BF_n -> BQ by F_n -> Q and identify the mapping stack with [H^n/H] for the
   twisted diagonal conjugation.
2. Reduce to n = 1 by writing O(H^n) as a tensor product in IndPerf(BH).
3. For n = 1, present the circle BF_1 as a pushout of a point over two copies of a point,
   compute Perf(BH) tensor_{Perf(BH^2)} Perf(BH) with the diagonal and the twisted
   diagonal, and compare with Perf([H/H]) = Perf([H x H / H^2]), both described as
   compact modules in IndPerf(BH^2).

**Acceptance.**

- Check that the conjugation is twisted by the images of the generators
- Check the case n = 1, where the circle is presented as a pushout
- Check that the essential image is the subcategory generated by Rep_R(H), not all of Perf

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES3/sifted-colimit-approximation`, `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `mathlib:FreeGroup`, `mathlib:Representation`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.Equivalence`, `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- *Proposition X.3.3, printed p. 349.* “Assume that S = BF_n is the classifying space of a free group. Then the functor Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural -> Perf(Map_{/BQ}(S, B(H semidirect Q))) is fully faithful, and the essential image is the idempotent-complete stable infinity-subcategory generated by the image of Rep_R(H).”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Proposition X.3.3, printed p. 349.* “Represent BF_n -> BQ by a map F_n -> Q, and let sigma_1,...,sigma_n in Q be the images of the generators. Then Map_{/BQ}(S,B(H semidirect Q)) can be identified with [H^n/H], where H acts on H^n via the (sigma_1,...,sigma_n)-twisted diagonal conjugation action. We claim that Perf(Map)-natural is the infinity-category of compact objects in the infinity-category of modules over ...”
  The identification, with the twist, quoted verbatim. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *Proof of Proposition X.3.3, printed p. 350.* “As O(H^n) = O(H) tensor ... tensor O(H) in IndPerf(BH), one reduces to the case n = 1. In that case S = BF_1 is a circle, which we can present as a pushout of a point. Thus, we have to compute Perf(BH) tensor_{Perf(BH^2)} Perf(BH) where the two implicit maps H -> H^2 are given by the diagonal and the sigma_1-twisted diagonal, respectively.”
  The reduction to the circle.

### FS X.3.4: the approximation over the classifying space of a discrete group

`ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation` — *theorem* · planet **The discrete-group presentation**

**Statement.**

Let S = BGamma, where Gamma is any DISCRETE group, and lift the map S -> BQ to a map
Gamma -> Q. One can write BGamma = colim over (n, F_n -> Gamma) of BF_n as a SIFTED
COLIMIT in anima. Then Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural is the infinity-
category of COMPACT OBJECTS in the modules over colim over (n, F_n -> Gamma) of O(H^n)
in IndPerf(BH), where O(H^n) is equipped with the diagonal conjugation of H TWISTED via
the map F_n -> Gamma -> Q.

**Hypotheses and warnings.**

- That BGamma is the sifted colimit of the BF_n holds because E_1-groups in anima are
  equivalent to ANIMATED GROUPS, whose compact projective generators are the free groups
  F_n; this is the structural fact the presentation rests on
- The colimit index category is the same (n, F_n -> Gamma) that indexes the excursion
  algebra Exc(Gamma,H); this is why the excursion presentation and the spectral action
  are presentations of the same object
- The twist of the conjugation action is by the composite F_n -> Gamma -> Q and varies
  with the index
- The statement is about the APPROXIMATION; whether it agrees with Perf(Map) is the
  free-group case plus X.3.2

**Proof outline.**

1. Write BGamma as the sifted colimit of the BF_n, using that E_1-groups in anima are
   animated groups with the free groups as compact projective generators.
2. Apply the free-group case and its proof to each BF_n.
3. Conclude by the commutation of the approximation with sifted colimits.

**Acceptance.**

- Check that the colimit is sifted and that the index category is the excursion one
- Check that the twist varies with the index
- Check that the statement concerns the approximation

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES3/free-group-case`, `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP2:excursion-presentation`, `LanglandsParameterStacks:LP4`, `mathlib:FreeGroup`, `mathlib:Representation`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CommRing`

**Sources.**

- *Proposition X.3.4, printed p. 350.* “Let S = BGamma, where Gamma is any discrete group, and lift the map S -> BQ to a map Gamma -> Q. One can write BGamma = colim over (n, F_n -> Gamma) of BF_n as a sifted colimit (in anima). Then Perf(Map_{/BQ}(S, B(H semidirect Q)))-natural is the infinity-category of compact objects in the infinity-category of modules over colim over (n, F_n -> Gamma) of O(H^n) in IndPerf(BH), ...”
  The presentation, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Proof of Proposition X.3.4, printed p. 350.* “As E_1-groups in anima are equivalent to animated groups, with compact projective generators the free groups F_n, it follows that BGamma is the sifted colimit colim over (n, F_n -> Gamma) of BF_n. Now the result follows from the previous proposition (and its proof), together with the commutation with sifted colimits.”
  The proof, and the structural fact that licenses the sifted presentation.

### FS X.0.1-X.0.2: the integral spectral action, assuming l does not divide the torsion of pi_1 of the dual group

`ExcursionOperatorsAndSpectralAction:ES3/integral-spectral-action` — *theorem* · planet **The integral spectral action**

**Statement.**

Let Lambda be the ring of integers in a finite extension of Q_l(sqrt q), and assume that
l DOES NOT DIVIDE THE ORDER OF pi_1(G-hat)_tors. Let C be a small idempotent-complete
Lambda-linear stable infinity-category. Then giving, functorially in the finite set I,
an exact Rep_Lambda(Q^I)-linear monoidal functor Rep_Lambda((G-hat semidirect Q)^I) ->
End_Lambda(C)^{B W_E^I} is EQUIVALENT to giving a COMPACTLY SUPPORTED Lambda-linear
action of Perf(Z^1(W_E,G-hat)_Lambda / G-hat). The same holds if Lambda is a field over
Q_l(sqrt q), for any prime l. Applied to C = D_lis(Bun_G,Lambda)^omega with its Hecke
action, this gives the spectral action on D_lis(Bun_G).

**Hypotheses and warnings.**

- The hypothesis l not dividing the order of pi_1(G-hat)_tors is the one the roadmap
  says must be carried at every step that needs it; it is exactly the hypothesis of
  Theorem VIII.5.1, which the proof invokes
- By the proof of Proposition IX.5.1 one may replace W_E by W_E/P in the statement, and
  then choose a DISCRETISATION W inside W_E/P; that is the reduction of Theorem X.0.1 to
  Theorem X.0.2
- The proof is finished by COMBINING the propositions of X.3 with THEOREM VIII.5.1,
  which says that under the same hypothesis the colimit of the O(Z^1(F_n,G-hat))
  computes O(Z^1(W,G-hat)) in IndPerf(*/G-hat), that Perf(Z^1(W,G-hat)/G-hat) is
  generated under cones and retracts by Perf(*/G-hat), and that
  IndPerf(Z^1(W,G-hat)/G-hat) is the modules over O(Z^1(W,G-hat)) in IndPerf(*/G-hat).
  Theorem VIII.5.1 is LanglandsParameterStacks' and is NOT proved here
- The equivalence is stated with COMPACTLY SUPPORTED actions on the left of the
  correspondence; dropping that is the error the ES2 definition node guards against
- The Lambda of this statement is the ring of integers in a finite extension of Q_l(sqrt
  q), not an arbitrary ring

**Proof outline.**

1. Reduce Theorem X.0.1 to Theorem X.0.2 by replacing W_E with W_E/P, using the proof of
   Proposition IX.5.1, and choosing a discretisation W.
2. Apply Proposition X.3.1 to get an action of the approximation Perf(Map_{/BQ}(BW,
   B(G-hat semidirect Q)))-natural.
3. Use Propositions X.3.2, X.3.3 and X.3.4 to present the approximation as compact
   modules over the colimit of the O(G-hat^n) in IndPerf(B G-hat).
4. Combine with Theorem VIII.5.1 to identify that with Perf(Z^1(W,G-hat)_Lambda/G-hat),
   which finishes the proof of Theorem X.0.2 and hence of X.0.1.

**Acceptance.**

- Check that the torsion hypothesis is carried and is the same one as in Theorem VIII.5.1
- Check that the equivalence is with COMPACTLY SUPPORTED actions
- Check the reduction from W_E to a discretisation of W_E/P
- Check that Theorem VIII.5.1 is imported and not reproved

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation`, `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`, `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits`, `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/uniform-wild-subgroup`, `ExcursionOperatorsAndSpectralAction:ES0/discretisation-of-the-weil-group`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `LanglandsParameterStacks:LP2:integral-invariants`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS4`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:CategoryTheory.Equivalence`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Theorem X.0.1, printed p. 339.* “Assume that l does not divide the order of pi_1(G-hat)_tors. Let C be a small idempotent-complete Lambda-linear stable infinity-category. Then giving, functorially in the finite set I, an exact Rep_Lambda(Q^I)-linear monoidal functor Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(C)^{B W_E^I} is equivalent to giving a compactly supported Lambda-linear action of ...”
  The integral theorem, quoted verbatim with its hypothesis. Read directly from the
  hash-verified PDF in this session. The excerpt is truncated at a word boundary; the
  full passage is on the printed page named in the locator.
- *Theorem X.0.2, printed p. 340.* “Assume that l does not divide the order of pi_1(G-hat)_tors. ... giving, functorially in the finite set I, an exact Rep_Lambda(Q^I)-linear monoidal functor Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(C)^{BW^I} is equivalent to giving a Lambda-linear action of Perf(Z^1(W,G-hat)_Lambda/G-hat), with the same compatibility as above.”
  The discretised variant the proof actually establishes.
- *End of Section X.3, printed p. 350.* “Combining this with Theorem VIII.5.1, we have finished the proof of Theorem X.0.2. In particular, this gives the spectral action on D_lis(Bun_G).”
  How the chapter closes, and the single imported input.

**What remains in this layer.**

- Theorem VIII.5.1, with which the propositions of X.3 are combined to finish the proof,
  was read as a statement only. Its proof occupies FS VIII.5 and rests on good
  filtrations, Donkin's theorem on O(G) and the good-filtration t-structure; that
  material is LanglandsParameterStacks:LP3's and was not read.
- Highest weight theory over a discrete valuation ring, which the proof of X.3.2 invokes
  in one sentence, was not read anywhere; it is the integral input the rational argument
  did not need.
- The roadmap asks for the compatibility maps for change of coefficient extension, for a
  finite pinned action quotient and for the finite-wild cutoff, and for a check that all
  comparisons use the same universal parameter and the same normalised Hecke kernels.
  None of these is a statement in the source; they are obligations the roadmap adds and
  no node claims them.
- Conjecture X.3.5, the integral categorical conjecture, was read and is not planned.

## ES4 — Spectral support and reusable consequences

*Coverage: **partial**. 3 nodes.*

The commuting duality square of Proposition IX.5.3 with the Chevalley involution;
Definition X.2.1 of an elliptic parameter and the connected component its unramified
twists span; and the decomposition of that component's summand over the basic elements
of B(G), with the supercuspidality statement and the explicit description when the
connected split centre of G is trivial.

### FS IX.5.3: the two centres are compatible with duality and the Chevalley involution

`ExcursionOperatorsAndSpectralAction:ES4/duality-and-the-chevalley-involution` — *theorem* · planet **Duality of the centres**

**Statement.**

The Bernstein-Zelevinsky duality functor D_BZ on D_lis(Bun_G,Lambda) induces an
involution D^geom of Z^geom(G,Lambda). On Z^1(W_E,G-hat), the CHEVALLEY INVOLUTION of
G-hat induces an involution; after passing to the quotient by the conjugation action of
G-hat one may also FORGET ABOUT THE INNER AUTOMORPHISM appearing in Proposition VI.12.1.
Let D^spec be the induced involution of Z^spec(G,Lambda). Then the square relating
Z^spec(G,Lambda) -> Z^geom(G,Lambda) to itself through D^spec and D^geom COMMUTES.

**Hypotheses and warnings.**

- Only the square is this layer's. The consequence for L-parameters of irreducible
  smooth representations - compatibility with Bernstein-Zelevinsky duals and with smooth
  duals - is ES6:duality's, and the roadmap assigns it there explicitly
- The involution on the spectral side is the Chevalley involution; the inner
  automorphism of Proposition VI.12.1 may be discarded only AFTER passing to the
  quotient by conjugation, and Proposition VI.12.1 - the identification of the switching
  involution sw of Rep(G-hat^I) - is GeometricSatakeAndFusion's
- The commutation 'follows easily from the construction of excursion operators and
  Proposition VI.12.1'; the proof is one sentence and its substance is in the Satake
  input
- D_BZ is VStackSheavesAndLisseCategories:VS5's duality, and the compatibility
  D_BZ(T_V(A)) = T_{sw V-dual}(D_BZ(A)) is Theorem IX.2.2, which belongs to
  HeckeStacksAndLocalShtukas

**Proof outline.**

1. Note that D_BZ induces an involution of the geometric centre and the Chevalley
   involution one of the spectral centre.
2. Compare the two on excursion operators, using Proposition VI.12.1 to identify the
   switching involution with the Chevalley involution up to the inner automorphism.
3. Observe that after passing to the quotient by conjugation the inner automorphism is
   invisible.

**Acceptance.**

- Check that the inner automorphism may be discarded only after passing to the quotient
- Check the compatibility of D_BZ with Hecke operators, which is the imported Theorem IX.2.2
- Check that the representation-level consequences are not claimed here

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES1/spectral-and-geometric-centers`, `VStackSheavesAndLisseCategories:VS5`, `VStackSheavesAndLisseCategories:VS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS1`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:Representation`, `mathlib:RootPairing`

**Sources.**

- *Before Proposition IX.5.3, printed p. 329.* “Before going on, we make the following observation regarding duality. The Bernstein-Zelevinsky duality functor D_BZ on D_lis(Bun_G,Lambda) induces an involution D^geom of Z^geom(G,Lambda). On the other hand, on Z^1(W_E,G-hat), the Chevalley involution of G-hat induces an involution; after passing to the quotient by the conjugation action of G-hat, we can also forget about the ...”
  How the two involutions are defined, quoted verbatim. Read directly from the hash-
  verified PDF in this session. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *Proposition IX.5.3, printed p. 329.* “The diagram Z^spec(G,Lambda) --D^spec--> Z^spec(G,Lambda) over Z^geom(G,Lambda) --D^geom--> Z^geom(G,Lambda) commutes.”
  The square, which is this layer's. The second sentence of the source's statement,
  about L-parameters of irreducible smooth representations, is ES6:duality's and is
  deliberately not planned here.
- *Proof of Proposition IX.5.3, printed p. 330.* “The commutation follows easily from the construction of excursion operators and Proposition VI.12.1.”
  The proof of the square.

### FS X.2.1: elliptic L-parameters and the connected component they span

`ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components` — *definition* · planet **Elliptic parameters and their components**

**Statement.**

An L-parameter phi : W_E -> G-hat(Q-bar_l) is ELLIPTIC if it is SEMISIMPLE and the
centraliser S_phi inside G-hat_{Q-bar_l} has the property that S_phi /
Z(G-hat)^{Gamma}_{Q-bar_l} is FINITE. By deformation theory the UNRAMIFIED TWISTS of phi
define a CONNECTED COMPONENT C_phi inside [Z^1(W_E,G-hat)_{Q-bar_l} / G-hat]. The
spectral action - in fact the EXCURSION OPERATORS ARE ENOUGH for this - then gives a
corresponding DIRECT SUMMAND D^{C_phi}_lis(Bun_G,Q-bar_l)^omega inside
D_lis(Bun_G,Q-bar_l)^omega, explicitly the objects on which the excursion operator
corresponding to the function that is 1 on C_phi and 0 elsewhere acts via the identity.

**Hypotheses and warnings.**

- Ellipticity requires BOTH semisimplicity AND finiteness of S_phi modulo the Galois
  invariants of the centre of G-hat; dropping either changes the class
- That the unramified twists form a whole connected component is by DEFORMATION THEORY:
  the source's footnote says H^2(W_E, ad phi) = 0 by Tate duality and H^0 reduces to the
  Lie algebra of Z(G-hat)^Gamma, so H^1 must have the same dimension and is accounted
  for by the unramified twists. The deformation theory of the parameter stack is
  LanglandsParameterStacks' content
- The excursion operators alone suffice for the direct-summand decomposition; the source
  says so, pointing back to the discussion around Theorem IX.5.2. A construction that
  needs the full spectral action has overstated its input
- Coefficients are Q-bar_l here, taken 'for simplicity'

**Proof outline.**

1. Define ellipticity by semisimplicity together with finiteness of S_phi modulo
   Z(G-hat)^Gamma.
2. By deformation theory - H^2 vanishing by Tate duality and the H^0 computation - the
   unramified twists of phi form a connected component C_phi.
3. The idempotent function supported on C_phi gives, through the excursion operators of
   ES1:finite-ramification, a direct summand of the compact objects.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsElliptic` | data | phi is elliptic iff it is SEMISIMPLE and S_phi/Z(G-hat)^Gamma is FINITE. |
| `IsElliptic.needsBoth` | structure | Both conditions are part of the definition. |
| `centraliser` | data | S_phi, the centraliser of phi inside G-hat over Q-bar_l. |
| `componentOfEllipticParameter` | data | C_phi, the connected component of [Z^1(W_E,G-hat)/G-hat] spanned by the unramified twists of phi. |
| `componentOfEllipticParameter.deformation` | structure | The component claim rests on H^2(W_E, ad phi) = 0 by Tate duality and the H^0 computation; that deformation theory is imported. |
| `idempotentSummand` | data | D^{C_phi}_lis(Bun_G,Q-bar_l)^omega, the objects on which the excursion operator of the indicator function of C_phi acts as the identity. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES4/basic-decomposition-of-an-elliptic-component` — the summand is then decomposed over the basic elements of B(G)
- `ExcursionOperatorsAndSpectralAction:ES5` — the proved parameter assignment is read component by component
- `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition` — this is one piece of that decomposition, for a component of a special shape

**Unit tests.**

- `semisimplicity_is_required` — A non-semisimple parameter with finite S_phi modulo the centre is not elliptic.
- `torus_case` — For a torus S_phi is the whole group, so ellipticity becomes a condition on the centre; a definition making every torus parameter elliptic is wrong.
- `excursion_alone` — The summand needs only the excursion operators; the full spectral action is a stronger input than required.
- `unramified_twists_are_a_component` — For an elliptic phi the unramified twists exhaust a connected component; for a general parameter they need not.

**Acceptance.**

- Check that a non-semisimple parameter with finite centraliser quotient is not elliptic
- Check the deformation-theoretic count that makes the unramified twists a whole component
- Check that the excursion operators alone give the summand

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `LanglandsParameterStacks:LP4`, `LanglandsParameterStacks:LP0`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- *Definition X.2.1, printed p. 346.* “An L-parameter phi : W_E -> G-hat(Q-bar_l) is elliptic if it is semisimple and the centralizer S_phi inside G-hat_{Q-bar_l} has the property that S_phi/Z(G-hat)^{Gamma}_{Q-bar_l} is finite.”
  The definition, quoted verbatim with both conditions. Read directly from the hash-
  verified PDF in this session.
- *After Definition X.2.1, printed p. 346.* “By deformation theory, it follows that the unramified twists of phi define a connected component C_phi inside [Z^1(W_E,G-hat)_{Q-bar_l}/G-hat]. Thus, the spectral action (in fact, the excursion operators are enough for this, see the discussion around Theorem IX.5.2) implies that there is a corresponding direct summand D^{C_phi}_lis(Bun_G,Q-bar_l)^omega inside ...”
  The component and the summand, with the source's own note that the excursion
  operators suffice. The excerpt is truncated at a word boundary; the full passage is
  on the printed page named in the locator.
- *Footnote 3 to Section X.2, printed p. 346.* “One has H^2(W_E, ad phi) = 0 using Tate duality, and the H^0 reduces to the Lie algebra of Z(G-hat)^Gamma. The H^1 must thus be of the same dimension and be accounted for by the unramified twists.”
  The deformation-theoretic argument behind the component claim, which the source puts
  in a footnote.

### FS X.2: an elliptic component is supported on the basic strata and on supercuspidal blocks

`ExcursionOperatorsAndSpectralAction:ES4/basic-decomposition-of-an-elliptic-component` — *theorem* · planet **Elliptic components live on the basic strata**

**Statement.**

Let phi be elliptic with component C_phi. For any A in
D^{C_phi}_lis(Bun_G,Q-bar_l)^omega and any b in B(G) that is NOT BASIC, the restriction
i_b^* A is ZERO. Hence D^{C_phi}_lis(Bun_G,Q-bar_l)^omega = direct sum over b in B(G)
basic of D^{C_phi}(G_b(E),Q-bar_l)^omega. Moreover all A in
D^{C_phi}(G_b(E),Q-bar_l)^omega lie in SUPERCUSPIDAL components of the Bernstein centre.
If Z(G-hat)^Gamma is finite - equivalently, if the connected split centre of G is
trivial - then C_phi = [*/S_phi] is a point and every such A is a finite direct sum of
shifts of supercuspidal representations of G_b(E), so that
D^{C_phi}_lis(Bun_G,Q-bar_l)^omega = direct sum over basic b and over supercuspidal pi
of G_b(E) with phi_pi = phi of Perf(Q-bar_l).

**Hypotheses and warnings.**

- Both the vanishing on non-basic strata and the supercuspidality use COMPATIBILITY WITH
  PARABOLIC INDUCTION, which is FS IX.7.3 and belongs to ES7:parabolic; this node
  imports it and does not prove it
- The argument for the vanishing is: for a Schur-irreducible A in the component the
  excursion operators act by scalars determined by an unramified twist of phi, hence so
  they do on i_b^* A; if i_b^* A were nonzero for non-basic b one could find an
  irreducible subquotient to which the argument applies, contradicting parabolic-
  induction compatibility
- The point-like description of C_phi needs Z(G-hat)^Gamma FINITE, equivalently the
  connected split centre of G trivial; in general one fixes central characters instead
- Everything here is over Q-bar_l and concerns the elliptic case only; Conjecture X.2.2,
  which would make the resulting functor an equivalence, is a CONJECTURE and is not
  planned

**Proof outline.**

1. For Schur-irreducible A in the component, the excursion operators act by the scalars
   of an unramified twist of phi, and likewise on i_b^* A for every b.
2. By compatibility with parabolic induction, i_b^* A = 0 for non-basic b, passing to an
   irreducible subquotient if necessary.
3. Deduce the decomposition over basic b, and that the pieces lie in supercuspidal
   components, again by parabolic induction.
4. If Z(G-hat)^Gamma is finite, C_phi = [*/S_phi] is a point, and the pieces are finite
   direct sums of shifts of supercuspidal representations.

**Acceptance.**

- Check that the vanishing on non-basic strata is an import from parabolic induction and not proved here
- Check the subquotient step in the vanishing argument
- Check that the point-like description needs the connected split centre to be trivial
- Check that Conjecture X.2.2 is a conjecture and is not used

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES4/elliptic-parameters-and-components`, `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification/component-decomposition`, `ExcursionOperatorsAndSpectralAction:ES2/spectral-action-rational`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `LanglandsParameterStacks:LP4`, `mathlib:Representation`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- *Section X.2, printed p. 346.* “For any Schur-irreducible A in D^{C_phi}_lis(Bun_G,Q-bar_l)^omega, the excursion operators act via scalars on A, as determined by an unramified twist of phi. In particular, they act in this way on i_b^* A for any b in B(G). By compatibility with parabolic induction, it follows that for any A in D^{C_phi}_lis(Bun_G,Q-bar_l)^omega, the restriction i_b^* A is equal to 0 if b is ...”
  The vanishing on non-basic strata, quoted verbatim. Read directly from the hash-
  verified PDF in this session. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *Section X.2, printed p. 346.* “Thus, D^{C_phi}_lis(Bun_G,Q-bar_l)^omega = direct sum over b in B(G) basic of D^{C_phi}(G_b(E),Q-bar_l)^omega. Moreover, all A in D^{C_phi}(G_b(E),Q-bar_l)^omega must lie in only supercuspidal components of the Bernstein center, again by compatibility with parabolic induction.”
  The decomposition and the supercuspidality.
- *Section X.2, printed p. 346.* “If Z(G-hat)^Gamma is finite (equivalently, if the connected split center of G is trivial), then C_phi = [*/S_phi] is a point and it follows that all A are finite direct sums of shifts of supercuspidal representations of G_b(E), and so D^{C_phi}_lis(Bun_G,Q-bar_l)^omega = direct sum over b basic, over pi, of Perf(Q-bar_l), where pi runs over supercuspidal ...”
  The explicit description when the connected split centre is trivial. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.

**What remains in this layer.**

- The vanishing i_b^* A = 0 for non-basic b and the supercuspidality both rest on
  compatibility with parabolic induction, which is FS IX.7.3 and belongs to
  ES7:parabolic. This packet imports it. Until ES7:parabolic is planned, the two
  statements of this layer rest on an unplanned supplier.
- The roadmap asks this layer for a general notion of SPECTRAL SUPPORT via annihilators
  and central functions on finite-wild pieces, with functoriality under exact triangles,
  retracts and coefficient change. Nothing read defines such a support: the source works
  with the idempotents of connected components only, and the elliptic case is the only
  one spelled out. No node was written for the general notion, because writing one would
  mean inventing a definition the source does not give.
- The roadmap also asks for the local-shtuka consequences - commuting excursion
  operators on the cohomology of moduli of local shtukas and their compatibility with
  the two smooth group actions - through HS3. Section IX.3 on the cohomology of local
  Shimura varieties was read in passing and Theorem IX.3.1 was noted, but no node is
  written: the atlas records no edge from HS3 to ES4 and the roadmap's own text names
  HS3 as an input that the link graph does not have.
- Conjecture X.2.2, the parametrisation of L-packets, was read and is conjectural; the
  roadmap says identifying a particular classical packet is outside its acceptance
  conditions, and no node claims it.
- Proposition VI.12.1, which identifies the switching involution with the Chevalley
  involution up to an inner automorphism, was not read; it is
  GeometricSatakeAndFusion's.

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
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Representations of a group on a module. V in Rep((G-hat semidirect Q)^I), the representations realising excursion data, and the Rep_Lambda(Q^I)-linearity of every functor of Chapters VIII and X are all this notion; the packet cites it and does not plan it. |
| `mathlib:CategoryTheory.Functor` | `Mathlib/CategoryTheory/Functor/Basic.lean` | Functors. The identity functor of C, whose endomorphisms are the Bernstein centre, and the Hecke functors T_V are objects of this type. |
| `mathlib:CategoryTheory.NatTrans` | `Mathlib/CategoryTheory/NatTrans.lean` | Natural transformations. An element of the Bernstein centre is a natural endomorphism of the identity; the pinned definition already carries the naturality that this roadmap insists distinguishes it from an endomorphism of one object. |
| `mathlib:CategoryTheory.Preadditive` | `Mathlib/CategoryTheory/Preadditive/Basic.lean` | Preadditive categories. End(id_C) is a ring because C is additive; the pinned class supplies that structure on hom-sets. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories. Rep((G-hat semidirect Q)^I), Perf of the parameter stack and End(C) are all monoidal, and the Hecke datum is a monoidal functor between them. |
| `mathlib:CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean` | Monoidal functors. The Hecke datum V -> T_V and the spectral action are monoidal functors; the pinned definition is what the packet's statements quantify over. |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences of categories. Theorems X.0.1, X.1.1 and X.3.1 all assert that two data are equivalent, and Proposition X.3.3 asserts full faithfulness with a named essential image. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Adjunctions. The unit and counit alpha and beta of an excursion datum, the adjoints T_{V-dual} of the Hecke operators, and the left adjoint to i_b^* used for the stratum embeddings are adjunction data. |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` | The Karoubi envelope. Every category in Chapter X is IDEMPOTENT-COMPLETE by hypothesis, and the component decomposition of IX.5 splits objects along idempotents of the centre; the pinned construction is the ambient notion. |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Rigid monoidal categories. Dualisability of V in the Satake category, which is what gives T_V its adjoints, and the duality involutions of IX.5.3 live here. |
| `mathlib:Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean` | Endomorphism rings of modules. End(A) for an object A, and the scalar End(A) = L of a Schur-irreducible object, are of this form once the category is concrete. |
| `mathlib:Module.Projective` | `Mathlib/LinearAlgebra/Projective.lean` | Projective modules. The vanishing of the Lambda-homology of the pro-p group P^I in the proof of IX.5.1, and the splitting arguments in the proof of X.1.2, are statements about projectivity. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The good filtrations of highest weight theory, which X.3.2 invokes, filter Perf(BH) by copies of Perf(R); the pinned notion is the local model for those pieces. |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. O(Z^1(F_n,G-hat))^{G-hat}, the excursion algebra, the spectral centre and the classical Bernstein centre are all commutative rings. |
| `mathlib:RingHom` | `Mathlib/Algebra/Ring/Hom/Defs.lean` | Ring homomorphisms. Theorem VIII.4.1 and Theorem IX.5.2 both assert that a specific map is a map of ALGEBRAS; the pinned notion is what has to be produced. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Polynomial algebras. O(Z^1(F_n,G-hat)) is the coordinate ring of an affine scheme cut out inside a power of G-hat, and the invariant functions f(V,alpha,beta) are elements of such a ring. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean` | Free groups. The excursion algebra is a colimit over pairs (n, F_n -> W), and Propositions X.3.3 and X.3.4 are stated for BF_n and for a sifted colimit of them; the pinned construction is the indexing object. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups. The open subgroup P of the wild inertia, the discrete dense W inside W_E/P and the compact open K used for the classical Bernstein centre are subgroups. |
| `mathlib:ProfiniteGrp` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean` | Profinite groups. The inertia I_E is compact and P is pro-p; the proof of IX.5.1 uses that Aut_{Z_l}(R) is profinite and locally pro-l. The Weil group itself is NOT profinite and is not in the pinned libraries. |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | Condensed objects. Schur-irreducibility is End(A) = L AS CONDENSED ALGEBRAS, and the existence of the wild cutoff P rests on the relatively discrete condensed structure; the pinned definition is the ambient one and the condensed enhancement of D_lis is VStackSheavesAndLisseCategories' and HeckeStacksAndLocalShtukas'. |
| `mathlib:CondensedMod` | `Mathlib/Condensed/Module.lean` | Condensed modules. The relatively discrete condensed animated Z_l-algebras of the proof of IX.5.1 are objects of this kind after truncation. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Monoid algebras. The level Hecke algebras Lambda[K \ G_b(E) / K] whose centres exhaust the classical Bernstein centre are of this shape. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | Root pairings. The Chevalley involution of G-hat, the highest weights indexing the filtration of Perf(BH), and the dominant weights of the dual group are root-datum notions; the dual group itself is GeometricSatakeAndFusion:GS4's. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes. Z^1(W_E/P,G-hat) is an affine scheme, the quasicompact open and closed pieces exhausting Z^1(W_E,G-hat) are schemes, and [H^n/H] is a quotient of one. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/SmoothDiscrete.lean` | Smooth discrete actions. The smooth representations of G_b(E) whose Bernstein centre is the target of ES0:classical-center's map are of this kind at the pins; this is a genuine baseline, and is NOT the equivalence with sheaves on a stratum, which is VStackSheavesAndLisseCategories:VS4's. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | `TauCeti/RepresentationTheory/SmoothDiscrete.lean` | The category of smooth discrete representations. The classical Bernstein centre is End(id) of its derived category, so the pinned category is where that statement would be made. |
| `mathlib:CategoryTheory.CatCenter` | `Mathlib/CategoryTheory/Center/Basic.lean` | THE BERNSTEIN CENTRE OF A CATEGORY, ALREADY IN MATHLIB: `abbrev CatCenter := End (1_C)`. This is exactly the object Theorem VIII.4.1 calls the Bernstein centre of C, and the reviewed audit AUDIT-20 records this target as PARTIAL for that reason. This packet therefore cites it and plans only what is missing: the enhanced, degree-zero version on D_lis(Bun_G,Lambda). |
| `mathlib:CategoryTheory.CatCenter.app` | `Mathlib/CategoryTheory/Center/Basic.lean` | Evaluation of a central element at an object. This is the pinned form of the distinction the roadmap insists on, between a natural endomorphism of the identity and an endomorphism of one object. |
| `mathlib:CategoryTheory.CatCenter.naturality` | `Mathlib/CategoryTheory/Center/Basic.lean` | Naturality of a central element, from which centrality follows. Already proved at the pins, so this packet does not plan it. |
| `mathlib:CategoryTheory.Linear.toCatCenter` | `Mathlib/CategoryTheory/Center/Linear.lean` | `def toCatCenter [Linear R C] : R ->+* CatCenter C`, the scalar structure on the centre of an R-linear category. The Lambda-algebra structure on the Bernstein centre is this map and is not planned again. |
| `mathlib:RootPairing.flip` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | The dual root pairing. AUDIT-20 records that although the dual group does not exist as a group scheme at the pins, the hypothesis of Theorem X.0.1 CAN be stated with what does: pi_1(G-hat) is the quotient of the character lattice by the root lattice, which the pinned root pairings express. ES3's coefficient hypothesis is therefore statable today. |

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

### 1. This roadmap has no integrated decomposition; every node was written from the source read in this session

There is no file for ExcursionOperatorsAndSpectralAction in data/decompositions/, no
draft in research/expansion/drafts/, no external contribution. All twenty-six nodes of
this packet were therefore written from Fargues-Scholze read directly in this session,
from Geometrization.pdf whose SHA-256 reproduces the recorded value byte for byte; the
text was extracted by inflating the PDF's object streams and reading its text operators,
and every printed page was read off the running heads. The sections read are listed in
the source record. A reviewer of this packet is checking a first reading and not a
refinement of a reviewed one, and should treat every locator as unconfirmed by anyone
else.

### 2. CORRECTION: this roadmap does have a reviewed library audit, and the first version of this packet said it did not

The first version of this packet, merged as pull request #2862, stated that there is 'no
reviewed audit in data/library-coverage.json' for this roadmap. That is wrong. AUDIT-20,
reviewed as REV-AUDIT-20 on 17 September 2026 with 240 targets checked and 89
corrections, covers all seventeen layers of ExcursionOperatorsAndSpectralAction and
returns NOT BUILT for every one. The verdicts do not overturn anything planned here -
nothing in this packet duplicates a built target - but two of the audit's target notes
do change the packet, and both corrections are applied in this version. First, ES0's
target 'the algebra of natural endomorphisms of the identity of the enhanced category,
its centrality and scalar structure' is recorded as PARTIAL, because Mathlib at the
pinned commit already has `CategoryTheory.CatCenter C = End (1_C)` with `CatCenter.app`,
`CatCenter.naturality` and `Linear.toCatCenter`; the node ES0/bernstein-center-of-a-
category now cites those declarations and owns only the enhanced degree-zero version,
which is what the audit says is missing. Second, ES3's target records that although the
dual group is absent, the hypothesis that l not divide the order of pi_1(G-hat)_tors IS
statable at the pins through `RootPairing.flip`, since pi_1(G-hat) is the quotient of
the character lattice by the root lattice; that declaration is now cited. The audit's
duplicate records are also acted on: ES0 duplicates
GlobalShtukasAndFunctionFieldLanglands:GS.5, which constructs excursion operators
indexed by invariant functions and Galois tuples with the same relations globally over a
function field, and a request to it is added.

### 3. V. Lafforgue's relations, on which the last step of Theorem VIII.4.1 rests, were not read

The proof of Theorem VIII.4.1 finishes with: 'Arguing also as in [Laf18, Lemma 10.1,
equation (10.5)] and the resulting [Laf18, Proposition 10.8(iii), Definition-Proposition
11.3(d)], one sees that the maps Theta_n are also compatible with the multiplication
maps induced by such maps g.' V. Lafforgue, Chtoucas pour les groupes reductifs et
parametrisation de Langlands globale, J. Amer. Math. Soc. 31 (2018), was NOT read in
this session. Everything else in the proof - the cartesian reindexing square, the fusion
argument for multiplicativity and the unit-insertion identification - was read and is
planned. NEXT SOURCE ACTION: read [Laf18] Sections 10 and 11 and either plan the
relations there or record them as an external dependence of ES0.

### 4. The display defining Theta_I on printed page 292 is damaged in the text extraction

The extraction used here renders the commutative square that defines Theta_I and asserts
its cartesianness as a broken run of fragments; what was recovered cleanly is the word
'cartesian', the two function rings and the two mapping spaces. The node ES0/excursion-
relations-and-the-algebra-map therefore states cartesianness on the strength of a
partially recovered display. NEXT SOURCE ACTION: read printed page 292 of
Geometrization.pdf in a viewer and confirm the shape of the square. Nothing else in this
packet depends on that wording.

### 5. Theorem VIII.3.6 and Theorem VIII.5.1 were read as statements only

The three-line proof of Theorem IX.5.2 invokes Theorem VIII.3.6, and the closing
sentence of Section X.3 invokes Theorem VIII.5.1, which FS call a slight refinement of
VIII.3.6 concerning perfect complexes. Their statements were read (printed p. 293) and
are quoted in the packet; the proof, which occupies the rest of Section VIII.5 and rests
on the good-filtration t-structure on IndPerf(BG), Donkin's theorem that O(G) admits a
good filtration, and a reduction to characteristic l, was NOT read. This material
belongs to LanglandsParameterStacks:LP3 and is requested from it. NEXT SOURCE ACTION:
read FS VIII.5, printed pp. 293-300.

### 6. Highest weight theory over a discrete valuation ring, which Proposition X.3.2 turns on, has no source in anything read

The whole proof of Proposition X.3.2 is: 'But this follows easily from highest weight
theory, which for any split reductive group H filters Perf(BH) in terms of copies of
Perf(R) enumerated by highest weights.' No reference is given at that point and nothing
read here establishes it. This is precisely the input the rational argument did not
need, so it is the mathematical content of the integral case. NEXT SOURCE ACTION: locate
the statement in FS VIII.5, where the good-filtration formalism is developed, or in
Donkin and Jantzen, and route it to LanglandsParameterStacks:LP3.

### 7. The complex block description of the classical Bernstein centre is not in Fargues-Scholze

ES0:classical-center is described by the roadmap as a comparison with 'SR.3's classical
Bernstein-block description over complex coefficients, through the stipulated
characteristic-zero coefficient dictionary'. What Fargues-Scholze supply is the map
Z^geom(G,Lambda) -> Z(G(E),Lambda) and the description Z(D(G_b(E),Lambda)) = lim over K
of Z(Lambda[K \ G_b(E) / K]). Bernstein's decomposition of that ring into blocks is
neither stated nor proved in anything read. The layer therefore has an unproved half
until SmoothRepresentationsOfLocalGroups:SR.3 supplies it. NEXT SOURCE ACTION: none in
this source; the statement must come from SR.3.

### 8. Helm-Moss was not read, although the whole of IX.5's Bernstein-centre discussion is presented as generalising it

Fargues-Scholze write 'This is a generalization of results of Helm-Moss, [HM18]' before
Theorem IX.5.2, and close IX.7.4 with 'recovering a result of Helm-Moss [HM18]'. D. Helm
and G. Moss, Converse theorems and the local Langlands correspondence in families,
Invent. Math. 214 (2018), was not read. Nothing in this packet depends on it, but a
reviewer cannot check the word 'generalization' without it. NEXT SOURCE ACTION: read
[HM18]'s main theorem and record in ES0:classical-center's node what exactly is
generalised.

### 9. The general notion of spectral support that ES4's stage text asks for has no source

ES4's text asks for 'support of an object via annihilators/central functions on finite-
wild pieces, functoriality under exact triangles, retracts and coefficient change, and
the associated localization/decomposition operations'. Fargues-Scholze define no such
support. What they give is the decomposition along connected components of the parameter
stack (IX.5, planned in ES1:finite-ramification) and, for an elliptic parameter, the
summand cut out by the indicator function of the component (X.2.1, planned here). No
node was written for the general notion, because writing one would mean inventing a
definition the source does not give. NEXT SOURCE ACTION: either narrow ES4's text to the
component decomposition and the elliptic case, or name a source - the natural candidate
is the singular-support formalism of FS VIII.2.2, which was not read - and route the
general notion there.

### 10. The local-shtuka consequences that ES4's text asks for have no supplier edge and no node

ES4's text names 'HS3 for local-shtuka applications' among its inputs and asks to
'recover the resulting commuting excursion operators and their compatibility with the
two smooth group actions through the Hecke comparison'. The atlas records no edge from
HeckeStacksAndLocalShtukas:HS3 to ES4; ES4's recorded inputs are ES2, ES3, LP4 and VS4
only. FS IX.3, on the cohomology of local Shimura varieties, was read in passing in this
session - Theorem IX.3.1 says the complex is naturally one of smooth
G_b(Q_p)-representations, compact in D(G_b(Q_p),Z_l) for K pro-p, with continuous W_E-
action - but no node is written here, because the statement belongs to the Hecke roadmap
and the edge does not exist. NEXT SOURCE ACTION: read FS IX.3 in full and route Theorem
IX.3.1 to HeckeStacksAndLocalShtukas:HS3; then a kind:link job should draw HS3 -> ES4.

### 11. Proposition VI.12.1 was not read

The involution D^spec of the spectral centre is defined using the Chevalley involution
'after passing to the quotient by the conjugation action of G-hat, we can also forget
about the inner automorphism appearing in Proposition VI.12.1', and the proof of
Proposition IX.5.3 says the commutation 'follows easily from the construction of
excursion operators and Proposition VI.12.1'. Proposition VI.12.1 identifies the
switching involution sw of Rep(G-hat^I) and lives in the geometric Satake chapter; it
was not read here and belongs to GeometricSatakeAndFusion. So the only substantive input
to ES4's duality node is imported unread. NEXT SOURCE ACTION: read FS VI.12, printed pp.
240-245.

### 12. The agreement of the degree-zero spectral action with the centre map of ES1 is not a statement in the source

ES2's text asks to 'prove agreement of the degree-zero action with ES1'. Corollary X.1.3
characterises the spectral action uniquely by the requirement that it induce the Hecke
action, and Theorem IX.5.2 constructs the centre map independently; nothing read states
that the degree-zero part of the former is the latter. The two constructions share the
excursion operators, so the statement is presumably routine, but it is an obligation the
roadmap adds rather than a theorem of the source, and no node claims it. NEXT SOURCE
ACTION: none in this source; the statement has to be formulated and proved as part of
ES2's own work, and a reviewer should not expect a locator for it.

## Requests to other roadmaps

| Supplier | What is needed |
| --- | --- |
| `HeckeStacksAndLocalShtukas:HS1` | The condensed enhancement of D_lis(Bun_G,Lambda) and its W_E^I-equivariant objects. Every excursion operator's middle arrow is the action of a tuple of Weil elements through that condensed structure, Schur-irreducibility is an identity of CONDENSED algebras, and the existence of the wild cutoff P in IX.5.1 is proved from the relatively discrete condensed structure of the endomorphisms. A discrete action does not suffice anywhere here. |
| `HeckeStacksAndLocalShtukas:HS4` | The Hecke functors T_V given coCartesianly in the finite set I, in the strong sense the source states at the head of Chapter X: a map on total spaces over Fin of the corresponding coCartesian fibrations. Both sides of Theorem X.1.1 are stated in terms of it, the tensor-closure step of IX.5.1 uses T_{V tensor W} = T_V o T_W with the diagonal restriction of the W_E^{I disjoint I}-action, and the multiplicativity of the excursion operators is proved on a disjoint union of leg sets. |
| `LanglandsParameterStacks:LP2:excursion-presentation` | The excursion algebra Exc(W,G-hat) with its presentation as the colimit over (n, F_n -> W) of O(Z^1(F_n,G-hat))^{G-hat}, and the invariant ring O(G-hat \ (G-hat semidirect Q)^I / G-hat) on which the operators are defined. Theorem VIII.4.1's source is this object; this packet consumes the presentation and plans none of it. |
| `LanglandsParameterStacks:LP2:integral-invariants` | The integral invariant-function theory of the parameter stack: the functions O(Z^1(W_E,G-hat)_Lambda / G-hat) that make up the spectral centre, over a general Z_l[sqrt q]-algebra Lambda. Theorem IX.5.2's source is this ring and its component decomposition. |
| `LanglandsParameterStacks:LP0` | The scheme of 1-cocycles Z^1(W_E,G-hat) itself, its non-quasicompactness, its exhaustion by the open, closed and quasicompact Z^1(W_E/P,G-hat), and the fact that Exc(W,G-hat) -> O(Z^1(W_E/P,G-hat)_Lambda)^{G-hat} is a UNIVERSAL HOMEOMORPHISM. The last is what supplies the idempotents that cut out the components in ES1:finite-ramification. |
| `LanglandsParameterStacks:LP3` | Theorem VIII.5.1 and its proof: assuming l does not divide the order of pi_1(G-hat)_tors, the colimit of the O(Z^1(F_n,G-hat)) computes O(Z^1(W,G-hat)) in IndPerf(*/G-hat), Perf(Z^1(W,G-hat)/G-hat) is generated under cones and retracts by Perf(*/G-hat), and IndPerf(Z^1(W,G-hat)/G-hat) is the modules over O(Z^1(W,G-hat)) in IndPerf(*/G-hat). Also the highest weight theory over a discrete valuation ring - good filtrations and Donkin's theorem - that the proof of X.3.2 invokes. Both the proof of IX.5.2 and the proof of X.0.2 rest on this and nothing in this packet reproves it. |
| `LanglandsParameterStacks:LP4` | The stack of L-parameters [Z^1(W_E,G-hat)/G-hat] as a geometric object, its Perf and IndPerf, and the identification Map_{/BQ}(BW, B(G-hat semidirect Q)) = [Z^1(W,G-hat)_L/G-hat] of Proposition VIII.3.5, together with the deformation theory - H^2(W_E, ad phi) = 0 by Tate duality - behind the component claim for an elliptic parameter. |
| `SmoothRepresentationsOfLocalGroups:SR.0` | The category of smooth representations of a locally profinite group over the allowed coefficients, which is the C of the abstract theory in its classical incarnation and the target of the comparison of ES0:classical-center. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Parabolic induction for p-adic groups and the normalisation conventions. This packet's ES4 imports compatibility with parabolic induction from ES7:parabolic, which in turn rests on SR.2's dictionary between the source's unnormalised induction and the local-group owner's normalised one. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | The classical Bernstein decomposition: the block description of Z(G(E),C) over complex coefficients. It is NOT proved in Fargues-Scholze, and ES0:classical-center's coefficient dictionary has an unproved half until this is supplied. |
| `VStackSheavesAndLisseCategories:VS2` | The lisse categories D_lis(Bun_G,Lambda), their compact objects, and the solid formalism they rest on. Proposition IX.5.1 is a statement about compact objects of D_lis and its proof uses the v-descent that VS2 owns. |
| `VStackSheavesAndLisseCategories:VS3` | The Ind-category of D_lis(Bun_G,Lambda) and the relation between its compact objects and the whole category: the component decomposition of IX.5 is a direct SUM on compact objects and a direct PRODUCT on the Ind-category, and the distinction has to be available before it can be stated. |
| `VStackSheavesAndLisseCategories:VS4` | The identification D(G_b(E),Lambda) = D_lis(Bun^b_G,Lambda) and the fully faithful embeddings of the strata's categories into D_lis(Bun_G,Lambda). ES0:classical-center's map to the classical Bernstein centre is induced by the embedding for b = 1, and ES4's decomposition over the basic elements uses the general ones. |
| `VStackSheavesAndLisseCategories:VS5` | Bernstein-Zelevinsky duality D_BZ on D_lis(Bun_G,Lambda). The involution D^geom of the geometric centre in Proposition IX.5.3 is induced by it. The atlas records no edge from VS5 to ES4 although the roadmap's own ES4 text names VS5 as an input; that is filed as a structural finding. |
| `EnhancedDerivedSheaves:E5:abstract` | The abstract theory of small idempotent-complete Lambda-linear stable infinity-categories, their endofunctor categories End_Lambda(C), and equivariant objects C^{S} for an anima S. Every statement of Chapters VIII and X quantifies over such a C. |
| `EnhancedDerivedSheaves:E5:presentability` | Presentability and Ind-completion: IndPerf of a stack, Barr-Beck-Lurie for the comparison of IndPerf(X/G) with modules over O(X) in IndPerf(BG), and the compact objects inside a presentable category. The proofs of X.1.2, X.3.3 and X.3.4 all run through these. |
| `GeometricSatakeAndFusion:GS4:integral-dual-group` | The dual group G-hat with its Q-action and the category Rep((G-hat semidirect Q)^I) over the integral coefficients used here, together with the Chevalley involution and Proposition VI.12.1's identification of the switching involution. Every excursion datum is built from an object of that category. The atlas records no edge from GS4 to ES0, ES2 or ES3 although all three are stated in terms of Rep((G-hat semidirect Q)^I); that is filed as a structural finding. |
| `GlobalShtukasAndFunctionFieldLanglands:GS.5` | The GLOBAL excursion operators: indexed by invariant functions and tuples of Galois elements, with the same reindexing, multiplication and unit-insertion relations, over the function field of a curve. The reviewed audit AUDIT-20 records GS.5 as a duplicate of ES0, and PROTOCOL.md section 15 says a construction two layers share is planned once. The relations are identical; what differs is that GS.5 works with the Galois group of a function field and a global Hecke stack, while ES0 works with the local Weil group and the condensed enhancement. A restructuring job should decide which layer owns the shared algebra and which imports it. |

## Structural findings

### 1. This roadmap's parent layers are wired in two opposite directions, and ES1 ends up with no external suppliers

*Kind: `link-direction`.*

ES0's recorded inputs are EnhancedDerivedSheaves:E5:abstract,
HeckeStacksAndLocalShtukas:HS1 and HS4, LanglandsParameterStacks:LP2:excursion-
presentation, SmoothRepresentationsOfLocalGroups:SR.0 and
VStackSheavesAndLisseCategories:VS4, and ES0 SUPPLIES its child ES0:classical-center.
ES1's recorded inputs, by contrast, are its own two children ES1:finite-ramification and
ES1:spectral-center, and it has no external supplier at all; its only consumer is
SmoothRepresentationsOfLocalGroups:SR.6. So within one roadmap a parent layer supplies
its child in one case and is supplied by its children in the other. The consequence is
not cosmetic: ES1's content - the definitions of the spectral centre, the geometric
centre and the Hecke-compatible part - quotes LanglandsParameterStacks and
VStackSheavesAndLisseCategories throughout, and a reader following the link graph would
conclude that it rests on nothing outside this roadmap. The nodes of this packet that
realise ES1 name LP2:excursion-presentation, LP2:integral-invariants, LP0, VS4, VS3,
HS1, HS4 and E5:abstract as prerequisites, and all eight are filed as requests here. A
kind:link or kind:restructure job should settle the convention for parent layers and,
whichever way it settles it, give ES1 the external edges its own text needs.

### 2. ES4's stage text names four inputs that the atlas does not record

*Kind: `missing-links`.*

ES4's text begins 'Inputs: ES1's eligible center map, ES2 or ES3 according to
coefficients, VS5, GS4 duality, and HS3 for local-shtuka applications.' The atlas
records ES4's inputs as ExcursionOperatorsAndSpectralAction:ES2 and ES3,
LanglandsParameterStacks:LP4 and VStackSheavesAndLisseCategories:VS4. Four of the five
named inputs are therefore absent from the link graph: ES1:spectral-center,
VStackSheavesAndLisseCategories:VS5, GeometricSatakeAndFusion:GS4:integral-dual-group
and HeckeStacksAndLocalShtukas:HS3. Every one of them is used by the nodes of this
packet that realise ES4: the duality node cannot be stated without VS5's D_BZ and GS4's
Chevalley involution, the elliptic node consumes ES1's component decomposition, and the
local-shtuka obligation cannot be met at all without HS3. A kind:link job should draw
all four edges. The same check finds a fifth missing edge elsewhere in this roadmap:
every excursion datum is built from an object of Rep((G-hat semidirect Q)^I), so
GS4:integral-dual-group is an input of ES0, ES2 and ES3 as well, and the atlas records
no edge from it to any of them.

### 3. ES4's demand for a general spectral support asks for a definition the source does not give

*Kind: `narrow-text`.*

ES4's text asks for 'support of an object via annihilators/central functions on finite-
wild pieces, functoriality under exact triangles, retracts and coefficient change, and
the associated localization/decomposition operations in the cases justified by the
parameter-stack geometry'. Read against the source, that sentence describes two
different things, only one of which exists. The decomposition along the connected
components of Z^1(W_E,G-hat), with its idempotents and its distinction between a sum on
compact objects and a product on Ind-categories, is proved in FS IX.5 and is planned in
this packet - but it belongs to ES1:finite-ramification, whose text already claims it.
What is left for ES4 is the elliptic case of FS X.2, which is a special case of the same
decomposition rather than a general support theory. A general annihilator-based support
with the listed functoriality is not defined anywhere in Chapters VIII to X. Either
ES4's text should be narrowed to the elliptic case plus the duality square plus the
local-shtuka consequences, or the general support should be named as a new obligation
with a source; the natural candidate is the nilpotent singular support of FS VIII.2.2,
which Conjecture X.3.5 invokes and which no roadmap of this family currently owns.

