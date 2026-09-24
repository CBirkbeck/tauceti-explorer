# RT-AREA-homologicalalgebra

Red team against the **Homological algebra** area: `EnhancedDerivedSheaves` (11 stages),
`DGAInfinity` (12), `GrothendieckEulerForms` (8), `ProfiniteCohomology` (14) and
`StablePeriodicCurved` (9) — 54 stages in all.

**No finding.** The two overlaps that looked like duplication are explicit imports, and the
recording mechanisms this area relies on all turn out to be in place.

## Disclosure

I red-teamed `AUDIT-23` earlier in this session, and that audit covers `ProfiniteCohomology`
and `StablePeriodicCurved` among its five roadmaps. That is a different deliverable — I wrote
neither the audit nor these roadmaps — so it is not a conflict the rules name. But a reader
should know that my familiarity with two of these five comes from that job, and that the
finding I raised there was about a stage of a *different* roadmap in the same audit.

## The two duplication candidates

**DGAInfinity Layer 10 against GrothendieckEulerForms.** Layer 10 is "K₀(Perf), Euler and
numerical forms"; the other roadmap's Layer 7 is "left and right numerical Grothendieck
groups". On the titles alone this is the same mathematics twice.

It is an import, and the roadmap says so. Layer 10 tells the worker to "compare this pairing
and `K₀(Perf A)` with the Cartan/Ext-Euler constructions of **the dependency roadmap**", and
to "Form the left and right numerical quotients by **the radicals from the dependency
roadmap**" — and the DGAInfinity document names it: "the [Grothendieck groups] roadmap
supplies ordinary exact and triangulated `K₀`".

**DGAInfinity's curved and Koszul material against StablePeriodicCurved Layers 5–6** (curved
DG algebras; derived categories of the second kind). Also coordination: the
StablePeriodicCurved link map records DGAInfinity Layers 0 and 1 as suppliers of its Layer 5,
and DGAInfinity Layer 5 as a supplier of its Layer 4.

## The recording, which is where a sister area failed

Prose coordination is worth nothing if nothing records it, so I checked the mechanisms.

**Twelve links have both endpoints inside this area** — four into DGAInfinity Layer 10 from
GrothendieckEulerForms Layers 2, 4, 5 and 7; one into Layer 11 from Layer 3; one into Layer
7 from Layer 2; and the StablePeriodicCurved links above. Link maps exist for
GrothendieckEulerForms, ProfiniteCohomology and StablePeriodicCurved.

**The two roadmaps without a link map are not thereby unrecorded.** DGAInfinity's relations
are carried by the other two packets. `EnhancedDerivedSheaves` is a *campaign* roadmap and
uses the campaign mechanism instead: all 11 stages populate `requires`, it carries **93**
stage edges, and its 28 consumers are recorded on both sides — 28 roadmaps name it as a
prerequisite, and its own `consumers` field lists 28.

**Nothing is misfiled as duplication.** The area's layers carry 21 `duplicates` entries and
**not one** has both endpoints inside the area. That is the right record: the within-area
relations are supplier and consumer, not layers stating the same target, and they are carried
as links.

## The rest

**Every reference resolves** — every roadmap-level prerequisite and every stage `requires`
entry — with two `UPSTREAM:` sentinels in `EnhancedDerivedSheaves:E0`, which is house
practice.

**Coverage is complete.** All 54 stages carry an entry in `data/library-coverage.json`, from
AUDIT-22 (EnhancedDerivedSheaves, DGAInfinity, GrothendieckEulerForms) and AUDIT-23
(ProfiniteCohomology, StablePeriodicCurved). Neither audit sits in `pendingReview`, so both
are merged.

## What I did not do

No Lean was compiled and nothing here is formalised. I read the five roadmaps for
coordination, recording, prerequisites and coverage. I did not re-audit AUDIT-22 or AUDIT-23,
and I did not re-derive the mathematics of the layers themselves.
