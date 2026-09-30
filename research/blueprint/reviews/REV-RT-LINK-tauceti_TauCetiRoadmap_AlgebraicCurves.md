# Verification of the Algebraic Curves link-map findings

Codex — codex-5ebb6f · 30 September 2026 · issue #4341

Both findings are confirmed: the medium finding identifies four lost dependencies, and the low finding identifies two stale catalogue notes. The low finding’s promotion chronology is reversed and is corrected below. This verifies the two findings, not every unrelated link or mathematical proof in the roadmaps.

Input revision: `2dc706f064c28bb40328e5f3533d86b60dd33ed7`. The red team is Claude Code `cc-c2c06b`; the original link author is Claude Opus 5 and its reviewer is Codex `codex-c83e7a`. This session did none of those jobs. The bot confirmed winning claim comment 5911191343, and the whole issue was reread before verification.

## Finding 1: confirmed, medium

The exact four pairs are AC Layers 7,8,9,12 → ModularCurves Layer 10. The accepted AlgebraicCurves map places `AC-L28`–`AC-L31` in `alreadyRecorded`, referring to the ModularCurves map, while the accepted ModularCurves map lists those pairs in `review.removed` with the reason “Already in AlgebraicCurves packet.” The promoted maps’ `links` and `alreadyRecorded` arrays equal their corresponding research arrays. None of the four pairs appears in the other research-link, promoted-link, declaration-packet, decomposition or accepted-restructuring `links`/`deferredLinks` inputs that were searched.

ModularCurves’ actual consuming statement is [README lines2178–2187](https://github.com/CBirkbeck/tauceti-explorer/blob/2dc706f064c28bb40328e5f3533d86b60dd33ed7/content/tau-ceti/ModularCurves/README.md#L2178): it names the four suppliers and retains fibrewise constancy of Euler characteristics and assembly across characteristics as additional work. This is an explicit output/use match, not a connection inferred from shared vocabulary. Each of the eight quotations carried by the four records is a literal substring of its indicated source/consumer stage description.

The complete AC7/8/9/12 source contracts were reopened, together with standing hypotheses and the relevant MC10 ramification/covering/dependency paragraphs:

| Supplier | Actual consumed contract | Restriction retained |
|---|---|---|
| AC7 | Different divisor, Dedekind different theorem and Hurwitz genus formula | Finite separable extension; exact constants and correct degree bookkeeping; residue separability where needed for the tame equality |
| AC8 | Lower ramification groups and Hilbert’s different formula | Function-field place setting, residue-separability qualifications and lower numbering; no unrestricted upper-numbering or Hasse-Arf claim |
| AC9 | Kähler/Weil differential and canonical/different comparison | Separable generation and the perfect-field comparison scope; geometric fibres here have algebraically closed residue fields |
| AC12 | Point/place, divisor and cohomological dictionary | Apply on each eligible smooth proper geometrically connected component; no relative cohomology/base-change or χ-constancy conclusion |

The production assembler, run in memory at the input revision, gives 2840 stages and8007 distinct stage edges. All five endpoint stages exist. None of the four pairs is an edge, none of the four sources occurs in MC10’s `requires`, and no edge runs from any AlgebraicCurves stage into a ModularCurves stage. This independently reproduces the defect, rather than trusting `alreadyRecorded` as graph evidence.

The two review commits also support the race described by the red team: [c9da9073](https://github.com/CBirkbeck/tauceti-explorer/commit/c9da90736431adcf02e831a8c00a7dc356180191) records the AlgebraicCurves review at 16:28:55Z and [12bb58b6](https://github.com/CBirkbeck/tauceti-explorer/commit/12bb58b65a0a16d2df1de4b0b335bfdd86211bde) records the ModularCurves review at 16:29:02Z on 23 September 2026. Their JSON decisions, rather than the timestamps alone, establish reciprocal deletion.

The repair should restore these pairs once in AlgebraicCurves `links`, with their existing ids/evidence and conservative `inferred` confidence. The source README does not reciprocally name ModularCurves. Replace the deduplication rationale and `recordedIn` field with the actual supplied contracts and retain AC-L31’s χ-constancy limitation. Update current summary/coverage and annotate the superseded review decision without pretending it never happened. Leave the ModularCurves links unchanged. Normal independent review and promotion must make the repair live.

A scratch-only candidate with 50 links passes the actual `check_links.check` function against the current world and all other research maps: zero errors and zero warnings. Adding the four pairs in memory gives 8011 edges and remains acyclic. The topological check includes all 2891 graph vertices:2840 stages plus 51 existing `UPSTREAM:` references. A separate traversal from MC10 reaches none of the four suppliers. No authoritative link map or generated data was changed for these tests.

## Finding 2: confirmed, low, with corrected history

The two current `examined` notes deny an AlgebraicCurves output. Both accepted restructurings and the assembled graph contradict them:

| Current examined neighbour | Accepted record | Live supplier → consumer |
|---|---|---|
| InverseGaloisAndArithmeticFundamentalGroups | `data/restructure/RS-29.result.json`, IG.1 narrowing, owners and links | AC8 → IG.1 |
| KTheoryLowDegrees | `data/restructure/RS-18.result.json`, Z.5 narrowing, owners and links | AC12 → Z.5 and inherited AC12 → Z.6 |

The relevant narrowing records, ownership records and edge reasons were read directly. All three pairs appear in `stageEdges` and in their consumers’ `requires`. The IG.1 and Z.5/Z.6 consumer contracts were also reopened. The suppliers remain scoped: AC8 does not prove the full scheme arithmetic exact sequence/specialization theorem; AC12 does not discharge a dictionary for every nonproper or arithmetic regular curve. RS-18 retains those general-curve obligations, and the Z.6 edge preserves the inherited supplier rather than assigning Z.6 a second general dictionary construction.

Change each examined result to `links`, naming the restructuring record and these exact pairs. Do not append them to the focal `links` array: they are already emitted and live. An optional `alreadyRecorded` entry must point to the corresponding accepted restructuring, not to the other link map. Low severity is appropriate because only the catalogue ledger is incorrect.

The red team has interchanged the two promotion histories. GitHub’s file-specific commit history and the added-file diffs show:

- RS-29 was added by [5fa556a0](https://github.com/CBirkbeck/tauceti-explorer/commit/5fa556a07b1b8cd81cf3a64a2e67360a684defcb), **21 September 2026 at 17:39:17Z**, before the AlgebraicCurves review.
- RS-18 was added by [82fcae63](https://github.com/CBirkbeck/tauceti-explorer/commit/82fcae63272ee0cb44947b1f5de2622702e76d0b), **23 September 2026 at 20:22:24Z**, after that review.

This reverses the finding’s assertions about which contradiction already existed at review time. It does not change the current stale-note defect or the recommended correction. The verification’s reason records the accurate chronology explicitly.

## Validation and reading boundary

Both existing link maps pass `scripts/check_links.py` with zero errors and warnings. The scratch hypothetical repair passes the same checker and both graph tests. The verification JSON passes `scripts/check_redteam.py`; its two authorized deliverables pass intake file checks and staged whitespace validation.

Sources read on 30 September 2026 are the repository roadmap texts, map/review/restructuring records and the GitHub commit history linked above. No external textbook proof, library implementation claim or full catalogue closure is certified. Neither finding cites a Lean declaration as its evidence, so no unrelated pin declaration is asserted verified. The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This is report-only work: no Lean file is required or compiled, and only the two verification deliverables are changed.
