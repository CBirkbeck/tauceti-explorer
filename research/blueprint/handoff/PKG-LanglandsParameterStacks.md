# PKG-LanglandsParameterStacks — shared-interface blocker

**Blocked checkpoint; the package is incomplete.** Codex, session
`codex-IlyWBY`, 10 October 2026, claimed issue #7909 with
[comment 6099988378](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099988378).
The bot confirmed this session, and the issue was reread afterwards. None of
the manager's forty priority issues was in the available swarm list; this
focused package was the first eligible fallback under WORKERS.md. This run
held one claim and takes no second job.

Branch: `codex-IlyWBY-langlands-parameter-package`. Input atlas commit:
`445094c5f69ea083343ad64fa4166857dfe016b8`.
Only this handoff changes. The README and Suggested file are retained;
metadata remains absent because the package is incomplete. No packet, shared
owner, library, atlas data or upstream roadmap was edited.

## What prevents completion

The accepted target-level plan contains 79 nodes, 140 API items and 90 tests,
eight planned stages, no closed stages, five gaps and sixteen requests. Its
acceptance explicitly retains omitted enhanced signatures under G3. A
successful elaboration of its existing ordinary prototypes cannot discharge
these omissions.

This run read the full entries for the following two constructions, including
hypotheses, prerequisites, API and tests, and checked their package README and
Suggested coverage:

| Required target | Missing Lean interface | Missing tests |
| --- | --- | --- |
| LP1, derived parameter stack | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback` | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP3, mapping approximation | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind` | `approx_point`, `approx_coproduct`, `approx_bad_prime` |

LP1 is a mapping stack over BQ with the prescribed projection and base-point
framing. Its trivial-group test gives BH, with its automorphisms retained;
a cocycle orbit set is insufficient. LP3 is a category-valued sifted left Kan
extension, with enhanced linear tensor/module categories, comparison to actual
mapping-stack Perf, and Ind-completion. Its bad-prime example distinguishes
the induced-perfect image from the actual category. An ordinary category with
arbitrary selected maps does not specify this interface.

Their prerequisite chains and the corresponding requests assign the general
constructions to E5:abstract, E5:animation and E5:presentability of
EnhancedDerivedSheaves, with SchemeAndStackFoundations SF.1 and
SchemeKTheoryOperations S.1. The LP requests explicitly say LP only
instantiates these constructions.

The current E5 Suggested file was read in full: the cocartesian and Segal
fields of `SymMonInftyCat` are `True`; `CAlg` and `AnimatedAlg` return `Unit`;
`IndInfty` is a proof of `True`. Its packet remains partial with 22 nodes,
ten gaps, sixteen requests and no accepted review.

