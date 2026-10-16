# BP-AlgebraicModuliForArithmeticGeometry--R09.7c

Issue: #9911. Agent: Codex, session `codex-gsFaGv`. Complete target-level planning pass; scope is exactly `AlgebraicModuliForArithmeticGeometry:R09.7c`.

## Delivered

The packet imports seven accepted targets from R09.7 and two from R09.7a. It creates no duplicate mathematical nodes. The original A0-extension follow-up description is stale: that packet has no R09.7c coverage record, while the accepted R09.7a coverage already assigns its two native output constructions to R09.7c. No predecessor file was changed.

The reader consolidates all nine targets, their hypotheses, proof routes, locators and acceptance checks. It specifies all fourteen inherited API items and twelve inherited tests. Worked checks distinguish full-invariant maxima from multiplicity, incomparable Hilbert–Samuel values from a greatest value, total ideals from reduced support, and smooth strict transforms from simultaneous SNC pairs. The cusp and smooth-pair examples also distinguish the two preserved opens.

Counts for this part:

- New nodes, API items, tests and planets: **0**.
- Imported stage targets: **9** — **1 definition, 3 constructions, 5 theorems**.
- Imported API items: **14**; imported tests: **12**; inherited planets: **3**.
- Direct imported support nodes: **11**.
- Baseline declarations in this packet: **10**, read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Gaps: **0 newly recorded mathematical gaps**; requests: **3 inherited supplier contracts, 0 new requests**.
- Coverage: **R09.7c planned**. No stage is closed and nothing is claimed formalized.

The imported planets are Embedded resolution of singularities, Principalization tower, and Embedded resolution tower. Their canonical nodes and the supporting planets keep their existing ownership.

## What remains

This planning job is complete and ready for independent review. The following implementation and supplier obligations remain explicitly in the coverage record:

1. StableReduction Layer 4: use its ordinary blowup, complement, exceptional-ideal, strict-transform, projectivity, chart and flat-base-change interface. Its surface resolution theorem does not supply the characteristic-zero algorithm.
2. SchemeAndStackFoundations:SF.0: discharge the residual local-algebra/completion/Jacobian comparisons, local embeddings and open-gluing interface. The existing `jacobson-finite-type` and `etale-coordinates` nodes are exact target pointers; their packet has review status `needs_changes`, so this pass does not claim they are accepted or implemented.
3. SchemeAndStackFoundations:SF.3: complete the remaining unrestricted-scheme Cartier-divisor/ideal-product dictionary while reusing the native effective-Cartier predicate.
4. Implement the existing finite tower and populate the principalization/embedded outputs from the selected algorithm. Retain every centre's coordinate permissibility, the native total/weak/strict ideal relations, surviving and born labels, finite length and preserved-open identifications.
5. Prove the smooth-pair resolved-open refinement and unique comparisons of the whole towers: local centre-ideal equality, ambient-embedding independence, restriction, empty-centre-step deletion and coherent identity/composition/cocycle laws. Nonempty Cartier-centre steps cannot be discarded merely because their blowup maps are isomorphisms.
6. Prove the imported targets and their API/tests in Lean. R09.7d consumes these interfaces for compactification; its finite-cover and meridian work was not added here.

No definition was moved down from a higher roadmap and no new cross-roadmap edge was introduced.

## Sources and reuse checks

Read the full public 96-page published PDF of Bierstone–Milman (1997) at the locators recorded in the packet: closed-point convention; principalization; invariant properties and birth-order centre selection; terminal monomial descent; global algorithm; higher-codimension resolution; smooth-pair cleanup including Lemmas 12.5, 12.7–12.8 and Example 12.9; and the embedding and whole-tower comparisons in Theorem 13.2. The source SHA-256 is `f01ebbb0591fa62f9b65c16ab54f35e7409cf4fb0abd1f01bf3bf9b59d87ecaf`.

The 1989 Hilbert–Samuel stabilization proof was not reread. Its exact accepted supplier is `R09.7/hs-stabilization`, whose statement and use in Theorem 1.14 were read. The packet makes that inherited source boundary explicit. No source needed for a new target is missing, no restricted book was used, and no new source mistake is registered. E1901/E1902 remain with the accepted aggregate owner.

Read the current StableReduction and AlgebraicVectorBundles documents. Screened the current library and roadmaps, including the nine newer roadmap directions listed by WORKERS.md, for overlapping resolution targets. Recorded current roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The native effective-Cartier predicate and affine blowup chart API are reuse inputs, distinguished from the pinned baseline. No current upstream tree was modified or built.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7c.json`: **0 errors, 0 warnings**.
- Canonical import audit: both SHA-256 hashes and accepted review identifiers match; all twenty explicitly imported IDs exist uniquely; nine target kinds and unchecked statuses match; all fourteen API and twelve test names occur in the reader; all direct prerequisite lists and the six stage-target mappings resolve.
- Recursive prerequisite scan through the two accepted owner packets: **40 reachable nodes, acyclic**, with fourteen boundary leaves supplied by their existing baseline ledgers, foundation targets or the three inherited request contracts.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7c.lean`: **exit 0; five expected declaration-uses-sorry warnings only**. Available memory was 90 GiB before starting. No background Lean process remains.
- The suggested file is **74 lines**, with one native endpoint theorem and four examples. It follows the compact WORKERS shape: no data definitions or developments of missing theory. The full nine-target specification, including all SNC/tower/comparison conditions, remains in the reader and canonical owners.
- Submission file check and whitespace check: **passed**.

The independent reviewer should check the import boundary and the consolidated specification against the canonical owners and source, particularly the full monomial descent, pair hypotheses and all-year comparisons. This pass is not an independent review of its suppliers. There is no scratch dependency needed to resume or review it.
