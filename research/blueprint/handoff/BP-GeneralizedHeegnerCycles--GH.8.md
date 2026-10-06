# GH.8 handoff — completed target-level planning pass

**Worker:** Codex (GPT-6), session codex-Wlk1LX
**Date:** 6 October 2026
**Issue:** #740, BP-GeneralizedHeegnerCycles--GH.8
**Status:** complete planning pass; GH.8 planned with recorded gaps, not closed.
Independent review is still required. This is not a checkpoint or a review.

## Result

The packet has sixteen nodes: five comparisons, four theorems, five lemmas
and two applications. It retains all thirteen inherited node IDs and adds
`weight-two-reciprocity`, `automorphic-reciprocity-export` and
`corrected-bsd-input-export`. Every node explicitly realizes GH.8. There
are four planets, eleven baseline declarations, sixty-two acceptance
checks, nine supplier requests and six gap groups. There are no new
definition/construction nodes, API items or new-definition unit tests;
arithmetic objects are imported from their owners.

The roughly 5,000-word reader is one definitive account of the mathematics,
with conventions, proof routes, supplier boundaries and acceptance checks.
It replaces the historical checkpoint layers. The packet and reader keep
all implementation statuses unchecked and distinguish a completed planning
pass from a closed prerequisite graph, as PROTOCOL section 0 permits.

The main additions are the exact point regulator transport, source-qualified
consumer maps and legal coefficient specializations. The family export
retains the localization at λ=Ψ(Frob_p)−1: a specialization sending λ to
zero cannot evaluate its inverse. The CH negative sign, group-like factor,
Tate-period power and CM pairing remain separate from Castella's family
presentation until their period/twist diagram is proved.

The corrected multiplicative BSD export follows the auxiliary higher-weight
congruence route. It records the required nonsplit tame-prime extension,
weight-dependent admissibility and integral leading-class unit as supplier
gaps. Remark 6.6 does not provide a p-new multiplicative weight-two class
comparison. RankZeroOneBSD BSD.6a owns the congruences, control and
main-conjecture conclusions. AutomorphicCongruences L2 owns its divisibility
and distinct Beilinson–Flach input; L2s and the supersingular BSD branch keep
their own classes. General coefficient/ideal/determinant comparisons stay
with ModularIwasawaMainConjectures L6, without a reverse GH.8 dependency.

Existing finer HE.0/HE.1/HE.2/HE.3/HE.8 nodes and the integrated GH.4
reciprocity node are imported directly. The remaining requests are to GH.0,
GH.1, GH.2, GH.3, GH.4, GH.5, GH.6, GH.7 and PadicHodgeRegulators L1.
No other roadmap or upstream document is replanned.

## Evidence and checks

- Read the issue, binding protocols, accepted GH audit, integrated GH
  decomposition, relevant supplier packets, ownership/link evidence and
  the upstream JacobianChallenge and GrothendieckEulerForms documents.
- Acquired seven mathematical PDFs afresh. Their URLs, SHA-256 hashes,
  access date and bounded reading locators are in the packet. Checked
  BDP's published degree-one/local Abel–Jacobi passages; published and
  revised CH conductor, regulator and reciprocity passages; Castella's
  family coefficient ring, moments and p-old extension; LZ14's injectivity
  proof; the full CH erratum; and the corrected multiplicative BSD proof
  route. Rendered CH p.593, revised CH p.25 and Castella p.28 were inspected.
  The packet distinguishes statements read from proofs read. No full new
  Rubin, Howard, Kobayashi–Ota, Longo–Vigni, FW or CLW reading is claimed.
- Rechecked all eleven baseline source declarations at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, including generated additive
  reindexing via its source declaration. Checked Tau Ceti's relevant
  sources and absence/near misses at
  `f790474821cf4256814db967cb154e7af3d0c369` through repository history.
  Abstract divisor classes, multiplicative Kummer theory and elliptic
  Jacobian coordinates do not supply the geometric carriers.
- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json`
  passed in the actual clone with its declaration index and atlas:
  **zero errors and zero warnings**.
- `lean-check research/blueprint/suggested/GeneralizedHeegnerCycles--GH.8.lean`
  passed. The file has twelve named signatures, twenty-nine examples and
  six baseline checks; its forty-one proof placeholders produced only
  `sorry` warnings. The shared build has the exact Mathlib pin and a newer
  Tau checkout. This file imports only Mathlib, so this is an exact-pin
  Mathlib elaboration check, not a Tau-import compilation claim. No library
  build or language server was started.
- Exact rational/finite-field diagnostics passed 56,637 cases: 1,792
  first-trace calculations, 9,720 positive-trace calculations and 45,125
  primitive-character comparisons. Six explicit boundary regressions and
  all seven acquired PDF hashes also passed. These are arithmetic sanity
  checks of algebraic formulas, not Lean proofs or geometric realization.
- `research/blueprint/intake.py check-files` passed for the four
  deliverables: zero problems. JSON, target inventory, node-ID preservation,
  literal source excerpts, prototype names and `git diff --check` passed. Only this job's
  four deliverables are submitted; no downloaded sources are committed.

The source finding `GeneralizedHeegnerCycles/E-GH8-1` is retained. The full
symmetric-power/induction equation has unequal ranks for class number
h>1, including degree zero. The display remains in the published and 2022
texts; the full author erratum does not correct it. The searched versions
are recorded precisely. The initial unit-count and regulator-quotient
questions are comparison gaps, not additional established source errors.

## Where follow-up work starts

1. GH.1: construct the actual finite Picard–Kummer/Gysin sign comparison,
   continuous passage, quotient/de Rham naturality and selected-factor
   forward/reverse lattice maps with one fixed multiplier.
2. GH.0/GH.3: repair or bypass the CM carrier, then identify the finite
   quotient action, last conductor kernel and twisted character
   specialization/descent. Finite-sum orthogonality supplies only the
   algebraic cancellation.
3. GH.3 with the finer HE suppliers: instantiate the actual first trace and
   degree, including level fields, basepoint, reciprocity direction and
   full/half-unit convention. Compare compatible bottoms through the actual
   first-corestriction square, not an initial-only rescaling.
4. GH.4/GH.7: identify the regulator quotient submodules and prove the
   descended kernel is zero; realize the ordinary-line pairing, global
   localization chain, period/twist maps and legal localized or regular
   coefficient specializations.
5. GH.0–GH.7: justify the corrected BSD auxiliary-form nonsplit tame-level
   and varying-weight range, corrected derived local conditions,
   non-torsion, LV admissibility and integral leading-class unit.
6. Express the omitted arithmetic Lean signatures when these actual APIs
   exist. The current algebraic prototype uses no opaque substitute for a
   curve, Chow group, cohomology group, regulator or completed coefficient
   ring.

Each group is a recorded gap with exact consuming nodes and supplier
contracts. Independent review should assess target-level completeness and
source faithfulness, then route these refinements; it must not mark the
stage closed while they remain.
