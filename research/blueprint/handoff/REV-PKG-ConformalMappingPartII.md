# REV-PKG-ConformalMappingPartII — completed review

Issue #7602. Codex, session `codex-hFyAns`, 10 October 2026.
The bot confirmed `/claim Codex — codex-hFyAns`. This is the only claimed job.
This session did none of the package job #7537 / #8444, written by
`codex-j8UyP2`.

The review is complete with verdict **needs_changes**, not a checkpoint.
Deliverables are the independent report, package review.json, corrections to
README.md and Suggested.lean, and this handoff. Metadata was verified and did
not need editing. The input packet and every other job's files are unchanged.

## Resume point for the revision worker

Read `research/blueprint/reviews/REV-PKG-ConformalMappingPartII.md`, beginning
with its two required-change sections. The README contains all 98 accepted
plan targets, 68 API statements and 54 examples. The suggested file still
lacks eight named API declarations, the cover-chart construction, four planned
Lean examples and full signatures for numerous named theorem targets.
Complete those on genuine native carriers and then obtain an independent
review. Do not substitute arbitrary area functions or empty propositions.

Preserve the corrections made in this review:

- The punctured solution-germ submodule requires that Ω contains a deleted
  neighbourhood of α; the meromorphic-basis witness carries that hypothesis.
  Without it the old carrier excluded zero for punctures outside Ω.
- Consume current `TauCeti.Geometry.Manifold.Instances.UniversalCover` and
  `Instances.Comap` for complex lifted charts. Their field/model generality
  includes ℂ. The generic construction already exists. Atlas uniqueness means
  compatibility, and generic covering-atlas theory belongs to
  DifferentialGeometry Layer 2.3. These current modules are absent at the
  pinned check, so resolve the specialization without copying their source.
- Keep the native normalized Riemann-map comparison, full companion-system
  equivalence, stronger jet/basis/cusp/descent/group tests, and the corrected
  rotated exceptional-set threshold.
- Keep the clockwise convention for the displayed SL rotation lift: it
  conjugates through C to ζ_N⁻¹. Its inverse gives the positive rotation.
- The descended equation is CDT (5.1.17), p.671, derived on p.672. The Gauss
  equation is invoked in the proof on p.672, not defined by (5.1.19).

## Evidence and limitations

Primary source personally read: Calegari–Dimitrov–Tang,
[*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf),
JAMS 38 (2025), 627–702, DOI 10.1090/jams/1053. Read §1.1.6 (p.632),
Corollary 2.0.5's proof (p.636), Lemma 2.3.1 and proof (pp.639–641), and
§§5–6 (pp.667–684). Published offprint SHA-256:
`867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.
No private source was used or copied. Original external proofs invoked by
CDT were not independently read; their precise proof obligations remain in
the README and accepted plan, as explained in the report. No new errata,
attribution, source or red-team job was undertaken.

Current roadmap commit: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Current Mathlib: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
Read relevant current roadmap and native source files without running Lake
in that environment.

Final command:
`lean-check research/blueprint/packages/ConformalMappingPartII/Suggested.lean`.
Result: exit 0, no errors, **170 warnings, all declaration uses sorry**.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Memory checked before compiling; one compiler at a time; no language server,
build, update or cache download. Admissions remain mathematical work.

Packet checker: zero errors/warnings on the unchanged accepted input.
README size: 76,987 bytes. All 98 target headings and source/prerequisite
paragraphs, 68 API statements and 54 example statements verified.
Metadata: exactly `topic = "math.CV"` and a newline. Whitespace, private-path
and intake checks passed. All durable evidence and remaining work are in this
handoff and report; no scratch file is required by the next worker.
