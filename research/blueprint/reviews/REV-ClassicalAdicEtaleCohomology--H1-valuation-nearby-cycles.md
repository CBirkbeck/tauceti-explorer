# Independent review: valuation nearby cycles and generic extension

**Accepted as a complete target-level planning pass, with planned coverage and six explicit gaps.** This review does not certify proof closure or implementation. Codex, session `codex-muAGmz`, reviewed issue #7034 on 8 October 2026 independently of the original planning session.

The packet, reader and suggested file now agree on thirteen new nodes: two comparisons, seven theorems, one construction and three promoted API lemmas. Four input nodes are verified, six corrected and three added. Twenty accepted H0 interfaces are imported without changes to their identifiers or re-planning their definitions. There are seven baseline declarations, five construction API items, four unit tests, four planet nominations, six requests and six gaps. All implementation statuses remain unchecked; `complete` and `planned` satisfy Protocol §0 because every target has a declaration and every unresolved input has a precise frontier. No stage is marked closed.

## Sources and node decisions

The five original public PDFs were downloaded independently and their bytes match all recorded SHA-256 hashes. Statements, hypotheses, maps and proof dependencies were checked at the locators below. Abe v2 and Yang–Zhao v4 were additionally read for the assigned RT-AREA-etale/15 boundary; their versions, hashes and selected reading scopes are now recorded in the packet. Every result is stated in our own words. No source passages were placed in the repository.

The node suffixes below have prefix `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/`.

| Node suffix | Verdict | Source check and resulting contract |
|---|---|---|
| `oriented-shred-identification` | verified | Lu–Zheng v7 §4.1, Lemma 4.1 and Remarks 4.2–4.3, pp. 26–27: the relevant shred uses the strict localization at the geometric generization, with the specified exchange maps. No torsion or finite-type condition is required here. |
| `valuation-universal-psi-goodness` | verified | Lu–Zheng v7 Example 4.26(2), p. 37: a valuation spectrum admits sections of modifications, yielding universal nearby base change for bounded-below torsion input. The source’s limit and coefficient reductions are precise supplier requests. |
| `non-dominant-cartesian-base-change` | verified | Restriction of universal Ψ-goodness to the specified shred gives the canonical Cartesian exchange. Localizing at s makes the annihilating integer invertible on the relevant base. Point preservation and the chosen closure embedding remain; dominance and flatness are not imposed. |
| `valuation-universal-milnor-fibre-comparison` | verified | Orgogozo v1 Theorem 5.1, pp. 14–15, and Proposition 2.3, pp. 3–4: transfer the modification theorem along a valuation section and use a uniform all-fibre dimension bound for bounded input. Finite presentation and ℤ/n coefficients are retained. This does not establish the stronger inherited locally finite type/arbitrary-coefficient target. |
| `valuation-oriented-constructibility` | corrected | Lu–Zheng v7 Theorem 4.27(2), p. 38, together with Example 4.26(2), supports bounded-below constructible complexes with noetherian coefficients. The Lean input now uses an explicitly supplied D⁺_c category and its inclusion. The bounded-output refinement remains an explicit mathematical contract. |
| `aic-generic-extension-equivalence` | corrected | Hansen–Scholze setting (B), pp. 7–9, Theorem 4.1, pp. 19–21, Proposition 3.4 and Lemma 3.5, pp. 14–16, and Lemma 4.3, pp. 21–22: prove ambient dualizable extension first. The geometric/valuative comparison of Theorem 4.4, p. 22, uses that theorem and follows afterward. |
| `aic-generic-extension-flat-base-change` | corrected | Hansen–Scholze Corollary 4.2(ii), pp. 19–20: flat AIC maps suffice for total Rj* exchange; closed-fibre transport carries the extra faithful-flat/point-preservation condition. Dependencies now name the consumed inverse, unit and perfectness lemmas. |
| `aic-generic-extension-relative-duality` | corrected | Hansen–Scholze Corollary 4.2(iii), pp. 19–20: relative Verdier duality, ULA stability and its restriction formula are needed. The suggested conclusion is now invertibility of the specified canonical comparison, with its supplier map and consumed API dependencies explicit. |
| `aic-generic-extension-kunneth` | corrected | Hansen–Scholze Corollary 4.2(iv), pp. 19–20: exterior products are derived products on the actual fibre product, and the comparison is the canonical map. The inverse, unit and perfectness dependencies are now nodes. |
| `aic-nearby-extension-identification` | corrected | Hansen–Scholze Corollary 4.2 and Lu–Zheng Remark 4.2(a): at the generic point of an AIC valuation the strict localization is Spec K. The suggested comparison now takes perfect input on total X and includes j*, so its left side is i*Rj*j*. The whole-curve normalization applications remain separate consumer work. |
| `aic-generic-extension-inverse` | added | Hansen–Scholze Theorem 4.1, pp. 19–21. The forgotten inverse is canonically Rj*. Promoted because the comparison and compatibility nodes use this API fact. |
| `aic-generic-extension-unit` | added | Hansen–Scholze Theorem 4.1, full-faithfulness proof, pp. 19–20. The actual adjunction unit recovers ULA objects. Promoted because flat base change and Künneth use it. |
| `aic-generic-extension-perfect-constructible` | added | Hansen–Scholze Corollary 4.2(i), pp. 19–20. Total Rj* preserves the specified perfect-constructible generic input. Promoted for the compatibility nodes’ coefficient-domain obligations. |

