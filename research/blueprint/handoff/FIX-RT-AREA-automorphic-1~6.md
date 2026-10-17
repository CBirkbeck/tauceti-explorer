# Handoff: FIX-RT-AREA-automorphic-1~6

**Completed bounded fix; ready for independent review.** Codex session `codex-mKm33c`, 17 October 2026. Issue #7841; branch `codex-mKm33c-automorphic-fixes`; input `fbc7c026e5cc729e233ca6261d76b7f63bacbbc5`. The claim was confirmed by the bot in [comment 6241205113](https://github.com/CBirkbeck/tauceti-explorer/issues/7841#issuecomment-6241205113). Only this job was claimed.

The complete [round-6 fixes report](../redteam/RT-AREA-automorphic-1.fixes-6.md) accounts individually for findings /1–/31, identifies inherited corrections and outside-file owners, and gives source locators. This is not a checkpoint. No completion of the broader QSeries revision or of the roadmaps' proof development is claimed.

## What changed

Only the AS and AL packet/reader/Suggested triples and this job's report/handoff change. The other eleven allowed triples already retain the assigned fixes. The prior round's independent review explicitly found the bounded corrections sound and held four packets only for broader revisions. AF, AS and GZ have since been independently accepted; QM's broader negative review remains. No review, review history, baseline, implementation status, node identifier, API name, Check or planet is changed or removed.

- AS's adelic nuclear LF target now imports AF.0's actual test-function carrier and support/level topology. Each stage includes finite finite-adelic J-coset support, in addition to archimedean compact support and finite level. AS retains nuclearity, strictness, bounded sets and distributions, and must identify its enhancement with that same topology.
- AS's local normalization, intertwiners, spectral and cohomological applications now import exact AF Harish-Chandra, globalization, normalized real induction, tempered/discrete-series, Langlands, Vogan and all-degree cochain targets. The obsolete request for an entire second common real foundation is removed.
- The two real Paley–Wiener targets retain an explicit extension request for holomorphic compact-picture families and supplied-Hilbert comparisons; the already-planned AF carrier, half-modulus, action and induction-in-stages are imported. The proposed early AS real prefix still precedes ET.1; no new integrated stage is asserted.
- The archimedean GL_n generic unitary-dual theorem is imported from AF.1/Vogan. The real classical-group standard-module application and nonarchimedean unitary/irreducibility extensions are requested separately from AF and SR.3; their packet carriers remain an endoscopic Part II input. Jiang–Zhang's original-proof gap is retained.
- AL's Godement–Jacquet integral explicitly imports the common AF Casselman–Wallach globalization and continuous contragredient. AL's requests distinguish planned algebraic Flath/globalization/classification contracts from the stronger completed tensor/continuous-functional, unitary/residual and solvable-descent extensions.
- Both readers carry the full changed contracts and requests. Both Suggested files change comments only; all non-comment tokens are identical to the input.

## Evidence and validation

All thirteen issue-listed packet validators pass with zero errors and zero warnings, covering 2,208 nodes. This includes the eleven unchanged packets; no acceptance inference is drawn from structural validation. The changed files can be checked directly with:

```sh
python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json research/blueprint/packets/AutomorphicLFunctionsAndLocalFactors.json
lean-check research/blueprint/suggested/AutomorphicSpectralTheory.lean
lean-check research/blueprint/suggested/AutomorphicLFunctionsAndLocalFactors.lean
```

Fresh sequential Lean results: AS exit 0 with 796 warnings, AL exit 0 with 183 warnings, all admitted-proof warnings and no others. Memory exceeded 20 GiB available before each run. Both companions import only Mathlib, and the shared Mathlib build is at `082e2d37e8b0463410cdb532e111cd43d5a66174`. No build, update, cache command or Lean language server was used; no compile is left running. The other eleven companions were unchanged and were not freshly elaborated. These are blueprint companions; no package-shape or implementation certification is made.

