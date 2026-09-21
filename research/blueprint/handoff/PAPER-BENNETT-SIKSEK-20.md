# Handoff: PAPER-BENNETT-SIKSEK-20

Partial checkpoint for issue #1119 by ChatGPT, session `chatgpt-0921-b74e`, 2026-09-21. Resume from the published paper, not the 2017 arXiv version. Do not mark this job complete or consume its provisional `missing` statuses as absence evidence.

## Saved work

`research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json` has 49 uniquely identified items. Preserve those IDs where retaining statements. It records the main exponent target, both Frey families, the actual-curve replacement, trace equality, both Legendre cases, conductor-controlled characters, and the main analytic/combinatorial interfaces. Item 03 alone is a pinned library citation. `routes: []` and `prerequisites: []` are unfinished, not affirmative empty audits.

`research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.md` contains the dependency narrative, routing boundaries, exact source references, an explicit factorial-deletion proof, and diagnostics D1–D6. It separates literal source statements, corrected identities, and proposed local proof repairs. Section 12 was viewed, but only its exceptional-modulus definition has a JSON entry.

## Source provenance to finish

Published PDF: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf

DOI: `10.4007/annals.2020.191.2.2`; Annals 191 (2020), 355–392, 38 pages, Section 12 included. Obtain the raw PDF, archive its URL/date/SHA-256, and compare any replacement author version with this publication. Current `source.sha256` is null. No raw PDF bytes were saved: local DNS failed. A hash of the text or a rendered page would not discharge this task.

## Library/atlas audit to finish before routing

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

Read the relevant entries in the reviewed `data/library-coverage.json`. Its blob was reported as `5e708cfc74a51b10e62149113872fe4e00eb5846`; the reader returned no usable text, raw fetching failed, and blob retrieval timed out. This is distinct from the solved `data/atlas.json` size problem: the atlas's small extracts do work. Do not repeat a global missing-ness inference from an unsuccessful keyword search or an empty root import file.

Item 03's actual pinned source was read: `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`, blob `5ef9316e466dfc60347c91f8110fe2a8eef28e5b`. Other mathematical declarations in Mathlib and Tau Ceti still need searches and statement reads, particularly quadratic characters/conductors, elementary valuations and finite sums, finite-field elliptic curves, character sums and Roth.

Search full atlas descriptions, proposed roadmaps, accepted packet IDs, reserved IDs, reviewed links and source extracts. `SerreWeightAndLevelOptimisation:R20.2` was read and is a relevant existing owner for general level lowering, not authorization to duplicate it. Verify the separate modularity and Galois-representation suppliers. The effective-Diophantine roadmap does not become the owner merely through the words “Diophantine equation”: distinguish ineffective finiteness from a certified enumeration algorithm.

## Mathematical continuation

1. Finish the whole-paper inventory, including inputs not yet separated from proof prose. Add the fixed-`k` finiteness corollary with exact exponent/sign scope and its geometric input. Split remaining combined statements without losing shared witnesses. In particular Proposition 9.1's four conclusions must be about the **same** progression.
2. Check Kraus's original theorem, Martin's dimension bound, Bennett–Skinner's local model hypotheses, the exact Lemos rational-isogeny theorem and CM exceptions, the quartic descent at the end of Section 6, the explicit prime-in-progression estimates, and all coefficient-prime restrictions in level lowering. Bibliographic leads are in the report; they have not been independently checked.
3. Add the precise Graham–Ringrose/Burgess input forms, the complete Proposition 8.1 extraction, all supporting prime-number/exceptional-zero statements with uniformity ranges, and the final maximal-family assembly in Section 10. The Section 9 Roth statement is additive-combinatorial, not Diophantine-approximation Roth. Verify Rahman's explicit threshold rather than treating it as an audited library theorem.
4. Complete Section 12: all conclusions of Propositions 12.1–12.3, the bounded-height zero-free input, zero-density bound, explicit formula, and final simultaneous avoidance/size selection. This is Granville's zero-density addendum, not another Burgess/Hildebrand proof.
5. Recheck diagnostics D1–D6. The first discriminant is `16*(abc)^2` in the pinned convention; inspect the 2-adic model bounds separately. The divisor-bound counterexample uses a nonsquarefree integer and only refutes the literal all-integer assertion. Distinguish ambient modulus from primitive conductor in products. Retain the progression-count `+1` and audit the proposed summation repair. Use odd-conductor divisibility rather than unsupported equality.
6. Additional addendum audit points: explicitly exclude the principal character in the cancellation statement; retain the zero-height restriction; reconcile the displayed zero-sum truncation heights; verify numerical zero-free/certification ranges from Platt and Bennett–Martin–O'Bryant–Rechnitzer. Supply a quantitative argument that the selected progression simultaneously avoids the exceptional indices and has `N_a<=k^4`; neither condition separately suffices.

Then replace every provisional classification by a verified `library`, `planned`, or `missing` verdict, citing an actual declaration or stage. Route every genuinely missing item exactly once. General infrastructure must be imported from its owner; Tau Ceti roadmaps cannot be re-planned by a `source` route. A new/Part-II application route requires the full design brief and overlap audit. List prerequisite papers not covered only after checking coverage.

## Checks and acceptance

The exact `check_paper.py` Git blob `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f` was obtained by transcription and byte-identity verification. Its `check()` function accepted the partial JSON with empty catalogues, because this checkpoint has no planned-stage references or routes. JSON/ID and symbolic arithmetic regression checks passed. No full atlas CLI or Lean compilation was performed locally.

Run the full command in a real checkout:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json
```

A passing schema check is not completion. Set `status: complete` only after the inventory, original-input verification, pinned-library/atlas audit, and every route are finished. Submit through the normal issue/PR intake with `Refs #1119`; do not close, merge or change issue state manually.
