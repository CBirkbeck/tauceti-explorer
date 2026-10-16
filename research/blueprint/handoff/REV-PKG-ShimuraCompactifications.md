# REV-PKG-ShimuraCompactifications

Completed independent package review for #9887, Codex session `codex-84ObTg`,
2026-10-16. Package author: Claude session `claude-GauUJT`, #9886. This reviewer
did not author the package. Verdict: **accepted after corrections**. No unresolved
review defect or work to resume remains.

The [review report](../reviews/REV-PKG-ShimuraCompactifications.md) records every
correction, all author-unverified source resolutions, the fifteen-target source
sample, current-library comparisons and an adversarial table for all 155 targets.
The [author's handoff](PKG-ShimuraCompactifications.md) remains the full mapping
from 148 accepted packet nodes to the README; all nodes and seven author-added
supplier targets remain. No packet or metadata change was needed.

The principal corrections are completion before localization with bounded poles;
finite stabilizers only on the appropriate positivity domain; full-boundary
positivity on all nonzero faces; object versus morphism descent; ordinary versus
derived inverse limits; pushout and character-action signs; projectivity of the
chosen refinement; relative Hodge ranks and determinant monodromy; geometric
connectedness/reducedness in the global-functions check; and exact source
locators. C5.10 now explicitly names the algebraic-space finite-étale Stein
factor theorem it proves. This is part of the existing component-detection
target, not an additional packet node. The Lean examples pin the quadrant
boundary-ideal counterexample, rank-zero boundary and support-function sign.

All author-unverified locators were inspected or replaced by inspected sources.
The random sample is exactly `random.Random(9887).sample(nodes, 15)` on the
148-node whole-roadmap packet, with its original order. The report lists the
sample and precise inspected pages. Cleared Faltings–Chai and Pilloni sources
were read in place without copying or recording passages; no private source is
included. Unavailable Cartan, KKMS and Demazure–Gabriel references were replaced
by the precise Pink, Lan and SGA 3 statements used. Moret-Bailly isotriviality is
XI.4.5, pp. 235–236, not IX.4.5.

Duplication checks used current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmaps,
Completed and the relevant actual declarations. Existing generic constructions
are imported. The retained generalizations now state their differences from
complex-coefficient toric schemes, generic relative Spec, elliptic F/V,
split-torus Frobenius and the field/rational-point global-functions theorem.
No duplicated target was removed and no target moved between owners.

The ramified construction C5.31 remains conditional on the explicitly stated
normal projective flat minimal model with Lan16's properties. General parahoric
moduli interpretations and ramified splitting-model charts are outside its
scope. AutomorphicBundles and HodgeTateAndCanonicalSubgroups are consumers,
not circular prerequisites.

Validation: final `lean-check` exited 0 at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474`, with 36
warnings, all `declaration uses sorry`, and no other diagnostics. The Suggested
file has 29 named declarations and 12 examples; no sorry-defined data or theory
development. `scripts/check_sorry_data.py`, the unchanged accepted packet's
`scripts/check_blueprint.py`, JSON and metadata checks, 155-target coverage,
internal-reference and definition-Check counts, intake `check-files` on all six
deliverables, and `git diff --check` pass. Source scratch and compile logs are
deleted after opening the PR; all findings needed by the next worker are in
the report and this handoff.
