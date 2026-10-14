# Review: classical K₂ supplement

**Accepted after correction**, 14 October 2026. Reviewer: Codex, session `codex-UroaGs`, job `REV-K2SymbolsBrauer--T.1-classical` ([issue #9264](https://github.com/CBirkbeck/tauceti-explorer/issues/9264)). The supplement was written by a different session, `codex-x955W2`. This accepts the closed classical plan and its exact imported interfaces; it does not accept the parent packet's other stages or certify an implementation.

## Scope and counts

The checked assembly consists of 43 inherited classical nodes, two supplementary nodes, and 16 exact supplier exports (15 from `KTheoryLowDegrees:U.1` and `U.2/K1`). All 61 have individual verdicts in the packet: **51 verified, 10 corrected, zero added, zero unverifiable**. The 45 classical nodes comprise six definitions, nine constructions, 16 lemmas, 13 theorems and one comparison. The 15 definitions/constructions retain 79 API items and 59 tests; every one has at least three discriminating tests. Six inherited planets remain, with no new planet.

All seven original keyed refinements were checked. Six further refinements repair inherited contracts without copying their nodes or changing their owner IDs. Assembly must apply all **13** entries field by field. Seven scoped gap resolutions are justified, including removal of the obsolete Hopf-gap sentence. The classical coverage remains `closed`, with no remaining classical gap or request. The partial parent packet's symbol, arithmetic and plus-construction work remains outside this verdict.

## Corrections made

Suffixes below refer to the existing classical targets in the parent packet. All replacements are in `inheritedRefinements`; the parent file is unchanged.

| Existing target | Correction |
| --- | --- |
| `elementary-matrices-satisfy` | Cite Definition III.5.1, equations (5.1.2)–(5.1.3) and the elementary-image paragraph. The book's internal anchors III.5.1.1/III.5.1.2 are not separately numbered surjectivity/stabilization theorems. |
| `stabilisation` | Cite the unnumbered stabilization paragraphs following Definition III.5.1. |
| `to-elementary` | Cite the unnumbered elementary-image paragraph on the same page. |
| `central-extension-classification` | Remove the Löh locator from the K-book source record; keep its separate Löh source record. |
| `central-extension` | Use the actual three-parameter `GroupExtension A E G`. Distinguish a set section from a homomorphic splitting and give the marked product-equivalence proof. |
| `k2-definition` | Separate immediate kernel/functoriality arguments from longer exactness. Replace an implementation admonition with identity, composition and nonkernel-root tests. The integer and finite-field computations remain external arithmetic/symbol checks. |
| `k2-k1-exact` | Replace broad U.1/U.2 prerequisites with the five exact kernel, stabilization, elementary-subgroup, normality and K₁-quotient suppliers. |
| `hopf-formula` | Remove its stale G-Hopf sentence. The accepted direct quotient-bar five-term input and free-group vanishing already supply this step. |
| `free-group-higher-homology` | Correct Proposition 1.6.21 to begin on printed p.54, with its proof through p.56 and Corollary 1.6.23 through p.57. |
| `central-extension-hom` | State X, Y and G as the ambient groups, allow different kernels, and locate Definition III.5.3.1 on printed p.219 / PDF p.227. |

The reader now reflects these corrections and links to this accepted review. The compact suggested file adds the explicit trivial-action hypothesis to its central classification and splitting statements, and the inherited perfect-base hypothesis to Recognition. No new mathematical node or baseline declaration was needed. All 28 baseline citations remain, with independent `reviewedBy` provenance. The three source findings now have checker-compatible confirmed verdicts; their mathematical statements were retained. The central-composition entry also records the earlier parent reference to `K3BlochGroups/E2`.

## Mathematical closure

The two new targets are justified. For the centrality/trivial-action criterion, the reverse direction uses `GroupExtension.inl_conjAct_comm` and commutation with every total-group element. The existing `inducesAction_iff_smul_eq_self` assumes centrality already, so it alone would not establish that direction. The forward direction uses the actual central conjugation lemma. Fixed-action classification then uses normalized sections, independence of their cohomology class, realization of every class, and marked equivalence, preserving both kernel and quotient identifications. The C₄ nonsplitting and the two C₉ kernel markings distinguish set sections and unmarked isomorphisms from these requirements.

The column and row maps have exactly n−1 coordinates. Their matrix images recover each coordinate, giving finite injectivity; their stable images stay injective through the supplier's finite GL embeddings. This proves injectivity only for these particular subgroups. It does not assume that finite Steinberg groups embed in the stable group. Conjugation changes the column coordinate by left multiplication `c v_b`, and the row coordinate by right multiplication `−v_a c`. The opposite-root case is excluded.

For the stable centre theorem, choose the fresh index outside both the kernel word and the root whose commutation is tested. The word normalizes the fresh column/row subgroups; its commutators have trivial elementary image and therefore vanish by their proved stable injectivity. A chaining commutator gives the tested root. The reverse inclusion uses the actual U.1 stable centralizer theorem.

The finite splitting refinement supplies fifth-index commutation, the special four-index nested-commutator identity, independence of auxiliary indices and lifts, additivity, and both chaining signs. Its four-index identity is proved by reordering the specified roots under their stated commutation conditions; no unrestricted Jacobi identity for arbitrary metabelian groups is required. The cofinal ranks n≥5 split pullbacks of a stable central extension. Perfect-source rigidity makes the sections compatible, and the existing group-colimit lift glues them. These arguments establish stable universality. Finite universality still requires a separately supplied central finite kernel, as the inherited `K2SymbolsBrauer/E2` correction requires.

The inherited Hopf and Recognition package was checked as an actual prerequisite chain. In particular, the direct quotient-bar kernel has degree zero zero and first homology N/[E,N], using the unnormalized differential with terms `[b]−[ab]+[a]`. The inverse comparison uses `[n]−[1]`. The short exact chain sequence gives the five-term sequence with its positive connecting map; the length-one free resolution then makes the transgression injective in the free-presentation case. Naturality identifies the H₂ components with the actual homology maps. Recognition uses perfect-source rigidity, the free-presentation universal extension, splitting, and Q/Z character separation. It does not require a topological K-theory construction.

## Sources and baseline

Fresh downloads of the public author copies matched both packet hashes:

| Public source | SHA-256 | Fresh locator coverage |
| --- | --- | --- |
| [Weibel, 2013 combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` | III.1.2; III.5.1–III.5.5.2; Exercises III.5.2, III.5.3, III.5.7; IV.1.7 and Exercise IV.1.9. Printed pp.180, 217–221, 228–229, 264, 274 / PDF pp.188, 225–229, 236–237, 272, 282. |
| [Löh, Group Cohomology, 2019](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf) | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` | Theorem 1.4.1, Corollary 1.4.6; 1.5.1 and 1.5.6–1.5.11; 1.6.21–1.6.23; 3.2.12–3.2.14 and Theorem 3.2.18. Printed pp.20, 23, 30–37, 54–57, 123–125, 129–132 / PDF pp.28, 31, 38–45, 62–65, 131–133, 137–140. |

These are independent fresh readings, in addition to the imported scoped review's source evidence. Löh's Hochschild–Serre pages state the general sequence and naturality; they do not construct it. The packet's separate direct kernel-complex proof supplies the needed discrete trivial-integral part. Neither a restricted source nor source passages were added to the repository.

All **28** declarations listed in this supplement's baseline were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their statements supply the claimed interfaces with the recorded action, marking and homology conventions. This includes the actual `DirectLimit` group instance, not just the type quotient. The declaration index used for validation has these same pins. Needed Tau Ceti factor-set sources were also compared with their exact pinned versions.

The 16 U.1/U.2 export statements, hypotheses, APIs and prerequisites were read and checked for these uses. Their full supplier source/baseline certification remains with `independent-review-REV-KTheoryLowDegrees--U.1~3`. This review neither re-certifies its entire 334-node packet nor claims that supplier code is implemented. The parent import similarly retains the accepted classical scope of `REV-FIX-RT-AREA-ktheory-1~2`, without extending that verdict to the later expanded review scope.

The reviewed library audit `AUDIT-29`, current Tau Ceti sources, and the current upstream roadmap documents were checked read-only. RepresentationTheory and InductionRestriction Layer 7 already own factor-set classification, implemented by the pinned declarations reused here. No stable arbitrary-ring Steinberg/UCE target was found upstream. Nothing was built in those upstream checkouts.

## Source findings

All three supplementary entries are **confirmed** against the specified author copy:

- III.5.3, printed p.218 / PDF p.226: general marked central extensions require A-valued cohomology, whereas the opening text briefly uses integral coefficients. With G=C₂ and A trivial there is one extension class, unlike the two integral-cohomology classes. The next printed page uses A correctly.
- Exercise III.5.2, printed p.228 / PDF p.236: the column image has n−1 coordinates, and roots i<j give upper unitriangular elementary images under the stated convention.
- Exercise III.5.7, printed p.229 / PDF p.237: composition of central extensions needs the perfect-intermediate hypothesis used here. The 27-element Heisenberg group maps centrally to F₃², which maps centrally to F₃, but the composite kernel contains b=(0,1,0) with [a,b]=(0,0,1) for a=(1,0,0). The same missing hypothesis was already recorded through the parent's `K3BlochGroups/E2` reference.

No novelty or published-edition correction is claimed. The author's linked errata PDF had returned HTTP 404 in the supplement's source screen. The inherited finite-UCE finding `K2SymbolsBrauer/E2` remains conditional and is not resolved by stable splitting.

## Verification and orchestration

The assembled dependency audit found no internal cycles or dangling classical prerequisites. It checked all supplier prerequisites against their accepted owner packet and every definition/construction's API and tests. Both proposed outgoing edges have no return path in the live atlas: classical → `K3BlochGroups:V.1` and classical → `StableHomotopyKTheory:H.3`. This verifies the ownership corrections for RT-AREA-ktheory-1/29 and /30. Assembly must apply the edges and exact consumer retargeting; no consumer packet or atlas data was edited. V.1 keeps plus/Hurewicz and degree-three comparison; H.3 keeps the topology of the fibre extension; T.1:plus imports the natural algebraic kernel-H₂ result.

Exact arithmetic checks exercised the integer, noncommutative-coefficient and opposite-root column/row tests and the lifted-root coefficient order over M₂(ℤ), with outer rank five for the four-index identity. The zero-vector and stable-injectivity tests were checked by the stated mathematical arguments, rather than executable Steinberg code. They also verified the opposite-root conjugate, both central maps and the noncentral composite kernel of the Heisenberg example, its positive bar transgression, C₄ nonsplitting, the two C₉ markings, and the mixed-commutator quotient for S₃→C₂. All assertions passed. For reproducibility, the Heisenberg law is `(a,b,c)(u,v,w)=(a+u,b+v,c+w+av)` modulo 3. Its commutator above is 1 in the centre; the lifted antisymmetric bar cycle has positive transgression 2 modulo 3. For the noncommutative matrix tests use coefficients E₁₂ and E₂₁, so the two multiplication orders yield E₁₁ and E₂₂.

`python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.1-classical.json --index <pinned declaration index>` passed with zero errors and zero warnings. The five deliverable/handoff files passed `research/blueprint/intake.py check-files`, and `git diff --check` passed.

`lean-check research/blueprint/suggested/K2SymbolsBrauer--T.1-classical.lean` **passed** at the pins: 141 lines, two real-bodied lightweight predicates and 16 admitted statements/examples; zero errors, exactly 16 `sorry` warnings, no other warnings. The file states the subset expressible on pinned carriers. The Steinberg, column, Hopf and bar-kernel carriers remain reader targets. Elaboration and concrete checks do not prove the admitted targets.

No mathematical question blocks acceptance. The remaining action belongs to assembly: apply the 13 replacements, retain the original target IDs, add the two outgoing edges and use the consumer contracts.

## Summary

The classical supplement is accepted after ten inherited-target corrections, with all 61 scoped targets/interfaces checked and all 28 listed baseline declarations confirmed. Its two new targets close the column/row and trivial-action inputs without duplicating upstream work. The stable centre, finite splitting, cofinal gluing, Hopf naturality and Recognition arguments form closed prerequisite plans. Three author-copy findings are confirmed; finite universality remains conditional on finite centrality. The reader is synchronized, and the compact suggested Lean file elaborates with only admitted-proof warnings. Assembly has 13 keyed replacements and two outgoing dependency edges to apply; no new classical work is required by this review.
