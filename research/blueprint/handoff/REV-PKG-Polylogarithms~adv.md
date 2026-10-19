# Handoff: REV-PKG-Polylogarithms~adv

Issue [#11071](https://github.com/CBirkbeck/tauceti-explorer/issues/11071). Reviewer: Codex (GPT-6), session `codex-4Sobgu`, 2026-10-19. Branch `codex-4Sobgu-review-polylogarithms`.

## Completed job

Completed the independent package review and fixed the correctable defects in place. Verdict **needs_changes**, with the full adversarial table, source sample and validation in [the review](../reviews/REV-PKG-Polylogarithms~adv.md). The review record is [review.json](../packages/Polylogarithms/review.json). This is a finished review, not a checkpoint; no second issue was claimed. The claim bot confirmed this session at [the issue](https://github.com/CBirkbeck/tauceti-explorer/issues/11071#issuecomment-6276130153).

Reviewed the six packets (169 distinct targets), 47 README subsections and all light Lean declarations. The previous package author was `codex-ckSqbd`, so this is not a review of this session's own work. The package README keeps all existing Checks and adds negative controls. Suggested.lean has 369 lines, 18 theorem targets and 21 proved definition examples; no sorry-defined carriers. Metadata is unchanged.

## Required continuation

1. **G1:** supply actual plans for Polylogarithms Part II's motivic-correlator/cluster/weight-four machinery and GeometricTopology Part II's ideal-boundary regions and truncation convergence. Named endpoint contracts do not close these prerequisite chains. Resume at the scope/exact-contract sections and §§2.4, 4.5–4.6. Published weight-four existence remains unconditional.
2. **G2:** prove the top quotient normalization or replace it with a fully verified coherent comparison. Resume at §§3.5–3.7, G95 §3.2 p.264, (3.5) p.266, §5.2 pp.285–287, Theorem A p.293, and GR §§7.2–7.3 pp.64–67. G95's bottom map has coefficient -1/6 times the unnormalized alternation, so r4=18f0; G94's formula has another coefficient. Exact boundaries do not establish r6=18M3 in B3, and this review does not certify a replacement constant for GR Proposition 7.2.
3. **G3:** construct the multiplicity-bearing admissible incidence cycle and its permitted base-change/face API. Resume at §5.3, `admissibleIncidenceCycle`, before §5.11. AlgebraicModuliForArithmeticGeometry §1.6 gives point cycles and closed support, not this relative cycle theorem. Two points colliding must give multiplicity two.

The other inherited targets/conditions remain visible: universal Borel calibration, all-configuration higher differentials, relation-specialization induction, raw-current/Deligne dictionary, coherent complex transfers and a common elliptic logarithmic-product regularization. Their exact boundaries are in the report. Do not turn conditional results into unconditional maps. Suslin's primary proof stays with K3BlochGroups. The official NSW PDF URL served HTML; this review did not independently verify its page locators, and used no uncleared book mirror.

## Ownership corrections and removals

- DifferentialGeometry already owns the smooth form calculus, integration and Stokes; AlgebraicVectorBundles owns algebraic cycles/Chow rings. The new variants are LF topology, singular normalized currents and moving admissible families.
- Removed duplicate analytic cycle integration and positive-current extension targets: import ComplexComparisonPartII §C5.4 `AnalyticCycleIntegration` and `closedCurrentExtension`. Retained §5.2's LF-continuity, normalized-current and proper-resolution adapters, with their distinct statements and Checks.
- Correct owners for Chow parameters, analytification and proper/SNC resolution are AlgebraicModuliForArithmeticGeometry §1.6, §7.10.1 and Layer 9/§9.7. Retired R09.2/R09.7 Part II credits and broad C0 analytification ownership have been replaced. No supplier files were edited.
- `Distribution.delta` and `Distribution.lineDerivCLM` already provide scalar distribution operations. Current local logarithms are in `TauCeti.NumberTheory.LocalField.Logarithm`: `hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`, `valuation_log_sub_log`, `log_unitFiltration_injective`. The isometry/injectivity radius is the strict inequality e < (p-1)i. The new target is the global matrix/certification adapter.
- Replaced the retired ColemanIntegrationAndChabauty name with ColemanIntegration L0.F/L0.15–L0.18. This independent prefix supplies formal coefficient series and branches on ℂp, with finite-extension agreement. It does not import its later complex-polylogarithm consumers.
- The actual independent MotivicEtaleKTheory M.8 targets are `motivic-chern-character` and `deligne-regulator`, with HodgeStructures Layer 2 and MotivesAndAlgebraicCycles MC.2 prerequisites. The previous handoff's claim of an entirely unsplit circular M.8 should not be reused.

Current upstream (including the nine post-snapshot and four Completed roadmaps) and current Tau Ceti a91d3aaf were read only. No lake command was run there. The roadmap is outside the 94-roadmap tier list; no tier was invented and no upward supplier was introduced. G1 records the missing continuations rather than inventing live layer identifiers.

## Reproducing the nonfloating controls

The report and README contain all fixtures and outputs. Use exact rational determinants; identify Q-tensored rational units by their prime valuations (the sign is torsion), expand wedge products into sorted prime tuples with the permutation sign, then expand the unnormalized alternating sums. For r5's necessary tensor boundary use `(1-r) wedge r` tensor the determinant unit. Expand all six deletion faces and all 720 triple-ratio permutations on the stated nonconic tuple. The coordinate `(2,3,2)` is -60 for the former and 300 for the unscaled latter, and all coordinates match after -1/5. This is a boundary check, not a quotient-level proof. The two Lean ratio pairs are 6/5 versus 5/6 and 10/9 versus 1.

The trace calibration is a direct sum of the six matrix-unit traces: the alternating triple trace is -3, its half is -3/2. The finite elliptic Fourier calculation uses the displayed character derivative and `dz wedge dbar z=-2iA mu`, giving iA^3/(4pi^2), then the rho factor -4/3. No numerical period calculation is substituted for a relation proof or an analytic product limit.

## Validation and source provenance

- Final `lean-check`: exit 0, exactly 18 sorry warnings, no other warnings or errors. All 21 examples proved; at most two per definition.
- All six Polylogarithms packet structural checks: exit 0, zero errors and warnings. No packets changed.
- Intake file check over the five changed files: zero problems. JSON/TOML parsing, 169-target coverage, source/shape review and diff whitespace check pass.
- Changed only the authorized package README, Suggested.lean, review.json, review report and this required handoff. No sourced passages or source PDFs entered the repository. No suspicious command-bearing untrusted instructions were encountered or acted upon. No credential was used at a source's request.

Sources were retrieved and read on 2026-10-19. The README gives bibliographic details; hashes below pin the exact public files used. These files and all computations were scratch only and are deleted after the PR opens. The report retains every locator and the fifteen-paragraph sample, so continuation does not depend on scratch files.

| Source | Public file | SHA-256 |
|---|---|---|
| G04 | [PDF](https://arxiv.org/pdf/math/0207036v3) | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| G00 | [PDF](https://arxiv.org/pdf/math/0003086v1) | `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea` |
| GR | [PDF](https://arxiv.org/pdf/1803.08585v5) | `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df` |
| BFT | [PDF](https://arxiv.org/pdf/0909.5296v1) | `63155506c01244497f732d6d57cf78b979a18cbbe24cbca8fade1da99f359cd5` |
| D96 | [PDF](https://arxiv.org/pdf/alg-geom/9512016v2) | `8e0798f9d67fbbd4ca14a2da386e130e8efb5785a5f01304ac3c268a6e0d3712` |
| G95 | [PDF](https://sasha-goncharov.github.io/Advances1995.pdf) | `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344` |
| G94 | [PDF](https://sasha-goncharov.github.io/SeattleMotives.pdf) | `e664e340573fcadd339e46c8d4a105a00f4cae0700622884455c4c9c60c55225` |
| Z07 | [PDF](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| Z90 | [PDF](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf) | `96bbb5f616dfac26e28c1da4657b2c5ae9cefa462213279797ccd44b71e1bb19` |
| DEM | [PDF](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf) | `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1` |
| BUR | [PDF](https://www.icmat.es/miembros/burgos/files/tesis.pdf) | `65a531b4ed7cc8d0f1318645aaa7003a0d685e65ae7706fc01249fdb3fe8457c` |
| NEK | [PDF](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf) | `3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd` |
| SCH | [PDF](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf) | `9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b` |

NSW is deliberately absent from this fingerprint table: no PDF was obtained in this review. The prior author's hash is not evidence of independent access.
