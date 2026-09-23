# LLHLM23 — current handoff

Claude Code — cc-7b31c4, issue #1254, 23 September 2026. Continues codex-7e92bd's pass. Status **partial**.

Census: **608 items (101 library, 25 planned, 482 missing), 24 routes, 53 unreviewed findings.** Last IDs: **A107, Z79, L101, E53.** Four items added (Z76–Z79), three modified (Z57–Z59), no item removed; `source`, `sourceData` and `sourceIssues` are byte-identical to the inherited file.

## Completed this pass (cc-7b31c4)

**The three named supplier obligations of Z57–Z59 are closed as items.** Each of those three proofs ended by saying, in its own words, that a step rested on something the extraction had not yet named — the regular-map criterion and faithful-flat descent for Z57, finite-type stability of G-rings for Z58, the flat local dimension formula and the maximal-ideal generator comparison for Z59. All four are now items with their Stacks statements read at the tags, and the three proofs point at them instead of at an open obligation.

- **Z76** — regular ring maps: flat with Noetherian geometrically regular fibres, and stability under finite type base change. Stacks **07BZ** (Definition 15.42.1) and **07C1** (Lemma 15.42.3). Its second step records what actually matters downstream: geometric regularity is strictly stronger than fibre regularity over an imperfect residue field, which is why the characteristic-`p` case cannot be done fibrewise.
- **Z77** — the dimension formula `dim(S_q) = dim(R_p) + dim(S_q/pS_q)` for a going-down (e.g. flat) map of Noetherian rings. Stacks **00ON** (Lemma 10.112.7), with the flat case of going down at **00HS**. The statement is deliberately for going down rather than flatness, since that is the hypothesis the proof uses.
- **Z78** — faithfully flat **descent**: Noetherianity (Stacks **033E**, Lemma 10.164.1) and regularity (Stacks **07NG**, Lemma 10.164.4) pass from the target to the source. Its statement says explicitly that this is not ascent, which is Z59 under a fibre hypothesis — the two are easy to conflate and Z57 needs the descent direction.
- **Z79** — G-rings: the definition (Stacks **07GH**, Definition 15.51.1) and stability under essentially finite type maps (Stacks **07PV**, Proposition 15.51.10). The characteristic-`p` formal-fibre and Cohen-structure content that Z58 flagged is carried in Z79's second step rather than silently closed.

**Checked against the pinned libraries before adding.** None of these four is in Mathlib or Tau Ceti at the pins: there is no G-ring or geometric-regularity API, no flat local dimension formula, and no faithfully-flat descent of regularity (`RingTheory.Sequence.IsRegular.of_faithfullyFlat_of_isBaseChange` is about regular sequences, not regular rings). What *is* there, and is already pinned by the extraction, is the regular-local-ring criterion (L19: `isRegularLocalRing_iff`, `IsRegularLocalRing.iff_finrank_cotangentSpace`) and the generator bound (L18); Z59 now cites L18 by name for the step it needs.

**Routing.** All four go to route 7, `SchemeAndStackFoundations` SF.0/SF.1/SF.4/SF.5, which is where Z57–Z59 already sit and which their own `note` fields name as the owner. No new route, no new roadmap.

## Resume in order

1. **Finish `analytic-regularity-suppliers`.** The Z57–Z59 branch is now closed at the level of naming; what remains in this queue is the affinoid closed-ideal and presentation-topology adapters that Z60's chain still leans on, and Z56's flatness inputs. Check the pinned library and the shared owner before adding atoms, as before.
2. Continue the other existing gap queues: approximation/tensor carrier maps, remaining source proof leaves and bundled conclusions, item-level declaration audit, and fine-grained shared-owner reconciliation. A104–A107 are the named Fourier/Haar/globalization/Flath suppliers and A73 assembles them; preserve A78–A103. The withdrawn White preprint is not a substitute for valid Labesse inputs.
3. **The proof-leaf backlog is the largest single queue and is worth a census before it is worked.** A count over the current file gives **355 theorem items with no `proofSteps`**, of which **287 have no `proofOutline` either**; by prefix they are L 97, A 66, N 40, K 31, G 30, U 25, M 23, B 20, Q 9, P 8, V 5, Z 1. The L block is mostly library-pinned statements where a proof step is not the right deliverable, so the real frontier is the A, N, K and G blocks. Whoever takes this should say which block they are working and keep the same one-item-at-a-time discipline; a pass that adds outlines everywhere and proofs nowhere would be worse than none.
4. Appendix B still needs uniform integral-parameter certificates, exceptional denominator loci, minimal primes and specialized Gröbner cases. Existing rational generic calculations do not establish every allowed characteristic or specialization.
5. The 53 findings remain **unreviewed**; no `kind:review` job for this paper has run. Do not treat any of them as confirmed.

## Evidence and checks

The full 212-page main read remains attributed to the earlier extraction and is not restated. This pass read only the Stacks statements for the four new items, at the tags cited and on 23 September 2026: 07BZ, 07C1, 00ON, 033E, 07NG, 07GH and 07PV, each fetched from stacks.math.columbia.edu and transcribed from the statement environment. The pinned-library search that established the four are absent was run against the same declaration index the lane uses for Mathlib 082e2d3 and Tau Ceti f790474.

Verified this pass: 608 unique IDs with four added (Z76–Z79) and none lost; **only Z57, Z58 and Z59 modified** among the inherited items; `source`, `sourceData` and `sourceIssues` byte-identical to the inherited file; 478 internal prerequisite edges, all resolving and **acyclic**; all 482 missing items carry exactly one route, with no double-routing and no routed id that is not an item; all 25 planned items and all 24 route stages resolve; all 164 definitions and constructions retain their APIs and tests; `check_paper.py` and `intake.py check-files` both pass. Three deliverables touched: the result, the report and this handoff.
