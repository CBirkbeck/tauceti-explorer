# BP-RefinedTraceMethods--RT.1~3 — completed third revision

Issue #7563. Codex, session `codex-8GjaFl`, 9 October 2026. The bot confirmed claim comment [6075625387](https://github.com/CBirkbeck/tauceti-explorer/issues/7563#issuecomment-6075625387). This is a completed target-level revision, not a checkpoint. Independent acceptance and mathematical implementation remain future work.

The packet is complete: 154 nodes (45 definitions, 30 constructions, 76 theorems, one comparison and two applications), 372 API items, 251 tests, 29 planets, 24 baseline entries, 34 sources, 42 supplier requests and four gaps. All eight scoped stages are planned, none closed; every implementation status is unchecked. All 153 prior IDs, baseline entries, source-issue records and the entire prior independent `review` object are preserved. Exactly three existing mathematical nodes changed and one theorem was added. Only the four authorized deliverables changed.

## Ordering repair and mathematics

The prior report left three whole-RT.5 imports unresolved. The repair changes the required mathematical contracts, rather than assuming that the proposed atlas split has happened.

| Consumer | Revised supply and proof |
| --- | --- |
| `RT.3/cyclotomic-trace` | Import the existing `RT.5/localizing-motives` declaration only at its finitary small-category restriction over Sp. Factor cyclotomic THH into CycSp via BGT Theorem 8.7; use concrete IK corepresentability, Theorem 9.8, and the cyclotomic sphere unit to map the source mapping spectrum into TC. TC need not preserve filtered colimits, and is never the functor factored through finitary motives. The previously requested comparison to motives without a filtered-colimit axiom is unnecessary. |
| `RT.3/trace-uniqueness-multiplicative` | Add `RT.3/finitary-invariant-tensor-units`, the trace-specific K/IK unit specialization of BGT Theorems 5.14–5.15. Its proof checks tensor stability of the split-exact/exact localization relations and uses the existing corepresentability input. Generic Day convolution and monoidal accessible localization are requested exactly from EDS. This is a direct source proof and does not import RT.5's pending relative tensor audit. |
| `RT.2/thh-bimodule-coefficients` | Import `RT.5/dualizable-categories`. Compute evaluation/coevaluation on Mod_A ≃ Ind(Perf(A)): the dual is Mod_(A^op), evaluation is derived module tensor and coevaluation is the diagonal bimodule. Inserting M gives the same bimodule bar. H.5 receives the exact module/Morita comparison request. Compact preservation identifies the functor with its Perf restriction's Ind extension; arbitrary Perf(A) is not asserted dualizable as a small stable category. |

A recursive graph check traversed fine declarations, stage `requires` edges and baseline leaves, detecting cycles with an active recursion stack. The prerequisite closures of `RT.5/localizing-motives` and `RT.5/dualizable-categories` contain respectively 48 and 28 distinct IDs and no RT.1–RT.4 target. The motives closure's RT.5 declarations are `localizing-motives`, `localizing-invariant`, `continuous-calkin`, `continuous-extension`, `continuous-extension-uniqueness`, `dualizable-categories`, `rigid-category` and `trace-class`. It contains no whole RT.5 edge. Thus these specific contracts can precede the trace consumers; the later computations' stage requirements are not imported through them. The revised display split records this exact closure but does not edit the atlas or another packet.

The source reread also exposed an overstatement in the old suggested uniqueness signature. BGT distinguishes contractible K→THH and K→finite TC^n spaces from the unique homotopy class assembled through the coherent TC tower. The prototype now includes those finite stages and their compatible limiting class. It retains IK→THH contractibility in finitary localizing invariants, and removes the unsupported placement of TC and IK→TC in that finitary Day category. Additive and localizing multiplicative mapping spaces have distinct type indices. For modern p-typical TC, the evaluation comparison is restricted to connective commutative rings, where the stated genuine/modern comparison applies.

## Retained corrections and findings

The prior report's 38-entry in-place correction ledger was checked against the packet's statements and acceptance criteria, the reader catalogue and the elaborated signatures. The 37 previously corrected nodes retain their corrections; the three old-node changes in this revision are listed above. The prior report's dispositions remain historical evidence, and are not relabelled as a new independent review. In particular, this revision does not claim a fresh independent source audit of all 34 sources.

- RT.1 retains the arbitrary mixed-complex SBI range, normalized shuffle test, factorial-correct HKR inverse and separation of HH from the THH extension.
- RT.2 retains coherent general Kan-extension requests, discrete-group dictionary, finite induced thick closure, derived spectral THH model, prime and point-set hypotheses, Bökstedt homotopicality and the concrete suspension/indexing tests.
- RT.3 retains separate connective/nonconnective relative fibers, Raskin's cofiber convergence hypotheses, the rational source route, corrected truncating-excision corner and Dennis–Stein sign. This round further corrects multiplicative uniqueness as above.
- RT.3b retains the horizontal reduction fiber and its shifts, fine pre-Beilinson RT.6 imports, and the explicit uncompleted de Rham left-Kan-extension request.
- Topological RT.4 retains locally constant bundle rank, noncircular λ proof, finite Whitney convolution, Cauchy cohomology product, and graded polynomial/Laurent HKR.
- Arithmetic RT.4 retains second-countable light objects, right-left dual pairing, zero-map nuclear test, perfect-even retracts, fixed-base module versus varying-ring algebra descent, positive-step completed solid tensor formula, precise image-of-J variant, quasi-regular identity-cover data, compatible global input, and the twisted/q-Witt/fixed-point hypotheses.

