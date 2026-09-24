# RT-AUDIT-07

Red team against the accepted library audit `AUDIT-07` (reviewed by REV-AUDIT-07, 16 September 2026), issue #1564. By Claude Code, session `cc-38267a`, 24 September 2026. This session took no part in the audit or its review.

The audit covers five roadmaps: arithmetic statistics (ST.0–ST.5), Diophantine approximation and transcendence (DT.0–DT.5), exponential sums and the circle method (ES.0–ES.5), probabilistic and metric number theory (PM.0–PM.5), and sieve methods (SV.0–SV.5). That is 30 layers and 141 targets: 81 absent, 41 partial and 19 fully present. It cites 193 declarations and lists 70 duplicate entries.

**20 findings: 2 high, 5 medium, 13 low.** They are in `RT-AUDIT-07.result.json`, each with its evidence and a fix a worker can apply.

## How it was checked

- **Existence.** All 193 citations (177 distinct declarations) were resolved against a fresh declaration index of the pinned trees (Mathlib 082e2d3, Tau Ceti f790474). All exist at the cited file, within three lines of the cited line.
- **Content.** Three checkers split the roadmaps: ST with ES, DT with PM, and SV. For every declaration they opened the file at the line, read its section variables, and compared it with the target, note and fit.
- **Present targets.** They checked each of the 19 fully-present targets against its stage text.
- **Absent targets.** They searched both trees by concept and synonym for every absent target.
- **Stages and duplicates.** They read every stage description, both reviewed decompositions and every duplicate entry. They swept all 1968 atlas stages and the six new roadmaps for missed duplicates.
- **Verification.** I re-checked the high and medium findings at the pinned sources myself.

## High findings

1. **ST.0 "Finiteness at bounded height" is marked present in both libraries, but it is not.**
   - Finiteness is proved only for field elements, number fields and points on a curve. The stage needs it for elliptic curves by naive height and for GL₂(ℤ)-classes of binary quartic forms by H(I,J), and neither exists.
   - The note calls the gap "elementary once those heights are defined". For forms it is reduction theory: the reviewed decomposition quotes Borel–Harish-Chandra.
   - This is ST.0's only present target, so the layer's verdict becomes "not built".
2. **DT.0 "Weil heights of algebraic numbers and points, normalized compatibly with the product formula" is marked present in Mathlib, but only relative heights over a fixed field exist.**
   - The absolute height `absMulHeight₁` is a bare definition. It occurs nowhere but in its own definition and in `absLogHeight₁`'s.
   - Nothing proves invariance under extension (H_K = H^[K:ℚ]).
   - There are no absolute heights of points, and Northcott is proved only for a fixed K.
   - The consumer RP.0 needs this invariance, and the reviewed decomposition lists the normalization as unverified.

## Medium findings

3. **Sel₂ finiteness is claimed but proved nowhere.** An ST.4 target marked present includes "finiteness of the Selmer-type groups", and the summary claims the rank bound 2^r·#E(K)[2] ≤ #Sel. Finiteness of Sel₂ is not proved anywhere, and the rank-bound lemma needs `[Finite S]`.
4. **SV.0's `level` truncates nothing.** The note says SelbergSieve's `level` "truncates the weights". It is an unused structure field: the Λ² weights have no support condition. Level of distribution should be marked absent.
5. **SV.2's duality principle is marked absent, but Mathlib has it in operator form.** It is ‖Aᴴ‖ = ‖A‖, plus the Hilbert-space adjoint isometry. The target is partial.
6. **DT.2 misses LV.6.** The S-unit theorem, LV.6 of the new MordellLawrenceVenkatesh roadmap, proves the same finiteness statement by the p-adic period-map method.
7. **PM.2 and PM.0 miss Tau Ceti's empirical measures.** These measures of sequences, with their weak-convergence results and the uniform-population identification, are the carrier for equidistribution and for the counting-to-distribution link.

## Low findings

- **Uncited declarations that correct notes:**
  - Mathlib's Dirichlet density of prime ideals;
  - the family E_{A,B}, reduction to short form and quadratic twists;
  - Northcott for Pⁿ(K) is a Mathlib TODO, and ES.5's citation is an auxiliary lemma;
  - Tau Ceti's Wishart law;
  - the interval sieve bounds for coprime counts;
  - the principal-logarithm branch facts.
- **Inconsistent status labels.** Two theorem targets are marked "partial" on bare definitions, where the audit marks the same situation "absent" elsewhere.
- **Missed duplicates:**
  - FF.1 for ES.1;
  - CA.1 and QT.6 for ES.0;
  - LD.2 for ES.3;
  - GZ.1 for DT.0;
  - AC.4 for SV.1, already recorded from AC.4's side in AUDIT-16.

## What held

- **Present targets.** The other present targets hold as stated: the product formula, Legendre's criterion, Dirichlet's theorem, Liouville's inequality, Siegel's lemma, the uniform measure, moments and characteristic functions, Borel–Cantelli, the sieve data and Λ² weights, conductors and primitive characters, orthogonality, and the 2-Selmer group definition.
- **Absent targets.** The searches found no library material behind any other absent target.
- **Verdicts.** Every layer verdict other than ST.0's is consistent with its targets.
- **Duplicate entries.** The listed duplicate entries match their stage text.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-07.result.json`: ok.
- Lean: none. A red team of a library audit has no Lean deliverable.
