# Independent review: Deligne weights, purity and the Weil bounds

**Verdict: needs_changes.** The README satisfies the package requirements after the corrections below. The suggested file elaborates, but some of its numerical theorem signatures express only part of the corresponding mathematical target. Item 5 therefore remains unsatisfied.

Reviewer: `independent-review-REV-PKG-DeligneWeightsAndPurity`

Date: 2026-10-09

Agent: Codex, GPT-6, session `codex-R8rust`

Issue: #7510

Package inspected at repository commit `763e75640`, followed by the corrections in this submission. This session did not write the original package.

## Checks and results

| Requirement | Result |
| --- | --- |
| Upstream form and size | Pass. Introduction, neighbouring owners, conventions, ordered layers, targets, prerequisites, source locators, definition APIs and tests are present. The final README is 199,191 bytes, below 200 KB. Compared with the HodgeStructures and RepresentationTheory/SemisimpleAlgebras upstream examples. |
| Fidelity to the accepted plan | Pass for the README. All 135 targets, 177 API items and 94 tests occur in the corresponding sections. Statements and hypotheses were compared individually; every prerequisite resolves to the same target or imported interface. |
| Own words and sources | Pass. The document states mathematical results with hypotheses and locators, rather than reproducing source passages or following a paper section by section. Each target retains theorem/section/page citations. Source checks are described below. |
| Mathematical presentation without programme process | Pass after removing process and omission-status commentary from Suggested.lean. Layer identifiers and mathematical supplier contracts remain. Its opening reference to contributors and reviewers is the standard note required by PROTOCOL §13. |
| Suggested Lean file | Elaboration passes; mathematical completeness needs changes. `lean-check research/blueprint/packages/DeligneWeightsAndPurity/Suggested.lean` exited 0 with 126 warnings, all uses of `sorry`, and no errors. The remaining discrepancies are below. Subsequent edits changed comments only. |
| Metadata | Pass. The entire file is `topic = "math.AG"` followed by a newline. Algebraic geometry fits the sheaf-theoretic purity and Lefschetz scope. |

The accepted inputs are `DeligneWeightsAndPurity--DWP.0.json` (83 nodes) and `DeligneWeightsAndPurity--DWP.7.json` (52 nodes). Both passed `scripts/check_blueprint.py` with zero errors and warnings. Target counts in DWP.0 through DWP.10 are respectively 18, 9, 11, 11, 3, 19, 5, 15, 24, 13 and 7. The comparison found no missing README target and no prerequisite discrepancy. Small editorial differences were checked mathematically, including shortened namespace prefixes and explicit links replacing target slugs.

All 41 baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, as applicable. The reviewed AUDIT-18 entries were checked. In particular, the existing Clifford declaration restricts an irreducible finite-dimensional representation semisimply to a normal subgroup; the package's semisimple version extends this summandwise. The suggested file imports individual Mathlib modules and was checked in the shared build at the stated Mathlib pin.

The surrounding link maps preserve three relevant distinctions: the Hasse theorem is an imported dimension-one comparison; the ordinary-power-series positivity argument is separate from a Dirichlet-series abscissa theorem; and the symplectic tensor invariant/coinvariant calculation requires its precise representation-theoretic supplier. The README retains these distinctions. Its other boundaries also preserve LPV's pencils, vanishing cycles and invariant cycles; EDC's coefficient categories, operations and relative Lefschetz; WC's zeta factors and functional equations; and RD.6's own rigid-coefficient fibres. No neighbouring roadmap was replanned.

## Corrections made in this review

- In target 6.1, restored **ordinary node**, replacing the accidental phrase “ordinary target”. Weil II (3.1.3)–(3.1.5), pp. 199–200, distinguish the node's Tate twist from the two boundary cases without that twist.
- Replaced two unreadable target slugs in 3.3 and 3.10 with links to 3.1, and replaced two empty prerequisite sentences with their elementary mathematical inputs.
- Corrected 3.5's second locator to Weil I, Lemma (6.11), p. 298; the preceding (6.10) is on p. 297.
- Removed packet, review, ledger and coverage-status language from Suggested.lean, retaining the mathematical specifications and exact supplying interfaces.
- Added `isPure_restrict_quotient_iff`, `isIotaPureEnd_restrict_quotient_iff` and `iotaWeights_restrict_quotient`. These supply the extension direction and weight union in target 0.9, beyond the pre-existing restriction/quotient implications.
- Removed an unnecessary characteristic-zero assumption from `characteristic_series_log_derivative`, matching the all-characteristic assertion in 0.10(ii).
- Generalized the `iotaWeight_rootOfUnity` example from the scalar 1 to any scalar whose positive power is 1, matching its stated test.

## Required revision of the numerical prototypes

The following are substantive omissions from theorem conclusions, rather than proof obligations discharged by `sorry`. Completing the proofs is not requested. Completing the signatures is requested.

