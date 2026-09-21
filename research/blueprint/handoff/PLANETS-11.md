# PLANETS-11 handoff

Issue: #891. Agent: ChatGPT Pro. Session: `astra-20260921-f6b2d8`.
Date: 2026-09-21. Status: complete editorial naming proposal, ready for intake.

## Scope and result

All 298 input identifiers have exactly one decision: **205 name, 16 keep,
77 drop** across 17 roadmaps and 124 touched layers. A drop hides an extracted
planet, not its source statement, theorem obligation or decomposition node.
No roadmap, source, ownership, dependency, formalization status or curated
label is changed by this submission.

The labels distinguish constructions from comparisons and applications. They
retain rational-only Satake semisimplicity, the chosen q-Hodge filtration,
the research status of the algebraic–analytic Habiro comparison problem,
modularity-implies-Bloch-torsion (not its converse), finite-support admissibility,
and the weight-two BDP/Brooks logarithm formula rather than a height derivative.
The corrected Faltings closure tower is labelled as a tail. The source-specific
Hutchinson refinement retains its square. Duplicate parent/sub-layer fragments
and prose instructions are hidden in preference to substantive theorem nodes.

## Reproducible inputs and checks

The initial connected-repository input was read at
`d3c66d3fd61d594f19d0ba0d5ab0065f362267b8`.
The subsequent complete repository snapshot came from the successful GitHub
Pages build at `62932be6b1ea0e4aa1c8750cc03308d58f50d1ac`, workflow run
35614205611, artifact 10644934806. Its naming input and checker were verified
byte-for-byte against the initial input:

- `research/expansion/naming/PLANETS-11.json`: Git blob
  `042fc47f3a40cec740d7ad5b89ca5edfe74e66fc`.
- `scripts/merge_landmark_names.py`: Git blob
  `a010e0468f941e0f825b27cb5f0d719fe19d226d`.
- Full `data/atlas.json` in that validation snapshot: Git blob
  `37f2add06983c206067d1104e0f40a839cc3961a`.

The following commands ran successfully on the full extracted repository,
not a reduced stage-ID projection:

```text
python3 scripts/merge_landmark_names.py research/expansion/naming/PLANETS-11.result.json --strict
PLANETS-11: 298 entries, accepted names 205, kept 16, procedural 77, rejected 0, undecided 0

python3 -m unittest discover -s tests -p test_merge_landmark_names.py
Ran 3 tests: OK
```

Additional checks verified exact ID coverage with no extras or duplicates,
unchanged labels for all 16 keeps, permitted kinds, 3–48-character names,
no forbidden formula markup, no retained name equal to its layer title,
and case-insensitive uniqueness within each visible layer. Simulating the
result together with existing curated/hidden/presentation data gives 236
visible entries in the 124 touched layers, including 15 pre-existing curated
entries outside this batch; the maximum is six in any layer.

No `--apply` was run. No Lean file was introduced; Lean compilation is not
applicable to this naming job. This is an editorial check against the supplied
excerpts and relevant roadmap passages, not a new claim of proof verification
or formalization. Current-main validation remains the submission check's job.

The result JSON Git blob is `76e976f675b18de53384afffa815633e95d45d68`;
SHA-256 is `d43f41438eeb1cb898059ec227214387b521c6af7c4056da7517f86a509cb343`.

## Five old-to-new examples

| Original label | Proposed label |
|---|---|
| Wagner v2 Definition 1.6 / Definition 3.2 in its full source form: a (q−1)-complete | Chosen q-Hodge filtration |
| Admissibility and integrality | Finite-support admissibility theorem |
| BDP/Brooks p-adic L-function for the weight-two Heegner setting at a good-reduction prime | Weight-two BDP/Brooks p-adic L-function |
| FS VI.11 (generic fibre step) and VI.7.5: rational semisimplicity of the Satake category and reductivity of the generic fibre | Geometric rational Satake semisimplicity |
| CGZ Theorem 1.6 initially allows an invertible universal power | Hutchinson's refinement R_ζ = c_ζ² |

## Five hidden entries and reasons

| Original label | Reason |
|---|---|
| van der Corput | The bare attribution does not identify which van der Corput result or construction is intended. |
| Coefficient extraction agrees with a finite count for small examples and supports | Acceptance check against small finite counts, not a separate mathematical landmark. |
| Mean-value theorems | Repeats the layer title and gives source-range checks; the Vinogradov result is represented separately. |
| Positivity is demonstrated at every place, and normalization of Haar measures matches | Acceptance and measure-normalization instructions belong in the layer text. |
| number of variables, degree, dimension of singular locus and error exponent before claiming | Instruction to record hypotheses and error terms rather than a named object or result. |

## Curated entry left for maintainer inspection

The existing curated identifier
`FarguesFontaineDiamonds:F5::landmark:subsequent-use-of-rf-or-rf-on-this-curve-m-1xsms3s`,
labelled “Functoriality on Fargues–Fontaine curves”, is outside this batch.
Its excerpt is a warning to verify the hypotheses before using exceptional
operations, rather than a separate construction. It was deliberately left
untouched: a separate maintainer decision is needed to change a curated label.

## Resume

Intake should validate and merge the two issue-owned submission files; the
orchestrator then applies the accepted display names/hiding recommendations.
No mathematical target should be removed when applying a display drop. There
are no undecided in-batch entries and no remaining writing task for this job.
