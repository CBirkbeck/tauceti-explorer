# REV-RT-AREA-representations-2

Independent verification of the red-team result `RT-AREA-representations-2` on part 2 of the
**Representation theory** area — `AdoIwasawa`, `CharacterTheory`, `InductionRestriction`,
`QuiverRepresentations`, `SchurWeyl`, `SemisimpleAlgebras`.

**The red team reports no findings**, so there is nothing to confirm or reject and
`RT-AREA-representations-2.review.json` carries an empty `findings` array.

A clean result is a claim like any other, so I tested its `checked` list rather than passing
it through. **Every claim I tested holds**, and two of its measurements I had already made
independently in other jobs, which is the strongest corroboration available here.

## Disclosure, which runs both ways

I red-teamed **part 1** of this area (`RT-AREA-representations-1`). And this red team's own
`checked` list records that its author verified that part-1 red team of mine. So the two of
us have each checked the other's work on adjacent parts of one area. Neither is a conflict
the rules name — every deliverable here has a different author from its checker — but a
reader should know the relationship rather than discover it.

## What I tested

**The census.** 10 + 10 + 10 + 7 + 10 + 8 = **55 stages**, exactly as claimed, and **all 55**
have empty `requires` *and* empty `consumers`.

**The atlas-wide calibration, which I had measured before.** The report says status
`unknown` covers 656 of 1962 stages and that 669 stages have empty `requires`. My own count,
made independently in two earlier jobs this session and re-run here: **1962 stages, 656
`unknown`, 1306 `needs_source_decomposition`, 669 empty `requires`**. Identical. That
calibration is what turns "this area records no dependency graph" from a finding into a
norm, and it is right.

**The comparison with part 1.** The report says part 1 records 25 `requires` edges across its
41 stages. I count **41 stages and 25 edges** — the edges spread over 17 stages, which is the
same fact counted two ways.

**The direction check**, which is the lead I most expected to survive and does not.
InductionRestriction, SchurWeyl and SemisimpleAlgebras each cite CharacterTheory in prose
without declaring it a prerequisite — three missing prerequisites, until one looks at
CharacterTheory, whose own `prerequisites` are exactly
`…/InductionRestriction`, `…/SchurWeyl`, `…/SemisimpleAlgebras`. The arrow points the other
way; those citations name a consumer.

**The numbering.** `SemisimpleAlgebras` does carry `layer-15-every-simple-module-is-a-…`
between layers 1 and 2 — the slug of Layer **1.5** — and `InductionRestriction` carries
`layer-3a-…` and `layer-3b-…`. Deliberate sub-numbering, as claimed.

**The library boundary**, which is the head that produced the sibling model-theory area's
sharpest finding. Mathlib's `Algebra/BrauerGroup/Defs.lean` opens with a `## TODOs` list
whose first item is "Prove that the Brauer group is an abelian group where multiplication is
defined as tensor product" — and `SemisimpleAlgebras` Layer 6, "the Brauer group and
splitting fields", plans "**The Brauer group as a group.**" So the roadmap plans precisely
what Mathlib records as not done: the opposite of the model-theory defect, and correctly so.

**The duplication figure**, with one honest discrepancy. The report gives the highest
cross-part roadmap overlap as 0.286, for AdoIwasawa against LieHighestWeight, below its 0.33
threshold. My own run ranks the same pair first and scores it **0.307**. The difference is
tokenisation — stop-word list and stemming — and the conclusion is unchanged: same pair,
same ordering, still below threshold. I record the divergence because a later reader
recomputing it should not think one of us wrong.

## Judgement

The clean result is earned. The `checked` list is specific enough to be falsifiable — it
names counts, thresholds, file paths and the direction of particular edges — and everything
I could test independently was true, including the two atlas-wide numbers I had arrived at
separately.

I have not re-red-teamed the area: I did not hunt for findings the red team missed, which is
not a verifier's job. What I can say is that its account of its own work is accurate wherever
I checked it, so the empty findings array is worth what it claims to be.

## What I did not do

No Lean was compiled. Mathlib was read at the pinned commit where a claim turned on it — the
BrauerGroup TODO list — and the atlas measurements were recomputed from the extracts.
