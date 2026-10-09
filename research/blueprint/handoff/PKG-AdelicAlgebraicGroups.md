# PKG-AdelicAlgebraicGroups — checkpoint

Issue: #7453. Worker: Codex, session `codex-Jw16pG`, 9 October 2026.
The claim was confirmed by the bot on comment 6072340205.

## Status and blocker

This is a checkpoint, **not a completed package**. The README and joined Lean
draft are ready for continuation, but the full Lean file has not elaborated.
The existing shared build lacks the compiled Tau Ceti imports. WORKERS.md
forbids building either library or setting up a replacement Lake project, so
this worker cannot finish the mandatory full-file validation.

The exact command attempted was:

```text
lean-check research/blueprint/packages/AdelicAlgebraicGroups/Suggested.lean
```

It exited 1 at line 1 with an object-file-not-found error for
`TauCeti.Algebra.AlgebraicGroup.PointsFunctor`. No subsequent declaration was
checked by that invocation. The accepted input's full-file check failed at
the same import. There is no compile or language server left running.

The required pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. An existing archived build has the
correct Mathlib pin and matching sources for the eleven imported Tau Ceti
modules, but only the first of those modules has its compiled object. It is
therefore insufficient too. The other required modules are:

```text
TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Determinant
TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Torsion
TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
TauCeti.NumberTheory.LocalField.NormalizedValuation
TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
```

`metadata.toml` is deliberately absent from this checkpoint. The intake's
`deliverables_complete` function currently judges package completion by file
existence, without reading this handoff or checking Lean. Submitting all three
package files would incorrectly finish this unvalidated job. After the full
file passes, create the metadata file with exactly:

```toml
topic = "math.NT"
```

## Work saved

- `packages/AdelicAlgebraicGroups/README.md`: 196,089 UTF-8 bytes, six layers
  AA.0–AA.5 in order, 34 thematic subsections, all 264 targets and 231 API
  items. Every target has its source locator and prerequisites. The
  introduction gives scope, supplier boundaries, normalization conventions
  and the analytic inputs retained from the accepted plan. The bibliography
  distinguishes source editions and preprint versus journal pagination.
- `packages/AdelicAlgebraicGroups/Suggested.lean`: the accepted suggested
  file's active code unchanged, with one import block and one header note.
  The active portion has 245 declarations, including 55 examples. The
  mathematical interface catalogue retains all 148 named test contracts and
  the statements whose supplier language is unavailable. These commented
  contracts are **not** additional Lean declarations or checked examples.
  The omissions follow PROTOCOL.md section 13; do not replace them with
  arbitrary propositions, topologies or point-group maps.
- No accepted plan, reader, supplier request, audit or atlas data was changed.

Read the binding protocols, the full accepted plan and its suggested input,
the reviewed library audit, the relevant links, and the upstream
ReductiveGroups and RepresentationTheory/InductionRestriction READMEs.
Read the 116 cited baseline declaration statements at the pinned commits.

## Checks and source notes

`python3 scripts/check_blueprint.py
research/blueprint/packets/AdelicAlgebraicGroups.json` reported zero errors and
zero warnings: 264 nodes, 231 API items, 148 tests, 18 gaps and 20 supplier
requests. The internal dependency graph is acyclic.

A scratch-only Mathlib prefix, ending immediately before
`NumberField.normalizedLocalHaar`, was checked with `lean-check` after removing
the eleven Tau Ceti imports. It elaborated successfully with 133 declaration-use-of-`sorry` warnings
and no other warnings or errors. This validates that prefix against the correct
Mathlib pin, **not** the whole package. To reproduce it, take the suggested
file through the end of its Mathlib-only section, before the first local-field
Tau Ceti section; remove only the Tau Ceti imports and elaborate the temporary
file through the permitted helper.

The final correspondence check verified all target titles and API names in
the README, all test names in Suggested.lean, six ordered layer headings,
one source/prerequisite entry per target, the README's size bound, absence
of process vocabulary in the README, and equality of the accepted and
package active Lean code after stripping comments and whitespace.

Primary-source spot checks covered Conrad's topology comparisons, the BKT
erratum, Rapinchuk's arithmetic closure argument, Lipnowski–Tsimerman's level
counts, and Khayutin's residual limit statement. Six sparse locators were
clarified without changing their mathematical targets:

- AA.4 double-coset conjugation and fibre mass: LT section 3.2, pp. 11–16,
  identified as context for direct double-coset and orbit–stabilizer
  derivations rather than assertions that the general formulas occur there.
- AA.4 projection finite covolume: Rapinchuk section 2.6, pp. 16–17.
- AA.4 native-field arithmetic Lie closure: Rapinchuk sections 2.6–2.7,
  pp. 16–18, explicitly limited to the source's rational single-prime branch;
  the native-field and independent-factor extension remains an additional
  arithmetic input.
- AA.4 finite-product openness: Rapinchuk section 2.6, pp. 16–17.
- AA.4 elimination of finite-index closures: the same pages for isotropic
  factors; the anisotropic arithmetic step is expressly separate.

No new change to the accepted mathematical statements was established.
Retain the BKT fixed-compact and Cartan-compatibility hypotheses, the separate
anisotropic/native-field approximation inputs, the raw versus rational
quaternion quotient distinction, and the effective-central stabilizer factor
in level masses. Rosengarten is a function-field comparison; it does not
supply the number-field Artin analytic theorem.

## Resume

1. Obtain access to an already compiled build at both required pins, with all
   eleven Tau Ceti imports available. Follow WORKERS.md: do not build the
   libraries, fetch caches, create a Lake project or start a language server.
2. Check available memory, run the full package `lean-check`, and fix any
   errors on the actual pinned carriers without weakening hypotheses. The
   Tau Ceti-dependent portion remains untested, so a successful prefix is
   insufficient evidence.
3. Recheck the complete README against the accepted mathematical plan and
   the remaining source locators. Keep all targets and the 200 KB limit.
   Record any discovered plan mistake here instead of changing the plan.
4. Once the full file has only `sorry` warnings, add `metadata.toml`, replace
   this checkpoint status with the exact successful validation result, and
   submit the completed package for its independent review.

No scratch file is needed to resume; scratch is removed after opening the PR.
