# BP-HodgeStructuresPartII--H.4 handoff

Worker: Codex, session `codex-XTNtJa`. Issue: [#6942](https://github.com/CBirkbeck/tauceti-explorer/issues/6942). Branch: `codex-XTNtJa-hodge-h4`. The bot confirmed this session's claim before work began. This is the completed H.4 planning pass, with explicit remaining gaps, rather than a checkpoint or an implementation claim. Only this job was claimed.

## Result and scope

The four deliverables are the H.4 packet, reader document, suggested Lean file and this note. The packet has `part: H.4`, scope exactly `HodgeStructuresPartII:H.4`, and status `complete`. Coverage is **planned**, not closed. There are **29 nodes**: five definitions, six constructions, eight theorems, two comparisons and eight lemmas; **41 API items**, **44 construction tests**, **six planets** and **ten pinned baseline declarations**. All implementation statuses remain `unchecked`.

The target decomposition covers weighted flags; parabolic bundles and induced saturated subbundles/locally free quotients; degree, slope and semistability; the coparabolic zero lattice and normalized parabolic dual; the trace pairing and section map; ordinary quotient slope, parabolic Clifford and trace rank bounds; the corrected fixed-part vector construction; the unitary sub-local-system rank theorem; and tensor-invariant and Artinian deformation vanishing. Nine API facts consumed in proofs have their own dependency nodes, with the API entries pointing to them. The packet records full mathematical hypotheses and proof routes, while the reader explains the normalization and counterexamples needed to distinguish plausible wrong definitions.

The accepted parent design is unchanged. Its H.0 nodes and the existing H.1 packet do not supply the punctured-curve parabolic bounds or the unitary canonical-extension comparison needed here. Ordinary line-bundle curve theory is imported rather than replanned. Generic vector-bundle HN and Clifford theory are proposed for Algebraic curves Part II; Fargues–Fontaine HN theory does not provide those statements. The native Grassmannian is reused only with its quotient-rank convention, without claiming an analytic tangent theorem.

## What remains and where to resume

Four explicit gaps prevent closure:

1. **G1:** Design the ordinary complex-curve vector-bundle HN and Clifford extension proposed in `restructure`. It must include HN existence, saturated maximal-slope subbundles, semistable Hom vanishing, the global-generation lower-slope bound, BPGN97 Theorem 2.1 and the HN section inequality with slopes in `[0,2g]`. The primary Clifford induction has been read; the absent item is its supplier decomposition and interfaces.
2. **G2:** The routed `MappingClassGroupsAndCanonicalRepresentations` design must supply corrected LL24 Lemma 2.4.2 with **g≥1**, its finite-determinant extension inputs and the unitary isotypic decomposition after dominant étale base change. This checkout has no supplier stage or node ids for that design. Substitute exact ids when they exist; do not invent them or infer total unitarity from fibre unitarity.
3. **G3:** Reconcile a common marked-curve stack and punctured versal-family carrier with the mapping-class-group supplier and H.3. Dominant étale classifying maps, hyperbolicity, smoothness, Kodaira–Spencer comparison and faithful pullback of invariants must be stated on that carrier.
4. **G4:** Complete the global curve/sheaf/Hodge/Artinian signatures and geometry-level tests using supplier carriers. The current file checks the native, local and numerical portions explicitly inventoried in `prototypeMap` and its final comment. Its partial signatures are not formalizations of the packet's global theorems.

The six requests specify exact needed outputs: ordinary curve bundles/degree/cohomology and vector Riemann–Roch from SF.3; unitary canonical-extension semistability from H.2; the real VMHS and corrected fixed-part interface from H.2; Artinian coefficient cohomology/projection formula/pullback from H.2; the trace derivative and versal cotangent comparison from H.3; and Grassmannian universal bundles/tangent geometry from R09.1. Two exact SF.2 duality nodes are already cited, with the smooth proper curve specialization stated. Replace the provisional stage inputs by declaration-node edges only after matching the recorded hypotheses and normalizations. Supplier proof closure is reviewed with its owner.

The main distinctions to retain are maximum induced weights; coparabolic slope of the antecedent, rather than degree of its zero lattice; the negative ordinary dual-lattice shift at positive weights; semistability rather than stability; global section rank rather than generic sheaf rank; a Hodge-homogeneous evaluated inclusion rather than the original inclusion; cohomology after realifying coefficients rather than minimal realification of cohomology; and total-space unitarity versus a constant unitary deformation on one fibre. Artinian vanishing requires the latter and **rank strictly below g**. Residual fibre unitarity alone is insufficient.

## Sources and corrections retained

The packet and reader preserve source URLs, versions, access date **2026-10-07**, fingerprints and precise read sections. The source artifacts need not be retained in scratch:

- LL24, [arXiv 2205.15352v4](https://arxiv.org/pdf/2205.15352v4), SHA-256 `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`: Theorem 1.7.1, notation, the §2.4 decomposition proof, §§4.1–4.2 VMHS/fixed parts, and entire §§5.1–5.2 and §§6.1–6.2 proofs.
- LL22, [arXiv 2202.00039v3](https://arxiv.org/pdf/2202.00039v3), SHA-256 `4f291599d8259d8084677c9f4325cc4329e7460d246ff0b311aa739da45763ab`: entire §§2.1–2.4 definitions, Definition 3.3.1 and entire §§6.2–6.3 Clifford/HN/parabolic-rank proofs.
- BPGN97, [arXiv alg-geom/9511003v1](https://arxiv.org/pdf/alg-geom/9511003v1), SHA-256 `49a54383e147457176491d81c822ea334504c8d16964e38fb7c5cdf155d03bf8`: curve/characteristic conventions and Theorem 2.1 with its complete induction.
- [Daniel Litt's author-posted errata](https://www.daniellitt.com/published-paper-reviews.html), HTML SHA-256 `c382f55815ca3e6f01a3b1abf60d8d06161f8734876e9aaf887c5dc4143a6032`: P04 author corrections to printed pp.844–845 and the full replacement proof for p.860; P05 author erratum checked for §6.3.6 corrections. Automated reports reproduced on that page are not mathematical authority.

Six source issues are recorded. Four concern LL24: the stable/semistable wording, membership in the original L inclusion, the false realification identity, and the missing g≥1 hypothesis. The last two concern LL22 v3's intermediate omission of the section deficit δ and its incorrect HN-index range. Those two findings are scoped to the public preprint. The published Annals landing page was available, but the full version of record was not served; the published JAMS proof was not collated. No claim compares these complete public proofs with their complete printed versions.

The complete upstream HodgeStructures and AlgebraicCurves reader documents supplied the intended density, notation and curve boundary. General canonical extension/VMHS/fixed-part proofs, the analytic Grassmannian derivative and finite-determinant extension machinery terminate in the recorded supplier requests or G2, rather than being silently reconstructed in H.4.

## Validation and Lean limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.4.json`: **0 errors, 0 warnings**, 29 nodes, no internal dependency cycle.
- `lean-check research/blueprint/suggested/HodgeStructuresPartII--H.4.lean`: **exit 0, 104 warnings, all declaration uses of `sorry`, no errors**. Only individual Mathlib modules are imported. The shared build's Mathlib commit matches `082e2d37e8b0463410cdb532e111cd43d5a66174`; its newer Tau Ceti checkout is not imported. Tau Ceti source claims were audited separately at `f790474821cf4256814db967cb154e7af3d0c369`.
- Free memory exceeded 20 GB before compilation. One prescribed Lean wrapper was used at a time; no language server, new project, library build, update or cache download was started.
- Static parity confirms every packet declaration/API name and all 44 labelled examples occur in the suggested file. Source-version validation, source receipts, exact scope, node-kind counts, planet count and unchecked implementation statuses were checked.
- The compiled file uses native submodule flags, explicit fibre maps, numerical weighted degree/slope and supplied subbundle catalogues; actual formal-disc power-series kernels; actual evaluation and section linear maps; and native representations with a finite invariant-vanishing filtration. Global sheaves, determinant-degree comparisons, all saturated subbundles, cohomology, VMHS and the Artinian geometric filtration remain G4. Successful elaboration checks these signatures with unfinished proofs; it establishes no global implementation.

The submission changes only the four authorized paths. File intake checks and whitespace checks accompany the pull request. Scratch source files, scripts and logs are removed after submission; the retained packet, reader and this note contain the evidence needed for independent review and supplier follow-up.
