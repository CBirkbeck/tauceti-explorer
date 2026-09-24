# REV-RT-AREA-representations-1 — verification of the red team on Representation theory, part 1 of 3

**All three findings confirmed. One severity change recommended: finding 3's LeLeHungLevinMorra half should be medium, not low, because it is an identity defect rather than a wording preference and severity decides whether a fix job is raised.**

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `RT-AREA-representations-1`, the red team on part 1 of the Representation theory area — `ReductiveGroupsPartII`, `SmoothRepresentationsOfLocalGroups`, and the Tau Ceti roadmaps `ReductiveGroups`, `RepresentationTheory`, `ClassicalGroups` and `RootSystems`, with the eleven roadmaps of the other two parts read for duplication. `cc-fb70e5` did not write it.

**Disclosure.** Findings 2 and 3 both touch `PAPER-LE-LEHUNG-LEVIN-ETAL-23`, to which this session contributed `proofSteps` for its Appendix A and Appendix B clusters (PRs #2538, #2565). Those passes created and modified no route, roadmap id or route title, and this job's exclusion list names only `RT-AREA-representations-1`, so I am eligible — but a verifier should say so rather than leave it to be noticed.

## Finding 1 — ClassicalGroups names the wrong owner. **Confirmed, medium.**

Read at the cited lines. ClassicalGroups README line 303:

> "equivalently, the specialization of the abstract Weyl dimension formula `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from [`../RootSystems`](../RootSystems/README.md)"

and lines 294–295:

> "The general Weyl character formula for `SLₙ`, `Spₙ`, `SOₙ` follows from [`../RootSystems`](../RootSystems/README.md)'s Weyl-group sum over the appropriate root system."

Against RootSystems' own scope boundary, lines 45–51:

> "The weight and root lattices, the coweight and coroot lattices, the fundamental weights, dominant integral weights, and `ρ` — **the lattice apparatus that the Weyl character and dimension formulas run on** — are **not** built here; they belong to [the highest-weight roadmap](../LieHighestWeight/README.md)"

The boundary names the Weyl character and dimension formulas *explicitly* as what the excluded apparatus runs on. So ClassicalGroups cites RootSystems for precisely the two things RootSystems disclaims, and a worker building Layers 4–5 would look there for `ρ` and not find it. **Medium is right**: this misdirects construction, not just reading.

The proposed fix is well judged and should be kept as written. The Layer 4 citation is *half* correct — the Weyl-group sum really is indexed by the root system's Weyl group, which RootSystems does own — and the fix splits the sentence on exactly that line rather than moving the whole citation.

## Finding 2 — two candidate Part II roadmaps for one direction. **Confirmed, medium.**

Every quantitative detail reproduces. Five extractions route to `RootSystemsPartIIDominanceAndDemazure` with exactly the counts given:

| paper | id | items |
|---|---|---|
| PAPER-HE-18 | `RootSystemsPartIIDominanceAndDemazure` | 21 |
| PAPER-HE-21 | `RootSystemsPartIIDominanceAndDemazure` | 28 |
| PAPER-KISIN-PAPPAS-ZHOU-26 | `RootSystemsPartIIDominanceAndDemazure` | 22 |
| PAPER-LE-LEHUNG-LEVIN-ETAL-23 | `RootSystemsPartIIDominanceAndDemazure` | 26 |
| PAPER-ZHU-17 | `RootSystemsPartIIDominanceAndDemazure` | 1 |
| **PAPER-KISIN-ZHOU-25** | **`RootSystemsDominancePartII`** | **8** |

The string `RootSystemsPartIIDominanceAndDemazure` **does not occur anywhere** in PAPER-KISIN-ZHOU-25's record, and its `coalescence` block is `null`. PAPER-KISIN-PAPPAS-ZHOU-26 does record the overlap, verbatim: "The Kisin–Zhou candidate RootSystemsDominancePartII overlaps this earlier direction: consolidate its dominant-coroot/Stembridge lane into this candidate at design intake".

That asymmetry is what makes this more than bookkeeping: the duplication is known in exactly one of six records and is **invisible from the KZ-25 side**, so a design job reading that extraction alone would build a second roadmap in a direction already planned — which §15 forbids. The proposed fix (consolidate onto the shared id, keep KZ-25's 8 item ids as KPZ-26 asks, record the identification on both sides) is the right shape.

## Finding 3 — Part II titles that are not exact prefix extensions. **Confirmed; severity should be split.**

The parent's atlas title is exactly `Root systems, Weyl groups, and the Cartan-Killing classification`, and §15 requires `"<existing roadmap>, Part II: <what it adds>", with the existing roadmap as its first prerequisite`. Four extractions title the shared candidate correctly as an exact prefix extension; **PAPER-LE-LEHUNG-LEVIN-ETAL-23** titles the *same id* "Root systems, Part II: dominance, affine orders and admissible pairs", and **PAPER-KISIN-ZHOU-25** titles its own id "Root systems, Part II: integral dominance steps". Both drop the rest of the parent's title.

**Recommended severity change.** The KZ-25 half is presentational, and if finding 2 is applied it disappears along with the separate id — low is right for it. The LLHLM-23 half is *not* presentational: it gives a second, different title to a roadmap id that four other extractions title correctly, so the atlas would carry one candidate roadmap under two names. That is an identity defect of the same kind as finding 2, and since severity decides whether a fix job is raised, this half deserves one. I recommend recording finding 3 at **medium for the LLHLM-23 title specifically**. The proposed rewrites are exactly right as stated.

## The negative results, checked rather than taken on trust

The `checked` list has 11 entries and several record leads investigated and dismissed with reasons, which is the discipline this format is for. I verified its two most load-bearing mechanical claims independently:

- **Stage inventory.** 41 stages across the six roadmaps, and the per-roadmap counts match one by one: ReductiveGroupsPartII 7, SmoothRepresentationsOfLocalGroups 11, ReductiveGroups 10, ClassicalGroups 7, RootSystems 6, RepresentationTheory 0.
- **Prerequisites.** The 25 `requires` edges from those 41 stages all resolve; **zero dangling**. And the whole-atlas `requires` graph is **acyclic** — I rebuilt it and confirmed no cycle over 1962 stages. The edge count reconciles exactly once the convention is clear: I count 3458 edges of which 76 are `UPSTREAM:` references outside the atlas, leaving the 3382 internal edges the red team reports.

I can also corroborate `checked` entry 6 from direct knowledge rather than inference: it says the ReductiveGroups Layer 7 / Part II overlap is already resolved by RS-31, and I red-teamed RS-31 in the previous job (PR #2614), where the owners table does reassign RG2.1's relative root systems and RG2.4's Bruhat/BN-pair theory to anchor Layer 7.

## The standard applied

The verifier of `RT-AUDIT-22` rejected that red team's single finding on the ground that the audit format already carried the information in another field — target `library=partial` plus reuse notes — so the finding abbreviated away requirements the format expressed. (That red team was mine, which is a reason to apply the standard here rather than a reason to soften it.) I put each of these three findings to the same test: is the truth already carried elsewhere in the data?

- Finding 1: no. The prose citation is the only statement of ownership, and it is wrong.
- Finding 2: only partly, and asymmetrically — KPZ-26 records the overlap, KZ-25's record does not, and `coalescence` is null. A consumer reading the offending record cannot recover it.
- Finding 3: no. Two titles for one id is not recoverable from any other field; it is the defect.

All three survive the test.
