# Handoff: DESIGN-AnabelianGeometryAndNonabelianChabautyPartII

Refs #3475. Codex, session `codex-jKPUbp`, 19 October 2026.
Branch: `codex-jKPUbp-anabelian-period-maps`.
Submission: completed duplicate-scope disposition, held for the maintainer.

The issue's entire scope already belongs to `GaloisSectionsPadicPeriodMaps`,
fixed job `DESIGN-BETTS-STIX` (#952), independently accepted by
`REV-DESIGN-BETTS-STIX` (#953). The verified finding
`RT-PAPER-BETTS-STIX-25/1`, route 1 of the paper extraction, and the accepted
canonical packet's first restructuring proposal all explicitly ask for this
generated job to be retired. Creating a second plan would violate WORKERS
and PROTOCOL §15. No new mathematical direction was found in the brief.

The four named deliverables record that disposition and a complete crosswalk:
all 48 route-1 items map to 53 distinct existing nodes. Every reference has
its full owner id, owner layer and arXiv v1 theorem/definition/section and page
locator. The reader explains the four end targets and the scope restrictions.
The packet records the canonical packet hash and review provenance. Its
`status: complete` concerns the finished routing pass, with zero local stages,
nodes, API entries, tests, planets or baseline-declaration claims; it does
not assert completion of the canonical mathematics. No self-review was added.

The canonical packet is unchanged: 59 nodes, 125 API entries, 82 definition/
construction tests, 30 planets, 14 baseline declarations, 18 requests and four
gaps. Its p-adic Hodge supplier gap, model-free Lawrence–Venkatesh supplier
gap, LocalGaloisGroups catalogue gap and orbit-dimension supplier gap remain
open there. This disposition neither duplicates nor discharges them. Current
upstream LocalGaloisGroups Layer 7 and its Suggested statements at lines 2271
and 2296 were read, at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`: full local absolute Galois
finite generation is already planned. Current Tau Ceti's symplectic group
source and the reviewed library audit were also inspected. Upstream checkouts
were read only; no library or roadmap theory was replanned.

The public source read was Betts–Stix arXiv:2204.13674v1, not the Annals
revision. The packet lists the sections actually inspected and its SHA-256.
The remainder of the mathematical audit is attributed to the existing
independent review. No book, source passage or source file was added.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabautyPartII.json --json`:
  zero errors and warnings. With zero local stages, this is a structural
  check only; it cannot validate the custom routing crosswalk.
- A separate crosswalk audit checked exact equality with the extraction's
  48-item route, uniqueness of item ids, existence of all 53 owner nodes,
  correct owner-stage references and accepted canonical review status.
- `python3 research/blueprint/intake.py check-files` on the five deliverables:
  zero problems. JSON and local Markdown links were checked.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabautyPartII.lean`:
  exit 0, no warnings. This file is solely an ownership notice with no
  declarations; its elaboration is not a mathematical verification. Memory
  was checked first, with 86 GB available. No Lean server or Lake build ran.
- `git diff --check`: passed.

The PR is a draft because WORKERS leaves drafts to the maintainer and the
ordinary promotion path would otherwise install this empty duplicate as a
new roadmap. The explanatory `promotion.hold` packet field is not an
implemented intake safeguard. Do not merely mark the PR ready and let normal
promotion run.

The maintainer's remaining action is concrete: preserve
`GaloisSectionsPadicPeriodMaps:SPM.0`–`SPM.9` and its accepted files, fold
route 1 into fixed job `DESIGN-BETTS-STIX`, retire generated job
`DESIGN-AnabelianGeometryAndNonabelianChabautyPartII`, and dispose of these
duplicate-id placeholder files rather than promoting them. No mathematical
design work needs resuming under #3475. The maintainer may retain the
crosswalk as provenance, but must handle the queue/catalogue consequence
before merging or publishing this disposition. Workers do not change those
files, close issues or change labels manually.

All durable evidence is in these five files and the relative repository
references they name. Scratch material is disposable. This run claimed no
second job.
