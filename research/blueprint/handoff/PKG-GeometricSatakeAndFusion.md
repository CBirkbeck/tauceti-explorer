# Geometric Satake package checkpoint

Codex, session `codex-9gdOOK`, 9 October 2026. Refs #7473.
The bot confirmed the claim in [its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/7473#issuecomment-6073686881).

## Submission state

This is a checkpoint, not a completed package. The full `Suggested.lean`
cannot be elaborated because the existing build at the pinned Mathlib revision
lacks the required compiled Tau Ceti imports. `WORKERS.md` forbids building
Mathlib or Tau Ceti, and no existing build with those imports and the correct
Mathlib pin was found. The mathematical reader and joined suggested file are
saved for continuation.

`metadata.toml` is deliberately absent. The package branch of
`deliverables_complete` in `research/blueprint/issues.py` treats the existence
of every output as completion; it does not inspect a package's Lean result or
this note. Creating metadata now would send an unvalidated package to review as
complete. When the full file passes, create the one-line file
`topic = "math.NT"` and replace this checkpoint state with the successful check.

## Saved work

- `research/blueprint/packages/GeometricSatakeAndFusion/README.md` is the
  thematic reader: introduction, dependency boundaries, conventions, all five
  layers, existing library vocabulary, and a bibliography distinguishing the
  source editions. It contains all 94 accepted target statements and their
  hypotheses, all 120 API entries, all target source locators, and every target
  prerequisite. Shared GS3–GS4 hypotheses are stated once at the start of GS3.
  Internal prerequisites link to results; a prefix table expands external
  prerequisites to exact roadmap IDs. It is 197,312 UTF-8 bytes, below 200 KB.
- `research/blueprint/packages/GeometricSatakeAndFusion/Suggested.lean` retains
  the entire accepted assembly from its first import onward, byte for byte
  apart from surrounding whitespace. The single introductory note now makes
  the mathematical reader authoritative and states the supplier/omission
  boundaries. All 99 named test contracts remain, including the accepted
  explicit omissions where geometric hypotheses cannot yet be typed. This
  count is of contracts, not a claim that every contract is an executable
  example or that a `sorry` example proves its assertion.
- No accepted packet, assembly reader, source issue, supplier roadmap or atlas
  file was changed. There is no mathematical change to the accepted plan.

The reader preserves the important qualifications: Cartier completion and
ordinary length at coincident legs; independent Witt projectivity and the
representable lower boundary; the canonical-model determinant comparison;
the corrected rank-two right factor and its nonuniqueness; one-leg ULA
comparison and disjoint-leg cell calculus; integral flat exact Satake;
early convolution before fusion; parity-corrected symmetry; MC.6 as the sole
abstract reconstruction owner; the additional characteristic-two modular
Hom/top-cycle and tilting inputs; the Prasad–Yu exception and adjoint reduction;
the half-Tate/Drinfeld orientation obligation; all-prime perfect-complex
extension with containment rather than full faithfulness; and the extra
nonsplit Frobenius/relative-weight comparison. These mathematical obligations
remain explicit rather than being silently assumed.

## Validation

Pinned revisions: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read `WORKERS.md`, both protocols, `UPSTREAM_GUIDE.md`, the issue, the reviewed
library audit, the accepted GS0 and GS3 packets and their assembly, and the
upstream ReductiveGroups and SemisimpleAlgebras roadmaps in full. Read the
actual pinned statements of all 47 distinct baseline declarations. Inspected
the primary FS, Zhu and Prasad–Yu sources for the rank-one, finite-model and
integral-recovery qualifications. No source passage or private library file
was copied into the deliverables.

Both accepted inputs passed their checkers with zero errors and warnings:

```text
python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS0.json
python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json
```

A scratch correspondence check passed for every statement, every hypothesis
(including the shared hypotheses), every API, all 99 test names in the Lean
file, source locators, and prerequisites. It also checked all 106 unique
result/source anchors and their internal links, the reader's byte limit and
absence of programme-process vocabulary, unchanged accepted Lean contents,
unique imports in one import block, and the acyclic internal prerequisite
graph. The whole reader was read for mathematical scope and flow.
The submission `intake.py check-files` check also passed for all three saved
deliverables, with no prohibited paths.

The required final command was run with more than 20 GB of available memory:

```text
lean-check research/blueprint/packages/GeometricSatakeAndFusion/Suggested.lean
```

**Result: exit 1, before declaration elaboration.** The error is that the object
file for `TauCeti.AlgebraicGeometry.LineBundle.Basic` does not exist. All four
Tau Ceti imports lack built objects in that pinned build:

```text
TauCeti.AlgebraicGeometry.LineBundle.Basic
TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor
TauCeti.AlgebraicGeometry.AffineGroupScheme.Basic
TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive
```

An auxiliary scratch projection passed `lean-check` with **exit 0, 263 warnings,
all `declaration uses sorry`, and no errors**. It removed those four imports,
the `geometric-determinant-line` block, the `h-descent-and-fibral-criterion`
block, and the entire `section GroupComparison` through its matching end.
Each removed result block ended at the next result header. All other code was
unchanged. This checks only the Mathlib portions; it does **not** validate the
full file, the removed Tau-dependent statements or their tests. The projection
and logs were scratch files and are not part of the submission.

## Resume

1. Obtain an already compiled shared build at both pinned revisions with all
   four imports available. Do not build either library, change pins, weaken
   imports or replace imported geometry to evade the check. Existing builds
   found with the required objects used other Mathlib revisions and are not
   valid substitutes.
2. Run the full required `lean-check` command. Fix any declaration errors
   exposed after import loading, retaining the accepted mathematical
   specification and documenting unexpressible hypotheses honestly. Record
   exit zero and only `sorry` warnings before treating the package as done.
3. Recheck target/API/test correspondence and reader size if any declaration
   or statement is changed. Add `metadata.toml` with `topic = "math.NT"`.
4. Update this handoff, submit the completed package on the continuation
   worker's own claimed branch, and leave intake and independent review to
   the swarm automation.

No running Lean process or language server is left by this worker. Nothing in
the scratch directory is needed to resume; the accepted inputs and these
deliverables contain the necessary specification and continuation instructions.
