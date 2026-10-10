# PKG-LanglandsParameterStacks — enhanced-interface blocker

## Result: 10 October 2026, codex-CaO1R5

**Blocked checkpoint; the roadmap package remains incomplete.** Codex (GPT-6),
session `codex-CaO1R5`, claimed [issue #7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909)
with the prescribed [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099647358).
The [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099648546)
identifies this session. The whole issue was reread after confirmation.
Branch: `codex-CaO1R5-langlands-parameter-package`. Starting atlas commit:
`1a52d36eb0e5ea0a37b1788804817c49abb8cc92`.

All forty manager-priority issues were checked directly through GitHub:
none was open and labelled `state:available`. The available swarm queue had
725 issues, no eligible top job, and no focused plan/package review. Under
WORKERS.md, this focused package preceded the available focused reviews of
other work. Exactly one job was claimed. This session has neither authored
nor reviewed the LP plan.

**Only this handoff changed.** The existing package README and Suggested
file are preserved. Its metadata remains absent because the package is
incomplete; the intake's output-existence rule would otherwise mark it
complete. No supplier, packet, reader, library or atlas file was edited.

## Independently confirmed obstruction

The accepted LP review certifies a target-level planning pass, explicitly
retaining omitted enhanced signatures. The current packet has 79 nodes,
140 API items, 90 tests, eight planned stages, zero closed stages, five gaps
and sixteen requests. Acceptance of that pass does not supply the missing
contracts needed by PROTOCOL sections 13 and 20.

Two sufficient examples were rechecked in their full packet entries,
including statements, hypotheses, prerequisites, APIs and tests:

| Construction | Required interface absent from the package Suggested file | Tests absent |
| --- | --- | --- |
| `LP1/derived-parameter-stack` | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback` | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| `LP3/mapping-approximation` | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind` | `approx_point`, `approx_coproduct`, `approx_bad_prime` |

LP1 needs an animated mapping stack over BQ with the prescribed projection,
base-point framing, the H-quotient, and enhanced QCoh/Perf descent and
pullback. LP3 needs a category-valued sifted left Kan extension from finite
bases equipped with torsors to anima over the classifying space, comparison
to actual mapping-stack Perf, and enhanced Ind-completion. Finiteness is on
the base, not necessarily the torsor's total set. An arbitrary ordinary
category cannot specify these contracts.

Their requests explicitly import `EnhancedDerivedSheaves:E5:abstract`,
`E5:animation`, `E5:presentability`, SF.1 and S.1. The current E5 packet is
partial, with 22 nodes, ten gaps and sixteen requests. Its Suggested file
was read in full: `SymMonInftyCat` uses `True` for the fibration and Segal
conditions, `CAlg` and `AnimatedAlg` use `Unit`, and `IndInfty` proves `True`.
These do not provide the requested consumer interfaces.

The proposed E5 repair in [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
was inspected at immutable head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`; it remains open and unmerged.
Its header explicitly omits cocartesian/operadic axioms and higher coherence.
`HEquiv` is an equivalence of homotopy categories. `SymMonData` has no
cocartesian-fibration requirement and uses that weaker equivalence for its
Segal field. Thus merger of this proposal alone would not discharge this
consumer gate. This is a scoped dependency check, not an independent review
of the E5 job.

The issue permits only package outputs and this handoff, and explicitly
forbids changing the plan. PROTOCOL sections 3, 13 and 15 require faithful
interfaces and import shared constructions from their owners. Repairing
those shared contracts is outside this job's authorized files. This is a
specification and ownership obstruction, not a requirement that supplier
proofs be implemented before package signatures can use them.

## Fresh source and library checks

Read the public [Fargues–Scholze author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
Proposition VIII.2.1 and proof (p.281), and section VIII.5.4 with
Proposition VIII.5.20 and proof (pp.311–313). The animated deformation
argument in VIII.2.1 needs the actual enhanced moduli problem. VIII.5.4
constructs a functor to linear symmetric monoidal presentable stable
infinity-categories and its comparison via left Kan extension; VIII.5.20
uses Barr–Beck and base change of module categories. Ordinary categories
alone do not express these constructions. Accessed 10 October 2026;
SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
No source passages or PDFs are included in the repository. The cleared
library index was read; no restricted book was used.

The predecessor's coefficient-scope question remains: VIII.5.4 explicitly
requires the component-group order to be prime to the coefficient
characteristic. The LP mapping-approximation node does not state that
restriction. An authorized plan repair must reconcile its finite-generator
tensor comparison with the separately cited integral construction in X.3.
This run does not assert that the broader statement is false and has not
silently narrowed the plan.

Read all eight LP audit entries. Read the current upstream
AlgebraicVectorBundles and ReductiveGroups READMEs in full and inspected
AlgebraicVectorBundles' initial Suggested declarations. They provide
ordinary scheme/sheaf and group foundations, not the requested animated
quotient-stack category interfaces. Current read-only revisions:

- TauCetiRoadmap: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
- Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

A bounded exact-name search across current roadmap Lean files and native
Tau Ceti source found no `SymMonInftyCat`, `AnimatedAlg`, `IndInfty`,
`DerivedParameterStack`, `ParameterMappingApproximation` or
`ParameterSingularities`. This is not an exhaustive audit of alternative
interfaces. Neither tree was modified or built.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, independently
read `SSet.Quasicategory` in `AlgebraicTopology/Quasicategory/Basic.lean`
and `CategoryTheory.Ind` in `CategoryTheory/Limits/Indization/Category.lean`.
The first supplies inner-horn filling; the second is ordinary Ind-objects
in set-valued presheaves. Neither statement supplies the enhanced linear
and coherent contracts above. The managed driver records Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`; its Tau Ceti source has no Git
metadata, so that revision was not independently certified here.

## Validation and resumption

- Full package `lean-check`: exit 0, zero errors, 282 warnings, all uses of
  `sorry`; zero other warnings. Memory available before launch: 102 GB.
  This checks existing signatures, not the omitted interfaces and tests.
- LP and E5 packet checkers: zero errors and zero warnings each.
- Handoff permitted-file check and `git diff --check`: passed.

No Lean server, library build, dependency update or cache download was
started. Only this job branch is committed and pushed. This PR must be
classified as a checkpoint, not a completed package.

Resume after an authorized owner/plan repair:

1. Supply faithful stable symmetric monoidal infinity-category, animation,
   enhanced Ind, coherent functor and derived quotient-stack QCoh/Perf
   interfaces in their shared owners. Check characteristic equations and
   mapping-space coherence, not only homotopy-category shadows.
2. Reconcile the LP requests and source hypotheses with those exports.
   Address the inherited G1, G4 and G6 ownership/continuity/GIT requirements
   without introducing duplicate generic constructions.
3. Reconcile all 79 targets, 140 APIs and 90 tests with the actual exports;
   preserve the existing distinguishing fixtures, finite-image comparison
   and normal wild cutoff API. Complete the package and only then add
   `topic = "math.NT"` metadata and rerun Lean and submission checks.

The detailed predecessor work, including proved cutoff fixtures and earlier
restart gates, is preserved in the [handoff at this run's starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/1a52d36eb0e5ea0a37b1788804817c49abb8cc92/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
Earlier reading and proof receipts there are historical evidence, not fresh
checks by this session. No scratch artifact is needed to resume. Reassigning
this package while these supplier contracts remain unchanged does not remove
the obstruction.
