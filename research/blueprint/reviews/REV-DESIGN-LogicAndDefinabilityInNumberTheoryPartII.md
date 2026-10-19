# Independent review: finitely generated fields and single axioms

Issue #3567; job `REV-DESIGN-LogicAndDefinabilityInNumberTheoryPartII`.
Reviewer: Codex, session `codex-SVHNsm`, 19 October 2026. The design was written by a different session, `codex-27ngX6`.

**Verdict: accepted after corrections.** This accepts a finished target-level planning pass. It does not certify source closure, implemented mathematics or completed supplier extensions. All eight stages remain `planned`, none `closed`; seven explicit proof-audit gaps and twelve supplier requests remain. Their statements are sufficiently precise to identify the outstanding work without using a conclusion as its own prerequisite.

The packet's `review.checked` records the mathematical check of every node: 45 verified and 13 corrected. All 17 inherited source issues have independent, reasoned `confirmed` verdicts. No new mathematical nodes or source issues were added.

| Inventory | Count |
| --- | ---: |
| Nodes | 58 |
| Definitions / constructions | 11 / 4 |
| Theorems / lemmas / comparisons | 34 / 5 / 4 |
| Definition and construction API items | 69 |
| Discriminating tests | 54 |
| Planets | 29 |
| Exact-pin baseline declarations | 16 |
| Distinct fine-grained external blueprint targets | 21 |
| Prerequisite occurrences: baseline / external node / stage / internal node | 23 / 39 / 68 / 113 |

Every definition and construction has at least three tests. Their empty, split, inseparable, characteristic-two, zero-order and non-example cases were checked against the actual consumers. The 29 planet names describe mathematical objects or named results and satisfy the per-stage limit. All 52 Dittmann–Pop routes still resolve to the intended targets. The separate functional-transcendence proposal retains 44 routes; its proposed stages are inactive and introduce no dependency back into this field-definability build. Its primary proofs require the separate design it proposes.

## Corrections made

1. **Put global arithmetic formulas before the constants they define.** Moved `global-arithmetic-formulas` from FG.4 to FG.0, before `char-zero-constants`. Removed its prerequisite on the later global-subfield family and distinguished formulas in an ambient global field from their later relativization. Added direct prerequisites and G-RUM audit leaves for the constants consumers. Updated every local reference, route, affected coverage record, roadmap dependency and reader section. Poonen's Lemma 3.7 uses the number-field filter from Theorem 2.2; leaving this use implicit would hide a circular construction.
2. **Corrected finite-generation scope.** `R_T` is finitely generated as a ring. `S_T` is finite over κ[T] and finitely generated as a κ-algebra. For K=Q(t), the latter is Q[t], which is not finitely generated as a ring. The corrected theorem and reader include this counterexample and retain the full fraction-field and inseparable-extension assertions.
3. **Guarded the dyadic trigger.** The finite formula now uses `2≠0` together with `2∈m_v`. Without the first conjunct, characteristic two would trigger the dyadic test at every place. Added a concrete acceptance check and explicit nonzero guards for inverse membership.
4. **Made the quadratic supplier request honest.** Current GlobalQuadraticForms Layer 5 has number-field scope and excludes characteristic two. The request now separates that existing contract from the required global-function-field extension, including nonsingular quadratic tails in characteristic two, local bounds and the unramified quadratic norm criterion. Added the direct supplier to `global-nice-tail`, its request consumers and the roadmap dependencies. Recorded the ownership discrepancy in `upstreamNotes`.
5. **Exposed other direct inputs.** The valuation filter now directly cites pinned finite prescribed-order approximation. Poonen's higher-dimensional smooth specializations now directly import A0 finite normalization and request its formal-étale completion comparison; the affine-curve model contract alone is insufficient. The request lists both early consumers as well as the existing test-form consumer.
6. **Specified zero arity.** Dependence of the empty tuple is represented by the false formula; independence is true. The proof using the first tuple element is restricted to positive arity.
7. **Used the existing finite-field classification.** Added `FiniteField.ringEquivOfCardEq` as the sixteenth baseline declaration and a direct prerequisite of `finite-field-sentence`. Exact-cardinality witnesses supply the necessary finite presentation; field axioms remain essential.
8. **Reconciled citations and test metadata.** Split mixed-paper source locators into entries with the correct source identifiers. Added Poonen Theorem 1.1 for the characteristic separator. Replaced nonstandard test-kind labels with the vocabulary in PROTOCOL §12, preserving all 54 mathematical tests. Refined G-PO to acknowledge that Q2.5 already owns all-degree C_i ascent; the remaining cubic descent and elliptic receipts do not justify duplicating it.

The reader includes all mathematical corrections, additional direct suppliers and changed layer placement. The suggested Lean statements require no changes: they concern the real-bodied light definitions and end statements, and assert neither the erroneous S_T ring-finiteness nor the unguarded dyadic formula.

## Source and dependency evidence

