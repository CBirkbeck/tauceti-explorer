# Independent review: RD.5 follow-up

**Accepted as a finished target-level planning pass, with the explicit gaps and requests retained.** Reviewer: Codex, session `codex-6bOT78`; review job `REV-PadicDifferentialEquationsAndRigidCohomology--RD.5`, issue #9755; 2026-10-14. The author was Claude, session `claude-eC9wQT`, issue #9747. This reviewer did not write the input.

The review covers the [packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.5.json), [reader](../readmes/PadicDifferentialEquationsAndRigidCohomology--RD.5.md) and [suggested file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.5.lean). It verifies 16 nodes and corrects 19. There are still 35 nodes: three definitions, three constructions, sixteen theorems, eleven lemmas and two applications. No mathematical nodes were added or removed. The APIs grew from 44 to 50 items and the discriminating tests from 26 to 29; the five planets are unchanged. All node implementations remain `unchecked`.

The packet's `complete` status means one finished pass; RD.5 remains `planned`, with no stage marked `closed`. Its 35 follow-up targets complement the 73 first-pass RD.5 targets. Seven proof/foundation gaps and four supplier requests remain. Source-access replacements in `closesGaps` are now explicitly distinguished from proof closure. The first-pass packet and every foreign supplier remain unchanged.

## Sources and scope of verification

I opened every source used by the 35 nodes at the recorded locators and compared the statements, hypotheses, matches and proof routes. The reader retains the exact theorem/section and page numbers and public URLs. The 16 downloadable public PDFs matched the input's SHA-256 digests. Berthelot's six-page author copy was read through the web rendering; its inherited digest was not independently recomputed. Van der Put's Proposition 6.1, printed p. 47, was read in the maintainer-cleared library without copying the file or its text. All results and source findings here are in our own words.

The review does not claim to have read the proof interiors explicitly left as gaps: Berkovich's coherent descent; the Parts II–IV valuation-theoretic semistable-reduction argument; Xu's Frobenius-descent machinery and Ogus's comparison; and the local compatibilities only outlined in Berthelot's announcement. Their next actions are stated in the packet. The expanded source inventory records the extra ringed-pullback passages of Le Stum (Propositions 3.3.1, 3.3.5–3.3.6, pp. 52–54), Zureick-Brown §4, Shiho's conventions and Theorem 1.16 (pp. 3–5, 9–11), and Kedlaya IV Lemma 3.1.8 (p. 25).

Two missed source issues are added with independent `confirmed` verdicts:

- **E501**, Kedlaya, *More étale covers*, Lemma 6, arXiv v3, p. 4: the displayed powers give summands in different line bundles. With β_i in L^{j_i} and γ_i in L^l, use β_i α^{2l−j_i} + γ_i² in L^{2l}; dividing by α^{2l} recovers f_i plus a square vanishing to second order on S. The finding concerns the inspected preprint. The AMS endpoint refused access, so the published formula is unverified.
- **E502**, Crew, published Proposition 3.10, p. 726: bounded convex linearly compact sets in the lifting criterion must lie in f(V). The strict inclusion K → K² and its strict transpose disprove the condition for arbitrary sets in W: O_K·(0,1) has no lift. The subsequent null-sequence argument, Proposition 3.11 on p. 727, uses the image. The correction is applied to the target and tested by this example.

The packet lists the version boundaries and the bounded searches for earlier corrections. No linked correction was found in those searches; this is not an exhaustive novelty claim about all literature.

## Baseline and ownership

All four baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; none was removed. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Checked module | What it supplies |
|---|---|---|
| `CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | The category of sheaves satisfying the site's sheaf condition; it does not supply the analytic site or module realisation. |
| `TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | The algebraic module tensor carrier; analytic fibre products and derived Künneth are further targets. |
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Locally affine locally ringed spaces as scheme carriers. |
| `AlgebraicGeometry.IsSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` | A morphism whose diagonal is a closed immersion; separatedness over k means applying this to the structure morphism. |

