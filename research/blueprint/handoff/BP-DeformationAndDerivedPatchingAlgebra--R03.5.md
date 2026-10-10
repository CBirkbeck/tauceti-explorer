# BP-DeformationAndDerivedPatchingAlgebra--R03.5

Issue #6324. Agent: Codex, GPT-6. Session: codex-AWrtYm. Branch: codex-AWrtYm-patching-modules. Completed planning pass, 2026-10-10; not a checkpoint. The claim bot confirmed this session’s claim before work began.

## Deliverables and coverage

The packet, reader and suggested file cover exactly `DeformationAndDerivedPatchingAlgebra:R03.5`. Packet status is **complete**; stage coverage is **planned**, with three explicit supplier gaps, rather than closed. Every implementation status is unchecked. Totals: 21 nodes (4 definitions, 2 constructions, 4 comparisons, 10 theorems, 1 application), 24 API items, 19 unit tests, 6 planets, 14 pinned baseline declarations, 3 requests and 3 gaps. One source proof-boundary finding awaits independent review.

The finite-data construction retains based presentation matrices, actual actions, quotient-ring maps, augmentation comparisons and coherent reduction maps. Its finite-class proof bounds the actual action via a uniform maximal-ideal cutoff. Extraction constructs finite sets of extendible decorated prefixes and chosen isomorphisms, keeping the unbounded original arithmetic indices outside those finite sets. Original modules need no transition maps. The patched carrier is a native matrix cokernel; completeness compares its reductions with the native categorical limit. Power-series scalar lifts are chosen, with their action compatibility and augmentation containment stated separately.

The numerical statements distinguish free and square presentations, require the proper-support bound before injecting the square relation map, and keep full component support separate. CG Proposition 2.3 gives integral freeness with both scalar-image hypotheses. Kisin Proposition 3.3.1 gives integral ring finiteness and rational projective faithfulness. Its construction uses element-power ideals, not ordinary ideal powers, and the printed exponent is s·m·p^m·(h+j). The reader supplies the variable lift S→C needed before invoking Lemma 3.3.4. The zero-variable case has a direct proof.

## Ownership and imports

The two integrated R03.5 target identifiers are retained. The accepted P7 precursor contributes its R03.3 regular-local and maximal-depth freeness nodes. The R03.1 coefficient, finite-variable series and local evaluation nodes and R03.4 finiteness nodes are imported. The integrated R03.3 depth/dimension target supplies AB and Kisin’s same-dimensional-domain lemma. No other packet or atlas data was edited.

Module-level decorated extraction and action lifting belong here and are inputs for the later P8 complex construction. This establishes the lower-stage owner without importing P8’s complex theorem into the module proof; consumers should cite these new R03.5 nodes. R03.6 keeps generalized support, near faithfulness and descent. The final elementary quotient argument for this exact CG theorem does not create a second general descent API. Arithmetic applications retain their own finite-level hypotheses.

The reviewed library audit and the current upstream roadmap/library trees were read. In particular ProfiniteArithmetic and GrothendieckEulerForms were read in full for nearby ownership and upstream density. ProfiniteArithmetic’s existing profinite limits remain with their owner; they are not re-planned as decorated module patching. No current upstream roadmap target is duplicated. The packet introduces no higher-tier prerequisite or restructuring proposal.

## Precise work remaining

1. R03.3: give native residue-field Tor₁ scalar structures, finite-dimensionality, minimal-resolution rank comparisons and cancellation. Connect the elaborated square-presentation predicate to the source’s integer-valued defect.
2. R03.3: give depth and support-dimension equality for a local S→A with a nonzero module finite over both, without assuming A finite over S. Supply the regularity, dimension and parameter calculation for O[[Fin q]], using native regular sequences and regular local rings.
3. R03.1: specify the complete-local generic-fibre formal smoothness in Kisin’s hypothesis and prove regularity of B[[Fin e]][1/p] and O[[Fin q]][1/p]. Do not substitute algebraic `Algebra.FormallySmooth` without a comparison.

After these exact interfaces are supplied, attach their concrete Lean imports and restore the canonical defect and numerical/criterion signatures presently identified in comments. Reassess closure. The mixed-characteristic cutoff calculation and the separate zero-variable argument must be checked during implementation. Independent review should also verify source finding `DeformationAndDerivedPatchingAlgebra/E15`; no self-review verdict is recorded.

## Sources and source boundary

All mathematics is paraphrased. Public PDF URLs, SHA-256 hashes, access date 2026-10-10 and exact locators are in the packet; no PDFs or source passages are committed.

- Calegari–Geraghty: notation, PDF pp. 9–10; Definitions 2.1–2.2 and Proposition 2.3 with its entire proof, PDF pp. 11–14. Section 6.1 was inspected only to delimit complex-patching ownership.
- Taylor: proof of Theorem 4.1, printed pp. 218–221, PDF pp. 36–39, including simultaneous finite comparisons and the numerical argument.
- Kisin: Proposition 3.3.1, its entire proof and Lemma 3.3.4, printed pp. 1157–1159, PDF pp. 75–77. Page images checked the exponent placement.

No required source was inaccessible. The author’s linked DVI could not be fetched by the web tool during the correction search; the complete published PDF was available and read. Finding E15 concerns only the proof: h+j=0 makes the printed element-power quotient the zero ring, so it cannot supply the stated patching datum. The theorem stays valid by the direct argument recorded here. The Annals article page, Kisin’s papers listing and targeted web searches disclosed no correction. This is a proposed finding awaiting independent review, not a confirmed erratum.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.5.json` passes with **0 errors and 0 warnings**.

`lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.5.lean` exits **0**, with only `declaration uses sorry` warnings, at the pinned shared build. Available memory was checked before each compile; no background compile or language server remains. The algebraic prototype includes native square presentations, quotient reductions, actual finite-data equivalences, complete decorated towers, coherent action lifting, augmentation specialization, the group-ring comparison and full Kisin quotient/basis signatures. It is expressly non-exhaustive: omitted canonical Tor, depth and formal-smoothness-dependent signatures are tied to the three requests. Elaborated admitted statements are not implemented theorems.

Cross-document API/test names, exact scope, unchecked statuses, source access metadata and the four permitted deliverable paths were checked. No local absolute path, source excerpt or Lean block appears in the packet or reader. Scratch sources and logs are disposable; the reader, packet and this handoff carry everything needed for independent review and follow-up.
