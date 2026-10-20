# BP-PadicHodgeRegulators~2 — revision round 2 (complete)

Refs #11092. Claude (Opus), session **claude-uCHvXm**, 20 October 2026. The claim
comment 6279309249 was confirmed by the claim bot. This run continues the two
checkpoints of codex-HNxLJr (#11111) and codex-428pHh (#11225), which stopped
because the review's requested repair seemed to need the two part packets,
which this job may not edit.

## What the review asked, and how this round answers it

REV-PadicHodgeRegulators (needs_changes) had one blocking finding. The root
packet imported the 131 nodes of the two accepted parts and carried 27
`targetCorrections` and two source aliases as an overlay. Neither
`merge_blueprints` nor promotion applies that overlay, so the reader (which
showed the corrected view) disagreed with the declarations the atlas merges.
The clearest example was L1/dual-exponential, which uses its pairings in reversed
order. The reviewer named two repairs: implement assembly in the scripts, or
migrate the corrections into the parts. Both lie outside this job's four
deliverables.

This round removes the overlay rather than implementing it. The root now makes
no claim that the merger does not carry out:

- **Canonical representation.** The declarations are the two parts exactly as
  they stand (hashes in `imports` unchanged) plus the root's one node; this is
  what `merge_blueprints` computes. `assembly` now states this policy and
  records the validation and the history of the blocker.
- **Corrections become requests owed by the parts.** `targetCorrections` is
  replaced by `partCorrectionRequests`: 26 records, one per corrected target,
  with the two good-wach-basis records merged in their original order. Each
  record names the owning part, a class, the problem, the corrected fields, the
  reason and `applied: false`. The classes are:
  - statement: L1/dual-exponential, whose pairings must be ordered as P_W, Q_W
    for W = V*(1);
  - ownership: L4/good-wach-basis, a generic existence theorem that PG.6 now
    owns, to become a comparison;
  - locator: LLZ2011 Corollary 1.12 is on p. 1107, not p. 1103;
  - proof-route: L2/fontaine-iwasawa-map has a stale PG.5 step;
  - attribution: the D.4 cubic example's recomputation;
  - link: D.3/residue-spanning → D.3/residue-dilogarithm-function;
  - exact supplier nodes: 20 records.

  Nine **wording** records list the rewordings of process words that the old
  reader had made silently. They are now shown openly; the mathematics is
  unchanged.
- **Reader = declarations.** All 132 target sections are re-rendered verbatim
  from the merged declarations. In the L3 part, source ids Berger2003 and
  RubinES are labelled Berger2003DM and Rubin2000, the root's ids for the same
  URLs; this is a display label only. Each owed correction appears directly
  after its target. A new section, "Corrections owed by the part packets",
  tables all 35 records. The status paragraphs now describe this representation
  instead of the blocker.
- **Gap.** The reviewer's gap "Unsupported root assembly drops mathematical
  corrections" is replaced by "Corrections owed by the accepted part packets".
  It names the six non-supplier defects and says who applies them.
- **Coverage.** All ten stages are `planned`, as at the reviewed pass. Each
  `remaining` list names its owed corrections. No stage is closed. Packet status
  is `complete`.
- **Kept.** The review object, all 132 node ids, the 21 mathematical/supplier
  gaps, the 32 requests, the 31 baseline declarations, the 26 source issues and
  all planets. E121's reason now points at the owed correction.

The reviewer's in-place corrections are kept: the LLZ p. 1107 page (now in the
locator record), E117's explanation, E118–E120 and the LocalGaloisGroups Layer 7
ownership note.

## What still has to happen, and who does it

The six non-supplier defects (statement, ownership, locator, proof-route, link,
attribution) and the 20 supplier refinements live in the parts. Only a fix of
`research/blueprint/packets/PadicHodgeRegulators--D.1.json` and `--L3.json`
can apply them, with that fix's own independent review so the parts are
promoted again. The corrected fields are ready to copy from
`partCorrectionRequests`. The earlier checkpoint showed that applying them
gives check-clean parts whose merge agrees with the corrected view. The queue
already holds red teams of both parts (RT-BP-PadicHodgeRegulators--D.1~2 and
--L3), and a FIX job scoped to the two part files would close this out. For the
maintainer: when that fix lands, delete the matching records here and the
"owed" blocks in the reader. Neither the parts' ids nor this packet's ids need
to change.

## Red-team handovers (unchanged dispositions, checked in the merged declarations)

- RT-AREA-iwasawa-1/19: Bloch–Kato input stays at SelmerIwasawaCohomology L4;
  nothing here makes generic Selmer L2 depend on period rings.
- RT-AREA-iwasawa-2/3: D.2/log-syntomic-complex, fontaine-messing-kato-period-map,
  small-twist-comparison and syntomic-exponential exist. They import CR.0/CR.2/CR.3/CR.5
  and CP.4, with the early classical CS.0–CS.3 producer kept as a request and
  restructure proposal.
- RT-AREA-ktheory-2/15: D.2/weight-two-dilogarithm-comparison depends on
  D.1/combined-dilogarithm, D.1/regulator-normalisation-dictionary and
  K3BlochGroups V.4/suslin-exact-sequence, so D.3/D.4 and HabiroNumberFields
  HB.7 inherit them.
- RT-AREA-ktheory-2/18: D.2/etale-regulator imports MotivicEtaleKTheory M.7
  (the M.7-only Soulé-class producer, request R1), not M.8; no cycle.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators.json`
  with the pinned declaration index: 0 errors, 0 warnings. Status complete, 10/10 stages planned, 31 baseline
  declarations.
- `merge_blueprints` on the live `data/atlas.json` with the three packets in
  `load_promoted` order gives 132 declarations: 16 definitions, 33
  constructions, 22 comparisons, 43 theorems, 17 lemmas and 1 application, with
  34 planets. Every reader target section contains its merged declaration's
  title, statement, hypotheses, API, tests, checks, proof steps, prerequisites
  and source locators verbatim. Every displayed planet's statement and kind
  equal its node's.
- Part hashes unchanged: D.1 `2f70c0c0…f22c`, L3 `cf912c4d…c9d7`.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators.lean`: exit 0
  with nine `sorry` warnings and nothing else. It was run twice, before and
  after replacing `import Mathlib` by seven individual Mathlib modules
  (PROTOCOL §13); 65 GiB was available. No declaration changed, and the file
  encodes no field that the owed corrections touch.
- Source re-read: LZ2014 arXiv:1108.5954v3 §2.4, p. 5 (same SHA-256 as the
  earlier receipt). Both pairings there are ordered with V first. This supports
  the ordered-pairing correction and E121; E121 still awaits an independent
  review, since this job recorded it. PG.6/wach-good-basis was read in the
  accepted PhiGammaModulesAndIwasawaCohomology packet: it supplies rational,
  analytic and integral good-basis existence, without prescribed reduction.
  All supplier node ids in the correction records exist.

No part packet, script, queue or atlas file was edited. No suspicious
instructions were met in issue comments or earlier pull requests.
