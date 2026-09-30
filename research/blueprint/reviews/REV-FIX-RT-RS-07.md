# REV-FIX-RT-RS-07

Independent review of FIX-RT-RS-07 (Claude Code, session `cc-39fac3`, issue #3994) for issue #5186.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-07 or its first review;
- the red team or its verification;
- the fix.

Disclosure: I reviewed the fix of the same mechanism in RS-15 (REV-FIX-RT-RS-15, #5187) earlier in this session. The
RS-07 edges, layer decisions and reproducer output below were checked here from scratch.

**Verdict: accepted.** No correction was needed.

**What I reviewed.** The file under review is `research/blueprint/restructure/RS-07.result.json`. I read:
- the finding (`RT-RS-07.result.json`), the verdict (`RT-RS-07.review.json`) and the fixer's report;
- the fix commit's diff, layer by layer and link by link;
- AN.3's stage text in `data/atlas.json`.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-07.result.json`: ok.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- I re-ran `apply_restructurings` in `scripts/restructure.py` read-only against `data/atlas.json`:

| RS-07 used | Links added | Skipped | Stage-to-stage skipped | AN.3 narrowed | AN.3 → SV.2 | SV.2 → AN.3 | Cycle |
|---|---|---|---|---|---|---|---|
| promoted copy, among all proposals | 29 | 17 | [SV.2, AN.3] | yes | present | absent | no |
| fixed file, among all proposals | 29 | 16 | none | no | present, with SV.2's `requires` | absent | no |
| fixed file alone | 31 | 16 | none | no | present | absent | no |

The first row reproduces the finding. With the fixed file, the 16 skipped entries are all `UPSTREAM:` library addresses,
which the verifier says are skipped by design. No link between two stages is skipped. That is the assertion the verifier
recommends, rather than "no skipped links".

## RT-RS-07/1 (medium, error): the AN.3 narrowing is withheld. Right.

The fix applies the verifier's instruction not to run a narrowing whose supplier edge cannot be applied, and it invents
no deletion key:
- **`layers[AN.3]`** is now `keep`, with no `keeps` or `suppliedBy`. Its reason:
  - explains the withheld narrowing and reverse link, and cites RT-RS-15/1 for the shared mechanism;
  - points to RS-07.md, which records the accepted entry and link;
  - keeps the obligations that do not depend on the deletion: AN.6's RH/GRH statement register (AN.6's drop still
    names AN.3 as a supplier), Perron inversion from ArithmeticDirichletSeries Layer 6, and Bombieri–Vinogradov with SV.3.
- **`layers[SV.2]`** keeps its narrowing. Its suppliers are library addresses, and its kept text (large-sieve
  inequalities and bilinear decompositions) does not rest on AN.3. Its reason no longer instructs a deletion the tool
  cannot perform: the old prerequisite stays and no reverse link is added.
- **The link SV.2 → AN.3** is removed. 57 links remain.
- **Unchanged:** owners (32), roadmaps, family, the other layer decisions and the review block.
- **The owners** agree with the withheld state:
  - large-sieve inequalities and Vaughan/Type I–II decompositions belong to SV.2, formerly ES.4, not AN.3;
  - zero counts, explicit formulas, zero density and the RH/GRH interface belong to AN.3, which is what AN.3's kept text
    plans;
  - Bombieri–Vinogradov belongs to SV.3.

## For the maintainer

The fixer's four points stand, shared with RS-15:
1. **Promotion.** `data/restructure/RS-07.result.json` still applies the partial narrowing until this file is promoted.
2. **Tool fix.** `apply_restructurings` should refuse a proposal's narrowings and drops when a link between two stages
   is skipped, and fail loudly. Skips of library addresses stay allowed.
3. **Integration.** Delete AN.3 → SV.2 and its mirrored entries in the same step that adds SV.2 → AN.3. Keep SV.1 → SV.2,
   AN.2 → AN.3 and the routes into SV.3. Then restore the recorded AN.3 narrowing from RS-07.md.
4. **Regression tests**, asserting that no stage-to-stage link is skipped.
