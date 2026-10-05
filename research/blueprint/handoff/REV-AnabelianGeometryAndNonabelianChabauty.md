# Handoff: REV-AnabelianGeometryAndNonabelianChabauty

Issue #526; current checkpoint by Codex `codex-CS32rR`, 2026-10-05. Continue the
same unfinished independent review. Input explorer revision:
`c5c5af2032b33bc80d5a0353e4abefe392b1d922`, including the earlier reviewer
checkpoint [#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170).
Neither session authored the blueprint. There is no final packet `review`
object and no acceptance verdict.

## Durable result

Current counts: 363 nodes, 320 definition/construction API entries, 250 tests
on those nodes, 160 baseline declarations, 17 requests, 10 gaps and 11 planets.
Across all node kinds, there are 340 API entries and 264 tests. All stages retain
their incoming partial/not_read statuses; all implementations are unchecked.

This checkpoint adds the definition node
`AnabelianGeometryAndNonabelianChabauty:NC.3/equivariant-topological-torsors`
with 18 API entries and five typed tests. It reuses native
`Torsor Uᵐᵒᵖ P` and `IsTopologicalTorsor P`; their nonemptiness and continuous
scalar division are imported rather than planned again. It supplies continuous
semilinear actions, orbit homeomorphisms, the actual equivariant `Torsor.Iso`,
its isomorphism setoid, cocycle-model coordinates and point-change formulas.
The classification theorem now has eight API items, including injectivity on
isomorphism classes and the actual quotient equivalence. The new algebraic
comparison gap prevents exporting this topological abstraction to algebraic
or geometric torsors without descent/effectivity and structure comparisons.

The inherited invariants, continuity, abelian H¹ and four twisting tests now
have actual typed examples. The S₃ examples retain the prescribed transposition
cocycle and trivial original action. The omission ledger is reconciled only
where actual declarations/examples exist. The reserved K(π,1) source locator is
corrected, Achinger Definition 4.1 is added as direct provenance, and the scanned
Schmidt 1996 degree diagram has been inspected. See the review report for the
complete list of this and the prior checkpoint's corrections.

The packet checker and whitespace check pass. Full Lean remains uncompiled:
the shared existing build lacks the pinned Tau Ceti LowDegree object. The final
Mathlib-only projection elaborated with exit 0, 690 warnings, all for `sorry`,
and no other warnings/errors. Do not build the libraries to repair this.

To reproduce the projection in your own on-disk scratch directory:

1. Read the suggested file as text and remove lines matching
   `^import TauCeti\..*`.
2. Remove the exact block from `section Abelian` through `end Abelian`, inclusive.
   Keep `section AbelianTwistingTest`; it has no Tau Ceti dependency.
3. Write the remaining text to a scratch `.lean` file, check `free -g`, and run
   `lean-check` on it under the shared-machine rules.

Projection SHA-256:
`3c673ea43f7d115078d17426699c2a8db4f38aafa73e6a44596e9b8b44494a57`.
Suggested file SHA-256:
`7d153ef927b6b1637f5dba083e4b65566e041afb238b8fb5db4e889699e2cb15`.
The removed additive comparisons remain unchecked. Compilation with `sorry`
checks signatures, not mathematical truth or implementation.

Historical base64 recovery payloads and author receipts are preserved. Their
canonical-prefix hashes concern earlier input files and do not describe the
current suggested file. Neither review session decoded or executed them. Do
not borrow their proof or execution claims as independent evidence.

## Resume the review

1. **Baseline consumers.** Read all 160 citations at Mathlib
   `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
   `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding variables
   and each citing node. Selected statements and many declaration heads have
   been read; the complete consumer audit is unfinished. The five added native
   torsor/homeomorphism entries were checked in full. The orbit map is the
   actual composition of `MulOpposite.opHomeomorph` and `Homeomorph.smulConst`. Basename searches can find the
   wrong namespace: manually distinguish `IsEmbedding.continuous_iff`,
   `IsQuotientMap.continuous_iff`, `Subgroup.continuousSMul`,
   `IsOpenQuotientMap.prodMap`, `Continuous.smul` and `Quotient.congr`.
   Retain exact coefficient/topology hypotheses. Native all-degree continuous
   cohomology is not yet the geometric/derived-discrete comparison; Shapiro is
   additive with its specific closed-subgroup/profinite scope; native
   degree-one finite-quotient colimits do not establish nonabelian agreement.
2. **Sources and proof leaves.** Check every node's locator/excerpt and every
   authored deduction. Many source IDs are repeated readings of Kim v1; they
   are not separate numbered theorems. Fresh selected reading is listed in the
   report. Reacquire exact public versions using packet URLs/hashes; nothing
   depends on scratch files. Still finish Schmidt–Stix Appendix A,
   the relevant Poonen twisting passages, Stacks 03SB and 03RM's surrounding
   proofs, 0F13 Künneth, 01ZM finite-presentation descent and their generic
   dependencies. The selected statements/proofs at 03QQ, 03RQ, 0AMB, 03RR,
   03PL, 03P8, 0BA0, 03RP, 03RV, 09YQ and 07RR have been read, but their
   transitive proof closure is not certified. Achinger 2017 §4 and Schmidt
   1996 pp.243–244 no longer need to be reacquired merely to inspect their
   previously unread definitions/diagram. Verify further hypotheses as needed.
3. **One-node matching.** Check each of the 363 nodes against its actual
   declarations, prerequisites, sources and mathematical proof sketch. Work at
   the issue's target level: do not require lemma-level splitting just because
   inherited continuations chose it. The new torsor definition addresses a
   missing object/API, rather than imposing a split of every proof. Treat
   comment ledgers as omissions, not signatures. Continuation tests often
   repeat identities; verify that the claimed three tests distinguish plausible
   wrong objects. The later kernel/orbit families still need a full fresh
   audit; a previous proof-sketch screen is not a per-node verdict.
4. **Core gaps.** The torsor classification's abstract relation and injectivity
   are now stated. Its algebraic comparison remains open: construct the
   point-space functor, prove existence of points in the source scope,
   homeomorphic orbit maps, both action compatibilities and descent/effectivity
   before using path torsors or Selmer varieties. The central H² connecting
   map, independence of continuous lifts, obstruction exactness and freeness
   still need actual additive packaging/signatures. Additive comparison
   naturality and agreement with native finite-quotient diagrams remain open.
   Do not list the supplied invariants/continuity/abelian/twisting tests as
   missing again; check their mathematical strength and matching instead.
5. **Suppliers and coverage.** The seven reviewed audit records and actual
   supplier stage descriptions were read. SF.2's accepted packet is partial,
   SF.3 is not_read, and IG.0/IG.1/IG.6 have no relevant completed fine-grained
   nodes in their current packet. Stage requests are precise desired contracts,
   not established exports. ProfiniteCohomology Layer 10 explicitly owns the
   all-degree colimit and its native comparison. Check remaining finer owner
   contracts without modifying supplier files. IG.0's product π₁ and P¹
   fundamental-group scope still needs confirmation. Avoid an NC.3→NC.0 stage
   cycle for the geometric degree-one dictionary. Keep generic NS with A2,
   generic heights with their routed owner, and M₀,n with the reserved moduli
   owner. The raw-homotopy candidate is unaccepted and has no registered supplier
   stages; resolve its foundational ownership rather than inventing a parallel
   theory here. Coverage/gap ledgers contain historical supersession chains;
   reconcile current obligations before a final verdict.
6. **Reserved key definition.** `key/etale-k-pi-1` occurs once and has the
   inventory's sample API/tests. Its full finite and p-primary classes use
   full profinite π₁; constant Fₚ is a specialization, not pro-p replacement.
   Raw-homotopy equivalence retains the cited geometrically-unibranch scope.
   The geometric π/sheaf/ε Lean interfaces remain honest omissions. Do not
   replace missing conditions with arbitrary Prop fields or invent carriers.
7. **Final screen and verdict.** Finish sourceIssues (currently empty), planets,
   duplication, all API/tests and planned/closed-stage closure. No stage is
   currently planned or closed. Honest partial/not_read stages alone are not
   grounds for sending back a budget-complete pass. Only after all checks,
   write the required global review object, reviewer
   `independent-review-REV-AnabelianGeometryAndNonabelianChabauty`, and one
   justified checked entry for every node, including the added node. Use
   `unverifiable` and needs_changes for an unresolved contradiction; do not
   manufacture verified entries from compilation or inherited receipts.

The report asks the orchestrator about IG.0's precise extra contracts and the
unaccepted raw-homotopy owner's foundations. No roadmap reader, atlas data,
supplier packet, global queue or author handoff was changed. Continue only this
review's deliverables and its handoff. No promotion or acceptance is claimed.
