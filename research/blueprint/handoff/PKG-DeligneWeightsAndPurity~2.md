# PKG-DeligneWeightsAndPurity~2 — completed revision

Issue: [#7896](https://github.com/CBirkbeck/tauceti-explorer/issues/7896). Agent: Codex (GPT-6), session `codex-pYqb2u`. Date: 2026-10-09. Branch: `codex-pYqb2u-deligne-weights-package`.

The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7896#issuecomment-6086755557). This submission completes the numerical-signature revision requested by [the independent package review](../reviews/REV-PKG-DeligneWeightsAndPurity.md). It changes [Suggested.lean](../packages/DeligneWeightsAndPurity/Suggested.lean) and this handoff. The previously accepted mathematical presentation in the README, metadata, both input packets, assembly and `review.json` are unchanged. The existing review verdict remains for the next independent reviewer to replace.

## Revision and clause check

The accepted inputs remain [DWP.0](../packets/DeligneWeightsAndPurity--DWP.0.json), [DWP.7](../packets/DeligneWeightsAndPurity--DWP.7.json), the assembled reader and suggested file. The README is the mathematical specification; it has not been narrowed to fit partial signatures.

| README target | Numerical conclusions now expressed |
| --- | --- |
| 0.1 | Existing algebraicity, embeddings, field-map invariance, nonvanishing, uniqueness and polynomial-root criterion retained. |
| 0.2–0.3 | Existing product, inverse, positive-power/base-change and integral weight-zero criteria retained; added integer powers and the algebraic totally real reciprocal sum. |
| 0.4 | Existing multiplicative, inverse, composition and power/base rules retained; added the rational-base weight formula beyond the example at 2. |
| 0.5 | Existing prescribed-base embedding/isomorphism signatures retained; added prescribed transcendental images, the cardinalities of the p-adic field and its closure, and a p-adic complex isomorphism extending the specified countable subfield embedding. |
| 0.6 | Added the all-isomorphisms scalar criterion and the all-embeddings endomorphism criterion, retaining the cardinality hypotheses. |
| 0.7 | Added explicit compatible-closure transport of eigenvalue multisets and preservation/reflection of fixed-embedding purity. Strengthened Jordan, diagonal and zero-space examples. |
| 0.8 | Added the determinant, reverse-polynomial and root-multiset factorizations along an invariant subspace. |
| 0.9 | Retained the previous review's extension equivalences and weight union; added block-sum root/weight formulas and both purity equivalences. |
| 0.10 | Added finite trace determinacy with equal dimensions and characteristic zero, and the linear-factor expression for the reverse polynomial. The determinant interpretation uses native `Matrix.reverse_charpoly`; the existing logarithmic derivative remains valid in every characteristic. |
| 0.11 | Added maximal generalized-eigenspace containment under a polynomial and the spectrum of the inverse. Polynomial/power multiset formulas retained. |
| 0.12 | Added endomorphism-level integer/fixed-embedding purity equivalences under positive powers, and equality of weight multisets after raising both Frobenius and the base to that power. |
| 0.13 | Added Hom and iterated tensor spectra, the determinant/root-product adapter, integer and real tensor/Hom/contragredient/tensor-power purity, and arbitrary weight-multiset transport for tensor, Hom and contragredient. |
| 0.14 | Added exterior endpoints, vanishing beyond dimension and real-weight transport with multiplicities. Integer exterior purity now explicitly assumes q > 1. |
| 0.15 | Added intertwiner, invariant-subspace and inverse-scalar contragredient compatibility; the scalar twist leaves underlying vector-space exact sequences unchanged. Existing Tate/half-twist and tensor rules retained. |
| 0.16 | Added pairing-induced dual identification, polynomial reciprocity, generalized-eigenspace orthogonality and perfection over a splitting field, integer/real purity transport, and a unique genuine scalar-extension pairing characterized on pure tensors. |
| 0.17 | Added distinct-weight vanishing and unique invariant complements for both integer and fixed-embedding weights. The coprime-polynomial intertwiner theorem retained. |
| 0.18 | Added stable pure integer summands with their characteristic polynomials and an internal direct sum, fixed-embedding real summands grouped by maximal generalized eigenspaces over the closure, finite support, stability and purity, and both functoriality signatures. |
| 9.7 | Added the upper-degree decomposition with exponent r+k, injectivity of both primitive-image maps, primitive-image orthogonality for the Lefschetz pairing, and its symmetry sign under the additional graded-symmetry hypothesis. Bounded grading, degree-two action and hard-Lefschetz hypotheses are retained. |

The integer summands descend to the characteristic-zero coefficient field; fixed-embedding real summands are stated after coefficient extension. Neither decomposition assumes semisimplicity. Pairing perfection is bijectivity of the actual bilinear dual map, and the spectral restrictions use maximal generalized eigenspaces. The polynomial reciprocity formula is written using reversal and composition, avoiding division by a polynomial variable.

New examples distinguish repeated roots after squaring, reciprocal nonsemisimple Jordan blocks, failure of positive-trace determinacy in characteristic p, rational non-descent of the two real-weight lines for the operator with eigenvalues 1 ± √2, and the three-step primitive chain. Three primitive-piece examples distinguish the degree index, the r+1 kernel exponent and the upper λ² image. The exterior example checks the zero-dimensional edge case: vacuous purity at q=1 cannot make the zeroth exterior power pure. This was a missing hypothesis in the old prototype, not a change to the accepted mathematical target, which already fixes q>1.

No new definition or substitute geometric carrier was introduced. An explicit native additive-group instance for the scalar-extended tensor module resolves inference of the characteristic polynomial of a real-weight restriction. All geometry and analytic supplier specifications remain mathematical comments where genuine supplier types are unavailable, as allowed by PROTOCOL §13. They have not been replaced by arbitrary proposition fields.

## Libraries, owners and sources

Read the reviewed DWP entries of `data/library-coverage.json`. The changes build on native characteristic polynomials, tensor/exterior constructions, polynomial evaluation, maximal generalized eigenspaces and internal direct sums. In particular, native spectral decomposition and generalized-eigenspace functoriality are ingredients of the weight-specific conclusions, not newly planned general decomposition theories. The determinant adapter cites `Matrix.det_eq_prod_roots_charpoly`. Relevant statements were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` in the shared pinned build; the build's Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`.

Screened the current upstream Suggested files, including the nine newer roadmap families listed in WORKERS.md, at TauCetiRoadmap `de435a569d325b365a30fe83269ce34674eaea80`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No numerical Weil-weight or primitive-Lefschetz target added here was found there. Read the upstream DifferentialGeometry and RepresentationTheory/SemisimpleAlgebras READMEs in full and inspected their Suggested forms. The package retains its existing owner boundaries: LPV's pencils/monodromy/invariant cycles; EDC's coefficient categories, operations and relative Lefschetz; WC's zeta assembly/functional equations; and the RD.6 rigid-coefficient fibres. No ownership moved and no packet amendment is requested.

Checked the revised formulations against Weil I §1, (1.5.1)–(1.5.3), p. 275 and the proof of (1.7) ⇒ (1.6), p. 277; the reciprocal-pairing motivation in (2.4)–(2.5), p. 281; Weil II (1.1.13), pp. 152–153, (1.2.1)–(1.2.7), pp. 153–154 and (1.2.11)–(1.2.14), p. 156; Deligne (1968), (1.5)–(1.6), p. 108; and Weil II (4.1.4)–(4.1.5), p. 218. The detailed linear-algebra conclusions are extensions/derivations of those inputs, not claims that every displayed general-field formula appears verbatim in the papers.

These three public PDFs were read in disposable scratch on 2026-10-09. Their SHA-256 hashes match the accepted records. No PDF, extracted passage or other source copy enters the repository.

| Source | Public file | SHA-256 |
| --- | --- | --- |
| Weil I | [Numdam](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| Weil II | [Numdam](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| Lefschetz (1968) | [Numdam](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf) | `b154116942342392ef70b6d0ceb5e0abe896545189afb6a9c9ef51338aab1bbf` |

## Validation and next step

- `lean-check research/blueprint/packages/DeligneWeightsAndPurity/Suggested.lean`: exit 0, **zero errors, 196 warnings, all declaration uses of `sorry`, no other warnings**, at the pinned build. Available memory exceeded 20 GB. Checks were sequential; no language server, library build/update/cache command or background compiler was started.
- Both `python3 scripts/check_blueprint.py` commands on the accepted input packets: **zero errors and zero warnings** (83 and 52 nodes).
- README checks: **135 targets, all 177 API names and 94 test names retained**, unique explicit anchors and valid internal fragment links. README size **199,191 UTF-8 bytes**, unchanged and below 200 KB. Suggested file size **158,919 bytes**. Metadata parses as exactly `topic = "math.AG"`.
- `git diff --check` passed. Only the issue's Suggested file and this handoff are changed; no private paths or source passages were added.

The revision is complete for independent package review, not a checkpoint. No package work remains for a successor. The next reviewer should check the table's conclusions against the README and rerun `lean-check`. Elaboration checks signatures and examples with admitted proofs; it does not certify proofs of the numerical targets or construction of the geometric supplier interfaces.
