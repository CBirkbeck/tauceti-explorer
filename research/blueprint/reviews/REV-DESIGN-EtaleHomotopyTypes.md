# Independent review: étale homotopy types and pro-spaces

Accepted as a complete target-level planning pass, with seven explicit proof or integration gaps. No mathematical closure or implementation is certified.

Reviewer: Codex (GPT-6), session `codex-81npMI`, 2026-10-19. Review job [#3526](https://github.com/CBirkbeck/tauceti-explorer/issues/3526), independent of the design by session `codex-d3cQwx` in [#3436](https://github.com/CBirkbeck/tauceti-explorer/issues/3436). The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3526#issuecomment-6257685791) was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/3526#issuecomment-6257687123); the issue was reread after confirmation.

## Scope and counts

All 51 nodes have individual review records: 36 verified and 15 corrected. No nodes were added, removed or split. The packet retains four definitions, fourteen constructions, twenty-nine theorems and four comparisons; all implementation statuses remain `unchecked`. All eighteen definitions/constructions have APIs, consumers and at least three discriminating tests: 71 API items and 54 tests in total. The 31 planets are distributed 2, 5, 6, 5, 5, 3, 5 across EH.0–EH.6, within the limit of six per layer.

All seven layers are realized and `planned`. The packet's `complete` status describes a finished planning pass. Seven named gaps remain; none is silently discharged by this review. Supplier contracts now number fourteen, after separating two existing profinite-group layers from the compactness supplier.

The reader's statements, hypotheses, direct inputs, proof steps, API/test statements and supplier contracts were checked against the packet and synchronized. The roadmap retains the same seven layers and mathematical targets; EH.1’s summary order now agrees with its packet targets, and EH.6 names its missing existing supplier layers. The suggested file retains two light real-bodied definitions, three theorem signatures and three examples on pinned carriers. Its introductory comment now identifies the reader as the roadmap.

## Corrections made

1. Correct seven node source locators. IEt 3.3 is a theorem, not a proposition; SS A.6 is a proposition, not a lemma; SS Lemmas 2.1–2.2 and their proofs occupy pp. 822–823. The raw profiniteness convention is on SS p. 822, before §2, rather than the indicated opening on p. 823. Both affected raw-comparison/fiber-sequence locators now say this. BHH 7.3.6 is a proposition, and that proposition is now explicitly included as the p-finite homotopy-limit closure input.
2. Replace generic hypotheses on six arithmetic nodes. The isomorphism lift and geometric orbit surjection use SS Proposition 2.4(a)–(b), without a strongly center-free assumption. The orbit bijection and outer/open-image consequences include the condition on every open subgroup of G_k. The product-map theorem separately states characteristic zero, its two geometrically connected/unibranch raw K(pi,1) targets and arbitrary finite-type source X. Only the targets need the stated unibranchness conditions.
3. Make compatibility in geometric Galois cohomology transport explicit. Apply the cover-lifting construction once to the entire finite Galois cover tower; this retains its deck action. Independently choosing lifts at finite extensions would not supply the required compatibility. Add EH.1/cover-basechange-in-ho as a direct prerequisite. Then use arbitrary constant-coefficient comparison and SF.2's affine-limit cohomology. The proof does not claim SF.2 descends torsors under arbitrary abstract groups.
4. Correct the profinite supplier boundary. R5 now concerns Layer 0 and its existing compactness imports. Add R13 for existing Layer 3 pro-p/generation interfaces and R14 for existing Layer 4 compact Z_p-modules and finitely generated abelian pro-p structure. The relevant EH.6 nodes and roadmap dependencies name these layers. Current Tau Ceti already supplies `IsTopologicallyFinitelyGenerated` and `IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`; these must be imported and adapted, not re-planned or represented as declarations at the old pin.
5. Narrow source finding E3's attribution. Published FGV p. 309 already states degreewise cohomological finiteness. The counterexample concerns the broader property (iii), p. 305, and the later infinite-coproduct application, pp. 315–316. The corrected plan keeps the finite-type condition and treats a specified infinite grading componentwise.
6. Add independent source-finding verdicts, pinned declaration receipts, current-library/supplier audit notes and all 51 node verdicts. Record the independent Lean check. Align two harmless reader uses of “subsequent” with the packet's “later”, fix the reader's doubled punctuation, update its supplier count and ownership table, and synchronize every substantive correction above.

No baseline citation was removed or replaced. No source passage or excerpt was added.

## Pinned baseline and existing owners

All fifteen baseline declarations were read in the actual Mathlib source at `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. The packet records the native module for each declaration.

| Declarations confirmed | Relevant scope checked |
| --- | --- |
| `SSet` | Simplicial objects in types, with the native universes. |
| `SSet.KanComplex`, `SSet.KanComplex.hornFilling` | Scoped Quillen fibrancy and extension of each horn; no pro-model instance supplied. |
| `HomotopicalAlgebra.ModelCategory` | Abstract axioms and factorization/lifting classes; no specialization to the proposed models. |
| `TopCat.toSSet`, `TopCat.toSSetObjEquiv` | Native singular functor and continuous real-simplex maps, including the universe lift. |
| `sSetTopAdj` | Realization is the left adjoint. |
| `TopCat.toSSetIsoConst` | Requires total disconnectedness. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | Existing small étale site; not a rigid type construction. |
| `CategoryTheory.Sheaf.H` | Abelian sheaf cohomology with the native sheafification and Ext hypotheses. |
| `ContinuousMap.evalAlgHom`, `ContinuousMap.compRightAlgHom` | Evaluation and contravariant precomposition under their topological semiring/algebra assumptions. |
| `CategoryTheory.Ind` | Native hom-universe and object-size choices; ordinary Pro still requires D0's extension. |
| `CategoryTheory.Functor.diag`, `CategoryTheory.Functor.uncurry` | Object/map formulas support the light Betti diagonal and its induced map. |

The reviewed library audit was read. Current readonly TauCetiRoadmap main is `0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and its Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. AlgebraicTopology and Completed/UniversalCovers were read in full; the relevant suggested declarations, ProfiniteProPGroups Layers 0/3/4 and actual native compactness/generation/structure declarations were inspected. Bounded current-library and roadmap searches did not find an existing specialized étale homotopy, rigid hypercover, Isaksen or Bousfield–Kan pro-space implementation.

The actual supplier statements in D0, H.1, E0, E2, SF.2, IG.0/IG.1/IG.3, NC.0 and ComplexComparisonPartII were checked. D0's existing scope does not itself discharge all simplicial universe/reindexing obligations. H.1 owns discrete BG/EG; EH.1 owns their pro-extension. E2's bounded-below sheaf descent does not imply topological realization descent. IG.3's finite coefficients do not replace G3's arbitrary coefficients. NC.0 owns cohomological K(pi,1) examples and their raw comparison; its current curve proof is characteristic zero, so R11 correctly requests a broader same-owner extension. The elementary-fibration sequence here is an input to those applications, not a consequence of them.

ComplexComparisonPartII's carrier remains the sole analytic carrier. Its tracked upstream [PR 196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196) was still open at `4bd72379658126cbe9be935656396f0c9dac4de0` when checked on 2026-10-19; G6 remains an integration leaf. Generic topology, coherent category infrastructure, analytification, group generation and scheme applications are not newly owned by this roadmap.

## Sources and independent findings

Fresh public PDFs matched all seven packet hashes. Source versions and independent reading dates are recorded in the packet. Node locators use journal pages for SS/FGV and internal pages for the Isaksen, BHH and Lurie copies. The decisive source checks were:

- [Schmidt–Stix](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf): conventions and §§2.1–2.3, pp. 822–829; Appendix A, pp. 853–866. The relative quotient uses the base stabilizer, not automatically its kernel; the profinite homotopy-limit argument retains its convergence leaf.
- [Isaksen's model paper](https://arxiv.org/pdf/math/0106152v1): §§4–8, pp. 6–15; the model-axiom and simplicial arguments in §§12–16, pp. 20–32; properness and cohomological detection in §§17–18, pp. 32–36. Its later published properness correction is not claimed read.
- [Isaksen's étale realization](https://arxiv.org/pdf/math/0106158v2): §3, pp. 8–10, and rigid cover/hypercover definitions, pullbacks, rigid limits and finite-degree cofinality in §§5–6, pp. 13–20. The simultaneous diagonal and realization of the degreewise pro-types are not the same pro-object.
- [Isaksen's completions](https://arxiv.org/pdf/math/0404303v1): Theorems 2.2 and 3.3, pp. 4–6, and coefficient distinctions/localizations in §§5–6, pp. 9–13. Test-object completion is distinguished from raw Isaksen equivalence.
- [Barnea–Harpaz–Horel](https://www.math.univ-paris13.fr/~harpaz/pro_categories.pdf): Theorem 7.1.2, pp. 62–64, and §7.3, pp. 68–71. The adapter is to homotopy-coherent Pro of p-finite spaces, not ordinary Pro of the homotopy category.
- [DAG XIII](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf): Definition 3.3.2 and Proposition 3.3.8 with proof, pp. 82–86; Corollary 3.4.10 and Theorem 3.4.12 with proof, pp. 91–93. The unit on H⁰, vanishing H¹ and degreewise finiteness are retained, and the canonical projection-induced comparison is the intended map.
- [Feng–Galatius–Venkatesh](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf): Appendix A.2, pp. 304–310, Example A.10, p. 311, and the graded consumer in A.4–A.5, pp. 313–317. Discrete algebraic points retain naturality under arbitrary field automorphisms; the analytic term requires continuous automorphisms.

All five source findings are confirmed with individual reasons: SS's partial-totalization misidentification (E1), its cylinder fibration assertion (E2), the qualified coproduct/comparison problem just scoped above (E3), FGV's DAG XIII theorem-number slip (E4), and the missing smooth-target assumption in its manifold proof (E5). The infinite-discrete and singular-curve counterexamples concern those precise assertions; they do not disprove either paper's main theorem. Publisher pages, author pages and targeted correction searches were checked independently; no applicable published correction was located in those bounded searches. No novelty or exhaustive absence is asserted.

No restricted book was obtained. The public initial strict-model preprint does not contain the later properness correction. The unread primary inputs remain explicit rather than being certified from their secondary citations.

## Verification and continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleHomotopyTypes.json`: **0 errors, 0 warnings**. The dependency graph, coverage and planet limits pass.
- `lean-check research/blueprint/suggested/EtaleHomotopyTypes.lean`: **exit 0**, exactly six declaration-uses-`sorry` warnings and no others. Available memory before the run was 78 GiB. This checks the lightweight signatures at the pins; it proves no roadmap theorem. No build, cache download or language server was started.
- Independent consistency assertions: all 51 review records are unique and exhaustive; all mathematical node statements, proof steps, API/test statements and supplier contracts occur in the reader; all eighteen definition/construction test sets have at least three members. Source-issue and source-version validation passes.
- `git diff --check`: passes. Only this job's deliverables and its handoff are changed.

There is no blocking question for acceptance of this planning pass. The orchestrator should preserve G1–G7: corrected properness; unstable totalization connectivity/convergence; arbitrary local-system étale comparison; geometrically unibranch raw profiniteness; the nonproper elementary-fibration theorem; shared analytification integration; strict functorial point-set models/actions. R1–R14 specify the owner interfaces to reconcile. In particular R13–R14 request adapters to existing work, and E3's narrower attribution supersedes the incoming wording. No source theorem is newly claimed proved, no other roadmap is edited, and no promotion is performed by this worker.
