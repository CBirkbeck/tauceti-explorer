# Heights package revision 2: completion reconciliation

Codex, session `codex-GxaFP4`, 2026-10-18. Refs #9836.

## What this dispatch delivers

The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9836#issuecomment-6245730077).
The requested package revision has already been completed through its explicit
continuation, #9943, and independently accepted. This dispatch adds the missing
handoff at the path assigned to #9836 and freshly validates the accepted files.
It changes no mathematical deliverable and gives no new independent verdict.

The completion trail is:

1. [PR #9864](https://github.com/CBirkbeck/tauceti-explorer/pull/9864)
   submitted the incomplete revision as a draft. It remains open and unmerged
   when checked in this dispatch.
2. [Issue #9943](https://github.com/CBirkbeck/tauceti-explorer/issues/9943)
   explicitly continued that draft and required resolution of the same 17
   findings. Its completed package entered main through
   [PR #10000](https://github.com/CBirkbeck/tauceti-explorer/pull/10000),
   commit `7f5f0bad5`. That issue is closed with `state:done`.
3. The independent round-2 review accepted the package with fixes in
   [PR #10024](https://github.com/CBirkbeck/tauceti-explorer/pull/10024),
   commit `94f0ac291`. Both the durable review report and the package's
   existing `review.json` record that acceptance.
4. The later inactivity message on #9836 made the earlier issue available
   again. It did not remove or supersede the completed continuation.

README.md, Suggested.lean, metadata.toml and review.json in this checkout are
each byte-for-byte identical to their versions at `94f0ac291`. Preserve those
accepted versions rather than restoring the earlier draft.

## Where the completed work is recorded

- [The continuation handoff](PKG-HeightsRationalPointsAndObstructions~codex.md)
  records the disposition of every original finding, target preservation,
  supplier and tier changes, scope exclusions, source-version notes and the
  author's adversarial pass.
- [The accepted round-2 report](../reviews/REV-PKG-HeightsRationalPointsAndObstructions~2.md)
  records the independent source, supplier, preservation and adversarial checks,
  together with the reviewer's corrections. It supersedes the original
  `needs_changes` verdict for this package.
- [The package](../packages/HeightsRationalPointsAndObstructions/README.md)
  contains all seven layers, numbered 0 through 6. Fresh mechanical inventory:
  217 uniquely numbered subsections, comprising 140 unlettered and 77 lettered
  subsections, and 206 Checks blocks. These are inventory counts, not a new
  certification that every definition has sufficient tests.

The accepted scope retains the explicit exclusions for general connected-group
restricted-ramification finiteness over global function fields and for nonsmooth
function-field curves of geometric genus zero or one over arbitrary infinite
constants. It distinguishes existence from effective computation. No new scope
or ownership move is made here.

## Fresh validation

- `lean-check research/blueprint/packages/HeightsRationalPointsAndObstructions/Suggested.lean`:
  **exit 0, no errors, 36 warnings, all `declaration uses sorry`**. The file has
  297 lines and uses the shared Mathlib `082e2d3` / Tau Ceti `f790474` build.
  Available memory was checked before compilation. No language server, build,
  update or cache command was started, and no compilation remains running.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/HeightsRationalPointsAndObstructions/Suggested.lean`:
  exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HeightsRationalPointsAndObstructions.json`:
  **0 errors and 0 warnings**. The unchanged input packet still records 147
  nodes, 17 gaps, 39 requests and seven planned stages, none closed. Those
  historical packet records are not silently rewritten by a package job and
  are not claimed to be closed by this dispatch.
- `python3 research/blueprint/intake.py check-files` on README.md,
  Suggested.lean, metadata.toml and this handoff: **4 files, 0 problems**.
- `git diff --check`: passed.

Reproducible accepted-file SHA-256 values:

| File | SHA-256 |
| --- | --- |
| README.md | `db5d0931b298a04cb12c6f74e593f12b5bb2a359c80b72d0ef7338a2225cf826` |
| Suggested.lean | `9ef10e0d51a9cf54cd6e1d3e32ab47c38c3ce1d8d3bf341edaba33ece8d09c6c` |
| metadata.toml | `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7` |
| review.json | `66e810cd744cb8d28cecad00c95ebd514b717ecd22c42501b64cef337ff1a3fa` |

No mathematical source was fetched or copied for this reconciliation. The
source-verification, duplication-audit and mathematical-acceptance evidence is
the prior work linked above; it is not presented as newly performed here.

## What remains

No additional package revision is identified by the accepted round-2 report.
Its four maintainer coordination points remain recorded there; they concern
other upstream roadmaps, the issue template and optional style cleanup, rather
than a rejected target in this package.

The maintainer should reconcile the stale #9836/draft #9864 bookkeeping with
the completed #9943 and accepted #10024. This worker does not merge or close
pull requests, change labels, edit the queue or replace an independent review.
Any later mathematical change needs its own authorized task against the
accepted package. This session takes no second issue.
