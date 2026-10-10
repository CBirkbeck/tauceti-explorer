# PKG-LanglandsParameterStacks — scoped correction and blocked checkpoint

**The package remains incomplete.** Codex, session `codex-F4KIj1`, claimed
issue #7909 on 10 October 2026; the bot confirmed
[claim comment 6100141311](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100141311)
in [reply 6100142630](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6100142630).
The issue was reread after confirmation. No issue in the manager's priority
list was available; this focus package was the first eligible fallback under
WORKERS.md. This run holds one claim and takes no second job.

Branch: `codex-F4KIj1-langlands-parameter-package`. Input atlas commit:
`2b1c70eb5`. The complete prior blocker and test inventory are preserved in
[the preceding handoff at that commit](https://github.com/CBirkbeck/tauceti-explorer/blob/2b1c70eb5/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
That note describes earlier workers' readings; this note reports this run's
own checks.

## Change made

Corrected the package README's LP3.18 statement: its characteristic-ℓ general
gerbe branch now includes the component-order hypothesis and names the
presentable Ind-category construction. The split-reductive DVR/BQ branch has
its separate small stable category statement. The API list, three unit tests,
and ES3 ownership remain in place. This corrects a source-scope ambiguity in
the accepted plan; its packet and reader require the same clarification by an
authorized plan repair. Neither is among this issue's editable files.

Read the public author copy of Fargues–Scholze,
[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
§VIII.5.4 and Proposition VIII.5.20 with proof, pp.311–313; §X.3 setup and
Propositions X.3.1–X.3.4 with proofs, pp.348–350. Access date: 10 October 2026.
SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
No source file or source passage is committed. The cleared library index was
read; no restricted book was needed.

## Confirmed blocker

The accepted target-level packet still contains 79 nodes, 140 API items,
90 tests, eight planned/unclosed stages, five gaps and sixteen requests. Its
accepted review expressly retains enhanced signature omissions under G3.
A compiled ordinary prototype alone cannot fulfil PROTOCOL §§13 and 20.

Read the complete LP1 derived-parameter-stack and LP3 mapping-approximation
entries, including all hypotheses, API items, tests and prerequisite chains.
They require these exact contracts:

| Target | Required interface and discriminating checks |
| --- | --- |
| LP1 derived parameter stack | Mapping stack over BQ, its base-point framing, quotient by changing framing, classical comparison and perfect pullback. The trivial-group case must retain BH and its automorphisms; the free-group case is [Hⁿ/H]. |
| LP3 mapping approximation | Coherent linear stable categories, animation/left Kan extension, comparison to actual mapping-stack Perf, and enhanced Ind-completion. The bad-prime test distinguishes induced-perfect image from all perfect complexes. |

The LP requests assign the general constructions to
EnhancedDerivedSheaves:E5:abstract, E5:animation and E5:presentability,
SchemeAndStackFoundations:SF.1 and SchemeKTheoryOperations:S.1. LP only
instantiates them. Rebuilding these general owners inside the package would
violate PROTOCOL §15 and the issue's editable-file restriction.

Read the entire checked-in `EnhancedDerivedSheaves--E5.lean`. Its
`SymMonInftyCat` uses `True` for projection, cocartesian and Segal conditions;
`CAlg` and `AnimatedAlg` return `Unit`; `IndInfty` is a proof of `True`.
The supplier packet remains partial, without an accepted review: 22 nodes,
ten gaps and sixteen requests. Those signatures cannot express the required
contracts above.

The proposed supplier repair [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
remains OPEN and unmerged at immutable head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`. Read its header and carrier
declarations at that head. It explicitly omits cocartesian/operadic axioms,
preservation conditions, accessibility, higher triangle homotopies and
internal linearity. `HEquiv` is an equivalence of homotopy categories;
`SymMonData.segal` uses it, and the projection has no cocartesian-fibration
condition. It therefore does not settle this package's shared-interface
blocker. This was a bounded dependency check, not a review of that job.

Read all eight LP audit entries in `data/library-coverage.json`. Read current
upstream AlgebraicVectorBundles and ReductiveGroups READMEs in full, plus
AlgebraicVectorBundles' initial Suggested declarations. These existing owners
supply scheme/sheaf and reductive foundations, rather than the missing
enhanced quotient-stack signatures.

Read-only current roadmap checkout: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
Current Tau Ceti source: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
A bounded search of both trees found none of the five carrier names
`SymMonInftyCat`, `AnimatedAlg`, `IndInfty`, `DerivedParameterStack`,
`ParameterMappingApproximation`, or the checked cocartesian-fibration and
stable-infinity-category spellings. This is not an exhaustive audit of other
models. Neither tree was modified or built.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read the statements of
`SSet.Quasicategory` and `CategoryTheory.Ind`, `Ind.equivalence`,
`Ind.inclusion` and `Ind.yoneda`. Inner-horn filling and ordinary set-valued
presheaf Ind are available substrates; they do not supply the enhanced
contracts. The managed Lean driver uses the configured Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`.

## Validation and remaining work

- `lean-check` on the retained package Suggested file: exit 0, 282 warnings,
  all `declaration uses sorry`; no errors or other warnings. Available memory
  before launch: 100 GB. The process finished; no background check remains.
- LP and E5 packet checkers: zero errors and zero warnings each.
- Whole-file identifier-boundary screening still finds 42 of the 90 packet
  test names absent from the package Suggested file. The preceding handoff's
  fifteen-node ledger is unchanged. This conservative name screen includes
  comments; presence does not certify a mathematically matching example.
- `git diff --check` and permitted-deliverable-path checks: passed.
- The actual queue `deliverables_complete` predicate returns False:
  `metadata.toml` remains absent. Intake must treat this as a checkpoint.

Only the package README and this handoff change. No suggested signature was
weakened or made vacuous. No packet, shared owner, atlas data or upstream
roadmap was edited. No Lean language server, build, update or cache operation
was started.

An authorized shared-owner repair must supply coherent stable monoidal and
linear categories, animation, enhanced Ind/module-category base change, and
quotient-stack QCoh/Perf descent. Honest `sorry` constructions and proofs are
allowed; the missing defining conditions and comparison types must themselves
be expressible. Apply the LP3.18 scope clarification to the plan/reader as
well. The preceding handoff also identifies the unresolved G1, G4 and G6
supplier/edge work, which this scoped change does not discharge; G2 remains
the explicitly unclaimed full torsion-sensitive independence question.

Then reconcile all 79 targets, 140 APIs and 90 tests against those exports,
including the semantic checks of names already present, complete the package,
add `topic = "math.NT"` metadata, and rerun Lean and submission checks. Do not
claim completion by adding metadata to the present incomplete file inventory.
No disposable scratch file is needed to resume.
