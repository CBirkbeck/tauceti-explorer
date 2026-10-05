# REV-HabiroCyclotomicCompletions--HC.4 — completed review

Issue #6413. Codex session `codex-8xzsT5`, 2026-10-05. This independent session
reviewed the work authored by session `codex-CrXH74` on #6470. Verdict:
accepted after correction. This is a completed review, not a checkpoint.

The packet has 59 nodes (36 corrected, 23 added), 42 API items, 25 tests,
six planets, 41 confirmed pinned Mathlib references and five independently
confirmed source issues E19–E23. All implementation statuses remain unchecked.
There are no gaps, requests or remaining refinements in this part's chosen
scope. The complete packet imports fifteen parent classical HC.4 targets.

The review separates bundled declarations, supplies finite coordinate bases,
filteredness, rational finite maps, coherent preimages and reconstruction,
both adjugate identities, integer localization arithmetic and separate source
examples. It records the exact block-triangular order convention and clarifies
that universal cyclotomic coefficient quotients are a formalisation convention
required for the source's full coordinate ranks. The review report records the
corrections and added baseline declarations in detail.

Checks passed: blueprint checker with zero errors/warnings; errata checker;
intake file checker; diff whitespace check; all node/API/test names in the
suggested file; an acyclic 90-node reachable supplier graph. `lean-check`
elaborated the suggested file against Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, exit 0 with 118 warnings, all
`sorry`. The only later Lean-file change was an identification comment.
No library build or Lean language server was started.

Independent integer/rational computations verified the finite determinants
for N=1,…,8, the simultaneous remainder determinants, M_3's signed adjugate,
the Kontsevich and perturbed vectors, both projector digit lists, and
two-factor Sylvester/remainder examples with repeated, shared and unit factors.
The review report gives the ordering and coefficient algorithm needed to
reproduce the checks. Public source URLs, access date and matching PDF hashes
are retained in the packet; no scratch artifact is needed to resume.

Nothing remains for this review. Assembly should use the report to update the
reader's old catalogue/counts (the reader was not an authorized review path),
wire the finite-domain transfer into the inherited rootwise proof, and apply
the recorded scope/display proposals. The parent's broader individual-root
Theorem 6.2 proof boundary remains outside the chosen target; it has not been
silently solved. HC.4a should contain 17 classical/transfer declarations and
five parent planets; HC.4b contains 57 declarations and six new planets.
No parent packet, atlas data or content file was edited or promoted.
