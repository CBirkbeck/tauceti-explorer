# Independent review of StableReductionPartII MC.2

**Verdict: accepted as a completed target-level planning pass.** Reviewer: Codex,
session `codex-wLed8D`, 18 October 2026, issue #8938. The original planning
session was `codex-SmO258`; this reviewer did not write that plan.

The packet remains `complete`, with stage coverage `planned`. Acceptance does
not discharge its seven explicit supplier-stage contracts, inherited MC.0/MC.1
foundational obligations, or one bibliographical source-access gap. Every
implementation status remains `unchecked`. There is no unresolved contradiction
in the corrected plan and no claim that its admitted statements are proved.

## Inventory and corrections

All 26 nodes were checked individually against their hypotheses, prerequisites,
proof routes and source matches. Their verdicts are in the packet's top-level
`review.checked`: 22 verified, four corrected, none added and none unverifiable.
The inventory is two definitions, two constructions, 14 theorems, seven
comparisons and one application. The four definitions/constructions have 27 API
items and 17 discriminating tests (respectively four, four, five and four).
There are nine direct baseline declarations, 29 parent imports, seven supplier
requests and one source-access gap. Retain the five parent planets and add the
one new planet, Relative stable reflexivity.

The following changes were made in the packet and synchronized in its reader:

1. **Old-mark collision chart.** Narrowed the Knudsen 2012 citation to Theorem
   5.1 and the opening of its proof, pp. 13–14. That proof omits the smooth-case
   calculation. The displayed signed chart is the plan's deduction from the
   positive-diagonal cokernel of Knudsen II, Definition 2.3 and Theorem 2.4,
   pp. 176–177, rather than a calculation reproduced in the later paper.
2. **Collision-chart flatness.** Made the same attribution distinction for the
   coefficient-free affine cover and normal-form proof. Checked the cover over
   arbitrary rings, including the nilpotent collision parameter; no regularity
   assumption on that parameter is needed.
3. **Contraction recovery.** Restored the line-bundle twist in the evaluation
   diagram of Knudsen II, Lemma 2.5, p. 178. With old divisor D and last section
   l, the pushforward of O(l) is K(−D). Its surjective evaluation gives the map
   to the expansion using the canonical Proj twist comparison. Added an
   acceptance check retaining that twist. Also separated the arguments:
   geometric-fibre isomorphisms give quasi-finiteness; properness follows from
   the proper source and separated target over the base; together these give
   finiteness. Properness alone does not supply quasi-finiteness.
4. **Recovery and coherent inverse attribution.** Knudsen 2012, Theorem 5.2,
   p. 16, states functorial stabilization. The inverse comparisons come from
   Knudsen II, Lemma 2.5 and Corollary 2.6, pp. 178–179, with uniqueness giving
   the groupoid and pullback coherence. Corrected both affected source matches.

No target statements, node IDs, API records, tests, planets, baseline citations
or coverage statuses needed removal. No new lemma node was necessary at the
requested target granularity. The suggested Lean file was checked and left
unchanged.

## Sources and inherited findings

