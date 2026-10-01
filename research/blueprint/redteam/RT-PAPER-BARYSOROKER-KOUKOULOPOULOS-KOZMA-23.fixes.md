# FIX-RT-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23

Complete fix by Codex, session codex-J6LwjP, 2026-10-01, for [issue #5504](https://github.com/CBirkbeck/tauceti-explorer/issues/5504). The red-team review confirms one medium finding.

## Finding /1 — maximal-order divisor supplier

**Fixed.** Strengthened existing theorem item /129 rather than adding another item. It now asserts: for every ε>0 there is K_ε>e such that τ(k)≤exp((log 2+ε)log k/loglog k) for every positive integer k≥K_ε, with natural logarithms. It retains the fixed-η subpower corollary τ(k)≤C_η k^η for all positive integers k, including the finite initial range. /48 and /110 keep their existing dependencies on /129; /48 needs the maximal-order statement, while /110 needs the corollary. Status remains missing. Route 6 still owns /129 exactly once and now explicitly assigns this supplier to AnalyticNumberTheory:AN.5. No new source erratum or definition/API is introduced.

Added Hardy–Wright, *An introduction to the theory of numbers*, sixth edition (2008), §18.1 Theorem 317 to prerequisites, with the citing BKK PDF as the honest link. Corrected the old Koukoulopoulos prerequisite’s S4 attribution. S4 and all three affected items’ source gates now distinguish completed supplier extraction from deferred source-proof acquisition/decomposition. The reader’s supplier list, route 6 and new fix section agree with the packet. The statement of Lemma 3.1 (/48) and E25 are unchanged.

The support-uniform implication was checked: if X_N=N^(loglog(100N)), then log X_N/loglog X_N∼log N. On the eventual increasing range of log k/loglog k the maximal-order upper bound, with ε chosen strictly below 0.695−log 2, therefore bounds max_{1≤k≤X_N}τ(k) by O(N^0.695); bounded k contribute a fixed constant. The factor-pair count on BKK p. 18 gives at most 2(n−1)T/N for the conditioned reducible proportion, and n≤N^0.005 yields O(N^(−0.3)). By contrast a fixed-η estimate on this support gives C_η N^(η loglog(100N)) and cannot replace the maximal-order supplier. For /110, the retained corollary with η=δ/4 has the allowed δ-dependent constant. This checks the consumer contract; no Hardy–Wright proof development is claimed.

## Evidence and scope

Reacquired [arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3) and read pp. 18 (text and rendered page), 60 and 64 on 2026-10-01. It has 65 pages and SHA-256 `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1`, matching the extraction and red-team hashes. Lemma 3.1’s proof on p. 18 states the leading-log-2 upper bound and cites [18, §18.1, Theorem 317]; reference [18] on p. 64 identifies the sixth edition. The proof of Lemma 12.3 on p. 60 uses the subpower divisor bound. **The Hardy–Wright book itself was not read.** Its proof remains a design/blueprint obligation of AN.5; extraction completeness does not require solving it.

Read the accepted red-team result and verified verdict, the paper’s affected items and reader, route 6, S4, E25, the reviewed AN.5 library coverage and the current AN.5 stage description. The reviewed audit marks AN.5 not built. A targeted search of both pinned NumberTheory trees for maximal-order/Wigert/logarithmic divisor bounds found no matching supplier. This fix retains the accepted missing status and introduces no new library credit.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json` passed.
- `python3 research/blueprint/intake.py check-files` on the three deliverables passed: three files, zero problems.
- Independent structural check: 133 unique items (15 library, 3 planned, 115 missing), prerequisites resolve and form an acyclic graph, every missing item routed exactly once, /129 routed only in route 6 to the named AN.5 supplier, and all source-route stages resolve.
- Change-scope check preserves /48’s statement, every item’s status/prerequisite IDs, route memberships and all 26 existing sourceIssues. `git diff --check` passed.
- No Lean deliverable was requested or changed; no Lean compilation or language server was run.
