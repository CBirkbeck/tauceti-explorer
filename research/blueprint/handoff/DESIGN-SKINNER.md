# DESIGN-SKINNER — completed planning pass

Issue [#951](https://github.com/CBirkbeck/tauceti-explorer/issues/951).
Agent: Codex, session `codex-ybYAdQ`, branch `codex-ybYAdQ-rank-one-converse`.
The bot confirmed [claim comment 6244330109](https://github.com/CBirkbeck/tauceti-explorer/issues/951#issuecomment-6244330109).

This is a complete target-level plan, not a checkpoint. The packet status is
`complete`; PC.0–PC.6 are all `planned`, none is `closed`. Every implementation
status remains `unchecked`. Fourteen explicit supplier requests remain, with
no internal gap hidden behind them. Independent review has not been performed
by this author.

## Deliverables

- [Roadmap definition](../roadmaps/RankOneConverse.json): seven layers, area
  `iwasawa`, parent `RankZeroOneBSD`, titled **Rank-zero and rank-one
  Birch–Swinnerton-Dyer theory, Part II: the p-converse**.
- [Packet](../packets/RankOneConverse.json): 26 targets — six lemmas, seven
  comparisons, three constructions, one definition, eight theorems and one
  application; 17 API items, 17 discriminating tests, 12 planets and nine
  checked baseline declarations.
- [Reader](../readmes/RankOneConverse.md): conventions, exact statements,
  hypotheses, proof steps, dependency lists, APIs, tests, acceptance checks,
  source locators and complete supplier/source-target ledgers. All prose is
  in our own words; no source passages are included.
- [Suggested Lean file](../suggested/RankOneConverse.lean): 106 lines, one
  real-bodied localization predicate, four API signatures, four examples
  and two semilocal linear-algebra milestones. The heavy arithmetic carriers
  and final arithmetic statements remain precise README targets, in the
  binding 2026-10-12 shape. No proposition record replaces an arithmetic
  object, and no data definition has a proof placeholder.

## Mathematical coverage and review priorities

PC.0 handles residual restriction, the two Heegner geometries, Hecke/Hodge
point normalization and the transferred differential. PC.1 handles the
actual rational localization map, Kummer/quadratic comparisons, the
arithmetic localization criterion, semilocal dimension, strict kernels and
ordinary modular parity. PC.2 handles the anticyclotomic deformation,
analytic conventions, Wan's reverse bound and finite-error augmentation
control. PC.3 assembles Theorem B. PC.4 proves A and A′. PC.5 proves the fixed-p
mod-p criterion C. PC.6 proves the rank-zero converse E.

Theorem D stays at the existing
`ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one`. It
consumes B/C; statistics is not a prerequisite of this converse. After
acceptance its missing-converse references can point to PC.3/theorem-b and
PC.5/theorem-c. No other packet was edited.

The independent reviewer should check especially:

1. **Every coefficient component.** Skinner Lemma 2.2.2 and the reverse
   implication of Corollary 2.6.2 need componentwise logarithm nonvanishing.
   The existing GZ.9 eigenlogarithm node, sourced to Burungale–Skinner–Wan
   Theorem 1.1, supplies it without a uniqueness-of-λ assumption. Apply it to
   an actual non-torsion point after clearing a rational denominator. Retain
   the rational Hodge-divisor point before the coefficient projector; do not
   assert that the quotient kills that projector or apply the theorem to an
   arbitrary tensor or cohomology class.
2. **Ordinary Wan and specialization.** Use the published ordinary theorem
   associated with arXiv:1408.4044. Its fixed-weight Fitting bound, exact
   control, Fitting base change and divisorial closure give the required
   characteristic containment after inverting p. Principality by itself is
   insufficient. The coefficient-duality identification at augmentation is
   explicitly chosen. The exact analytic period/Euler-factor comparison and
   ramified Case I formula remain supplier exports.
3. **Local hypotheses.** B(d) is conditional on a common discriminant/level
   prime. It permits the coprime Case II with an even nonempty inert set.
   All whole-Sha conclusions require a GL₂-type forward theorem, including
   the maximal-order/isogeny bridge, rather than the elliptic-only forward
   node or a single-primary finiteness statement.
4. **The fixed prime in C.** Level lowering produces an odd residual-ramified
   prime at this p. Pairing elementary divisors rule out a nonzero finite
   cyclic Selmer possibility; square cardinality alone would not. Good
   reduction, the formal-group filtration and the Hasse bound justify the
   local p-primary torsion calculation.
5. **The derivative twist in E.** Sign −1 alone does not give a simple zero.
   First fix a negative fundamental discriminant with all local conditions,
   then apply BFH's introductory theorem to the normalized twisted form,
   using a positive second discriminant split at every relevant prime. This
   preserves the local characters and gives the derivative branch. The
   argument does not apply PC.4's negative-sign value construction to the
   positive-sign rank-zero form: PC.6 imports the local and ordinary-prime
   suppliers directly.

## Remaining supplier work

These are exact requests in the packet, not new duplicate plans. Their
consumer node ids and complete statements are in the reader's request ledger.

| Supplier | Requested interface |
|---|---|
| GL2AutomorphicRepresentationsAndTransfer R16.3 | Squarefree local epsilon factors, including ramified primes and CM geometry. |
| SelmerIwasawaCohomology L4 | GL₂-type coefficient-compatible Kummer/Sha comparison. |
| RankZeroOneBSD BSD.1 | GL₂-type quadratic/isogeny rank and entire-Sha comparisons. |
| SelmerIwasawaCohomology L1 | Rational Euler/Poitou–Tate specialization and elliptic alternating pairing. |
| SelmerIwasawaCohomology L2 | Finite/cofinite Selmer, inertia-strict deformation and elliptic local comparisons. |
| SelmerIwasawaCohomology L3 | Exact two-variable specialization and finite-error augmentation control in the full local setting. |
| PadicMeasuresIwasawaAlgebras L5 | Fitting/divisorial specialization, height-one augmentation criterion, nontorsion Nakayama branch and scalar comparison. |
| AutomorphicCongruences L2 | Published ordinary Wan fixed-weight Fitting bound and finite branch condition. |
| GrossZagierAndArithmeticHeights GZ.9 | Exact analytic normalization and ramified Case I squared-log formula. |
| HeegnerPointEulerSystems HE.7 | GL₂-type full forward rank-zero/rank-one theorem and maximal-order/realization bridge. |
| RankZeroOneBSD BSD.2 | Locally prescribed BFH value and derivative branches via the two-twist reduction. |
| SerreWeightAndLevelOptimisation R20.2 | Fixed-p level-lowering contradiction to weight-two level dividing 2. |
| RankZeroOneBSD BSD.0 | Actual GL₂-type analytic L-functions, conjugate/base-change orders and additivity. |
| TauCetiRoadmap EllipticCurves Layer 7 | Import its existing discrete Selmer, finite Kummer and Sha targets. |

Existing exact nodes, including the ordinary parity node, retain their own
proof obligations. This packet does not claim to discharge inherited supplier
gaps. All requested additions lie in their existing owners' directions; this
roadmap is already the Part II for the converse. No ownership move or new
restructuring is proposed. Upstream EllipticCurves is reused without edits or
replanning.

## Sources and baseline

Read the entire published Skinner article, pp.329–354. Also read the stated
relevant portions of BSW arXiv:2603.20886v2, published ordinary Wan,
Brooks, the Skinner–Urban author copy, Poonen–Stoll and BFH's introductory
Theorem (i)–(ii), pp.543–544. BFH was read from rendered scanned pages.
The source records list exact read sections, public URLs, read date and
SHA-256 hashes. No private source was needed or copied. Imported suppliers'
other references are not represented as direct readings in this job.

Twelve source findings are recorded against the texts actually read, with
corrections, reasons and correction searches. They have no self-review
verdicts. Two logarithm omissions and the derivative-input omission have
explicit repairs in this plan; the remaining findings concern notation,
wording, locators and the missing logarithm square in Brooks's final formulas.
See `sourceIssues` and `sourceVersions` for the individual records.

Actual baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library coverage was
checked, together with current read-only TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmaps
were searched; EllipticCurves Layer 7 was read for the existing Selmer targets.
No build or modification was made in either upstream tree.

## Validation and continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankOneConverse.json`:
  **0 errors, 0 warnings**; seven planned layers, zero closed, zero internal
  gaps, fourteen requests.
- Intake file checks: **0 problems** for the five deliverables.
- Source-issue structure and version checks: **0 errors**.
- `git diff --check`: clean.
- `lean-check research/blueprint/suggested/RankOneConverse.lean`: **compiled
  successfully at pinned Mathlib**; only the ten expected proof-placeholder
  warnings. Available memory was checked before compilation. No Lean server
  was started.

The next job is independent mathematical review of this completed plan,
including the source findings. Supplier exports must then be resolved before
any layer can be declared closed. The durable reader, packet and this handoff
contain all continuation information; no scratch file is needed.
