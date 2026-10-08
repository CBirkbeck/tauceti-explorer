# REV-RefinedTraceMethods--RT.5

Issue #481. Independent review by Codex, session codex-EwSLyF, on 8 October 2026. The original planning pass was by Codex session codex-qH6hKS; this reviewer did not write it.

## Verdict

**needs_changes**, with all clear fixes applied to the packet and suggested file. The remaining revision is to synchronize the accompanying reader document from the corrected packet and replace its source quotations with own-word statements. The reader is outside this issue’s three deliverables, so this review leaves it unchanged. Publishing the old reader would retain the circular AΩ assumption and the overstated Habiro multiplicativity claim that this review corrected.

The corrected packet is a complete target-level pass. Both stages are **planned**, neither **closed**. Its eight explicit gaps and sixteen open requests remain appropriate; they do not independently justify rejection. No implementation is claimed. No original node is unverifiable as a source-supported planning contract; the missing proofs/interfaces remain explicitly named gaps rather than being credited as established.

## Counts and checks

| Item | Submitted | Reviewed |
|---|---:|---:|
| Nodes | 79 | 84 |
| Theorems / comparisons / definitions / constructions / applications | 41 / 11 / 8 / 18 / 1 | 46 / 11 / 8 / 18 / 1 |
| API items | 116 | 120 |
| Definition/construction test contracts | 79 | 79 |
| Planets | 12 | 12 |
| Baseline declarations | 10 | 10 |
| Gaps / open requests | 8 / 16 | 8 / 16 |

