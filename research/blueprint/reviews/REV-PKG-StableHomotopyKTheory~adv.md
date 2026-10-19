# Independent review: homotopy foundations for algebraic K-theory

Job: `REV-PKG-StableHomotopyKTheory~adv`, issue #10754. Reviewer: Codex,
session `codex-n7F6pi`, 2026-10-19. Verdict: **needs_changes**.

The input is `research/blueprint/packages/StableHomotopyKTheory/` at atlas
commit `bd19d8eb0`. Its package was introduced by `aba42a07c` (PR #8168).
This reviewer did not write or review that package previously.

## Binding gate and finding

`PACKAGE_REVIEW.md`, “Shape of a roadmap (maintainer, 2026-10-12)”, requires
a `needs_changes` verdict, without further reading, when the suggested file
contains a data definition with a `sorry` body or develops theory rather than
stating targets against existing carriers. That rule applies here. The file
has 4,014 lines, within the 5,000-line ceiling; the content restriction is a
separate requirement.

The following are direct inspections of data-valued declarations, not
inferences from declaration names or compiler warnings. Line numbers refer
to the unchanged package `Suggested.lean`.

| Declaration | Line | Observed body or dependency | Required repair |
| --- | ---: | --- | --- |
| `CategoryTheory.classifyingSpace_vertex` | 84 | An element of the realised nerve is supplied by `sorry`. | Give the actual vertex inclusion if it is light at the pins; otherwise keep its construction in the README. |
| `CategoryTheory.classifyingSpace_edge` | 87 | A path between selected vertices is supplied by `sorry`. | Keep its construction and endpoint API in the README unless a real existing-API expression is available. |
| `SSet.toTopCWComplex` | 137 | An entire CW structure is supplied by `sorry`. | Keep the construction and cell, skeleton and characteristic-map contracts in the README. |
| `CategoryTheory.classifyingSpaceOpHomeomorph` | 212 | A homeomorphism is supplied by `sorry`. | Express a milestone as existence on existing carriers, or keep the constructed map and its API in the README. |
| `CategoryTheory.categoryChainComplex` | 375 | A chain complex is supplied by `sorry`; subsequent homology targets use it. | Keep the chain construction and dependent signatures in the README. |
| `SSet.Pointed.smashMonoidal` | 2352 | A monoidal structure is supplied by `sorry`. | Keep this construction and its coherence contracts in the README. |
| `SSet.Pointed.circle` and `sphere` | 2365, 2368 | Pointed simplicial sets are supplied by `sorry`. | Use actual light existing-API expressions, or retain these objects and dependent targets in the README. |
| `SymmSpectrum.Data.iterσ` | 2415 | The iterated structure morphism is supplied by `sorry`; the new `SymmSpectrum` structure uses it in its equivariance field. | Move the heavy structure construction, its iterated-map API and coherence targets to the README. |
| `SymmSpectrum.sphere` | 2480 | A symmetric spectrum is supplied by `sorry`. | Keep the construction and its tests in the README. |
| `SymmSpectrum.naivePi` | 2496 | A type is supplied by `sorry`, followed by a sorry-bodied additive-group instance. | Keep the colimit carrier, structure and dependent API in the README. |
| `SymmSpectrum.pi` | 2631 | A type is supplied by `sorry`, followed by a sorry-bodied additive-group instance. | Keep the stable-replacement carrier, structure and dependent API in the README. |
| `SymmSpectrum.stableModelCategory` | 2714 | A model-category structure is supplied by `sorry`. | Keep the model-category construction and comparisons in the README. |

These are representative witnesses sufficient to establish the gate failure,
not an exhaustive list of repair sites. There is also a chain of new spectral
carriers, replacements, localisations, monoidal structures and coefficient
constructions. A locally real-bodied declaration does not become eligible
merely by referring to one of those placeholder carriers. In particular,
changing a spelling from `def` to `abbrev`, or replacing a carrier by an
arbitrary parameter, would not fix this problem.

The package checker reports 228 offending declarations. That is the raw
diagnostic count: its heuristic also flags proof-valued instances such as
`categoryColim_additive` and `Group.classifyingSpace.pathConnected`.
Those proof instances are not evidence of sorry-bodied data. The explicit
data-valued witnesses above establish the finding independently of those
false positives.

## Pass table and limits of this review

The gate requires stopping the substantive review before the full mathematical
pass. The table distinguishes that stop from a successful adversarial pass.
No theorem has been certified by this review.

| Statement or requirement checked | Instances or inspection performed | Result | Change |
| --- | --- | --- | --- |
| Suggested-file size | Counted the complete file. | 4,014 lines; passes the numerical limit. | None. |
| Data definitions have real bodies | Read the vertex, edge, CW, chain and spectral declarations listed above. | Fails: values, types and structures are supplied by `sorry`. | Recorded `needs_changes`; retained the mathematical targets and tests. |
| New statements use existing carriers or eligible light definitions | Followed the displayed dependency from pointed smash and spheres through iterated structure maps to symmetric spectra and their homotopy-group carriers. | Fails the content restriction independently of length. | Recorded the required carrier/dependency cleanup. |
| Lean elaboration | Ran `lean-check` on the complete unchanged file. | Exit 0, no errors, 673 warnings, all `declaration uses` followed by `sorry`. | None; successful elaboration does not establish truth or satisfy the shape gate. |
| Degenerate cases of every mathematical statement | Not completed after the mandatory gate failure. | Unreviewed; no assertion about trivial groups, empty categories, rank zero, low homotopy degrees, or coefficient boundary cases. | Must be performed on the compliant revision. |
| Signs, map directions and two-term witnesses | Not completed after the mandatory gate failure. | Unreviewed. | Preserve existing checks and verify their values on revision. |
| Source locators, baseline claims, current-upstream duplication, supplier closure and generality | Not completed after the mandatory gate failure. | Unreviewed; no source or library claim is accepted on the strength of elaboration. | Resume these passes after the shape repair. |

## Validation

- `python3 scripts/check_sorry_data.py research/blueprint/packages/StableHomotopyKTheory/Suggested.lean`:
  exit 1, 228 diagnostics; representative true positives were inspected above.
- `lean-check research/blueprint/packages/StableHomotopyKTheory/Suggested.lean`:
  exit 0, no errors, only the 673 expected `sorry` warnings. Available memory
  exceeded the worker's 20 GB minimum before starting. No Lean server or
  library build was started.
- `python3 research/blueprint/intake.py check-files` on the three review deliverables:
  3 files, 0 problems; review JSON parsing and `git diff --check` also pass.
- The package metadata is `topic = "math.KT"`.

The first validation is an expected failure of the reviewed input and the
reason for the verdict. It is not a claim that this package is ready upstream.
The review changes only `review.json`, this report and the worker handoff;
README, Suggested.lean, metadata and every existing unit test are preserved.

## Repair and resumption

Reshape the suggested file by content, preserving every target, hypothesis,
source locator, API and discriminating check in the README. Keep only light
real-bodied definitions over carriers present at the pins, milestones and
end theorems on those carriers, and representative examples. Remove both
placeholder data and every Lean declaration depending on it. Heavy objects
remain named README targets with their intended interfaces; their Lean
constructions are Tau Ceti implementation work.

Run the data checker and `lean-check` on that revision. Then complete the
source sampling and flagged-locator checks, the current TauCetiRoadmap and
Tau Ceti duplication audit, supplier closure, README/signature generality,
all degenerate cases and sign/direction witnesses. The present verdict must
not be reused as mathematical acceptance of that revision.
