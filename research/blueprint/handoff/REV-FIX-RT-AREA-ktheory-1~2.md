# Handoff: REV-FIX-RT-AREA-ktheory-1~2

Refs #5542. Codex (GPT-6), session `codex-kUKQAc`, 19 October 2026.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6257063599)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6257064920).
This session wrote none of the fixes under review and claimed no second job.

## Why this is a checkpoint

**Issue/queue authorization mismatch:** the issue's Deliverables and full
instructions still permit seven packet/Lean pairs and the report. The current
queue requires nineteen pairs and the report. [WORKERS.md](../WORKERS.md),
“Doing the work”, says “Edit only the files the issue names.” Expanded scope
was requested from the user; no authorization arrived before submission.
The twelve additional pairs were inspected read-only and were not stamped.

`issues.py:deliverables_complete` is false for the real queue job and true
for a scratch-only diagnostic restricted to the issue's seven pairs.
The predicate accepts both accepted and needs-changes review outcomes.
Do not alter queue scope or replace another job's review merely to satisfy
that predicate. Reconcile the issue with the queue, or obtain explicit scope
authorization, before editing the following additional basenames (each has
`packets/<basename>.json` and `suggested/<basename>.lean`):

1. `BorelRegulators`
2. `MotivicEtaleKTheory--M.1`
3. `StableHomotopyKTheory`
4. `KTheoryLowDegrees--U.1`
5. `KTheoryLowDegrees--U.6`
6. `SpecialValuesBirchTate`
7. `MotivicEtaleKTheory--M.5d`
8. `SchemeKTheoryOperations`
9. `KTheoryLowDegrees--U.4`
10. `K2SymbolsBrauer--T.1-classical`
11. `K3BlochGroups--V.1`
12. `KTheoryFiniteLocalFields`

The older 22-packet list is stale. Arithmetic N.2, N.3-finite-generation,
N.5 and low-degree Z.3 are not current queue outputs. Do not repair Z.3
under this job without a new assignment.

## What this run completed

- Independently reviewed the 38 confirmed findings (/1–/37 and /39), the
  verifier, the round-two fixes and relevant newer N.7/T.3 repairs.
  The report has a fresh per-finding disposition table; inherited source
  certifications retain their original authorship.
- Replaced the seven authorized review objects, preserving every immediately
  preceding object verbatim in history. Outcomes: **accepted** for N.7 and
  T.3, **needs changes** for N.1, K.1, K.6, T.1 and K3BlochGroups.
- Corrected N.7's misleading finite-order Gaussian K₃ title and made the
  existing Gaussian `w₂=24` check explicitly use N.4's odd/two-primary
  computations, with K-book VI.2.1.2 as source.
- All nineteen packets pass `check_blueprint.py`, zero errors/warnings.
  The seven authorized Lean files elaborate serially with `lean-check` at
  the pins, memory above 20 GB. Sorry-warning counts: N.1 124, K.1 0,
  T.3 30, N.7 27, K.6 6, T.1 72, K3 807; no other warnings in those logs.
  Commented K.1 future signatures are not type checked.
- Independently checked all eleven golden-field finite certificates,
  173 exact relation witnesses and 23 selected determinants, including
  rejection of a corrupted witness. The report gives the arithmetic and
  exact packet field needed to reproduce this without scratch.
- The graph of 470 concrete nodes in the seven packets is acyclic; actual
  stage projection still has K.7→K.6 and K.7→K.3 dependencies against atlas
  order. This is not external supplier closure certification.
- No suggested file, extra supplier, queue, atlas data or upstream file was
  changed. No library build/update/cache download or language server ran.
  Scratch source downloads and logs are disposable; the report preserves
  the evidence and precise reproduction information needed next time.

## Current mathematical and format boundaries

**Do not revive obsolete N.7/T.3 objections.** N.7 now has direct golden-field
Tate descent, bounded representatives, ordinary-unit stretch, tied-prime
descent and exact finite certificates. It no longer needs the missing
Zhang–Xu/Skalba route. Its independent upper bound four and real-sign lower
bound four do not use Birch–Tate. The Gaussian proof also checks. Three
unrelated N.7 gaps and ten supplier requests remain.

T.3 now has an explicit arbitrary-residue LocalFieldsRamification Part II
routing brief with four contracts (normalized valuation, finite free lattice,
norm identities and component lengths). This resolves the old finite-residue
supplier-scope objection to /12 and /28. The Part II is still unregistered,
not supplied mathematics; that gap and five other gaps remain. The separate
finite-rank commutative-ring monomial-kernel supplier is not field Matsumoto.
Do not claim to have freshly read the inherited restricted Milnor or
Gille–Szamuely source certifications.

K.1/K.6 still require maintainer application of early-product and late-cofinality
stage splits. `K.7/products-from-biexact-functors` feeds
`K.6/nonconnective-spectrum`; `K.7/biexact-stabilized-pairing` feeds
`K.3/localization-product-boundary`. Embedded proposals alone do not change
actual parents. Workers do not apply atlas restructuring themselves.

The 12 October WORKERS shape rule is binding even though current CI applies
its data-body check only to package `Suggested.lean` paths. After stripping
comments, `check_sorry_data.py` diagnoses 7 actual admitted data definitions
in N.1, 3 in K.6, 18 in T.1 and 101 in K3; manual examples and exact lines
are in the report. K3 is also 5,105 lines. Move heavy unsupported constructions
to prose targets and keep only light real-bodied definitions/statements over
pinned carriers. Do not compress whitespace or use untyped commented
signatures as a substitute. Mathematical ownership repairs are retained;
these new packet-level negative verdicts concern the current file rule.

T.1's odd-order Heisenberg sign control distinguishes 2 from 1 in 𝔽₃;
its actual transgression comparison is still admitted. CFT6 separately owes
the character-evaluation identity proof. Other read-only supplier boundaries:
R.3 still imports rational Hurewicz from H.3 instead of H.6 (/5,/33), and
M.7's Dedekind étale comparison alone does not supply the full requested
Zariski truncation/naturality interface (/2). These are targeted observations,
not whole-supplier reviews or a claim that the H-space theorem is false.

## U.1: fresh compilation failure to resume after authorization

The additional `KTheoryLowDegrees--U.1.lean` was checked read-only this run:
**nine errors**, 946 sorry warnings, 9,098 lines. Diagnostics in the unchanged
file are:

- 4850: `omega` fails on the `Fin` zero inequality proof.
- 7977,7988,7993,7997,8004 (twice): native Morita essentially-small interfaces
  require incompatible universes `max (u+1) ?v = u`.
- 8723,8776: a monoid homomorphism to `ℚˣ` is supplied where the statement
  infers a homomorphism to `ℚ`.

Run `lean-check` on that file after scope authorization and repair the actual
contracts; preserve the current shape limit as well. The other eleven
additional Lean files were not compiled in this run. A previous worker's
sixteen-warning classical T.1 compilation is historical evidence only.

## Resume sequence

Resolve scope first. Then review the twelve additional packets only against
their actual area-fix obligations, read primary proofs needed for those
judgments, correct clear errors, preserve independent-review history and
record this job's scoped verdicts. Use the current report rather than
repeating obsolete seven-packet source objections or all prior checks.
A needs-changes verdict is a completed review; an unreviewed destination is
not. Keep all substantive unsupplied contracts explicit and open one job PR.