The proposed E5 repair [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
was checked at immutable head `b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`:
OPEN, unmerged. Its header explicitly omits cocartesian/operadic axioms,
preservation conditions and higher coherence. The carrier definitions were
read: `HEquiv` compares homotopy categories; `SymMonData.segal` uses that
comparison, and the projection has no cocartesian-fibration condition.
Consequently this proposal alone does not provide the two LP contracts above.
This is a bounded supplier check, not a review of another job.

The blocker concerns the specification of shared signatures, not completed
proofs. Genuine constructions and proofs may use `sorry`; the present problem
is that required conditions and comparison types cannot be expressed through
the supplied interfaces. PROTOCOL sections 13 and 20 require the definitions,
APIs and tests; section 15 assigns the general machinery to shared owners.
The issue permits only package files and this handoff, and prohibits packet
edits. Rebuilding those general owners here would duplicate their work and
exceed the authorized file scope. A further unchanged package run cannot
resolve that ownership problem.

## Source clarification established in this run

Read the Fargues–Scholze
[author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
Proposition VIII.2.1 and proof, p.281; section VIII.5.4, including Proposition
VIII.5.20 and proof, pp.311–313; and Chapter X.3 setup and Propositions
X.3.1–X.3.4 with proofs, pp.348–350. Accessed 10 October 2026, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
No source passage or source file is committed.

VIII.2.1 uses the animated moduli problem for deformation theory; a tangent
formula alone does not supply the derived moduli construction. VIII.5.20 uses
Barr–Beck and module-category base change to identify the approximation's
image. These are enhanced requirements rather than ordinary-category names.

The predecessor left the coefficient-scope question unexamined on the
integral side. The source distinguishes the following contracts:

| Construction | Source hypotheses and conclusion |
| --- | --- |
| General gerbe over a discrete group's classifying space | VIII.5.4 works over a characteristic-ℓ field L, with reductive identity components and component-group orders prime to ℓ. It constructs a colimit-preserving functor into L-linear symmetric monoidal presentable stable infinity-categories via IndPerf. VIII.5.20 identifies the free-group comparison image; equivalence additionally needs prime-to-ℓ torsion in the identity component's fundamental group. |
| Integral parameter mapping approximation | X.3 begins with a split reductive H over a DVR R and a finite Q acting on H. S ranges over anima over BQ. The approximation is an R-linear idempotent-complete small stable infinity-category. X.3.2 proves preservation of all colimits using highest-weight theory. X.3.3 identifies the free-group comparison image with the stable subcategory generated by representation bundles. |

Thus Chapter X does supply a separately scoped integral construction. It does
not remove the component-group hypothesis from Chapter VIII's general-gerbe
construction. The LP3 mapping-approximation entry currently states reductive
identity components for its general gerbe but omits that component-group
restriction. An authorized owner/plan repair should explicitly separate these
two source scopes, retain the restriction in the general-gerbe branch, and
use X.3.1–X.3.4 for the split-reductive DVR/BQ branch. No false all-prime
extension of the general-gerbe theorem is asserted in this package checkpoint.

The finite generators in both constructions have finite **base** sets with
torsors; an infinite discrete acting group can have an infinite total torsor.
The approximation notation designates a category, not a representing stack.

## Inventory to reconcile after supplier repair

A reproducible conservative name screen finds **42 of the 90 packet test names
absent anywhere in Suggested.lean**, across fifteen nodes. For each
`tests[].name`, search the whole file with ASCII identifier boundaries,
including comments. Presence is not certification: examples are anonymous,
comments may name only partial comparisons, and mathematical scope must be
checked independently.

The predecessor's count of 43 is corrected. `projected_trivial_group` is
present in a comment introducing a component-fibre regression. Reading that
example shows it asserts an evaluation on the identity component for Γ=Unit;
it does not assert the other-component zero evaluations demanded by the
packet test, or identify the supplied tuple diagram with actual reductive
invariant functions.
It therefore belongs in the later semantic audit despite passing this literal
name screen. Qualified API-name searches are also insufficient because many
APIs are declared within namespaces.

| Node suffix | Absent test names |
| --- | --- |
| `LP0/condensed-cocycles-and-L-parameters` | `parameter_char_l`, `parameter_not_discrete_Ql` |
| `LP0/extended-wild-parameters` | `extended_wild_unramified`, `extended_wild_conjugacy`, `extended_wild_forget` |
| `LP1/finite-presentation-over-Z-invert-p` | `scheme_l_adic` |
| `LP1/derived-parameter-stack` | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| `LP1/singularities-and-singular-support` | `singularities_smooth`, `singularities_torus_Ql`, `singularities_torus_mod_l`, `singularities_dual` |
| `LP2:excursion-presentation/coarse-quotient` | `coarse_torus`, `coarse_not_orbit_set` |
| `LP2:excursion-presentation/complete-reducibility` | `cr_torus`, `cr_unipotent`, `cr_GL` |
| `LP2:semisimple-characters/semisimple-parameters-and-closed-orbits` | `semisimple_split_GL`, `semisimple_unipotent` |
| `LP2:excursion-presentation/categorical-hecke-datum` | `hecke_empty_set`, `hecke_fold`, `hecke_zero_category` |
| `LP2:excursion-presentation/excursion-datum` | `datum_zero_alpha`, `datum_tensor_operator` |
| `LP2:semisimple-characters/reductive-pseudocharacters` | `projected_rank_one`, `projected_conjugate`, `projected_unipotent` |
| `LP3/good-filtration-t-structure` | `good_torus`, `good_zero`, `good_induced`, `good_shift_sign` |
| `LP3/induced-perfect-complexes` | `induced_point`, `induced_trivial_group`, `induced_retract`, `induced_not_all_bad_prime` |
| `LP3/mapping-approximation` | `approx_point`, `approx_coproduct`, `approx_bad_prime` |
| `LP4/rep-action-on-perf` | `rep_bundle_unit`, `rep_bundle_at_parameter`, `rep_bundle_tensor` |

## Library and validation evidence

Read all eight LP audit entries in `data/library-coverage.json`. Read current
upstream AlgebraicVectorBundles and ReductiveGroups READMEs in full, and
AlgebraicVectorBundles' initial Suggested declarations. Their scheme/sheaf
and reductive-group foundations do not replace enhanced quotient-stack Perf.
The current read-only roadmap checkout reports
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau Ceti source reports
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
A bounded search of both current trees found no `SymMonInftyCat`,
`AnimatedAlg`, `IndInfty`, `DerivedParameterStack` or
`ParameterMappingApproximation`, or candidate under the checked
stable-infinity/cocartesian-fibration phrases. This is not an exhaustive
audit of alternative mathematical models. Neither tree was modified or built.

Read pinned Mathlib's `SSet.Quasicategory` in
`AlgebraicTopology/Quasicategory/Basic.lean`, and `CategoryTheory.Ind`,
`Ind.equivalence`, `Ind.inclusion` and `Ind.yoneda` in
`CategoryTheory/Limits/Indization/Category.lean`. The former imposes inner-horn
filling; the latter is an ordinary subcategory of set-valued presheaves. They
are substrates, not the missing enhanced contracts. Verified Mathlib commit:
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The managed Lean driver records
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The cleared library index was read; no restricted book was needed. Earlier
receipts and wider unresolved work remain available in the
[predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/445094c5f69ea083343ad64fa4166857dfe016b8/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
They are historical evidence, not readings claimed by this session.

Checks completed in this run:

- Existing package `lean-check`: exit 0, 282 warnings, all uses of `sorry`;
  no errors or other warnings. Available memory before launch: 93 GB. The
  managed driver waited for its shared slot; the process finished.
- LP and E5 packet checkers: zero errors and zero warnings each.
- Permitted-file check and `git diff --check`: passed.
- Actual queue `deliverables_complete` predicate: False. Metadata remains
  absent, so intake must treat this as a checkpoint, not a complete package.

No Lean language server, build, update or cache operation was started. No
process remains running. Only this session's branch is committed and pushed.

## Resume conditions and next work

The maintainer needs to arrange an authorized shared-owner/plan repair before
another package continuation. Supply genuine coherent stable monoidal and
linear categories, animation, enhanced Ind/module-category base change, and
quotient-stack QCoh/Perf descent through the owners named above; signatures
with honest `sorry` bodies suffice, but weaker homotopy-category substitutes
do not. Reconcile the LP3 field-gerbe and integral DVR/BQ scopes as above.
Retain G1, G4 and G6 until their owners resolve their registered requests.

Then match all 79 targets, 140 APIs and 90 tests against those exact exports;
retain useful existing ordinary controls, complete the package, add
`topic = "math.NT"` metadata, and rerun Lean and submission checks. The
42-name ledger is only a starting point for the full semantic audit. All
information needed to resume is in this note or its linked predecessor;
no disposable scratch file is required.
