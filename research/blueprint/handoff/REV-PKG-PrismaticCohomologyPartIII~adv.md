# Handoff: REV-PKG-PrismaticCohomologyPartIII~adv

Issue #10236. Codex — codex-4nDh4M. Completed 2026-10-17. Verdict: accepted with in-place fixes; no checkpoint or unfinished package defect.

The report `research/blueprint/reviews/REV-PKG-PrismaticCohomologyPartIII~adv.md` contains the full statement/instance pass table, source locators and public PDF hashes, plan coverage, current-library audit and ten-signature comparison. The mathematical roadmap is the package README; Suggested.lean has 22 proved representative examples and no invented carriers. `metadata.toml` is unchanged (`math.AG`).

Repairs: common E-power rescaling clears forward matrices, not both matrices and inverses; weight zero over F_p retains H¹; opposite-site variance; effective-to-all-weight full faithfulness without a forward dictionary cycle; transversal rational-chart presentation and computed Frobenius; integral absolute-prismatic versus fractional Hodge–Tate internal weights; operation/sign/cocycle/ramification negative controls.

Ownership adjustments to retain during port:

- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1–5, 11, 14, 16 already supply coefficient rings, Fontaine equivalence, effective full faithfulness, rational restriction and the all-weight Kisin lattice functor. §7.24 now compares prismatic evaluation to that functor; it does not construct the functor again. The G_K-action for different uniformizers comes from the crystal. No targets were moved upward or to a consumer.
- Current Tau Ceti `AlgebraicGeometry.AdicSpace.FarguesFontaine.{Y,Window,Quotient}` already supplies `spaY`, `frobeniusHomeomorph`, `windowU`, `windowV`, `spaX`, `quotientMap` and window/quotient properties. Scope credits those imports. Schematic Proj, GAGA and the particular filtered prismatic modification remain §7.0 targets. AlgebraicVectorBundles supplies general finite-projective/sheaf equivalence and duality.
- Parts I–II supply Layers 0–5. Part IV and PadicHodgeTheory are consumers. Part I complete module descent does not duplicate the punctured almost-perfect descent target in §7.2.

The issue's PrismaticCohomologyPartIII*.json plan glob has no matching file in this clone. Read the original PrismaticCohomology--PR.0.json PR.4/PR.7 targets and PrismaticCohomology.json when comparing plans: physical Layer 6 corresponds to PR.4, not the q-de Rham PR.6. Packets were not changed. The 33 PR.4 and 26 PR.7 targets are retained, with supplier-owned parts imported at their exact boundary.

Validation: final lean-check exit 0 with no warnings at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 / Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; both original packet checks give 0 errors and 0 warnings; package relative links resolve; intake check-files gives 0 problems; git diff --check clean. No build or language server was started in the current upstream checkouts. Current audit commits: upstream 0d144d044dacebca17b654695b6f1ad58f159b27, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

Nothing requires resuming this worker's review. The next action is the maintainer's separate mathematical gate/port. Source PDFs and working notes are not repository deliverables; the source identities and relevant locators are preserved in the report. No restricted source file or passage was copied into the submission.