Independently read the relevant statements and arguments in the [Dittmann–Pop final author version](https://arxiv.org/pdf/2012.01307v2), including Propositions 3.4, 3.8, 3.10, Theorem 4.2, Recipe 4.3 and Proposition 5.1, author pp.6–17; [Poonen's January 2007 author version](https://math.mit.edu/~poonen/papers/uniform.pdf), Theorems 1.1–1.4 and 2.2–2.3, §§3–5 and Appendix A, pp.1–14; [AKNS's October 2016 author version](https://math.berkeley.edu/~scanlon/papers/logical-complexity-fg-ring.pdf), interpretation/coding results §§1.3–2.9 and domain arguments §§3.1–3.2, pp.6–24; and [Pop's published 2017 paper](https://msp.org/ant/2017/11-9/ant-v11-n9-p03-p.pdf), §§2A–5B, pp.2093–2110. Downloaded source hashes agree with the packet's version records. Read pp.1–5 of the [2001 Pop preprint](https://arxiv.org/pdf/math/0109144); its different numbering does not discharge G-DIM. No collation with the published Annals text is asserted.

Checked every fine-grained supplier statement in Q2.1–Q2.7, HL.2/HL.6, A0-extension, R03.3 and FA.5, plus the requested general-logic and current upstream layer contracts. In particular, the compact ambient valuation space contains arbitrary ranks; the coarsening unit criterion permits the intermediate henselian fields; arithmetic intersections use every prolongation; and function-field Chebotarev retains its constant-field degree congruence. Existing function-field approximation and sole-pole results are imports.

The reviewed library audit has no entry for this continuation or LD.0–LD.1. Checked its related higher-local, normalization, quadratic, approximation and curve entries and compared the current library and the nine roadmap directions that postdate the atlas snapshot. No existing general theory is replanned. Current RealAlgebraicGeometry Layer 1 already owns preordering extension; G-UPSTREAM records only its missing atlas receipt.

The seven inherited gaps remain substantive: final published dimension-proof collation (G-DIM), external elliptic/cubic proof receipts (G-PO), original Rumely formula and decoding proofs (G-RUM), an odd-degree alteration receipt (G-ALT), the original surface/norm and adapted-base inputs (G-LOW), Nies's cited arithmetic-standardness proof (G-QFA), and synchronization of the existing preordering supplier (G-UPSTREAM). Poonen and AKNS verify the stated Rumely contracts, not the unread original proofs. No uncleared source was used. These limitations remain in the packet rather than being disguised as completed audits.

## Baseline and source-issue decisions

Removed no baseline citations and replaced none: all fifteen inherited declarations exist and fit at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Added the finite-field equivalence above. Read the surrounding hypotheses and byte-compared all ten cited source modules with raw GitHub at the exact pins. Corrected verification descriptions that relied on another worker's checkout evidence.

The checked declarations are the ring language and compatible ring instance; `Set.Definable` and `Set.Definable₁`; `Field.FG`; sentence realization; finite-field cardinality equivalence; the patch topology, compactness and clopen-comparison lemmas; `TauCeti.Place`, its integers and order; finite prescribed-order approximation; the high-degree sole-pole theorem; and strong function-field approximation. Curve function-field and relative-constant hypotheses are retained where the declarations require them. `Place.ord 0=0` is handled by the explicit zero branch. Current-main-only convenience lemmas are not baseline inputs.

For E1, confirmation concerns the ambiguous characteristic-two notation, not a false Pfister theorem. E17 and E18 concern omitted formula and low-dimensional proof details. E19 requires quotienting nonunique sequence codes; E20 needs the normal-domain restriction for the Dedekind core; E21 must test failure of unit membership, not just nonintegrality; E22 requires a nonzero Hensel scalar in characteristic two. The remaining ten entries are confirmed at their individual locators with the calculations and type checks recorded in `sourceIssues.review`. No exhaustive erratum-search or priority claim is made.

## Validation and orchestrator actions

`python3 scripts/check_blueprint.py research/blueprint/packets/LogicAndDefinabilityInNumberTheoryPartII.json` reports zero errors and zero warnings. Structural checks confirm a 58-node acyclic local prerequisite graph, exactly one review entry per node, all definition/construction APIs and tests, and a review record on every source issue. The unchanged 146-line suggested file elaborates through `lean-check` at the pins with exit zero and only its thirteen expected `sorry` warnings; its three data definitions have real bodies.

The intake allowed-file/private-path/JSON check reports five files and zero problems. The no-incomplete-data and whitespace checks pass. Reader checks find all 58 target headings, 69 API names and 54 test statements; route checks confirm 52 resolved field targets and 44 uniquely assigned retained split-proposal items.

The orchestrator should route the global-function-field quadratic extension through its existing owner or Part II, obtain the outstanding supplier receipts, and decide the proposed functional-transcendence split and prime-to-degree alteration ownership. Those are follow-ups to the accepted plan. Nothing needs to be returned to the designer, and no scratch material is needed to resume them.
