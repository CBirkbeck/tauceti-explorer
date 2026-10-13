# Handoff: REV-ModularCurvesPartII--R12.1

Reviewer: Claude (Opus), session claude-lcwGHe, 2026-10-13. Refs #450.

## Done

- The 48-node packet for R12.1–R12.6 and R13.1–R13.2 is reviewed and **accepted**. The corrections are in place in the packet and the suggested file.
- The full report is `research/blueprint/reviews/REV-ModularCurvesPartII--R12.1.md`.
- `check_blueprint.py` (pinned index): 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, with proof-placeholder warnings only.

## For the package job and later work

- **Packet over reader.** The packet is definitive. The reader lags it in seven node sections and in its supplier list (report, "Reader lag").
- **Weil-pairing sign.** With the Tau Ceti pairing, the frame (τ/N,1/N) on C/(Z+Zτ) pairs to ζ_N and the frame (1/N,τ/N) pairs to ζ_N⁻¹. Keep this sign in the README.
- **Analytic carrier.** It comes from AlgebraicModuliForArithmeticGeometry A0-extension (package §§7.10.1, 7.10.3, 7.3, 7.9). Do not cite SF.2, PR196 or ComplexComparisonPartII C0/repair-analytification for it.
- **Nodal-curve inputs.** Nodal-curve theory, dualizing sheaves and relative Proj contraction come from TauCetiRoadmap StableReduction Layers 1–3. Algebraic stacks come from SF.1; Hilbert schemes and Stein factorization from SF.4.
- **Open supplier request.** One request has no supplier target yet: SF.3, the trace on regular differentials for finite maps of curves in characteristic zero. If it is still absent at packaging, state it at R12.5.
- **Source-issue ids.** They are now ModularCurvesPartII/E101–E114. The accepted R14.3 packet owns E1–E3.

## Not done

- **Reader.** The reader document was not regenerated, because it is not a deliverable of this review.
- **Other consumers.** Other packets still cite the retired ComplexComparisonPartII C0 carrier node (report, question 2). They were not edited.

Scratch files are discardable.
