# REV-FIX-RT-RS-15

Independent review of FIX-RT-RS-15 (Claude Code, session `cc-39fac3`, issue #3995, PR #4459) for issue #5187.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-15 or its first review;
- the red team (Codex `codex-a71f92`) or its verification;
- the fix.

**Verdict: accepted, after one wording correction in place.**

**What I reviewed.** The file under review is `research/blueprint/restructure/RS-15.result.json`. I read:
- the finding (`RT-RS-15.result.json`), the verdict (`RT-RS-15.review.json`) and the fixer's report;
- the fix commit's diff, layer by layer and link by link;
- `apply_restructurings` in `scripts/restructure.py`, which has been unchanged since 21 September. It applies a
  proposal's layer actions before its links. It records a cycle-closing link in `skippedLinks` and does not roll back.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-15.result.json`: ok.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- I re-ran `apply_restructurings` read-only against `data/atlas.json`, with all 31 promoted proposals:

| RS-15 used | Links added | Skipped links | Narrowed layers | general-BC → VB4 | VB4 → general-BC | Cycle |
|---|---|---|---|---|---|---|
| promoted copy | 5 | [VB4, VB3:general-BC] | VB3:general-BC | present | absent | no |
| fixed file, in place of the promoted copy | 5 | none | none | present, with VB4's `requires` | absent | no |
| fixed file alone | 5 | none | none | present | absent | no |

The first row reproduces the finding: the narrowing is in force while its supplier link is dropped. The fixed file leaves
the atlas consistent. The layer keeps its full text, and its old prerequisite survives with its mirrored entries.

## RT-RS-15/1 (medium, error): the dependent narrowing is withheld. Right, with one wording correction.

The verifier confirmed the fix as written: until the edge replacement can be done atomically, "reject or defer the whole
dependent narrowing rather than silently accepting skipped supplier links", and "do not invent an ignored JSON deletion
key". The fix does exactly that:
- **`layers[VB3:general-BC]`** is now `keep`, with no `keeps` or `suppliedBy`. Its reason:
  - explains why the narrowing is withheld;
  - points to RS-15.md, which records the accepted `narrow` entry and link verbatim;
  - keeps the accepted corrections that do not depend on the deletion: BC([E_1 → E_0]) as degree-zero hypercohomology
    with E_1 in degree −1, tested on [0 → O(1)], [O(−1) → 0] and the zero complex, and FS II.3.1's "semistable of slope
    1/r".
- **The link VB4 → VB3:general-BC** is removed. Fourteen links remain. None is skipped, and none closes a cycle.
- **`layers[VB4]`'s reason** no longer instructs a deletion the tool cannot perform. It says that the old prerequisite
  stays and that the proposal adds no reverse link.
- **Unchanged:** the owners, the roadmap decisions, the family and the other links. No new field was added.

**Corrected in place.** VB4's reason still said "This is the unique owner of that application formerly repeated in
general-BC". While the general-BC narrowing is withheld, general-BC's unchanged text still states the FS II.2.19
nowhere-zero-section application, so that sentence did not describe the current state. It now reads: "In the accepted
target this is the unique owner …; while the general-BC narrowing is withheld (below), general-BC's unchanged text still
states it."

The two `owners` entries give VB3:projectivized-properness and VB4 the two packages, each "formerly general-BC". They
record the accepted target ownership, and the fixer's decision to keep them is defensible, since `restructure.py` never
applies `owners`. I left them as they are. They describe the state after the withheld integration, which RS-15.md
explains.

## For the maintainer

The fixer's four points stand. I checked the first by reproduction:
1. **Promotion.** The live `data/restructure/RS-15.result.json` still applies the partial integration until this file is
   promoted.
2. **Tool fix.** `apply_restructurings` should refuse to apply any narrowing or drop of a proposal with a skipped link,
   and fail loudly.
3. **Integration.** Delete VB3:general-BC → VB4 and its mirrored entries in the same step that adds VB4 → VB3:general-BC.
   Then restore the recorded narrowing from RS-15.md.
4. **Regression tests** of the real `apply_restructurings` and `assemble` paths.
