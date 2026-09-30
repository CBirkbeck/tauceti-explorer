# RT-PAPER-HANSEN-26

Red team of the extraction PAPER-HANSEN-26: Hansen, *Excursion operators and the stable Bernstein
center*, Forum Math. Pi 14 (2026) e10. The red team is Claude Code, session `cc-c2c06b`,
30 September 2026, issue #4528. The extraction is by `cc-39fac3` and its review by `cc-fb70e5`.
I did neither.

**Result: 1 finding, low.**

## Finding

**1. Route 3 uses the parent roadmap's old title. (other, low)**
- Route 3 joins HKW22's Kottwitz Part II under the title "Hecke correspondences and local shtuka
  cohomology, Part II: …".
- The accepted RS-22 renamed the parent "Hecke correspondences on the Fargues–Fontaine curve and
  local shtuka cohomology" on 23 September, six days before this extraction. The atlas shows the new
  title, and §16 says a Part II's title begins with its parent's title.
- The review checked this for route 1 but not for route 3, whose title was copied from HKW22. HKW22
  was extracted before the rename.
- The problem is wider than this paper. All thirteen Part II routes to HeckeStacksAndLocalShtukas,
  in nine extractions, carry a pre-RS-22 prefix. VANHOFTEN-24 uses the still older "Hecke stacks and
  local shtukas".

**Fix.** Retitle route 3 and HKW22's route 1 together. Ask the maintainer to derive Part II title
prefixes from the parent's current title.

## What held

**Items and statuses.**
- The seven planned stage ids exist.
- SR.3, narrowed by RS-21 after the review, still keeps the Bernstein center and its action, so
  `bernstein-center` stays planned there.
- The libraries have nothing on Bernstein centers, orbital integrals, characters of p-adic groups,
  B(G) or excursion operators.

**Route 1 (StableCenter Part II).**
- Its title matches the parent's current title.
- FS21's review later routed Haines' stable-center conjecture to it, with the same id, title, parent
  and area, deferring to its brief. So the coalescence is consistent.

**Route 2 (characters Part II).**
- Its title and id match HKW22's route.
- Nothing in the atlas plans Kazhdan density, Harish-Chandra's local boundedness, the p-adic Weyl
  integration formula, the BDK constant term or Arthur's elliptic characters.
- The only overlap, ET.1's orbital integrals, is already imported by the brief.

**Duplication across extractions.** The hits in other extractions for excursion operators and
stable orbital integrals concern constructions that the ES, LP, GS and ET stages already plan. None
concerns stability of the Bernstein center.

**Source issues.** E1 and E2 are consistent with the corrected items.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HANSEN-26.result.json`: ok.
- No Lean was compiled.
