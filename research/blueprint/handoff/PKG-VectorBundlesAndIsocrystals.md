# PKG-VectorBundlesAndIsocrystals

Completed by Codex (GPT-6), session `codex-IDkKsS`, on 9 October 2026.
Issue: [#7498](https://github.com/CBirkbeck/tauceti-explorer/issues/7498).
Branch: `codex-IDkKsS-vector-bundles-package`.
Claim confirmation: [bot comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7498#issuecomment-6073434806).

## Deliverables

- [README](../packages/VectorBundlesAndIsocrystals/README.md): a standalone roadmap with purpose, boundaries, coefficient/Frobenius/slope/cohomology conventions, native library starting points, the fine construction order and all six displayed layers. It includes all 127 targets, all 168 API statements and all 124 examples/tests from the current accepted parts. Each target has sources with section/theorem/page locators and exact prerequisites; local targets have working anchors. The final document is 193,232 bytes, under the 200 KB limit. Proof-step, coverage, request and process inventories were not transcribed into the roadmap.
- [Suggested.lean](../packages/VectorBundlesAndIsocrystals/Suggested.lean): the two current component files joined with one header and one block of 32 distinct imports. Their executable Lean contents are unchanged. Both namespaces and all explicit omission/contract indexes are retained; explanatory comments now refer to the package README. The header states the distinction between typed algebraic/numerical components and the missing geometric realization.
- [metadata.toml](../packages/VectorBundlesAndIsocrystals/metadata.toml): `topic = "math.NT"`.

No packet, part reader, assembly, atlas data, ownership or link file was changed. This is a completed package submission, not a checkpoint. The next action is independent package review, including a fresh whole-file `lean-check`.

## Input reconciliation

The assembly dated 7 October predates the accepted revision-two work of 8 October. I used the current `VectorBundlesAndIsocrystals--VB0.json` and `--VB3.json` as the mathematical authority and joined their current individual suggested files, rather than the stale assembled executable content. The accepted reviews are `independent-review-REV-VectorBundlesAndIsocrystals--VB0~2` and `independent-review-REV-VectorBundlesAndIsocrystals--VB3~2`.

The package retains the revision-two corrections: both trace adjunctions and their classification-map use; the finite/free witness on one generator family; the sign reversal under the bundle functor; denominator tensor multiplicities; the zero-slope BC boundary; upper geometric versus lower KL polygons; the degree-forced multiplicity m=d; the negative sign in dual presentations; period-functor evaluation; the finite BC hypothesis in unrestricted VS Hom vanishing; the rational marking of lattice examples; and the corrected source locators. The Lubin–Tate paragraph spells out the coefficient extension of the source’s rank-one `(E, π⁻¹)` notation as `D(−1,1)` with `π⁻¹σ`, consistent with the package conventions. The classical CN countability/separability hypotheses remain distinct from general-coefficient diamond statements.

I read `UPSTREAM_GUIDE.md` and the local upstream Hodge Structures and Reductive Groups READMEs in full. The package follows their target/API/milestone style, organized around constructions rather than a source's successive sections. Statements are in our own words; no source passage was added. No restricted library book was needed.

## Checks

1. `python3 scripts/check_blueprint.py` on both unchanged input packets: **0 errors, 0 warnings** each.
2. Whole-file `lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`: **exit 0; 0 errors; 231 warnings, all “declaration uses `sorry`”**. This was run initially on the join and again after the final Lean comment edits. Memory available before the final run was 111 GB. There was one check at a time for this worker; no library build/update/cache command or language server was used.
3. Content checks: all 127 unique target anchors, 127 source blocks and 127 prerequisite blocks; all 168 API and 124 test names occur in both files; no unresolved internal/reference links; README below 200,000 bytes; metadata exact; 32 unique imports; no empty `Prop := sorry` definitions. After stripping comments, the executable join equals the concatenation of the current accepted component bodies.
4. The direct internal node-prerequisite graph is acyclic. This check concerns the 127 targets, not the whole atlas stage graph or supplier dependencies.
5. All 29 baseline declaration statements were read from their pinned Git objects, and the reviewed library audit was read. There is no dedicated audit row for this roadmap; nearby Bun_G entries do not supply higher-rank isocrystals, curve HN or BC geometry. Existing sheaf, Picard, Brauer and derived-category infrastructure is reused.
6. `python3 research/blueprint/intake.py check-files` and `git diff --check` passed on the four final deliverables before submission (4 files, 0 problems; no whitespace errors).

### Effective library versions in the compilation

Mathlib's existing build is exactly at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti checkout's HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the atlas pin `f790474821cf4256814db967cb154e7af3d0c369`. I recursively enumerated every Tau Ceti import used by this file and compared each source byte for byte with the pin. All seven match:

- `TauCeti.AlgebraicGeometry.AdicSpace.Cont.Basic`
- `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`
- `TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum`
- `TauCeti.RingTheory.Valuation.Continuous.Basic`
- `TauCeti.RingTheory.Valuation.Trivial`
- `TauCeti.RingTheory.Valuation.ValuativeRel.Basic`
- `TauCeti.RingTheory.Valuation.ValuativeRel.Comap`

The full native file compiled, with its original native `Spa.Basic` import; no library declarations were inlined or compilation imports weakened. The separately cited finite-presentation, line-class and `Spa.Spectral` statements were read at the pin, but are not imports of the executable join. Their source-level comparisons remain honestly catalogued where the current component files omit them. The compilation checks admitted component signatures, not implementation or proofs of the geometric targets.

## Inherited mathematical obligations and plan observations

The package does not discharge proof refinements recorded by the accepted plans. They remain requirements for implementing the stated targets:

- **VB0/G-INTEGRATION and VB3/G-ORDER:** the early fundamental sequence and section/divisor identification must be separated from the later VS1 Weil/reciprocity comparison. The existing fundamental-sequence contract still lists VS1 because it includes that final comparison, while twist cohomology and the key extension argument need only its early portion. The README specifies that separation in construction order and at the relevant targets; it preserves the full supplier list without pretending the aggregate stage graph has been repaired. Apply the atomic supplier/edge integration in its authorized scope, preserving the narrow RF3 rank-one/partial-chart interface.
- **VB0/G-DM:** higher-rank rational classification needs the eigenvector calculation behind Ked05 Lemma 4.3.3 and a complete equal-characteristic argument, beyond the pinned rank-one theorem or Lurie's statement.
- **VB0/G-GEOM and G-HN:** construct the independent early chart cover, overlap comparison and finite-projective equivalence; prove meromorphic trivialization and the fixed-rank degree bounds before general relative GAGA or classification.
- **VB0/G-GG:** use the corrected KL half-annulus contraction proof and prove its π/q normalization for general E. The defective printed FS estimate is not an input.
- **VB0/G-KEY:** the analytic affine-line diamond comparison and open-image step require the perfected analytic affine line in equal characteristic, with fractional exponents eliminated by π-linearity.
- **VB3/G-LT:** R07.2 must supply the normalized crystalline φ=π Hom comparison. SW13 full faithfulness alone is insufficient.
- **VB3/G-CONTRACT:** untilt evaluations must jointly detect vanishing and give uniform contraction/escape bounds on quasicompact opens.
- **VB3/G-SPATIAL:** the smooth-cover spatiality and locally closed generalizing-stratum coverage criteria require their precise supplier statements.
- **VB3/G-LEBRAS:** construct hypercohomology full faithfulness and the sympathetic-evaluation comparison; a generic equivalence parameter proves neither.
- **VB3/G-HOM:** prove the bounded-image lemma for arbitrary VS natural maps into B_dR, without assuming period-linearity or cyclically using the Part II h-exactness theorem.
- **VB3/G-PATCH:** the separate nodal counterexample is established at the sheaf level; its stronger bounded-ring realization needs Witt/Robba patching and Frobenius compatibility. The established Tate-curve example and the sheaf-level nodal assertion are preserved.
- **VB3/G-INTEGRAL:** the integral smooth-affine connected-fibre Tannakian dictionary belongs to Reductive Groups, Part II.
- **The two G-LEAN records:** geometric Perf/curve/period/diamond carriers are not present at the pins. The file preserves typed components plus explicit omitted signatures, never arbitrary proposition fields or an implementation claim.

VB3/G-COMPANION still contains an obsolete description of VB0 as needing reader synchronization; its revision-two review is now accepted. The package uses those current corrected statements and retains the substantive imported proof requirements. The assembly's old needs_changes descriptions are also obsolete. These are reported here; the package issue does not authorize editing those files.

## Source spot checks

I fetched and read the relevant boundary/sign statements in these public versions on 9 October. Their hashes agree with the accepted inputs:

- FS, [Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`; II.2.2–II.2.5, II.2.19 and II.3.2–II.3.3.
- KL, [1301.0792v5](https://arxiv.org/pdf/1301.0792v5): `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`; §§7.3–7.4 on pure models and polygon direction.
- CN, [CN5.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf): `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a`; §§3.2.5–3.2.8 on the reciprocal slope boundary, period evaluation, curvature and height.

The README distinguishes the CN arXiv and author copies, fixes the versioned KL/GLX links, and preserves printed-page conventions, including the SW ten-page PDF offset and the separately paginated FF preface. Other source locators are carried from the accepted mathematical inputs, not claimed as an independent rereview of every source. Disposable generation scripts, PDFs and logs are not part of the submission. All durable results and remaining implementation boundaries are in these four deliverables and the existing accepted plans.
