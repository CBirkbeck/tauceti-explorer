# RT-PAPER-BENNETT-SIKSEK-20

Red team against the accepted extraction `PAPER-BENNETT-SIKSEK-20`, of

> Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and
> short character sums*, Annals of Mathematics 191 (2020), no. 2, 355–392, including §12
> (Granville addendum).

152 items — 129 missing, 12 planned, 11 library — routed by 12 routes, among them one new
roadmap (`ErdosProgressionPowers`, 80 items) and two Part II proposals.

Two findings, both low. The structure of the extraction held throughout.

## The source

Re-fetched from the Annals URL the record gives,
`https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf`, on
24 September 2026. SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`
— the recorded hash, reproduced exactly, over 39 pages. The PDF is not stamped, so that
means the same document.

## Findings

### 1. A misprint the extraction did not record — missing, low

`sourceIssues` is empty, and the source block says "Entire published paper read; sensitive
displays also inspected as page images." But on PDF page 10, whose running head is the
printed page number **364**, the proof of Lemma 4.1 reads:

> Suppose first that p divides precisely one such term, say p | n + id. … **If instead p
> divides divides precisely two terms**, say p | n + id and p | n + (i + p)d, then we
> choose …

The verb is doubled. It is in the published text, not an artefact of the text layer: the
surrounding sentence is otherwise clean, and the parallel clause three lines earlier has the
single verb. Scanning the whole paper for repeated words finds exactly one other pattern —
`log log`, 16 times, which is the iterated logarithm.

It affects nothing; the intended reading is fixed by that parallel clause. But §18 exists
for exactly this, and an unrecorded misprint is one the public errata register will not
carry. The fix is one `sourceIssues` entry, given in full in the result file. Its `known`
and `searched` fields need the fixer's own check for a published erratum — I did not search
for one and do not assert that none exists.

### 2. The verification miscounts its own items — error, low

`verification.routeAudit` opens "All 130 missing items routed once." The record has **129**
missing items. The routing itself is right — 129 missing items, 129 distinct routed ids, 129
route slots, so each is routed exactly once — so only the self-report is wrong. But it is
the sentence a reviewer checks the routing against. Change 130 to 129.

## What held

**Every citation.** All 33 declarations the items cite exist at the pinned commits. All 16
stage references of the 12 planned items resolve, including four Tau Ceti ModularForms and
EllipticCurves layers and the campaign stages R01.6, R19.1, R19.6, RP.4, DWP.1, BSD.0, CM.3,
AN.2 and R29.6.

**Routing.** 129 missing items, each routed exactly once; nothing not missing is routed; no
route repeats an id inside its own `items` array.

**The proposed roadmaps.** Both Part II titles are exact prefix extensions of their parents'
atlas titles — "Modularity and modular parametrisations of elliptic curves over Q, Part II:
effective residual comparisons" and "Elliptic curves, Part II: Legendre models, descent and
character interfaces" — and all three new roadmap ids are free. The new roadmap carries a
title, an area and a substantive brief.

**Coverage of the paper.** Of the 42 numbered labels the text mentions, 40 are carried by an
item. The two that are not are citations to other works — "a version of which first appeared
in the proof of Theorem 1.5 of [1]" and "From Proposition 5.25 of [19]" — so coverage is
complete.

**No duplication.** `ErdosProgressionPowers`, `EllipticModularityEffectiveComparisons` and
`EllipticLegendreCharacterInterfaces` are each proposed by this extraction alone, so no
coalescence is owed.

**A surface that looked like a finding and is not.** 26 of the missing items are definitions
or constructions and **none** carries an API list or unit tests — which, in an extraction I
had just red-teamed, they all did. Checked against the protocol rather than against habit:
§16's item schema is `id`, `kind`, `name`, `statement`, `locator`, `status`, `library`,
`planned`, `note`, and none of its rules asks for an API or tests. Those belong to blueprint
nodes under §§3–4 and 12. The absence is correct.

## What I did not do

No Lean was compiled and nothing here is formalised. The declarations were read at the
pinned commits; the paper was read for coverage, internal consistency and misprints, not
re-derived. I did not search for a published erratum to the paper, which finding 1's fix
flags as the fixer's step.
