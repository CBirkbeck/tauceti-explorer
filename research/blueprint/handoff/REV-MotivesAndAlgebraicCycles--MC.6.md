# REV-MotivesAndAlgebraicCycles--MC.6 handoff

Completed independent review for #10803 by Codex session `codex-duY0Es`; original author session `codex-SAaPvC`, PR #11057. Branch `codex-duY0Es-review-mc6`. One job only. The claim bot confirmed this session. Verdict **accepted**, coverage **planned**, implementation **unchecked**. MC.7 is outside this part.

## What is ready

The part packet, reader and compact suggested file agree after correction. The review report records all changes, source checks and pinned baseline declarations. `review.checked` covers all 40 effective targets: 16 verified, 23 corrected and one added. Effective totals are 116 API items and 82 planned tests across 18 definition/construction targets; six planets replace the legacy six. The original roadmap packet and atlas data were not edited.

The major correction is E49: HMS v5 Remark 2.7, p.10, fails over Dedekind coefficients. The Z-arrow-2 example has period module Z⊕Z/2 but comparison dual Z; the free even tensor example gives Z[x,y]/(2(y−x))→Z[t]. The corrected target maps P to P/P_tors. Both examples and the finite-bidual justification are in the packet and reader. Three proved modulo-two tests in the suggested file detect the obstruction. The rational theorem remains valid. E49 is scoped to the inspected preprint; the source-version and known-correction search is recorded. E48’s Tate sign is confirmed in the annotated 2025 book.

Other corrections: explicit preservation hypotheses throughout the sufficient relative route; A-action-balanced coefficients and a noncircular dual-coefficient antipode; nonempty point-heap and canonical group-law qualifications; cofinal X⊕1 in faithful flatness; Artin ambient fullness via the requested ℓ-adic realization; Tate symmetry via the faithful symmetric Betti fibre; exact source locators and implementation boundaries. Added `MC.6/tannaka-functoriality` for DM 2.21(a)–(b) and attached its consumers.

## Assembly instructions

1. Keep the 28 retained targets once in the main packet and add the 12 part nodes once. Apply the 19 `retainedTargetRefinements`: ordinary named fields replace the old field, `apiReplacements`/`testReplacements` replace statements by name, and `addPrerequisites` appends without duplicates. Do not interpret refinement records as new nodes.
2. Apply the six `planetSelection` records as replacements for legacy selections, not additions. The effective checker simulation verified exactly six planets.
3. Merge required baseline declarations and supplier contracts. The reader is the complete effective catalogue with the corrections applied. Its compact Lean file intentionally does not implement legacy diagram or localization carriers.
4. Import existing MC.5 `completion-universal-factorisation`, `completion-tensor-assembly` and `completion-rigidity-proof` where appropriate. The current rigidity completion is Q-only; requested geometric-base extensions and Artin/Hodge realizations remain additional input. Do not import `completion-two-fibres` into this chain: it uses MC.6/fibre-functor-extension.
5. Reuse current upstream ModularCurves §0D finite-étale/Galois sets and §0E effective affine descent. ReductiveGroups retains known-group dictionaries, finite-type embeddings and reductivity. SF.1 is the auxiliary arbitrary-heap quotient supplier, not SF.3. SF.2 retains the main packet’s arbitrary-pair cohomology request, coordinated with C5’s separate comparison contract.

## What remains outside this completed review

- **Reflection-only FS VI.10.2:** operational targets use the explicitly stronger sufficient datum with preservation. Derive preservation from the intended original assumptions or supply a different proof before claiming the weaker relative theorem. This is not asserted to be a counterexample to FS.
- **Auxiliary affine-heap quotient:** SGA 3 VII.1.4’s primary proof was not read. It remains a precise gap and SF.1 request. The main period torsor does not use that quotient construction.
- **Early abstract supplier installation:** confirmed `RT-AREA-geomlanglands/17` requires the proposed early abstract/late period split. The maintainer must install it. In the meantime, Satake imports individual abstract nodes, whose proof chains have no MC.5 prerequisites. No campaign/stage/link changes were made here.
- Implement the precise geometric-base, restriction/corestriction/finite-descent, ℓ-adic and Hodge supplier contracts in MC.5, and arbitrary-pair cohomology/comparison contracts at their owners. Existing upstream import contracts do not ask for duplicate plans.

## Audit and validation

Sources and their public URLs, exact read ranges and PDF hashes are in the packet; the report lists the principal locators and all 34 distinct audited baseline declarations. Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. All five relevant Tau Ceti source modules in the shared build byte-match official raw files at the pin. No source text or restricted-library file was copied into the repository.

Current read-only revisions inspected: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read ReductiveGroups README/Suggested, SemisimpleAlgebras README, relevant ModularCurves targets and current library statements. No lake commands were run there.

Validation passed: part checker (zero errors/warnings); simulated 40-node assembly checker (zero errors/warnings), acyclic internal dependency graph, definition/construction API and test counts; source-issue/checked-version validation; intake file checks and diff whitespace checks. Suggested Lean elaborated successfully with only the expected theorem-admission warning: 91 lines, two real-bodied light definitions, six proved examples and one admitted theorem. No background compiler remains.

No suspicious instruction attempt was encountered in the untrusted source/other-author data read during this job. No other job was claimed or edited. Nothing needs to be recovered from scratch; public source URLs/hashes, locators and all implementation notes needed by the next worker are durable here or in the packet/report.
