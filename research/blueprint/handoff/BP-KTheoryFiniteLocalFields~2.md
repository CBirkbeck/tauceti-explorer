# BP-KTheoryFiniteLocalFields~2 — reader reconciliation

Complete revision for issue #6973, by Codex — codex-qRK3zy, 7 October 2026. Claim comment 6043158785 was confirmed by bot comment 6043161270. The input is the corrected packet and independent report `research/blueprint/reviews/REV-KTheoryFiniteLocalFields.md`.

## Completed work

The independent review's acceptance blocker was the reader's disagreement with the corrected packet. Compared all 280 reader node blocks against their packet contracts and replaced the 60 stale blocks. Retained the other 220 blocks, with sequencing words normalized to satisfy the issue's document wording rule. The review's 65 corrected nodes include five whose reader mathematics already agreed. No node was added, removed, renamed or mathematically changed in this revision.

The reader now carries the corrected statements, hypotheses, proof outlines, APIs, tests, acceptance checks, prerequisites and source passages. It also carries all 102 pinned baseline contracts, 48 independently confirmed source findings (including E43–E48), two imported findings, 39 named gaps, 34 supplier requests, 26 structural proposals, all stage coverage notes, and the five superseded generic log-Witt specifications under their CR.4 supplier request. Those five specifications preserve 15 API items and nine tests outside the local node totals; they are not recreated as local nodes. The source registry includes the recorded versions and their reading scopes.

The introduction, boundary sign, indexing, supplier ownership and final acceptance discussion agree with the corrected nodes. In particular:

- The localization boundary is left linear with ∂[π]=1 and ∂{u,π}=ū; the K-book symbol is its inverse. Mixed coefficient/integral pairings are explicit.
- TR starts at level one; adjacent-level maps and norm sequences require level at least two. TC multiplication comes from the equaliser of the ring maps id and F.
- The complete-DVR Bott comparison is a pro-isomorphism. The nonunit level-one multiplier cannot prove a levelwise isomorphism. The ordinary-THH class κ̃ requires p dividing e; the logarithmic class remains distinct.
- The regular-characteristic-p arguments extend comparisons at finite levels first, then use pro-zero positive polynomial summands, surjective Witt restrictions and Milnor sequences. The regular-local K comparison uses the degree-preserving Witt filtration and surjective coefficient quotient towers.
- Integral cyclic identifications and splittings are choices; density in the whole completed odd group requires vanishing of the preceding divisible p-torsion rank.
- The early M.8 Chern export is unresolved because the whole regulator stage would create a cycle. No resolved M.8 → L.1 edge is inserted. General log-Witt theory belongs to CR.4/CR.5 and the general classical/modern TC comparison to RT.2.

The suggested file's standard note and review-concordance introduction now reflect the reconciled reader. Its executable declarations are unchanged. Packet changes are limited to revision evidence and four scoped source-version rereads. The inherited `review.status = needs_changes`, its notes and all 280 checked verdicts are preserved verbatim for an independent re-review to replace.

## Coverage and remaining work

Packet status is `complete` under PROTOCOL §0. Every stage is planned; no stage is closed. Every implementation remains unchecked. This is a completed revision pass, not a checkpoint or an implementation claim.

| Stage | Nodes | Status | Principal remaining proof boundaries |
| --- | ---: | --- | --- |
| L.1 | 61 | planned | Quillen detection and mod-p acyclicity; prime-two comparison; Green, Atiyah–Segal, Eilenberg–Moore, Browder/Araki–Toda and Hiller inputs; Lang, hermitian and finite-rank classical-group foundations; early Chern export; profinite Brauer embedding changes. |
| L.2 | 17 | planned | Gabber rigidity and coefficient-product foundations; precise supplier left-linear coefficient boundary pairing. |
| L.3 | 21 | planned | Merkurjev, characteristic-p K₂ Hilbert 90 and Moore source proofs; local symbol and duality exports. |
| L.4 | 35 | planned | Cyclotomic/Waldhausen, approximation, resolution, Morita and dévissage supplier proofs; a concrete nonzero ηd witness at p=2. |
| L.5 | 85 | planned | Cohen/Witt coefficient embedding and Eisenstein presentation; initial log-Witt complex; Lindenstrauss–Madsen, Tsalidis and cited HM 1997 inputs; continuity, representation-graded TR and cohomology exports; Popescu foundations. |
| L.6 | 50 | planned | Étale p-adic homotopy types, local cohomological dimension, higher-coefficient natural splitting, Geisser–Levine and Popescu exports; hermitian homotopy-limit and dyadic Witt/L-completion foundations. |
| L.7 | 11 | planned | Inherited symbol proof boundaries and supplier completion/semilocal, transfer and Chern-class contracts. |

