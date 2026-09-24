# Handoff — BP-MotivesAndAlgebraicCycles

Job `BP-MotivesAndAlgebraicCycles`, issue #1014. Agent: Claude Code, session `cc-7b31c4`, 24 September 2026.

**Continuation, same session.** The first pass left MC.4 and MC.7 `partial`. This continuation decomposes both,
so **all eight layers in scope are now `source_decomposed`**. The packet has **96 nodes**, 206 API items, 132
unit tests, 44 planets, 48 pinned baseline declarations, 8 gaps, 6 requests. `check_blueprint.py` still reports
**0 errors, 0 warnings**; `python3 -m unittest discover -s tests` → 273 tests, OK; `intake.py check-files` → 0
problems. The Lean file is now 825 lines with 178 `sorry`s and was **not compiled**.

**MC.4**, five new nodes, from the same source read further (MVW lectures 14 and 16, and one new source):

- `blow-up-triangle-and-formula` — (14.5.3) and (14.5.4): the blow-up triangle from cdh descent, and the
  splitting of the motive of a blow-up along a smooth centre of codimension `c`. This is what makes the
  geometric subcategory contain the motive of every finite type scheme.
- `motives-with-compact-support` ★ — Definition 16.13 through Corollary 16.17: `Mᶜ(X) = z_equi(X,0)`, its
  functoriality, `Mᶜ(𝔸ⁱ) ≅ ℤ(i)[2i]`, the localisation triangle, the Künneth isomorphism and geometricity.
- `borel-moore-motivic-homology` — 16.20 to 16.24: the two groups with their long exact sequences, the
  bivariant cycle cohomology, the shifting theorem, the flat pullback and Friedlander–Voevodsky duality.
- `cancellation-over-a-perfect-field` ★ — **the item that needed a new source**. MVW prove cancellation from
  duality and therefore assume resolution of singularities, and record the perfect-field version only as a
  remark with a reference. That reference is Voevodsky's *Cancellation theorem*, arXiv:math/0202012v1, read
  here from its e-print source: its main theorem and the final corollary give the statement over an arbitrary
  **perfect** field with no resolution hypothesis. The node states both forms and records which statements of
  the layer use which.
- `nisnevich-versus-etale-and-rational-coefficients` — 14.21 to 14.30: rationally the two theories agree, and
  over a perfect field Lichtenbaum motivic cohomology with rational coefficients is motivic cohomology with
  rational coefficients. What fails integrally is recorded.

**MC.7**, seven new nodes, from three newly obtained freely available sources:

- `hodge-conjecture` ★ — Deligne's official Clay problem description: the definition of a Hodge class, the
  conjecture, the Chern-class formulation, the proved degree-two case through the exponential sequence, and
  the two failures — the integral form is false, and the hypothesis that `X` be algebraic cannot be weakened
  to Kähler.
- `tate-conjecture` ★ — Totaro's survey, Conjecture 1.1, with Tate classes, the necessity of the hypothesis
  that the base field be finitely generated over the prime field, and the reduction along a finite extension.
- `tate-conjecture-variants` — the strong, Borel–Moore, separable-closure, integral and Tate–Beilinson forms,
  each with what is known; the integral form is recorded as mostly **false** and is never asserted.
- `lefschetz-and-hodge-standard-conjectures` ★ — Milne's notes: the two conjectures, Conjecture C as a weak
  form of the first, the positivity consequence of the second, and the exact status — a theorem in
  characteristic zero, known for very few varieties otherwise, implied by Hodge and Tate.
- `bloch-beilinson-filtration-and-murre` — the equivalence the source asserts, with an explicit record that
  the conditions of Murre's conjecture and the axioms of the filtration are **in no source read here**; a new
  gap gives the next source action.
- `motivic-t-structure` — the negative statement the sources make, recorded so that no node installs a
  conjectural t-structure as a theorem.
