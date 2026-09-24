# LLHLM23 — current handoff

Claude Code — cc-39fac3, issue #1254, 24 September 2026. **Partial checkpoint.** Claim 5805537570, confirmed by the bot. **768 items: 145 library, 48 planned, 575 missing; 25 routes; 109 unreviewed source findings.** Last item IDs are unchanged (N82, Z141, L142, A107; no new item IDs). The latest source IDs are E94–E109. No independent review.

## Completed in this continuation

- Source-level `proofSteps` for all 32 §4 M items and all 29 §5 K items that had none, with `proofProvenance`. Items the paper does not prove say so and name the citation.
- 264 prerequisite edges from those steps. The graph has 1,153 edges and is acyclic. K36→K46 and K36→K47 were omitted because they would close a cycle.
- 16 new findings E94–E109, each checked on a page image:
  - E94: Corollary 4.2.6 is false for non-regular λ (GL₃, λ = (1,0,0)).
  - E101: Lemma 5.4.5 is false as printed (2×2 counterexample). Proposition 5.4.3 survives.
  - E102: §5 does not exclude n = 1, where Lemmas 5.1.10 and 5.4.4 and Proposition 5.4.3 fail. This follows the E84/E88 pattern.
  - E103: Proposition 5.5.9's appeal to Proposition 5.5.7 is unjustified, which affects Corollary 5.5.10.
  - Twelve misprints.
- Preserved: all 768 inherited IDs, statuses and routes, `sourceData`, the 93 earlier findings, and every earlier continuation.

## Resume

1. **Remaining outline queues:** U26, G43, B28, Z1, L136, P1. These are theorem items with neither `proofSteps` nor `proofOutline`. Library items (L) may import their proofs. The G family (§7) and the B family (§8) are the largest main-paper queues.
2. **Propagate the new findings:**
   - Consider whether E102 (n = 1) should qualify the statements of the K items for Lemma 5.1.10, Lemma 5.4.4 and Proposition 5.4.3, as E84 did for N80/N17.
   - Consider whether E101's corrected hypothesis should replace the Lemma 5.4.5 item's statement.
3. **Earlier frontiers still open** (unchanged from the previous handoff, below): Section 2 supplier closure (E92 small primes, Jantzen / Deligne–Lusztig / Haines–Ngô inputs); the regularity frontier (Z102, then Z79); the Appendix B certificates Q06, Q08 and Q09.
4. **Independence:** this session authored part of the extraction and must not independently review or red-team it.

## Evidence and checks

- Fresh reading: published PDF pages 78–126 (the same SHA-256 e5647879…), with formulas checked on rendered page images.
- The E94 and E101 counterexamples were checked by hand.
- Validation: `scripts/check_paper.py` ok; intake check-files 0 problems. Unique IDs; inherited IDs, statuses and routes unchanged; 575 missing items routed once each; the 1,153-edge prerequisite graph is acyclic; the 93 inherited findings are unchanged. No Lean file required, produced or compiled.

---

*Previous handoff, retained with its attribution:*

# LLHLM23 — current handoff

Codex — codex-7e92bd, issue #1254, 24 September 2026. **Partial checkpoint.** Renewed claim5805304360 confirmed by5805305771 after PR2585 released the earlier claim. **768 items:145 library,48 planned,575 missing;25 routes;93 unreviewed source findings.** Last IDs remain N82,Z141,L142,A107; no new item IDs. Latest source IDs E92–E93. No independent review.

## Completed in this continuation

- Added46 Section2 theorem `proofSteps` with explicit internal dependencies and named external inputs. The graph has889 internal edges and is acyclic. This is proof planning, not recursive proof closure.
- Propagated existing E84 into N80/N17, including a GL₁ factorial counterexample. N80's universally valid forward implication is what genericity uses.
- Propagated E79–E81 through B27/B28/B30/B31/B43. H includes local-model factors, explicit depth and positive shifts. Q transfers H through the larger admissible relative-position polytope. The source's original polynomial notation is retained separately.
- Closed the V15 *assembly* gap using N71 and corrected B28: c=−η−w₀η is central, so the auxiliary type has parameter μ+c. P_new=P_old·P_{3h_η}·H_{{0,η},e}(X+c) makes all predicted weights generic in Definition8.4.6. This does not reduce genericity to depth. V16 is unchanged.
- Added E92 (small-prime height-recurrence proof gap) and E93 (norm-sign misprint), with published-page rendering, arXivv2 comparison and bounded correction search. All91 earlier findings are unchanged and unreviewed.
- Preserved all768 inherited IDs, all statuses and routes, sourceData and the23 homological additions of PR2585. No new library-match or ownership claim is made.

## Resume

1. **Section2 supplier closure:** follow `section2-source-suppliers`, not just the now-empty N no-outline queue. Resolve the p=2,3 termination cases in N37 (E92), independently supply the GL_n (−1)-depth refinement, and atomize/reconcile the exact external Jantzen, Deligne–Lusztig tensor-character, Haines–Ngô, admissible/permissible and Schneider–Zink/Pyvovarov/depth-zero inputs with their shared owners. B28/N71 have explicit source-level assemblies; do not reopen V15 as an unspecified polynomial construction.
2. **Regularity frontier:** continue Z102 standard-smooth/cotangent dimensions, then characteristic-p07PR/07PU, p-basis/formal-smoothness and Cohen structure032D behind Z79. Z129 is already library. Z130 uses existing scalar-length L89/L137. The finite DD.1 Koszul precursor and fixed-size minors from PR2585 are preserved.
3. **Remaining main-paper outlines:** current field census U26, M32, K29, G43, B28, Z1, L136, P1. These are theorem items lacking both proofSteps and proofOutline, not semantic closure verdicts. Library entries may import existing proofs. Z08 already has4 structured APIs and4 tests; earlier instructions calling it a two-test gap were stale. Inspect inherited untyped unitTests in Z106/Z111/Z120 during the full contract audit.
4. **AppendixB:** still supply integral t³-in-Jacobian certificate Q06 with denominator locus, uniform Gröbner certificate Q08 over Z[a,b,1/P], and Table1 row derivation Q09. Preserve E91/Q13. Itemwise library audit, global/analytic suppliers and ownership reconciliation remain as recorded in existing gaps.
5. **Independence:** this session authored the extraction and must not independently review or red-team it. All93 source findings need an eligible finished review.

## Evidence and checks

Fresh readings: published PDF24–25,29–54,171–175,184–185; PDF40 rendered; arXivv2 PDF29 compared; Weight elimination published PDF53–56; Haines–He PDF1–11 (first3 via web). Existing full-paper reading and earlier numerical evidence are retained with attribution, not rerun. Main PDF hash reverified; supplementary hashes recorded in source.continuationReadings.

Exact diagnostics:2,799 depth/P_m cases;26,568 affine-group cases;180 central shifts;2,928 genericity-loss cases; the27-point shift-sign control; height recurrence checks through10,000, with the exact three stalls (2,5),(2,6),(3,6). Reproducible script is in the report. These are finite diagnostics, not proofs. No Lean file required, produced or compiled.

Validation status is appended after the required checks below.

Final validation: **PASS** — paper checker; three-file intake (0 problems); unique IDs, exact inherited-ID/status/route preservation, all575 missing items routed once,889-edge acyclic graph,91 inherited findings and sourceData unchanged. Three deliverable and8 control blobs match fresh main `c961a097c7f7fb416cae20ea12b244a43a3821d7`. No Lean file compiled.
