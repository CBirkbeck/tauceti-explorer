# REV-AdelicAlgebraicGroups handoff

Codex, session `codex-vV40Ys`, 2026-10-06. Issue #341.

The independent review is **finished**, with `needs_changes`; this is not a checkpoint and there is no unfinished review work to resume. All 201 input nodes and 88 input baseline statements were read and audited. The final packet has 204 nodes, 93 baseline declarations, 220 API entries, 144 tests, 25 planets, 20 gaps, 21 requests and 10 confirmed source issues. Its per-node review has 65 verified, 10 corrected, 3 added and 126 unverifiable items. All six stages are partial with precise remaining lists. No formalization is claimed.

Durable evidence and revision worklist:

- `research/blueprint/reviews/REV-AdelicAlgebraicGroups.md`: complete review, concrete counterexamples, source/version/baseline ledgers, every changed-node field, supplier/red-team checks and orchestrator questions.
- `research/blueprint/packets/AdelicAlgebraicGroups.json`: `review.checked` covers every node, gaps identify exact consumers, sourceIssues include independent verdicts, public source URLs/hashes/read scopes are recorded.
- `research/blueprint/suggested/AdelicAlgebraicGroups.lean`: clear signature repairs and review limitation in the header. `lean-check` passes with sorry warnings only against pinned Mathlib; the shared build lacks the pinned Tau Ceti algebraic-group modules, so stand-in comparisons were not compiled against Tau Ceti.

The next task is a **revision**, not a continuation of this review: eliminate reduction cycles using independent Borel §§3–4 lattice/closed-orbit lemmas; specify proper algebraic heights and polynomial counting; build right-Haar nonnormal quotient integration; justify convergent infinite Tamagawa rescaling and number-field/basis-sensitive normalization; supply central-character Hilbert/Fourier inputs; supply arithmetic native-field/multiple-place strong approximation and integral adelic lifting; and replace arbitrary prototype records/maps/levels with faithful imported structures. Preserve the exact isotropic Kneser–Tits scope, fixed-K corrections, raw/folded GL₂ conventions, and full/effective mass distinctions. A normal level gives a canonical principal action; full deck-group equality also needs connectedness.

The accepted RS-04 restructuring assigns generic adelic heights and reduction to AA.3. Do not introduce an AF.0 overlap finding or duplicate that ownership. The revision must also synchronize `research/blueprint/readmes/AdelicAlgebraicGroups.md`, which was read but was outside this review issue's deliverable paths.

`python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json` reports 0 errors and 0 warnings. The final suggested file elaborates via `lean-check`, exit 0, with only sorry warnings. No background Lean process, extra clone or Lake project is left. Scratch source PDFs/logs are disposable; all evidence needed by a next worker is described in the report/packet and recoverable from their public URLs/hashes.
