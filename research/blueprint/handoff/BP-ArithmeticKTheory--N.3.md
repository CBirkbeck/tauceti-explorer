# BP-ArithmeticKTheory--N.3 handoff

**Worker:** Codex — codex-SwXUca. **Issue:** #6474. **Branch:** `codex-SwXUca-arithmetic-k-theory-n3`. **Date:** 2026-10-06.

This is a completed planning pass, not a checkpoint. Scope is exactly `ArithmeticKTheory:N.3`; packet part is `N.3`. The accepted N.1 packet was read and left unchanged. Its six target endpoints and its filtration/building/spectral-sequence nodes are reused by ID. The seven new nodes have distinct IDs: finite-rank Q homology, precise homology stabilization, stable Q homology finite type, finite-S localization defects, canonical rational S-integer equivalence, promoted forward-map identification, and extension/transfer naturality.

The packet has **7 nodes** (5 theorems, 1 construction, 1 lemma), **8 API items**, **5 discriminating tests**, **2 planets**, **14 verified baseline references**, **0 additional arithmetic-source gaps**, and **2 topology supplier requests**. Status is **complete**; the single scope stage is **planned**, with **0 closed stages**. Implementation is unchecked. No function-field/curve scope was added.

## Sources and baseline

Read Quillen's complete LNM341 lecture text, pp.179–198, including the integral arithmetic proof and rank-relative exact sequences; rendered p.182 confirmed the exact stability bounds. Read Weibel IV.1.12–1.18, IV.6.8–6.9, IV.7.1–7.2 statement/setup, V.6.1 and V.6.6–6.6.4; Kahn §§1.3.5,2.4.1,4.1–4.3.4. URLs, SHA-256 hashes, dates and exact reading boundaries are preserved in the packet. The downloaded copies need not survive scratch deletion. Source-page numbering in both collected Quillen scan and Weibel combined PDF is PDF page minus eight.

Pinned statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the supplied declaration index also resolves all fourteen references. Existing S-unit finite generation and class-group finiteness were not planned again. Existing higher K/Q/Steinberg carriers were searched for at the exact Tau Ceti pin and not found. Upstream style/boundary readings were AlgebraicTopology and NumberFieldArithmetic. Relevant atlas links, parent review and accepted RS-18/RS-33 supplier boundaries were inspected.

## Checks

- Blueprint checker: **0 errors, 0 warnings**, using the supplied pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.3.lean`: **passed**, exact pinned Mathlib, only **9 `sorry` warnings**. Memory was checked before compilation. The executable Mathlib examples elaborate; **all higher-K arithmetic signatures/API/tests are comments awaiting genuine suppliers**, and were not elaborated. The shared Tau Ceti checkout is newer than its pin; no Tau Ceti modules were imported from it. Tau Ceti evidence came from exact-pin source reads.
- Suggested-file register covers all seven proposed declaration names, all eight API names and all five test names; no arbitrary carrier or proposition surrogate was introduced.
- Exact-node prerequisite traversal: **138 reachable nodes, no cycles**. Intake deliverable/path check: **4 files, 0 problems**. Source hashes match the three downloaded PDFs.
- Only the packet, reader, suggested file and this handoff are changed. No repository copy, Lake build/update/cache operation or Lean language server was used.

## Where review and integration should resume

The reader explains every target, refinement, API and test, plus exact degree/prime/finite-projectivity conditions. Review the new declarations against Quillen pp.179–185 and the parent IDs before changing any ownership.

1. Supply H.1's natural integral homology comparison for the filtered union of rank nerves, then replace the one stage prerequisite with the resulting node. The existing homotopy filtered-colimit theorem alone does not state it.
2. Route the generic connected simple H-space finite-type theorem to **StableHomotopyKTheory, Part II**, adjacent to H.3. Nonzero π₁ is essential: `π₁BQ=K₀`. The parent criterion's old H.6 request conflicts with narrowed H.6's current spectra/completion scope. The packet proposes the precise extension; this job was not authorized to edit the parent or topology packet.
3. Resolve the parent's inherited supplier contracts through their reviews: early Borel R.1 integral Steinberg finite type, R.3 order rank, K.1/Q and early K.2:plus comparison, K.3 localization/transfer, Z.4 projective classification and U.4 determinant/S-unit identification. The Borel, K.1 and U.1 packets retain their current `needs_changes` boundaries; the finite-field plan is unreviewed. Do not infer implementation or closure from their node IDs.

Avoid Borel's R.1 arithmetic-finiteness interfaces or R.3 S-integer import as prerequisites: they consume N.3 and would create a reciprocal dependency. Arithmetic localization and rational-map coherence stay here; general spaces, transfer, arithmetic duality and rank computation retain their original owners. The parent's function-field gap and source issue ArithmeticKTheory/E15 remain in the unchanged parent; this pass adds neither a duplicate record nor new claims about them.
