# The shared monoidal enhancement, Ind-completion and animated algebra

*A blueprint packet for the Tau Ceti Atlas roadmap `EnhancedDerivedSheaves`,
part `E5` (layers E5, E5:abstract, E5:presentability, E5:animation,
E5:cotangent-export, E5:spectra-comparison). Written by Claude Code, session
`cc-7b31c4`, 24 September 2026, for issue #720.*

## What this document is

The shared monoidal enhancement, Ind-completion and animated algebra: layers E5,
E5:abstract, E5:presentability, E5:animation, E5:cotangent-export and E5:spectra-
comparison. Twenty-two nodes. This roadmap has NO integrated decomposition, so every
node was written from Lurie's Higher Algebra and Higher Topos Theory, both downloaded
from the author's page, hashed and read in this session. E5:abstract plans symmetric
monoidal infinity-categories as coCartesian fibrations over finite pointed sets
satisfying the Segal condition (HA 2.0.0.7), infinity-operads with their three
conditions (2.1.1.10), O-monoidal categories (2.1.2.13), algebra objects and CAlg
(2.1.3.1), module objects through the two-coloured operad LM (4.2.1.12-13), stable
infinity-categories with the triangulated structure on the homotopy category (1.1.1.9,
1.1.2.14), the equivalence of left and right exactness (1.1.4.1), and the existence of
idempotent completions (HTT 5.1.4.1-2). E5:presentability plans compact objects (HTT
5.3.4.5), Ind (5.3.5.1), its universal property (5.3.5.10), the stability of Ind of a
stable category (HA 1.1.3.6), presentability with Simpson's characterisation (HTT
5.5.0.1), and coherent group actions. E5:animation plans sifted colimits, P_Sigma (HTT
5.5.8.10), its universal property (5.5.8.15) and animated commutative rings. The two
return layers construct nothing and say so: E5:cotangent-export re-exports
DerivedDeRhamCohomology:DD.0's interface, and E5:spectra-comparison waits on
StableHomotopyKTheory H.5; both are recorded with coverage not_read. The reviewed audit
AUDIT-22 was read first and shapes the packet throughout. Its partial verdicts name
exactly what the pinned libraries do have, and each is CITED rather than replanned: the
1-categorical Karoubi envelope, the 1-categorical monoidal categories, the 1-categorical
Ind-completion, sifted categories with the commutation of sifted colimits and finite
products, polynomial presentations of algebras, and the naive two-term cotangent complex
with the Jacobi-Zariski sequence. Twenty-three baseline declarations, all read at the
pins. Ten gaps, the largest being that BS22 - named in the stage's own source route -
could not be identified, that the coherent-group-action node has no source statement,
and that Higher Algebra Chapter 3, which gives Ind and module categories their monoidal
structures, was not read. Sixteen requests. Three structural findings.

Nothing here is formalised. Every node carries `implementationStatus: "unchecked"`,
no Lean was compiled for this job, and the suggested file is a set of signatures and
`example` statements, not a development.

## The sources, and how they were read

### Higher Algebra

- Jacob Lurie.
- `https://www.math.ias.edu/~lurie/papers/HA.pdf`
- SHA-256 `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`, accessed 2026-09-24.
- Author-hosted PDF dated September 18, 2017; 1553 pages. PDF page = printed page.

- Chapter 1, Section 1.1, printed pp. 15-35: Definition 1.1.1.9 of a stable infinity-
  category with Remark 1.1.1.10 and Example 1.1.1.11; Theorem 1.1.2.14 on the
  triangulated homotopy category with Remark 1.1.2.15 and the beginning of its proof;
  Proposition 1.1.3.6 that Ind of a stable category is stable, with its proof; and
  Section 1.1.4 with Proposition 1.1.4.1 on the equivalence of left and right exactness.
- Chapter 2, Section 2.0 and Section 2.1, printed pp. 169-183: Definition 2.0.0.7 of a
  symmetric monoidal infinity-category with the Segal condition; Definition 2.1.1.10 of
  an infinity-operad with its three conditions; Definition 2.1.2.13 of a coCartesian
  fibration of infinity-operads and Remarks 2.1.2.14 to 2.1.2.19; Definition 2.1.3.1 of
  algebra objects and of CAlg(C); and Section 2.1.4's construction of the infinity-
  category of infinity-operads.
- Chapter 4, Section 4.2.1, printed pp. 381-384: Definitions 4.2.1.1 and 4.2.1.7 of the
  operad LM, Definition 4.2.1.12 of a weak enrichment, and Definition 4.2.1.13 of left
  module objects with Remark 4.2.1.14's warning about the notation.
- NOT READ: Chapter 3 (operadic colimits), Chapter 5 onwards, and in particular Chapter
  7 on E-infinity rings, which the E5:cotangent-export and E5:spectra-comparison layers
  would need.

### Higher Topos Theory

- Jacob Lurie.
- `https://www.math.ias.edu/~lurie/papers/HTT.pdf`
- SHA-256 `58855f3a0ad6d9c470ded74a38938b9468927592e9ae1209bab6a068e67ede6e`, accessed 2026-09-24.
- Author-hosted PDF dated April 9, 2017, corresponding to the Annals of Mathematics Studies 170 edition (Princeton University Press, 2009); 949 pages. PDF page = printed page.

- Section 5.1.4, printed pp. 321-322: Definition 5.1.4.1 of an idempotent completion and
  Proposition 5.1.4.2 on its existence, with the proof; Lemma 5.1.4.3 and the pointer to
  the uniqueness statement 5.1.4.9, which was not read.
- Section 5.3.4, printed p. 392: Definition 5.3.4.5 of kappa-continuous functors and
  kappa-compact objects, with Notation 5.3.4.6.
- Section 5.3.5, printed pp. 405-407: Definition 5.3.5.1 of Ind_kappa(C), Remark 5.3.5.2
  and Proposition 5.3.5.3 on stability under filtered colimits, and Proposition 5.3.5.10
  with its statement of the universal property and the paragraph restating it;
  Proposition 5.3.5.11 located but not read.
- Section 5.5.0 and 5.5.1, printed p. 453: Definition 5.5.0.1 of presentability and the
  discussion of Simpson's Theorem 5.5.1.1, the representability criterion and the
  adjoint functor theorem.
- Section 5.5.8, printed pp. 506-509: the introduction on compact projective objects and
  nonabelian homological algebra, Proposition 5.5.8.10 with its six clauses on
  P_Sigma(C), and Proposition 5.5.8.15 with its universal property and the first line of
  its proof.
- NOT READ: Chapter 4 in its entirety, which the stage's source route names alongside
  Chapter 5; Section 5.5.9 on Quillen's simplicial formulation and the rectification
  result 5.5.9.2; and the proofs of 5.5.1.1, 5.5.2.4 and 5.5.2.9.

## What this packet does not plan, and why

Material read here that belongs elsewhere is left to its owner (PROTOCOL.md §15).

| Statement | Where | Owner |
| --- | --- | --- |
| The cotangent complex, derived exterior powers, Tor amplitude | HA/HTT, unread here | `DerivedDeRhamCohomology:DD.0` |
| Concrete spectra and spectral module categories | HA Ch. 1.4 and 7, unread | `StableHomotopyKTheory:H.5` |
| Quasicategories, coCartesian fibrations, straightening | HTT Ch. 2–3 | `EnhancedDerivedSheaves:E0` |
| Kan extensions, adjoints, presentability assertions | HTT Ch. 4 | `EnhancedDerivedSheaves:E3` |
| The generic prismatic application | — | `PrismaticCohomology:PR.0–2` |
| The perfectoidization application | — | `PerfectoidQuotients:Q0–4` |
| Derived affine, quotient and mapping stacks | — | `LanglandsParameterStacks` |

## E5 — Shared monoidal enhancement, Ind-completion and animated algebra

*Coverage: **partial**. 1 node.*

The parent layer: one node recording that E5 is an abstract branch from E0 with no
dependence on diamonds or prismatic cohomology, that it is the SINGLE enhancement
supplier for StableHomotopyKTheory, GeneralAlgebraicKTheory and the geometric-Langlands
family, and that the discipline it imposes is that every use include an actual
construction and a comparison with the existing Mathlib ordinary category rather than a
second private carrier.

### One enhancement supplier for three consumer families, and the comparison discipline it imposes

`EnhancedDerivedSheaves:E5/single-enhancement-supplier` — *comparison*

**Statement.**

E5 is an ABSTRACT BRANCH from E0, with E3 supplying presentability assertions when used,
and it has NO DEPENDENCE ON DIAMONDS OR PRISMATIC COHOMOLOGY. It is the SINGLE
ENHANCEMENT SUPPLIER for three families: StableHomotopyKTheory, GeneralAlgebraicKTheory,
and geometric local Langlands - which in the atlas means
ExcursionOperatorsAndSpectralAction, LanglandsParameterStacks,
VStackSheavesAndLisseCategories and GeometricSatakeAndFusion. The discipline this
imposes is stated by the roadmap: EVERY USE INCLUDES AN ACTUAL CONSTRUCTION AND
COMPARISON TO THE EXISTING MATHLIB ORDINARY CATEGORY RATHER THAN A SECOND PRIVATE
CARRIER. The acceptance tests the stage names are: a polynomial algebra's cotangent
module; a regular quotient's two-term cotangent complex; a nonregular quotient with
higher homology; the Ind-envelope of perfect modules; and a coherent action whose
invariants carry higher group cohomology.

**Hypotheses and warnings.**

- The comparison discipline is the substantive part: for every notion this roadmap
  builds - symmetric monoidal category, stable category, idempotent completion, Ind,
  sifted colimits - Mathlib has an ordinary counterpart, and the packet cites it and
  states the comparison rather than introducing a parallel carrier
- The independence from diamonds and prismatic cohomology is what makes E5 usable by
  StableHomotopyKTheory and GeneralAlgebraicKTheory as well; a dependence introduced
  here would propagate to both
- Two of the five acceptance tests - the cotangent ones - are
  DerivedDeRhamCohomology:DD.0's by the ownership this roadmap declares, and this packet
  does not plan them
- The stage's source route is HA sections 1 to 4, HTT sections 4 to 5, BS22 sections 2
  to 7, and FS VIII.3 and X.1. This packet read HA sections 1, 2 and 4 and HTT section 5
  for the statements it plans; BS22 was NOT identified in the maintainer's library and
  was not read

**Proof outline.**

1. Record the branch structure: abstract from E0, presentability from E3, no dependence
   on diamonds or prismatic cohomology.
2. Record the three consumer families and the single-supplier role.
3. Record the comparison discipline and check it against each node of this packet.
4. Record the five acceptance tests and which layer owns each.

**Acceptance.**

- Check that no node of this packet depends on diamonds or prismatic cohomology
- Check that every definition cites its ordinary Mathlib counterpart and states the comparison
- Check that the cotangent acceptance tests are routed to DD.0
- Check that the Ind-envelope and coherent-action tests are planned here

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:cotangent-export`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.IsSifted`, `mathlib:Algebra.Extension.H1Cotangent`

**Sources.**

- *Higher Algebra, Chapter 1 and Chapter 2 openings, printed pp. 15 and 169.* “Stable infinity-Categories ... Symmetric monoidal infinity-categories”
  The two chapters of Higher Algebra this packet reads for E5:abstract, of the four
  the stage's source route names.
- *Higher Topos Theory, Chapter 5, printed pp. 321-509.* “Presentable and accessible infinity-categories”
  The chapter of Higher Topos Theory this packet reads for E5:presentability and
  E5:animation, of the two the stage's source route names.

**What remains in this layer.**

- BS22, named in the stage's source route as sections 2 to 7, was NOT identified. The
  references catalogue and the papers listing were searched and no item matching 'BS22'
  for this material was found; the most likely candidate, Bhatt-Scholze's prismatic
  paper, has no sections on animation. The animation material is therefore planned from
  Higher Topos Theory Section 5.5.8, which is the canonical source for it and which the
  stage's route also names.
- Two of the five acceptance tests the stage names - the cotangent module of a
  polynomial algebra and the two-term cotangent complex of a regular quotient - belong
  to DerivedDeRhamCohomology:DD.0 by this roadmap's own declaration and are not planned
  here.
- Higher Topos Theory Chapter 4, which the source route names alongside Chapter 5, was
  not read.

## E5:abstract — Monoidal stable categorical baseline

*Coverage: **partial**. 8 nodes.*

Symmetric monoidal infinity-categories as coCartesian fibrations over finite pointed
sets with the Segal condition; infinity-operads with their three conditions; O-monoidal
categories and monoidal functors; algebra objects and CAlg; module objects through the
two-coloured operad LM; stable infinity-categories with the triangulated structure on
the homotopy category; the equivalence of left and right exactness; and the existence of
idempotent completions.

### HA 2.0.0.7: a symmetric monoidal infinity-category is a coCartesian fibration over finite pointed sets satisfying the Segal condition

`EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category` — *definition* · planet **Symmetric monoidal infinity-categories**

**Statement.**

A SYMMETRIC MONOIDAL infinity-category is a coCartesian fibration of simplicial sets p :
C^tensor -> N(Fin_*) with the following property: for each n >= 0, the maps rho^i : <n>
-> <1> for 1 <= i <= n induce functors rho^i_! : C^tensor_{<n>} -> C^tensor_{<1>} which
determine an EQUIVALENCE C^tensor_{<n>} = (C^tensor_{<1>})^n. Equivalently, a symmetric
monoidal infinity-category is a coCartesian fibration p : C^tensor -> N(Fin_*) which
induces equivalences C^tensor_{<n>} = C^n for each n >= 0, where C denotes the fibre
C^tensor_{<1>}. The underlying infinity-category is that fibre, and the tensor product
is the coCartesian pushforward along the active map <2> -> <1>.

**Hypotheses and warnings.**

- The datum is the TOTAL SPACE C^tensor together with the fibration, NOT a tensor
  functor on C with coherence data; the coherences are encoded by the coCartesian lifts
  and this is the whole point of the definition
- The condition marked (*) is the SEGAL CONDITION; without it p is a fibration of
  infinity-operads but not a monoidal structure
- N(Fin_*) is the nerve of the category of FINITE POINTED sets <n> = {*, 1, ..., n}, and
  the inert maps rho^i are the ones that keep only the ith element; the active maps are
  the ones that do not send anything to the base point
- An ordinary symmetric monoidal category gives one of these by the Grothendieck
  construction; the comparison with Mathlib's 1-categorical MonoidalCategory and
  BraidedCategory is part of the roadmap's requirement that every use include a
  comparison with the existing ordinary category rather than a second private carrier
