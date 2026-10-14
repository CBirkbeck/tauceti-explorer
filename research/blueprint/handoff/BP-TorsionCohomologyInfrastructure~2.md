# BP-TorsionCohomologyInfrastructure~2 — completed revision

Worker: Codex, session codex-JxYost; issue #9776. The bot confirmed the claim in [comment 6174102281](https://github.com/CBirkbeck/tauceti-explorer/issues/9776#issuecomment-6174102281). Branch: codex-JxYost-torsion-cohomology-revision. Only this job was claimed. This is a completed revision for independent review, not a checkpoint.

The reader now agrees with all 38 corrected packet targets, their hypotheses, maps, proof distinctions, acceptance checks, sources, APIs and tests. Stable node IDs and all previously accepted mathematical corrections are retained. The historical top-level `review`, `reviewAudit` and individual source-finding review objects are unchanged. This worker does not accept or review its own revision: the existing `needs_changes` verdict remains for the next independent reviewer to replace.

Inventory: 38 nodes (2 definitions, 7 constructions, 24 theorems, 1 comparison, 4 applications); 37 API entries and 27 tests for the nine definitions/constructions; 23 planets, at most six per stage; 11 pinned baseline declarations; 53 source routes; 17 supplier requests/adapters; 18 source findings. E1 is rejected; E2–E18 are retained, with E17 corrected as described below. All five stages TC.0–TC.4 remain planned, zero closed, all implementation statuses unchecked. Packet status is complete and `gaps` is empty: explicit supplier requests remain implementation obligations, not proofs.

## Changes against the twelve reconciliation requirements

| Requirement | Result |
| --- | --- |
| 1. Build order | The early TC.2 ordinary boundary-ideal colimit now precedes TC.1 in the reader. Independent early TC.3 algebra remains free of TC.2/AG2 prerequisites. |
| 2. Section model | Identity-localization replaces the false diagnostic; the fixed-glue universal property is included. E1 is explicitly rejected. E17 is corrected against the published page, rather than repeating the review's mistaken location. |
| 3. Boundary geometry | Maximal bounded ideal characterization, exact Q4 imports, and the reduced-kernel sequence extension are synchronized. Trace, ideal-colimit and vanishing locators include the correct result type and proof pages. |
| 4. Period/reduction transport | The nonempty isotropic Fl₁₃ witness replaces the emptiness claim. Cell counts and their equation are explained; frame change, refinement composition and the lost-digit test are synchronized. |
| 5. APIs and algebra checks | Initial-topology criterion, factor swap, rank-one unit character, formal-unit naturality/uniqueness, normalized reciprocal and cup retraction are included. The Z/9 nonunit example remains in both reader and suggested statements. |
| 6. Cyclotomic continuation | Cyclotomic Z_ℓ-extension, temporary S_ℓ ramification, retained residual image, and the exact finite-Artinian residual-kernel request replace the older claims. Chenevier Lemma 3.8 is cited. |
| 7. Laurent realization | Algebraic characteristic-coefficient subring descent replaces compact Laurent gluing. Finite coefficient extension, sum errors, contraction and descent to the original image are explicit. The real weight-zero factor (1−X) remains until extraction. |
| 8. Boundary complexes | Actual nilmanifold cochains and derived Künneth/Tor remain required. E18's neat-level counterexample is recorded and limited to the identified CLH author version. |
| 9. Finite assembly | The exact sequence uses B_i=im(H^i→H^i_∂); A_B is its faithful action image. Boundary determinant base change and the square-zero two-step kernel are explicit. |
| 10. Integral transport | UCT action extension and compact closed-image surjectivity precede product gluing. J=B∩∏I_m uses independently chosen finite errors with a common exponent and the current IHG arbitrary-family theorem. No transition maps between I_m are assumed. |
| 11. Local specialization | The local representation takes values in GL_n(Â/Î), with Î^N=0. Integral localization requires support there; torsion-only systems use their own simultaneous action ring. No lift through Î is claimed. |
| 12. Sources and requests | All 17 exact contracts and node-specific source matches are synchronized; all 53 routes and 18 finding verdicts are present. Corollary 5.4.2/Remark 5.4.5 replace the fictitious Corollary 5.4.5 proof. Version metadata is retained and the old short quotation in the reader's route 122 is replaced by an original locator. |

## Correction to the review's E17 edit

