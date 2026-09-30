# RT-RS-25 — independent red-team report

Agent: Codex, session `codex-a71f92`. Refs #4416. Read on 2026-09-30.

## Outcome and scope

Complete for the restructuring attack; **no actionable finding**. This is not a
certification that the retained mathematics is implemented or proof-decomposed.
The author was ChatGPT Pro `cg-6b83f1`; the independent reviewer was Claude Code
`cc-442dc5`. This session did neither job.

The operative target is the reviewed `RS-25.result.json`, not its earlier
24-owner/55-link report snapshot. The review added ModularCurves 0E to SF.1's
excluded construction classes and added its five import/forwarding links. I
checked the resulting **25 owners and 60 links**, all **13 member stages**, the
**three narrowings**, and all **14 family leads**. Both roadmap identities stay;
nothing is merged, extended or retired.

Input commit: `15a7adf64cd502872225d25c2db7b0d823cd887a`.
Target Git blob: `99442337c0c290d23cf89e9d27704036ba10a067`.
Review Git blob: `db019cc9cc27374398b19873fa4d7439aef4bb74`.
The full atlas blob is `37f2add06983c206067d1104e0f40a839cc3961a`;
reviewed coverage is `5e708cfc74a51b10e62149113872fe4e00eb5846`.
A refresh through `1823c502a4d131083effaca47c7c9cb04915a8ad` found no change
to the target/family/review, member and anchor documents, atlas, reviewed coverage
or applied restructuring inputs.

## Conservation of every member stage

The JSON companion contains individually indexed receipts for all 25 ownership
records and all 60 link pairs. The following records the semantic test, not merely
whether an action field exists.

| Stage | Action | Conservation and boundary checked |
| --- | --- | --- |
| R11.1 | keep | Local excellent-DVR existence and Dedekind gluing, all-smooth-test mapping property, finite type, uniqueness/homomorphisms, differential lattices and allowed unramified base change remain. SF.4 only imports them. |
| R11.2 | keep | General component/toric/abelian data and isogeny sequences remain. EC4 supplies equation filtration and algorithmic indices; identifying them with geometric components remains new work, including wild primes and rational versus geometric points. |
| R11.3 | keep | General abelian semistability, inertia criterion, Raynaud extension and lattice/polarization-sensitive formal or analytic uniformisation remain. Neither SR7 curve reduction nor EC4 point-level Tate uniformisation replaces them. |
| R11.4 | keep | Semistable Picard/generalized Jacobian, graph characters, monodromy and integral Neron-component comparisons remain. Smooth Jacobian D, SR1 nodal graphs and SR6 weighted numerical specialization are separate inputs, not identifications with the output. |
| R11.5 | keep | General NOS, isogeny invariance, good/semistable comparisons and local factors with monodromy remain. EC4 supplies the three elliptic NOS scopes; R01.3 conductors, R01.6 Tate modules, R06.6 p-adic comparison and EC8 semistable conductor compatibility are imported. |
| R11.6 | keep | Degeneracy-compatible character/monodromy exports, R25/R28 inputs and the R29 invariant dictionary remain. Existing equation invariants, differential lattices and regular-model geometry are compared, not redefined. |
| SF.0 | narrow | Relative Spec and general relative Proj, affine/twist/base-change compatibility and named-arrow tests remain. SR2 owns only its finitely generated graded-algebra construction; library schemes, modules and gluing are reused. |
| SF.1 | narrow | Retained effective object classes exclude both SR2 polarized etale descent and ModularCurves 0E classes. Quotients, diagonals, atlas independence and coarse/fine versus stack distinctions remain; no universal scheme effectivity or properness is inferred. |
| SF.2 | keep | Sites, coefficients, localization, base change and compact support remain, with CPC and etale-duality integration rather than a new six-operations owner. |
| SF.3 | keep | Smooth-curve divisors, Riemann-Roch, duality, genus, Picard/Jacobian and Abel-Jacobi integration remain, as do scalar extension and Tate/cohomology comparisons. Degenerate Picard/Neron theory is not substituted for the smooth input. |
| SF.4 | narrow | Infinitesimal lifting, obstructions, formal geometry/algebraization and source-scoped birational results remain. R11.1/R11.3 and SR7/8/9 supply distinct model/reduction outputs with their own extension and genus hypotheses. |
| SF.5 | keep | General Chow/Gysin/Chern, GRR, Hodge index, surface Riemann-Roch, adjunction and graph/diagonal route remain. SR4 arithmetic-surface intersection is an imported special case, not the whole theory. |
| SF.6 | keep | Cohomology-comparison maps and cycle/trace/pairing compatibility remain coefficient-, topology- and completion-sensitive consumer interfaces, not additional definitions of the source theories. |

