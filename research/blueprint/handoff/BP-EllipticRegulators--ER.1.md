# BP-EllipticRegulators--ER.1 handoff

Job: issue #6482. Agent: Codex. Session: codex-5umW8m. Date: 2026-10-06.

## Completed planning pass

The supplement builds on the accepted EllipticRegulators packet, with new IDs and exactly ER.1 in scope. It contains seven targets: one definition, two constructions, and four theorems; 25 API items; 13 unit tests; six planets; and 15 checked baseline declarations. Every node remains `implementationStatus: unchecked`. The packet status is `complete`, and ER.1 coverage is `planned`. It has zero unowned gaps and five open supplier requests. This is a complete target-level planning pass with outstanding supplier interfaces, rather than a claim of implementation or a closed stage.

The local period-choice plan covers oriented Mathlib-compatible scalar data, SL₂(ℤ) basis changes with an explicit matrix convention, conjugate oriented periods at actual embedding pairs, the two real period shapes and q signs, primitive integral positive/negative cycles, exponential conjugation, and the exact first-period normalization used by ER.2. In the half-integral real case, the negative generator is (−1,2), with normalized period 2i Im τ; the sum of the integral eigensublattices has index two. The suggested file preserves this distinction.

## Confirmed finding RT-AREA-ktheory-2/8

C5 and C6 are explicit prerequisites of the ER.1 handoff target; C6 is also a direct prerequisite of the geometric period-input and conjugation targets. Uniformisation remains R12.1's input. ER.1 does not plan another de Rham–Betti comparison, Hodge-line computation, or elliptic period matrix. The packet's `restructure` proposal routes the elliptic matrix acceptance test of PS.0 to C6. It also directs assembly to replace the imported-comparison and deck-group-alias portions of the parent's mixed `periods-and-the-comparison-isomorphism` target. The parent packet and PS.0 files are outside this job's editable paths and were not changed.

## Exact outstanding supplier obligations

1. **ModularCurvesPartII:R12.1:** genuine analytic group uniformisation and compatibility with the invariant differential and integration. Its current part packet has no R12.1 targets.
2. **ComplexComparisonPartII:C5:** the existing `repair-proper-de-rham-betti` node supplies the smooth proper complexified comparison; add the natural integral integration interface and its embedding/conjugation compatibility. The existing abstract vector-space statement does not supply this extra structure.
3. **ComplexComparisonPartII:C6:** own the elliptic Hodge line and polarized calculation. Provide integration from actual singular H₁ to the period lattice, prove the integral isomorphism, evaluate projected straight-line loops, and supply the real and all-embedding naturality and orientation statements. Any elliptic comparison matrix remains this owner's computation.
4. **Upstream AlgebraicTopology, Stage 5:** actual singular integral homology of the two-torus, its coordinate-loop basis, and naturality under integer matrices and homeomorphisms. This replaces the earlier deck-group/Hurewicz gap without defining H₁ to be a deck group.
5. **Upstream AlgebraicTopology, Stage 6:** the oriented integral intersection pairing and its sign under orientation transport. C6 connects it to the elliptic integration calculation.

A follow-up should first inspect these suppliers for the requested map-level interfaces, replace stage requests with sufficient exact node IDs, and add the omitted geometric Lean signatures against the resulting actual objects. The retained scalar plan needs no new cohomological calculation. Assembly applies the ownership proposal and reconciles the parent's comparison target with these imports. No general Hurewicz theorem is assigned to ER.1.

## Sources and baseline

Read Brunault's public thesis arXiv:math/0602186v1, §1.2 pp.20–27, including (1.36)–(1.48), Remarque 20, and Proposition 26. Page 22 was visually checked for orientation and integral notation. Read Dokchitser–de Jeu–Zagier arXiv:math/0405040v2, §3 around (3.3)–(3.4) and Remark 3.14. The exact versions, URLs, read date, and content hashes are recorded in the packet. No required source is missing, and no source error was found in these passages. Matrix and integral-kernel consequences are marked as deductions from the source conventions.

The pinned Mathlib and Tau Ceti statements were read, not inferred from declaration names. The shared build's Mathlib is exactly the pinned commit. Its Tau Ceti checkout is newer than the recorded pin; the two cited Tau Ceti modules were read at the pin and checked unchanged in the shared checkout. The suggested file imports only Mathlib modules, so no newer Tau Ceti declaration is used in elaboration. Existing q-parameter, embedding conjugation, number-field signature identity, and period-lattice APIs are imported rather than replanned.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.1.json`: zero errors and zero warnings.
- The final suggested file compiled successfully using `lean-check` and the exact pinned Mathlib, with 50 diagnostics, all the expected planning-proof warnings. There were no errors or other warnings. Memory was checked before compilation and exceeded the required 20 GB available.
- Checked agreement of every packet declaration/API/test name with the reader and suggested file, and checked the packet and reader for prohibited code, wording, and private paths.
- `git diff --check`: passed. The submission contains exactly the four authorized deliverables.

The suggested file prototypes scalar consequences with planning proof placeholders. It omits the genuine geometric integration, differential, and base-change signatures until their supplier objects exist. There are no arbitrary comparison matrices or proposition-valued assumptions standing in for those maps. Compilation checks types and module compatibility, not proofs of these planned statements. The authoritative geometric statements are in the packet and reader document.

## Resume and assembly

Start from the five `requests`, ER.1's `coverage.remaining`, and the single ownership `restructure` proposal. Keep the accepted parent's three cited targets; replace its mixed comparison portions through the owners listed above. This supplement touches only its own packet, reader, suggested file, and this handoff. There is no scratch artifact required for another worker.
