# Independent review: Enhanced derived sheaves, E0–E4

Accepted as a complete target-level planning pass on 2026-10-11. Reviewer: Codex, session `codex-KAgYbr`, issue #396, job `REV-EnhancedDerivedSheaves--E0`. This session did not write the reviewed blueprint. The input is the completed #719 submission merged through #8676, including the earlier checkpoints credited in the packet.

The corrected [packet](../packets/EnhancedDerivedSheaves--E0.json) has 125 individually checked nodes: **81 verified, 39 corrected and five added**. Every baseline citation is confirmed and no unresolved contradiction remains. All five stages remain `planned`, with precise remaining work; none is `closed`. Twelve recorded gaps and four supplier requests remain. Acceptance concerns the soundness and coverage of this pass, not implementation or mathematical closure.

## Coverage and signatures

| Stage | Nodes | Review scope |
| --- | ---: | --- |
| E0 | 25 | DG nerve, mapping spaces, coherent categories and size |
| E1 | 23 | Unbounded derived sheaves, tensor/Hom and Koszul inputs |
| E2 | 41 | Repleteness, inverse limits, Postnikov and hypercover/h-descent |
| E3 | 13 | Coherent ringed diagrams, adjoints and presentability |
| E4 | 23 | Generic and sheaf completion, coefficient reconstruction |

All original 120 ids are retained. The 47 definitions/constructions have full mathematical API outlines and at least three fixtures each. Their examples test signs, torsion, negative cohomology, orientation, coherence, size and missing finiteness conditions. There are 30 planets, six per stage, all within the name limit. The target-level granularity is retained: proof steps were not split into routine lemma nodes.

The exhaustive suggested-signature matrix now covers all 125 nodes, 210 API items and 155 fixtures, including items attached to theorems. The packet checker counts the subset attached to definitions/constructions: 205 API items and 151 fixtures. The earlier derived matrix lists/counts omitted rows that were present in the matrix itself; all derived lists and totals are now regenerated from every row.

| Signatures | Included | Partial | Omitted |
| --- | ---: | ---: | ---: |
| Nodes | 12 | 31 | 82 |
| API | 84 | 39 | 87 |
| Fixtures | 65 | 7 | 83 |

An included signature is not a proved result. Partial entries identify untyped conditions; omitted entries retain their exact mathematical statements in the packet. In particular, coherent naturality, simplicial-operator compatibility, signed DG comparison, the full Koszul contraction/DG API, point-free localization and several enhanced equivalences still require formal interfaces and proofs. No implementation status was changed from `unchecked`.

## Mathematical corrections

The main errors were corrected in place, with individual reasons in `review.checked`.

