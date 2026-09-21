# PAPER-MERKURJEV-SCAVIA-26 continuation handoff

Refs #1408. Codex session `codex-a71f92`, continuing `codex-c83e7a` / PR #1637.
Status: **partial checkpoint**, not a formalisation or source-complete extraction.

## Completed in this continuation

- Preserved all 125 inherited item IDs; added /126–/133. Totals: 133 items,
  11 library, 10 planned, 112 missing. Seven routes own every missing item
  exactly once, plus three already-planned source items.
- Independently read all 21 pages of arXiv v1 and all 10 pages of the
  Gherman–Merkurjev author preprint. Re-downloaded the identical author version
  and checked the affected statements. Original hashes and source attribution
  are in JSON and the report. NSW targeted readings remain inherited evidence.
- Rechecked the eleven library items at Mathlib 082e2d3 / Tau Ceti f790474,
  complete relevant roadmap texts, and reviewed audit rows; compared those
  rows against current main (unchanged). Full Kummer surjectivity, profinite
  Hilbert 90 and five-term exactness remain upstream plans, not built claims.
- Closed /115 (Remark 5.8(2)). The section of
  N={(I+aE_12+bE_13)} has two carry cocycles. Its class is
  E_12 cup δχ_12 + E_13 cup δχ_13 in H²(N,A), hence negligible for μ_p²⊂F.
  The report supplies a second proof constructing a continuous weak lift from
  two Kummer-character lifts, without using the classification theorem.
- Kept the ambient groups explicit: the new cup formula is in H²(N,A), with
  no corestriction to U. It does not contradict Claim 5.7. Added the resulting
  failure of surjectivity on restriction of negligible subgroups (/133).
- Routed /64 as the true negative acceptance theorem, not a false build target.
  The sign-action example over R(t) and the roots-hypothesis repair /63 are
  settled at manuscript level. Comparing final published wording is separate.
- Added a reproducible standard-library Python suite in the Markdown report:
  97,529 exact assertions pass, including both carry coordinates, cyclic
  nonsplitting, all 19,683 characteristic-three matrices, and the earlier
  central-lift/non-preserved-summand boundary examples.

## Remaining work and where to resume

1. Obtain the 22-page JAMS version of record, DOI 10.1090/jams/1059, pp.73–94.
   The exact AMS PDF `S0894-0347-2025-01059-9.pdf` and alternative publisher
   endpoint returned 403; do not claim the manuscript corrections persist in
   the final text. The full preprint is accessible, so this is not a claim
   that the main paper could not be read.
2. Read and decompose Chu–Kang, *Rationality of p-group actions*, Theorem 1.6.
   The primary abstract verifies rationality and exact root/exponent
   hypotheses, but not the proof. Stable rationality is insufficient for
   the exact p-variable field in Theorem 1.4.
3. Read GMS03 I §5 (free-open versality) and KMRT98 Definition 18.15 / Example
   28.15 (Galois algebras, including disconnected ones) in their original
   chapters. Their consuming statements are already individual items.
4. In the design phase, give the finite-group integral universal-coefficient
   and Tor-injectivity lemmas precise implementation interfaces on the
   existing homological carriers, coordinating the generic supplier with
   ClassFieldTheory. No general Tor object is to be recreated.

Do not reopen the old /115 proof gap: the full explicit proof is now in the
report. The previously inherited full manuscript-text comparison and NSW
reading should remain attributed to the earlier worker, not represented as
new checks by this one. Gherman–Merkurjev's separate trivial-action
classification needs its own inventory despite the source now being read.

## Checks and scope

`python3 scripts/check_paper.py` passes. Exact arithmetic, item/route/API
coverage, embedded-test reproducibility, JSON syntax, and whitespace/scope
checks pass. Only the issue's JSON, Markdown report and handoff are submitted.
Lean compilation: not applicable; there is no Lean deliverable in this paper
job. No theorem is claimed newly formalised. No upstream file was modified.
