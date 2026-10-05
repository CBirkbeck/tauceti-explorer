# DESIGN-MultiquadraticPartII handoff

Issue: #3416. Author: Codex. Session: `codex-my8gSr`. Date: 2026-10-05.
This is a complete target-level planning pass, ready for independent review.
It is not a formalization or implementation claim.

## Deliverables and scope

The roadmap definition, packet, reader and suggested Lean file are the
`MultiquadraticPartII` files in their respective blueprint directories. The
roadmap extends `tauceti:TauCetiRoadmap/Multiquadratic`; it imports that roadmap's
built narrow class group, genus quotient, prime-discriminant factorization,
ideal genus characters and principal genus theorem. The reviewed AUDIT04
entries in `data/library-coverage.json` mark all four upstream layers built.
The upstream Multiquadratic and Completed/EffectiveBounds reader documents
were read before planning.

The issue's historical area name `numbertheory` no longer occurs in
`data/galaxies.json`. The definition uses the current area `algebraicnt`.

There are nine nodes, all theorems, and nine planets, distributed 2/1/5/1 among
the four layers. There are no new definitions or constructions, hence zero new
definition API items and zero definition unit tests. The suggested file has
nine matching named theorem signatures and eighteen acceptance examples.
The packet cites 41 baseline declarations. All nodes retain
`implementationStatus: unchecked`.

## Coverage and what remains

| Stage | Planning coverage | Endpoint |
| --- | --- | --- |
| RQ.0 | closed | Exact narrow kernel `{1,J}` and unique descent of a real character precisely when it kills `J` |
| RQ.1 | closed | Equal, nonempty finite genus fibres and their exact narrow-class-number normalization |
| RQ.2 | closed | Composite sign formula, positive-factor/prime-divisor criterion, fundamental two-square criterion, square-class criterion and norm-unit obstruction |
| RQ.3 | planned | Fundamental form/ideal character comparison, with explicit supplier contracts and one concrete-interface gap |

RQ.0–RQ.2 have no remaining planning refinements or supplier gaps. Closed
coverage means their theorem plans reach verified library declarations, not
that the new declarations are implemented. The packet status is `complete`,
not `closed`, because RQ.3 has two requests and one gap.

The two requests name their consumer node
`MultiquadraticPartII:RQ.3/formCharacter-eq-idealCharacter`:

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2` supplies the general integral
  binary form character: content-zero branch, evaluation at a coprime
  represented value, independence, proper equivalence and parity, with the
  same Kronecker normalization as the existing arithmetic genus character.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3` supplies the oriented
  primitive-form/narrow-ideal dictionary, the source's coefficient-change
  table, and positive coprime represented-value and integral norm-ideal
  witnesses in the inverse narrow class.

Neither current supplier packet has an exact node for this routed interface.
The suggested comparison takes an actual existing quadratic-form carrier, a
form-character function with its represented-value law, and a nonzero ideal
with the stated norm and inverse narrow class. It does not assume the desired
comparison. A follow-up must bind the canonical supplier declarations,
discharge these witness arguments and write the canonical imprimitive
zero-character example. General character well-definedness, content reduction,
oriented carriers and reduction theory stay with those suppliers.

## Source and library checks

Baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Cited statements and relevant proofs
were read at those commits. The pinned singleton sign formula and
`isSquare_mkPrincipal_gen_iff` already provide two results marked missing in
the older paper extraction; they are imports, not duplicate theorem nodes.

Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*, Annals of
Mathematics 184 (2016), 949–990, was read in the algebraic passages required by
this route: §§2, 4, 7 and 9, pp.950–952, 959–960, 970–972 and 977–978. The
reader and packet record the public URLs, versions, reading date and hashes:

- [Published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf),
  read 2026-10-05, SHA-256
  `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.
- [Author copy](https://www.math.ucla.edu/~wdduke/preprints/geometric.pdf),
  dated 29 July 2016, local sign sentence checked 2026-10-05, SHA-256
  `f1f042adf06eafd410b43b819e076c24c9be8f928f0a8a7927f7569ef8b5cfcf`.

Published page images were checked for the p.952 orientation conventions and
p.971 sign sentence. The coefficient table is `[a,-b,c]` for the inverse class,
`[-a,b,-c]` for `JA`, and `-Q` for `JA^-1`. The inverse
parameter is `w=(-b+sqrt(D))/(2a)` when `a>0`.

Source finding `MultiquadraticPartII/E1` records the missing local real
qualification in the p.971 sign sentence. For `D=-4=1*(-4)` the complementary
signs disagree. Adding `D>0` gives the intended real statement; the real
branches of (7.8) are unaffected. The publisher page, author publication page
and copy, arXiv/title search and existing extraction findings were screened
for a correction; none recording this qualification was located. No audit of
the paper's analytic proofs is claimed. No required public source was missing.

## Validation and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MultiquadraticPartII.json`:
  zero errors and zero warnings, with the available pinned declaration index.
- Intake `check-files` on all five deliverables: zero problems.
- Source-issue and source-version validators: zero errors.
- Packet/signature names, eighteen example count, unchecked implementation
  status, JSON syntax, balanced reader math and the six-planets-per-layer limit
  were checked.
- Git whitespace validation passed.

The suggested file **was not compiled**. After checking available memory,
`lean-check` stopped at the import because
`TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank`
has no built `.olean` in the shared build. No signature was elaborated. The
shared Tau Ceti checkout is newer than the source pin, although the relevant
source files match it; the Mathlib checkout is at the pin. No libraries were
built or updated. An independent reviewer should elaborate the file when a
complete build at the pinned commits is available.

No scratch artifacts are required for continuation: all source evidence,
contracts, remaining work and compilation limits are in the committed files.
