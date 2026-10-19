# MC.0 handoff — Codex, codex-Bsi10n

Issue: #10828. This is a complete target-level planning pass for **MC.0 only**,
not a checkpoint and not closed mathematical coverage. The issue headline,
deliverable paths and queue scope specify MC.0; the embedded seven-layer brief
is inherited context. No MC.1–MC.7 implementation or complete plan is claimed.

## Delivered

- The packet retains nineteen existing MC.0 targets by exact node-id imports
  from `research/blueprint/packets/MotivesAndAlgebraicCycles.json`. It introduces
  fifteen targets without duplicating those nodes: three definitions, five
  theorems, two comparisons, two constructions and three applications.
- The reader gives all **34** target specifications, their hypotheses, proof
  routes, prerequisites and locators. The combined inventory is six definitions,
  eight constructions, eight theorems, seven lemmas, two comparisons and three
  applications, with **84 API items and 51 unit tests**. The new packet alone
  has 35 API items and 20 tests. The six existing planets are retained; no new
  planet is added.
- The new material covers ground-field algebraic equivalence and adequacy,
  curve parameters and selected-Weil-theory comparisons; universal zero-cycle
  support, diagonal decomposition, cohomology-sheaf correspondence actions and
  the real closed surface-support vanishing; Roitman's low-degree hypersurface
  argument and the quartic input; intermediate Euler indices, the algebraic
  invariance of the Euler congruence, and the integral Laurent-field quadric
  counterexample.
- Integral cycles precede rationalization. Varying support over every
  algebraically closed extension is distinguished from a fixed support over
  all extensions. Geometric Weil cohomology is distinguished from the quadric's
  integral arithmetic étale group. No independence of Weil cohomology, integral
  universal triviality, or real point on a quartic is inferred.

Packet status is `complete`; `MotivesAndAlgebraicCycles:MC.0` is `planned`,
with three gaps and eight precise supplier requests. Every target chain ends
in a checked library boundary, an existing owner's node, a requested supplier
stage or an explicitly recorded gap. Nothing is asserted to be implemented.

## Exact continuation obligations

1. **MC0-G1:** verify the transition from supports that vary over algebraically
   closed extensions to the real closed diagonal/vanishing argument of
   Benoist–Wittenberg Proposition 5.2, pp. 66–67. The elementary decomposition
   target proves the fixed-support generic-point statement. Colliot-Thélène–
   Voisin's complex fixed-support proof alone does not establish the changed
   quantifiers or the proper-to-projective adapter. A follow-up should give
   that spread/specialization argument or a direct vanishing proof, using the
   interfaces in R1–R3.
2. **MC0-G2:** specialize Karpenko's integral K-theory calculation to
   `q = ⟨1,t,u,tu,v⟩` over `ℂ((t))((u))((v))`. Compute its even Clifford index,
   identify the integral filtration lift of the order-two codimension-two
   cycle, and verify odd Euler characteristic. The general theorems and
   Benoist–Wittenberg's assertion have been read; the explicit lattice/lift
   calculation has not been supplied. R6–R7 specify its owners.
3. **MC0-G3:** calculate the integral continuous étale Hochschild–Serre
   spectral sequence proving that the arithmetic group
   `H⁴_et(X,ℤ₂(2))` is torsion-free for this quadric. Include total-degree-four
   terms, differentials and integral extensions. Geometric torsion-freeness or
   a rational spectral sequence does not prove this. R8 specifies the exact
   supplier extension.

These are verification obligations of this plan, not findings that the cited
authors' theorems are false. All targets have been specified; closing coverage
requires these obligations and the supplier interfaces, rather than another
target-inventory pass.

## Supplier requests and ownership

| Request | Owner | Required extension |
| --- | --- | --- |
| MC0-R1 | SchemeAndStackFoundations:SF.5 | Chow direct limits at generic points, finite descent of cycles and rational-equivalence witnesses, transfer, spread and specialization; no left-injectivity assertion for localization |
| MC0-R2 | SchemeAndStackFoundations:SF.4 | Geometrically integral prescribed-point Bertini over arbitrary fields, including finite fields; characteristic-zero smooth projective models of proper supports in all needed dimensions; hypersurface integrality |
| MC0-R3 | SchemeAndStackFoundations:SF.2 | Bloch–Ogus/Gersten cohomology sheaves and operations; real closed semialgebraic and equivariant versions, support shifts and the acyclic regular-module pushforward |
| MC0-R4 | SchemeAndStackFoundations:SF.2 | Proper coherent Euler characteristic, field extension, flat-family constancy and the lower-support congruence |
| MC0-R5 | SchemeAndStackFoundations:SF.3, using JacobianChallenge | Divisibility of degree-zero zero-cycles via curves and Jacobian multiplication, without an Albanese isomorphism assertion |
| MC0-R6 | QuadraticFormInvariantsPartII:Q2.4 | Non-Pfister Laurent-valuation anisotropy adapter and the explicit Clifford index; Q2.2 already owns odd-degree anisotropy |
| MC0-R7 | SchemeKTheoryOperations:S.7 | Dimension-support-filtered coherent G₀ for arbitrary finite-type schemes, conversion to the codimension filtration where valid, and the integral quadric filtration/lift calculation |
| MC0-R8 | SchemeAndStackFoundations:SF.2, coordinating EDC.3 | Integral arithmetic Hochschild–Serre calculation and compatibility with the arithmetic cycle-class map |

