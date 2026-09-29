# RT-RS-28: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3996, job FIX-RT-RS-28).
- Findings: `RT-RS-28.result.json`.
- Verdicts: `RT-RS-28.review.json`.
- Five findings. RT-RS-28/1 was rejected; /2–/5 were confirmed.

All changes are in `research/blueprint/restructure/RS-28.result.json` and `RS-28.md`. After them the JSON has 24 owners rows and 57 links (originally 24 and 59). `scripts/check_restructure.py` passes.

## RT-RS-28/1 (high, error; rejected): nothing beyond /2

The review rejects the claimed cycle: the stage graph stays acyclic, and mutual roadmap-level listings are common in the atlas. It notes that the substance, the link HL.3 → FA.4 and the ownership transfer behind it, is handled by RT-RS-28/2, whose fix removes the link and with it the mutual listing.

I made no separate change. After the /2 fix, FunctionFieldArithmetic is a prerequisite of HigherLocalFieldsAndHigherClassFieldTheory and not a consumer of it: checked by applying the fixed file, as below.

## RT-RS-28/2 (high, duplicate): RS-28 no longer moves mathematics out of FA.4

**Finding.** RS-28's family is HigherLocalFieldsAndHigherClassFieldTheory with the ClassFieldTheory anchor; FunctionFieldArithmetic is in neither. Even so, RS-28:
- listed FA.4 under `formerly` in owners rows 13–15;
- moved equal-characteristic p-primary local existence from FA.4 to HL.3 (row 16);
- added four links into FA.4.

Nothing narrows FA.4, so the mathematics had two owners. The pending RS-04, whose family does contain FunctionFieldArithmetic, assigns "Full equal-characteristic p-primary local and global function-field reciprocity" to FA.4.

**Changes.** This follows the finding and the review.
- **Owners.** Row 16 is removed. FA.4 is dropped from the `formerly` lists of rows 13–15, the finite local reciprocity, absolute local Artin map and CFT Layer 8 correspondence rows. HL.3 stays there, since HL.3's own narrowing does import those from CFT Layers 6–8. I read "keep rows 13–15 only as a record of overlap, without 'formerly'" as "without FA.4 in `formerly`". The FA.4 overlap is recorded in RS-28.md instead.
- **Links.** All four links into FA.4 are removed: HL.3 → FA.4, and CFT Layers 6, 7 and 8 → FA.4. They restructured a layer outside the family; whether FA.4 imports the anchor's local maps is for the family that contains FunctionFieldArithmetic.
- **Import.** HL.3 now imports the equal-characteristic p-primary existence, and the resulting injectivity/completion of the existing Artin map, from FA.4. This is done through a new link FA.4 → HL.3, FA.4 in HL.3's `suppliedBy`, and new wording in HL.3's `keeps` and `reason` and in the roadmap `reason`.
- **Link reasons.** The three CFT → HL.3 link reasons no longer call that existence "new" in HL.3.

**Check.** FA.4 → HL.3 closes no cycle: after the removals, the fixed file applies with no skipped link and an acyclic graph.

## RT-RS-28/3 (medium, duplicate): L.5 owns the logarithmic/DVR comparison

**Changes.** These are the red team's fix, as confirmed:
- a new owners row, {"Logarithmic/DVR de Rham–Witt comparison for complete discrete valuation fields", owner `KTheoryFiniteLocalFields:L.5`, formerly HL.2};
- L.5 added to HL.2's `suppliedBy`;
- a new link L.5 → HL.2 with that reason;
- HL.2's `keeps` now says that what stays local is the higher-field Artin–Schreier–Witt pairings and wild duality built on L.5's comparison and CR.4's complexes, not the comparison itself;
- the shared "Imported prerequisite" reason on the seven links into HL.2, and HL.2's `reason`, now name L.5.

## RT-RS-28/4 (medium, error): M.5d narrowed; Bloch–Gabber–Kato requested, not attributed

**Changes.**
- HL.2's `keeps` no longer builds on "the M.5d differential theorem". It uses M.5d only for what M.5d owns: the prime-power Bockstein induction and the filtered-colimit and inseparable/characteristic reductions.
- Owners row 12 (M.5d) is narrowed to exactly that, with an explicit note that the Bloch–Gabber–Kato differential theorem, which M.5d keeps separate, is not included.
- The link reasons into HL.2 are corrected to match.

**The missing theorem.** The residue-characteristic identification K^M_n(F)/p^r ≅ W_rΩ^n_{F,log} has no owner in the atlas. As the review notes, L.5's comparison is an input to it, not the same statement. So I did not attribute it to L.5. HL.2's `keeps` names it as an unowned import, which is neither proved in HL.2 nor taken from M.5d, and RS-28.md records the request.

**For the maintainer (request).** Assign the Bloch–Gabber–Kato theorem, in the generality HL.2 and HL.3 need, to the layer that is to own it. Either widen KTheoryFiniteLocalFields:L.5, whose de Rham–Witt comparison is its main input, or open a new layer. Then add that layer to HL.2's `suppliedBy` with a link. A restructuring result has no `requests` field, and L.5's packet is not a deliverable of this job, so the request is recorded here and in RS-28.md.

## RT-RS-28/5 (low, other): the base is the declared base

**Changes.**
- The roadmap `reason` now says that the base is recorded as the declared base (`extends`, with its declared roadmap edge), which is how the atlas carries section 15's first prerequisite, and that the build sorts prerequisite lists alphabetically.
- RS-28.md's "Put Class field theory first in its roadmap prerequisites" is replaced by the same statement.
- The phrase "extension title/first prerequisite" in RS-28.md's handoff now reads "extension title/declared base".

## Checks

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-28.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- The unit suite passes.
- Applying the fixed file read-only with the real `apply_restructurings` and `build.assemble(require_distances=False)`, alone and in place of the promoted copy among all promoted proposals:
  - RS-28 adds 56 of its 57 links (one already exists), with no skipped link, and its seven narrowings;
  - HL.3 → FA.4 is absent, and FA.4 → HL.3 and L.5 → HL.2 are present;
  - HigherLocalFieldsAndHigherClassFieldTheory is not a prerequisite of FunctionFieldArithmetic;
  - `extends` is ClassFieldTheory;
  - the stage graph is acyclic.
- With the promoted copy, the same run reproduces the red team's state: HL.3 → FA.4 present, and the two roadmaps each listed as the other's prerequisite.

**For the maintainer.**
1. `data/restructure/RS-28.result.json` still has the accepted file until the fixed one is promoted (after its next accepted review).
2. RS-04 has no review yet. When it is reviewed, check that its FA.4 ownership of the equal-characteristic p-primary local existence and HL.3's new import FA.4 → HL.3 agree, and that no FA.4-side link from the ClassFieldTheory local layers is lost that the function-field family wants.
