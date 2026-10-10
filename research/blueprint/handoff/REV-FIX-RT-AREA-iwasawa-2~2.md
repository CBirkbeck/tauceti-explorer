# REV-FIX-RT-AREA-iwasawa-2~2 — blocked scope checkpoint

Codex (GPT-6), session `codex-ZQ4VPz`, 10 October 2026.
[Issue #6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6096082390).
Input atlas: `98eb18006fbe9d261c26b38192af6b7cd4ff3d7d`.
This session performed none of the fixes under review and claimed no second job.

## Done

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records
fresh bounded source inspection, finite endpoint/permutation diagnostics,
current-native library checks and the preceding reports with their original
authorship. Preserve those ledgers and receipts. L3's eight selected
Gamma/Gross–Koblitz contracts remain accepted. PMIA remains `needs_changes`
for coordinated current-native Fitting reuse; that negative verdict counts
as a completed review, not the dispatch blocker.

All four original packet checkers pass with zero errors. L3 retains 26
inherited short-API warnings; the other three have none. Prepared L3-2 and
D.1 drafts both pass with zero errors/warnings. The actual queue completion
predicate remains **False**; a scratch-only path/receipt simulation becomes
**True** after the two omitted edits below. No packet, suggested Lean file,
queue or dispatch metadata was edited in this session.

No new Lean compilation was run because all four suggested files are
unchanged and their hashes match the preceding codex-O0mt5G receipts:

| Suggested file | SHA-256 | Inherited original-file result |
|---|---|---|
| L3 | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` | fails before body: unavailable repository-local research imports |
| PMIA | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` | exit 0, 1,075 sorry warnings only |
| L3-2 | `d076a92eb2d65a233b4fb86001f6ddc0ebd9c2b5c429c9c33ef1801252e244d3` | 110 sorry warnings only |
| D.1 | `6398a506a4195e0f606576e60253f412d5be2cb30b6c39f455439777f9acfee8` | exit 0, 307 sorry warnings only |

The report keeps conditional L3 assembly diagnostics distinct from success
of the original file. No compiler remains running.

## Blocker: correct scope before redispatch

The unchanged queue requires nine outputs and review receipts in four
packets. The live issue names five outputs and only L3 and PMIA packets.
A final live fetch confirms this omission. [WORKERS.md](../WORKERS.md),
“Doing the work”, says: “Edit only the files the issue names, plus your own
scratch space.” Explicit authorization for the following two queue-required
packet edits was requested; no reply arrived before checkpoint submission.
Repeated source audits or refreshing the existing two receipts cannot
repair this dispatch mismatch.

Correct the live issue or explicitly authorize these two packet paths,
relative to `research/blueprint/`, then finish this same review:

1. `packets/DirichletPadicLFunctions--L3-2.json`: in node
   `DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference`, change only
   the source locator's E34 reference to `DirichletPadicLFunctions/E37`.
   Keep the existing strict endpoint, Gamma argument, proof and sourceIssue
   verdict. Add an accepted review by
   `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, bounded to the 29
   root/derivative contracts enumerated in the retained report. Preserve
   all five gaps and eight requests, including arithmetic nonvanishing
   inputs. Archive any preceding whole review if present when resuming.
2. `packets/PadicHodgeRegulators--D.1.json`: append its entire current
   review by `independent-review-REV-PadicHodgeRegulators--D.1~2` unchanged
   to `reviewHistory`, including every one of its 72 checked entries.
   Add an accepted review by this fix-review id, bounded to D.2
   `log-syntomic-complex`, `fontaine-messing-kato-period-map`,
   `small-twist-comparison` and `syntomic-exponential`. Preserve all 17
   sourceIssues/verdicts, nine gaps, twenty requests and eight planned
   stages. CS.0–CS.3 remain external producers in early
   CohomologyComparisons Part II after CR.5/CR.6.
3. Validate all four packets and intake paths, then verify that the
   unchanged `issues.deliverables_complete` predicate returns True.
   Neither edit requires a suggested Lean signature change. Never alter
   queue metadata to force completion.

The scratch drafts are not installed and will be deleted after the PR
opens. The exact changes above and the report are sufficient to recreate
them; no downloaded source or scratch dependency is needed by a successor.

## Mathematical follow-up boundaries

Keep PMIA's generic L6 nodes `higher-fitting-ideal`,
`relation-minors-add-generator`, `higher-fitting-independence`, and
`higher-fitting-base-change`, their direct consumers, both StableReduction
requests, L4 comparison, reader and suggested signatures together in a
properly scoped migration to current-native Fitting ideals. Retain concrete
matrix/kernel adapters, order-specific results, scalar/rank/range hypotheses,
nonflat-base-change and deficient-relation tests, and arbitrary finite-
projective stable-comparison/base-change obligations. The reader is outside
this review's scope, so do not partially migrate the packet here.

The transpose non-example requires a nontrivial ring and scalar-ring
isomorphism; the existing Lean example already assumes `[Nontrivial R]`.
Preserve the LAD cohomological-support owner gap and RS-16's independent
Hecke and Euler-system routes. No new owner move or blanket proof closure
is warranted. Current library and roadmap read-only heads remain
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and
`201bcaee1f4014c91897d50cdb7631fc6d6a6d71`, respectively.