The exact 39 gaps and their consuming nodes, and all 34 requests with precise required statements, are in the packet and reader. No external message or new issue was sent to a supplier. All previously recorded structural proposals remain operative, including the early Chern split and the imported log-Witt specifications. A supplier's library vocabulary alone does not discharge its proof contract.

The immediate next step is independent re-review of the reader reconciliation and concordance. Resume proof refinement from the named gap and request entries after their owners provide the required statements. Do not spend another pass replanning K₀, generic log-Witt objects or trace-comparison foundations already owned elsewhere.

## Evidence and validation

Read the reviewed library audit for L.1–L.7 and all link-map records mentioning this roadmap. Read the campaign stages, blueprint and expansion protocols, upstream guide, and nearby upstream algebraic-topology and induction/restriction roadmap documents. Inspected the 102 cited declaration statements from existing source git objects at the exact pins, including the generated/scoped notation and six instance declarations requiring manual lookup. Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Source rereads are deliberately scoped: K-book IV.2.8/Scholium2.8.1 and VI.7.3–7.5; Hesselholt–Madsen arXiv9910186v2 Proposition3.4.1 and proof, Remark4.1.4, TheoremC proof and Remark6.1.5; Hesselholt 1996 Corollary2.4.7 and its Milnor/pro-zero proof; Geisser–Hesselholt 2006 §3 Theorem3.1 and its finite-level/filtration proof. Public PDF fingerprints matched the packet. Public URLs, SHA-256 values and this reading date are preserved in `sourceVersions`. This revision does not claim to have reread all 25 sources or to have obtained the unread supplier proofs; the original reading records and source gaps remain explicit.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`: zero errors and zero warnings.
- Source finding and source-version validators: zero errors; all 48 findings retain independent confirmed verdicts.
- Field-by-field reader concordance: all 280 node blocks, 209 local API items, 122 local test records (117 attached to objects), 102 baseline descriptions, all gaps/requests/coverage/structural details and the five preserved supplier specifications agree. Normalization changes sequencing prose only. API and test names appear in the suggested file, within their namespaces or explicit supplier omission comments.
- Compared the packet with the input: nodes, review, coverage, gaps, requests, structural proposals, baseline, source findings and imported findings are unchanged. Compared Lean text after removing nested comments: executable declarations are unchanged.
- `git diff --check`: passed. Only the four issue deliverables are submitted. No downloaded sources, source snapshots, scratch logs or private paths are included.

`lean-check research/blueprint/suggested/KTheoryFiniteLocalFields.lean` was attempted on the input with 100 GB available memory and on the final file with 92 GB available. Both attempts stopped before elaboration because the shared build lacks `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.olean`. The shared Mathlib pin matches, but the shared Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the packet pin. This file did not compile; historical successful runs do not certify it. No library build, update, cache download or language server was started. To resume compilation, provide an existing build at both exact pins with the imported artifacts present, then rerun `lean-check`.

Totals: 280 nodes — 13 definitions, 13 constructions, 117 theorems, 113 lemmas, 21 comparisons and three applications; 209 local object API items; 117 object tests (122 local tests overall); 42 planets; 102 baseline declarations; 39 gaps; 34 requests. The five supplier specifications and their 15 APIs/nine tests are counted separately.
