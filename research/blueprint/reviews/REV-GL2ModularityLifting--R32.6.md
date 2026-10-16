# Independent review: GL₂ modularity transfer, R32.6

Job `REV-GL2ModularityLifting--R32.6`, issue #9927. Reviewer: Codex session `codex-8dkHrJ`, 16 October 2026. The planning author was the separate session `codex-uMJFd9`.

**Verdict: accepted as a complete target-level planning pass, with coverage `planned`, not `closed`.** The corrected composition has explicit supplier boundaries and gaps. Acceptance does not certify an independent proof of Serre, the inherited wrappers' dependency closure, or an arithmetic Lean theorem.

## Inventory and scope

The packet contains one theorem node, corrected in place, and references seven existing R32.6 nodes owned by `GL2ModularityLifting--R32.3.json`. No node was added or duplicated. There are no new definitions, constructions, API items or definition unit tests. The one new planet remains “Modularity transfer between linked families.” Two baseline citations are confirmed; none was removed or replaced. Four convention examples remain in the suggested file. The revised packet has fourteen direct prerequisites, four requests and four gaps.

The packet's `review.checked` covers its one owned node. The seven inherited contracts were also inspected, as detailed below; this review does not edit or reaccept their owner packet. The protocol permits `planned` coverage when target chains end in precise gaps or requested stages. All stage targets are mapped, so the complete pass satisfies that definition without claiming closure.

## Corrections

1. **Residual choice independence.** Added `ArithmeticGaloisRepresentations:R01.1/residual-representation-well-defined`. Identifying the selected A-member with a newform representation must transport its residual modularity through changes of stable lattice and finite coefficient model. The reduction operation alone did not state that independence.
2. **Both sides of recognition.** Added `AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility`. The R19.1 realization supplies the representations and good polynomials but explicitly leaves absolute irreducibility to R19.3. Recognition returns semisimplifications on both sides. The family hypothesis and the separate newform theorem now justify identifying the actual representations.
3. **Geometric-twist input.** The R32.1 weight lemma assumes a character of the form ε_p^m μ, with μ finite order, and a modular witness of weight at least two. It cannot classify an arbitrary twist. Added the R32.1 stage prerequisite, an exact request for that classification and the weight-one exclusion, and a gap at the use. The weight-k endpoint is explicitly a target requiring this input.
4. **Twists and newforms.** Added the existing current-main `ModularForms` Layer 9 prerequisite and an import request for its Dirichlet-twist/primitive-associate API. A cuspidal twist need not itself be new at the displayed level. The twist multiplies good eigenvalues by μ(q) and nebentypus by μ²; its primitive associate preserves the weight and good eigenvalues. Galois twisting compatibility then follows from the R19 polynomial formula, irreducibility and recognition. No analytic twist theory is replanned here.
5. **Coefficient embeddings and irreducibility.** Made the relative composita and extensions of specified embeddings explicit in the proof. Each recognition is in one fixed residue characteristic. Selected irreducibility is now expressly over ℚ̄_p, rather than ambiguously over a finite coefficient model.
6. **Inherited closure boundaries.** Promoted the already identified wrapper tier problem to an explicit gap, and recorded the stronger independence assurance in the inherited odd-transfer annotation as an owner correction. The newly explicit R19.3 supplier itself cites R24.5/character-system; its owner must also reconcile that transitive tier edge. The continuation makes no claim that the absence of a direct R24 prerequisite certifies its entire supplier graph.
7. **Audit ownership and source finding.** Clarified that R31.6 returns dependencies of its own globalisation/support inputs to the R32.6 audit owner. Added a confirmation to the reference to existing source finding `GL2ModularityLifting/E10`, without duplicating the finding. The reader and suggested-file boundary comments match these corrections.

## Node and supplier checks

The owned node `R32.6/directed-polynomial-family-transfer` is **corrected**. A seed gives algebraic polynomial identities in a relative compositum. Extending its embedding at the selected prime and applying recognition supplies residual modularity through lattice independence. The appropriate lifting branch handles B; normalization has its explicit missing input. A second algebraic comparison and recognition at each B-place propagate the resulting newform witness. No coefficient-prime WD equality or all-member de Rham assumption is used in these recognition steps.

The inherited node suffixes below all have prefix `GL2ModularityLifting:R32.6/`.

| Inherited contract | Result of inspection |
|---|---|
| `transfer-residually-irreducible-odd` | Mathematical transfer matches DP 1.4 and Tung 4.7, including p=3, residual modularity and cyclotomic absolute irreducibility. Its blanket independence annotation is excluded from this continuation's acceptance. |
| `transfer-dyadic` | Tung Theorem A retains residual modularity and nonsolvable image while removing the older local exclusion. Oddness remains a characteristic-zero hypothesis. |
| `transfer-residually-reducible` | Pan 1.0.2 requires characteristic-zero irreducibility and the local ratio exclusion at 3. It needs neither a modular seed nor ordinarity. Exact-weight normalization consumes the recorded supplier input. |
| `transfer-ordinary-three` | Skinner–Wiles applies to each normalized target separately: global residual sum 1⊕ω₃, inertia quotient 1, and finite-order determinant factor. Congruence does not supply those local conditions. |
| `de-rham-lifting-and-almost-strict-systems` | The application is sound with the explicit DP geometric data. Its R24.5 dependency list is an assembly obligation, not an input to the new theorem. |
| `ramified-reducible-coefficient-prime` | DP's de Rham data survive the missing coefficient-prime WD comparison. The selected member still needs irreducibility, oddness and a valid branch. The legacy R24.5 edges remain a recorded boundary. |
| `globalisation-dependency-audit` | Correctly excludes the full-Serre shortcuts and leaves the transitive globalisation certificate open. Its mathematical audit ownership stays in R32.6. |

