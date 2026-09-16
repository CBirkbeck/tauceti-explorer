# LINK-tauceti_TauCetiRoadmap_ClassFieldTheory: handoff (checkpoint)

**Status:** `partial` (checkpoint).
**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json`.

## Where the job stands

The catalogue-wide screen is finished:

- all 217 partner roadmaps have an `examined` entry: the 211 other atlas roadmaps and the six new roadmaps;
- the packet holds 98 links and 11 overlaps;
- `check_links.py` reports 0 errors and 0 warnings.

The status stays `partial` for one reason: an adversarial second reading of every link and overlap had not yet been
applied when this checkpoint was written.

If this note is still marked checkpoint, a later worker should do the following:

1. Re-read each link's two stages.
2. Drop any link whose match is only shared vocabulary.
3. Run the checker.
4. Set `status` to `complete`.
