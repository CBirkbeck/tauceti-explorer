# Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue #526, job `REV-AnabelianGeometryAndNonabelianChabauty`. Current reviewer:
Codex `codex-CS32rR`, 2026-10-05. Input explorer commit:
`c5c5af2032b33bc80d5a0353e4abefe392b1d922`, including the earlier independent
review checkpoint [#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170)
by `codex-rkkbhf`. Neither reviewer session authored the blueprint.

**This review is unfinished.** No top-level `review` object or acceptance
verdict is written. The packet's `complete` status means a budget-complete
planning pass, not a completed review. NC.0 and NC.3 remain partial; the other
five stages remain not_read. Every implementation status is `unchecked`.

The current packet has 363 nodes: 4 definitions, 60 constructions, 265 lemmas,
27 theorems and 7 comparisons. The checker counts 320 API entries and 250 tests
on definitions/constructions; across all node kinds there are 340 API entries
and 264 tests. There are 160 baseline declarations, 17 supplier requests,
10 gaps and 11 planets. This checkpoint adds one definition node, five
baseline entries and one comparison gap. It removes no baseline citation and
changes no supplier ownership or stage status.

## Corrections in this checkpoint

1. Added `NC.3/equivariant-topological-torsors`, marked
   `addedBy: REV-AnabelianGeometryAndNonabelianChabauty`. The classification
   theorem previously introduced its torsor object without a definition node,
   API or tests. The new node reuses native `Torsor Uᵐᵒᵖ P` and
   `IsTopologicalTorsor P`, adding the compatible G-action and semilinearity.
   It specifies a **nonempty** topological carrier,
   jointly continuous right U- and left G-actions, homeomorphic orbit maps,
   and the semilinearity law. A continuous free transitive action alone does
   not ensure the topology has a continuous orbit inverse.
2. Added the actual `Torsor.Iso`: a native homeomorphism preserving both
   actions, with extensionality, identity, inverse and composition. Added its
   `isoSetoid`, whose relation is `Nonempty (P.Iso Q)`. The prototype now has
   `classOf_eq_classOf_iff` and
   `classification : Quotient (Torsor.isoSetoid G U) ≃ H1 G U`, with the
   quotient evaluation formula. The earlier class map and surjectivity alone
   did not express injectivity on isomorphism classes.
3. Added the orbit homeomorphism by composing native
   `MulOpposite.opHomeomorph` and `Homeomorph.smulConst`, rather than rebuilding
   the underlying torsor action or division. Added the cocycle model and coordinate homeomorphism,
   the right/left coordinate formulas, point-cocycle specification,
   change-of-point formula, preservation by isomorphisms, model cocycle and
   class-map evaluation. A coordinate homeomorphism avoids identifying
   carriers in different universes by an ill-typed equality. The new definition
   has 18 API entries and five typed tests; the classification theorem has
   eight API entries. All corresponding forms are in the suggested file.
4. Added the separate algebraic-torsor comparison gap and qualified the
   classification theorem's geometric acceptance items. Kim's Proposition 1
   classifies filtered affine-algebra torsors, whereas this node is an authored
   topological abstraction of its pointwise argument. Poonen's algebraic
   classification additionally uses Galois descent. A point-space class map
   cannot establish scheme isomorphism or descent/effectivity by itself.
5. Supplied four typed examples for the inherited test names
   `tests.invariants`, `tests.continuity` and `tests.h1_abelian`: negation versus
   trivial C₂-action on ℤ; countably many continuous C₂-characters of the
   countable product versus uncountably many abstract characters; and neutral
   H¹ for C₂ acting by negation on C₃. The action hypotheses are explicit.
6. Supplied the four missing twisting tests. The trivial twist checks its
   action and cocycle evaluations and compatibility with the class map; the
   commutative case checks the original action and translation by c. For
   discrete C₂ acting trivially on S₃ with c(generator)=(01), the twisted
   invariants have cardinality 2, the original invariants have cardinality 6,
   and the twist equivalence carries the neutral point to a nonneutral class.
   The discrete topology, trivial original action and transposition hypotheses
   are retained. Reconciled the omission ledger for these actual examples and
   for already present instances/tests; unrelated omissions remain open.
7. Corrected the reserved K(π,1) node's Schmidt–Stix locator: the cohomological
   criterion is in the **proof** of Lemma 2.7(b), not its statement. Added
   Achinger's version-of-record Definition 4.1 as the direct source for the
   canonical all-degree, all-finite-coefficient predicate, with its coherent
   scope distinguished from the packet's wider parameterized predicate.
8. Visually inspected the scanned degree diagram in Schmidt 1996,
   Proposition 15, printed pp.243–244, and updated the gap's obsolete
   uninspected-diagram wording. The diagram's degree-two restriction is
   multiplication by the covering degree. This does not close the generic
   cohomology, curve-degree or descent suppliers. Replaced the packet's
   outdated summary counts and recorded the current checkpoint in NC.3's
   remaining work.

The previous checkpoint's corrections are retained: `MulAction.toPerm` versus
`toPermHom`; acting-subgroup continuity; `Z1.mem_iff` and the named identity
instance; the actual conjugation-action target of `H1.equivOfTrivial`;
`Z1/H0.equivContCohomology`; named twisted continuity and `Twist.self`; the
four-cocycle/two-class S₃ tests; Kim Albanese §4's locator; and the duplicate
coefficient-map dependency. Its original report remains accessible in #6170.
Historical encoded recovery payloads and receipts are preserved; their build
claims are not independent review evidence.

## Fresh mathematical and source checks

The torsor calculation fixes the order conventions: gp=p·cₚ(g),
cₚ(gh)=cₚ(g)g(cₚ(h)), and cₚᵤ=u⁻¹·cₚ under the existing gauge action
u·c(g)=u c(g)g(u)⁻¹. The model is g⋆x=c(g)g(x), and gauge-related models
are isomorphic by the corresponding left translation. An equivariant
homeomorphism preserves the point cocycle. Conversely, equal gauge classes
identify suitably changed point cocycles, and the two orbit homeomorphisms
produce the required isomorphism. A fixed point is exactly a point with trivial
cocycle. These arguments justify the added abstract signatures, without
claiming their `sorry` proofs are implemented.

Fresh reading included Kim's §1, Propositions 1–3 and proofs on printed pp.5–10
of [arXiv v1](https://arxiv.org/pdf/math/0409456v1), the selected torsor
passages in [Poonen](https://math.mit.edu/~poonen/papers/Qpoints.pdf),
Schmidt–Stix §2.3, pp.826–828 in the
[Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
Achinger [2017 §4](https://link.springer.com/article/10.1007/s00222-017-0733-5),
FKW [v2 §2.3.1 and §3.2.2](https://arxiv.org/pdf/2110.05534v2), and the actual
[Schmidt 1996 pages](https://www.numdam.org/article/CM_1996__100_2_233_0.pdf).
The acquired PDFs match the retained packet hashes. This is selected reading,
not whole-paper or all-locator certification.

The reserved `key/etale-k-pi-1` occurs once. Its API/tests cover the inventory's
field, P¹ obstruction, affine and positive-genus curves, characteristic-zero
products, Artin towers/M₀,n and the qualified raw-homotopy comparison. It uses
the canonical comparison in every degree for each permitted coefficient;
p-primary coefficients retain the full fundamental group. The cited raw equivalence retains Achinger's
geometrically-unibranch hypothesis. FKW's constant-Fₚ edge comparison and its specially justified pro-p
inflation are separate inputs. The corresponding geometric Lean interfaces
remain explicit omissions, rather than dummy proposition carriers.

Selected Stacks statements and proofs were checked at tags
[03QQ](https://stacks.math.columbia.edu/tag/03QQ),
[03RQ](https://stacks.math.columbia.edu/tag/03RQ),
[0AMB](https://stacks.math.columbia.edu/tag/0AMB),
[03RR](https://stacks.math.columbia.edu/tag/03RR),
[03PL](https://stacks.math.columbia.edu/tag/03PL),
[03P8](https://stacks.math.columbia.edu/tag/03P8),
[0BA0](https://stacks.math.columbia.edu/tag/0BA0),
[03RP](https://stacks.math.columbia.edu/tag/03RP),
[03RV](https://stacks.math.columbia.edu/tag/03RV),
[09YQ](https://stacks.math.columbia.edu/tag/09YQ) and
[07RR](https://stacks.math.columbia.edu/tag/07RR).
The comparison needs the canonical Kummer boundary and degree pullback, not an
arbitrary H² isomorphism. Separable descent needs both eventual cover descent
and eventual zero of a class; continuity does not make restriction injective.
Generic proofs used by these statements, the full curve section, Künneth and
finite-presentation descent have not been read to closure.

## Baseline, ownership and limits

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Lean sources were read from those
git objects. The five new entries are native `Homeomorph`
(`Mathlib/Topology/Homeomorph/Defs.lean:43`), `Torsor`
(`Mathlib/Algebra/Torsor/Defs.lean:70`), `IsTopologicalTorsor` and
`Homeomorph.smulConst` (`Mathlib/Topology/Algebra/Group/Torsor.lean:35,100`),
and `MulOpposite.opHomeomorph` (`Mathlib/Topology/Algebra/Constructions.lean:50`).
Their complete statements and bodies were read; there is no finiteness or
separation assumption. The equivariant bundle uses the native torsor and
continuity classes. Native scalar division supplies the continuous orbit inverse,
and the orbit homeomorphism is the actual native composition.

Selected inherited declarations were reread with context, including LowDegree
cochain signs, native continuous cohomology, Shapiro, subgroup actions,
quotient/embedding continuity and finite-quotient transitions/colimits. A
basename search can accidentally find another namespace's declaration;
qualified embedding, quotient-map and action-continuity statements were
inspected separately. This is not a completed audit of all 160 citations
against every consumer. Incoming `checked` receipts remain attributed to their
original authors, not silently converted into this review's verdicts.

Read the seven reviewed library audit records, supplier stage descriptions and
current SF/IG packet inventories. SF.2 is accepted but partial and its current
nodes chiefly cover other owned targets; SF.3 and IG.0/IG.1/IG.6 have no
completed relevant fine-grained supply here. Their requests remain contracts,
not established results. ProfiniteCohomology Layer 10 explicitly owns the
all-degree finite-quotient colimit; the native degree-one additive theorem is
not the arbitrary nonabelian or geometric comparison. The AlgebraicTopology
and JacobianChallenge upstream documents were read as granularity/boundary
comparators. No supplier file, roadmap reader or atlas data was edited.

`sourceIssues` remains empty. No source-error verdict is asserted; the complete
screen remains unfinished. Planet naming and every remaining node's source,
closure, API, tests and typed prototype still need the detailed independent
review described in the handoff.

## Validation

The packet checker reports **0 errors and 0 warnings**. `git diff --check`
passes. The full suggested file was attempted with `lean-check`; import failed
because the existing pinned build lacks
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library build, update, cache download or language server was started.

The final temporary Mathlib-only projection removes exactly `import TauCeti.*`
lines and the whole `section Abelian` through `end Abelian`. It elaborated with
`lean-check`, exit code 0: **690 warnings, all uses of `sorry`**, no errors or
other warnings. Available memory was 95 GiB before that check. This checks the
prototype forms, not their proof correctness, and excludes the additive
comparisons. The full suggested file remains uncompiled.

Projection SHA-256:
`3c673ea43f7d115078d17426699c2a8db4f38aafa73e6a44596e9b8b44494a57`.
Suggested file SHA-256:
`7d153ef927b6b1637f5dba083e4b65566e041afb238b8fb5db4e889699e2cb15`.

## Questions for the orchestrator

- Does IG.0's remit explicitly include the geometric product theorem and P¹
  fundamental-group computation, beyond its finite-étale fibre-functor
  dictionary? The requests retain these precise contracts but the current
  finer packet has not supplied them.
- Reconcile the unaccepted EtaleHomotopyTypes candidate with the generic raw
  homotopy/fibration foundations; it cannot be treated as a registered supplier
  or depend on the NC.0 consumer for its generic inputs.

No final verdict should be inferred from this checkpoint.
