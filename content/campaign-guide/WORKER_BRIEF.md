# Reusable AI worker brief

Fill `STAGE_ID`, `TAUCETI_COMMIT` and `MATHLIB_COMMIT` with actual values. Read [AI_EXECUTION.md](AI_EXECUTION.md) before dispatch.

> Implement the established mathematical scope of STAGE_ID from its authoritative roadmap. First read the full source proof and cited prerequisites; pin exact versions and locators. Search the target library for existing declarations. Match every producer's output to this stage's required input, including hypotheses and normalization. Decompose the proof into precise construction and lemma leaves; record any new gap under its canonical owner. Start proof implementation only for leaves whose prerequisites are actually available. Prove all promised laws and comparison maps, run target-pin checks and an axiom audit, instantiate the result in its consumers, and update the stage evidence. General conjectures remain statements or conditional results. Do not replace a construction by a structure assuming its endpoint, or mark a cited/compiling interface as proved.

## Required result record

```json
{
  "stage_id": "AREA:STAGE",
  "target_commits": {"tauceti": "", "mathlib": "", "lean_toolchain": ""},
  "status": "preparing",
  "source_proofs": [],
  "input_output_signatures": [],
  "reused_declarations": [],
  "construction_and_lemma_leaves": [],
  "new_owned_prerequisites": [],
  "normalization_conversions": [],
  "build_and_axiom_evidence": [],
  "consumer_examples": [],
  "unresolved_obligations": []
}
```

Empty lists are an initial template, not evidence of completion. Each source entry records title, version, locator, exact statement and complete proof-read coverage. Each leaf records its Lean signature, prerequisite declarations, proof path and check result. A worker explains any remaining mathematical or source-access obstacle explicitly.