Every changed node's complete statement, hypotheses, proof sketch, prerequisites, acceptance clauses, API/Check statements and source locators were compared to its reader. All eleven pass after ignoring only Markdown markup and whitespace. All changed requests include matching suppliers and consumer lists. Nested-comment-aware comparison verifies unchanged Lean non-comment tokens. The thirteen packets have no literal excerpt/quote/quotation fields. `git diff --check`, the intake file check and an explicit issue-output-path comparison pass.

The Mathlib/Tau Ceti baseline records are unchanged: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed coverage audit and affected AF supplier contracts were read. Current read-only roadmap/library heads were `0d144d044dacebca17b654695b6f1ad58f159b27` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the nine post-snapshot roadmaps were screened, with relevant index and CompactGroups material read. No new library-missing target or baseline citation was introduced.

Fresh source reading for the changed requests: Bernstein–Krötz arXiv:0812.1684v3 §9.3, pp.39–40, Proposition 9.6; Jiang–Zhang arXiv:1508.03205v4 Appendix B, pp.85–87, Proposition B.1, Theorem B.2 proof and (B.5)–(B.6). The Jiang–Zhang public PDF matches the packet SHA-256 `d97bf3048aa10de52f07ae5bbbc3970c974996ae4193d9cd7f12b17890df7bb4`. The journal version and all cited original representation-theoretic proofs are not newly certified. No protected library file or passage was copied. Repository prose is in the worker's words with locators; disposable logs and the public-source working copy are not needed to resume.

## Dependency-check limits to preserve

A comparative exact-node traversal starts from the thirteen packet node sets, reads all blueprint packet records first (sorted paths, first record per id), and fills absent nodes from integrated decompositions. It traverses node prerequisites only; whole stages and baseline/upstream references are leaves, and requests are not supplied theorem edges. Input and final graph both have 2,208 roots, 5,199 reachable nodes, zero cycles, 36 unresolved references and eight conflicting duplicate records. No new cycle, unresolved reference or duplicate is introduced. This is not a combined stage/request closure certificate.

The six unresolved GeometricSatakeAndFusion edges target EDC.5 `perverse-recollement`, `perverse-t-structure`, `affine-perverse-artin-vanishing`, and EDC.7 `proper-direct-image-decomposition`. The other thirty are Hilbert/ShimuraVarieties edges to ShimuraData D2–D5 interfaces: datum, special-pair/image, cocharacter/reflex, component/central-kernel, neat-level, domain-component and Borel-embedding contracts. Eight conflicting GZ milestone records, GZ.0 through GZ.7, overlap the whole-roadmap and GZ.0-part packets. All are present in the input; none of those outside-file records is repaired or silently suppressed here. The fixes report records these limits so the older round-5 clean global graph result is not reused for a changed repository state.

## What remains, and where to resume

The next step is the independent `REV-FIX-RT-AREA-automorphic-1~6` review of the eight changed deliverables and the /1–/31 disposition ledger. Start with the preceding fix review and AF revision 5's ownership annotations, then check the exact AF imports and residual requests. Do not erase the independently authored verdicts as part of this fix.

The broader QM revision still belongs to its own job/review. Its top-level review remains `independent-review-REV-FIX-RT-AREA-topology~4`, `needs_changes`, dated 11 October 2026. Native-form, fifth-order, source-proof and topology obligations are not missing fixes to this round's Jacobi owner boundary.

Outside-file obligations remain with CC.0 (analytic groups/Iwasawa and Banach duality), CC.8 (tower comparison transport and completed localization), TC (geometric almost comparison), R31 (GL₂/tower applications), p-adic local Langlands (specialization), general-field p-adic L-functions, ET.0/Part II (orbital/packet inputs), and AutomorphicCongruences--L0 (unitary Jacobi consumer). Maintainer integration still handles frozen neatness/Schwartz ownership and early real/Jacobi prefixes, including AF's existing notes about the open AS upstream proposal. These routes are specified in the report; this run edits none of those owners and claims no second job.
