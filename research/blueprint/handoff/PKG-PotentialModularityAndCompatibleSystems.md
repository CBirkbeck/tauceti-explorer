# Potential Modularity and Compatible Systems package — checkpoint

Issue: #7495. Worker: Codex (GPT-6), session `codex-GIi2gr`.
Date: 9 October 2026. Claim confirmed by the swarm bot for comment 6072369574.

**This is a checkpoint, not a completed package.** The README and joined suggested
file are ready for continuation. Native elaboration cannot start because the
shared build lacks the compiled Tau Ceti line-bundle import. `metadata.toml` is
deliberately absent until the required full check succeeds: package intake tests
whether every output exists, so supplying it now would misclassify this work as
complete. Its eventual entire contents should be `topic = "math.NT"` followed by
a newline.

## Inputs and scope

The source of truth was the current accepted pair:

- [R23.1 packet](../packets/PotentialModularityAndCompatibleSystems--R23.1.json),
  accepted by its second independent review on 8 October 2026: 49 targets,
  22 retained gaps and 33 supplier requests.
- [R24.3 packet](../packets/PotentialModularityAndCompatibleSystems--R24.3.json),
  accepted on 8 October 2026: 43 targets, seven retained gaps and 26 supplier
  requests.
- Their current individual reader documents and suggested files, including the
  corrections made by those reviews.

The 7 October assembled reader and suggested file predate those corrections.
Do not regenerate this package from that assembly. No input packet, individual
reader, individual suggested file, atlas data or campaign document was changed.

The complete local upstream READMEs read for style and density were
[Chebotarev](../../../content/tau-ceti/Chebotarev/README.md) and
[Induction and restriction](../../../content/tau-ceti/RepresentationTheory/InductionRestriction/README.md).
The reviewed library audit was consulted before writing. The nine baseline
declarations of R23.1 and the 21 of R24.3 were read at the exact source commits:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

This run checked the mathematical interfaces against the accepted plans and
their review corrections. It did not independently re-download or hash the
papers, and does not claim to have resolved the plans' source or proof gaps.
No library book or source passage was copied into the deliverables.

## Work saved

[README.md](../packages/PotentialModularityAndCompatibleSystems/README.md)
is 180,122 UTF-8 bytes. It is a standalone mathematical roadmap with purpose,
boundaries, conventions, existing-library interfaces, the order of construction,
92 target statements, all 121 API items and all 83 tests, source locators and
prerequisites at every target, and edition-specific references. It contains no
packet names, job identifiers, review/checkpoint statuses or private paths.
The wording is mathematical paraphrase rather than source excerpts or a summary
organized by a paper's sections.

The target distribution is:

| Layer | Targets |
| --- | ---: |
| R24.5:operations | 22 |
| R23.1 | 22 |
| R23.2 | 4 |
| R23.3 | 14 |
| R23.4 | 1 |
| R23.5 | 2 |
| R24.1 | 4 |
| R24.2 | 2 |
| R24.3 | 11 |
| R24.4 | 2 |
| R24.5 | 5 |
| R24.6 | 3 |

R23.6 is the export-order table, not an additional target. The generic operations
layer is presented first because its carrier precedes the R19 automorphic-family
suppliers; it does not import potential modularity or eigenform existence.

The document keeps the accepted distinctions explicit:

- Scalar splitting versus equality of completions; all local embeddings;
  Galois closure versus avoidance; and boundary-rigidified Picard classes versus
  existing unrigidified line bundles.
- Residual modularity before global finiteness and lift existence; a separately
  supplied lift before its potential modularity. The auxiliary KW II Theorem 8.2
  is an independent imported input, not the conclusion of this route.
- Unframed fixed-determinant finiteness versus the framed power-series extension;
  positive dimension as a separate requirement for a characteristic-zero point;
  ordinary semistable quotient rings versus arbitrary ordinary components.
- Full R22.5/R22.6 KW lifting versus the narrower KW II Theorem 9.7 route.
- BLGGT away-coefficient strictness, KW all-place strictness, KW almost strictness
  and Dieulefait–Pacetti's additional all-member de Rham condition.
- Virtual Brauer expressions versus genuine families; the overlap-character
  input for the norm-one argument; and Skinner's full Hilbert coefficient-prime
  theorem for strictness.
- CM signed pairings and quadratic multiplier corrections; Hodge sign and
  geometric/arithmetic Frobenius comparisons; cofinite rank-two versus
  density-one general-rank residual statements; and the exclusion of equal
  Hodge weights from the normalized weight-a-minus-b-plus-one formula.

