# PKG-HodgeStructuresPartII — checkpoint handoff

Status: partial; blocked on prebuilt native dependencies and incomplete native
geometric signatures. Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex, session `codex-DpXa1j`, on 9 October 2026, after the bot
confirmed this session's claim. This is a checkpoint, not a finished package
or an implementation claim.

## Retained package and this continuation

The [README](../packages/HodgeStructuresPartII/README.md) retains the previous
161 KB draft: purpose, ownership, conventions, H.0–H.8 in order, mathematical
targets, API, tests, hypotheses, source locators and bibliography. A new
signature-boundary paragraph distinguishes the ten local H.6 target forms
from its global geometric signatures. No mathematical target was removed.

The [Suggested.lean](../packages/HodgeStructuresPartII/Suggested.lean) retains
its single standard header, all 108 distinct imports and all code outside
`Layer7` (H.6), byte for byte. The new H.6 inventory follows the protocol's
native-interface requirement instead of declaring arbitrary admitted supplier
types and functions. The former carriers `PolarizedDatum`, `IntegralVariation`,
`UnipotentVariation` and `SemistableFamily`, their independent projections,
the arbitrary monodromy-filtration and exterior-coordinate functions, and the
arbitrary limiting bigrading are removed. The 22 global theorem signatures
depending on these values are also removed; their mathematical targets,
missing carriers/comparisons and geometric tests are explicitly inventoried.
This removes 56 declarations in total, including seven dependent or unused
private helpers. All 17 H.6 examples and every surviving local signature and
body are preserved.

This corrects a misleading interface; it does not complete the omitted targets.
Quantifying over an arbitrary finite group does not give an action on a
geometric family, a bare flag-domain subset does not impose polarization on
its logarithms, and a freely supplied function does not define a positive Hodge
metric. The supplier's actual data and comparisons must occur in eventual
global signatures.

`metadata.toml` remains absent. Its required final line is `topic = "math.AG"`.
The intake currently recognizes all three package files as a completion,
without examining the compiler result or this note. Retaining the absence
preserves checkpoint classification while the job is blocked.

## Exact H.6 continuation inventory

All target suffixes below belong to `HodgeStructuresPartII:H.6/`. Full target
statements, API and tests remain in the unchanged H.6 packet and reader; the
README groups them in mathematical prose. The ten surviving typed target forms
are local reductions, not full statements of their global targets:

| Target suffix | Surviving local form; missing global content |
| --- | --- |
| semistable-log-model | Coordinate model and three examples; proper analytic log family absent |
| relative-log-forms | Degree-one quotient dimension; analytic complexes absent |
| wedge-triangle | Pointwise quotient kernel; derived triangle absent |
| log-gauss-manin | Frame operator, API and three examples; global connection comparison absent |
| ramified-residue | Matrix exponential and nilpotency identity; semistable modification absent |
| unipotent-normalization | Commuting matrix power/logarithm statement; rational lattice and cover comparisons absent |
| nilpotent-orbit | Coordinate orbit, API and three examples; real/rational isometry and polarization interface absent |
| untwisted-map | Local untwisting, API and three examples; geometric descent absent |
| negative-lie-chart | Matrix exponential, API and five examples; native negative-Lie complement absent |
| power-curve-normalization | Rational slope clearing and matrix sum; variation pullback and fixed-K containment absent |

The 22 omitted global signatures are grouped under their missing native inputs
in the H.6 inventory:

| Targets (suffixes) | Native supplier interfaces |
| --- | --- |
| log-cohomology-basechange, special-residue, semistable-betti, equivariant-comparison | ComplexComparisonPartII C0/C3/C5 and CR.5 analytic log comparison: proper family, actual cohomology and base-change maps, residue/boundary and nearby-cycle comparison, specified action on the family |
| quasi-unipotence, untwisted-extension, nilpotent-orbit-theorem, finite-monodromy-extension | H.2/H.3 and ShimuraData D3: integral polarized variation, marked horizontal holomorphic lift, represented compact dual/domain, canonical extension and finite descent |
| sl2-orbit-theorem, limiting-mhs-one-variable, cone-weights, limiting-mhs, logarithms-type, distributive-family, simultaneous-splittings | Genuine polarized real/rational nilpotent orbit; LPV.1 centered/relative monodromy filtrations and naturality/splitting API; native limiting MHS and Deligne bigrading; H.2 mixed tensor/Hom/Tate comparisons |
| horizontal-correction, flat-norm-estimate, moving-norm-estimate, exterior-power-estimates, perturbed-norm-comparison | H.2/H.3 negative isometry-Lie complement, analytic splitting subbundles, positive Hodge forms, exterior powers and common-depth compact-family comparisons |
| one-variable-sl2, one-variable-siegel | H.3/AA.3 actual period lift, rational parabolic factors, canonical compact and fixed-K Siegel comparison |