All three added nodes have `addedBy` equal to this review job. Their suggested names already belonged to the construction API; no duplicate Lean declaration was introduced. This promotion implements Protocol §4 without splitting a target-level proof into its internal lemmas.

The public alteration input was checked in de Jong, *Families of curves and alterations*, Situation 5.8 and Theorem 5.9, pp. 615–617, and **Corollary** 5.10, p. 618. The corollary does not require finite dimensionality or quasi-splitness; its finite-group and purely inseparable refinement is preserved. Orgogozo v1 §§3–4, pp. 6–13, supplies the modification-extension, flattening, hypercover and plurinodal induction contracts. His §§7–8, pp. 17–22, supplies the oriented constructibility proof. Illusie’s Theorem 3.2 and Remark 3.3(c), pp. 6–7, and §4, pp. 8–10, corroborate this qualified public route. V1 numbering is distinguished from the numbering used in the published paper cited by Lu–Zheng.

There were no input `sourceIssues`, and no confirmed mathematical source error was found in the passages checked. The uncleared Huber 1996 book was not opened. Its exact original Gauss, wild/defectless and controlling-submodule proof claims remain recorded as source gaps; accepting this packet does not independently verify those inherited claims.

## Baseline and supplier closure

Every listed declaration was opened in the actual Lean source at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. None was removed or replaced.

| Declaration | Module and statement checked |
|---|---|
| `AlgebraicGeometry.IsProper.eq_valuativeCriterion` | `AlgebraicGeometry/ValuativeCriterion.lean`, lines 330–333, with the criterion definitions at lines 38–90: properness includes the existence-and-uniqueness criterion for arbitrary valuation domains and their fraction fields. |
| `ValuationRing` | `RingTheory/Valuation/ValuationRing.lean`, lines 54–68: the domain class extends total divisibility, without a rank or discreteness condition. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `AlgebraicGeometry/Sites/Etale.lean`, lines 48–56: the topology is induced on the small étale category. |
| `DerivedCategory` | `Algebra/Homology/DerivedCategory/Basic.lean`, lines 86–88: the actual localization of integer cochain complexes, under the abelian/localization hypotheses. |
| `HasDerivedCategory` | The same module, lines 69–82: the localization-existence interface and standard model, not a new derived carrier. |
| `DerivedCategory.Plus` | `Algebra/Homology/DerivedCategory/TStructure.lean`, lines 191–218: the bounded-below full subcategory of the canonical t-structure, with its inclusion. |
| `CategoryTheory.Equivalence` | `CategoryTheory/Equivalence.lean`, lines 79–105: functor, inverse, unit and counit isomorphisms and the triangle condition. The prototype additionally names the actual restriction/Rj* maps. |

The Tau Ceti source object at `f790474821cf4256814db967cb154e7af3d0c369` was searched for the relevant nearby, ULA, alteration and plurinodal interfaces. No exact implementation supplier was found. AUDIT-18 marks this stage not built, with only partial general valuation inputs. Existing derived categories, small étale topology and valuation primitives are reused; they are not new roadmap definitions.

