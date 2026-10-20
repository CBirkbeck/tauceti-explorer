# REV-PKG-HabiroCohomologyFoundationsPartII~codex1

Issue #11390. Codex, session `codex-e84W4H`, 2026-10-20.
Claim confirmed by the bot at 12:20:17 UTC. This is a completed independent
review of package PR #11385, not a checkpoint. Verdict: **needs_changes**.
No second job was taken.

## Completed

Read the worker, protocol, package-review and upstream rules; the actual
package and four-node plan; the design relocation manifest; all five
Habiro/trace supplier packages; the reviewed library audit; two current
upstream model roadmaps; and the current upstream roadmaps/library at
commits recorded in the report. The earlier review named by the issue
and package review.json were absent at baseline. The plan has no recorded
independent review; three supplier requests remain in that unchanged file.

Applied these corrections only to Part II's README:

- Global cotangent Tor-amplitude [0,1] in the identity-cover constructor,
  with a rational non-lci counterexample that all p-completion tests miss.
- Obsolete HR.6 étale comparisons now use Part I §4.21. Localized
  Taylor noninjectivity uses HC §5.3 through HR.5 and GSWZ Remark 1.2.
- The ku-lift counterexample uses QH Lemma 3.3 to exclude every pair,
  rather than excluding only one spherical-lift construction.
- Explicit h-localization for the λ-expression, the missing h^d in
  the sign check, and direct Pridham/HA/Stacks locators.

Checked all targets and their negative controls; the report gives the
fifteen sampled primary-source locators, supplemental checks, URLs,
access date and SHA-256 hashes. No restricted source was used and no
source text was added to the repository. No suspicious instruction was
encountered in source data. No target removal for current-upstream
duplication was necessary. Suggested.lean and metadata.toml are unchanged.

## Required next work

The report is
`research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md`.
Its R1–R4 are the concrete remaining defects. They require supplier or
ownership changes outside the files authorized by this issue:

1. Apply the existing design relocation manifest to
   `packages/HabiroCohomologyFoundations/README.md`: Layer 6 §§6.1–6.5,
   the trace clause only of §8.1, and §9.15's trace comparison clause.
   Keep trace-free algebraic/prismatic material there. Update aggregate
   contracts and downstream mentions in §§4.28/5.26. Keep the genuine
   RT prerequisite on Part I §4.28 and §5.26.
2. Move HC §5.5 `ordinaryDerivedComparison` and its derived checks to
   HabiroRings Layer 2 after its derived-completion construction. Keep
   the ordinary-module boundary example in HC. Also replace HR §2.13's
   QSeries QM.0 input by HC Layer 1 `qBinomial_factorial` and
   `qFactorial_pochhammer` for factorial divisibility.
3. Retarget RT's former HR.6 étale Habiro–Hodge input to Part I §4.21;
   current HR.6 owns scalar extension/number-field lines instead.
4. Align `HT-RT-framed`: the plan explicitly assigns full KU 6.10 to
   RT, whereas this package owns §§3.1–3.2 and RT has only ℤ[x].
   Follow the plan by moving the full framed targets/checks to RT §6.10
   and importing them into II §3.3, or obtain the maintainer's explicit
   ownership reassignment. Do not silently close this request.

The actual five-package graph still has Part I ↔ RT and HC ↔ HR cycles.
After these moves a conditional supplier-first order is HC → HR → Part I
→ RT → Part II. HR's scalar package already removed its former backward
cohomology dependency; do not reintroduce it or describe it as still present.
The report lists all other supplier edges and the external contracts.

## Validation

- `lean-check` on this package's Suggested.lean: exit 0, no errors and
  no warnings, using the shared pinned build after checking memory.
  All eleven native signatures were checked against the README.
- `python3 scripts/check_blueprint.py` on the unchanged Part II plan:
  0 errors, 0 warnings; four nodes, three requests, no closed stages.
- `python3 research/blueprint/intake.py check-files` on the four changed
  deliverables: 0 problems. `git diff --check`: clean.

The branch changes only this handoff, the review report, package
review.json and package README. The report contains all source/version
and repair details needed to resume; nothing depends on disposable scratch.
