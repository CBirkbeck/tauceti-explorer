# Independent review of R09.5

Issue #6294; reviewer Codex, session `codex-il1u2H`; 9 October 2026.
Input: `BP-AlgebraicModuliForArithmeticGeometry--R09.5`, written by the different session `codex-NTFPn9`, commit `4ed65fea1`, merged through #8036.

**Verdict: accepted after corrections.** This is a complete target-level planning pass, with R09.5 planned and no closed stage. Every node has an individual audit entry in the packet: 14 verified and 10 corrected, with none added or unverifiable. Its four recorded gaps remain substantive obligations. Acceptance establishes the correctness of the plan and its boundaries, not implementation or completion of its suppliers.

The final packet has 24 nodes: two definitions, three constructions, twelve theorems, six comparisons and one application. Its five definition/construction interfaces have 32 API entries and 21 tests; all have at least three discriminating tests. The six planets remain central definitions, constructions or universal properties. All 29 baseline declarations are confirmed; none was removed or replaced.

## Corrections applied

1. **Geometric identity subgroup.** `normal-inertia-subgroup` previously made its bottom constructor geometrically rigidifiable for every algebraic stack. SF.1's algebraic-stack contract does not assume separated inertia. The site-level identity subsheaf always exists, but its geometric inclusion must be closed, equivalently the inertia group must be separated. Stacks, Lemma 78.6.1 (06P6), §6, pp.4–5, supplies the group-space criterion. Added a fifth test using the non-separated group space of §110.50, Lemma 110.50.1 (06EA): the identity inertia of its classifying stack is not closed. The rigidification identity test now distinguishes its geometric closedness hypothesis from the unconditional site construction. The new geometric test is explicitly untyped in the Lean omission ledger.
2. **Subgroup extensionality.** Added `NormalInertiaSubgroup.ext` to the packet and suggested file. Equality of the subgroups at every test object determines the interface; its compatibility fields are propositions.
3. **Correspondence isomorphisms.** Added `FiniteCorrespondence.Iso` and `FiniteCorrespondence.groupoid`. Descent is about a middle object with both leg comparisons, not an image or an unstructured equivalence class. The scheme prototype specifies an apex isomorphism and both commutativity equations, with a groupoid instance. The missing stack version requires leg 2-isomorphisms and remains identified in the ledger.
4. **Nagata source locator.** In the recorded SpacesMorph snapshot the finiteness result is Lemma 67.49.9 (0BB5), p.109, rather than 67.49.11. Corrected the source's read-section list and the citations in `dm-normalization-finite` and `normalized-correspondence`. The scheme input, Lemma 29.55.11, remains correct.
5. **Rigidification properness attribution.** Clarified the match for Romagny's Theorem 5.1(ii)–(iii), pp.224–225. Its properness statement concerns the rigidified stack when the source is proper. Properness of the morphism for finite inertia subgroup comes from AOV Theorem A.1, pp.1087–1089. The planned mathematical statement already had that distinction.
6. **Quasi-compact image calculation.** Made the first proof step of `dm-schematic-closure` specify affine target-chart opens and a finite union of quasi-compact source charts. This retains the quasi-compact composite required by flat base change of the kernel ideal. An arbitrary source atlas would not justify that step. The hypotheses and flat-only comparison remain unchanged; Stacks, §101.38, pp.81–83, supplies the result.
7. **Existing relative-Spec owner.** Current AlgebraicVectorBundles L1A–L1B already plans scheme quasi-coherent algebras, relative Spec, the affine anti-equivalence and arbitrary base change. Removed direct reliance on the overlapping SF.0 `relative-spec` node from `finite-correspondence-fpqc` and `tame-finite-flat-descent`, and on SF.0 `qcoh-algebra` from the latter. Both now use the precise SF.1 stack-extension request importing AlgebraicVectorBundles. Added the upstream source, import and ownership note, and updated the proof sketches, request, gap and Lean ledger. AlgebraicVectorBundles has no stage id in the atlas snapshot; no library declaration or stage id was invented for it.
8. **Unrelated prerequisite.** Removed R09.1 from `elliptic-coarse-recovery`. Its current packet and stage describe projective parameter spaces, not an elliptic-stack carrier. The concrete elliptic input belongs to the already imported ModularCurves contracts; SF.1 supplies stackification and the quotient/coarse interfaces. Their unresolved binding is already an explicit request and gap.
9. **Baseline metadata.** Corrected eight declaration kinds: `Pseudofunctor` and `Quotient` to structure; `Limits.pullback`, `Scheme.Hom.image` and `imageι` to abbreviation; `IsFinite.SpecMap_iff`, `IsFinite.iff_isProper_and_isAffineHom` and `Scheme.Hom.toImage_imageι` to lemma. These changes do not alter the cited mathematics. Replaced all 29 checked notes with independent verification provenance.
10. **Provenance and review records.** Updated the current roadmap audit and ModularCurves source/version to commit `de435a569d325b365a30fe83269ce34674eaea80`. Corrected the added AlgebraicVectorBundles URL to its actual repository directory. Added source/version records for the identity-subgroup criterion and counterexample, and included Alper Definition 4.1/Remark 4.2, p.2362, in the read locators. Added the complete review object and five independent source-issue verdicts.

