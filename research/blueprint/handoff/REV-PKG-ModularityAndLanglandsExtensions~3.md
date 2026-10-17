# REV-PKG-ModularityAndLanglandsExtensions~3

Claude, session `claude-X031vr`, 2026-10-17. Refs #10232. **Done:** an independent package review with fixes applied in place. The verdict is `accepted` (`packages/ModularityAndLanglandsExtensions/review.json`); the report is [reviews/REV-PKG-ModularityAndLanglandsExtensions~3.md](../reviews/REV-PKG-ModularityAndLanglandsExtensions~3.md).

## What changed

- **README.**
  - Layer 0's bookkeeping record was retired and Layer 0 renumbered 0.1–0.4.
  - The mixed-parity symmetric-power route now follows Thorne 2024 (§§4.22, 4.35, 4.37).
  - §2.51 now sources l>n to ACC+ Theorem 6.1.2(4).
  - Hidden PotentialAutomorphyInfrastructurePartII stage ids and packet slugs became this package's own § links.
  - §§5.8–5.9 now import SmoothRepresentationsOfLocalGroups SR.6.1–SR.6.3.
  - §3.1 gained Tau Ceti library agreement Checks.
  - Duplicate Needs items, process residue and unlinked references were cleaned up.
- **Suggested.lean.** Every unit-test `example` is now proved; the Layer 0 heading matches the README; the witness docstrings point to the README Checks they pin.

## Follow-ups for the maintainer and for other plans

1. **Layer 5 geometrization (§§5.7–5.10).** The packet says these objects belong to the geometrisation roadmaps; the FIX~adv round built them here instead. Nothing in this roadmap consumes §5.10. Decide whether they stay here, in which case GeometricSatakeAndFusion, BunGAndNewtonStrata and ExcursionOperatorsAndSpectralAction import §§5.7–5.9, or whether §§5.7–5.10 move to those roadmaps.
2. **CrystallineLocalGlobalCompatibilityCM (tier 27).** Its Layers 1–7 and 9 overlap §§2.3, 2.4 and 2.6 here (Caraiani–Newton §§2–5). It must be revised to import them, as EllipticCurveModularityImaginaryQuadratic already does for §2.6.
3. **Draft PR dependency.** The draft PR should list its dependence on TauCetiRoadmap PR #1036 (GT.6, geometric ℚ-curves). That input is used only in the exceptional branch of §2.52, which is already conditional.
4. **Source errata.** The three corrections recorded as local negative controls are confirmed: Henniart 2009 (ω² for ∧² is a misprint for ω³), Wang's p.5 table (+6 at −I should be −6), and Clozel–Thorne III Theorem 7.1 (incomplete finite-place proof, per Thorne 2024 Proposition 8.3). An errata job may record them.

No packet, reader document or neighbouring package was edited. The scratch sources were deleted after submission; the report lists their URLs and SHA-256 hashes.
