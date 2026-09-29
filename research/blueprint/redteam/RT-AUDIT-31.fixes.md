# RT-AUDIT-31: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #4025).
- Findings: `RT-AUDIT-31.result.json`.
- Verdicts: `RT-AUDIT-31.review.json`.
- One finding, confirmed.

The only edited file is `research/blueprint/audit/AUDIT-31.result.json`.

## /1 (medium, error): the EllipticCurves Layer 4 duplicate note no longer assigns the conductor comparison upstream

**Checked.** `content/tau-ceti/EllipticCurves/README.md`, Layer 4, the Tate's-algorithm item (lines 813–835):
- The upstream roadmap builds the *algorithmic (Ogg) exponent* v(Δ) − m + 1, "called that, not 'the conductor', until identified with the ramification-theoretic conductor".
- It calls "the ramification-theoretic conductor and its identification with this algorithmic f_p" (with the wild cases at residue characteristics 2 and 3) "a separate, related project".

**Change.** In `ArithmeticGaloisRepresentations:R01.3`, the note of `duplicates[2]` (upstream EllipticCurves Layer 4) is narrowed to what the layer actually supplies:
- equation-level reduction;
- Tate's algorithm over a Henselian DVR with perfect residue field;
- the algorithmic exponent v(Δ) − m + 1;
- Néron–Ogg–Shafarevich.

The note now says that the upstream layer explicitly excludes identifying the exponent with the ramification-theoretic conductor. R01.3 keeps the elliptic conductor comparison, including the wild contributions at 2 and 3. This follows the finding's suggested wording.

The comparison target stays `absent` and the layer stays `not built`, as the finding notes they already correctly were.
