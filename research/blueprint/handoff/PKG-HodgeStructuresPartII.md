# PKG-HodgeStructuresPartII — blocked checkpoint

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-VsEBtf`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6092286777).
None of the manager-priority issues was available at selection. This was an
available focus package under WORKERS' fallback order. Only this job was claimed.

This is a checkpoint for a demonstrated scope blocker, not a completed package
or a time-limit submission. Missing Lean signatures alone do not block a package:
PACKAGE_REVIEW permits omissions while the README retains the exact mathematics.
The two blockers below concern the suppliers' mathematical statements themselves.
They remain outside this issue's permitted edits.

## Changes and preservation

- Normalized the README's front matter to scope and ownership, conventions,
  exact supplier contracts and a prose explanation of the build. Its nine
  layers now have numbered headings and closing dependency paragraphs.
  The mathematical target prose, API, checks, hypotheses and source locators
  are retained. The README is 189,248 bytes, below the issue's 200 KB limit.
- Normalized the Lean import block to `import Mathlib` and the ten native
  Tau Ceti imports actually retained by the file. Moved the standard note
  into a module docstring after the imports.
- Enclosed all prototypes in `TauCetiRoadmap.HodgeStructuresPartII`, so they
  do not extend the actual library namespaces. Opened the native Hodge
  namespace explicitly: the previous root-level topic namespaces implicitly
  exposed native parent names, whereas a roadmap namespace does not.
- Changed all 485 `lemma` declarations to `theorem` and supplied layer titles
  corresponding to the README. The two H.0 sections are one layer and its
  ordered-shuffle continuation.
- Compared executable declaration text before and after, excluding imports,
  comments, the added namespace/open commands and the keyword substitution:
  identical. All 681 `example`s, including the earlier proved H.7 negative
  controls, are preserved. No theorem hypothesis, formula or body was changed.

The namespace/import conversion's first check exposed unqualified native Hodge
names; the explicit native opening corrects that scope issue. No arbitrary
supplier carrier or theorem-valued premise was added to make it compile.

## Concrete scope blockers

The accepted H.0 continuation explicitly retains seven gaps and calls the stage
`planned`, not `closed`. Its acceptance is of a target-level planning pass. It
therefore does not establish the dependency closure assumed by the package issue.
Re-read the consumer gaps/requests and the following owner statements directly:

| Consumer requirement | Supplier statement actually present | Required resolution |
| --- | --- | --- |
| H.0 G1: ordinary connection on an arbitrary supplied commutative ringed differential site; restrictions, gluing, and comparison of every exterior extension with the parameter-one operator | `CrystallineCohomology:CR.1/integrable-connection`, in `CrystallineCohomology--CR.0.json`, defines affine connections using a quotient of Kähler differentials and a crystalline-site sheaf construction. Its site hypotheses do not cover the requested arbitrary differential site. That part's review is `needs_changes`. | At the connection owner, state the arbitrary-site ordinary carrier, horizontal maps, restriction/descent and exterior-extension comparison, including its affine and crystalline specializations. Identify the same section operator and its curvature. Do not import crystalline quasi-nilpotence into an ordinary connection definition. |
| H.0 G3: finite locally split ordinary Rees sheaf, local freeness and operator-compatible specializations at t=0, t=1 and t inverted | `DerivedDeRhamCohomology:DD.1/filtered-modules` defines enhanced diagrams indexed by decreasing integers. `/rees-description` states a derived graded Rees equivalence and derived t=0 and t-inverted comparisons. Neither states the requested finite locally free ordinary sheaf comparison or its connection specialization. | At the filtered/Rees owner, add the exact ordinary finite locally split specialization/comparison target and its sheaf restriction, tensor and quotient coherence. Identify the graded fibre, ordinary fibre and localized fibre and transport the Griffiths operator with relative dt=0. A derived equivalence without those identifications does not supply this contract. |

Neither is merely an unproved adequate signature. Current
`AlgebraicVectorBundles` supplies scheme module tensor/dual/polynomial operations;
`DifferentialGeometry` supplies smooth manifold forms and distinguishes bundle
covariant differentiation. These do not state the arbitrary ringed-site
ordinary-connection comparison. Current Tau Ceti's
`SheafOfModules.tensorProduct` is the sheafification of presheaf tensor products
and must be reused. Its Rees-algebra grading (`reesAlgebra.grade`) concerns
ideal powers in R[It]; it is not a filtered module-sheaf/Griffiths comparison.
Do not re-plan those native constructions.

Issue #7491 permits only the package and this note, explicitly forbidding packet
changes. Resolving these owner contracts would require work outside that scope.
The next useful action is a maintainer resolution at those owners, followed by
updating the consumer references. Re-running this package job without that
change does not resolve the two blockers.

`ShimuraData:D3/variation` states a mathematical compatible real/rational
variation contract. Its incomplete suggested carrier is not, by itself, a
mathematical ownership gap. Its `IntegralVariationFibers` prototype still lacks
scalar-extension agreement and lattice naturality; it cannot be used as a
replacement for the global integral variation in H.7. Keep this distinction.

## Checks and reading receipt

- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`: final whole-file exit 0, zero errors, 1623 warnings, all `declaration uses sorry`; zero other warnings.
  Available memory was 102 GB before this check. No Lean process remains.
  This verifies elaboration of the preserved signatures, not theorem truth.