The requests are recorded in the packet, not separate GitHub tickets. Existing
SF.5 Chow operations, adequate quotient categories, coherent dévissage, Picard
and curve theory are imported, not re-planned. In particular, the existing
codimension-filtered K-theory node is not silently applied to a possibly
nonequidimensional proper scheme; R7 supplies the dimension-filtration adapter.

Assembly should expose the early MC.2 Weil-data, classical-axiom, homological-
equivalence and geometric-base-change nodes before the MC.0 comparisons.
Their node prerequisites do not require MC.1. Realization functors on motives
remain after MC.1. A dependency on all of MC.2 here would create a spurious
whole-stage cycle. Two structure proposals in the packet record this order
and the grouping of correspondence, equivalence and integral-support tools.

## Baseline and current upstream checks

Actual declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The three baseline citations are
`AlgebraicGeometry.AlgebraicCycle`, its weighted-cycle `map`, and
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFiniteCodimensionOneCycles`.
They provide point cycles and the native divisor comparison, not Chow groups
or intersection theory. The reviewed SF.5 audit was read; no direct reviewed
MC.0 entry was found.

Current read-only Tau Ceti and Mathlib sources were also searched, at heads
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. AlgebraicVectorBundles and
JacobianChallenge were read as nearby current roadmap models and owners;
AlgebraicVectorBundles' Suggested file was checked. RealAlgebraicGeometry was
checked for the semialgebraic boundary: it explicitly excludes homology.
None supplies the missing Chow/cohomology-sheaf interfaces. The read-only
roadmap checkout lacks a SchemeAndStackFoundations directory despite the newer
upstream status register marking its package merged. Assembly must reconcile
the imported atlas supplier specifications with the merged upstream package,
without planning that package again. MC.0 and its K-theory/quadratic suppliers
are outside the cited 94-roadmap tier list; no invented tier order is claimed.

## Suggested file and checks

The Suggested file contains the standard note and `import Mathlib`. No new
headline here is easily statable on the pinned native carriers. All full
statements, API and tests therefore remain reader targets. This follows the
maintainer's **19 October 2026** instructions in `UPSTREAM_GUIDE.md`, which
supersede the issue's older prototype-every-signature wording. There are no
substitute Chow carriers, auxiliary developments, admitted data definitions
or admitted examples.

`lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.0.lean`
completed with exit code 0 and no warnings or errors in the shared pinned
build. Available memory was 75 GB before compilation; no library build or
language server was started. This checks the import-only file, not any of the
mathematical target statements.

`scripts/check_blueprint.py` with the pinned declaration index reports **zero
errors and zero warnings**. Source-issue schema and source-version checks,
target/API/test concordance, new-node dependency cycles, allowed-file inventory
and whitespace checks are recorded with the submission. Independent review
has not been performed by this worker.

## Sources and corrections

The packet and reader give version-specific theorem/section/page locators and
URLs for ten sources: Stacks, Milne, Achter–Casalaina-Martin–Vial on algebraic
equivalence, Benoist–Wittenberg I, Colliot-Thélène–Voisin, Kollár on ELW
indices, Karpenko, Roitman, Achter–Casalaina-Martin–Vial on diagonal
decompositions, and Jannsen. Karpenko's scanned pages were read visually.
Roitman's public publisher web rendering was read; no local PDF hash is
claimed. No private-library book was needed.

Six new version-scoped observations E48–E53 are recorded, in own words with
checks and correction searches: the CTV ambient-base misprint; the ACMV
projective-bundle range and dimension; the projective-space diagonal endpoint;
the effective-family projection sign; the scalar on the diagonal action; and
the unjustified cancellation in the arbitrary-coefficient strict-decomposition
remark. E53 includes an explicit characteristic-two coefficient counterexample.
All require independent review. The CTV journal copy could not be obtained;
E48 is restricted to the two preprints actually collated. ACMV algebraic-
equivalence findings were checked against publisher HTML and the current
author copy; diagonal findings against the publisher PDF and author copy.
Known whole-roadmap E3, E6, E10 and E11 are used rather than reissued.

## Inherited red-team items outside this layer

- **RT-AREA-iwasawa-3/8:** PS.2 owns localization at the Tate period; MC.5–MC.6
  supply the full category/torsor. It requires the effective-period ring,
  localization, evaluation of the inverse and the rank-one Tate test. None is
  a correspondence or cycle-equivalence target of MC.0. This job neither
  duplicates the period algebra nor claims that finding resolved.
- **RT-AREA-algebraicgeometry/31:** the comparison edges from
  ComplexComparisonPartII:C5 belong to SF.6 and MC.2 and are needed for their
  de Rham–Betti comparison consumers. The early MC.2 axioms imported here do
  not construct those comparison isomorphisms. The stage-edge/audit correction
  remains with those owners; no C5 theory is re-planned in MC.0.
- **RT-AREA-geomlanglands/17:** relative tensor reconstruction and the
  Deligne–Milne recognition criteria belong to the foundational owner selected
  for MC.6/GS4. MC.0 supplies correspondence categories, not reconstruction.
  The generalized reconstruction and GS4 imports require the MC.6/foundational
  follow-up; no field-only duplicate is introduced here.

These inherited items are accounted for as out of MC.0 scope, not silently
marked fixed. A reviewer can resume from the three gaps, the eight supplier
interfaces and the six source observations above; no disposable scratch file
is needed.