The ten handed findings remain handled at their existing targets:

| Finding | Disposition retained or revised |
| --- | --- |
| RT-AREA-ktheory-2/3 | Odd-prime Devalapurkar comparison and separate p=2 Nikolaus branch retain their lift/equivariance inputs. |
| /30 | Perfect-even, solid, nuclear, synthetic finite-cyclic and lift interfaces remain planned; the light solid spectral source gap is explicit. |
| /31 | Import HR.6's degree-zero Habiro identification; retain the higher comparison instead of duplicating that result. |
| /32 | Use H.5:spectra's smash/ring/operadic interfaces in the accepted RS-33 scope. |
| /33 | RT.2 owns genuine/modern comparison and TR conventions; local-field specialization stays with L.4. |
| /35 | Henselian squares remain with the proposed henselian Part II; RT.3 exports nilpotent, rational and tower squares. |
| /37 | Import DD.0 cotangent/exterior and DD.2 de Rham interfaces; RT.1 only adds cyclic/HKR comparisons. |
| /43 | Retain integral λ/Adams/Chern theory and Snaith construction after k inversion; real/equivariant/completion extensions stay in the proposed Part II. |
| /44 | Import DGAInfinity's Hochschild/Morita foundation and add Keller/Bauval cyclic enhancements, keeping normalized and completed conventions. |
| /46 | Retain K.4/K.6 model and K.7 product requests; replace the circular motives supply as described above. The old independent disposition is preserved. |

## Sources and library checks

The following public files were read at the target-relevant results on 9 October. Their PDF hashes match the packet's recorded versions. All new prose is original mathematical formulation with result and page locators; no source passages or source files are submitted.

- [BGT, universal characterization, arXiv 1001.2282v4](https://arxiv.org/pdf/1001.2282v4): Theorem 7.13, p. 49; Proposition 8.6 and Theorem 8.7, pp. 54–56; Theorem 9.8, p. 58; Theorem 10.6, p. 75; Proposition 10.8 and Lemmas 10.9–10.10/Theorem 10.11, pp. 76–77. These supply the finitary convention, corepresentability and finite-stage distinction.
- [BGT, multiplicative trace, arXiv 1103.3923v3](https://arxiv.org/pdf/1103.3923v3): Corollary 3.8, p. 15; Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23; Theorems 5.14–5.15, pp. 24–25; Corollaries 6.9 and 6.15, pp. 29 and 31; Corollary 7.2 and Theorems 7.3–7.4, pp. 32–33. In particular, TC is outside the finitary invariant category.
- [Hesselholt–Nikolaus, arXiv 1905.08984v1](https://arxiv.org/pdf/1905.08984v1): §1.1.2, pp. 9–11, mapping-spectrum trace and connective S-construction comparison. Only the finitary THH factorization is needed in this revision.
- [Raskin, arXiv 1807.06709v1](https://arxiv.org/pdf/1807.06709v1): §1.10–1.12 and Examples 1.12.1–1.12.2, p. 4; §§3.6–3.12, pp. 15–18; §4.3, p. 20. The coefficient trace locator is corrected from the derivative theorems to the actual module-category trace definition.

The reviewed library coverage and the DGAInfinity and InductionRestriction upstream reader documents were read. The fine RT.5 and EDS contracts and their recursive prerequisites were opened; no generic motives or category-duality construction was replanned here. The 24 unchanged baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the earlier check records remain intact. No restricted book was needed.

## Validation and what remains

- `python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods--RT.1.json`: zero errors and zero warnings, complete, all eight scoped stages planned.
- `lean-check research/blueprint/suggested/RefinedTraceMethods--RT.1.lean`: exit zero at the pinned Mathlib commit, with only admitted-definition/proof warnings (`sorry`); no errors or other warnings. The file imports individual Mathlib modules and no compiled Tau Ceti modules. Tau Ceti baseline statements were checked through their pinned source objects; the shared Tau Ceti checkout itself has a later HEAD, so this is not a compiled Tau Ceti-at-pin verification.
- Recursive foundation graph check: both closures acyclic, with no RT.1–RT.4 return edge. Every old node ID and the independent review object unchanged; exactly three old nodes changed and one theorem added. Reader statements and proof routes agree with those four nodes. All 251 test labels are present in the suggested file; API names retain their namespace-relative declarations.
- `git diff --check`: clean.

The three circular imports are removed. The three obsolete RT.5 requests and their ordering gap are replaced by fine imports and two exact generic requests: EDS Day convolution/monoidal localization, and H.5 module tensor/Morita duality. The remaining 40 requests are retained. These are planned supplier extensions, not claims that their implementations exist.

The four inherited source gaps remain: Barwick–Glasman orthogonal/genuine comparison proof; the public light solid spectral foundation; Wagner's stated proof sketches/unpublished steps and the E14 boundary; and polynomial left Kan extension for the uncompleted graded Beilinson map. K.4/K.6 model comparisons, coherent category/spectral/module interfaces, DD inputs, solid foundations and the other requests remain as listed in coverage. No stage is claimed mathematically closed.

Resume with independent review of this completed revision, especially the finitary restriction, module handedness and coherent finite TC tower. Do not change the historical review object until that independent review is performed. No scratch files or external downloads are needed to continue; the packet, reader, suggested file, source locators and this note contain the durable record.
