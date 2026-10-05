# BP-ColemanIntegration handoff

Job #698; Codex session `codex-grgRy0`; 5 October 2026. Claim comment
5997745255 was confirmed by the bot in comment 5997747664. This submission
finishes the target-level planning pass required by PROTOCOL section 0.
The packet is `complete`, every stage is planned, and **no stage is closed**.
Every implementation status remains `unchecked`.

The deliverables are the [packet](../packets/ColemanIntegration.json),
[reader](../readmes/ColemanIntegration.md) and
[suggested signatures](../suggested/ColemanIntegration.lean).

## What is supplied

The packet has 177 nodes: 19 definitions, 11 constructions, 98 lemmas,
39 theorems and 10 comparisons. It has 257 API entries, 151 packet tests
(133 definition/construction tests), 111 typed examples, 22 planets and
123 pinned baseline references. Five gaps and twenty requests remain.

All 167 inherited node ids are retained. Of those node objects, 159 are
unchanged. Six connect or describe the completed scalar proof chain:
`coleman-pullback`, `special-unit-maps`,
`five-term-from-special-units`, `five-term-from-algebraic-special-units`,
`five-term-from-algebraic-constancy` and `five-term-relation`.
The two annulus-log nodes explicitly require a nonnegative inner radius;
their corresponding signatures exclude empty negative-radius annuli.
All inherited API entries, tests, planets, baseline records and 25 source
findings are preserved.

Ten nodes supply the missing scalar end comparison:

1. L1 `fractional-disc-composition`: coefficients of composition with
   u t/(1+b t), and an all-radius bound proving convergence on the whole
   open disc. Local analytic composition alone does not give this radius.
2. L1 `regular-image-end-pullback`: an additional source end mapping to an
   ordinary target disc uses its actual analytic series restricted to the
   source Laurent germ. This component map commutes with differentiation
   and participates in the same Taylor/Frobenius induction.
3. L1 `special-unit-local-charts`: all sixteen charts of the four argument
   maps at 0, 1, v and infinity, with coefficient signs, unit slopes,
   denominator bounds and inverse substitutions.
4. L2 `log-laurent-end-determination`: equality on an outer annulus determines
   functions with finite logarithmic degree and Laurent coefficients convergent
   at every punctured-disc radius. It uses logarithm transcendence and the
   already requested Laurent identity principle.
5. L2 `log-laurent-infinity-determination`: the same comparison in parameter 1/z.
6. L2 `five-term-defect-log-laurent`: the actual scalar defect has these
   whole-disc expansions at all four punctures, including ordinary-image ends.
7. L2 `five-term-defect-coleman`: the actual defect is the specified linear
   combination of literal pullbacks in the existing four-puncture Coleman
   algebra, with its actual ordinary values and end germs.
8. L2 `five-term-defect-coleman-constant`: zero differential gives one constant
   in every component by Coleman uniqueness.
9. L2 `five-term-algebraic-special-unit-constancy`: the end-germ comparisons
   identify that constant with actual values on every punctured disc. The
   first coordinate can be any admissible C_p point; only v is algebraic.
10. L2 `five-term-scalar-global`: the inherited geometric boundary sequence
    fixes the constant, then algebraic density and signed norm reduction give
    the scalar five-term theorem for every admissible pair and every branch.

The scalar statement introduces no projective carrier and uses no complex
cross-ratio theorem over C_p. The projective cyclic and Bloch conclusions
remain separate supplier comparisons in the parent target.

## Coverage and the stopping point

Each stage target has a node with prerequisites ending in the pinned baseline,
owned supplier nodes or requests, or the gaps below. Under section 0 this is
a completed planning pass; its open stages receive follow-up jobs after
independent review. This does not assert implementation or closure.

| Stage | Coverage | Targets represented | Remaining refinement |
| --- | --- | --- | --- |
| L0 | `source_decomposed` (planned) | Formal/analytic primitives, radius loss, disc uniqueness and its local-analytic counterexample, residues, annulus logarithms, branches and branch change | Laurent and dagger carriers remain owned supplier requests; continuation is supplied by L1 |
| L1 | `planned` | Good-reduction pairs, wide opens, cohomological/Frobenius data, word algebra, continuation, uniqueness, products, integration, lift independence and pullback; explicit three- and four-puncture models | General-curve de Rham comparison and nonfree-differential gluing gaps; rigid-cohomology suppliers |
| L2 | `planned` | Coleman polylogarithms and normalization, recursion/distribution/inversion/Frobenius relations, branch and coefficient compatibility, tame/p-power roots, norm/trace, complex comparison and scalar dilogarithm identities | Field-general projective/Bloch comparison; primary-source collation of Coleman 1982 |
| L3 | `planned` | Corrected positive-integer formula for every k and conductor case, k=1, complex formula, distribution/measure comparisons and independence, regularized smoothing, regulator interpretation and defined Beilinson proposition | Syntomic-regulator proof and coefficient-valued Artin L-functions |

