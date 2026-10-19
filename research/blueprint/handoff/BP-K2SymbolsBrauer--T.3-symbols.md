# BP-K2SymbolsBrauer--T.3-symbols

Issue: #10814. Author: Codex, session `codex-Cqls1Y`.

This is a complete target-level planning pass for `K2SymbolsBrauer:T.3:symbols`, ready for independent review. Coverage is **planned**, with the inherited classical-K₂ comparison boundary recorded as a gap. It is not a checkpoint and makes no formalization claim.

## Delivered

- The packet imports the four canonical T.3 residue targets without copying or renaming their nodes. It adds two nodes: the explicit subgroup-valued unit part and the characterization of the normalized tame symbol.
- The unit-part definition has eleven API items and five discriminating tests. The reader gives the full contracts, API and Checks for the inherited pairing and homomorphism, both bilinear laws, all four Steinberg cases, parameter independence, DVR/place comparisons and the inherited restriction-map interfaces.
- The sign convention is pinned by ∂{u,t}=ū. Weibel III.6.3, printed p.51 in the separate Chapter III PDF, uses the inverse convention. Numerical tests distinguish them and reject the unsigned expression on a complementary pair of negative order.
- The suggested Lean file uses actual pinned unit/residue carriers, real-bodied light definitions and proof placeholders. Heavy K-theory carriers and the full homomorphism API stay in the reader. Existing place residues and unit-group equivalences are consumed directly.
- Both existing planets retain their original owners: Tame symbol; The tame symbol is a Steinberg symbol. No extra planet or ownership move is proposed.

## Sources and library checks

Read Weibel's author-hosted Chapter III, Theorem III.6.1 and following sign calculation (p.48), Definition III.6.2 (p.49), Lemma III.6.3 and complete proof (p.51), and Definition III.7.1 (pp.61–62). The packet records URL, access date and SHA-256. The uniqueness theorem is explicitly a derived characterization, not an invented numbered source result. No source passages or source files are committed.

Read the reviewed AUDIT-29 stage entry and the actual pinned valuation order, unit-group, residue-map, rational p-adic and place-residue declarations. The uniformizer existence statements require `Nontrivial (valueGroup (.ofClass v))`; `Valuation.nontrivial_valueGroup_of_surjective` supplies precisely that instance. Checked the current read-only roadmap and Tau Ceti trees, including newer roadmaps absent from the atlas snapshot, and read GrothendieckEulerForms and GlobalNumberFields as upstream models. No conflicting tame-symbol/Milnor implementation was found. Public Mathlib PR searches found no relevant implementation. The public Zulip endpoint returned its landing page rather than authenticated discussion, so no private discussion is represented as checked evidence.

## Boundary for the next reviewer

The elementary pairing, canonical unit parts, parameter independence, four Steinberg cases and normalization characterization have explicit source-supported proofs. Milnor descent imports the exact T.2 tensor-realization and homogeneous-components nodes. Classical transport uses the original Matsumoto target, retaining the accepted T.2-symbols packet's G-stable-witness (ultimately T.1 G-colimit) and its exact ordinary root-presentation/Bruhat-coordinate request to ReductiveGroups Layer 7. This pass does not re-plan or close those owners' foundations.

The finite-field Matsumoto gap is outside this stage: an order-one parameter has distinct integer powers, so the valued field is infinite. The arithmetic Bass–Tate gap is also irrelevant. Higher residues, localization connecting-map comparisons, transfers, finite support, reciprocity and tame kernels stay with their existing owners.

The review should check the inherited target imports alongside the new nodes, especially the inverse convention, the actual subgroup carrier of unitPart, the negative-order case and the scope of the classical comparison boundary. Resume from the reader's coverage section and the packet's closure ledger; no scratch artifact is needed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3-symbols.json`: zero errors and zero warnings, with the pinned declaration index.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauer--T.3-symbols.lean`: passed.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.3-symbols.lean`: passed at Mathlib `082e2d37e8` / Tau Ceti `f790474`; 33 proof-placeholder warnings, no other warnings or errors. File length is 253 lines.
- Intake `check-files`: all four deliverables pass; JSON and file scope checked.
- Reader/packet/suggested-file comparison: all eleven unit-part API names and all five test names agree; every new node remains implementationStatus unchecked.
- An independent exact rational-arithmetic calculation at p=2,3,5,7,11 checked 625 complementary-entry cases, 158,760 bilinear identities, 79,380 parameter-independence identities and 630 unit-part calculations, as well as every listed numerical value. These are mathematical spot checks, not Lean proofs; the disposable calculation is not a deliverable.
- `git diff --check`: passed.
