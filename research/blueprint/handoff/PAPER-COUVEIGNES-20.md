# Handoff — PAPER-COUVEIGNES-20

Issue: #1129. Agent: ChatGPT. Session and branch: `chatgpt-couveignes-20260921-c7e4`. Date: 2026-09-21. **Partial checkpoint; not ready for acceptance as a complete paper extraction.**

## Saved work

The two permitted deliverables are `research/blueprint/papers/PAPER-COUVEIGNES-20.result.json` and `research/blueprint/papers/PAPER-COUVEIGNES-20.md`. The JSON has 42 items: four positive library records, two already planned records, and 36 provisional missing interfaces with exactly one proposed route each. The report explains the source proof and the distinctions that must survive implementation.

The four routes are source additions to GeometryOfNumbersAndQuadraticArithmetic GN.0/GN.1, source additions to SchemeAndStackFoundations SF.0/SF.5, a provisional GenericDoublePointInterpolation roadmap, and Effective Bounds, Part II: compact models and degree-sensitive field counts. The continuation imports the ArithmeticStatistics ST.0 carrier. These are proposals, not accepted owner changes.

The paper's explicit model height and both main asymptotic bounds are recorded, together with the short-integer, first-jet, relation-lattice and component-counting interfaces. In particular preserve: canonical versus product measure; independent integral elements versus an integral basis; a finite-index dual image versus equality; Hermitian rather than unconjugated Gram matrices; discarding exactly n-1 relations; one Jacobian minor valid at every conjugate without a Galois hypothesis; and a field component rather than the entire equation quotient.

## Exact baseline and evidence to reuse

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The pinned statements in Mathlib `NumberTheory/NumberField/Discriminant/Defs.lean` and the relevant portions of `CanonicalEmbedding/Basic.lean` were read. The latter's integer lattice is a `Submodule`, with an anonymous `IsZLattice` instance; do not invent a named `integerLattice.isZLattice` theorem. No `rootDiscr` declaration is asserted at the pin. Read `det_matrixToStdBasis` together with the measure comparison rather than assuming the source uses Mathlib's default product measure.

Tau Ceti `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean` was read at the pin, including `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`. This is an existing effective count, on a fixed-ambient-subfield carrier, not Couveignes' exact-degree isomorphism-class bound.

The merged reviewed audit `data/library-coverage.json` was available through Git blob `5e708cfc74a51b10e62149113872fe4e00eb5846`. GN.0 is built and GN.1 explicitly lacks the second-minimum theorem. The corresponding atlas extracts and the EffectiveBounds link map were read. The completed EffectiveBounds roadmap was read in full; the nearby NumberFieldArithmetic and IntegralLattices documents were only read in relevant portions.

## Resume in this order

1. **G-PROVENANCE:** Acquire the published PDF bytes from the URL in `source.url` into the new worker's scratch directory, record date and SHA-256, and check the publication/version metadata. All eleven pages of the published paper were browser-read, but the original bytes were not obtained because container DNS failed. Do not substitute the hash of extracted text. The arXiv id alone is not a version comparison.

2. **G-BASELINE:** Close the precise pinned coverage of normalization/covolume, primitive orthogonal complements versus the completed IntegralLattices library, bounded-degree/homogenization and integer-grid interpolation, Hadamard, elementary product and dimension consequences, and the combined Jacobian-open finite-etale/component interface. The current `missing` records include consumer composites whose general ingredients already exist. Reclassify any exact existing theorem as `library` and remove it from new-work routes. Inspect the actual declaration, not a current-branch search snippet.

3. **G-OWNERS:** Read `data/decompositions/ArithmeticStatistics.json`, complete searches in `research/blueprint/packets/`, `research/blueprint/roadmaps/` and the relevant link maps, and finish a second nearby upstream roadmap document. Confirm or replace the provisional general interpolation owner. Generic elementary lemmas must have one owner, or be baseline imports, rather than remaining private duplicate foundations in the arithmetic continuation.

4. **G-SOURCES:** Read Siegel Lecture III, Section 4, Theorem 16 with the independent-vector witness formulation, Martinet Corollary 1.3.5 with primitivity, and Fulton's isolated-intersection bound with possible positive-dimensional residual components. Brambilla–Ottaviani Theorem 1.1 and its exceptional list were checked in arXiv `math/0701409v2`; its full proof was not read. Complete its prerequisite extraction or attach a concrete prerequisite design dependency. Do not present it as already formalized.

5. **G-CHECKS:** Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COUVEIGNES-20.result.json` in the current full repository, resolve all errors, and inspect the submission workflow. Only after the preceding substantive gaps are closed should the extraction become `complete` and go to independent review.

## Checks actually performed before publication

The local candidate was parsed; its 42 identifiers were checked for uniqueness, and each provisional missing item was checked to have exactly one route. The uploaded JSON was serialized separately from that local candidate, so these are limited integrity checks, not a full-catalogue test of the exact uploaded bytes. The repository paper checker was read but not successfully run in a local full checkout. No Lean file was compiled, and no theorem is claimed formalized. Subsequent CI findings belong in the PR discussion; passing schema checks does not resolve the source or ownership gaps.

The branch changes only this job's two deliverables and this handoff. Submit as a non-draft checkpoint PR with `Refs #1129`, not a closure request. Opening the PR ends the claim; do not manually unclaim a submitted job, merge the PR, close the issue or change its labels. Intake can release this partial job after checkpoint processing.
