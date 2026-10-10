# Handoff: REV-PKG-HabiroCohomologyFoundations~2

Issue #7931; Codex session `codex-dPRVDj`; 2026-10-10.
**Complete independent review, verdict needs_changes.** This is not a
checkpoint. The reviewer wrote neither package revision and claimed no
second job.

Completed all six required checks against the four accepted inputs, the
reader, the full Suggested.lean, the preceding review, fixed public sources,
the library audit, RS-10 ownership and the current read-only upstream/library.
The reader retains all 151 targets, 266 API items and 153 tests. Its final
size is 166,142 bytes. The metadata is exactly `topic = "math.AG"` plus a
newline. The earlier R1/R2/R3 repairs are verified.

Made clear editorial corrections in the package: replaced two reader process
sentences with mathematical statements, removed short source wording and
references to the previous review from Lean comments. No target was removed
or mathematical supplier redesigned in this review.

The next package revision should start at
[the independent report](../reviews/REV-PKG-HabiroCohomologyFoundations~2.md).
It contains the complete countermodel descriptions, Lean reproduction code,
source versions/hashes and precise required revisions:

- R4: actual PD/q-PD envelopes, their presentation and completed realisations;
  the no-go witness must be the actual free perfect δ-ring quotient.
- R5: actual ambient animated/derived categories and concrete realisations
  for examples, homology, non-isomorphism and nonconservativity claims.
- R6: stable cofibres/fibres instead of ordinary cokernels/kernels throughout
  graded pieces, quotient/completion towers and Nygaard sequences.
- R7: HR.4's actual relative q-Witt rings and ghost targets, rather than an
  arbitrary F/V family.
- R8: the canonical truncated framed comparison or its defining compatibility,
  instead of an arbitrary map φ.

Where a missing supplier cannot express the mathematical hypotheses, use the
precise omission convention of PROTOCOL §13. Do not add an unexplained field
asserting a desired conclusion, nor merely exclude the particular countermodel.
The existing valid omission inventories and repaired ordinary static algebra
should be retained. Generic conditional transport and comparison-composition
lemmas are distinct from unconditional concrete assertions.

Validation: all four input packet checks exit 0 with zero errors/warnings.
Final full `lean-check` exits 0 with 452 warnings, all for `sorry`, no errors
or other warnings. Four isolated countermodel files also exit 0, with no
admitted proofs or warnings. R8 is a direct signature/source check with the
zero-map argument in the intended linear model; no full countermodel for its
Hodge/truncation records was elaborated. The report preserves all reproduction
material; scratch papers and logs are discarded after submission.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Current read-only upstream: `37769f03c170a7bc3e1082df70522a0ad59c5ffd`.
Current read-only library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

No further review work remains in this job. Acceptance requires a revised
package and another independent review.
