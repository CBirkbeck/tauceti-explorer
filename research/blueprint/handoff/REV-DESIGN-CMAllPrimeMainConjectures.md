# REV-DESIGN-CMAllPrimeMainConjectures handoff

Completed independent review, 2026-10-19, by Codex session `codex-QkCBWL`, issue #1888. **Verdict: needs_changes; this is a finished review, not a checkpoint.** The original design was by Claude Code session `claude-dBmbUG`.

Read the review report first: `research/blueprint/reviews/REV-DESIGN-CMAllPrimeMainConjectures.md`. The packet and roadmap definition contain matching review verdicts. All 54 nodes were checked: 24 verified, 26 corrected, four unverifiable; no nodes added. Final inventory: 82 API entries, 47 tests, 25 planets, 14 baseline declarations, 25 requests, 13 gaps and three confirmed source issues. Seven stages remain partial or planned. No mathematics is claimed formalized.

The substantive remaining blockers are:

1. **CZ.0/tower-unit-module-structure:** prove R-torsion-freeness and the all-p Z_p² rank formula, with the correct ray-tower j_* comparison. Vanishing of roots of unity in the norm limit only controls Z_p-torsion. Selmer L3's current cyclotomic statements do not supply the missing theorem.
2. **CZ.3/two-variable-coleman-map, elliptic-units-to-katz-measure, katz-form-main-conjecture:** obtain an exact primary construction with coefficient extension, kernel/cokernel, image and exceptional-character conditions. Rubin Remark (1), p. 37, does not verify all these statements. Anticyclotomic projection requires control, Tor and local terms; arbitrary specialization of characteristic ideals is not a proof.
3. The packet's other gaps remain: integral Tamagawa comparison (especially the dyadic input), KK3, geometric de Rham comparison, general-weight CM induction, Ribet/theta-series converse and exact level, nonvanishing, vertical theta-value integrality, p-divisible class-number comparison and exact functional-equation factors. Public source URLs, versions, SHA-256 hashes, dates and theorem/section/page locators are all preserved in the packet. Nothing needed to resume depends on scratch files.

Important corrections now applied: isogeny degree coprime to N(a), relative O_𝔭-height versus ordinary height, theta translation z−ν_n, inverse semilinear twist, exact conductor in coefficient reciprocity, Tate twist before exp*, explicit equality-descent a-torsion argument and rational-only Z(f) divisibility. The source error E3 is new: Kato (15.4.2), p. 252, fails for E→E/E[a] without the coprimality condition. Existing E1 (Lemma 14.15 cross-reference) and E2 (conjugation in Lemma 15.11's proof) are independently confirmed.

Current Tau Ceti completed group algebras, their map API, Hecke-character carriers and current ClassFieldTheory cyclotomic normalization are imports, not new targets. Their newer availability is distinguished from the fixed Mathlib/Tau Ceti baseline. The stale determinant-functor dependency was replaced by a precise request to PMIA L5. The six packet restructuring proposals need maintainer action; no supplier or upstream file was edited. Preserve CZ.5/CZ.6 ownership and the KatoEulerSystems cycle avoidance described in the report.

The standalone reader was outside #1888's authorized paths. Include `research/blueprint/readmes/CMAllPrimeMainConjectures.md` in the revision job and synchronize it with the corrected packet. The roadmap definition's embedded introduction and stage descriptions already have qualifications.

Checks: indexed blueprint validator **0 errors, 0 warnings**; source-issue/version validators **no errors**; complete node-review coverage and internal DAG/stage order checked; all 11 definitions/constructions have at least three tests; planets satisfy per-stage bounds. Shared pinned `lean-check` **exit 0**, with five `sorry` warnings only; no sorry-bodied data. Final intake file validation, sorry-data validation and `git diff --check` passed. The suggested Lean file contains only light forms available at the pins, not a proof of the roadmap.

Next action: orchestrate a design revision addressing the four unverifiable nodes and the explicit supplier gaps, with reader synchronization; then commission a fresh independent review. Do not package or promote this needs_changes plan.
