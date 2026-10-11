# Handoff: REV-DrinfeldModulesAndTModules--DM.0

Issue #513; Codex (GPT-6), session `codex-ljXclE`, 11 October 2026.
The independent review is finished and accepts the corrected packet as a complete
planning pass. It did not author the input. One job was claimed; no second job
is taken. The report and packet contain the findings needed after scratch cleanup.

## Completed

All 75 targets and 21 pinned baseline citations were reviewed. There are 57
corrected and 18 verified targets, 216 API items, 152 tests and 42 planets.
All eight stages remain planned, none closed. No target-level node was added.
There are 16 precise gaps and eight supplier requests, including catalogue
registration of existing current AlgebraicVectorBundles imports. All six original
source issues are confirmed; E7–E10 add four independently checked findings.

The suggested file now has actual purity-lattice/weight signatures, correct
tangent-series orientation, Taelman's three contraction hypotheses, lattice
F-linearity, extensionality/category APIs and a nonreduced motive-bound example.
The coordinate t-module exponential and its predicates take the infinity-norm
hypothesis explicitly.
Every API/test name is indexed with its native scope or exact omission.
Implementation status remains unchecked throughout.

## Resume points for the orchestrator

1. **Synchronize the read-only companion reader**
   `research/blueprint/readmes/DrinfeldModulesAndTModules--DM.0.md` from the
   corrected packet before packaging. This review could edit only the packet,
   suggested file, report and handoff. The reader already puts the Ore comparison
   under FF.4, satisfying RT-AREA-finitefields/13. Synchronize its source locators,
   APIs/tests and supplier lists as well as these substantive statements:
   DM.2 `a-lattice`, `uniformization`, `exponential-morphisms` (equal ranks);
   DM.4 `effective-a-motive` (`J^d`, including the nonreduced example), `purity`
   (every witness gives `u/v=d/r`), `uniformizability` (explicit `1<‖θ‖` in
   the coordinate exponential and predicates); DM.1 `characteristic-local-realization` and
   DM.7 `characteristic-comparison` (locally free, residue embedding and
   dimension-one bound); DM.5 completed total quotient rings and `period-ring`
   (projective normal models of any dimension, with proper coherent finiteness
   from SF.2 rather than curve-only cohomology); DM.6
   `nuclear-determinant` (fixed norm, all three contractions) and
   `tangent-comparison` (source operator orientation).
2. **Register the existing bundle imports.** Current TauCetiRoadmap commit
   `070dc2becd74419e76303ede84b465ed4a69461f` owns AlgebraicVectorBundles L0B
   and L2B. Exact owner references and contracts are in `upstreamImports`.
   The catalogue gap reflects the older atlas registry; it requests no new
   vector-bundle mathematics. AlgebraicCurves 2/3/5 and JacobianChallenge A–C
   replace broad FA.1/FA.2 and SF.0 foundation claims.
3. **Assign shared missing inputs once.** SF.2's actual site/cohomology nodes
   do not provide strict finite F-module schemes and the finite-shtuka
   anti-equivalence. Plan the exact Hartl §4 category, strict action,
   exactness/étale/co-Lie API and pairing in SchemeAndStackFoundations, Part II.
   HS2 does not provide Hartl's equal-characteristic effective local category;
   route it to an explicit Part II or a single-owner reassignment. Generic
   valued-skew-field invariant-factor/Newton theory is also a Part II gap,
   not an existing FF.4 result. No fabricated stage identifier was introduced.
4. **Retain the remaining exact proof inputs.** Rank integrality,
   nilpotent standardization, analytic surjectivity/kernel rank,
   reciprocal-ring normality, integral Tate saturation, Drinfeld motive
   simplicity, elliptic-chain morphisms/nonrational-infinity descent and
   native interface integration are still open. New entries distinguish
   finite étale bases/compatible limits, projective quotient/normal section
   rings, and completed coefficient/norm/compact quotient adapters.
   Each gap names its consumers and sources; each stage has an explicit
   `remaining` list. Do not relabel the packet or stages closed.
5. **Collect source findings with the edition qualification.** E7 is the
   missing scalar argument after Brownawell–Papanikolas (2.2), p. 6.
   E8 corrects Hartl–Yu v2 (3.7), p. 18 to an unordered subset sum; its
   `q=2,r=2,i=2` negative check is decisive. E9/E10 are Stalder preprint
   pp. 36/28 exponent/variance misprints. They were not collated against
   uninspected journal versions. Original E2 was already fixed in print.
   Fourteen source artifact hashes were independently matched. The deposited
   published Stalder text was checked through its indexed public recap on
   p. 595; its existing PDF artifact hash was not independently confirmed.

## Validation

- `python3 scripts/check_blueprint.py` on the packet, including a declaration
  index of the shared pinned source trees: 0 errors, 0 warnings.
- Source-issue and source-version schema checks: no errors.
- Interface parity: every one of the 368 API/test names has one matching
  `suggestedInterface` item and a register entry.
- `lean-check` on the full revised suggested file: exit 0 at the pinned
  Mathlib/Tau Ceti build, 311 `sorry` warnings, no other diagnostics.
- Intake checks: four files, zero problems. `git diff --check` passes.

No source files or excerpts are retained in the repository. The workspace scratch
is deleted after the pull request is opened; this note, the review report and the
packet are the persistent handoff.
