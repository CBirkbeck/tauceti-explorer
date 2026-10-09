# PKG-MetaplecticAutomorphicForms — checkpoint handoff

Status: partial; blocked on the required shared Lean build. Issue [#7492](https://github.com/CBirkbeck/tauceti-explorer/issues/7492), continued by Codex, session `codex-t7Wmkp`, on 9 October 2026. The [bot confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7492#issuecomment-6073965170). This continues the draft from [checkpoint PR #7771](https://github.com/CBirkbeck/tauceti-explorer/pull/7771), session `codex-lluRDk`. It does not certify elaboration, implementation or source-proof closure.

## Changes in this continuation

README target MP.8.81 now selects the independent arithmetic route for opposite-cusp coefficient regularity: compute the ramified factors before using the result in Eisenstein continuation, and obtain polynomial growth from the actual Whittaker estimates after cover comparison. The preceding prose also offered a deduction from Eisenstein regularity, although MP.8.80 already depends on MP.8.81. The accepted node's proof steps, acceptance condition and ramified-regularity gap explicitly select the arithmetic route to prevent this cycle. The correction retains the BFH §7, p.589 locator and H4/H5 hypotheses; it supplies no missing proof. No packet correction is required.

The whole-file Lean check and independent structural checks were rerun. Both direct Tau Ceti imports lack objects in the configured shared build; no existing build inspected has both required commits. The exact build blocker and remaining work are recorded below. Suggested.lean is unchanged, and metadata remains absent.

## Delivered draft

The [README](../packages/MetaplecticAutomorphicForms/README.md) is 199,865 UTF-8 bytes, below the 200 KB maximum, with only 135 bytes of headroom. It supplies motivation, neighbouring ownership boundaries, notation, nine layers, construction APIs, theorem hypotheses, exact source locators, prerequisites and an edition-specific bibliography. Targets are grouped by mathematical construction rather than by the layout of a paper. It contains no source excerpts or programme-process narrative.

There are 261 targets, numbered within their current parent layer: 18, 7, 10, 44, 8, 16, 22, 51 and 85 in MP.0–MP.8 respectively. Every accepted target heading occurs once. The numbering follows each packet's node-array order after filtering on `parentStageId`; this gives an unambiguous mapping back to the inputs without a disposable scratch file. The preceding checkpoint records all 293 API descriptions and all hypothesis entries as present, with shortened namespace notation defined in the introduction and identical premises shared as H1, H2, etc. within a layer. This continuation confirms that shared-setting references resolve within their layers and all 641 internal prerequisite links resolve to target headings; it does not independently certify every compressed mathematical statement. External roadmap abbreviations expand by the prerequisite table to exact IDs. Baseline declarations are grouped by layer; they are generic substrate, not claims that oscillator or theta constructions already exist.

The [Suggested.lean](../packages/MetaplecticAutomorphicForms/Suggested.lean) has one standard header, one block of 40 distinct individual imports, and one shared unused-variable linter setting. Its declaration bodies are joined from the **current corrected part files**:

- `research/blueprint/suggested/MetaplecticAutomorphicForms--MP.0.lean`;
- `research/blueprint/suggested/MetaplecticAutomorphicForms--MP.8.lean`.

The assembled suggested file named in the issue predates subsequent accepted corrections, including replacement of weak stand-ins and several normalization fixes. Using its stale bodies would lose those corrections. No input file was edited. Removing nested comments, imports and the repeated linter setting, then normalizing whitespace, gives exactly the concatenation of the current part bodies, without namespace or declaration-name changes. There are 490 definition/theorem/structure declarations and 261 `example` signatures by textual count; these counts do not certify elaboration or correspondence with full source theorems.

`metadata.toml` is deliberately absent. Its final content should be `topic = "math.NT"` followed by a newline. Intake detects package completion by the existence of all three package files, without inspecting this handoff or the compiler result. Withholding metadata preserves this submission as a checkpoint so a blocked draft is not sent forward as a complete package.

## Inputs and mathematical boundaries

The source of truth is the accepted `MetaplecticAutomorphicForms--MP.0.json` and `MetaplecticAutomorphicForms--MP.8.json` in `research/blueprint/packets/`, currently carrying the independent acceptance associated with `REV-FIX-RT-AREA-automorphic-1~5`. The older assembled reader, suggested file and [assembly handoff](ASM-MetaplecticAutomorphicForms.md) remain unchanged. The assembly handoff's historical review statuses are not the current packet statuses.

This continuation read WORKERS, both protocols, UPSTREAM_GUIDE, BROWSER_AGENTS, the MP library-audit rows, and the upstream InductionRestriction and CompactGroups READMEs in full. It inspected the pinned native extension and bilinear-isometry source modules through an existing checkout. The preceding checkpoint additionally records inspection of quadratic forms, coinvariants, Schwartz-to-Lp, Haar invariance, Fubini, matrix groups and positivity. Those earlier receipts are historical, and neither pass expands the accepted plan's source-reading receipts. No restricted book was needed or copied, and no repository copy, library build or dependency update was made.

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
- This continuation checked unique target counts and ordering, shared-setting references, all 641 internal target links, manuscript size, programme-process words and private-path exclusions structurally. API coverage remains the preceding checkpoint's receipt. These checks are not an independent mathematical review.
- The joined Lean code-preservation comparison was rerun and passes: after removing nested/line comments, import lines and the common linter setting, then ignoring whitespace, its bodies equal the two current part bodies in order. Its 40 distinct imports also equal the ordered union of the parts' imports. Named examples and omitted tests remain in the inherited inventories; a comment naming a test is not an elaborated example.
- The required whole-file command was attempted: `lean-check research/blueprint/packages/MetaplecticAutomorphicForms/Suggested.lean`. It **did not elaborate**, stopping at the first import before checking declarations:

```text
error: object file for module
TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension does not exist
```

The first missing object is `TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.olean`. A read-only check of all 40 direct imports also found `TauCeti/LinearAlgebra/BilinearForm/Isometry.olean` missing; the other 38 direct import objects exist. Both native modules exist as source at the required pin, so removing these imports would change the intended baseline use rather than repair a misspelled module.

The required pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The configured shared build, `TauCeti-adic`, has the correct Mathlib commit but Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`, and lacks both native objects. Read-only inspection of the other existing Tau Ceti checkouts found none at both pins. The `TauCeti-redteam` build has the first object but Tau Ceti `d4cf9545db80ecae6c0afd176120cbf86971d26b` and Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`. It cannot validate this package at the required baseline. The check therefore provides only an import-failure receipt, not declaration elaboration at the pinned commits.

Available memory was 114 GB before the command; memory was not the blocker. It exited with code 1 immediately at the first import. No import was removed, source declaration inlined or fake substitute used to bypass it. No Lean language server, build, cache download or dependency update was started. Nothing remains compiling. Earlier workers' Mathlib-only slice checks are historical evidence, not this run's full-file certification.

## Resume here

1. A complete shared build at both exact pins must become available before compilation can resume. The `lean-check` wrapper accepts an existing build selected by `ATLAS_LEAN_BUILD`; verify both commits and both native objects first, then run the whole-file command above. Do not build dependencies or weaken native imports. Record the actual compiler result and fix any package-level errors within this issue's permitted files.
2. Audit the compressed prose against the two accepted packets, especially the rewritten MP.3, MP.6, MP.7 and MP.8 statements. Numbering maps to input node order as explained above. The source locators, hypotheses and API contracts remain alongside each target; the README has little size headroom, so replace redundant prose when adding detail.
3. Preserve every source/supplier omission honestly under PROTOCOL section 13. If package completeness requires a carrier or theorem beyond the accepted plan, record the exact owner correction here; this job cannot change the packets. Do not replace an actual oscillator, Jacobi space or meromorphic family by independently chosen functions with an assumed conclusion.
4. Once the package obligations and full pinned elaboration are satisfied, add the metadata line and update this note with the actual final checks. If the same build condition remains, submit only a precise blocked continuation rather than declaring completion.

All continuation material is in the repository and this handoff; the disposable scratch directory contains nothing the next worker needs.
