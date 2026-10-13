# Handoff: REV-GeometryOfNumbersAndQuadraticArithmetic--GN.0 (issue #9282)

Claude, session `claude-OOfyXC`, 13 October 2026. This is a finished independent review, not a checkpoint. The reviewed part was written by Codex session `codex-iywz6Y` (PR #9370).

**Verdict: accepted.** Of the 15 nodes, 8 were verified and 7 corrected; none were added. There are no gaps, requests or source issues, and GN.0 stays `closed`. The report is `research/blueprint/reviews/REV-GeometryOfNumbersAndQuadraticArithmetic--GN.0.md`, and the per-node verdicts are in the packet's `review.checked`.

Main corrections:

- **Self-duality of ℤ^N.** It is now a proof step with its two Mathlib prerequisites, in orthogonal-saturation and in the Schmidt dual, because the parent bridges assume Δ* = Δ.
- **Schmidt dual.** It now cites the parent saturated-adapted-basis, and its locator covers p.7, where the quotient lattice is defined.
- **Standard-lattice covolume one.** The two-congruence target now cites covolume-square-gram and covolume_pos for it.
- **Nine API items.** They add the torsion description of saturation, the rank and primitivity of the kernels, the single-column, square and k > N values of G, and G's compatibility with current Tau Ceti `Submodule.minorsIdeal`. That last item is not typed at the pin.
- **A fourth minor-gcd test.** The new test fails √det(CᵀC); the original three tests did not distinguish G from it.
- **RT-AREA-algebraicnt-1/1.** It now follows its verifier: stage links into GN.2 and GN.3 only, with roadmap relations derived at assembly.
- **Planets.** A GN.0a/GN.0b sub-layer division is proposed, because the assembled GN.0 would otherwise show nine planets.

Checks:

- `scripts/check_blueprint.py` on the packet with the pinned index: 0 errors, 0 warnings.
- `lean-check` of the suggested file at Mathlib 082e2d37e8 and Tau Ceti f790474: exit 0, with 49 warnings, all `declaration uses sorry`.
- Every packet API and test name occurs in the file; every node id and prerequisite occurs in the reader.

For the orchestrator and assembly:

- Apply the GN.0a/GN.0b division.
- Drop the base packet's gap "Consumer weighted arithmetic metric adapter"; the accepted EffectiveBoundsCompactModels CM.0 nodes own it.
- Repoint ArithmeticStatistics ST.5's two requests to `arithmetic-two-congruence-covolume` and `arithmetic-minor-gcd`.
- Type `maximalMinorGCD_span_eq_minorsIdeal` once the Tau Ceti baseline includes `Submodule.minorsIdeal`.
- The stage links of RT-AREA-algebraicnt-1/1 belong to the link workflow.

No scratch file is needed by a successor.
