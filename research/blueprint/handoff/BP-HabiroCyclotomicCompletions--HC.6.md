# BP-HabiroCyclotomicCompletions--HC.6

Completed by Codex (GPT-6), session `codex-I5hn5G`, for issue #6471 on 2026-10-05. This is a completed pass for the sole scoped stage `HabiroCyclotomicCompletions:HC.6`.

## What is closed

The original remaining item was conditional on acceptance of RS-10. `research/blueprint/restructure/RS-10.result.json` now has an accepted review by `independent-review-REV-RS-10~2`, dated 2026-09-29. Its HC.6 narrowing retains classical acceptance cases, finite precision, value-versus-Taylor tests, source ledger and suggested-file boundary, and assigns the late arithmetic F=Q comparison to HB.6. Protocol §15 requires following that accepted boundary even while the atlas/document retain the older sentence.

The retained targets are already realised by three nodes in the independently accepted parent packet:

- `HabiroCyclotomicCompletions:HC.6/the-exported-interface` (comparison);
- `HabiroCyclotomicCompletions:HC.6/the-acceptance-examples` (application);
- `HabiroCyclotomicCompletions:HC.6/inverted-prime-and-rational-examples` (application).

Their statements and prerequisites were read. The follow-up imports them by identifier and records the target-to-supplier mapping. It does not edit or duplicate the parent nodes. The reviewed AUDIT-17 entry classifies HC.6 as process/interface, so this packet has no new mathematical nodes or planets. Accepted RS-10 keeps its classical interface role; another removal proposal would conflict with that accepted scope. The checker expressly supports closed stages realised in another packet of the same roadmap.

New-node counts: definitions 0, constructions 0, lemmas 0, theorems 0, comparisons 0, applications 0. New node API items 0, node unit tests 0, planets 0. Imported HC.6 nodes: 1 comparison and 2 applications. Existing definition APIs and tests remain with HC.1–HC.5. The suggested file adds 39 finite polynomial example specifications, rather than introducing a duplicate completion type. Baseline declarations cited: 17. Coverage: HC.6 closed. Packet status: complete. Gaps 0; requests 0; new source findings 0; four canonical source findings referenced.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.6.json` reports 0 errors and 0 warnings. Every imported HC.6 identifier and every foundational identifier in `targetCoverage` was checked against the parent packet. Its accepted review is `independent-review-REV-HabiroCyclotomicCompletions`.

`lean-check research/blueprint/suggested/HabiroCyclotomicCompletions--HC.6.lean` exited successfully. The file elaborated at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with exactly 39 warnings that declarations use `sorry`, and no other warnings or errors. Available memory was 96 GB before compilation. The shared Tau Ceti checkout is newer than pinned `f790474821cf4256814db967cb154e7af3d0c369`; the file imports only Mathlib, whose checkout is exactly pinned. No Tau Ceti build or newer Tau Ceti declaration was used to elaborate it. The referenced baseline statements were read in the pinned Mathlib source. Compilation establishes signature correctness, not the proofs or an implementation.

Independent scratch calculations used exact integer and rational coefficient vectors with addition, multiplication, translation and long division. They verified:

- F values at orders 1–6, stable under larger truncations;
- the ten displayed Taylor coefficients at 1, seven at −1, and three at a cube root;
- qUₙ = 1 − Pₙ, the normalized Fq⁻¹ coefficients, and F² modulo P₄;
- the two odd-order representatives over **Z**[1/2], their compatibility, idempotence and precise CRT congruences;
- the rational e₁ and t representatives, including t's nonzero first Taylor coefficient;
- the characteristic-two idempotent and its two CRT congruences, using modular polynomial division separately.

The mathematical formulas needed to reproduce these checks are in the reader document and suggested file. The scratch calculation program and downloaded PDFs are not repository deliverables.

## Sources and boundary checks

Read Habiro's publisher PDF, SHA-256 `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f`: §1, pp.1127–1128; §3.1 and opening §3.2, pp.1130–1132; Theorem 5.2 and proof, pp.1137–1138; Conjecture 6.1 and §7.1–§7.5, pp.1141–1146. Read GSWZ arXiv:2412.04241v2, SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`: §§1.3–1.4, pp.4–7; §5.1, pp.59–62; p.66, the continuation of Example 5.6 and Example 5.7. These are inspected passages, not a claim to reread either whole paper. No needed source was inaccessible. The exact URLs, versions and access date are in the packet.

The encountered source defects already have independently confirmed records. Reuse `PAPER-GAROUFALIDIS-SCHOLZE-WHEELER-ETAL-24/E74`, `/E77`, `/E82` and `HabiroNumberFields/E22`; the packet's `sourceIssueReferences` links them and states which corrections are used. `sourceIssues` is empty because this pass introduces no new finding. In particular, the reversed vanishing inequality is corrected, tensor base change is only finite-level, and the gluing-image assertion is not attributed to Habiro or imported circularly.

Read the reviewed library audit, atlas stage text and touching edges, the original document, parent coverage/nodes and accepted restructuring. Scanned all blueprint link maps for this roadmap and consumer packets for HC.6 references. The relevant HB.6 comparison node now depends on foundational HC.1/HC.3/HC.4/HC.5 nodes directly. This packet introduces no HC.6 → HB.6 prerequisite. QT.4 retains the classical tests without acquiring the arithmetic ring. The q-analogue toolkit request in the quantum-topology packet is a distinct HC.1/QM.0 ownership matter, explicitly excluded from the parent HC.6 interface; it is not silently implemented by this closure. Upstream style examples read were AdicSpaces and Multiquadratic.

## What remains

No follow-up is needed for HC.6's retained scope. An independent reviewer should check the import-based closure, accepted RS-10 boundary, exact finite identities and distinction between classical **Q** coefficients and the arithmetic rational-field ring. The parent packet's HC.4 gaps and q-toolkit ownership question remain in their own jobs. HB.6 owns the arithmetic comparison and its finite-lattice/gluing proof; this packet neither resolves nor requests it. The stage's mathematical implementations remain unchecked.

Only the four issue deliverables are changed. No parent packet, source finding, atlas data, consumer or roadmap document is edited.
