# REV-RT-RS-07

Independent verification of the red-team findings `RT-RS-07` on the restructuring proposal
**RS-07: Analytic number theory and arithmetic statistics**. I did not write RS-07, its
review, or the red team.

One finding, medium severity. **Verdict: confirmed**, reproduced.

## The finding

> The accepted large-sieve/zero-density ownership reversal is not effective in the build.
> AN.3 is narrowed with SV.2 in `suppliedBy`, but SV.2 still requires AN.3 and the actual
> SV.2 → AN.3 supplier edge is absent.

## What I checked

**The proposal says what the finding says.** RS-07 narrows `AnalyticNumberTheory:AN.3` with
`SieveMethodsAndPrimePatterns:SV.2` among its `suppliedBy`. Its AN.3 reason reads "Remove
the old AN.3 -> SV.2 edge before adding SV.2 -> AN.3"; its SV.2 reason reads "Delete the old
requires AN.3: this foundational inequality stage does not depend on zero-density
estimates"; and its link `SV.2 → AN.3` carries "apply only after deleting the old reverse
AN.3 -> SV.2 edge".

**The live atlas has not had the reversal applied.** `SV.2.requires` still holds AN.3 and
`AN.3.consumers` still holds SV.2, while `SV.2 → AN.3` appears in neither `AN.3.requires`
nor `SV.2.consumers`.

**The reproducer reproduces, to the number.** Running `apply_restructurings` read-only
against `data/atlas.json`, with RS-07 alone and again with all promoted proposals:

```
links recorded : 31   (RS-07 alone)  /  29  (all promoted)
skippedLinks   : … ['SieveMethodsAndPrimePatterns:SV.2',
                    'AnalyticNumberTheory:AN.3'] …
AN.3 restructured: narrow, SV.2 in suppliedBy
old edge AN.3 -> SV.2 present: True
new edge SV.2 -> AN.3 present: False
SV.2 requires AN.3: True
```

Those are the report's own figures. The skip is the **cycle guard**, not the
unknown-endpoint branch, since both endpoints are real stages.

Medium is right: the accepted narrowing is in force while the supplier edge meant to replace
the removed dependency is dropped, so the graph that gets built is not the accepted one. The
fix is right too, including its refusal to fabricate stage nodes for `UPSTREAM:` addresses
and its warning that appending the reverse edge to the old graph does not implement the plan.

## Two additions for the fixer

**A caution about regression tests.** RS-07's `skippedLinks` has **seventeen** entries and
only one is the defect; the other sixteen are `UPSTREAM:` library addresses skipped by the
earlier branch because they are not atlas stages, which is by design. So a test asserting
that RS-07 skips *no* links would fail on correct behaviour. This differs from RS-15, whose
`skippedLinks` is the single cycle-guard entry — which is why the "no skipped links"
assertion proposed in that fix is right there and wrong here. The assertion that carries
across both is narrower:

> no link whose two endpoints are both stages may be skipped.

**On coordination**, which the finding already asks for and which I would put more strongly.
This is the second confirmed instance of one mechanism, and the mechanism is in the engine,
not in either proposal: `apply_restructurings` writes a proposal's layer actions before
processing its links and cannot undo them, so a proposal whose cycle-closing link is skipped
keeps a narrowing whose precondition was never applied. Fixing two edge ledgers by hand
leaves the next proposal to fail the same way. The engine should refuse to apply a
proposal's narrowings when a both-endpoints-are-stages link is skipped, and fail loudly.

## Disclosure

I verified `RT-RS-15/1` earlier in this session and confirmed it, reading
`scripts/restructure.py` and running the same reproducer there. That is a different
deliverable and I wrote neither red team — but this finding cites RS-15, and my reading of
the shared mechanism comes from that job, so a reader should know the two verifications are
**not independent as to the mechanism**. They are independent as to this instance: the
RS-07 decisions, edges and reproducer output above were checked here from scratch.

## What I did not do

No Lean was compiled; this finding is about graph integration and proposal text. I verified
the single finding and the claims it rests on, and did not re-audit RS-07's mathematics or
its other decisions.
