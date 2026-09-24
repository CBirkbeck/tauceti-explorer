# REV-PAPER-LIU-ETAL-22

Independent review of the extraction of Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen
Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Inventiones mathematicae
**228** (2022), 107–375 (doi 10.1007/s00222-021-01088-4; arXiv 1912.11942).

Issue [#1281](https://github.com/CBirkbeck/tauceti-explorer/issues/1281). Reviewer: Claude Code,
session cc-d67081, 24 September 2026.

**Verdict: accept.** All twenty-one routes accepted. All 126 findings confirmed. Two Part II titles
and three duplicate entries corrected in place.

This is the largest extraction in the corpus — **739 items, 21 routes and 126 recorded mistakes** for
a 269-page paper — so this report is explicit about what was checked and how deeply.

## The source

The published text was re-fetched from the NSF public-access mirror the source block names and hashed
to `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`: **269 pages, printed page =
PDF page + 106**, pp. 107–375, matching the journal pagination. That mirror serves the published
article itself, so unlike the Springer-hosted papers reviewed yesterday the text could be read
directly rather than through a proxy.

## Mistakes: all 126 located and confirmed

Every finding was checked at its recorded page — **99 by an automatic prose match** against that
page, and the remaining **27 by hand**, their quotations being displayed formulas that no prose
matcher can find. **Not one locator was wrong**, which for 126 findings spread over 269 pages is
itself worth recording.

### Eight of the twenty-nine substantive findings examined in depth

Five I re-derived independently:

- **E2.** Over `O_λ/λ^n` with `n ≥ 2`, `A = [[λ,1],[0,λ]]` has image of index `|k|²` while its
  coordinate projections have indices `1` and `|k|`; right multiplication by a change of basis
  preserves the image, so no basis diagonalises it. "The first part is obvious from Definition 2.6.5"
  does not follow, and the extraction is right to have promoted this from a gap to an error in the
  stated first part of Proposition 2.6.7.
- **E4.** Condition (a) of `(GI¹_{F′,𝒫})` requires `𝒫(ξ)` invertible in `O_λ/λ`, unsatisfiable for
  `𝒫 = 0`; the proof's "such pair (a, b) always exists for sufficiently large ℓ" is where it breaks.
  The paper's only application is `𝒫 = T² − 1`.
- **E8.** The proof has just established that `G` acts **trivially**, and for a procyclic group with
  trivial action `H¹_cont(Ẑ, M) ≅ M`; so the asserted vanishing is equivalent to the module
  vanishing, and the invertibility of `p² − 1` is irrelevant. What survives is the injection
  `F_{−1}H¹ ↪ H¹_sing`, which is all the later uses need.
- **E10.** At `N = 2` the space `Iso(Λ̄₂)` is `q + 1` points, so `H² = 0` and the printed kernel of
  `∪c₁` is all of `H⁰` — a permutation representation `𝟙 ⊕ St`, not irreducible. The paper's own
  formula (C.1) gives `St` of degree `q`, pointing the same way.
- **E13.** Torsion-free `O_λ[Γ]`-modules with isomorphic rationalisations need not be isomorphic
  (`Γ = ℤ` acting by `(1 1; 0 1)` and `(1 λ; 0 1)`), and the integral statement is what the later use
  needs.

For **E1**, **E3** and **E9** I verified the printed statements, the quoted steps and the shape of
the repairs, but did not re-derive the Kummer-class computation over `ℚ(√5)(i)` (E1) or the
verification that the Shimura link fibres carry the added descent hypothesis (E9). The extraction
records both as re-derived on page images; those verdicts say which part rests on its work rather
than mine.

### The record itself is of unusual quality

Every `printed` field is a real quotation (median 158 characters), the classifications are honest —
97 of 126 affect nothing and genuinely do not — and several entries carry the extraction's own
revisions on re-checking, including two promoted from gap to error (E2, E8) and one whose locator was
relabelled (E10). That is what a reviewable record looks like.

## Corrected in place

**Two Part II titles** were not exact prefix extensions of their parents' atlas titles, as
PROTOCOL §15 requires:

| roadmap | as recorded | corrected to |
|---------|-------------|--------------|
| `SemistablePotentialMaps` | "**Lefschetz pencils and vanishing cycles**, Part II: …" | "Lefschetz pencils, **nearby cycles and** vanishing cycles, Part II: …" |
| `ArithmeticLevelRaisingAndBipartiteEulerSystems` | "**Selmer and Iwasawa cohomology**, Part II: …" | "**Selmer groups, continuous integral cohomology, and Iwasawa cohomology**, Part II: …" |

Neither roadmap is proposed by any other extraction, so no coalescence with another paper is
disturbed. The second one's identity in the `coalescence` block carried the same shortened title,
sourced from **this paper's own earlier checkpoint (PR #2181)**, and was updated with it. The
corrected form also matches what `PAPER-DISEGNI-LIU-24` uses for the same parent — reviewed by this
session today — so the two Part IIs of that roadmap are now named consistently.

Separately, **three item ids appeared twice inside a single route's `items` array** and were
de-duplicated. No item gained or lost a route, and every missing item is still routed exactly once.

## Items, statuses, routes

**739 items: 12 library, 32 planned, 695 missing.** Every missing item is routed exactly once and all
dependencies resolve. Every stage id cited by the 21 routes, and all 27 planned targets, exist in the
atlas index.

Twenty-one routes, all accepted: fifteen source routes, five Part IIs and one new roadmap,
`GanGrossPrasadConjecturesForClassicalGroups`, whose identity the `coalescence` block records for
other extractions to join — the right way to manage a roadmap this central, since relevant pairs,
Vogan packets, Bessel models and periods are what several papers in the corpus will need.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
