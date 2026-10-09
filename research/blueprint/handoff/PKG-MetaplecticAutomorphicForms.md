# PKG-MetaplecticAutomorphicForms — checkpoint handoff

Status: partial; blocked on the required shared Lean build. Issue [#7492](https://github.com/CBirkbeck/tauceti-explorer/issues/7492), worked by Codex, session `codex-lluRDk`, on 9 October 2026. The bot confirmed this session's claim. This submission preserves a package draft and does not certify elaboration, implementation or source-proof closure.

## Delivered draft

The [README](../packages/MetaplecticAutomorphicForms/README.md) is 199,838 UTF-8 bytes, below the 200 KB maximum. It supplies motivation, neighbouring ownership boundaries, notation, nine layers, construction APIs, theorem hypotheses, exact source locators, prerequisites and an edition-specific bibliography. Targets are grouped by mathematical construction rather than by the layout of a paper. It contains no source excerpts or programme-process narrative.

There are 261 targets, numbered within their current parent layer: 18, 7, 10, 44, 8, 16, 22, 51 and 85 in MP.0–MP.8 respectively. Every accepted target occurs once. The numbering follows each packet's node-array order after filtering on `parentStageId`; this gives an unambiguous mapping back to the inputs without a disposable scratch file. All 293 API descriptions appear, with shortened namespace notation defined in the introduction. All hypothesis entries are retained, with identical premises shared as H1, H2, etc. within a layer. External roadmap abbreviations expand by the prerequisite table to exact IDs, and 641 internal prerequisite links resolve to target headings. Baseline declarations are grouped by layer; they are generic substrate, not claims that oscillator or theta constructions already exist.

The [Suggested.lean](../packages/MetaplecticAutomorphicForms/Suggested.lean) has one standard header, one block of 40 distinct individual imports, and one shared unused-variable linter setting. Its declaration bodies are joined from the **current corrected part files**:

- `research/blueprint/suggested/MetaplecticAutomorphicForms--MP.0.lean`;
- `research/blueprint/suggested/MetaplecticAutomorphicForms--MP.8.lean`.

The assembled suggested file named in the issue predates subsequent accepted corrections, including replacement of weak stand-ins and several normalization fixes. Using its stale bodies would lose those corrections. No input file was edited. Removing nested comments, imports and the repeated linter setting, then normalizing whitespace, gives exactly the concatenation of the current part bodies, without namespace or declaration-name changes. There are 490 definition/theorem/structure declarations and 261 `example` signatures by textual count; these counts do not certify elaboration or correspondence with full source theorems.

`metadata.toml` is deliberately absent. Its final content should be `topic = "math.NT"` followed by a newline. Intake detects package completion by the existence of all three package files, without inspecting this handoff or the compiler result. Withholding metadata preserves this submission as a checkpoint so a blocked draft is not sent forward as a complete package.

## Inputs and mathematical boundaries

The source of truth is the accepted `MetaplecticAutomorphicForms--MP.0.json` and `MetaplecticAutomorphicForms--MP.8.json` in `research/blueprint/packets/`, currently carrying the independent acceptance associated with `REV-FIX-RT-AREA-automorphic-1~5`. The older assembled reader, suggested file and [assembly handoff](ASM-MetaplecticAutomorphicForms.md) remain unchanged. The assembly handoff's historical review statuses are not the current packet statuses.

This pass read WORKERS, both protocols, UPSTREAM_GUIDE, BROWSER_AGENTS, the MP library-audit rows, and the upstream InductionRestriction and CompactGroups READMEs. Pinned source statements were inspected through the existing library checkouts, including native factor-set extensions, bilinear isometries, quadratic forms, coinvariants, Schwartz-to-Lp, Haar invariance, Fubini, matrix groups and positivity. This does not expand the accepted plan's source-reading receipts. No restricted book was needed or copied, and no repository copy, library build or dependency update was made.

The prose preserves these distinctions in particular:

- coefficient-first bilinear extension coordinates; the section-trivial character hypothesis; the quadratic cochain convention and the native isometry action;
- scalar-circle cover versus the genuine double cover, and continuity rather than a product topology for a discontinuous Bruhat section;
- dyadic residue characteristic versus characteristic two; nonarchimedean QFI6C versus real/global quadratic-form inputs;
- finite Weil representation ownership in MP.4 and general Jacobi ownership in MP.6, with MP.8 specializing BFH rather than redefining the general theory;
- the joint archimedean Schwartz space, smooth genuine automorphic spaces versus their K-finite parts, integrability of the actual theta pairing and source-qualified regularization;
- GQT first/second-term ranges, quotient-valued residual correction, exceptional split O(1,1) measures, and the extra hypotheses needed to replace local functionals by local theta nonvanishing;
- half-weight parameter r/2 versus weight-zero r, unnormalized Petersson area, the prime-2 Hecke input, conjugated spectral coefficients and the negative-factor cycle orientation;
- BFH conductor M versus auxiliary level N, both cusp scales, the corrected gamma factors, global compact divisor, iterated Novodvorsky integrals, distinct rank-zero and degenerate terms, and raw M versus scalar-normalized R in the Weyl equation;
- the BSD.2 consumer boundary: this package does not assert the final quadratic-twist infinitude or simultaneous local-condition theorem.

Original-source and supplier obligations remain in the mathematics, rather than being replaced with arbitrary carriers or unconditional conclusions. The current MP.0 inventory explicitly has 112 omitted primary targets, 56 omitted API items and 33 omitted tests; 64 primary targets, 130 APIs and 147 tests have native signatures. The joined file retains that complete omission inventory and its required constructions. All 107 MP.8 API names have active signatures by textual inspection, but its cover/induction and analytic comparisons also retain their supplier boundaries. A successful import check alone cannot discharge any of these mathematical obligations. In particular retain the original Howe/Mínguez/MVW inputs, local Langlands and archimedean category inputs, toric factorization, actual Jacobi carriers, genuine induction/continuation, and the compact transition required for the global BFH estimate.

## Validation and blocker

- Both unchanged input packets pass `python3 scripts/check_blueprint.py <packet>` with **zero errors and zero warnings**: 176 and 85 nodes, respectively.
- Target count, API coverage, shared-premise references, internal heading links, manuscript size, process-word exclusions and local-path exclusions were checked structurally. These checks support correspondence with the accepted inputs; they are not an independent mathematical review.
- The joined Lean code-preservation comparison passes. Named examples and omitted tests remain in the inherited inventories; a comment naming a test is not an elaborated example.
- The required whole-file command was attempted: `lean-check research/blueprint/packages/MetaplecticAutomorphicForms/Suggested.lean`. It **did not elaborate**, stopping at the first import before checking declarations:

```text
error: object file for module
TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension does not exist
```

The missing object is `TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.olean`. The required pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The configured shared build has the correct Mathlib commit but Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`, and lacks that object. Read-only inspection of the other existing builds found none complete at both pins. The alternative with the object has different Mathlib and Tau Ceti commits, and the required source modules differ from the pinned versions. It cannot validate this package at the required baseline.

Available memory exceeded 20 GB; memory was not the blocker. No import was removed, source declaration inlined or fake substitute used to bypass it. No Lean language server, build, cache download or dependency update was started. Nothing remains compiling. Earlier workers' Mathlib-only slice checks are historical evidence, not this run's full-file certification.

## Resume here

1. Use an already available complete shared build at both exact pins and run the whole-file command above. Do not build dependencies or weaken native imports. Record the actual compiler result and fix any package-level errors within this issue's permitted files.
2. Audit the compressed prose against the two accepted packets, especially the rewritten MP.3, MP.6, MP.7 and MP.8 statements. Numbering maps to input node order as explained above. The source locators, hypotheses and API contracts remain alongside each target; the README has little size headroom, so replace redundant prose when adding detail.
3. Preserve every source/supplier omission honestly under PROTOCOL section 13. If package completeness requires a carrier or theorem beyond the accepted plan, record the exact owner correction here; this job cannot change the packets. Do not replace an actual oscillator, Jacobi space or meromorphic family by independently chosen functions with an assumed conclusion.
4. Once the package obligations and full pinned elaboration are satisfied, add the metadata line and update this note with the actual final checks. If the same build condition remains, submit only a precise blocked continuation rather than declaring completion.

All continuation material is in the repository and this handoff; the disposable scratch directory contains nothing the next worker needs.
