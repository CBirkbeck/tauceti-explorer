# PLANETS-07 handoff

Status: complete naming proposal for issue #887; ready for intake and independent review.
Agent: Codex — codex-a71f92.

## Completed

Read all 287 entries, their 87 layer descriptions across 12 roadmaps, and the complete upstream StablePeriodicCurved and StableReduction roadmaps. Decisions: **28 keep, 194 name, 65 drop**. Every input ID appears exactly once. No atlas names or hiding settings are applied by this proposal.

Retained definitions, central constructions and named theorems with passage-grounded labels. The labels keep differential modules, periodic complexes and curved acyclicity distinct; preserve the difference between nodal reduction and stable families; distinguish décalage completeness preservation from completion comparison; and separate characteristic-p, mixed-characteristic and constructible comparisons. The projective-space homotopy label retains π₁ rather than suggesting a theorem about all homotopy groups. No conjecture has been promoted to a theorem.

Dropped procedural fragments, tests, caveats, repeated source extractions and explicit supplier contracts. Imported analytic geometry is represented at AdicSpacesPartII; elementary sites at AdicEtaleGeometry A1. D6's diamondification endpoint is not relabelled as an A4-owned construction. All source passages remain untouched. Existing curated names were included in duplicate checks and the six-per-layer count.

## Five renamed entries

- Triangulated stable category → **Happel's construction**.
- local normal form → **Local normal form of a node**.
- Fargues' equivalence for finite free BKF modules over algebraically closed C with pairs → **Fargues' finite-free BKF equivalence**.
- Szemeredi's theorem: set form, functional form, and the correspondence between them → **Szemerédi's theorem**.
- Existence of X ×_L Y as a sousperfectoid adic space for X perfectoid and Y smooth rigid (BHW Corollary 3.4) and the weight-space product → **Sousperfectoid products with smooth rigid spaces**.

## Five dropped entries

- Work out the essential test case R[x,y]/(xy - πⁿ): blowing up its closed singular point: Worked blowup acceptance example rather than a separate central construction.
- Keep the genus-zero exception explicit: minimal regular models need not be unique: Warning about the genus-zero exception, not a theorem claiming uniqueness.
- For descent from a discretely valued field retain the Galois action and its continuity, not: Descent-data warning followed by acceptance examples.
- A0 supplier contract: the affinoid tensor product and fibre products of Huber 1.2.2 as the constructions A0 imports: Explicit supplier contract importing fibre products from AdicSpacesPartII, not a new object here.
- R5 uses PerfectoidSpaces P0–P3 to construct products with smooth weight spaces: Dependency-order bookkeeping and an explicit warning against a whole-area cycle.

## Checks

- Whole-file checkpoints after 50, 100, 150, 200 and 250 decisions, followed by the complete file; each checkpoint parsed and retained the exact unique input ID set.
- All retained names checked with Python: 3–48 characters.
- `python3 scripts/merge_landmark_names.py research/expansion/naming/PLANETS-07.result.json --strict`, without `--apply`: 194 accepted names, 28 kept, 65 procedural, **0 rejected, 0 undecided**.
- Additional read-only checks: all 287 unique IDs, allowed decisions and kinds, unchanged keep labels, drop reasons, forbidden characters/punctuation, no imperative or bookkeeping vocabulary, no exact layer-title duplicates, and distinct names within each layer.
- At most six retained planets per layer, including existing curated names.
- Lean compilation: not applicable; naming-only job, no Lean file or formalisation claim.

## Remaining work

None within this job. Independent review and atlas integration remain with the programme. Submit only the result JSON and this handoff.
