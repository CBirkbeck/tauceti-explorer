# ASM-RelativeFarguesFontaine — blocked assembly checkpoint

Job: `ASM-RelativeFarguesFontaine`, issue [#257](https://github.com/CBirkbeck/tauceti-explorer/issues/257). Worker: Codex, session `codex-M4kSUV`. Date: 7 October 2026.

**Status: checkpoint; the assembly is unfinished.** The issue was available and the claim bot confirmed this session's claim. Inspection of the inputs then established that neither part has an accepted review. This checkpoint records the readiness and cross-part audit and collects the requests and restructuring proposals. It does not publish a final roadmap or suggested file, change a reviewed node, change a review verdict, or assert that any mathematics is formalised.

## Why this run cannot finish the assembly

The assembly issue asks for a roadmap assembled from reviewed parts and waits for `REV-RelativeFarguesFontaine--RF0` and `REV-RelativeFarguesFontaine--RF4`. WORKERS.md describes assembly as joining the reviewed parts before the roadmap becomes complete, and PROTOCOL §§0 and 8 require independent acceptance before a plan goes live. Both completed input reviews explicitly request changes:

- [RF0 review](../reviews/REV-RelativeFarguesFontaine--RF0.md), issue [#482](https://github.com/CBirkbeck/tauceti-explorer/issues/482), by `independent-review-REV-RelativeFarguesFontaine--RF0`: `needs_changes`, dated 7 October 2026. Its 73-node packet is `complete` as a planning pass, with all eight stages `planned`, but its review identifies 19 unresolved signature/test defects. In particular, equal-characteristic strict lifts, twisted Witt congruences, root charts, Lubin–Tate laws and the geometric completion interfaces cannot be made faithful just by concatenating the suggested signatures.
- [RF4 review](../reviews/REV-RelativeFarguesFontaine--RF4.md), issue [#483](https://github.com/CBirkbeck/tauceti-explorer/issues/483), by `independent-review-REV-RelativeFarguesFontaine--RF4`: `needs_changes`, dated 6 October 2026. Its 22-node packet is `partial`; RF4 and both children have partial coverage. Arbitrary-complement general-E gluing, the acyclic BG0 scheme/integral torsor supplier, no-leg/one-leg shtuka recovery and the henselian approximation specialization remain unfinished. Native API and unit-test signatures are also incomplete.

The review verdicts are mathematical input blockers, rather than checker failures or elapsed-time limits. The permitted assembly edits do not include the supplier packets, the original part readers or the original part suggested files, and this worker cannot independently accept its own revisions. Combining the current rejected inputs and marking the assembly finished would bypass those outstanding contracts. The available label therefore does not establish readiness for a final assembly. The maintainer/orchestrator should gate the assembly on accepted revisions of both parts, rather than merely on completion of their review jobs.

## Work completed and checks

1. Read WORKERS.md, the blueprint and expansion protocols, UPSTREAM_GUIDE.md, both input packets and their review reports; inspected both readers and suggested files. Read upstream AdicSpaces and LocalFieldsRamification for the extension boundaries.
2. Ran `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF0.json`: **0 errors, 0 warnings**; 73 nodes, 137 API items, 97 unit tests, 26 planets, 26 baseline declarations, 19 requests and 10 gaps.
3. Ran `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF4.json`: **0 errors, 0 warnings**; 22 nodes, 57 API items, 25 unit tests, 7 planets, 32 baseline declarations, 2 requests and 7 gaps.
4. Independently resolved every same-roadmap cross-part prerequisite by exact node id: **30 prerequisite occurrences, 10 distinct RF0–RF3 supplier nodes, no missing endpoints**. Checked the union's 95 node ids for uniqueness and its local prerequisite graph for cycles: none. This is an endpoint/cycle check, not proof that every supplier statement suffices.
5. Identified the two substantive reconciliation problems below. Collected all 21 request records and five restructuring proposals without dropping their exact scope.

No packet, source record, reviewed statement, review verdict, original part reader or original part suggested file was changed. No assembled Lean file was produced or compiled. The memory check showed sufficient memory for a later `lean-check` run, and that command is available, but compiling concatenated rejected signatures would not settle the input reviews. The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This checkpoint makes no new baseline declaration claim.

## Cross-part reconciliation to do before assembly

### One owner for punctured A-inf algebraicity

RF0's `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity` and RF4's `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles` both plan Kedlaya Theorem 3.8: the equivalence of vector bundles on the algebraic and analytic punctured p-typical A-inf spectra. Both distinguish the valued-field extension theorem 3.9 from general bases using Example 3.14. The RF4 node additionally supplies the field-case gluing/extension theorem. Merely keeping both nodes in one catalogue duplicates the common theorem, contrary to PROTOCOL §15.

RF0's outward RF4 request already says RF4 should receive this algebraicity theorem, and RF4's structural proposal says it should remain the single patching owner. A coherent revision can therefore retain the RF4 theorem as owner and turn RF0's duplicated theorem target into an exact import, preserving RF0's distinct `whole-analytic-ainf-locus` and `whole-analytic-ainf-sheafiness` targets as chart suppliers. Check consumers, realises/coverage, API/tests and planet assignments when resolving the duplicated target. If a different ownership decision is made, move the common theorem rather than planning it twice. This is a recommended revision, not a change made in this checkpoint.

### The crystalline-end gap has newer suppliers

RF4's first gap says the crystalline end has no owner because RF0 only removes V([varpi]); it waits for an atlas child RF0:crystalline-end. The current RF0 packet actually contains the two exact nodes

- `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, defining Z_S = Spa(W(R⁺),W(R⁺)) minus V(p,[varpi]) with both analytic ends and the two chart topologies;
- `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, stating sheafiness on those charts including [varpi]=0,p≠0.

The RF4 algebraicity theorem still cites `curly-Y-affinoid-definition` and `chart-cover-perfectoidness-and-sheafiness` as its RF0 inputs. In the revisions, compare its needed stable-uniformity/Kiehl hypotheses against the new exact nodes and cite the actual whole-locus suppliers directly. Narrow the old gap to whatever hypotheses those statements still do not supply. Do not erase the gap merely because a title matches: both RF0 interfaces inherit the unresolved coefficient/perfectoid issues recorded in that packet. A new RF0:crystalline-end stage is a structural choice, not a prerequisite for referring to already existing node ids. Reconcile RF4's third linear-coverage remaining item and its crystalline-end restructuring proposal at the same time.

## Cross-part endpoint inventory

Every entry below is supplied by the RF0 packet and consumed by the RF4 packet. Node suffixes retain their exact identifiers; no stage-level substitutes are needed for these references.

### `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`

### `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`

### `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`

### `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`
- `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`
- `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`
- `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`
- `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`
- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`

### `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`
- `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`
- `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`

### `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`
- `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`
- `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`
- `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`

### `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`

Consumed by:

- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`

### `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`
- `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`
- `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`
- `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles`
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`
- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`
- `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`

### `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`
- `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`
- `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`

### `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`
- `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`

## Resume order

1. Finish the RF0 and RF4 revision jobs and obtain their independent acceptance. Use the blocking-revision lists in their reports and the exact gap/coverage lists in their packets. Supplier revisions belong to their owners; do not replan BG0, vector-bundle classification, perfectoid spaces or upstream Tau Ceti in this assembly.
2. Resolve the algebraicity duplication and crystalline-end imports above as part of those revisions, with a fresh review if a reviewed node's mathematics changes. Keep the whole analytic locus, integral locus and generic domain separate.
3. Re-read the revised packets, readers and suggested files. Both readers are behind corrections applied by the reviews: the old RF4 reader still says complete/planned, uses the wrong Zariski section generator and carries several of the false pre-review modification statements. Do not take that prose as authoritative over the corrected packet.
4. Write `research/blueprint/readmes/RelativeFarguesFontaine.md` with one introduction, purpose, Part II boundary against AdicSpaces, notation, sources, layer overview and ordered catalogue. Synchronize the exact packet statements/API/tests. Preserve source-version distinctions (FF2017 author copy versus published FF2018, and p-typical KL versus general E). Reconcile the RF0 isocrystal descent sign pi^(-n) with RF4's lattice xi^k mapping to O(-k). Do not infer an adic structural map X_S -> S from the continuous projection or diamond product formula.
5. Join the accepted suggested files into `research/blueprint/suggested/RelativeFarguesFontaine.lean`, with one standard note pointing to the full reader and one deduplicated import block. RF0 uses namespace TauCeti.RelativeFF and RF4 uses TauCeti; preserve explicit namespace boundaries. RF0's open/scoped declarations and universe declarations must not leak into RF4 accidentally. Neither CONTRACT prose nor unrelated arbitrary ring arguments count as faithful native API/test signatures.
6. Re-run both packet checks and the exact-node/cycle audit. Check memory and run `lean-check research/blueprint/suggested/RelativeFarguesFontaine.lean` in the shared pinned build, waiting for completion. Do not set up a new build. Record whether only sorry warnings remain, while keeping all implementation statuses unchecked.
7. Refresh this handoff's collection against the accepted revisions, state exactly what changed, and open the final assembly submission. Until then this is a checkpoint, not a completed assembly.

## Requests collected from the current parts

This inventory preserves the packets' `supplier`, `direction` and `neededBy` fields as of this checkpoint. Some requests name a stage whose scope must be extended, while outward requests delegate mathematics to another owner; neither category certifies an existing library implementation. In particular, do not interpret the RF0 outward RF4 request as requiring the RF4 theorem before constructing the early charts.

### RF0 requests

**RF0 request 1: `AdicSpacesPartII:R0`** (incoming)

Topological rational chart completion, separatedness, the spectral-norm isometry criterion and a countable Banach correction argument for dense inverse-limit restrictions. Extend the coefficient completed-tensor interface to π-adic O_E→W_OE(R^+) with (π,[ϖ])-adic target topology: this map need not be adic, so the existing adic-map completed-tensor node alone is insufficient. Specify the completed integral coefficient tensor, continuity of a module splitting and commuting finite quotient maps.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`
- `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`
- `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`
- `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`
- `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`
- `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`

**RF0 request 2: `PerfectoidSpaces:P1`** (incoming)

The integral perfectoid criterion of BMS Lemma3.10(ii) and Lemma3.21, with a regular u satisfying u^p|p, u-adic completeness and Frobenius S/u→S/u^p bijective. The root chart has u=[ϖ]^(1/p); its quotient presentation must verify every hypothesis. The existing distinguished-element-criterion proves Witt regularity and does not supply this integral criterion.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`

**RF0 request 3: `PerfectoidSpaces:P2`** (incoming)

The tilted perfected open-disc charts and continuity of the homeomorphism of adic spectra, allowing the retained π=0 end. General spatial site machinery is imported rather than replanned.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`

**RF0 request 4: `PerfectoidSpaces:P3`** (incoming)

Almost vanishing of H^1_v of the integral functions on affinoid perfectoid charts, with the required annihilator and norm control; tilting equivalence for finite etale categories compatible with the normalized primitive quotients. Effective ordinary module descent is a separate D3 input. The primitive perfectoid quotient input in KL5.3.14 must use the corrected KLII Theorem3.3.13, in place of the incomplete KL3.6.11 proof.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`
- `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`
- `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`
- `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`

**RF0 request 5: `DiamondsAndVStacks:D6`** (incoming)

Extend the D6 owner with the D6:pre-adic interface of SW §§18.1–18.2: the diamond of a pre-adic object and pre-adic Spd(O_E), used by FSII.1.2 for maps from marked perfectoid untilts, including π=0 and bounded coefficient maps. Current D6 generic Spd does not provide this extension (confirmed RT-AREA-padic-1/3). This is an extension request, not a citation to an existing D6:pre-adic node.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`

**RF0 request 6: `DiamondsAndVStacks:D3`** (incoming)

Extend D3, whose current supplier statement covers perfectoid spaces and their morphisms, with ordinary effective v-descent of finite locally free modules, including GL_1, using SW17.1.8 and SW19.5.3 and their split-module hypotheses. Neither almost modules nor almost H^1 vanishing has this conclusion.

Needed by:

- `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`
- `RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion`
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`

**RF0 request 7: `AdicSpacesPartII:R3`** (incoming)

The rational-basis presheaf, covering and sheaf-gluing interface for the twelve relative period-ring variants. All the analytic estimates and the exact variant lists remain RF0 targets, while generic sheaf and finite-projective descent criteria are imports.

Needed by:

- `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`

**RF0 request 8: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`** (incoming)

The maximal unramified coefficient extension and its completion, residue-field Frobenius and functoriality from Layer 2. Inertia and its finite-quotient exact sequence are requested separately from Layer 4.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`

**RF0 request 9: `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`** (incoming)

Adic gluing along translate-disjoint analytic opens and the sheaf quotient by a free totally discontinuous Z-action; the new q-radius proof and relative quotient are RF1’s work.

Needed by:

- `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`

**RF0 request 10: `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`** (incoming)

The fixed-field Q_p absolute interval Huber pairs, their complete rings/plus rings, restrictions, Frobenius and quotient. RF0 proves isomorphisms of the relative specialization with these existing objects.

Needed by:

- `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`

**RF0 request 11: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`** (outward)

The arbitrary-rank exact tensor isocrystal-to-bundle functor, agreeing with the early rank-one multiplier π^(−n) and slope −n. Include KL6.1.4: sections generating a φ-bundle on every compact interval generate its module of global sections over R̃^∞ after Kiehl descent.

Needed by:

- `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`

**RF0 request 12: `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`** (outward)

The global-generation/cohomology theorem FSII.2.6 and the resulting U=X_S, globally defined analytic-to-Proj morphism and invertible tautological twists. Include KL8.9.3’s algebraic Cartier section and affine complement, then the algebraic/analytic identifications of B_e and B_dR after this global comparison. RF3 provides P, Proj and only the maps on U.

Needed by:

- `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`
- `RelativeFarguesFontaine:RF3/section-covered-proj-chart-map`

**RF0 request 13: `VectorBundlesAndIsocrystals:VB3:general-BC`** (outward)

The precise Div^1 moduli theorem FSII.1.21 and Far Proposition2.18 in the checked preprint: spatial representability, properness, cohomological smoothness and the resulting openness/closedness of |X_S|→|S|. It must use the curve product formula already supplied by RF1, C4 proper base change and the S5 smoothness input. Create a node in this known stage; do not feed it back into early RF1.

Needed by:

- `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`
- `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`

**RF0 request 14: `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`** (outward)

Extend the exact reviewed node to the classical points of the integral period disc, local-PID/maximal-ideal description FSII.1.11–II.1.12 and II.1.22, and SW13.1.3’s strong noetherianity on the field-case Y_[0,∞) excluding x_L. RF0 supplies the early marked-point and tilted Gauss-disc inputs. No strong noetherianity for general relative bases or for the whole analytic locus is claimed.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`
- `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`

**RF0 request 15: `RelativeFarguesFontaine:RF4:vector-bundles`** (outward)

Receive the whole-analytic A_inf algebraicity theorem used by Guo–Reinecke and supply φ-module freeness/projectivity over products of valuation rings with its precise Ivanov hypotheses. Own KL8.9.6(b,c) bundle patching and supply the bundle theorem needed after the global Proj comparison. Do not duplicate the early ambient Cartier completions.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity`

**RF0 request 16: `VectorBundlesAndIsocrystals:VB1`** (outward)

Own the cohomology of arbitrary bundles and the exact derived Cech computation of KL8.9.6(a) for flat quasicoherent sheaves using B_e,B_dR^+,B_dR after the VB2 global comparison. Its algebraic hypotheses and flatness must remain explicit.

Needed by:

- `RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input`

**RF0 request 17: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`** (outward)

Propose LocalFieldsRamification, Part II for FF Remark1.3.5’s nonperfect-residue Cohen rings: existence of flat π-complete lifts and isomorphism of lifts using H^−2 and H^−1 of the full cotangent complex, without canonical uniqueness. Upstream’s current layers do not contain this extension.

Needed by:

- `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`

**RF0 request 18: `DerivedDeRhamCohomology:DD.0`** (outward)

Supply the full cotangent-complex obstruction theory and L_(K/F_q)≃Ω^1_(K/F_q)[0] for field K, required by the proposed nonperfect Cohen-ring extension in FF Remark1.3.5. Mathlib’s naive cotangent complex alone cannot replace it.

Needed by:

- `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`

**RF0 request 19: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`** (incoming)

Use Layer 4 inertia as a closed normal subgroup of the absolute Galois group, the exact sequence to the residue-field Galois group and its finite quotients. RF0 proves the new surjectivity calculation at the Gauss fibre; the local-field definitions and exact sequence are imported.

Needed by:

- `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`

### RF4 requests

**RF4 request 1: `BunGAndNewtonStrata:BG0`**

Three statements in the generality RF4 uses, beside the node BunGAndNewtonStrata:BG0/g-torsors-three-descriptions (which covers sousperfectoid spaces over E with G reductive over E): (1) the scheme-theoretic three descriptions (Scholze-Weinstein Theorem 19.5.1, Broshi): for G flat affine over O_E or E, smooth for the etale version, and any affine scheme Spec B over it, G-torsors are exact tensor functors Rep G -> finite projective B-modules; RF4 applies this to B = B^+_{Div^d}(S) and B_{Div^d}(S). (2) The O_E-integral adic version (Scholze-Weinstein Theorem 19.5.2 for smooth affine G over O_E on analytic sousperfectoid spaces over O_E; Fargues-Scholze's footnote to III.1.1 'extends verbatim to O_E'), for Y-curly_S and the opens U of S x Spa O_E. (3) Faithful-representation independence and extension of structure group as BG0's stage text states them: for G linear algebraic over E and V faithful, V (+) V^dual is a tensor generator of Rep_E G (Deligne-Milne 2.20(b)), and a homomorphism is a closed immersion iff every G-representation is a subquotient of a restriction (2.21(b)). Also: the node BG0/g-torsors-three-descriptions lists RelativeFarguesFontaine:RF4:G-torsors and RF4:vector-bundles among its prerequisites; RS-20 makes BG0 the supplier of RF4:G-torsors and forbids RF4 -> BG0, so those two prerequisites should be dropped in BG0's next revision.

Needed by:

- `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`
- `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion`
- `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`
- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`

**RF4 request 2: `DiamondsAndVStacks:D2`**

v-descent of vector bundles on perfectoid spaces: S' |-> Vect(S') is a v-stack on Perf (Scholze-Weinstein Proposition 17.1.8; Kedlaya-Liu Theorem 3.5.8 for the analytic topology). D2 plans v-descent of functions and higher v-acyclicity (DiamondsAndVStacks:D2/v-descent-of-functions, D2/higher-v-acyclicity), from which this follows by Scholze-Weinstein's successive-approximation argument, but no node states it. Used in the proof of Scholze-Weinstein 19.5.3 after base change to the perfectoid U x Spa Z_p[p^(1/p^oo)]^.

Needed by:

- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`

## Restructuring proposals collected from the current parts

These are proposals, not atlas edits. The two algebraicity/crystalline-end proposals need the reconciliation above before application.

### RF0 proposal 1: Apply the accepted RS-20 proof order

The coefficient prefix is parented in RF0:integral-Y, with the stable aggregate coefficient id retained; the stable closed Cartier id is parented in integral-divisors. DivX depends on the actual RF1 quotient. RF3 retains rank-one twists and section-covered Proj charts. No packet-specific id is retired.

Keep the accepted eight-stage scope and exact external owners; remove any atlas aggregate child back-edge on promotion. Export global Proj/twist payload to VB2:ampleness/global-proj-map-and-twists, arbitrary-rank functor to VB1, Div1 properties to a new precise node in VB3:general-BC.

### RF0 proposal 2: LocalFieldsRamification, Part II inputs

Two source additions require mathematics outside the existing upstream local-fields endpoints: LT formal groups/towers and nonperfect Cohen lifting.

A LocalFieldsRamification Part II brief should define formal O_E-module laws, torsion towers, universal cover/logarithm exactness and tilt, and Cohen-ring lifting using DD.0 obstruction theory. Those inputs are requested or recorded as gaps here; the upstream document is unchanged.

### RF4 proposal 1: rescope

Roadmaps: `RelativeFarguesFontaine`, `AInfCohomology`.

RT-AREA-padic-1/19 (confirmed): the stage edge RF4:vector-bundles -> AInfCohomology:AI.2 serves only the essential surjectivity of Fargues' theorem. Breuil-Kisin-Fargues full faithfulness uses no curve input (BMS1 Remark 4.29, read in this job). In this packet the exports to AI.2 are RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles (Scholze-Weinstein 12.4.6, 14.1.1 (2)<=>(3)) and RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles (Scholze-Weinstein 14.2.1); both are essential-surjectivity inputs.

Apply the fix the RT-AREA-padic-1 fix report gives for /19: split AI.2 into AI.2 (BKF category and full faithfulness, no curve input) and a new stage AInfCohomology:AI.2:essential-surjectivity, and retarget the link RF4:vector-bundles -> AI.2 to RF4:vector-bundles -> AI.2:essential-surjectivity, with the reason 'linear Beauville-Laszlo gluing between pairs (T, Xi) and shtukas with one leg, and Kedlaya's algebraicity, in the essential surjectivity of Fargues' theorem'. RS-20's link and its RF4:vector-bundles reason ('linear supplier to AI.2') change accordingly.

### RF4 proposal 2: rescope

Roadmaps: `RelativeFarguesFontaine`.

RT-AREA-padic-1/18 (confirmed) proposes a child RF0:crystalline-end owning the charts of Spa W_{O_E}(R^+) at [varpi] = 0, the pi-adic sheafiness of W_{O_E}(R^+)[1/pi], and Kedlaya's algebraicity, and its fix report would leave to RF4 'the phi-module freeness parts' of Guo-Reinecke item 129. The stage does not exist yet, and the accepted Guo-Reinecke route 6 names RF4:vector-bundles; this packet plans Kedlaya's algebraicity here as a patching theorem (its proof is gluing of finite projective modules over exact squares and Beauville-Laszlo squares, Kedlaya section 3 'Adic glueing'), and records the missing charts as a gap.

When RF0:crystalline-end is created, it owns the charts Y_{S,[r,oo]}, their rings and their sheafiness; RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles stays the single owner of the algebraicity theorem and imports the charts (edge RF0:crystalline-end -> RF4:vector-bundles), unless the maintainer prefers to move the node into RF0:crystalline-end, in which case AI.2:essential-surjectivity imports it from there; it must not be planned twice. The phi-module freeness statements of item 129 (Ivanov Theorem 6.1; Kedlaya-Liu Proposition 3.2.13 and Lemma 3.2.6, extraction items PAPER-KEDLAYA-LIU-15/124 and /129, both 'missing') are about Frobenius modules over perfect rings, not patching, and should be routed to the owner of Kedlaya-Liu section 3.2 or to the Guo-Reinecke Part II roadmap that uses them.

### RF4 proposal 3: rescope

Roadmaps: `RelativeFarguesFontaine`, `AdicSpacesPartII`.

Overlap note: AdicSpacesPartII:R3/glueing-square, R3/glueing-square-finite-surjectivity and R3/glueing-square-finite-projective-descent plan the topological case (complete Tate rings, strictness and density) of Kedlaya-Liu's glueing formalism; this packet plans the algebraic exact squares of Kedlaya-Liu 1.3.7-1.3.10, which the Kedlaya-Liu extraction routed to RF4:vector-bundles and which the Beauville-Laszlo square, the Zariski square and the B-pair square need (none of them is a square of complete Tate rings). The node RF4:vector-bundles/glueing-datum-over-exact-square carries the compatibility ExactSquare.ofGlueingSquare.

Keep the algebraic formalism here as its single owner and the topological glueing squares in AdicSpacesPartII:R3 as the special case the API compares with. If the maintainer prefers the most foundational owner (PROTOCOL section 15), move the three algebraic nodes into AdicSpacesPartII:R3 and let RF4:vector-bundles import them; AdicSpacesPartII is upstream of RF4, so the move creates no cycle.

## Input fingerprints

These hashes identify the exact inputs audited here; revisions must refresh the inventory.

| Input | SHA-256 |
| --- | --- |
| `research/blueprint/packets/RelativeFarguesFontaine--RF0.json` | `be3c9bdd745046f786b4b52aaacd4df996ca25c86a1e6fcac99088c9c39f0963` |
| `research/blueprint/reviews/REV-RelativeFarguesFontaine--RF0.md` | `f481f33c9d4259c960a2c27480af2ee7cef78aea5ca94ddf2101839df3ce206b` |
| `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` | `90d89778083b30f759c86714fff70d3d078dfab57c498cd92bfdeaf8846434bc` |
| `research/blueprint/reviews/REV-RelativeFarguesFontaine--RF4.md` | `a7a3bfa337c45cad356167c7ae37699d47dfb46778ad1fd001c1d86d74bc2bc0` |
