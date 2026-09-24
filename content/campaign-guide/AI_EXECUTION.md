# AI execution protocol

This campaign specifies mathematics to add to Tau Ceti. It is not a proof library. Start with `WORK_QUEUE.json`, the target README and its `EXECUTION.md`, then the actual source proof. The task states prevent an attractive outline or compiling interface from being mistaken for finished mathematics.

## Dispatch

1. Pin the current TauCeti and Mathlib commits and Lean toolchain. Read the target repository's instructions. Confirm the roadmap target has been adopted there before starting new declarations; this local document does not publish a roadmap change.
2. Choose a stage whose prerequisite **specifications** are understood. A preparation worker may inspect sources while prerequisites are unproved. A proof worker needs the actual prerequisite declarations and their checked proofs.
3. Read the complete mathematical source proof, including cited lemmas and errata. Record title, version, theorem/page, hypotheses, conclusion and the proof portion actually read. A source catalogue or abstract is insufficient. Missing source access is a named acquisition task, never an assumption.
   Cite a source a reader can get: arXiv, an open archive, an author's page, the Stacks Project. A work behind a paywall may be cited only when it is listed in `research/blueprint/sources/ACCESS.json` with what a reader without a subscription should do instead, and `python3 scripts/sources.py --check` fails on a publisher link that is not. Prefer the free source when one covers the same material: a stage whose only source nobody can open cannot be reviewed, and stalls.
4. Search existing code by concept, name and type. Record matching declarations, their types, imports and commits. Reuse their carriers and APIs. A roadmap in an upstream snapshot is planned work, not a proved dependency.
5. Decompose the source's actual proof into construction/lemma tasks. Every leaf needs a precise statement, a source locator or a fully written elementary argument, and dependencies. Existence, uniqueness, naturality, descent, representability, finiteness, base change and normalization conversions are tasks when not already proved. Do not invent a shorter proof route without justifying it.
6. Instantiate every input against the producer's output. Check bases, primes, characteristic, coefficients, topology, completion, variance, twists, Frobenius, level, weight, local conditions and functoriality. Record the conversion lemma where statements differ. Both owners sign the contract after reading the statements.
7. Only then create proof-ready leaf tickets with actual Lean signatures. Use the repository's current tooling to elaborate them in scratch; do not commit placeholders or new axioms. Keep mathematical assumptions explicit. A structure field containing the main theorem is not its construction.
8. Prove and check each leaf. Cleanup after three proof tasks per file, after the last task in a file, and before an endpoint. Run the relevant module checks, lint, and `#print axioms` on exported theorems. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted by Tau Ceti policy. Validate that the final consumer really instantiates the theorem.
9. Update the stage, source, contract and coverage registers together. If a new dependency is found, add its owner and precise stage, invalidate affected readiness, and rerun the dependency checker. An acyclic graph alone does not certify complete dependency capture.

## Separate states

| Dimension | Allowed progress |
| --- | --- |
| Mathematical knowledge | established scoped theorem; theorem conditional on named hypotheses; conjectural/research target |
| Source work | selected; acquired; statement checked; complete proof read; source-to-Lean decomposition checked |
| Specification | outlined; contracts written; producer/consumer statements matched; leaf signatures elaborated |
| Implementation | unstarted; in progress; proved locally; target-pin build passed; consumer regression passed |

Generated stage tasks start at `needs_source_decomposition`. This is an executable preparation assignment, not an assertion that thousands of proof leaves are ready. Existing representative seeds retain inherited placeholders. New extension seeds are documentation only and confer no implementation status.

## Worker result

Return a record with: stage ID; input/output signatures; local file/line and commit; source title/version/theorem/page; full proof-read coverage; construction and lemma subtasks; reused declarations; new prerequisites; normalization conversions; example and counterexample tests; build command and exit; axiom report; unresolved issues. Include a concise prose explanation of the mathematical route.

A stage becomes `implemented` only when every promised construction, theorem, comparison and API law in its scope is proved. Its examples must instantiate the general objects; independent toy interfaces do not discharge the task. A conjectural endpoint may have a completed statement and conditional implications while remaining unproved.

## Parallel work and ownership

Claim one exact stage or disjoint group of files. Agree carriers and conventions before parallel proof work. Shared foundations have one mathematical owner; consumers propose an extension or conversion lemma rather than creating competing definitions. Stage edges govern ordering; broad area dependencies may have cycles because early and late stages interleave. Integration workers recheck boundary statements, not just imports.

## Source gaps and frontier work

A missing proof source is not evidence that a theorem is conjectural. Conversely, an available paper title does not show it proves the generality needed. Record unavailable editions, incompletely checked passages and conditional source branches in the queue. Frontier statements such as general BSD, RH/GRH, arbitrary Langlands functoriality, general Tate/Hodge and period conjectures remain explicitly labelled. Proven special cases are separate targets.
