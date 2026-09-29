# RT-AREA-modeltheory: fixes

Fixer: Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #3970, job FIX-RT-AREA-modeltheory).
- Findings: `RT-AREA-modeltheory.result.json`.
- Verdicts: `RT-AREA-modeltheory.review.json`. Both findings were confirmed.

This job's only deliverable is this report. The stage text of LogicAndDefinabilityInNumberTheory (`content/campaign/LogicAndDefinabilityInNumberTheory/README.md`, mirrored in `data/atlas.json`) is therefore not edited here. Each fix below is an exact edit for the maintainer, checked at origin/main and at the pins (Mathlib 082e2d3).

## /1 (medium, error): LD.0–LD.2 name inputs from a roadmap that is not in the atlas: edit for the maintainer

**What the finding saw, and why.** The finding is right about the extracts but not about the cause.

`data/atlas.json` does contain FoundationsAndLibraryIntegration, with stages LI.0–LI.5. There LD.0, LD.1 and LD.2 have `requires` equal to their prose Inputs, and three stage edges LI.0 → LD.0, LI.4 → LD.1 and LI.2 → LD.2.

The roadmap was **retired on 16 September 2026** (`data/roadmap-retirements.json`, commit 0b702e14, "Retire the foundations roadmap and add a reviewed library audit"). The retirement reason reads:

> Not a mathematical roadmap … Its fifty links made 25 roadmaps depend on it artificially.

`scripts/retirements.py` removes a retired roadmap wherever the atlas is read. It drops its stages, and every `requires` entry and stage edge through them, "rather than rerouted". So the extracts in `research/blueprint/atlas/` show LD.0 with no prerequisites and LD.1–LD.2 with only their LD predecessors. This is the finding's second branch: the roadmap is deliberately outside the atlas.

The fix is therefore the one the finding gives for that branch. Rewrite the prose Inputs to name what owns the content. The retirement record's `coveredBy` lists the owners:
- the Mathlib library, for general algebra, analysis, measure theory and category theory;
- the Tau Ceti arithmetic roadmaps;
- PROTOCOL.md, for the pinning and axiom-check process.

**Edits for the maintainer** (README, LogicAndDefinabilityInNumberTheory):
- **LD.0, Inputs.** Replace `FoundationsAndLibraryIntegration:LI.0` with: "Mathlib's first-order model theory (`FirstOrder.Language`, 1,235 declarations in the pinned index), as library baseline; no stage prerequisite." LI.0 was the pinning and declaration-audit process, which PROTOCOL.md now owns. `requires` stays empty, which is then what the layer says.
- **LD.1, Inputs.** Replace `FoundationsAndLibraryIntegration:LI.4` with `tauceti:TauCetiRoadmap/LocalFieldsRamification` (layers 0–3: local fields, units and their filtration, unramified extensions and ramification). These are what henselianity, value and residue sorts, and angular components are built on. LI.4 only "integrated" the Tau Ceti arithmetic roadmaps, and the retirement record names them as its cover. Add the matching `requires` entry once the atlas is rebuilt; the link is acyclic, since Tau Ceti layers have no prerequisites in the atlas.
- **LD.2, Inputs.** Replace `FoundationsAndLibraryIntegration:LI.2` with: "Mathlib measure theory (Haar measure and integration) as library baseline". LI.2 was an audit of Mathlib's analysis, which the retirement record assigns to the library.

**Programme-level note.** The same prose appears across the atlas: the finding counts 41 citations of LI stages in 23 roadmaps. The retirement dropped their links but left the prose, so every such Inputs line now names a retired stage. One sweep should replace each by the retirement record's covering owner. It belongs to the atlas owner, not to this area.

## /2 (medium, error): LD.0 asks to construct ultraproducts and Łoś's theorem, which Mathlib has: edit for the maintainer

**Checked at the pin.** `Mathlib/ModelTheory/Ultraproducts.lean` (header "ultraproduct, Los's theorem", line 28) has these declarations, at the lines the finding gives:
- `FirstOrder.Language.Ultraproduct.setoidPrestructure` (line 49);
- the ultraproduct `L.Structure` instance `FirstOrder.Language.Ultraproduct.«structure»` (line 74);
- `funMap_cast` (77), `term_realize_cast` (82), `boundedFormula_realize_cast` (95) and `realize_formula_cast` (146);
- `sentence_realize` (154), which is Łoś's theorem.

**Edit for the maintainer** (README, LD.0, Construct and export). Replace "Construct ultraproducts and prove the needed Los transfer theorem;" with:

> Import Mathlib's ultraproduct construction and Łoś's theorem (`FirstOrder.Language.Ultraproduct.«structure»` and `FirstOrder.Language.Ultraproduct.sentence_realize`), and add only the transfer interface this roadmap needs on top of them;

LD.0 keeps what Mathlib does not supply, as the layer already names it:
- the ring and valued-field languages;
- the interpretation of arithmetic fields;
- the explicit elementary-extension and standard-part interface for nonstandard arithmetic.

When this layer is audited, its coverage should mark the ultraproduct target as built.
