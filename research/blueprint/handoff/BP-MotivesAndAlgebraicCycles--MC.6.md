# BP-MotivesAndAlgebraicCycles--MC.6

Completed by Codex, session `codex-SAaPvC`, for #10832. The bot confirmed the claim on 19 October 2026. The current issue's delivery header scopes MC.6 alone; its older embedded MC.6–MC.7 brief does not extend this job to the separately dispatched MC.7 (#10833).

## Delivered

The MC.6 part packet is `complete`, with its single stage `planned`, no stage closed, and every implementation status `unchecked`. The reader specifies all 39 targets: 28 retained stable IDs and eleven additional nodes (four definitions, seven theorems). The combined catalogue has nine definitions, nine constructions, nineteen theorems and two lemmas, with 133 API entries and 99 definition/construction tests. The new nodes contribute eighteen API entries and sixteen tests. Fourteen pinned declarations are recorded in the part packet; retained targets continue to use their original baseline records.

The existing packet remains untouched. `retainedTargets` references its nodes without duplicating IDs; `retainedTargetRefinements` specifies the changes to apply to those IDs during assembly. These fix the source/target action conventions in the comparison-algebra and tensor-isomorphism APIs, attach explicit neutral/relative input data, and remove the motivic prerequisites from the general fibre-torsor theorem. The reader already incorporates these refinements. Ordinary functional composition makes the target group act on the left and the source group on the right. The six `planetSelection` entries replace the original MC.6 selections at assembly; the two new planet-bearing nodes must not be added to the original six without that replacement.

The new targets provide explicit neutral and relative data, a precisely strengthened Beck theorem, fibre-group inner twisting, the Artin diagram and its representation equivalence/ambient embedding/group, and the pure Tate subcategory/equivalence/group. The Tate category is closed under sums and subquotients, while extension closure defines the different mixed Tate category. The Artin group is a proconstant group scheme, whose points over disconnected algebras require the scheme functor. The period application fixes the actual full comparison algebra, canonical coefficient inclusion and localization, both group coactions and the complex evaluation point.

## Source and ownership checks

Sources were read in freely accessible author/published versions and paraphrased, with locators and hashes in the packet. No source passage, PDF or extracted source text is committed.

- Deligne–Milne, corrected author version of 15 August 2012: Proposition 1.13; Theorem 2.11 and proof; 2.20–2.23; Example 2.30; Theorem 3.2 and Remark 3.3. The absolute-Hodge Artin example in section 6 is not treated as a Nori equivalence.
- Huber–Müller-Stach, arXiv:1105.0865v5: sections 2–3, Appendix A and the diagram-category appendix.
- Huber–Müller-Stach, author annotated book of 1 July 2025: universal property and its proof (7.1.13, 7.1.15, section 7.4), corrected product diagram (9.3), Artin calculation and corrected descent/subquotient argument (9.4–9.5), Tate conventions and calculation (10.2–10.3). The original author v6 was compared, but the corrected edition supplies the final book locators. Its good-pair diagram adds inverse excision edges; this repair is forwarded to MC.5. Full semisimplicity alone does not imply ambient subquotient closure: use geometric triviality after base change and corrected Corollary 9.5.5. Restriction followed by corestriction is handled with its corrected conjugate-motive formula.
- Fargues–Scholze, arXiv:2102.13459v4, VI.10.2–VI.10.3 and the opening of VI.11: relative reconstruction and its consumer.
- Zhu, published Annals paper, section 2.5, pp.454–455; Gleason–Lim–Xu, accepted arXiv:2208.07195v3, section 5.1 paragraphs 13–14, pp.31–32: the abstract and twisting consumer contracts. Their separate Satake/p-adic identifications are not supplied here.

New source finding E48 records a Tate-twist sign discrepancy in HMS Lemma 10.3.2 against Definition 10.2.4, in paraphrase. With this reader's convention, weight 2r uses the object 1(−r). No correction to that sign was found in the author errata page or annotation. This finding needs independent review; it does not change the pure Tate equivalence.

The reviewed library-coverage data has no MC.6 entry. Sources at the pinned commits were checked, including finite comodules, the known-Hopf group functor, Beck, Ind categories and rational Maschke. The current Tau Ceti source was also checked read-only at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Current TauCetiRoadmap main was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`: ReductiveGroups and nearby SemisimpleAlgebras documents, and a search across current roadmap readers/suggested files. Its known-group Hopf/comodule dictionary, diagonalizable groups and reductivity criteria are imports. No arbitrary neutral reconstruction or Nori Artin/Tate comparison was found there. No upstream tree was edited or built.

Confirmed RT-AREA-geomlanglands/17 is handled by one abstract reconstruction owner in MC.6, independent of MC.5. GS consumes the explicit relative or neutral nodes and DM finiteness/connectedness criteria; ReductiveGroups retains reductivity. The existing early-abstract-stage split proposal is preserved for installation. Accepted RS-08 leaves MC.6 in place. No other duplicate reconstruction owner is introduced.

## Remaining obligations and supplier requests

There are three explicit gaps and five supplier requests. They prevent closure, rather than completion of the target-level planning pass.

1. FS VI.10.2 prints existence and reflection of split coequalizers. Pinned Beck separately asks for preservation. The sufficient theorem here names that extra hypothesis. Derive it under the intended original hypotheses or provide another proof before closing the printed relative theorem; no counterexample to FS is claimed.
2. The auxiliary affine-heap quotient construction still needs the primary SGA 3 VII.1.4 proof, not read in this run. The main period torsor already has its acting groups and does not depend on that recovery construction.
3. The maintainer must install the existing early abstract stage split before stage-level Satake imports. Node-level abstract imports have no MC.5 dependency. No campaign or graph edits were authorized here.

The five requests specify: MC.5's general corrected diagram/tensor/universal-property interface; MC.5's Artin change-of-field and finite-descent interface; MC.5's restricted Hodge realization on Tate powers; ComplexComparisonPartII:C5's arbitrary-pair comparison with connecting, excision, product and localization compatibility; and SchemeAndStackFoundations:SF.3's effective affine fpqc descent. A smooth-proper comparison or an abstract Hodge category alone does not satisfy the geometric requests. The complete book proof source resolves the earlier missing-source issue for the universal property, but the requested supplier interface must still be implemented/planned by its owner.

Independent review should check the retained-node refinements as well as the eleven new nodes, the corrected edition's pagination, the two example computations, and the honest distinction between the strengthened relative theorem and the printed claim. Assembly must apply the refinements once and install the six replacement planets. The plan makes no formal implementation or numerical period-injectivity claim.

## Validation

The blueprint checker reports zero errors and zero warnings. The suggested Lean file elaborates at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` using `lean-check`. It has one admitted theorem-proof warning and no other warnings or errors. Its light real-bodied coefficient functional and all three examples are proved; the milestone asks for an antipode for the supplied bialgebra without assuming a Hopf instance. Heavy absent carriers remain mathematical targets in the reader. No data definition is admitted. No Lean process is left running.
