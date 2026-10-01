# KEYDEF-algebraicnt~2: handoff

Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5545). This is revision round 2 of `KEYDEF-algebraicnt`. The
survey is complete and awaits a new review by a session that did none of `KEYDEF-algebraicnt` or this round. Its
`review` object is left in place for that reviewer to replace.

## What this round changed

- **Corrections checked.** I checked the seven corrections that REV-KEYDEF-algebraicnt made in place: the eight added
  derived-limit IDs, the two pinned ℓ-adic Mathlib declarations, the removal of D7 as owner of continuous étale
  systems, the Kato and local-quadratic scope, the GW import, and the cross-survey dependencies. All seven stand. No
  entry or API statement changed.
- **Reconciliation with `KEYDEF-algebraicgeometry`,** accepted after this survey's review:
  - `PAPER-DITTMANN-POP-23/resolution-f2` moved from routine to `elsewhere`, with owner
    `algebraicgeometry/normal-crossings`.
  - The reserve reason for the Bright–Newton evaluation filtration now names `algebraicgeometry/scheme-brauer`.
  - Two doubly-cited evidence items (ZAVYALOV-25/31, HARPAZ-WITTENBERG-16/4) were kept and explained.
- **Accounting:** 50/50/136/146 = 382/382. `check_keydefs.py`: 0 errors, 6 warnings.
- **Report** updated: status line, counts and a "Revision round 2" section.
- **Independence.** The review's account-independence objection is resolved by the protocol change of 1 October 2026
  (commit 89bf250a, PROTOCOL §§8 and 19): independence is by worker session.
- **Disclosure.** This session reviewed `KEYDEF-algebraicgeometry` (PR #5327). That survey's entries are dependencies
  of this one, and the reconciliation above concerns them.

## For the maintainer

1. **Owner gaps** (each `owners: []`):
   - the modified adelic zero-cycle complex, which the input routes to `HeightsRationalPointsPartIIZeroCycles` but no
     stage plans;
   - continuous étale cohomology of adic sheaf systems on schemes, for which no geometric supplier exists, so one should
     be assigned or extended and D7 made to consume its Galois comparison;
   - geometric stabilizers with outer Galois action, which the input routes to
     `HeightsRationalPointsPartIIHomogeneousMassey` but no stage plans.
2. **D7 / CC.2.** `CompletedCohomologyPartII:CC.2` also says to construct the generic derived inverse limit and Milnor
   sequence that D7 claims as sole generic owner. CC.2 should import D7's construction and prove only its tower's
   conditions.
3. **`algebraicgeometry/flat-torsors` cites PAPER-HARPAZ-WITTENBERG-23/82.** That item is a torsor of splittings of a
   sequence of discrete Γ-modules, a group-cohomology construction. This survey keeps it under the ProfiniteCohomology
   owner. The accepted algebraic-geometry survey may wish to drop it from its flat-torsor evidence.
