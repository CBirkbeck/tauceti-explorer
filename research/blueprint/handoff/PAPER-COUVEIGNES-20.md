# PAPER-COUVEIGNES-20 handoff

Issue #1129; Codex session `codex-a71f92`; 2026-09-21. Continues the partial checkpoint merged in PR #1213. All 42 original IDs are preserved.

Status: complete extraction/routing under PROTOCOL §16, pending independent review. The 49 items comprise 10 library, 2 planned and 37 missing; four routes cover each missing item exactly once (4 GN source, 2 SF source, 5 generic interpolation, 26 EffectiveBounds Part II). No blueprint closure or Lean implementation is claimed.

Read: all published Couveignes pp. 487–497; BO arXiv:math/0701409v2 §§1–6, pp. 1–19; Fulton's publisher Chapter 13 opening on p. 210. Couveignes PDF SHA-256: `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. BO hash and precise original-book reading limits are in the result/report.

Main continuation fixes:
- Obtain and hash the published PDF; correct the false negative about `NumberField.rootDiscr`.
- Isolate built polynomial, mixed-covolume, lattice-index, Schwartz–Zippel, standard-smooth and finite-etale inputs.
- Preserve the weighted measure conversion, merely independent integers, finite-index transpose image, Hermitian Gram determinant, n-1 truncation and common minor across embeddings.
- Specify the isolated-component Bezout input despite excess intersections.
- Complete the near-owner screen, read EffectiveBounds and IntegralLattices completely, inspect ST decomposition and current RS-07 boundary, and correct the exact Part II title/galaxy IDs.
- Expose BO's low-degree/rank-certificate dependencies even for the d>=5 export.

Validation: `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COUVEIGNES-20.result.json` passes. Scratch `check_cou20.py` passes preserved-ID, unique-route, parent/title/area, stage, 23 positive library-reference, arithmetic and Markdown checks. Ten Lean source files match the pinned upstream bytes. No Lean file required, written or compiled.

Downstream: independent review is required before any route is applied. The interpolation design must supply exact base-case rank certificates and the degeneration/semicontinuity dependencies. GN.0 and SF.5 must read/decompose the original Martinet/Fulton proofs or establish explicit alternatives; only the reading actually done is claimed. Siegel's second theorem already has GN.1 ownership. The report gives APIs and regression examples, not executed formal tests.

Only this handoff and the two paper files are submitted. PDFs, scratch checker and durable notes are not deliverables. No atlas promotion, issue closure, merge or unclaim is performed by the worker.
