# Review #6217: published scope complete; scheduling repair awaiting authorization

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-iAhOWA**, 19 October 2026.
Input commit: `1634ea539f881e9dd1a96cacedcd866a4ccad598`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6258129912)
identifies this session's claim comment 6258128348. This session authored none of the fixes.

**Blocked checkpoint.** The live issue permits the HE.0 packet, its suggested
file and this report. The assigned fixes already have an accepted independent
review. The queue nevertheless requires verdicts on ten packets. A fresh
full generator replay reproduces the mismatch and verifies the previously
proposed repair. This checkpoint additionally supplies the complete patch
and identifies the wider effects precisely, so that a maintainer can review
and apply it without reconstructing scratch files.

The repair has not been applied. A scope clarification was requested in this
session; no reply authorizing it had arrived when this checkpoint was prepared.

## Mathematical verdict already recorded

The existing packet review accepts the four findings within the published
assignment. Those historical outcomes are preserved with their attribution:

| Finding | Accepted correction and its boundary |
| --- | --- |
| /2, level raising | The exact-level theorem is an explicit supplier request. Rational Jacquet–Langlands and integral quaternionic transports have separate contracts. |
| /8, Zhang's inputs | Rank-zero, period and transfer contracts retain the extra hypotheses; the HE.6z proposal separates Zhang's branch from clean descent. |
| /9, open images | HE.7 retains the Heegner application and imports the general image theory from its Part II owner, with missing all-prime and GL₂-type exports explicit. |
| /10, Howard systems | ES.5 owns the self-dual hypotheses and DVR bound; ES.8 owns the Λ-adic theorem. Primitivity equality has its own hypotheses and supplier request. |

The [mathematical review at commit 508e89592](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md),
the packet's attributed review/history and source-issue records, and
[the second-round fix submission](https://github.com/CBirkbeck/tauceti-explorer/pull/6753)
preserve the source evidence. The
[preceding checkpoint](https://github.com/CBirkbeck/tauceti-explorer/blob/1634ea539f881e9dd1a96cacedcd866a4ccad598/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
preserves the subsequent sessions' attribution and checks.

No mathematical statement, review marker, source receipt or Lean signature
changes in this checkpoint. It gives no verdict on the nine additional
packets and does not claim a fresh primary-source audit. The existing
acceptance remains limited to the HE.0 fixes, with 21 gaps and 63 requests.

## Fresh verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`:
  zero errors and warnings; 78 nodes, 24 API items, 18 tests, 13 baseline
  declarations, eight planned stages.
- After checking available memory, `lean-check` on the assigned suggested
  file exits **0**, with **114** warnings, all `declaration uses sorry`.
- The actual `issues.deliverables_complete` returns **false** for the queue
  record and **true** for an in-memory copy restricted to the three
  issue-named outputs. All 21 expanded output paths exist; the failure is
  the missing verdicts belonging to this job, not missing files.
- Existing queue, issue and follow-up tests against the unmodified module:
  **59 tests run, one skipped, no failures**. The same tests against the
  candidate module loaded in memory give the same result.

These checks validate the unchanged assigned files and the scheduling
experiment. They do not prove admitted Lean statements or certify additional
mathematical reviews.

## Repair and full generator replay

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-1~2.md) contains the exact
80-line patch. It restores only the two affected queue records' `outputs`
arrays from commit `88f9bcd44` and changes `fix_rounds` to retain an existing
following round unconditionally. Job states and existing review verdicts are
preserved.

I ran `make_queue.main` twice against the actual repository inputs and an
in-memory queue containing the two restored arrays. Both runs used the same
input tree. One used the current selector; the other used the candidate.
The dry-run return was instrumented to expose `merged` and `prompts`.
Repository writes were prohibited, directory creation intercepted and the
lock redirected to scratch. Input discovery, templates and final state
preservation ran normally; no generated queue or prompt was installed.

| Replay | Generated jobs | Fix-round-two outputs | Review-round-two outputs |
| --- | ---: | ---: | ---: |
| Current selector, restored input arrays | 6,286 | 31 | 17 |
| Candidate selector, restored input arrays | 6,308 | 4 | 3 |

Assertions compare the candidate's four/three arrays exactly with the
historical arrays. Restoring `queue.json` alone is undone by the current
selector. The candidate generates a separate `FIX-RT-AREA-iwasawa-1~3`
with 34 outputs and its independent review with 19 outputs.

### Wider effects checked

Relative to the unmodified-selector replay, the candidate changes **48
existing generated records**, adds **22** and removes none. All 48 changes
are confined to `outputs`. Apart from the two explicitly restored records,
**each of the other 46 changed records retains exactly the output list
already present in the input queue**. This was asserted record by record.
The change prevents regeneration from expanding those existing assignments;
it does not install 46 newly chosen scopes.

The 22 additions are these eleven fix/review pairs. Each fix follows its
previous fix round; each review follows the new fix and records that fix
under `independentOf`. These dependency assertions pass.

| New fix round (each also has `REV-…`) | Fix outputs | Review outputs |
| --- | ---: | ---: |
| `FIX-RT-AREA-automorphic-1~7` | 88 | 51 |
| `FIX-RT-AREA-combinatorics~3` | 29 | 18 |
| `FIX-RT-AREA-etale~3` | 97 | 59 |
| `FIX-RT-AREA-geomlanglands~3` | 90 | 49 |
| `FIX-RT-AREA-iwasawa-1~3` | 34 | 19 |
| `FIX-RT-AREA-ktheory-1~3` | 87 | 49 |
| `FIX-RT-AREA-ktheory-2~3` | 133 | 79 |
| `FIX-RT-AREA-langlands-1~3` | 80 | 45 |
| `FIX-RT-AREA-langlands-2~5` | 94 | 57 |
| `FIX-RT-AREA-padic-1~5` | 114 | 67 |
| `FIX-RT-AREA-padic-2~5` | 89 | 51 |

This is scheduling evidence. It does not certify the contents of those new
assignments or authorize publishing them. Neither replay's entire queue
should replace main as part of this narrow repair.

## Required maintainer decision

[WORKERS.md](../WORKERS.md), “Doing the work”, says: “Edit only the files the
issue names, plus your own scratch space.” The queue and generator are not
named and are also outside intake's swarm output paths. This is an existing
scope restriction, not an automatic approval-review rejection.

Authorize and apply the supplied scheduling repair, review the wider effects,
and reconcile published assignments with the resulting queue before
redispatch. Alternatively issue an expanded mathematical review assignment
that identifies the additional fixes to examine. Another HE.0 acceptance
cannot finish the expanded queue record.

Only this report and its handoff change. Scratch is disposable: the complete
patch and measured limits are retained here. No process is left running.