The per-node verdicts are **30 verified, 49 corrected, 5 added, 0 unverifiable**. Many corrections are source locators or direct prerequisite additions; four original mathematical statements changed. Every definition/construction retains at least three tests. The twelve planets name key objects and theorems; no planet change was needed. Every assigned BMS source-coverage item and the Scholze/Bhatt–Mathew interfaces have destinations. Both scoped stages’ targets are realized.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods--RT.5.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/RefinedTraceMethods--RT.5.lean`: **exit 0**, only **25 expected sorry warnings**, at pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Memory available before the call exceeded 20 GB.
- All ten public PDF downloads match the packet’s SHA-256 hashes. No restricted book was needed.
- An exact-node graph traversal through the available packets and integrated decompositions reaches 613 node contracts, with **no cycle**. Baseline and stage references are terminals; this is not a proof that requested stages are implemented.
- All 79 original statements, 239 proof steps, 364 prerequisites, 116 APIs and 79 tests occur in the reader. This checked its copied contracts against the independent source review; its introduction, coverage/request sections and source-correction notes were checked separately. The corrections below identify where that reader must change.
- The suggested inventory agrees with the corrected packet: 81 higher contracts in comments, and three nodes with genuine elementary signatures. The new scalar-map prototype also elaborates. No higher object is replaced by a proposition field or an unspecified `Prop`.

The two upstream examples read in full were `content/tau-ceti/OneParameterSemigroups/README.md` and `content/tau-ceti/Multiquadratic/README.md`. The scoped stage descriptions, the reviewed library audit, the relevant supplier statements and the confirmed red-team findings were also read.

## Mathematical and dependency corrections

1. **Almost AΩ comparison** (`aomega-almost-map`). BMS Corollary 7.10(3) and Remark 7.11, p.258, supply a map C_A → Lη_ξφ_*C_A, not yet an equivalence. The proof of Theorem 9.6, pp.287–288, iterates this map and uses invertible Frobenius on the pro-étale target. The equivalence comes later in Proposition 9.10, p.290. Replaced the earlier equivalence assumption and explained the actual compatible-map construction.
2. **Habiro interface**. Wagner Theorem 5.63, pp.79–80, states a graded Z[β±1]-module equivalence. It does not alone give the packet’s generic multiplicative diagrams. Theorem 4.27 and Remark 4.28, p.50, distinguish the module comparison from its E_(n−1) enhancement under chosen E_n lifts. Recorded 4.18(A),(R), p.46, R2, p.49, and the Habiro hypotheses 2∈R× and 5.43(A2), p.70. Rewrote the two RT.4 requests and clarified the existing gap. Corollary 6.15, p.86, requires 6|Δ and disc(F)|Δ separately; corrected the stronger product-divisibility formulation to the source’s convention.
3. **Rigidity**. Efimov Proposition 1.1, p.16, requires both compactness of the unit and sequential two-sided trace-class generation. Restored the unit condition in the statement’s equivalence and corrected its section to §1.2.
4. **Smooth/proper categories**. Efimov §1.5, p.19, defines properness by strong continuity of relative evaluation. The packet had extended a compact-object-preservation equivalence to arbitrary dualizable categories. Used the relative strong-continuity convention; restricted compact-generator testing to compactly generated algebra models. Smoothness can be tested on the compact unit of rigid E. MW Lemma 2.18 and Corollary 2.19, pp.18–19, then supply normalization/restriction with that explicit convention.
5. **Direct AInf input**. The proof of Corollary 7.10 uses BMS Proposition 5.8, pp.238–239. The exact existing supplier `AInfCohomology:AI.1/filtered-beilinson-description` was read and added to `smooth-trace-frobenius` and `aomega-nygaard-decalage`.
6. **Removed unrelated input**. `PrismaticCohomology:PR.6/ainf-omega-comparison-map` is the very-small qΩ→AΩ comparison, not the trace-to-AΩ map. Removed it from `aomega-comparison` and replaced the unrelated acceptance test with Frobenius/ξ-specialization compatibility. The BMS2 proof uses imported geometric AΩ through AI.4 and projective QRSP extraction.
7. **API completeness**. Qualified `DualizableCategories.ofInd` as an absolute E=Sp constructor unless an E-action is supplied. Added trace-class composition, tensor and identity-dualizability criteria, and scalar functoriality for the existing coefficient presentation. The latter is an honest ring-map signature whose planned construction uses the universal lift; its API specifies identity/composition laws via generator extensionality.

Five used key API theorems were promoted, each marked `addedBy: REV-RefinedTraceMethods--RT.5`. They are target-level inputs, not a decomposition of routine proof steps:

| New RT.5 node | Source | Direct use |
|---|---|---|
| trace-class-functoriality | MW Lemma 2.2(a)–(c), pp.11–12 | Classifier transport and the diagonal predual comparison in universality, rigidification and killing |
| rigidity-criterion | Efimov Proposition 1.1, p.16 | Motive rigidity and the refined factorization |
| nuclear-closure | MW Theorem 2.4 and Remark 2.5, p.12 | Stable tensor closure and the size-controlled nuclear ind-envelope |
| smooth-proper-normalization | MW Lemmas 2.16, 2.18 and Corollary 2.19, pp.17–19 | Constant refined values and restriction of scalars |
| circle-completion-equivalence | MW Lemma 3.2, pp.29–30 | Oriented circle fixed points with derived completed tensor |

All five remain omitted executable signatures under protocol §13 and are included in the existing foundation gap and relevant requests.

## Baseline and source corrections

All ten Mathlib statements were read at commit 082e2d37e8b0463410cdb532e111cd43d5a66174. **Zero baseline citations removed or replaced.** Their check dates were updated. Tau Ceti was checked at f790474821cf4256814db967cb154e7af3d0c369, not at the shared build’s newer working HEAD.

| Baseline name | Confirmed convention |
|---|---|
| Nat.factorization | Finitely supported prime exponents; factorization of zero is zero, hence positivity is separate |
| Nat.factorization_pow | All n,k: factorization(n^k)=k • factorization(n) |
| MvPolynomial | Existing polynomial algebra, specialized to Fin 2 |
| Ideal.Quotient.mk | Quotient ring homomorphism |
| Ideal.Quotient.lift | Requires annihilation of the ideal; generator relation supplies it |
| LaurentPolynomial | Existing integer-indexed monoid algebra |
| LaurentPolynomial.C | Constant coefficient ring map |
| LaurentPolynomial.T | Integer monomial with coefficient one |
| ChainComplex | Ordinary down-shape complex, not a spectral/circle model |
| HomologicalComplex.Hom.comm | f.f i ≫ d = d ≫ f.f j; supplies only b-compatibility |

Corrected the audit note: **AUDIT-30 does contain RT.5 and RT.6**, both unbuilt. RT.6 names Fontaine theta and overlaps with DD.5, AI.7 and PR.3. Those owner interfaces are imported. Pinned name searches found no coherent nuclear/trace-class, cyclotomic spectrum, localizing motive, quasisyntomic or Nygaard trace implementation; Lean elaborator trace classes and cyclotomic polynomials are unrelated matches.

Pinned the formerly unversioned BM and BGT URLs to v2 and v4 respectively. Recorded all ten versions and hashes under `sourceVersions`, with access date 8 October 2026 and a precise inventory of the passages checked in this review. Corrected E7’s secondary Efimov locator to §1.2, p.15. Expanded source locators to printed page numbers, correcting in particular continuous-K Remark 2.60 (not a proposition), the end of Efimov Theorem 2.1’s proof on p.29, BMS Lemma 7.14 on pp.260–261, and BS Proposition 15.7 on **p.105**.

All seven `sourceIssues` have the required independent **confirmed** verdict. E1–E5 agree with the previously recorded mathematical corrections. The published BMS p.285 page image still prints O_C^flat in the completed-free O_C-module argument, confirming E6’s correction and edition discrepancy. MW Definition 1.1(b), p.2, reverses the classifier; Definition 2.1, p.11, supplies the correct order, confirming E7. Rephrased E2’s correction in own words; no source passage was added to the repository. The other extraction’s files are unchanged.

## Red-team and supplier boundaries

- **RT-AREA-ktheory-2/28**: RT.4 q-Hodge/Habiro comparisons and HQ objects are genuine prerequisites. The corrected requests state the actual Wagner restrictions and separately require the finite-torsion/p=2 extension.
- **/29**: H.6’s additive cofiber is insufficient. The existing request retains the compatible multiplicative Moore tower, with Burklund’s odd-prime and 2-primary structures as used by MW §§2.5–3.1. Nothing was weakened to a bare Moore cofiber.
- **/36**: PR.4’s independently constructed syntomic fibers feed RT.6. The current PR.3/bms2-comparison statement explicitly leaves TC identification to RT.6 and has independent prismatic recognition/Nygaard completion inputs. Corrected the stale note claiming it already advertised the TC conclusion.

The complete relative motive localization, general Q/κ rigidification, finite q-Hodge tower, announced BM Example 1.6 site comparison and unbounded derived convergence remain precisely recorded. Supplier contracts are plans, not library implementations. The periodic KU argument is not justified by HR.2’s bounded-below solid embedding.

## Reader revision and orchestrator action

Create a revision scoped to `research/blueprint/readmes/RefinedTraceMethods--RT.5.md` and synchronize it with the corrected packet:

- Update “Conventions and construction order”, “Sources read”, baseline/audit information and source page locators.
- Update “Dualizable presentable stable categories”, “Trace-class morphisms”, “Rigid monoidal categories”, “Smooth and proper E-linear categories”, the coefficient presentation API, and direct prerequisite lists. Add the five promoted theorem nodes at their construction order.
- Replace the Frobenius equivalence in “The almost comparison map to AΩ” with the factorization map. Keep the equivalence only after the honest comparison in “Nygaard agrees with the AΩ décalage filtration”. Remove the unrelated PR.6 map from the honest-comparison dependencies.
- Correct “The coherent trace interface for Habiro cohomology”, the RT.4 q-Hodge/Habiro requests, and the multiplicativity gap to the actual module/E_(n−1) distinctions and source hypotheses.
- Replace the literal source passages in “Source corrections and routing notes” by own-word descriptions and locators. Update its PR.3 supplier note and source-finding review information.
- Retain the eight honest gaps, sixteen requests, complete-pass status, and planned rather than closed stage coverage.

This is a completed review, not a checkpoint. The reader’s correction requires a separately authorized revision; no mathematical owner needs to be changed and no roadmap should be promoted from this review.

## Complete original-node change inventory

The packet’s `review.checked` provides a source-specific reason for every original and added node. This table identifies every original node edited in place; “sources” changes include locator corrections and the added Efimov properness reference.

| Node suffix | Fields changed |
|---|---|
| motives-rigidity | prerequisites, sources |
| refined-invariant-universality | prerequisites, sources |
| refined-ku-computation | prerequisites, sources |
| refined-ku-periodic-computation | sources |
| graded-motivic-comparison | sources |
| syntomic-graded-tc | sources |
| habiro-trace-interface | statement, proofSteps, acceptance, sources |
| dualizable-categories | sources, api |
| trace-class | sources, api |
| rigid-category | statement, sources, api |
| nuclear-objects | sources, api |
| continuous-calkin | sources |
| localizing-invariant | sources |
| continuous-extension | sources |
| continuous-extension-uniqueness | sources |
| localizing-motives | sources |
| relative-nuclear-module | sources |
| enriched-duality | sources |
| rigidification | prerequisites, sources |
| algebra-killing | prerequisites, sources |
| smooth-proper-category | statement, proofSteps, acceptance, sources, api |
| refined-base-change | prerequisites, sources |
| localization-tower-formula | prerequisites, sources |
| refined-traces | prerequisites, sources, api |
| high-powered | sources |
| torsion-qhodge | sources |
| even-derived-hom | sources |
| torsion-duality | sources |
| even-completed-tensor | sources |
| pro-qhodge-idempotence | sources |
| graded-trace-class | sources |
| trace-flat-descent | sources |
| qrsp-hochschild | sources |
| uv-presentation | api |
| perfectoid-quotient-comparison | sources |
| quasismooth-thh-filtration | sources |
| trace-nygaard-complex | sources |
| smooth-trace-frobenius | prerequisites |
| trace-noncompleted-extension | sources |
| motivic-filtrations | sources |
| filtered-invertibility | sources |
| trace-breuil-kisin-twist | sources |
| filtered-frobenius | sources |
| motivic-convergence | sources |
| aomega-almost-map | statement, proofSteps |
| aomega-comparison | acceptance, prerequisites |
| aomega-nygaard-decalage | prerequisites |
| relative-qrsp-evenness | sources |
| mixed-complex-map-compatibility | sources |