The recorded correction to RJW Theorem 6.7 remains essential: the formula uses
the twist theta omega^(1-k) with RJW's definition of L_p. The uncorrected
stage text is preserved as a source finding and restructuring proposal; no
application or atlas data was edited.

## Exact follow-up work

1. **General-curve algebraic de Rham comparison.** Supply the comparison of
   the overconvergent complex with algebraic de Rham cohomology of an affine
   good-reduction curve, including the algebraic basis and dimension
   2g + number of geometric punctures - 1. It is needed by
   `L1/good-reduction-datum-exists`. Coordinate with the RD.4 owner;
   rigid finiteness alone does not provide the comparison.
2. **Nonfree differentials.** Extend the lift-independence and functoriality
   proof from a free differential coordinate to general good-reduction
   pairs by local-coordinate gluing. This does not block the explicit
   genus-zero scalar construction.
3. **Field-general projective and Bloch comparison.** Obtain the algebraic
   cross-ratio identities from `Polylogarithms:P.1`, with every denominator
   and infinity case, and prove the cyclic reformulation and pre-Bloch/Bloch
   boundary/branch descent over a subfield of C_p. Preserve that supplier's
   complex Bloch-Wigner theorem. The scalar theorem is already decomposed.
4. **Syntomic regulator proof.** Decompose Besser–de Jeu Theorem 1.10(2),
   including the multi-relative K-theory, localization, integration-down
   and Chern-class inputs of sections 3–7, or import the exact result from
   `PadicHodgeRegulators:D.2`. The existing L3 statements are precise targets
   with a recorded proof gap.
5. **Coefficient-valued Artin L-functions.** Assign the nonabelian
   coefficient-valued Artin L-function required by the defined Beilinson
   proposition to an owner. Existing Dirichlet L-functions suffice for its
   abelian application, but not this general proposition.

Twenty supplier requests are retained: two to
`LocallyAnalyticDistributions:L1`; the annulus foundations in
`PadicHodgeTheory:P7:annulus-foundations`; `AdicSpacesPartII:F1/R2`;
`PadicDifferentialEquationsAndRigidCohomology:RD.0/RD.4/RD.5/RD.6`;
`DirichletPadicLFunctions:L0/L1/L2/L3`;
`PadicMeasuresIwasawaAlgebras:L2/L3`; `PadicHodgeRegulators:D.2`;
`Polylogarithms:P.4`; `BorelRegulators:R.7`;
`AutomorphicPadicLFunctions:L3`; and `Polylogarithms:P.1`.
The existing annulus request now also names the end-determination consumer.
The packet records the exact statements and consuming node ids.

## Checks and compilation limits

`python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`
passes with **zero errors and zero warnings**: four stages planned and zero
closed. JSON validation, acyclicity, allowed-path/whitespace checks and
preservation checks pass. Every packet API/test name occurs as a signature
or explicit missing-carrier comment in the suggested file; every packet
test name is recorded in the reader. These are name/contract checks,
not proof verification. The inherited wrong-sign example checks the nonzero
scalar used by the packet coefficient calculation; it does not state that
bivariate coefficient computation itself.

**The full suggested file was not compiled.** Its `lean-check` attempt stops
at the missing cached `research.blueprint.suggested.DirichletPadicLFunctions--L1`
module. The obsolete umbrella import was repaired to that existing split
supplier. Its PMIA dependency and the three reached Tau Ceti imports also
lack cached modules. Their source bytes match the Tau Ceti pin, but the
shared checkout itself has a newer HEAD. No Tau Ceti, Mathlib or supplier
modules were built, and no Lake project, cache download or language server
was started.

A **Mathlib-only signature slice** passed `lean-check` with zero errors
and fourteen expected admitted-proof warnings. It contains the seven new
signatures and six examples verbatim, with the genuine existing ancestor
definitions, rather than replacement abstract predicates. Mathlib is at
`082e2d37e8b0463410cdb532e111cd43d5a66174`; this slice has no Tau Ceti imports.

