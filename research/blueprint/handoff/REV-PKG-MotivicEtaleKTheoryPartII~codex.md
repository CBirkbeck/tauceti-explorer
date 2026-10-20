# Handoff: REV-PKG-MotivicEtaleKTheoryPartII~codex

Completed independent review of #11359 by Codex, session `codex-qLZIyx`, on 2026-10-20. Verdict **needs_changes**. This is the final review deliverable, not a checkpoint. The report is [the independent review](../reviews/REV-PKG-MotivicEtaleKTheoryPartII~codex.md); it contains the complete target audit, source sample, supplier findings and corrections. `review.json` agrees. No second job was claimed.

## Applied fixes

Corrected the inverse height adjoint and coefficient balancing; gave rational matrix/copower presentations for finite coefficient extension and Artin idempotents; separated ordinary and Tate archimedean cochains, including rational p = 2; counted infinity once in the compact-to-Selmer triangle; qualified the scope of Huber–Kings duality; added the nonempty prime-set hypothesis; clarified the Hochschild–Serre edge and its rational projector/lift-independence requirements. Replaced the uncleared Silverman reference by an elementary Northcott argument without accessing the book. Suggested.lean keeps five real-bodied definitions, eight admitted theorem statements and four proved examples; no admitted data, auxiliary development or fabricated carriers.

## Resume at these four mathematical contracts

1. README §§1.1–1.2: prove preservation of the chosen-model rational integral image by generic correspondences, including the coefficient action, projector and transpose; identify the model motivic image with the required K-theoretic integral part. Generic pull/push and the existence of the image separately do not suffice. Do not narrow to correspondences extending over a convenient model.
2. Conventions and §§2.6, 3.6: obtain the virtual-object determinant category/coherences for noncommutative coefficients, close its supplier contract in PeriodsAndSpecialValues/GeneralAlgebraicKTheory, and retain the general comparison. PadicMeasuresIwasawaAlgebras §5.1 is commutative. Huber–Kings Proposition 2.2.3 is an Artin/abelian-extension/odd-prime/r ≥ 1 result; general corrected duality compatibility needs its own proof.
3. §3.1: construct `padicRealizationOne_mem_g` and its good-reduction, weight ≤ −3 finite-condition consequence, with the syntomic compatibility. `PadicRealizationFinite` only supplies a conditional interface. The upstream order moves required local-condition material down; do not fill the gap with an upward PadicHodgeRegulators citation.
4. §4.5: reconcile Huber–Kings's integral regulator normalization with the normalized character and integral edge/Chern maps at p < k. Its Theorem 1.4.1 is for every odd prime. A p ≥ k specialization and an arbitrary-lattice formula with index are not substitutes for that generality. The case k = 5, p = 3 tests the factorial discrepancy without presuming which integral lattice has index one.

The issue's old revision template refers to an unrelated title and a prior review that was absent; actual package and accepted design were reviewed. No suspicious instructions were encountered in untrusted material.

## Moved material and sibling action

All 23 accepted targets have corresponding sections; source/proof gaps and lost generality are explicit in the report. Checked predecessor MotivicEtaleKTheory package history (`5ebc53629`, `0dec037e3` and main §12.7). Its zero-complex, inverse two-term, odd-swap, local-term, dyadic-perfectness and rational-versus-integral-generator controls survive in this package. No reverse reference to Part II was found in sibling packages, packets or link maps.

Manager follow-up outside this job: older MotivicEtaleKTheory §12.7 still has the special-value paragraph depending on PeriodsAndSpecialValues, while that package cites §12.7. The new package explicitly consumes only the independent arithmetic determinant/local determinant paragraph. Complete the pending sibling separation; no sibling files were edited here.

Current duplication audit used TauCetiRoadmap `origin/main` `14e4aedb9081a3822d7f020476e77cbb5de9e4fc`, including all nine newer directories and Completed, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read current Completed HodgeStructures and ImaginaryQuadraticClassNumber as models, and the current determinant supplier. No new target deletion was required. All existing Hodge, height, regulator and commutative determinant infrastructure remains a prerequisite. No read-only checkout was modified or built.

## Verification

- Revised `lean-check`: exit 0; exactly eight `declaration uses sorry` warnings and no other diagnostics. Only a closing comment changed after compilation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheoryPartII.json`: 23 nodes, 0 errors, 0 warnings. Packet unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/MotivicEtaleKTheoryPartII/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on all five changed deliverables/handoff: 0 problems.
- `git diff --check`: passed.
- README: under 200 KB; Suggested.lean: under 5,000 lines; metadata remains exactly `topic = "math.NT"`.

All five public source PDFs matched the accepted packet's hashes. The independent report preserves the reproducible random sample of 15 locators, extra source checks, all thirteen Lean signature checks and the adversarial table. Scratch PDFs/logs are disposable; no next worker needs them.