- The roadmap is explicit that ordinary actions on isomorphism classes do not replace
  this data, and the same holds for a monoidal structure given as a bifunctor with
  associators

**Proof outline.**

1. Fix the category Fin_* of finite pointed sets and its nerve.
2. Define a symmetric monoidal infinity-category as a coCartesian fibration over it
   satisfying the Segal condition.
3. Read off the underlying infinity-category as the fibre over <1> and the tensor product
   as the pushforward along the unique active map <2> -> <1>.
4. Compare with the 1-categorical notion through the Grothendieck construction on the
   nerve.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `SymMonInftyCat` | data | A coCartesian fibration p : C^tensor -> N(Fin_*) satisfying the Segal condition. |
| `SymMonInftyCat.underlying` | projection | The fibre C = C^tensor_{<1>}, the underlying infinity-category. |
| `SymMonInftyCat.segal` | structure | C^tensor_{<n>} = C^n; this condition is what makes the fibration a monoidal structure rather than an operad. |
| `SymMonInftyCat.tensor` | data | The tensor product, as the coCartesian pushforward along the active map <2> -> <1>. |
| `SymMonInftyCat.ofOrdinary` | constructor | An ordinary symmetric monoidal category gives one, by the Grothendieck construction on the nerve; this is the comparison the roadmap requires. |
| `SymMonInftyCat.toMathlibMonoidal` | compatibility | On homotopy categories it recovers Mathlib's MonoidalCategory, with the same unit and associators. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:abstract/algebra-objects` — commutative algebra objects are sections of this fibration
- `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad` — the general O-monoidal notion specialises to it
- `ExcursionOperatorsAndSpectralAction:ES0` — the Hecke datum is an exact monoidal functor out of Rep((G-hat semidirect Q)^I)

**Unit tests.**

- `segal_is_required` — Without the Segal condition the datum is an infinity-operad, not a monoidal structure.
- `ordinary_example` — An ordinary symmetric monoidal category gives an example whose homotopy category is the original one.
- `tensor_is_pushforward` — The tensor product is the coCartesian pushforward along <2> -> <1>; a separately specified bifunctor with associators is a different and weaker datum.
- `unit_from_zero` — The fibre over <0> is contractible and supplies the unit.

**Acceptance.**

- Check that the Segal condition is imposed and that dropping it gives an infinity-operad instead
- Check that an ordinary symmetric monoidal category gives an example, and that the comparison recovers Mathlib's MonoidalCategory on homotopy categories
- Check that the tensor product is the pushforward along the active map and that its associativity is not extra data
- Check the case n = 0, where the fibre is contractible and gives the unit

**Prerequisites.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor`, `mathlib:SSet.Quasicategory`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:CategoryTheory.Grothendieck`

**Sources.**

- *Definition 2.0.0.7, printed p. 169.* “A symmetric monoidal infinity-category is a coCartesian fibration of simplicial sets p : C^tensor -> N(Fin_*) with the following property: (*) For each n >= 0, the maps {rho^i : <n> -> <1>}_{1 <= i <= n} induce functors rho^i_! : C^tensor_{<n>} -> C^tensor_{<1>} which determine an equivalence C^tensor_{<n>} = (C^tensor_{<1>})^n.”
  The definition, quoted verbatim from Higher Algebra read in this session; the file
  was downloaded from the author's page and its SHA-256 is recorded in the source
  entry.
- *Remark 2.1.2.19, printed p. 180.* “In other words, a symmetric monoidal infinity-category is a coCartesian fibration p : C^tensor -> N(Fin_*) which induces equivalences of infinity-categories C^tensor_{<n>} = C^n for each n >= 0, where C denotes the infinity-category C^tensor_{<1>}.”
  The same definition restated once the operadic language is available, which is how
  the packet's other nodes refer to it.

### HA 2.1.1.10: infinity-operads, inert maps and the Segal-type conditions

`EnhancedDerivedSheaves:E5:abstract/infinity-operad` — *definition* · planet **Infinity-operads**

**Statement.**

