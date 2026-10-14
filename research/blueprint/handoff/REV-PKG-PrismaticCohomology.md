# REV-PKG-PrismaticCohomology handoff

Issue #9233; Codex session `codex-6c8mLq`; 2026-10-14.

The independent fixing package review is complete. Verdict **needs_changes**;
this is not a checkpoint. The reviewer did not author package #9189
(`codex-r34hIf`). The detailed report is
[REV-PKG-PrismaticCohomology.md](../reviews/REV-PKG-PrismaticCohomology.md).
The corrections are in the package README and Suggested.lean; metadata is
unchanged. Neither accepted packet nor any other roadmap was edited.

All 369 targets and 835 API entries are retained. All 127 definitions and
constructions have at least three Checks; the corresponding target blocks
contain 503 named Checks after fixes. The closing Lean inventory includes
every accepted definition/construction. The only intentionally replaced Check
name is `DerivedLogPrismatic.zeroLog_not_discrete`, now
`DerivedLogPrismatic.zeroLog_cotangent`, because the inference about the
whole complex was unjustified.

Resume the mathematics at the following two new unresolved points:

1. README §2.14: establish survival of H⁻¹ through the derived p-completed
   conjugate colimit, and separately compute or control the unreduced
   prismatic complex to prove nondiscreteness. Negative cohomology of its
   reduction alone cannot do so; the discrete A-module A/I is the control.
2. README §8.40: construct the integral model for arbitrary chart submonoids
   and coherent maps for coordinate identifications. At p=2 the chart 2ℕ
   lacks dlog X, and X₀,X₁↦X gives differential coefficients 2 and 1+q.
   K1 Constructions 7.15–7.16 and Theorem 7.17, pp.43–44, need more than the
   displayed coordinate basis and ordinary pullback. The broader assertions
   remain targets, alongside the correctly scoped coordinate model.

The report's supplier table distinguishes genuinely missing extensions from
historical requests already covered. Do not reopen E5 descendability or the
basic DD.1 Beilinson t-structure: their accepted statements supply them.
P⁰ and E_∞/lax monoidal décalage still need their own inputs. Other larger
formal, crystalline, period-theoretic, Witt–Frobenius and logarithmic ranges
remain precisely stated in the README's additional mathematical inputs.

Source follow-up: the formerly unverified five-page KY correction was read
in full. SHA-256 is
`005ee338ad8f6cb0adb297dfadcb7bca06bea7e817e5b97dc09ac0e5ea686b1f`;
the public author attachment is linked by the package's KY correction
reference. Its Theorem 7, p.4, supplies the p-Kummer Laurent essential image.
The uncleared Illusie book was not used: ALB23 Proposition 3.2.2 and
Corollary 3.2.3, p.20, are the public replacement for the global obstruction
and first-conjugate-piece criterion. The fresh seeded 15-locator sample and
additional reads are enumerated in the report. No restricted source files
or passages were copied.

Current duplicate audit: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; no exact duplicate target was
found and no target was removed. The current projective/idempotent lifting
theorems are partial inputs with endomorphism-completeness hypotheses, not
compatible-tower effectivity. The boundary now names their exact declarations.

Preserved downward ownership map for the maintainer to propagate:

- LP1 complete formal QCoh and infinite group nerve → Layer 4.0.
- QW6 general complete delta-base framings → Layer 5.0.
- RT3b/RT6 graded prismatic Beilinson square → Layer 7.0.
- VB2 filtered Frobenius bundle dictionary and degree → Layer 7.0.
- T6 fs log adic Kummer foundations → Layer 8.60.
- ArcTopologyAndDescent formal arc/arc_p foundations → Layer 2.0.

The stale upward references in proof prose were corrected; the associated
local mathematical prefixes were retained. No cross-roadmap edits were
made by this review.

Validation: corrected Lean declarations elaborate at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: exit 0, exactly 25 sorry warnings
and no other warnings. Two new Koszul sign controls are proved. The file is
401 lines and contains no sorry-bodied data. This is signature validation,
not formalization. Both accepted packet validators returned 0 errors and
0 warnings; the intake check returned 6 files, 0 problems; `git diff --check`
passed. The structural check found no missing targets, API entries, closing
definition inventory entries, broken explicit anchor links or cycles.
