# DESIGN-TriangulineVarietyAndItsLocalModel

Issue #3412; worker Codex; session `codex-tBO8y2`. This is a complete target-level design for independent review, not a checkpoint or an implementation. No second job was claimed.

## Delivered

The roadmap, packet and reader specify thirteen layers and 100 targets: 20 definitions, 11 constructions, 56 theorems, 6 lemmas, 5 comparisons and 2 applications. They contain 118 API items, 96 mathematical unit tests, 63 planets and 7 pinned baseline declarations. Every definition and construction has uses, an API and at least three discriminating tests. All 138 routed items are accounted for: BHS19 67, Ding25 59, NT21 10 and DLB17 2. The route inventory is an ownership index; it does not reproduce source text.

Coverage is **planned** for A, L, T, C, M, V, G, Y, H, D, P, I and N; none is closed. Every target has its exact statement, conventions, proof plan, direct prerequisites, source locator and acceptance criteria in the reader. All implementation statuses remain unchecked. The general local multiplicity assertion is explicitly conjectural.

The 109-line suggested file contains only two real-bodied lightweight adapters over existing carriers: the signed common-preimage linear relation and the arithmetic inequalities for numerical noncriticality. It also states seven representative API/milestone theorems and nine examples. It does not invent period, Robba, rigid-space or analytic-representation carriers. Their specifications stay in the reader, following the current WORKERS shape rule.

## Validation

- `lean-check research/blueprint/suggested/TriangulineVarietyAndItsLocalModel.lean`: exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; precisely sixteen warnings, all proof placeholders. This checks elaboration of signatures and definitions, not mathematical proofs.
- `scripts/check_blueprint.py` with an index generated from the existing pinned source trees: zero errors and zero warnings. The index had 70,802 Tau Ceti and 246,008 Mathlib declarations. The seven cited statements were also read directly in their files.
- `scripts/check_sorry_data.py`: passed.
- A separate consistency audit checked all 100 reader statements, all definition/construction API names and tests, the 138 routes, the acyclic own-node graph, thirteen coverage records, planet limits, absence of source excerpts/private paths, and the displayed dimension identities for ranks 2–7 and degrees 1–4.
- `research/blueprint/intake.py check-files` on exactly the five authorized deliverables: five files, zero problems.

## Source reading and fidelity

All sources used were public primary PDFs. Their exact URLs, editions, read date (19 October 2026) and SHA-256 hashes are in `sources` and `sourceVersions`. The reader references give the same source identities. No private-library book was needed, and no book or source passage is included in a deliverable.

- **BHS19**, IHÉS 130 (2019), 299–412: §§3.1–4.3, printed pp. 330–385, including the local arguments and proofs; introductory examples pp. 300–305. The imported §2 statements were checked against their Springer owner.
- **Ding25**, IHÉS 142 (2025), 1–74: §§2.1–2.4, printed pp. 9–32, including proofs, and introduction pp. 1–9.
- **NT21**, IHÉS 134 (2021), 1–116: §2.3.1, pp. 28–33, Proposition 2.15 and Remark 2.16, pp. 36–38, including proofs.
- **Colmez08**, Astérisque 319 (2008): Lemma 3.2 and Definition 3.4, p. 231; Definition 4.1 and Proposition 4.3, pp. 237–238, including proofs.
- **DLB17**, arXiv:1509.00606v2: Lemma 6.3 and proof, arXiv p. 31, and its use in Theorem 8.3. These are preprint page locators, not invented published pagination.
- **BHS17**, author final copy: §2.2 and Theorem 2.6 with proof, author pp. 7–12, for the smooth regular triangulation moduli.
- **BHSsmooth17**, author final copy: Lemma 2.4 and proof, pp. 10–12; Lemma 2.10 and proof, pp. 15–16; local accumulation argument in Proposition 2.12, pp. 16–17.
- **Ding19**, arXiv:1602.08859v2: Appendix A, pp. 44–47, including Propositions A.3, A.5 and Corollary A.4 with proofs, for partial B-pair cohomology.

Sixteen source issues are recorded in our own words with locations, corrections, reasons and version searches. E1–E15 consolidate independently checked findings from the routed papers and supplier work. No author-issued correction was identified in the searches recorded there. E16 is a new finding requiring independent scrutiny: the first inference in BHS19 Proposition 4.3.6, p. 382, deduces individual vanishing from a zero sum in a signed cycle group. The plan requires an all-constituent unitriangular vanishing argument in G2 instead. It does not assert that the uniqueness theorem is false, or silently require effectivity in the general conjecture.

## Ownership audit and remaining supplier work

