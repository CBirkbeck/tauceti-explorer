# Independent review of FIX-RT-AREA-algebraicgeometry

**Verdict: needs_changes.** Reviewer: `independent-review-REV-FIX-RT-AREA-algebraicgeometry`, Codex session `codex-J6LwjP`, 2 October 2026. Job [#5148](https://github.com/CBirkbeck/tauceti-explorer/issues/5148), reviewing the fix for [#3974](https://github.com/CBirkbeck/tauceti-explorer/issues/3974).

The fix correctly sends the Betti–de Rham comparison to ComplexComparisonPartII:C5, and its other high/medium findings have identifiable blueprint handoffs or explicit maintainer notes. This does not complete those future blueprints or install their proposed edges. The period-point prototype still lacks its comparison hypotheses, and the reader still describes an older packet. Acceptance would obscure these unresolved obligations.

I did neither the original area red team, its verification, the checkpoint by `codex-5ebb6f`, nor the completed fix by `cc-c2c06b`. My earlier RS-27 verification is not evidence that the present fix is correct. This review follows `independent-review-REV-MotivesAndAlgebraicCycles`; its earlier `needs_changes` record remains, and the intervening pending marker is preserved in `reviewHistory`. The later geomlanglands~2 and iwasawa-3~2 changes require their own queued independent reviews.

## Scope and method

I read the claim, verified evidence and fix for each of findings 1–35, the full current fix ledger and the earlier checkpoint handoff. The ledger explicitly excludes the eleven low findings 36–46; this review does not certify their repair. Only finding 31 changes the Motives packet. The other dispositions are checked as deliveries to future blueprint jobs or maintainer records under PROTOCOL §17, rather than as proofs of the underlying mathematics.

I checked the affected requests, comparison consumers, MC.2/MC.6 coverage, narrowing proposal, and corresponding suggested signatures. No new node or baseline-library citation was introduced by the area fix. The existing packet's 108 baseline citations and unrelated source decompositions were not all freshly audited here. The pinned check uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; both local source baselines were checked at those commits.

The following live issue bodies carry the matching finding identifiers: [#672](https://github.com/CBirkbeck/tauceti-explorer/issues/672), [#673](https://github.com/CBirkbeck/tauceti-explorer/issues/673), [#642](https://github.com/CBirkbeck/tauceti-explorer/issues/642), [#703](https://github.com/CBirkbeck/tauceti-explorer/issues/703), [#773](https://github.com/CBirkbeck/tauceti-explorer/issues/773), [#963](https://github.com/CBirkbeck/tauceti-explorer/issues/963), [#990](https://github.com/CBirkbeck/tauceti-explorer/issues/990), [#993](https://github.com/CBirkbeck/tauceti-explorer/issues/993), [#732](https://github.com/CBirkbeck/tauceti-explorer/issues/732), [#666](https://github.com/CBirkbeck/tauceti-explorer/issues/666), [#1020](https://github.com/CBirkbeck/tauceti-explorer/issues/1020), [#982](https://github.com/CBirkbeck/tauceti-explorer/issues/982), [#668](https://github.com/CBirkbeck/tauceti-explorer/issues/668), [#960](https://github.com/CBirkbeck/tauceti-explorer/issues/960), [#1019](https://github.com/CBirkbeck/tauceti-explorer/issues/1019), [#744](https://github.com/CBirkbeck/tauceti-explorer/issues/744), [#988](https://github.com/CBirkbeck/tauceti-explorer/issues/988), and [#992](https://github.com/CBirkbeck/tauceti-explorer/issues/992).

The ledger's checkpoint reference “BP-ComplexComparisonPartII (#5147)” is a merged pull request, not the carrying issue. The actual carrying issue is #703. This report resolves the reference without editing the fix ledger.

## Finding-by-finding dispositions

“Handoff adequate” means the correction is recorded in the proper future job and preserves the necessary boundary; it does not mean that job has implemented it. “Maintainer note adequate” likewise leaves upstream edits outstanding.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff adequate: #672 and #642 must choose one algebraic-space/stack owner, recommended SF.1, leaving R09.3–R09.4 the stated moduli tasks. The proposed SF.1 imports are maintainer actions. |
| /2 | Handoff adequate: #672 carries R09.6's G-ring, henselian approximation and Artin 1969 targets, rather than treating approximation as an available theorem. Popescu and the A0 consumer edges remain requests. |
| /3 | Handoff adequate: #703 must select the analytic-space carrier; #773, #963, #990 and #993 carry consumer obligations. A nilpotent analytic-space gap in the checkpoint is not proof of the general carrier. |
| /4 | Handoff adequate: #703 carries a layer after C5 for degeneration, Hodge decomposition and symmetry with the Deligne locator. Qian's route and the degenerating-Hodge consumer remain maintainer work. |
| /5 | Maintainer note adequate: divisor degree stays in JacobianChallenge A; Euler-characteristic degree, agreement and Pic⁰ move to B. No reverse B→A edge is introduced. |
| /6 | Maintainer note adequate: projectivity in AlgebraicCurves 12B needs StableReduction 2 or R09.1, not an unsupported Mathlib projective-morphism claim. The proposed supplier edge remains uninstalled. |
| /7 | Handoff adequate: #732 names F. K. Schmidt in FA.5. Its FA.4 edge, the paper route and the zeta-free scope clarification are explicitly maintainer work. |
| /8 | Handoff adequate: #666 owns NS(A), the symmetric-homomorphism map, finite generation and Picard number; #1020 and #642 carry the neighbouring imports. The Balakrishnan paper route is not silently rewritten. |
| /9 | Handoff adequate: #703 imports affine-curve completion from AlgebraicCurves 12B–12C rather than replanning it in C4. Installation of the link remains a maintainer action. |
| /10 | Handoff adequate: #672 carries R09.3's descent narrowing and the ModularCurves/StableReduction inputs, avoiding another independent construction. |
| /11 | Handoff adequate: #672, #982 and #642 carry the fourfold Weil-restriction overlap. The 0F/RG2.0a/R09.3 ownership chain and Lawrence–Sawin retargeting remain explicit. |
| /12 | Handoff adequate: #672 must import the Grassmannian, Proj and ampleness suppliers in R09.1 and apply the StableReduction/HodgeStructures boundary, rather than claim duplicate constructions. |
| /13 | Handoff adequate: #673 imports the StableReduction 4 blowup into R09.7a. The atlas edge remains for the maintainer. |
| /14 | Handoff adequate: #672 carries the JacobianChallenge C cohomology/base-change owner and StableReduction inputs; the generic “beyond curves” wording does not certify a second owner. |
| /15 | Handoff adequate: #642 replaces the inappropriate SF.4 dependency of SF.5 with SF.3, R09.1 and the chosen duality supplier. Deletion of obsolete RS-25 links is explicitly pending. |
| /16 | Handoff adequate: #668 and #642 retain SF.4 as the single alterations owner and narrow L5 to its cohomological use. They do not both plan de Jong anew. |
| /17 | Handoff adequate: #672 and #642 carry the stable pointed-curve stack and its scheme covers in R09.4–R09.5, or a maintainer-selected StableReduction Part II. The supplier choice is still an obligation. |
| /18 | Handoff adequate: #672 and #642 must agree on a single coherent-duality owner, recommended SF.2. Both alternative edge/route consequences are recorded; neither alternative is claimed installed. |
| /19 | Maintainer note adequate: JacobianChallenge A–C and ModularCurves 0A are suppliers to StableReduction 2, which is narrowed to its remaining contractions and nodal tasks. Missing link-map jobs stay explicit. |
| /20 | Maintainer note adequate: JacobianChallenge D/E and A3 feed StableReduction 6; J-E's torsion input is attributed to A3 applied to Pic⁰ rather than to E alone. |
| /21 | Handoff adequate: #960 carries the R11.2 Kodaira–Néron/Tate-algorithm node and the requirement to read Tate, LNM 476. It does not certify that unread proof; the curve supplier edges remain pending. |
| /22 | Maintainer note adequate: StableReduction 6 must name torsion, multicross, Gorenstein and regular-model inputs, with the rational-point hypothesis. Importing R11.4 instead would close a cycle. |
| /23 | Maintainer note adequate: StableReduction 7 gets the named Néron suppliers and JacobianChallenge D. The excellent-DVR hypothesis is retained unless a stronger R11.1 supplier is actually obtained. |
| /24 | Handoff adequate: #1019 must plan Bosch–Lütkebohmert 1985 Theorem 7.1 or restrict to discretely valued models. A general valuation-model theorem is not inferred from StableReduction alone. |
| /25 | Handoff adequate: #1019 narrows TB.2 to metric, skeleton and retraction, importing StableReduction 1–2. This removes the duplicate reduction target without claiming the links are installed. |
| /26 | Handoff adequate: #744 imports the StableReduction regular-model suppliers into GZ.2; it does not plan a second regular-model construction. |
| /27 | Handoff adequate: #666, #988, #990 and #992 carry their HodgeStructures imports. The absent outgoing atlas edges and link-map job remain maintainer obligations. |
| /28 | Handoff adequate: #703 and #993 carry PR279 Milestones 5–7 or an atlas-owned open-gluing supplier. Untracked external gluing is not treated as already available. |
| /29 | Handoff adequate: #703 resumes the checkpoint's Sella additive comparison, with AlgebraicTopology 6 requested. This is a partial repair, not a completed general constant-coefficient comparison. |
| /30 | Handoff adequate: #703 carries the relative proper-GAGA and Gauss–Manin obligations; an Ehresmann supplier must be named if needed. The partial checkpoint is not certified as proof closure. |
| /31 | Owner correction verified, but needs_changes: C5 now supplies Betti–de Rham comparison and SF.6 supplies only etale–Betti transport. Pair comparison remains an extension request. The suggested period-point contract loses its tensor compatibility hypotheses, and the reader remains stale; details below. |
| /32 | Handoff adequate: #703 requests the algebraic GAGA targets from R09.1 and StableReduction 2. #672 does not automatically carry /32, so the maintainer must add it; this remaining forwarding step is not reported complete. |
| /33 | Handoff adequate: #703 imports AlgebraicCurves 6's function-field/smooth-completion dictionary into C4 rather than proving it again. Its link remains pending. |
| /34 | Handoff adequate: #990 states the general-base toric-scheme target. Distinct AnalyticToricGeometry Part II boundaries and the Binda–Kato–Vezzani route are maintainer actions. |
| /35 | Handoff adequate: #703's partial packet has SGA 1 XII as a source. The source-anchor sentence still needs to be taken into the campaign document by the maintainer. |

## Remaining defects and corrections made

The C5 request has the necessary smooth projective complex comparison, cup/pullback/trace and base-change requirements. Its relative-pair clause explicitly asks for an extension or another named owner because C5 currently plans only smooth and smooth proper cases. The SF.6 request retains etale–Betti hard-Lefschetz transport and describes SF.6 as a consumer of C5. MC.2 remains partial: no node yet states its requested monoidal comparison of realizations. These boundaries must remain.

`PairDiagram.PeriodData` contains a complex-linear comparison family and `comparison_natural` for pullbacks. It contains no equations tying comparison to `one`/`pointClass`, `wedge`/`cross`, or the connecting maps. `periodPoint` nevertheless promises a unital algebra homomorphism, and `periodPoint_gen` evaluates generators through that comparison. The separate multiplicative structures M₁/M₂ do not assert that comparison respects them.

For a normalized genuine comparison, replace each comparison map by twice itself. This is still a complex-linear isomorphism and still satisfies the stored pullback naturality. Keep every other field unchanged. The prescribed generator evaluation now gives the unit period 2, contradicting preservation of 1; product evaluations scale by 2 on the product and by 4 on the product of evaluations. This is a concrete missing-hypothesis problem in the prototype, not a source erratum. Connecting-edge compatibility is additionally needed for diagram relations. A successor must supply a typed unital multiplicative comparison compatible with every edge and pass it to the period-point, formal-evaluation and dependent signatures. Merely citing C5 does not add these equations to the signature.

I added this as a packet gap and MC.6 remaining item, and corrected the suggested-file comments to distinguish the requested supplier contract from its currently encoded fields. The suggested declarations themselves remain unchecked and incomplete; I did not attempt an uncompiled type-level reconstruction. This prevents the comments from implying that the missing comparison laws already exist.

The 6,452-line reader still says all eight layers are source_decomposed and reports 96 nodes, 206 API items, 132 tests, eight gaps and six requests. Its MC.0 heading remains source_decomposed despite the packet's algebraic-equivalence gap. The current packet has 182 nodes and several partial stages. This was already an acceptance blocker in the earlier independent review. The reader is outside this job's authorized three deliverables, so its reconciliation remains an explicit successor action. Restore agreement between the reader, coverage and current packet before acceptance; do not regenerate a claim that every stage is complete.

I replaced the top review with `needs_changes` and preserved earlier review records. I did not promote the packet, edit atlas/upstream files, or certify the later fixes through this area review.

## Public source checks

These are bounded checks of the comparison consumers, not a new full-paper decomposition. The following public PDFs were fetched on 2 October 2026:

- [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5), 34 pages, 378,507 bytes, SHA-256 `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563`. Read p.2 (Definition 0.1 and Theorem 0.2), p.11 (Theorem 2.10 and evaluation discussion), and pp.12–13 (Lemmas 3.1–3.2, Theorem 3.3 and Corollary 3.4, including their proofs). The tensor comparison and period-algebra construction require more than a pullback-natural linear family. The cited Huber prerequisite was not independently obtained in this review.
- [Deligne, Hodge conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), five pages, 146,894 bytes, SHA-256 `e308d945ea3cf5dad8b187a06509013712c467b589039eb41b365cc4c988f0c8`. Read §§1–2, pp.1–2, for smooth projective complex Hodge/cycle classes, and p.4 for hard Lefschetz, its inverse and the motives discussion. These do not supply arbitrary singular relative-pair comparison.
- [Grothendieck, On the de Rham cohomology of algebraic varieties](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), ten PDF pages including the cover, 1,334,138 bytes, SHA-256 `f76706281f40b3c43c878bbd7c00c7520751d7b356a9da02004613ba5097e33a`. Read printed pp.95–99 (PDF pp.2–6): Theorems 1 and 1′, the canonical comparison map, and the GAGA/local reduction discussion. This supports retaining the smooth comparison hypotheses; I do not claim to have reread the remainder of the proof.

## Validation

The pinned-index blueprint checker passed: zero errors and zero warnings; 182 nodes, 446 API items, 252 tests, 47 planets, 108 baseline declarations, 23 gaps, 16 requests, eight scoped stages and zero closed stages. No link map or restructuring file is edited, so their file checkers are inapplicable.

A fresh assembled graph has 2,956 actual stage vertices and 8,563 edges and is acyclic. Adding just the two /31 proposals C5→SF.6 and C5→MC.2 gives 8,565 edges and remains acyclic. This is a validation of those proposed edges, not their installation or a new test of every other area's proposed edge.

The intake check passed for all three deliverables with zero problems. The disposition table covers each of 1–35 exactly once; whitespace/diff checks passed. No Lean compilation was performed; historical compilation notes concern earlier revisions.
