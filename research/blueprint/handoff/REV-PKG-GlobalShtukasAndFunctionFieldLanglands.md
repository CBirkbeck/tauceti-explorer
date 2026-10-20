# REV-PKG-GlobalShtukasAndFunctionFieldLanglands

Completed by Codex, session codex-eGSrmO, on 2026-10-20. Refs #10901.
Independent of package author Claude session claude-rmM08Z. Verdict: accepted
with the corrections in this review's report.

The README keeps 93 targets: 92 accepted-plan targets plus the necessary
stack-sheaf target GS.1.4. Confirmed the author's twelve AL.3 deferrals; no
additional targets were removed. Checked current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, its newer roadmaps and Completed,
and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` by mathematical
object and input/output, not names alone.

Corrections include relative HN hypotheses and positive-characteristic
strata, real shifted HN parameters, the positive-instability uniqueness
boundary, degree-injective central lattices, positive-rank mass formulas,
boundedness domains for stack operations, geometric versus arithmetic
Satake, torsion integral Satake with perverse truncation, good-leg and
good-place domains, all coefficient/leg quantifiers for full-cohomology
excursions, the p-adic slope inequality, determinant/opposition signs, and
explicit normalization and matrix-coefficient Checks. Suggested.lean now
uses real shifted slopes and documents the additional heavy README
definitions. It remains 249 lines, six light definitions, nine theorem
targets and eleven proved examples.

Read and verified fifteen randomly selected source locators (seed 10901),
the stack-sheaf sources and the sources behind the corrections. The report
records each locator and the adversarial pass over all 93 targets. The
maintainer-cleared Deligne printing was read in place; no book file or
passage was copied. All repository text is in our own words.

Important supplier versions for the port:

- AutomorphicLFunctionsAndLocalFactors PR #924, head
  `691b4b3310d33d5ad6b2b5224005a407eff9a1f8`: AL.3 retains the all-level
  GL_r correspondence and explicitly constructs equal-characteristic Artin
  constants and the product formula in its *Function-field local factors,
  multiplicity one and converse theorem* prefix. GS.7.10 consumes this
  prefix; do not duplicate it or substitute the p-adic result of
  ArithmeticGaloisRepresentations §2.7.
- EndoscopicTransferAndUnitaryTraceComparison PR #999, head
  `67d5fdc49feb67deecca4f6715125c134c871b34`: §§3.1–3.2 supply the
  everywhere-reductive Bun stack and local loop Grassmannian. GS keeps
  the stated model and multi-leg extensions.
- EtaleDualityAndPerverseSheaves PR #1040, head
  `9a0e8eeeb7bef06a13fdbda9d7c5551b368da248`: scheme-only operations;
  the required stack extension stays GS.1.4. If a stack-sheaf Part II is
  created later, move this target there once, preserving its hypotheses.

The internal graph has 93 targets and 198 prerequisite edges, is acyclic,
and has no later prerequisites. The roadmap is outside CaraianiNewton's
94-roadmap list; actual supplier prefixes were audited rather than assigning
an unsupported numerical tier. The older atlas AL/ET link maps still need
the maintainer's ownership cleanup already identified by the plan and
package author. Supplier PRs must reach upstream in the proper order before
the maintainer ports the dependent roadmap. No other job's files or packets
were changed.

Checks: final `lean-check` exited 0 with exactly nine sorry warnings;
`check_sorry_data.py` exited 0; `check_blueprint.py` on the unchanged
104-node packet gave 0 errors and 0 warnings; internal links, definition
Checks and graph ordering passed; `git diff --check` passed; intake
`check-files` on the deliverables gave 0 problems.

Nothing remains for this job. Resume, if needed, from the independent
review report and package, which retain all findings needed after scratch
cleanup. No suspicious instructions were encountered in issue, PR or source
material. This run took no second claim.
