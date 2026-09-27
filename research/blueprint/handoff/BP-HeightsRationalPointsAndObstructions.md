# BP-HeightsRationalPointsAndObstructions — first height-class checkpoint

Agent: Codex — codex-hjdg0j, 2026-09-27. Refs #1031.
Claim [5855723613](https://github.com/CBirkbeck/tauceti-explorer/issues/1031#issuecomment-5855723613), confirmed by [5855724889](https://github.com/CBirkbeck/tauceti-explorer/issues/1031#issuecomment-5855724889). The full issue was read before and after confirmation. Initial repository snapshot: 2e83013ce1faed4576b3f440e2a8122e71d4a738.

## What this checkpoint supplies

This first packet covers RP.0–RP.6 honestly as partial: RP.0 has one closed foundational component; RP.1–RP.6 retain not_read coverage. No stage is closed. The component has eight declaration-sized nodes: uniform boundedness at the top filter, the real height-class quotient, its equality criterion, contravariant pullback, injectivity along a surjection, one-sided Northcott transfer, bounded-error invariance, and the bounded-error bridge for finite-fiber pullback.

The bounded-function submodule was found in the pinned Mathlib source: Filter.boundedFilterSubmodule at the top filter. It is reused exactly. HeightClass is a transparent abbreviation for the native module quotient, its projection is mkQ, and its pullback uses mapQ with native pi/proj precomposition. Quotient lifts and their extensionality remain native. The finite-fiber Northcott theorem is imported, not reconstructed. No substitute geometric point type, Picard object, line bundle, Selmer structure, or canonical-height limit is introduced.

Totals: 8 nodes (one definition, one construction, four lemmas, two theorems), 17 API items, 11 definition/construction tests, 16 typed examples, two planets, 23 baseline declarations, one used public source, seven source findings, eleven gaps, and no requests for this baseline-only component. All implementation statuses remain unchecked.

## Reading and ownership

Read the seven reviewed library-coverage rows and AUDIT-09 review, accepted RS-03 result and full explanation, its review, all current RP stages and edges, the campaign document, relevant ArithmeticDynamics nodes, and GrossZagier GZ.1/GZ.2 descriptions plus its integrated GZ.1 source node. Both link directories were screened and all 16 touching entries were read, including repeated integrated copies. No integrated RP decomposition or inherited RP packet was present. The common protocol files and two complete nearby upstream examples, ArithmeticDirichletSeries and Multiquadratic, were reused after byte equality with earlier readings in this session.

The proposed RP.0 component does not duplicate the ArithmeticDynamics Tate limit, the protected elliptic canonical height, or the native arithmetic height foundation. A rescope proposal records the GZ.1 general-height overlap and keeps GZ.2 arithmetic intersections in their existing owner. RP.6 is marked process in the reviewed audit but was not dropped by RS-03; its coverage remains open and a separate rescope proposal records the issue.

The maintainer's Harpaz–Wittenberg routing requirements were read: items 29,31,38,61. The gaps preserve the full product for the unramified pairing, actual Br₀ images, Br₁/Br₀ quotients, Bω local quotient-triviality, actual invariant maps and global reciprocity. Reading the route is not represented as reading the primary paper.

## Sources and findings

The mathematical source used is [de Jong, Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf), the undated 13-page author copy linked from the Spring 2022 course. SHA-256 ad8618d15e8c940a12b975ae0c939fcdf4f4606dc22826920f2647c09e521c74. Read pp.1–3 and 6–10; in particular all of §14 and its quotient footnote, plus §17. Pages 2,6,8,9 were visually inspected. Pages 4–5 and 11–13 are not claimed read. No journal version is asserted.

Seven findings await independent review: a missing logarithm in Lemma 3.1's proof, the rectangular matrix rank, nonprimitive coordinates and the maximum range in the lower-bound proof, a projective-map symbol in place of a height, a wrong numbered fact, the missing globally generated comparison in Step 7, and the zero logarithm in the local-height comparison. Each records its exact version, correction, check, and bounded correction search. None is used to claim the full geometric height machine is closed.

Poonen's 348-page author copy was acquired (SHA-256 42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579); only physical pages 1–3 were read for metadata and contents. Goren's 110-page course PDF was acquired (SHA-256 9cd87a5b522c289b512b4ab5345d797f004c6eee149bd49508063e5be4675d10); only physical pages 1,14,15 were inspected for triage. Neither supplies a node here.

## Validation

Lean 4.34.0-rc2 compiles the full suggested file with no errors and 39 expected proof-placeholder warnings only. Seed SHA-256: 492b74b1a38122ccebcecbede6cbe25d564626cb9f2e8ae2cf4fc6f935f8e33e. All 1480 Mathlib import-source files were checked byte-for-byte against the pinned tree and the installed cache. No Tau Ceti module is imported in this foundational component. The packet still records both required pins.

The textual declaration index misses isBounded_iff_forall_norm_le, generated by to_additive at Mathlib/Analysis/Normed/Group/Bounded.lean:71, and Northcott.finite_le, the class field at Mathlib/Order/Northcott.lean:37. Their source and actual Lean names were checked; the seed contains the two baseline name checks. The packet references the indexed Metric.isBounded_iff_subset_closedBall at center zero and the indexed Northcott class including its field, so the unmodified pinned declaration index validates every reference. The initial remote check exposed this index limitation; the same-branch correction changes only baseline evidence references and prose, retaining every mathematical signature and test. The packet checker with the original pinned index, ordinary checker and four-path intake check pass. Source-finding shape and version metadata pass their validators; the standalone errata-v1 file checker is not applicable to a blueprint packet.

Exact regression witnesses check the symbolic wrong-order difference 4n+3, six proposed uniform bounds, 70 rational sublevel thresholds, two-point fibers, and the coordinate/rank source counterexamples. Seven documented mutation witnesses cover pointwise versus uniform boundedness, constants-only quotients, an invalid quotient ring, reversed composition, reversed Northcott comparison, infinite fibers and negative scaling. These are arithmetic checks and elementary mathematical witnesses, not formal proofs of the prototype theorems.

Local consistency checks match all node and API names to the suggested file, all 11 named tests to typed examples, all statements and proof steps to the reader, and every prerequisite path to the pinned baseline. Exactly the four authorized new files are submitted. The reader is about 4300 words and states the component's limitations explicitly.

## Resume

Start with the geometric height-machine gap. Inspect the actual Picard and invertible-sheaf suppliers and pin the chosen scheme-point carrier. Read and decompose the coordinate and Segre bounds, very ample difference presentations, and globally generated comparison. Repair the source slips before using those arguments. Then build the tensor-compatible height assignment and its pullback law. Import arithmetic normalization and degree-bounded Northcott; do not infer Northcott on all algebraic points.

The canonical/local-height branch must reuse DY.1's analytic limit and resolve the elliptic half-x-height, bilinear pairing and regulator scaling explicitly. The GZ overlap proposal needs an ownership decision before parallel general-height constructions grow. Preserve all RP.1–RP.6 gaps, including genuine fppf descent, full-product unramified Brauer pairing, Parshin bounds, exact Siegel conditions, and complete Mordell–Lang/Manin–Mumford/Bogomolov proofs. Do not turn the conjecture register into proved inputs.
