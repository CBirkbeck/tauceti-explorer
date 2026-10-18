# Independent review of StableReductionPartII, MC.0

Reviewed by Codex, session `codex-lWdG5J`, on 18 October 2026, for issue #8936. Verdict: **accepted as a complete planning pass**. MC.0 remains **planned**, with its three explicit supplier gaps; this verdict does not assert dependency closure or formalisation.

The review covers all seven nodes: five verified and two corrected, with no nodes added, removed or unverifiable. There are three theorem targets, two constructions and two comparisons, two planets, twelve pinned baseline declarations, twenty-four API items and fifteen definition/construction checks. The packet checker counts seventeen API items and ten tests because it counts only the two nodes classified as constructions; the universal-evaluation comparison has the remaining seven API items and five tests. The four parent identifiers and all twenty-eight sample export routes are retained, including the ten exports supplied by MC.2.

## Node verdicts

| MC.0 node | Verdict | Independent check |
| --- | --- | --- |
| `pointed-approximation` | Verified | Stacks 32.10.1–2, pp. 25–28, descends finite-presentation objects, maps and equalities; 53.20.10, p. 51, spreads nodality. SF.0's approximation and property-spreading contracts and StableReduction Layers 0–3 supply the remaining named inputs. General bases are treated affine-locally, without a global Noetherian model. |
| `arbitrary-base-genus` | Verified | Stacks 53.20.12, pp. 52–53, gives the universal degree-zero unit and locally free degree-one cohomology. Stacks 36.30.4, p. 74, and 36.32.5, p. 80, support the specified perfect-pushforward and amplitude extension. The proof claims only a local splitting, with no canonical global derived splitting. |
| `arbitrary-base-duality` | Verified | Stacks 48.12.4–5, pp. 29–30, and 48.28, pp. 72–75, supply the rigid complex and coherent base change; 109.19–20, pp. 19–22, supplies the curve concentration and Gorenstein comparison. The missing general module-concentration interface is explicit. The tests check degree zero versus positive degree, componentwise positivity, both branches of a self-node, and nonflat base change. |
| `native-family-realization` | Corrected | Corrected the API's ambient category: ordered pointed slice objects with marking-preserving arrows, then the geometric full subcategory, then its core. Checked the native groupoid construction, marking-preserving pullback comparisons, unit/pentagon coherence and retention of geometric automorphisms. All five tests distinguish plausible wrong models. |
| `polarized-descent-comparison` | Verified | Stacks 74.13.1, pp. 21–22, and 99.14.1–3, pp. 37–39, justify scheme effectivity from a descended ample line with an actual compatible cocycle. The canonical log-line comparison supplies that lifted cocycle. Generic stack descent or an invariant Picard class alone does not discharge the requested supplier. |
| `universal-evaluation` | Corrected | Knudsen II, Definition 1.2, pp. 163–164, and Knudsen's 2012 introduction, pp. 1–2, allow an unrestricted extra section. Added `n≥1` to the collision test. Checked that the specified identification in the two-fibre product removes residual automorphisms and recovers the entire classified curve. Narrowed the reported Lean coverage to the actual slice statements. |
| `smooth-base-restriction` | Verified | Stacks 109.16.1, p. 16, gives the open smooth-family condition. Properness makes the image of the nonsmooth locus closed. The whole curve over this base open is distinguished from the pointwise smooth locus over a possibly nodal stable base. |

The API and all fifteen tests were read against their statements. In particular the Frobenius test excludes noninvertible marking-preserving arrows, the elliptic involution preserves automorphisms, and node-valued/colliding extra sections exclude replacing the universal curve by the disjoint smooth marking locus. The two planets describe central mathematical targets, not source locators. No finer proof-lemma split is warranted at this target-level density.

## Baseline and ownership

Every declaration below was read in its cited module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All twelve names and stated uses are confirmed; none was removed or replaced.

