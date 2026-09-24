# REV-RT-LINK-tauceti_TauCetiRoadmap_AdicSpaces

Independent verification of the red-team findings
`RT-LINK-tauceti_TauCetiRoadmap_AdicSpaces` on the link map for the Tau Ceti roadmap
**Foundations of adic spaces**. I did not write the link map, its review, or the red team.

One finding, of low severity. **Verdict: confirmed**, with one correction to its evidence
that a fixer needs.

## The finding

> 18 of the 90 evidence entries attribute their quote to a stageId when the quoted sentence
> is not in that stage's text … the links themselves are sound and the quotes do justify
> them; what is wrong is the provenance pointer.

## How I checked it

I did not take the red team's count. I re-classified all 90 evidence entries myself:
for each, whether the quote is verbatim in the description of the stage its `stageId`
names; failing that, whether it is verbatim in the target roadmap's record; failing that,
in the roadmap's document. Proposed roadmaps matter here — `SolidAnalyticRings` is defined
in `research/blueprint/roadmaps/`, not in the atlas extracts, and its stages are keyed by
`key` rather than `id`, so a check that reads only the atlas extracts reports five entries
as missing that are in fact present. They are present.

The result:

| | entries |
|---|---|
| verbatim in the cited stage | **72** |
| verbatim in the target roadmap's record, not the stage | **12** |
| verbatim in the roadmap's README only | **6** |
| not found anywhere | **0** |

The central claim is exactly right: 72 in the stage, 18 not, none fabricated or
paraphrased. The 12 links named in the finding's `where` field are exactly the ones
carrying those 18 entries.

I also re-checked the structural claims the finding rests against: all 33 link endpoints
resolve to stages that exist, there is no self-link, and all 8 overlaps resolve on both
sides. Nothing about the 33 link verdicts needs to change.

## Why confirmed

The value of a link map is that every edge can be checked at its evidence. A `stageId`
that does not contain its quote defeats that for 18 of 90 entries — a verifier who follows
the pointer will not find the sentence. It is small, it changes no edge, and low severity
is right; but it is a real defect in the deliverable's one job, and I would fix it.

The proposed fix is right. Of its three options the schema-preserving ones are preferable:
add the roadmap-level quote as a separate entry, or replace the quote with a sentence from
the cited stage's own description that carries the same force.

## The correction

**The split of the 18 is 12 / 6, not 16 / 2**, and the finding misidentifies where some
quotes live. A fixer should not work from the 16/2 figure.

Specifically, the sentence the finding quotes as

> 'This is a successor to AdicSpaces, not another construction of valuation spectra…' is
> the summary field of atlas/roadmaps/AdicSpacesPartII.json

is not the wording the link map cites. The link map's quote reads "This is a successor to
AdicSpaces, not another construction of valuations, Huber pairs, `Spa`, or the structure
sheaf." — the **README's** wording. The summary field's version of that sentence shares
its first 88 characters and then diverges. The finding appears to have matched on the
opening words. The same applies to two others it lists: "The principal categories are
analytic locally strongly noetherian adic spaces" (`AdicSpacesPartII:R0`) and "Cohomology
statements refer to the same structure sheaves as AdicSpaces." (`PerfectoidSpaces:P2`) are
README-only, which the finding does get right for the second.

The twelve that genuinely are in the roadmap record:

- `RelativeFarguesFontaine:RF0:integral-Y`, `:RF0:annuli` (×2), `:RF1` — "Dependencies:
  upstream AdicSpaces and LocalFieldsRamification;"
- `AdicEtaleGeometry:A0` (×2), `:A4` — "This component starts at the actual endpoint of
  AdicSpaces Layers 0–5."
- `PerfectoidSpaces:P1` (×2), `:P2` (×2) — "Its starting point is AdicSpaces, not a
  pre-existing tilting or almost-purity …"
- `ColemanIntegration:L1` — "AdicSpaces for rigid/adic analytic domains and gluing"

and the six that are README-only:

- `AdicSpacesPartII:F0` (×2), `:R2`, `:R3` — the "successor to AdicSpaces" sentence
- `AdicSpacesPartII:R0` — "The principal categories are analytic locally strongly
  noetherian adic spaces"
- `PerfectoidSpaces:P2` — "Cohomology statements refer to the same structure sheaves as
  AdicSpaces."

A fixer should re-point each entry at the location it is actually found in. None of this
affects the finding, its severity or its fix.

## What I did not do

No Lean was compiled; this finding turns on document text, not on declarations, so nothing
needed reading at the pinned commits. I verified the one finding and the structural claims
it depends on, not the red team's four clean attacks, which are not findings and are not
mine to adjudicate.