No target was split into proof-lemma nodes. Definitions retain their mathematical hypotheses; no desired result was made a predicate field.

## Sources and proof closure

Contributing locators were checked in the public versions recorded in `sources` and `sourceVersions`, including their PDF hashes. The checks focus on the statements used by the targets and the indicated proof arguments; no source passage is reproduced here.

| Input | Checked contribution |
| --- | --- |
| [AOV 2008](https://www.numdam.org/item/10.5802/aif.2378.pdf) | Appendix A, pp.1086–1089: compatible normal subgroup families, quotient Isom sheaves, stackification, stabilizers and the local gerbe model. §3, pp.1077–1083: tame pushforward/local presentations and the corrected obstruction argument. |
| [AOV corrigendum](https://www.numdam.org/item/10.5802/aif.2869.pdf) | Entire pp.945–946; the withdrawn Lie argument and corrected cotangent-complex obstruction. |
| [Romagny](https://perso.univ-rennes1.fr/matthieu.romagny/articles/group_actions.pdf) | §5, Theorem 5.1 and Remarks 5.2, pp.224–225: universal factorization, base change, geometric properties and common coarse space. |
| [Conrad](https://math.stanford.edu/~conrad/papers/coarsespace.pdf) | Theorem 1.1 scope; Theorem 3.1, pp.5–6; Theorem 4.2 and Corollary 4.3, pp.8–10: all-space quotient universality and stabilizer-preserving étale gluing. |
| [Alper](https://www.numdam.org/item/10.5802/aif.2833.pdf) | Definition 4.1/Remark 4.2, p.2362; Theorem 4.16, pp.2367–2368; Theorem 10.3/Remark 10.4 and proof, pp.2386–2387. Vector-bundle descent uses trivial closed-geometric stabilizer action; arbitrary coherent-sheaf descent does not follow. |
| [Morphisms of stacks](https://stacks.math.columbia.edu/download/stacks-morphisms.pdf) | Lemma 101.6.2 (04YY); §§37–38, pp.80–83; §46, pp.96–97: full stabilizer criterion, universally closed descent, quasi-compact image and chartwise normalization. |
| [Morphisms of spaces](https://stacks.math.columbia.edu/download/spaces-morphisms.pdf) | §49, pp.105–109, especially 67.49.5 and 67.49.9: ordinary normalization and its Nagata finiteness. |
| [Descent on spaces](https://stacks.math.columbia.edu/download/spaces-descent.pdf) | Proposition 74.4.1 and Lemmas 74.11.23/74.11.29: effective algebra descent and finite/finite locally free target-local properties. |
| [Finite space morphisms](https://stacks.math.columbia.edu/tag/0A4X) | Lemma 76.35.1, with scheme tags 02LS/02OG: proper locally quasi-finite morphisms are finite. |
| [Groupoids in spaces](https://stacks.math.columbia.edu/download/spaces-groupoids.pdf), [non-separated example](https://stacks.math.columbia.edu/tag/06E9) | Lemma 78.6.1, pp.4–5, and §110.50/06EA: exact closedness boundary for the bottom subgroup. |

The rigidification universal property is an equivalence of Hom groupoids, including modifications. Stabilizer quotients are fppf sheaves; sectionwise cosets are insufficient. A finite flat nonsmooth band is permitted. Nested rigidification retains the closed/flat/finitely-presented condition on the residual subgroup, and vertical-kernel representability uses the full test-scheme stabilizer criterion. Auxiliary levels take preserving subgroups and change objects, whereas rigidification takes automorphism quotients.

Finite spans retain both representable finite legs and their middle. Composition uses the two-fibre product. Effective descent includes the algebra multiplication and unit, both legs, and the triple-overlap cocycle. Coarse descent preserves finiteness but does not assert preservation of degrees, flatness or middle fibre products. Its arbitrary base-change assertion requires tameness of all three stacks; the general assertion is flat base change. The finite locally free descent theorem applies to the entire algebra with its stabilizer action.

Ordinary normalization uses the reduced total generic-point rings and a normalized étale groupoid. It is not relative normalization of an identity morphism. Nagata/excellent finiteness has no added separability hypothesis. The closure retains its kernel ideal and nonreduced structure, requires quasi-compactness for the comparison, and only claims flat base change. Finite closure requires both representable proper quasi-finite projections; normalizing recovers the original open middle only when that middle is normal.

Read the exact SF.0 ordinary-normalization/Nagata contracts, SF.1 stack/coarse/tame and geometry contracts, SF.2 algebra-descent contract, and the predecessor `affine-kernel-rigidification` statement. Existing SF.1 proof gaps are preserved rather than silently discharged. Coverage accounts for all five target groups, including the previously owned affine-gerbe leaf. Cross-roadmap requests name the consuming nodes and the additional statements needed.

## Baseline and upstream ownership

All 29 declarations were read with their surrounding hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 16 containing modules matched the bytes served at those GitHub commits. All names are also probed by the suggested file.

| Group | Confirmed names and necessary limits |
| --- | --- |
| Pseudofunctors and descent | `Pseudofunctor`, `StrongTrans`, `StrongTrans.Modification`, `IsStack`, `sheafHom`; groupoid fibres are separately imposed. |
| Automorphisms | `Aut`, `Functor.mapAut`, `Aut.autMulEquivOfIso`; native multiplication/composition convention is retained. |
| Categorical quotient | `Quotient`, `Quotient.lift`, `Quotient.functor_map_eq_iff`; the equality criterion requires a congruence, and this quotient is only the prestack precursor. |
| Pullback | `Limits.pullback`, with a pullback existence instance. |
| Finite maps | `IsFinite`, `IsFinite.SpecMap_iff`, `IsFinite.iff_isProper_and_isAffineHom`; the last is proper plus affine for schemes, not the required proper quasi-finite space theorem. |
| Relative normalization | `Scheme.Hom.normalization`, `toNormalization`, `fromNormalization`, `normalizationDesc`, `normalizationPullback`; qcqs hypotheses and an integral target in the factorization are respected. The smooth base-change comparison is not arbitrary base change. |
| Schematic image | `Scheme.Hom.image`, `imageι`, `toImage`, `toImage_imageι`; construction and factorization are available, while the flat comparison still requires its mathematical hypotheses. |
| Invariants | `Algebra.IsInvariant.isIntegral`, `exists_smul_of_under_eq`; finite group and the latter's scalar-commutation hypothesis are retained. |
| Tau Ceti | `linearlyReductiveAffineGroupSchemeProperty`, `Comodule.fixedSubcomodule`; the first is field-based, not general-base linear reductivity. |
| Groupoid predicate | `CategoryTheory.IsGroupoid`, retaining the given category structure. |

The reviewed library audit and current libraries were checked for duplication. Current upstream roadmap main is `de435a569d325b365a30fe83269ce34674eaea80`; current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. The nine post-snapshot roadmap directions and Completed roadmaps were searched for overlap. Nearby JacobianChallenge and AlgebraicVectorBundles documents provided the ownership/style comparison.

Current [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/de435a569d325b365a30fe83269ce34674eaea80/TauCetiRoadmap/ModularCurves/README.md) 4C/9D/9E and their Suggested signatures supply the actual elliptic/moduli carriers, full level-3 and level-4 rigidifiers, finite quotients, all four KM 8.1.6 alternatives, arbitrary-ring coarse j-line and the wild smooth-curve quotient. These README/Suggested files and AlgebraicVectorBundles are unchanged from the input's recorded upstream commit. The Legendre family is not treated as a Galois rigidifier; the target-ring invertibility alternative and characteristics 2 and 3 are retained. Katz–Mazur itself was not read: there is no cleared copy in the library index. Its numbered claims are attributed through upstream, with the unresolved stack binding explicit.

## Source findings

All five entries received an independent `confirmed` verdict. Collation used the published AOV PDF, the full published corrigendum and [arXiv v1](https://arxiv.org/pdf/math/0703310v1). The arXiv history lists only v1. No additional source mistake was found in the contributing locators.

| Finding | Independent conclusion |
| --- | --- |
| Lie-algebra proof, pp.1072–1073 | AOV14 p.945 withdraws that proof; the cotangent-complex proof remains usable. |
| Torsor obstruction, p.1080 | AOV14 p.945 replaces the obstruction by a cotangent-complex Ext group and prevents an unwarranted uniqueness conclusion. |
| Subgroup pullback, p.1087; v1 pp.27–28 | The printed base orientation is incompatible with the stated test-scheme arrow. |
| Local-chart product, p.1080; v1 p.20 | Visual inspection confirms the wrong base subscript; the proof requires the coarse chart's base. The corrigendum does not address it. |
| Isom variables, p.1088; v1 p.29 | The quotient expression retains variables from the preceding paragraph rather than the newly chosen same-base lifts. |

## Validation and orchestrator actions

`python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.5.json` reports **0 errors and 0 warnings**. `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.5.lean` exits successfully at the pinned baseline, with **45 warnings, all declaration uses of `sorry`**, and no other warnings or errors. The memory check allowed the single compilation. Its 14 typed reduced fixtures do not establish the 21 full geometric tests; the omission ledger states every missing contract. `implementationStatus` remains `unchecked` throughout.

The reader document is outside this review issue's editable deliverables and was left unchanged. Before packaging, regenerate or reconcile it against the corrected packet and suggested file: update the counts to 32 API items/21 tests; fix geometric bottom and the identity-rigidification test; include extensionality, the new counterexample and the correspondence isomorphism/groupoid API; change both Nagata locators to 67.49.9; use the quasi-compact chart proof; replace the overlapping SF.0 relative-Spec references and remove the unrelated R09.1 prerequisite; update the source versions and owner notes. The corrected packet is authoritative for these changes.

The orchestrator must also reconcile SF.0's scheme relative-Spec/QC-algebra plans with their existing AlgebraicVectorBundles owner. Complete the recorded SF.1 supplier proof obligations and requested stack interfaces, then bind the ModularCurves signatures and full geometric fixtures before a package asserts full type coverage. No changes to those suppliers or upstream roadmaps are part of this review.
