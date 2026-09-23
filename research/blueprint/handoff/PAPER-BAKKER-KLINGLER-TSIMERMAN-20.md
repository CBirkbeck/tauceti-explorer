# Handoff: PAPER-BAKKER-KLINGLER-TSIMERMAN-20

Codex `codex-a71f92`, 23 September 2026. Refs #1422. **Partial checkpoint.**
Preserves contributions from `codex-c83e7a` and `cc-fb70e5`.

## Completed in this continuation

- Acquired/read all published pp.917–939 and reread the official erratum. Main statements and every finding have published locators; selected formula images were checked. G1 is resolved for published access and statement/locator collation, not exhaustive editorial collation.
- Added six stable items: `cholesky-reconstruction`, `matrix-adjugate-inverse`, `determinant-coordinate-control`, `basis-change-offdiagonal`, `buffered-transition-graph`, and `finite-siegel-relation-proper`.
- Supplied explicit basis-transfer constants and finite sorting, resolving the quantitative portion of G5. Proved finite-relation properness and buffered-chart transition definability; local slice refinement remains open.
- Corrected finite-difference sign and inverse-power Vandermonde interpolation in the repaired widened-sector curve lemma. G4 stays resolved; analytic uniformity remains G3.
- Added E8–E29; retained E1–E7 and official erratum attribution. All 29 source findings await independent review.
- Normalized API roles and standard `tests` metadata. Counts: 124 items (12 library, 12 planned, 100 missing), 234 dependency edges, 44 definitions/constructions, 132 API contracts, 134 proposed tests, eight routes. `unitTests` mirrors the earlier ledger and is not counted twice.

## Resume in depth

1. **G2:** Read/decompose original Borel–Harish-Chandra, Borel–Serre/Borel–Ji and Orr inputs. The proper finite relation is now proved; the semialgebraic quotient theorem and finite local chart refinement are not. Replace the failed invariant-polynomial proof (E8), justify the real-translation adapter (E18), and construct the surjective arithmetic/compact-stabilizer adapter (E19). Do not assume an exact product quotient.
2. **G3:** Finish original Schmid nilpotent-orbit/SL₂ and CKS/Kashiwara norm inputs, including bounded-real-width uniformity for the repaired curve lemma. Earlier selected reads are precisely attributed in provenance; unread proofs and OCR formulas are still unread. Finish adjoint/central-cover representation and finite-level adapters. Never substitute a single-MHS Deligne splitting for simultaneous weight splittings.
3. **G5 remainder:** Work out the finite buffered angular/face charts for arbitrary η and global finite-level descent. The quantitative basis-transfer lemma is done; retain its strict-constant enlargement and finite permutations. The entire open punctured disk version is not a valid target.
4. **G6:** Acquire/extract original definable Chow and o-minimality proofs. Verify the Hermitian arithmetic/algebraic target comparison independently of the Borel theorem being reproved. Finish proper Hodge images, tensor/subdatum countability, graph regularity and singular-source descent. E28 excludes the generic identity image; E29 records the smooth/general-source proof mismatch.

Retain fixed K, Cartan-compatible morphisms, BGST's forward-containment hypothesis, nonzero-vector hypotheses, the centered-weight shift, conjugation/parity conventions, and local boundary branches. The 29 source findings are provisional, not reviewer-confirmed facts; do not write your own review verdict or contact authors.

## Owners and checks

Keep ShimuraData D3 for general VHS, AA.3 for rational reduction, LD.0/6 for tame/definable geometry, ALS.2 for the symmetric Borel–Serre case, and upstream HodgeStructures for existing linear algebra/carriers. The two Part II IDs remain shared proposals: `ArithmeticQuotientDefinability` and `DegeneratingHodgeStructures`. Benoist/Gao–Habegger references are coordinated consumers. Cholesky is an existing upstream import. LD.0/6 had no reviewed audit entry in this snapshot.

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json`; intake on the two paper files and this handoff; paper, errata and source-issue unit tests; and custom DAG/API/test/route checks. This continuation also ran 300 exact rational matrix/basis cases and finite interpolation diagnostics. Refresh main, check deliverable concurrency and ownership again before publishing.

No Lean file is a deliverable and no Lean compilation or implementation is claimed. Only the named result, report and handoff may change.
