# PAPER-DITTMANN-POP-23 handoff

Codex `codex-c83e7a`, 22 September 2026; Refs #1099.
Status: partial continuation of codex-a71f92 / PR #1662.

## Completed in this continuation

Reread all 19 pages of the final author version, with the same recorded
SHA-256. Read the full Kuhlmann–Novacoski Theorem1.2 proof and its local
lemmas; expanded the residue-degree-one application into prime-orbit,
CRT, primitivity, simple-reduction and clopen-neighborhood items. Added
eight exact pinned library imports, including the previously omitted
purely inseparable polynomial normalization and normal fixed-field
results. The normalization proof is now an explicit assembly in the
existing A0-extension owner. Added concrete downstream uses to every one
of the forty definition/construction APIs, preserving all old IDs/names.

129 items: 18 library, 5 planned, 106 missing; all missing routed exactly
once across the six retained routes. 40 D/C, 120 APIs, 120 proposed tests.
Fresh inputs were captured at main 8c1784e9ccdc6dfef9fef5207ee3cdc02a5977b3.
The reviewed A0-extension audit already records the inseparable result.

## Resume here

1. DP23-G1–G2: Jannsen/KS/Suwa/ILO original proof chains, precise odd-degree
   alteration base changes, and Cossart–Piltant’s characteristic-two
   dimension-three input. Jannsen has its own queued paper; import its
   work when available instead of creating a duplicate.
2. DP23-G3: Kuhlmann–Novacoski Theorem1.2 proof is now read. Finish the
   decomposition-field, conjugate-prime and localized-integral-closure
   foundations of henselian-prime-orbit (their Lemma3.2 cites Raynaud).
   EKM subform/cancellation, graded quadratic-Witt, coefficient-field and
   compact real-place descent inputs remain open.
3. DP23-G4: Rumely/Pop/Poonen internal arithmetic inputs and AKNS coding,
   especially the low-dimensional bi-interpretability argument.
4. DP23-G5: the exact off-a-finite-place number-field approximation,
   general divisorial discreteness, Krull height-one intersection and all-
   prolongation integrality adapters. Check the normalization assembly’s
   algebra/fraction-field towers; its pure and separable components are
   already built. Do not replace this with new general excellence work.
5. DP23-G6–G7: independent mathematical review of full-rank geometric flags,
   torus specialization and the finite inverse-language bridge; collate
   against the 25-page publisher version if acquired.

## Preserve these boundaries

Characteristic two in dimension three is unconditional; higher dimension
uses both resolution clauses. Higher Pfister forms require quadratic,
not diagonal, characteristic-two last factors. Root fields may be trivial.
The ball set is a union and its stabilizer an intersection. Rank-one W_T
and full-rank G_T have different uses. Normalization needs the pure step
below the separable step. Do not infer selected-family integrality from
one chosen prolongation, or from the universal criterion without an
adapter. The henselian CRT argument excludes the identity embedding from
its nonfixing claim and does not assert finite generation of the whole
prolonged valuation ring.

## Validation

Paper checker and intake file check pass. Custom checks pass for the
129-item DAG, retained IDs, API/test/use references, route uniqueness,
owner/stage/galaxy IDs, and fresh-main input consistency. Finite examples
exercise simple-root reduction, split valuations, Frobenius monomial
bounds, total inversion and the source sign correction. No Lean file was
compiled; the proposed test contracts remain unexecuted in Lean.
