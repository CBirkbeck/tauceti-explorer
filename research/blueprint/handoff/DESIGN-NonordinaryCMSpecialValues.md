# DESIGN-NonordinaryCMSpecialValues

Worker: Codex, session `codex-Aw3zf7`. Refs #1689.

The complete target-level planning pass covers all ten items in the current
corrected BKO route. It contains six layers and 26 nodes: one definition, four
constructions, fifteen theorems, five comparisons and one application. The five
definition/construction interfaces have 30 API items and 21 discriminating tests.
There are 20 planets and five pinned baseline declarations. All six layers are
`planned`; none is `closed`. Implementation statuses remain `unchecked`.

The five deliverables are the roadmap definition, blueprint packet, definitive
reader, compact suggested Lean file and this handoff. The reader states every
target, hypothesis, proof outline, API, test and import, with theorem/section/page
locators in our own words. The suggested file is 122 lines, uses native pinned
carriers and light scalar definitions, and leaves the heavy mathematical targets
in the reader. It does not substitute proposition-valued fields for those
carriers.

## Ownership and integration

The current accepted extraction
`research/blueprint/papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`, route 4,
is the scope used here. Its accepted red-team correction moved the three
Rubin-function targets from issue #1689's older combined brief to
`InertAnticyclotomicCMMainConjecture`. The packet maps all ten surviving early
items to exact nodes and records the rescope proposal. Grouped design #3350,
`AutomorphicPadicLFunctionsPartII`, also overlaps this BKO direction and
Kings–Sprang. The maintainer should reconcile these six layers with that grouped
design; no other job's files were changed. Kings–Sprang is not planned here.

The graph remains early special values → AnticyclotomicLocalUnits → inert CM
main conjecture, with a direct early nonvanishing input to the main conjecture.
No node imports signed local units or Rubin's decomposition. The local-unit
owner retains ξ_ν, Δ projection, native derivatives and signed kernels. The
main-conjecture owner retains the primitive coordinate and Rubin interpolation.

The general elliptic-unit foundation is imported once from
`CMAllPrimeMainConjectures:CZ.0/CZ.1`; its complete packet was unreviewed when
read. The general Finis result retains its existing
`AutomorphicPadicLFunctions:L3h/finis-divisibility` owner. The existing LT.4 Honda
comparison is applied at Frobenius [−p], rather than reconstructed. Current
TauCeti already has the Hecke carrier and adjoining infinity/norm interfaces;
GN9/GN10 supply those, including their post-pin developments.

## What remains before dependency closure

The packet has six named gaps and fifteen precise supplier contracts. Eight
contracts identify imports from existing upstream class-field, global-character,
Chebotarev, local-ramification, elliptic-torsion and ideal-estimate layers. The
other seven cover the following missing exports:

1. **G1:** CZ.0 must establish the exact integral smoothing-denominator and Betti
   lattice comparison for BKO's class, with norm compatibility. Kato's
   fraction-module class and 15.6.5 localization do not establish this.
2. **G2:** CM.4 must supply the arbitrary-class-number good-period algebraicity,
   coefficient/Galois comparison and the stronger canonical unramified
   field-of-definition result. AL.5 must extend its analytic wrapper to that
   supplied comparison. Its current GL₂/Q interface does not supply the CM
   theorem. The canonical character-value field is shown unramified using
   prime-to-p class orders, but placing the normalized value in that field still
   needs the comparison.
3. **G3:** L3h must export Finis Theorem 1.1(2) independently of ordinary density,
   with tower prime l, inert valuation prime p, the D^(1/4) factor and the local
   b correction. The specialization here checks self-duality, the central
   shift, vanishing μ and b terms and the ramified auxiliary Euler factors.
4. **G4:** DT.2 must derive the precise homogeneous mixed-place counting
   consequence used in Jia's Propositions 1–2 and 5. The arbitrary-class-number
   reduction, including ideal-class radicals and local directions, is outlined
   here; the existing general subspace node does not state the counting result.
5. **G5:** SIC L3 and regulator L1 must export the exact continuous inverse-limit
   twist and semilocal dual-exponential/trace compatibility for this realization.
6. **G6:** Scalar-to-literal-tensor vanishing is supplied only for canonical
   unramified coefficients, conditional on G2. For arbitrary ramified R the
   multiplication map may have a kernel. Retain the consumer's general
   coefficient gap; no unrestricted extension of BKO §6 is claimed.

These are a finished plan's explicit proof boundaries, rather than a checkpoint
requiring another planning pass. The independent review should verify the CM
period/coefficient boundaries and source corrections especially carefully.

## Source and library checks

The packet records URLs, SHA-256 hashes, dates and exact portions read for BKO
2021, Finis 2006, Kato 2004, Rubin 1987, Rohrlich's public root-number notes,
Greenberg 1983, Agboola–Howard II, Rohrlich 1984 and Jia arXiv:2412.05867v1.
The full Jia v1 was read; its sign-positive proof removes the class-number-one
restriction in the older nonvanishing references. The published 2026 Jia article
was identified from publisher metadata but not served freely; all detailed
findings refer only to v1. The restricted Kato 1993 book was neither consulted
nor fetched. Its generalized Coleman reciprocity input remains with CZ.1.

Six source issues are recorded without source quotations: the existing BKO
order/conductor index correction, four v1 Jia misprints checked against the
rendered pages (rational-principal exponent, missing q in a congruence modulus,
height q^c in (4.9), and negative exponential in (2.43)), and the missing explicit
fixed-support convention for the quadratic main term. That term uses κ_R
extended by zero at conductor primes; for a family ramified at inert 5 it has
the additional factor 1+1/5. These nonzero finite factors preserve the main
nonvanishing theorem. The new findings await independent review and do not
accuse the unread published version.

The reviewed library audit entries were read. The five cited baseline
declarations were checked in the pinned source: integral closure, direct
monoid-algebra evaluation and its generator formula, tensor multiplication
injectivity, and Dirichlet L(1) nonvanishing. The pins are recorded in the packet.
Current readonly upstream was audited at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GlobalNumberFields and
ArithmeticDirichletSeries readers were read in full; relevant suggested files
and current Hecke-character sources were inspected. No upstream tree was built
or changed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/NonordinaryCMSpecialValues.json`:
  zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/NonordinaryCMSpecialValues.lean`:
  passed.
- `python3 research/blueprint/intake.py check-files` on all five deliverables:
  zero problems.
- `lean-check` on the suggested file against the pinned shared build: elaborated
  successfully, with only the two expected theorem-placeholder warnings.
  Available memory exceeded 20 GB; no language server or Lake build was started.

The reviewer can resume directly from the packet's requests, gaps and exact
source-target mapping. No scratch file is required to use the submitted work.
