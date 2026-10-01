# FIX-RT-RS-12~3

Refs #5547. Codex, session `codex-a71f92`, 2026-10-01.
Audit commit: `b643e793a6b1fa0a52245d3195278fe591c15bde`.

All three medium findings were independently confirmed in
`RT-RS-12~3.review.json`. This fix addresses their proposal-level corrections
and precise owning-blueprint handoffs. Only the issue's four authorized files
change; no packet, campaign document, base decomposition or Tau Ceti roadmap
changes. Actual packet implementation is not claimed. This session reviewed
RS-12 round 2 (REV-RS-12~2); it does not independently review this fix.

| Finding | Applied correction | Owning-blueprint follow-up |
| --- | --- | --- |
| /1, prospective normalization-migration cycle | AG2.0 reason, AG2.5 retained scope and report §4a now require incident-edge repair, early dictionary/ET.6 inputs to HLTT, and a later comparison output. | Replace the literal late-comparison prerequisite and equivalent link, update all renamed references and check finer and parent-projected dependencies before promotion. |
| /2, missing R14.6 → R19.1 route | Added that link; R19.1 reason/owner distinguishes carrier, weight-two imported relation and higher-weight/eigenspace content; added the explicit R14.6 relation owner record. | Preserve the existing finer prerequisite and add the exact R14.6 request in handoff/RS-12~3.md. Coordinate RT-AREA-langlands-2/9. |
| /3, missing IHG.4 → AG2.4 route | Added that link; AG2.4 explicitly imports generic interpolation/limits and retains the application with coefficient-domain obligations. | Add the IHG.4 request/prerequisite and verify trace-pseudorepresentation versus determinant-law hypotheses. Coordinate the interpolation part of RT-AREA-langlands-1/26; factor separation is a distinct existing handoff. |

## Evidence and scope

Read the entire accepted proposal/report and round-3 handoff, family file, both
member documents, the three findings and their verification, the latest
restructuring review, relevant RS-06 decisions, all sixteen reviewed library
coverage entries, and the affected partial-packet nodes, prerequisites and
requests. Read the R14.3/R14.6, ET.6 and IHG.3/IHG.4 owner contracts and both
coordinated area findings/verdicts and their fix sections. The supplier relation
already has a partial R14.6 node; no duplicate proof is requested.

Selected primary-source checks on 2026-10-01 (not full proof coverage): HLTT
author PDF Theorem A and §6.1 pp. 194–197; Deligne Bourbaki 355 Proposition
4.8/Theorem 4.9, printed pp. 166–167, including page images. URLs and hashes
are in RS-12.md §9. Their good-prime, normalization and coefficient distinctions
remain intact. This fix makes no new exhaustive library-absence or implementation
claim; reviewed AUDIT-31 coverage is inherited at Mathlib `082e2d3` and Tau Ceti
`f790474`. Existing source gaps remain gaps.

The proposal's historical accepted `review` object is unchanged. `promote.py`
does not replay an already-acted review with the same reviewer/date; these
edits require independent REV-FIX-RT-RS-12~3 acceptance before going live.

## Actual validation

- The committed `check_restructure.py` passes the candidate against its family
  and the immutable atlas/new-roadmap registry.
- The committed `build.assemble(require_distances=False)` succeeds before and
  after replacing only RS-12 with the candidate. Kahn sorting covers every
  stage/node and all edge endpoints: 3,007 vertices, 8,622 → 8,624 distinct
  dependency pairs, zero remaining vertices. Existing external placeholder
  endpoints are counted, not mistaken for new unresolved suppliers.
- All old stage/node IDs and pairs are preserved. Stage payloads outside
  dependency/restructuring metadata are unchanged. Both supplier pairs are
  exactly the new pairs; none of the 32 proposal links is skipped. Reapplication
  adds zero pairs.
- All 17 narrowed-stage supplier/direct-consumer forwarding tests pass even
  with the narrowed stage excluded from the tested path. No late AG2 stage
  reaches R19 and no R19 conclusion reaches AG2.0/AG2.1a.
- All 12 inherited links of the 15 member decomposition nodes were projected
  to their parents and united with the full assembled graph. Original placement
  passes. Moving only the normalization parent reproduces
  AG2.4 → AG2.5 → AG2.4. Removing the late input and supplying early AG2.0/ET.6
  passes jointly with both new links. The literal partial-packet HLTT
  prerequisite also contains the defective node and was checked against the
  proposed replacement in simulation. No partial packet is asserted closed;
  all earlier multi-output node splits need their own complete graph checks.
- The local shared worktree is untouched. No repository clone/snapshot, Lake
  setup, library build, Lean server or Lean compilation; no Lean deliverable.

Next: independent fix review, then the authorized owning blueprint checkpoints
perform and review the packet repairs. The handoff contains every request and
acceptance obligation; no temporary file is needed to resume.