Published Scholze p.954 was checked in extracted text and visually. Lemma 2.1.1 has three numbered hypotheses. The proof's choice of the bounded function defining an intersection unit locus cites only (i); it also needs (ii), the unit-locus hypothesis. Choose a frame index i in J and take the product of the added ratios indexed by J′\J. The later reduced-section gluing correctly cites (iii), the overlap congruence.

The review had relocated that real reference slip to reduced-section gluing and assigned it incorrect condition numbers. The corrected packet E17 agrees with the earlier PAPER-SCHOLZE-15/E13 extraction. Its statement-level effect is unchanged: the lemma remains valid. A `revisionCorrection` records this author correction alongside the unchanged historical verdict; `revisionAudit` distinguishes this revision from an independent review. The next reviewer should verify this correction on p.954 explicitly. No other historical verdict was changed.

## Sources, baseline and ownership

Sources reread for the revision were Scholze's published Annals paper, particularly the model/ideal proofs, trace and chart inputs, §§4–5 comparison and determinant arguments; Caraiani–Le Hung's author copy §3, pp.6–9; and Chenevier arXiv:0809.0415v2, Corollary 1.14, p.14, and Lemma 3.8, §3.1, p.43. The exact URLs, versions, 2026-10-14 read dates and SHA256s are in `sourceVersions`; downloaded files matched those hashes. No source passage, PDF or extracted text is submitted. E18 remains scoped to the author copy: the earlier review could not obtain the journal PDF, and this revision makes no claim of journal collation. No further source was missing for this reconciliation.

All eleven baseline declaration bodies/statements were reopened at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. These supply native polynomial laws, coefficients/composition/reversal, matrix characteristic polynomials, the group-level maximal pro-p universal property and scheme-module connecting maps. None supplies the missing arithmetic comparison through its name alone. The reviewed coverage audit still has no TC stage entry; adjacent audits are only overlap leads.

Current read-only roadmap commit 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected, including the nine newer and four Completed roadmaps. The current IHG and AdicSpaces introductions and relevant target blocks were read for ownership/density. IHG already owns arbitrary-family uniform nilpotence and compact coefficient gluing; the atlas adapter imports that stronger current statement rather than duplicating it. No upstream files were edited or Lake operation run there. No new ownership moves or restructuring were introduced.

The five assigned red-team corrections remain intact: TC owns the geometric comparison while CC supplies its carrier; AG2.3/AG2.7 supply regular constituents beyond the restricted AG2.2 input; the unconditional CM branch retains imaginary-quadratic/rational-S restrictions and ET.7a unitary similitudes; early extraction has no AG2/TC.2 circularity; and the proper singular constructible primitive comparison uses early P8 with reduction/trace naturality, without inferring a logarithmic theorem.

## Validation and next step

- Blueprint validator: zero errors, zero warnings; 38 nodes, five planned stages. No declaration index was supplied, so baseline verification rests on the pinned source inspection described above.
- Reader consistency check: every target's statement, hypotheses, proof steps, prerequisites, acceptance, API, tests, uses and source match agrees with the packet; all request contracts appear. Historical review objects, node IDs and coverage are unchanged.
- Graph check: all 58 internal prerequisite edges respect `constructionOrder`; recursive traversal through 3,026 concrete packet nodes is acyclic. Unexpanded stage/library references remain explicit planning boundaries. The six early algebra nodes have no reachable TC.2/AG2 prerequisite.
- Computations: direct enumeration gives nonadmissible/admissible chart counts 24/27 at p=3 and 120/125 at p=5. The Z/9 diagnostic has equal ordinary products, both opposite twists 1+6X and nonunit difference 6. The level-3 Heisenberg lattice commutator is central 9Z, giving abelianization Z²⊕Z/3 and two H¹(F₅) classes rather than three.
- `lean-check research/blueprint/suggested/TorsionCohomologyInfrastructure.lean`: exit 0 at the pinned shared build, after checking available memory. The retained 122-line file emits only 13 proof-placeholder warnings. Its single light definition is real-bodied; elaboration checks types, not the suggested proofs.
- Suggested-data check: passes, with no placeholder data body. Submission-file and whitespace checks pass for this job's three changed deliverables; the authorized suggested file is retained unchanged.

The next step is independent review of this reconciliation, especially E17, not implementing the supplier roadmaps before acceptance. Implementation must then discharge the 17 exact requests/adapters in the packet and reader, prove the transport maps on their suppliers' actual objects and verify the four-route action squares. The general determinant, formal/perfectoid, completed-cohomology and boundary owners remain authoritative. No second issue is taken.
