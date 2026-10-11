# PKG-JacobianChallengePartII — blocked checkpoint

Refs [#7593](https://github.com/CBirkbeck/tauceti-explorer/issues/7593).
Codex (GPT-6), session `codex-K8bWzM`, 11 October 2026.
Branch: `codex-K8bWzM-jacobian-package`.
Base atlas commit: `b071db61759e3472d5067f600384d99980206316`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6107572716),
identifying claim comment 6107571728.

**Blocked checkpoint; the package remains unfinished.** This continuation
changes only this handoff. Its supplier and bundle conditions remain
unsatisfied. The README and Suggested.lean retain their inherited contents;
metadata remains absent.

The [preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/b071db61759e3472d5067f600384d99980206316/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
preserves the primary-source receipts, mathematical continuation work and
links to earlier proof and signature work. This run checks dependencies and
native library statements; it makes no new primary-paper verification or
implementation claim.

## Selection and scope

None of the manager's forty priority issues was present in the open `swarm`,
`state:available` inventory. No eligible plan or package review, or permitted
`top` or `focus` job, was available. The fallback package candidates were
#7592 and #7593. Another session claimed #7592 between the inventory and the
claim attempt; the bot rejected this session's attempt there. Only #7593 was
successfully claimed, and this run takes no second job.

The issue authorizes only this package's README, Suggested.lean, metadata
and handoff and prohibits packet edits. WORKERS.md's upstream-tier rule
restricts package citations to the libraries, its own layers, assigned
bundle members and lower-tier packages. PROTOCOL §§3, 15 and 20 require
genuine suppliers, unique ownership and agreement with the accepted plan.
Creating the missing owner packages, amending the ownership contracts or
assigning a bundle requires changes outside these four paths. Local
stand-ins would leave those requirements unmet.

## Fresh dependency evidence

Read the current upstream JacobianChallenge and AlgebraicVectorBundles
READMEs in full and inspected their suggested interfaces. The supplied
read-only roadmap tree is now at
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; the current Tau Ceti library is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither was changed; no
Lake command ran in either tree. Read the cleared-library index; no
restricted source was copied.

The GitHub main queried in this run is
`4b002f622e9d68b627bdce9f6224897305a68bdc`. Its
[roadmap-directory listing](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
contains neither AbelianSchemesAndArithmeticModuli nor StableReductionPartII.
Both atlas package directories are also absent. Exact job-ID lookup finds
neither `PKG-AbelianSchemesAndArithmeticModuli` nor
`PKG-StableReductionPartII`; this package's queued job remains pending with
`after: []`. Neither focus.json nor the tier document assigns the required
coupled bundle.

| Missing supplier | Contract required by this package |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base abelian schemes, rigidity on nonreduced bases, translations and normalized square/cube formulas. |
| AbelianSchemesAndArithmeticModuli A2 | Relative dual representability, Poincaré trivializations on both zero axes, biduality, polarization conventions, seesaw and arbitrary base change. |
| AbelianSchemesAndArithmeticModuli A3 | Nonzero integer multiplication finite locally free of rank absolute-value(n)^(2g), including inseparable cases, with scheme-theoretic torsion and Weil pairing. |
| StableReductionPartII MC.4 | Full Jacobi level and the fine smooth-curve scheme with universal curve in the chosen cyclotomic symplectic component. |

The actual node prerequisites require
**JC1 relative Jacobian/base change/principal polarization → MC.4 full level
→ MC.4 fine-level scheme → JC7 universal-level Jacobian**. MC.4/full-level
imports three JC1 nodes. JC7/universal-level-jacobian imports both MC.4 nodes.
Thus reciprocal whole-package prerequisite entries would cycle; a bundle
must preserve this internal node order. Keep MC.4 out of JC1.

The accepted AbelianSchemesAndArithmeticModuliPartII package cannot replace
its missing parent: its scope explicitly imports A1–A3 and it consumes JC2
and JC7. The A1–A3 owner packet also has seventeen targets with direct
prerequisites in AlgebraicModuliForArithmeticGeometry R09.4. In particular,
the abelian-scheme, relative-rigidity and relative-dual contracts come from
that part. Its independent review still says **needs_changes**, requiring
reader synchronization. The existing AlgebraicModuliForArithmeticGeometry
package does not contain those three named contracts. Reconcile the actual
supplying ownership before treating that package as their provider.

Read the reviewed A1–A3 library-audit entries and the current native
`AbelianVariety` and `rigidifiedPicardFunctor` declarations. The former has a
field parameter and group object over its spectrum; the latter requires a
chosen section and returns classes rigidified along its pullback. They do
not provide the required arbitrary-base, section-free representability and
duality contracts. The older audit's assertion that no Picard functor exists
is not used as a current absence claim.

## Validation and completion boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight stages are
  planned; none is closed.
- Fresh `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 78 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. Memory preflight: 99 GiB available. The shared wrapper reports
  Mathlib `082e2d37e8` and designates the Tau Ceti `f790474` build. No compiler
  remains running.
- The final omission inventory lists 47 of the 48 targets. Five have native
  coordinate companions but still need their geometric identifications;
  42 have no geometric signature. The triangular-coordinate equivalence is
  the remaining target. Successful elaboration does not certify completion
  of this inventory.
- The local accepted packet's Git blob equals the current remote blob,
  `4aa4baf7051d67a140e64c474f657b9227d5194c`; no plan amendment was found.
- README: 100,860 bytes; SHA-256
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
  Suggested.lean: 30,594 bytes; SHA-256
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
  Accepted packet SHA-256:
  `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.

Metadata is absent because the package is unfinished; its presence would
trigger the intake's existence-based completion classification. Whitespace
and submission-file validation are recorded in the pull request.

## Resume after the external prerequisites change

1. Resolve the R09.4 reader synchronization and supplying ownership; supply
   the A1–A3 and MC.4 owner packages and usable interfaces.
2. Assign the coupled JacobianChallengePartII/StableReductionPartII bundle,
   preserving JC1 → MC.4 → JC7, and gate this package on its prerequisites.
3. Resume from the preceding handoff's mathematical receipts. Retain all
   48 prose targets, API and tests, including characteristic, sign,
   section-free and nonreduced-base controls. Complete the geometric
   signatures against the genuine supplying objects.
4. Run the blueprint, Lean and submission checks. Add
   `topic = "math.AG"` when the package requirements are met.

Releasing this job against the same supplier tree cannot complete it. The
required next action is a supplier/bundle amendment, outside this package
job's deliverables, rather than another unchanged compilation or source
search.
