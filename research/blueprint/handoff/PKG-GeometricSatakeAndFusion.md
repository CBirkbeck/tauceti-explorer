# Geometric Satake roadmap package

Codex, session `codex-rrQYJE`, 10 October 2026. Refs #7473.
The bot confirmed the claim in [its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/7473#issuecomment-6091487980).

## Submission state

The package of the accepted target-level plan is complete and ready for its
independent package review. The previous checkpoint's missing compiled Tau Ceti
imports are now available in the shared build. The full `Suggested.lean`
elaborates at both required pins. `metadata.toml` contains `topic = "math.NT"`.

This is a roadmap specification with admitted prototypes, not a formalisation
or a claim that the accepted plan's supplier gaps are closed. The accepted GS0
and GS3 packets plan every layer and record the geometric supplier obligations;
those obligations remain explicit in the reader and omission comments, as
PROTOCOL.md sections 0, 13 and 20 require. No packet or supplier roadmap changed.

## Changes in this continuation

- Retained the thematic reader with all 94 target statements, hypotheses,
  sources and prerequisites, and all 120 API entries. Its introduction,
  conventions, five layers, dependency boundaries and source editions remain.
- Cited current upstream `AlgebraicVectorBundles`, L0A–L0C, for ordinary module
  sheaf tensor/pullback, finite locally free sheaves, rank-one identification
  with `InvertibleSheaf`, and exterior-power determinants. Its actual README
  and suggested signatures provide these operations. The Witt-resolution
  descent and positivity applications remain here; they do not re-plan the
  general operations.
- Made `satakeFibre`'s object and morphism assignments the actual module direct
  sum and `DirectSum.lmap`. Its functor laws remain admitted.
- Added a finite set of degrees, zero modules outside it, and degreewise
  `Module.Finite`/`Module.Projective` hypotheses to
  `satakeFibre_finite_projective` and the `fibre_existing_module` example.
  Without these inputs the arbitrary-functor signature conflicts with the
  existing unbounded-cohomology non-example. Added joint faithfulness of the
  family of degreewise functors to `satakeFibre_faithful`.
- Explained the algebraic interface in the README. The geometric target still
  **proves** the finite-support, projectivity and faithfulness inputs using the
  Satake constant-term filtration, split-kernel lifting and conservativity.
  Neither the added inputs nor the direct-sum construction substitutes for
  that geometric proof or for local constancy on the leg base.
- Made the omitted geometric hypotheses adjacent to both split-kernel and
  split-cokernel signatures explicit. Their lifting assertions concern the
  flat-perverse ULA Satake category, not arbitrary additive categories.
- Retained all 99 named test contracts, including precise omissions where the
  geometric carriers cannot yet be typed. A contract count does not assert
  that every contract has a complete geometric Lean statement or a proved test.

The package's direct-sum corrections should also be carried to the assembly
suggested file when its owner next edits it. This job cannot change that path.
The new `AlgebraicVectorBundles` citation identifies the current upstream owner
for the ordinary operations; general supplier plans should import it as well.

## Validation

Pinned revisions: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The shared build's 5,477 Tau Ceti Lean source files were compared byte for byte
with that commit: zero mismatches. All 33 distinct Mathlib modules named in the
accepted baseline records likewise match their pinned commit. The four native
Tau Ceti imports were retained and loaded; no imports, pins or geometric blocks
were removed to obtain elaboration.

Read the worker instructions, both protocols, upstream guide, issue, accepted
inputs and their assembly, and the reviewed library audit. Read upstream
`ReductiveGroups` and `RepresentationTheory/SemisimpleAlgebras` in full. Checked
the nine newer upstream roadmap areas' suggested files for overlapping targets,
and read the relevant `AlgebraicVectorBundles` signatures. Current upstream
roadmaps were checked at `cb8dda51b498dc00183d100031b631dfb58ea5e1`; the current
Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The current library includes initial Fargues–Fontaine orbit-space topology;
GS0 imports the relative-curve supplier rather than constructing that topology.

Read FS VI.7.10–VI.7.11, pp. 222–223, for the fibre-functor conditions, and
VI.11.1–VI.11.3, pp. 235–237, for the integral rank-one qualification. The reader
retains the accepted characteristic-two replacement and its strengthened
modular Hom/top-cycle and tilting supplier requirements. Its other source and
supplier qualifications remain those of the accepted plan. No source passage,
private library file or machine-local path is part of the deliverables.

Both commands passed with zero errors and zero warnings:

```text
python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS0.json
python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json
```

Correspondence checks found all 94 target anchors, all 120 API names in both
reader and suggested file, and all 99 test names in the suggested file. Every
definition/construction retains at least three test contracts. All 106 reader
anchors are unique and internal links resolve. The reader is 198,074 UTF-8
bytes and contains no programme-process vocabulary. All 40 imports are unique.
The four target paragraphs differing from their packet statements replace
process terms with timeless mathematical wording without changing scope.

With 103 GB available, the required full command passed:

```text
lean-check research/blueprint/packages/GeometricSatakeAndFusion/Suggested.lean
```

**Result: exit 0, zero errors, 280 warnings, all `declaration uses sorry`.**
This validates elaboration of the entire package file, including its native
Tau Ceti blocks, at the required pins. It does not validate admitted proofs.

`intake.py check-files` and `git diff --check` passed for the four allowed
deliverables. No build, library update or language server was started. No
running Lean process or scratch artifact is needed for the independent review.

## Next step

Independent package review should run the same full Lean command and assess the
package against the accepted mathematical plan and upstream guidance. No
package continuation is needed. The maintainer and the supplier owners retain
the accepted plan's explicitly named geometric refinements and source repairs.
