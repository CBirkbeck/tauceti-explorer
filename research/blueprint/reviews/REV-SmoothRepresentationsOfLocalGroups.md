# Independent review: Smooth representations of local groups

**Verdict: accepted, with corrections.** Job REV-SmoothRepresentationsOfLocalGroups,
issue #9909; Codex session `codex-1WUrIO`, 16 October 2026. The author of the
input plan was a different session. Reviewed the packet, reader and suggested
file in full, including the import registry, residual contracts and source issues.
Acceptance is of a completed target-level planning pass. It does not assert
that the mathematics has been formalised, close the eight gaps, or accept the
older SR.4 packet wholesale.

## Counts and stage coverage

| Item | Reviewed result |
| --- | --- |
| New nodes | 11: 4 constructions, 2 definitions, 5 theorems |
| Per-node judgments | 8 verified, 3 corrected; none added or unverifiable |
| Definition/construction API | 18 items across six objects |
| Discriminating tests | 21; every definition/construction has at least three |
| Planets | 8; no stage has more than six |
| Baseline declarations | 14 confirmed; none removed or replaced |
| Existing atlas adapters | 170 distinct IDs: 100 SR.0 and 70 SR.4 |
| Upstream inventory | 166 named targets, replacing the stale count of 157 |
| Gaps / supplier requests | 8 / 3, retained explicitly |
| Stages | All 11 planned; none closed; implementation unchecked |
| Suggested Lean | 62 lines, one real-bodied predicate, three API statements and three examples |

The three SR.0 entries import the early arbitrary-ring category and its distinct
derived successor. SR.1 adds the compact-section cosheaf to imported Hecke
algebras and the ordinary coefficient-linear centre. SR.2, SR.2a, SR.3a and SR.4
import the existing induction, complex second-adjointness, early uniform bound
and Satake contracts. SR.3 adds the nine Schwartz/principal-series targets.
SR.5 imports the integral GL_n theory and retains its essential-vector gap.
SR.6 imports finite-wild parameters and stable operators, retains the qualified
late DHKM IDs, and adds only the generic finite-central-algebra predicate.
Each stage has an explicit target assignment or named gap/request. These are
planning statuses, with no implementation promotion.

## Corrections made