All twenty imported IDs were found in the accepted H0 packet and their exact contracts read. Six L2 nodes supply noetherian approximation, finite-presentation diagrams, compactification and cohomology/Hom/derived continuity. EDC.0’s derived carrier and tensor/Hom nodes and EDS’s replacement node were checked. EDC.0’s constructible/finite-Tor node is noetherian, so its qcqs extension remains a request; it is not assumed already to apply over arbitrary valuations. LPV.0 is trait-only, and SF.4’s alteration ownership is unreconciled. Their proposed early extensions remain gaps. The AdicSpaces and StableReduction upstream documents were read for scope and granularity; the latter’s DVR stable-reduction theorem is not silently substituted for the required arbitrary-valuation smooth-curve spreading assertion.

The new ULA correction separates early ambient dualizability, stability and finite-exception recognition from the later geometric/valuative criterion. Hansen–Scholze Theorem 4.4 explicitly uses Theorem 4.1 for the reverse implication, after Corollary 3.10’s rank-one AIC reduction. The corrected construction proves ambient extension, then performs that comparison and transports the result to geometric ULA. The general comparison remains owned by SF.2. Its precise prefix separation is the sixth gap, rather than a claim that the external supplier has already been changed.

The local prerequisite graph is acyclic. Current atlas stage edges have no path from H1 or this substage back to any of the six requested supplier stages. This does not certify the unaccepted proposed prefix splits. Target inventory covers every stage target through the twenty imports, thirteen new nodes or explicit source/generality gaps. The inherited locally finite type target is not conflated with the new finite-presentation result; the original wild/Gauss proof strand is not conflated with the specialized AIC/pro-p induction.

## API, tests, planets and the assigned finding

The construction’s five API items identify generic restriction, the forgotten inverse, the canonical unit/counit and perfect constructibility. They serve the recorded total-cohomology and Fourier consumers. The four tests distinguish zero extension, the field case, recovery by the actual counit and exclusion of nonzero special-supported ULA objects. Their names and actual example signatures are present in the suggested file. Acceptance also excludes a merely constructible nonperfect constant complex over ℤ/ℓ².

The four new planets are central named mathematical outputs. H0 already nominates six in the same stage; the packet’s explicit assembly proposal selects six across both packets instead of taking their union. No atlas promotion or external roadmap edit was performed.

RT-AREA-etale/15 is handled with the verifier’s narrowed boundary. ABE/A10–A11 import L2’s exact continuity contracts. The extracted YANG–ZHAO/A07 valuation equivalence matches the stronger total Rj*/ULA package added here. However Yang–Zhao v4 §6.4, p. 46, applies extension over normalization of a whole curve and uses arc and finite-cover descent. Those application steps are not proved merely by A07. Abe v2 Lemma 1.4, pp. 4–5, and Theorem 1.5, pp. 5–7, likewise distinguish general coherent normalization bases from valuation tests. ABE/A14 retains its broader extension/comparison obligation. Neither brief is marked fully supplied or edited by this review.

## Validation and next ownership decisions

`python3 scripts/check_blueprint.py` reports **0 errors and 0 warnings**. The custom contract check confirms all thirteen node names, five API names and four test labels, unique owned IDs, all twenty imports, all request consumers, no source-excerpt fields, the allowed file scope and graph checks. `git diff --check` and the intake file check pass.

The revised suggested file elaborated successfully through `lean-check`, with **0 errors and 65 warnings, all declaration-uses-sorry warnings**, at the pinned Mathlib. It imports no Tau Ceti module; the shared build’s newer Tau Ceti HEAD therefore was not used as mathematical evidence. No project, library build, cache download or language server was started. Compilation validates these signatures, including admitted supplier types and functors. Continuous equivariance, enhancement, map-coherence equations and the bounded-output refinement are still mathematical contracts, not implementations.

The orchestrator still needs to reconcile the early alteration and LPV general-base ownership proposals; specify SF.2’s early ambient and later geometric ULA contracts; provide the locally finite type/constructible-extension bridge and the smooth-curve spreading input; obtain a cleared or faithful public source for the original Huber proof obligations; and retain the general normalization/descent work with the Fourier application owner. These are precise follow-on inputs of an accepted plan, not unfinished work in this review job.