Read the public versions identified by URL, edition and SHA-256 in the packet:
[Knudsen II, journal scan](https://journals.msp.org/mscand/article/download/1622/1621/1653),
[Knudsen, arXiv:1106.1588v2](https://arxiv.org/pdf/1106.1588v2), and
[Ile, arXiv:1110.3909v3](https://arxiv.org/pdf/1110.3909v3).
Each node's locator and claimed match was checked, distinguishing printed
results from deductions and from supplier obligations. Important checks include
Ile Definitions 3.1 and 3.4, Proposition 3.5 and Remark 3.6, pp. 6–8;
Definition 4.1, Proposition 4.3 and Remark 4.4, pp. 9–10; Theorem 6.1,
pp. 18–19; and the moving-section restriction in Remark 6.4/Example 6.5,
pp. 20–21. Knudsen's Appendix Proposition 6 is printed pp. 194–195 and
Proposition 7 is p. 195.

Read the actual statements and proofs of Stacks
[00MK, Lemma 10.99.7](https://stacks.math.columbia.edu/tag/00MK),
[0523, Lemma 10.99.11](https://stacks.math.columbia.edu/tag/0523), and
[00MC, Lemma 10.97.3](https://stacks.math.columbia.edu/tag/00MC).
The replacement completion argument applies the local Tor criterion to finite
completed-chart cycles, with the same residue field. It does not exchange an
arbitrary tensor product with an inverse limit. The infinitesimal criterion
retains its local scope and its nonlocal counterexample. Actual completed-ring
Hom/Ext is distinguished from compatible finite-level families; the latter
comparison retains the stated finite-projective coefficient restriction.

For triangle recovery, checked the singular-scheme statement in
[0C58, Lemma 53.20.1](https://stacks.math.columbia.edu/tag/0C58) and the open
diagonal criterion in [02GE, Lemma 29.36.13](https://stacks.math.columbia.edu/tag/02GE).
Equality of the persistent singular sections therefore holds over nonreduced
bases as well. The partial normalization cuts only the four specified nodes;
the fifth, on a singular elliptic component, remains a free smoothing parameter.

The packet has no new `sourceIssues`. Its inherited E1–E3 were independently
checked with these verdicts; the parent records were left unchanged:

| Finding | Verdict and scope |
| --- | --- |
| E1 | Confirmed proof gap: Knudsen II p. 175 asserts pointed versality without the necessary calculation; the 2012 Introduction and Proposition 2.1, pp. 1–2 and 6–10, identify and repair that input. This does not refute the Main Lemma. |
| E2 | Confirmed restriction: Knudsen II, Theorem 3.7 proof, pp. 187–189, must be read with Ile Remark 6.4/Example 6.5, pp. 20–21. In the moving split chart the pairing quotient is A/(b,c), and the pulled-back dual is A plus A/(b,c). Rank two applies on b=c=0. |
| E3 | Confirmed statement counterexample to Knudsen II, Corollary 3.9(b), p. 190. Three elliptic curves with distinct j-invariants in a chain, with the sole mark on the middle component, give two distinct preimages of the same curve by cutting either outer node in the same genus-one/genus-two clutching source. A closed immersion cannot have those two geometric preimages. The fixed labelled triangle has a separate rigidity proof. |

No novelty or absence-of-erratum claim follows. No source passage or
section-by-section source summary was added. Bourbaki Chapter III, 5.4.4 was
not directly collated: the indexed private library provides no cleared copy.
Its precise edition/page remains the packet's honest source-access gap; the
public replacement proof does not depend on that unread citation.

## Baseline and ownership

Read each declaration with its binders at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. All nine citations are confirmed;
none was removed, replaced or weakened.

| Module | Confirmed declarations and their role |
| --- | --- |
| `Mathlib.LinearAlgebra.Dual.Defs` | `Module.IsReflexive`, `Module.bijective_dual_eval`: native canonical evaluation, rather than an arbitrary bidual equivalence. |
| `Mathlib.CategoryTheory.Abelian.Ext` | `Ext`, `CategoryTheory.ProjectiveResolution.isoExt`, `isZero_Ext_succ_of_projective`: actual derived Ext in the stated abelian linear category, its resolution computation and positive projective vanishing. |
| `Mathlib.RingTheory.Flat.Basic` | `Module.Flat`: native tensor flatness, with preservation of arbitrary injections available in its API. |
| `Mathlib.RingTheory.AdicCompletion.AsTensorProduct` | `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `AdicCompletion.flat_of_isNoetherian`: the finite-Noetherian tensor/completion comparison and flatness of the completion algebra. |
| `Mathlib.RingTheory.AdicCompletion.LocalRing` | `AdicCompletion.residueField_map_bijective`: the actual residue-field comparison for maximal-ideal completion. |

Tau Ceti's programme pin is
`f790474821cf4256814db967cb154e7af3d0c369`; no current-only declaration was
misclassified as pinned. Read the reviewed library audit and the current
upstream owners at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`
and library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
StableReduction Layers 1–3 and 9 retain curves, graphs, duality, Proj,
gluing, contraction and stabilization. AlgebraicVectorBundles L0A–L0C retain
internal Hom and its existing flat/locally-free pullback scope. The special
arbitrary-pullback comparison for this section ideal is an additional result.

StablePeriodicCurved Layer 2 and the current
`TauCeti.Algebra.Homology.TotallyAcyclic` already own ordinary finite-projective
total acyclicity and finite Gorenstein-projectives. The relative hull target
imports those carriers and adds coefficient-universal exactness/flat cycles.
Its cokernel convention is cycle degree one, matched to the supplier's cycle
zero by a shift. The unrestricted absolute predicate here has a separately
stated finite-Noetherian compatibility theorem. Nothing already owned is
planned a second time.

## Closure, interfaces and validation

Read the cited supplier statements, including SF.0 finite-presentation limits
and approximation, arbitrary relative Proj base change, SF.4 completion,
R09.1 coherent Grassmannians, R09.4 integral Weierstrass/one-gon properness and
cusp, and R09.6 framed completion/versality. In particular R09.1 permits
coherent quotients without local freeness, and R09.4 supplies genus-one
properness independently of triangle recovery. R03.3's existing flat-fibre
injection/cokernel lemma does not imply all the requested coefficient-exchange
and Tor contracts; the explicit request is appropriate.

The parent eight-item MC.2 worklist is accounted for, including every stable
base case, all ordered pointed indices, arbitrary bases, inverse groupoid
coherence, boundary section terms and the rigid triangle. The assembly proof
routes preserve parent IDs and avoid using unfinished parent conclusions as
premises. The definition APIs expose the canonical maps, duality,
functoriality, coefficient compatibility, augmentation and quotient lines;
the tests detect missing flatness, wrong dual shifts, infinite terms,
nonprojective nodal ideals, characteristic two and nilpotent collisions.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.2.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.2.lean`: exit 0, nine `declaration uses sorry` warnings and no other diagnostics, at the programme pins. Memory was checked first. Elaboration verifies signatures, not the admitted mathematics.
- Reader/packet correspondence, the combined parent/new dependency graph including assembly routes, allowed submission paths and `git diff --check`.

The suggested file is 95 lines, with one real-bodied light definition, six
theorem signatures and three examples. Heavy relative, sheaf, complex and
curve/stack targets remain in the reader, as the current shape rule requires.

**Questions for the orchestrator:** none blocking acceptance. Subsequent work
should discharge the seven named supplier contracts and inherited foundational
obligations, optionally collate the original Bourbaki locator from a cleared
copy, and assemble the preserved parent IDs with these proof routes. Keep the
corrected recovery twist and source attributions in that assembly. No higher-tier
notion was moved and no additional job is claimed by this run.
