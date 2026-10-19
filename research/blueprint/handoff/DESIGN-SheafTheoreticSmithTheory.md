# DESIGN-SheafTheoreticSmithTheory — completed target-level pass

Issue: [#3452](https://github.com/CBirkbeck/tauceti-explorer/issues/3452). Worker: Codex (GPT-6), session `codex-hlwubh`. The bot confirmed the claim in [comment 6256903401](https://github.com/CBirkbeck/tauceti-explorer/issues/3452#issuecomment-6256903401). Branch: `codex-hlwubh-smith-theory`.

The four requested deliverables and this handoff cover the whole new roadmap. The packet has `part: null`, `status: complete`, and **65 targets: 11 definitions, 12 constructions and 42 theorems**. Its definitions/constructions have **69 API items and 69 unit tests**; theorem targets have additional discriminating Checks. There are **41 planets**, at most six per layer, **9 baseline declarations**, **25 supplier contracts**, and dispositions for **all 63 routed extraction items**, including the review additions. Every implementation status is unchecked.

## Coverage and what is actually established by this plan

| Stage | Status | Open mathematical foundation inherited by its targets |
| --- | --- | --- |
| ST.0 | planned | Supplier contracts; no separately recorded proof gap |
| ST.1 | planned | G1: uniform W(k)-adic Tate comparisons |
| ST.2 | planned | G1: integral Smith/six-operation extension |
| ST.3 | planned | G2: modular equal-characteristic étale Satake branch |
| ST.4 | planned | G1–G3: integral transport and good-prime parity perversity |
| ST.5 | planned | G1–G3 through parity, lifting and the prime-field form |
| ST.6 | planned | G1–G3 and G5: natural dual-group-equivariant comparison |
| ST.7 | planned | G1–G5, including the natural integral norm-image comparison |
| ST.8 | planned | Supplier contracts; no separately recorded proof gap |

No stage is claimed closed. “Complete” describes the finished planning pass, as in PROTOCOL section 0. It does not assert that the paper’s unresolved comparisons have been proved.

The plan corrects the source domains and bounds, retains ordinary parity reduction, and supplies a specific categorical Tate-diagonal proof target on morphisms before descending BC. It uses an external-product/Künneth replacement for the norm-stalk argument on the normalized parity inputs actually consumed. The normalized CT/lifting square explicitly requires the graded Hom composition comparison. Character equality and the natural reductive comparison are separate targets. The integral cube is retained only in the valid objectwise/ordinary-inflated form, with a separate norm-image target.

## Precise follow-up work

- **G1:** extend the finite-DVR normalized-adic supplier to O=W(overline(F_p)), including enhanced limits, uniform coefficient Tor and degree intervals, ambient Rj* bounds, Rf! projection/limit comparisons, and conservative constructible-to-ind Tate comparison. Levelwise existence is insufficient.
- **G2:** verify the scheme-theoretic equal-characteristic modular k/O Satake branch, sign and weight normalization, and the needed étale transport of JMW/LL parity and graded Tate Hom results. Include CT compatibility on morphisms and compatibility of the prime-field form. A B_dR^+ Satake citation does not discharge this contract.
- **G3:** provide the MR18 modular exotic/Soergel proof engine, or another proof of parity perversity for every odd good prime, and then its étale transport. The characteristic-zero Springer correspondence and JMW16’s stronger prime bound do not establish the promised theorem.
- **G4:** prove the integral comparison natural on the Smith image of ordinary norm-generated maps, controlling positive Hom indices or proving their reduction vanishes coherently. The P¹ example rules out the stronger comparison on all Tate maps. This is an additional obligation for the global Tate-cohomology consumer, independent of the definition of BC.
- **G5:** prove that the coherent CT/torus comparison components intertwine all dual root subgroups, hence Ĥ, and are natural in all tilting morphisms; also check their Galois compatibility for descent. Faithful torus restriction gives uniqueness of an existing lift, not existence.

Independent review should check these boundaries and the corrected statements before asking for finer decomposition. The next worker should use the packet’s graph, source dispositions, exact contracts and Checks directly. No information needed to resume is kept only in scratch files.

## Ownership and requests

The 25 requests are precise supplier contracts, not 25 newly claimed jobs. They import enhanced sheaf infrastructure from EnhancedDerivedSheaves; torsion six operations, purity, perverse inequalities and the existing finite-DVR adic carrier from EtaleDualityAndPerverseSheaves; quotient geometry from SchemeAndStackFoundations; equal-characteristic Grassmannian/Hecke/fusion geometry from GlobalShtukasAndFunctionFieldLanglands; integral dual groups, products, Galois action and Weil restriction from ReductiveGroupsPartII; and the generic highest-weight prefix of LanglandsParameterStacks LP3. Existing upstream ReductiveGroups supplies rational representations/comodules and torus weights. The modular Satake equivalence, tilting interface and the Smith-specific comparisons are targets here.

The packet proposes **EtaleDualityAndPerverseSheaves, Part II** for the W(k)-adic extension. This is an extension request, not a fictional existing stage. The modular exotic engine G3 still needs an assigned owner and a complete foundation plan. No other roadmap was edited or job claimed.

The current read-only Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` were searched. The nearby ReductiveGroups and RepresentationTheory/ModularInduction documents and suggested signatures were read. No newer upstream roadmap supplies these Smith/parity/modular-Satake targets. This roadmap is outside the Caraiani–Newton tier list; there are no upward-tier transfers to redirect. Upstream note: existing ModularInduction suggested signatures include placeholder data; this plan treats that file as a roadmap, not as implemented library coverage, and makes no edits there.

## Sources and corrections

The source register records public URLs, editions, read sections and PDF hashes. The primary source is the published Cambridge version of Feng, DOI 10.1017/fmp.2023.32: the coefficient setup, §§3–4, the algebra diagonal/character-extension/twist passage, and Appendix A. Supplementary passages read are LL21 §§4.5–4.6 and 4.9–5.6, JMW14 §2, JMW16 §1 and its good-filtration appendix, MR18 §§1.2–1.4/Corollary 1.6/§6.5, MV07’s weight functors, fusion, integral reconstruction and étale variant, Braden’s hyperbolic-localization/contraction proofs, and the named Stacks lemmas. Exact locators and the limited read ranges are in the packet; this is not a claim to have read every supplementary paper in full. No restricted book or uncleared copy was used.

The 21 paraphrased source findings retain PAPER-FENG-24 provenance where applicable. Local E35 identifies the extra CT morphism proof obligation related to the accepted E32 correction; it is not attributed to a different earlier finding. Published text, the publisher/article search and arXiv version record were checked for corrections; no separate published erratum was located. All repository prose is in our own words, without source passages or a section-by-section source summary.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SheafTheoreticSmithTheory.json`: **0 errors, 0 warnings**.
- `lean-check` on the suggested file: **success at the pins**, with **only 12 declaration-use-of-`sorry` warnings**, no other warnings or errors. Memory was checked before the compile. No language server or library build was run.
- The suggested file is **165 lines**, with four light real-bodied definitions/abbreviations, eight milestone theorems and six examples (two directly import existing Tau Ceti comparisons). Heavy geometric definitions and their full APIs/tests remain in the reader, following WORKERS.md’s current shape rule.
- `scripts/check_sorry_data.py`: **success**; no placeholder data definitions.
- Intake file checks: **5 files, 0 problems**. The graph/routing/reader audit also passed: all 63 dispositions resolve, all 65 reader statements and dependency inputs agree with the packet, all 69 API items and 69 tests agree, and all local stage edges, source locators and planet caps are consistent.