All 14 generated family leads were checked against the actual texts. In
particular, leads 5 and 11 are not evidence that SF.3 independently constructs
degenerate Picard schemes; it integrates smooth theory. Leads 4 and 6 likewise
do not identify general abelian reduction with curve reduction, or numerical
Picard torsion with geometric representability. The proposal preserves these
differences instead of accepting the audit's overlap wording uncritically.

## Supplier attacks and counterexample boundaries

I read the full two member documents, their stage inventories, and the relevant
supplier contracts: EC4; the conductor paragraph of EC8; SR1/2/4/5/6/7/8/9;
Jacobian D/F; ModularCurves 0E; R01.3/R01.6.

- EC4 explicitly excludes Néron models. Its equation filtration, point index and
  algorithmic exponent cannot discharge R11.2's geometric comparison. It also
  distinguishes ordinary NOS, potential good reduction and the conditional
  finite-level criterion. R11.5 preserves those scopes and the separate general
  abelian theorem.
- EC4's Tate uniformisation is a compatible point-level statement in its stated
  complete-field range. R11.3 still has to construct the formal/analytic quotient
  and polarization/lattice data. A point bijection is not that construction.
- R01.3 retains Artin/Swan and wild elliptic comparison; EC8 reserves the
  semistable algorithmic–Artin bridge. Neither EC4's algorithm nor EC8's
  semistable statement is promoted to the full wild comparison.
- Jacobian D's smooth relative Picard sheaf, representability and base-point
  conventions do not already supply R11.4's semistable Picard/Néron comparison.
  SR1's nodal graph includes loops and multiple edges, unlike a simple
  intersection adjacency graph.
- SR7 gives nodal curve reduction after finite separable extension; its
  curve–Jacobian comparison has additional hypotheses and is not the premise of
  the curve-reduction proof. SR8's unpointed stable range and SR9's
  `2g - 2 + n > 0` range remain separate. No mutual whole-stage SR7/R11.3 edge appears.
- SF.0 retains the general graded quasi-coherent relative-Proj construction
  beyond SR2's finite-generated case. [Stacks 01NM](https://stacks.math.columbia.edu/tag/01NM),
  read 2026-09-30, constructs it by affine gluing with compatible twists; it does
  not make arbitrary such morphisms proper or every twist invertible.
