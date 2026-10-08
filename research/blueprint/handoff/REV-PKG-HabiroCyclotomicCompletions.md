# Completed independent review: REV-PKG-HabiroCyclotomicCompletions

Issue #7519; Codex session `codex-EHpCuh`; 2026-10-08.
Verdict: **needs_changes**. This review job is complete; this submission is not
an unfinished checkpoint. The package revision is a separate job.

The detailed findings, target inventory, source receipts, independent finite
checks, and baseline limitations are in
`research/blueprint/reviews/REV-PKG-HabiroCyclotomicCompletions.md`.
The machine-readable verdict is in the package's `review.json`.

Clear fixes were applied to the positive-order radical/adjacency equivalence,
the integral Taylor non-surjectivity target, complete-coefficient monic
transition bijectivity, evaluation/Taylor naturality and power-map equations,
and the completed-module topology, scalar action and functor API. The restricted
alternating-unit theorem was restored in both package files. No accepted packet,
atlas data, upstream roadmap, or link map was edited.

Resume the package revision at these five findings in the report:

1. Build the general mutually cofinal completion equivalences and finite-subset
   and `(q^m-1)`-adic reconstruction signatures. Equality detection is insufficient.
2. State individual-root uniqueness for the accepted general coefficient
   subring, with explicit irreducibility and infinite-adjacency hypotheses.
3. State general `Z[1/Δ]` component decomposition, restriction criterion,
   all-value detection, domain factors, and rootwise Taylor detection. Include
   the Galois descent needed when root orders contain inverted odd primes.
4. State actual idempotent-localization equivalences and Habiro Proposition
   7.2 in a specified fraction-field ambient ring. Retain the useful
   Proposition 7.3 divisibility API.
5. Reconcile the general elementary q-toolkit's HC.1/QM.0 ownership. The parent
   accepted packet already records the conflict, whereas the current package
   assigns QM.0 unconditionally. This needs an authoritative supplier decision,
   not an invented completion dependency.

The README's 107 distinct nodes were checked against the three specified
accepted inputs, including the HC.6 finite specifications. The determinant,
adjugate, projector, root-value, Taylor, digit, inverse, and finite CRT examples
were recomputed with exact rational polynomial arithmetic. The source receipts
in the report survive scratch deletion. Apostol's publisher PDF returned 403;
the report does not claim that this source was freshly read. Other public
sources were read only in scratch and were never committed.

Final `lean-check` on the package Suggested.lean exited 0: zero errors,
411 warnings, all sorry warnings. The shared environment is at exact Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti declarations were read at
`f790474821cf4256814db967cb154e7af3d0c369`; the file's imports are Mathlib-only
and no Tau Ceti compilation was performed. The three `check_blueprint.py`
input checks each reported zero errors and warnings. `git diff --check`,
JSON/TOML validation, size and private-path checks passed.

No second job was claimed. No Lean process is left running.