Read-only upstream audit: roadmap main `350e970ce49f707a327909beac0b7b7c782cc7ee`, beyond worktree `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant current LocalGaloisGroups, AdicSpacesPartII, RigidAnalyticGeometry and p-adic functional-analysis documents were read. Suggested declarations of the nine post-snapshot and four Completed directions named in WORKERS were searched alongside the current library. Existing linear algebra, completions, local Galois/rigid foundations, Springer geometry, Robba theory and period theory are imported rather than replanned. Search-based absence claims are scoped in `upstreamAudit`.

Two explicit gaps prevent packaging:

1. **G1:** assign and accept exact PadicHodgeTheory Part II nodes for the full Artinian almost de Rham and B-pair interfaces R1–R2. Existing field/coefficient-category nodes do not assert that generality.
2. **G2:** reserve the locally analytic representation supplier for genuine principal series, Orlik–Strauch constituents, Jordan–Hölder multiplicities, strong linkage, constituent isomorphisms and all-constituent unitriangular vanishing. No exact existing stage was found; no fictitious supplier ID or representation carrier has been substituted.

Nine requests are recorded in the packet, without opening separate issues or editing another owner:

| Request | Existing supplier | Exact extension |
| --- | --- | --- |
| R1 | PadicHodgeTheory:P7 | Artinian almost de Rham Fontaine equivalence, nilpotent operator, tensor compatibility and free stable lattices |
| R2 | PadicHodgeTheory:P7 | Artinian B-pair/Robba and étale Galois equivalences and freeness criterion |
| R3 | PadicHodgeTheory:P7 | Partial B-pair dimension and exactness formulas with modified H² hypotheses |
| R4 | PadicHodgeTheory:P7 | Integral decreasing-weight semistability and regular-character crystalline criterion |
| R5 | PhiGammaModulesAndIwasawaCohomology:PG.7 | Rigidified regular triangulation moduli and smooth character map |
| R6 | PhiGammaModulesAndIwasawaCohomology:PG.7 | Finite Frobenius eigenspaces, coefficient extensions and saturation in rank two |
| R7 | PadicMeasuresIwasawaAlgebras:L0a | General-K rigid character geometry and local algebraic-weight accumulation; coordinate ownership stays with current PFA |
| R8 | AdicSpacesPartII:R1 | Additional excellence/descent, openness, completed-ring injectivity and coherent Herr base change |
| R9 | PadicDifferentialEquationsAndRigidCohomology:RD.1 | Finite-dimensional kernels of P(∇), which existing ∂-cohomology does not supply |

The restructuring records propose extensions in the existing directions, a reserved locally analytic owner, and coordination of R7. No global eigenvariety, patching, completed-cohomology or automorphy theorem is used as an upward prerequisite. There is no relocation of an already-owned definition to this roadmap.

## Review priorities and continuation

Review all 100 targets and the 138-item routing before refining the plan. Resolve G1/G2 and discharge R1–R9 before claiming closure or packaging. Precise layer-by-layer remaining work is in `coverage`; the next job should use those durable records, not the deleted scratch files.

Pay particular attention to the following mathematical distinctions:

- The local comparison retains both frames: period framing adds dn²; forgetting the Galois frame adds n² on the incidence side, giving total relative dimension n²+dn(n+1)/2 there.
- Full-character fibres fix n further unramified coordinates, giving codimension dn(n+1)/2+n. They do not fix dn further coordinates.
- Algebraic weights accumulate locally at algebraic centres. They are not asserted analytically dense in every open of the whole weight space.
- P/modifying-first-order supplies the omitted first-order construction: retain the σ-filtration, replace each other filtration by a single jump at the ambient minimum, and reconstruct through the Artinian lattice/gluing equivalences. The nilpotent Sen operator is preserved. For d>1 the full self-Ext map is generally not onto; its specified partial/de Rham restrictions are onto.
- D_σ is already owned by PHT. This roadmap only adapts its endpoint diagrams, using the ambient minimum for both endpoints.
- Modified and original zero-parameter kernels differ; higher-intertwining uses a signed common preimage, with opposite scalar twists. Its full recovery over Q_p and single-embedding recovery over general K are distinct conclusions.
- NT regularity is ordered and weaker than BHS genericity; NT weights have the opposite sign. The closure tangent is an inclusion and the fixed-weight kernel is only contained in the de Rham tangent.
- The final polynomial-connection injectivity target remains conditional on R9. The general cycle multiplicity assertion remains conjectural, including after supplier closure.

No background compilation or language server is left running. The scratch source PDFs, notes, generated index and check logs are disposable once submission checks pass; the source hashes, locators, open contracts and validation results needed by a reviewer are preserved here and in the packet.