To reproduce that slice, take the exact ancestors `IsLogBranch`,
`IsLogLaurentNear`, `IsLogLaurentAtInfty`, `InPolylogClass`,
`IsPolylogFamily`, `existsUnique_isPolylogFamily`, `padicPolylog`, `dilogD`
and `fiveTermDefect` from the suggested file, maintaining their namespace
and prime parameters. Append its entire `EndComparison` section. The
individual imports are `Mathlib.NumberTheory.Padics.Complex`,
`Mathlib.Analysis.Analytic.Composition`,
`Mathlib.Analysis.Analytic.Constructions`,
`Mathlib.Analysis.Analytic.OfScalars`,
`Mathlib.Analysis.Calculus.Deriv.Basic` and
`Mathlib.Analysis.SpecificLimits.Normed`. Open `Filter` and `Topology` and
retain the noncomputable section. This checks the new signatures without
claiming that the full file or the admitted proofs are checked.

A separate Mathlib-only slice of the five existing Abel/nested-disc controls
also passes with zero errors and six expected admitted-proof warnings. Its
ancestors are the same, plus the exact `polylogSer` definition. Test labels
were reconciled, the prime-5 instance input was made explicit, and the
degenerate composite example states both evaluations.

Three new Coleman component results are explicit comments because the
actual dagger/LocAn carrier and end realization are unavailable at the pin.
The packet and reader give their element and map contracts. No substitute
carrier or hypothesis asserting the desired conclusion was introduced.

Exact arithmetic controls pass **62,368 assertions**: 62,118 chart/norm
checks in 609 configurations and 250 independently computed composition
coefficient checks through degree 9. The chart controls use primes
3, 5, 7 and 11 and the unramified dyadic quadratic field with
zeta^2+zeta+1=0. They evaluate the actual rational maps, compare all sixteen
coordinates with u t/(1+b t), verify norm preservation and inverse
substitutions, and check regular target centres. The coefficient control
compares truncated direct polynomial substitution with the displayed
binomial formula, including u=0 and b=0. These finite checks support signs
and formulas; they do not prove analytic continuation.

## Sources and baseline

The recorded baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The two new Mathlib references
are `HasFPowerSeriesAt.comp` and `hasFPowerSeriesOnBall_inv_one_add`.
Their statements were read at the pin and the source bytes compared. The
composition theorem is used locally; the explicit coefficient estimate
provides the whole-disc radius.

Public PDFs freshly obtained and the following pages read on 5 October 2026:

| Source | Passages | SHA-256 |
| --- | --- | --- |
| [Furusho, p-adic multiple zeta values I, v2](https://arxiv.org/pdf/math/0304085v2) | pp.7–10: component rings, uniqueness, Proposition 2.5 functoriality, Proposition 2.11 whole-disc expansions | `fd2391bd4dbf328667f0fb1b46d979c4814892c2cd14051de8d674d4c5b9fb` |
| [Besser, Coleman integration using the Tannakian formalism, v1](https://arxiv.org/pdf/math/0011269v1) | pp.12–15: pullback, uniqueness and kernel of differentiation; corroboration, not a new Tannakian prerequisite | `35d1b109d891dea711d2b557c1e81f826d6da73498ee82c7732185283702e2b7` |
| [Besser, Heidelberg lectures](https://www.math.bgu.ac.il/~bessera/Heidelberg-lecture.pdf) | pp.17–18: Coleman constant principle | `cbb50a0514044e71926bfc83e2f514ae12eefd1dc3c590f7948a8d187fdf7c12` |
| [de Jeu, Functional equations of dilogarithms in one variable, v1](https://arxiv.org/pdf/2007.11014v1) | pp.6–7 and 14: scalar p-adic five-term normalization and discussion | `6d96d3d58d55e4c55506271e5cd0058b8ea8406995ca642febe868be87440b68` |

The chart computations, coefficient bound and end-determination adapters
are explicit deductions from those inputs, not theorems attributed verbatim
to these papers. No new source erratum is asserted. Inherited broader
source/numerical checks are preserved as provenance, not claimed as fresh
all-source verification. Coleman 1982 remains unread because no public
copy was available; its collation and the regulator proof remain recorded.

The roadmap's accepted library audit, owner stages, touching links and
overlaps were read before planning. The upstream models read were
AnalyticToricGeometry and ContourIntegration. No general analytic, Laurent,
scheme, projective or distribution carrier was replanned. Scratch papers,
logs and harnesses are disposable; the mathematical statements, supplier
contracts, check results and reproducibility inputs are all recorded here
or in the deliverables.
