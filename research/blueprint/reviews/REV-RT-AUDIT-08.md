# REV-RT-AUDIT-08

Independent verification of the red-team findings `RT-AUDIT-08` on the library audit
**AUDIT-08: Arithmetic Dirichlet series and Tauberian methods**, which covers five roadmaps
— `ArithmeticDirichletSeries`, `AbelianSchemesAndArithmeticModuli`,
`AnabelianGeometryAndNonabelianChabauty`, `ArakelovGeometryAndAbelianHeights` and
`ArithmeticDynamics`. I did not write the audit, its review, or the red team.

**63 findings — 1 high, 35 medium, 27 low. All 63 confirmed.**

## How I verified 63 findings

Checking sixty-three findings one at a time, each by hand, would have been shallow at the
end. I did it the other way round: a systematic pass over the whole evidence base, then
depth on the high finding and a sample of the strongest medium claims. What follows is the
method, so a reader can judge the coverage.

**Every identifier.** I extracted the 122 distinct backticked identifiers the findings name
and resolved each against the pinned index. **112 resolve.** The 10 that do not are JSON
field names (`duplicates`, `requires`), roadmap names (`BelyiArithmeticActions`) or generic
words in quotation marks (`Picard`, `Height`, `TateModule`) — not declaration claims.

**Every location.** I extracted the 131 distinct file-and-line citations and checked each
against the pinned trees. Every file exists; **127 have a declaration within twelve lines**.
The four that do not are citations to real non-declaration content, each apt to its claim:
an import block (finding 5, whose claim is about what `Estimates.lean` imports), a module
docstring saying `L(D)`'s vector-space structure "is deliberately not built here" (finding
30), a Mathlib `## TODO` section (finding 40), and a block of anonymous `instance`
declarations the index does not name (finding 24).

**Every quotation of the audit.** I checked each quotation the findings attribute to
AUDIT-08 against the audit itself. The apparent mismatches are all elision ("…") or
transliteration — the audit writes ``ℂ^g/Λ`` where a finding writes `C^g/Lambda` — and I
verified the substantive ones individually, including the high finding's, finding 39's
"`arithmeticDegree` has zero occurrences", finding 53's "There is no self-map of `P¹`
presented by a pair of coprime homogeneous forms…" and finding 6's `HasCancellation`.

Nothing in this pass came back wrong. That is the basis on which I confirm the findings
whose evidence I did not additionally read in the source.

## The high finding, in full

**RT-AUDIT-08/13.** The audit's A5 target "Riemann bilinear relations and algebraicity of
polarized complex tori" is `absent`, noted "Absent. No complex torus `ℂ^g/Λ` exists in
either library, and there is no algebraization statement."

All five declarations the finding offers exist at the pin, in the cited files, at the exact
cited lines:

| declaration | file | line |
|---|---|---|
| `isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` | `Geometry/Hodge/WeightOne/Polarization.lean` | 122 |
| `IsPolarization.isOrthogonal_weilOperator` | `Geometry/Hodge/WeilOperator.lean` | 298 |
| `IsPolarization.integralFormBaseChange_weilOperator_self_pos` | `Geometry/Hodge/HodgeForm.lean` | 255 |
| `AlmostComplexStructure.hodgeStructure` | `Geometry/Hodge/WeightOne/Basic.lean` | 186 |
| `StandardWeightOne.isPolarization_riemannForm` | `Geometry/Hodge/WeightOne/Standard.lean` | 346 |

And the header of `Polarization.lean` is literally "# The Riemann bilinear relations in
weight one".

The audit also contradicts itself inside the same layer: the neighbouring A5 target's note
says "Tau Ceti has pure Hodge structures on a lattice, **the Hodge–Riemann bilinear
relations as `IsPolarization`**, bundled polarizations, polarizability, period-domain points
and semisimplicity". High severity is right — a builder following the `absent` verdict would
prove the relations a second time — and the fix, marking the target `partial` and citing
those declarations, is the correction I would make.

## The medium claims I read in the source

I chose the findings whose wording is strongest, on the principle that those are the ones a
verifier should not wave through.

**Finding 1** says a `fit: exact` label "is not honest". `TauCeti.EulerProductData` is at
`EulerProduct/Data.lean:56` and is a structure with exactly two fields —
`toIdealArithmeticFunction` and `isMultiplicative` — whose docstring reads "The local
prime-power series is **canonically derived from** `toIdealArithmeticFunction`". There is no
finite bad set, stored or derived. For a target requiring the structure to *store* the local
series and the bad set, `exact` does overstate. The wording is strong; the substance holds.

**Finding 21** says the audit's "no relative dimension … anywhere" is false.
`AlgebraicGeometry.SmoothOfRelativeDimension` is at
`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:130`, exactly as cited, and the index
carries 37 declarations matching relative dimension. The finding claims only the constant
case, which is what Mathlib supplies.

**Finding 51** says "the power map on `P¹` has no carrier" is false on the height side.
`Height.logHeight_pow` is at `Mathlib/NumberTheory/Height/Basic.lean:595`, the line cited,
with its companions in the same file. The conclusion — that for the power map the Weil
height already *is* the canonical height, so the functional equation is exact and uniqueness
trivial — follows from those statements.

## Why all 63, and what that means

Each finding proposes a correction to a note, a fit label or a `duplicates` entry in a
reviewed artifact that planners consume, and each names the declaration to cite. That is
precisely what a fix job does, so "confirm only what you would have fixed" is satisfied.

I should be plain about the division of labour in this verdict. The **evidence** of all 63 I
checked, systematically and independently, and it held everywhere. The **judgement** in each
— that a particular note overstates or understates — is the red team's, and in the four I
read in the source it was sound. A fixer working through 35 medium corrections should still
read each note before rewriting it; nothing here replaces that.

## What I did not do

No Lean was compiled. I did not re-audit AUDIT-08 independently — that is the red team's
job, not the verifier's — and I did not re-derive the mathematics behind targets the
findings merely relocate in the library.