- **Relative sections.** CoCartesian sections belong to the relative functor object over the fixed identity of the base. Every simplex, including transformations, must have that base projection. Selecting section vertices inside ordinary `Fun(B,E)` gives incorrect morphisms. Added the relative carrier, its degreewise equation, the forgetful map and a fixture for the identity over `BG`: the section category is terminal even when the centre of the group is nontrivial. This follows the relative construction and coCartesian dual of [HTT](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Corollary 3.3.3.2, printed pp. 215–216, PDF pp. 233–234.
- **Homotopy size.** Local smallness requires a small Kan model of the mapping *homotopy type*. Raw simplex smallness is too strong. The predicate now includes a quasicategory hypothesis and homotopy-inverse maps to a lifted small Kan model. Large contractible presentations supply the regression fixture. Representable evaluation is an equivalence edge rather than strict equality, with coherent naturality still explicitly partial. See HTT 5.4.1.5 and 5.4.1.7, printed pp. 421–423, PDF pp. 439–441.
- **Derived ringed adjunction.** General pushforward does not preserve K-injectives merely because it is a right adjoint. That argument requires an exact underived left adjoint; restriction from `Z/p` to `Z` already exposes the problem. The general proof uses K-flat source/K-injective target comparisons to derive the mapping-space adjunction. Slice or unchanged-coefficient cases retain the exact-left-adjoint argument. The enough-points limitation of [Liu–Zheng](https://arxiv.org/abs/1211.5948), §3.1, pp. 79–88, remains a limitation of the comparison source.
- **Coefficient systems.** Zero-ideal evaluation is a categorical equivalence, not a simplicial-set isomorphism. Added its comparison functor and changed the suggested fixture. The pro-Tor statement now specifies degreewise pro-isomorphisms and pro-zero cohomology of the error cone, matching the Milnor/derived-limit input; it retains uniform finite Koszul control for varying unbounded coefficients.
- **Hypotheses.** The terminal-fibre finality and transport criteria require a quasicategory base. The mapping-space coCartesian criterion requires quasicategory source and base. A ringed-system comparison uses a small site presentation in a larger universe, rather than a literally small Grothendieck topos. Every cutoff category is presentable before constructing its adjoint. Compact-generator detection tests every integer shift; exactness ensures their images remain compact.
- **Direct inputs.** Added the directly used stable/universal-property inputs, internal Hom inputs, coherent Roos and Milnor inputs, and left completeness of derived abelian groups. Ordinary Dold–Kan equivalence is not silently promoted to its right-lax monoidal comparison or the simplicial-abelian Kan theorem. These remain precise formal inputs.
- **Locators.** Corrected the full-subcategory, ordinary filtered-poset, injective-model, accessibility, pointwise-equivalence and constant-model-diagram references. The cohomology base-change map uses the pinned `truncLE` and `truncLEι`, in the direction `τ≤0 → identity`; the earlier `eTruncGE` does not provide that map. Its citation remains valid for other Postnikov uses.

## Five added key inputs and ownership

The general locally Kan coherent-nerve theorem is a prerequisite for both `Cat∞` and `Spaces`. The pinned simplicial nerve carrier does not prove this theorem. The node supplies quasicategory horn filling and comparison with enriched mapping Kan complexes, with naturality and universe lifting. HTT Proposition 1.1.5.10, PDF pp. 41–42, and Propositions 2.2.2.7–13, PDF pp. 94–96, justify the proof. The suggested equal-universe specialization is explicitly partial.

The upstream order changes the earlier completion ownership. [WORKERS](../WORKERS.md) requires upward inputs to move down; [the order](../upstream/CaraianiNewton.md) places EnhancedDerivedSheaves in tier 4 and DerivedDeRhamCohomology in tier 9. All DD.1 prerequisites and its supplier request were removed. Generic completeness, reflector, completed tensor and Nakayama are supplied by the point-topos cases of the E4 nodes. Three further nodes now supply the general Koszul carrier in E1, its finite power tower in E4, and regular-ideal ordinary quotient algebra in E4. The Koszul construction permits arbitrary modules; bounded perfectness is qualified by finite projectivity. The tower works for arbitrary unbounded complexes and finitely generated ideals. Ordinary quotient replacement requires the stated regular sequence; unrestricted Artin–Rees is not used.

These inputs are justified by [Stacks More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf), Definitions 29.1–29.2 and Lemmas 29.3–29.12, pp. 69–72; Lemmas 31.2–31.6, pp. 76–78; Situation 93.15 and Lemmas 93.16–93.20, pp. 266–268. The non-Noetherian regular-ideal application is also checked in [Scholze, Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 26.2 and Remark 26.3, pp. 161–162. Exact redirects for the later DD.1 plan/package are in `ownershipMoves` and the handoff. Those files are outside this review and were not edited.

The fifth new node is quantitative descendability for perfect h-covers. Čech effectivity needs tensor-nilpotence of the structure-algebra fibre with a finite index, stronger than ordinary cover cohomology. The index must be uniform along a fixed Frobenius approximation. The E2 node owns that enhanced telescope argument; D0 supplies ordinary geometric bounds. The abstract E5 module-descent request stays acyclic and does not prove the geometry. The formal perfected-fibre-product/Frobenius comparison remains an explicit gap. See [Bhatt–Scholze, Witt vector affine Grassmannians](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Proposition 11.6, p. 41; Lemmas 11.22–11.23, p. 44; Proposition 11.25, p. 45; Theorem 11.27, p. 46.

## Baseline and current-library audit

Read all **63 named pinned declarations**, their hypotheses and their citing uses, in **56 modules**. Verified all **58 source-file SHA-256 hashes** against the existing pinned trees: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Added two truncation citations and three exterior-power citations. Exterior powers supply the existing carrier and universal property, not the new Koszul differential. Added supporting evidence for the already existing internal-Hom quasicategory instance at `PushoutProduct.lean`, lines 156–157, rather than replanning it. Near misses remain qualified inputs, including degree-one hypercovers, ordinary mates, single-variable Tor and inverse-limit `Perfection`.

The separate read-only current audit records roadmap commit `070dc2becd74419e76303ede84b465ed4a69461f`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read DGAInfinity and AlgebraicTopology scopes and relevant signatures, current DG carriers/H⁰/functoriality, and the qualified extension-by-zero input. General DG carriers and H⁰ remain imports; Kan homotopy-group theory remains AlgebraicTopology-owned. Searched the nine newer roadmap READMEs, eight available suggested files and four Completed documents for overlap. OperatorTheory has no suggested file at this commit. Current source searches found no generic Koszul complex or derived ideal-completion carrier. No Lake command was run in these current trees.

## Source issues and validation

All four source-issue entries are independently **confirmed**, restricted to their exact recorded public versions:

1. Pro-étale author copy, Proposition 3.3.3, p. 19: the proof must use every integer cohomological degree and the eventual tower tail. Negative shifts and a nonzero omitted product factor test the correction.
2. Proposition 3.3.7(2), p. 20: a premise for fixed `K` cannot establish category-wide left completeness; `K=0` and Example 3.3.4 expose the quantifier error.
3. Witt Lemma 3.18, p. 15: the affine span gives `A ⊗ᴸ_B B′`, not the reversed derived tensor.
4. Pro-étale Lemma 3.3.2, p. 18: truncation adjunction compares mapping spaces, not all degrees of full derived Hom. The shifted integer-complex example has differing positive cohomology while the mapping spaces agree. The intended adjunction survives.

The last two displays were also inspected as renderings of the exact downloaded/hash-verified PDFs. Unavailable version-of-record pages were not accused or represented as read. Relevant statements and proof arguments across HA, HTT, the two Bhatt–Scholze papers, Liu–Zheng, Stacks, Scholze, Bhatt’s direct summand paper and the mixed-characteristic minimal-model paper were read; the packet records precise blocks, URLs and hashes. No book or source passage was copied into the repository.

Validation completed:

- `check_blueprint.py` with an independently generated index of the existing pinned source trees: **zero errors, zero warnings**.
- Final `lean-check`: **exit 0**, **242** proof-placeholder warnings, no other warnings or errors. The added Koszul signatures and all corrected higher-category fixtures were included in this run.
- Exhaustive matrix uniqueness/completeness, stage counts, baseline hashes, implementation statuses, definition fixtures and planet bounds checked independently.
- Intake checks on the four authorized deliverable paths and `git diff --check`: **zero problems**.

The remaining work is precisely the packet’s recorded formal/source gaps and lower-tier/acyclic requests. The packager must mirror the corrections and ownership moves in the reader before using its old text; that reader is not an authorized deliverable of #396. No unresolved question prevents accepting this pass. The orchestrator’s required ownership redirects and reader updates are listed in the [handoff](../handoff/REV-EnhancedDerivedSheaves--E0.md).
