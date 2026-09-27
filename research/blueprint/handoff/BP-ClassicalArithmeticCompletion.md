# BP-ClassicalArithmeticCompletion — Cobham’s theorem

Codex — codex-hjdg0j. Refs #1025. Claim comment 5853069998 won, explicitly confirmed by bot 5853070687; the full issue was reread after confirmation. This is a continuation of the 316-node predecessor, not an independent review or a formalization.

## Delivered

Thirteen CA.2 declarations complete the named Cobham remaining item: ten lemmas and three theorems. A sequence automatic in two multiplicatively independent integer bases at least two is eventually periodic, and the converse is stated on the same carrier. The output alphabet remains arbitrary. The existing canonical least-significant-first IsAutomatic is unchanged.

The proof chain gives all-word automaton reversal; a finite-kernel automaton carrying every unnormalized digit; most-significant-first redundant-digit equivalence; exact-length representations of the closed doubled radix interval; finite prefix colours; relatively close positive powers; uniformly bounded repeated representatives of tail colours; local-period gluing; the signed close-scale index calculation; and propagation of the first window’s period through the entire tail. The eventual-periodicity-to-automaticity API is promoted to its own prerequisite node, reusing its existing Lean declaration. Its unary base-one case is treated by a finite counter; it is not inferred from the base-at-least-two kernel criterion.

The bounded-carry invariant is g(n+c)=f(k^L n+V). It includes the final carry in the output g(c). Correctness holds on every bounded-digit word, so arbitrary suffixes and leading zeros are legitimate. Independent bases are needed to rule out A=B; unequal bases such as 2 and 4 do not suffice. Local-period windows retain both endpoint guards. Their integer overlap has at least floor(B/3) points, enough for the sum of two periods bounded by B/6. The theorem promises periodicity on a tail, not at the initial index.

## Preservation and counts

All 316 predecessor node objects are identical as parsed JSON objects. All preceding baseline records, 50 source findings, eight gaps, nineteen requests, 42 planets and three restructuring proposals are retained. The CA.2 Cobham entry alone is removed from the remaining list. CA.2 stays partial because the EDS strong-divisibility source obligation remains. The source-decomposed CA.4/CA.5 and closed CA.0 statuses are unchanged.

Totals: 329 nodes — 45 definitions, 27 constructions, 120 lemmas, 125 theorems, five comparisons and seven applications. There are 501 API items, 279 definition/construction tests plus fourteen theorem acceptance tests (293 packet tests), 310 typed examples, 42 planets and 603 baseline citations. Seventeen citations are new. No new definition, construction or planet is introduced; the six CA.2 planets remain within the limit.

The reader preserves the predecessor sections, updates the current counts and CA.2 remaining boundary, and adds every new statement, hypothesis, proof step, prerequisite and acceptance example. The handoff for the predecessor remains available at the prior snapshot: https://github.com/CBirkbeck/tauceti-explorer/blob/59dd715eedc9d5d13d8726e3cf80074779859caf/research/blueprint/handoff/BP-ClassicalArithmeticCompletion.md . Its historical source audits are not renewed here.

## Evidence and reading scope

The binding WORKERS, blueprint PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE were reread; their fresh snapshot bytes agree with the preceding job. No AGENTS.md exists in this snapshot. All eight reviewed AUDIT-18 layer records, the accepted RS-03 scope/ownership records, the full campaign owner document, full atlas stages and incident edges, the three-node integrated decomposition with its review, and all 37 touching link entries were read. The two upstream style documents read in full were Multiquadratic and Completed/EffectiveBounds.

The predecessor packet’s scope, coverage, gaps, sources, requests and relevant automatic-sequence contracts were inspected. All seven targeted automaton/kernel/reading-direction nodes were read in full. Other inherited nodes and source proofs are preserved evidence, not a new full-packet verification claim. Catalogue node-statement searches and broad pinned Mathlib/Tau Ceti searches found no existing Cobham theorem or the new redundant-digit/local-period interfaces. Only the existing uniform-morphism characterization carried Cobham’s name. Generic digit arithmetic, finite sets, pigeonholing and interval cardinality are reused.

