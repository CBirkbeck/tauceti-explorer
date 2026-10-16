# REV-PKG-ColemanIntegration~3 — completed independent review

Codex, session `codex-JQSj4l`, 2026-10-16.
Issue [#9881](https://github.com/CBirkbeck/tauceti-explorer/issues/9881).
Verdict: **accepted with fixes applied**. This is a complete review, not a
checkpoint. No second job was claimed.

## Delivered

Reviewed the full package and accepted plan, the preceding shape rejection,
two current upstream style models, a fresh random sample of fifteen source
locators, the flagged source passages, pinned library declarations, prerequisites
and current-upstream overlap. The detailed source sample, adversarial pass and
signature comparisons are in
[the review report](../reviews/REV-PKG-ColemanIntegration~3.md).

The 604-line suggested file meets the shape rule. The initial and final
independent `lean-check` runs both exited 0 with exactly 66 `sorry` warnings
and no other diagnostics. Shape, packet, submission-file and whitespace checks
pass. No compiler is running; public source downloads were scratch-only.

## Corrections to preserve upstream

- **Finite-word convergence is owned here, L1.21.** AdicSpacesPartII does not
  supply the previously asserted uniform connection estimate. The replacement
  derives scalar diagonal-tube bounds using lower RD.3.5/RD.3.12, proves the
  finite-unipotent polynomial denominator bound, then applies imported
  RD.3.17–RD.3.18. It glues on finite charts without trivializing Ω⁺. Use a
  uniformizer π in the ramified case. L1.22 and L1.43 consume this result;
  cohomological lift independence uses RD.4. Keep the non-unipotent exponential
  negative control: integrability alone does not imply the asserted radius.
- **The smooth differential comparison is owned here, inside L1.9.**
  `goodReduction_differentialsEquivDualizing` identifies Ω¹ with the
  dualizing sheaf already supplied by JacobianChallenge Layer B. It is
  trace-normalized, compatible with finite scalar extension and divisor
  twists. Stacks Lemma 53.4.1(6), Lemma 53.4.4(2), tag 0E31. Do not attribute
  this additional comparison to the existing divisor-duality API or replan
  the dualizing sheaf itself. Closed-point residues require field traces.
- **Both regulators use raw de Jeu symbols.** The factor is
  `(-1)^n (n-1)!` on the complex and p-adic sides. BBdJR Remark 4.16 changes
  its comparison map to suppress that sign; the package deliberately retains
  the raw convention. The n=3/N=2 witness gives complex regulator
  `(3/2)ζ(3)` and comparison coefficient `2/3`. Do not mix the two conventions
  when porting the determinant formulas or L3.37.
- **Exact K₀ supplier:** GrothendieckEulerForms Layers 0–2, specifically
  Layer 2 for K₀; vector-bundle and linear-functional Koszul suppliers remain
  imports. Their additional homogeneous-piece/Adams application is owned here.
- Correct BBK Definition 3 to p. 3; retain the ℚ₃ nonsplit étale-divisor
  example, separately normalized integration constant in weight one, and the
  distinction between a totally real base and a totally real character kernel
  field (χ₋₄ over ℚ is the counterexample).

No existing current-upstream target needed removal. Existing local-field
logarithms, Teichmüller lifts, Brauer induction, vector bundles, exact K₀,
general Koszul complexes and Artin Euler factors remain deferrals/imports.
The earlier downward ownership of L3.Fa–L3.Fd is unchanged: the higher
Polylogarithms, Borel and regulator roadmaps must consume these foundations,
not supply them back to this package. No supplier files or packets were edited.

## Versions and next action

Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read-only overlap audit: roadmaps `0d144d044dacebca17b654695b6f1ad58f159b27`,
current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No builds were run in either read-only checkout.

No review work remains. Next action is the maintainer's normal upstream draft
PR for the accepted roadmap package. The accepted packet's historical upward
citations and old source locators were not changed because packets are outside
this review's authorized scope; the package contains the corrected owned
foundations and locators. The report's acceptance concerns roadmap readiness,
not completed formalization or proof of the conjectural nonvanishing part.
