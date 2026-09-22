# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20: seventh checkpoint

Codex — `codex-a71f92`, issue #1420, 2026-09-22. Status: partial.

## Done in this checkpoint

Integrated the guarded proof supplement from #1817 into the result/report.
The baseline blobs were checked against current main:
result `ceec6960b756d275354f00c58e429cf0e498c583`,
report `48f7b052bab8574c85fc0ef4d6ddb467fa56edc1`,
handoff `651de4b35222e8d83dbf6fcccc8892c2d87d19e8`.
All 119 inherited IDs remain. Only the four missing items specified by that
patch change; all inherited library/planned objects remain unchanged.
Five BP proof nodes and four unreviewed source issues are integrated.

Five additional generic Mathlib theorem nodes identify actual Taylor,
interpolation, Vandermonde, finite-root and mean-value suppliers at the
prescribed pin. Their missing adapters are explicit in the result and final
report section. The result now has 129 items (27 library, 8 planned, 94
missing), six routes, 87 uniquely routed missing targets, seven unrouted
diagnostics, and 17 selected G7 dependency edges.

Fresh PDF hashes match the previous record. Read the entire main author copy
(13 pages), BP pp.1–6 and §3 pp.10–17. Visually checked main p.4 and BP
pp.14,17. No final publisher revision acquired. The former handoff's full
BP1–BP6 proof, source issues and reproducible regression script now live in
the companion report, preserving prior authorship and historical limits.
Do not reapply the obsolete guarded patch or overwrite the 129-item result.

## Checks

Regression script rerun with mpmath 1.3.0 at 80 decimal digits: 19,720 exact
monomial cases, Taylor k=1..30, piece count d=2..300, 1,188 rounding cases
and 348 H+K chains passed. No Lean artifact compiled. On full repository
snapshot `a527ccdb2a6c6ae0a1971482ca9cfa4dd9b005f7`, the current
`check_paper.py` reported ok and `intake.py check-files` reported three files,
zero problems. Custom preservation, count, unique-routing, API-note and DAG
checks passed; the full details and checker hashes are in the verification
object. These checks do not establish mathematical completeness.

## Resume here

1. Read the final report section and BP1–BP6 immediately before it. G7 no
longer lacks an integer-rounding argument: the proof is written and its
generic suppliers are partly matched. Do not spend another checkpoint merely
transcribing it.
2. Close a genuinely remaining G7 interface: rectangular evaluation-rank/
kernel equivalence; repeated-Rolle derivative witness and factorial bounds;
Taylor-within endpoint conversion; or nonzero specialization/degree bounds.
Read actual pinned statements and instantiate their hypotheses. The five
generic supplier nodes are not proof-ready consuming theorems.
3. Alternatively, acquire an authorized final 2019-revised/2020 BSTTTZ
version and compare it. Public AMS PDF retrieval failed; restricted deposits
must not be treated as accessible or equated with the public v1 preprint.
4. For the graph cover, establish proper Bézout through SF.5, smooth branch
continuation in open strips, and inversion of steep graphs. Do not promote
the weaker 8d³ finite-point cover to the source's stronger O(d²) whole-curve
decomposition.
5. Other substantial gaps remain: G1 primitive-prefix generic interfaces;
G2 relative-genus diagnostic/source reconciliation; G3 original Brumer–Kramer
and HV proof interiors; G4 torus/resolvent transfer; G5 hyperelliptic descent
and bad-prime/model discriminants; G6 del Pezzo height normalization and
singular fibers; G8 counting originals; G9 q-uniformity, epsilon, gonality
and characteristic-two/inseparability issues. G10 retains recursive closure
and the incomplete source-issue inventory.
6. E1–E4 are proposed issues inherited from #1817, not accepted errata.
Their limited novelty searches and this worker's formula checks do not
constitute an independent review. Preserve source-version qualifiers.

Current generic owners stay unchanged: determinant methods imports generic
linear algebra/calculus and SF.5 intersection theory; basis reduction belongs
to GN.5; arithmetic torsion applications extend completed EffectiveBounds.
Never re-plan the inherited library objects. The complete historical report,
source metadata and verification history must survive the next continuation.
