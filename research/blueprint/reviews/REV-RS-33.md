# REV-RS-33 — independent restructuring review

**Decision: needs_changes.** Reviewer: `independent-review-REV-RS-33`, a separate ChatGPT worker from the proposal's recorded `codex-a71f92` author. Date: 2026-09-21. Issue: #865. This is an ownership/integration review, not a new library audit or a certification of mathematical proof completeness.

## Evidence and scope

I read PROTOCOL §15, the complete RS-33 family specification and author report, the proposal, the complete member document `content/campaign/StableHomotopyKTheory/README.md`, and all eight stages and the surrounding conventions of `content/tau-ceti/AlgebraicTopology/README.md`. I also read the complete `GeneralAlgebraicKTheory` document, the Z.1 and U.1 supplier contracts in `KTheoryLowDegrees`, and the early E0/E5 enhancement contracts in `EnhancedDerivedSheaves`. The browser atlas extract confirms the member's early/late stage split; its duplicated H.5 descriptions must be interpreted with the separate stage requirements, not as three independent constructions.

Reviewed input blob SHAs:

| Input | Blob SHA |
| --- | --- |
| RS-33 family | `e69acbc2111b4f33bdcd743187fc1173efc4cb22` |
| RS-33 proposal | `0086c477175bbad8fea1302ce359d8022dc71a42` |
| RS-33 author report | `d3ee32a3fc597ddda7e61f35af2589ae4fd4eae0` |
| StableHomotopyKTheory document | `7cdccbd3ab31ffc3d417b6221140662eeeee660d` |
| AlgebraicTopology document | `35648d1d81314e297ad4593abfaabc9b3cf0918b` |
| GeneralAlgebraicKTheory document | `7e7009b13b8f2c84b811647a1344786cc9ceca1e` |
| KTheoryLowDegrees document | `9827f3e5c4a3d71829ca19446ea80dfee89bdd6e` |

The library pins and the author's exhaustive consumer/cycle checks are inherited evidence. I did not rerun that library search, read every external roadmap, or reproduce the author's whole-atlas validator. Accordingly, this report does **not** independently certify the claimed 65-edge preservation or absence of new cycles. The concrete contract conflicts below already prevent acceptance.

## What passes at the member/anchor boundary

The extension title follows the prescribed Part II form and names AlgebraicTopology as the base. No anchor edit is proposed. Its endpoint excludes generalized cohomology and spectra, so the new category-to-space comparisons, plus construction, homotopy group completion and concrete spectra are genuine additions.

All five family leads have an appropriate disposition:

| Lead | Checked disposition |
| --- | --- |
| H.1 / AT2 | Import the fundamental-groupoid local-system carrier and twisted chains; retain the BG/bar-to-singular comparison with local coefficients. |
| H.2 / AT5 | Import the Serre carrier and its maps, not a claimed theorem equating quasi-fibrations with Serre fibrations. Retain homotopy fibres and their homotopy LES. |
| H.2 / AT8 | Import Kan/cubical comparison and based-pair machinery; the pair LES is not silently substituted for the fibre LES. |
| H.3 / AT8 | Import Hurewicz/Whitehead, retaining the plus construction and its applications. |
| H.6 / AT4 | Preserve the ordinary skeletal exact couple and require a compatibility comparison; the spectrum construction and convergence obligations remain additional work. |

The narrowed member contracts retain their original tests, local-coefficient qualifications, pointed-set low degrees, noncanonical splitting warnings, integer-indexed spectrum groups and explicit completion obstructions. H.5 remains an aggregation; KU-existing remains a readiness check; KU-spectra must not acquire the late S-delooping prerequisite. The proposal correctly distinguishes EDS's early abstract branch from its late comparison.

## Findings and corrections

### R1 — external former owners must actually be narrowed (blocking; one clear case repaired)

PROTOCOL §15 says an unlisted layer remains unchanged. However, the proposal's `owners` inventory reallocates targets from several external layers while its original `layers` map contains only the twelve member layers. An added prerequisite does not, by itself, replace an external instruction to construct or prove the same target.

There is an explicit witness in `GeneralAlgebraicKTheory:K.2:plus`: its document instructs the worker to prove that every finitely generated projective has a complement making it free. `KTheoryLowDegrees:Z.1` already owns the direct-summand equivalence and the complement, splitting maps and idempotent matrix. The proposal assigns this target to Z.1 in `owners`, but originally supplies no narrowed K.2:plus contract.