| Module | Declarations and checked boundary |
| --- | --- |
| `Mathlib/CategoryTheory/Comma/Over/Pullback.lean` | `CategoryTheory.Over.pullback`, `pullbackId`, `pullbackComp`: actual slice pullback and natural comparison isomorphisms; these do not supply geometric family predicates. |
| `Mathlib/CategoryTheory/Core.lean` | `CategoryTheory.Core`, `CategoryTheory.Functor.core`, `CategoryTheory.Iso.core`: invertible arrows and induced core functors/comparisons. Corrected `Core`'s metadata kind from definition to structure. |
| `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean` | `CategoryTheory.Pseudofunctor.IsStack`: full-faithful descent and effective object descent; groupoid fibres are a separate requirement. |
| `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean` | `AlgebraicGeometry.Scheme.fppfTopology`: the scheme fppf topology. Corrected its metadata kind from definition to abbreviation. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | `AlgebraicGeometry.Scheme.Hom.smoothLocus`: the native source open, under local finite presentation. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean` | `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`: additive small-Zariski sheaf cohomology, not the missing relative perfectness theorem. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | `TauCeti.AlgebraicGeometry.InvertibleSheaf`: the rank-one locally free full subcategory. |
| `TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean` | `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`: the actual sheafified tensor-product object. |

Read the reviewed library audit, the cited SF.0–SF.2 supplier statements, the four parent target contracts, the MC.2 export suppliers and R09.3's polarized-descent request. The local dependency chain is acyclic; the MC.2 examples are downstream exports, not assumptions used to construct MC.0.

Also read current TauCetiRoadmap StableReduction's conventions, Layers 0–3 and suggested forms, and AlgebraicVectorBundles' README and tensor/pullback suggested forms at `0d144d044dacebca17b654695b6f1ad58f159b27`. StableReduction owns the existing curve, nodal, coherent and pointed-family theory; AlgebraicVectorBundles L0A–L0B owns generic sheaf tensor and pullback coherence. Corrected the latter's upstream URL to include its `TauCetiRoadmap/` directory. No existing target is replanned. The current Tau Ceti `FamilyOfCurves` carrier and pullback instances were read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the reader now identifies this newer interface explicitly and distinguishes it from the compilation pins.

Three honest requests remain: arbitrary-base perfect pushforward with fibre-amplitude/unit-splitting criteria; arbitrary-base Cohen–Macaulay dualizing-module concentration; and effective polarized fppf scheme descent. The rigid dualizing complex is already owned by SF.2 and is not requested anew. The polarized descent supplier is shared with R09.3. These precisely recorded extensions justify retaining planned coverage; no additional hidden supplier or contradictory claim was found.

## Sources and in-place corrections

Read every node's source locator in all nine public sources listed in the packet and reader, including the scanned Knudsen journal pages. Downloaded SHA-256 values match all nine recorded hashes. For Knudsen II, the relevant locators are Definitions 1.1–1.2, pp. 162–164; Proposition 2.1, p. 174; Lemma 2.5, p. 178; and Corollary 2.6/Theorem 2.7, p. 179. Knudsen 2012's main lemma, p. 3, assumes a Noetherian base: it supports the routed MC.2 construction and is not used as an automatic arbitrary-base proof here. The reader preserves that distinction. All Stacks page references above use the recorded ed88ff78 chapter PDFs. Sources, URLs, versions, full locators and access dates remain in the packet and reader; no source passages were copied into the deliverables.

Independently confirmed all three existing `sourceIssues`: the repeated residue-map variable in 53.20.11, p. 52; the restriction-composition index in 48.28.5, p. 73; and the primed immersion's source in 48.28.6, p. 74. Added two harmless notation slips, each with a confirmed review: the final lifted map's second source variable in 53.20.11, p. 52; and the diagonal pushforward's structure sheaf/repeated asterisk in 48.28.10, p. 76. The last should be the pushforward of the structure sheaf of Y. Checked the live tags and parent-section comments; no correction for these slips was found. These affect none of the planned statements. Updated the reader's issue inventory and duality reading locator accordingly.

The other corrections are the pointed-category API wording, collision-test hypothesis, two baseline declaration kinds, upstream URL, current-library boundary, and prototype inventory described above. The suggested file changed only its omission comment: its four propositions state the raw slice equivalence/evaluation formula, graphs of a marking or arbitrary map, and injectivity of evaluation. It does not state naturality, coherent base-change comparison, a geometric moduli object or effectivity. Those remain explicit reader targets. No new Lean declarations or mathematical nodes were needed.

## Validation and orchestrator follow-up

`lean-check research/blueprint/suggested/StableReductionPartII--MC.0.lean` succeeded at the pinned shared build, with exactly four declaration-uses-`sorry` warnings and no others; only an omission comment changed afterward. The file has no data placeholders. Packet validation, the sorry-data check, intake file validation and `git diff --check` pass. Baseline declarations were checked directly in the pinned source files; the packet check did not have a prebuilt declaration index available.

No blocking question remains. The orchestrator should preserve the three existing SF requests when joining parts, reconcile the polarized supplier with R09.3, and keep MC.2's Noetherian stabilization source restriction visible until its own arbitrary-base extension is justified. No ownership move or upstream edit is requested by this review.
