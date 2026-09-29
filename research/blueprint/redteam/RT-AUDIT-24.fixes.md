# RT-AUDIT-24: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #4017).
- Findings: `RT-AUDIT-24.result.json`.
- Verdicts: `RT-AUDIT-24.review.json`.
- Two findings, both confirmed.

The only edited file is `research/blueprint/audit/AUDIT-24.result.json`. The coverage mirror `data/library-coverage.json` is regenerated from the accepted audit by the orchestrator, as PROTOCOL.md §17 provides. `scripts/merge_library_audit.py` was run locally to confirm that the corrected audit regenerates cleanly and that both changes reach the mirror; the regenerated file was then discarded.

## /1 (high, error): the relative norm of ζ_{p^{n+1}} − 1 now carries p odd

**Where.** `ColemanPowerSeries:L0`, `targets[4]`.

**Checked.** The identity N_{K_{n+1}/K_n}(ζ_{p^{n+1}} − 1) = ζ_{p^n} − 1 comes from Rodrigues Jacinto–Williams §9 and the proof of Lemma 10.3, where p is odd throughout.
- **p = 2 fails.** For n = 1, N_{ℚ₂(i)/ℚ₂}(i − 1) = 2, while ζ₂ − 1 = −2.
- **The general identity.** The constant term of (X + 1)^p − ζ_{p^n} gives N(ζ_{p^{n+1}} − 1) = (−1)^{p+1}(ζ_{p^n} − 1) for every prime p and every n ≥ 1.
- **n = 0 fails too.** Then K₁/K₀ has degree p − 1 and ζ_{p^0} − 1 = 0. So n ≥ 1 is retained.

**Change.**
- The target now reads "… = ζ_{p^n} − 1 for p odd and n ≥ 1 (RJW's standing odd-prime branch), and continuity of the norm on units".
- Its note gives:
  - the p = 2 counterexample;
  - the prime-uniform alternatives: the signed formula, or N(1 − ζ_{p^{n+1}}) = 1 − ζ_{p^n};
  - the extra hypothesis of the cited `IsPrimitiveRoot.sub_one_norm_isPrimePow`, a root order different from 2.

**Kept.**
- The `partial` classification and the cited declaration.
- The continuity obligation.
- The dyadic branches elsewhere in the audit, which the finding says not to narrow.

## /2 (medium, error): R02.5 is described as importing the Selmer carrier, not owning it

**Where.** `EulerSystemsAndKolyvaginSystems:ES.0`, the `duplicates` entry for `ArithmeticGaloisDuality:R02.5`.

**Checked.** R02.5's stage text says it "import[s] the Selmer local-condition/mapping-fibre construction from SelmerIwasawaCohomology L2". Its `requires` list includes `SelmerIwasawaCohomology:L2`. What R02.5 contributes is:
- the identification of that H¹ with the global restriction kernel used in deformation theory;
- the dimension formula used in auxiliary-prime arguments.

**Change.** The note now says that R02.5:
- imports the Selmer carrier (local conditions and the mapping fibre) from SelmerIwasawaCohomology:L2;
- supplies the deformation-facing identification and the auxiliary-prime dimension formula.

It keeps the genuine overlap of that formula with ES.0's core-rank Euler-characteristic formula.

**Kept.**
- The separate `SelmerIwasawaCohomology:L2` duplicate entry.
- All library classifications and stage edges.
- No second owner is introduced.
