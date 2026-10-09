# Independent package review: Deligne weights, purity and the Weil bounds

**Verdict: accepted.** All six package requirements pass after the three corrections below. The numerical omissions identified by the first review have been supplied in the revision. The suggested Lean file elaborates with `sorry` as its only warning.

Reviewer: `independent-review-REV-PKG-DeligneWeightsAndPurity~2`

Date: 2026-10-09

Agent: Codex, GPT-6, session `codex-JVE9bN`

Issue: #7924

The package was inspected at atlas commit `b53cfa73769d43d26ca7d2ea933327dea815293d`, with the corrections submitted here. This session authored neither package round and did not perform the first review.

## Package requirements

| Requirement | Result and evidence |
| --- | --- |
| Upstream form | Pass. The introduction sets the mathematical scope, conventions and neighbouring owners. Ordered layers contain targets, inputs, source locators, definition APIs and tests; external supplier contracts identify the mathematical interfaces. The README is **199,179 bytes**, below the strict 200,000-byte bound. Its structure and density were compared with upstream RepresentationTheory/SemisimpleAlgebras and RepresentationTheory/CompactGroups. |
| Fidelity | Pass. All **135 targets**, **177 API items** and **94 tests** of the two accepted inputs occur in the corresponding target sections. API and test statements match after removing namespace prefixes, Markdown backticks and whitespace differences. Target statements, additional hypotheses, limits and prerequisites were checked mathematically, including compressed statements and links replacing long target identifiers. All 15 definition targets retain at least three tests. |
| Own words and sources | Pass. The package states mathematical results and their hypotheses in its own words. It contains neither source passages nor a section-by-section paper summary. Every target has source locators; direct checks of delicate conventions and hypotheses are recorded below. |
| Mathematical presentation | Pass. The README and suggested file contain no packet names, job identifiers, checkpoints or coverage verdicts. Removed the remaining process phrase in target 10.4. The suggested file's opening reference to contributors and reviewers is the standard note required by PROTOCOL §13. |
| Suggested Lean file | Pass. A final `lean-check` of the submitted file exited **0**, with **196 warnings**, each `declaration uses sorry`, and no other diagnostics. Available numerical signatures were checked against their targets, rather than treating elaboration alone as mathematical validation. Genuine unavailable geometric and analytic supplier types remain mathematical specifications under PROTOCOL §13. |
| Metadata | Pass. The complete file is the single line `topic = "math.AG"`, followed by a newline. Algebraic geometry fits the sheaf-theoretic purity and Lefschetz scope. |

The inputs are `DeligneWeightsAndPurity--DWP.0.json` (83 targets, 81 API items, 44 tests) and `DeligneWeightsAndPurity--DWP.7.json` (52 targets, 96 API items, 50 tests). Target counts in DWP.0 through DWP.10 are 18, 9, 11, 11, 3, 19, 5, 15, 24, 13 and 7. Both inputs passed `python3 scripts/check_blueprint.py` with **zero errors and zero warnings**. README anchors are unique and all internal links resolve. `Suggested.lean` is 158,960 bytes.

## Numerical completeness of the revision

The first review's three principal findings are resolved:

- **Target 0.18:** the integer-weight factorization now includes stable pure kernel summands, the matching characteristic polynomials and functoriality under intertwiners. The fixed-ι real-weight decomposition is expressed after extension to the algebraic closure, with internal generalized-eigenspace summands, purity and functoriality. It is kept distinct from the descended integer decomposition.
- **Target 0.16:** the pairing induces a genuine linear equivalence to the dual, with the scaled inverse-transpose relation and reciprocal characteristic-polynomial identity. Maximal generalized eigenspaces have the required orthogonality and perfect reciprocal pairing, including the nonsemisimple case. Pure and ι-pure weight transport retain nonzero scalar and invertibility hypotheses.
- **Target 9.7:** the upper-degree decomposition uses powers λ^(r+k), in addition to the lower-degree λ^k decomposition. The primitive images are orthogonal for the Lefschetz form, and its graded symmetry is stated under the additional symmetry hypothesis on the original pairing. Bounded grading and hard-Lefschetz bijectivity remain explicit.

The additional findings are also resolved: finite trace determinacy uses characteristic zero and traces through the dimension (0.10); polynomial functional calculus includes maximal generalized-eigenspace containment (0.11); finite base extension preserves and reflects endomorphism purity and transports weight multisets with multiplicity (0.12); Hom and iterated-tensor weight formulas are present (0.13); and the invariant complement is unique when the two weight spectra are disjoint (0.17). The revision also states scalar-extension, exterior-power endpoint, determinant, direct-sum, twisting and pairing compatibility clauses used by the numerical APIs. Their conclusions and edge hypotheses were read independently.

The geometric sheaf, complex, cohomology and analytic interfaces cannot yet be represented by their genuine supplier types in this build. Their mathematical targets, APIs and tests remain in the README and comments, with the suppliers identified. Acceptance concerns a complete roadmap package with elaborating prototypes, not completed proofs or formalized geometric theorems. No arbitrary `Prop` carrier or field storing a desired theorem replaces these missing types.

## Corrections made in this review