- `tate-and-hodge-known-cases` — the register the layer's acceptance condition asks for: Tate for divisors on
  abelian varieties over finite fields (Tate, through the Hom–Tate-module bijection and Zarhin's trick) and
  over number fields (Faltings); Moonen's theorem for `h²·⁰ = 1` in characteristic zero and André's
  hyperkähler case, both through Kuga–Satake; K3 surfaces over finite fields (Artin–Swinnerton-Dyer,
  Nygaard–Ogus, and the supersingular case completed by Charles, Kim, Madapusi Pera and Maulik); and the
  unconditional degree-two case of the Hodge conjecture. Every entry carries base field, characteristic,
  codimension and coefficients.

Two new gaps: the conditions in Murre's conjecture and the Bloch–Beilinson axioms, and the unread proofs
behind the K3 entries. Both name the next source action.

The three new sources, all free and hashed: Deligne, *The Hodge Conjecture* (Clay), SHA-256 `e308d945…f0c8`;
Totaro, *Recent progress on the Tate conjecture* (Bull. AMS 54, author's copy), SHA-256 `53be841c…6ec5`;
Voevodsky, *Cancellation theorem* (arXiv:math/0202012v1), PDF SHA-256 `834de6dc…0d6a`, e-print archive
SHA-256 `0a8fe209…0a46e`.

---

The first pass's note follows, kept as written.

Deliverables:

- `research/blueprint/packets/MotivesAndAlgebraicCycles.json` — 84 nodes, 172 API items, 112 unit tests,
  39 planets, 48 pinned baseline declarations, 6 gaps, 6 requests, 2 structural proposals, 5 source findings.
  `python3 scripts/check_blueprint.py`: **0 errors, 0 warnings** against the pinned declaration index.
- `research/blueprint/readmes/MotivesAndAlgebraicCycles.md` — the roadmap document, 4459 lines.
- `research/blueprint/suggested/MotivesAndAlgebraicCycles.lean` — 728 lines of signatures.

## What is closed

Six of the eight layers in scope are decomposed to declaration granularity, each against a source read in full
for the part used.

**MC.0** builds the graded category of correspondences over `ℚ`: the groups `Corr^r` with the shift by the
dimension that makes a graph have degree zero, the action on cycles, composition through the triple product
with associativity and the two identifications with Chow groups, graphs and the contravariant functor, the
diagonal as identity, the transpose, what graphs do to cycles, the symmetric monoidal structure, and the two
projectors on the projective line together with the three on a pointed curve, which are the layer's own
acceptance tests. Adequate equivalence relations, numerical equivalence and homological equivalence relative
to a chosen theory are decomposed here too.

**MC.1** builds the Chow motives: the triples with their two-sided cut morphism groups, the Karoubian additive
`ℚ`-linear category, the motive functor, the tensor structure, the Tate twist, the identification of the
Lefschetz motive with the inverse twist, the decomposition of the motive of the projective line, the universal
property, duality and rigidity, the Chow groups of a motive and their representability, Manin's identity
principle, and the projective bundle formula with the explicit correspondences that realise it. The same
construction modulo an arbitrary adequate relation, which MC.3 quantifies over, is planned here.

**MC.2** owns what a realisation is: the data, the three axioms, the cohomological pushforward, the trace of a
cycle class as a degree, the Künneth decomposition of the diagonal with its sign, the Euler characteristic as
a self-intersection, and the equivalence between classical Weil cohomology theories and `ℚ`-linear symmetric
monoidal functors on motives with the two extra conditions that replace the two axioms the functorial
description does not see.

**MC.3** is Jannsen's paper in full: the trace formula, the Wedderburn lemma with the dual-numbers
non-example that shows its hypothesis cannot be weakened, the three-way equivalence characterising numerical
equivalence, the radical computation, the rank computation that forces the sign change, and the Tannakian
conclusion after it.

**MC.5** and **MC.6** build Nori's machine and its consequence: diagrams and representations, the endomorphism
coalgebra, the diagram category as its finite comodules, graded multiplicative diagrams and localisation, the
diagrams of effective, good and very good pairs, Nori motives with their tensor structure, the comparison of
the three diagrams, cohomology with supports, rigidity, the motivic Galois group, the comparison algebra, the
formal periods with their three relations, and the theorem that `Spec P` is a torsor under the motivic Galois
group. The period conjecture is used nowhere.

## What remains, precisely

**MC.4** is `partial`. RS-08 narrows it, and this packet plans exactly what the narrowing leaves: the geometric
subcategory, the Tate stabilisation resting on the imported cancellation theorem, homotopy invariance and
Mayer–Vietoris, the motives of the affine line, the multiplicative group and projective space with the
projective bundle isomorphism, the Gysin triangle with the boundary map at a closed point of a smooth curve,
rigidity, and the two comparisons. Four things remain, each named in the coverage record:

1. the blow-up triangle and the motive of a blow-up along a smooth centre, stated in the source read but
   proved in lectures not read, and needed for the claim that the geometric subcategory contains the motive of
   every finite type scheme;
2. motives with compact support and Borel–Moore motivic homology, used in the identification of the dual of
   the motive of a smooth scheme;
3. the perfect-field form of the cancellation theorem, attributed in the source to a later paper of
   Voevodsky that was not read — every node here that uses cancellation carries the resolution of
   singularities hypothesis of the version that was read;
4. the comparison of the Nisnevich and étale constructions, and rational coefficients.

**MC.7** is `partial`. It plans the two conjectures the sources state precisely, Conjecture C and Conjecture D,
each as a typed predicate relative to a chosen theory, with the register of known cases and the one
unconditional nilpotence statement available. The Hodge conjecture, the Tate conjecture, the strong Lefschetz
and Hodge standard conjectures, the Bloch–Beilinson filtration and Murre's conjectures, and a motivic
t-structure are **not** planned: no source read for this packet states any of them precisely, and writing them
from memory is exactly what the protocol forbids. A continuation job needs a source for each.

## Requests made to other roadmaps

- `SchemeAndStackFoundations:SF.5` — Chow groups with rational equivalence, proper pushforward, flat and lci
  Gysin pullback, the intersection product with associativity and the projection formula, flat pullback
  against proper pushforward in a fibre square, the proper intersection formula, the degree of a zero cycle,
  the Chow ring of a projective bundle, the top Chern class and the Chern classes of a twist. Every one of
  these is cited by name in the construction this packet plans; the reviewed audit of SF.5 records all of them
  as absent from both pinned libraries.
- `SchemeAndStackFoundations:SF.2` — an actual Weil cohomology theory, with its cycle class and trace maps.
- `SchemeAndStackFoundations:SF.6` — the comparison isomorphisms between the realisations, which the torsor
  statement of MC.6 needs.
- `SchemeAndStackFoundations:SF.3` — smooth projective curves with divisors and degrees, and normal crossings
  divisors.
- `MotivicEtaleKTheory:M.4` — Bloch's higher Chow groups with moving, localisation, homotopy invariance and
  products.
- `MotivicEtaleKTheory:M.5a` — finite correspondences, Nisnevich sheaves with transfers, `A¹`-localisation,
  the effective motivic category and the cancellation theorem.

## Structural proposals

Two, recorded in the packet's `restructure` list; this packet works with the current structure.

1. **MC.2 should own the axioms of a realisation, not the construction of any realisation.** Its brief asks
   for both; the second duplicates SF.2 and SF.6, which is what PROTOCOL section 15 forbids. RS-08 narrowed
   MC.4 for the same reason and did not reach MC.2.
2. **MC.7 should be divided into a statements sub-layer and a proved-cases register.** The two halves have
   different acceptance tests and different source routes, and mixing them is what makes the layer hard to
   close.

## Sources read, and sources missing

Read in full for the parts used, all freely available, each with its SHA-256 recorded in the packet: the
Stacks Project's chapters on Weil cohomology theories and on Chow homology, at a pinned commit of the source
repository; Jannsen's 1992 paper, from the author's copy in the University of Regensburg repository; Huber and
Müller-Stach, arXiv:1105.0865v5; Mazza, Voevodsky and Weibel's Clay lecture notes; and Milne's expository
article on motives.

Missing, each recorded as a gap in the packet: a source defining algebraic equivalence; von Wangenheim's paper
for the universal property of Nori's diagram category, which the source read says it does not prove; Murre's
1990 paper, Kleiman's 1968 survey and Katz–Messing for the three known cases of Conjecture C; Deligne's
article on Tannakian categories for the criterion the last step of MC.3 invokes; and a source that states the
Hodge and Tate conjectures precisely.

One gap is of a different kind and worth flagging to a reviewer: Jannsen states the trace formula as well
known and cites Kleiman's survey, which was not obtained. Rather than resting the node on an unread source,
its proof steps derive the formula from the Künneth decomposition of the class of the diagonal, which the
Stacks chapter proves, together with the self-intersection computation there. The node says so.

## Findings in the sources

Five, recorded in `sourceIssues`, all misprints, none affecting a stated result:

- two in Huber and Müller-Stach: Theorem 2.10's two parenthetical definition references are crossed and
  neither is right, and the proof of Corollary 3.4 cites a remark as a theorem where Theorem 2.10 is meant;
- three in the Stacks Project: the proof of the composition lemma names "the fourth equality" twice in a chain
  with five equalities, the proof of part (2) of the graph lemma writes the pushforward symbol for the
  pullback while displaying the pullback formula, and "coclude" for "conclude".

Each is quoted at its locator with the check that shows it, and each was looked for in the current master of
the respective source; all five are recorded as `new`.

## Did the Lean file compile?

**No.** No Lean toolchain at the pinned commits was available in this session, and the shared Mathlib build on
this machine is a cache that a worker must not rebuild. Elaboration of
`research/blueprint/suggested/MotivesAndAlgebraicCycles.lean` has therefore **not** been established, and the
file says so in its header. The signatures are written against Mathlib declarations that were each confirmed
to exist in the pinned declaration index — the Karoubi envelope, the monoidal, braided, symmetric and rigid
classes, the abelian and pretriangulated classes, the localisation predicate, semisimple rings and the Jacobson
radical — and against Tau Ceti's finite comodule categories, Wedderburn presentations and Tannaka
reconstruction. A continuation job with a toolchain should elaborate it before anything else.
