# PKG-HodgeStructuresPartII — checkpoint handoff

Status: partial. Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), worked by Codex, session `codex-IOCPs9`, on 8 October 2026. The claim was confirmed by the bot. This submission preserves a substantial package draft; it does not certify completion, elaboration, source-proof closure or implementation.

## Delivered draft

The [README](../packages/HodgeStructuresPartII/README.md) is about 161 KB and presents H.0–H.8 in order, with purpose, ownership, conventions, grouped mathematical targets, API outlines, tests, hypotheses, source locators and an edition-specific bibliography. Its process-free mathematical prose was written from the accepted plan rather than copying the multi-megabyte reader. H.0's large API is grouped by constructions and coherence diagrams. Source locators were checked against the accepted target records; in particular H.1 uses the specified Simpson journal and preprint pagination, and the harmonic compactness statement retains operator-norm convergence `W¹,q → L^q`.

The [Suggested.lean](../packages/HodgeStructuresPartII/Suggested.lean) retains the assembled file's declarations, API lemmas and tests. It has one leading block of 108 distinct imports and the standard definitive-README note. The original outer `Assembly0`–`Assembly9` sections are called `Layer0`–`Layer9`; `Layer1` is the H.0 supplement, so the subsequent sections are offset by one. Declaration namespaces and names are unchanged. A comparison that removes nested comments and whitespace, and normalizes those section labels, found identical Lean code. Changed comments clarify the inherited native-interface boundary rather than claiming elaboration or global completeness.

`metadata.toml` is deliberately absent. Its final content should be `topic = "math.AG"` followed by a newline. The intake's `deliverables_complete` currently treats a package as complete when all three output files exist; it does not inspect this handoff's status or the compiler result. Withholding the metadata keeps this blocked submission a checkpoint and lets the issue return to continuation after intake.

## Inputs and retained scope

The source of truth remains the ten accepted files in `research/blueprint/packets/`: `HodgeStructuresPartII.json` and `HodgeStructuresPartII--H.0.json` through `HodgeStructuresPartII--H.8.json`. They have 885 unique targets: 569 original H.0 targets, seven H.0 additions, and 36/33/43/30/73/32/31/31 targets in H.1–H.8. The full reader and assembled suggested file remain unchanged. See [the assembly handoff](ASM-HodgeStructuresPartII.md) for the supplier reconciliation, unresolved interfaces and earlier slice-check history.

The upstream HodgeStructures and GeometricTopology READMEs were read in full, together with WORKERS, both protocols, UPSTREAM_GUIDE and the parent roadmap's reviewed library audit. This packaging pass does not expand the source-reading claims of the accepted plan. It neither reads nor copies restricted library books. Mathematical statements are paraphrases; source titles, theorem identifiers and page locators identify the editions.

## Validation and blocking condition

- `python3 scripts/check_blueprint.py <packet>` passed separately for all ten unchanged inputs: zero errors and zero warnings for each.
- The README size is below 200 KB; all nine layer headings are present in order. Its local Markdown links resolve, its 46 bracketed citation keys occur in the bibliography, and checks for programme-process words and private filesystem paths passed.
- The import block and code-preservation comparison passed. These are structural checks, not Lean elaboration or a proof that every grouped README sentence faithfully covers every target.
- Whole-file `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean` **did not elaborate**. It stopped while loading imports, before checking declarations, because the object file for `TauCeti.AlgebraicTopology.LocalCoefficient` does not exist in the shared build.

The required pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The configured shared build has the correct Mathlib commit, but its Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, and it lacks the object above. Read-only inspection of the other existing Tau Ceti builds found no complete build at the required Tau Ceti pin. The alternative build with that object also has a different commit, so it cannot establish the required result. Available memory exceeded 20 GB; memory was not this run's blocker.

No library build, dependency update, cache download, extra repository clone or Lean language server was started. Nothing remains compiling in the background. The assembly's reported Mathlib-only slice checks are historical evidence only; this run does not promote them to a successful full-file check.

## Resume here

1. Use an already available complete shared build at both exact pins and run the whole-file command above. Do not build dependencies or remove native imports to bypass the blocker. Preserve the compiler's actual result, and fix package-level elaboration errors within the issue's permitted files.
2. Complete the target-by-target fidelity audit of the compressed README against the ten input files, especially the 576 H.0 targets and the inherited supplier contracts. The draft is intended to cover these constructions in families; it has not received an independent coverage certificate.
3. Keep inherited omissions visible. Global coherent/torsion-free operator moduli need more than H.0's finite locally free sheaf interface; arbitrary real admissibility needs its coefficient comparison; the fixed canonical compact in H.6/H.7 needs the Schmid/Cartan-stable comparison. Those supplier requirements remain mathematical prerequisites, not proved consequences of local models.
4. In the H.6 section, `PolarizedDatum`, `IntegralVariation`, `UnipotentVariation`, `SemistableFamily` and their related functions are inherited admitted stand-ins. These conflict with the native-interface standard when treated as definitions of global geometry. Replace them with concrete owned interfaces if available, or retain only valid native/local signatures with a precise omission inventory. Do not claim that an admitted arbitrary carrier supplies the missing geometry. The accepted source files may not be edited by this package job; record any necessary plan correction here for its owner.
5. Once all package obligations and whole-file validation are satisfied, add the metadata line, replace this partial handoff with the actual final checks, and submit the completion. If an external dependency remains unavailable, report that precise blocker again without marking the package complete.

All information needed for continuation is in this note and the repository inputs. The disposable scratch directory can be removed; it contains no irreplaceable handoff material.
