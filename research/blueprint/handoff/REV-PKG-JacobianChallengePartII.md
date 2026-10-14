# REV-PKG-JacobianChallengePartII — handoff

Refs [#7607](https://github.com/CBirkbeck/tauceti-explorer/issues/7607).
Codex, session `codex-TZm7pn`, 14 October 2026.
Branch `codex-TZm7pn-jacobian-package-review`.

**Complete: accepted with fixes.** This independent review did none of the
original package job. The full review report is
`research/blueprint/reviews/REV-PKG-JacobianChallengePartII.md`; the verdict is
recorded in the package's `review.json`. No packet was edited.

The main corrections are the relative canonical polarization via the
smooth-family specialization of Esteves–Gagné–Kleiman autoduality (including
origin independence over nonreduced bases and the sign λ=−u⁻¹), the proof that
both fibre conditions survive the two actual Picard lifts (yielding a d²
cokernel bound), and the relative O-linear Lie/cohomology comparison via
Kleiman's relative statement and dual-number units. All unread book locators
were replaced by checked public sources. No book marked uncleared in the
library index was obtained or read, and no source passages were committed.

The 48-target package retains every packet API/test name. The current-library
Euler degree and field Albanese predicate and the current ModularCurves
elliptic interface are now recorded as boundary deferrals. No additional target
removals or ownership transfers were needed. The previous package author's
cycle removal is preserved: StableReductionPartII builds curve moduli
*downstream* of the generic level-family interface here.

The upstream prerequisites are SchemeAndStackFoundations #779 (merged),
AbelianSchemesAndArithmeticModuli #849, AlgebraicModuliForArithmeticGeometry
#853 and NeronModelsAndSemistableAbelianVarieties #852. The latter three were
open at review time; exact heads and contracts are in the review report. They
must precede this package upstream. No missing supplier contract remains.

Checks: final `lean-check` exit 0, 78 warnings all from `sorry`;
`check_sorry_data.py` no offenders; packet checker 0 errors/0 warnings;
all submission files pass intake with 0 problems; `git diff --check` clean.
The Lean file states native coordinate interfaces only; heavy geometric
carriers remain README targets. Nothing is claimed formalised.

**Remaining:** no worker action. The maintainer can open the upstream draft
when its supplier-order requirement is satisfied. Public-source versions,
locators, source hashes, the adversarial mathematics table and signature
comparisons are preserved in the review report; no scratch file is needed to
resume. Stop after this one PR.
