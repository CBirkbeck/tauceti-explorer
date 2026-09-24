# REV-RT-RS-15

Independent verification of the red-team findings `RT-RS-15` on the restructuring proposal
**RS-15: Isocrystals, Banach–Colmez spaces and B(G)**. I did not write RS-15, its review,
or the red team.

One finding, medium severity. **Verdict: confirmed**, reproduced end to end.

## The finding

> The accepted atomic prerequisite replacement has already been partially integrated. The
> build narrows `general-BC` and names `VB4` as its supplier, but retains
> `general-BC → VB4` and omits `VB4 → general-BC`.

## What I checked, and how

I re-derived each element rather than accept the report's.

**The proposal says what the finding says it says.** RS-15's `links[1]` is
`VectorBundlesAndIsocrystals:VB4 → VectorBundlesAndIsocrystals:VB3:general-BC`, and its
reason begins "ADD ONLY AFTER deleting general-BC -> VB4", ending "This is an atomic
replacement, not an additional edge in the unmodified graph." The layer
`VB3:general-BC` has `action: narrow` with
`suppliedBy: ["…VB3:projectivized-properness", "…VB4"]`.

**The promotion is byte-identical.** `research/blueprint/restructure/RS-15.result.json` and
`data/restructure/RS-15.result.json` both hash to
`7ead28fbb6636ace04c2cad7b3295c91206492024fe5585e41ca1cafdf61a582` — the hash the finding
gives.

**The mechanism is in the code.** In `scripts/restructure.py`, the layers loop writes
`stage["restructured"]`, with the narrowing and its suppliers, **before** the links loop
runs. Inside the links loop, `if reaches(target, source)` appends to
`record["skippedLinks"]` and `continue`s — with no rollback of the narrowing already
written. Nothing anywhere parses a deletion instruction out of a link's `reason`; the
reason is only stored as evidence.

**The reproducer reproduces.** Running `apply_restructurings` read-only against
`data/atlas.json`, with RS-15 alone and again with all 23 promoted proposals, gives the
same result both times:

```
links recorded : 5
skippedLinks   : [['VectorBundlesAndIsocrystals:VB4',
                   'VectorBundlesAndIsocrystals:VB3:general-BC']]
general-BC restructured: action=narrow, suppliedBy=[…projectivized-properness, …VB4]
old edge general-BC -> VB4 present: True
new edge VB4 -> general-BC present: False
```

**The live data agree.** In the atlas extract, `general-BC → VB4` is present as a stage
edge and mirrored in `VB4.requires` and `general-BC.consumers`, while `VB4 → general-BC`
appears in none of the three. `VB3:projectivized-properness → VB4` is retained, as the fix
requires it to be.

So the narrowing is in force while the precondition it was accepted on is not — exactly
the claim.

**The mathematics holds at its locator.** I fetched the Fargues–Scholze *Geometrization*
PDF from `https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf` on 24 September 2026
(SHA-256 begins `9ab9efbd`, 357 pages). The quoted sentence

> By Theorem II.2.19, the same is true in an open neighborhood, finishing the proof.

is on PDF page 76, whose first line is the printed number **76** — printed p. 76 as cited.
Its context is the end of a proof in II.3 invoking the relative Harder–Narasimhan result
II.2.19. That supports the direction of the required edge — VB4 supplying general-BC — and
so supports repair by **reversal** rather than by deleting the edge to satisfy the guard.

**The fix's counts check out.** `VectorBundlesAndIsocrystals` has 10 stages and
`BunGAndNewtonStrata` 7: the seventeen the regression list names.

## Why confirmed, at medium

The finding is careful about what it does *not* claim: there is no cycle in the resulting
graph, because the guard skips the necessary edge instead. What it does claim is that a
layer is narrowed to what it keeps while the supplier edge meant to replace the removed
dependency is silently dropped — so the live dependency data contradict the accepted
supplier contract. That changes what gets built, which is what medium is for, and I would
fix it.

The fix is right as written, including its refusal to invent a JSON deletion key the tool
ignores, and its instruction to defer the dependent narrowing until the replacement is
executable rather than silently accept skipped supplier links.

**One addition I would make to the fix.** The cheapest guard against recurrence is in the
tool, not in this proposal: since `apply_restructurings` applies a proposal's layer actions
before its links and cannot undo them, a proposal any of whose links were skipped should
not have its narrowings applied at all, and the run should fail loudly rather than record
`skippedLinks` and continue. That belongs in the fix job. As the finding says, the two-file
red-team scope does not authorize the integration edits, and this review does not make
them either.

## What I did not do

No Lean was compiled; this finding is about graph integration and document text, and the
one library claim in the red team's `checked` list (the pinned Mathlib `Isocrystal.lean`)
is not part of the finding, so I did not re-audit it. I verified the single finding and the
claims it rests on.