1. **Target 1.4, Frobenius convention.** Corrected the explanatory scope sentence: arithmetic Frobenius on V_ℓA is π_A, geometric Frobenius on V_ℓA is π_A⁻¹, and geometric Frobenius on H¹ is the ordinary transpose dual of π_A. Taking the contragredient of the geometric Tate-module action gives this transpose, rather than its inverse. The stated weights 1 on H¹ and −1 on the geometric Tate module now agree with the explanation. Sources: Deligne, Weil I, §1, (1.15), p. 279; Milne, Abelian Varieties, Chapter II, §§1.1–1.3, pp. 75–78.
2. **Target 0.2, intrinsic total reality.** Strengthened `IsWeilNumber.reciprocal_sum_totallyReal` to assert that every complex root of the minimal polynomial of α + q^n/α is real, alongside algebraicity and the assertion for ambient embeddings. The ambient-embedding assertion alone can be vacuous when the field has no embedding into ℂ. The intrinsic conclusion follows by extending embeddings of the finite algebraic subfields and using σ(α)·conj(σ(α)) = q^n. This restores the full target without adding assumptions on the ambient field. Sources: Weil II, §1, (1.2.6)–(1.2.12), pp. 155–156, and the target's elementary conjugate calculation.
3. **Target 10.4, presentation.** Replaced the phrase describing DWP.8 as already planned with a direct mathematical reference to its mixedness theorem, in both the README and suggested-file comment. The nearby-cycle, proper-image and Newton hypotheses are unchanged.

## Libraries and ownership

All **41 baseline declaration statements** were read at the applicable pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library-audit entries and relevant link-map contracts were checked. Existing characteristic-polynomial, generalized-eigenspace, tensor, exterior-power, valuation and bilinear-form operations supply ingredients, while the weight predicates and transports are additions. Tau Ceti's Clifford result restricts an irreducible finite-dimensional representation to a normal subgroup; the semisimple generalization here applies that result to summands.

The read-only current upstream roadmap checkout was inspected at `618e0b30d21791d6a492ce88ba8602745697b21a`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches of the nine roadmaps newer than the atlas snapshot, their suggested files and the current library found no replacement for the added numerical weight interfaces. Upstream CompactGroups and SemisimpleAlgebras were read as presentation and supplier comparisons. Existing representation-theoretic interfaces are imported; the more precise compact-form and tensor-invariant contracts are retained as extensions of their owners.

The package preserves LPV's ownership of pencils, vanishing cycles and semistable normalization; EDC's coefficient categories, six operations, duality and relative Lefschetz; WC's rational/integral degree factors, ℓ-independence and point-count assembly; and RD.6's rigid-coefficient fibres. Hasse and Jacobian comparisons use their existing owners. The positivity argument remains an ordinary-power-series statement, and a stable arithmetic subquotient requires its own compatible rational factor before ℓ-independence can be exported. No neighbouring roadmap is replanned, and no new ownership move is made.

## Source checks and receipts

Source locators were compared with the accepted targets throughout. Direct source checks included Weil I (1.4)–(1.5), pp. 274–275, (1.15), p. 279, and (6.10)–(7.1), pp. 297–299; Weil II (1.2.6), p. 155, (1.2.11)–(1.2.14), p. 156, (3.1.2)–(3.1.5), pp. 198–200, (3.3.1)–(3.4.1), pp. 204–207, (3.4.9)–(3.4.14), p. 210, (3.5.1)–(3.5.5), pp. 210–211, (4.1.1)–(4.1.5), pp. 217–218, and (6.2.13), pp. 250–251; Deligne (1968), (1.5)–(1.6), p. 108; Milne II.1.1–1.3, pp. 75–78, and III.11.1–11.2, pp. 117–118; SGA 7 II, XXI, Lemma 5.2.1 and Theorem 5.2.2, pp. 385–386; Bergström–Faber–Payne v2, Proposition 4.2, pp. 6–7; and Yu v5, Proposition 6.1.1, pp. 42–43. These are statement and hypothesis checks, not a fresh proof audit of all cited papers.

The ordinary-node Tate twist, smooth-versus-compact-support bounds, fixed-ι versus integer weights, geometric semisimplicity, graph orientation factor and base-dimension normalization of equidistribution were checked specifically. The normalized Sato–Tate density and minus sign in the elliptic point count are retained. Only the stated public preprint edition of Bergström–Faber–Payne was checked; no comparison with a different edition is claimed.

These seven public PDFs were fetched into disposable scratch space on **2026-10-09**. Their SHA-256 values were recomputed independently and match the accepted source records. No PDF or source passage is submitted.

| Source | Public file | SHA-256 |
| --- | --- | --- |
| Deligne, Weil I | [Numdam](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| Deligne, Weil II | [Numdam](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| Deligne, Lefschetz (1968) | [Numdam](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf) | `b154116942342392ef70b6d0ceb5e0abe896545189afb6a9c9ef51338aab1bbf` |
| Milne, Abelian Varieties, version 2.00 | [Author's notes](https://www.jmilne.org/math/CourseNotes/AV.pdf) | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| SGA 7 II, Exposé XXI | [Princeton scan](https://web.math.princeton.edu/~nmk/old/niveaucoho.pdf) | `f32d4ef0105252141dbc845233d6e65867684a5cb6c97e6e9f07595ffce679d1` |
| Bergström–Faber–Payne, arXiv:2206.07759v2 | [Public preprint](https://arxiv.org/pdf/2206.07759v2) | `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758` |
| Yu, arXiv:1807.04659v5 | [Public preprint](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |

## Reproducible validation

- `lean-check research/blueprint/packages/DeligneWeightsAndPurity/Suggested.lean`: exit 0; 196 `sorry` warnings only.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json research/blueprint/packets/DeligneWeightsAndPurity--DWP.7.json`: both inputs have zero errors and warnings.
- JSON/TOML parsing, byte counts, unique anchors, internal links, and per-target API/test name and statement comparisons passed. Every target has a source line, and every definition has at least three tests.
- The changes are confined to the package README, suggested file, review verdict, this report and this job's handoff. Metadata needs no edit.
