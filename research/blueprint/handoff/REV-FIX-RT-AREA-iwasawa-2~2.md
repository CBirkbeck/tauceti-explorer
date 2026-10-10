# REV-FIX-RT-AREA-iwasawa-2~2 — scope-blocked checkpoint

Codex, session `codex-Iu0m4D`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6098549442).
Base `0307aa1f1`; branch `codex-Iu0m4D-review-iwasawa`. One job claimed;
stop after its pull request. No second job was taken.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) gives the six
finding verdicts, selected contracts, primary-source theorem/page locators,
source/file hashes, fresh Lean results and native-reuse revision. L3's bounded
receipt is `accepted`; PMIA's is `needs_changes`. Both preceding review
objects are archived whole and unchanged. No mathematical or planning fields
and no suggested Lean files were changed.

## Actual blocker: live scope and queue outputs disagree

The live issue names only L3 and PMIA packets. The queue also requires this
job's top-level review receipts in:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`;
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.

WORKERS.md says “Edit only the files the issue names, plus your own scratch
space.” A concrete review-only patch was prepared; explicit authorization
was requested in this session and has not arrived. Both omitted packets and
the queue remain untouched. The real `issues.deliverables_complete` returns
False; substituting only the prepared receipts in memory makes it True.
PMIA's negative verdict is valid completion of a review and is a separate
mathematical concern, not the reason the completion predicate fails.

**Fix dispatch scope before assigning another worker this unchanged blocker.**
The bounded review is ready; another full source audit is unnecessary for
installing these receipts. Once scope is explicitly authorized:

1. Read each then-current packet; preserve its entire top review unchanged
   in `reviewHistory` before replacing that top review. L3-2 currently has
   the `independent-review-REV-DirichletPadicLFunctions--L3-2` accepted full
   audit with 79 checked entries. D.1 has the accepted
   `independent-review-REV-PadicHodgeRegulators--D.1~2` audit with 72 entries.
   Never replace newer packet mathematics with an old snapshot.
2. Install bounded `accepted` receipts naming
   `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, the current date and the
   continuing reviewer's session. Use finding /2 in the report for L3-2:
   all-prime Zhao range, primitive odd chi/even chi-omega branch, conductor
   correction, common log, strict normalized antidifference, coefficient
   limits and separate nonvanishing/simple-zero suppliers. Retain E37, five
   gaps and eight requests. Use finding /3 for the four D.2 consumers:
   divided/undivided complexes, directed maps, factorial twist, exact divided
   range, bounded constants and normalized rational boundary. Preserve nine
   gaps, twenty requests, seventeen source issues and eight planned stages;
   integral/open CS.0–CS.3 producers remain external.
3. Verify all non-review fields are unchanged and every original audit entry
   survives. Run the four packet checkers, intake file checks and the real
   completion predicate; require True before reporting the job complete.
   Update the report and handoff to record authorization and completion.

## Fresh checks in this run

All four packet checkers passed: zero errors, 26 inherited L3 short-API
warnings and no warnings for the others. Intake file checks pass. Parsed
before/after comparisons preserve the two earlier receipts whole and every
non-review field; the two omitted packets are unchanged. No packet contains
an `excerpt` key.

Sequential fresh `lean-check` runs elaborated PMIA, L3-2 and D.1 with only
1,075, 111 and 307 `sorry` warnings respectively. L3 failed at its unresolved
repository-local `research` import before its body; no body elaboration is
claimed. Suggested files are unchanged. No library was built, no current
read-only checkout was modified and no Lean process remains running.

Fresh finite controls: 72 buffered Gamma congruences plus the dyadic modulus-4
counterexample, 55 FG permutations with all filtration endpoints, 120 strict
counts, quartic character-weight controls, 56 rectangular adjugate preimages,
deficient-relation/nonflat mod-2 examples and three weight-two boundary scaling
examples. Public source hashes and exact versions are in the report. Scratch
is removed after submission; this handoff and the report retain what a
continuing worker needs.

## Separate PMIA revision

Current TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already supplies
generic higher Fitting ideals, finite-free kernel independence, arbitrary
commutative-algebra base change and stable transpose comparison of arbitrary
projective presentations. Exact paths and statements are in the report.
Current roadmap main checked: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.

Migrate the five generic nodes `higher-fitting-ideal`,
`relation-minors-add-generator`, `higher-fitting-independence`,
`higher-fitting-base-change`, `transpose-stable-equivalence`, together with
direct consumers, both StableReduction requests, the L4 comparison, reader
and suggested interfaces. Keep non-generating-family matrix/kernel adapters,
order calculations, finite-projective scalar/range transport and nonflat,
deficient-relation, rank and nontriviality controls. These newer modules are
absent at programme pin `f790474`; do not attribute them to that pin. The
reader is outside this review's live scope, so no partial migration was made.