**Repair:** add a `narrow` record for `GeneralAlgebraicKTheory:K.2:plus`. Keep the actual finite-projective exact category, unrestricted unital scalar extension on its split exact structure, the Q-to-group-completion comparison, component and zero-component identifications, chosen nonnatural product description, and ring-map/block-sum naturality. Import the complement from Z.1, categorical K0 from GrothendieckEulerForms, stable GL/elementary data from U.1, and homotopy completion/plus comparison from H.4. These supplier links already occur in the proposal. Do not move the separate late low-degree comparison or create a reverse K.2:plus-to-H.4 dependency.

The same target-by-target exercise is still required for the other external `formerly` records before accepting the proposal. A genuine application may remain unchanged, but then it must be identified as an application rather than counted as a former competing owner.

### R2 — a product application was counted as a competing smash-product owner (repaired)

The only construction requested in GeneralAlgebraicKTheory K.7's product paragraph is the external K-theory product from biexact functors, with its K-theoretic coherences and boundary/transfer comparisons. It does not instruct the worker to build the generic smash product of spectra. The author's own report also distinguishes these two targets.

**Repair:** remove `GeneralAlgebraicKTheory:K.7` from the `formerly` array of the generic concrete-spectrum/smash/pairing owner record. Retain both existing H.5:spectra-to-K.7 and H.5:S-delooping-to-K.7 prerequisite links. K.7 remains the owner of the biexact-functor product; H.5:spectra remains its ambient spectrum supplier. No K.7 mathematical target is deleted.

### R3 — the S-construction proof/assembly boundary is not yet a complete integration contract (blocking)

The intended order is sound as a design:

`E5:abstract -> H.5:spectra -> K.4:construction -> H.5:S-delooping -> K.4`.

But the unchanged GeneralAlgebraicKTheory document places both “iterate S to form the spectrum” and the additivity/delooping proofs in its early K.4:construction paragraph. The proposal assigns assembly to H.5:S-delooping and treats the later K.4 as its consumer, yet supplies no `layers` record delimiting what remains in either K.4 layer. Merely changing two proof-node parents does not rewrite these stage contracts.

The report's two proposed parent alignments are useful, but acceptance needs an explicit retained/moved/imported ledger for the early and aggregate K.4 scopes: Waldhausen carriers, diagram cofibrations, simplicial S, iteration as space-level data, additivity, the adopted fibration/delooping theorem, approximation, Q comparison and Gillet–Waldhausen comparison. State which comparisons are proved at space level before spectrum assembly and which are later spectrum-level comparisons. Then check the incident decomposition links after the two parent changes. Do not solve the ambiguity by adding H.5:S-delooping as a prerequisite of its own K.4:construction supplier.

This requires coordination with the owner of GeneralAlgebraicKTheory's restructuring, not a guessed deletion from the member-only family. The present review therefore does not invent new proof-node moves or claim that the combined graph has passed validation.

## Acceptance conditions for the next revision

Resolve R1 for every external former-owner record, retaining every specialized application. Resolve R3 with explicit K.4 contracts and a reproducible combined stage/decomposition graph check. Confirm the base is the first roadmap prerequisite while preserving the early/late stage directions. Finally audit the outgoing consumers against the resulting retained/moved/imported target ledger; raw endpoint existence and a generic supplier-to-consumer fan-out are not substitutes for this check.

The existing source gaps must remain open, especially plus universal-property hypotheses, realization/cofibrancy comparisons, local-coefficient acyclicity, spectrum models, Milnor limits and convergence. Finding a named owner does not prove these results.

## Validation and handoff

Only the RS-33 proposal and this report are changed. No anchor, live atlas extract, integrated decomposition, queue file or Lean source is edited. The submission records `review.status = "needs_changes"`; it must not be promoted as an accepted restructuring.

Local checks cover JSON syntax, the expected record counts, preservation of the original link endpoints, the added K.2:plus supplier links, uniqueness of listed owner targets and the absence of a new reverse K.2:plus-to-H.4 edge. These are limited proposal checks, **not** a whole-atlas acyclicity or mathematical-completeness certificate. The repository's blueprint checker is not a checker for the section-15 restructuring format. Lean compilation was not run.
