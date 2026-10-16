# REV-GL2ModularityLifting--R32.6 handoff

Issue #9927; Codex session `codex-8dkHrJ`, 16 October 2026. The independent review is complete. The continuation is accepted as a target-level planning pass with R32.6 coverage `planned`, not `closed`. This is not a checkpoint. The planning author was a different session, `codex-uMJFd9`.

The packet still owns one theorem and references the seven existing R32.6 contracts in R32.3. No nodes, definitions, constructions, API items or planets were added. Four direct prerequisites were added: residual-representation choice independence, classical-newform absolute irreducibility, the R32.1 stage for the missing geometric-twist classification, and the existing upstream ModularForms Layer 9 for finite-order twists and primitive associates. There are now fourteen prerequisites, four requests and four gaps. Two pinned Mathlib citations remain confirmed. All arithmetic targets remain reader targets; the suggested file retains four convention examples and no surrogate carriers.

The review corrects the coefficient-embedding proof, specifies selected irreducibility over ℚ̄_p, supplies semisimplicity on both sides of recognition, and records the normalization input that the previous composition silently inferred. It also makes the primitive-associate step explicit: a finite-order twist need not itself be new at its displayed level. The existing E10 finite-order determinant qualification is confirmed without duplicating the source finding.

The detailed report is `research/blueprint/reviews/REV-GL2ModularityLifting--R32.6.md`. Resume from its corrections and supplier table, together with the packet's requests/gaps and the reader's revised six-step proof. No scratch file is needed to continue.

## Remaining owner obligations

1. R32.1 must classify the actual character in an up-to-twist modularity conclusion as ε_p^m times a finite-order global character, retain finite coefficient models/embeddings, and exclude a weight-one witness using regularity. Its current weight-of-modular-twist node assumes those premises. Use lower-tier de Rham character and class-field inputs; do not import the higher-tier R24.5 character-system constructor.
2. Import the already planned current TauCetiRoadmap ModularForms Layer 9 Dirichlet-twist/primitive-associate API. This review reads that target as existing upstream work and does not replan or review it. Its good-eigenvalue and squared-nebentypus formulas, the R19 realization/irreducibility contracts and R01.5 recognition give Galois twisting compatibility.
3. The two system wrappers in the R32.3 owner packet still cite higher-tier R24.5. Their mathematical specializations are valid with explicit geometric data, but their dependency lists must be expressed through the lower-tier polynomial-data theorem. Keep generic compatible-system adapters in R24. No definition ownership move or foreign-packet edit was made by this review.
4. Remove the stronger full-Serre independence assurance from the inherited odd-transfer annotation until its transitive certificate exists. Its audit node and this continuation correctly leave that certificate open. R31.6 supplies the dependencies of its own globalisation/support results to the R32.6 audit; it is not a second audit owner.
5. The exact lower-tier R19.3 classical-newform-irreducibility statement supplies the missing recognition input, but its own proof plan cites R24.5/character-system. Its authorized owner must reconcile that transitive tier edge through lower-tier character classification. Importing the statement here is not a tier-closure certificate for its proof graph.
6. The R31.6/R20.6 requests retain all precisely named independence leaves: published KW II 6.1/3.5; Snowden's potential-modularity/descent inputs; EG14 A.2/A.7 and BLGGT potential automorphy/change of weight; support irreducibility/reducedness/density inputs; the restricted Emerton weight-part proof and collation of Gee 4.4.12 with the inspected edition's 4.6.9. No independent Serre proof is certified.

`RT-AREA-langlands-2/21` remains resolved at the ownership level: modern ramified reducible transfer belongs to R32.6; the existing R24.6 linked-systems node imports its transfer nodes. No reverse R24 dependency was added to the new theorem.

## Evidence and checks

All fourteen public source files were read at the passages listed in the report; all fourteen hashes match the packet. Skinner–Wiles printed p.6 was read visually. No source excerpts or downloaded documents enter the repository. Mathlib determinant statements were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; no new Tau Ceti baseline citation was introduced. Current roadmap/library ownership was checked without building those checkouts.

The blueprint checker passes with zero errors and warnings. The suggested file elaborates with `lean-check`, exit 0 and exactly four expected `sorry` warnings. Intake checks on all five deliverables and whitespace/scope checks pass. The mathematical transfer signatures themselves were not elaborated because their combined supplier carriers are absent at the pins.