An INFINITY-OPERAD is a functor p : O^tensor -> N(Fin_*) between infinity-categories
satisfying: (1) for every INERT morphism f : <m> -> <n> in N(Fin_*) and every object C
in O^tensor_{<m>} there exists a p-coCartesian morphism f-tilde : C -> C' lifting f, so
that f induces a functor f_! : O^tensor_{<m>} -> O^tensor_{<n>}; (2) for objects C in
O^tensor_{<m>} and C' in O^tensor_{<n>}, a morphism f : <m> -> <n>, and
Map^f_{O^tensor}(C,C') the union of those connected components of Map_{O^tensor}(C,C')
lying over f, the induced map Map^f(C,C') -> product over 1 <= i <= n of Map^{rho^i
f}(C, C'_i) is a HOMOTOPY EQUIVALENCE, where the C'_i are obtained by p-coCartesian
lifts of the inert rho^i; (3) for every finite collection of objects C_1,...,C_n of O =
O^tensor_{<1>} there is an object C in O^tensor_{<n>} and p-coCartesian morphisms C ->
C_i covering the rho^i.

**Hypotheses and warnings.**

- Condition (1) asks for coCartesian lifts of INERT maps only; asking for them over all
  maps is what upgrades an infinity-operad to a monoidal infinity-category, which is the
  next node
- Condition (2) is the Segal-type condition on mapping spaces; it is what makes the
  multi-mapping spaces of the operad recoverable
- Condition (3) is essential surjectivity of the Segal maps on objects
- The colours of the operad are the objects of the fibre over <1>; a one-coloured operad
  is one whose fibre over <1> is contractible
- Mathlib has NO operads at all: AUDIT-22 records that a grep for 'operad', 'Gamma
  space' and 'E-infinity' finds nothing but a bibliography entry

**Proof outline.**

1. Fix N(Fin_*) with its inert and active morphisms.
2. Impose the three conditions on a functor p : O^tensor -> N(Fin_*).
3. Read off the colours and the multi-mapping spaces.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `InftyOperad` | data | A functor p : O^tensor -> N(Fin_*) satisfying the three conditions. |
| `InftyOperad.inertLifts` | structure | coCartesian lifts of INERT maps only; this is what distinguishes an operad from a monoidal structure. |
| `InftyOperad.segalMapping` | structure | The Segal condition on mapping spaces, condition (2). |
| `InftyOperad.colours` | projection | The fibre over <1>; a one-coloured operad has contractible fibre. |
| `InftyOperad.commutative` | example | N(Fin_*) with the identity is the commutative infinity-operad. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad` — O-monoidal categories are fibrations over an operad
- `EnhancedDerivedSheaves:E5:abstract/algebra-objects` — algebras are maps of operads
- `EnhancedDerivedSheaves:E5:abstract/module-objects` — modules are algebras over the operad LM

**Unit tests.**

- `inert_only` — Requiring coCartesian lifts over all maps gives a monoidal structure, not a general operad.
- `commutative_operad` — N(Fin_*) with the identity map is an infinity-operad.
- `symmetric_monoidal_is_operad` — Every symmetric monoidal infinity-category is an infinity-operad.
- `no_operads_in_mathlib` — Neither pinned library has operads at all; this is planned and not cited.

**Acceptance.**

- Check that only inert maps are required to have coCartesian lifts
- Check that the commutative operad N(Fin_*) itself satisfies the conditions
- Check that a symmetric monoidal infinity-category is an infinity-operad with coCartesian lifts of all maps
- Check that the multi-mapping spaces are recovered from condition (2)

**Prerequisites.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `mathlib:CategoryTheory.Functor`, `mathlib:SSet.Quasicategory`, `mathlib:CategoryTheory.Limits.HasLimits`

**Sources.**

- *Definition 2.1.1.10, printed p. 172.* “An infinity-operad is a functor p : O^tensor -> N(Fin_*) between infinity-categories which satisfies the following conditions: (1) For every inert morphism f : <m> -> <n> in N(Fin_*) and every object C in O^tensor_{<m>}, there exists a p-coCartesian morphism f-tilde : C -> C' in O^tensor lifting f. In particular, f induces a functor f_! : O^tensor_{<m>} -> O^tensor_{<n>}.”
  The definition's first condition, quoted verbatim from Higher Algebra read in this
  session.
- *Definition 2.1.1.10, printed p. 172.* “(2) Let C in O^tensor_{<m>} and C' in O^tensor_{<n>} be objects, let f : <m> -> <n> be a morphism in Fin_*, and let Map^f_{O^tensor}(C,C') be the union of those connected components of Map_{O^tensor}(C,C') which lie over f. Choose p-coCartesian morphisms C' -> C'_i lying over the inert morphisms rho^i : <n> -> <1> for 1 <= i <= n. Then the induced map Map^f(C,C') -> product of ...”
  The remaining two conditions, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.

### HA 2.1.2.13: O-monoidal infinity-categories as coCartesian fibrations of infinity-operads

`EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad` — *definition* · planet **O-monoidal infinity-categories**

**Statement.**

Let O^tensor be an infinity-operad. A map p : C^tensor -> O^tensor is a COCARTESIAN
FIBRATION OF INFINITY-OPERADS if it satisfies the hypotheses of Proposition 2.1.2.12; in
that case p EXHIBITS C^tensor AS AN O-MONOIDAL INFINITY-CATEGORY. Such a p is in
particular a fibration of infinity-operads. For an object X in O = O^tensor_{<1>} one
writes C_X for the fibre; if X in O^tensor_{<n>} corresponds to a sequence (X_i), there
is a canonical equivalence C_X = product over i of C_{X_i}. The underlying map C^tensor
-> O^tensor is a coCartesian fibration of infinity-categories, classified by a functor
O^tensor -> Cat_infinity, so an O-monoidal infinity-category may be thought of as an
assignment of a category to each colour together with coherent multiplication functors.

**Hypotheses and warnings.**

- The general notion specialises to the symmetric monoidal one by taking O^tensor =
  N(Fin_*); Remark 2.1.2.19 spells the specialisation out
- The classifying functor O^tensor -> Cat_infinity is the 'straightening' of the
  fibration; it is equivalent data, but the fibration is the one with no coherence to
  check, which is why it is the definition
- The product decomposition C_X = product of C_{X_i} is the Segal condition again, now
  relative to O
- The roadmap asks for 'monoidal functors with their coherent universal properties';
  those are maps of O-monoidal categories, that is functors over O^tensor preserving
  coCartesian edges

**Proof outline.**

1. Fix an infinity-operad O^tensor and a map p : C^tensor -> O^tensor.
2. Impose the conditions of Proposition 2.1.2.12, which say that p has coCartesian lifts
   of all morphisms and that the resulting structure is compatible with the operadic one.
3. Read off the fibres, the product decomposition and the classifying functor to
   Cat_infinity.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `OMonoidal` | data | A coCartesian fibration of infinity-operads p : C^tensor -> O^tensor. |
| `OMonoidal.fibre` | projection | C_X for X in O^tensor, with C_X = product of C_{X_i} for X over <n>. |
| `OMonoidal.classify` | equivalence | The classifying functor O^tensor -> Cat_infinity; equivalent data, with coherences straightened. |
| `OMonoidal.functor` | data | A monoidal functor: a map over O^tensor preserving coCartesian edges. |
| `OMonoidal.symmetricCase` | example | O^tensor = N(Fin_*) gives the symmetric monoidal notion. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:abstract/algebra-objects` — algebras are sections of such a fibration
- `ExcursionOperatorsAndSpectralAction:ES2` — the Hecke data are monoidal functors into endofunctor categories
- `GeometricSatakeAndFusion:GS4:integral-dual-group` — the Satake category is a symmetric monoidal infinity-category in this sense

**Unit tests.**

- `specialises_to_symmetric` — Taking O = N(Fin_*) gives the symmetric monoidal notion.
- `fibre_product_decomposition` — C_X = product of C_{X_i} over the colours of X.
- `monoidal_functor_is_coCartesian` — A monoidal functor preserves coCartesian edges; a functor merely commuting with tensor up to isomorphism is weaker.
- `straightening_equivalence` — The fibration and the classifying functor are equivalent data.

**Acceptance.**

- Check that O^tensor = N(Fin_*) recovers the symmetric monoidal notion
- Check the product decomposition of the fibres
- Check that a monoidal functor is a functor over O^tensor preserving coCartesian edges
- Check that the classifying functor to Cat_infinity is equivalent data

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Grothendieck`

**Sources.**

- *Definition 2.1.2.13, printed p. 179.* “Let O^tensor be an infinity-operad. We will say that a map p : C^tensor -> O^tensor is a coCartesian fibration of infinity-operads if it satisfies the hypotheses of Proposition 2.1.2.12. In this case, we also say that p exhibits C^tensor as an O-monoidal infinity-category.”
  The definition, quoted verbatim from Higher Algebra read in this session.
- *Remarks 2.1.2.16 and 2.1.2.17, printed p. 179.* “For every object X in O^tensor, we let C_X denote the inverse image of X under p. ... Note that if X in O^tensor_{<n>} corresponds to a sequence of objects {X_i} in O, then we have a canonical equivalence C_X = product over 1 <= i <= n of C_{X_i}. ... Then the underlying map C^tensor -> O^tensor is a coCartesian fibration of infinity-categories, which is classified by a ...”
  The fibres, their product decomposition and the classifying functor, quoted
  verbatim. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### HA 2.1.3.1: algebra objects, and commutative algebras as sections over N(Fin_*)

`EnhancedDerivedSheaves:E5:abstract/algebra-objects` — *construction* · planet **Algebra objects**

**Statement.**

Let p : C^tensor -> O^tensor be a fibration of infinity-operads and alpha : O'^tensor ->
O^tensor a map of infinity-operads. Then Alg_{O'/O}(C) denotes the FULL SUBCATEGORY OF
Fun_{O^tensor}(O'^tensor, C^tensor) SPANNED BY THE MAPS OF INFINITY-OPERADS;
equivalently, the fibre over alpha of the categorical fibration Alg_{O'}(C^tensor) ->
Alg_{O'}(O^tensor) given by composition with p. When O' = O and alpha is the identity
one writes Alg_{/O}(C); when O' = O = N(Fin_*) one writes CAlg(C), THE INFINITY-CATEGORY
OF COMMUTATIVE ALGEBRA OBJECTS of C. So a commutative algebra object is a SECTION of the
fibration C^tensor -> N(Fin_*) which is a map of infinity-operads, that is, which sends
inert maps to coCartesian edges.

**Hypotheses and warnings.**

- An algebra object is a SECTION, not an object with multiplication maps; the coherence
  is the condition that the section be a map of operads, and that is the whole content
  of the definition
- The condition 'map of infinity-operads' is exactly that inert morphisms go to
  p-coCartesian ones; without it one gets a lax algebra
- CAlg(C) for C an ordinary symmetric monoidal category recovers the ordinary
  commutative monoid objects on homotopy categories, and the roadmap requires that
  comparison to be made rather than a second carrier introduced
- Mathlib has 1-categorical Mon_ and CommMon_ objects in a monoidal category; those are
  the ordinary shadow of this construction

**Proof outline.**

1. Form Fun_{O^tensor}(O'^tensor, C^tensor) and cut out the maps of infinity-operads.
2. Identify the result with a fibre of the induced map on algebra categories.
3. Specialise to O' = O and to O = N(Fin_*) to get CAlg(C).

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Alg` | data | Alg_{O'/O}(C), the maps of infinity-operads over O^tensor. |
| `CAlg` | data | CAlg(C) = Alg_{N(Fin_*)}(C), the commutative algebra objects. |
| `CAlg.isSection` | characterisation | A commutative algebra object is a section of C^tensor -> N(Fin_*) sending inert maps to coCartesian edges. |
| `CAlg.unit` | example | The unit of C is the initial commutative algebra object. |
| `CAlg.toCommMon` | compatibility | On homotopy categories this recovers Mathlib's CommMon_ objects; the comparison is required and not a second carrier. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:abstract/module-objects` — modules are taken over an algebra object
- `EnhancedDerivedSheaves:E5:animation` — animated commutative rings are the commutative algebra objects that arise from polynomial resolutions
- `LanglandsParameterStacks:LP1` — the cocycle algebra is a commutative algebra object in the relevant category

**Unit tests.**

- `section_not_multiplication` — An algebra object is a section of the fibration; an object with multiplication maps and coherences is the unstraightened shadow.
- `inert_to_coCartesian` — The operad condition is that inert maps go to coCartesian edges; dropping it gives lax algebras.
- `unit_is_initial` — The unit is the initial commutative algebra object.
- `ordinary_comparison` — For an ordinary symmetric monoidal category the homotopy category of CAlg is the ordinary commutative monoid objects.

**Acceptance.**

- Check that a commutative algebra object is a section sending inert maps to coCartesian edges
- Check the comparison with Mathlib's CommMon_ on homotopy categories
- Check that the unit of a symmetric monoidal infinity-category is the initial commutative algebra
- Check that a lax monoidal functor out of the trivial operad is the same as an algebra object

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E0`, `mathlib:CommMonCat`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Definition 2.1.3.1, printed p. 182.* “Let p : C^tensor -> O^tensor be a fibration of infinity-operads, and suppose we are given infinity-operads alpha : O'^tensor -> O^tensor. We let Alg_{O'/O}(C) denote the full subcategory of Fun_{O^tensor}(O'^tensor, C^tensor) spanned by the maps of infinity-operads. ... In the special case where O' = O = N(Fin_*), we will denote the infinity-category Alg_{O'/O}(C) by CAlg(C). ...”
  The definition, quoted verbatim from Higher Algebra read in this session. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.

### HA 4.2.1.12-4.2.1.13: modules over an algebra, through the operad LM

`EnhancedDerivedSheaves:E5:abstract/module-objects` — *construction*

**Statement.**

Let C^tensor -> Assoc be a fibration of infinity-operads and M an infinity-category. A
WEAK ENRICHMENT of M over C is a fibration of infinity-operads q : O^tensor -> LM
together with isomorphisms O^tensor_a = C^tensor and O^tensor_m = M, where LM is the
infinity-operad of Definition 4.2.1.7 with two colours a and m. Given such a q, one sets
LMod(M) = Alg_{/LM}(O), THE INFINITY-CATEGORY OF LEFT MODULE OBJECTS of M. Composition
with the inclusion Assoc -> LM determines a categorical fibration LMod(M) -> Alg(C), and
for an algebra object A of C one sets LModA(M) to be the fibre over A, the infinity-
category of LEFT A-MODULE OBJECTS of M.

**Hypotheses and warnings.**

- The notation LMod(M) is, as Lurie warns, ABUSIVE: the category depends not only on M
  but on the fibration M -> LM, that is on the chosen enrichment
- Modules are algebras over a TWO-COLOURED operad; that is how the module structure and
  its coherences are encoded, and it is why no separate coherence data appear
- The forgetful map to Alg(C) is a categorical fibration, so that the fibre over an
  algebra is the right notion of modules over it
- For a symmetric monoidal C one gets the usual Mod_A(C); the roadmap's requirement of a
  comparison with the ordinary notion applies here as everywhere

**Proof outline.**

1. Fix the two-coloured operad LM and the notion of weak enrichment.
2. Define LMod(M) as the algebras over LM in the enrichment.
3. Take the fibre over an algebra object A to get LModA(M).

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `LMod` | data | LMod(M) = Alg_{/LM}(O) for a weak enrichment of M over C. |
| `LMod.dependsOnEnrichment` | structure | The construction depends on the fibration M -> LM, not only on M; Lurie's own warning. |
| `LMod.toAlg` | projection | The categorical fibration LMod(M) -> Alg(C). |
| `LModA` | data | The fibre over an algebra A: the left A-modules. |
| `LMod.ordinaryComparison` | compatibility | For an ordinary monoidal category this recovers the ordinary modules on homotopy categories. |

**Where it is used.**

- `LanglandsParameterStacks:LP4` — IndPerf of the parameter stack is identified with modules over the cocycle algebra
- `EnhancedDerivedSheaves:E5:presentability` — module and base-change compatibilities are stated for these categories
- `ExcursionOperatorsAndSpectralAction:ES3` — the integral spectral action is an action by a module category

**Unit tests.**

- `depends_on_enrichment` — Two different enrichments of the same M give different module categories.
- `usual_modules` — For C symmetric monoidal and M = C one recovers Mod_A(C).
- `fibration_to_alg` — The forgetful functor is a categorical fibration, so fibres are the right notion.
- `ordinary_comparison` — On homotopy categories this is the ordinary module category.

**Acceptance.**

- Check that the construction depends on the enrichment and not only on M
- Check that for C symmetric monoidal and M = C one recovers the usual modules
- Check that the forgetful functor to Alg(C) is a categorical fibration
- Check the comparison with ordinary modules on homotopy categories

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E0`, `mathlib:CommMonCat`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Functor`

**Sources.**

- *Definition 4.2.1.12, printed p. 383.* “Let C^tensor -> Assoc be a fibration of infinity-operads and let M be an infinity-category. A weak enrichment of M over C is a fibration of infinity-operads q : O^tensor -> LM together with isomorphisms O^tensor_a = C^tensor and O^tensor_m = M. In this situation, we will say that q exhibits M as weakly enriched over C.”
  The enrichment datum, quoted verbatim from Higher Algebra read in this session.
- *Definition 4.2.1.13 and Remark 4.2.1.14, printed p. 383.* “We let LMod(M) denote the infinity-category Alg_{/LM}(O). We will refer to LMod(M) as the infinity-category of left module objects of M. Composition with the inclusion Assoc -> LM determines a categorical fibration LMod(M) -> Alg(C). If A is an algebra object of C, we let LModA(M) denote the fibre LMod(M) x_{Alg(C)} {A}. ... The notation of Definition 4.2.1.13 is somewhat ...”
  The definition and Lurie's own warning about the notation, quoted verbatim. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.

### HA 1.1.1.9 and 1.1.2.14: stable infinity-categories and their triangulated homotopy categories

`EnhancedDerivedSheaves:E5:abstract/stable-infinity-category` — *definition* · planet **Stable infinity-categories**

**Statement.**

An infinity-category C is STABLE if: (1) there exists a zero object 0 in C; (2) every
morphism in C admits a FIBER and a COFIBER; (3) a triangle in C is a fiber sequence if
and only if it is a cofiber sequence. Condition (3) is the analogue of the axiom for
abelian categories requiring the image of a morphism to be isomorphic to its coimage.
Moreover, if C is a pointed infinity-category admitting cofibers and the suspension
functor is an equivalence, then the translation functor and the class of distinguished
triangles ENDOW THE HOMOTOPY CATEGORY hC WITH THE STRUCTURE OF A TRIANGULATED CATEGORY;
those hypotheses hold whenever C is stable, and are in fact EQUIVALENT to stability.

**Hypotheses and warnings.**

- Stability is a PROPERTY of an infinity-category, not extra structure; this is the
  fundamental contrast with the 1-categorical notion of a triangulated category, where
  the distinguished triangles are data
- The homotopy category is triangulated, and Mathlib HAS triangulated categories with
  distinguished triangles and Verdier localisation; the comparison must go through hC,
  and the roadmap requires exactly such a comparison rather than a second private
  carrier
- The equivalence of stability with the hypotheses of Theorem 1.1.2.14 is Corollary
  1.4.2.27, which was not read
- The verification of Verdier's axioms (TR1) to (TR4) is the content of the proof of
  Theorem 1.1.2.14, and the octahedral axiom (TR4) is the one that is genuinely easier
  here than classically

**Proof outline.**

1. Define stability by the three conditions.
2. Define the translation functor by suspension and the distinguished triangles by the
   cofiber sequences.
3. Verify Verdier's axioms on the homotopy category.
4. Record the comparison with Mathlib's triangulated categories.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsStable` | data | Zero object; every morphism has a fiber and a cofiber; fiber sequences are cofiber sequences. |
| `IsStable.isProperty` | structure | Stability is a PROPERTY, not structure; contrast with a triangulated category, where the triangles are data. |
| `IsStable.homotopyCategory` | compatibility | hC is triangulated, matching Mathlib's Pretriangulated and Triangulated structures. |
| `IsStable.suspension` | equivalence | The suspension functor is an equivalence, and that together with cofibers characterises stability. |
| `IsStable.derivedCategory` | example | The derived category of an abelian category is stable; Mathlib's DerivedCategory is its homotopy category. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:abstract/exact-functors` — exactness is defined for functors between stable categories
- `EnhancedDerivedSheaves:E5:presentability` — Ind of a stable category is stable
- `ExcursionOperatorsAndSpectralAction:ES2` — every category the spectral action acts on is stable

**Unit tests.**

- `property_not_structure` — Stability is a property; a triangulated structure is data, and two different triangulations of the same category are possible classically.
- `homotopy_is_triangulated` — hC is triangulated; the comparison with Mathlib's structure must be made.
- `derived_category_example` — The derived category of an abelian category is stable.
- `suspension_equivalence` — In a stable category the suspension is an equivalence; in a merely pointed one it need not be.

**Acceptance.**

- Check that stability is a property and not extra data
- Check that the homotopy category is triangulated and matches Mathlib's structure
- Check that the derived category of an abelian category gives an example
- Check that a nonzero stable category has a nontrivial suspension equivalence

**Prerequisites.** `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E1`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:DerivedCategory`, `mathlib:CategoryTheory.Limits.HasZeroObject`, `mathlib:CategoryTheory.HasShift`

**Sources.**

- *Definition 1.1.1.9, printed p. 19.* “An infinity-category C is stable if it satisfies the following conditions: (1) There exists a zero object 0 in C. (2) Every morphism in C admits a fiber and a cofiber. (3) A triangle in C is a fiber sequence if and only if it is a cofiber sequence.”
  The definition, quoted verbatim from Higher Algebra read in this session.
- *Remark 1.1.1.10, printed p. 20.* “Condition (3) of Definition 1.1.1.9 is analogous to the axiom for abelian categories which requires that the image of a morphism be isomorphic to its coimage.”
  Why condition (3) is the right one.
- *Theorem 1.1.2.14 and Remark 1.1.2.15, printed p. 27.* “Let C be a pointed infinity-category which admits cofibers, and suppose that the suspension functor is an equivalence. Then the translation functor and the class of distinguished triangles endow hC with the structure of a triangulated category. ... The hypotheses of Theorem 1.1.2.14 hold whenever C is stable. In fact, the hypotheses of Theorem 1.1.2.14 are equivalent to the ...”
  The triangulated structure on the homotopy category, quoted verbatim. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.

### HA 1.1.4.1: for functors between stable categories, left exact, right exact and exact agree

`EnhancedDerivedSheaves:E5:abstract/exact-functors` — *theorem*

**Statement.**

Let F : C -> C' be a functor between stable infinity-categories. If F carries zero
objects to zero objects then it carries triangles to triangles; if in addition it
carries fiber sequences to fiber sequences, F is called EXACT. The following are
EQUIVALENT: (1) F is LEFT EXACT, that is F commutes with finite limits; (2) F is RIGHT
EXACT, that is F commutes with finite colimits; and these are equivalent to exactness.

**Hypotheses and warnings.**

- The equivalence of left and right exactness is special to the stable setting and is
  the reason one may speak simply of 'exact functors'
- Preservation of zero objects is assumed; a functor that does not preserve the zero
  object is not exact in any of these senses
- In the 1-categorical world the analogue is that an additive functor between
  triangulated categories is triangulated iff it commutes with the shift and sends
  triangles to triangles, which is a weaker and less well behaved condition
- This is the notion of exactness used everywhere in the consumer roadmaps: 'an exact
  Rep(Q^I)-linear monoidal functor' in the spectral-action statements means exactly this

**Proof outline.**

1. Note that a functor preserving zero objects carries triangles to triangles.
2. Prove the equivalence of left and right exactness using that fiber and cofiber
   sequences coincide.
3. Record that either condition is equivalent to exactness.

**Acceptance.**

- Check that left and right exactness agree for functors between stable categories
- Check that a functor not preserving the zero object is not exact
- Check that the induced functor on homotopy categories is triangulated
- Check the example of a localisation functor

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E0`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Limits.PreservesLimits`, `mathlib:CategoryTheory.Pretriangulated`

**Sources.**

- *Section 1.1.4 and Proposition 1.1.4.1, printed p. 33.* “Let F : C -> C' be a functor between stable infinity-categories. Suppose that F carries zero objects into zero objects. It follows immediately that F carries triangles into triangles. If, in addition, F carries fiber sequences to fiber sequences, then we will say that F is exact. ... The following conditions are equivalent: (1) The functor F is left exact. That is, F commutes ...”
  The definition and the equivalence, quoted verbatim from Higher Algebra read in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### HTT 5.1.4.1-5.1.4.2: every infinity-category admits an idempotent completion, unique up to equivalence

`EnhancedDerivedSheaves:E5:abstract/idempotent-completion` — *theorem* · planet **Idempotent completion**

**Statement.**

A functor f : C -> D EXHIBITS D AS AN IDEMPOTENT COMPLETION of C if D is idempotent
complete, f is fully faithful, and every object of D is a RETRACT of f(C) for some
object C of C. Every infinity-category C ADMITS an idempotent completion, and it is
UNIQUE UP TO EQUIVALENCE. The existence is proved by taking C' to be the full
subcategory of the presheaf category P(C) spanned by the retracts of objects in the
image of the Yoneda embedding: P(C) admits all small colimits, hence is idempotent
complete; C' is stable under retracts in P(C), hence idempotent complete; and the Yoneda
embedding is fully faithful and therefore exhibits C' as the idempotent completion.

**Hypotheses and warnings.**

- The idempotent completion is the KAROUBI ENVELOPE in the infinity-categorical sense,
  and it is what 'idempotent-complete' means in every hypothesis of the consumer
  roadmaps
- Mathlib HAS the 1-categorical Karoubi envelope with its universal property; AUDIT-22
  records this as the partial half of the target, the missing half being the stable
  structure on idempotent completions and the infinity-categorical version
- The construction embeds C into presheaves and cuts out retracts; the enlargement of
  universe in the proof is a size issue and not a mathematical one
- Uniqueness is Proposition 5.1.4.9, which was not read; only the existence proof was

**Proof outline.**

1. Define an idempotent completion by the three conditions.
2. Construct one as the retract-closure of the Yoneda image inside presheaves.
3. Note that presheaves are idempotent complete because they admit all small colimits,
   and that a retract-closed subcategory of an idempotent complete category is idempotent
   complete.
4. Quote the uniqueness.

**Acceptance.**

- Check that the construction gives an idempotent complete category
- Check that the Yoneda embedding is fully faithful and that every object is a retract
- Check the comparison with Mathlib's 1-categorical Karoubi envelope
- Check that the idempotent completion of an idempotent complete category is itself

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.yoneda`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- *Definition 5.1.4.1, printed p. 321.* “Let f : C -> D be a functor between infinity-categories. We will say that f exhibits D as an idempotent completion of C if D is idempotent complete, f is fully faithful, and every object of D is a retract of f(C) for some object C in C.”
  The definition, quoted verbatim from Higher Topos Theory read in this session; the
  file was downloaded from the author's page and its SHA-256 is recorded in the source
  entry.
- *Proposition 5.1.4.2 with its proof, printed p. 321.* “Let C be an infinity-category. Then C admits an idempotent completion. Proof. Enlarging the universe if necessary, we may suppose that C is small. Let C' denote the full subcategory of P(C) spanned by those objects which are retracts of objects which belong to the image of the Yoneda embedding j : C -> P(C). Then C' is stable under retracts in P(C). Since P(C) admits all small ...”
  The existence, with its proof, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.

**What remains in this layer.**

- Proposition 2.1.2.12, whose hypotheses define a coCartesian fibration of infinity-
  operads, was located but its statement was not recovered cleanly from the extraction;
  the node states the definition as Lurie does, by reference to that proposition, and
  does not restate its conditions.
- Corollary 1.4.2.27, which gives the converse that the hypotheses of Theorem 1.1.2.14
  are equivalent to stability, was not read.
- The uniqueness of idempotent completions, Proposition 5.1.4.9, was not read; only the
  existence and its proof.
- Higher Algebra Chapter 3, on operadic colimits and the tensor product of infinity-
  operads, was not read; it is what would be needed to construct the symmetric monoidal
  structure on Ind and on module categories.
- AUDIT-22 records that neither library has infinity-operads, stable infinity-categories
  or E-infinity structures; the two partial targets are the 1-categorical Karoubi
  envelope and the 1-categorical monoidal structures, both of which are cited here.

## E5:presentability — Ind-completion and extensions

*Coverage: **partial**. 6 nodes.*

Compact objects and continuous functors; the Ind-completion with its stability under
filtered colimits; its universal property, which is the extension of a functor to a
continuous functor; the stability of Ind of a stable category; presentability with
Simpson's characterisation and the adjoint functor theorem it yields; and coherent group
actions with homotopy fixed points and equivariant functor categories.

### HTT 5.3.4.5: kappa-compact objects and kappa-continuous functors

`EnhancedDerivedSheaves:E5:presentability/compact-objects` — *definition*

**Statement.**

Let C be an infinity-category admitting small kappa-filtered colimits. A functor f : C
-> D is KAPPA-CONTINUOUS if it preserves kappa-filtered colimits. For an object C of C,
let j_C : C -> S-hat be the functor corepresented by C; if C admits kappa-filtered
colimits, C is KAPPA-COMPACT if j_C is kappa-continuous, and simply COMPACT if it is
omega-compact. One writes C^kappa for the full subcategory spanned by the kappa-compact
objects, and C^omega for the compact objects.

**Hypotheses and warnings.**

- Compactness is defined by corepresentability commuting with FILTERED colimits, not
  with all colimits; the distinction is what makes compact generation a nontrivial
  condition
- The functor is corepresented in the LARGE category S-hat of spaces, because the
  mapping spaces need not be small before one knows C is accessible
- Mathlib has finitely presentable objects and 1-categorical Ind-objects; AUDIT-22
  records that this is the partial half of the target and that the infinity-categorical
  Ind-completion and the compact-generation compatibilities are missing
- In the consumer roadmaps, D_lis(Bun_G,Lambda)^omega and Perf are compact objects in
  this sense, and the whole spectral-action formalism is stated on them

**Proof outline.**

1. Define kappa-continuity as preservation of kappa-filtered colimits.
2. Define kappa-compactness of an object by kappa-continuity of the corepresented
   functor.
3. Record the full subcategory of kappa-compact objects.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsKappaCompact` | data | The corepresented functor preserves kappa-filtered colimits. |
| `IsCompact` | data | The omega case; the notion every consumer roadmap uses. |
| `compactObjects` | data | C^omega, the full subcategory of compact objects. |
| `IsCompact.retract` | structure | A retract of a compact object is compact. |
| `IsCompact.ofFinitelyPresentable` | compatibility | On an ordinary category this recovers Mathlib's finitely presentable objects. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:presentability/ind-completion` — Ind is generated by the compact objects
- `LanglandsParameterStacks:LP4` — Perf and its compact objects are the subject of the generation statement
- `ExcursionOperatorsAndSpectralAction:ES2` — the spectral action is on the compact objects of D_lis(Bun_G,L)

**Unit tests.**

- `filtered_not_all` — Compactness is about filtered colimits; preservation of all colimits is a different condition.
- `finite_sets` — In spaces, the compact objects are the finite ones up to retract.
- `retracts` — A retract of a compact object is compact.
- `ordinary_comparison` — On an ordinary category this is Mathlib's finite presentability.

**Acceptance.**

- Check that compactness is about filtered colimits and not about all colimits
- Check that in the category of sets the compact objects are the finite sets
- Check that a retract of a compact object is compact
- Check the comparison with Mathlib's finitely presentable objects on ordinary categories

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E0`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.yoneda`

**Sources.**

- *Definition 5.3.4.5, printed p. 392.* “Let C be an infinity-category which admits small kappa-filtered colimits. We will say a functor f : C -> D is kappa-continuous if it preserves kappa-filtered colimits. Let C be an infinity-category containing an object C and let j_C : C -> S-hat denote the functor corepresented by C. If C admits kappa-filtered colimits, then we will say that C is kappa-compact if j_C is ...”
  The definition, quoted verbatim from Higher Topos Theory read in this session. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.

### HTT 5.3.5.1: the Ind-completion, and its stability under filtered colimits

`EnhancedDerivedSheaves:E5:presentability/ind-completion` — *definition* · planet **The Ind-completion**

**Statement.**

Let C be a small infinity-category and kappa a regular cardinal. Ind_kappa(C) is the
FULL SUBCATEGORY OF THE PRESHEAF CATEGORY P(C) spanned by those functors f : C^op -> S
which classify right fibrations C-tilde -> C with C-tilde kappa-FILTERED. For kappa =
omega one writes Ind(C), THE INFINITY-CATEGORY OF IND-OBJECTS of C. The Yoneda embedding
j : C -> P(C) factors through Ind_kappa(C), since j(C) classifies the right fibration
C_{/C} -> C and C_{/C} has a final object and is therefore kappa-filtered. The full
subcategory Ind_kappa(C) inside P(C) is STABLE UNDER kappa-FILTERED COLIMITS.

**Hypotheses and warnings.**

- Ind is defined inside PRESHEAVES by a filteredness condition on the classifying right
  fibration, not as a formal colimit completion; the two descriptions agree but only the
  first is a definition
- The Yoneda embedding lands in Ind because slice categories have final objects; this is
  what makes C a full subcategory of Ind(C)
- Mathlib has `CategoryTheory.Ind`, the 1-categorical Ind-completion, in
  Mathlib/CategoryTheory/Limits/Indization/Category.lean; AUDIT-22 records it as the
  partial half and the infinity-categorical version as missing. The comparison with it
  is the roadmap's requirement
- Stability under kappa-filtered colimits is what makes Ind_kappa(C) admit them

**Proof outline.**

1. Form the presheaf category P(C).
2. Cut out the functors whose classifying right fibration is kappa-filtered.
3. Check that the Yoneda embedding factors through, and that the subcategory is stable
   under kappa-filtered colimits.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Ind` | data | Ind_kappa(C) inside P(C): the presheaves classifying kappa-filtered right fibrations. |
| `Ind.yoneda` | structure | The Yoneda embedding factors through Ind; C is a full subcategory. |
| `Ind.stableUnderFilteredColimits` | structure | Ind_kappa(C) is stable under kappa-filtered colimits in P(C). |
| `Ind.admitsFilteredColimits` | structure | Hence Ind_kappa(C) admits kappa-filtered colimits. |
| `Ind.toMathlibInd` | compatibility | On an ordinary category this recovers Mathlib's CategoryTheory.Ind. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind` — the universal property is about this category
- `EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable` — stability is proved for it
- `LanglandsParameterStacks:LP4` — IndPerf of the parameter stack is Ind of Perf

**Unit tests.**

- `yoneda_factors` — The Yoneda embedding lands in Ind; C is full in Ind(C).
- `filtered_stability` — Ind is stable under filtered colimits inside presheaves.
- `ordinary_comparison` — On an ordinary category this is Mathlib's Ind.
- `not_idempotent` — Ind of a category that already has filtered colimits is strictly larger in general.

**Acceptance.**

- Check that the Yoneda embedding factors through Ind
- Check stability under filtered colimits
- Check the comparison with Mathlib's 1-categorical Ind on ordinary categories
- Check that Ind of a category with filtered colimits is not itself

**Prerequisites.** `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E0`, `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.yoneda`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- *Definition 5.3.5.1, printed p. 405.* “Let C be a small infinity-category and let kappa be a regular cardinal. We let Ind_kappa(C) denote the full subcategory of P(C) spanned by those functors f : C^op -> S which classify right fibrations C-tilde -> C, where the infinity-category C-tilde is kappa-filtered. In the case where kappa = omega, we will simply write Ind(C) for Ind_omega(C). We will refer to Ind_kappa(C) ...”
  The definition, quoted verbatim from Higher Topos Theory read in this session. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Remark 5.3.5.2 and Proposition 5.3.5.3, printed p. 405.* “the Yoneda embedding j : C -> P(C) factors through Ind_kappa(C). This follows immediately from Lemma 5.1.5.2, since j(C) classifies the right fibration C_{/C} -> C. The infinity-category C_{/C} has a final object and is therefore kappa-filtered. ... The full subcategory Ind_kappa(C) inside P(C) is stable under kappa-filtered colimits.”
  The factorisation and the stability, quoted verbatim.

### HTT 5.3.5.10: every functor out of C extends essentially uniquely to a continuous functor out of Ind(C)

`EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind` — *theorem* · planet **The universal property of Ind**

**Statement.**

Let C and D be infinity-categories and kappa a regular cardinal. Suppose C is SMALL and
D ADMITS SMALL kappa-FILTERED COLIMITS. Then composition with the Yoneda embedding
induces an EQUIVALENCE of infinity-categories Map^kappa(Ind_kappa(C), D) -> Fun(C, D),
where the left-hand side denotes the infinity-category of all kappa-CONTINUOUS functors.
In other words, any functor f : C -> D determines an ESSENTIALLY UNIQUE extension F :
Ind_kappa(C) -> D with f equivalent to F composed with j.

**Hypotheses and warnings.**

- This is the extension property the stage text asks for: 'extension of exact functors
  to colimit-preserving functors'. The exactness is inherited because the extension is
  computed as a filtered colimit and exactness is a finite-limit condition
- C must be SMALL and D must admit kappa-filtered colimits; both hypotheses are used
- The equivalence is of infinity-categories, not merely a bijection on objects; that is
  what makes the extension functorial in f
- Proposition 5.3.5.11 gives the criterion for when the extension is an equivalence, and
  was read only as a pointer

**Proof outline.**

1. Form the restriction functor along the Yoneda embedding.
2. Show it is an equivalence onto Fun(C,D) by combining Lemma 5.3.5.8 with Corollary
   4.3.2.16.
3. Read off the essentially unique extension of a given functor.

**Acceptance.**

- Check that C small and D with filtered colimits are both used
- Check that the equivalence is of categories and not merely of sets of objects
- Check that an exact functor extends to an exact colimit-preserving functor
- Check that the extension restricts back to the original functor

**Prerequisites.** `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:abstract/exact-functors`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Limits.PreservesLimits`, `mathlib:CategoryTheory.Ind`

**Sources.**

- *Proposition 5.3.5.10, printed p. 406.* “Let C and D be infinity-categories and let kappa be a regular cardinal. Suppose that C is small and that D admits small kappa-filtered colimits. Then composition with the Yoneda embedding induces an equivalence of infinity-categories Map^kappa(Ind_kappa(C), D) -> Fun(C,D); where the left hand side denotes the infinity-category of all kappa-continuous functors from Ind_kappa(C) to D.”
  The universal property, quoted verbatim from Higher Topos Theory read in this
  session.
- *After Proposition 5.3.5.10, printed p. 406.* “In other words, if C is small and D admits kappa-filtered colimits, then any functor f : C -> D determines an essentially unique extension F : Ind_kappa(C) -> D (such that f is equivalent to F composed with j).”
  The form in which the stage text uses it.

### HA 1.1.3.6: Ind of a stable infinity-category is stable

`EnhancedDerivedSheaves:E5:presentability/ind-of-a-stable-category-is-stable` — *theorem* · planet **Ind of a stable category is stable**

**Statement.**

Let C be a small STABLE infinity-category and kappa a regular cardinal. Then
Ind_kappa(C) is STABLE. The proof: the Yoneda embedding j preserves finite limits and
colimits, so j(0) is a zero object and Ind_kappa(C) is pointed; every morphism f admits
a cofiber, because f may be written as a kappa-filtered colimit of morphisms in the
essential image of j and cofibers commute with colimits; the existence of fibers is
slightly harder and is obtained by presenting f as a filtered colimit of a diagram of
arrows in C and taking fibers there.

**Hypotheses and warnings.**

- Stability of Ind is what makes IndPerf a stable category in every consumer statement,
  and it is not formal: the existence of fibers requires the filtered presentation of
  the morphism
- The result holds for any regular kappa, not only omega
- That j preserves finite limits and colimits is HTT 5.1.3.2 and 5.3.5.14; neither was
  read beyond the citation
- AUDIT-22 records that neither library has stable infinity-categories at all, so this
  is planned and not cited

**Proof outline.**

1. Note that j preserves finite limits and colimits, so Ind is pointed.
2. Present a morphism as a kappa-filtered colimit of morphisms in the image of j.
3. Take cofibers levelwise; the colimit of the cofibers is a cofiber.
4. For fibers, choose a filtered diagram of arrows and take fibers there.

**Acceptance.**

- Check that pointedness comes from preservation of the zero object
- Check that cofibers are the easy half and fibers the hard half
- Check the statement for kappa different from omega
- Check that Ind of a non-stable category need not be stable

**Prerequisites.** `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.Limits.HasZeroObject`

**Sources.**

- *Proposition 1.1.3.6 with its proof, printed p. 30.* “Let C be a (small) stable infinity-category and let kappa be a regular cardinal. Then the infinity-category Ind_kappa(C) is stable. Proof. The functor j preserves finite limits and colimits (Propositions HTT.5.1.3.2 and HTT.5.3.5.14). It follows that j(0) is a zero object of Ind_kappa(C), so that Ind_kappa(C) is pointed. We next show that every morphism f : X -> Y in ...”
  The statement and the beginning of the proof, quoted verbatim from Higher Algebra
  read in this session. The excerpt is truncated at a word boundary; the full passage
  is on the printed page named in the locator.

### HTT 5.5.0.1: presentable infinity-categories

`EnhancedDerivedSheaves:E5:presentability/presentable-categories` — *definition* · planet **Presentable infinity-categories**

**Statement.**

An infinity-category C is PRESENTABLE if C is ACCESSIBLE and ADMITS SMALL COLIMITS.
Simpson's theorem (HTT 5.5.1.1) gives the main reformulation: C is presentable if and
only if it arises as an ACCESSIBLE LOCALIZATION of an infinity-category of presheaves. A
functor F : C -> S^op out of a presentable C is representable if and only if it
preserves colimits, and this representability criterion implies that C admits small
LIMITS and yields the infinity-categorical adjoint functor theorem.

**Hypotheses and warnings.**

- Presentability is accessibility PLUS small colimits; accessibility alone is not
  enough, and admitting colimits alone is not either
- The adjoint functor theorem in this setting is a consequence of the representability
  criterion, and it is what every 'left adjoint exists' statement in the consumer
  roadmaps rests on
- Simpson's characterisation as an accessible localisation of presheaves is the one that
  makes presentability checkable
- AUDIT-22 records the whole infinity-categorical package as absent; Mathlib has locally
  presentable structure only through finitely presentable objects and Ind

**Proof outline.**

1. Define accessibility and presentability.
2. Record Simpson's characterisation as an accessible localisation of presheaves.
3. Record the representability criterion and the adjoint functor theorem it yields.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsPresentable` | data | Accessible and admitting small colimits. |
| `IsPresentable.bothNeeded` | structure | Accessibility alone and cocompleteness alone are each insufficient. |
| `IsPresentable.simpson` | characterisation | Equivalently, an accessible localisation of a presheaf category (Simpson, HTT 5.5.1.1). |
| `IsPresentable.hasLimits` | structure | A presentable category admits small LIMITS as well as colimits. |
| `IsPresentable.adjointFunctorTheorem` | structure | The representability criterion yields the infinity-categorical adjoint functor theorem. |
| `IsPresentable.presheaves` | example | Presheaf categories are presentable. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category` — P_Sigma is an accessible localisation of a presheaf category, hence presentable
- `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions` — homotopy fixed points are limits, which exist by presentability
- `LanglandsParameterStacks:LP3` — the good-filtration t-structure lives on a presentable stable category

**Unit tests.**

- `both_conditions` — Accessibility alone, or cocompleteness alone, does not give presentability.
- `presheaves_presentable` — Presheaf categories are presentable.
- `has_limits` — A presentable category admits small limits; this is a consequence, not part of the definition.
- `adjoint_functor_theorem` — A colimit-preserving functor out of a presentable category has a right adjoint.

**Acceptance.**

- Check that both conditions are needed
- Check that presheaf categories are presentable
- Check that the adjoint functor theorem follows from the representability criterion
- Check that a presentable category admits small limits as well as colimits

**Prerequisites.** `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.yoneda`

**Sources.**

- *Definition 5.5.0.1, printed p. 453.* “An infinity-category C is presentable if C is accessible and admits small colimits.”
  The definition, quoted verbatim from Higher Topos Theory read in this session.
- *After Definition 5.5.0.1, printed p. 453.* “The main result, Theorem 5.5.1.1, is due to Carlos Simpson: an infinity-category C is presentable if and only if it arises as an (accessible) localization of an infinity-category of presheaves. ... In 5.5.2, we will prove that the converse holds when C is presentable. This representability criterion has a number of consequences: it implies that C admits (small) limits ...”
  Simpson's theorem and the consequences, quoted verbatim. The excerpt is truncated at
  a word boundary; the full passage is on the printed page named in the locator.

### Coherent group actions on categories, homotopy fixed points, and why isomorphism classes do not suffice

`EnhancedDerivedSheaves:E5:presentability/coherent-group-actions` — *construction*

**Statement.**

A COHERENT ACTION of a group G on an infinity-category C is a functor BG -> Cat_infinity
carrying the base point to C; equivalently, by straightening, a coCartesian fibration
over BG with fibre C. Its HOMOTOPY FIXED POINTS are the limit of that functor, written
C^{BG}, and the EQUIVARIANT FUNCTOR CATEGORY between two such actions is the limit of
the functor categories. For a PROFINITE group one asks in addition for CONTINUITY
THROUGH FINITE QUOTIENTS: the action is a filtered colimit of actions of the finite
quotients, so that C^{BG} is the corresponding filtered colimit of the C^{BG/N}. The
roadmap is explicit that these supply the categorical action data used in the spectral
action and that ORDINARY ACTIONS ON ISOMORPHISM CLASSES DO NOT REPLACE THEM.

**Hypotheses and warnings.**

- The datum is a functor out of BG, not an action of G on objects up to isomorphism; the
  difference is exactly the higher coherence, and in the consumer roadmaps it is what
  makes C^{BW_E^I} meaningful
- For a profinite group the continuity condition must be imposed; without it C^{BG} is
  the fixed points of an abstract action and has no relation to the topology. Fargues-
  Scholze's use is through a CONDENSED enhancement, which is HeckeStacksAndLocalShtukas'
  and stronger than the filtered-colimit formulation here
- AUDIT-22 records that a grep for 'homotopy fixed' and for equivariantisation finds
  NOTHING in either library, and that only monoidal actions and shift structures exist
- NO numbered statement in the sources read fixes this construction; Fargues-Scholze use
  C^{BW^I} throughout and define the functoriality in finite sets as a map on total
  spaces over Fin of the corresponding coCartesian fibrations. That convention is the
  only thing read that pins the notion down, and this node records it as the interface
  rather than quoting a theorem

**Proof outline.**

1. Define a coherent action as a functor BG -> Cat_infinity, equivalently a coCartesian
   fibration over BG.
2. Define homotopy fixed points as the limit, and equivariant functor categories as
   limits of functor categories.
3. For a profinite G, impose continuity through the finite quotients and identify C^{BG}
   with the filtered colimit of the C^{BG/N}.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CoherentAction` | data | A functor BG -> Cat_infinity, equivalently a coCartesian fibration over BG. |
| `CoherentAction.notIsoClasses` | structure | This is strictly more than an action on isomorphism classes; the roadmap forbids the substitution. |
| `homotopyFixedPoints` | data | C^{BG}, the limit of the functor. |
| `equivariantFunctors` | data | The limit of the functor categories between two actions. |
| `CoherentAction.profiniteContinuity` | structure | For profinite G, the action is a filtered colimit of actions of finite quotients, and C^{BG} is the corresponding colimit. |
| `CoherentAction.coCartesianConvention` | compatibility | Matches the convention the consumer roadmaps use, where functoriality in a finite set I is a map on total spaces over Fin of coCartesian fibrations. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES0` — the Hecke datum lands in End(C)^{BW^I}
- `ExcursionOperatorsAndSpectralAction:ES2` — the spectral action is an action in this coherent sense
- `LanglandsParameterStacks:LP3` — the good-filtration arguments are made in equivariant categories

**Unit tests.**

- `not_isomorphism_classes` — A coherent action carries more data than an action on isomorphism classes; the roadmap names this as the error to avoid.
- `higher_group_cohomology` — For a finite group, the homotopy fixed points carry higher group cohomology; this is the roadmap's own acceptance test.
- `profinite_continuity` — Without the continuity condition, C^{BG} for a profinite G has no relation to its topology.
- `coCartesian_convention` — The finite-set functoriality is a map on total spaces over Fin, not a compatible family.

**Acceptance.**

- Check that a coherent action is more than an action on isomorphism classes
- Check that homotopy fixed points of a finite group action carry higher group cohomology, which is the roadmap's own acceptance test
- Check that the profinite continuity condition is imposed and what it excludes
- Check the compatibility with the coCartesian-fibration convention that the consumer roadmaps use

**Prerequisites.** `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.Grothendieck`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Limits.HasLimits`, `mathlib:SSet.Quasicategory`

**Sources.**

- *Section 5.5 and the straightening equivalence, printed pp. 453 onwards.* “An infinity-category C is presentable if C is accessible and admits small colimits.”
  The ambient setting. NO numbered statement in Higher Topos Theory or Higher Algebra
  read in this session defines coherent group actions on categories in the form this
  stage asks for; this node records the interface and says so.

**What remains in this layer.**

- The coherent-group-action node has NO numbered statement behind it. Neither Higher
  Topos Theory nor Higher Algebra, in the sections read, defines coherent actions on
  categories in the form the stage text asks for. The node records the interface - a
  functor out of BG, homotopy fixed points as its limit, continuity through finite
  quotients for a profinite group - and says explicitly that it is an interface and not
  a quotation.
- The tensor and module base-change compatibilities under compact generation, which the
  stage text asks for, are Higher Algebra Chapter 4's and were not read beyond the
  definitions of algebra and module objects.
- Proposition 5.3.5.11, the criterion for the extension to be an equivalence, was
  located but not read.
- The proofs of Simpson's theorem, of the representability criterion and of the adjoint
  functor theorem were not read; only their statements and the summary of their
  consequences.

## E5:animation — Simplicial commutative algebra

*Coverage: **partial**. 4 nodes.*

Sifted simplicial sets and the fact that sifted colimits commute with finite products;
P_Sigma(C) as the sifted-colimit completion of a category with finite coproducts, with
its six properties; its universal property, which is the sifted left Kan extension the
stage text asks for; and animated commutative rings as P_Sigma of the polynomial
algebras, with pushouts computed as derived tensor products.

### HTT 5.5.8: sifted simplicial sets, and why they are the right index shapes for animation

`EnhancedDerivedSheaves:E5:animation/sifted-colimits` — *definition*

**Statement.**

A simplicial set K is SIFTED if it is nonempty and the diagonal K -> K x K is cofinal;
equivalently, colimits indexed by K COMMUTE WITH FINITE PRODUCTS in spaces. The two
basic examples are the FILTERED categories and N(Delta^op), whose colimits are the
geometric realisations. A functor preserves sifted colimits if and only if it preserves
both filtered colimits and geometric realisations, which is the form in which the
condition is checked.

**Hypotheses and warnings.**

- Siftedness is exactly the condition that makes colimits commute with finite products,
  and that is what makes a sifted-colimit completion of a category with finite
  coproducts inherit an algebraic structure
- Filtered colimits and geometric realisations generate the sifted ones, which is why
  the universal property of the animation is stated with those two conditions
- Mathlib HAS sifted categories: `CategoryTheory.IsSifted` in
  Mathlib/CategoryTheory/Limits/Sifted.lean, with the statement that sifted colimits
  commute with finite products. AUDIT-22 records exactly this as available, and it is
  cited here rather than replanned
- The infinity-categorical notion is about simplicial sets and cofinality; the pinned
  1-categorical class is its ordinary shadow and the comparison is the roadmap's
  requirement

**Proof outline.**

1. Define siftedness by cofinality of the diagonal.
2. Record the equivalence with commutation of colimits and finite products.
3. Record that filtered colimits and geometric realisations generate.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `IsSifted` | data | K nonempty with K -> K x K cofinal. |
| `IsSifted.commutesWithFiniteProducts` | characterisation | Equivalently, K-indexed colimits commute with finite products. |
| `IsSifted.filtered` | example | Filtered categories are sifted. |
| `IsSifted.simplicial` | example | N(Delta^op) is sifted; its colimits are geometric realisations. |
| `IsSifted.generation` | structure | Filtered colimits and geometric realisations generate the sifted colimits. |
| `IsSifted.toMathlib` | compatibility | On ordinary categories this is Mathlib's `CategoryTheory.IsSifted`, which already proves the commutation with finite products. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category` — P_Sigma is the sifted-colimit completion
- `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation` — the universal property is about sifted colimits
- `ExcursionOperatorsAndSpectralAction:ES3` — the sifted-colimit approximation of FS X.3 is an instance of this

**Unit tests.**

- `filtered_is_sifted` — Filtered categories are sifted.
- `delta_op_is_sifted` — N(Delta^op) is sifted.
- `products_commute` — Sifted colimits commute with finite products; this is the pinned Mathlib statement on ordinary categories.
- `generated_by_two` — Preserving filtered colimits and geometric realisations is the same as preserving sifted colimits.

**Acceptance.**

- Check that filtered categories are sifted
- Check that N(Delta^op) is sifted
- Check that sifted colimits commute with finite products, against the pinned Mathlib statement
- Check that a functor preserves sifted colimits iff it preserves filtered colimits and geometric realisations

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E0`, `mathlib:CategoryTheory.IsSifted`, `mathlib:CategoryTheory.IsFiltered`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `mathlib:SSet`

**Sources.**

- *Section 5.5.8 and Lemma 5.5.8.11 region, printed pp. 506-508.* “Before giving the proof, we need a preliminary result concerning the interactions between products and sifted colimits.”
  Where the interaction of sifted colimits with products is established in Higher
  Topos Theory, read in this session. The pinned `CategoryTheory.IsSifted` states the
  ordinary form of the same fact and is cited rather than replanned.
- *Proposition 5.5.8.15, printed p. 509.* “let D be an infinity-category which admits filtered colimits and geometric realizations. ... (2) Any functor g in Fun'(P_Sigma(C),D) preserves sifted colimits.”
  That filtered colimits and geometric realisations generate the sifted ones, in the
  form the universal property uses.

### HTT 5.5.8.10: P_Sigma(C), the sifted-colimit completion of a category with finite coproducts

`EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category` — *construction* · planet **The sifted-colimit completion**

**Statement.**

Let C be a small infinity-category which admits FINITE COPRODUCTS. Then P_Sigma(C), the
full subcategory of P(C) spanned by the presheaves carrying finite coproducts to
products, satisfies: (1) it is an ACCESSIBLE LOCALIZATION of P(C); (2) the Yoneda
embedding factors through it and carries finite coproducts to finite coproducts; (3) for
an adjunction between P_Sigma(C) and a presentable D, the right adjoint factors through
P_Sigma(C) if and only if the composite of the left adjoint with the Yoneda embedding
preserves finite coproducts; (4) P_Sigma(C) inside P(C) is STABLE UNDER SIFTED COLIMITS;
(5) the left adjoint L : P(C) -> P_Sigma(C) PRESERVES SIFTED COLIMITS; (6) P_Sigma(C) is
COMPACTLY GENERATED.

**Hypotheses and warnings.**

- C must admit FINITE COPRODUCTS; without them there is no condition to impose and
  P_Sigma is all of P(C)
- P_Sigma(C) is the ANIMATION of C in the modern terminology: the free sifted-colimit
  completion. When C is the category of finitely generated free R-algebras, P_Sigma(C)
  is the animated R-algebras
- AUDIT-22 records that a grep for 'animated' and 'simplicial commutative ring' returns
  nothing in either library, and that what Mathlib does have is sifted categories and
  polynomial presentations of algebras
- Clause (5) is what makes the localisation compatible with the sifted colimits one
  wants to compute with, and clause (6) is what makes it presentable and compactly
  generated

**Proof outline.**

1. Impose on a presheaf the condition of carrying finite coproducts to products.
2. Show the resulting full subcategory is an accessible localisation and that Yoneda
   factors through it.
3. Prove stability under sifted colimits and that the localisation preserves them.
4. Deduce compact generation.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `PSigma` | data | The full subcategory of P(C) of presheaves carrying finite coproducts to products. |
| `PSigma.needsFiniteCoproducts` | structure | C must admit finite coproducts; otherwise the condition is vacuous. |
| `PSigma.yoneda` | structure | Yoneda factors through and carries finite coproducts to finite coproducts. |
| `PSigma.siftedStable` | structure | Stable under sifted colimits, and the localisation preserves them. |
| `PSigma.compactlyGenerated` | structure | Compactly generated, with the image of C among the compact objects. |
| `PSigma.isAnimation` | example | For C the finitely generated free R-algebras this is the animated R-algebras. |

**Where it is used.**

- `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation` — the universal property is about this category
- `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings` — animated rings are the instance for polynomial algebras
- `LanglandsParameterStacks:LP1` — the derived moduli problem is defined on animated Z_l-algebras

**Unit tests.**

- `finite_coproducts_needed` — Without finite coproducts in C the condition is vacuous and P_Sigma is P.
- `yoneda_preserves_coproducts` — Yoneda carries finite coproducts to finite coproducts.
- `sifted_stability` — Stable under sifted colimits, and L preserves them.
- `compact_generation` — Compactly generated, with the image of C compact.

**Acceptance.**

- Check that finite coproducts in C are required
- Check that Yoneda carries finite coproducts to finite coproducts
- Check stability under sifted colimits and preservation by the localisation
- Check compact generation, with the image of C among the compact objects

**Prerequisites.** `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.IsSifted`, `mathlib:CategoryTheory.Limits.HasCoproducts`, `mathlib:CategoryTheory.yoneda`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- *Proposition 5.5.8.10, printed pp. 507-508.* “Let C be a small infinity-category which admits finite coproducts. Then (1) The infinity-category P_Sigma(C) is an accessible localization of P(C). (2) The Yoneda embedding j : C -> P(C) factors through P_Sigma(C). Moreover, j carries finite coproducts in C to finite coproducts in P_Sigma(C). ... (4) The full subcategory P_Sigma(C) inside P(C) is stable under sifted colimits. ...”
  The construction and its six properties, quoted verbatim from Higher Topos Theory
  read in this session. The excerpt is truncated at a word boundary; the full passage
  is on the printed page named in the locator.

### HTT 5.5.8.15: functors out of P_Sigma(C) are functors out of C, by sifted left Kan extension

`EnhancedDerivedSheaves:E5:animation/universal-property-of-animation` — *theorem* · planet **The universal property of animation**

**Statement.**

Let C be a small infinity-category which admits finite coproducts and let D be an
infinity-category which admits FILTERED COLIMITS and GEOMETRIC REALIZATIONS. Let
Fun'(P_Sigma(C),D) be the full subcategory of functors preserving filtered colimits and
geometric realisations. Then: (1) composition with the Yoneda embedding induces an
EQUIVALENCE Fun'(P_Sigma(C),D) -> Fun(C,D); (2) any functor in Fun'(P_Sigma(C),D)
PRESERVES SIFTED COLIMITS; (3) if D admits finite coproducts, a functor g in
Fun'(P_Sigma(C),D) preserves SMALL COLIMITS if and only if g composed with the Yoneda
embedding preserves FINITE COPRODUCTS.

**Hypotheses and warnings.**

- This is the SIFTED LEFT KAN EXTENSION the stage text asks for: a functor on C extends
  essentially uniquely to a sifted-colimit-preserving functor on the animation
- D must admit filtered colimits AND geometric realisations; those two together are the
  sifted colimits, by the previous node
- Clause (3) is the criterion for the extension to preserve all colimits, and it is
  checked on C alone
- The proof rests on P_Sigma(C) being the smallest full subcategory of P(C) closed under
  filtered colimits and geometric realisations and containing the Yoneda image; that is
  Lemma 5.5.8.14 together with Proposition 5.5.8.10
- This is the statement that makes 'animation' a construction one can compute with:
  every operation on polynomial algebras extends uniquely

**Proof outline.**

1. Note that P_Sigma(C) is the smallest full subcategory of P(C) closed under filtered
   colimits and geometric realisations and containing the Yoneda image.
2. Deduce that restriction along Yoneda is an equivalence onto Fun(C,D).
3. Deduce that any such functor preserves sifted colimits.
4. Give the criterion for preservation of all colimits in terms of finite coproducts.

**Acceptance.**

- Check that both filtered colimits and geometric realisations are required of D
- Check that the extension preserves sifted colimits
- Check the finite-coproduct criterion for preservation of all colimits
- Check that the extension restricts back to the given functor

**Prerequisites.** `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`, `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.IsSifted`, `mathlib:CategoryTheory.Limits.HasCoproducts`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.yoneda`

**Sources.**

- *Proposition 5.5.8.15, printed p. 509.* “Let C be a small infinity-category which admits finite coproducts and let D be an infinity-category which admits filtered colimits and geometric realizations. Let Fun'(P_Sigma(C),D) denote the full subcategory spanned by those functors P_Sigma(C) -> D which preserve filtered colimits and geometric realizations. Then (1) Composition with the Yoneda embedding j : C -> P_Sigma(C) ...”
  The universal property, quoted verbatim from Higher Topos Theory read in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Proof of Proposition 5.5.8.15, printed p. 509.* “Lemma 5.5.8.14 and Proposition 5.5.8.10 imply that P_Sigma(C) is the smallest full subcategory of P(C) which is closed under filtered colimits, is closed under geometric realizations, and contains the essential image of the Yoneda embedding.”
  The key step of the proof, quoted verbatim.

### Animated commutative rings as P_Sigma of the polynomial algebras, with tensor pushouts

`EnhancedDerivedSheaves:E5:animation/animated-commutative-rings` — *definition* · planet **Animated commutative rings**

**Statement.**

For a commutative ring R, the infinity-category of ANIMATED COMMUTATIVE R-ALGEBRAS is
P_Sigma(Poly_R), where Poly_R is the ordinary category of FINITELY GENERATED FREE - that
is, polynomial - R-algebras, which admits finite coproducts, the coproduct being the
tensor product over R. By the universal property, every functor on Poly_R extends
essentially uniquely to a sifted-colimit-preserving functor on animated R-algebras; in
particular the tensor product extends, and the PUSHOUT of animated R-algebras along a
pair of maps is computed by the derived tensor product, because pushouts of polynomial
algebras are tensor products and the extension preserves all colimits by the finite-
coproduct criterion. Equivalently, animated R-algebras are the infinity-category
underlying simplicial commutative R-algebras.

**Hypotheses and warnings.**

- The generators are the POLYNOMIAL algebras, not the finitely presented ones; that is
  what makes the completion free and the universal property applicable
- The coproduct in Poly_R is the tensor product over R, so the extension criterion of
  clause (3) applies and the extended functors preserve all colimits
- The comparison with simplicial commutative rings is the classical formulation; HTT
  5.5.9 presents the same ideas in Quillen's form, through a rectification result, and
  that section was NOT read
- AUDIT-22 records that neither library has animated or simplicial commutative rings,
  and that what exists is sifted categories and polynomial presentations of algebras
- The roadmap's consumers use this in two places: LanglandsParameterStacks:LP1 needs the
  moduli problem on animated Z_l-algebras, and DerivedDeRhamCohomology:DD.0 builds the
  cotangent complex from this prefix

**Proof outline.**

1. Take Poly_R, the polynomial R-algebras, and note it admits finite coproducts.
2. Form P_Sigma(Poly_R) and call it the animated R-algebras.
3. Extend the tensor product by the universal property and identify pushouts with derived
   tensor products.
4. Record the comparison with simplicial commutative rings.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `AnimatedAlg` | data | P_Sigma(Poly_R), the animated commutative R-algebras. |
| `AnimatedAlg.generators` | structure | The generators are the POLYNOMIAL algebras; the coproduct in Poly_R is the tensor product over R. |
| `AnimatedAlg.pushout` | characterisation | Pushouts are derived tensor products, by the finite-coproduct criterion. |
| `AnimatedAlg.discrete` | structure | Ordinary R-algebras sit inside as the discrete objects. |
| `AnimatedAlg.simplicialComparison` | compatibility | Equivalent to simplicial commutative R-algebras, by the rectification of HTT 5.5.9, which was not read. |

**Where it is used.**

- `LanglandsParameterStacks:LP1` — the derived moduli problem of L-parameters is defined on animated Z_l-algebras
- `DerivedDeRhamCohomology:DD.0` — the cotangent complex is built from this prefix
- `PrismaticCohomology:PR.5` — the prismatic applications consume animated rings

**Unit tests.**

- `polynomial_generators` — The generators are polynomial algebras; using finitely presented ones changes the completion.
- `pushout_is_tensor` — Pushouts are derived tensor products.
- `discrete_inclusion` — Ordinary R-algebras embed as the discrete objects.
- `simplicial_comparison` — The comparison with simplicial commutative rings is a rectification theorem, not a definition.

**Acceptance.**

- Check that the generators are the polynomial algebras
- Check that pushouts are derived tensor products
- Check that an ordinary R-algebra is an animated one, and that the inclusion is fully faithful on discrete objects
- Check the comparison with simplicial commutative rings

**Prerequisites.** `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E5:animation/nonabelian-derived-category`, `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E3`, `mathlib:CommRing`, `mathlib:MvPolynomial`, `mathlib:CategoryTheory.IsSifted`, `mathlib:CategoryTheory.Limits.HasCoproducts`

**Sources.**

- *Section 5.5.8 introduction, printed p. 506.* “The presence of enough compact projective objects in an infinity-category allows us to construct projective resolutions, which gives rise to the theory of nonabelian homological algebra (or 'homotopical algebra'). We will review the rudiments of this theory in 5.5.8. Finally, in 5.5.9 we will present the same ideas in a more classical form following Quillen's manuscript. The ...”
  The setting and the comparison with Quillen's simplicial commutative rings, quoted
  verbatim from Higher Topos Theory read in this session. Section 5.5.9 itself was NOT
  read. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.
- *Proposition 5.5.8.15 (3), printed p. 509.* “Assume that D admits finite coproducts. A functor g in Fun'(P_Sigma(C),D) preserves small colimits if and only if g composed with j preserves finite coproducts.”
  The criterion that makes the extended tensor product preserve colimits, hence
  compute pushouts.

**What remains in this layer.**

- Section 5.5.9, which compares this construction with Quillen's simplicial commutative
  rings through the rectification result 5.5.9.2, was NOT read. So the identification of
  animated rings with simplicial commutative rings - which the stage text states as the
  definition - is recorded as an imported comparison and not as a quotation.
- Lemma 5.5.8.14, on which the proof of the universal property rests, was located but
  not read.
- The compact projective objects that make the nonabelian homological algebra work were
  read only in the section's introduction.
- BS22, named in the source route, was not identified; see the note on the parent layer.

## E5:cotangent-export — The return from derived de Rham

*Coverage: **not_read**. 2 nodes.*

This layer constructs nothing: DerivedDeRhamCohomology:DD.0 owns the cotangent complex,
its derivation characterisation, transitivity and base change, derived exterior powers
and Tor-amplitude tests, and E5 re-exports that one interface. Two nodes record the
import and the positive-characteristic restriction on comparing with E-infinity
algebras.

### What this layer re-exports, and why it constructs nothing

`EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface` — *comparison*

**Statement.**

This layer constructs NOTHING of its own. The cotangent complex, its derivation
characterisation, transitivity and base change, derived exterior powers and Tor-
amplitude tests are constructed by DerivedDeRhamCohomology:DD.0 FROM THE ANIMATION
PREFIX of E5:animation, and this layer re-exports that ONE interface. The reviewed audit
AUDIT-22 records DD.0 as a duplicate of this stage's target for exactly that reason, and
records the pinned state precisely: Mathlib has the NAIVE two-term cotangent complex
with its H^1 and the Jacobi-Zariski sequence, while the full derived cotangent complex,
derived exterior powers and Tor amplitude are missing and DD.0 owns them.

**Hypotheses and warnings.**

- By PROTOCOL.md section 15 a construction two layers share is planned once, by the
  owner; DD.0 is the owner and this layer imports
- The direction matters: DD.0 consumes E5:animation and is consumed by E5:cotangent-
  export, so the animation prefix must be built before the cotangent complex, and the
  export after it
- Mathlib's `Algebra.Extension.H1Cotangent` and the Jacobi-Zariski sequence are the
  pinned partial half and are cited, not replanned
- The roadmap also names PrismaticCohomology PR.0-2 as the owner of the generic
  prismatic application, PerfectoidQuotients Q0-4 of the perfectoidization application,
  and LanglandsParameterStacks of the derived affine, quotient and mapping stacks; none
  of those is planned here either

**Proof outline.**

1. Record that DD.0 owns the construction and that this layer re-exports it.
2. Record the pinned partial state: the naive cotangent complex and the Jacobi-Zariski
   sequence exist; the derived version, derived exterior powers and Tor amplitude do not.
3. Record the three other ownerships the stage text names.

**Acceptance.**

- Check that nothing is constructed here
- Check that the import direction is E5:animation, then DD.0, then this layer
- Check that the pinned naive cotangent complex is cited and not replanned

**Prerequisites.** `EnhancedDerivedSheaves:E5:animation`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `mathlib:Algebra.Extension.H1Cotangent`, `mathlib:CommRing`, `mathlib:MvPolynomial`

**Sources.**

- *Section 5.5.8, printed p. 506.* “The presence of enough compact projective objects in an infinity-category allows us to construct projective resolutions, which gives rise to the theory of nonabelian homological algebra.”
  The only thing this layer needs from the sources read: the animation prefix out of
  which DerivedDeRhamCohomology:DD.0 builds the cotangent complex. Nothing about the
  cotangent complex itself is quoted here, because nothing about it is planned here.

### In positive characteristic, compare with E-infinity algebras only in proved ranges

`EnhancedDerivedSheaves:E5:cotangent-export/e-infinity-comparison-in-proved-ranges` — *comparison*

**Statement.**

The stage text imposes a restriction that this packet records and does not weaken: in
POSITIVE CHARACTERISTIC, the comparison between animated commutative algebras and
E-INFINITY ALGEBRAS is to be made ONLY IN PROVED RANGES, and STRICTLY COMMUTATIVE
DIFFERENTIAL GRADED ALGEBRAS ARE NOT A GENERAL REPLACEMENT. The two notions agree in
characteristic zero, where a strictly commutative dg algebra models an E-infinity
algebra and the animation of polynomial algebras is equivalent to connective E-infinity
algebras; in characteristic p they DIVERGE, and an animated ring is in general strictly
more rigid than the underlying E-infinity ring.

**Hypotheses and warnings.**

- The warning is the roadmap's, and it is right: in characteristic p the free E-infinity
  algebra on one generator has Dyer-Lashof operations that the free animated algebra
  does not, so the forgetful functor from animated to E-infinity rings is neither full
  nor essentially surjective
- AUDIT-22 records that NEITHER LIBRARY HAS E-INFINITY ALGEBRAS at all - a grep for
  prespectrum and for orthogonal and symmetric spectra returns nothing - so the
  comparison cannot even be stated at the pins
- The characteristic-zero agreement is what makes the confusion tempting, and it is why
  the roadmap states the restriction rather than leaving it implicit
- NO statement in Higher Topos Theory or Higher Algebra read in this session makes this
  comparison; HA Chapter 7 treats E-infinity rings and HTT 5.5.9 the simplicial ones,
  and neither section was read. This node records the restriction as an obligation with
  no locator

**Proof outline.**

1. Record that the two notions agree in characteristic zero.
2. Record that in characteristic p they diverge and that the divergence is not a
   technicality.
3. Record that no comparison may be asserted outside a proved range, and that strictly
   commutative dg algebras are not a general replacement.

**Acceptance.**

- Check that the characteristic-zero agreement is not extended to characteristic p
- Check that no statement in this packet asserts an equivalence outside a proved range
- Check that neither library has E-infinity algebras, so the comparison is not available at the pins

**Prerequisites.** `EnhancedDerivedSheaves:E5:cotangent-export/the-imported-interface`, `EnhancedDerivedSheaves:E5:animation`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `mathlib:CommRing`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Section 5.5.9, printed p. 506 (located, not read).* “Finally, in 5.5.9 we will present the same ideas in a more classical form following Quillen's manuscript. The comparison of these two perspectives is based on a rectification result (Proposition 5.5.9.2).”
  The rectification comparison between the animation and simplicial commutative rings,
  which is a DIFFERENT comparison from the one this node is about. NO statement read
  in this session compares animated with E-infinity algebras, and this node records
  the restriction as an obligation rather than quoting a theorem.

**What remains in this layer.**

- NOTHING about the cotangent complex was read in this session. The layer's content is
  entirely an import from DD.0, which AUDIT-22 records as a duplicate of this stage's
  target, and this packet plans none of it.
- The comparison with E-infinity algebras in positive characteristic has NO locator: no
  statement read in this session makes it. Higher Algebra Chapter 7, which treats
  E-infinity rings, was not read, and neither library has E-infinity algebras at all.
- The status is recorded as not_read rather than partial, because the two nodes here are
  boundary markers and neither plans a construction.

## E5:spectra-comparison — Late concrete realization

*Coverage: **not_read**. 1 node.*

A late return: after StableHomotopyKTheory H.5 supplies concrete spectra, this layer
compares them with the abstract stable and monoidal construction. One node records the
three comparisons and the two structural facts the roadmap insists on - that this is not
a prerequisite of E5:abstract or E5:animation, and that the concrete spectra are not
rebuilt here.

### The late comparison with concrete spectra, and why it is not a prerequisite

`EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation` — *comparison*

**Statement.**

After StableHomotopyKTheory H.5 supplies CONCRETE SPECTRA and spectral module
categories, this layer compares them with the abstract stable and monoidal construction
of E5:abstract: the EXACT TENSOR comparison, the EILENBERG-MAC LANE comparison, and the
COHERENT ACTION comparison used by E1's spectral realisation. The roadmap states two
things about this return that a reader must not lose: it is NOT A PREREQUISITE of
E5:abstract or E5:animation, so neither of those may cite it; and StableHomotopyKTheory
supplies the concrete spectrum objects, so E5:presentability does not construct them
again.

**Hypotheses and warnings.**

- The return structure is the point: E5:abstract and E5:animation are complete without
  spectra, and the whole of the geometric-Langlands consumer chain goes through them and
  not through this layer
- Higher Algebra constructs the stable infinity-category Sp of spectra and shows it is
  in a sense the universal stable infinity-category; that construction is
  StableHomotopyKTheory's by the roadmap's division, and this layer only compares
- AUDIT-22 records that neither library has spectra: a grep for prespectrum and for
  orthogonal and symmetric spectra returns nothing, and Tau Ceti has only K(G,1) spaces
- The Eilenberg-Mac Lane comparison is the statement that the derived category of a ring
  is the modules over its Eilenberg-Mac Lane spectrum; that is HA Chapter 7 and was NOT
  read

**Proof outline.**

1. Record that H.5 supplies the concrete spectra.
2. State the three comparisons: exact tensor, Eilenberg-Mac Lane, and coherent actions.
3. Record that this layer is a return and is not a prerequisite of the abstract or
   animation layers.

**Acceptance.**

- Check that E5:abstract and E5:animation do not cite this layer
- Check that the concrete spectra come from H.5 and are not rebuilt
- Check that neither pinned library has spectra

**Prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `StableHomotopyKTheory:H.5`, `EnhancedDerivedSheaves:E1`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:DerivedCategory`, `mathlib:CategoryTheory.HasShift`

**Sources.**

- *Example 1.1.1.11, printed p. 20.* “Recall that a spectrum consists of an infinite sequence of pointed topological spaces {X_i}_{i >= 0}, together with homeomorphisms X_i = Omega X_{i+1}, where Omega denotes the loop space functor. The collection of spectra can be organized into a stable infinity-category Sp. Moreover, Sp is in some sense the universal example of a stable infinity-category. This motivates the ...”
  What is being compared with, in Higher Algebra's own words, read in this session.
  The construction of Sp belongs to StableHomotopyKTheory by the roadmap's division
  and is not planned here. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.

**What remains in this layer.**

- Higher Algebra Chapter 1's Example 1.1.1.11 is the only thing read about spectra: that
  they form a stable infinity-category Sp which is in a sense the universal one. The
  construction of Sp, and Chapter 7's Eilenberg-Mac Lane comparison, were NOT read.
- Neither pinned library has spectra at all, as AUDIT-22 records.
- The status is not_read: this layer has one node and it is a boundary marker.

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
| `mathlib:CategoryTheory.Functor` | `Mathlib/CategoryTheory/Functor/Basic.lean` | Functors. Every construction of this packet is a functor or a fibration of quasicategories built from one; the ordinary notion is the one the comparison discipline of E5 refers back to. |
| `mathlib:SSet.Quasicategory` | `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` | QUASICATEGORIES, at the pins. This is the carrier of every infinity-category in this packet, and AUDIT-22's finding that Mathlib has 'only strict Segal simplicial sets and 1-categorical symmetric monoidal categories' is a statement about what is built ON this carrier, not about the carrier itself. |
| `mathlib:SSet` | `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean` | Simplicial sets. N(Fin_*), N(Delta^op) and the nerves of ordinary categories are simplicial sets, and the sifted index shapes are simplicial sets. |
| `mathlib:CategoryTheory.Grothendieck` | `Mathlib/CategoryTheory/Grothendieck.lean` | THE GROTHENDIECK CONSTRUCTION, at the pins. It is the ordinary shadow of straightening and unstraightening, and it is how an ordinary symmetric monoidal category is turned into a coCartesian fibration over the nerve of finite pointed sets - the comparison that HA Definition 2.0.0.7 is designed to generalise. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | The 1-CATEGORICAL symmetric monoidal structure. AUDIT-22 records that this is what exists and that the infinity-categorical version is absent; the roadmap requires that every use compare with it rather than introduce a second private carrier, and each definition node of this packet states that comparison. |
| `mathlib:CommMonCat` | `Mathlib/Algebra/Category/MonCat/Basic.lean` | Commutative monoids as a category. The ordinary shadow of CAlg(C) for C the category of sets with product, and the object the comparison for commutative algebra objects lands in on homotopy categories. |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | PRETRIANGULATED CATEGORIES with distinguished triangles, at the pins. HA Theorem 1.1.2.14 says the homotopy category of a stable infinity-category carries this structure, and AUDIT-22 records that the stable infinity-categorical notion itself is absent. |
| `mathlib:CategoryTheory.HasShift` | `Mathlib/CategoryTheory/Shift/Basic.lean` | Shift functors. The translation functor of the triangulated homotopy category is a shift in this sense. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The derived category of an abelian category, at the pins. It is the homotopy category of the basic example of a stable infinity-category, and the comparison with it is what makes the abstract notion recognisable. |
| `mathlib:CategoryTheory.Limits.HasZeroObject` | `Mathlib/CategoryTheory/Limits/Shapes/ZeroObjects.lean` | Zero objects, the first condition in the definition of stability. |
| `mathlib:CategoryTheory.Limits.HasLimits` | `Mathlib/CategoryTheory/Limits/HasLimits.lean` | Existence of limits. Homotopy fixed points are limits, presentable categories admit small limits, and the Segal conditions are statements about products. |
| `mathlib:CategoryTheory.Limits.PreservesLimits` | `Mathlib/CategoryTheory/Limits/Preserves/Basic.lean` | Preservation of limits. Exactness of a functor between stable categories is preservation of finite limits, equivalently of finite colimits. |
| `mathlib:CategoryTheory.Limits.HasFilteredColimits` | `Mathlib/CategoryTheory/Limits/FilteredColimitCommutesFiniteLimit.lean` | Filtered colimits. Compactness is defined by their preservation, Ind is defined by a filteredness condition, and the sifted colimits are generated by them together with geometric realisations. |
| `mathlib:CategoryTheory.IsFiltered` | `Mathlib/CategoryTheory/Filtered/Basic.lean` | Filtered categories, at the pins. The index shapes of the Ind-completion. |
| `mathlib:CategoryTheory.IsSifted` | `Mathlib/CategoryTheory/Limits/Sifted.lean` | SIFTED CATEGORIES, at the pins, together with the statement that sifted colimits commute with finite products. AUDIT-22 names this explicitly as what Mathlib has for E5:animation's target, and this packet cites it rather than replanning it: it is the ordinary form of the condition that makes P_Sigma inherit an algebraic structure. |
| `mathlib:CategoryTheory.Limits.HasCoproducts` | `Mathlib/CategoryTheory/Limits/Shapes/Products.lean` | Coproducts. P_Sigma is defined for a category with FINITE COPRODUCTS, and the criterion for the extension to preserve all colimits is about finite coproducts. |
| `mathlib:CategoryTheory.Ind` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean` | THE 1-CATEGORICAL IND-COMPLETION, at the pins. AUDIT-22 records it as the partial half of E5:presentability's first target; the infinity-categorical Ind, the extension of exact functors and the compact-generation compatibilities are what is missing, and the comparison with this declaration is what the roadmap asks for. |
| `mathlib:CategoryTheory.yoneda` | `Mathlib/CategoryTheory/Yoneda.lean` | The Yoneda embedding. Ind and P_Sigma are both defined as subcategories of presheaves containing the Yoneda image, and both universal properties are restriction along it. |
| `mathlib:CategoryTheory.Idempotents.Karoubi` | `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` | THE 1-CATEGORICAL KAROUBI ENVELOPE with its universal property, at the pins. AUDIT-22 records it as the partial half of E5:abstract's second target; what is missing is the infinity-categorical idempotent completion and the stable structure on it. |
| `mathlib:Algebra.Extension.H1Cotangent` | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean` | THE NAIVE TWO-TERM COTANGENT COMPLEX and its H^1, at the pins, with the Jacobi-Zariski sequence. AUDIT-22 records this as the partial half of E5:cotangent-export's target; the full derived cotangent complex, derived exterior powers and Tor amplitude are missing and DerivedDeRhamCohomology:DD.0 owns them. |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. The animated commutative R-algebras are built from the ordinary polynomial R-algebras, and the ordinary rings sit inside as the discrete objects. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Polynomial algebras, at the pins. These are the generators of the animation: P_Sigma(Poly_R) is taken over the finitely generated free R-algebras, and AUDIT-22 records polynomial presentations of algebras as what Mathlib has for this target. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The finitely generated free algebras that generate the animation, and the free modules underlying the module objects, are of this kind. |

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

### 1. BS22, named in the stage's source route, could not be identified

The E5 stage text names its sources as 'HA sections 1-4, HTT sections 4-5, BS22 sections
2-7, FS VIII.3 and X.1'. Higher Algebra and Higher Topos Theory were downloaded from the
author's page, hashed and read in this session, and Fargues-Scholze VIII.3 and X.1 were
read in this session for the companion LanglandsParameterStacks and
ExcursionOperatorsAndSpectralAction jobs. BS22 WAS NOT IDENTIFIED: the references
catalogue and the papers listing contain no item under that key for this material, and
the most likely candidate by the abbreviation - Bhatt-Scholze, Prisms and prismatic
cohomology - has no sections on animation or on monoidal enhancement, its sections 2 to
7 being delta-rings, prisms, the prismatic site and its comparisons. The animation
material is therefore planned from Higher Topos Theory Section 5.5.8, which is the
canonical source for it and which the same route names. NEXT SOURCE ACTION: ask the
maintainer which work 'BS22' denotes, or check whether it is Bhatt-Scholze's lecture
notes on prismatic cohomology or Cesnavicius-Scholze; until then the animation nodes
rest on Higher Topos Theory alone.

### 2. The coherent-group-action node has no source statement

E5:presentability's stage text asks to 'Construct finite and profinite coherent group
actions, homotopy fixed points and equivariant functor categories with explicit
continuity through finite quotients where appropriate', and adds that 'ordinary actions
on isomorphism classes do not replace them'. NO numbered statement in the sections of
Higher Topos Theory or Higher Algebra read in this session defines coherent group
actions on categories. The node records the interface - a functor out of BG,
equivalently a coCartesian fibration over BG; homotopy fixed points as the limit;
equivariant functor categories as limits of functor categories; and for a profinite
group, continuity as a filtered colimit of finite-quotient actions - and says in its own
sources that it is an interface and not a quotation. AUDIT-22 confirms that a grep for
'homotopy fixed' and for equivariantisation finds nothing in either library. NEXT SOURCE
ACTION: read Higher Algebra Section 4.2 and Higher Topos Theory Section 4.2.4 for the
general theory of diagrams and limits over BG, and Fargues-Scholze IX.1 for the
condensed enhancement the geometric-Langlands consumers actually use.

### 3. Higher Topos Theory Chapter 4 was not read, although the source route names it

The stage's route says 'HTT sections 4-5'. Chapter 5 was read in the parts this packet
plans - 5.1.4, 5.3.4, 5.3.5, 5.5.0, 5.5.1 and 5.5.8. CHAPTER 4, on limits and colimits
in infinity-categories, cofinality, Kan extensions and the theory of coCartesian
fibrations over a simplex, was NOT read. Several proofs this packet quotes cite it -
Corollary 4.3.2.16 in the proof of the universal property of Ind, Corollary 4.4.5.15 in
the proof that presheaf categories are idempotent complete - so those citations are
unverified. NEXT SOURCE ACTION: read HTT 4.3.2 and 4.4.5, which are the two the quoted
proofs use.

### 4. Higher Algebra Chapter 3 was not read, and it is what gives Ind and modules their monoidal structures

This packet plans the symmetric monoidal formalism (HA Chapter 2) and the module
formalism (HA Section 4.2), and separately plans Ind (HTT 5.3.5). What it does NOT plan
is the SYMMETRIC MONOIDAL STRUCTURE on Ind, on module categories, or on the idempotent
completion - the statements that make 'IndPerf is a symmetric monoidal stable category'
meaningful, and that every consumer roadmap uses without comment. Those are Higher
Algebra Chapter 3, on operadic colimits and the tensor product of infinity-operads, and
Chapter 4's later sections. Neither was read. NEXT SOURCE ACTION: read HA Chapter 3, in
particular the construction of the tensor product of infinity-operads and the monoidal
structure on Ind.

### 5. Proposition 2.1.2.12's conditions were not recovered from the extraction

HA Definition 2.1.2.13 defines a coCartesian fibration of infinity-operads as a map
satisfying 'the hypotheses of Proposition 2.1.2.12'. The extraction used here renders
Proposition 2.1.2.12's statement as a bare label followed by the next section heading,
so its conditions were not recovered. The node states the definition exactly as Lurie
does, by reference, and does not restate conditions it did not read. NEXT SOURCE ACTION:
read printed page 178 of Higher Algebra in a viewer and record the conditions verbatim.

### 6. The comparison with E-infinity algebras in positive characteristic has no locator

E5:cotangent-export's stage text says 'In positive characteristic, compare with
E-infinity algebras only in proved ranges: strictly commutative dg algebras are not a
general replacement.' No statement read in this session makes any such comparison.
Higher Algebra Chapter 7, which treats E-infinity rings, was not read; Higher Topos
Theory Section 5.5.9, which compares the animation with Quillen's simplicial commutative
rings, was not read either - and that is in any case a DIFFERENT comparison. AUDIT-22
records that neither library has E-infinity algebras at all, so the statement cannot
even be formulated at the pins. The node records the restriction as an obligation and
says so. NEXT SOURCE ACTION: read HA Chapter 7 and HTT 5.5.9.

### 7. Nothing about spectra was read beyond one example

E5:spectra-comparison is a late return after StableHomotopyKTheory H.5. The only thing
read about spectra in this session is Higher Algebra's Example 1.1.1.11, which says that
spectra form a stable infinity-category Sp and that Sp is in a sense the universal
stable infinity-category. The construction of Sp, the Eilenberg-Mac Lane comparison and
the spectral module categories were NOT read. The layer's coverage is recorded as
not_read for that reason. NEXT SOURCE ACTION: this is StableHomotopyKTheory H.5's
material; read HA Chapter 1.4 for the construction of Sp and Chapter 7 for the
Eilenberg-Mac Lane comparison when this layer is taken up.

### 8. Uniqueness of idempotent completions and the converse to the triangulation theorem were not read

Two pointers in the sections read were not followed. HTT Proposition 5.1.4.9 gives the
uniqueness of idempotent completions; only the existence, Proposition 5.1.4.2, and its
proof were read. HA Corollary 1.4.2.27 gives the converse that the hypotheses of Theorem
1.1.2.14 - pointed, with cofibers, suspension an equivalence - are EQUIVALENT to
stability; only the forward direction and Remark 1.1.2.15's assertion of the converse
were read. Neither affects a statement planned here, but both are cited in the nodes.
NEXT SOURCE ACTION: read HTT 5.1.4.9 and HA 1.4.2.27.

### 9. Two of the layer's own acceptance tests belong to another roadmap

The E5 stage text lists five acceptance tests: a polynomial algebra's cotangent module;
a regular quotient's two-term cotangent complex; a nonregular quotient with higher
homology; the Ind-envelope of perfect modules; and a coherent action whose invariants
carry higher group cohomology. The first three are cotangent-complex computations, and
by this roadmap's own declaration DerivedDeRhamCohomology:DD.0 owns the cotangent
complex; AUDIT-22 records DD.0 as a duplicate of E5:cotangent-export's target for
exactly that reason. This packet therefore does NOT plan them, and plans the last two -
the Ind-envelope in E5:presentability and the coherent action in the same layer's unit
tests. A reader should not take the layer's test list as a list of what this packet
establishes.

### 10. No source read states the comparison with Mathlib that the roadmap requires

The E5 stage text ends: 'Every use includes an actual construction and comparison to the
existing Mathlib ordinary category rather than a second private carrier.' That is a
requirement on the FORMALISATION, not a theorem of Lurie's, and no statement in Higher
Topos Theory or Higher Algebra mentions Mathlib. This packet discharges it by citing,
for each notion it plans, the pinned ordinary counterpart - MonoidalCategory,
CommMonCat, Pretriangulated and DerivedCategory, Idempotents.Karoubi,
CategoryTheory.Ind, IsSifted, MvPolynomial - and by making the comparison an explicit
API item and unit test of the corresponding node. What is NOT done, and cannot be until
the infinity-categorical carriers exist, is to PROVE any of those comparisons.

## Requests to other roadmaps

| Supplier | What is needed |
| --- | --- |
| `EnhancedDerivedSheaves:E0` | The concrete enhancement and the higher-categorical operations this branch is abstract from: quasicategories, coCartesian fibrations, straightening and unstraightening, limits and colimits of infinity-categories, and the nerve. Everything in this packet is built on them. |
| `EnhancedDerivedSheaves:E3` | Coherent diagrams, Kan extensions and adjoints, and the presentability assertions the E5 stage text says E3 supplies when used. The universal properties of Ind and of P_Sigma are left Kan extensions, and the adjoint functor theorem is used throughout. |
| `EnhancedDerivedSheaves:E1` | Derived sheaves and presentability, and the spectral realisation whose comparisons E5:spectra-comparison is the return for. |
| `DerivedDeRhamCohomology:DD.0` | THE COTANGENT COMPLEX with its derivation characterisation, transitivity and base change, derived exterior powers and Tor-amplitude tests, built from the animation prefix of E5:animation. AUDIT-22 records DD.0 as the owner and as a duplicate of E5:cotangent-export's target; by PROTOCOL.md section 15 it is planned once, there, and re-exported here. |
| `StableHomotopyKTheory:H.5` | CONCRETE SPECTRA and spectral module categories. The E5:presentability stage text says StableHomotopyKTheory supplies them and that this stage does not construct them again; E5:spectra-comparison is the return that compares them with the abstract construction. |
| `LanglandsParameterStacks:LP1` | The consumer side of E5:animation: the moduli problem of L-parameters is defined on animated Z_l-algebras, and the statement that the classical stack represents the derived one is a statement about that. |
| `LanglandsParameterStacks:LP3` | The consumer side of E5:presentability: the good-filtration t-structure lives on IndPerf of a classifying stack, and its separatedness is a statement about that presentable stable category. |
| `LanglandsParameterStacks:LP4` | The consumer side of both: Perf and IndPerf of the parameter stack, the generation statement under cones and retracts, and the module description by Barr-Beck-Lurie. |
| `ExcursionOperatorsAndSpectralAction:ES0` | The consumer side of E5:abstract: the Hecke datum is an exact monoidal functor into an endofunctor category with a coherent Weil-group action, and the Bernstein centre is End(id) of a stable category. |
| `ExcursionOperatorsAndSpectralAction:ES2` | The rational spectral action, an action of a symmetric monoidal stable category on another; the equivalence of Theorem X.1.1 is a statement about the anima of such data, which is why the coherence matters. |
| `ExcursionOperatorsAndSpectralAction:ES3` | The integral spectral action, whose sifted-colimit approximation is an instance of the animation formalism of E5:animation. |
| `VStackSheavesAndLisseCategories:VS2` | The coefficient interpretation that the solid and condensed formalisms need from the enhancement; VS2 is recorded as a consumer of E5:presentability. |
| `GeometricSatakeAndFusion:GS4:integral-dual-group` | The dual group and the Satake category as a symmetric monoidal infinity-category over the integral coefficients; GS4 is recorded as a consumer of E5:abstract. |
| `GeneralAlgebraicKTheory:K.4:construction` | The K-theory construction, the second of the three consumer families the E5 stage text names. |
| `PrismaticCohomology:PR.5` | The prismatic consumer of E5:animation; the roadmap declares PrismaticCohomology PR.0-2 the owner of the generic prismatic application. |
| `PerfectoidQuotients:Q0:animated-application` | The perfectoid-quotient consumer of E5:animation; the roadmap declares PerfectoidQuotients Q0-4 the owner of that application. |

## Structural findings

### 1. E5:cotangent-export duplicates DerivedDeRhamCohomology:DD.0 by construction, and the stage text says so

*Kind: `duplicate-layer`.*

AUDIT-22 records DD.0 as a duplicate of both E5 and E5:cotangent-export, with the note
that 'DD.0 constructs the cotangent complex, derived exterior powers and Tor-amplitude
criteria that E5 re-exports'. The stage text agrees: 'The cotangent complex ... are now
constructed by DerivedDeRhamCohomology DD.0 from this animation prefix; E5 reexports
that one interface.' So the duplication is deliberate and documented, and this packet
plans nothing there. What is worth a restructuring decision is whether a layer whose
entire content is a re-export should be a LAYER at all. As it stands E5:cotangent-export
has two nodes in this packet, both boundary markers, and its coverage is recorded as
not_read. The alternative shapes are: fold it into E5 as a sentence in the parent
layer's text; or keep it as a layer but give it the one piece of content that is
genuinely its own and that DD.0 does not claim - the positive-characteristic comparison
with E-infinity algebras, which AUDIT-22 notes 'is stated only in this stage (DD.0 does
not mention E-infinity algebras)'. The second seems better: it gives the layer a reason
to exist, and it puts the warning about strictly commutative dg algebras somewhere a
reader will find it.

### 2. E5:abstract has one recorded input and ten recorded consumers, and its own text needs more than E0

*Kind: `missing-links`.*

The atlas records E5:abstract as requiring only EnhancedDerivedSheaves:E0, and as
supplying E5, E5:animation, E5:presentability, E5:spectra-comparison,
ExcursionOperatorsAndSpectralAction ES0, ES2 and ES3, GeneralAlgebraicKTheory
K.4:construction, and GeometricSatakeAndFusion GS4:integral-dual-group and GS4:rational-
reductivity - ten consumers against one supplier. The nodes of this packet that realise
E5:abstract need more: the idempotent-completion node needs presheaf categories and
their colimits, which is E3's; the stable-category node needs the derived category
comparison, which is E1's. The wider point is that E5:abstract is the single most
consumed layer in this part of the atlas, and it is also the one whose targets AUDIT-22
marks most comprehensively absent - no operads, no stable infinity-categories, no
E-infinity structures, only 1-categorical monoidal categories and the 1-categorical
Karoubi envelope. A kind:link job should draw the two missing edges; and a scheduling
decision is worth recording, that this layer gates ten others.

### 3. E5's acceptance tests mix this layer's obligations with DD.0's

*Kind: `narrow-text`.*

The five acceptance tests the E5 stage text names are: a polynomial algebra's cotangent
module; a regular quotient's two-term cotangent complex; a nonregular quotient with
higher homology; the Ind-envelope of perfect modules; and a coherent action whose
invariants carry higher group cohomology. The first three are cotangent computations
that DerivedDeRhamCohomology:DD.0 owns by this roadmap's own declaration and that
AUDIT-22 records as DD.0's. Only the last two are E5's. Leaving all five in E5's text
makes the layer look responsible for the cotangent complex, which the very next sentence
of the same text denies. The list should be split: the Ind-envelope and coherent-action
tests kept here, the three cotangent tests moved to DD.0's acceptance list with a
pointer. This packet plans the last two and records the first three as not planned,
which is the right outcome but should not have to be inferred.

