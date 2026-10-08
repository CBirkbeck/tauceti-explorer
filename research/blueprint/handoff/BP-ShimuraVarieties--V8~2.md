# BP-ShimuraVarieties--V8~2: completed revision

Issue: [#7011](https://github.com/CBirkbeck/tauceti-explorer/issues/7011).
Worker: Codex (GPT-6), session `codex-Fq5w0M`. Date: 2026-10-08.
Branch: `codex-Fq5w0M-shimura-v8`.

This round completes the requested reader synchronization with the independently
corrected packet. Packet status is `complete`; both `ShimuraVarieties:V8` and
`ShimuraVarieties:V8.general` are `planned`, neither is closed. Every node remains
`implementationStatus: unchecked`. The previous `review` object remains unchanged
with status `needs_changes`; only the next independent reviewer may replace it.

## What changed

The reader now includes all 26 retained node IDs, their statements, hypotheses,
proof outlines, prerequisites, source locators, acceptance checks and library
placements. It also includes all 16 construction API items, 15 unit-test contracts,
seven planets, 25 supplier requests, seven gaps, 12 baseline declarations and nine
independently confirmed source findings. The three reviewer-added nodes are
`zero-dimensional-shimura-variety`, `component-reciprocity` and
`codim-one-extension`. Their arguments and interfaces are now visible in the reader.

The introduction and ownership discussion now agree with the corrected mathematics:

- The determinant target is Milne's two-point-domain zero-dimensional Shimura
  variety, with canonical model `mu_N^prim`; the strict one-point torus datum has
  half as many points for N≥3. Component reciprocity supplies the arithmetic map.
- Datum maps descend over the source reflex field, because the target reflex field
  is contained in it. The historical suggested declaration name is retained.
- Level-map étaleness requires a neat target level. The effective degree at full
  level three is 24; the coarse j-map ramifies at the exceptional j-values.
- The genus-one Siegel/#81 comparison belongs to PELModuli M5. Gamma-zero at
  N=2 uses PR81 9D. Layer 10 covers prime N≥5 diamond quotients; it provides no
  separately certified full/composite compact comparison.
- Pink's arithmetic pure-data partial extension belongs to V8: use the product
  closure in the lifted case and a finite quotient in the non-lifted case. Its
  complex and auxiliary-class interfaces remain gaps. The old arithmetic
  torus-torsor gap and C2 restructuring proposal are superseded.

Two stale packet sentences were corrected without changing their mathematical
scope or node IDs: `level-tower` no longer claims that V1/D5 already constructs the
level category, and `general-tower` now explicitly uses the source reflex field.
The 12 baseline verification dates were updated after reading their exact pinned
Mathlib source statements. Suggested-file changes are comments only, clarifying
these corrections, the third construction, and the retained complex/log-section
gaps. All source-issue records and independent verdicts are unchanged. No source
excerpts were added; no `excerpt` field exists in the packet.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V8.json`:
  **0 errors, 0 warnings**.
- JSON parsing and a packet-to-reader agreement check: all node statements,
  hypotheses, proof steps, acceptance checks, prerequisites, API/test contracts,
  requests and gap details are present. Quotient backslashes are rendered as `∖`
  in Markdown to avoid punctuation escaping. All 26 node, 16 API and 15 test names
  match the suggested file; the original node IDs, review and source-issue objects
  were compared with the branch base and are preserved.
- `lean-check research/blueprint/suggested/ShimuraVarieties--V8.lean`:
  **exit 0; no errors; 56 warnings, all `declaration uses sorry`**. Memory available
  before the run was 112 GB. The shared build's Mathlib commit exactly matches
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. This file imports Mathlib only;
  elaboration does not validate a Tau Ceti implementation at its separate packet pin.
- `git diff --check`: clean. Only the four authorized deliverables are changed.

The file elaborates as the schematic forms permitted by PROTOCOL §13. Its theorem
forms omit conditions that cannot yet be expressed with supplier carriers, and are
not universal mathematical assertions about arbitrary schemes. Numeric examples
pin the values required of future tower/Hecke/component implementations; they do
not establish those values for the missing actual carriers.

## Sources and ownership checked

All four public PDF hashes reproduce the packet's hashes. This revision rechecked
Milne SVI pp.62–63, 65, 70–71, 74, 112, 114–115, 118–119, 125 and 127; MF pp.98
and 100; Pink 8.1–8.3, pp.131–133, and 12.3–12.12, pp.197–202; Deligne 5.1–5.6,
pp.153–156, including page images for pp.154–155. These include the reviewer’s
corrected locators and the three added-node arguments. The official SVI and Course
Notes errata and Jungin Lee's list were checked again. Earlier broader reading
records remain dated in the packet; no new broad reading is claimed.

The reviewed AUDIT-11, accepted RS-04 boundary, scoped stages and cross-part
references were read. Exact supplier statements checked include V0's component
nodes, V4's reflex-norm and finite-action interfaces, ShimuraData's datum/torus/GL2
nodes, AA.5's principal-level node, and ComplexComparisonPartII's analytification
and proper-morphism algebraicity nodes. The HodgeStructures and ReductiveGroups
upstream documents were read as complete style examples; the PR81 convention and
used Layers 0D, 5A–5B, 9D–9E and Layer-10 range were checked. No uncleared or
unavailable book was needed for this revision. Remaining mathematical inputs are
recorded as supplier requests and gaps, rather than missing source passages.

## What remains and where to resume

No stage is closed. The seven retained gaps are:

1. Complex Baily–Borel datum-morphism functoriality and the Pink 12.10
   codimension-one closed immersion/finite quotient.
2. The abelian auxiliary-data class for Pink 12.10, including its two-point-domain
   cases, or explicit strengthened actual auxiliary-model hypotheses.
3. Concrete canonical-model, comparison and reciprocity carriers for the Lean forms.
4. AA.5's exact integral principal-level representative/conjugation contract.
5. The compact-open level index category under V1.
6. V2's all-type partial-open/log-canonical section embedding interface from Pink 8.2.
7. Promotion of V4 reflex-norm functoriality to a lemma node with full-idelic
   field-change norm and geometric Artin restriction.

There are 25 exact stage/upstream requests; existing node-level prerequisites are
retained separately. R09.2/R09.3/R09.5, IG.2, R12.1–R12.6, R13.4a/b, PEL M3–M5,
C1, V1/V2/V4, ReductiveGroups Layer 7 and PR81 0D/5A/5B/9D/9E remain the owners.
V7's actual general canonical models are required by the general suffix, which
specializes V8 rather than introducing another functoriality proof.

The next action is an independent round-2 review, especially of reader agreement
and the three added nodes. If accepted, follow-up planning should refine the seven
exact interfaces and bind the suggested forms to real supplier declarations. The
packet's coverage records give the stage-specific remaining work. There is no
outstanding revision task requiring another claim in this run.

Counts: 13 theorem nodes, 3 constructions, 8 comparisons, 2 applications;
16 API items, 15 tests, 7 planets, 12 baseline declarations, 25 requests, 7 gaps.