Read the exact R01.1 coefficient-extension, reduction and residual-independence statements; the R01.5 recognition statement; R19.1 realization and R19.3 irreducibility; R32.1 weight-of-modular-twist; and both R32.5 ordinary-three/quotient-normalization statements. Their supplied contracts and limitations are reflected in the revised proof. The current upstream ModularForms Layer 9 already owns analytic twisting and primitive associates.

## Sources and baseline

All fourteen downloaded source hashes match the packet's recorded SHA-256 values. URLs and editions remain in the packet and the reader's source-edition list. The review read the following passages; the descriptions here are mathematical checks, not source excerpts.

| Source | Passages and checked boundary |
|---|---|
| Dieulefait–Pacetti, arXiv v2 | Theorems 1.4–1.7, pp.4–5; Definition 1.10, Remark 4 and Lemma 1.13, pp.6–8; §2, pp.9–14. Four branches, common good polynomials and the ramified reducible application. |
| Pan, arXiv v2 | Conjecture 1.0.1 and Theorem 1.0.2, pp.2–3; Theorem 8.0.1 and Remark 8.0.4, pp.124–125. Reducible range and the full-Serre shortcut in the irreducible consequence. |
| Tung, dyadic arXiv v3 | Introduction/Theorem A, pp.1–2; §4.3, pp.20–21. Residual modularity and the separate suitable-globalisation inputs. |
| Tung, odd-prime arXiv v4 | Proposition 3.9 through Theorem 4.7/Remark 4.8, pp.12–15. Faithfulness requires more than union-of-components support; lifting retains its hypotheses. |
| Skinner–Wiles, Numdam | Introduction main theorem, printed p.6/PDF p.3, inspected visually. In particular ψ has finite order. |
| Paškūnas, arXiv v2 | Theorem 1.1, pp.1–2; §1.1.2, p.5; Lemma 3.29 and proof, p.43. The weight change begins with a modular residual representation. |
| Emerton, author draft | §§7.3–7.4, pp.96–97. Full Serre in the first route; explicit CM residual modularity and a restricted weight-part input in the second. |
| Hu–Tan, arXiv v2 | Theorem 6.3 and proof, p.35. Residual modularity is retained before the unconditional deduction. |
| Calegari, arXiv v2 | Proposition 3.2 and its proof, pp.5–6. Potential finite-group globalisation and its geometric input. |
| Snowden, author preprint | §8, p.26. Prescribed splitting, potential modularity and descent have distinct dependencies. |
| Gee, hashed author PDF | Lemma 4.6.8 proof and Theorem 4.6.9, pp.25–26. Residual modularity and cyclotomic irreducibility are assumed; numbering is not collated with Kisin's 4.4.12 citation. |
| BLGG, hashed author PDF | Theorem A.4.1 and proof, pp.36–42. The potentially automorphic residual seed is an additional hypothesis. |
| CEG, hashed author PDF | §2.1, pp.15–17; Corollary 5.4, pp.78–79. EG14/BLGGT globalisation and automorphic-component inputs remain identifiable leaves. |
| Emerton–Paškūnas, arXiv v3 | Theorem 6.3, Remark 6.4 and the recalled inputs, pp.26–28. Union of components does not imply unconditional full support. |

The transitive inputs expressly listed as unread remain gaps; these targeted readings do not certify them. No quotation, source extract or downloaded paper is added to the repository. The existing E10 qualification was rechecked against the DP statement and Skinner–Wiles image; no new source issue was invented.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read `Mathlib.LinearAlgebra.Matrix.Determinant.Basic` including its section hypotheses:

- `Matrix.det_smul`: a finite square matrix over a commutative ring has determinant multiplied by the scalar to the matrix size. For `Fin 2` this is the inverse-square twist factor.
- `Matrix.det_fin_two`: the two-by-two determinant is the diagonal product minus the off-diagonal product, over the same commutative-ring generality. It supplies the integer and residue-ring sign checks.

Both citations have the required generality and conventions. No Tau Ceti declaration is cited as a baseline theorem.

## Library audit, ownership and validation

Read the R31.6 and R33.5 records in `data/library-coverage.json`; they route the audit here, and no direct GL2ModularityLifting record exists. Read the nearby current upstream LocalGaloisGroups and ModularForms ownership, conventions and relevant supplier targets, and searched the current and pinned source trees for the combined arithmetic interfaces. Existing profinite, cyclotomic, modular-form and determinant work is consumed, not replanned. The new twist dependency specifically consumes current upstream work absent from the atlas's older snapshot.

`RT-AREA-langlands-2/21` is respected: R32.6 owns modern ramified reducible transfer, and the existing R24.6 linked-systems node already imports its transfer nodes. The new theorem has no direct R24 prerequisite. No atlas link, supplier packet or promoted file was changed.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.6.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/GL2ModularityLifting--R32.6.lean`: exit 0, four expected `sorry` warnings and no other warnings. This elaborates the convention examples, not the arithmetic target.
- Intake `check-files` on the packet, reader, suggested file, report and handoff: zero problems. Whitespace and deliverable-scope checks pass.

For the orchestrator: route the new classification request to the existing R32.1 normalization owner; import upstream ModularForms rather than planning its twist API again; and have the authorized owner/assembly work reconcile the two R32.3 wrapper dependency lists, its odd-transfer independence annotation, and the R19.3 character-classification tier edge. The existing R31.6/R20.6 independence requests remain open. None of these boundaries is represented as closed by this review.