Fresh primary source: Thijmen J. P. Krebs, A more reasonable proof of Cobham’s theorem, arXiv:1801.06704v1, 20 January 2018, https://arxiv.org/pdf/1801.06704v1 . Read the entire three-page preprint, including proofs and references, in one three-page extraction on 27 September 2026. SHA256 70d63131f70db4353e65ab620911bba84e3b0bbc00d5e563b53c5f58f4440ff1. This is the preprint; no distinct published version is claimed read. The proof uses close powers and overlapping periods, not the syndeticity route suggested by the inherited remaining entry.

Krebs’s Lemma 5 cites books for normalization. Those books were not obtained: the new finite-kernel/carry invariant and generic reversal provide an explicit independent deduction of the finite interval-alphabet case needed here. No new source error was found. The fifty inherited findings remain verbatim. Seven sourceVersions entries transcribe their predecessor source metadata and are labelled inherited, with the original hashes. One inherited source did not record an exact read date; that entry retains null rather than inventing a date. The eighth version entry records the fresh Krebs reading. This metadata reconciliation is not a fresh errata review.

Every baseline statement used by the new chain was read in pinned source and its Git blob verified; seventeen were absent from the earlier baseline list. The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Exact paths and read ranges are recorded in continuationAudit.

## Verification

The indexed blueprint checker has zero errors and warnings. Source-finding and source-version validation pass. All predecessor-preservation assertions pass. The full graph is acyclic: 473 internal edges and 1384 total edges. Every new prerequisite is a baseline declaration or an existing/new node in this packet; this continuation adds no supplier request. New reader/signature/acceptance parity passes.

The complete 5965-line suggested file compiles with Lean 4.34.0-rc2: zero errors and 958 proof-placeholder warnings only. All 8482 transitive Mathlib source files were checked against the pinned Git tree and the source bytes associated with the cache. The file imports Mathlib only; no Tau Ceti module is imported or freshly built, and no auxiliary Lean proof file was created. SHA256 0992668f3a3505b9a50545a5a0e276f32a134023c5152f44152a770640dabe6d. All implementation statuses remain unchecked.

Independent exact arithmetic checks cover 17,766 bounded-digit words and their carry invariants; 5,668 doubled-interval values with constructed words; 3,732 interval-gluing configurations, using equality-constraint components to test every possible output sequence on each configuration; 5,675,538 signed transfer indices; and 1,000 rounded adjacent overlaps. These checks validate the formulas and finite cases. They do not turn the planned proofs into formalized theorems.

Final publication check against main 1df817b2abcf3c588c127f3d6433fd8399e29d21: all 51 relevant input paths are unchanged and no new instructions appeared. Exact-file intake reports four files and zero problems; all thirteen new IDs are unreserved.

## Resume

CA.2 now needs Ward’s strong divisibility theorem for nondegenerate integral EDS under gcd(W₃,W₄)=1, with a public complete proof and the connection to the pinned normEDS. Preserve that coprimality hypothesis. Cobham’s theorem is no longer an open source obligation.

Other exact remaining lists are unchanged: quartic reciprocity and the two further Eisenstein-reciprocity inputs in CA.1; characteristic ideals of Int(𝓞_K) and the Pólya group in CA.3; Smyth’s analytic bound and ownership of Dimitrov’s potential-theoretic inputs in CA.6; and Fröhlich–Taylor proofs, Jacobinski cancellation and the general semisimple rank-one class theorem in CA.7. The Catalan–Mihăilescu ownership and stale retired supplier are among the eight retained gaps. Nineteen requests preserve their precise external contracts. The packet remains partial and no new whole stage is closed.
