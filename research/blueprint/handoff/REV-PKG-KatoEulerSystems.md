# Handoff: REV-PKG-KatoEulerSystems

Issue #7936; Codex (GPT-6), session `codex-1pMy97`, 2026-10-10.
This is a **completed fixing review**, verdict **needs_changes**, not an unfinished
review checkpoint. The package author was `codex-4ArQBz`.

The package retains all forty accepted targets. Applied fixes: separate level
prime sets in §1.2 with `(2,3)→(6,9)` negative control; native Mathlib torsion-free
regular-scalar semantics with `ℚ×ℚ` positive control; Kato adapter §13.1/Example
13.3 and Nakamura Corollary A.5 locators; recovered Kato generalized reciprocity
author source and precise Theorem 4.3.1 citation; sixteen direct constructed-map
tests plus three mathematical controls; removed §6.3 from nonvanishing and
ordinary endpoint dependencies; timeless ownership prose and current Kummer
version. The previous package handoff's assertion that Mathlib torsion-freeness
requires every nonzero scalar is superseded by this review.

Validation: Suggested.lean exits 0 with 132 `sorry` warnings only, using the
shared Mathlib `082e2d37` build. It has 21 definitions, 40 theorem signatures and
91 examples. Fifteen scratch arithmetic checks were proved without `sorry` and
compiled without warnings. Input packet checker: 0 errors/warnings. Intake
check-files: 0 problems. Whitespace and JSON/TOML checks pass. No source files,
passages or private filesystem paths are committed. No build or server remains
running; source scratch is disposable after submission.

The durable review report contains the reproducible fifteen-position sample,
all six public source URLs and hashes, a forty-target adversarial table,
definition/test inventory and fourteen-row prerequisite audit. Read that report
before resuming mathematical work. Current read-only nonduplication audit:
TauCetiRoadmap `37769f03c170a7bc3e1082df70522a0ad59c5ffd`, including sibling
Completed and nested roadmaps; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No duplicate Kato target was removed. The current Kummer isomorphism and
norm/restriction exports postdate the original `f7904748` file; the package
cites their current version and its Lean file uses only Mathlib.

The manager should resolve ownership and the dependency schedule before an
upstream port. The blocking work is concrete:

- Build PadicHodgeRegulators D.2's non-perfect-residue-field reciprocity and
  Kato 10.9.5 comparison square. The previously inaccessible primary statement
  is publicly readable in the archived 65-page author version, hypotheses
  4.1.1 internal p.19, Theorems 4.3.1/4.3.4 internal pp.23–24. Kato 2004
  Proposition 10.12, p.198, cites Theorem 4.3.1, not §4.2. Do not confuse
  internal and published pagination or transport its sign without the square.
- Stage the early all-prime CM elliptic-unit input before the canonical map,
  including ℚ(i),p=2 and the separate CM local-length upper bound. No usable
  CMAllPrimeMainConjectures owner layer is attached. Supply the nonsplit
  quaternion-place rational argument separately; Ribet's open-image statement
  is insufficient for a unipotent there.
- Supply ModularCurvesPartII's actual open-curve/all-weight comparison and
  completed cohomology's literal-dual full-level moment; Selmer's modular
  complex/strict H², parabolic inverse-limit injectivity and global/local twist
  square; the complete Kato/modular-symbol period dictionary.
- Supply the regulator's full de Rham domain, integral ordinary local image and
  dyadic growth/interpolation/Coleman map. Existing odd-prime crystalline
  statements and a high-conductor analytic de Rham construction do not suffice.
- Verify elliptic Greenberg/control hypotheses and correction factors, and the
  finite-support theorem on the full dyadic completed group algebra. The domain
  O⟦T⟧ argument and prime-to-p character projectors alone do not supply it.
- For §6.3, construct the compatible arithmetic family or keep only the stated
  conditional implication. The ordinary and nonvanishing endpoints now avoid
  that dependency. Do not add PadicFamilies as a prerequisite: it consumes Kato
  classes. KatoEulerSystems is outside the CaraianiNewton 94-roadmap tier list;
  its supplier order requires an explicit maintainer decision.

The accepted packet's fourteen gaps and thirty-one requests were not edited.
Do not repeat an unchanged package review or mark this package accepted merely
because the representative Lean signatures elaborate. Resume at the missing
owner targets named in the report, under a newly authorized task.