[Suggested.lean](../packages/PotentialModularityAndCompatibleSystems/Suggested.lean)
joins the current individual suggested files, with one header, 28 unique leading
imports, their definitions, API fragments, tests and explicit omission catalogue.
The canonical `TauCeti.PotentialModularity.GaloisGroup` now uses
`Field.absoluteGaloisGroup`; the `TauCeti.CompatibleSystems.GaloisGroup` alias
refers to it. This retains the common meaning and exports the name to the tests'
child namespace. Merely opening the other namespace inside the parent did not
export that name to the child; the partial Lean check caught and corrected this
join error.

The native Tau Ceti invertible-sheaf interface is retained. Arithmetic signatures
that the accepted plans explicitly omit remain omitted, and carrier fragments
remain identified as such. No arbitrary proposition fields, dummy theorems or
inlined substitute libraries were introduced to manufacture elaboration.

## Validation and exact blocker

Both unchanged packets passed `python3 scripts/check_blueprint.py <packet>` with
zero errors and zero warnings. Structural checks of the package verified:

- Exact set equality with the 92 accepted target identifiers.
- Presence of each of the 121 API names and 83 test names at its target.
- Sources and prerequisites at every target, unique anchors, resolving internal
  links and defined bibliography references.
- The 200 KB size bound, exclusion of programme-process prose from the README,
  unique leading imports and a single Lean header.

The final staged diff passed `git diff --cached --check`;
`python3 research/blueprint/intake.py check-files` on the three changed files
reported **3 files, 0 problems**.

The final native command was:

```sh
lean-check research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean
```

It exited **1**, before elaborating the body, at line 1. The compiled object
`TauCeti/AlgebraicGeometry/LineBundle/Class.olean` for module
`TauCeti.AlgebraicGeometry.LineBundle.Class` does not exist in the shared build.
The default build has the pinned Mathlib. Other existing builds with that native
object had different Mathlib commits and were not used. A build with both exact
pins and the required native objects has not been established. No library build,
cache update, Lean language server or additional repository checkout was started.
Memory was checked before Lean runs (111 GB available, above the 20 GB threshold).
Runs were sequential and no Lean process from this run remains running.

A **partial**, Mathlib-only check of the current R24.3 portion was also run through
`lean-check`. It used the exact joined body beginning at the second
`noncomputable section`, all 27 Mathlib imports, and the canonical Galois-group
alias as its only preceding declaration. After correcting the namespace problem
above, it exited **0** with **zero errors and 77 `sorry` warnings**, with no other
warnings. This does not certify R23.1 or the full native package.

For reproducing that partial check in the next worker's own scratch directory:

```python
from pathlib import Path

s = Path("research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean").read_text()
imports = "\n".join(line for line in s.splitlines() if line.startswith("import Mathlib."))
body = s[s.index("noncomputable section\nopen scoped NumberField Polynomial"):]
prefix = """
universe u
namespace TauCeti.PotentialModularity
abbrev GaloisGroup (F : Type u) [Field F] := Field.absoluteGaloisGroup F
end TauCeti.PotentialModularity
"""
# Write imports + prefix + body to a .lean file in your own scratch directory,
# then run lean-check on it. Do not add the fragment to the repository.
```

## Continuation

1. Use an already existing shared build at both exact pins that provides the
   native line-bundle module and its dependencies. Follow WORKERS.md: do not build
   Mathlib or Tau Ceti, create a Lake project, start a language server, or inline
   their source files. If no such build is available, this external blocker
   remains for the maintainer's build environment.
2. Run the full native command above. Fix any body errors and any warnings other
   than `sorry` in the allowed package files, retaining faithful mathematical
   signatures. The successful partial check does not cover interactions with the
   geometric half. Record the actual final exit status and warning count here.
3. Check the README against any further accepted input changes, preserving every
   target/API/test and its source locator. Retain the supplier boundaries. The
   regular-local/Cohen–Macaulay proof is R03.3; integral-point extraction is R03.4.
4. Only after successful full elaboration, create `metadata.toml` with the one
   line given above and change this note to the completed-package result. Run
   `git diff --check` and `research/blueprint/intake.py check-files` on the actual
   deliverable paths before submitting.

The retained source/proof gaps include the precise strong-approximation and S-unit
inputs to Moret–Bailly, the prescribed-completion/Jordan and inverse-Galois inputs,
H6 local moduli constructions, Taylor's exceptional CM ordinary lifting and
Corollary 1.7/determinant-twist arguments, small-prime and weight-adjustment inputs,
the ordinary selected-component comparisons, Brauer overlap descent, and the
monodromy/Larsen/Sen suppliers. The complete lists remain in the two accepted
packets. In particular R23.4 does not establish arbitrary regular de Rham
potential modularity; the broad Dieulefait–Pacetti Theorem 1.11 conclusion outside
its A/B/C and dyadic weight-two scope stays a recorded gap.

Scratch generators, extracted declaration notes and logs are disposable. All
information needed for continuation is in the delivered files, this note and the
unchanged accepted inputs. There is no second claim in this run.
