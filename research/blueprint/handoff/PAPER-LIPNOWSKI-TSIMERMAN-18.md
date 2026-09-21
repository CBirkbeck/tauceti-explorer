# PAPER-LIPNOWSKI-TSIMERMAN-18 handoff

Codex — codex-c83e7a; 21 September 2026; Refs #1332. **Partial checkpoint.**

The public v1 was read completely, Conrad's ten-page polarization notes were read completely, and Yun's specific local-counting proofs were checked. The JSON has 113 stable items (8 library, 26 planned, 79 missing), ten routes, 37 definitions/constructions with APIs and ≥3 tests each, and 19 explicitly unrouted claims. Only these issue deliverables and this handoff are submitted. No Lean implementation or compilation is claimed.

Start by obtaining and comparing the final 2018 paper. The report records exact URLs/hashes/read extents and nine gap groups G0–G8. Both author links lead to the 38-page 2015 preprint, whereas the journal has 51 pages; the canonical publisher links returned security HTML. Do not silently treat v1 as the final text or describe its errors as published-paper errors.

Resume in this order:

1. Reconcile final-source statements, especially Theorems 0.1–0.3, (26)–(28), the mass formula and (51)–(56), Corollary 5.13's quaternionic exception, Lemma 5.19 and Corollary 5.20. Preserve stable IDs and rewrite hypotheses if the final source differs.
2. Close local lattice counting from Yun plus a checked repeated-eigenvalue extension: flag fibers versus intersections, residue extensions, dual sandwich, discriminant/multiplicity factors, δ=0 and stabilizer indexing. The printed weak-composition estimate is false.
3. Acquire Gan–Yu/Jacobowitz and certify dyadic local densities, the measure and factorial coefficient, free versus projective classes, unit determinant labels and analytic residue ratios. Numerical experiments cannot replace these proofs.
4. Supply the real-Weil/quaternionic factor in conditional concentration. Give an eventual-in-g statement with uniform errors and the correct leading constant. Fix the spacing convention and construct the enhanced joint limit before claiming a probability law.
5. Retain the verified F₂ counterexample: y²+xy=x³+x²+1 has 2 and 8 points over F₂ and F₄, respectively. Only the p≥7 repair is currently routed. Check what the final paper does with the exceptional small primes.
6. Read original Tate, Honda, Waterhouse, Lang, norm-unit/class-group, Serre and Friedman–Washington inputs and expand their proof interiors. Split the §1 Euler suppliers and Remark 2.3 lower bound; locate the current upstream compact-support trace-formula stage. Do not claim the present list is a complete atomic dependency closure.
7. Recheck the main branch, pinned declarations, reviewed audits and pending new routes. R07.2 is an existing owner but has no direct reviewed-audit entry in this snapshot; its library boundary is corroborated by reviewed A4/A3 and source searches. Rerun schema, intake and custom ownership checks. Mark complete only after all missing items have exactly one justified route and the full source chain is closed.

The atlas portfolio and relevant inputs were pinned at 14482fbdbea546a681b66b8bb4ff336bdc8830c6. Library pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. PELModuli remains the sole moduli owner; A2 owns duals/polarizations, R07.2 Dieudonné theory, GN.2/GN.3 hermitian lattices/mass, AA.4 strong approximation and ST.0/ST.5 the family measures/statistics.

Unrouted item identifiers:

- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-unpolarized-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-repeated-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/main-elliptic-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/trace-formula`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/euler-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/power-sum-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/local-orbit-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/stabilizer-depth-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/regulator-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/residue-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/density-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/mass-asymptotic-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-count-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-concentration-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-power-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/spacing-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-pgroups-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/enhanced-failure-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/reduced-trace-source`

Checks: paper schema, intake for the three actual files, IDs/routes/stages/areas/file-existence/source-hash assertions, and reproducible finite arithmetic checks described in the report. Successful intake is not an independent mathematical review.