1. **Public upstream snapshot and overlap.** The supplied read-only checkout
   identifies itself by `0d144d044dacebca17b654695b6f1ad58f159b27`, which GitHub
   does not resolve as a public commit. The merged [upstream PR #793](https://github.com/TauCetiProject/TauCetiRoadmap/pull/793)
   has a later README and Suggested.lean. Read both at merge revision
   `10432b146c0828ab379e76f9c630a76578b98430`; rebuilt every upstream line anchor
   and the entire inventory against that immutable public revision. All 157
   supplied target names survive, and nine additional targets are imported.
   They cover unitary spherical coefficients, finite discrete cup comparison,
   distinguished cuspidal types, type projectives, GL_n Witt-coefficient second
   adjointness, modular generic segments, complex segment conventions, stable
   cuspidal lattices and contracting Hecke operators. The generic stable-operator
   target has moved to SR.5.2. The GL_n W(k) second-adjointness theorem does not
   replace the general reductive-group/all-Z[1/p]-algebra DHKM theorem retained
   under the old SR.6 ID. No upstream target is replanned.
2. **Dependency direction.** Removed `SR.6/integral-center-finiteness` from the
   prerequisites of `part-ii-finite-central-algebra`. The former theorem proves
   the latter predicate for the Hecke algebra; the generic definition and its
   noetherian consequence require only the five cited baseline algebra APIs.
   Recorded the consuming theorem in `uses` and corrected the reader.
3. **Existing carriers.** Corrected the false blanket explanation that compact
   sections lack a carrier at the pins. `CompactlySupportedContinuousMap` with
   discrete target provides it. The natural open-set diagram, extension by zero,
   gluing and coefficient-change construction remain reader targets under the
   12 October shape rule. Replaced all ten generic Lean-omission explanations
   by the actual missing interface for each target. The completion carrier
   itself is also already present.
4. **Topological coefficients.** Made explicit that the arbitrary algebraic
   coefficient ring, as well as its module, is given the discrete topology when
   using `DiscreteRep`; its continuous scalar action must be satisfied.
5. **Analytic closure.** Opdam–Solleveld §3 uses weighted L² seminorms. The plan's
   Ξ-weighted supremum presentation requires a comparison with that model as
   well as convolution and completeness estimates. Added that exact obligation
   to the construction route, source match and G-SCHWARTZ-ANALYSIS. It is not a
   consequence of the building or compact convolution alone.
6. **Centre boundary.** Clarified that the ordinary Lambda-linear CatCenter and
   inverse-corner theorem belong to SR.1 independently of SR.0d. The enhanced
   π₀End(id) comparison retains G-DERIVED-ENHANCEMENT, without making it an
   input to the ordinary centre or introducing an upward dependency.
7. **Evidence and synchronization.** Corrected He's compact-function locator
   to printed pp. 6–7, added precise supplier checks, independently confirmed
   both source issues, recorded baseline verification and all eleven node
   verdicts, and synchronized the reader and Lean comment. Lean statements
   and node/test/planet counts are unchanged.

## Node-by-node mathematical review

IDs below have prefix `SmoothRepresentationsOfLocalGroups:`. The packet's
`review.checked` records the same judgments.

| Node | Verdict and evidence |
| --- | --- |
| SR.1/part-ii-compact-section-cosheaf | Corrected. He §1.1–§1.2, pp. 6–7, fixes compact-function conventions; upstream SR.1.1 supplies clopen refinement. A compact support meets a finite subcover, refined into finitely many disjoint clopen pieces. This gives extension-by-zero gluing, the cover coequalizer and arbitrary module coefficient change without flatness. Empty, overlapping finite-space, nonflat and infinite-discrete tests distinguish support and exactness errors. |
| SR.3/part-ii-schwartz-algebra | Corrected. Opdam–Solleveld §3, pp. 9–12, and Schneider–Zink §1–§2 supply the locally unital corner setting. Retained complex coefficients, the enlarged-building length, Fréchet corners and their union. The norm comparison and analytic estimates are explicit obligations, with compact-group, torus-decay, idempotent and zero tests. |
| SR.3/part-ii-tempered-schwartz-modules | Verified. Opdam–Solleveld introduction p. 1 and §3, pp. 9–10. The equivalence with tempered representations retains admissibility and a scalar central character; the algebraic Schwartz-module category itself allows larger objects. Local units, restriction and the admissible extension criterion are usable API items. The tests distinguish this category from a whole Bernstein block. |
| SR.3/part-ii-schneider-stuhler-comparison-resolution | Verified. Opdam–Solleveld Theorem 1.2, pp. 4–5; Theorems 2.1–2.2, pp. 5–7; Theorem 4.2 and Proposition 4.3 proof, pp. 14–17. Good-level generation and the admissible source are essential. Completed contraction, scalar extension and the comparison of algebraic Hom complexes are separate steps. The imported building alone does not prove the analytic contraction. |
| SR.3/part-ii-schwartz-ext-comparison | Verified. Opdam–Solleveld Proposition 4.3(a)–(c), pp. 16–17. The source is admissible; the target may be any algebraic Schwartz module. The additional good-K generation hypothesis belongs to the corner comparison. No arbitrary-target Fréchet topology is imposed. |
| SR.3/part-ii-discrete-series-tempered-projectivity | Verified. Schneider–Zink Proposition 2.3, pp. 8–9, proves the projectivity over G⁰; their discussion p. 5 identifies G/G⁰ and gives G=G⁰ when the centre is compact. Corollary 3.5, pp. 17–18, concerns the unramified family in general. Opdam–Solleveld Proposition 4.3 transfers the Ext vanishing; Gan–Savin Proposition 5.3, pp. 17–18, uses it. Retained compact centre, actual Schwartz action and the noncompact-torus self-extension control. |
| SR.3/part-ii-principal-series-centre | Verified. CEGGPS §3.13, pp. 44–48, especially Lemmas 3.19, 3.21–3.22, and Ding §3.1.1/Proposition 3.3 proof, pp. 33–36. The finite splitting extension, Laurent coordinate algebras, actual E-linear block centre and possibly twisted Weyl action are explicit. This is a sourced E-linear construction, not an automatic scalar extension of the complex block. |
| SR.3/part-ii-ordered-character-map | Verified. Ding Proposition 3.3(2), proof p. 36, and p. 57; CEGGPS Lemma 3.22, p. 47. The lower-Borel unnormalized induction and η twist fix the map. The corrected relation is J_w₂∘p=J_w₁ for a source reordering p, with the contravariant ring map. Identity, rank-two swap and rank-one tests check direction and normalization. |
| SR.3/part-ii-principal-series-completion | Verified. Ding after (3.55), p. 57, with CEGGPS Lemma 3.22. The generic ordered characters give a free rational orbit and the expected n-variable formal torus. The finite-quotient local comparison and formal-coordinate interfaces are precise requests to SF.1/SF.4, not claims that `AdicCompletion` proves the result. |
| SR.3/part-ii-principal-series-tangent | Verified. Ding Proposition 3.3 and proof, pp. 35–36, and p. 57. Only the smooth self-extension summand is claimed; smooth additive torus characters have dimension n. The locally analytic directions are excluded. G-PRINCIPAL-EXT correctly requires a generic-block/Jacquet proof of the Ext identification, independently of the completed-centre computation. |
| SR.6/part-ii-finite-central-algebra | Corrected. DHKM Theorem 1.1, p. 1, and Corollary 1.4, p. 2, distinguish finite module over the centre from finite-type centre over the coefficient ring. The generic noetherian implication uses the finite-type Hilbert basis theorem followed by finite-module noetherianity. Its definition has no Hecke theorem prerequisite. The field, polynomial and Z→Q tests distinguish both finiteness clauses. |

## Pinned baseline evidence

Read each declaration and its surrounding assumptions at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All names exist at those pins and
support their recorded use. Paths below are relative to the appropriate library;
line numbers refer to those revisions, not today's main.

| Declaration | File:line | Confirmed scope |
| --- | --- | --- |
| Representation | Mathlib/RepresentationTheory/Basic.lean:49 | Monoid homomorphism into linear endomorphisms; no smoothness condition. |
| Representation.invariants | Mathlib/RepresentationTheory/Invariants.lean:74 | Submodule fixed by every element of the specified acting group. |
| CategoryTheory.CatCenter | Mathlib/CategoryTheory/Center/Basic.lean:31 | Endomorphisms of the identity functor; ordinary categorical centre. |
| CategoryTheory.Linear.toCatCenter | Mathlib/CategoryTheory/Center/Linear.lean:36 | Scalar ring map for a linear preadditive category. |
| LocallyConstant | Mathlib/Topology/LocallyConstant/Basic.lean:203 | Locally constant functions; compact support is additional. |
| CompactlySupportedContinuousMap | Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41 | Continuous maps with compact support; discrete target gives the compact-section carrier. |
| Subalgebra.center | Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:906 | Commutative central subalgebra of a possibly noncommutative algebra. |
| Module.Finite | Mathlib/RingTheory/Finiteness/Defs.lean:117 | Finite generation as a module. |
| Algebra.FiniteType | Mathlib/RingTheory/FiniteType.lean:39 | Finite generation as an algebra, a different condition. |
| IsNoetherianRing.of_finite | Mathlib/RingTheory/Noetherian/Basic.lean:340 | Finite scalar module gives left noetherianity with the specified scalar tower. |
| AdicCompletion | Mathlib/RingTheory/AdicCompletion/Basic.lean:171 | Compatible inverse limit of ideal-power quotients, without a Bernstein comparison. |
| TauCeti.DiscreteRep | TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean:550 | Discrete module with continuous scalar and group actions. |
| TauCeti.discreteRepEquivSmoothTopRep | Same Tau Ceti file:678 | Existing equivalence, identity on underlying modules, already for topological monoids. |
| Algebra.FiniteType.isNoetherianRing | Mathlib/RingTheory/FiniteType.lean:183 | Finite-type commutative algebra over a noetherian commutative base is noetherian. |

No baseline citation was removed. The two discrete-representation descriptions
were qualified, and the two existing carriers were acknowledged accurately.
Also read the relevant current Tau Ceti APIs at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed
`data/library-coverage.json` has no direct row for this roadmap; checked its
relevant GL₂, continuous-cohomology, derivative, parameter-stack and double-coset
consumer entries. Existing discrete carriers, categorical centres, completion
and double-coset products are imported. None of the eleven extension targets is
there shown to be implemented.

## Suppliers, inherited chain and confirmed findings

Read SchemeAndStackFoundations package T187 (SF.1 finite-group quotient) and
T365–T370 (SF.4 formal smoothness, Artin coefficient categories, tangent spaces
and hulls). The two requests specialize these existing owners to free-orbit
completions and the formal torus/derivative comparison. They request exact
interfaces rather than duplicating quotient or deformation foundations.
Read the current ReductiveGroupsPartII RG2.2 building/apartment/facet contracts,
RG2.3.6 filtration and RG2.4 Iwahori factorization. Its enlarged-building exports
supply geometry, with the analytic coefficient resolution remaining here.

Checked the accepted SR.0 review and the `needs_changes` SR.4 review. The 170
adapters are exhaustive and distinct; 152 use the same upstream target name,
four retain qualified supplier aliases and fourteen remain existing residual
Part II IDs. The new public inventory is exhaustive at the cited revision.
Read DHKM v2 §§1–4, pp. 1–16, for all qualified late-chain contracts. Read FS v4
Corollary V.1.4, pp. 170–171; the integral cocycle passage p. 280; VIII.4.1,
pp. 291–292; IX.0.1–IX.0.3, pp. 317–319; IX.5.1–IX.5.2, pp. 327–329;
IX.6.1–IX.6.5, pp. 330–333; IX.7.2–Corollary IX.7.3, pp. 335–338.
Retained the distinction between unreduced excursion action and spectral-centre
descent, the latter's component-group condition, the torus/central-character
qualifications, the cyclotomic twist, and the different coefficient scopes of
DHKM centre finiteness and second adjointness. Dat inputs not read in primary
form remain G-DAT-CONSEQUENCES.

The verified RT-AREA-geomlanglands/9 finding is handled by the ordinary SR.1
coefficient-linear centre and its corner/separatedness theorem. ES0's centre
sentence and the SR.1→ES0/ES7 adapters still need the maintainer's cross-file
application. The comparison to an enhanced centre has an honest separate gap.
RT-AREA-geomlanglands/26 is handled by using one integral finite-wild scheme,
with ℓ-adic models by base change. Existing upstream SR.6 owns it; LP1 is a
higher tier. G-OWNERSHIP correctly leaves the LP1 re-export/owner reconciliation
to the maintainer without a second construction or an upward prerequisite.
The RS-21 review is now accepted, so the older finding's contrary premise is
not repeated as current status. No other roadmap was edited.

## Source issues and validation

Independently confirmed E1 (source-permutation composition order) and E2
(coordinate algebra versus multiplicative-group spectrum) in Ding's published
Proposition 3.3 proof, p. 36, and completed-centre discussion p. 57, and arXiv
v2 pp. 39–40 and 61. Added the required `review` objects. Checked the arXiv
history, published article page and author/title correction search; found no
linked correction as of 16 October 2026. These are notation/type misprints
with the intended mathematical conclusions unchanged. The reader retains the
published/preprint page crosswalk. All eight primary-source hashes and the
additional Ding v2 hash match the packet. No source passages or book material
were copied into the repository.

Validation on the final files:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups.json --json`, also with the shared pinned declaration index: exit 0, no errors or warnings.
- `lean-check research/blueprint/suggested/SmoothRepresentationsOfLocalGroups.lean`: exit 0; exactly six proof-placeholder warnings, no other warnings. Available memory exceeded 20 GB. No build, cache fetch or language server was used.
- Import/inventory reconciliation: all 170 old IDs represented once; all 166 upstream target names and line anchors agree with the merged source. Every new node has an independent verdict.
- Reader synchronization and `git diff --check`: passed. Only assigned files and this job's handoff/report changed.

For the orchestrator: apply the two cross-file RT adapters and reconcile the
finite-wild single owner with LP1. The eight named gaps, especially the enhanced
comparison, Schwartz analysis, generic smooth Ext comparison and minimum
geometric action, remain visible implementation work. They do not block the
accepted planning pass and are not certified as solved by this review.