- All ten unchanged Hodge packets: `python3 scripts/check_blueprint.py`, exit 0,
  zero errors and zero warnings each. These structural checks permit the
  recorded gaps and do not certify dependency closure.
- The shared build's Mathlib HEAD is
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Compared all 5,477 tracked
  `TauCeti/**/*.lean` blobs at
  `f790474821cf4256814db967cb154e7af3d0c369` with that build: zero missing,
  zero differing. This used read-only Git manifests and hash comparison.
- `git diff --check` and `research/blueprint/intake.py check-files`: pass.
  No source passage, restricted source file or private path was added.
- Read WORKERS, both protocols, UPSTREAM_GUIDE and PACKAGE_REVIEW; read current
  Completed/HodgeStructures and Completed/UniversalCovers; inspected current
  AlgebraicVectorBundles and DifferentialGeometry README/Suggested interfaces,
  the reviewed Hodge library audit, the consumer gaps/requests, and the owner
  connection and filtered/Rees statements. Read current native sheaf tensor
  and Rees grading definitions rather than relying on their names.
- Read-only upstream roadmap snapshot:
  `d6f707516e7ede3181dac4b2420ba25c0799d22d`; current library:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
  No new paper-reading claim is made in this formatting/supplier pass.

## Remaining work after supplier resolution

Preserve the native H.5 scheme-theoretic fibre and finite-projective lattice
signatures, the native Betti scalar-automorphism tests, and the H.7 proved
negative controls. Do not restore the twenty removed H.7 results on arbitrary
receiving sets, matrices, maps or languages: geometric hypotheses must occur in
signatures, not only in comments. The existing closing inventories identify the
omitted H.0/H.1/H.2/H.3/H.4/H.5/H.6/H.8 interfaces and the input packets retain
all mathematical specifications.

Finish the complete target-fidelity and adversarial mathematics audit, especially
H.0's 576 targets and the remaining admitted results. This pass preserves
executable statements; it does not independently certify their truth. Complete
README prose/API/**Checks** grouping, worked examples and precise named supplier
contracts throughout; complete Lean declaration docstrings and shorten historical
inventories/process comments into permitted closing omission lists. Those form
obligations are not claimed solved by the header and namespace normalization.
Check current upstream/library duplication and bottom-up tier dependencies for
all targets, not only the two blocker families.

`metadata.toml` remains absent because this is a checkpoint. Its final content is
`topic = "math.AG"` after the complete-package requirements hold. Then run the
whole-file Lean and submission checks again. Everything needed to resume is in
these repository files, their input packets and the public references in the
README; no disposable scratch file is needed.
