# RT-AREA-representations-1: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3983).
- Findings: `RT-AREA-representations-1.result.json`.
- Verdicts: `RT-AREA-representations-1.review.json`.
- Three findings, all confirmed.

**File edited:** `research/blueprint/papers/PAPER-KISIN-ZHOU-25.result.json` (/2), the one extraction this job may change. It keeps its original serialization and passes `scripts/check_paper.py`. The /3 title correction to `PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json` is not a deliverable of this job, so it is given below as an exact edit for the maintainer. Finding /1 names an upstream Tau Ceti roadmap document, `content/tau-ceti/RepresentationTheory/ClassicalGroups/README.md`. Under PROTOCOL.md §15 that document is not re-planned here, so /1 is a note for the Tau Ceti maintainer.

## /1 (medium, error): ClassicalGroups cites RootSystems for the Weyl character and dimension formulas

**Checked** at origin/main.
- **ClassicalGroups Layer 4, lines 293–295:** "The general Weyl character formula for `SLₙ`, `Spₙ`, `SOₙ` follows from [`../RootSystems`]'s Weyl-group sum over the appropriate root system."
- **ClassicalGroups Layer 5, lines 301–302:** "the specialization of the abstract Weyl dimension formula `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from [`../RootSystems`]".
- **RootSystems' scope boundary (lines 45–50)** excludes ρ and "the lattice apparatus that the Weyl character and dimension formulas run on", and sends it to LieHighestWeight. LieHighestWeight's Layer 6 (line 503) is "the Weyl character, dimension, and Kostant formulas".

The fix keeps RootSystems cited for what it owns, the Weyl group and the positive system. The companion fix for the RootSystems/LieHighestWeight lattice boundary is `RT-AREA-representations-3.fixes.md`.

**Note for the Tau Ceti maintainer: replacement wording** in `content/tau-ceti/RepresentationTheory/ClassicalGroups/README.md`.

- **Layer 4, lines 293–295.** Replace "The general Weyl character formula for `SLₙ`, `Spₙ`, `SOₙ` follows from [`../RootSystems`](../RootSystems/README.md)'s Weyl-group sum over the appropriate root system." with:

  > The general Weyl character formula for `SLₙ`, `Spₙ`, `SOₙ` is the specialization of the Weyl
  > character formula of [`../LieHighestWeight`](../LieHighestWeight/README.md) (Layer 6), which uses
  > `ρ`; its alternating sum is indexed by the Weyl group and positive roots of the appropriate root
  > system, supplied by [`../RootSystems`](../RootSystems/README.md).

- **Layer 5, lines 301–302.** Replace "(equivalently, the specialization of the abstract Weyl dimension formula `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from [`../RootSystems`](../RootSystems/README.md))" with:

  > (equivalently, the specialization of the abstract Weyl dimension formula
  > `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` of [`../LieHighestWeight`](../LieHighestWeight/README.md) (Layer 6),
  > whose product runs over the positive system of [`../RootSystems`](../RootSystems/README.md))

**Kept.** RootSystems' scope boundary is correct as written and is not widened to absorb ρ.

## /2 (medium, duplicate): Kisin–Zhou's dominance Part II coalesces with the shared candidate

**Checked.**
- **The shared candidate.** Five extractions route to `RootSystemsPartIIDominanceAndDemazure`: HE-18 (21 items), HE-21 (28), KISIN-PAPPAS-ZHOU-26 (22), LE-LEHUNG-LEVIN-ETAL-23 (26) and ZHU-17 (1).
- **Its canonical identity.** KISIN-PAPPAS-ZHOU-26 says it "continue[s] the candidate already proposed by PAPER-HE-21", so the identity comes from HE-21's route:
  - title "Root systems, Weyl groups, and the Cartan-Killing classification, Part II: dominant subtraction and Demazure reduction";
  - parent `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems`;
  - area `grouptheory`.
- **The duplicate.** PAPER-KISIN-ZHOU-25 routed 8 items (C03, C14–C19, C25) to a separate id, `RootSystemsDominancePartII`. Its record never named the shared candidate. KISIN-PAPPAS-ZHOU-26 already records the reciprocal note, asking to consolidate the Kisin–Zhou lane into the shared candidate.

**Change in `PAPER-KISIN-ZHOU-25.result.json`.**
- **The part-ii route** now targets `RootSystemsPartIIDominanceAndDemazure`, with the canonical title, parent and area.
- **Its brief** opens with a coalescence sentence: keep the shared identity, build one integral dominance order, add the dominant-coroot/Stembridge lane. The rest of the brief, stating that lane, is kept.
- **Its reason** says it coalesces rather than proposing a second Part II.
- **The 8 item ids are kept**, as KISIN-PAPPAS-ZHOU-26 asks.
- **The remaining nine mentions of the old id** now name the shared candidate. These are eight `owner` fields and route 6's import sentence ("Import the positive-coroot step from …").
- **A `coalescence` entry,** in the form PAPER-LIU-ETAL-22 uses, names the shared candidate with its HE-21 identity and records the former id and title.

**Kept.** The Kisin–Zhou review file (reviews are not edited by fixers). The reciprocal notes already in the other extractions.

**Note for the maintainer.** The records disagree on the candidate's `area`. HE-18, HE-21 and ZHU-17 say `grouptheory`; KISIN-PAPPAS-ZHOU-26 and LE-LEHUNG-LEVIN-ETAL-23 say `representations`. The coalesced Kisin–Zhou route follows the originator, HE-21. Choosing one area at design intake is outside these findings.

## /3 (low, error): the Part II titles use the parent's full title

**Checked.** PROTOCOL.md §15 requires "<existing roadmap>, Part II: …". The parent's atlas title is "Root systems, Weyl groups, and the Cartan-Killing classification". PAPER-LE-LEHUNG-LEVIN-ETAL-23 titled the shared id "Root systems, Part II: dominance, affine orders and admissible pairs", giving it a second name. The review recommends medium severity for this half.

**Change.** The Kisin–Zhou title ("Root systems, Part II: integral dominance steps") disappears with the consolidation in /2; that route now carries the shared title.

**Edit for the maintainer.** In `research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-23.result.json` (origin/main `59da8e9a`, line 25786), the Part II route with `"parent": "tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems"` and brief "Reuse RootSystemsPartIIDominanceAndDemazure, …":

```diff
-      "title": "Root systems, Part II: dominance, affine orders and admissible pairs",
+      "title": "Root systems, Weyl groups, and the Cartan-Killing classification, Part II: dominant subtraction and Demazure reduction",
```

That makes it identical to the four agreeing records, since one roadmap id carries one title. Nothing else in the route changes.

**Kept.** Everything else in both routes: items, briefs and reasons, apart from the /2 changes to Kisin–Zhou.
