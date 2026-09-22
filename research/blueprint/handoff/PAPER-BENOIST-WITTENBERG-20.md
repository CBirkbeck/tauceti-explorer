# PAPER-BENOIST-WITTENBERG-20 handoff

Issue #1296 · Codex · codex-a71f92 · 2026-09-22

## Checkpoint

The full published 77-page BW I paper is read, including every proof and reference. The result has 182 items (7 library, 9 planned, 166 missing), seven routes for 165 missing items, and one quarantined false printed signature. Forty-six definitions/constructions have APIs and three tests each. Status is partial because the transitive proof inventory is not closed. No formalization is claimed; no Lean file is authorized or compiled.

All source URLs, SHA-256 values, precise read extents, classification evidence, dependency IDs, APIs/tests and twenty named gaps are in the result JSON. The report explains source corrections and ownership. Do not restart by treating this as an unread paper.

## First checks on resumption

1. Follow the live WORKERS claim protocol; never reuse this worker's old claim. Re-read the latest issue, main WORKERS/PROTOCOL and accepted changes.
2. Check whether the seven routes have acquired a reviewed design/owner. Coalesce both Part II IDs with PAPER-BENOIST-19: EquivariantTopologyRealVarieties and QuadraticFormsRealFunctionFields. Do not propose a second C2 topology or real-function-field roadmap.
3. Independently inspect printed Theorem3.16(ii), p.55. The real elliptic curve with a point shows the printed d>0 even-genus equivalence is false. Keep `printed-even-genus` quarantined. The proof supports d≥2 OR X(R)=empty; the no-Picard-2-torsion corollary still handles genus-zero curves.
4. Run the paper checker after every structural edit. Preserve the API/test obligations and single ownership.

## Priority proof work

Start with a coherent depth path, not another breadth-only summary.

- GAP-EFFACEABILITY: CHK §§5.1 and5.3 have now been read, including the exact infinite-field axioms and homotopy→key-lemma proof. Read §§2–4 geometric presentation/effacement, then verify BW's concrete semialgebraic excision and homotopy axioms. The source is publicly available at Bruno Kahn's linked author PDF. This closes the mechanism behind BW's E2 identification.
- GAP-ABEL-JACOBI: CTSS Corollaire1 and its coefficient-limit argument, pp.772–773, are read. Read Proposition1 and the construction identifying its maps with Bloch's λ; preserve the up-to-sign diagram. Locate/read van Hamel Theorem3.1 (Utrecht metadata found; PDF fetch returned403), including the general-real-closed-field adapter. Finish image=N^{d−2} and low-dimensional injectivity before declaring Theorem5.4 closed.
- GAP-SEMIALG/GAP-COMPARE/GAP-STEENROD: finish Delfs, Scheiderer, Edmundo–Prelli §§2–3, and Krasnov/Wu. Edmundo–Prelli arXiv v3 numbers the orientation theorem4.9, while BW cites published4.10. Integral and mod-two products are different.
- GAP-PICARD/GAP-QUADRATIC: extract Brauer/Picard descent, Jacobian divisibility and Witt/Pfister. The generic representation-theoretic Shapiro lemma and real-closed-field carrier do not supply these statements.
- GAP-DIAGONAL/GAP-GERSTEN: finish Bloch–Srinivas, CTV's correspondence appendix and Kerz, keeping the universal extension quantifier on CH0 support. Import M.5 norm-residue; do not duplicate it.
- GAP-CAMPEDELLI/GAP-SURFACES/GAP-QUARTIC/GAP-PART-II: perform the omitted example computations and read BW II §7/Proposition7.7. Every coordinate in the Example4.4 map is conjugated. The no-real quartic torsion formula is conditional over general R. Remark5.10's full Chow/Fermat assertions require additional work.

## Remaining inventory and integration

The JSON names the secondary remarks not yet fully extracted: Remark1.9's barred-γ integral formula, Remark3.13's Karpenko quadric over C((t))((u))((v)), and Remark3.21(ii)'s K3 example. Questions2.1,2.6,2.16,4.9 and the generalized Bloch conjecture are not theorem targets. Bredon factorization in Remark2.4(i) is not used by the Borel proof and has not been turned into an implementation target.

SF.2/MC.2/MC.7 are broad source owners; split their sublayers in a separate authorized integration job before adding dependencies. In particular, early SF.2 sites precede M.5 and its coniveau suffix follows M.5. Early MC.2 cycle classes precede the divisor/zero-cycle results used by later applications. Avoid blanket stage cycles. The current item dependency graph is acyclic.

## Checks at submission

The paper checker passed. A separate read-only check passed ID/reference/gap resolution, acyclicity, single routing, planned/source ownership and parent checks, all46 APIs with138 test contracts, ten source hashes, no-local-path scans, and finite parity/valuation/antilinearity/genus/rank calculations. No Lean test contract was executed. Recheck latest main and exact three-file diff before any subsequent submission.
