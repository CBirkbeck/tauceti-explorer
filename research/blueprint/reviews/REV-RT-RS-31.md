# REV-RT-RS-31

Independent verification of the red-team findings `RT-RS-31` on the restructuring proposal
**RS-31: Reductive groups, building on Reductive algebraic groups**. I did not write RS-31,
its review, or the red team.

One finding, low severity. **Verdict: confirmed.**

## The finding

> The `formerly` field carries two different meanings in one table … A consumer computing
> what each layer lost from `owners[].formerly` would conclude that RG2.0 and RG2.3 are
> narrowed, contradicting their own `action` field.

## What I checked

I cross-tabulated the seven owner entries against the eight layer actions myself:

| owner entry | `formerly` | that layer's action |
|---|---|---|
| 1 relative root system and relative Weyl group | RG2.1 | narrow |
| 2 Bruhat decomposition and BN-pair/Tits systems | RG2.4 | narrow |
| 3 absolute based root datum with Galois action | RG2.5 | narrow |
| 4 pinned split integral group construction | RG2.5 | narrow |
| 5 group-scheme/functor-of-points dictionary | **RG2.0** | **keep** |
| 6 reductivity over a field | **RG2.3** | **keep** |
| 7 Deligne torus | ShimuraData:D1 | narrow |

So five entries across four layers use `formerly` to mean "moved out of", and two use it to
mean "used by". The overloading is real, and the consequence the finding names follows: a
consumer reading `owners[].formerly` as loss would wrongly narrow RG2.0 and RG2.3.

The supporting evidence is accurate as well. The narrowed layers carry `suppliedBy` and
`keeps`; RG2.0 and RG2.3 carry neither. Both of their reasons say they are *consuming* the
anchor's notions, not losing content — RG2.0: "Use the upstream functor-of-points/group-scheme
dictionary …"; RG2.3: "Use anchor group-scheme, quotient, unipotent-radical and reductivity
notions: a supplied predicate is not a construction or proof of reductivity of this
particular quotient."

## Why confirmed, and at low

The finding does not overclaim: it says the substance is right in both cases and no layer is
mis-scoped, only the encoding is ambiguous. That is what I found. Low is right, and the fix
is right and minimal — a `relation` field taking `moved-from`/`used-by`, or `usedBy` on
those two entries. As the finding observes, both target strings already say "used before
local topologization" and "used on a special-fiber quotient", so the intent is recoverable
from the prose and only the machine-readable half is missing. I would make that change.

## The clean attacks, re-run

Because they bear on the finding's context, I re-ran the three the report records as clean:

- All **37** links resolve at both endpoints.
- Every owner stage and every `formerly` stage resolves.
- The proposed title, "Reductive algebraic groups, Part II: local structure and arithmetic
  models", is an exact prefix extension of the anchor's atlas title "Reductive algebraic
  groups", so it obeys section 15 — and the report is right that this is a genuine
  improvement, since the atlas currently titles the roadmap "Reductive groups, Part II:
  local structure and arithmetic models", which is not the anchor's title.

## Disclosure

Not a conflict the rules name, but a reader should know it. In a separate job,
`RT-AREA-representations-1`, I relied on this proposal's owner entries **1 and 2** — the
relative root system and relative Weyl group, and Bruhat/BN-pair theory, both reassigned to
anchor Layer 7 — to *decline* reporting a duplication between ReductiveGroups Layer 7 and
ReductiveGroupsPartII. Those two entries are among the five this finding classifies as
genuine reassignments, correctly encoded. So the finding neither supports nor undermines
that judgement: it concerns entries 5 and 6, which I did not use.

## What I did not do

No Lean was compiled; this finding is about how a JSON table encodes a relation, and
nothing in it turns on a declaration. I verified the single finding and re-ran the report's
clean attacks, and I did not re-audit RS-31's mathematics.
