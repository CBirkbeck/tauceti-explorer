# Independent review: StableReductionPartII, MC.4

**Verdict: accepted after corrections.** Reviewer: Codex, session `codex-sYnh2Y`,
18 October 2026. Job `REV-StableReductionPartII--MC.4`, issue #8940.
This is acceptance of a complete target-level planning pass. MC.4 remains **planned,
not closed**, with seven gap groups and ten supplier requests. None of the geometry
is claimed to be formalised.

## Inventory and scope

Reviewed the packet, reader and suggested file, all five new nodes, the fifteen
imported parent targets, the named supplier statements and the relevant reviewed
library-audit records. The five nodes comprise two constructions, two theorems and
one comparison. After correction the constructions have thirteen API items and nine
discriminating tests; the comparison has four API items and four tests. No nodes or
planets were added or removed. The six parent planets retain their existing owners.
All five baseline declarations are confirmed; none required removal or replacement.

The parent target imports are refinements, rather than duplicate declarations.
The fixed-degree argument establishes coarse projectivity before the level argument
uses it for fine-level quasi-projectivity. Irreducibility is used only later, when
choosing a normal integral finite projective cover. This avoids a dependency cycle.

## Node findings and corrections

| Node suffix | Verdict | Evidence and change |
| --- | --- | --- |
| `integral-hilbert-kernel` | Corrected | Read CLM Lemma 7.1 and Theorem 7.2, pp.29–31, and the exact R09.1 relative-Serre/family-regularity contracts. The integral extension uses flatness of the actual ideal and a finite cover of the fixed Noetherian base; it is not attributed verbatim to the fieldwise lemma. Checked the quotient-projective convention, rank formula, arbitrary pullback and all four tests. Added kernel extensionality, including its evaluation/pullback compatibility. |
| `fixed-degree-ample-descent` | Corrected | Read EHKV Theorem 2.7, p.5, with §4.1, pp.12–13, CLM Theorem 7.2, pp.30–31, and Stacks 0D2N/01VG. A single degree is fixed before ampleness is checked on fibres. Added [Stacks 0GFB, Lemma 69.21.2](https://stacks.math.columbia.edu/tag/0GFB) as the exact finite ampleness-descent and schemeness theorem over the Noetherian ring Z. Narrowed MC4-R1's descent contract to proper algebraic spaces over an affine Noetherian base, and replaced its unhelpful reference to CLM Definition 1.2. |
| `jacobi-teichmueller-comparison` | Verified | Read DM Definitions 5.3–5.8, pp.105–106, and 5.14–5.15, pp.108–109. The dual/Tate comparison is retained, the homogeneous GSp locus is distinguished from all GL frames, and the primitive multiplier is fixed on the cyclotomic base. Equal-cardinality surjections work for composite levels. The Kummer and effective-descent inputs remain MC4-R6/R7, rather than being asserted to exist in JC1. |
| `boundary-level-normalization` | Corrected | Read DM 4.16–4.20, pp.102–104, and 5.9–5.11, pp.106–107. Corrected the component-count citation to Theorem 4.17(iii); 4.19 is the properness criterion. Made the excellent regular, horizontal-boundary chart hypotheses explicit. Added the normal-test-scheme lifting property and coherent étale chart comparison described after 4.20. Added the tame model z³=t, pulled back by t=s³, whose intersecting components require renormalization; it rules out arbitrary base-change claims. Strengthened the transvection test to exact order N, including composite N. |
| `complex-level-orbits` | Verified | Read DM 5.12–5.16, pp.107–109. Connected marked space and the mapping-class action reduce components to symplectic frame orbits. Surjectivity of integral reduction must cover composite N. The original Weil and Manger proofs and their proposed Part II suppliers remain explicit gaps. The existing upstream layers are not treated as proofs of these inputs. |

Also clarified MC4-R3: finite fibres of the Grassmann quotient classifying map mean
finitely many geometric base points over each isomorphism class after changing a
projective frame. Representability of that map to the quotient stack is not required
by CLM §5, pp.19–22. Its conclusion is ampleness of the determinant of the quotient.
All changes are reflected in the reader and the packet's review record.

## Source issues and reading limits

Both `sourceIssues` now have independent **confirmed** verdicts.

- `E-MC4-1`: CLM Proposition 6.7, Case 1, p.26, invokes a higher-direct-image
  vanishing that fails on general unstable nodal families. Blow up a constant smooth
  genus-at-least-two family at a special-fibre point. The exceptional rational tail
  has dualizing degree −1, so its m-th power has H¹ of dimension m−1; the fibre
  normalization sequence surjects onto this group. Generic H¹ vanishes, whereas
  top-degree base change forces nonzero R¹. This invalidates the proof step, not
  the nefness target. The marked-contraction/collision gap remains open.
- `E-MC4-2`: DM p.107 cites 5.13 inside its own proof. Corollary 5.11 on the same
  page supplies the constant component count needed for the reduction to C. The
  theorem's conclusion is unaffected.

Checked the public versions and hashes listed in the packet. In addition to the
node locators, read Serre's appendix, pp.17-18–17-20 (the final page as an image),
Ekedahl II Theorem 1.7 and proof, pp.126–127, and Chen–Zhang v1 Theorem 1.3, p.2,
with §4, pp.10–11. The characteristic-two exceptional bound is retained.
The original Weil/Manger, Mumford 1967, BM77 and Lang80 inputs, and the corrected
NSF norm-descent proof reported by the parent, remain outside this review's reading
receipt. Neither historical novelty of the source findings nor agreement with a
later CLM version is certified. No source passages are reproduced.

## Baseline, current upstream and validation

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
`TauCeti.AlgebraicGeometry.AbelianVariety.End` and its composition/integer-cast
conventions. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`IsOfFinOrder`, `orderOf`, `Matrix` and `ZMod` in the modules specified by the
packet. These supply the actual carriers used by the six suggested declarations;
they do not supply the geometric results.

Checked the current read-only roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including relevant README/Suggested
interfaces of StableReduction, AlgebraicVectorBundles, FuchsianOrbifolds and
GeometricTopology, and the IntegralLattices boundary. Tensor, symmetric/exterior
powers and determinants already belong to AlgebraicVectorBundles. FuchsianOrbifolds
excludes Teichmüller theory; GeometricTopology lacks the required integral homology
surjectivity; IntegralLattices excludes alternating symplectic lattices. Current
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` searches found no implementation of the
five new geometric targets. Search absence is not a completeness theorem.

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.4.json`:
  zero errors and zero warnings after review.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.4.lean`:
  elaborated at the pinned build, exactly six admitted-proof warnings and no other
  diagnostics. The suggested file needed no edits. This checks signatures only.
- Reader/packet statement, API and test correspondence checked; no source excerpts
  or private paths introduced. The submission file check and whitespace check pass.

## Routing for the maintainer

No unresolved contradiction requires returning this pass. For proof closure, route
MC4-R1/R2/R5 to stack foundations, MC4-R3 and the separately scoped surface contracts
of R4 to their generic owners, R6/R7 to étale comparison and polarized descent,
R8 to curve-to-Jacobian faithfulness, and R9/R10 to proposed Teichmüller and topology
Part II extensions. These are ownership proposals, not changes to upstream roadmaps.
Assembly should consume the five prerequisite refinements alongside the fifteen
parent targets and retain all seven gap groups. No further work is needed on this
review job.