1. **Weight decomposition, target [0.18](../packages/DeligneWeightsAndPurity/README.md#target-0-18).** `weight_decomposition` gives integer-indexed polynomial factors and a unique decomposition of each vector into their kernels. It does not state the fixed-ι decomposition over the algebraic closure in part (ii), or functoriality under intertwiners in part (iii). Add signatures identifying the summands, their stability and purity, and transport under equivariant maps, including real weights after coefficient extension. The existing field, endomorphism, algebraic-closure and generalized-eigenspace types can express these conditions. Keep the distinction between descended integer summands and real-weight summands after extension. Source: Weil I §1, proof of (1.7) ⇒ (1.6), p. 277.

2. **Perfect reciprocal pairings, target [0.16](../packages/DeligneWeightsAndPurity/README.md#target-0-16).** `eigenvalues_of_pairing` states the reciprocal root multiset. The file does not give the pairing-induced dual identification, the corresponding characteristic-polynomial identity, orthogonality and perfection on maximal generalized eigenspaces, or the pure/ι-pure weight transport. Add these conclusions with the perfectness, invertibility and nonzero scalar hypotheses retained. Ordinary eigenspaces would lose the nonsemisimple case. These are finite-dimensional linear algebra statements and do not require a geometric coefficient category. Sources: Weil I (2.5), p. 281; Yu §1, pp. 2–3, and §7.1, p. 64.

3. **Primitive decomposition, target [9.7](../packages/DeligneWeightsAndPurity/README.md#target-9-7).** `iSupIndep_lefschetzDecomposition` states only the lower-degree decomposition. `finrank_primitivePiece` states the dimension formula, and `lefschetzPairing_nondegenerate` states nondegeneracy on the lower-degree space and primitive part. Missing are the upper-degree decomposition by λ^(r+k), orthogonality of the primitive images for ψ_r, and the graded-symmetry conclusion under the extra symmetry hypothesis on B. Add signatures for these conclusions using the existing grading, submodules, bilinear form and degree-2 operator. Retain the bounded grading and hard-Lefschetz bijectivity assumptions. Source: Deligne (1968), (1.5)–(1.6), p. 108; the pairing specialization is also used in Weil II, Corollary (4.1.5), p. 218.

The revision should check the rest of the numerical statements clause by clause as well. Further absent clauses include finite trace determinacy in 0.10(iii), generalized-eigenspace containment for P(F) in 0.11, the endomorphism-level purity equivalence and weights with multiplicity under finite base extension in 0.12, the Hom/iterated-tensor weight statements in 0.13, and the unique invariant complement in 0.17(ii). Scalar power lemmas and root-multiset identities provide ingredients but do not themselves state these conclusions. Do not narrow the README to match the partial prototypes.

Many geometric constructions appear only as mathematical comments because their genuine sheaf, complex, cohomology or analytic supplier types are unavailable. The accepted inputs explicitly describe those supplier obligations, and PROTOCOL §13 permits conditions that cannot yet be stated to be left out honestly. This verdict does not require inventing replacement carriers or hiding hypotheses in arbitrary `Prop` fields. It concerns numerical conclusions whose genuine types are already available. A future review should distinguish those two situations when matching every target, API lemma and example.

## Source verification and receipts

Source locators were checked throughout the README against the accepted targets. Direct source spot checks included Weil I (6.10)–(6.13), pp. 297–298; Weil II (3.1.2)–(3.1.5), pp. 198–200, (3.4.9)–(3.4.14), p. 210, and (3.5.1)–(3.5.7), pp. 210–212; Milne II.1.1–1.3, pp. 75–77, and III.11.1–11.2, pp. 117–118; Yu Proposition 6.1.1, pp. 42–43; Deligne (1968), (1.5)–(1.6), p. 108; Bergström–Faber–Payne v2 Proposition 4.2, pp. 6–7; and SGA 7 II, XXI, §5, Lemma 5.2.1 and Theorem 5.2.2, pp. 385–386. These are checks of the assembled statements and selected delicate hypotheses, not a new proof audit of every source.

The finite-field Sato–Tate normalization and minus sign in the elliptic point count were preserved. The graph orientation line and automorphism-equivariant determinant contracts were also retained. The README cites the public preprint edition for Bergström–Faber–Payne; no claim is made to have compared its published version.

The following public files were fetched only into disposable scratch space on **2026-10-09**; every SHA-256 agrees with the accepted input's source record. No source PDF or passage is included in this submission.

| Source | URL | SHA-256 |
| --- | --- | --- |
| Deligne, Weil I | [Numdam scan](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| Deligne, Weil II | [Numdam scan](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| Milne, Abelian Varieties, version 2.00 | [Author's notes](https://www.jmilne.org/math/CourseNotes/AV.pdf) | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| Yu, arXiv:1807.04659v5 | [Public preprint](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |
| Schiffmann, Annals 183 (2016) | [Published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf) | `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5` |
| Deligne, Lefschetz (1968) | [Numdam scan](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf) | `b154116942342392ef70b6d0ceb5e0abe896545189afb6a9c9ef51338aab1bbf` |
| Bergström–Faber–Payne, arXiv:2206.07759v2 | [Public preprint](https://arxiv.org/pdf/2206.07759v2) | `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758` |
| SGA 7 II, Exposé XXI | [Public Princeton scan](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf) | `f32d4ef0105252141dbc845233d6e65867684a5cb6c97e6e9f07595ffce679d1` |
