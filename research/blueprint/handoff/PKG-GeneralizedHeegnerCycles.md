# PKG-GeneralizedHeegnerCycles — package handoff

Issue: [#7902](https://github.com/CBirkbeck/tauceti-explorer/issues/7902). Worker: Codex, session `codex-JffRsg`, GPT-6. Branch: `codex-JffRsg-generalized-heegner-package`. Claim confirmation: [bot comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7902#issuecomment-6091677586).

## Delivered

The packaging task is complete: [README](../packages/GeneralizedHeegnerCycles/README.md), [Suggested.lean](../packages/GeneralizedHeegnerCycles/Suggested.lean), and [metadata](../packages/GeneralizedHeegnerCycles/metadata.toml). Only these three files and this handoff change. No packet, supplier plan, assembled reader, original suggested file, atlas data or upstream roadmap changes.

The README contains all 82 targets in nine layers, the 66 named API items and 58 named definition/construction tests from the accepted inputs, hypotheses, source locators, prerequisites and the exact supplier interfaces. The 16 GH.8 targets also retain their acceptance examples and proof routes. It distinguishes the fiber-power index m from CH's half-weight r, the source editions, full and half CM-unit factors, rational and integral maps, the initial trace equation, ramified character formulas, quotient-regulator injectivity, and the nonsplit tame-prime export. The document is below 200,000 bytes and contains no programme history or source passages.

The source of truth was the accepted `GeneralizedHeegnerCycles--GH.0.json` (66 targets, reviewed 9 October) and `GeneralizedHeegnerCycles--GH.8.json` (16 targets). The assembled reader/suggested file predates the latest GH.0 review. The package therefore joins the latest part suggested files and accepted target contracts, preserving those corrections rather than copying the stale assembly. Target order agrees with the packets. The three process-oriented GH.7 slugs are rendered as `ochiai-exponential` (GH.7.5), `yager-unramified-descent` (GH.7.6), and `two-variable-regulator` (GH.7.7).

## Lean result and limits

`lean-check research/blueprint/packages/GeneralizedHeegnerCycles/Suggested.lean` exited **0** on 10 October 2026: **239 warnings, all declaration uses sorry; no errors or other warnings**. Memory was checked before compilation and exceeded the 20 GB threshold. The shared wrapper ran one check at a time for this worker. No library build, Lake update, cache download or language server was started.

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib's shared source HEAD matches the pin. The native abelian-variety import closure and Weil-divisor Abel–Jacobi starting points, eleven Tau Ceti source files, were compared byte-for-byte with the pinned commit in the read-only current library and match the shared build. Native statements were read: abelian varieties, Hom/End, integer multiplication, finite-surjective isogenies and the abstract weighted divisor Abel–Jacobi class. The divisor class API is not a continuous Tate-module Kummer comparison.

The file uses one import block, one header and consistent namespaces. It keeps the expressible definitions, API and discriminating examples; the arithmetic realizations and hypotheses are in the README. This is a proposed interface, not a formalization or proof certificate. In particular its numerical/image-containment `admissibleTriple` prototype does not assert the omitted field-unramifiedness, split-prime, CM-unit or determinant-subgroup identifications of LV admissibility.

Some incoming generic theorem signatures were false for arbitrary module/map parameters: for example equality of an arbitrary regulator image and arbitrary measure, or injectivity of an arbitrary localization map. Adding the conclusion as a hypothesis would not repair the mathematical specification. Their names and full mathematical targets remain in prose, but 48 such executable signatures were omitted under PROTOCOL section 13's honest-prototype rule. Four are API items: `stabilizedClass_bottom`, `stabilizedClass_trace`, `tracePolynomial_remainder`, `correctedKolyvaginClass_fs`. All 58 named tests remain executable signatures with corresponding examples. The omitted signatures are:

- `cmCharacterDecomposition`
- `epsX_middle`
- `projectedHodgeFiltration`
- `projectedSelfDuality`
- `gHC_descent`
- `integralAJComparison`
- `parabolicResiduePairing`
- `colemanAJ`
- `colemanDepletion`
- `syntomicAJComparison`
- `classicalGeneralizedComparison`
- `cycleNormRelations`
- `cycleConjugation`
- `cycleFrobeniusCongruence`
- `finiteLocalAJ`
- `correctedDerivativeLocalCondition`
- `stabilizedClass_bottom`
- `stabilizedClass_trace`
- `stabilizedFirstStep`
- `tracePolynomial_remainder`
- `tracePolynomialIntersection`
- `bdpSpecialValue`
- `ramifiedCharacterAJ`
- `fixedWeightRegulator`
- `castellaHsiehReciprocity`
- `dualExponentialValue`
- `higherWeightHowardHypotheses`
- `longoVigniLocalAssumptions`
- `specializationControl`
- `correctedKolyvaginClass_fs`
- `longoVigniBound`
- `anticyclotomicNonvanishing`
- `selmerRankOne`
- `selmerRankZero`
- `selmerGrowth`
- `selmerParity`
- `universalNormModuleRankOne`
- `lambdaStructureConsequence`
- `familyRepresentationSpecialization`
- `familyMeasureSpecialization`
- `ochiaiExponentialCheckpoint`
- `yagerUnramifiedCheckpoint`
- `twoVariableRegulatorCheckpoint`
- `familyRegulatorLocalization`
- `twoVariableReciprocity`
- `ordinaryLocalizationInjective`
- `initialFamilySpecialization`
- `higherWeightFamilySpecialization`

Two expressible Howard tower lemmas were repaired rather than omitted. `howardTowerClass_trace` now assumes a nonzero U_p and the actual raw corestriction equation; `howardTowerClass_greenberg` assumes membership of the raw classes in the specified submodule. These are structural assumptions, not either lemma's conclusion. The unnamed GH.8 noncomputable section was named and closed, and doc comments left dangling by signature omission were changed to ordinary comments.

## Plan issues for the maintainer and independent package reviewer

The accepted inputs themselves record 17 GH.0–7 gaps/18 requests and six GH.8 gaps/nine requests. The package preserves the required mathematical contracts and does not equate an unfulfilled export with library coverage. This job was authorized to package them and report mistakes, not to edit their owners. Supplier closure and the following ownership/source-range issues must be resolved in the appropriate plans before treating this package as independently ready for upstream use.

1. **Classical Kuga–Sato ownership is not closed.** GH.0 imports W_m, resolution/boundary calculations, the classical signed projector, projected cohomology and Hodge filtration from `ModularCurvesPartII:R14.3`. Its accepted R14.3 part actually contains weight-two H1/Jacobian targets, not these higher fiber-power constructions. Meanwhile `AutomorphicGaloisRepresentations:R19.1/scholl-projector` owns the explicit classical projector and lists GH.0 and R14.3 as prerequisites. Its supplier request to GH.0 asks for the fiber powers, while GH.0 requests them from R14.3. Reconcile the geometric owner and the projector owner before routing this interface; do not implement another copy in the package. Compare those two packets and GH.0's R14.3 request directly.
2. **Generic geometric/cohomological names do not establish the needed exports.** The README records the exact scheme-level filtered Künneth, rational Gysin with derived-limit control, rational Chow/support-independence, continuous Ext/H1 cocycle, higher-dimensional syntomic Abel–Jacobi and ramified finite-local comparison interfaces. A torsion duality theorem, an affine de Rham complex, compact five-term sequence or regulator on Spec O_F alone does not supply them. The incoming requests locate the owners in DD.2, EDC.6, SF.5, R02.1, R06.5 and PHR D.2. Preserve these coefficient and support requirements when closing them.
3. **CM symmetric powers require their own adapter.** Do not use the unequal-rank Sym/Ind identification in CH section 4.4. The literal full symmetric power of the Weil-restricted Tate module, finite-order twist, character summand and integral inclusion/projector denominators are the CM.1 contract. Character-coordinate fixtures in Lean are not that construction.
4. **The relative and two-variable regulator interface exceeds the current cyclotomic L3 packet.** CH Theorem 5.1, KO integral twists/pairings, Castella Theorems 3.4/3.7, Yager trace covariance, quotient-kernel control and the surviving crystalline-line functional are separate requirements. The accepted plan calls this a PHR Part II extension; the package names it descriptively at L3 and does not invent a new roadmap id. Neither tensoring an injective map nor specializing an inverse of a vanishing lambda proves the descended comparison. Retain the H0/H2 correction and p-old restriction for the dual-exponential range.
5. **LV16's application is conditional on its actual local assumptions.** Admissibility alone does not prove Assumption 3.2 for the self-dual higher-weight twist: the inertia action on the ordinary quotient must be tracked. The README leaves the local assumption and the precise control theorem visible. The corrected CH derivative condition uses KO's relative integral construction; the original absolutely-unramified-only argument is not used at ramified conductor. KO Condition 2.3 was checked at printed page 13, including its determinant-restricted image hypothesis.
6. **The final BSD export has a disjoint source-range problem.** CH Hypothesis (H) requires every tame level prime to split in K. The corrected multiplicative BSD erratum, Theorem 2.3, requires a nonsplit prime exactly dividing the auxiliary tame level, the specified nonsplit special local type and its condition at 2. Thus there is no common-range shortcut. The GH.8 final target explicitly requires an extension in GH.0–7, its integral leading-class unit and weight-dependent denominator/admissibility verification. The erratum cites LV19, whereas this plan's LV source is the 2016 v1 preprint; their hypothesis sets cannot be identified without a version-specific argument. Do not promote that export by dropping CH/LV assumptions. The p-new multiplicative point is reached by BSD congruence/control, not Castella's p-old cycle/point comparison.

The README expands the global CH Hypothesis (H), rather than leaving an ambiguous “CH setup”: trivial nebentypus, weight 2r, odd discriminant, p restriction, conductor, Heegner and split-p conditions are stated once and inherited explicitly. Castella's stronger residual restriction, p-distinguishedness, bad-prime ramification, arithmetic congruence and localization hypotheses remain distinct. These are packaging clarifications, not newly proved supplier theorems.

## Existing-roadmap and library audit

Read WORKERS, PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE. Read two complete upstream examples: Multiquadratic in the atlas upstream copy, and current DifferentialGeometry. Read the reviewed `data/library-coverage.json` entries for GH.0–GH.8 and the supplier plans needed for the package boundary.

Current read-only TauCetiRoadmap main was `37769f03c170a7bc3e1082df70522a0ad59c5ffd`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Screened the nine post-snapshot roadmap Suggested files (including nested OperatorTheory files) and the four completed roadmaps named in WORKERS, as well as the current native library. No matching generalized Heegner cycle, Kuga–Sato, Scholl or Chow/regulator construction was found in that screen. Current Coleman name hits concerned the Chabauty power-series/formal-group development, not this wide-open cohomology comparison. Native abelian varieties/isogenies and divisor-class APIs are reused rather than replanned. No Lake command was run in either read-only checkout.

## Source evidence retained for continuation

The bibliography identifies each publicly hosted edition. Nine acquired PDFs matched the hashes recorded by the accepted source evidence; none was copied into the repository. Reading was bounded to the relevant hypotheses, formulas and proofs, not a claim to have read all nine papers completely: BDP Definition/Proposition 3.1–3.5 and Assumption 5.12/Theorem 5.13; CH22 introduction and Theorem 5.7 conventions; Castella introduction, family and Theorem 6.5 hypotheses; LV16 Definition 2.1/Remark 2.2 and local-application statements; the entire one-page CH erratum; KO Condition 2.3 and Lemma 4.10's local-pairing argument; LZ14 Proposition 4.11's infinite-unramified-direction injectivity; and BSD erratum Theorems 1.1/2.3 and the higher-weight proof/congruence handoff. The complete accepted source/API/acceptance contracts were read separately. No restricted book was needed.

Reacquisition receipts (the target locators and edition labels are in the README):

| Source | Public copy | SHA-256 |
|---|---|---|
| bdp-published-2013-gh8 | [PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |
| ch-published-2018-gh8 | [PDF](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf) | `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade` |
| ch-author-2022-gh8 | [PDF](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba` |
| castella-family-author-gh8 | [PDF](https://web.math.ucsb.edu/~castella/Heegner.pdf) | `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d` |
| ch-erratum-gh8 | [PDF](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf) | `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678` |
| lz14-v3-gh8 | [PDF](https://arxiv.org/pdf/1108.5954v3) | `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341` |
| bsd-multiplicative-erratum-gh8 | [PDF](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |
| longo-vigni | [PDF](https://arxiv.org/pdf/1605.03168v1) | `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75` |
| kobayashi-ota | [PDF](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf) | `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4` |


## Validation and next step

- Both input packets pass `python3 scripts/check_blueprint.py` with zero errors and zero warnings; they were not modified.
- Inventory checks: 82 target anchors, nine layers, 66 named API items, 58 named tests, and 173 internal links; all links resolve, target anchors are unique. GH.7's three renamed anchors are mapped above.
- `metadata.toml` parses as exactly `topic = "math.NT"`; README size is below the upstream limit.
- `python3 research/blueprint/intake.py check-files` reports four deliverable files and zero problems, including the local-path screen.
- Final Lean compilation passed with only the 239 sorry warnings described above. The four prose-only API signatures and remaining arithmetic omissions are explicit, not fake proved declarations.

Independent package review should rerun Lean, compare the 82 targets against the accepted packets, and examine the six issues above against the supplier plans. No continuation of packaging is required; the mathematics recorded as supplier obligations has not been implemented by this run. Source PDFs, extracted texts and compilation scratch are discarded after the pull request opens; this handoff and public receipts retain the information needed to reproduce the audit. This session takes no second job.