The inventory lists each former theorem name and geometry-level tests. Consult
H.6 G1–G6 for exact mathematical contracts. In particular G5's comparison of
Schmid's rational torus with canonical Cartan-stable compact data is still
required; removing its stand-in theorem does not prove it.

## Validation and external blocker

- All ten unchanged input packets passed `python3 scripts/check_blueprint.py`
  with zero errors and zero warnings each.
- An isolated scratch file containing the **exact edited H.6 section**, with
  the ten original H.6 Mathlib imports, passed `lean-check`: exit code 0,
  zero errors and 50 warnings, all `declaration uses sorry`. This checks the
  changed local code against Mathlib at its exact pin. It is not a whole-file
  or Tau Ceti check. Reproduce it by extracting `section Layer7` through
  `end Layer7` from the package and prepending the Mathlib imports from the
  unchanged H.6 suggested file. Use disposable scratch, not a new Lake project.
- Structural comparison confirmed all bytes outside H.6 are unchanged, all
  17 examples survive, the single 108-import block survives, and executable
  H.6 code contains no references to removed supplier values.
- `git diff --check` passed. The README remains below 200 KB with all nine
  layer headings ordered; no source passages or private paths were added.
- Final whole-file command:
  `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`.
  **Failed, exit code 1, while loading imports**, before checking any package
  declaration: the object for `TauCeti.AlgebraicTopology.LocalCoefficient`
  does not exist.

Direct inspection found ten unavailable direct-import object files in the
configured shared build. Their sources are present, but sources alone do not
supply native Lean imports:

1. `TauCeti.AlgebraicTopology.LocalCoefficient`
2. `TauCeti.Geometry.Hodge.Polarization`
3. `TauCeti.Geometry.Hodge.Mixed.Basic`
4. `TauCeti.Geometry.Hodge.Mixed.Morphism`
5. `TauCeti.Geometry.Hodge.Mixed.Strictness`
6. `TauCeti.Geometry.Hodge.PeriodDomain`
7. `TauCeti.LinearAlgebra.BilinearForm.Isometry`
8. `TauCeti.Geometry.Hodge.HodgeForm`
9. `TauCeti.Geometry.Hodge.Structure`
10. `TauCeti.Geometry.Hodge.Conjugation`

Required pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The configured shared build has the
exact Mathlib pin but Tau Ceti checkout
`cf386627e9176a3827c1a5fe804989fd94a4d216`. Read-only inspection of the other
existing builds again found none at both required pins. A different build
having LocalCoefficient cannot validate this baseline. Available memory was
114 GB at both checks, so memory was not the blocker. No dependency build,
update, cache download, language server or extra clone was started. Nothing
remains compiling in the background.

## Source and remaining package work

Inputs remain the ten accepted packets: `HodgeStructuresPartII.json` and
`HodgeStructuresPartII--H.0.json` through `--H.8.json`. They contain 885 unique
targets: 569 original H.0, seven H.0 additions, then 36/33/43/30/73/32/31/31
in H.1–H.8. No packet, original reader, original suggested file or review was
edited. See [the assembly handoff](ASM-HodgeStructuresPartII.md) for the 113
supplier contracts and reconciliation details.

This continuation read the upstream HodgeStructures and GeometricTopology
roadmaps, both protocols and UPSTREAM_GUIDE, and the reviewed parent-Hodge
library audit. It inspected native period-domain points, mixed Hodge
structures, Hodge forms and local coefficient systems in the Tau Ceti source
at `f790474`. These provide fibre and local-system data; they do not establish
the omitted analytic variation interfaces. No source-paper reading claim is
expanded, no restricted book was used and no source passage was copied into a
deliverable.

Resume with a complete prebuilt dependency set at **both exact pins**. Run the
whole-file check, fix remaining package errors and preserve its actual result.
Do not remove native imports or substitute a different pin to turn the
checkpoint into a completion. Restore omitted global signatures only against
actual supplier carriers and comparison maps, retaining every hypothesis and
test in the README. Necessary accepted-plan corrections belong to its owner
and must be described here: this issue permits no packet edits.

The previous draft's target-by-target README fidelity audit remains unfinished,
especially the 576 H.0 targets and inherited global supplier contracts. This
continuation audits H.6's native-interface boundary, not all 885 targets.
Keep coherent versus locally free operators, arbitrary real admissibility,
Schmid versus canonical compact, mixed tensors and real integral-divisor
boundaries visible. After every obligation and the whole-file check passes,
add the metadata line and replace this partial note with the completion
receipt. Until then submit a checkpoint. Everything needed to continue is in
the repository; disposable scratch files need not be retained.
