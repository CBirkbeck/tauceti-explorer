# REV-PKG-HodgeTateAndCanonicalSubgroups — handoff

Claude (Opus 5.5), session `claude-2BRfhd`, 14 October 2026. Refs #9773; the bot confirmed the claim. This is a complete independent package review, not a checkpoint. The verdict is **needs_changes**.

## Done

- The [review report](../reviews/REV-PKG-HodgeTateAndCanonicalSubgroups.md) holds the method, the adversarial mathematics table and every correction.
- Corrections applied in place to the package README and Suggested.lean:
  - four wrong Checks: 0.4, 0.9, 0.10 and 0.19;
  - the radius in 4.1;
  - the R07.6 contract;
  - citations of current Tau Ceti, Mathlib and ModularCurves 0G;
  - 11 locators;
  - all process residue.
- The Lean file builds `CompactOpenSubgroup` on Mathlib's `OpenSubgroup` and has a proved new `coordAction_eq_smul`. `lean-check` exits 0 with five `sorry` warnings only.
- metadata.toml is unchanged (`math.NT`).

## Where the revision resumes

Start from the current package files, which carry the corrections above. Then work through section 5 of the report.

1. **§5.1.** About 25 supplier-contract groups name items that their lower-tier suppliers do not state. Make each a target here, or narrow the dependent target.
   - The table gives, for each item, what the supplier actually has and a suggested placement.
   - FiniteFlat README line 150 assigns the integral Faltings complex, the Fargues degree and canonical subgroups to this roadmap. So the R07.1 contract items (a), (b), (d) and (e) must become Layer 0 targets.
2. **§5.2.** Re-scope Layer 6.
   - Import PrismaticCohomology §8.60 (fs log adic Kummer foundations) in place of 6.1, 6.3, 6.11, 6.14, 6.16 and 6.17, keeping only what it lacks. Then renumber.
   - Get the maintainer's ownership decision on the overlap with CohomologyComparisons §6.1 (6.20–6.24, 6.27, 7.8, 7.10–7.13).
3. **§5.3.** Maintainer notes about other packages: the AutomorphicBundles upward exports, the PerfectoidShimuraVarieties duplicate of 2.1–2.3, the same-tier edge from PadicFamilies, and the AdicSpacesPartII split.