Concrete direct supplier statements were read, including the first-pass RD.5 inputs and the AdicSpacesPartII, SchemeAndStackFoundations, EnhancedDerivedSheaves, LocallyAnalyticDistributions, CrystallineCohomology and ModularCurvesPartII nodes. A stage citation was not treated as proof that an unstated theorem exists. In particular:

- CR.3's Noetherian p-complete PD-base-change form supplies the crystalline base-change input. Its perfect-field proper comparison does not supply comparison for arbitrary imperfect Cohen fields.
- CR.5's finite-level integral log crystals do not supply general relative log-convergent sites, rational crystalline realisation, or proper log crystalline perfectness for a locally free isocrystal lacking an integral locally free lattice. The relative-site gap and precise CR.5 request make these distinctions explicit.
- The Huber/classical rigid/dagger suppliers do not define Le Stum's Berkovich analytic category. That foundation and its comparison are a separate gap, alongside the already recorded coherent-descent gap.
- Hahn–Banach remains imported from L0. The functional-analysis request is extended to include the analytic inverse-limit exactness needed for the boundary-disc Čech calculation.

I read `data/library-coverage.json`, including the nearby ColemanIntegration and WeilConjectures audit claims. It has no dedicated layer audit for this roadmap. I also searched the current read-only Tau Ceti library (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and the nine newer upstream roadmap families, including all OperatorTheory subdirectories. I read the nearby upstream AdicSpaces and AlgebraicCurves reader scope. No existing isocrystal, Berkovich-site, Robba topological duality or rigid-cohomology target was found that makes these nodes duplicate an implemented target. This bounded absence check does not certify the unimplemented foundations. No upstream checkout was changed or built.

The confirmed findings **RT-AREA-padic-2/33** and **RT-AREA-etale/21** are handled correctly. The finite projection theorem supplies the existing exported `RD.3/etale-cover-of-affine-space` target under its pure-dimension hypothesis. De Jong's geometric alterations have the single lower-tier owner SF.4; proper rigid cohomological descent stays in RD.5. The narrowed RS-25 scope does not turn ordinary étale descent into proper rigid descent. The additional HLTT boundary-finiteness finding RT-AREA-padic-2/32 also has the right RD.4 comparison/RD.5 finiteness split.

## Corrections and per-node verdicts

The main corrections are ringed crystal pullback rather than plain sheaf inverse image; finite simple radicial examples rather than an arbitrary full p-root extension; componentwise traces with normalised scalar descent; typed compact-support adjunctions and Gysin shifts/twists; analytic fibre products; nonempty affine-curve boundary and closed-disc inequalities; C-valued, levelwise Igusa finiteness; rational crystalline coefficients and relative log-base hypotheses; Frobenius-fixed endomorphisms; and log convergence with semilinear Frobenius. The singular cone example now records its actual bundle gluing. Docility refers to canonical nilpotent-residue extensions, and the Dwork tame-cover example is restricted to the tame power covers justified by the cited radius formula.

Every correction is propagated into the reader. The suggested file's real definitions and proposition signatures were already appropriate light statements over pinned carriers; its comments and API/test inventory now reflect the corrected scope. No heavy placeholder, sorry'd data definition or theory development was introduced.

| Target within RD.5 | Verdict | Check or correction |
|---|---|---|
| `overconvergent-site` | corrected | Corrected ringed crystal pullback; added module descent/extensionality API, a scalar-extension test and exact geometric-realisation hypotheses. Recorded missing Berkovich foundations. |
| `overconvergent-site-comparison` | verified | Verified Le Stum 3.5.9, 3.5.11 and 4.6.7–8; the analytic foundations are explicitly a gap. |
| `modification-cohomological-descent` | verified | Verified Zureick-Brown 5.9 and reduction to flattening/modification suppliers; descent calculus remains requested. |
| `fppf-cohomological-descent` | corrected | Verified finite-flat/fppf descent and corrected the nonfinite p-root example. Coherent Berkovich descent and its foundations remain explicit gaps. |
| `proper-surjection-cohomological-descent` | verified | Verified the proper-surjection reduction and exact geometric suppliers; no étale-descent-only replacement. |
| `proper-hypercover-descent-spectral-sequence` | verified | Verified the proper hypercover spectral sequence via site descent; historical Chiarellotto–Tsuzuki hypotheses kept distinct. |
| `overconvergent-germ-hom-lemma` | verified | Verified Berthelot Lemme 2.1, including module support and germ hypotheses. |
| `rigid-trace-morphism` | corrected | Corrected component opens, top excision and normalised scalar descent; scoped crystalline compatibility and added the actual comparison/trace suppliers. |
| `compact-support-gysin-and-trace` | verified | Verified the lift-dependent compact-support Gysin construction, shifts and traces; source leaves local checks as the recorded gap. |
| `top-degree-dimension-one` | verified | Verified geometrically irreducible top-degree dimension via Berthelot 1.5 and Kedlaya 9.3.2, with finite-extension and affine-duality inputs. |
| `finite-etale-trace-projector` | verified | Verified averaging projector identities and ordinary/compact-support trace distinctions; neighbourhood extension remains the recorded gap. |
| `supported-duality-morphism` | corrected | Corrected the compact-support pullback, Gysin shift and Tate line; scoped crystalline coefficients and added comparison/duality suppliers. |
| `kunneth-pairing-on-tubes` | corrected | Corrected analytic fibre-product convention and scoped crystalline compatibility; added the existing comparison and CR.3 Künneth suppliers. |
| `rigid-cohomology-base-field-extension` | corrected | Added exact crystalline PD-base-change/perfectness suppliers; recorded missing imperfect Cohen-field comparison instead of claiming finite-flat base change suffices. |
| `curve-lift-with-boundary` | corrected | Added nonempty boundary, which is necessary for the claimed affine lift; checked deformation/algebraisation suppliers and genus computation. |
| `dagger-curve-mayer-vietoris` | corrected | Corrected closed-disc inequality and tensor base; made the analytic inverse-limit exactness input an explicit L0 request. |
| `principal-parts-index-computation` | verified | Verified the two principal-part indices, local derivative index and 2g+d−1 computation; read cleared van der Put 6.1 without copying it. |
| `projection-etale-off-hyperplane` | corrected | Corrected the homogeneous numerator in the inspected preprint, recorded E501 and retained the pure-dimension and finite-field hypotheses. |
| `log-rigid-comparison-for-curves` | verified | Verified logarithmic comparison for curves with nilpotent residues via the annular/logarithmic extension route. |
| `igusa-theta-cokernel-finite` | corrected | Specified C-valued finite-level dimension and scalar extension; removed the unsupported colimit nonfiniteness assertion. |
| `frechet-and-dual-frechet-finite` | verified | Verified Crew 2.8 and the requested functional-analysis hypotheses, with no duplicate Hahn–Banach ownership. |
| `strictness-transpose-criteria` | corrected | Corrected the published image condition (E502), with the strict inclusion counterexample; checked Crew 3.8–3.12. |
| `robba-topological-residue-duality` | verified | Verified coefficient-ring topological residue duality and its distinction from differential-module cohomological duality. |
| `robba-plus-minus-duality` | verified | Verified the plus/minus differential conventions and topological duality; no extra residue twist introduced. |
| `finiteness-for-smooth-quasi-projective-models` | verified | Verified HLTT 6.7–6.9 and 6.19–6.24 plus Grosse-Klönne 5.1; the comparison is owned by RD.4, not duplicated. |
| `relative-convergent-crystalline-comparison` | corrected | Corrected rational crystalline coefficients and relative fine-log base hypotheses; added the exact log perfectness request and relative-site gap. |
| `convergent-direct-image-smooth-proper` | verified | Verified Xu 1.9/9.3 and Guo–Reinecke’s use; relative-site and Frobenius-descent proof interiors remain honest gaps. |
| `convergent-direct-image-perfect-complexes` | corrected | Verified Guo–Reinecke 6.13 and the perfect-complex/thickening hypotheses; linked the missing relative log input precisely. |
| `unipotent-monodromy-along-boundary` | corrected | Specified canonical nilpotent residues and the odd-p Kummer example; verified the local/global monodromy definition and tensor/subquotient uses. |
| `extension-across-boundary` | corrected | Clarified the overconvergence hypothesis in the rank-one test and the nontrivial bundle gluing in the singular cone counterexample. |
| `dense-open-restriction-fully-faithful` | corrected | Corrected Frobenius-fixed Hom and the relative full-faithfulness proof; absolute full faithfulness does not replace the relative theorem. |
| `convergent-log-isocrystal` | corrected | Corrected log convergence and semilinear Frobenius; added pullback/tensor/extensionality API and the integrable-but-nonconvergent counterexample. |
| `log-extension-of-unipotent-isocrystal` | verified | Verified unique nilpotent logarithmic extension and full faithfulness under the smooth-pair hypothesis. |
| `global-semistable-reduction` | corrected | Specified reduced inverse-image boundary; the global/local statements are checked and Parts II–IV proof interiors remain a gap. |
| `docility-acceptance` | corrected | Restricted the tame claim to power covers with the exact radius locator, and specified the canonical log extension after Kummer pullback. |

## Closure, API and assembly actions

The prerequisite graph of the first-pass packet plus this follow-up, after applying its consumer retargets in memory, has no target cycle reachable from the 35 reviewed nodes. The added proper comparison citation refers to the existing RD.7 target, whose statement was read; it is not a new duplicate. The packet preserves its existing proof gap and records the missing imperfect-residue-field comparison.

Each of the six definitions/constructions has a usable API and at least four tests. The three added tests distinguish ringed scalar pullback from plain inverse image, normalised scalar descent from multiplying by extension degree, and log convergence from mere integrability. API additions cover crystal pullback identities/composition, tensor/dual operations and descent extensionality, plus log-stratification construction, pullbacks and tensor/dual structure. Existing tests distinguish the Frobenius twist, cohomological shift, supports and boundary monodromy. The five planets name central definitions or theorems and meet the part's six-planet limit.

The orchestrator should carry these concrete actions into assembly:

1. Apply the twelve existing consumer retargets, preserve exported ids, and remove the duplicate first-pass Hahn–Banach node in favour of its L0 owner.
2. Move the existing constant-coefficient proper rigid–crystalline comparison and its tube/envelope comparison support to the RD.4 comparison block before their RD.5 uses. Preserve ids or aliases and existing proof gaps. Keep the later q-linear Frobenius normalisation with RD.6–RD.7; moving the whole coefficient/Frobenius block would introduce a dependency problem. Scope coefficient compatibilities to locally free crystalline coefficients until their comparison is supplied.
3. Turn the five reader groups into actual ordered sublayers only after separating early functional analysis from final duality/Künneth/base change and separating curve inputs from their Igusa applications. The original wholesale block order was not justified and has been withdrawn. Keep at most six planets per actual sublayer.
4. Route the added Berkovich-foundation gap to the analytic owner, the relative log-convergent site/Φ gap to RD.3, and the precise log crystalline isocrystal perfectness request to CR.5. Extend the existing proper comparison to imperfect Cohen fields rather than introducing another owner.
5. Keep CR.6 Stein-exhaustion interfaces below tier 12 with their existing analytic suppliers; RD.5's finite-type variety finiteness does not serve that upward request.

These actions and the remaining proof interiors are follow-up/assembly work. There is no unresolved false assertion in the corrected targets that requires rejecting this planning pass.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.5.json`: **0 errors, 0 warnings**; 35 nodes, 50 API items, 29 tests, 5 planets, 4 baseline declarations, 7 gaps and 4 requests.
- `lean-check research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.5.lean`: **exit 0** at the pinned shared build; only 13 expected `declaration uses sorry` warnings. The file has 316 lines.
- Readback confirmed that all 35 statement/hypothesis/proof/acceptance fields agree with the reader, all 50 API and 29 test statements are present, and their names appear in the Lean inventory. All 35 internal node links resolve.
- The combined target graph with consumer retargets has no cycle; baseline and supplier claims were checked at their actual scope. Source-issue schema and source-version records pass the packet checks.
- `git diff --check`: clean. Only this issue's four deliverables and its own handoff note are changed.
