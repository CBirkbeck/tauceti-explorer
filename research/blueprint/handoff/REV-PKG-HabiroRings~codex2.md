# REV-PKG-HabiroRings~codex2 — completed independent review

Issue #11380. Codex, session `codex-4UOOxp`, 2026-10-20.
Claim confirmed by the bot in issue comment 6291816091. One job only.

**Verdict: needs_changes.** This is the completed independent review, not a
checkpoint. Full statements, source checks, adversarial cases, inventories,
library/current-upstream evidence and verification are in
[the report](../reviews/REV-PKG-HabiroRings~codex2.md).

## Done

- Preserved all 89 accepted targets plus the subsequent ordinary/derived
  receiving target, all 294 original API names and 131 original named Checks.
  The README is 199,855 UTF-8 bytes, below the issue's 200 KB limit.
- Replaced hypothetical HR Part II ownership of the downstream étale
  Habiro–Hodge comparison with its actual cohomology owner, **HQ §4.21** and
  subsequent upgrades. Full target, source, naturality, filtration and Checks
  remain in the downstream contract. No cohomological/trace construction input
  is introduced into HR.
- Corrected §4.6's nonzero derived obstruction for the unit-ideal case, added
  three boundary Checks, strengthened the Witt comultiplication coordinate
  Check and added the compact Lean file's omitted-definition comment.
- Independently verified the prior scalar exports, completed coefficient
  change, discriminant/6 distinction, descent overlap and fracture conditions,
  all-module ordinary/derived receiver and integral factorial supplier.
- Replaced the fix worker's self-assessment with the independent job's review
  object. Existing solid spectral and actual HB.7 global arithmetic inputs
  remain explicitly conditional.

## What prevents upstream acceptance

1. **HC donor removal (blocking).** In
   `packages/HabiroCyclotomicCompletions/README.md`, remove the derived
   `ordinaryDerivedComparison` and derived Checks from §5.5. Remove HR.2 as
   a construction input in Scope/ownership, Layer 5 Dependencies, §6.4 and the
   closing `Suggested.lean` comment. HR §2.4 already owns the receiver after
   its adjunction. Keep HC §1's factorial topology, §2.3's Laurent comparison
   and §5.1's ordinary polynomial-module completion/exactness: those are the
   legitimate earlier inputs that HR consumes. No donor file was authorized
   or changed in this job.
2. **HC ordinary example.** The §5.5 family `((q−1)^k)_k` is not Habiro-decaying:
   modulo q+1 it is `((−2)^k)_k` with infinite nonzero support. For the intended
   diagonal nonexactness example use P_k in both the maps and the family.
   Those entries decay at every finite factorial quotient; their unique
   preimage would have all coordinates one and fail finite support modulo P₁.
   Write this repair in the same authorized donor job.
3. **RT consumer retarget.** In `packages/RefinedTraceMethods/README.md`,
   scope, supplier list and §6.14 still cite HR.6's degree-zero cohomology
   comparison. Point these to **HabiroCohomologyFoundations §4.21**, including
   the multiplicative/filtration upgrades the application uses. HR now records
   that actual owner. RT files were not changed.

The conditional family order HC → HR → cohomology Part I → RT → cohomology
Part II still requires its separate coordinated repairs. This review does
not certify the entire family acyclic. No new HR Part II is needed merely
to own the already stated étale cohomology comparison.

## Evidence and resumption

The issue names `REV-PKG-HabiroRings~codex.md`; it is absent at baseline
`4b18c1d29c8e6b0a3f14b82a0abce44e245327cf`, as is the named `~adv` report.
The available original accepted independent review and both later fix
handoffs were read; missing findings were not invented. The copied Mordell
title in the issue does not describe this package.

- `lean-check` passed with exit 0, zero errors, six `sorry` warnings. The
  210-line file has seven proved examples and the proved zero-evaluator
  negative control; only omitted-name comment spelling changed afterward.
- All six packet checks: zero errors/warnings. Original name/anchor coverage,
  local links and the 90-vertex/244-edge local Needs DAG pass.
- Intake file checks and whitespace checks pass. Source sample of 15 plus
  additional primary passages is recorded in the report, with fixed-version
  receipts; no source passages or files are committed.
- Current upstream roadmaps checked at `0d144d044dacebca17b654695b6f1ad58f159b27`,
  current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; no target
  duplicate requiring removal found. Pinned native statements were read;
  Lean imports only pinned Mathlib, without claiming Tau Ceti integration.

Resume with the donor and consumer locations above, then recheck package
ownership order. This worker did not take another claim or edit another
package. No suspicious instruction was encountered in untrusted material.
All necessary evidence is in the report and this note; scratch is disposable.
