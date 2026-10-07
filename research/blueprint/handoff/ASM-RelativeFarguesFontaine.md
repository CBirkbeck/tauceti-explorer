# ASM-RelativeFarguesFontaine — assembled reader and suggested file

Job: `ASM-RelativeFarguesFontaine`, issue [#257](https://github.com/CBirkbeck/tauceti-explorer/issues/257). Worker: Codex, session `codex-7BLWVv`. Date: 7 October 2026. Continues the readiness inventory submitted by `codex-M4kSUV` in [#6862](https://github.com/CBirkbeck/tauceti-explorer/pull/6862).

The five assembly tasks have concrete deliverables: one reader, corrected exact cross-part references, both passing packet checks, one joined suggested file, and the complete request/restructuring inventory below. This assembles the reviewed inputs; it does **not** accept either plan, close their proof gaps, or certify their suggested signatures as faithful. RF0 retains its complete target-level planning pass and RF4 retains partial coverage. Both input review verdicts remain `needs_changes`.

The assembled mathematical reader is usable independently of the obsolete part readers. The joined Lean file assembles the input prototypes, reconciles the single theorem owner, and removes their reviewed false or definition-independent assertions as described below. **Its successful elaboration is not a resolution of the input reviews.** In particular RF0's original 19 signature/test findings and RF4's missing native interfaces require the part revisions before the roadmap can satisfy the full semantic standard of PROTOCOL §13 or be promoted as an accepted plan. Those required revisions are listed below, rather than concealed by name counts or compilation.

## Deliverables and reconciliation

- [Full reader](../readmes/RelativeFarguesFontaine.md): purpose, neighbouring owners and upstream links, unified conventions and sign dictionary, source editions and baseline limits, ordered RF0–RF3/RF4 sections, all 95 target specifications, 194 API items, 122 proposed tests, proof outlines, acceptance properties, uses, exact prerequisites and the mathematical closure interfaces. It is assembled from the corrected packet statements, since the original readers predate review corrections. No Lean code appears in the reader.
- [Joined suggested file](../suggested/RelativeFarguesFontaine.lean): one standard note and 33 distinct individual imports. RF0–RF3 keep `TauCeti.RelativeFF`; RF4 keeps `TauCeti`. Explicit `RF0_RF3` and `RF4` sections isolate universe/open/scoped declarations. The source files are read-only. The actual coefficientwise congruence `Q≡X^q mod π` is carried through the twisted Witt carrier, ring/algebra instances, comparison, Q-Teichmuller construction and ghost/equation API. The known false or definition-independent native assertions are replaced by 19 precise omission notes, including the dependent period-sheaf statement. The notes give the complete packet targets, hypotheses, API and tests and name the missing coefficient, analytic, site or geometric interface. Existing ring/quotient/ratio fragments remain where appropriate. These notes do not count as native signatures or examples. The RF4 completion comment now distinguishes Mathlib's existing Proj construction from the missing particular section algebra/global comparison, and requires marking/theta/ideal identification for the BDeRham comparison.
- [RF0 packet](../packets/RelativeFarguesFontaine--RF0.json): the stable `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity` id is now a **comparison/import interface**, referencing the exact RF4 theorem below. Its proof outline identifies the presentations at x=ϖ and transports the owner's pullback; it does not reprove Kedlaya 3.8. Its duplicate planet is removed. The Guo–Reinecke item 129 route now names the exact RF0 chart/sheafiness suppliers and RF4 theorem, while preserving the separate φ-module routing request.
- [RF4 packet](../packets/RelativeFarguesFontaine--RF4.json): `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles` is the single algebraicity theorem owner. Its two outdated RF0 prerequisites are replaced by `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus` and `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`. Its proof explicitly imports their two-end charts and the exact stably-uniform ring list; A₂ is only uniform. The stale “no owning crystalline-end layer” gap is removed because those exact supplier nodes exist. The coverage refinement retains their inherited coefficient/root proof obligations. The crystalline-end restructuring proposal now reparents existing chart nodes if a child is adopted, and never duplicates the chart or algebraicity targets.

**Re-review required:** the RF0 theorem-to-import comparison and its planet/source route change reviewed node mathematics/ownership; the RF4 dependency/proof/gap reconciliation changes reviewed proof inputs. The orchestrator should schedule re-review of these changes alongside the already required part revisions. The new joined file’s Q-congruence forms and omission boundaries also require review; they are new assembly proposals rather than modifications of the original part files. No existing review object, verdict, checked-node record, baseline declaration, source record/hash, implementation status or upstream/atlas file is altered. This assembly is not a new independent review.

The single-owner interface points forward to RF4 because it is an export/presentation comparison. Neither early chart construction nor divisor completion consumes it. Do not manufacture an aggregate RF4→RF0 foundation edge from this interface. The 95-node prerequisite union is acyclic; the early RF0 whole-locus nodes remain suppliers of the RF4 theorem.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF0.json research/blueprint/packets/RelativeFarguesFontaine--RF4.json`: **0 errors, 0 warnings for each packet**. RF0: 73 nodes, 137 API items, 97 tests, 25 planets, 26 baseline declarations, 19 requests, 10 gaps; all eight stages planned. RF4: 22 nodes, 57 API items, 25 tests, 7 planets, 32 baseline declarations, 2 requests, 6 gaps; all three stages partial.
- `python3 research/blueprint/intake.py check-files` on all five deliverables: **5 files, 0 problems**.
- Independent union audit: **95 unique node ids, 31 cross-part prerequisite occurrences, 11 distinct exact suppliers, no missing same-roadmap node endpoints and no cycles**. The complete endpoint inventory is below. This does not assert that the still-open external BG0 supplier cycle has been repaired.
- All 95 packet statements and every API/test name occur in the reader; every proposed API/test name occurs in the joined file. All reader local links and explicit node/source anchors resolve. This is lexical/specification coverage, not a claim that CONTRACT prose is a native signature or example.
- Read the pinned statements for the union's 53 distinct baseline declarations, using existing source trees. The mathematical boundary checks used upstream AdicSpaces and LocalFieldsRamification, the reviewed library-coverage inventory, accepted RS-20 and both independent part reports. The whole-locus cross-part correction was compared with Kedlaya arXiv:1602.09016v5, Definition 3.5, Proposition 3.6 and Theorems 3.8–3.9. Existing source records and editions are inherited; no claim of independently rereading or rehashing every paper is made.
- `free -g` before final elaboration: 114 GB available. `lean-check research/blueprint/suggested/RelativeFarguesFontaine.lean`: **exit 0, 275 warnings, all declaration-uses-sorry warnings, no other warnings or errors**. An initial joined check and subsequent signature/linter checks ran sequentially and finished; no process is left running. The final file was checked after the last code edit.
- Shared-build Mathlib HEAD is the exact pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. Shared Tau Ceti HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, differing from the required `f790474821cf4256814db967cb154e7af3d0c369`. The two directly imported Tau files and their entire **14-file transitive Tau import cone**, including `public import` edges, are byte-identical to the required pin. Report this as shared-build elaboration with a checked compatible import cone, not a Tau checkout at the exact pin.

## Input revisions still required

The [RF0 independent report](../reviews/REV-RelativeFarguesFontaine--RF0.md) and [RF4 independent report](../reviews/REV-RelativeFarguesFontaine--RF4.md) are authoritative records of the remaining review findings. This assembly does not silently downgrade their verdicts because its structural checks pass.

For RF0, the 19 unverifiable signatures/tests must be repaired in its authorized revision: separate the all-E strict lift from characteristic-zero arbitrary-algebra Witt theory; thread Q≡X^q modulo π through twisted comparisons/lifts; connect LT laws/actions and the constructed LT section; tie roots and tilt reduction to the actual root chart; test classical/Gauss kernels rather than polynomial nonzeroness; use the actual convergent nonzero power series and Gauss bound; discriminate the symmetric orbit sheaf from the stack at repeated legs; use the actual primitive-leg/Cartier degree map; test the coefficient-Frobenius quotient in Div¹; restrict λ/μ/deformation to their bounded spectra and actual maps; give period presheaves coefficient/radius data; make Robba tests examine ring membership/completion; test the relative-curve finite-étale functor; state the actual Stein limit/cohomology interface; and link local generation to genuine finite-projective rational base change. The joined file carries the native Q-congruence and replaces the reviewed unfaithful forms with explicit omissions, without presenting unrelated arbitrary parameters as a remedy. Completing those missing native signatures and discriminating tests remains the owners’ revision work; the 19 omission notes, including the dependent period-sheaf statement, do not amount to resolved native coverage. The source review gives the exact nodes and counterexamples.

For RF4, complete native algebra morphism, extensionality, adjunction, tensor/base-change signatures and concrete Zariski/glueing-pair examples where the carriers exist. CONTRACT comments are specifications, not compiled tests. Identify each omitted geometric signature by its actual missing relative-curve, completed-divisor, representation or G-bundle carrier. Prove arbitrary-complement general-E effectivity beyond the globally fixed-reference lattice case; supply BG0's scheme/smooth integral and representation dictionary and remove its reverse RF4 prerequisites; assign the SW 12.3.4/12.3.5/12.4.1 foundation without importing downstream HS2; and specialize GR arXiv v3 5.4.21 with the actual R,t,I, regularity, henselian pair and torsor scheme. Keep the reductive étale-local triviality scope.

Both original readers and both original suggested part files remain read-only for #257. Their revision jobs must include reader synchronization. Once those owners revise, regenerate the corresponding full-reader sections from their mathematical packets, update the joined native forms rather than copying stale CONTRACT text, re-audit names and the union graph, and rerun the packet/Lean checks. Preserve all conventions, input review statuses, source editions, requests and the single theorem owner unless an independent restructuring changes the ownership.

## Intake scope mismatch

Issue #257's full instructions explicitly authorize edits to both listed part packets, and task 2 requires clear reference corrections there. Its queue `outputs` lists only the reader, suggested file and handoff. The automatic intake's `own_files`/`auto_refusals` uses that narrower list and will leave these **authorized two packet edits** for the maintainer. The submission checker still permits/checks the packet paths. The maintainer/orchestrator must reconcile this queue allowlist with the issue before automatic intake can merge this submission; editing the queue is outside this worker's permitted files. Do not discard the packet reconciliation or change a review verdict to work around the mismatch.

## Exact cross-part endpoint inventory

### `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`

Consumed by:

- `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`

### `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`

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

### `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`

Consumed by:

- `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity`

## Requests collected from both parts

All 21 request records are retained, with their supplier, direction where specified, full statement and exact consuming ids. Outward requests are ownership/export requests and are not implicit early prerequisites. In particular the RF0 outward RF4 request does not make product φ-module freeness an input to constructing the early period charts.

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

## Restructuring proposals collected from both parts

All five proposals are recorded below in the part authors’ wording; references to reading sources in a job belong to those part jobs. They are proposals for the maintainer; this worker edits no atlas stage or link map. The crystalline-end proposal is reconciled with the exact suppliers and single algebraicity owner described above.

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

RT-AREA-padic-1/18 proposes a crystalline-end child. Its chart targets are now represented by RF0:integral-Y/whole-analytic-ainf-locus and whole-analytic-ainf-sheafiness, and RF4 imports those exact nodes. Kedlaya’s p-typical algebraicity theorem is singly owned by RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles; RF0’s stable punctured-ainf-bundle-algebraicity id is a presentation/import comparison. This division agrees with the Guo-Reinecke route to RF4 for patching, without duplicating the theorem or requiring a nonexistent stage id.

Keep the chart construction and sheafiness at the two exact RF0:integral-Y nodes and algebraicity at the exact RF4 theorem node. A separate RF0:crystalline-end child, if adopted, reparents the existing chart nodes and preserves their stable ids; it does not create second chart or algebraicity targets. The φ-module freeness statements of Guo-Reinecke item 129 (Ivanov Theorem 6.1; Kedlaya-Liu Proposition 3.2.13 and Lemma 3.2.6, extraction items PAPER-KEDLAYA-LIU-15/124 and /129) require the owner of Frobenius modules over perfect rings or the Guo-Reinecke Part II owner, with their product-of-valuation-rings hypotheses. RF0’s outward RF4 request remains a routing request for that payload, not a claim that RF4’s patching theorem supplies it.

### RF4 proposal 3: rescope

Roadmaps: `RelativeFarguesFontaine`, `AdicSpacesPartII`.

Overlap note: AdicSpacesPartII:R3/glueing-square, R3/glueing-square-finite-surjectivity and R3/glueing-square-finite-projective-descent plan the topological case (complete Tate rings, strictness and density) of Kedlaya-Liu's glueing formalism; this packet plans the algebraic exact squares of Kedlaya-Liu 1.3.7-1.3.10, which the Kedlaya-Liu extraction routed to RF4:vector-bundles and which the Beauville-Laszlo square, the Zariski square and the B-pair square need (none of them is a square of complete Tate rings). The node RF4:vector-bundles/glueing-datum-over-exact-square carries the compatibility ExactSquare.ofGlueingSquare.

Keep the algebraic formalism here as its single owner and the topological glueing squares in AdicSpacesPartII:R3 as the special case the API compares with. If the maintainer prefers the most foundational owner (PROTOCOL section 15), move the three algebraic nodes into AdicSpacesPartII:R3 and let RF4:vector-bundles import them; AdicSpacesPartII is upstream of RF4, so the move creates no cycle.

## Input and output fingerprints

These SHA-256 values identify the assembled inputs and final artifacts. The source records in the packets remain the inherited source inventory.

| File | SHA-256 |
| --- | --- |
| `research/blueprint/packets/RelativeFarguesFontaine--RF0.json` | `3e344506a4a9497c887454db3d7b2761cc5b59dba11a2a12e53d71d8bfdebfce` |
| `research/blueprint/packets/RelativeFarguesFontaine--RF4.json` | `fef74961f6fbe9b1e03a94e1ce386f038161da64ccba0061b0ccc90b693d8148` |
| `research/blueprint/readmes/RelativeFarguesFontaine--RF0.md` | `fa2f531ca69f85e241ae6098229a873e5d1280a35d991502da07d97c65ea8fae` |
| `research/blueprint/readmes/RelativeFarguesFontaine--RF4.md` | `3356d90cba4dafd83997dbbac7ee5ee42bb3beaf8ae6ebdd463283f0dbe7745a` |
| `research/blueprint/suggested/RelativeFarguesFontaine--RF0.lean` | `5d2402d83597542159ae479df1aecb7482fc04abf9f2656a6d0671a4da264314` |
| `research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean` | `c65806d652831e42a9c5d91c2ae38a472e8fe6697b6b16466fecff882d6cc83b` |
| `research/blueprint/reviews/REV-RelativeFarguesFontaine--RF0.md` | `f481f33c9d4259c960a2c27480af2ee7cef78aea5ca94ddf2101839df3ce206b` |
| `research/blueprint/reviews/REV-RelativeFarguesFontaine--RF4.md` | `a7a3bfa337c45cad356167c7ae37699d47dfb46778ad1fd001c1d86d74bc2bc0` |
| `research/blueprint/readmes/RelativeFarguesFontaine.md` | `bff0d705f2ecad76e3ecaed20c5e5921eff7cf77adeb89f4892e853cbbc4a995` |
| `research/blueprint/suggested/RelativeFarguesFontaine.lean` | `113a50cce68a71e67f54d16f9d5f2f3eaa6eb8cc4140425d3467f68006f87fbb` |
