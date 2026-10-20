# REV-PKG-ArithmeticDynamics handoff

Completed by Codex, session `codex-Tubnn6`, 2026-10-20, for issue #10890.
Independent of package author Codex `codex-oE9sRI`. Verdict: **accepted with
fixes**. The full report is
[`REV-PKG-ArithmeticDynamics.md`](../reviews/REV-PKG-ArithmeticDynamics.md).

## Delivered

Reviewed all 489 owned targets and the imported Strassmann boundary against
the four accepted packets. Preserved all 726 input API items and the target
coverage. The final README has 106 definition-family Check blocks, all with
at least three Checks, and 414 Checks in total.

Corrected the integral-polynomial hypothesis in good reduction, homogeneous
coordinates for the third quadratic fixed point, abbreviated Tate-limit API
guards, a corrupted complement symbol, the zero/one exponent cases in the
local period induction, a redundant conjecture test, an ineffective metric
averaging test, the positive-degree root-set comparison, lowest Taylor terms
in the generic critical-orbit argument, and the finite-index interpretation of
the profinite index formula. Added the public FRL corrigendum and separated
its square-root correction from the roadmap's own conservative weighted bound.
Added a proved Lean identity example for the existing Fatou and Julia
definitions; the existing 26 theorem signatures are unchanged.

The report contains the adversarial mathematics table, an independent random
15-node source sample, more than ten Lean/README signature comparisons, source
URLs, access date and SHA-256 values. No source passage was added.

## Current upstream and port note

Read-only duplication audit: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked the nine newer roadmaps,
their split Lean files where present, and Completed ContourIntegration,
EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Searched the current
library by mathematical objects and inspected relevant matches. No new target
removal or ownership transfer was necessary. Strassmann is already deferred
to ED.4 §4.26; generic Galois, analytic and resultant tools remain suppliers.

**Port adapter required:** pinned Tau Ceti `f790474` has elliptic
`Point.canonicalHeight` equal to half the native raw doubling limit; current
`CanonicalHeight/Basic.lean:Point.canonicalHeight` has the raw limit. The
package's pinned factor-two theorem is correct. At the current API the raw
dynamical Tate limit equals that current height. Divide the current elliptic
height by `2[K:ℚ]` for the absolute Néron–Tate height of `(O)`. Recheck the
import and these comparisons when porting; do not repeat the elliptic height
construction.

## Explicit mathematical obligations retained

Acceptance concerns the roadmap package, not proof completion. The 24 precise
construction contracts and supplier requests remain. ArithmeticDynamics is
outside the 94-roadmap Caraiani–Newton tier list and has no assigned tier;
upstream submission order must respect its named suppliers.

The public author FRL 2007 corrigendum was found and read in full. The original
Silverman 2012 p.103 proof was not accessed: the library index does not clear
that book. Its bounded-representative statement is verified through Ingram
Lemma 13, with `gap-dy6-5` retained. Tate's original 1983 PDF was unavailable;
the bounded-error statement and divisor degree were read on rendered
Call–Silverman pp.183–184. `gap-dy6-8` retains the original local-height
construction. No fresh original-proof certification is claimed for GIT or
the polynomial classifications. The report records their exact status.

## Checks and next step

- Suggested.lean is 515 lines: independent `lean-check` exited 0
  at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474`, with exactly 26 sorry warnings and no other warning or error.
  Its 15 examples are proved; no sorry'd data or theory development.
- All four input `check_blueprint.py` runs: zero errors, zero warnings.
- `check_sorry_data.py`: passed.
- `intake.py check-files` on changed deliverables and handoff: zero problems.
- Internal-anchor, target, API and Check inventories and `git diff --check`:
  passed, with the one intentional Check replacement recorded in the report.
- Exact rational/integer witness calculations independently checked the
  resultant, nonmonic discriminant recursion, critical-orbit Taylor terms and
  primitive-root period used by this review.

No work remains for this review. Resume with the maintainer's upstream package
process and the port note above. The accepted inputs and their packets were
not changed. No suspicious instructions in untrusted material were encountered.
Scratch source files and temporary calculations can be deleted after submission;
all durable findings and access records are in this handoff and the report.
