# Handoff: BP-WeightsInEtaleCohomology

Codex — session `codex-8vDn9u`, 2026-10-06. Refs #1004.
Claim confirmed by the bot at [issue comment 6012565939](https://github.com/CBirkbeck/tauceti-explorer/issues/1004#issuecomment-6012565939).
This run takes exactly one job. It completes the target-level planning pass under PROTOCOL §0; it is not a checkpoint caused by a time limit.

## Deliverables and coverage

The [packet](../packets/WeightsInEtaleCohomology.json), [reader](../readmes/WeightsInEtaleCohomology.md) and [suggested signatures](../suggested/WeightsInEtaleCohomology.lean) agree. The nine checkpoint node IDs are retained and corrected, and 18 target nodes complete the six-stage pass. Accepted RS-17 supplies the Part II title and first prerequisite, DeligneWeightsAndPurity. No other roadmap, atlas data or application file is edited.

- 27 nodes: two definitions and 25 theorems; every implementationStatus is unchecked.
- Nine API items and nine named definition tests, including the rank-zero counterexample to weight uniqueness.
- 22 planets, respectively 4, 3, 4, 3, 4, 4 in R34.1 through R34.6.
- Nine pinned baseline declarations, eight public source PDFs, five explicit gaps and 23 supplier requests.
- Packet status complete. R34.1, R34.2, R34.3, R34.4, R34.5 and R34.6 all have coverage planned, with precise remaining lists. No stage is closed.

R34.1 and R34.2 give the early numerical/abelian/curve exports to LV.1 and Faltings R28.4 using DWP.0/.1. The R34.1 sheaf and complex suffixes are distinct branches; they impose no Weil II prerequisite on those early consumers. R34.3 now names actual proper traits, modular/Shimura bad-fibre models, Picard–Lefschetz inputs and Saito's model. R34.4 verifies finite-extension pencil descent, radical quotient, parity/characteristic restrictions and original-Q_l open monodromy. R34.5 verifies parabolic degree, classical/Hilbert projector comparisons, weight-two Jacobians and absolute arithmetic hard Lefschetz. R34.6 exports actual eigenform weights, common good-prime polynomials and the normalized Hilbert local eigensummand comparison.

## Corrections and ownership

Integer polynomials pass to coefficient-field subquotients only when the factor polynomial is rational. The example X²−2=(X−√2)(X+√2) exposes the missing hypothesis. An extension with unramified endpoints is not automatically unramified, so the exact-sequence purity converse retains unramifiedness of the middle. Positive-dimensional geometric Tate modules have nonintegral constant coefficient q^(−g); rank zero has polynomial 1. Weight uniqueness needs a nonzero rank and a place outside the exceptional set with q>1. The restriction Frobenius-power equality is modulo inertia before evaluating an unramified representation.

SourceIssue WeightsInEtaleCohomology/E1 independently checks Saito v2 p. 12 on the page image and imports the existing PadicHodgeTheory/E50 correction: geometric FNF⁻¹=q^(−1)N and Nφ=pφN. Saito's own p. 13 graded weights force this sign. The journal text and a journal corrigendum were not established; this finding is scoped to the preprint actually read.

RT-AREA-langlands-2/10 is addressed through explicit ownership and consumer contracts. R24.5:operations owns generic compatible systems and operations. R34.6 proves the fixed-source common polynomial and transports the actual local eigensummand; R19.3 consumes these exports. The packet's rescope proposal states those edges and the restricted fixed-source R19.3 scope. Its existing fine R19.3 node already names R34.6; no reverse import from R19.3 is introduced.

Two potential cycles are prevented: R34.5 imports only R19.1/parabolic-realisation-premotive, whose geometry precedes purity; R34.6 uses the rank-two construction after R34.5. R34.3 imports CP.4's geometric comparison and supplies model verification to R06.5, rather than importing that application back. Saito's local theorem itself is imported at PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p; R34.6 checks the actual degree q₀=(2g−1)(w−2), auxiliary twist (g−1)(w−2), projector and coefficient conventions, rather than re-planning its proof. The degree/twist calculation gives q₀+1−2(g−1)(w−2)=w−1.

The audit calls the old R34.3/.4 import-only prose process. The rescope proposal removes that prose as mathematical targets and retains only the actual comparison work explicitly kept by accepted RS-17. DWP owns the generic weight theory; LPV/EDC the cycles, pencils and geometric pairing/blowup operations; A4/SF.2 the actual cohomological comparisons; GH.0/R14.3/R18.2 the geometric projectors and models. Existing GH.0 CM-product degree 2r+1 nodes do not supply the classical degree r+1 or Hilbert q₀ projector. DWP.4 is requested for RH only: generic integer/ell-independent whole-cohomology factor descent remains WC.3's.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/WeightsInEtaleCohomology.json`: zero errors, zero warnings, all six stages planned.
- `lean-check research/blueprint/suggested/WeightsInEtaleCohomology.lean`: exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with 30 proposed-proof warnings and no other warnings. The direct finite F_5 point count and integer second-extension arithmetic elaborate with proofs. No build, update, cache retrieval or language server was started.
- All nine API items and nine named examples checked against the packet/reader. All 27 node statements appear verbatim in the reader. Every short source excerpt matched the freshly downloaded edition's normalized page text; mathematical OCR glyphs were compared with the surrounding statements, and the Saito sign with the image.
- SourceIssue and sourceVersions fields validated using the repository's source_issues and check_errata helpers. The packet is a blueprint, not an errata-v1 deliverable.
- Reachable fine-node dependency check visited 414 nodes across the packet and its suppliers without a cycle. Own stage references were expanded to their nodes; other-roadmap requested stages were terminals. This checks the imported fine paths and the two stated cycle boundaries, not closure of unresolved stage contracts.
- `git diff --check` is clean; only the four issue-authorized deliverables change. No private paths, source PDFs or extracted text are committed.

The baseline also records Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All nine cited Mathlib declaration statements were read at its exact pin. The reviewed audit was read for every R34 stage; advanced arithmetic étale weights, nearby cycles and projector interfaces were not assumed present because a name matched. Upstream AdicSpaces and HodgeStructures reader documents were read as the document model.

## Sources read and missing

The packet and reader record URLs, versions, page mappings, read sections and SHA256 values for:

- Deligne, Weil I (1974): (1.5.1), (1.13)–(1.15), (3.2), (4.2)–(4.3), (5.6)–(5.10), (6.1)–(6.3), with the cited finite-field conventions, parity, radical and open-image statements.
- Deligne, Weil II (1980): §1.2, §3.3, (3.7.1), §4.1 and (6.2.1)–(6.2.5), including the parabolic image, restored twists and lisse-complex shift convention.
- Deligne, Bourbaki 355: (3.19)–(3.20), §5 (5.1)–(5.6). Its 1969 conditional purity is replaced by Weil II (3.7.1), not described as unconditional in the original source.
- Milne, Abelian Varieties v2.00 (2008): I §12, I §17, II §1 and III §11, covering the duality, good reduction, all-power counts and curve/Jacobian comparison. The fresh PDF hash matches the inherited checkpoint's hash.
- Lawrence–Venkatesh, arXiv:1807.02721v3: §2.1–§2.5 and §3.1–§3.2, with the purity/integer-polynomial/semisimplicity hypotheses separated and the Frobenius convention made explicit here.
- Diamond–Flach–Guo, arXiv:2512.02348v2 (2025 revision): §4.5 and §5.1–§5.5. The integral premotive excludes λ|Nk!; it does not by itself justify the stated all-λ characteristic-zero export.
- Carayol (1986): pp. 409–410 conventions, §4.1–§4.7 coefficient extension and actual normalization/specialization, and §5.6. General level models are not asserted nodal.
- Saito, arXiv:math/0612077v2: Theorems 0–2 and Claim 1 pp. 10–13; §6.3 Lemma 3 and Claim 3 pp. 29–31; §7 Lemma 4 pp. 32–34; §8 Claims 4–5 and spectral sequence pp. 35–38; §9 Proposition 1′ and its l-adic proof pp. 38–39. The crystalline proof pp. 40–43 is not claimed read.

The public IAS SGA7 II scan returned HTTP 403. No proof read from that scan is claimed. Proofs cited through supplier nodes retain the suppliers' recorded source gaps.

## Follow-up work

Independent review should first check every RS-17 target against the 27 node contracts, the process rescope and RT-AREA-langlands-2/10 boundaries. Resolve the following five gaps at their affected nodes:

1. Integral-to-adic specialization: prove transition compatibility, derived inverse-limit comparison and finiteness/Mittag–Leffler hypotheses, using an accessible SGA7 source and LPV.1/SF.2.
2. Mixed-characteristic Picard–Lefschetz: verify SGA7 XV 3.3.5–3.3.6 and XIII/XIV cup-product/trace compatibility; the inspected LPV fine node does not close that interior.
3. Actual classical/Hilbert compactification/projector comparison: GH.0/R14.3/R18.2 must supply the genuine correspondence, denominators, good-prime models and equivariant étale comparisons. R19.1 must additionally supply the characteristic-zero all-λ eigensummand identification, including λ|k!, rather than extending the DFG integral premotive by assertion.
4. The imported Saito theorem's crystalline coefficient vanishing: read §9 pp. 40–43 and verify the p-divisible-group monodromy/isocrystal argument. This remains the R06.6 supplier's proof interior; R34.6 supplies its degree/twist/projector adapter.
5. Full signatures: obtain genuine continuous Galois/local-place, Tate-module, scheme-adic, nearby-cycle, parabolic/projector and mixed-complex carriers from the suppliers and replace the explicitly enumerated omissions. The compiling numerical prototypes are not those full signatures.

All 23 precise requests, with consuming node IDs, are in the packet and reader: R01.1/.2/.6, A4, SF.2, DWP.4/.5/.7/.8/.9/.10, EDC.2/.3/.4, LPV.1 and LPV.7:semistable-curves, R13.6, R14.3, R18.2, GH.0, CP.4, R19.1 and R24.5:operations. Do not close a stage merely because its target is stated or a supplier has a matching title. The R34.2/Faltings export must retain its independent early path when those requests are refined.