- SF.1 explicitly imports both SR2 and ModularCurves 0E. The latter's cocycle,
  uniqueness, descended group-object and spreading-out requirements are not
  removed. [Stacks 0CCJ](https://stacks.math.columbia.edu/tag/0CCJ), read the same
  day, has a surjective finite locally free cover and specified projectivity or
  ampleness conditions; it is not unrestricted effectiveness of scheme descent.
  The review's corrected residual SF.1 scope does not claim that false theorem.

These checks found no supplier promoted beyond its contract. Retained exact
comparison theorems still need their source-to-Lean decomposition.

## Pinned libraries and numerical sanity check

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
I read `AlgebraicGeometry.Scheme` and `Scheme.Hom` in
`Mathlib/AlgebraicGeometry/Scheme.lean`, lines 35–95. SF.0's reuse direction
matches these existing carriers.

Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
I read the namespace/variables, `weightedIntersection`, `principalDivisors`,
`Pic`, `Coker`, `picToCoker` and `picToCoker_injective` in
`TauCeti/AlgebraicGeometry/Curves/StableReduction/Picard/Basic.lean`,
lines 70–230. These are constructions on a numerical type, with no model or
Picard-scheme representability hypothesis hidden in the variable context.

[Stacks 0C7H](https://stacks.math.columbia.edu/tag/0C7H) specifies the weighted
relations; [0CE7](https://stacks.math.columbia.edu/tag/0CE7) states the injection
into the unweighted cokernel (both read 2026-09-30). In the report's
`A=[[-2,2],[2,-2]]`, `w=(2,2)` example, each matrix has rank one.
The gcd of entries is 1 after weighting and 2 before weighting, giving
`Z` versus `Z ⊕ Z/2`. I recomputed those integer
invariants. The proposal therefore correctly refuses to equate the two groups.
This does not identify either one with a Néron component group.

I read all 13 current reviewed library-coverage entries. They are context, not
a new exhaustive declaration audit. In particular SF.6 is currently a
`process` verdict; the older report's aggregate seven-partly-built wording is
not used to promote its status. No global absence or new formalization claim is
made here.

## Consumers, neighboring owners and graph checks

Every direct consumer of a narrowed stage retains access:

| Interface | Suppliers | Recorded direct consumers |
| --- | --- | --- |
| SF.0 | SR2 | DY.0, HL.5, LD.6, RD.3, SF.1, TB.4 |
| SF.1 | SR2, ModularCurves 0E | DM.3, GS.0, LD.3, SF.2 |
| SF.4 | R11.1, R11.3, SR7, SR8, SR9 | DM.3, GS.0, SF.5, TB.2 |

I read all nine external consumer descriptions, including the function-field
scope of GS.0 and the semistable formal-model requirement of TB.2. There are
34 links whose reasons explicitly describe forwarding. They preserve a coarse
access interface, as both author and reviewer say; they are not evidence that
GS.0 uses every number-field Néron theorem or that a curve theorem alone constructs
a Berkovich skeleton. The retained SF dependencies are not removed.

Applied neighboring owner records agree: RS-08/18 retain general Chow/Chern/Gysin
in SF.5; RS-17 also retains its surface proof route and R11.4's geometric
degeneration machinery, while separating the upstream finite-level
H1/Jacobian comparison; RS-32 retains local Raynaud uniformisation in R11.3.
No conflicting reassignment appeared in the applied proposals.

Mechanical results at the input commit:

| Check | Result |
| --- | --- |
| Target `check_restructure.check` | no errors |
| Exact members/stages | 2 roadmaps, all 13 stages |
| Owners | 25 distinct target records; owner and former endpoints resolve |
| Links | 60 distinct non-self pairs; all endpoints resolve |
| Narrowed-interface supplier forwarding | no missing pair |
| Native edges + declared requires + RS-25 | 3,568 edges; no proposed edge has a return path |
| Plus 25 accepted link maps | 4,174 edges; no proposed edge has a return path |
| Plus 27 applied restructuring proposals | 7,007 edges; no proposed edge has a return path |
| Actual application after other accepted proposals | all 60 links apply; none skipped |
| Apply RS-25 alone | every original stage ID and dependency edge preserved |
| Upstream mutation | no upstream layer or roadmap change |
| Numerical weighted/unweighted example | rank-one invariant factors 1 and 2 |

For reproducibility, the graph test reads `data/atlas.json`,
`research/blueprint/links/*.json` with accepted review, and
`data/restructure/*.result.json` from the stated commit. Start with every native
`stageEdges` pair and every in-registry `requires` pair (prerequisite → stage);
add RS-25's edges, then the accepted link-map edges, then the applied proposal
edges. For each RS-25 edge `u → v`, breadth-first search from `v` for `u`.
No such path exists in any of the three unions. In a separate simulation run
`restructure.apply_restructurings(atlas, other_proposals + [RS25])` and inspect
RS-25's `skippedLinks`. Compare the original stage-ID and edge sets with applying
RS-25 alone to test preservation. This is a no-new-RS-25-cycle check, **not** a
claim that every unrelated atlas component is acyclic.

## Limits and handoff

No exhaustive BLR/Faltings–Chai proof transcription, general monodromy proof,
Raynaud algebraization proof or complete foundational blueprint was attempted.
The author explicitly leaves those proof leaves for the blueprint stage. A later
discovery that Néron smoothening needs a retained formal-geometry theorem should
be handled by theorem-level decomposition; it is not an existing return edge
demonstrated by this audit.

The review's other cautions remain relevant: use the correct function-field/
scheme comparison when integrating AlgebraicCurves; do not rebuild both immutable
upstream polarized-descent routes; refine broad forwarding to actual proof
inputs. None is evidence here of a target deleted or reassigned incorrectly by
the accepted decision.

Only this report and `RT-RS-25.result.json` are submitted. No accepted work,
library, upstream roadmap or atlas file is edited. No Lean file is required or
compiled; nothing is claimed formalized. The red-team checker and submission
file checks are run on these two deliverables before publication.
